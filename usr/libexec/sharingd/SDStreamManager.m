@interface SDStreamManager
+ (id)sharedManager;
- (BOOL)servicesContainIdentifier:(id)a3;
- (NSMutableArray)companionServices;
- (NSMutableArray)incomingStreams;
- (NSMutableDictionary)continuationStreams;
- (NSMutableDictionary)managers;
- (NSNetService)service;
- (NSString)serviceType;
- (NSTimer)publishTimer;
- (SDStreamManager)initWithServiceType:(id)a3;
- (int64_t)connectedStreams;
- (void)activityContinuationPayloadSent:(id)a3;
- (void)addObservers;
- (void)addService:(id)a3;
- (void)closeStreamsForIdentifier:(id)a3;
- (void)companionStreamClosedStreams:(id)a3;
- (void)continuationStream:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6;
- (void)dealloc;
- (void)debugInfoRequested:(id)a3;
- (void)getContinuationStreamsForMessage:(id)a3 bundleID:(id)a4 usingID:(id)a5 completionHandler:(id)a6;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)publish;
- (void)publishTimerFired:(id)a3;
- (void)registerConnectedStreams;
- (void)registerManager:(id)a3;
- (void)removeObservers;
- (void)removeService:(id)a3;
- (void)restartPublishTimer;
- (void)setCompanionServices:(id)a3;
- (void)setConnectedStreams:(int64_t)a3;
- (void)setContinuationStreams:(id)a3;
- (void)setIncomingStreams:(id)a3;
- (void)setManagers:(id)a3;
- (void)setPublishTimer:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceType:(id)a3;
- (void)unpublish;
- (void)unregisterConnectedStreams;
- (void)unregisterManager:(id)a3;
@end

@implementation SDStreamManager

+ (id)sharedManager
{
  if (qword_10097FBD0 != -1) {
    dispatch_once(&qword_10097FBD0, &stru_1008CAC38);
  }
  v2 = (void *)qword_10097FBC8;

  return v2;
}

- (SDStreamManager)initWithServiceType:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SDStreamManager;
  v6 = [(SDStreamManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    service = v6->_service;
    v6->_service = 0;

    objc_storeStrong((id *)&v7->_serviceType, a3);
    uint64_t v9 = objc_opt_new();
    managers = v7->_managers;
    v7->_managers = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    companionServices = v7->_companionServices;
    v7->_companionServices = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    incomingStreams = v7->_incomingStreams;
    v7->_incomingStreams = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    continuationStreams = v7->_continuationStreams;
    v7->_continuationStreams = (NSMutableDictionary *)v15;

    v7->_connectedStreams = 0;
    [(SDStreamManager *)v7 addObservers];
  }

  return v7;
}

- (void)dealloc
{
  [(SDStreamManager *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)SDStreamManager;
  [(SDStreamManager *)&v3 dealloc];
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"debugInfoRequested:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];
  [v3 addObserver:self selector:"activityContinuationPayloadSent:" name:@"com.apple.sharingd.ContinuationPayloadSent" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)debugInfoRequested:(id)a3
{
  id v10 = (id)objc_opt_new();
  if (self->_service) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  id v5 = +[NSString stringWithFormat:@"Publishing:%@", v4];
  [v10 addObject:v5];

  v6 = +[NSString stringWithFormat:@"Registered Activities:%d", [(NSMutableArray *)self->_companionServices count]];
  [v10 addObject:v6];

  v7 = +[NSString stringWithFormat:@"Connected Streams:%ld", self->_connectedStreams];
  [v10 addObject:v7];

  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  sub_100047144(v9, (uint64_t)v10);
}

- (void)activityContinuationPayloadSent:(id)a3
{
  [a3 userInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000540C0;
  v5[3] = &unk_1008CA640;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (BOOL)servicesContainIdentifier:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_companionServices;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) serviceType:v14];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        v8 |= v12;
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)registerConnectedStreams
{
  ++self->_connectedStreams;
  id v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t connectedStreams = self->_connectedStreams;
    int v5 = 134217984;
    int64_t v6 = connectedStreams;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Added connected stream, total = %ld", (uint8_t *)&v5, 0xCu);
  }
}

