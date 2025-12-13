import express from "express";
import mysql from "mysql";
import cors from "cors";
import multer from "multer";
import fs from "fs";
import path from "path";


const app = express();
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "bookstore",
});

if (!fs.existsSync("uploads")) {
  fs.mkdirSync("uploads");
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage });

app.use(express.json());
app.use(cors());

app.use("/uploads", express.static("uploads"));

app.get("/", (req, res) => {
  res.json("hello this is the backend");
});

app.get("/books", (req, res) => {
  const q = "SELECT * FROM books";
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.post("/books", upload.single("cover"), (req, res) => {
  const q =
    "INSERT INTO books (`title`, `description`, `price`, `cover`) VALUES (?)";
  const values = [
    req.body.title,
    req.body.description,
    req.body.price,
    req.file ? req.file.filename : null,
  ];
  db.query(q, [values], (err, data) => {
    if (err) return res.json(err);
    return res.json("Buku telah dibuat");
  });
});

app.delete("/books/:id", (req, res) => {
  const bookId = req.params.id;
  // Ambil cover lama dari database
  const qSelect = "SELECT cover FROM books WHERE id = ?";
  db.query(qSelect, [bookId], (err, data) => {
    if (err) return res.json(err);

    if (data.length === 0) {
      return res.status(404).json("Buku tidak ditemukan");
    }

    const coverFile = data[0].cover;

    // Hapus file dari folder uploads
    if (coverFile) {
      const filePath = path.join("uploads", coverFile);

      fs.unlink(filePath, (err) => {
        if (err) {
          console.log("File tidak ditemukan atau gagal dihapus:", err);
        } else {
          console.log("File cover berhasil dihapus", coverFile);
        }
      });
    }

    // Hapus data dari database
    const qDelete = "DELETE from books where id = ?";
    db.query(qDelete, [bookId], (err, data) => {
      if (err) return res.json(err);
      return res.json("Buku dan Cover Dihapus");
    });
  });
});

app.put("/books/:id", upload.single("cover"), (req, res) => {
  const bookId = req.params.id;

  const qSelect = "SELECT cover FROM books WHERE id = ?";
  db.query(qSelect, [bookId], (err, data) => {
    if (err) return res.json(err);
    if (data.length === 0) return res.status(404).json("Buku tidak ditemukan");

    const oldCover = data[0].cover;
    let newCover = oldCover;

    // Jika upload cover baru
    if (req.file) {
      newCover = req.file.filename;

      // Hapus cover lama
      if (oldCover) {
        const oldPath = path.join("uploads", oldCover);
        fs.unlink(oldPath, (err) => {
          if (err) console.log("Gagal hapus cover lama:", err);
        });
      }
    }
    // Jika TIDAK upload file → pakai existingCover dari frontend
    else if (req.body.existingCover) {
      newCover = req.body.existingCover;
    }

    // Query update
    const qUpdate =
      "UPDATE books SET title=?, description=?, price=?, cover=? WHERE id = ?";

    const values = [
      req.body.title,
      req.body.description,
      req.body.price,
      newCover,
    ];

    db.query(qUpdate, [...values, bookId], (err, result) => {
      if (err) return res.json(err);
      return res.json("Buku berhasil diperbarui");
    });
  });
});

app.listen(8800, () => {
  console.log("Connected to backend");
});
