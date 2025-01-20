@interface NanoCompanionController
+ (int64_t)creationPreference;
+ (void)initializePairedDeviceRegistry;
- (GEOCompanionRouteContext)sessionContext;
- (IPCServer)ipcServer;
- (NSString)destinationName;
- (NanoCompanionController)initWithPlatformController:(id)a3 ipcServer:(id)a4;
- (PlatformController)platformController;
- (RoutePlanningSession)routePlanningSession;
- (id)_currentRouteID;
- (id)_routeIDFromRouteCollectionResult:(id)a3;
- (id)_syntheticRouteDetailsForCurrentRequest;
- (void)_clearRoutePreviews;
- (void)_createCompanionRoutesConnection;
- (void)_createCompanionRoutesConnectionOnIsolationQueue;
- (void)_enterRoutePlanningForRequest:(id)a3;
- (void)_sendStubRouteDetails;
- (void)_sendStubRouteDetailsIfNecessary;
- (void)_sendUpdatedResponse;
- (void)_sendUpdatedSelectedRouteID;
- (void)_updateDestinationName;
- (void)_updateResponseWithRouteCollectionResult:(id)a3;
- (void)_updateResponseWithRoutesResult:(id)a3 routeUpdates:(id)a4;
- (void)anticipateRoutePlanningRequest:(id)a3 completionHandler:(id)a4;
- (void)checkinForRoutePlanning;
- (void)clearRoutePlanningWithContext:(id)a3 completionHandler:(id)a4;
- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)dealloc;
- (void)failRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setDestinationName:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)updateRoutePlanningRequest:(id)a3 withSelectedRouteID:(id)a4 completionHandler:(id)a5;
@end

@implementation NanoCompanionController

- (void)_createCompanionRoutesConnection
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108258;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (NanoCompanionController)initWithPlatformController:(id)a3 ipcServer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NanoCompanionController;
  v9 = [(NanoCompanionController *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platformController, a3);
    objc_storeStrong((id *)&v10->_ipcServer, a4);
    v11 = +[NSBundle mainBundle];
    v12 = [v11 bundleIdentifier];
    v13 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v12, objc_opt_class(), v10];

    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v10 selector:"_deviceDidPairNotification:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    v20 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010800C;
    block[3] = &unk_1012E5D08;
    v21 = v10;
    v24 = v21;
    dispatch_async(v20, block);

    [(NanoCompanionController *)v21 _createCompanionRoutesConnection];
  }

  return v10;
}

- (void)_createCompanionRoutesConnectionOnIsolationQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_companionRoutesConnection)
  {
    v3 = sub_100068A0C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating companion routes XPC connection", buf, 2u);
    }

    v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.nanomaps.xpc.Routes" options:0];
    companionRoutesConnection = self->_companionRoutesConnection;
    self->_companionRoutesConnection = v4;

    [(NSXPCConnection *)self->_companionRoutesConnection _setQueue:self->_isolationQueue];
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCRouting];
    [(NSXPCConnection *)self->_companionRoutesConnection setRemoteObjectInterface:v6];

    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCRouting];
    [(NSXPCConnection *)self->_companionRoutesConnection setExportedInterface:v7];

    [(NSXPCConnection *)self->_companionRoutesConnection setExportedObject:self];
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_companionRoutesConnection);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100031DDC;
    v17[3] = &unk_1012E6BD0;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    [(NSXPCConnection *)self->_companionRoutesConnection setInvalidationHandler:v17];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100558378;
    id v14 = &unk_1012E6BD0;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    [(NSXPCConnection *)self->_companionRoutesConnection setInterruptionHandler:&v11];
    [(NSXPCConnection *)self->_companionRoutesConnection resume];
    id v8 = sub_100068A0C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_companionRoutesConnection;
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "checkinForRoutePlanning on connection: %@", buf, 0xCu);
    }

    v10 = [(NSXPCConnection *)self->_companionRoutesConnection remoteObjectProxy];
    [v10 checkinForRoutePlanning];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

+ (int64_t)creationPreference
{
  return 1;
}

