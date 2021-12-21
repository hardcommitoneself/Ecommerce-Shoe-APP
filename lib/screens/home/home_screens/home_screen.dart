import '/components/buttons.dart';
import '/components/main_page_product_card.dart';
import '/constants/colors.dart';
import '/constants/dummy_data.dart';
import '/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        const CategoriesCatalog(),
        const ProductPageView(),
        12.heightBox,
        const MostPopularTitleText(),
        12.heightBox,
        const PopularProductCard(),
      ],
    ).py(16);
  }
}

class MostPopularTitleText extends StatelessWidget {
  const MostPopularTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        'Most Popular'.text.semiBold.xl2.make(),
        GestureDetector(
            onTap: () {}, child: 'View all'.text.underline.semiBold.make()),
      ],
    ).px(24);
  }
}

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 50),
                spreadRadius: 2,
                blurRadius: 124),
          ]),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(Images.sh2).p(8),
          ),
          12.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'SB Zoom Blazer Low Pro'.text.lg.semiBold.make(),
              'NIKE'
                  .toUpperCase()
                  .text
                  .semiBold
                  .color(Colors.grey)
                  .softWrap(true)
                  .make()
                  .py(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  '\$80.00'.text.size(14).softWrap(true).make(),
                  16.widthBox,
                  const Icon(Icons.star, color: CustomColors.starColor),
                  4.widthBox,
                  '(5.0)'.text.medium.softWrap(true).make(),
                ],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 35,
            width: 35,
            child: RoundedAddButton(
              onPressed: () {},
            ),
          ),
          12.widthBox,
        ],
      ).p(8),
    ).px(24);
  }
}

class ProductPageView extends StatefulWidget {
  const ProductPageView({Key? key}) : super(key: key);

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.60, initialPage: 1),
            onPageChanged: (v) {
              setState(() {
                _currentPage = v;
              });
            },
            itemCount: products.length,
            itemBuilder: (context, index) {
              return HomeScreenProductCard(
                product: products[index],
                isCurrentInView: _currentPage == index,
              );
            }));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.search, color: Colors.grey)
                          .px(16),
                      const Flexible(
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        16.widthBox,
        SizedBox(
          height: 50,
          width: 50,
          child: PrimaryShadowedButton(
            onPressed: () {},
            child: Icon(FontAwesomeIcons.slidersH,
                    size: 18, color: Theme.of(context).colorScheme.surface)
                .px(16),
            borderRadius: 12,
            color: Colors.black,
          ),
        )
      ],
    ).px(24);
  }
}

class CategoriesCatalog extends StatefulWidget {
  const CategoriesCatalog({Key? key}) : super(key: key);

  @override
  _CategoriesCatalogState createState() => _CategoriesCatalogState();
}

class _CategoriesCatalogState extends State<CategoriesCatalog> {
  int _selectedCategory = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: (index == 0)
                  ? const SizedBox(
                      width: 12,
                    )
                  : (_selectedCategory == index)
                      ? SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryShadowedButton(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: WhiteCategoryButton(
                                            index: index,
                                            selectedCategory: _selectedCategory,
                                          ).p(5)),
                                      Text(
                                        'Sneakers $index',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ).px(8),
                                      12.widthBox,
                                    ],
                                  ),
                                  onPressed: () {},
                                  borderRadius: 80,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ],
                          ),
                        )
                      : WhiteCategoryButton(
                          index: index, selectedCategory: _selectedCategory),
            );
          }),
    );
  }
}

class WhiteCategoryButton extends StatefulWidget {
  WhiteCategoryButton(
      {Key? key, required this.index, required this.selectedCategory})
      : super(key: key);
  int selectedCategory;
  final int index;
  @override
  _WhiteCategoryButtonState createState() => _WhiteCategoryButtonState();
}

class _WhiteCategoryButtonState extends State<WhiteCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 24)
          ]),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            widget.selectedCategory = widget.index;
          });
        },
        child: SvgPicture.asset(Images.sneakers).p(10),
      ),
    );
  }
}
