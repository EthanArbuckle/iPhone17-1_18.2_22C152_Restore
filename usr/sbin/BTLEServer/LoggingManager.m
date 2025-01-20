@interface LoggingManager
+ (id)instance;
- (BOOL)isXpcConnected;
- (BOOL)wasUUIDRequestedForLogRetrieval:(id)a3;
- (LoggingManager)init;
- (NSMutableArray)requestedUUIDs;
- (OS_xpc_object)xpcConnection;
- (OS_xpc_object)xpcServer;
- (void)cleanup;
- (void)handleConnection:(id)a3;
- (void)handleConnectionEvent:(id)a3;
- (void)handleDisconnection;
- (void)handleLogRetrievalRequest:(id)a3;
- (void)handleMsg:(id)a3;
- (void)handleServerEvent:(id)a3;
- (void)logRetrievalComplete;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setRequestedUUIDs:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation LoggingManager

- (LoggingManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)LoggingManager;
  v2 = [(LoggingManager *)&v16 init];
  v3 = v2;
  if (v2)
  {
    loggingTimeoutTimer = v2->loggingTimeoutTimer;
    v2->loggingTimeoutTimer = 0;

    uint64_t v5 = +[NSMutableArray array];
    requestedUUIDs = v3->_requestedUUIDs;
    v3->_requestedUUIDs = (NSMutableArray *)v5;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTLELoggingManager.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v3->_xpcServer;
    v3->_xpcServer = mach_service;

    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = 0;

    v10 = [(LoggingManager *)v3 xpcServer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000303E0;
    handler[3] = &unk_1000B1960;
    v11 = v3;
    v15 = v11;
    xpc_connection_set_event_handler(v10, handler);

    v12 = [(LoggingManager *)v11 xpcServer];
    xpc_connection_resume(v12);
  }
  return v3;
}

+ (id)instance
{
  if (qword_1000CD090 != -1) {
    dispatch_once(&qword_1000CD090, &stru_1000B1B20);
  }
  v2 = (void *)qword_1000CD088;

  return v2;
}

- (BOOL)wasUUIDRequestedForLogRetrieval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LoggingManager *)self requestedUUIDs];
  objc_sync_enter(v5);
  LOBYTE(self) = [(NSMutableArray *)self->_requestedUUIDs containsObject:v4];
  objc_sync_exit(v5);

  return (char)self;
}

- (BOOL)isXpcConnected
{
  v2 = [(LoggingManager *)self xpcConnection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)handleServerEvent:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    [(LoggingManager *)self handleConnection:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100070784();
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LoggingManager - XPC connection: %p %@", buf, 0x16u);
  }
  v6 = [(LoggingManager *)self xpcServer];
  xpc_connection_suspend(v6);

  [(LoggingManager *)self setXpcConnection:v4];
  v7 = [(LoggingManager *)self xpcConnection];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100030708;
  handler[3] = &unk_1000B1960;
  void handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);

  v8 = [(LoggingManager *)self xpcConnection];
  xpc_connection_resume(v8);
}

- (void)handleDisconnection
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(LoggingManager *)self xpcConnection];
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LoggingManager - XPC disconnection: %@", (uint8_t *)&v8, 0xCu);
  }
  [(LoggingManager *)self setXpcConnection:0];
  v6 = [(LoggingManager *)self xpcServer];
  xpc_connection_resume(v6);

  v7 = +[UARPServiceUARPControllerManager instance];
  [v7 stopTapToRadar];

  [(LoggingManager *)self cleanup];
}

- (void)handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(LoggingManager *)self handleMsg:v4];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      [(LoggingManager *)self handleDisconnection];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_1000707EC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100070854();
  }
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  v6 = xpc_dictionary_get_value(v4, "kMsgArgs");

  v7 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    v9 = [(LoggingManager *)self xpcConnection];
    int v10 = 134218242;
    id v11 = v9;
    __int16 v12 = 2080;
    id v13 = string;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "LoggingManager - Received XPC message from %p: %s", (uint8_t *)&v10, 0x16u);
  }
  if (!strcmp(string, "RetrieveLogs") && v6)
  {
    [(LoggingManager *)self handleLogRetrievalRequest:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_1000708BC();
  }
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v6;
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)[v9 UTF8String]);
  if (v7) {
    xpc_dictionary_set_value(v8, "kMsgArgs", v7);
  }
  int v10 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    __int16 v12 = [(LoggingManager *)self xpcConnection];
    int v14 = 134218242;
    v15 = v12;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "LoggingManager - sending XPC message to %p: %@", (uint8_t *)&v14, 0x16u);
  }
  id v13 = [(LoggingManager *)self xpcConnection];
  xpc_connection_send_message(v13, v8);
}

