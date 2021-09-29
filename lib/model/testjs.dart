class Note {
  String title ;
  String text ;

  Note(this.text,this.title);

  fromJson(Map<String,dynamic> json){
    title = json['title'];
    text = json['body'];
  }
}
