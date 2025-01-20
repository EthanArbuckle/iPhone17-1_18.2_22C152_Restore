@interface RAPAnalyticsManager
+ (id)_requestParametersFromReport:(id)a3;
+ (id)_valueFromReport:(id)a3;
+ (int)_targetFromFeedbackType:(int)a3;
+ (int)_targetFromReport:(id)a3;
+ (void)_captureRAPUserAction:(int)a3 target:(int)a4 value:(id)a5 report:(id)a6;
+ (void)_captureRAPUserAction:(int)a3 target:(int)a4 value:(id)a5 report:(id)a6 requestParameters:(id)a7 duration:(id)a8;
+ (void)captureRAPAcknowledgementDoneActionFromReport:(id)a3;
+ (void)captureRAPCancelActionFromReport:(id)a3;
+ (void)captureRAPCancelSearchActionFromReport:(id)a3;
+ (void)captureRAPRevealActionFromReport:(id)a3;
+ (void)captureRAPSendActionFromReport:(id)a3;
@end

@implementation RAPAnalyticsManager

+ (void)captureRAPRevealActionFromReport:(id)a3
{
  id v7 = a3;
  uint64_t v3 = +[RAPAnalyticsManager _targetFromReport:v7];
  v4 = +[RAPAnalyticsManager _valueFromReport:v7];
  v5 = +[RAPAnalyticsManager _requestParametersFromReport:v7];
  +[RAPAnalyticsManager _captureRAPUserAction:21 target:v3 value:v4 report:v7 requestParameters:v5 duration:0];
  if ((int)v3 > 1000)
  {
    if ((int)v3 > 1600)
    {
      switch((int)v3)
      {
        case 1700:
          v6 = @"LOOK_AROUND_PIP";
          break;
        case 1701:
          v6 = @"LOOK_AROUND_ACTION_SHEET";
          break;
        case 1702:
          v6 = @"LOOK_AROUND_VIEW";
          break;
        case 1703:
          v6 = @"LOOK_AROUND_PLATTER";
          break;
        case 1704:
          v6 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
          break;
        case 1705:
          v6 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
          break;
        case 1706:
          v6 = @"LOOK_AROUND_VIEW_PLACECARD";
          break;
        case 1707:
          v6 = @"LOOK_AROUND_PIP_PLACECARD";
          break;
        case 1708:
          v6 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
          break;
        default:
          if (v3 == 1601)
          {
            v6 = @"MENU_ITEM_DARK_MAP";
          }
          else
          {
LABEL_25:
            v6 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
          }
          break;
      }
    }
    else
    {
      switch((int)v3)
      {
        case 1001:
          v6 = @"CARPLAY_NAV";
          break;
        case 1002:
          v6 = @"CARPLAY_EXPLORE";
          break;
        case 1003:
          v6 = @"CARPLAY_DESTINATIONS";
          break;
        case 1004:
          v6 = @"CARPLAY_TRAFFIC_INCIDENT";
          break;
        case 1005:
          v6 = @"CARPLAY_CONTROL";
          break;
        case 1006:
          v6 = @"CARPLAY_PROACTIVE";
          break;
        case 1007:
          v6 = @"CARPLAY_ROUTING";
          break;
        case 1008:
          v6 = @"CARPLAY_MORE_ROUTES";
          break;
        case 1009:
          v6 = @"CARPLAY_SEARCH_ALONG_ROUTE";
          break;
        case 1010:
          v6 = @"CARPLAY_SEARCH";
          break;
        case 1011:
          v6 = @"CARPLAY_SEARCH_RESULTS";
          break;
        case 1012:
          v6 = @"CARPLAY_FAVORITES";
          break;
        case 1013:
          v6 = @"CARPLAY_NAV_CONFIRMATION";
          break;
        case 1014:
          v6 = @"CARPLAY_DESTINATION_SHARING";
          break;
        case 1015:
          v6 = @"CARPLAY_NOTIFICATION_BATTERY";
          break;
        case 1016:
          v6 = @"CARPLAY_NOTIFICATION_DOOM";
          break;
        case 1017:
          v6 = @"CARPLAY_NOTIFICATION_FUEL";
          break;
        case 1018:
          v6 = @"CARPLAY_NOTIFICATION_HYBRID";
          break;
        case 1019:
          v6 = @"CARPLAY_SHARE_ETA_TRAY";
          break;
        case 1020:
          v6 = @"CARPLAY_ETA_UPDATE_TRAY";
          break;
        case 1021:
          v6 = @"CARPLAY_ACTION_TRAY";
          break;
        case 1022:
          v6 = @"CARPLAY_PLACECARD";
          break;
        case 1023:
          v6 = @"CARPLAY_KEYBOARD";
          break;
        case 1024:
          v6 = @"CARPLAY_UI_TARGET_UNKNOWN";
          break;
        case 1025:
          v6 = @"CARPLAY_EDIT_STOPS";
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_25;
        case 1100:
          v6 = @"RAP_DIRECTIONS_MENU";
          break;
        case 1101:
          v6 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
          break;
        case 1102:
          v6 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
          break;
        case 1103:
          v6 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
          break;
        case 1104:
          v6 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
          break;
        case 1105:
          v6 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
          break;
        case 1106:
          v6 = @"RAP_TRANSIT_MENU";
          break;
        case 1107:
          v6 = @"RAP_STATION_MAP";
          break;
        case 1108:
          v6 = @"RAP_STATION_MENU";
          break;
        case 1109:
          v6 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
          break;
        case 1110:
          v6 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
          break;
        case 1111:
          v6 = @"RAP_STATION_CLOSED_FORM";
          break;
        case 1112:
          v6 = @"RAP_LINE_MAP";
          break;
        case 1113:
          v6 = @"RAP_LINE_MENU";
          break;
        case 1114:
          v6 = @"RAP_LINE_NAME_FORM";
          break;
        case 1115:
          v6 = @"RAP_LINE_SHAPE_FORM";
          break;
        case 1116:
          v6 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
          break;
        case 1117:
          v6 = @"RAP_ADD_PLACE_MENU";
          break;
        case 1118:
          v6 = @"RAP_ADD_POI_MAP";
          break;
        case 1119:
          v6 = @"RAP_CATEGORY_LIST";
          break;
        case 1120:
          v6 = @"RAP_POI_DETAILS_FORM";
          break;
        case 1121:
          v6 = @"RAP_ADD_STREET_MAP";
          break;
        case 1122:
          v6 = @"RAP_STREET_DETAILS_FORM";
          break;
        case 1123:
          v6 = @"RAP_ADD_OTHER_MAP";
          break;
        case 1124:
          v6 = @"RAP_OTHER_DETAILS_FORM";
          break;
        case 1125:
          v6 = @"RAP_CAMERA";
          break;
        case 1126:
          v6 = @"RAP_LABEL_MAP";
          break;
        case 1127:
          v6 = @"RAP_LABEL_DETAILS_FORM";
          break;
        case 1128:
          v6 = @"RAP_SEARCH_MENU";
          break;
        case 1129:
          v6 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
          break;
        case 1130:
          v6 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
          break;
        case 1131:
          v6 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
          break;
        case 1132:
          v6 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
          break;
        case 1133:
          v6 = @"RAP_SATELLITE_IMAGE_MAP";
          break;
        case 1134:
          v6 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
          break;
        case 1135:
          v6 = @"RAP_OTHER_FORM";
          break;
        case 1136:
          v6 = @"RAP_PRIVACY";
          break;
        case 1137:
          v6 = @"RAP_CONFIRMATION";
          break;
        case 1138:
          v6 = @"RAP_POI_MENU";
          break;
        case 1139:
          v6 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
          break;
        case 1140:
          v6 = @"RAP_ADD_A_PLACE_MAP";
          break;
        case 1141:
          v6 = @"RAP_POI_LOCATION_MAP";
          break;
        case 1142:
          v6 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
          break;
        case 1143:
          v6 = @"RAP_POI_CLOSED_FORM";
          break;
        case 1144:
          v6 = @"RAP_CLAIM_BUSINESS_DIALOG";
          break;
        case 1145:
          v6 = @"RAP_BRAND_MENU";
          break;
        case 1146:
          v6 = @"RAP_BRAND_DETAILS_FORM";
          break;
        case 1147:
          v6 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
          break;
        case 1148:
          v6 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
          break;
        case 1149:
          v6 = @"RAP_LOOK_AROUND_BLURRING_FORM";
          break;
        case 1150:
          v6 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
          break;
        case 1151:
          v6 = @"RAP_LOOK_AROUND_MENU";
          break;
        case 1152:
          v6 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
          break;
        case 1153:
          v6 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
          break;
        case 1154:
          v6 = @"RAP_LIGHTWEIGHT";
          break;
        case 1155:
          v6 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 1156:
          v6 = @"RAP_ADD_CATEGORY";
          break;
        case 1157:
          v6 = @"RAP_ADD_HOURS";
          break;
        case 1158:
          v6 = @"RAP_EDIT_LOCATION";
          break;
        case 1159:
          v6 = @"RAP_EDIT_ENTRY_POINT";
          break;
        case 1160:
          v6 = @"RAP_LOOK_AROUND";
          break;
        case 1161:
          v6 = @"RAP_ADD_ENTRY_POINT";
          break;
        case 1201:
          v6 = @"WATCH_MAIN_MENU";
          break;
        case 1202:
          v6 = @"WATCH_MAIN_PRESS_MENU";
          break;
        case 1203:
          v6 = @"WATCH_SEARCH";
          break;
        case 1204:
          v6 = @"WATCH_DICTATION";
          break;
        case 1205:
          v6 = @"WATCH_FAVORITES";
          break;
        case 1206:
          v6 = @"WATCH_SUB_CATEGORY_LIST";
          break;
        case 1207:
          v6 = @"WATCH_SEARCH_RESULTS_LIST";
          break;
        case 1208:
          v6 = @"WATCH_MAP_VIEW";
          break;
        case 1209:
          v6 = @"WATCH_PLACECARD";
          break;
        case 1210:
          v6 = @"WATCH_ROUTE_PLANNING";
          break;
        case 1211:
          v6 = @"WATCH_ROUTE_DETAILS";
          break;
        case 1212:
          v6 = @"WATCH_NAV_TBT";
          break;
        case 1213:
          v6 = @"WATCH_NAV_MAP";
          break;
        case 1214:
          v6 = @"WATCH_NAV_PRESS_MENU";
          break;
        case 1215:
          v6 = @"WATCH_MAP_PRESS_MENU";
          break;
        case 1216:
          v6 = @"WATCH_ROUTING_PRESS_MENU";
          break;
        case 1217:
          v6 = @"WATCH_TRANSIT_MAP_VIEW";
          break;
        case 1218:
          v6 = @"WATCH_SCRIBBLE";
          break;
        case 1219:
          v6 = @"WATCH_COLLECTION_VIEW";
          break;
        case 1220:
          v6 = @"WATCH_ROUTE_PLANNING_WALKING";
          break;
        case 1221:
          v6 = @"WATCH_ROUTE_PLANNING_DRIVING";
          break;
        case 1222:
          v6 = @"WATCH_ROUTE_PLANNING_TRANSIT";
          break;
        case 1223:
          v6 = @"WATCH_PAIRED_DEVICE";
          break;
        case 1224:
          v6 = @"WATCH_NAV_DRIVING_SPLIT";
          break;
        case 1225:
          v6 = @"WATCH_NAV_DRIVING_PLATTER";
          break;
        case 1226:
          v6 = @"WATCH_NAV_DRIVING_MAP";
          break;
        case 1227:
          v6 = @"WATCH_NAV_WALKING_SPLIT";
          break;
        case 1228:
          v6 = @"WATCH_NAV_WALKING_PLATTER";
          break;
        case 1229:
          v6 = @"WATCH_NAV_WALKING_MAP";
          break;
        case 1230:
          v6 = @"WATCH_NAV_TRANSIT_SPLIT";
          break;
        case 1231:
          v6 = @"WATCH_NAV_TRANSIT_PLATTER";
          break;
        case 1232:
          v6 = @"WATCH_NAV_TRANSIT_MAP";
          break;
        case 1233:
          v6 = @"WATCH_ROUTE_INFO";
          break;
        case 1234:
          v6 = @"WATCH_NAV_CYCLING_MAP";
          break;
        case 1235:
          v6 = @"WATCH_NAV_CYCLING_PLATTER";
          break;
        case 1236:
          v6 = @"WATCH_NAV_CYCLING_SPLIT";
          break;
        case 1237:
          v6 = @"WATCH_ROUTE_PLANNING_CYCLING";
          break;
        case 1238:
          v6 = @"WATCH_SEARCH_INPUT";
          break;
        case 1239:
          v6 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 1240:
          v6 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 1301:
          v6 = @"PERSONALIZED_ADDRESS_LIST";
          break;
        case 1302:
          v6 = @"PERSONALIZED_ADDRESS_FORM";
          break;
        case 1303:
          v6 = @"PERSONALIZED_LABEL_FORM";
          break;
        case 1304:
          v6 = @"PERSONALIZED_EDIT_MAP";
          break;
        case 1305:
          v6 = @"PERSONALIZED_CONFIRMATION";
          break;
        case 1306:
          v6 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
          break;
        case 1307:
          v6 = @"PERSONALIZED_ADDRESS_INFO";
          break;
        case 1308:
          v6 = @"PERSONALIZED_ADDRESS_SEARCH";
          break;
        case 1309:
          v6 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
          break;
        case 1310:
          v6 = @"FAVORITE_SEARCH";
          break;
        case 1311:
          v6 = @"FAVORITE_LIST";
          break;
        case 1312:
          v6 = @"FAVORITE_INFO";
          break;
        case 1313:
          v6 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
          break;
        default:
          switch((int)v3)
          {
            case 1401:
              v6 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
              break;
            case 1402:
              v6 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
              break;
            case 1403:
              v6 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
              break;
            case 1404:
              v6 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
              break;
            case 1405:
              v6 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
              break;
            case 1406:
              v6 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
              break;
            case 1407:
              v6 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
              break;
            default:
              switch((int)v3)
              {
                case 1501:
                  v6 = @"PLACECARD_HEADER";
                  break;
                case 1502:
                  v6 = @"PLACECARD_ADDRESS";
                  break;
                case 1503:
                  v6 = @"PLACECARD_PHONE";
                  break;
                case 1504:
                  v6 = @"PLACECARD_URL";
                  break;
                default:
                  goto LABEL_25;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v6 = @"UI_TARGET_UNKNOWN";
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        v6 = @"UI_TARGET_POI";
        break;
      case 2:
        v6 = @"UI_TARGET_SEARCH_RESULT_LIST";
        break;
      case 3:
        v6 = @"UI_TARGET_POPULAR_NEARBY_LIST";
        break;
      case 4:
        v6 = @"UI_TARGET_CALLOUT";
        break;
      case 5:
        v6 = @"UI_TARGET_SEARCH_PIN";
        break;
      case 6:
        v6 = @"UI_TARGET_DROPPED_PIN";
        break;
      case 7:
        v6 = @"UI_TARGET_TRANSIT_LINE";
        break;
      case 8:
        v6 = @"SEARCH_TRAY";
        break;
      case 9:
        v6 = @"SEARCH_TRAY_BROWSE";
        break;
      case 10:
        v6 = @"SEARCH_TRAY_POPULAR_NEARBY";
        break;
      case 11:
        v6 = @"SEARCH_TRAY_AC";
        break;
      case 12:
        v6 = @"SEARCH_TRAY_AC_INTERMEDIATE";
        break;
      case 13:
        v6 = @"SEARCH_TRAY_NO_QUERY";
        break;
      case 14:
        v6 = @"AR_WALKING_LEGAL_TRAY";
        break;
      case 15:
        v6 = @"RAISE_TO_START_AR_TRAY";
        break;
      case 16:
        v6 = @"EVENTS_ADVISORY_DETAILS_PAGE";
        break;
      case 17:
        v6 = @"INCIDENT_REPORT_TRAY_CARPLAY";
        break;
      case 18:
        v6 = @"HIGHLIGHTED_AREA";
        break;
      case 19:
        v6 = @"CURATED_COLLECTIONS_HOME";
        break;
      case 20:
        v6 = @"TRAVEL_PREFERENCES_TRAY";
        break;
      case 21:
        v6 = @"RESULT_TRAY_SEARCH";
        break;
      case 22:
        v6 = @"SINGLE_CARD_FILTER";
        break;
      case 23:
        v6 = @"FULL_CARD_FILTER";
        break;
      case 24:
        v6 = @"ACCOUNT_PRIVACY_TRAY";
        break;
      case 25:
        v6 = @"APPLE_RATINGS_HISTORY_TRAY";
        break;
      case 26:
        v6 = @"CURATED_COLLECTIONS_HOME_FILTERED";
        break;
      case 27:
        v6 = @"CITY_MENU";
        break;
      case 28:
        v6 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
        break;
      case 29:
        v6 = @"ACCOUNT_TRAY";
        break;
      case 30:
        v6 = @"QUICK_ACTION_TRAY";
        break;
      case 31:
        v6 = @"SUBMIT_TRIP_FEEDBACK";
        break;
      case 32:
        v6 = @"RAP_PLACE_ISSUE_DETAILS";
        break;
      case 33:
        v6 = @"RAP_GUIDES_DETAILS";
        break;
      case 34:
        v6 = @"RAP_BAD_DIRECTIONS_DETAILS";
        break;
      case 35:
        v6 = @"RAP_ADD_MAP_DETAILS";
        break;
      case 36:
        v6 = @"WATCH_COMPLICATION";
        break;
      case 37:
        v6 = @"RAP_NAV_MENU";
        break;
      case 38:
        v6 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
        break;
      case 39:
        v6 = @"RAP_REPORT_MENU";
        break;
      case 40:
        v6 = @"RAP_CURATED_COLLECTION_MENU";
        break;
      case 41:
        v6 = @"RAP_REPORT_CARD_DETAILS";
        break;
      case 42:
        v6 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
        break;
      case 43:
        v6 = @"RAP_STREET_ISSUE_DETAILS";
        break;
      case 44:
        v6 = @"NEARBY_TRANSIT_CARD";
        break;
      case 45:
        v6 = @"WATCH_NAV_MENU";
        break;
      case 46:
        v6 = @"GENERIC_ADVISORY_PAGE";
        break;
      case 47:
        v6 = @"USER_PROFILE_TRAY";
        break;
      case 48:
        v6 = @"MEDIA_APP_MENU";
        break;
      case 49:
        v6 = @"TEMPLATE_PLACE_TRAY";
        break;
      case 50:
        v6 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
        break;
      case 51:
        v6 = @"ALLOW_NOTIFICATION_DIALOG";
        break;
      case 52:
        v6 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
        break;
      case 53:
        v6 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
        break;
      case 54:
        v6 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
        break;
      case 55:
        v6 = @"NOTIFICATION_CONSENT_PROMPT";
        break;
      case 56:
        v6 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
        break;
      case 57:
        v6 = @"PLACECARD_TRAY_VENDORS_MENU";
        break;
      case 58:
        v6 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
        break;
      case 59:
        v6 = @"SEARCH_ALONG_ROUTE_TRAY";
        break;
      case 60:
        v6 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
        break;
      case 61:
        v6 = @"PLACECARD_SHOWCASE_MENU";
        break;
      case 62:
        v6 = @"RAP_INLINE_ADD_DETAILS";
        break;
      case 63:
        v6 = @"RAP_EDIT_MENU_DETAILS";
        break;
      case 64:
        v6 = @"RAP_SUBMISSION_PROMPT";
        break;
      case 65:
        v6 = @"RAP_PLACECARD_EDIT_MENU";
        break;
      case 66:
        v6 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
        break;
      case 67:
        v6 = @"INCIDENT_REPORT_MENU";
        break;
      case 68:
        v6 = @"RAP_SELECT_BAD_ROUTES_STEPS";
        break;
      case 69:
        v6 = @"RAP_SELECT_BAD_ROUTES";
        break;
      case 70:
        v6 = @"SIRI_SUGGESTION_RESUME_ROUTE";
        break;
      case 71:
        v6 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
        break;
      case 72:
        v6 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
        break;
      case 73:
        v6 = @"SPOTLIGHT_BUSINESS_ENTITY";
        break;
      case 74:
        v6 = @"NOTIFICATION_ARP";
        break;
      case 75:
        v6 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
        break;
      case 76:
        v6 = @"YOUR_PHOTOS_ALBUM";
        break;
      case 77:
        v6 = @"ARP_PHOTO_CREDIT";
        break;
      case 78:
        v6 = @"RAP_OUTREACH_REVIEWED_REPORT";
        break;
      case 79:
        v6 = @"RAP_REPORT_MENU_MORE";
        break;
      case 80:
        v6 = @"WATCH_MAPS_SETTINGS";
        break;
      case 81:
        v6 = @"OFFLINE_FEATURE_PROMPT";
        break;
      case 82:
        v6 = @"EXPIRED_MAPS_DETAILS";
        break;
      case 83:
        v6 = @"MAPS_VIEW";
        break;
      case 84:
        v6 = @"NOTIFICATION_OFFLINE";
        break;
      case 85:
        v6 = @"EXPIRED_MAPS_MANAGEMENT";
        break;
      case 86:
        v6 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
        break;
      case 87:
        v6 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
        break;
      case 88:
        v6 = @"OFFLINE_MAPS_MANAGEMENT";
        break;
      case 89:
        v6 = @"REGION_SELECTOR";
        break;
      case 90:
        v6 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
        break;
      case 91:
        v6 = @"FIND_MY_ETA_SHARING_TRAY";
        break;
      case 92:
        v6 = @"WATCH_PLACE";
        break;
      case 93:
        v6 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
        break;
      case 94:
        v6 = @"WATCH_ROUTE_PLANNING_MAP";
        break;
      case 95:
        v6 = @"WATCH_NAV_WALKING_CONTROLS";
        break;
      case 96:
        v6 = @"WATCH_NAV_CYCLING_CONTROLS";
        break;
      case 97:
        v6 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
        break;
      case 98:
        v6 = @"WATCH_NAV_TRANSIT_CONTROLS";
        break;
      case 99:
        v6 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
        break;
      case 100:
        v6 = @"WATCH_NAV_DRIVING_CONTROLS";
        break;
      case 101:
        v6 = @"RESULTS_TRAY_SEARCH";
        break;
      case 102:
        v6 = @"RESULTS_TRAY_BROWSE";
        break;
      case 103:
        v6 = @"RESULTS_TRAY_FAVORITES";
        break;
      case 104:
        v6 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
        break;
      case 105:
        v6 = @"RESULTS_TRAY_CLUSTER";
        break;
      case 106:
        v6 = @"RESULTS_TRAY_VENUE_BROWSE";
        break;
      case 107:
        v6 = @"WATCH_MAP_RESULTS";
        break;
      case 108:
        v6 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
        break;
      case 109:
        v6 = @"WATCH_PLACES";
        break;
      case 110:
        v6 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
        break;
      case 111:
        v6 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
        break;
      case 112:
        v6 = @"DOWNLOADED_MAPS_DETAILS";
        break;
      case 113:
        v6 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
        break;
      case 114:
        v6 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
        break;
      case 115:
        v6 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
        break;
      case 116:
        v6 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
        break;
      case 117:
        v6 = @"WATCH_ROUTE_OPTIONS";
        break;
      case 118:
        v6 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
        break;
      case 119:
        v6 = @"WATCH_MORE_GUIDES";
        break;
      case 120:
        v6 = @"WATCH_RECENTLY_VIEWED";
        break;
      case 121:
        v6 = @"EV_SUCCESS_TRAY";
        break;
      case 122:
        v6 = @"PREFERRED_NETWORK_SELECTION_TRAY";
        break;
      case 123:
        v6 = @"PREFERRED_NETWORK_TRAY";
        break;
      case 124:
        v6 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 125:
        v6 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
        break;
      case 126:
        v6 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
        break;
      case 127:
        v6 = @"AC_KEYBOARD_TRAY";
        break;
      case 128:
        v6 = @"MORE_RELATED_TRAILS";
        break;
      case 129:
        v6 = @"MORE_RELATED_TRAILHEADS";
        break;
      case 130:
        v6 = @"ROUTING_TRAY_CUSTOM_ROUTE";
        break;
      case 131:
        v6 = @"CUSTOM_ROUTE_CREATION_TRAY";
        break;
      case 132:
        v6 = @"ROUTING_TRAY_CURATED_HIKE";
        break;
      case 133:
        v6 = @"MORE_CURATED_HIKES";
        break;
      case 134:
        v6 = @"CUSTOM_ROUTE_ONBOARDING";
        break;
      case 135:
        v6 = @"LIBRARY_ROUTES";
        break;
      case 136:
        v6 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 137:
        v6 = @"MY_LIBRARY";
        break;
      case 138:
        v6 = @"EDIT_NOTE_TRAY";
        break;
      case 139:
        v6 = @"CREATE_NOTE_TRAY";
        break;
      case 140:
        v6 = @"LIBRARY_PLACES";
        break;
      case 141:
        v6 = @"WATCH_ACCOUNT";
        break;
      case 142:
        v6 = @"WATCH_DOWNLOADED_MAPS";
        break;
      case 143:
        v6 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
        break;
      case 144:
        v6 = @"VISUAL_INTELLIGENCE_DETECTION";
        break;
      case 145:
        v6 = @"VISUAL_INTELLIGENCE_SNIPPET";
        break;
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_25;
      case 201:
        v6 = @"PLACECARD_TRAY";
        break;
      case 202:
        v6 = @"WEB_MODULE";
        break;
      case 250:
        v6 = @"ADD_FAVORITE_TRAY";
        break;
      case 251:
        v6 = @"COLLECTION_LIST";
        break;
      case 252:
        v6 = @"COLLECTION_VIEW";
        break;
      case 253:
        v6 = @"FAVORITE_DETAILS";
        break;
      case 254:
        v6 = @"FAVORITES_TRAY";
        break;
      case 255:
        v6 = @"SHARED_COLLECTION";
        break;
      case 256:
        v6 = @"SHARED_COLLECTION_VIEW";
        break;
      case 257:
        v6 = @"RECENTLY_VIEWED";
        break;
      case 258:
        v6 = @"SHARED_WEB_COLLECTION";
        break;
      case 259:
        v6 = @"CURATED_COLLECTION_VIEW";
        break;
      case 260:
        v6 = @"FEATURED_COLLECTIONS";
        break;
      case 261:
        v6 = @"PUBLISHER_TRAY";
        break;
      case 262:
        v6 = @"SHARED_CURATED_COLLECTION_VIEW";
        break;
      case 263:
        v6 = @"CURATED_COLLECTION_NOTIFICATION";
        break;
      case 264:
        v6 = @"CURATED_COLLECTION_LIST";
        break;
      case 265:
        v6 = @"PUBLISHER_LIST";
        break;
      case 266:
        v6 = @"WATCH_CURATED_COLLECTION_VIEW";
        break;
      case 267:
        v6 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
        break;
      case 268:
        v6 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
        break;
      case 301:
        v6 = @"ROUTING_TRAY_DRIVING";
        break;
      case 302:
        v6 = @"ROUTING_TRAY_WALKING";
        break;
      case 303:
        v6 = @"ROUTING_TRAY_TRANSIT";
        break;
      case 304:
        v6 = @"ROUTING_TRAY_RIDESHARE";
        break;
      case 305:
        v6 = @"ROUTING_TRAY_CYCLING";
        break;
      case 306:
        v6 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
        break;
      case 401:
        v6 = @"NAV_TRAY_DRIVING";
        break;
      case 402:
        v6 = @"NAV_TRAY_WALKING";
        break;
      case 403:
        v6 = @"NAV_TRAY_TRANSIT";
        break;
      case 404:
        v6 = @"NAV_TRAY_CYCLING";
        break;
      case 501:
        v6 = @"MAP_PLACECARD";
        break;
      case 502:
        v6 = @"MAP_SEARCH";
        break;
      case 503:
        v6 = @"MAP_RESULTS";
        break;
      case 504:
        v6 = @"MAP_ROUTING";
        break;
      case 505:
        v6 = @"MAP_NAV";
        break;
      case 506:
        v6 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
        break;
      case 507:
        v6 = @"MAP_TRAFFIC_INCIDENT";
        break;
      case 508:
        v6 = @"MAP_FULL_SCREEN";
        break;
      case 509:
        v6 = @"MAP_DRIVE";
        break;
      case 510:
        v6 = @"MAP_LAUNCH_AND_GO";
        break;
      case 511:
        v6 = @"MAP_VIEW";
        break;
      case 601:
        v6 = @"MAPS_SETTINGS";
        break;
      case 602:
        v6 = @"MAPS_PREFERENCES";
        break;
      case 603:
        v6 = @"RAP";
        break;
      case 604:
        v6 = @"ROUTING_DRIVING_DETAILS";
        break;
      case 605:
        v6 = @"ROUTING_WALKING_DETAILS";
        break;
      case 606:
        v6 = @"ROUTING_TRANSIT_DETAILS";
        break;
      case 607:
        v6 = @"ROUTING_EDITOR";
        break;
      case 608:
        v6 = @"NAV_DRIVING_DETAILS";
        break;
      case 609:
        v6 = @"NAV_WALKING_DETAILS";
        break;
      case 610:
        v6 = @"NAV_TRANSIT_DETAILS";
        break;
      case 611:
        v6 = @"NAV_AUDIO_SETTINGS";
        break;
      case 612:
        v6 = @"PHOTO_VIEWER_ALL";
        break;
      case 613:
        v6 = @"PHOTO_VIEWER_SINGLE";
        break;
      case 614:
        v6 = @"ROUTE_OPTIONS_TRANSIT";
        break;
      case 615:
        v6 = @"TRAFFIC_INCIDENT_TRAY";
        break;
      case 616:
        v6 = @"NAV_DIRECTIONS_BANNER_DRIVING";
        break;
      case 617:
        v6 = @"NAV_DIRECTIONS_BANNER_WALKING";
        break;
      case 618:
        v6 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
        break;
      case 619:
        v6 = @"REFINE_SEARCH_SUGGESTION_AREA";
        break;
      case 620:
        v6 = @"ADD_PHOTO_SHEET";
        break;
      case 621:
        v6 = @"ADD_PLACE_SHEET";
        break;
      case 622:
        v6 = @"SHARE_SHEET";
        break;
      case 623:
        v6 = @"EDIT_LOCATION_SHEET";
        break;
      case 624:
        v6 = @"ADD_CONTACT_SHEET";
        break;
      case 625:
        v6 = @"EDIT_NAME_SHEET";
        break;
      case 626:
        v6 = @"DRIVING_NAV_SETTINGS";
        break;
      case 627:
        v6 = @"TRANSIT_SETTINGS";
        break;
      case 628:
        v6 = @"TRANSIT_ADVISORY_SHEET";
        break;
      case 629:
        v6 = @"REMOVE_CAR_SHEET";
        break;
      case 630:
        v6 = @"ROUTE_OPTIONS_DRIVING";
        break;
      case 631:
        v6 = @"ROUTE_OPTIONS_DATETIME";
        break;
      case 632:
        v6 = @"TRANSIT_ADVISORY_BANNER";
        break;
      case 633:
        v6 = @"BOOK_TABLE_SELECT_TIME";
        break;
      case 634:
        v6 = @"BOOK_TABLE_MORE_OPTIONS";
        break;
      case 635:
        v6 = @"BOOK_TABLE_READY";
        break;
      case 636:
        v6 = @"BOOK_TABLE_BOOKED";
        break;
      case 637:
        v6 = @"TRANSIT_LINE_CLUSTER_SHEET";
        break;
      case 638:
        v6 = @"TRANSIT_LINE_LIST_SHEET";
        break;
      case 639:
        v6 = @"TRANSIT_BALANCE_BANNER";
        break;
      case 640:
        v6 = @"WEATHER_ICON";
        break;
      case 641:
        v6 = @"HELP_IMPROVE_MAPS_DIALOG";
        break;
      case 642:
        v6 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 643:
        v6 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 644:
        v6 = @"FLOOR_PICKER";
        break;
      case 645:
        v6 = @"VENUE_LIST";
        break;
      case 646:
        v6 = @"AR_MODE";
        break;
      case 647:
        v6 = @"ROUTING_TRANSIT_TICKETS_SHEET";
        break;
      case 648:
        v6 = @"LINKED_SERVICE_HOURS";
        break;
      case 649:
        v6 = @"SHARE_ETA_TRAY";
        break;
      case 650:
        v6 = @"ETA_UPDATE_TRAY";
        break;
      case 651:
        v6 = @"SCHEDULECARD_TRAY";
        break;
      case 652:
        v6 = @"AR_NAV";
        break;
      case 653:
        v6 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 654:
        v6 = @"LOCATIONS_INSIDE";
        break;
      case 655:
        v6 = @"SIMILAR_LOCATIONS";
        break;
      case 656:
        v6 = @"LOCATIONS_AT_ADDRESS";
        break;
      case 657:
        v6 = @"NAV_DIRECTIONS_BANNER_CYCLING";
        break;
      case 658:
        v6 = @"ROUTE_OPTIONS_CYCLING";
        break;
      case 659:
        v6 = @"EV_CONNECTION_TRAY";
        break;
      case 660:
        v6 = @"VIRTUAL_GARAGE";
        break;
      case 661:
        v6 = @"VIRTUAL_GARAGE_BANNER";
        break;
      case 662:
        v6 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
        break;
      case 663:
        v6 = @"ADVISORY_DETAILS_PAGE";
        break;
      case 664:
        v6 = @"APP_CLIP_NOTIFICATION";
        break;
      case 665:
        v6 = @"PHOTO_VIEWER_GALLERY";
        break;
      case 666:
        v6 = @"RECOMMENDATION_CARD";
        break;
      case 667:
        v6 = @"INCIDENT_REPORT_TRAY";
        break;
      case 668:
        v6 = @"MAPS_WIDGET_DISPLAY";
        break;
      case 669:
        v6 = @"VISUAL_LOCATION_FRAMEWORK";
        break;
      case 670:
        v6 = @"APP_CLIP_TRAY";
        break;
      case 671:
        v6 = @"LICENSE_PLATE_SUGGESTION_PAGE";
        break;
      case 672:
        v6 = @"NOTIFICATION_ADD_PLATE";
        break;
      case 673:
        v6 = @"MAPS_RESULTS";
        break;
      case 674:
        v6 = @"MAPS_WIDGET_APP_CONNECTION";
        break;
      case 675:
        v6 = @"MAPS_WIDGET_CURRENT_LOCATION";
        break;
      case 676:
        v6 = @"MAPS_WIDGET_CURRENT_NAV";
        break;
      case 677:
        v6 = @"MAPS_WIDGET_ETA";
        break;
      case 678:
        v6 = @"MAPS_WIDGET_TRANSIT";
        break;
      case 679:
        v6 = @"MAPS_WIDGET_UPC_DESTINATION";
        break;
      case 680:
        v6 = @"WIDGET_CREATION_TRAY";
        break;
      case 681:
        v6 = @"MAPS_WIDGET_HOME";
        break;
      case 682:
        v6 = @"MAPS_WIDGET_PARKED_CAR";
        break;
      case 683:
        v6 = @"MAPS_WIDGET_POI";
        break;
      case 684:
        v6 = @"MAPS_WIDGET_SCHOOL";
        break;
      case 685:
        v6 = @"MAPS_WIDGET_WORK";
        break;
      case 686:
        v6 = @"AIRPORT_NOTIFICATION";
        break;
      case 687:
        v6 = @"MAPS_WIDGET_EMPTY";
        break;
      case 688:
        v6 = @"COARSE_LOCATION_OPTIONS_PROMPT";
        break;
      case 689:
        v6 = @"ALLOW_PRECISE_LOCATION_PROMPT";
        break;
      case 690:
        v6 = @"SHARE_MY_LOCATION";
        break;
      case 691:
        v6 = @"MARK_MY_LOCATION";
        break;
      case 692:
        v6 = @"AIRPORT_NOTIFICATION_WATCH";
        break;
      case 693:
        v6 = @"EDIT_FAVORITE";
        break;
      case 694:
        v6 = @"ROUTING_CYCLING_DETAILS";
        break;
      case 695:
        v6 = @"NAV_CYCLING_DETAILS";
        break;
      case 696:
        v6 = @"MAPS_SUGGESTION_WIDGET";
        break;
      case 697:
        v6 = @"ARP_TIPKIT";
        break;
      case 698:
        v6 = @"ARP_PRIVACY";
        break;
      case 699:
        v6 = @"ROUTE_OPTIONS_WALKING";
        break;
      case 701:
        v6 = @"SAFARI_SEARCH";
        break;
      case 702:
        v6 = @"SPOTLIGHT_SEARCH";
        break;
      case 703:
        v6 = @"SAFARI_MAPS_SEARCH_RESULTS";
        break;
      case 704:
        v6 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
        break;
      case 705:
        v6 = @"WIDGET_MAPS_DESTINATIONS";
        break;
      case 706:
        v6 = @"WIDGET_MAPS_TRANSIT";
        break;
      case 707:
        v6 = @"WIDGET_MAPS_NEARBY";
        break;
      case 708:
        v6 = @"NOTIFICATION_FIND_MY_CAR";
        break;
      case 709:
        v6 = @"CONTROL_CENTER";
        break;
      case 710:
        v6 = @"NOTIFICATION_CENTER";
        break;
      case 711:
        v6 = @"NOTIFICATION_DOOM";
        break;
      case 712:
        v6 = @"NOTIFICATION_VENUES";
        break;
      case 713:
        v6 = @"NOTIFICATION_RAP_UPDATE";
        break;
      case 714:
        v6 = @"NOTIFICATION_TRIP_CANCELLED";
        break;
      case 715:
        v6 = @"NOTIFICATION_STOP_SKIPPED";
        break;
      case 716:
        v6 = @"NOTIFICATION_TRIP_DELAYED";
        break;
      case 717:
        v6 = @"NOTIFICATION_RAP";
        break;
      case 718:
        v6 = @"NOTIFICATION_PROXY_AUTH";
        break;
      case 719:
        v6 = @"NOTIFICATION_PUSH_TO_DEVICE";
        break;
      case 720:
        v6 = @"NOTIFICATION_LOW_FUEL";
        break;
      case 721:
        v6 = @"NOTIFICATION_FIND_MY_CAR_RESET";
        break;
      case 722:
        v6 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
        break;
      case 723:
        v6 = @"NOTIFICATION_SHARED_ETA";
        break;
      case 724:
        v6 = @"NOTIFICATION_SHARED_ETA_UPDATE";
        break;
      case 725:
        v6 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
        break;
      case 726:
        v6 = @"ANNOUNCEMENT_TYPE_GENERAL";
        break;
      case 727:
        v6 = @"ANNOUNCEMENT_TYPE_FLYOVER";
        break;
      case 728:
        v6 = @"ANNOUNCEMENT_TYPE_TRANSIT";
        break;
      case 729:
        v6 = @"ANNOUNCEMENT_TYPE_VENUES";
        break;
      case 730:
        v6 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
        break;
      case 731:
        v6 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
        break;
      case 732:
        v6 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
        break;
      case 733:
        v6 = @"APP_SHEET";
        break;
      case 734:
        v6 = @"CZ_ADVISORY_DETAILS_PAGE";
        break;
      case 735:
        v6 = @"SHARE_ETA_CONTACT_TRAY";
        break;
      case 736:
        v6 = @"SIRI_SHARE_ETA";
        break;
      case 737:
        v6 = @"SIRI_SUGGESTION_SHARED_ETA";
        break;
      case 738:
        v6 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
        break;
      case 739:
        v6 = @"INCIDENT_ALERT_TRAY";
        break;
      case 740:
        v6 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
        break;
      case 741:
        v6 = @"RAP_INCIDENT_REPORT_VIEW";
        break;
      case 742:
        v6 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
        break;
      case 743:
        v6 = @"TRAFFIC_ADVISORY_SHEET";
        break;
      case 801:
        v6 = @"SIRI_PLUGIN_SNIPPET";
        break;
      case 802:
        v6 = @"SIRI_PLUGIN_COMMAND";
        break;
      case 803:
        v6 = @"SIRI_SEARCH_RESULT_LIST";
        break;
      case 804:
        v6 = @"SIRI_DISAMBIGUATION_LIST";
        break;
      case 805:
        v6 = @"SIRI_PLACE_SNIPPET";
        break;
      default:
        if (v3 != 901) {
          goto LABEL_25;
        }
        v6 = @"CHROME";
        break;
    }
  }
  +[RAPAnalyticsManager _captureRAPUserAction:21 target:41 value:v6 report:v7 requestParameters:v5 duration:0];
}

+ (void)captureRAPCancelActionFromReport:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[RAPAnalyticsManager _targetFromReport:v3];
  id v6 = +[RAPAnalyticsManager _valueFromReport:v3];
  v5 = +[RAPAnalyticsManager _requestParametersFromReport:v3];
  +[RAPAnalyticsManager _captureRAPUserAction:10109 target:v4 value:v6 report:v3 requestParameters:v5 duration:0];
}

+ (void)captureRAPCancelSearchActionFromReport:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[RAPAnalyticsManager _targetFromReport:v3];
  id v6 = +[RAPAnalyticsManager _valueFromReport:v3];
  v5 = +[RAPAnalyticsManager _requestParametersFromReport:v3];
  +[RAPAnalyticsManager _captureRAPUserAction:2003 target:v4 value:v6 report:v3 requestParameters:v5 duration:0];
}

+ (void)captureRAPSendActionFromReport:(id)a3
{
  id v18 = a3;
  uint64_t v3 = +[RAPAnalyticsManager _targetFromReport:v18];
  uint64_t v4 = +[RAPAnalyticsManager _requestParametersFromReport:v18];
  v5 = +[RAPAnalyticsManager _valueFromReport:v18];
  if (v3 == 33)
  {
    id v6 = [v4 submissionParameters];
    id v7 = [v6 details];
    v8 = [v7 curatedCollectionFeedback];
    v9 = [v8 curatedCollectionCorrections];

    uint64_t v10 = [v9 correctionTypeAsString:[v9 correctionType]];

    v5 = (void *)v10;
  }
  v11 = [v18 creationDate];
  [v11 timeIntervalSinceNow];
  double v13 = v12;
  v14 = [v18 creationDate];
  [v14 timeIntervalSinceNow];
  if (v13 < 0.0) {
    double v16 = -v15;
  }
  else {
    double v16 = v15;
  }

  v17 = +[NSNumber numberWithDouble:v16];
  +[RAPAnalyticsManager _captureRAPUserAction:10112 target:v3 value:v5 report:v18 requestParameters:v4 duration:v17];
}

+ (void)captureRAPAcknowledgementDoneActionFromReport:(id)a3
{
}

+ (void)_captureRAPUserAction:(int)a3 target:(int)a4 value:(id)a5 report:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = +[RAPAnalyticsManager _requestParametersFromReport:v9];
  +[RAPAnalyticsManager _captureRAPUserAction:v8 target:v7 value:v10 report:v9 requestParameters:v11 duration:0];
}

