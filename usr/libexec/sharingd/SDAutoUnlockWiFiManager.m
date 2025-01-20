@interface SDAutoUnlockWiFiManager
+ (id)sharedManager;
- (BOOL)_addWiFiRequest:(id)a3;
- (BOOL)_peerFoundInStateInfo:(id)a3;
- (BOOL)awdlStartFailed;
- (BOOL)awdlStarting;
- (BOOL)awdlTimerFired;
- (NISession)niSession;
- (NSMutableArray)wifiRequestQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)awdlTimer;
- (SDAutoUnlockWiFiManager)init;
- (SDAutoUnlockWiFiRequest)currentRequest;
- (id)awdlNetwork;
- (void)__handleAWDLDisabledIfNeededForRequest:(id)a3;
- (void)_addObservers;
- (void)_cancelWiFiRequest:(id)a3;
- (void)_createNISession;
- (void)_disableRangeableNI;
- (void)_enableRangeableIfNeededNI;
- (void)_handleAWDLTimerFired;
- (void)_handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5;
- (void)_handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4;
- (void)_handleVirtualInterfacesChanged:(id)a3;
- (void)_invalidateAWDLTimer;
- (void)_invalidateCurrentRequest;
- (void)_invalidateWiFiRequest:(id)a3;
- (void)_processRequestQueue;
- (void)_resetManagerState;
- (void)_restartAWDLTimer;
- (void)_startAWDLWithInfo:(id)a3;
- (void)_startRangingIfPeerFoundInStateInfo:(id)a3 awdlUpSameTime:(BOOL)a4;
- (void)_startRangingWithNI;
- (void)_stopAWDL;
- (void)cancelWiFiRequest:(id)a3;
- (void)handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5;
- (void)handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4;
- (void)handleVirtualInterfacesChanged:(id)a3;
- (void)rangingReportEventForWiFiInterfaceWithName:(id)a3 data:(id)a4 error:(id)a5;
- (void)scheduleWiFiRequest:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didReceiveRangingAuthRecommendation:(BOOL)a4 forObject:(id)a5;
- (void)setAwdlNetwork:(id)a3;
- (void)setAwdlStartFailed:(BOOL)a3;
- (void)setAwdlStarting:(BOOL)a3;
- (void)setAwdlTimer:(id)a3;
- (void)setAwdlTimerFired:(BOOL)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setNiSession:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWifiRequestQueue:(id)a3;
- (void)start;
- (void)updateWiFiRequest:(id)a3 setRangingPeer:(id)a4;
@end

@implementation SDAutoUnlockWiFiManager

+ (id)sharedManager
{
  if (qword_100980260 != -1) {
    dispatch_once(&qword_100980260, &stru_1008CF6A8);
  }
  v2 = (void *)qword_100980258;

  return v2;
}

- (SDAutoUnlockWiFiManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockWiFiManager;
  v2 = [(SDAutoUnlockWiFiManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharing.SDAutoUnlockWiFiManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    wifiRequestQueue = v2->_wifiRequestQueue;
    v2->_wifiRequestQueue = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A73E4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);

  [(SDAutoUnlockWiFiManager *)self _createNISession];
}

- (void)_createNISession
{
  dispatch_queue_t v3 = SFMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A74A8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_addObservers
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleVirtualInterfacesChanged:" name:@"com.apple.sharingd.VirtualInterfacesChanged" object:0];
}

- (BOOL)_addWiFiRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 identifier];
    int v12 = 136315650;
    v13 = "-[SDAutoUnlockWiFiManager _addWiFiRequest:]";
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", (uint8_t *)&v12, 0x20u);
  }
  objc_super v8 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
  unsigned __int8 v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0)
  {
    v10 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
    [v10 addObject:v4];

    [(SDAutoUnlockWiFiManager *)self _processRequestQueue];
  }

  return 1;
}

