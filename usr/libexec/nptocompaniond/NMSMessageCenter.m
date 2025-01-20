@interface NMSMessageCenter
- (IDSDevice)device;
- (IDSService)service;
- (NMSMessageCenter)initWithDevice:(id)a3 service:(id)a4;
- (OS_dispatch_queue)actionQ;
- (OS_dispatch_queue)queue;
- (id)_pbMappingForMessageID:(unsigned __int16)a3;
- (id)delegate;
- (int64_t)_messagePriorityWithPriority:(unint64_t)a3;
- (void)_expireMessages;
- (void)_handleError:(id)a3 context:(id)a4;
- (void)_sendResponse:(id)a3;
- (void)_updateExpireTimerWithDate:(id)a3;
- (void)addErrorHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)addIncomingFileHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)addRequestHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)addResponseHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)dealloc;
- (void)dropExtantMessages;
- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5;
- (void)resume;
- (void)sendFile:(id)a3 completionHandler:(id)a4;
- (void)sendRequest:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NMSMessageCenter

- (NMSMessageCenter)initWithDevice:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)NMSMessageCenter;
  v9 = [(NMSMessageCenter *)&v40 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_service, a4);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v7 uniqueID];
    id v14 = +[NSString stringWithFormat:@"%@.%@", v12, v13];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestHandlers = v10->_requestHandlers;
    v10->_requestHandlers = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    errorHandlers = v10->_errorHandlers;
    v10->_errorHandlers = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    responseHandlers = v10->_responseHandlers;
    v10->_responseHandlers = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fileHandlers = v10->_fileHandlers;
    v10->_fileHandlers = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pbMapping = v10->_pbMapping;
    v10->_pbMapping = v25;

    v27 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v28 = [v27 firstObject];

    v29 = [v28 stringByAppendingPathComponent:@"com.apple.NanoPhotos"];
    v30 = [v7 uniqueIDOverride];
    v31 = [v29 stringByAppendingPathComponent:v30];

    v32 = +[NSFileManager defaultManager];
    [v32 createDirectoryAtPath:v31 withIntermediateDirectories:0 attributes:0 error:0];
    v33 = [v31 stringByAppendingPathComponent:@"nms.com.apple.private.alloy.photos.proxy.db"];
    v34 = [[NMSPersistentDictionary alloc] initWithPath:v33 objectClass:objc_opt_class()];
    persistentContextStore = v10->_persistentContextStore;
    v10->_persistentContextStore = v34;

    uint64_t v36 = +[NSMutableDictionary dictionary];
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = (NSMutableDictionary *)v36;

    v38 = sub_10005CDAC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Created NMSMessageCenter %@.", buf, 0xCu);
    }
  }
  return v10;
}

- (void)dealloc
{
  expireTimer = self->_expireTimer;
  if (expireTimer) {
    dispatch_source_cancel(expireTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NMSMessageCenter;
  [(NMSMessageCenter *)&v4 dealloc];
}

- (void)addRequestHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v8 = a3;
  requestHandlers = self->_requestHandlers;
  v6 = +[NSValue valueWithBytes:&v8 objCType:":"];
  id v7 = +[NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)requestHandlers setObject:v6 forKey:v7];
}

- (void)addErrorHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v8 = a3;
  errorHandlers = self->_errorHandlers;
  v6 = +[NSValue valueWithBytes:&v8 objCType:":"];
  id v7 = +[NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)errorHandlers setObject:v6 forKey:v7];
}

- (void)addResponseHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v8 = a3;
  responseHandlers = self->_responseHandlers;
  v6 = +[NSValue valueWithBytes:&v8 objCType:":"];
  id v7 = +[NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)responseHandlers setObject:v6 forKey:v7];
}

- (void)addIncomingFileHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v8 = a3;
  fileHandlers = self->_fileHandlers;
  v6 = +[NSValue valueWithBytes:&v8 objCType:":"];
  id v7 = +[NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)fileHandlers setObject:v6 forKey:v7];
}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v11 = objc_alloc_init(NMSPBMapping);
  [(NMSPBMapping *)v11 setRequestClass:a3];
  [(NMSPBMapping *)v11 setResponseClass:a4];
  pbMapping = self->_pbMapping;
  v10 = +[NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)pbMapping setObject:v11 forKeyedSubscript:v10];
}

