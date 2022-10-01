import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:submission_flutter_fundamental/classes/restaurant.dart';
import 'package:submission_flutter_fundamental/resources/colors.dart';

class ListRestaurant extends StatefulWidget {
  const ListRestaurant({required Key key}) : super(key: key);

  @override
  State<ListRestaurant> createState() => _ListRestaurantState();
}

class _ListRestaurantState extends State<ListRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      padding: EdgeInsets.all(24),
                      color: RestaurantAppColors.PRIMARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Hola...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Where do you want to Eat?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Find Restaurant",
                                      style: TextStyle(
                                          color:
                                              RestaurantAppColors.GREY_COLOR_1),
                                    ),
                                    Icon(
                                      Icons.search,
                                      color: RestaurantAppColors.PRIMARY_COLOR,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Restaurant> restaurant =
                        parseRestaurants(snapshot.data);

                    return ListView.builder(
                        itemCount: restaurant.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return _buildRestaurantItem(
                              context, restaurant[index]);
                        });
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 64.0),
                      child: Center(child: Text("Error Load Data")),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      onTap: () {
        /* Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);*/
      },
    );
  }
}
