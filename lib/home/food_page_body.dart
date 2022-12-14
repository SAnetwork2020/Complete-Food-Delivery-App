import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/IconAndTextWidget.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

import '../colors.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController pageController = PageController(viewportFraction: .84);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print(_currPageValue);
      });
    });
      super.initState();
    }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context, position){
          return _buildPageItem(position);
          }),
    );
  }
  Widget _buildPageItem(index) {
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()){
     var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
  }else if (index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if (index ==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = .8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,  _height*(1-_scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
          height: 220,
            margin: EdgeInsets.only(left: 10,right: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")),
            borderRadius: BorderRadius.circular(30),
            color: index.isEven? Color(0xff69c5df):Color(0xff9294cc)
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            height: 120,
              margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
              child: Container(
                padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Bitter Orange Marinade"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children:
                          List.generate(5, (index) => Icon(Icons.star,size:15, color: AppColors.mainColor,))
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: '4.5',),
                        SizedBox(width: 10,),
                        SmallText(text: '1287',),
                        SizedBox(width: 10,),
                        SmallText(text: 'comments',),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.72km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor1),
                      ],
                    ),

                  ],
                ),
              ),
        ),
          ),
      ]),
    );
  }

}