- (id)_pbMappingForMessageID:(unsigned __int16)a3
{
  pbMapping = self->_pbMapping;
  uint64_t v4 = +[NSNumber numberWithUnsignedShort:a3];
  uint64_t v5 = [(NSMutableDictionary *)pbMapping objectForKeyedSubscript:v4];

  return v5;
}

- (void)_expireMessages
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[NMSMessageCenter _expireMessages]";
    __int16 v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NanoMessagingService.m";
    __int16 v30 = 1024;
    int v31 = 209;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = +[NSDate date];
  uint64_t v5 = +[NSMutableArray array];
  persistentContextStore = self->_persistentContextStore;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006CB98;
  v21[3] = &unk_1000939B8;
  id v16 = v4;
  id v22 = v16;
  id v7 = v5;
  id v23 = v7;
  v24 = self;
  [(NMSPersistentDictionary *)persistentContextStore enumerateObjectsSortedByExpirationDate:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(const char **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = +[NSError errorWithDomain:@"NMSErrorDomain" code:2 userInfo:0];
        dispatch_queue_t v15 = sub_10005CDAC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Expire: %@", buf, 0xCu);
        }

        [(NMSMessageCenter *)self _handleError:v14 context:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)_updateExpireTimerWithDate:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_nextExpireTimerFireDate || objc_msgSend(v8, "compare:") == (id)-1)
  {
    expireTimer = self->_expireTimer;
    if (expireTimer)
    {
      [v8 timeIntervalSinceNow];
      if (v5 >= 0.0) {
        int64_t v6 = (uint64_t)(v5 * 1000.0 * 1000000.0);
      }
      else {
        int64_t v6 = 0;
      }
      dispatch_time_t v7 = dispatch_time(0, v6);
      dispatch_source_set_timer(expireTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

- (void)resume
{
  [(IDSService *)self->_service addDelegate:self queue:self->_queue];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006CDA0;
  block[3] = &unk_1000939E0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)actionQ
{
  return self->_queue;
}

- (void)dropExtantMessages
{
  obj = self->_persistentContextStore;
  objc_sync_enter(obj);
  [(NMSPersistentDictionary *)self->_persistentContextStore removeAllObjects];
  [(NSMutableDictionary *)self->_completionHandlers removeAllObjects];
  objc_sync_exit(obj);
}

- (void)sendRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.NanoPhotos.NanoMessagingService.sendRequest"];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D0A8;
  block[3] = &unk_1000936E8;
  id v10 = v4;
  uint64_t v11 = self;
  v12 = v5;
  dispatch_time_t v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)_sendResponse:(id)a3
{
  id v4 = a3;
  [v4 setSent:1];
  id v5 = [v4 request];
  int64_t v6 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.NanoPhotos.NanoMessagingService._sendResponse"];
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006D6A0;
  v11[3] = &unk_100093A08;
  id v12 = v5;
  id v13 = v4;
  id v14 = self;
  dispatch_queue_t v15 = v6;
  id v8 = v6;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(queue, v11);
}

- (void)_handleError:(id)a3 context:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [v6 filePath];
  if (v9)
  {
    id v10 = (void *)v9;
    unsigned int v11 = [v6 shouldUnlinkFile];

    if (v11)
    {
      id v12 = sub_10005CDAC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 filePath];
        *(_DWORD *)uint64_t v36 = 138412290;
        *(void *)&v36[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unlinking %@", v36, 0xCu);
      }
      id v14 = [v6 filePath];
      int v15 = unlink((const char *)[v14 fileSystemRepresentation]);

      if (v15)
      {
        id v16 = sub_10005CDAC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v35 = [v6 filePath];
          *(_DWORD *)uint64_t v36 = 138412290;
          *(void *)&v36[4] = v35;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to unlink %@", v36, 0xCu);
        }
      }
    }
  }
  long long v17 = [v8 userInfo];
  id v18 = [v17 mutableCopy];

  [v18 setObject:v6 forKey:@"NMSContext"];
  long long v19 = [v8 domain];
  id v20 = [v8 code];

  v21 = +[NSError errorWithDomain:v19 code:v20 userInfo:v18];

  id v22 = [v6 idsIdentifier];

  if (v22)
  {
    persistentContextStore = self->_persistentContextStore;
    v24 = [v6 idsIdentifier];
    [(NMSPersistentDictionary *)persistentContextStore removeObjectForKey:v24];

    completionHandlers = self->_completionHandlers;
    v26 = [v6 idsIdentifier];
    v27 = [(NSMutableDictionary *)completionHandlers objectForKey:v26];

    if (v27)
    {
      __int16 v28 = [v6 idsIdentifier];
      ((void (**)(void, void *, void *))v27)[2](v27, v28, v21);
    }
    v29 = self->_completionHandlers;
    __int16 v30 = [v6 idsIdentifier];
    [(NSMutableDictionary *)v29 removeObjectForKey:v30];
  }
  errorHandlers = self->_errorHandlers;
  v32 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v6 messageID]);
  v33 = [(NSMutableDictionary *)errorHandlers objectForKey:v32];

  if (v33)
  {
    *(void *)uint64_t v36 = 0;
    [v33 getValue:v36];
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained performSelector:*(void *)v36 withObject:v21];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = [(NMSPersistentDictionary *)self->_persistentContextStore objectForKey:v10];
  id v13 = v12;
  if (v12)
  {
    if (a6)
    {
      if (([v12 isFromFile] & 1) == 0)
      {
        if (![v13 isFromRequest]
          || (id v14 = self->_responseHandlers,
              +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v13 messageID]), int v15 = objc_claimAutoreleasedReturnValue(), -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15), v16 = objc_claimAutoreleasedReturnValue(), v16, v15, !v16))
        {
          unsigned __int8 v17 = [v13 isFromRequest];
          id v18 = sub_10005CDAC();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              unsigned int v20 = [v13 messageID];
              responseHandlers = self->_responseHandlers;
              int v25 = 138412802;
              id v26 = v10;
              __int16 v27 = 1024;
              unsigned int v28 = v20;
              __int16 v29 = 2112;
              __int16 v30 = responseHandlers;
              id v22 = "Removing context for %@ because there is no response handler for %d. Current handlers: %@";
              id v23 = v18;
              uint32_t v24 = 28;
LABEL_14:
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, v24);
            }
          }
          else if (v19)
          {
            int v25 = 138412290;
            id v26 = v10;
            id v22 = "Removing context for %@ because it's for a response.";
            id v23 = v18;
            uint32_t v24 = 12;
            goto LABEL_14;
          }

          [(NMSPersistentDictionary *)self->_persistentContextStore removeObjectForKey:v10];
        }
      }
    }
    else
    {
      if (!v11)
      {
        id v11 = +[NSError errorWithDomain:@"NMSErrorDomain" code:3 userInfo:0];
      }
      [(NMSMessageCenter *)self _handleError:v11 context:v13];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  queue = self->_queue;
  id v14 = a6;
  id v15 = a3;
  dispatch_assert_queue_V2(queue);
  device = self->_device;
  [v15 linkedDeviceForFromID:v14 withRelationship:[device relationship]];
  unsigned __int8 v17 = (IDSDevice *)objc_claimAutoreleasedReturnValue();

  if (device == v17)
  {
    id v18 = [v12 incomingResponseIdentifier];
    id v19 = [v11 length];
    if (v18)
    {
      if ((unint64_t)v19 >= 2)
      {
        id v20 = v11;
        int v21 = *(unsigned __int16 *)[v20 bytes];
        [v20 subdataWithRange:2, (char *)[v20 length] - 2];
        id v22 = (NMSIncomingRequest *)objc_claimAutoreleasedReturnValue();
        id v23 = v18;
        if (![v23 UTF8String])
        {
          uint32_t v24 = sub_10005CDAC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v21;
            __int16 v57 = 2112;
            id v58 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Will fail to bind string for message: %hu identifier: %@", buf, 0x12u);
          }
        }
        int v25 = [(NMSPersistentDictionary *)self->_persistentContextStore objectForKey:v23];
        if (v25)
        {
          [(NMSPersistentDictionary *)self->_persistentContextStore removeObjectForKey:v23];
          id v26 = sub_10005CDAC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [(NMSIncomingRequest *)v22 length];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v21;
            __int16 v57 = 2048;
            id v58 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received incoming response for message: %hu of size %tu", buf, 0x12u);
          }

          responseHandlers = self->_responseHandlers;
          __int16 v29 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v25 messageID]);
          __int16 v30 = [(NSMutableDictionary *)responseHandlers objectForKey:v29];

          if (v30)
          {
            *(void *)buf = 0;
            [v30 getValue:buf];
            int v31 = objc_alloc_init(NMSIncomingResponse);
            -[NMSIncomingResponse setMessageID:](v31, "setMessageID:", [v25 messageID]);
            [(NMSIncomingResponse *)v31 setData:v22];
            v32 = -[NMSMessageCenter _pbMappingForMessageID:](self, "_pbMappingForMessageID:", [v25 messageID]);
            if ([v32 responseClass])
            {
              id v33 = [objc_alloc((Class)objc_msgSend(v32, "responseClass")) initWithData:v22];
              v55 = v22;
              v34 = v18;
              v35 = v32;
              uint64_t v36 = v33;
              [(NMSIncomingResponse *)v31 setPbResponse:v33];

              v32 = v35;
              id v18 = v34;
              id v22 = v55;
            }
            [(NMSIncomingResponse *)v31 setIdsIdentifier:v23];
            v37 = [v25 idsIdentifier];
            [(NMSIncomingResponse *)v31 setRequestIDSIdentifier:v37];

            v38 = [v25 date];
            [(NMSIncomingResponse *)v31 setRequestSent:v38];

            v39 = [v25 userInfo];
            [(NMSIncomingResponse *)v31 setRequestPersistentUserInfo:v39];

            [(NMSIncomingResponse *)v31 setContext:v12];
            id WeakRetained = objc_loadWeakRetained(&self->_delegate);
            [WeakRetained performSelector:*(void *)buf withObject:v31];
          }
          else
          {
            v52 = sub_10005CDAC();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v21;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "No registered response handler for message: %hu", buf, 8u);
            }

            __int16 v30 = 0;
          }
        }
        else
        {
          __int16 v30 = sub_10005CDAC();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v21;
            __int16 v57 = 2112;
            id v58 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Could not find context for message: %hu identifier %@", buf, 0x12u);
          }
        }