+ (void)initializePairedDeviceRegistry
{
  if (qword_10160F0C8 != -1) {
    dispatch_once(&qword_10160F0C8, &stru_1012EEB10);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_companionRoutesConnection invalidate];
  companionRoutesConnection = self->_companionRoutesConnection;
  self->_companionRoutesConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)NanoCompanionController;
  [(NanoCompanionController *)&v4 dealloc];
}

- (void)_enterRoutePlanningForRequest:(id)a3
{
  id v4 = a3;
  v5 = +[DirectionItem directionItemWithNanoRoutePlanningRequest:v4];
  v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = [v6 getActivePairedDevice];
  if (GEOConfigGetBOOL())
  {
    id v8 = v7;
    if (!v8
      || (v9 = v8,
          [v8 valueForProperty:NRDevicePropertySystemVersion],
          v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 compare:@"9.0" options:64],
          v10,
          v9,
          v9,
          v11 != (id)-1))
    {
      CFStringRef v12 = @"Phone";
      uint64_t v13 = 1;
      goto LABEL_7;
    }
  }
  else
  {
  }
  CFStringRef v12 = @"Watch";
  uint64_t v13 = 3;
LABEL_7:

  id v14 = sub_100068A0C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [(GEOCompanionRouteContext *)self->_anticipatingContext simpleDescription];
    *(_DWORD *)buf = 138412546;
    CFStringRef v36 = v12;
    __int16 v37 = 2112;
    v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Enter route planning with initiator: %@ (%@)", buf, 0x16u);
  }
  v33[0] = @"DirectionsSessionInitiatorKey";
  id v16 = +[NSNumber numberWithUnsignedInteger:v13];
  v33[1] = @"DirectionsCompanionRouteContextKey";
  v34[0] = v16;
  v34[1] = self->_anticipatingContext;
  dispatch_queue_t v17 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  id v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];

  unsigned int v19 = [v4 startNavigationAutomatically];
  if (v19)
  {
    id v20 = +[NSNumber numberWithDouble:5.0];
    v21 = +[NSUserDefaults standardUserDefaults];
    v22 = [v21 objectForKey:@"NavigationAutoLaunchDelayKey"];

    if (v22) {
      v23 = v22;
    }
    else {
      v23 = v20;
    }
    id v24 = v23;

    [v24 doubleValue];
    double v26 = v25;

    v27 = +[NSNumber numberWithDouble:v26];
    [v18 setObject:v27 forKeyedSubscript:@"DirectionsNavigationAutoLaunchDelayKey"];
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100558800;
  v30[3] = &unk_1012E5D58;
  id v31 = v5;
  id v32 = v18;
  id v28 = v18;
  id v29 = v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v30);
}

- (void)checkinForRoutePlanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = sub_100068A0C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSStringFromSelector(a2);
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&v5, 0xCu);
  }
}

- (void)anticipateRoutePlanningRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = sub_100068A0C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v28 = 138412290;
    CFStringRef v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&v28, 0xCu);
  }
  anticipatingContext = self->_anticipatingContext;
  if (anticipatingContext)
  {
    CFStringRef v12 = anticipatingContext;
    goto LABEL_6;
  }
  CFStringRef v12 = [(NanoCompanionController *)self sessionContext];
  if (v12)
  {
LABEL_6:
    uint64_t v13 = [v7 companionRouteContext];
    unsigned __int8 v14 = [(GEOCompanionRouteContext *)v12 isEqual:v13];

    if (v14) {
      goto LABEL_21;
    }
  }
  unsigned int v15 = [v7 resolvedTransportType];
  if (v15 > 5) {
    unint64_t v16 = -1;
  }
  else {
    unint64_t v16 = qword_100F6FC78[v15] - 2;
  }
  dispatch_queue_t v17 = [v7 companionRouteContext];
  id v18 = sub_100068A0C();
  unsigned int v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (v16 > 6) {
        CFStringRef v20 = @"AUTOMOBILE";
      }
      else {
        CFStringRef v20 = *(&off_1012EED58 + v16);
      }
      v21 = [v17 simpleDescription];
      int v28 = 138412546;
      CFStringRef v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Anticipate routes from gizmo (transportType:%@, context:%@)", (uint8_t *)&v28, 0x16u);
    }
    lastPreviewedRouteID = self->_lastPreviewedRouteID;
    self->_lastPreviewedRouteID = 0;

    lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
    self->_lastReceivedRouteIDs = 0;

    objc_storeStrong((id *)&self->_anticipatingContext, v17);
    id v24 = (NanoRoutePlanningMutableRequest *)[v7 mutableCopy];
    request = self->_request;
    self->_request = v24;

    double v26 = objc_alloc_init(NanoRoutePlanningMutableResponse);
    response = self->_response;
    self->_response = v26;

    [(NanoCompanionController *)self _enterRoutePlanningForRequest:v7];
    v8[2](v8);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot anticipate routes without a context", (uint8_t *)&v28, 2u);
    }
  }
