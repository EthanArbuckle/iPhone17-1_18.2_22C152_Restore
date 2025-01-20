@interface MapsAnalyticStateProvider
+ (OS_dispatch_queue)serialQueue;
+ (void)clearSharedState;
+ (void)setUserProfileAvailableActions:(id)a3;
+ (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3;
+ (void)updateButtonsInformationAQI:(BOOL)a3 weather:(BOOL)a4;
+ (void)updateButtonsInformationLookAround:(BOOL)a3;
+ (void)updateCycleOptionsInformation:(id)a3;
+ (void)updateDriveOptionsInformation:(id)a3;
+ (void)updateLayoutInformation:(id)a3;
+ (void)updateLocaleInformation:(id)a3;
+ (void)updateMapSettingsInformationLabels:(BOOL)a3 traffic:(BOOL)a4;
+ (void)updateMapViewInformation:(id)a3;
+ (void)updateMapViewViewMode:(int64_t)a3;
+ (void)updateNotificationsStateInformation;
+ (void)updatePreciseLocationInformation;
+ (void)updateSettingsInformation;
+ (void)updateSuggestionSearchInformation:(id)a3 searchText:(id)a4 searchIndex:(int)a5 searchfieldType:(int)a6 suggestionsAcSequenceNumber:(int)a7;
+ (void)updateTouristInformation;
+ (void)updateWalkOptionsInformation:(id)a3;
+ (void)updateiCloudStateInformation;
@end

@implementation MapsAnalyticStateProvider

+ (void)updateTouristInformation
{
  v2 = [a1 serialQueue];
  dispatch_async(v2, &stru_101313660);
}

+ (void)updateNotificationsStateInformation
{
  v2 = +[UNUserNotificationCenter currentNotificationCenter];
  id v5 = [v2 notificationSettings];

  BOOL v3 = [v5 authorizationStatus] == (id)2 || [v5 authorizationStatus] == (id)3;
  v4 = +[GEOAPSharedStateData sharedData];
  [v4 setMapSettingsNotificationsEnabled:v3];
}

+ (void)updateMapSettingsInformationLabels:(BOOL)a3 traffic:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = +[GEOAPSharedStateData sharedData];
  [v6 setMapSettingsLabelEnabled:v5];

  id v7 = +[GEOAPSharedStateData sharedData];
  [v7 setMapSettingsTrafficEnabled:v4];
}

+ (void)updateButtonsInformationAQI:(BOOL)a3 weather:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = +[GEOAPSharedStateData sharedData];
  [v6 setMapUiShownAqiShown:v5];

  id v7 = +[GEOAPSharedStateData sharedData];
  [v7 setMapUiShownWeatherShown:v4];
}

+ (void)updatePreciseLocationInformation
{
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned int v3 = [v2 isLocationServicesAuthorizationNeeded];

  BOOL v4 = +[MKLocationManager sharedLocationManager];
  unsigned int v5 = [v4 isLocationServicesApproved];

  v6 = +[MKLocationManager sharedLocationManager];
  unsigned int v7 = [v6 isAuthorizedForPreciseLocation];

  if (v7) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = 3;
  }
  if (v3 | v5 ^ 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = +[GEOAPSharedStateData sharedData];
  [v10 setMapSettingsLocationPrecisionType:v9];
}

+ (void)updateLocaleInformation:(id)a3
{
  id v11 = a3;
  BOOL v4 = +[MNNavigationService sharedService];
  unsigned int v5 = [v4 currentVoiceLanguage];

  if ([v5 length])
  {
    v6 = +[GEOAPSharedStateData sharedData];
    [v6 setDeviceOutputLocale:v5];
  }
  if ([v11 length])
  {
    unsigned int v7 = +[GEOAPSharedStateData sharedData];
    [v7 setDeviceInputLocale:v11];
  }
  unsigned int v8 = +[NSUserDefaults standardUserDefaults];
  [a1 updateDriveOptionsInformation:v8];

  uint64_t v9 = +[NSUserDefaults standardUserDefaults];
  [a1 updateWalkOptionsInformation:v9];

  id v10 = +[NSUserDefaults standardUserDefaults];
  [a1 updateCycleOptionsInformation:v10];
}