- (void)_invalidateWiFiRequest:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(__CFString *)v4 identifier];
    *(_DWORD *)buf = 136315650;
    v28 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
    __int16 v29 = 2112;
    CFStringRef v30 = v4;
    __int16 v31 = 2112;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", buf, 0x20u);
  }
  v7 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  unsigned __int8 v8 = [v7 isEqual:v4];

  if (v8)
  {
    if (![(SDAutoUnlockWiFiManager *)self awdlStarting])
    {
LABEL_8:
      [(SDAutoUnlockWiFiManager *)self _disableRangeableNI];
      [(SDAutoUnlockWiFiManager *)self _stopAWDL];
      [(SDAutoUnlockWiFiManager *)self setCurrentRequest:0];
      goto LABEL_16;
    }
    unsigned __int8 v9 = [(SDAutoUnlockWiFiManager *)self awdlNetwork];
    if (v9 || [(SDAutoUnlockWiFiManager *)self awdlStartFailed])
    {

      goto LABEL_8;
    }
    if ([(SDAutoUnlockWiFiManager *)self awdlTimerFired]) {
      goto LABEL_8;
    }
    v20 = auto_unlock_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ([(SDAutoUnlockWiFiManager *)self awdlStarting]) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      v22 = [(SDAutoUnlockWiFiManager *)self awdlNetwork];
      if ([(SDAutoUnlockWiFiManager *)self awdlStartFailed]) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      unsigned int v24 = [(SDAutoUnlockWiFiManager *)self awdlTimerFired];
      *(_DWORD *)buf = 136316162;
      v28 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      if (v24) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      __int16 v29 = 2112;
      CFStringRef v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      __int16 v33 = 2112;
      CFStringRef v34 = v23;
      __int16 v35 = 2112;
      CFStringRef v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Waiting for network before disable. awdlStarting: %@, awdlNetwork: %@, awdlStartFailed: %@, awdlTimerFired: %@", buf, 0x34u);
    }
    v26 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    [v26 setWaitingForNetworkToDisable:1];
  }
  else
  {
    v10 = [(__CFString *)v4 identifier];
    v11 = +[NSPredicate predicateWithFormat:@"identifier == %@", v10];

    int v12 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
    v13 = [v12 filteredArrayUsingPredicate:v11];
    __int16 v14 = [v13 firstObject];

    id v15 = auto_unlock_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = [(__CFString *)v14 identifier];
        unsigned int v18 = [(__CFString *)v14 waitingForNetworkToDisable];
        *(_DWORD *)buf = 136315906;
        v28 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
        __int16 v29 = 2112;
        CFStringRef v30 = v14;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 1024;
        LODWORD(v34) = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s removing  non current request: %@ identifier: %@ waitingForNetworkToDisable: %d", buf, 0x26u);
      }
      id v15 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
      [v15 removeObject:v14];
    }
    else if (v16)
    {
      v19 = [(__CFString *)v4 identifier];
      *(_DWORD *)buf = 136315650;
      v28 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      __int16 v29 = 2112;
      CFStringRef v30 = v4;
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s request(%@) not found !! identifier: %@", buf, 0x20u);
    }
  }
LABEL_16:
}

