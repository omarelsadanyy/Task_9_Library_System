void main(List<String> args) {
    var book_1= Books(1, "book one");
    var book_2= Books(2, "book two");
    var book_3= Books(3, "book three");
    var book_4= Books(4, "book four");

    var user_1=Users(1, "omar");
    var user_2=Users(2, "ali");
    var user_3=Users(3, "hassan");
    var user_4=Users(4, "manal");

    book_1.displayInfo();
    user_1.displayInfo();

    var library=Library([book_1,book_2,book_3,book_4], [user_1,user_2,user_3,user_4]);
    library.addBooks(Books(5, "book 5"));

    library.borrowBook(3,4);
    library.borrowBook(3, 2);

    library.returnBook(3);

    library.displayFinalInfo();
}


class Books{

int id;
String title;
bool borrowed;

  Books(this.id,this.title,{this.borrowed=false});
   void displayInfo(){

    print("Your ID is: $id  Title is: $title  Borrowed Status : $borrowed");
   }

}

class Users{
  int id;
  String name;

  Users(this.id,this.name);

  void displayInfo(){

    print("Your ID  is: $id  And name is: $name");
   }
}

class Library{

  List<Books> books;
  List<Users> users;

  Library(this.books,this.users);

  void addBooks(Books book){
      books.add(book);
      print("Book is added!");
  }

  void returnBook(int bookId){
     for(var book in books){
      if(book.id ==bookId){
        book.borrowed==false;
        print("Book with Id $bookId is returned");
      }
     }
  }
  void borrowBook(int bookId,int userId){
       for(var book in books){
      if(book.id ==bookId){
       if(!book.borrowed){
        book.borrowed=true;
        print("book is borrowed by user :$userId");
       }else{
        print("book is already borrowed");
       }
      }
     }
  }
  void displayFinalInfo(){

    for(var book in books){
       book.displayInfo();
    }
    for(var user in users){
       user.displayInfo();
    }
  }
}