LABEL_21:
}

- (void)updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  CFStringRef v12 = sub_100068A0C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", buf, 0xCu);
  }
  unsigned __int8 v14 = [v9 companionRouteContext];
  if (v14)
  {
    unsigned int v15 = [v10 routes];
    unint64_t v16 = sub_100099700(v15, &stru_1012EEB50);
    if ([(NSArray *)self->_lastReceivedRouteIDs isEqualToArray:v16])
    {
      dispatch_queue_t v17 = sub_100068A0C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The routes which we just received are the same as the last ones we received; ignoring update route planning wi"
          "th response request",
          buf,
          2u);
      }
    }
    else
    {
      id v18 = (NSArray *)[v16 copy];
      lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
      self->_lastReceivedRouteIDs = v18;

      CFStringRef v20 = sub_100068A0C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v15 count];
        v22 = [v14 simpleDescription];
        *(_DWORD *)buf = 134218242;
        id v43 = v21;
        __int16 v44 = 2112;
        v45 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Update with %ld routes from gizmo (context:%@)", buf, 0x16u);
      }
      objc_storeStrong((id *)&self->_anticipatingContext, v14);
      v23 = (NanoRoutePlanningMutableRequest *)[v9 mutableCopy];
      request = self->_request;
      self->_request = v23;

      double v25 = (NanoRoutePlanningMutableResponse *)[v10 mutableCopy];
      response = self->_response;
      self->_response = v25;

      v27 = [(NanoCompanionController *)self routePlanningSession];

      if (v27)
      {
        v41 = [[RouteCollection alloc] initWithRoutes:v15 currentRouteIndex:0];
        uint64_t v40 = +[Result resultWithValue:](Result, "resultWithValue:");
        anticipatingContext = self->_anticipatingContext;
        CFStringRef v29 = [(NanoCompanionController *)self routePlanningSession];
        __int16 v30 = [v29 configuration];
        [v30 setCompanionContext:anticipatingContext];

        id v31 = [v15 firstObject];
        unsigned int v32 = [v31 transportType];
        if (v32 == 2)
        {
          unsigned __int8 v33 = [v31 isWalkingOnlyTransitRoute];
          v34 = [(NanoCompanionController *)self routePlanningSession];
          if (v33)
          {
            CFStringRef v36 = (void *)v40;
            v35 = v41;
LABEL_18:
            uint64_t v38 = 3;
          }
          else
          {
            uint64_t v38 = 2;
LABEL_20:
            CFStringRef v36 = (void *)v40;
            v35 = v41;
          }
        }
        else
        {
          unsigned int v37 = v32;
          v34 = [(NanoCompanionController *)self routePlanningSession];
          uint64_t v38 = 1;
          unsigned int v39 = v37 - 1;
          CFStringRef v36 = (void *)v40;
          v35 = v41;
          switch(v39)
          {
            case 0u:
            case 4u:
              goto LABEL_18;
            case 1u:
              break;
            case 2u:
              uint64_t v38 = 5;
              break;
            case 3u:
              uint64_t v38 = 0;
              break;
            case 5u:
              uint64_t v38 = 4;
              break;
            default:
              goto LABEL_20;
          }
        }
        [v34 updateRouteCollectionResult:v36 forTransportType:v38];
      }
      else
      {
        [(NanoCompanionController *)self _enterRoutePlanningForRequest:v9];
      }
      v11[2](v11);
    }
  }
  else
  {
    unsigned int v15 = sub_100068A0C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Cannot update routes without a context", buf, 2u);
    }
  }
}

