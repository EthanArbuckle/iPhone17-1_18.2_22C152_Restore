@interface MSDPushService
+ (MSDPushService)sharedService;
- (APSConnection)connection;
- (MSDPushService)init;
- (NSArray)consumers;
- (NSData)pushToken;
- (NSString)connectionEnvironment;
- (OS_dispatch_queue)connectionQueue;
- (id)_determinePushEnvironment;
- (void)_statConnectionWithEnvironment:(id)a3;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setConnectionEnvironment:(id)a3;
- (void)setConsumers:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation MSDPushService

- (MSDPushService)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDPushService;
  v2 = [(MSDPushService *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MSDPushService", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    uint64_t v9 = objc_opt_class();
    uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
    consumers = v2->_consumers;
    v2->_consumers = (NSArray *)v5;

    [(MSDPushService *)v2 _statConnectionWithEnvironment:0];
  }
  return v2;
}

+ (MSDPushService)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000229D4;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_1000567B0 != -1) {
    dispatch_once(&qword_1000567B0, block);
  }
  v2 = (void *)qword_1000567A8;

  return (MSDPushService *)v2;
}

- (void)dealloc
{
  [(APSConnection *)self->_connection shutdown];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSDPushService;
  [(MSDPushService *)&v4 dealloc];
}

- (void)_statConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022B34;
  v7[3] = &unk_10004DED8;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_determinePushEnvironment
{
  v2 = +[CKContainer MSDCloudKitContainer];
  id v10 = 0;
  dispatch_queue_t v3 = [v2 serverPreferredPushEnvironmentWithError:&v10];
  id v4 = v10;

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v3;
  if (!v5)
  {
    v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000233A8((uint64_t)v4, v7);
    }

    id v6 = (void *)APSEnvironmentProduction;
    if (v3) {
      id v6 = v3;
    }
  }
  id v8 = v6;

  return v8;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  BOOL v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 base64EncodedStringWithOptions:0];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did receive public token %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = sub_100031A80();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did receive push notification %@", buf, 0xCu);
  }

  int v7 = [v5 topic];
  unsigned int v8 = [v7 isEqualToString:kAPSTopic];

  if (v8)
  {
    uint64_t v9 = [v5 userInfo];
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Receive push notification with info %@", buf, 0xCu);
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [(MSDPushService *)self consumers];
    id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) handlePushNotification:v5];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = sub_100031A80();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection status changed %@ %d", (uint8_t *)&v7, 0x12u);
  }
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)connectionEnvironment
{
  return self->_connectionEnvironment;
}

- (void)setConnectionEnvironment:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSArray)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionEnvironment, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end