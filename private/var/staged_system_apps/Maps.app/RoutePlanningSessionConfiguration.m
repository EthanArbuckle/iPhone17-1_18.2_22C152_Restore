@interface RoutePlanningSessionConfiguration
- (BOOL)areInitialRoutesBeingFetchedExternally;
- (BOOL)hasTransportType:(int64_t)a3;
- (BOOL)ignoreMapType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavigationTracePlayback;
- (BOOL)isResumingMultipointRoute;
- (BOOL)shouldAutoLaunchNavigation;
- (BOOL)shouldRestoreCamera;
- (BOOL)shouldRestoreToLowGuidance;
- (BOOL)shouldStartFastestRoute;
- (BOOL)shouldStartShortestRoute;
- (GEOCompanionRouteContext)companionContext;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOCountryConfiguration)countryConfiguration;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (MKLocationManager)locationManager;
- (NSArray)automaticSharingContacts;
- (NSArray)waypointRequests;
- (NSNumber)navigationAutoLaunchDelay;
- (NSSet)supportedTransportTypes;
- (NSString)shortcutIdentifier;
- (NSString)tracePlaybackPath;
- (NSUUID)originalHistoryEntryIdentifier;
- (RouteLoadingTaskFactory)routeLoadingTaskFactory;
- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5;
- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5 companionContext:(id)a6 locationManager:(id)a7;
- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 traits:(id)a4 existingTiming:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8;
- (RoutePlanningWaypointRequest)destinationWaypointRequest;
- (RoutePlanningWaypointRequest)originWaypointRequest;
- (id)configurationByModifyingRouteLoadingTaskFactory:(id)a3 andDedupingWaypointRequests:(id)a4;
- (id)description;
- (int64_t)initialTransportType;
- (int64_t)source;
- (unint64_t)hash;
- (void)setAutomaticSharingContacts:(id)a3;
- (void)setCompanionContext:(id)a3;
- (void)setCountryConfiguration:(id)a3;
- (void)setIgnoreMapType:(BOOL)a3;
- (void)setInitialRoutesBeingFetchedExternally:(BOOL)a3;
- (void)setInitialTransportType:(int64_t)a3;
- (void)setNavigationAutoLaunchDelay:(id)a3;
- (void)setOriginalHistoryEntryIdentifier:(id)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setShouldRestoreCamera:(BOOL)a3;
- (void)setShouldRestoreToLowGuidance:(BOOL)a3;
- (void)setShouldStartFastestRoute:(BOOL)a3;
- (void)setShouldStartShortestRoute:(BOOL)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation RoutePlanningSessionConfiguration

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 traits:(id)a4 existingTiming:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [NavdRouteLoadingTaskFactory alloc];
  v20 = +[NSUserDefaults standardUserDefaults];
  v21 = [(NavdRouteLoadingTaskFactory *)v19 initWithUserDefaults:v20 existingTiming:v16 traits:v17 isResumingMultipointRoute:v9 resumeRouteHandle:v15 persistentData:v14];

  v22 = [(RoutePlanningSessionConfiguration *)self initWithWaypointRequests:v18 routeLoadingTaskFactory:v21 traits:v17];
  return v22;
}

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[GEOCompanionRouteContext context];
  v12 = +[MKLocationManager sharedLocationManager];
  v13 = [(RoutePlanningSessionConfiguration *)self initWithWaypointRequests:v10 routeLoadingTaskFactory:v9 traits:v8 companionContext:v11 locationManager:v12];

  return v13;
}

