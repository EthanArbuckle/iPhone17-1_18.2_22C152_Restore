@interface _VVMFLogInterceptor
+ (id)sharedInstance;
+ (void)flushLog:(BOOL)a3 forConnection:(id)a4;
+ (void)logConnection:(id)a3 type:(int64_t)a4 data:(id)a5;
- (NSMutableDictionary)all;
- (OS_dispatch_queue)serialQueue;
- (_VVMFLogInterceptor)init;
- (void)configureLoggingClass;
- (void)dealloc;
- (void)handleMFReloadNetworkLoggingNotification:(id)a3;
- (void)setAll:(id)a3;
@end

@implementation _VVMFLogInterceptor

+ (id)sharedInstance
{
  if (qword_1000E0870 != -1) {
    dispatch_once(&qword_1000E0870, &stru_1000C1AD8);
  }
  v2 = (void *)qword_1000E0868;
  return v2;
}

- (_VVMFLogInterceptor)init
{
  v19.receiver = self;
  v19.super_class = (Class)_VVMFLogInterceptor;
  v2 = [(_VVMFLogInterceptor *)&v19 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 bundleIdentifier];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = +[NSString stringWithFormat:@"%@.%@", v4, v6];
    v8 = NSStringFromSelector("serialQueue");
    v9 = +[NSString stringWithFormat:@"%@.%@", v7, v8];

    id v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    all = v2->_all;
    v2->_all = (NSMutableDictionary *)v13;

    [(_VVMFLogInterceptor *)v2 configureLoggingClass];
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"handleMFReloadNetworkLoggingNotification:" name:MFReloadNetworkLoggingNotification object:0];

    v16 = sub_1000284F8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I _VVMFLogInterceptor created", buf, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  serialQueue = self->_serialQueue;
  self->_serialQueue = 0;

  v5 = sub_1000284F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I _VVMFLogInterceptor destroyed", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)_VVMFLogInterceptor;
  [(_VVMFLogInterceptor *)&v6 dealloc];
}

- (void)configureLoggingClass
{
  uint64_t v3 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v3 count:1];
  +[MFConnection setLogClasses:v2];

  +[MFConnection setLogAllSocketActivity:1];
}

+ (void)flushLog:(BOOL)a3 forConnection:(id)a4
{
  id v6 = a4;
  v7 = [a1 sharedInstance];
  v8 = [v6 rumbaID];
  v9 = [v7 serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028820;
  block[3] = &unk_1000C1B00;
  id v13 = v8;
  id v14 = v7;
  BOOL v15 = a3;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(v9, block);
}

+ (void)logConnection:(id)a3 type:(int64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 sharedInstance];
  id v11 = [v8 rumbaID];
  id v12 = [v8 mambaID];
  id v13 = objc_msgSend(v8, "socket_rumbaID");
  id v14 = [v10 serialQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100028DEC;
  v19[3] = &unk_1000C1B28;
  id v20 = v11;
  id v21 = v10;
  id v24 = v12;
  int64_t v25 = a4;
  id v22 = v13;
  id v23 = v9;
  id v15 = v9;
  id v16 = v13;
  id v17 = v10;
  id v18 = v11;
  dispatch_sync(v14, v19);
}

- (void)handleMFReloadNetworkLoggingNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_1000284F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %@ is handling <%@>", (uint8_t *)&v7, 0x16u);
  }
  [(_VVMFLogInterceptor *)self configureLoggingClass];
}

- (NSMutableDictionary)all
{
  return self->_all;
}

- (void)setAll:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_all, 0);
}

@end