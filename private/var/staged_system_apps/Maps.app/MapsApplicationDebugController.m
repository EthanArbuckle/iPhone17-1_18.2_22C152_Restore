@interface MapsApplicationDebugController
+ (id)navigationDestinationTitle;
- (void)_promptForRestart;
- (void)_requestRouteWithWaypoints:(id)a3 traits:(id)a4 completion:(id)a5;
- (void)_searchForWaypointsWithCompletion:(id)a3;
- (void)addAppUISectionTo:(id)a3;
- (void)addAutocompleteSettingsTo:(id)a3;
- (void)addCarPlaySectionTo:(id)a3;
- (void)addChromeSettingsTo:(id)a3;
- (void)addCollectionSettingsTo:(id)a3;
- (void)addCoreRecentsTo:(id)a3;
- (void)addDavisSettingsTo:(id)a3;
- (void)addDoomSettingsTo:(id)a3;
- (void)addEnhancedBusinessSettingsTo:(id)a3;
- (void)addFeaturesSectionTo:(id)a3;
- (void)addFindMyCarSettingsTo:(id)a3;
- (void)addHikingSettingsTo:(id)a3;
- (void)addImpressionLoggingSettingsTo:(id)a3;
- (void)addLPRSettingsTo:(id)a3;
- (void)addLookAroundSettingsTo:(id)a3;
- (void)addMFDSettingsTo:(id)a3;
- (void)addMapsHomeSettingsTo:(id)a3;
- (void)addMapsResetLaunchAlertsTo:(id)a3;
- (void)addMapsSuggestionsSettingsTo:(id)a3;
- (void)addOthersTo:(id)a3;
- (void)addPoisInjectionSettingsTo:(id)a3;
- (void)addRoutePlanningSettingsTo:(id)a3;
- (void)addScreenshot2SettingsTo:(id)a3;
- (void)addSearchSettingsTo:(id)a3;
- (void)addShareETASettingsTo:(id)a3;
- (void)addSmartCardsSettingsTo:(id)a3;
- (void)addTipKitSettingsTo:(id)a3;
- (void)addTransitSettingsTo:(id)a3;
- (void)addUGCSettingsTo:(id)a3;
- (void)addVisualEffectSettingsTo:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)prepareContent;
- (void)promptCLReset;
@end

@implementation MapsApplicationDebugController

+ (id)navigationDestinationTitle
{
  return @"Maps";
}

- (void)addVisualEffectSettingsTo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C8C83C;
  v6[3] = &unk_1012E7EF8;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addSectionWithTitle:0 content:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)addAppUISectionTo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C8CC44;
  v6[3] = &unk_1012FAE80;
  objc_copyWeak(&v7, &location);
  void v6[4] = self;
  id v5 = [v4 addNavigationRowWithTitle:@"App UI" viewControllerContent:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)addChromeSettingsTo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C8D57C;
  v4[3] = &unk_1012F1368;
  v4[4] = self;
  id v3 = [a3 addNavigationRowWithTitle:@"Chrome" viewControllerContent:v4];
}

- (void)_promptForRestart
{
  id v5 = objc_alloc_init((Class)UIAlertController);
  [v5 setTitle:@"This change will be effective once Maps restarts"];
  id v3 = +[UIAlertAction actionWithTitle:@"Later" style:1 handler:0];
  [v5 addAction:v3];

  id v4 = +[UIAlertAction actionWithTitle:@"Quit Maps" style:2 handler:&stru_10131DD68];
  [v5 addAction:v4];

  [(MapsApplicationDebugController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)addCarPlaySectionTo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C8FDBC;
  v6[3] = &unk_1012FB070;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addNavigationRowWithTitle:@"CarPlay" viewControllerContent:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)addMapsHomeSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Maps Home" viewControllerContent:&stru_10131EDE8];
}

- (void)addDoomSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"DooM" viewControllerContent:&stru_10131EE48];
}

- (void)addTransitSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Transit" viewControllerContent:&stru_10131EF08];
}

- (void)addMapsSuggestionsSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Maps Suggestions" viewControllerContent:&stru_10131F0E8];
}

- (void)addTipKitSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"TipKit" viewControllerContent:&stru_10131F1C8];
}

- (void)addFindMyCarSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Find My Car" viewControllerContent:&stru_10131F208];
}

- (void)addPoisInjectionSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Personalized Maps" viewControllerContent:&stru_10131F2C8];
}

- (void)addAutocompleteSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Autocomplete" viewControllerContent:&stru_10131F408];
}

- (void)addSearchSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Search" viewControllerContent:&stru_10131F4C8];
}

- (void)addFeaturesSectionTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Others" viewControllerContent:&stru_10131F568];
}

- (void)addCoreRecentsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"CoreRecents" viewControllerContent:&stru_10131F648];
}

- (void)addMapsResetLaunchAlertsTo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C996AC;
  v4[3] = &unk_1012F1368;
  v4[4] = self;
  id v3 = [a3 addNavigationRowWithTitle:@"Launch Alerts" viewControllerContent:v4];
}

