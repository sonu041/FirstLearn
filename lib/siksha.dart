class SikshaHub {
  List<Learn> learn;

  SikshaHub({this.learn});

  SikshaHub.fromJson(Map<String, dynamic> json) {
    if (json['learn'] != null) {
      learn = new List<Learn>();
      json['learn'].forEach((v) {
        learn.add(new Learn.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.learn != null) {
      data['learn'] = this.learn.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Learn {
  String id;
  String name;
  String img;
  List<Details> details;

  Learn({this.id, this.name, this.img, this.details});

  Learn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String id;
  String text;
  String alImg;
  String objImg;
  String description;

  Details({this.id, this.text, this.alImg, this.objImg, this.description});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    alImg = json['al_img'];
    objImg = json['obj_img'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['al_img'] = this.alImg;
    data['obj_img'] = this.objImg;
    data['description'] = this.description;
    return data;
  }
}
