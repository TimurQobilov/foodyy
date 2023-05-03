import 'package:flutter/material.dart';
import 'package:Foodyy/src/entity/City.dart';
import 'package:Foodyy/src/entity/Place.dart';
import 'package:Foodyy/src/providers/request_services/PlaceProvider.dart';
import 'package:Foodyy/src/views/citydetail/city_detail.dart';
import 'package:Foodyy/src/views/controls/loading_hub.dart';
import 'package:Foodyy/src/views/place_detail/place_detail.dart';

class HomeNav {
  BuildContext? _context;

  HomeNav(BuildContext context) {
    this._context = context;
  }

  // ### ACTIONS
  void openCity(City? city) {
    if (city == null) {
      return;
    }
    navigateToCityDetail(city);
  }

  void navigateToCityDetail(City city) {
    // Navigator.of(context, rootNavigator: true).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => CityDetail(city: city)),);

    Navigator.of(_context!, rootNavigator: true).push(PageRouteBuilder(
        opaque: true,
        // transitionDuration: const Duration(milliseconds: 222),
        pageBuilder: (BuildContext context, _, __) {
          return CityDetail(city: city);
        },
        // transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        //   return SlideTransition(
        //     child: child,
        //     position:
        //         animation.drive(Tween(begin: Offset(1, 0), end: Offset.zero)),
        //   );
        // },
        fullscreenDialog: true));
  }

  /// ### Place
  void openPlace(Place? place) {
    if (place == null) {
      return;
    }
    LoadingHub.showLoadingDialog(_context);
    PlaceProvider.getPlaceComments(place.id).then((comments) {
      LoadingHub.closeLoadingDialog();
      // Comment list
      if (comments != null) {
        place.setComments(comments);
      }
      // Open place
      _openPlace(place);
    });
  }

  void _openPlace(Place place) {
    if (place == null) {
      return;
    }
    // Navigator.of(context, rootNavigator: true).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => PlaceDetail(place: place)));
    Navigator.of(_context!, rootNavigator: true).push(PageRouteBuilder(
        opaque: true,
        // transitionDuration: const Duration(milliseconds: 222),
        pageBuilder: (BuildContext context, _, __) {
          return PlaceDetail(
            place: place,
          );
        },
        // transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        //   return SlideTransition(
        //     child: child,
        //     position:
        //         animation.drive(Tween(begin: Offset(1, 0), end: Offset.zero)),
        //   );
        // },
        fullscreenDialog: true));
  }
}
