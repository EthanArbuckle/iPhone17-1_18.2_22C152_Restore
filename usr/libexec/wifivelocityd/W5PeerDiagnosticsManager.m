@interface W5PeerDiagnosticsManager
- (W5PeerDiagnosticsManager)initWithStatusManager:(id)a3;
- (id)gatherPeerDiagnostics;
- (id)gatherPeerTypes;
- (id)getDPSSummary;
- (id)getLQMSummary;
- (id)getWiFiStatus;
- (id)localDiagnostics;
- (int64_t)configureDiscoveryClientAndActivate;
- (void)beginPeerDiscovery;
- (void)dealloc;
- (void)invalidateDiscoveryClient;
- (void)registerCallbacksAndActivate;
- (void)registerRequestHandler;
- (void)requestDiagnostics:(id)a3 completionBlock:(id)a4;
@end

@implementation W5PeerDiagnosticsManager

- (W5PeerDiagnosticsManager)initWithStatusManager:(id)a3
{
  self->_discoveryClientStatus = 0;
  v9.receiver = self;
  v9.super_class = (Class)W5PeerDiagnosticsManager;
  v4 = [(W5PeerDiagnosticsManager *)&v9 init];
  v5 = v4;
  if (!a3
    || !v4
    || (v4->_status = (W5StatusManager *)a3,
        dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifid.peerdiagnosticsmanager", 0),
        (v5->_queue = (OS_dispatch_queue *)v6) == 0))
  {

    v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      v11 = "-[W5PeerDiagnosticsManager initWithStatusManager:]";
      __int16 v12 = 2080;
      v13 = "W5PeerDiagnosticsManager.m";
      __int16 v14 = 1024;
      int v15 = 99;
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  self->_cachedPeerTypesResult = 0;
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)W5PeerDiagnosticsManager;
  [(W5PeerDiagnosticsManager *)&v4 dealloc];
}

- (void)invalidateDiscoveryClient
{
  objc_sync_enter(self);
  self->_discoveryClientStatus = 0;
  objc_sync_exit(self);
  self->_discoveryClient = 0;
}

- (int64_t)configureDiscoveryClientAndActivate
{
  objc_sync_enter(self);
  if (self->_discoveryClientStatus)
  {
    v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      __int16 v12 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
      __int16 v13 = 2080;
      __int16 v14 = "W5PeerDiagnosticsManager.m";
      __int16 v15 = 1024;
      int v16 = 131;
      int64_t discoveryClientStatus = 1;
      _os_log_send_and_compose_impl();
    }
    else
    {
      int64_t discoveryClientStatus = 1;
    }
  }
  else
  {
    objc_sync_exit(self);
    v5 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    self->_discoveryClient = v5;
    if (v5)
    {
      [(RPCompanionLinkClient *)v5 setInvalidationHandler:&stru_1000DF668];
      [(RPCompanionLinkClient *)self->_discoveryClient setDeviceFoundHandler:&stru_1000DF688];
      [(RPCompanionLinkClient *)self->_discoveryClient setDeviceLostHandler:&stru_1000DF6A8];
      [(RPCompanionLinkClient *)self->_discoveryClient setDispatchQueue:self->_queue];
      [(RPCompanionLinkClient *)self->_discoveryClient setControlFlags:(unint64_t)[(RPCompanionLinkClient *)self->_discoveryClient controlFlags] | 0x109102];
      objc_sync_enter(self);
      self->_int64_t discoveryClientStatus = 2;
      objc_sync_exit(self);
      dispatch_queue_t v6 = dispatch_semaphore_create(0);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100099E64;
      block[3] = &unk_1000DDC30;
      block[4] = self;
      block[5] = v6;
      dispatch_async(queue, block);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
      v8 = sub_10009756C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        __int16 v12 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
        __int16 v13 = 2080;
        __int16 v14 = "W5PeerDiagnosticsManager.m";
        __int16 v15 = 1024;
        int v16 = 173;
        _os_log_send_and_compose_impl();
      }
    }
    objc_sync_enter(self);
    int64_t discoveryClientStatus = self->_discoveryClientStatus;
  }
  objc_sync_exit(self);
  return discoveryClientStatus;
}

