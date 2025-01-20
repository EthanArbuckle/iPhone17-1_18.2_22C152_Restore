@interface MSDTestInterface
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)xpcConnection;
- (NSXPCInterface)xpcInterface;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)testQueue;
- (id)getTimeStamp;
- (id)sanitizeTestLog:(id)a3;
- (unint64_t)defaultLogLevel;
- (void)pushTestEvent:(id)a3 ofType:(id)a4;
- (void)pushTestLog:(id)a3;
- (void)sendCommandsToDemod:(id)a3 replyFromDemod:(id)a4;
- (void)sendTestEvents:(id)a3;
- (void)setDefaultLogLevel:(unint64_t)a3;
- (void)setTestQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcInterface:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
@end

@implementation MSDTestInterface

+ (id)sharedInstance
{
  if (qword_1001898F8 != -1) {
    dispatch_once(&qword_1001898F8, &stru_100152110);
  }
  v2 = (void *)qword_1001898F0;

  return v2;
}

- (void)start
{
  if (os_variant_has_internal_content())
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdTestQueue", 0);
    [(MSDTestInterface *)self setTestQueue:v3];

    [(MSDTestInterface *)self setDefaultLogLevel:1];
  }
  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.msdtest.service"];
  [(MSDTestInterface *)self setXpcListener:v4];

  v5 = [(MSDTestInterface *)self xpcListener];
  [v5 setDelegate:self];

  id v6 = [(MSDTestInterface *)self xpcListener];
  [v6 resume];
}

- (id)getTimeStamp
{
  v2 = +[NSDate date];
  dispatch_queue_t v3 = [v2 description];

  return v3;
}

- (void)pushTestEvent:(id)a3 ofType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[NSNotificationCenter defaultCenter];
  v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, v5, 0);

  [v8 postNotificationName:@"TestNotification" object:0 userInfo:v7];
}

- (void)sendTestEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDTestInterface *)self xpcConnection];

  if (v5)
  {
    id v6 = [(MSDTestInterface *)self testQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000280C0;
    v7[3] = &unk_1001520B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new connection.:%{public}@ procID:%d", (uint8_t *)&v13, 0x12u);
  }

  if (os_variant_has_internal_content())
  {
    v7 = [v5 valueForEntitlement:@"com.apple.private.mobilestoredemo.testInterface"];
    id v8 = v7;
    if (v7 && [v7 BOOLValue])
    {
      v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDSendTestCommand];
      [v5 setExportedInterface:v9];

      [v5 setExportedObject:self];
      v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDPushTestLog];
      [v5 setRemoteObjectInterface:v10];
      [(MSDTestInterface *)self setXpcConnection:v5];
      [v5 resume];
      BOOL v11 = 1;
    }
    else
    {
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "client does not have entitlement.:%{public}@", (uint8_t *)&v13, 0xCu);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)sendCommandsToDemod:(id)a3 replyFromDemod:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, const __CFString *))a4;
  uint64_t v8 = [v6 objectForKey:@"getNotifications"];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v6 objectForKey:@"getNotifications"];
    unsigned int v11 = [v10 BOOLValue];

    if (v11)
    {
      v12 = +[NSNotificationCenter defaultCenter];
      id v13 = objc_alloc_init((Class)NSOperationQueue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100028474;
      v19[3] = &unk_100151B60;
      v19[4] = self;
      id v14 = [v12 addObserverForName:@"TestNotification" object:0 queue:v13 usingBlock:v19];
    }
  }
  __int16 v15 = [v6 objectForKey:@"totalDownloadThreads"];

  if (v15)
  {
    unsigned int v16 = +[MSDWorkQueueSet sharedInstance];
    v17 = [v16 operationQueue];
    v18 = [v6 objectForKey:@"totalDownloadThreads"];
    [v17 setMaxConcurrentOperationCount:[v18 integerValue]];
  }
  v7[2](v7, @"commands accepted");
}

- (void)pushTestLog:(id)a3
{
  id v6 = [(MSDTestInterface *)self sanitizeTestLog:a3];
  if (v6)
  {
    id v4 = [(MSDTestInterface *)self xpcConnection];
    id v5 = [v4 remoteObjectProxy];
    [v5 pushTestLog:v6];
  }
}

- (id)sanitizeTestLog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  id v6 = [v4 objectForKey:@"testLogLevel"];
  id v7 = [v6 integerValue];

  uint64_t v8 = [v4 objectForKey:@"testLogLevel"];

  if (v8
    && (unint64_t v9 = [(MSDTestInterface *)self defaultLogLevel], v8, (unint64_t)v7 <= v9))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCInterface)xpcInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcInterface:(id)a3
{
}

- (unint64_t)defaultLogLevel
{
  return self->_defaultLogLevel;
}

- (void)setDefaultLogLevel:(unint64_t)a3
{
  self->_defaultLogLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end