- (void)promptCLReset
{
  id v3 = +[UIAlertController alertControllerWithTitle:@"Reset CoreLocation Auth?" message:@"Resetting CL Auth will immediately trigger all necessary launch alerts/prompts" preferredStyle:1];
  id v4 = +[UIAlertAction actionWithTitle:@"Reset" style:1 handler:&stru_10131F828];
  [v3 addAction:v4];

  id v5 = +[UIAlertAction actionWithTitle:@"Reset and Quit" style:1 handler:&stru_10131F848];
  [v3 addAction:v5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C9A230;
  v8[3] = &unk_1012E6DE0;
  id v9 = v3;
  id v6 = v3;
  id v7 = +[UIAlertAction actionWithTitle:@"Don't Reset CL" style:1 handler:v8];
  [v6 addAction:v7];

  [(MapsApplicationDebugController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)addOthersTo:(id)a3
{
  id v6 = a3;
  id v3 = [v6 addNavigationRowWithTitle:@"Location Simulation" viewControllerContent:&stru_10131F868];
  id v4 = [v6 addNavigationRowWithTitle:@"Routing Apps" viewControllerContent:&stru_10131F908];
  id v5 = [v6 addNavigationRowWithTitle:@"Performance throttling" viewControllerContent:&stru_10131F948];
}

- (void)addLookAroundSettingsTo:(id)a3
{
  id v6 = a3;
  id v3 = +[GEOResourceManifestManager modernManager];
  unsigned int v4 = [v3 isMuninEnabled];

  if (v4) {
    id v5 = [v6 addNavigationRowWithTitle:@"Look Around" viewControllerContent:&stru_10131F9C8];
  }
}

- (void)addCollectionSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Guides" viewControllerContent:&stru_10131FA08];
}

- (void)addShareETASettingsTo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C9A9F0;
  v4[3] = &unk_1012F1368;
  v4[4] = self;
  id v3 = [a3 addNavigationRowWithTitle:@"Share ETA" viewControllerContent:v4];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  if (self->_shareTripContactPicker == a3)
  {
    id v5 = +[MSPSharedTripContact contactsFromCNContact:a4];
    id v6 = [v5 firstObject];

    id v7 = +[MSPSharedTripService sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C9C660;
    v10[3] = &unk_10131FD18;
    id v11 = v6;
    v12 = self;
    id v8 = v6;
    [v7 startSharingWithContact:v8 completion:v10];

    shareTripContactPicker = self->_shareTripContactPicker;
    self->_shareTripContactPicker = 0;
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  unsigned int v4 = (CNContactPickerViewController *)a3;
  if (self->_shareTripContactPicker == v4)
  {
    self->_shareTripContactPicker = 0;
    id v5 = v4;

    unsigned int v4 = v5;
  }
}

- (void)addScreenshot2SettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Screenshot 2.0" viewControllerContent:&stru_10131FD38];
}

- (void)addRoutePlanningSettingsTo:(id)a3
{
  id v4 = a3;
  if (qword_101610D68 != -1) {
    dispatch_once(&qword_101610D68, &stru_10131FD78);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C9CA08;
  v6[3] = &unk_1012F1368;
  void v6[4] = self;
  id v5 = [v4 addNavigationRowWithTitle:@"Route Planning" viewControllerContent:v6];
}

- (void)_searchForWaypointsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)MKLocalSearchRequest);
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 stringForKey:@"__internal_ResumeRouteTestSearchQuery"];
  id v8 = [v5 initWithNaturalLanguageQuery:v7];

  id v9 = [objc_alloc((Class)MKLocalSearch) initWithRequest:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C9E0D8;
  v11[3] = &unk_10131FF58;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v9 startWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_requestRouteWithWaypoints:(id)a3 traits:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [v8 copy];
  id v12 = +[NanoRoutePlanningRequest requestWithWaypoints:v11 viaTransportType:0 traits:v9 companionRouteContext:0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C9E444;
  v15[3] = &unk_10131FF80;
  objc_copyWeak(&v18, &location);
  id v13 = v8;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  +[NanoRoutePlanningSession processRequest:v12 withCompletion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)addHikingSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Hiking" viewControllerContent:&stru_10131FFA0];
}

- (void)addDavisSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Cycling" viewControllerContent:&stru_101320020];
}

- (void)addEnhancedBusinessSettingsTo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C9EE1C;
  v6[3] = &unk_1012FB070;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addNavigationRowWithTitle:@"Enhanced Business Place Card" viewControllerContent:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)addImpressionLoggingSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Impression Logging" viewControllerContent:&stru_101320160];
}

- (void)addSmartCardsSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Maps 100" viewControllerContent:&stru_1013201E0];
}

- (void)addUGCSettingsTo:(id)a3
{
  id v4 = a3;
  id v5 = [[MapsUGCEnvironmentSectionController alloc] initWithSubmissionURL:53 lookupURL:43];
  ugcEnvironmentController = self->_ugcEnvironmentController;
  self->_ugcEnvironmentController = v5;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C9F568;
  v8[3] = &unk_1012FB070;
  objc_copyWeak(&v9, &location);
  id v7 = [v4 addNavigationRowWithTitle:@"User Generated Content" viewControllerContent:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addLPRSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Alberta" viewControllerContent:&stru_1013204E0];
}

- (void)addMFDSettingsTo:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Feature Discovery" viewControllerContent:&stru_101320560];
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100CA03DC;
  v10[3] = &unk_1012E7EF8;
  objc_copyWeak(&v11, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100CA0498;
  v8[3] = &unk_1012E7EF8;
  objc_copyWeak(&v9, &location);
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CA0734;
  v6[3] = &unk_1012E7EF8;
  objc_copyWeak(&v7, &location);
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCardSearchQuery, 0);
  objc_storeStrong((id *)&self->_ugcEnvironmentController, 0);

  objc_storeStrong((id *)&self->_shareTripContactPicker, 0);
}

@end