- (id)gatherPeerTypes
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  objc_sync_enter(self);
  cachedPeerTypesResult = self->_cachedPeerTypesResult;
  objc_sync_exit(self);
  return cachedPeerTypesResult;
}

- (void)beginPeerDiscovery
{
  if (_os_feature_enabled_impl())
  {
    if ((id)[(W5PeerDiagnosticsManager *)self configureDiscoveryClientAndActivate] == (id)2)
    {
      v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      dispatch_time_t v4 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10009A144;
      v5[3] = &unk_1000DDC30;
      v5[4] = v3;
      v5[5] = self;
      dispatch_source_set_event_handler(v3, v5);
      dispatch_activate(v3);
    }
  }
}

- (void)registerCallbacksAndActivate
{
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009A798;
  v5[3] = &unk_1000DDC30;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(queue, v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

- (void)registerRequestHandler
{
  discoveryClient = self->_discoveryClient;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009A9A8;
  v3[3] = &unk_1000DF6F8;
  v3[4] = self;
  [(RPCompanionLinkClient *)discoveryClient registerRequestID:@"com.apple.proximity.peerdiagnosticslink" options:0 handler:v3];
}

- (id)getWiFiStatus
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5StatusManager *)self->_status wifiStatus];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "rssi"))] forKeyedSubscript:@"RSSI"];
  [v3 setObject:objc_msgSend(v4, "macAddress") forKeyedSubscript:@"MAC"];
  [v3 setObject:objc_msgSend(v4, "ssidString") forKeyedSubscript:@"SSID"];
  [v3 setObject:[v4 bssid] forKeyedSubscript:@"BSSID"];
  [v4 channel];
  [v3 setObject:W5DescriptionForChannel() forKeyedSubscript:@"Channel"];
  return v3;
}

- (id)getLQMSummary
{
  if (objc_msgSend(-[CWFInterface LQMSummary](-[W5StatusManager corewifi](self->_status, "corewifi"), "LQMSummary"), "bytes"))
  {
    return (id)_CWFDebugDescriptionForLQMSummary();
  }
  else
  {
    v2 = sub_10009756C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
}

- (id)getDPSSummary
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3052000000;
  int v16 = sub_10009AF30;
  v17 = sub_10009AF40;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (sub_10009AF4C())
  {
    id v3 = dispatch_semaphore_create(0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009B03C;
    v8[3] = &unk_1000DF720;
    v8[4] = v3;
    v8[5] = self;
    v8[6] = &v9;
    v8[7] = &v13;
    [objc_msgSend((id)sub_10009AF4C(), "sharedClientWithIdentifier:", @"wifivelocityd") getDpsStatsandReply:v8];
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      objc_sync_enter(self);
      *((unsigned char *)v10 + 24) = 1;
      objc_sync_exit(self);
      v5 = sub_10009756C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315906;
        v20 = "-[W5PeerDiagnosticsManager getDPSSummary]";
        __int16 v21 = 2080;
        v22 = "W5PeerDiagnosticsManager.m";
        __int16 v23 = 1024;
        int v24 = 354;
        __int16 v25 = 1024;
        int v26 = 2;
        _os_log_send_and_compose_impl();
      }
    }
    dispatch_release(v3);
  }
  id v6 = (id)v14[5];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (id)localDiagnostics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:[-[RPCompanionLinkClient localDevice](self->_discoveryClient, "localDevice") model] forKeyedSubscript:@"DeviceModel"];
  [v3 setObject:-[W5PeerDiagnosticsManager getWiFiStatus](self, "getWiFiStatus") forKeyedSubscript:@"WiFiStatus"];
  [v3 setObject:-[W5PeerDiagnosticsManager getDPSSummary](self, "getDPSSummary") forKeyedSubscript:@"DPSSummary"];
  [v3 setObject:-[W5PeerDiagnosticsManager getLQMSummary](self, "getLQMSummary") forKeyedSubscript:@"LQMSummary"];
  return v3;
}

