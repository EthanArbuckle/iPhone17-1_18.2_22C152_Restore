@interface _SESSessionManager
+ (id)sessionManager;
+ (id)sessionManagerWithMachServiceName:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)getActiveACWGSessions;
- (id)getActiveDCKSessions;
- (id)getActiveRKESessions;
- (id)init:(id)a3;
- (os_state_data_s)dumpState;
- (void)addSession:(id)a3 forConnection:(id)a4;
- (void)didAppEnterBackground:(id)a3;
- (void)didAppEnterForeground:(id)a3;
- (void)didAppGetSuspended:(id)a3;
- (void)didCloseConnection:(id)a3;
- (void)didCreateKey:(id)a3;
- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4;
- (void)getVehicleReports:(id)a3;
- (void)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4 withAppletIdentifier:(id)a5 reply:(id)a6;
- (void)removeSession:(id)a3;
- (void)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4 reply:(id)a5;
- (void)sendEvent:(id)a3 keyIdentifier:(id)a4;
- (void)start;
- (void)startSESACWGSession:(id)a3 completion:(id)a4;
- (void)startSESAssertion:(id)a3 withKeyIdentifier:(id)a4 withAppletIdentifier:(id)a5 withOptions:(id)a6 completion:(id)a7;
- (void)startSESDCKSession:(id)a3 completion:(id)a4;
- (void)startSESRKESession:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation _SESSessionManager

+ (id)sessionManager
{
  return +[_SESSessionManager sessionManagerWithMachServiceName:@"com.apple.seserviced.session"];
}

+ (id)sessionManagerWithMachServiceName:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C534;
  block[3] = &unk_10040B880;
  id v8 = a3;
  uint64_t v3 = qword_10045CD48;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10045CD48, block);
  }
  id v5 = (id)qword_10045CD40;

  return v5;
}

- (id)init:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_SESSessionManager;
  uint64_t v3 = [(_SESSessionManager *)&v17 initWithMachServiceName:a3];
  id v4 = v3;
  if (v3)
  {
    [(_SESSessionManager *)v3 setDelegate:v3];
    v4->_lock._os_unfair_lock_opaque = 0;
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.seserviced._session.queue", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.seserviced._session.xpc.queue", v8);
    xpcConnectionQueue = v4->_xpcConnectionQueue;
    v4->_xpcConnectionQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    activeSessions = v4->_activeSessions;
    v4->_activeSessions = (NSMutableArray *)v11;

    uint64_t v13 = +[_SESSessionAppStateObserver observerWithDelegate:v4];
    appStateObserver = v4->_appStateObserver;
    v4->_appStateObserver = (_SESAppStateObserver *)v13;

    v16 = v4;
    os_state_add_handler();
  }
  return v4;
}

