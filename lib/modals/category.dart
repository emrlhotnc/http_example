class Category {
  List<Products> products;
  List<Categories> categories;

  Category({this.products, this.categories});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  int categoryId;
  String productName;
  String quantityPerUnit;
  String unitPrice;
  int unitsInStock;

  Products(
      {this.id,
      this.categoryId,
      this.productName,
      this.quantityPerUnit,
      this.unitPrice,
      this.unitsInStock});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    quantityPerUnit = json['quantityPerUnit'];
    unitPrice = json['unitPrice'];
    unitsInStock = json['unitsInStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['productName'] = this.productName;
    data['quantityPerUnit'] = this.quantityPerUnit;
    data['unitPrice'] = this.unitPrice;
    data['unitsInStock'] = this.unitsInStock;
    return data;
  }
}

class Categories {
  int id;
  String categoryName;
  String seoUrl;

  Categories({this.id, this.categoryName, this.seoUrl});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    seoUrl = json['seoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['seoUrl'] = this.seoUrl;
    return data;
  }
}
