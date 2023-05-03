import 'package:Foodyy/modules/services/platform/Platform.dart';
import 'package:Foodyy/modules/services/platform/PlatformBase.dart';

class Lara extends PlatformBase {
  static const String baseUrlImage = "https://foodyy.co/uploads/";

  Lara() : super() {
    baseUrl = "https://foodyy.co/api/app";
    type = PlatformType.lara;
  }
}
