@interface RoutingAppSuggestionProvider
- (BOOL)appInstallationDisallowed;
- (NSArray)allRoutingApps;
- (RoutingAppSuggestionProviderDelegate)delegate;
- (id)sortedAppsWithIds:(id)a3 appStoreApps:(id)a4;
- (void)_removeInstalledAppsFromStoreSuggestions;
- (void)_requestAppDataForIds:(id)a3;
- (void)_suggestFilteredStoreAppsIfReady;
- (void)dealloc;
- (void)requestSuggestionsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4;
- (void)reset;
- (void)setAllRoutingApps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showNetworkActivityIndicator:(BOOL)a3;
- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4;
@end

@implementation RoutingAppSuggestionProvider

- (void)dealloc
{
  [(RoutingAppSuggestionProvider *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)RoutingAppSuggestionProvider;
  [(RoutingAppSuggestionProvider *)&v3 dealloc];
}

- (void)requestSuggestionsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v6 = a3.longitude;
  double v7 = a3.latitude;
  [(RoutingAppSuggestionProvider *)self reset];
  v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"__internal__FakeTransitResponse"];

  if (v10)
  {
    v11 = [@"375380948,304231811,435490305,393428422,322118666,292281611,358345871,380983340,330956157,389770860" componentsSeparatedByString:@","];
    [(RoutingAppSuggestionProvider *)self _requestAppDataForIds:v11];
LABEL_5:

    goto LABEL_6;
  }
  if (!self->_appInstallationDisallowed)
  {
    v11 = +[NSString stringWithFormat:@"%f,%f", *(void *)&v7, *(void *)&v6];
    v12 = +[NSString stringWithFormat:@"%f,%f", *(void *)&latitude, *(void *)&longitude];
    id v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    [v13 setURLBagKey:@"transit-apps-url"];
    [v13 setValue:v11 forRequestParameter:@"loc1"];
    [v13 setValue:v12 forRequestParameter:@"loc2"];
    id v14 = [objc_alloc((Class)SSURLConnectionRequest) initWithRequestProperties:v13];
    [v14 setDelegate:self];
    [(RoutingAppSuggestionProvider *)self showNetworkActivityIndicator:1];
    [v14 start];

    goto LABEL_5;
  }
LABEL_6:
  v15 = +[RoutingAppsManager defaultManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008EE914;
  v16[3] = &unk_1012FFFF0;
  v16[4] = self;
  [v15 loadRelevantRoutingAppsForSource:v16 destination:v7 completion:latitude, longitude];
}

- (void)showNetworkActivityIndicator:(BOOL)a3
{
  if (a3)
  {
    double v7 = +[LoadingIndicatorController sharedController];
    v4 = [(LoadingToken *)v7 beginShowingLoadingIndicator];
    networkActivity = self->_networkActivity;
    self->_networkActivity = v4;

    double v6 = v7;
  }
  else
  {
    double v6 = self->_networkActivity;
    self->_networkActivity = 0;
  }
}

- (void)reset
{
  self->_suggestedStoreApps = 0;
  *(_WORD *)&self->_loadedStoreSuggestions = 0;
  self->_appInstallationDisallowed = sub_100B5E5E0() ^ 1;
}

- (void)_requestAppDataForIds:(id)a3
{
  id v4 = a3;
  [(RoutingAppSuggestionProvider *)self showNetworkActivityIndicator:1];
  v5 = +[MKAppleMediaServices sharedInstance];
  double v6 = +[UIScreen mainScreen];
  [v6 scale];
  double v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008EEB6C;
  v10[3] = &unk_1012E7B20;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v5 appleMediaServicesResultsWithIdentifiers:v9 artworkSize:2 screenScale:7 type:62.0 source:62.0 completion:v8];
}

