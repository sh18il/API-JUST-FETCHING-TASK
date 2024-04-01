class ModelCategory {
  String? title;
  String? image;
  String? price;

  ModelCategory({
    this.image,
    this.title,
    this.price,
  });

  factory ModelCategory.fromJson(Map<String, dynamic> json) {
    return ModelCategory(
      image: json['image'],
      title: json['title'],
      price: json['category'],
    );
  }
}
