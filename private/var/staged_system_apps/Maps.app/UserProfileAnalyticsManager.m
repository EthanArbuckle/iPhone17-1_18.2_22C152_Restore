@interface UserProfileAnalyticsManager
+ (void)captureAccountDidAppearWithAvailableActions:(id)a3 signedIntoICloud:(BOOL)a4;
+ (void)captureDisableTransitPreferenceForMode:(unint64_t)a3;
+ (void)captureEnableTransitPreferenceForMode:(unint64_t)a3;
+ (void)captureEnterAccountTapAction;
+ (void)captureExitAccountTapAction;
+ (void)captureExitRatingsHistoryTapAction;
+ (void)captureICloudSignInTapAction;
+ (void)capturePreferredDirectionsForTransportType:(int64_t)a3;
+ (void)captureRatingHistoryItemTapAction;
+ (void)captureSettingsAppTapAction;
+ (void)captureTapActionWithUserProfileLinkType:(int64_t)a3 availableActions:(id)a4 signedIntoICloud:(BOOL)a5;
+ (void)captureTravelPreferencesUserAction:(int)a3;
+ (void)captureTravelPreferencesUserAction:(int)a3 value:(id)a4;
@end

@implementation UserProfileAnalyticsManager

+ (void)captureEnterAccountTapAction
{
  +[GEOAPPortal captureUserAccountUserAction:201 target:8 value:0 signedIntoIcloud:0 possibleActionsReadBlock:0];

  +[GEOAPPortal captureUserAction:172 target:8 value:0];
}

+ (void)captureAccountDidAppearWithAvailableActions:(id)a3 signedIntoICloud:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v6 = +[NSNumber numberWithBool:v4];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100AB2208;
  v11 = &unk_1013165E0;
  v13 = v14;
  id v7 = v5;
  id v12 = v7;
  +[GEOAPPortal captureUserAccountUserAction:160 target:29 value:0 signedIntoIcloud:v6 possibleActionsReadBlock:&v8];

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 29, 0, v8, v9, v10, v11);
  _Block_object_dispose(v14, 8);
}

+ (void)captureTapActionWithUserProfileLinkType:(int64_t)a3 availableActions:(id)a4 signedIntoICloud:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = +[NSNumber numberWithBool:v5];
  switch(a3)
  {
    case 1:
      uint64_t v9 = 152;
      break;
    case 2:
      uint64_t v9 = 199;
      break;
    case 3:
      +[GEOAPPortal captureUserAction:164 target:29 value:0];
      uint64_t v9 = 178;
      break;
    case 4:
      uint64_t v9 = 179;
      break;
    case 5:
      +[GEOAPPortal captureUserAction:2109 target:29 value:0];
      uint64_t v9 = 166;
      break;
    case 6:
      uint64_t v9 = 203;
      break;
    case 7:
      uint64_t v9 = 380;
      +[GEOAPPortal captureUserAction:380 target:29 value:0];
      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AB2470;
  v11[3] = &unk_1013165E0;
  v13 = v14;
  id v10 = v7;
  id v12 = v10;
  +[GEOAPPortal captureUserAccountUserAction:v9 target:29 value:0 signedIntoIcloud:v8 possibleActionsReadBlock:v11];

  _Block_object_dispose(v14, 8);
}

+ (void)captureICloudSignInTapAction
{
}

+ (void)captureExitAccountTapAction
{
}

+ (void)captureExitRatingsHistoryTapAction
{
}

+ (void)captureRatingHistoryItemTapAction
{
}

+ (void)capturePreferredDirectionsForTransportType:(int64_t)a3
{
  if (unint64_t)a3 <= 4 && ((0x17u >> a3)) {
    +[GEOAPPortal captureUserAction:dword_100F734BC[a3] target:20 value:0];
  }
}

+ (void)captureTravelPreferencesUserAction:(int)a3 value:(id)a4
{
}

+ (void)captureTravelPreferencesUserAction:(int)a3
{
}

+ (void)captureDisableTransitPreferenceForMode:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0) {
    _[a1 captureTravelPreferencesUserAction:dword_100F734D0[v3]];
  }
}

+ (void)captureEnableTransitPreferenceForMode:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0) {
    _[a1 captureTravelPreferencesUserAction:dword_100F734F0[v3]];
  }
}

+ (void)captureSettingsAppTapAction
{
}

@end