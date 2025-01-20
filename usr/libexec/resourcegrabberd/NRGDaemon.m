@interface NRGDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSService)idsService;
- (NRGDaemon)init;
- (NSDictionary)protobufRequestHandlers;
- (NSDictionary)protobufResponseHandlers;
- (NSMutableArray)xpcClients;
- (NSMutableDictionary)requestErrorHandlerDictionary;
- (NSOperationQueue)operationQueue;
- (NSXPCListener)xpcListener;
- (_NRGRequestDictionary)requestDictionary;
- (id)genericSendError;
- (id)getResourceRequest:(id)a3;
- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 requestHandler:(id)a7 errorHandler:(id)a8 toDevice:(id)a9 withTimeout:(double)a10;
- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 requestHandler:(id)a7 errorHandler:(id)a8 withTimeout:(double)a9;
- (id)sendProtobufResponse:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 idsRequest:(id)a6 completionHandler:(id)a7 withTimeout:(double)a8;
- (os_unfair_lock_s)requestErrorHandlerLock;
- (void)dealloc;
- (void)handleRequest:(id)a3;
- (void)handleResponse:(id)a3;
- (void)initIDS;
- (void)purgeCache;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setProtobufRequestHandlers:(id)a3;
- (void)setProtobufResponseHandlers:(id)a3;
- (void)setRequestDictionary:(id)a3;
- (void)setRequestErrorHandlerDictionary:(id)a3;
- (void)setRequestErrorHandlerLock:(os_unfair_lock_s)a3;
- (void)setXpcClients:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
- (void)xpcGetIconForBundleID:(id)a3 iconVariant:(int)a4 withTimeout:(double)a5 reply:(id)a6;
@end

@implementation NRGDaemon

- (NRGDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)NRGDaemon;
  v2 = [(NRGDaemon *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(_NRGRequestDictionary);
    requestDictionary = v2->_requestDictionary;
    v2->_requestDictionary = v3;

    v2->_requestErrorHandlerLock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestErrorHandlerDictionary = v2->_requestErrorHandlerDictionary;
    v2->_requestErrorHandlerDictionary = v5;

    objc_initWeak(&location, v2);
    objc_copyWeak(&v10, &location);
    CacheDeleteRegisterCallback();
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 5, _NSConcreteStackBlock, 3221225472, sub_100012BF0, &unk_100020B78);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  [(NSXPCListener *)self->_xpcListener setDelegate:0];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NRGDaemon *)self xpcClients];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 connection];

        if (v10)
        {
          v11 = [v9 connection];
          [v11 invalidate];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)NRGDaemon;
  [(NRGDaemon *)&v12 dealloc];
}