+ (void)_captureRAPUserAction:(int)a3 target:(int)a4 value:(id)a5 report:(id)a6 requestParameters:(id)a7 duration:(id)a8
{
  id v11 = a7;
  id v23 = a8;
  id v22 = a5;
  double v12 = [a6 combinedUserPath];
  if ([v12 nativePathsCount]) {
    unsigned int v21 = [v12 nativePathAtIndex:0];
  }
  else {
    unsigned int v21 = 0;
  }
  double v13 = [v11 submissionParameters];
  id v14 = [v13 type];

  double v15 = +[RAPWebBundleDownloadManager sharedInstance];
  uint64_t v26 = 0;
  double v16 = [v15 loadWebBundleManifestWithError:&v26];

  v17 = GEOConfigGetString();
  id v18 = GEOConfigGetString();
  v19 = [v12 webPaths];
  v20 = [v16 version];
  +[GEOAPPortal captureRAPUserAction:a3 target:a4 value:v22 entryPoint:v21 feedbackType:v14 feedbackFieldOptionKeys:v19 rapServerManifestVersion:v20 duration:v23 rapABManifestVersion:v17 rapAPBranchId:v18];
}

+ (id)_requestParametersFromReport:(id)a3
{
  id v3 = [a3 newFeedbackRequestParameters];
  uint64_t v4 = [v3 submissionParameters];
  [v4 setFeedbackType];

  return v3;
}

+ (int)_targetFromReport:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 initialQuestion];
    int v7 = 32;
    switch((unint64_t)[v6 questionType])
    {
      case 1uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
        break;
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0x1CuLL:
        int v7 = 35;
        break;
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
        int v7 = 62;
        break;
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
        int v7 = 63;
        break;
      case 0x15uLL:
      case 0x16uLL:
        int v7 = 43;
        break;
      case 0x17uLL:
        int v7 = 34;
        break;
      case 0x1DuLL:
        int v7 = 61;
        break;
      default:

        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    id v6 = +[RAPAnalyticsManager _requestParametersFromReport:v3];
    uint64_t v8 = [v6 submissionParameters];
    id v9 = [v8 type];

    int v7 = +[RAPAnalyticsManager _targetFromFeedbackType:v9];
  }

  return v7;
}

+ (int)_targetFromFeedbackType:(int)a3
{
  if ((a3 - 2) > 0x13) {
    return 0;
  }
  else {
    return dword_100F74188[a3 - 2];
  }
}

+ (id)_valueFromReport:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 initialQuestion];
    int v7 = (char *)[v6 questionType];
    if ((unint64_t)(v7 - 13) > 7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = off_101323F48[(void)(v7 - 13)];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end