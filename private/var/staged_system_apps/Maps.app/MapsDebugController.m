@interface MapsDebugController
+ (id)debug_createGEODaemonToMapsPushDaemonConnection;
+ (void)applyAllPendingDebugSettings;
+ (void)debug_withMapsPushDaemon:(id)a3 errorHandler:(id)a4;
- (MapsDebugController)init;
- (void)_addAuthTokenSectionTo:(id)a3;
- (void)_addCopyDiagnosticsToSection:(id)a3;
- (void)_addFeatureFlagsSettingsToSection:(id)a3;
- (void)_addGeoServicesSettingsToSection:(id)a3;
- (void)_addLoggingEntriesToSection:(id)a3;
- (void)_addMapsBundleInfoSection;
- (void)_addMiscellaneousSection;
- (void)_addRadarEntriesToSection:(id)a3;
- (void)_addServerConfigSettingsToSection:(id)a3;
- (void)_addStateSnapshotToSection:(id)a3;
- (void)_addTapToRadarAllowAttachmentsOptionToSection:(id)a3;
- (void)_rebuildAuthSections;
- (void)_rebuildOfflineSections;
- (void)dealloc;
- (void)mapsAuthTokenRequestDidFinish:(id)a3;
- (void)prepareContent;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4;
@end

@implementation MapsDebugController

+ (void)applyAllPendingDebugSettings
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v4 BOOLForKey:@"LogLocationStartStop"];
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 setLogStartStopLocationUpdates:v2];
}