- (void)getContinuationStreamsForMessage:(id)a3 bundleID:(id)a4 usingID:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v41 = a5;
  id v40 = a6;
  uint64_t v11 = streams_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v12 = [v9 objectForKeyedSubscript:kSFCompanionServiceBonjourNameKey];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Streams are being requested for bonjour name = %@", buf, 0xCu);
  }
  id v42 = v9;

  NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
  CFStringRef v49 = @"Could not set up internal streams";
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  long long v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v13];

  long long v15 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v16 = [v15 wirelessEnabled];

  if ((v16 & 1) == 0)
  {
    long long v17 = +[SDStatusMonitor sharedMonitor];
    unsigned int v18 = [v17 alwaysSendPayload];

    if (!v18)
    {
      v33 = streams_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000559D8();
      }

      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      CFStringRef v47 = @"Wi-Fi not enabled";
      v20 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v34 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:50 userInfo:v20];
      v31 = v40;
      (*((void (**)(id, void, void *))v40 + 2))(v40, 0, v34);

      v23 = v10;
      v19 = v42;
      goto LABEL_16;
    }
  }
  v19 = v9;
  v20 = [v9 objectForKeyedSubscript:kSFCompanionServiceBonjourNameKey, self];
  if (!v20)
  {
    v32 = streams_log();
    v23 = v10;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10005593C();
    }

    v31 = v40;
    (*((void (**)(id, void, void *))v40 + 2))(v40, 0, v14);
LABEL_16:
    v24 = v41;
    goto LABEL_29;
  }
  id v21 = [objc_alloc((Class)NSNetService) initWithDomain:@"local." type:@"_continuity._tcp." name:v20];
  v22 = v21;
  v23 = v10;
  if (v21)
  {
    *(void *)buf = 0;
    id v45 = 0;
    [v21 _setIncludesAWDL:1];
    v24 = v41;
    if ([v22 getInputStream:buf outputStream:&v45])
    {
      v25 = [SDStreamHandler alloc];
      v26 = [(SDStreamHandler *)v25 initWithInputStream:*(void *)buf outputStream:v45 isClient:1];
      v27 = v26;
      if (v26)
      {
        [(SDStreamHandler *)v26 setBundleID:v23];
        v28 = [SDCompanionStream alloc];
        v29 = [v9 objectForKeyedSubscript:kSFCompanionServiceAuthorDataKey];
        v30 = [(SDCompanionStream *)v28 initWithAuthorData:v29 streamHandler:v27];

        [(SDCompanionStream *)v30 setDelegate:v39];
        [(SDCompanionStream *)v30 setIdentifier:v41];
        [(SDCompanionStream *)v30 start];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100054938;
        v43[3] = &unk_1008CAC60;
        v31 = v40;
        id v44 = v40;
        [(SDCompanionStream *)v30 getStreamsWithCompletionHandler:v43];
        [*(id *)(v39 + 48) setObject:v30 forKeyedSubscript:v41];

        v19 = v42;
      }
      else
      {
        v37 = streams_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_1000559A4();
        }

        v31 = v40;
        (*((void (**)(id, void, void *))v40 + 2))(v40, 0, v14);
      }
    }
    else
    {
      v36 = streams_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100055970();
      }

      v31 = v40;
      (*((void (**)(id, void, void *))v40 + 2))(v40, 0, v14);
    }
  }
  else
  {
    v35 = streams_log();
    v24 = v41;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100055970();
    }

    v31 = v40;
    (*((void (**)(id, void, void *))v40 + 2))(v40, 0, v14);
  }

LABEL_29:
}

