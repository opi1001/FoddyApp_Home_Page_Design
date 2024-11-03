import 'package:flutter/material.dart';
import 'package:ui_design/listof_product.dart';
import 'package:ui_design/svg_picture.dart';
import 'package:ui_design/ui_design.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;
  int demoDataLength = 4;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          // while we dont have our data bydefault we show 3 scalton
          itemCount: isLoading ? 3 : demoDataLength,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: isLoading
                ? const BigCardScalton()
                : RestaurantInfoBigCard(
                    // Images are List<String>
                    images: svgPicture..shuffle(),
                    name: "Foddy Item Picture!!",
                    rating: 4.3,
                    numOfRating: 200,
                    deliveryTime: 25,
                    foodType: const ["Mutton", "Meat", "Deshi Food"],
                    press: () {},
                  ),
          ),
        ),
      ),
    );
  }
}
