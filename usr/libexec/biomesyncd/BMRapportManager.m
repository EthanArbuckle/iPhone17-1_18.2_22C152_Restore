@interface BMRapportManager
- (BMRapportManager)initWithQueue:(id)a3;
- (BMRapportManagerDelegate)delegate;
- (BOOL)discoveryManager:(id)a3 supportsDevice:(id)a4;
- (OS_dispatch_queue)queue;
- (id)deviceWithIdentifier:(id)a3;
- (id)discoveredDevices;
- (id)localDevice;
- (void)activateWithCompletion:(id)a3;
- (void)discoveryManager:(id)a3 didDiscoverDevice:(id)a4;
- (void)discoveryManager:(id)a3 didLoseDevice:(id)a4;
- (void)finishedSendingRequestsToDevice:(id)a3;
- (void)handleActivationForDevice:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)registerForSigterm;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5;
- (void)sendNextRequestToDevice:(id)a3;
- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BMRapportManager

- (BMRapportManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMRapportManager;
  v6 = [(BMRapportManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = [[BMRapportDiscoveryManager alloc] initWithServiceName:@"com.apple.biomesyncd.rapport" delegate:v7 queue:v7->_queue];
    discoveryManager = v7->_discoveryManager;
    v7->_discoveryManager = v8;

    uint64_t v10 = +[BMRapportClient clientForHandlingRequestsWithServiceName:@"com.apple.biomesyncd.rapport" queue:v7->_queue];
    requestHandlerClient = v7->_requestHandlerClient;
    v7->_requestHandlerClient = (BMRapportRequestHandlerClient *)v10;

    [(BMRapportManager *)v7 registerForSigterm];
  }

  return v7;
}

- (void)registerForSigterm
{
  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  id v5 = self->_sigtermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001A1B4;
  handler[3] = &unk_10006CB58;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  requestHandlerClient = self->_requestHandlerClient;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001A408;
  v20[3] = &unk_10006D198;
  v20[4] = self;
  id v8 = v5;
  id v21 = v8;
  v9 = v6;
  v22 = v9;
  [(BMRapportRequestHandlerClient *)requestHandlerClient activateWithCompletion:v20];
  dispatch_group_enter(v9);
  discoveryManager = self->_discoveryManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A4A0;
  v17[3] = &unk_10006D198;
  v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  v12 = v9;
  v19 = v12;
  [(BMRapportDiscoveryManager *)discoveryManager startWithCompletion:v17];
  if (v4)
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001A538;
    v14[3] = &unk_10006CB80;
    id v15 = v11;
    id v16 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)queue, v14);
  }
}

- (void)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BMRapportManager: start", v4, 2u);
  }

  [(BMRapportManager *)self activateWithCompletion:0];
}

- (void)stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BMRapportManager: stop", v4, 2u);
  }

  [(BMRapportDiscoveryManager *)self->_discoveryManager stop];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BMRapportManager: invalidate", v6, 2u);
  }

  [(BMRapportRequestHandlerClient *)self->_requestHandlerClient invalidate];
  requestHandlerClient = self->_requestHandlerClient;
  self->_requestHandlerClient = 0;

  [(BMRapportDiscoveryManager *)self->_discoveryManager invalidate];
  discoveryManager = self->_discoveryManager;
  self->_discoveryManager = 0;
}

- (id)discoveredDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  discoveryManager = self->_discoveryManager;

  return [(BMRapportDiscoveryManager *)discoveryManager devices];
}

- (id)localDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  discoveryManager = self->_discoveryManager;

  return [(BMRapportDiscoveryManager *)discoveryManager localDevice];
}

- (id)deviceWithIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = [(BMRapportDiscoveryManager *)self->_discoveryManager deviceWithIdentifier:v5];

  return v6;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  [(BMRapportRequestHandlerClient *)self->_requestHandlerClient registerRequestID:v11 options:v10 requestHandler:v9];
}

- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6
{
  queue = self->_queue;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  uint64_t v16 = RPOptionTimeoutSeconds;
  v17 = &off_100072D30;
  id v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [(BMRapportManager *)self sendRequest:v14 request:v13 device:v12 options:v15 responseHandler:v11];
}

- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = __biome_log_for_category();
  id v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = [v14 shortenedRapportIdentifier];
      *(_DWORD *)buf = 138412290;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: enqueueing request", buf, 0xCu);
    }
    if (v13) {
      v20 = v13;
    }
    else {
      v20 = &__NSDictionary0__struct;
    }
    id v18 = [v20 mutableCopy];
    [v18 setObject:v12 forKeyedSubscript:@"~~REQUEST_ID~~"];
    id v21 = [v16 copy];
    [v18 setObject:v21 forKeyedSubscript:@"~~RESPONSE_HANDLER~~"];

    [v18 setObject:v15 forKeyedSubscript:@"~~OPTIONS~~"];
    v22 = [v14 requestQueue];
    [v22 addObject:v18];

    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v14 shortenedRapportIdentifier];
      v25 = [v14 requestQueue];
      *(_DWORD *)buf = 138412546;
      v42 = v24;
      __int16 v43 = 2112;
      v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "BMRapportDevice[%@]: request queue %@", buf, 0x16u);
    }
    v26 = [v14 client];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      objc_initWeak(&location, v14);
      objc_initWeak(&from, self);
      v28 = __biome_log_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [v14 shortenedRapportIdentifier];
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: activating client", buf, 0xCu);
      }
      v30 = [v14 device];
      v31 = +[BMRapportClient clientForCommunicatingWithDevice:v30 serviceName:@"com.apple.biomesyncd.rapport" queue:self->_queue];
      [v14 setClient:v31];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001AF74;
      v37[3] = &unk_10006CA48;
      objc_copyWeak(&v38, &location);
      v32 = [v14 client];
      [v32 setInvalidationHandler:v37];

      v33 = [v14 client];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001AFB8;
      v34[3] = &unk_10006D1C0;
      objc_copyWeak(&v35, &from);
      objc_copyWeak(&v36, &location);
      [v33 activateWithCompletion:v34];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    sub_100045A1C();
  }
}