+ (void)updateMapViewInformation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapType];
  int v6 = 1;
  switch((unint64_t)v5)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 3uLL:
      int v6 = 2;
      break;
    case 2uLL:
    case 4uLL:
      int v6 = 3;
      break;
    default:
      if (v5 != (id)102)
      {
        if (v5 == (id)104) {
          int v6 = 4;
        }
        else {
          int v6 = 0;
        }
      }
      break;
  }
  unsigned int v7 = [v4 mapRegion];
  id v8 = [v7 copy];

  [v4 _zoomLevel];
  uint64_t v10 = v9;
  [v4 _vectorKitTileZoomLevelForMapKitZoomLevel:];
  uint64_t v12 = v11;
  LOBYTE(v7) = [v4 hasUserLocation];
  unsigned __int8 v13 = [v4 isUserLocationVisible];
  v14 = [v4 camera];
  [v14 pitch];
  uint64_t v16 = v15;

  v17 = [a1 serialQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000480B8;
  v20[3] = &unk_101313640;
  int v26 = v6;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  char v27 = (char)v7;
  unsigned __int8 v28 = v13;
  uint64_t v25 = v16;
  id v21 = v8;
  id v22 = v4;
  id v18 = v4;
  id v19 = v8;
  dispatch_async(v17, v20);
}

+ (OS_dispatch_queue)serialQueue
{
  if (qword_1016103A0 != -1) {
    dispatch_once(&qword_1016103A0, &stru_1013135F0);
  }
  v2 = (void *)qword_101610398;

  return (OS_dispatch_queue *)v2;
}

+ (void)updateCycleOptionsInformation:(id)a3
{
  id v3 = a3;
  uint64_t v10 = [[CyclePreferences alloc] initWithDefaults:v3];

  BOOL v4 = [(CyclePreferences *)v10 avoidHills];
  id v5 = +[GEOAPSharedStateData sharedData];
  [v5 setMapSettingsAvoidHills:v4];

  BOOL v6 = [(CyclePreferences *)v10 avoidBusyRoads];
  unsigned int v7 = +[GEOAPSharedStateData sharedData];
  [v7 setMapSettingsAvoidBusyRoads:v6];

  BOOL v8 = [(CyclePreferences *)v10 ebike];
  uint64_t v9 = +[GEOAPSharedStateData sharedData];
  [v9 setMapSettingsEBike:v8];
}

+ (void)updateWalkOptionsInformation:(id)a3
{
  id v3 = a3;
  uint64_t v10 = [[WalkPreferences alloc] initWithDefaults:v3];

  BOOL v4 = [(WalkPreferences *)v10 avoidHills];
  id v5 = +[GEOAPSharedStateData sharedData];
  [v5 setMapSettingsWalkingAvoidHills:v4];

  BOOL v6 = [(WalkPreferences *)v10 avoidBusyRoads];
  unsigned int v7 = +[GEOAPSharedStateData sharedData];
  [v7 setMapSettingsWalkingAvoidBusyRoads:v6];

  BOOL v8 = [(WalkPreferences *)v10 avoidStairs];
  uint64_t v9 = +[GEOAPSharedStateData sharedData];
  [v9 setMapSettingsWalkingAvoidStairs:v8];
}