LABEL_26:
      }
    }
    else if ((unint64_t)v19 >= 3)
    {
      id v41 = v11;
      v42 = (unsigned __int16 *)[v41 bytes];
      uint64_t v43 = *v42;
      uint64_t v44 = *((unsigned __int8 *)v42 + 2);
      id v22 = objc_alloc_init(NMSIncomingRequest);
      [(NMSIncomingRequest *)v22 setMessageCenter:self];
      [(NMSIncomingRequest *)v22 setMessageID:v43];
      v45 = [v12 outgoingResponseIdentifier];
      [(NMSIncomingRequest *)v22 setIdsIdentifier:v45];

      [(NMSIncomingRequest *)v22 setPriority:v44];
      -[NMSIncomingRequest setExpectsResponse:](v22, "setExpectsResponse:", [v12 expectsPeerResponse]);
      v46 = [v41 subdataWithRange:3, [v41 length] - 3];
      [(NMSIncomingRequest *)v22 setData:v46];

      [(NMSIncomingRequest *)v22 configureResponse];
      [(NMSIncomingRequest *)v22 setContext:v12];
      requestHandlers = self->_requestHandlers;
      v48 = +[NSNumber numberWithUnsignedShort:v43];
      int v25 = [(NSMutableDictionary *)requestHandlers objectForKeyedSubscript:v48];

      if (v25)
      {
        v49 = sub_10005CDAC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [(NMSIncomingRequest *)v22 data];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v43;
          __int16 v57 = 2048;
          id v58 = [v50 length];
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Received incoming message %hu of size %tu", buf, 0x12u);
        }
        *(void *)buf = 0;
        [v25 getValue:buf];
        id v51 = objc_loadWeakRetained(&self->_delegate);
        [v51 performSelector:*(void *)buf withObject:v22];
      }
      else
      {
        [(NMSIncomingRequest *)v22 setExpectsResponse:0];
        v53 = sub_10005CDAC();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = [(NMSIncomingRequest *)v22 data];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v43;
          __int16 v57 = 2048;
          id v58 = [v54 length];
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Received unhandle-able incoming message %hu of size %tu", buf, 0x12u);
        }
        int v25 = 0;
      }
      goto LABEL_26;
    }
  }
}