- (void)purgeCache
{
  uint64_t v2 = NRGGetActivePairedDeviceStorePath();
  if (v2) {
    +[NRGResourceCache invalidatePairedDevice:v2];
  }

  _objc_release_x1();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    sub_1000154F8();
  }
  v8 = v7;
  v9 = [v7 valueForEntitlement:@"com.apple.nano.nanoresourcegrabber"];
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    id v31 = v6;
    [v8 setExportedObject:self];
    id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoResourceGrabberIDSXPC];
    [v8 setExportedInterface:v10];

    [v8 resume];
    v11 = +[NSMutableIndexSet indexSet];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_super v12 = [(NRGDaemon *)self xpcClients];
    id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) connection];

          if (!v18) {
            [v11 addIndex:(char *)i + v15];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        v15 += (uint64_t)i;
      }
      while (v14);
    }

    v19 = [(NRGDaemon *)self xpcClients];
    [v19 removeObjectsAtIndexes:v11];

    v20 = [[NanoResourceGrabberNanoAgent alloc] initWithConnection:v8];
    v21 = [(NRGDaemon *)self xpcClients];
    [v21 addObject:v20];

    BOOL v22 = 1;
    id v6 = v31;
  }
  else
  {
    v11 = nrg_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100015524(v11, v23, v24, v25, v26, v27, v28, v29);
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (id)getResourceRequest:(id)a3
{
  return [(_NRGRequestDictionary *)self->_requestDictionary objectForKey:a3];
}

- (void)start
{
  [(NRGDaemon *)self initIDS];
  v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nano.nanoresourcegrabber"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  id v5 = self->_xpcListener;

  [(NSXPCListener *)v5 resume];
}

- (void)initIDS
{
  v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.resourcegrabber"];
  idsService = self->_idsService;
  self->_idsService = v3;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(NRGDaemon *)self protobufRequestHandlers];
  id v6 = [v5 keyEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v12 = nrg_daemon_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "adding handler for requestType %@", buf, 0xCu);
        }

        -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleRequest:", (unsigned __int16)[v11 integerValue]);
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [(NRGDaemon *)self protobufResponseHandlers];
  id v14 = [v13 keyEnumerator];

  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        v20 = nrg_daemon_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "adding handler for responseType %@", buf, 0xCu);
        }

        -[IDSService setProtobufAction:forIncomingResponsesOfType:](self->_idsService, "setProtobufAction:forIncomingResponsesOfType:", "handleResponse:", (unsigned __int16)[v19 integerValue]);
      }
      id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  [(IDSService *)self->_idsService addDelegate:self queue:&_dispatch_main_q];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100020BB8);
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v4 type]);
  id v6 = [(NRGDaemon *)self protobufRequestHandlers];
  id v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = nrg_daemon_log();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handling request of type %@", (uint8_t *)&v10, 0xCu);
    }

    ((void (**)(void, id))v7)[2](v7, v4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001559C();
    }
  }
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v4 type]);
  id v6 = [(NRGDaemon *)self protobufResponseHandlers];
  id v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = nrg_daemon_log();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handling response of type %@", (uint8_t *)&v10, 0xCu);
    }

    ((void (**)(void, id))v7)[2](v7, v4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100015604();
    }
  }
}

- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 requestHandler:(id)a7 errorHandler:(id)a8 withTimeout:(double)a9
{
  BOOL v26 = a6;
  uint64_t v12 = a4;
  idsService = self->_idsService;
  id v16 = a8;
  id v17 = a7;
  id v18 = a3;
  v19 = [(IDSService *)idsService nrg_allDevices];
  v20 = +[NRPairedDeviceRegistry sharedInstance];
  long long v21 = NRGGetActivePairedDevice();
  long long v22 = [v20 deviceForNRDevice:v21 fromIDSDevices:v19];

  long long v23 = (void *)IDSCopyIDForDevice();
  long long v24 = [(NRGDaemon *)self sendProtobufRequest:v18 type:v12 priority:a5 expectsResponse:v26 requestHandler:v17 errorHandler:v16 toDevice:a9 withTimeout:v23];

  return v24;
}

- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 requestHandler:(id)a7 errorHandler:(id)a8 toDevice:(id)a9 withTimeout:(double)a10
{
  BOOL v12 = a6;
  uint64_t v14 = a4;
  id v16 = (void (**)(id, id, void))a7;
  id v41 = a8;
  id v17 = a9;
  id v18 = a3;
  v19 = objc_opt_new();
  v20 = +[NSNumber numberWithBool:v12];
  [v19 setObject:v20 forKey:IDSSendMessageOptionExpectsPeerResponseKey];

  if (a10 > 0.0)
  {
    long long v21 = +[NSNumber numberWithDouble:a10];
    [v19 setObject:v21 forKey:IDSSendMessageOptionTimeoutKey];
  }
  [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionBypassDuetKey];
  if (v17) {
    id v22 = v17;
  }
  else {
    id v22 = (id)IDSDefaultPairedDevice;
  }
  long long v23 = +[NSSet setWithObject:v22];
  id v24 = objc_alloc((Class)IDSProtobuf);
  uint64_t v25 = [v18 data];

  id v26 = [v24 initWithProtobufData:v25 type:v14 isResponse:0];
  long long v27 = *(void **)(v40 + 16);
  id v42 = 0;
  id v43 = 0;
  LOBYTE(v25) = [v27 sendProtobuf:v26 toDestinations:v23 priority:a5 options:v19 identifier:&v43 error:&v42];
  id v28 = v43;
  id v29 = v42;
  if (v25)
  {
    v30 = v41;
    if (v16)
    {
      id v31 = nrg_daemon_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        long long v32 = [v26 data];
        id v33 = [v32 length];
        *(_DWORD *)buf = 134349314;
        id v45 = v33;
        __int16 v46 = 2114;
        id v47 = v28;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "IDS Request Sent: %{public}ld bytes, identifier %{public}@", buf, 0x16u);
      }
      v16[2](v16, v28, 0);
      if (v41)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v40 + 8));
        long long v34 = *(void **)(v40 + 72);
        id v35 = objc_retainBlock(v41);
        [v34 setObject:v35 forKey:v28];

        v30 = v41;
        os_unfair_lock_unlock((os_unfair_lock_t)(v40 + 8));
      }
    }
  }
  else
  {
    v36 = nrg_daemon_log();
    v30 = v41;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10001566C(v26, (uint64_t)v28, v36);
    }

    if (!v29)
    {
      id v29 = +[NSError errorWithDomain:@"com.apple.NanoResourceGrabber" code:1 userInfo:&off_100021928];
    }
    if (v16) {
      ((void (**)(id, id, id))v16)[2](v16, v28, v29);
    }
    if (v41) {
      (*((void (**)(id, id))v41 + 2))(v41, v29);
    }

    id v28 = 0;
  }
  id v37 = v28;

  return v37;
}

