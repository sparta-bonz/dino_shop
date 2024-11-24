import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  Product product;

  ProductCard({
    required this.product,
    required bool isFavorite,
    required Null Function() onFavoritePressed,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상품 이미지 & 아이콘
        ProductImage(),
    
        const SizedBox(height: 10),
    
        // 상품 이름 & 설명
        ProductInfo(),
    
        // const SizedBox(height: 5),
    
        // 상품 가격 등 정보
        ProductExtraInfo(),
      ],
    );
  }

  Expanded ProductExtraInfo() {
    return Expanded(
      child: Row(
        children: [
          Text(
            MONEY_FORMAT.format(widget.product.price),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.star_rate_rounded,
            size: 15,
            color: const Color(0xFFFFD700),
          ),
          const SizedBox(width: 5),
          Text(
            '4.5 (5)',
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Column ProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상품 이름
        Text(
          widget.product.name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ), // 상품 설명
        Text(
          widget.product.contents,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }

  Stack ProductImage() {
    return Stack(
      children: [
        // 상품 이미지
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(widget.product.image[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 좋아요 버튼
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // 좋아요 상태 변경
              });
            },
            icon: Icon(
              Icons.star_rate_rounded,
              size: 25,
              color: isFavorite ? const Color(0xFFFFD700) : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
