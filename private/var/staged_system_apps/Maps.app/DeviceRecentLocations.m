@interface DeviceRecentLocations
+ (id)sharedInstance;
- (DeviceRecentLocations)init;
- (NSArray)recentLocations;
- (void)_locationManagerApprovalDidChange;
- (void)updateLocationsWithCompletionHandler:(id)a3;
@end

@implementation DeviceRecentLocations

- (DeviceRecentLocations)init
{
  v7.receiver = self;
  v7.super_class = (Class)DeviceRecentLocations;
  v2 = [(DeviceRecentLocations *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    locationsLock = v2->locationsLock;
    v2->locationsLock = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_locationManagerApprovalDidChange" name:MKLocationManagerApprovalDidChangeNotification object:0];

    [(DeviceRecentLocations *)v2 updateLocationsWithCompletionHandler:0];
  }
  return v2;
}

- (void)updateLocationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->deviceLocations)
  {
    v5 = (GEORecentLocations *)objc_alloc_init((Class)GEORecentLocations);
    deviceLocations = self->deviceLocations;
    self->deviceLocations = v5;
  }
  objc_super v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015D20;
  v9[3] = &unk_1012E76E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

+ (id)sharedInstance
{
  if (qword_101610970 != -1) {
    dispatch_once(&qword_101610970, &stru_10131A3C0);
  }
  v2 = (void *)qword_101610968;

  return v2;
}

- (void)_locationManagerApprovalDidChange
{
}

- (NSArray)recentLocations
{
  return self->_recentLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentLocations, 0);
  objc_storeStrong((id *)&self->deviceLocations, 0);

  objc_storeStrong((id *)&self->locationsLock, 0);
}

@end