- (id)sendProtobufResponse:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 idsRequest:(id)a6 completionHandler:(id)a7 withTimeout:(double)a8
{
  uint64_t v11 = a4;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, id, id))a7;
  uint64_t v48 = IDSSendMessageOptionPeerResponseIdentifierKey;
  id v15 = a3;
  v38 = v13;
  id v16 = [v13 context];
  id v17 = [v16 outgoingResponseIdentifier];
  v49 = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v19 = +[NSMutableDictionary dictionaryWithDictionary:v18];

  if (a8 > 0.0)
  {
    v20 = +[NSNumber numberWithDouble:a8];
    [v19 setObject:v20 forKey:IDSSendMessageOptionTimeoutKey];
  }
  long long v21 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v22 = objc_alloc((Class)IDSProtobuf);
  long long v23 = [v15 data];

  id v24 = [v22 initWithProtobufData:v23 type:v11 isResponse:1];
  idsService = self->_idsService;
  id v40 = 0;
  id v41 = 0;
  id v26 = [(IDSService *)idsService sendProtobuf:v24 toDestinations:v21 priority:a5 options:v19 identifier:&v41 error:&v40];
  id v27 = v41;
  id v28 = v40;
  id v29 = nrg_daemon_log();
  v30 = v29;
  if (v26)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [v24 data];
      id v31 = [v37 length];
      v36 = [v38 context];
      long long v32 = [v36 outgoingResponseIdentifier];
      *(_DWORD *)buf = 134349570;
      id v43 = v31;
      __int16 v44 = 2114;
      id v45 = v27;
      __int16 v46 = 2114;
      id v47 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "IDS Response Sent: %{public}ld bytes, identifier %{public}@ (for %{public}@)", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    sub_100015720(v13, (uint64_t)v27, v30);
  }

  if (v14)
  {
    if (v28) {
      char v33 = 1;
    }
    else {
      char v33 = (char)v26;
    }
    if ((v33 & 1) == 0)
    {
      id v28 = [(NRGDaemon *)self genericSendError];
    }
    v14[2](v14, v26, v28);
  }
  id v34 = v27;

  return v34;
}

- (id)genericSendError
{
  return +[NSError errorWithDomain:@"com.apple.NanoResourceGrabber" code:1 userInfo:&off_100021950];
}