+ (void)updateSettingsInformation
{
  id v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 isFindMyCarAllowed];

  unint64_t v5 = GEOGetUserTransportTypePreference();
  if (v5 < 5) {
    uint64_t v6 = (v5 + 1);
  }
  else {
    uint64_t v6 = 0;
  }
  id v33 = +[NSUserDefaults standardUserDefaults];
  uint64_t BOOL = GEOConfigGetBOOL();
  BOOL v8 = [[AudioPreferences alloc] initWithDefaults:v33];
  uint64_t v9 = +[GEOAPSharedStateData sharedData];
  uint64_t v10 = (char *)[(AudioPreferences *)v8 drivingVoiceGuidance] + 1;
  if ((unint64_t)v10 >= 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  [v9 setNavVoiceGuidanceLevel:v11 forTransportMode:1];

  uint64_t v12 = +[GEOAPSharedStateData sharedData];
  unsigned __int8 v13 = (char *)[(AudioPreferences *)v8 walkingVoiceGuidance] + 1;
  if ((unint64_t)v13 >= 4) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  [v12 setNavVoiceGuidanceLevel:v14 forTransportMode:2];

  uint64_t v15 = +[GEOAPSharedStateData sharedData];
  uint64_t v16 = (char *)[(AudioPreferences *)v8 cyclingVoiceGuidance] + 1;
  if ((unint64_t)v16 >= 4) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  [v15 setNavVoiceGuidanceLevel:v17 forTransportMode:5];

  id v18 = +[GEOAPSharedStateData sharedData];
  [v18 setMapSettingsPauseSpokenAudioEnabled:BOOL];

  id v19 = +[GEOAPSharedStateData sharedData];
  [v19 setMapSettingsFindMyCarEnabled:v4];

  v20 = +[GEOAPSharedStateData sharedData];
  [v20 setMapSettingsTransportMode:v6];

  uint64_t v21 = GEOConfigGetBOOL();
  id v22 = +[GEOAPSharedStateData sharedData];
  [v22 setMapSettingsHeadingEnabled:v21];

  uint64_t v23 = GEOConfigGetBOOL();
  uint64_t v24 = +[GEOAPSharedStateData sharedData];
  [v24 setMapSettingsSpeedLimitEnabled:v23];

  [a1 updateDriveOptionsInformation:v33];
  [a1 updateWalkOptionsInformation:v33];
  [a1 updateCycleOptionsInformation:v33];
  id v25 = +[MapsSuggestionsSiri isEnabled];
  int v26 = +[GEOAPSharedStateData sharedData];
  [v26 setSuggestionsSiriEnabled:v25];

  if (qword_1016103B0 != -1) {
    dispatch_once(&qword_1016103B0, &stru_1013136A0);
  }
  char v27 = [(id)qword_1016103A8 path];
  unsigned __int8 v28 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v28)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v28 BOOLValue];
      GEOConfigSetBOOL();
    }
    v29 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v29 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id v30 = [v28 BOOLValue];
  }
  else
  {
    id v30 = (id)GEOConfigGetBOOL();
  }
  id v31 = v30;

  v32 = +[GEOAPSharedStateData sharedData];
  [v32 setMapSettingsIsHandsFreeProfileEnabled:v31];

  [a1 updateiCloudStateInformation];
  [a1 updateNotificationsStateInformation];
}

+ (void)updateLayoutInformation:(id)a3
{
  id v34 = a3;
  id v3 = (char *)[v34 containerStyle];
  id v4 = [v34 currentViewController];
  unint64_t v5 = [v4 cardPresentationController];
  uint64_t v6 = (char *)[v5 containeeLayout];

  if ((unint64_t)(v6 - 1) > 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_100F72F00[(void)(v6 - 1)];
  }
  BOOL v8 = +[GEOAPSharedStateData sharedData];
  [v8 setMapUiLayoutInfo:v7];

  if ((unint64_t)(v3 - 1) > 5) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = dword_100F72F14[(void)(v3 - 1)];
  }
  uint64_t v10 = +[GEOAPSharedStateData sharedData];
  [v10 setMapUiLayoutStyle:v9];

  uint64_t v11 = [v34 view];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = +[GEOAPSharedStateData sharedData];
  [v20 setLandscape:v19 < v17];

  unint64_t v21 = +[UIApplication _maps_numberOfApplicationScenes];
  id v22 = +[GEOAPSharedStateData sharedData];
  [v22 setMapUiNumberOfMapsWindows:v21];

  v36.origin.x = v13;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  double Height = CGRectGetHeight(v36);
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  double v24 = Height * CGRectGetWidth(v37);
  id v25 = [v34 view];
  int v26 = [v25 window];
  char v27 = [v26 screen];

  [v27 bounds];
  double v28 = CGRectGetHeight(v38);
  [v27 bounds];
  double v29 = v24 / (v28 * CGRectGetWidth(v39));
  if (v29 <= 0.5) {
    unsigned int v30 = 3;
  }
  else {
    unsigned int v30 = 2;
  }
  if (v29 < 0.9 && v29 > 0.7) {
    unsigned int v30 = 1;
  }
  if (v29 <= 0.9) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = 0;
  }
  id v33 = +[GEOAPSharedStateData sharedData];
  [v33 setWindowSize:v32];
}

