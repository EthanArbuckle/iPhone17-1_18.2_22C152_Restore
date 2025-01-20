@interface FMFAPSHandler
+ (id)instanceForEnvironment:(id)a3;
+ (void)startupComplete;
- (APSConnection)apsConnection;
- (FMFAPSHandler)init;
- (FMFAPSHandler)initWithEnvironmentName:(id)a3;
- (NSMutableArray)pendingPushes;
- (NSMutableArray)registeredDelegates;
- (NSString)apsToken;
- (NSString)environmentName;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)deregisterDelegate:(id)a3;
- (void)handleMessage:(id)a3 onTopic:(id)a4;
- (void)registerDelegate:(id)a3 forTopic:(id)a4;
- (void)setApsConnection:(id)a3;
- (void)setEnvironmentName:(id)a3;
- (void)setPendingPushes:(id)a3;
- (void)setRegisteredDelegates:(id)a3;
@end

@implementation FMFAPSHandler

+ (id)instanceForEnvironment:(id)a3
{
  id v3 = a3;
  if (qword_1000BB820 != -1) {
    dispatch_once(&qword_1000BB820, &stru_1000A2AA0);
  }
  id v4 = (id)qword_1000BB818;
  objc_sync_enter(v4);
  v5 = [(id)qword_1000BB810 objectForKeyedSubscript:v3];
  if (!v5)
  {
    v5 = [[FMFAPSHandler alloc] initWithEnvironmentName:v3];
    [(id)qword_1000BB810 setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)dealloc
{
  id v3 = [(FMFAPSHandler *)self apsConnection];
  [v3 setEnabledTopics:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFAPSHandler;
  [(FMFAPSHandler *)&v4 dealloc];
}

- (FMFAPSHandler)init
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10006C3DC(v3);
  }

  return 0;
}

- (FMFAPSHandler)initWithEnvironmentName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMFAPSHandler;
  v5 = [(FMFAPSHandler *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(FMFAPSHandler *)v5 setEnvironmentName:v4];
    id v7 = [objc_alloc((Class)APSConnection) initWithEnvironmentName:v4 namedDelegatePort:@"com.apple.icloud.fmfd.aps" queue:&_dispatch_main_q];
    [(FMFAPSHandler *)v6 setApsConnection:v7];

    v8 = [(FMFAPSHandler *)v6 apsConnection];
    [v8 setDelegate:v6];

    v9 = +[NSMutableArray array];
    [(FMFAPSHandler *)v6 setRegisteredDelegates:v9];

    v10 = +[NSMutableArray array];
    [(FMFAPSHandler *)v6 setPendingPushes:v10];
  }
  return v6;
}

- (void)registerDelegate:(id)a3 forTopic:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B784;
  block[3] = &unk_1000A28B8;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deregisterDelegate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BC8C;
  v5[3] = &unk_1000A1468;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (NSString)apsToken
{
  v2 = [(FMFAPSHandler *)self apsConnection];
  id v3 = [v2 publicToken];

  if (v3)
  {
    id v4 = [v3 fm_hexString];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

+ (void)startupComplete
{
  byte_1000BB828 = 1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000A2B38);
}

- (void)handleMessage:(id)a3 onTopic:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C530;
  block[3] = &unk_1000A28B8;
  block[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = [a4 description:a3];
  id v6 = +[NSCharacterSet characterSetWithCharactersInString:@"<>"];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1000A3938];
  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FMFAPSHandler *)self environmentName];
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received updated aps token %@ for environment %@", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003C9DC;
  v12[3] = &unk_1000A1468;
  id v13 = v8;
  v14 = self;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received aps message on topic %@: %@", (uint8_t *)&v10, 0x16u);
  }

  [(FMFAPSHandler *)self handleMessage:v8 onTopic:v7];
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (void)setRegisteredDelegates:(id)a3
{
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);

  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end