- (void)updateRoutePlanningRequest:(id)a3 withSelectedRouteID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  CFStringRef v12 = sub_100068A0C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = NSStringFromSelector(a2);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", (uint8_t *)&buf, 0xCu);
  }
  unsigned __int8 v14 = [(NanoCompanionController *)self routePlanningSession];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v18 = sub_100068A0C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempting to select a route ID when a RoutePlanningSession is not currently active.", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    unint64_t v16 = [(NanoCompanionController *)self routePlanningSession];
    dispatch_queue_t v17 = [v16 currentRouteCollection];
    id v18 = [v17 routes];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    uint64_t v28 = 0;
    CFStringRef v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    unsigned int v19 = +[NSUUID _maps_UUIDWithData:v10];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1005593A8;
    v24[3] = &unk_1012EEB78;
    id v20 = v19;
    id v25 = v20;
    double v26 = &v28;
    p_long long buf = &buf;
    [v18 enumerateObjectsUsingBlock:v24];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      objc_storeStrong((id *)&self->_lastPreviewedRouteID, v19);
      id v21 = [(NanoCompanionController *)self routePlanningSession];
      uint64_t v22 = v29[3];
      v23 = [(NanoCompanionController *)self routePlanningSession];
      -[NSObject setSelectedRouteIndex:forTransportType:](v21, "setSelectedRouteIndex:forTransportType:", v22, [v23 currentTransportType]);
    }
    else
    {
      id v21 = sub_100068A0C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unsigned int v32 = 138412290;
        id v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot select route %@, doesn't match any we have locally", v32, 0xCu);
      }
    }

    v11[2](v11);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)clearRoutePlanningWithContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v9 = sub_100068A0C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = [v7 simpleDescription];
    *(_DWORD *)long long buf = 138412546;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd with incoming route context: %@", buf, 0x16u);
  }
  CFStringRef v12 = [(NanoCompanionController *)self sessionContext];
  if ([v7 isStaleComparedToContext:v12])
  {
    uint64_t v13 = sub_100068A0C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_7:

      goto LABEL_16;
    }
    unsigned __int8 v14 = [v7 simpleDescription];
    BOOL v15 = [v12 simpleDescription];
    *(_DWORD *)long long buf = 138412546;
    v23 = v14;
    __int16 v24 = 2112;
    id v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Incoming context(%@) was stale compared to our current context(%@); ignoring clear route planning request",
      buf,
      0x16u);

LABEL_6:
    goto LABEL_7;
  }
  if (!v7 && v12 && [v12 origin] == 2)
  {
    uint64_t v13 = sub_100068A0C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    unsigned __int8 v14 = [v12 simpleDescription];
    *(_DWORD *)long long buf = 138412290;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received clear route planning without a context, and the current context is from companion (%@); dropping request",
      buf,
      0xCu);
    goto LABEL_6;
  }
  [(IPCServer *)self->_ipcServer navigationStateDidChangeTo:4 reason:@"Directions were cleared"];
  objc_storeStrong((id *)&self->_clearingContext, v12);
  unint64_t v16 = sub_100068A0C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v17 = [v12 simpleDescription];
    *(_DWORD *)long long buf = 138412290;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Clearing preview routes and ending navigation (current context:%@)", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100559870;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  lastReceivedRouteIDs = self->_lastReceivedRouteIDs;
  self->_lastReceivedRouteIDs = 0;

  lastPreviewedRouteID = self->_lastPreviewedRouteID;
  self->_lastPreviewedRouteID = 0;

  clearingContext = self->_clearingContext;
  self->_clearingContext = 0;

  v8[2](v8);
LABEL_16:
}