- (MapsDebugController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsDebugController;
  id v2 = [(MapsDebugValuesViewController *)&v7 init];
  if (v2)
  {
    v3 = +[GEOResourceManifestManager modernManager];
    [v3 addTileGroupObserver:v2 queue:&_dispatch_main_q];

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_rebuildOfflineSections" name:GEOOfflineStateChangedNotification object:0];

    MapsFeature_AddDelegateListener();
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  GEOConfigRemoveDelegateListenerForAllKeys();
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MapsDebugController;
  [(MapsDebugValuesViewController *)&v5 dealloc];
}

- (void)_addGeoServicesSettingsToSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100AFADB4;
  v21[3] = &unk_1012E6708;
  objc_copyWeak(&v22, &location);
  id v5 = [v4 addNavigationRowWithTitle:@"Cell Data Saver" action:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AFAE2C;
  v19[3] = &unk_1012E6708;
  objc_copyWeak(&v20, &location);
  id v6 = [v4 addNavigationRowWithTitle:@"geod Request Counters" action:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100AFAEAC;
  v17[3] = &unk_1012E6708;
  objc_copyWeak(&v18, &location);
  id v7 = [v4 addNavigationRowWithTitle:@"Request Response Logs" action:v17];
  id v8 = [v4 addNavigationRowWithTitle:@"Placedata Cache" viewControllerContent:&stru_101317458];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100AFB01C;
  v15[3] = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  id v9 = [v4 addNavigationRowWithTitle:@"Data Subscriptions" action:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100AFB09C;
  v14[3] = &unk_1012F1368;
  v14[4] = self;
  id v10 = [v4 addNavigationRowWithTitle:@"Offline" viewControllerContent:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100AFB888;
  v12[3] = &unk_1012FB070;
  objc_copyWeak(&v13, &location);
  id v11 = [v4 addNavigationRowWithTitle:@"Analytics" viewControllerContent:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_addAuthTokenSectionTo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AFBD84;
  v6[3] = &unk_1012E7EF8;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addSectionWithTitle:@"Maps Auth Service Tokens" content:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_addFeatureFlagsSettingsToSection:(id)a3
{
  id v4 = a3;
  id v5 = self->_viewControllersToReloadOnAuthFinish;
  id v6 = self->_viewControllersToReloadOnTileGroupChange;
  featuresController = self->_featuresController;
  if (!featuresController)
  {
    id v8 = (GEOFeaturesController *)objc_alloc_init((Class)GEOFeaturesController);
    id v9 = self->_featuresController;
    self->_featuresController = v8;

    [(GEOFeaturesController *)self->_featuresController setDelegate:self];
    featuresController = self->_featuresController;
  }
  id v10 = featuresController;
  objc_initWeak(&location, self);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100AFC2F8;
  v19 = &unk_1013176B0;
  id v11 = v6;
  id v20 = v11;
  v12 = v5;
  v21 = v12;
  objc_copyWeak(&v24, &location);
  id v13 = v10;
  id v22 = v13;
  v23 = self;
  id v14 = [v4 addNavigationRowWithTitle:@"Authenticated Feature Flags" viewControllerContent:&v16];
  id v15 = [v4 addNavigationRowForViewControllerClass:objc_opt_class() v16, v17, v18, v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_addServerConfigSettingsToSection:(id)a3
{
  id v4 = a3;
  id v5 = self->_viewControllersToReloadOnTileGroupChange;
  id v6 = self->_viewControllersToReloadOnAuthFinish;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100AFC9D0;
  v12[3] = &unk_101317AF8;
  id v7 = v6;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  objc_copyWeak(&v16, &location);
  id v15 = self;
  id v9 = [v4 addNavigationRowWithTitle:@"Server Config" viewControllerContent:v12];
  viewControllersToReloadOnTileGroupChange = self->_viewControllersToReloadOnTileGroupChange;
  self->_viewControllersToReloadOnTileGroupChange = v8;
  id v11 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_addMiscellaneousSection
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v3 getDevices];

  if ([v5 count]) {
    id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Miscellaneous" content:&stru_101317B18];
  }
}

- (void)_addStateSnapshotToSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AFEB38;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addButtonRowWithTitle:@"Capture State Snapshot" action:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_addCopyDiagnosticsToSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AFED84;
  v6[3] = &unk_1012E6690;
  objc_copyWeak(&v7, &location);
  void v6[4] = self;
  id v5 = [v4 addButtonRowWithTitle:@"Copy Diagnostics" action:v6];
  [v5 setSubtitle:@"Copy diagnostic information to the pasteboard."];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_addTapToRadarAllowAttachmentsOptionToSection:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Tap-To-Radar" viewControllerContent:&stru_101317B58];
}

- (void)_addRadarEntriesToSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100AFF5AC;
  v12 = &unk_1012E6708;
  objc_copyWeak(&v13, &location);
  id v5 = [v4 addButtonRowWithTitle:@"File a Radar" action:&v9];
  id v6 = +[GEOPlatform sharedPlatform];
  unsigned int v7 = [v6 isInternalInstall];

  if (v7)
  {
    NSClassFromString(@"MapsRecordAnIssueDebugController");
    id v8 = [v4 addNavigationRowForViewControllerClass:objc_opt_class()];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_addLoggingEntriesToSection:(id)a3
{
  id v3 = [a3 addNavigationRowWithTitle:@"Logging" viewControllerContent:&stru_101317BD8];
}

- (void)_addMapsBundleInfoSection
{
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Maps Bundle Paths" content:&stru_101317C18];
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Bundle Versions" content:&stru_101317C98];
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  id v3 = +[NSMutableSet set];
  viewControllersToReloadOnOfflineChange = self->_viewControllersToReloadOnOfflineChange;
  self->_viewControllersToReloadOnOfflineChange = v3;

  id v5 = self->_viewControllersToReloadOnOfflineChange;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B0018C;
  v18[3] = &unk_101317E08;
  id v6 = v5;
  v19 = v6;
  objc_copyWeak(&v20, &location);
  id v7 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Main Components" content:v18];
  id v8 = +[NSMutableSet set];
  viewControllersToReloadOnAuthFinish = self->_viewControllersToReloadOnAuthFinish;
  self->_viewControllersToReloadOnAuthFinish = v8;

  uint64_t v10 = +[NSMutableSet set];
  viewControllersToReloadOnTileGroupChange = self->_viewControllersToReloadOnTileGroupChange;
  self->_viewControllersToReloadOnTileGroupChange = v10;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B0067C;
  v16[3] = &unk_1012E7EF8;
  objc_copyWeak(&v17, &location);
  id v12 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Configuration" content:v16];
  [(MapsDebugController *)self _addMiscellaneousSection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B00714;
  v14[3] = &unk_1012E7EF8;
  objc_copyWeak(&v15, &location);
  id v13 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Diagnostics" content:v14];
  [(MapsDebugController *)self _addBuildInfoSection];
  [(MapsDebugController *)self _addMapsBundleInfoSection];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableSet *)self->_viewControllersToReloadOnTileGroupChange copy];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) rebuildSections];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)mapsAuthTokenRequestDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  [v5 removeMapsAuthDidFinishObserver:self];

  uint64_t v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:GEOMapsAuthRequestTypeKey];

  long long v8 = [v4 userInfo];
  long long v9 = [v8 objectForKeyedSubscript:@"success"];
  unsigned __int8 v10 = [v9 BOOLValue];

  if ([v7 isEqualToString:GEOMapsAuthEnvironmentSwitch]) {
    goto LABEL_17;
  }
  long long v11 = [v4 userInfo];
  id v12 = [v11 objectForKeyedSubscript:GEOMapsAuthFailReasonKey];
  id v13 = [v12 integerValue];

  if (v10)
  {
    CFStringRef v14 = @"Successful Auth Request";
    id v15 = @"Your auth request succeeded.";
    goto LABEL_8;
  }
  if ((unint64_t)v13 + 1 > 7)
  {
    id v15 = 0;
    goto LABEL_7;
  }
  if (((1 << (v13 + 1)) & 0xB7) != 0)
  {
    id v15 = +[NSString stringWithFormat:@"Your auth request failed for an unexpected reason (%d).", v13];
LABEL_7:
    CFStringRef v14 = @"Failed Auth Request";
    goto LABEL_8;
  }
  CFStringRef v14 = @"Failed Auth Request";
  if (v13 == (id)2) {
    id v15 = @"Could not renew a non-existent token. Try performing an Apple Connect auth first.";
  }
  else {
    id v15 = @"Your auth request failed. Make sure your environment has the proper URL(s) for authentication.";
  }
LABEL_8:
  id v16 = +[UIAlertController alertControllerWithTitle:v14 message:v15 preferredStyle:1];
  id v17 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:&stru_101317E28];
  [v16 addAction:v17];
  if ((v10 & 1) == 0
    && (([v7 isEqualToString:GEOMapsAuthMRT] & 1) != 0
     || [v7 isEqualToString:GEOMapsAuthFeatureFlags])
    && v13 != (id)5)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100B00C48;
    v23[3] = &unk_1012E6DE0;
    v23[4] = self;
    id v18 = +[UIAlertAction actionWithTitle:@"Try with AppleConnect" style:0 handler:v23];
    [v16 addAction:v18];
  }
  v19 = [(MapsDebugController *)self presentedViewController];

  if (v19)
  {
    id v20 = [(MapsDebugController *)self presentedViewController];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100B00CB4;
    v21[3] = &unk_1012E5D58;
    void v21[4] = self;
    id v22 = v16;
    [v20 dismissViewControllerAnimated:1 completion:v21];
  }
  else
  {
    [(MapsDebugController *)self presentViewController:v16 animated:1 completion:0];
  }

LABEL_17:
  [(MapsDebugController *)self _rebuildAuthSections];
}

