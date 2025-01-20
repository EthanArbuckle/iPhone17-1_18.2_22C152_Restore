@interface RoutingAppsManager
+ (id)defaultManager;
- (RoutingAppLaunchRecord)routingAppLaunchRecord;
- (id)_appIdsStringWithApplicationProxies:(id)a3;
- (id)_installedApps;
- (void)_updateCoverageFileForAppProxy:(id)a3 libraryItem:(id)a4;
- (void)loadRelevantRoutingAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 completion:(id)a5;
- (void)recordAppLaunch:(id)a3;
- (void)setRoutingAppLaunchRecord:(id)a3;
- (void)updateCoverageFiles;
@end

@implementation RoutingAppsManager

+ (id)defaultManager
{
  if (qword_101610148 != -1) {
    dispatch_once(&qword_101610148, &stru_101303628);
  }
  v2 = (void *)qword_101610140;

  return v2;
}

- (RoutingAppLaunchRecord)routingAppLaunchRecord
{
  routingAppLaunchRecord = self->_routingAppLaunchRecord;
  if (!routingAppLaunchRecord)
  {
    v4 = +[PersistenceManager sharedManager];
    v5 = [v4 readRoutingAppLaunchRecord];
    v6 = self->_routingAppLaunchRecord;
    self->_routingAppLaunchRecord = v5;

    routingAppLaunchRecord = self->_routingAppLaunchRecord;
  }

  return routingAppLaunchRecord;
}

- (void)recordAppLaunch:(id)a3
{
  id v4 = a3;
  v5 = [(RoutingAppsManager *)self routingAppLaunchRecord];
  [v5 recordAppLaunch:v4];

  v6 = +[PersistenceManager sharedManager];
  id v16 = 0;
  unsigned __int8 v7 = [v6 writeRoutingAppLaunchRecord:v5 error:&v16];
  id v8 = v16;

  if ((v7 & 1) == 0) {
    sub_100B5AA24(@"Failed to save routing app updates: %@.", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
  }
}

- (id)_installedApps
{
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  v3 = [v2 directionsApplications];

  return v3;
}

- (id)_appIdsStringWithApplicationProxies:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_updateCoverageFileForAppProxy:(id)a3 libraryItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = [v6 valueForProperty:SSSoftwareLibraryItemPropertyTransitDataURL];
  if (v14)
  {
    long long v15 = [v6 ETagForAssetType:SSDownloadAssetTypeTransitMapsData];
    id v16 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100966838;
    block[3] = &unk_1012E85E0;
    id v19 = v14;
    id v20 = v15;
    id v21 = v5;
    id v22 = v6;
    id v17 = v15;
    dispatch_async(v16, block);
  }
  else
  {
    sub_100B5AA24(@"Warning: No routing coverage update URL for application: %@.", v7, v8, v9, v10, v11, v12, v13, 0);
  }
}

- (void)updateCoverageFiles
{
  id v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100966DA0;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)loadRelevantRoutingAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 completion:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  CLLocationDegrees v7 = a3.longitude;
  CLLocationDegrees v8 = a3.latitude;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(-32768, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100967210;
  v13[3] = &unk_101303650;
  CLLocationDegrees v15 = v8;
  CLLocationDegrees v16 = v7;
  CLLocationDegrees v17 = latitude;
  CLLocationDegrees v18 = longitude;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(v11, v13);
}

- (void)setRoutingAppLaunchRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end