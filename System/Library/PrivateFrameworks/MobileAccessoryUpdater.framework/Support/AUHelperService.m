@interface AUHelperService
- (AUHelperService)initWithQueue:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (void)userPreferenceObjectForSuite:(unint64_t)a3 withKey:(id)a4 withReply:(id)a5;
- (void)userPreferenceSetObject:(id)a3 forSuite:(unint64_t)a4 withKey:(id)a5;
@end

@implementation AUHelperService

- (AUHelperService)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AUHelperService;
  v6 = [(AUHelperService *)&v15 init];
  if (!v6) {
    goto LABEL_4;
  }
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.auhelper", "AUHelper");
  log = v6->_log;
  v6->_log = (OS_os_log *)v7;

  objc_storeStrong((id *)&v6->_listenerQueue, a3);
  v9 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accessoryupdater.launchauhelper"];
  listener = v6->_listener;
  v6->_listener = v9;

  v11 = v6->_listener;
  if (v11)
  {
    [(NSXPCListener *)v11 setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
LABEL_4:
    v12 = v6;
    goto LABEL_8;
  }
  v13 = v6->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10004F5F4(v13);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  listenerQueue = self->_listenerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000098C0;
  block[3] = &unk_10007D340;
  id v10 = v5;
  v11 = &v12;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(listenerQueue, block);
  LOBYTE(listenerQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)listenerQueue;
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"com.apple.accessoryupdater.launchauhelper.entitled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue])
  {
    BOOL v6 = 1;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_10004F6B4(log, v4);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)userPreferenceObjectForSuite:(unint64_t)a3 withKey:(id)a4 withReply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = sub_100007144(a3);
  if (v10)
  {
    id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:v10];
    uint64_t v12 = [v11 objectForKey:v8];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      char v15 = "-[AUHelperService userPreferenceObjectForSuite:withKey:withReply:]";
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, " %s: Read out %@: %@ for %@", (uint8_t *)&v14, 0x2Au);
    }
    v9[2](v9, v12);

    v9 = (void (**)(id, void *))v11;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004F750();
    }
    v9[2](v9, 0);
  }
}

- (void)userPreferenceSetObject:(id)a3 forSuite:(unint64_t)a4 withKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100007144(a4);
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315906;
      int v14 = "-[AUHelperService userPreferenceSetObject:forSuite:withKey:]";
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, " %s: Write %@: %@ to %@", (uint8_t *)&v13, 0x2Au);
    }
    id v12 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:v10];
    [v12 setObject:v8 forKey:v9];
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    sub_10004F7D0();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end