- (void)start
{
  uint64_t v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting session server", v4, 2u);
  }

  [(_SESSessionManager *)self resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"application-identifier"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    dispatch_queue_t v9 = SESDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = [v7 processIdentifier];
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v8;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Added connection from PID %d (%@) %@", buf, 0x1Cu);
    }

    v26[0] = v8;
    v25[0] = &off_10042DDF8;
    v25[1] = &off_10042DE10;
    v10 = objc_opt_new();
    v26[1] = v10;
    v25[2] = &off_10042DE28;
    uint64_t v11 = objc_opt_new();
    v26[2] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    uint64_t v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];
    [v7 setUserInfo:v13];

    v14 = +[SESSessionManagerCallbackInterface interface];
    [v7 setRemoteObjectInterface:v14];

    v15 = +[SESSessionManagerInterface interface];
    [v7 setExportedInterface:v15];

    [v7 setExportedObject:self];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = sub_10003CB68;
    v23 = sub_10003CB78;
    id v16 = v7;
    id v24 = v16;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003CB80;
    v21[3] = &unk_10040D310;
    v21[4] = self;
    v21[5] = buf;
    [v16 setInvalidationHandler:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003CBFC;
    v20[3] = &unk_10040D310;
    v20[4] = self;
    v20[5] = buf;
    [v16 setInterruptionHandler:v20];
    [v16 _setQueue:self->_xpcConnectionQueue];
    [v16 resume];
    _Block_object_dispose(buf, 8);

    BOOL v17 = 1;
  }
  else
  {
    v18 = SESDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = @"application-identifier";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Missing or wrong type entitlement %@: %@", buf, 0x16u);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (void)didCloseConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CD18;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addSession:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_t v9 = [v8 userInfo];

  v10 = [v9 objectForKeyedSubscript:&off_10042DE10];

  [v10 addObject:v6];
  uint64_t v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [(NSMutableArray *)self->_activeSessions count];
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2048;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Adding session %@ active sessions %lu", (uint8_t *)&v15, 0x16u);
  }

  [(NSMutableArray *)self->_activeSessions addObject:v6];
  if (!self->_keepAlive)
  {
    uint64_t v13 = (OS_os_transaction *)os_transaction_create();
    keepAlive = self->_keepAlive;
    self->_keepAlive = v13;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeSession:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_activeSessions removeObject:v5];
  [v5 releaseRemoteObject];
  id v6 = [v5 connection];
  id v7 = [v6 userInfo];
  id v8 = [v7 objectForKeyedSubscript:&off_10042DE10];

  [v8 removeObject:v5];
  dispatch_queue_t v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(NSMutableArray *)self->_activeSessions count];
    int v12 = 134217984;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Active sessions %lu", (uint8_t *)&v12, 0xCu);
  }

  if (![(NSMutableArray *)self->_activeSessions count])
  {
    keepAlive = self->_keepAlive;
    self->_keepAlive = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)startSESACWGSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "startSESACWGSession", buf, 2u);
  }

  dispatch_queue_t v9 = +[NSXPCConnection currentConnection];
  id v10 = +[_SESACWGSession validateEntitlements:v9];
  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D538;
    v12[3] = &unk_10040D360;
    id v13 = v6;
    v14 = self;
    id v16 = v7;
    id v15 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)startSESDCKSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "startSESDCKSession", buf, 2u);
  }

  dispatch_queue_t v9 = +[NSXPCConnection currentConnection];
  id v10 = +[_SESDCKSession validateEntitlements:v9];
  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D928;
    v12[3] = &unk_10040D360;
    id v13 = v6;
    v14 = self;
    id v16 = v7;
    id v15 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)startSESRKESession:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "startSESRKESession", buf, 2u);
  }

  int v12 = +[NSXPCConnection currentConnection];
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10003CB68;
  v25 = sub_10003CB78;
  id v26 = +[_SESRKESession validateEntitlements:v12];
  if (*((void *)v22 + 5))
  {
    v10[2](v10, 0);
  }
  else
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003DDAC;
    v14[3] = &unk_10040D388;
    id v15 = v12;
    id v16 = self;
    v19 = v10;
    id v17 = v9;
    id v18 = v8;
    v20 = buf;
    dispatch_async(queue, v14);
  }
  _Block_object_dispose(buf, 8);
}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E3E0;
  block[3] = &unk_10040D2C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)getActiveDCKSessions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_activeSessions copy];
  id v5 = Filter();

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)getActiveRKESessions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_activeSessions copy];
  id v5 = Filter();

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)getActiveACWGSessions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_activeSessions copy];
  id v5 = Filter();

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)didCreateKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E8A8;
  v7[3] = &unk_10040D1A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EAC8;
  block[3] = &unk_10040D2C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getVehicleReports:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  id v6 = +[NSXPCConnection currentConnection];
  id v7 = +[_SESDCKSession validateEntitlements:v6];
  if (v7)
  {
    v4[2](v4, 0, v7);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003ED80;
    block[3] = &unk_10040C108;
    id v10 = v4;
    dispatch_async(queue, block);
  }
}

- (void)startSESAssertion:(id)a3 withKeyIdentifier:(id)a4 withAppletIdentifier:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  id v17 = SESDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "startSESAssertion keyIdentifier %@ appletIdentifier %@ options %@", buf, 0x20u);
  }

  id v18 = +[NSXPCConnection currentConnection];
  v19 = +[_SESAssertion validateEntitlements:v18 appletIdentifier:v14];
  if (v19)
  {
    v16[2](v16, 0, v19);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003F0C0;
    block[3] = &unk_10040D458;
    void block[4] = self;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    v27 = v16;
    id v26 = v18;
    dispatch_async(queue, block);
  }
}