- (void)requestDiagnostics:(id)a3 completionBlock:(id)a4
{
  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    uint64_t v11 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]";
    __int16 v12 = 2080;
    uint64_t v13 = "W5PeerDiagnosticsManager.m";
    __int16 v14 = 1024;
    int v15 = 376;
    __int16 v16 = 2114;
    id v17 = a3;
    _os_log_send_and_compose_impl();
  }
  id v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  [v7 setControlFlags:((unint64_t)[v7 controlFlags] | 0x8102)];
  [v7 setDestinationDevice:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009B440;
  v9[3] = &unk_1000DDC80;
  v9[4] = a3;
  [v7 setInvalidationHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009B530;
  v8[3] = &unk_1000DDDD0;
  v8[4] = v7;
  v8[5] = a4;
  [v7 activateWithCompletion:v8];
}

- (id)gatherPeerDiagnostics
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id v24 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  if (objc_msgSend(-[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices"), "count"))
  {
    id v3 = dispatch_group_create();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
    id v5 = [v4 countByEnumeratingWithState:&v27 objects:v47 count:16];
    uint64_t v6 = 0;
    if (v5)
    {
      uint64_t v7 = *(void *)v28;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v8);
          if (!objc_msgSend(v9, "model", v22, v23)
            || (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", @"iPhone") & 1) != 0
            || (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", @"iPad") & 1) != 0
            || (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", @"Mac") & 1) != 0)
          {
            dispatch_group_enter(v3);
            ++v6;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10009BCA8;
            block[3] = &unk_1000DF798;
            block[4] = self;
            block[5] = v9;
            block[7] = v3;
            block[8] = &v31;
            void block[6] = v24;
            dispatch_async(queue, block);
          }
          else
          {
            uint64_t v11 = sub_10009756C();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              int v35 = 136315906;
              v36 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
              __int16 v37 = 2080;
              v38 = "W5PeerDiagnosticsManager.m";
              __int16 v39 = 1024;
              int v40 = 438;
              __int16 v41 = 2114;
              id v42 = v9;
              LODWORD(v23) = 38;
              v22 = &v35;
              _os_log_send_and_compose_impl();
            }
          }
          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        id v12 = [v4 countByEnumeratingWithState:&v27 objects:v47 count:16];
        id v5 = v12;
      }
      while (v12);
    }
    dispatch_group_enter(v3);
    uint64_t v13 = self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10009BF3C;
    v25[3] = &unk_1000DD8E0;
    v25[4] = self;
    v25[5] = v24;
    v25[6] = v3;
    dispatch_async(v13, v25);
    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v3, v14))
    {
      int v15 = sub_10009756C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136315906;
        v36 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
        __int16 v37 = 2080;
        v38 = "W5PeerDiagnosticsManager.m";
        __int16 v39 = 1024;
        int v40 = 477;
        __int16 v41 = 1024;
        LODWORD(v42) = 5;
        _os_log_send_and_compose_impl();
      }
    }
    if (v3) {
      dispatch_release(v3);
    }
    __int16 v16 = sub_10009756C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    id v17 = [[-[RPCompanionLinkClient activeDevices](self->_discoveryClient) count];
    uint64_t v18 = v32[3];
    int v35 = 136316418;
    v36 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
    __int16 v37 = 2080;
    v38 = "W5PeerDiagnosticsManager.m";
    __int16 v39 = 1024;
    int v40 = 482;
    __int16 v41 = 2048;
    id v42 = v17;
    __int16 v43 = 2048;
    uint64_t v44 = v6;
    __int16 v45 = 2048;
    uint64_t v46 = v18;
  }
  else
  {
    __int16 v21 = sub_10009756C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v35 = 136315650;
    v36 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
    __int16 v37 = 2080;
    v38 = "W5PeerDiagnosticsManager.m";
    __int16 v39 = 1024;
    int v40 = 428;
  }
  _os_log_send_and_compose_impl();
LABEL_26:
  objc_sync_enter(self);
  id v19 = [v24 copy];
  objc_sync_exit(self);
  _Block_object_dispose(&v31, 8);
  return v19;
}

@end