@interface RidesharingAppSuggestionsProvider
+ (id)sharedProvider;
- (id)_applicationsAfterFilteringOutInstalledApplicationsFromApplications:(id)a3;
- (id)_searchErrorWithUserInfo:(id)a3;
- (id)partitionedApplicationSuggestionsFromSuggestions:(id)a3;
- (void)_fetchAppDataForAppIDs:(id)a3 withCompletion:(id)a4;
- (void)_fetchAppIDsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5;
- (void)fetchSuggestedAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5;
@end

@implementation RidesharingAppSuggestionsProvider

+ (id)sharedProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B9DF98;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610960 != -1) {
    dispatch_once(&qword_101610960, block);
  }
  v2 = (void *)qword_101610958;

  return v2;
}

- (void)fetchSuggestedAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v7 = a3.longitude;
  double v8 = a3.latitude;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100B9E0EC;
  v12[3] = &unk_10131A340;
  id v11 = v10;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  -[RidesharingAppSuggestionsProvider _fetchAppIDsForSource:destination:withCompletion:](self, "_fetchAppIDsForSource:destination:withCompletion:", v12, v8, v7, latitude, longitude);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)_fetchAppIDsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  CLLocationDegrees v7 = a3.longitude;
  CLLocationDegrees v8 = a3.latitude;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:@"%f,%f", *(void *)&v8, *(void *)&v7];
  v12 = +[NSString stringWithFormat:@"%f,%f", *(void *)&latitude, *(void *)&longitude];
  id v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v13 setTimeoutInterval:15.0];
  [v13 setAllowedRetryCount:0];
  [v13 setURLBagKey:@"map-apps-search"];
  [v13 setValue:@"ridesharing" forRequestParameter:@"term"];
  [v13 setValue:@"INRequestRideIntent,INListRideOptionsIntent,INGetRideStatusIntent" forRequestParameter:@"intent"];
  [v13 setValue:v11 forRequestParameter:@"loc1"];
  [v13 setValue:v12 forRequestParameter:@"loc2"];
  [v13 setValue:@"com.apple.Maps" forRequestParameter:@"caller"];
  [v13 setValue:@"1" forRequestParameter:@"version"];
  id v14 = [objc_alloc((Class)SSURLConnectionRequest) initWithRequestProperties:v13];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B9E44C;
  v16[3] = &unk_10131A368;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 startWithConnectionResponseBlock:v16];
}

- (void)_fetchAppDataForAppIDs:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CLLocationDegrees v7 = +[MKAppleMediaServices sharedInstance];
  CLLocationDegrees v8 = +[UIScreen mainScreen];
  [v8 scale];
  double v10 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100B9E90C;
  v12[3] = &unk_1012E7710;
  id v13 = v5;
  id v11 = v5;
  [v7 appleMediaServicesResultsWithIdentifiers:v6 artworkSize:1 screenScale:5 type:62.0 source:62.0 completion:v10];
}

- (id)_searchErrorWithUserInfo:(id)a3
{
  return +[NSError errorWithDomain:@"RideSharingAppsStoreSuggestions.Search" code:100 userInfo:a3];
}

- (id)_applicationsAfterFilteringOutInstalledApplicationsFromApplications:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isAppInstalled", (void)v13) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (id)partitionedApplicationSuggestionsFromSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingAppSuggestionsProvider *)self _applicationsAfterFilteringOutInstalledApplicationsFromApplications:v4];
  id v6 = [v4 mutableCopy];

  [v6 removeObjectsInArray:v5];
  id v7 = [[RidesharingPartitionedAppSuggestions alloc] initWithInstalledSuggestions:v6 notInstalledSuggestions:v5];

  return v7;
}

@end