- (void)scheduleWiFiRequest:(id)a3
{
  id v5 = a3;
  v6 = [(SDAutoUnlockWiFiManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A7C90;
  block[3] = &unk_1008CBB30;
  v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)cancelWiFiRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SDAutoUnlockWiFiManager *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001A7EB0;
    v6[3] = &unk_1008CA640;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)updateWiFiRequest:(id)a3 setRangingPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SDAutoUnlockWiFiManager *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A7F90;
  v11[3] = &unk_1008CA640;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)_processRequestQueue
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self currentRequest];

  if (v4)
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      id v7 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      unsigned __int8 v8 = [v7 identifier];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
      __int16 v21 = 1024;
      *(_DWORD *)v22 = 323;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v6;
      __int16 v23 = 2112;
      unsigned int v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %d Already processing request: %@ identifier: %@", buf, 0x26u);
    }
  }
  else
  {
    id v9 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
    id v5 = [v9 firstObject];

    if (v5)
    {
      id v10 = [(SDAutoUnlockWiFiManager *)self wifiRequestQueue];
      [v10 removeObjectAtIndex:0];

      [(SDAutoUnlockWiFiManager *)self setCurrentRequest:v5];
      SEL v11 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      id v12 = [v11 queueAvailableHandler];

      if (v12)
      {
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        id v13 = [(SDAutoUnlockWiFiManager *)self currentRequest];
        __int16 v14 = [v13 queueAvailableHandler];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001A82C8;
        v17[3] = &unk_1008CF6F8;
        v17[4] = self;
        id v5 = v5;
        unsigned int v18 = v5;
        objc_copyWeak(&v19, (id *)buf);
        ((void (**)(void, void *))v14)[2](v14, v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v16 = [(SDAutoUnlockWiFiManager *)self currentRequest];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
          __int16 v21 = 2112;
          *(void *)v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s no queueAvailableHandler. Invalidating current request %@", buf, 0x16u);
        }
        [(SDAutoUnlockWiFiManager *)self _invalidateCurrentRequest];
      }
    }
  }
}

- (void)_cancelWiFiRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SDAutoUnlockWiFiManager _cancelWiFiRequest:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  if (v4)
  {
    [v4 setInvalidationHandler:0];
    id v7 = +[SDAutoUnlockWiFiManager sharedManager];
    [v7 _invalidateWiFiRequest:v4];

    if (([v4 invalidateCalled] & 1) == 0)
    {
      [v4 setInvalidateCalled:1];
      [v4 _invalidate];
    }
  }
}

- (void)_resetManagerState
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SDAutoUnlockWiFiManager _resetManagerState]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(SDAutoUnlockWiFiManager *)self setAwdlStartFailed:0];
  [(SDAutoUnlockWiFiManager *)self setAwdlStarting:0];
  [(SDAutoUnlockWiFiManager *)self setAwdlTimerFired:0];
}

- (void)_invalidateCurrentRequest
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    id v7 = [v6 identifier];
    int v9 = 136315650;
    __int16 v10 = "-[SDAutoUnlockWiFiManager _invalidateCurrentRequest]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s current Request: %@ identifier: %@", (uint8_t *)&v9, 0x20u);
  }
  [(SDAutoUnlockWiFiManager *)self _resetManagerState];
  int v8 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  [(SDAutoUnlockWiFiManager *)self _cancelWiFiRequest:v8];

  [(SDAutoUnlockWiFiManager *)self setCurrentRequest:0];
  [(SDAutoUnlockWiFiManager *)self _processRequestQueue];
}

- (void)_startRangingWithNI
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  int v5 = [v4 rangingPeer];
  id v6 = [v5 niRangingPeer];
  CFStringRef v25 = v6;
  id v7 = +[NSArray arrayWithObjects:&v25 count:1];

  int v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(SDAutoUnlockWiFiManager *)self niSession];
    CFStringRef v10 = @"YES";
    v20 = "-[SDAutoUnlockWiFiManager _startRangingWithNI]";
    int v19 = 136315650;
    if (!v9) {
      CFStringRef v10 = @"NO";
    }
    __int16 v21 = 2112;
    CFStringRef v22 = v10;
    __int16 v23 = 2112;
    unsigned int v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Starting ranging (manager: %@, peers: %@)", (uint8_t *)&v19, 0x20u);
  }
  __int16 v11 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  [v11 rangingTimeout];

  id v12 = objc_alloc((Class)NIRangingAuthConfiguration);
  __int16 v13 = [v7 objectAtIndexedSubscript:0];
  __int16 v14 = [v13 macAddress];
  id v15 = [v7 objectAtIndexedSubscript:0];
  BOOL v16 = [v15 secureRangingKeyID];
  id v17 = [v12 initAsResponder:0 macAddress:v14 key:v16];

  unsigned int v18 = [(SDAutoUnlockWiFiManager *)self niSession];
  [v18 runWithConfiguration:v17];

  kdebug_trace();
}

