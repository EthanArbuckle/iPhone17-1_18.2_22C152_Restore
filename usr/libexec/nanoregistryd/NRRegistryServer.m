@interface NRRegistryServer
+ (Class)proxyClass;
+ (Class)xpcListenerClass;
- (NRRegistryServer)initWithParameters:(id)a3;
- (id)_dumpSecureProperties:(id)a3 propertyIDList:(id)a4;
- (void)_notifyClients;
- (void)invalidate;
- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5;
- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcClientInfo:(id)a3;
- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)xpcGetChangeHistoryWithBlock:(id)a3;
- (void)xpcGetDeviceCollectionWithBlock:(id)a3;
- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5;
- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4;
- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
- (void)xpcSwitchIndex:(id)a3;
@end

@implementation NRRegistryServer

- (NRRegistryServer)initWithParameters:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NRRegistryServer;
  v5 = [(NRRegistryServer *)&v22 initWithParameters:v4];
  if (v5)
  {
    v5->_devicesUpdateCounterNotifyToken = [(id)objc_opt_class() registerNotifyTokenWithName:NRRegistryUpdateCounterNotification withQueue:0 withBlock:0];
    objc_initWeak(&location, v5);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100020880;
    v19[3] = &unk_100165CE8;
    objc_copyWeak(&v20, &location);
    id v6 = [(NRRegistryServer *)v5 addDiffObserverWithWriteBlock:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000208C0;
    v17[3] = &unk_1001660D0;
    objc_copyWeak(&v18, &location);
    id v7 = [(NRRegistryServer *)v5 addSecurePropertiesObserverWithReadBlock:v17];
    v8 = [NRXPCServer alloc];
    id v9 = [(id)objc_opt_class() proxyClass];
    v10 = -[NRXPCServer initWithProxyClass:xpcListenerClass:serverDelegate:xpcTarget:services:](v8, "initWithProxyClass:xpcListenerClass:serverDelegate:xpcTarget:services:", v9, [(id)objc_opt_class() xpcListenerClass], v5, v5, v5);
    registryServer = v5->_registryServer;
    v5->_registryServer = v10;

    v12 = [[objc_msgSend((id)objc_opt_class(), "proxyClass") machServiceName];
    v13 = nr_framework_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = nr_framework_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Listening to %@", buf, 0xCu);
      }
    }
    [(NRRegistryServer *)v5 _notifyClients];
    [(NRXPCServer *)v5->_registryServer resume];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

+ (Class)xpcListenerClass
{
  return (Class)objc_opt_class();
}

- (void)_notifyClients
{
  v3 = [(NRRegistryServer *)self history];

  if (v3)
  {
    id v4 = sub_100020B60(self);
    if (!sub_100020900(self) || (id)sub_100020A7C(self) != v4)
    {
      sub_100020C00(self, (uint64_t)v4);
      id v5 = [(id)objc_opt_class() readNotifyToken:self->_devicesUpdateCounterNotifyToken];
      if (!sub_100020900(self) || v5 != v4)
      {
        sub_1000209EC(self, 1);
        id v6 = nr_daemon_log();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

        if (v7)
        {
          v8 = nr_daemon_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 134218240;
            id v10 = v5;
            __int16 v11 = 2048;
            id v12 = v4;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_notifyClients: Daemon notifying %llx->%llx", (uint8_t *)&v9, 0x16u);
          }
        }
        notify_set_state(self->_devicesUpdateCounterNotifyToken, (uint64_t)v4);
        notify_post((const char *)[NRRegistryUpdateCounterNotification UTF8String]);
      }
    }
  }
}

- (void)invalidate
{
  v3 = [(NRRegistryServer *)self managementQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020EC8;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)NRRegistryServer;
  [(NRRegistryServer *)&v4 invalidate];
}

- (void)xpcGetDeviceCollectionWithBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000210F4;
  v4[3] = &unk_100166148;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRRegistryServer *)v5 grabHistoryWithReadBlock:v4];
}

- (id)_dumpSecureProperties:(id)a3 propertyIDList:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 allObjects];
  if (!v7)
  {
    v8 = [(NRRegistryServer *)self secureProperties];
    BOOL v7 = [v8 allSecurePropertyIDs];
  }
  int v9 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = [v6 objectForKeyedSubscript:v15];
        if (v16) {
          [v9 setObject:v16 forKeyedSubscript:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000213F0;
  v9[3] = &unk_100166170;
  id v10 = a5;
  unint64_t v11 = a3;
  BOOL v12 = a4;
  v9[4] = self;
  id v8 = v10;
  [(NRRegistryServer *)self grabHistoryWithReadBlock:v9];
}

- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000216B4;
  v8[3] = &unk_100166198;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(NRRegistryServer *)self grabRegistryWithReadBlock:v8];
}

- (void)xpcGetChangeHistoryWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000217E4;
  v5[3] = &unk_1001661C0;
  id v6 = a3;
  id v4 = v6;
  [(NRRegistryServer *)self grabHistoryWithReadBlock:v5];
}

- (void)xpcClientInfo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000218D8;
  v4[3] = &unk_100166210;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRRegistryServer *)v5 enqueueAsync:v4];
}

- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100021BC4;
  v12[3] = &unk_100166238;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  [(NRRegistryServer *)self grabRegistryWithWriteBlockAsync:v12];
}

- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021DC0;
  v6[3] = &unk_100166260;
  unsigned int v8 = a3;
  id v7 = a4;
  id v5 = v7;
  [(NRRegistryServer *)self grabHistoryWithReadBlock:v6];
}

- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021EFC;
  v9[3] = &unk_100166288;
  BOOL v12 = a3;
  id v10 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [(NRRegistryServer *)self grabRegistryWithWriteBlockAsync:v9];
}

- (void)xpcSwitchIndex:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022558;
  v5[3] = &unk_1001661C0;
  id v6 = a3;
  id v4 = v6;
  [(NRRegistryServer *)self grabHistoryWithReadBlock:v5];
}

- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v5 = (void (**)(id, BOOL, CFIndex))a4;
  Boolean keyExistsAndHasValidFormat = 0;
  if (a3)
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)a3, kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
    BOOL v7 = keyExistsAndHasValidFormat != 0;
  }
  else
  {
    BOOL v7 = 0;
    CFIndex AppIntegerValue = 0;
  }
  v5[2](v5, v7, AppIntegerValue);
}

- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v5 = (void (**)(id, BOOL, BOOL))a4;
  Boolean keyExistsAndHasValidFormat = 0;
  if (a3)
  {
    BOOL v6 = CFPreferencesGetAppBooleanValue((CFStringRef)a3, kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat) != 0;
    BOOL v7 = keyExistsAndHasValidFormat != 0;
  }
  else
  {
    BOOL v7 = 0;
    BOOL v6 = 0;
  }
  v5[2](v5, v7, v6);
}

- (void).cxx_destruct
{
}

@end