- (void)unregisterConnectedStreams
{
  --self->_connectedStreams;
  id v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t connectedStreams = self->_connectedStreams;
    int v7 = 134217984;
    int64_t v8 = connectedStreams;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removed connected streams, total = %ld", (uint8_t *)&v7, 0xCu);
  }

  if (self->_connectedStreams <= 0)
  {
    int v5 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v6 = [v5 alwaysSendPayload];

    if ((v6 & 1) == 0) {
      [(SDStreamManager *)self unpublish];
    }
  }
}

- (void)restartPublishTimer
{
  id v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting publish timer", v7, 2u);
  }

  publishTimer = self->_publishTimer;
  if (publishTimer) {
    [(NSTimer *)publishTimer invalidate];
  }
  int v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"publishTimerFired:" selector:0 userInfo:0 repeats:90.0];
  unsigned __int8 v6 = self->_publishTimer;
  self->_publishTimer = v5;
}

- (void)publishTimerFired:(id)a3
{
  if (self->_connectedStreams <= 0)
  {
    id v4 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v5 = [v4 alwaysSendPayload];

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v6 = streams_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Publish timer fired, no more connected streams", v8, 2u);
      }

      [(SDStreamManager *)self unpublish];
    }
  }
  publishTimer = self->_publishTimer;
  self->_publishTimer = 0;
}

- (void)publish
{
  if (self->_service)
  {
    id v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already publishing", v11, 2u);
    }

    if (!self->_connectedStreams) {
      [(SDStreamManager *)self restartPublishTimer];
    }
  }
  else
  {
    id v4 = (__CFString *)sub_1001B40B8();
    if (v4)
    {
      unsigned __int8 v5 = (NSNetService *)[objc_alloc((Class)NSNetService) initWithDomain:@"local" type:self->_serviceType name:v4 port:8771];
      service = self->_service;
      self->_service = v5;

      int v7 = self->_service;
      if (v7)
      {
        [(NSNetService *)v7 setDelegate:self];
        [(NSNetService *)self->_service _setIncludesAWDL:1];
        int64_t v8 = self->_service;
        id v9 = +[NSRunLoop mainRunLoop];
        [(NSNetService *)v8 scheduleInRunLoop:v9 forMode:NSRunLoopCommonModes];

        [(NSNetService *)self->_service publishWithOptions:3];
        [(SDStreamManager *)self restartPublishTimer];
        id v10 = streams_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Publishing net service", buf, 2u);
        }
      }
      else
      {
        id v10 = streams_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100055A40();
        }
      }
    }
    else
    {
      id v10 = streams_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100055A0C();
      }
    }
  }
}

- (void)unpublish
{
  if (self->_service)
  {
    id v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unpublishing", v7, 2u);
    }

    service = self->_service;
    unsigned __int8 v5 = +[NSRunLoop mainRunLoop];
    [(NSNetService *)service removeFromRunLoop:v5 forMode:NSRunLoopCommonModes];

    [(NSNetService *)self->_service setDelegate:0];
    [(NSNetService *)self->_service stop];
    unsigned __int8 v6 = self->_service;
    self->_service = 0;
  }
}

- (void)addService:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_companionServices containsObject:v4])
  {
    unsigned __int8 v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Service has already been added", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    [(NSMutableArray *)self->_companionServices addObject:v4];
    unsigned __int8 v6 = streams_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v4 serviceType];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Added service to publisher %@ with identifier %@", (uint8_t *)&v10, 0x16u);
    }
    int64_t v8 = +[SDStatusMonitor sharedMonitor];
    unsigned int v9 = [v8 alwaysSendPayload];

    if (v9) {
      [(SDStreamManager *)self publish];
    }
  }
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = [v4 serviceType];
    int v8 = 138412290;
    unsigned int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removed stream support for activity with identifier = %@", (uint8_t *)&v8, 0xCu);
  }
  [(NSMutableArray *)self->_companionServices removeObject:v4];
  if (![(NSMutableArray *)self->_companionServices count])
  {
    int v7 = streams_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No more activities that support streams", (uint8_t *)&v8, 2u);
    }

    [(SDStreamManager *)self unpublish];
  }
}