- (void)_enableRangeableIfNeededNI
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  unsigned __int8 v5 = [v4 isRangingInitiator];

  if ((v5 & 1) == 0)
  {
    id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    id v7 = [v6 rangingPeer];

    if (v7)
    {
      int v8 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      int v9 = [v8 rangingPeer];
      CFStringRef v10 = [v9 niRangingPeer];

      if (v10)
      {
        __int16 v11 = [(SDAutoUnlockWiFiManager *)self currentRequest];
        id v12 = [v11 rangingPeer];
        __int16 v13 = [v12 niRangingPeer];
        v32 = v13;
        __int16 v14 = +[NSArray arrayWithObjects:&v32 count:1];

        id v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v16 = [(SDAutoUnlockWiFiManager *)self niSession];
          CFStringRef v17 = @"YES";
          v27 = "-[SDAutoUnlockWiFiManager _enableRangeableIfNeededNI]";
          int v26 = 136315650;
          if (!v16) {
            CFStringRef v17 = @"NO";
          }
          __int16 v28 = 2112;
          CFStringRef v29 = v17;
          __int16 v30 = 2112;
          __int16 v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s startRangingFromPeers (manager: %@, peers: %@)", (uint8_t *)&v26, 0x20u);
        }
        id v18 = objc_alloc((Class)NIRangingAuthConfiguration);
        int v19 = [v14 objectAtIndexedSubscript:0];
        v20 = [v19 macAddress];
        __int16 v21 = [v14 objectAtIndexedSubscript:0];
        CFStringRef v22 = [v21 secureRangingKeyID];
        id v23 = [v18 initAsResponder:1 macAddress:v20 key:v22];

        unsigned int v24 = [(SDAutoUnlockWiFiManager *)self niSession];
        [v24 runWithConfiguration:v23];

        CFStringRef v25 = [(SDAutoUnlockWiFiManager *)self currentRequest];
        [v25 setRangeable:1];
      }
      else
      {
        __int16 v14 = auto_unlock_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_1001AB5E0();
        }
      }
    }
    else
    {
      __int16 v14 = auto_unlock_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1001AB5AC();
      }
    }
  }
}

- (void)_disableRangeableNI
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  unsigned int v5 = [v4 rangeable];

  if (v5)
  {
    id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    id v7 = [v6 rangingPeer];
    int v8 = [v7 niRangingPeer];
    v20 = v8;
    int v9 = +[NSArray arrayWithObjects:&v20 count:1];

    CFStringRef v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(SDAutoUnlockWiFiManager *)self niSession];
      CFStringRef v12 = @"YES";
      id v15 = "-[SDAutoUnlockWiFiManager _disableRangeableNI]";
      int v14 = 136315650;
      if (!v11) {
        CFStringRef v12 = @"NO";
      }
      __int16 v16 = 2112;
      CFStringRef v17 = v12;
      __int16 v18 = 2112;
      int v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s stopRangingFromPeers (manager: %@, peers: %@)", (uint8_t *)&v14, 0x20u);
    }
    __int16 v13 = [(SDAutoUnlockWiFiManager *)self niSession];
    [v13 invalidate];

    [(SDAutoUnlockWiFiManager *)self _createNISession];
  }
}

