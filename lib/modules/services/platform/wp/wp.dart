import 'package:Foodyy/modules/services/platform/Platform.dart';
import 'package:Foodyy/modules/services/platform/PlatformBase.dart';

class WP extends PlatformBase {
  WP() : super() {
    baseUrl = "https://foodyy.co/city-guide/wp-json/wp/v2/";
    type = PlatformType.wp;
  }
}