- (void)sendFile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.NanoPhotos.NanoMessagingService.sendFile"];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006E81C;
  v13[3] = &unk_100093A30;
  id v14 = v6;
  id v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, v13);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v18 = [v14 objectForKeyedSubscript:@"_id"];
  unsigned __int16 v19 = (unsigned __int16)[v18 intValue];

  device = self->_device;
  [v17 linkedDeviceForFromID:v16 withRelationship:[device relationship]];
  int v21 = (IDSDevice *)objc_claimAutoreleasedReturnValue();

  if (device != v21) {
    goto LABEL_17;
  }
  id v22 = [v13 pathExtension];
  if ([v22 length])
  {
    id v23 = 0;
  }
  else
  {
    uint32_t v24 = [v14 objectForKeyedSubscript:@"mt"];
    id v25 = [v24 integerValue];

    if (v25 != (id)1)
    {
      id v23 = 0;
      goto LABEL_9;
    }
    id v22 = [v14 objectForKeyedSubscript:@"ms"];
    unsigned __int8 v26 = [v22 integerValue];
    id v27 = @"nlp";
    if ((v26 & 8) == 0) {
      id v27 = @"jpg";
    }
    id v23 = v27;
  }

LABEL_9:
  unsigned int v28 = [[NMSIncomingFile alloc] initWithIDSURL:v13 extensionOverride:v23];
  [(NMSIncomingFile *)v28 setMessageID:v19];
  [(NMSIncomingFile *)v28 setMetadata:v14];
  [(NMSIncomingFile *)v28 setContext:v15];
  fileHandlers = self->_fileHandlers;
  __int16 v30 = +[NSNumber numberWithUnsignedShort:[(NMSIncomingFile *)v28 messageID]];
  int v31 = [(NSMutableDictionary *)fileHandlers objectForKeyedSubscript:v30];

  v32 = sub_10005CDAC();
  id v33 = v32;
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v35) = 67109378;
      HIDWORD(v35) = [(NMSIncomingFile *)v28 messageID];
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Received incoming resourceURL %hu %@", (uint8_t *)&v35, 0x12u);
    }

    uint64_t v35 = 0;
    [v31 getValue:&v35];
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained performSelector:v35 withObject:v28];
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v35) = 67109378;
      HIDWORD(v35) = [(NMSIncomingFile *)v28 messageID];
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Received unknown incoming resourceURL %hu %@", (uint8_t *)&v35, 0x12u);
    }
  }