- (void)session:(id)a3 didReceiveRangingAuthRecommendation:(BOOL)a4 forObject:(id)a5
{
  BOOL v5 = a4;
  id v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    int v9 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    CFStringRef v10 = [v9 rangingPeer];
    __int16 v11 = [v10 niRangingPeer];
    *(_DWORD *)buf = 136315650;
    v20 = "-[SDAutoUnlockWiFiManager session:didReceiveRangingAuthRecommendation:forObject:]";
    __int16 v21 = 2112;
    CFStringRef v22 = v8;
    __int16 v23 = 2112;
    unsigned int v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s should authenticate: %@, peer: %@", buf, 0x20u);
  }
  CFStringRef v12 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  __int16 v13 = [v12 rangingPeer];
  int v14 = [v13 niRangingPeer];

  if (v14)
  {
    id v15 = [(SDAutoUnlockWiFiManager *)self queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001A9130;
    v17[3] = &unk_1008CB9D8;
    v17[4] = self;
    BOOL v18 = v5;
    dispatch_async(v15, v17);
  }
  else
  {
    __int16 v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1001AB614();
    }
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(SDAutoUnlockWiFiManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A9334;
  v8[3] = &unk_1008CA640;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NI session invalidated, restarting session", buf, 2u);
  }

  [(SDAutoUnlockWiFiManager *)self _createNISession];
  if ([v5 code] == (id)-10008)
  {
    id v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NI session is invalidated after completing the one-shot ranging, so ignoring the completed error", buf, 2u);
    }
  }
  else
  {
    CFStringRef v8 = [(SDAutoUnlockWiFiManager *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001A9544;
    v9[3] = &unk_1008CA640;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (void)_startAWDLWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 awdlInfo];
  id v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = [v4 identifier];
    int v18 = 136315906;
    int v19 = "-[SDAutoUnlockWiFiManager _startAWDLWithInfo:]";
    __int16 v20 = 2112;
    id v21 = v4;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    __int16 v24 = 2112;
    CFStringRef v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Starting AWDL request: %@ identifier: %@ info: %@", (uint8_t *)&v18, 0x2Au);
  }
  id v9 = +[SDStatusMonitor sharedMonitor];
  id v10 = [v9 awdlDevice];

  if (!v10)
  {
    __int16 v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1001AB648(v4);
    }
    goto LABEL_11;
  }
  [[SDAutoUnlockWiFiManagerContext alloc] initWithRequest:v4 wiFiManager:self];
  int started = WiFiDeviceClientStartNetwork();
  if (!started)
  {
    [(SDAutoUnlockWiFiManager *)self _enableRangeableIfNeededNI];
    [(SDAutoUnlockWiFiManager *)self _restartAWDLTimer];
    goto LABEL_13;
  }
  int v12 = started;
  __int16 v13 = auto_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1001AB700(v4);
  }

  [(SDAutoUnlockWiFiManager *)self setAwdlStartFailed:1];
  [(SDAutoUnlockWiFiManager *)self setAwdlStarting:0];
  int v14 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  id v15 = [v14 awdlStartedHandler];

  if (v15)
  {
    __int16 v16 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    CFStringRef v17 = [v16 awdlStartedHandler];
    v17[2](v17, 0, v12);

LABEL_11:
  }
LABEL_13:
}

- (void)_stopAWDL
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self awdlNetwork];

  if (v4)
  {
    id v5 = +[SDStatusMonitor sharedMonitor];
    [v5 awdlDevice];

    id v6 = [SDAutoUnlockWiFiManagerContext alloc];
    id v7 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    [(SDAutoUnlockWiFiManagerContext *)v6 initWithRequest:v7 wiFiManager:self];

    CFStringRef v8 = [(SDAutoUnlockWiFiManager *)self awdlNetwork];
    int v9 = WiFiDeviceClientStopNetwork();

    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      int v12 = [(SDAutoUnlockWiFiManager *)self awdlNetwork];
      int v13 = 136315906;
      int v14 = "-[SDAutoUnlockWiFiManager _stopAWDL]";
      __int16 v15 = 2112;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      int v18 = v12;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Stopping AWDL currentRequest: %@ network %@, error %d", (uint8_t *)&v13, 0x26u);
    }
    [(SDAutoUnlockWiFiManager *)self setAwdlNetwork:0];
  }
  [(SDAutoUnlockWiFiManager *)self _resetManagerState];
}

- (void)__handleAWDLDisabledIfNeededForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(SDAutoUnlockWiFiManager *)self _invalidateAWDLTimer];
  uint64_t v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  if (v6)
  {
    id v7 = (void *)v6;
    CFStringRef v8 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    unsigned int v9 = [v4 isEqual:v8];

    if (v9)
    {
      id v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [v4 identifier];
        int v12 = 136315650;
        int v13 = "-[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:]";
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        __int16 v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s AWDL went down. Invalidating current request: %@ identifier: %@", (uint8_t *)&v12, 0x20u);
      }
      [(SDAutoUnlockWiFiManager *)self _invalidateCurrentRequest];
    }
  }
}

- (void)_restartAWDLTimer
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _restartAWDLTimer]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Restarting AWDL bring up timer", buf, 0xCu);
  }

  id v5 = [(SDAutoUnlockWiFiManager *)self awdlTimer];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v7 = [(SDAutoUnlockWiFiManager *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001AA03C;
    v12[3] = &unk_1008CA3B0;
    objc_copyWeak(&v13, (id *)buf);
    CFStringRef v8 = sub_1001B1B10(0, v7, v12);
    [(SDAutoUnlockWiFiManager *)self setAwdlTimer:v8];

    unsigned int v9 = [(SDAutoUnlockWiFiManager *)self awdlTimer];
    dispatch_resume(v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  id v10 = [(SDAutoUnlockWiFiManager *)self awdlTimer];
  dispatch_time_t v11 = sub_1001B1AF8(30.0);
  sub_1001B1BC4(v10, v11);
}

- (void)_invalidateAWDLTimer
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockWiFiManager *)self awdlTimer];

  if (v4)
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      CFStringRef v8 = "-[SDAutoUnlockWiFiManager _invalidateAWDLTimer]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Invalidating AWDL bring up timer", (uint8_t *)&v7, 0xCu);
    }

    BOOL v6 = [(SDAutoUnlockWiFiManager *)self awdlTimer];
    dispatch_source_cancel(v6);

    [(SDAutoUnlockWiFiManager *)self setAwdlTimer:0];
  }
}

- (void)_handleAWDLTimerFired
{
  dispatch_queue_t v3 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    unsigned int v9 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s AWDL bring up timer fired", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  unsigned int v6 = [v5 waitingForNetworkToDisable];

  if (v6)
  {
    int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      unsigned int v9 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Disabling ranging and awdl for timer", (uint8_t *)&v8, 0xCu);
    }

    [(SDAutoUnlockWiFiManager *)self _invalidateCurrentRequest];
  }
  else
  {
    [(SDAutoUnlockWiFiManager *)self setAwdlTimerFired:1];
  }
}

- (void)_startRangingIfPeerFoundInStateInfo:(id)a3 awdlUpSameTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = [(SDAutoUnlockWiFiManager *)self _peerFoundInStateInfo:v6];
  unsigned int v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    dispatch_time_t v11 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    *(_DWORD *)__int16 v28 = 136315650;
    *(void *)&v28[4] = "-[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:]";
    if ([v11 rangingStarted]) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v10;
    __int16 v29 = 2112;
    CFStringRef v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s peer found: %@, ranging started: %@", v28, 0x20u);
  }
  id v13 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  unsigned int v14 = v8 & ~[v13 rangingStarted];

  id v15 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  __int16 v16 = v15;
  if (v14 != 1)
  {
    char v25 = [v15 rangingStarted] | v8;

    if (v25) {
      return;
    }
    __int16 v23 = auto_unlock_log();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    __int16 v24 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    int v26 = [v24 rangingPeer];
    v27 = [v26 macAddressData];
    *(_DWORD *)__int16 v28 = 136315394;
    *(void *)&v28[4] = "-[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:]";
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v27;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Peer missing from AWDL state. Peer: %@", v28, 0x16u);

LABEL_17:
LABEL_18:

    return;
  }
  [v15 setRangingStarted:1];

  __int16 v17 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  int v18 = [v17 peerFoundHandler];

  if (v18)
  {
    __int16 v19 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    int v20 = [v19 peerFoundHandler];
    v20[2](v20, v4);
  }
  [(SDAutoUnlockWiFiManager *)self _startRangingWithNI];
  id v21 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  __int16 v22 = [v21 rangingStartedHandler];

  if (v22)
  {
    __int16 v23 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    __int16 v24 = [v23 rangingStartedHandler];
    v24[2]();
    goto LABEL_17;
  }
}