- (void)xpcGetIconForBundleID:(id)a3 iconVariant:(int)a4 withTimeout:(double)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = NRGGetActivePairedDevice();
  id v13 = [v12 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (v13)
  {
    uint64_t v14 = [(IDSService *)self->_idsService nrg_allDevices];
    id v15 = +[NRPairedDeviceRegistry sharedInstance];
    id v16 = [v15 deviceForNRDevice:v12 fromIDSDevices:v14];

    if (v16 && ([v16 isNearby] & 1) != 0)
    {
      id v17 = objc_alloc_init(NRGResourceRequest);
      [(NRGResourceRequest *)v17 setBundleID:v10];
      [(NRGResourceRequest *)v17 setType:0];
      [(NRGResourceRequest *)v17 setVariant:v8];
      *(void *)&long long v49 = 0;
      *((void *)&v49 + 1) = &v49;
      uint64_t v50 = 0x3032000000;
      v51 = sub_100012854;
      v52 = sub_100012864;
      id v53 = 0;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100014334;
      v38[3] = &unk_100020BE0;
      id v43 = &v49;
      id v37 = v10;
      id v39 = v37;
      id v40 = self;
      id v42 = v11;
      int v44 = v8;
      id v41 = v13;
      [(NRGResourceRequest *)v17 setCompletionBlock:v38];
      id v18 = nrg_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = +[NSNumber numberWithDouble:a5];
        *(_DWORD *)buf = 138412546;
        id v46 = v37;
        __int16 v47 = 2112;
        uint64_t v48 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Requesting icon for %@ from remote device with timeout %@", buf, 0x16u);
      }
      uint64_t v20 = [(NRGResourceRequest *)v17 sendWithTransport:self toDevice:v16 withTimeout:a5];
      long long v21 = *(void **)(*((void *)&v49 + 1) + 40);
      *(void *)(*((void *)&v49 + 1) + 40) = v20;

      if (*(void *)(*((void *)&v49 + 1) + 40))
      {
        -[_NRGRequestDictionary setObject:forKey:](self->_requestDictionary, "setObject:forKey:", v17);
      }
      else
      {
        v30 = nrg_daemon_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10001587C((uint64_t)v37, v30, v31, v32, v33, v34, v35, v36);
        }
      }
      _Block_object_dispose(&v49, 8);
    }
    else
    {
      id v22 = nrg_daemon_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v49) = 138412290;
        *(void *)((char *)&v49 + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "not connected to paired device, will not request icon for %@", (uint8_t *)&v49, 0xCu);
      }

      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
  else
  {
    long long v23 = nrg_daemon_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100015810((uint64_t)v10, v23, v24, v25, v26, v27, v28, v29);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  BOOL v12 = nrg_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 || !a6)
  {
    if (v13)
    {
      int v17 = 138543362;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to send IDS Request for identifier %{public}@", (uint8_t *)&v17, 0xCu);
    }

    os_unfair_lock_lock(&self->_requestErrorHandlerLock);
    uint64_t v14 = [(NSMutableDictionary *)self->_requestErrorHandlerDictionary objectForKey:v10];
    if (v14) {
      [(NSMutableDictionary *)self->_requestErrorHandlerDictionary removeObjectForKey:v10];
    }
    os_unfair_lock_unlock(&self->_requestErrorHandlerLock);
    if (v11)
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [(NRGDaemon *)self genericSendError];
    }
    id v16 = v15;
    if (v14) {
      ((void (**)(void, id))v14)[2](v14, v15);
    }
  }
  else
  {
    if (v13)
    {
      int v17 = 138543362;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IDS Request sent for identifier %{public}@", (uint8_t *)&v17, 0xCu);
    }

    os_unfair_lock_lock(&self->_requestErrorHandlerLock);
    [(NSMutableDictionary *)self->_requestErrorHandlerDictionary removeObjectForKey:v10];
    os_unfair_lock_unlock(&self->_requestErrorHandlerLock);
  }
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSDictionary)protobufRequestHandlers
{
  return self->_protobufRequestHandlers;
}

- (void)setProtobufRequestHandlers:(id)a3
{
}

- (NSDictionary)protobufResponseHandlers
{
  return self->_protobufResponseHandlers;
}

- (void)setProtobufResponseHandlers:(id)a3
{
}

- (NSMutableArray)xpcClients
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcClients:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (_NRGRequestDictionary)requestDictionary
{
  return self->_requestDictionary;
}

- (void)setRequestDictionary:(id)a3
{
}

- (os_unfair_lock_s)requestErrorHandlerLock
{
  return self->_requestErrorHandlerLock;
}

- (void)setRequestErrorHandlerLock:(os_unfair_lock_s)a3
{
  self->_requestErrorHandlerLock = a3;
}

- (NSMutableDictionary)requestErrorHandlerDictionary
{
  return self->_requestErrorHandlerDictionary;
}

- (void)setRequestErrorHandlerDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestErrorHandlerDictionary, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_protobufResponseHandlers, 0);
  objc_storeStrong((id *)&self->_protobufRequestHandlers, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end