- (id)sortedAppsWithIds:(id)a3 appStoreApps:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 identifier:v22];
        id v15 = [v5 indexOfObject:v14];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = +[NSNumber numberWithUnsignedInteger:v15];
          [v7 setObject:v13 forKey:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v17 = [v7 allKeys];
  v18 = [v17 sortedArrayUsingComparator:&stru_101300010];

  v19 = +[NSNull null];
  v20 = [v7 objectsForKeys:v18 notFoundMarker:v19];

  return v20;
}

- (void)_removeInstalledAppsFromStoreSuggestions
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_allRoutingApps, "count")];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_allRoutingApps;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v8) bundleIdentifier];
        [v3 addObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  sub_100B5AA24(@"Filtering the following installed apps from store suggestions: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v3);
  v17 = [(NSArray *)self->_appStoreApps indexesOfObjectsPassingTest:&stru_101300050];
  v18 = [(NSArray *)self->_appStoreApps objectsAtIndexes:v17];
  appStoreApps = self->_appStoreApps;
  self->_appStoreApps = v18;
}

- (void)_suggestFilteredStoreAppsIfReady
{
  if (self->_loadedStoreSuggestions && !self->_suggestedStoreApps && self->_suggestedLocalApps)
  {
    self->_suggestedStoreApps = 1;
    [(RoutingAppSuggestionProvider *)self _removeInstalledAppsFromStoreSuggestions];
    sub_100B5AA24(@"Done loading store suggestions", v3, v4, v5, v6, v7, v8, v9, v10);
    id v11 = [(RoutingAppSuggestionProvider *)self delegate];
    [v11 routingAppSuggestionProvider:self didSuggestStoreApps:self->_appStoreApps];
  }
}

- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  [(RoutingAppSuggestionProvider *)self showNetworkActivityIndicator:0];
  uint64_t v6 = [v5 bodyData];
  if (v6)
  {
    id v34 = 0;
    uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v34];
    id v8 = v34;
    uint64_t v16 = v8;
    if (v8)
    {
      v38[0] = NSLocalizedDescriptionKey;
      v38[1] = NSUnderlyingErrorKey;
      v39[0] = @"Failed to parse response.";
      v39[1] = v8;
      v17 = (const __CFString **)v39;
      v18 = (NSErrorUserInfoKey *)v38;
      uint64_t v19 = 2;
    }
    else
    {
      sub_100B5AA24(@"Store search response received: %@.", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [v7 objectForKeyedSubscript:@"results"];
        if (!v21)
        {
LABEL_18:

          goto LABEL_19;
        }
        v29 = v7;
        id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v21 count]];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v21 = v21;
        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v31;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v31 != v25) {
                objc_enumerationMutation(v21);
              }
              v27 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:@"adamId"];
              [v22 addObject:v27];
            }
            id v24 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v24);
        }

        [(RoutingAppSuggestionProvider *)self _requestAppDataForIds:v22];
        uint64_t v7 = v29;
LABEL_17:

        goto LABEL_18;
      }
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      CFStringRef v37 = @"Expected dictionary as root JSON object and didn't get one.";
      v17 = &v37;
      v18 = &v36;
      uint64_t v19 = 1;
    }
    v28 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:v19];
    id v21 = +[NSError searchErrorWithUserInfo:v28];

    id v22 = [(RoutingAppSuggestionProvider *)self delegate];
    [v22 routingAppSuggestionProvider:self didFailToSuggestStoreApps:v21];
    goto LABEL_17;
  }
  NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
  CFStringRef v41 = @"SSURLConnectionRequest response was nil.";
  long long v20 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  uint64_t v16 = +[NSError searchErrorWithUserInfo:v20];

  uint64_t v7 = [(RoutingAppSuggestionProvider *)self delegate];
  [v7 routingAppSuggestionProvider:self didFailToSuggestStoreApps:v16];
LABEL_19:
}

- (RoutingAppSuggestionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutingAppSuggestionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)appInstallationDisallowed
{
  return self->_appInstallationDisallowed;
}

- (NSArray)allRoutingApps
{
  return self->_allRoutingApps;
}

- (void)setAllRoutingApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_appStoreApps, 0);
  objc_storeStrong((id *)&self->_allRoutingApps, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end