- (BOOL)_peerFoundInStateInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
  int v7 = [v6 rangingPeer];
  unsigned int v8 = [v7 macAddressData];

  unsigned int v9 = [v4 objectForKeyedSubscript:@"LINK_CHANGED_PEER_LIST"];
  CFStringRef v10 = auto_unlock_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v26 = "-[SDAutoUnlockWiFiManager _peerFoundInStateInfo:]";
    __int16 v27 = 2112;
    __int16 v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Received peer list: %@", buf, 0x16u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = [[*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:@"STATION_MAC"] intValue];
        unsigned __int8 v17 = [v8 isEqualToData:v16];

        if (v17)
        {
          BOOL v18 = 1;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_13:

  return v18;
}

- (void)handleVirtualInterfacesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockWiFiManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001AA880;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleVirtualInterfacesChanged:(id)a3
{
  id v4 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SDAutoUnlockWiFiManager *)self currentRequest];

  if (v5)
  {
    id v6 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    unsigned __int8 v7 = [v6 isRangingInitiator];

    if (v7)
    {
      id v8 = +[SDStatusMonitor sharedMonitor];
      unsigned int v9 = [v8 awdlState];

      CFStringRef v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v26 = 136315394;
        *(void *)&v26[4] = "-[SDAutoUnlockWiFiManager _handleVirtualInterfacesChanged:]";
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Received state from awdl: %@", v26, 0x16u);
      }

      id v11 = [v9 objectForKeyedSubscript:@"LINK_CHANGED_IS_LINKDOWN"];
      unsigned int v12 = [v11 BOOLValue];

      id v13 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      unsigned int v14 = [v13 calledAWDLStarted];

      id v15 = auto_unlock_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = @"YES";
        if (v12) {
          CFStringRef v17 = @"NO";
        }
        else {
          CFStringRef v17 = @"YES";
        }
        *(_DWORD *)int v26 = 136315650;
        *(void *)&v26[4] = "-[SDAutoUnlockWiFiManager _handleVirtualInterfacesChanged:]";
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v17;
        if (!v14) {
          CFStringRef v16 = @"NO";
        }
        *(_WORD *)&v26[22] = 2112;
        CFStringRef v27 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s linkup: %@, calledAWDLStarted: %@", v26, 0x20u);
      }

      if (v12)
      {
        if ([(SDAutoUnlockWiFiManager *)self awdlStarting])
        {
          BOOL v18 = auto_unlock_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignore linkdown notification while starting AWDL", v26, 2u);
          }
        }
        else
        {
          long long v20 = [(SDAutoUnlockWiFiManager *)self currentRequest];
          [(SDAutoUnlockWiFiManager *)self __handleAWDLDisabledIfNeededForRequest:v20];
        }
      }
      else
      {
        if (v14)
        {
          BOOL v19 = 0;
        }
        else
        {
          long long v21 = [(SDAutoUnlockWiFiManager *)self currentRequest];
          [v21 setCalledAWDLStarted:1];

          long long v22 = [(SDAutoUnlockWiFiManager *)self currentRequest];
          long long v23 = [v22 awdlStartedHandler];

          BOOL v19 = v23 != 0;
          if (v23)
          {
            __int16 v24 = [(SDAutoUnlockWiFiManager *)self currentRequest];
            char v25 = [v24 awdlStartedHandler];
            ((void (**)(void, NSObject *, void))v25)[2](v25, v9, 0);
          }
          else
          {
            __int16 v24 = auto_unlock_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_1001AB7C8(self);
            }
          }
        }
        -[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:](self, "_startRangingIfPeerFoundInStateInfo:awdlUpSameTime:", v9, v19, *(_OWORD *)v26, *(void *)&v26[16]);
      }
    }
    else
    {
      unsigned int v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1001AB86C();
      }
    }
  }
}