- (void)handleActivationForDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = __biome_log_for_category();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v6 shortenedRapportIdentifier];
      id v11 = (void *)v10;
      CFStringRef v12 = @"failed with error, ";
      if (!v7) {
        CFStringRef v12 = @"completed";
      }
      *(_DWORD *)id v18 = 138412802;
      *(void *)&v18[4] = v10;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v12;
      if (v7) {
        CFStringRef v13 = v7;
      }
      else {
        CFStringRef v13 = &stru_10006DB68;
      }
      *(_WORD *)&v18[22] = 2112;
      CFStringRef v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: activation %@%@", v18, 0x20u);
    }
    if (v7)
    {
      if ([(__CFString *)v7 code] == (id)-71165)
      {
        id v14 = [(__CFString *)v7 domain];
        unsigned int v15 = [v14 isEqualToString:RPErrorDomain];

        if (v15)
        {
          [(BMRapportDiscoveryManager *)self->_discoveryManager ignoreDevice:v6];
          id v16 = __biome_log_for_category();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [v6 shortenedRapportIdentifier];
            *(_DWORD *)id v18 = 138412290;
            *(void *)&v18[4] = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: determined to not support service com.apple.biomesyncd.rapport", v18, 0xCu);
          }
        }
      }
      [v6 invalidateClientWithError:v7 *(_OWORD *)v18, *(void *)&v18[16]);
    }
    else
    {
      [(BMRapportManager *)self sendNextRequestToDevice:v6];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100045A50();
    }
  }
}

- (void)sendNextRequestToDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = [v4 requestQueue];
    id v6 = [v5 popFirstObject];

    if (v6)
    {
      v7 = [v6 objectForKeyedSubscript:@"~~REQUEST_ID~~"];
      id v8 = [v6 objectForKeyedSubscript:@"~~OPTIONS~~"];
      id v9 = [v8 mutableCopy];
      uint64_t v10 = v9;
      if (v9) {
        id v11 = v9;
      }
      else {
        id v11 = (id)objc_opt_new();
      }
      CFStringRef v12 = v11;

      uint64_t v13 = [v6 objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
      id v14 = (void *)v13;
      if (v7 && v13)
      {
        [v6 setObject:0 forKeyedSubscript:@"~~REQUEST_ID~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~OPTIONS~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
        unsigned int v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = [v4 shortenedRapportIdentifier];
          *(_DWORD *)buf = 138412802;
          v25 = v16;
          __int16 v26 = 2112;
          BOOL v27 = v6;
          __int16 v28 = 2112;
          v29 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: being sent request %@ with options %@", buf, 0x20u);
        }
        objc_initWeak((id *)buf, v4);
        v17 = [v4 requestQueue];
        id v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 count] != 0);
        [v12 setObject:v18 forKeyedSubscript:RPOptionMoreComing];

        CFStringRef v19 = [v4 client];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10001B5EC;
        v21[3] = &unk_10006D1E8;
        id v22 = v14;
        objc_copyWeak(&v23, (id *)buf);
        v21[4] = self;
        [v19 sendRequestID:v7 request:v6 options:v12 responseHandler:v21];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100045AC4(v4, (uint64_t)v6, v20);
        }

        [(BMRapportManager *)self sendNextRequestToDevice:v4];
      }
    }
    else
    {
      [(BMRapportManager *)self finishedSendingRequestsToDevice:v4];
    }
  }
  else
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100045A90();
    }
  }
}

- (void)finishedSendingRequestsToDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = __biome_log_for_category();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 shortenedRapportIdentifier];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BMRapportDevice[%@]: request queue empty, invalidating client", (uint8_t *)&v8, 0xCu);
    }
    [v4 invalidateClientWithError:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100045B78();
    }
  }
}

- (void)discoveryManager:(id)a3 didDiscoverDevice:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v7 = [(BMRapportManager *)self delegate];
  [v7 rapportManager:self didDiscoverBMRapportDevice:v6];
}

- (void)discoveryManager:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 shortenedRapportIdentifier];
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: lost", (uint8_t *)&v10, 0xCu);
  }
  int v8 = [(BMRapportManager *)self delegate];
  [v8 rapportManager:self didLoseNearbyBMRapportDevice:v5];

  id v9 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:10 userInfo:0];
  [v5 invalidateClientWithError:v9];
}

- (BOOL)discoveryManager:(id)a3 supportsDevice:(id)a4
{
  id v4 = self;
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v7 = [(BMRapportManager *)v4 delegate];
  LOBYTE(v4) = [v7 rapportManager:v4 isDeviceSupported:v6];

  return (char)v4;
}

- (BMRapportManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BMRapportManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);

  objc_storeStrong((id *)&self->_requestHandlerClient, 0);
}

@end