- (void)closeStreamsForIdentifier:(id)a3
{
  continuationStreams = self->_continuationStreams;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)continuationStreams objectForKeyedSubscript:v5];
  [v6 stop];
  [(NSMutableDictionary *)self->_continuationStreams removeObjectForKey:v5];
}

- (void)registerManager:(id)a3
{
  managers = self->_managers;
  id v4 = a3;
  id v5 = [v4 managerID];
  [(NSMutableDictionary *)managers setObject:v4 forKeyedSubscript:v5];
}

- (void)unregisterManager:(id)a3
{
  managers = self->_managers;
  id v4 = [a3 managerID];
  [(NSMutableDictionary *)managers removeObjectForKey:v4];
}

- (void)netServiceDidPublish:(id)a3
{
  id v3 = a3;
  id v4 = streams_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Published net service = %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = streams_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100055A74((uint64_t)v6, (uint64_t)v7, v8);
  }

  [(SDStreamManager *)self unpublish];
  dispatch_time_t v9 = sub_1001B1AF8(2.0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055398;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)netServiceDidStop:(id)a3
{
  id v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Publisher stopped publishing", v4, 2u);
  }
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  dispatch_time_t v9 = [[SDStreamHandler alloc] initWithInputStream:v8 outputStream:v7 isClient:0];

  if (v9)
  {
    int v10 = [[SDCompanionStream alloc] initWithStreamHandler:v9];
    [(SDCompanionStream *)v10 setDelegate:self];
    [(SDCompanionStream *)v10 start];
    [(NSMutableArray *)self->_incomingStreams addObject:v10];
    id v11 = streams_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Net service did accept streams", v12, 2u);
    }
  }
  else
  {
    streams_log();
    int v10 = (SDCompanionStream *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      sub_100055AFC();
    }
  }
}

- (void)continuationStream:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  p_managers = (uint64_t *)&self->_managers;
  managers = self->_managers;
  unsigned __int8 v16 = [v11 managerID];
  long long v17 = [(NSMutableDictionary *)managers objectForKeyedSubscript:v16];

  if (v17)
  {
    if (objc_opt_respondsToSelector())
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100055774;
      v23[3] = &unk_1008CA150;
      id v24 = v13;
      [v17 manager:self connectedToService:v11 withFileHandle:v12 acceptHandler:v23];
    }
    unsigned int v18 = [v17 bundleID];
    [v10 setBundleID:v18];

    v19 = [v11 identifier];
    [v10 setIdentifier:v19];

    continuationStreams = self->_continuationStreams;
    id v21 = [v10 identifier];
    [(NSMutableDictionary *)continuationStreams setObject:v10 forKeyedSubscript:v21];

    [(NSMutableArray *)self->_incomingStreams removeObject:v10];
  }
  else
  {
    v22 = streams_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100055B30(v11, p_managers, v22);
    }
  }
}

- (void)companionStreamClosedStreams:(id)a3
{
  id v7 = a3;
  [v7 setDelegate:0];
  id v4 = [v7 identifier];

  if (v4)
  {
    continuationStreams = self->_continuationStreams;
    id v6 = [v7 identifier];
    [(NSMutableDictionary *)continuationStreams removeObjectForKey:v6];
  }
  [(NSMutableArray *)self->_incomingStreams removeObject:v7];
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceType:(id)a3
{
}

- (NSNetService)service
{
  return (NSNetService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)managers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManagers:(id)a3
{
}

- (NSMutableArray)companionServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompanionServices:(id)a3
{
}

- (NSMutableArray)incomingStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncomingStreams:(id)a3
{
}

- (NSMutableDictionary)continuationStreams
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContinuationStreams:(id)a3
{
}

- (int64_t)connectedStreams
{
  return self->_connectedStreams;
}

- (void)setConnectedStreams:(int64_t)a3
{
  self->_int64_t connectedStreams = a3;
}

- (NSTimer)publishTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPublishTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_continuationStreams, 0);
  objc_storeStrong((id *)&self->_incomingStreams, 0);
  objc_storeStrong((id *)&self->_companionServices, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end