- (void)failRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  CFStringRef v12 = sub_100068A0C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got %@ call from nanomapscd", buf, 0xCu);
  }
  unsigned __int8 v14 = [v9 companionRouteContext];
  BOOL v15 = [(NanoCompanionController *)self sessionContext];
  if ([v14 isStaleComparedToContext:v15])
  {
    unint64_t v16 = sub_100068A0C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v17 = [v14 simpleDescription];
      id v18 = [v15 simpleDescription];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Incoming context(%@) was stale compared to our current context(%@); ignoring fail route planning request",
        buf,
        0x16u);
    }
  }
  else
  {
    unsigned int v19 = (NanoRoutePlanningMutableRequest *)[v9 mutableCopy];
    request = self->_request;
    self->_request = v19;

    id v21 = (NanoRoutePlanningMutableResponse *)[v10 mutableCopy];
    response = self->_response;
    self->_response = v21;

    v23 = sub_100068A0C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = [v14 simpleDescription];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Failing preview routes and ending navigation (context:%@)", buf, 0xCu);
    }
    ipcServer = self->_ipcServer;
    double v26 = [v10 lastError];
    [(IPCServer *)ipcServer navigationStateDidChangeTo:3 reason:@"Directions not available" error:v26];

    objc_storeStrong((id *)&self->_clearingContext, v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100559C3C;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v11[2](v11);
  }
}

- (void)_updateResponseWithRouteCollectionResult:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = sub_100103CFC;
    v70 = sub_100104708;
    id v71 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    v63 = sub_100103CFC;
    v64 = sub_100104708;
    id v65 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = sub_100103CFC;
    v58 = sub_100104708;
    id v59 = 0;
    v52[4] = &v60;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10055A308;
    v53[3] = &unk_1012EEBE0;
    v53[4] = &v66;
    v53[5] = &v54;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10055A39C;
    v52[3] = &unk_1012EAC00;
    [v4 withValue:v53 orError:v52];
    id v43 = sub_100099700((void *)v67[5], &stru_1012EEC20);
    int v5 = [(id)v67[5] firstObject];
    id v6 = [(NanoRoutePlanningMutableResponse *)self->_response mutableCopy];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    unsigned __int8 v14 = v8;

    BOOL v15 = [v5 routeInitializerData];
    unint64_t v16 = [v15 directionsRequest];
    [v14 setDirectionsRequest:v16];

    dispatch_queue_t v17 = [v5 routeInitializerData];
    id v18 = [v17 directionsResponse];
    [v14 setDirectionsResponse:v18];

    unsigned int v19 = [v5 _maps_traceRecordingData];
    [v14 setTraceRecordingData:v19];

    [v14 setRoutes:v43];
    [v14 setSelectedRouteID:v55[5]];
    id v20 = [v14 lastError];
    id v21 = (void *)v61[5];
    unint64_t v22 = v20;
    unint64_t v23 = v21;
    if (v22 | v23) {
      unsigned int v24 = [(id)v22 isEqual:v23];
    }
    else {
      unsigned int v24 = 1;
    }

    [v14 setLastError:v61[5]];
    id v25 = [v14 snapshot];
    double v26 = [v25 deltaFromSnapshot:self->_responseSnapshot];
    objc_storeStrong((id *)&self->_responseSnapshot, v25);
    objc_storeStrong((id *)&self->_response, v14);
    if ([v5 transportType] == 1)
    {
      observingRoutes = self->_observingRoutes;
      unsigned int v42 = v24;
      if (observingRoutes)
      {
        id v28 = v4;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        CFStringRef v29 = observingRoutes;
        id v30 = [(NSHashTable *)v29 countByEnumeratingWithState:&v48 objects:v73 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v49;
          do
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v48 + 1) + 8 * i) unregisterObserver:self];
            }
            id v30 = [(NSHashTable *)v29 countByEnumeratingWithState:&v48 objects:v73 count:16];
          }
          while (v30);
        }

        id v4 = v28;
        [(NSHashTable *)self->_observingRoutes removeAllObjects];
      }
      else
      {
        v34 = +[NSHashTable weakObjectsHashTable];
        uint64_t v35 = self->_observingRoutes;
        self->_observingRoutes = v34;
      }
      id v41 = v4;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v36 = v43;
      id v37 = [v36 countByEnumeratingWithState:&v44 objects:v72 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v45;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(void *)v45 != v38) {
              objc_enumerationMutation(v36);
            }
            uint64_t v40 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
            [v40 registerObserver:self];
            [(NSHashTable *)self->_observingRoutes addObject:v40];
          }
          id v37 = [v36 countByEnumeratingWithState:&v44 objects:v72 count:16];
        }
        while (v37);
      }

      id v4 = v41;
      unsigned int v24 = v42;
    }
    if (([v26 routeRevisionsChanged] | v24 ^ 1) == 1)
    {
      [(NanoCompanionController *)self _sendUpdatedResponse];
    }
    else if ([v26 selectedRouteChanged])
    {
      [(NanoCompanionController *)self _sendUpdatedSelectedRouteID];
    }

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);

    _Block_object_dispose(&v66, 8);
  }
  else
  {
    id v9 = [(NanoCompanionController *)self routePlanningSession];
    id v10 = [v9 sessionState];

    response = self->_response;
    if (v10 == (id)1)
    {
      self->_response = 0;

      responseSnapshot = self->_responseSnapshot;
      self->_responseSnapshot = 0;

      uint64_t v13 = self->_observingRoutes;
      self->_observingRoutes = 0;

      [(NanoCompanionController *)self _sendStubRouteDetailsIfNecessary];
    }
    else if (response)
    {
      self->_response = 0;

      id v33 = self->_observingRoutes;
      self->_observingRoutes = 0;

      [(NanoCompanionController *)self _clearRoutePreviews];
    }
  }
}