- (void)handleLogRetrievalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(LoggingManager *)self xpcConnection];
    *(_DWORD *)buf = 134217984;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LoggingManager - handleLogRetrievalRequest Received RetrieveLogs XPC message from %p", buf, 0xCu);
  }
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_array)
  {
    if (xpc_array_get_count(v4))
    {
      size_t v9 = 0;
      unsigned __int8 v10 = 0;
      do
      {
        string = xpc_array_get_string(v4, v9);
        if (string)
        {
          id v12 = objc_alloc((Class)NSUUID);
          id v13 = +[NSString stringWithUTF8String:string];
          id v14 = [v12 initWithUUIDString:v13];

          if (v14)
          {
            v15 = self->_requestedUUIDs;
            objc_sync_enter(v15);
            [(NSMutableArray *)self->_requestedUUIDs addObject:v14];
            objc_sync_exit(v15);

            __int16 v16 = +[UARPServiceUARPControllerManager instance];
            [v16 setOpportunisticConnection:0 forAccessoryUUID:v14];
          }
          else
          {
            v18 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v22 = string;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Invalid UUID %s", buf, 0xCu);
            }
          }
        }
        else
        {
          id v17 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v22) = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Unexpected XPC object at index %u", buf, 8u);
          }
        }
        size_t count = xpc_array_get_count(v4);
        size_t v9 = ++v10;
      }
      while (count > v10);
    }
  }
  else
  {
    xpc_object_t v8 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070924(v8);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030EE4;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)logRetrievalComplete
{
  v2 = +[UARPServiceUARPControllerManager instance];
  [v2 stopTapToRadar];

  xpc_object_t xarray = xpc_array_create_empty();
  BOOL v3 = +[NSFileManager defaultManager];
  id v4 = +[UARPServiceUARPControllerManager instance];
  uint64_t v5 = [v4 uarpLogPath];
  uint64_t v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];

  NSURLResourceKey v7 = NSURLFileResourceTypeKey;
  NSURLResourceKey v47 = NSURLFileResourceTypeKey;
  +[NSArray arrayWithObjects:&v47 count:1];
  v31 = (void *)v6;
  v30 = v32 = v3;
  [v3 enumeratorAtURL:v6];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  size_t v9 = (os_log_t *)&qword_1000CD178;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v39;
    NSURLFileResourceType v12 = NSURLFileResourceTypeRegular;
    do
    {
      id v13 = 0;
      id v35 = v10;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v13);
        id v37 = 0;
        [v14 getResourceValue:&v37 forKey:v7 error:0];
        id v16 = v37;
        unsigned int v17 = [v16 isEqualToString:v12];
        os_log_t v18 = *v9;
        if (v17)
        {
          v19 = v12;
          uint64_t v20 = v11;
          v21 = v7;
          v22 = v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v18;
            v24 = [v14 path];
            *(_DWORD *)buf = 138412290;
            size_t v45 = (size_t)v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "LoggingManager - file path: %@", buf, 0xCu);
          }
          id v25 = [v14 path];
          xpc_object_t v26 = xpc_string_create((const char *)[v25 UTF8String]);

          xpc_array_append_value(xarray, v26);
          size_t v9 = v22;
          NSURLResourceKey v7 = v21;
          uint64_t v11 = v20;
          NSURLFileResourceType v12 = v19;
          id v10 = v35;
        }
        else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          sub_100070968(v42, v18, v14, &v43);
        }

        id v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v10);
  }

  os_log_t v27 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    size_t count = xpc_array_get_count(xarray);
    *(_DWORD *)buf = 134217984;
    size_t v45 = count;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "LoggingManager - logRetrievalComplete Preparing to dispatch %lu file(s)", buf, 0xCu);
  }
  [(LoggingManager *)self sendMsg:@"RetrievedLogs" args:xarray];
  [(LoggingManager *)self cleanup];
}

- (void)cleanup
{
  BOOL v3 = self->_requestedUUIDs;
  objc_sync_enter(v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_requestedUUIDs;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      NSURLResourceKey v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        size_t v9 = +[UARPServiceUARPControllerManager instance];
        [v9 setOpportunisticConnection:1 forAccessoryUUID:v8];

        NSURLResourceKey v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_requestedUUIDs removeAllObjects];
  objc_sync_exit(v3);

  loggingTimeoutTimer = self->loggingTimeoutTimer;
  p_loggingTimeoutTimer = &self->loggingTimeoutTimer;
  [(NSTimer *)loggingTimeoutTimer invalidate];
  NSURLFileResourceType v12 = *p_loggingTimeoutTimer;
  *p_loggingTimeoutTimer = 0;
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableArray)requestedUUIDs
{
  return self->_requestedUUIDs;
}

- (void)setRequestedUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedUUIDs, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);

  objc_storeStrong((id *)&self->loggingTimeoutTimer, 0);
}

@end