- (void)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4 withAppletIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    [v11 doubleValue];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "pauseRangingForReaderIdentifier %@ duration %f", buf, 0x16u);
  }

  id v16 = +[NSXPCConnection currentConnection];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v25 = sub_10003CB68;
  id v26 = sub_10003CB78;
  id v27 = +[_SESDCKSession validateEntitlements:v16];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v13[2](v13);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003F6A4;
    block[3] = &unk_10040D480;
    id v19 = v11;
    id v22 = v13;
    id v20 = v12;
    id v21 = v10;
    id v23 = buf;
    dispatch_async(queue, block);
  }
  _Block_object_dispose(buf, 8);
}

- (void)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "resumeRangingForReaderIdentifier %@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = +[NSXPCConnection currentConnection];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10003CB68;
  id v22 = sub_10003CB78;
  id v23 = +[_SESDCKSession validateEntitlements:v12];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v10[2](v10);
  }
  else
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003FA6C;
    v14[3] = &unk_10040D4A8;
    id v15 = v9;
    id v16 = v8;
    p_long long buf = &buf;
    id v17 = v10;
    dispatch_async(queue, v14);
  }
  _Block_object_dispose(&buf, 8);
}

- (os_state_data_s)dumpState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithInt:self->_keepAlive != 0];
  [v3 setObject:v4 forKeyedSubscript:@"isMarkedDirty"];

  currentAssertion = self->_currentAssertion;
  id v24 = v3;
  if (currentAssertion)
  {
    id v6 = [(_SESAssertion *)currentAssertion connection];
    id v7 = [v6 userInfo];
    id v8 = [v7 objectForKeyedSubscript:&off_10042DDF8];
    id v9 = +[NSString stringWithFormat:@"Assertion %p client %@", currentAssertion, v8];
    [v3 setObject:v9 forKeyedSubscript:@"activeAssertion"];
  }
  else
  {
    [v3 setObject:@"none" forKeyedSubscript:@"activeAssertion"];
  }
  id v27 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v23 = self;
  obj = self->_activeSessions;
  id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CFStringRef v14 = @"DCK";
        }
        else {
          CFStringRef v14 = @"RKE";
        }
        unsigned int v15 = [v13 isBackgrounded];
        id v16 = [v13 connection];
        id v17 = [v16 userInfo];
        id v18 = [v17 objectForKeyedSubscript:&off_10042DDF8];
        id v19 = +[NSString stringWithFormat:@"%@Session %p backgrounded %d client %@", v14, v13, v15, v18];
        [v27 addObject:v19];
      }
      id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  [v24 setObject:v27 forKeyedSubscript:@"activeSessions"];
  uint64_t v20 = [(_SESAppStateObserver *)v23->_appStateObserver dumpState];
  [v24 addEntriesFromDictionary:v20];
  id v21 = (os_state_data_s *)sub_1000190DC((uint64_t)"sessessionmanager.state", (uint64_t)v24);

  return v21;
}

- (void)didAppEnterBackground:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:&off_10042DDF8];

  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    unsigned int v20 = [v3 processIdentifier];
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Client application entered background PID %d (%@) %@", buf, 0x1Cu);
  }

  id v7 = [v3 userInfo];
  id v8 = [v7 objectForKeyedSubscript:&off_10042DE10];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) setIsBackgrounded:1, (void)v14];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)didAppGetSuspended:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:&off_10042DDF8];

  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    unsigned int v20 = [v3 processIdentifier];
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Client application got suspended PID %d (%@) %@", buf, 0x1Cu);
  }

  id v7 = [v3 userInfo];
  id v8 = [v7 objectForKeyedSubscript:&off_10042DE10];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) setIsBackgrounded:1];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)didAppEnterForeground:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:&off_10042DDF8];

  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109634;
    unsigned int v20 = [v3 processIdentifier];
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Client application entered foreground PID %d (%@) %@", buf, 0x1Cu);
  }

  id v7 = [v3 userInfo];
  id v8 = [v7 objectForKeyedSubscript:&off_10042DE10];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) setIsBackgrounded:0, (void)v14];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssertion, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end