- (void)rangingReportEventForWiFiInterfaceWithName:(id)a3 data:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = [(SDAutoUnlockWiFiManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AACD0;
  block[3] = &unk_1008CAF18;
  id v13 = v7;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SDAutoUnlockWiFiManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001AAF08;
  v13[3] = &unk_1008CC9D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v9 identifier];
    int v24 = 136315650;
    char v25 = "-[SDAutoUnlockWiFiManager _handleNetworkStarted:request:error:]";
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", (uint8_t *)&v24, 0x20u);
  }
  [(SDAutoUnlockWiFiManager *)self _invalidateAWDLTimer];
  id v13 = [(SDAutoUnlockWiFiManager *)self currentRequest];

  if (v13 == v9)
  {
    [(SDAutoUnlockWiFiManager *)self setAwdlNetwork:v8];
    [(SDAutoUnlockWiFiManager *)self setAwdlStarting:0];
    id v14 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    unsigned int v15 = [v14 waitingForNetworkToDisable];

    if (v15)
    {
      [(SDAutoUnlockWiFiManager *)self _invalidateCurrentRequest];
    }
    else
    {
      int64_t v16 = [(SDAutoUnlockWiFiManager *)self currentRequest];
      int v17 = [v16 calledAWDLStarted];

      if ((v17 & 1) == 0)
      {
        if (a5)
        {
          [(SDAutoUnlockWiFiManager *)self setAwdlStartFailed:1];
          BOOL v18 = auto_unlock_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1001AB8AC(a5, v18);
          }
        }
        BOOL v19 = [(SDAutoUnlockWiFiManager *)self currentRequest];
        [v19 setCalledAWDLStarted:1];

        long long v20 = [(SDAutoUnlockWiFiManager *)self currentRequest];
        long long v21 = [v20 awdlStartedHandler];

        if (v21)
        {
          long long v22 = [(SDAutoUnlockWiFiManager *)self currentRequest];
          long long v23 = [v22 awdlStartedHandler];
          v23[2](v23, 0, a5);
        }
      }
    }
  }
}

- (void)handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SDAutoUnlockWiFiManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB230;
  block[3] = &unk_1008CBB30;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(SDAutoUnlockWiFiManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SDAutoUnlockWiFiManager *)self currentRequest];
    int v9 = 136315650;
    id v10 = "-[SDAutoUnlockWiFiManager _handleNetworkStoppedWithError:error:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s AWDL disabled request: %@ currentRequest: %@", (uint8_t *)&v9, 0x20u);
  }
  [(SDAutoUnlockWiFiManager *)self __handleAWDLDisabledIfNeededForRequest:v5];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)awdlTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAwdlTimer:(id)a3
{
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAwdlNetwork:(id)a3
{
}

- (BOOL)awdlStartFailed
{
  return self->_awdlStartFailed;
}

- (void)setAwdlStartFailed:(BOOL)a3
{
  self->_awdlStartFailed = a3;
}

- (BOOL)awdlStarting
{
  return self->_awdlStarting;
}

- (void)setAwdlStarting:(BOOL)a3
{
  self->_awdlStarting = a3;
}

- (BOOL)awdlTimerFired
{
  return self->_awdlTimerFired;
}

- (void)setAwdlTimerFired:(BOOL)a3
{
  self->_awdlTimerFired = a3;
}

- (SDAutoUnlockWiFiRequest)currentRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentRequest:(id)a3
{
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
}

- (NSMutableArray)wifiRequestQueue
{
  return self->_wifiRequestQueue;
}

- (void)setWifiRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiRequestQueue, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong(&self->_awdlNetwork, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end