- (void)_updateResponseWithRoutesResult:(id)a3 routeUpdates:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_100103CFC;
  id v37 = sub_100104708;
  id v38 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10055A804;
  v32[3] = &unk_1012EEC48;
  uint8_t v32[4] = &v33;
  id v21 = v6;
  [v6 withValue:v32 orError:&stru_1012EEC68];
  if (v34[5])
  {
    unint64_t v23 = self;
    id v7 = [(NanoRoutePlanningResponse *)self->_response routes];
    id v8 = [v7 mutableCopy];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)v34[5];
    id v9 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v9)
    {
      char v22 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v13 = [v12 uniqueRouteID];
          id v14 = v12;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10055A818;
          v26[3] = &unk_1012EAE80;
          id v15 = v13;
          id v27 = v15;
          id v16 = [v8 indexOfObjectPassingTest:v26];
          if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            dispatch_queue_t v17 = [v24 objectForKeyedSubscript:v15];
            if (v17)
            {
              [v8 replaceObjectAtIndex:v16 withObject:v14];
              [(NanoRoutePlanningMutableResponse *)v23->_response setObject:v17 forUserInfoKey:@"transitRouteUpdate" forRouteID:v15];
              char v22 = 1;
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v9);

      if ((v22 & 1) == 0) {
        goto LABEL_19;
      }
      id v18 = [v8 copy];
      [(NanoRoutePlanningResponse *)v23->_response setRoutes:v18];

      unsigned int v19 = [(NanoRoutePlanningResponse *)v23->_response snapshot];
      id v20 = [v19 deltaFromSnapshot:v23->_responseSnapshot];
      objc_storeStrong((id *)&v23->_responseSnapshot, v19);
      if ([v20 routeRevisionsChanged]) {
        [(NanoCompanionController *)v23 _sendUpdatedResponse];
      }
    }
    else
    {
      unsigned int v19 = obj;
    }

LABEL_19:
  }
  _Block_object_dispose(&v33, 8);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  isolationQueue = self->_isolationQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10055A8F8;
  v9[3] = &unk_1012E5D58;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(isolationQueue, v9);
}

- (void)setRoutePlanningSession:(id)a3
{
  id v7 = (RoutePlanningSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v7)
  {
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    responseSnapshot = self->_responseSnapshot;
    self->_responseSnapshot = 0;

    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
  }
}

- (GEOCompanionRouteContext)sessionContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = [(NanoCompanionController *)self routePlanningSession];
  id v4 = [v3 configuration];
  int v5 = [v4 companionContext];

  return (GEOCompanionRouteContext *)v5;
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10055AC18;
  v5[3] = &unk_1012E69C0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(isolationQueue, v5);
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  id v5 = a4;
  isolationQueue = self->_isolationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10055AD38;
  v8[3] = &unk_1012E5D58;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(isolationQueue, v8);
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v6 = a3;
  isolationQueue = self->_isolationQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10055AE1C;
  v9[3] = &unk_1012E5D58;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(isolationQueue, v9);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10055AFAC;
  v13[3] = &unk_1012EB038;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(isolationQueue, v13);
}

- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10055B0C8;
  block[3] = &unk_1012E66E0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(isolationQueue, block);
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v7 = a3;
  isolationQueue = self->_isolationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10055B170;
  v10[3] = &unk_1012E5D58;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(isolationQueue, v10);
}

- (void)_updateDestinationName
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = [(NanoCompanionController *)self routePlanningSession];
  id v4 = [v3 configuration];
  id v5 = [v4 destinationWaypointRequest];
  id v6 = [(NanoCompanionController *)self routePlanningSession];
  id v7 = [v6 resolvedWaypoints];
  id v8 = [v7 destination];
  id v9 = +[RoutePlanningSession mostAppropriateNameForWaypointWithRequest:v5 composedWaypoint:v8];

  [(NanoCompanionController *)self setDestinationName:v9];
  [(NanoCompanionController *)self _sendStubRouteDetailsIfNecessary];
}

- (void)_sendStubRouteDetailsIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v4 = [(NanoCompanionController *)self routePlanningSession];
  if ([v4 sessionState] == (id)1)
  {
    response = self->_response;

    if (!response)
    {
      [(NanoCompanionController *)self _sendStubRouteDetails];
    }
  }
  else
  {
  }
}

- (void)_sendUpdatedResponse
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(NanoCompanionController *)self _createCompanionRoutesConnectionOnIsolationQueue];
  v3 = sub_100068A0C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = [(NanoRoutePlanningResponse *)self->_response numberOfRoutes];
    id v5 = [(NanoCompanionController *)self sessionContext];
    id v6 = [v5 simpleDescription];
    companionRoutesConnection = self->_companionRoutesConnection;
    *(_DWORD *)long long buf = 134218498;
    unint64_t v14 = v4;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = companionRoutesConnection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sending all (%lu) routes (context:%@) to %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(NSXPCConnection *)self->_companionRoutesConnection remoteObjectProxy];
  id v9 = [(NanoRoutePlanningMutableRequest *)self->_request copy];
  id v10 = [(NanoRoutePlanningMutableResponse *)self->_response copy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10055B690;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, (id *)buf);
  [v8 updateRoutePlanningRequest:v9 withResponse:v10 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)_sendStubRouteDetails
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(NanoCompanionController *)self sessionContext];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    anticipatingContext = self->_anticipatingContext;
    id v6 = [(NanoCompanionController *)self sessionContext];
    LODWORD(anticipatingContext) = [(GEOCompanionRouteContext *)anticipatingContext isEqual:v6];

    if (!anticipatingContext)
    {
      id v7 = [(NanoCompanionController *)self _syntheticRouteDetailsForCurrentRequest];
      id v10 = [(NanoCompanionController *)self sessionContext];
      id v8 = +[NanoRoutePlanningRequest requestForDirectionsWithCompanionRouteDetails:v7 companionRouteContext:v10];

      id v11 = (NanoRoutePlanningMutableRequest *)[v8 mutableCopy];
      request = self->_request;
      self->_request = v11;

      [(NanoCompanionController *)self _createCompanionRoutesConnectionOnIsolationQueue];
      id v13 = sub_100068A0C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v7 transportType];
        if (v14 >= 7)
        {
          __int16 v15 = +[NSString stringWithFormat:@"(unknown: %i)", v14];
        }
        else
        {
          __int16 v15 = *(&off_1012EED90 + (int)v14);
        }
        id v16 = v15;
        __int16 v17 = [(NanoCompanionController *)self sessionContext];
        id v18 = [v17 simpleDescription];
        companionRoutesConnection = self->_companionRoutesConnection;

        *(_DWORD *)long long buf = 138412802;
        unint64_t v23 = v15;
        __int16 v24 = 2112;
        id v25 = v18;
        __int16 v26 = 2114;
        id v27 = companionRoutesConnection;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sending stub route with transport type:(%@) (context:%@) to %{public}@", buf, 0x20u);
      }
      id v20 = [(NSXPCConnection *)self->_companionRoutesConnection remoteObjectProxy];
      id v21 = [(NanoRoutePlanningMutableRequest *)self->_request copy];
      [v20 anticipateRoutePlanningRequest:v21 completionHandler:&stru_1012EEC88];

      goto LABEL_11;
    }
  }
  id v7 = sub_100068A0C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(NanoCompanionController *)self sessionContext];
    id v9 = self->_anticipatingContext;
    *(_DWORD *)long long buf = 138412546;
    unint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not sending stub route details (sessionContext: %@, anticipatingContext: %@)", buf, 0x16u);