- (id)configurationByModifyingRouteLoadingTaskFactory:(id)a3 andDedupingWaypointRequests:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  if (!v5)
  {
    id v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[RoutePlanningSessionConfiguration(Modification) configurationByModifyingRouteLoadingTaskFac"
                           "tory:andDedupingWaypointRequests:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "RoutePlanningSessionConfiguration+Extras.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v31) = 50;
      WORD2(v31) = 2080;
      *(void *)((char *)&v31 + 6) = "newRouteLoadingTaskFactory != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v24 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(RoutePlanningSessionConfiguration *)self waypointRequests];
  id v6 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&long long v31 = sub_1001042D0;
        *((void *)&v31 + 1) = sub_1001049D8;
        id v32 = 0;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100ABC598;
        v25[3] = &unk_1013168F0;
        v25[4] = v9;
        v25[5] = buf;
        [v23 enumerateKeysAndObjectsUsingBlock:v25];
        if (*(void *)(*(void *)&buf[8] + 40)) {
          uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
        }
        else {
          uint64_t v10 = v9;
        }
        [v24 addObject:v10];
        _Block_object_dispose(buf, 8);
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v6);
  }

  v11 = [(RoutePlanningSessionConfiguration *)self traits];
  id v12 = [v11 copyByIncrementingSessionCounters];

  v13 = self;
  id v14 = [(RoutePlanningSessionConfiguration *)v13 companionContext];
  id v15 = +[MKLocationManager sharedLocationManager];
  id v16 = [(RoutePlanningSessionConfiguration *)v13 initWithWaypointRequests:v24 routeLoadingTaskFactory:v5 traits:v12 companionContext:v14 locationManager:v15];

  return v16;
}

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5 companionContext:(id)a6 locationManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((unint64_t)[v12 count] <= 1)
  {
    v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      __int16 v43 = 2080;
      v44 = "RoutePlanningSessionConfiguration.m";
      __int16 v45 = 1024;
      int v46 = 35;
      __int16 v47 = 2080;
      v48 = "waypointRequests.count >= 2";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        long long v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v13)
  {
    long long v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      __int16 v43 = 2080;
      v44 = "RoutePlanningSessionConfiguration.m";
      __int16 v45 = 1024;
      int v46 = 36;
      __int16 v47 = 2080;
      v48 = "taskFactory != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v14)
  {
    long long v31 = sub_1005762E4();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      __int16 v43 = 2080;
      v44 = "RoutePlanningSessionConfiguration.m";
      __int16 v45 = 1024;
      int v46 = 37;
      __int16 v47 = 2080;
      v48 = "traits != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v15)
  {
    v34 = sub_1005762E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      __int16 v43 = 2080;
      v44 = "RoutePlanningSessionConfiguration.m";
      __int16 v45 = 1024;
      int v46 = 38;
      __int16 v47 = 2080;
      v48 = "companionContext != nil";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v35 = sub_1005762E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v16)
  {
    v37 = sub_1005762E4();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      __int16 v43 = 2080;
      v44 = "RoutePlanningSessionConfiguration.m";
      __int16 v45 = 1024;
      int v46 = 39;
      __int16 v47 = 2080;
      v48 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v38 = sub_1005762E4();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)RoutePlanningSessionConfiguration;
  id v17 = [(RoutePlanningSessionConfiguration *)&v40 init];
  if (v17)
  {
    id v18 = (NSArray *)[v12 copy];
    waypointRequests = v17->_waypointRequests;
    v17->_waypointRequests = v18;

    objc_storeStrong((id *)&v17->_routeLoadingTaskFactory, a4);
    v20 = (GEOMapServiceTraits *)[v14 copy];
    traits = v17->_traits;
    v17->_traits = v20;

    v22 = (GEOCompanionRouteContext *)[v15 copy];
    companionContext = v17->_companionContext;
    v17->_companionContext = v22;

    v17->_ignoreMapType = 1;
    v17->_initialTransportType = 0;
    objc_storeStrong((id *)&v17->_locationManager, a7);
  }

  return v17;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningSessionConfiguration;
  v4 = [(RoutePlanningSessionConfiguration *)&v19 description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\nwaypointRequests:(%@)", self->_waypointRequests];
  [v5 appendFormat:@"\nrouteLoadingTaskFactory:(%@)", self->_routeLoadingTaskFactory];
  [v5 appendFormat:@"\ntraits:(%p)", self->_traits];
  [v5 appendFormat:@"\ncompanionContext:(%@)", self->_companionContext];
  [v5 appendFormat:@"\ncountryConfiguration:(%@)", self->_countryConfiguration];
  if ([(RoutePlanningSessionConfiguration *)self isNavigationTracePlayback]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v5 appendFormat:@"\nisNavigationTracePlayback:(%@)", v6];
  uint64_t v7 = [(RoutePlanningSessionConfiguration *)self tracePlaybackPath];
  [v5 appendFormat:@"\ntracePlaybackPath:(%@)", v7];

  if ([(RoutePlanningSessionConfiguration *)self shouldAutoLaunchNavigation]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v5 appendFormat:@"\nshouldAutoLaunchNavigation:(%@)", v8];
  [v5 appendFormat:@"\nnavigationAutoLaunchDelay:(%@)", self->_navigationAutoLaunchDelay];
  if ([(RoutePlanningSessionConfiguration *)self areInitialRoutesBeingFetchedExternally])
  {
    CFStringRef v9 = @"YES";
  }
  else
  {
    CFStringRef v9 = @"NO";
  }
  [v5 appendFormat:@"\nareInitialRoutesBeingFetchedExternally:(%@)", v9];
  if ([(RoutePlanningSessionConfiguration *)self ignoreMapType]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [v5 appendFormat:@"\nignoreMapType:(%@)", v10];
  unint64_t v11 = self->_initialTransportType - 1;
  if (v11 > 4) {
    CFStringRef v12 = @"Undefined";
  }
  else {
    CFStringRef v12 = *(&off_10131AA28 + v11);
  }
  [v5 appendFormat:@"\ninitialTransportType:(%@)", v12];
  id v13 = [(RoutePlanningSessionConfiguration *)self supportedTransportTypes];
  [v5 appendFormat:@"\nsupportedTransportTypes:(%@)", v13];

  id v14 = [(RoutePlanningSessionConfiguration *)self automaticSharingContacts];
  [v5 appendFormat:@"\nautomatic sharing:(%@)", v14];

  id v15 = [(RoutePlanningSessionConfiguration *)self shortcutIdentifier];
  [v5 appendFormat:@"\nshortcutIdentifier:(%@)", v15];

  id v16 = [(RoutePlanningSessionConfiguration *)self originalHistoryEntryIdentifier];
  [v5 appendFormat:@"\noriginalHistoryEntryIdentifier:(%@)", v16];

  id v17 = [v5 copy];

  return v17;
}

- (void)setCountryConfiguration:(id)a3
{
  id v5 = (GEOCountryConfiguration *)a3;
  if (self->_countryConfiguration != v5)
  {
    CFStringRef v8 = v5;
    objc_storeStrong((id *)&self->_countryConfiguration, a3);
    countryConfiguration = self->_countryConfiguration;
    uint64_t v7 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
    [v7 setCountryConfiguration:countryConfiguration];

    id v5 = v8;
  }
}

- (GEOCountryConfiguration)countryConfiguration
{
  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
  {
    id v3 = countryConfiguration;
  }
  else
  {
    id v3 = +[GEOCountryConfiguration sharedConfiguration];
  }

  return v3;
}

- (RoutePlanningWaypointRequest)originWaypointRequest
{
  return (RoutePlanningWaypointRequest *)[(NSArray *)self->_waypointRequests firstObject];
}

- (RoutePlanningWaypointRequest)destinationWaypointRequest
{
  return (RoutePlanningWaypointRequest *)[(NSArray *)self->_waypointRequests lastObject];
}

- (BOOL)isNavigationTracePlayback
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)tracePlaybackPath
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 tracePath];

  return (NSString *)v5;
}

