const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();

app.use(cors());

let connection;

function connectWithRetry() {

  connection = mysql.createConnection({
    host: "database",
    user: "root",
    password: "root",
    database: "cvdb"
  });

  connection.connect((err) => {

    if (err) {

      console.log("Error conectando a MySQL...");
      console.log("Reintentando en 5 segundos");

      setTimeout(connectWithRetry, 5000);

    } else {

      console.log("Conectado correctamente a MySQL");

    }

  });

}

connectWithRetry();

app.get("/cv", (req, res) => {

  const personaQuery = "SELECT * FROM persona LIMIT 1";
  const formacionQuery = "SELECT * FROM formacion";

  connection.query(personaQuery, (err, personaResult) => {

    if (err) {
      return res.status(500).json(err);
    }

    connection.query(formacionQuery, (err, formacionResult) => {

      if (err) {
        return res.status(500).json(err);
      }

      res.json({
        persona: personaResult[0],
        formacion: formacionResult
      });

    });

  });

});

app.listen(4000, () => {
  console.log("Servidor ejecutándose en puerto 4000");
});