LABEL_17:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  id v8 = sub_10005CDAC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDS ID: %@", (uint8_t *)&v25, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = [(NMSPersistentDictionary *)self->_persistentContextStore objectForKey:v7];
  id v10 = v9;
  if (v9)
  {
    if ([v9 isFromFile] && objc_msgSend(v10, "shouldUnlinkFile"))
    {
      id v11 = sub_10005CDAC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 filePath];
        int v25 = 138412290;
        id v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unlinking %@", (uint8_t *)&v25, 0xCu);
      }
      id v13 = [v10 filePath];
      int v14 = unlink((const char *)[v13 fileSystemRepresentation]);

      if (v14)
      {
        id v15 = sub_10005CDAC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint32_t v24 = [v10 filePath];
          int v25 = 138412290;
          id v26 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to unlink %@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
    persistentContextStore = self->_persistentContextStore;
    id v17 = [v10 idsIdentifier];
    [(NMSPersistentDictionary *)persistentContextStore removeObjectForKey:v17];

    completionHandlers = self->_completionHandlers;
    unsigned __int16 v19 = [v10 idsIdentifier];
    id v20 = [(NSMutableDictionary *)completionHandlers objectForKey:v19];

    if (v20)
    {
      int v21 = [v10 idsIdentifier];
      ((void (**)(void, void *, void))v20)[2](v20, v21, 0);
    }
    id v22 = self->_completionHandlers;
    id v23 = [v10 idsIdentifier];
    [(NSMutableDictionary *)v22 removeObjectForKey:v23];
  }
}

- (int64_t)_messagePriorityWithPriority:(unint64_t)a3
{
  unsigned __int8 v4 = [(IDSDevice *)self->_device relationship];
  int64_t v5 = 200;
  if (a3 == 1) {
    int64_t v5 = 300;
  }
  if (a3 == 2) {
    int64_t v5 = 100;
  }
  if ((v4 & 2) != 0) {
    return 300;
  }
  else {
    return v5;
  }
}

- (IDSDevice)device
{
  return self->_device;
}

- (IDSService)service
{
  return self->_service;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_nextExpireTimerFireDate, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_persistentContextStore, 0);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_fileHandlers, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);

  objc_storeStrong((id *)&self->_requestHandlers, 0);
}

@end