- (void)_rebuildAuthSections
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableSet *)self->_viewControllersToReloadOnAuthFinish copy];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) rebuildSections];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_rebuildOfflineSections
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableSet *)self->_viewControllersToReloadOnOfflineChange copy];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) rebuildSections];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v3 = GeoServicesConfig_MapsAuthToken == a3.var0
    && (void *)*((void *)&GeoServicesConfig_MapsAuthToken + 1) == a3.var1;
  if (v3
    || (GeoServicesConfig_MapsRefreshToken == a3.var0
      ? (BOOL v4 = (void *)*((void *)&GeoServicesConfig_MapsRefreshToken + 1) == a3.var1)
      : (BOOL v4 = 0),
        v4))
  {
    [(MapsDebugController *)self _rebuildAuthSections];
  }
}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  if (a3.var0.var0 == MapsFeaturesConfig_StandaloneWatchOffline
    && a3.var0.var1 == (void *)*((void *)&MapsFeaturesConfig_StandaloneWatchOffline + 1))
  {
    [(MapsDebugController *)self _rebuildOfflineSections];
  }
}

+ (id)debug_createGEODaemonToMapsPushDaemonConnection
{
  if (qword_101610810 != -1) {
    dispatch_once(&qword_101610810, &stru_101317E48);
  }
  id v2 = (void *)qword_101610808;

  return v2;
}

+ (void)debug_withMapsPushDaemon:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  long long v7 = (void (**)(id, void *))a3;
  long long v8 = [a1 debug_createGEODaemonToMapsPushDaemonConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B01118;
  v11[3] = &unk_1012E76C0;
  id v12 = v6;
  id v9 = v6;
  long long v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  v7[2](v7, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresController, 0);
  objc_storeStrong((id *)&self->_offlineVersionMetadata, 0);
  objc_storeStrong((id *)&self->_viewControllersToReloadOnOfflineChange, 0);
  objc_storeStrong((id *)&self->_viewControllersToReloadOnAuthFinish, 0);

  objc_storeStrong((id *)&self->_viewControllersToReloadOnTileGroupChange, 0);
}

@end