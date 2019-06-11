<?php 
  class Post 
  {
    private $conn;
    private $table = 'user';
    public $email;
    public $name;
    public $credit;

    public function __construct($db) 
    {
      $this->conn = $db;
    }

    public function read() 
    {
      $query = 'SELECT p.email, p.name, p.credit
                                FROM ' . $this->table . ' p
                                ORDER BY
                                  p.name DESC';
      $stmt = $this->conn->prepare($query);
      $stmt->execute();
      return $stmt;
    }

    public function create() 
    {
          $query = 'INSERT INTO ' . $this->table . ' SET email = :email, name = :name, credit = :credit';
          $stmt = $this->conn->prepare($query);

          $this->email = htmlspecialchars(strip_tags($this->email));
          $this->name = htmlspecialchars(strip_tags($this->name));
          $this->credit = htmlspecialchars(strip_tags($this->credit));
 
          $stmt->bindParam(':email', $this->email);
          $stmt->bindParam(':name', $this->name);
          $stmt->bindParam(':credit', $this->credit);

          if($stmt->execute()) 
          {
            return true;
          }
      printf("Error: %s.\n", $stmt->error);
      return false;
    }

    public function update() 
    {
          $query = 'UPDATE ' . $this->table . '
                                SET name = :name, credit = :credit
                                WHERE email = :email';
          $stmt = $this->conn->prepare($query);

          $this->name = htmlspecialchars(strip_tags($this->name));
          $this->credit = htmlspecialchars(strip_tags($this->credit));
          $this->email = htmlspecialchars(strip_tags($this->email));

          $stmt->bindParam(':name', $this->name);
          $stmt->bindParam(':credit', $this->credit);
          $stmt->bindParam(':email', $this->email);

          if($stmt->execute()) 
          {
            return true;
          }
          printf("Error: %s.\n", $stmt->error);
          return false;
    }

    public function delete() 
    {
          $query = 'DELETE FROM ' . $this->table . ' WHERE email = :email';
          $stmt = $this->conn->prepare($query);

          $this->email = htmlspecialchars(strip_tags($this->email));

          $stmt->bindParam(':email', $this->email);

          if($stmt->execute()) 
          {
            return true;
          }
          printf("Error: %s.\n", $stmt->error);
          return false;
    }
  }
?>
