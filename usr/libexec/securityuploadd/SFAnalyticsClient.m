@interface SFAnalyticsClient
+ (id)getSharedClientNamed:(id)a3 orCreateWithStorePath:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
+ (void)clearSFAnalyticsClientGlobalCache;
- (BOOL)requireDeviceAnalytics;
- (BOOL)requireiCloudAnalytics;
- (NSString)name;
- (NSString)storePath;
- (OS_dispatch_queue)queue;
- (SFAnalyticsClient)initWithStore:(id)a3 queue:(id)a4 name:(id)a5 requireDeviceAnalytics:(BOOL)a6 requireiCloudAnalytics:(BOOL)a7;
- (SFAnalyticsClient)initWithStorePath:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
- (SFAnalyticsSQLiteStore)store;
- (id)initFromExistingClient:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
- (void)withStore:(id)a3;
@end

@implementation SFAnalyticsClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SFAnalyticsSQLiteStore)store
{
  return self->_store;
}

- (BOOL)requireiCloudAnalytics
{
  return self->_requireiCloudAnalytics;
}

- (BOOL)requireDeviceAnalytics
{
  return self->_requireDeviceAnalytics;
}

- (NSString)name
{
  return self->_name;
}

- (void)withStore:(id)a3
{
  id v4 = a3;
  v5 = [(SFAnalyticsClient *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000049A0;
  v7[3] = &unk_100018670;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (SFAnalyticsClient)initWithStore:(id)a3 queue:(id)a4 name:(id)a5 requireDeviceAnalytics:(BOOL)a6 requireiCloudAnalytics:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFAnalyticsClient;
  v16 = [(SFAnalyticsClient *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_store, a3);
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v17->_name, a5);
    v17->_requireDeviceAnalytics = a6;
    v17->_requireiCloudAnalytics = a7;
  }

  return v17;
}

- (id)initFromExistingClient:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[NSString stringWithFormat:@"SFAnalyticsClient queue-%@", v10];
  id v13 = (const char *)[v12 UTF8String];
  id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v15 = [v11 queue];
  dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);

  v17 = [v11 store];

  v18 = [(SFAnalyticsClient *)self initWithStore:v17 queue:v16 name:v10 requireDeviceAnalytics:v7 requireiCloudAnalytics:v6];
  return v18;
}

- (SFAnalyticsClient)initWithStorePath:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)SFAnalyticsSQLiteStore);
  id v13 = [v12 initWithPath:v11 schema:SFAnalyticsTableSchema];

  id v14 = +[NSString stringWithFormat:@"SFAnalyticsClient queue-%@", v10];
  id v15 = (const char *)[v14 UTF8String];
  dispatch_queue_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create(v15, v16);

  v18 = [(SFAnalyticsClient *)self initWithStore:v13 queue:v17 name:v10 requireDeviceAnalytics:v7 requireiCloudAnalytics:v6];
  return v18;
}

- (NSString)storePath
{
  return (NSString *)[(SFAnalyticsSQLiteStore *)self->_store path];
}

+ (id)getSharedClientNamed:(id)a3 orCreateWithStorePath:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001DB68);
  if (!qword_10001DB70)
  {
    uint64_t v11 = +[NSMutableDictionary dictionary];
    id v12 = (void *)qword_10001DB70;
    qword_10001DB70 = v11;
  }
  id v13 = [v10 stringByStandardizingPath];
  id v14 = [(id)qword_10001DB70 objectForKeyedSubscript:v13];
  id v15 = v14;
  if (!v14)
  {
    v18 = [[SFAnalyticsClient alloc] initWithStorePath:v13 name:v9 requireDeviceAnalytics:v7 requireiCloudAnalytics:v6];
    objc_super v19 = [(SFAnalyticsClient *)v18 storePath];

    if (v9 && v19)
    {
      v20 = +[NSMutableDictionary dictionaryWithObject:v18 forKey:v9];
      v21 = (void *)qword_10001DB70;
      v22 = [(SFAnalyticsClient *)v18 storePath];
      [v21 setObject:v20 forKeyedSubscript:v22];

      goto LABEL_9;
    }
    v24 = [(SFAnalyticsClient *)v18 storePath];

    if (v24)
    {
      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
      v26 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: sharedClient.storePath is unexpectedly nil! Not adding to namedSharedClientsByStorePath", buf, 2u);
      }

      if (v9)
      {
LABEL_14:
        if (v18) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }
    v20 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: name is unexpectedly nil! Not adding to namedSharedClientsByStorePath", buf, 2u);
    }
LABEL_9:

    if (v18) {
      goto LABEL_19;
    }
LABEL_15:
    dispatch_queue_t v17 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: sharedClient is unexpectedly nil!", buf, 2u);
    }
    v18 = 0;
    goto LABEL_18;
  }
  dispatch_queue_t v16 = [v14 objectForKeyedSubscript:v9];
  if (v16)
  {
    dispatch_queue_t v17 = v16;
    v18 = (SFAnalyticsClient *)v17;
  }
  else
  {
    id v23 = v15;
    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x3032000000;
    v31 = sub_1000051E4;
    v32 = sub_1000051F4;
    id v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000051FC;
    v27[3] = &unk_100018910;
    v27[4] = buf;
    [v23 enumerateKeysAndObjectsUsingBlock:v27];
    dispatch_queue_t v17 = *((id *)v29 + 5);
    _Block_object_dispose(buf, 8);

    v18 = [[SFAnalyticsClient alloc] initFromExistingClient:v17 name:v9 requireDeviceAnalytics:v7 requireiCloudAnalytics:v6];
    [v23 setObject:v18 forKeyedSubscript:v9];
  }
LABEL_18:

LABEL_19:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);

  return v18;
}

+ (void)clearSFAnalyticsClientGlobalCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001DB68);
  v2 = (void *)qword_10001DB70;
  qword_10001DB70 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
}

@end