LABEL_11:
  }
}

- (void)_sendUpdatedSelectedRouteID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(NanoCompanionController *)self _currentRouteID];
  [(NanoCompanionController *)self _createCompanionRoutesConnectionOnIsolationQueue];
  unint64_t v4 = sub_100068A0C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(NanoCompanionController *)self sessionContext];
    id v6 = [v5 simpleDescription];
    companionRoutesConnection = self->_companionRoutesConnection;
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2114;
    __int16 v15 = companionRoutesConnection;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sending selected route ID %@ (context:%@) to %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [(NSXPCConnection *)self->_companionRoutesConnection remoteObjectProxy];
  id v9 = [(NanoRoutePlanningMutableRequest *)self->_request copy];
  [v8 updateRoutePlanningRequest:v9 withSelectedRouteID:v3 completionHandler:&stru_1012EECA8];
}

- (id)_syntheticRouteDetailsForCurrentRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(NanoCompanionController *)self routePlanningSession];
  unint64_t v4 = (char *)[v3 currentTransportType];
  if ((unint64_t)(v4 - 1) > 4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = dword_100F6FCA8[(void)(v4 - 1)];
  }

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(NanoCompanionController *)self routePlanningSession];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10055BCC4;
  v12[3] = &unk_1012EECD0;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateRequestsOrWaypointsUsingBlock:v12];

  id v9 = [(NanoCompanionController *)self destinationName];
  int v10 = +[GEOCompanionRouteDetails syntheticRouteDetailsWithWaypoints:v8 transportType:v5 destinationName:v9];

  return v10;
}

- (void)_clearRoutePreviews
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  clearingContext = self->_clearingContext;
  if (clearingContext)
  {
    self->_clearingContext = 0;
  }
  else
  {
    [(NanoCompanionController *)self _createCompanionRoutesConnectionOnIsolationQueue];
    unint64_t v4 = sub_100068A0C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(NanoCompanionController *)self sessionContext];
      id v6 = [v5 simpleDescription];
      companionRoutesConnection = self->_companionRoutesConnection;
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = companionRoutesConnection;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing preview routes (context:%@) to %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v8 = [(NSXPCConnection *)self->_companionRoutesConnection remoteObjectProxy];
    id v9 = [(NanoCompanionController *)self sessionContext];
    [v8 clearRoutePlanningWithContext:v9 completionHandler:&stru_1012EECF0];
  }
}

- (id)_currentRouteID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(NanoCompanionController *)self routePlanningSession];
  unint64_t v4 = [v3 currentRouteCollectionResult];
  uint64_t v5 = [(NanoCompanionController *)self _routeIDFromRouteCollectionResult:v4];

  return v5;
}

- (id)_routeIDFromRouteCollectionResult:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = sub_100103CFC;
  id v13 = sub_100104708;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10055C1D0;
  v8[3] = &unk_1012EED18;
  void v8[4] = &v9;
  [v3 withValue:v8 orError:&stru_1012EED38];
  unint64_t v4 = [(id)v10[5] currentRoute];
  uint64_t v5 = [v4 uniqueRouteID];
  id v6 = [v5 _maps_data];

  _Block_object_dispose(&v9, 8);

  return v6;
}

- (IPCServer)ipcServer
{
  return self->_ipcServer;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_ipcServer, 0);
  objc_storeStrong((id *)&self->_observingRoutes, 0);
  objc_storeStrong((id *)&self->_responseSnapshot, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clearingContext, 0);
  objc_storeStrong((id *)&self->_anticipatingContext, 0);
  objc_storeStrong((id *)&self->_lastReceivedRouteIDs, 0);
  objc_storeStrong((id *)&self->_lastPreviewedRouteID, 0);
  objc_storeStrong((id *)&self->_companionRoutesConnection, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end