- (NSSet)supportedTransportTypes
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  id v3 = [v2 supportedTransportTypes];

  return (NSSet *)v3;
}

- (BOOL)hasTransportType:(int64_t)a3
{
  id v4 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  id v5 = [v4 supportedTransportTypes];
  CFStringRef v6 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  return v7;
}

- (BOOL)shouldAutoLaunchNavigation
{
  v2 = [(RoutePlanningSessionConfiguration *)self navigationAutoLaunchDelay];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isResumingMultipointRoute
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  unsigned __int8 v3 = [v2 isResumingMultipointRoute];

  return v3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  unsigned __int8 v3 = [v2 resumeRouteHandle];

  return (GEOResumeRouteHandle *)v3;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  v2 = [(RoutePlanningSessionConfiguration *)self routeLoadingTaskFactory];
  unsigned __int8 v3 = [v2 persistentData];

  return (GEOComposedGeometryRoutePersistentData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v7 = (RoutePlanningSessionConfiguration *)a3;
  if (v7 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v8 = v7;
      CFStringRef v9 = [(RoutePlanningSessionConfiguration *)v8 waypointRequests];
      if (v9 || self->_waypointRequests)
      {
        unsigned __int8 v3 = [(RoutePlanningSessionConfiguration *)v8 waypointRequests];
        if (![v3 isEqual:self->_waypointRequests])
        {
          BOOL v11 = 0;
          goto LABEL_48;
        }
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
      }
      CFStringRef v12 = [(RoutePlanningSessionConfiguration *)v8 routeLoadingTaskFactory];
      if (v12 || self->_routeLoadingTaskFactory)
      {
        id v4 = [(RoutePlanningSessionConfiguration *)v8 routeLoadingTaskFactory];
        if (![v4 isEqual:self->_routeLoadingTaskFactory])
        {
          BOOL v11 = 0;
LABEL_47:

          if ((v10 & 1) == 0)
          {
LABEL_49:

            goto LABEL_50;
          }
LABEL_48:

          goto LABEL_49;
        }
        int v23 = 1;
      }
      else
      {
        int v23 = 0;
      }
      id v13 = [(RoutePlanningSessionConfiguration *)v8 traits];
      if (v13 || self->_traits)
      {
        id v5 = [(RoutePlanningSessionConfiguration *)v8 traits];
        if (![v5 isEqual:self->_traits])
        {
          BOOL v11 = 0;
          goto LABEL_46;
        }
        int v22 = 1;
      }
      else
      {
        int v22 = 0;
      }
      v21 = [(RoutePlanningSessionConfiguration *)v8 companionContext];
      if (v21 || self->_companionContext)
      {
        v20 = [(RoutePlanningSessionConfiguration *)v8 companionContext];
        if (![v20 isEqual:self->_companionContext])
        {
          BOOL v11 = 0;
          goto LABEL_45;
        }
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
      }
      id v18 = [(RoutePlanningSessionConfiguration *)v8 navigationAutoLaunchDelay];
      if (v18 || self->_navigationAutoLaunchDelay)
      {
        id v17 = [(RoutePlanningSessionConfiguration *)v8 navigationAutoLaunchDelay];
        if (![v17 isEqual:self->_navigationAutoLaunchDelay])
        {
          BOOL v11 = 0;
          goto LABEL_44;
        }
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }
      if (self->_initialRoutesBeingFetchedExternally == [(RoutePlanningSessionConfiguration *)v8 areInitialRoutesBeingFetchedExternally]&& self->_ignoreMapType == [(RoutePlanningSessionConfiguration *)v8 ignoreMapType])
      {
        BOOL v11 = [(RoutePlanningSessionConfiguration *)v8 initialTransportType] == self->_initialTransportType;
        BOOL v14 = v11;
        if ((v16 & 1) == 0) {
          goto LABEL_38;
        }
      }
      else
      {
        BOOL v11 = 0;
        BOOL v14 = 0;
        if (!v16)
        {
LABEL_38:
          BOOL v11 = v14;

          if (!v19) {
            goto LABEL_39;
          }
          goto LABEL_45;
        }
      }
LABEL_44:

      if ((v19 & 1) == 0)
      {
LABEL_39:

        if (!v22) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
LABEL_45:

      if ((v22 & 1) == 0)
      {
LABEL_40:

        if (!v23) {
          goto LABEL_41;
        }
        goto LABEL_47;
      }
LABEL_46:

      if ((v23 & 1) == 0)
      {
LABEL_41:

        if (!v10) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      goto LABEL_47;
    }
    BOOL v11 = 0;
  }
LABEL_50:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSArray *)self->_waypointRequests hash];
  unint64_t v4 = (unint64_t)[(RouteLoadingTaskFactory *)self->_routeLoadingTaskFactory hash] ^ v3;
  unint64_t v5 = (unint64_t)[(GEOMapServiceTraits *)self->_traits hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(GEOCompanionRouteContext *)self->_companionContext hash];
  return v6 ^ (unint64_t)[(NSNumber *)self->_navigationAutoLaunchDelay hash];
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (RouteLoadingTaskFactory)routeLoadingTaskFactory
{
  return self->_routeLoadingTaskFactory;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOCompanionRouteContext)companionContext
{
  return self->_companionContext;
}

- (void)setCompanionContext:(id)a3
{
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (NSNumber)navigationAutoLaunchDelay
{
  return self->_navigationAutoLaunchDelay;
}

- (void)setNavigationAutoLaunchDelay:(id)a3
{
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (void)setAutomaticSharingContacts:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (BOOL)shouldRestoreCamera
{
  return self->_shouldRestoreCamera;
}

- (void)setShouldRestoreCamera:(BOOL)a3
{
  self->_shouldRestoreCamera = a3;
}

- (BOOL)shouldRestoreToLowGuidance
{
  return self->_shouldRestoreToLowGuidance;
}

- (void)setShouldRestoreToLowGuidance:(BOOL)a3
{
  self->_shouldRestoreToLowGuidance = a3;
}

- (BOOL)shouldStartShortestRoute
{
  return self->_shouldStartShortestRoute;
}

- (void)setShouldStartShortestRoute:(BOOL)a3
{
  self->_shouldStartShortestRoute = a3;
}

- (BOOL)shouldStartFastestRoute
{
  return self->_shouldStartFastestRoute;
}

- (void)setShouldStartFastestRoute:(BOOL)a3
{
  self->_shouldStartFastestRoute = a3;
}

- (NSUUID)originalHistoryEntryIdentifier
{
  return self->_originalHistoryEntryIdentifier;
}

- (void)setOriginalHistoryEntryIdentifier:(id)a3
{
}

- (BOOL)areInitialRoutesBeingFetchedExternally
{
  return self->_initialRoutesBeingFetchedExternally;
}

- (void)setInitialRoutesBeingFetchedExternally:(BOOL)a3
{
  self->_initialRoutesBeingFetchedExternally = a3;
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (int64_t)initialTransportType
{
  return self->_initialTransportType;
}

- (void)setInitialTransportType:(int64_t)a3
{
  self->_initialTransportType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalHistoryEntryIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
  objc_storeStrong((id *)&self->_navigationAutoLaunchDelay, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_companionContext, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_routeLoadingTaskFactory, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);

  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end