+ (void)updateDriveOptionsInformation:(id)a3
{
  id v3 = a3;
  BOOL v8 = [[DrivePreferences alloc] initWithDefaults:v3];

  BOOL v4 = [(DrivePreferences *)v8 avoidTolls];
  unint64_t v5 = +[GEOAPSharedStateData sharedData];
  [v5 setMapSettingsAvoidTolls:v4];

  BOOL v6 = [(DrivePreferences *)v8 avoidHighways];
  uint64_t v7 = +[GEOAPSharedStateData sharedData];
  [v7 setMapSettingsAvoidHighways:v6];
}

+ (void)updateButtonsInformationLookAround:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[GEOAPSharedStateData sharedData];
  [v4 setLookAroundEntryIconShown:v3];
}

+ (void)updateiCloudStateInformation
{
  id v2 = +[MapsSyncService shared];
  [v2 cloudKitSyncAllowedWithCompletionHandler:&stru_101313680];
}

+ (void)clearSharedState
{
  id v2 = +[GEOAPSharedStateData sharedData];
  [v2 setMapLaunchSourceAppId:0];

  BOOL v3 = +[GEOAPSharedStateData sharedData];
  [v3 setMapLaunchLaunchUri:0];

  id v4 = +[GEOAPSharedStateData sharedData];
  [v4 setMapLaunchReferringWebsite:0];

  unint64_t v5 = +[GEOAPSharedStateData sharedData];
  [v5 setMapLaunchIsHandoff:0];

  BOOL v6 = +[GEOAPSharedStateData sharedData];
  [v6 setMapLaunchSourceHandoffDevice:0];

  id v7 = +[GEOAPSharedStateData sharedData];
  [v7 setHasMapLaunchAction:0];
}

+ (void)updateMapViewViewMode:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    int v3 = 0;
  }
  else {
    int v3 = dword_100F72EE0[a3];
  }
  id v4 = [a1 serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009D4BF4;
  block[3] = &unk_101302D30;
  int v6 = v3;
  dispatch_async(v4, block);
}

+ (void)updateSuggestionSearchInformation:(id)a3 searchText:(id)a4 searchIndex:(int)a5 searchfieldType:(int)a6 suggestionsAcSequenceNumber:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  CGFloat v13 = +[GEOAPSharedStateData sharedData];
  [v13 setSuggestionsSearchString:v12];
  [v13 setSuggestionsSelectedIndex:v9];
  [v13 setSuggestionsSearchFieldType:v8];
  [v13 setSuggestionsAcSequenceNumber:v7];
  [v13 clearSuggestionsDisplayedResults];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      double v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [v13 addSuggestionsDisplayedResults:*(void *)(*((void *)&v19 + 1) + 8 * (void)v18) v19];
        double v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

+ (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[GEOAPSharedStateData sharedData];
  [v4 setUserProfileUserIsLoggedIntoICloud:v3];
}

+ (void)setUserProfileAvailableActions:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPSharedStateData sharedData];
  [v4 setUserProfileAvailableActions:v3];
}

@end