@interface _GDBAManager
+ (id)loadNumberForPreferenceKey:(id)a3;
+ (id)sharedInstance;
+ (void)saveNumber:(id)a3 forKey:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clientIDToLocationManager;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)authorizationSemaphore;
- (OS_os_log)log;
- (_GDBAManager)init;
- (id)boundaryPolygons;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)registerClientID:(id)a3 locationBundlePath:(id)a4 handler:(id)a5;
- (void)setAuthorizationSemaphore:(id)a3;
- (void)setClientIDToLocationManager:(id)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setupLocationManagerForPath:(id)a3 identifier:(id)a4;
- (void)updateBA;
- (void)updateBAClientID:(id)a3 handler:(id)a4;
- (void)updateBAStatus;
@end

@implementation _GDBAManager

- (_GDBAManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)_GDBAManager;
  v2 = [(_GDBAManager *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.griddatad.locmonitor.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.gds", "geoDataReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    authorizationSemaphore = v2->_authorizationSemaphore;
    v2->_authorizationSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing delegate", buf, 2u);
    }
    v11 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002610;
    block[3] = &unk_100008330;
    v12 = v2;
    v17 = v12;
    dispatch_sync(v11, block);
    id v13 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.griddatad.registration"];
    id v14 = v12[3];
    v12[3] = v13;

    [v12[3] setDelegate:v12];
    [v12[3] resume];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10000CE30 != -1) {
    dispatch_once(&qword_10000CE30, &stru_100008370);
  }
  v2 = (void *)qword_10000CE28;

  return v2;
}

+ (id)loadNumberForPreferenceKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.gridDataServices", kCFPreferencesAnyUser, kCFPreferencesAnyHost);

  return v3;
}

+ (void)saveNumber:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, @"com.apple.gridDataServices", kCFPreferencesAnyUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(@"com.apple.gridDataServices", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)boundaryPolygons
{
  v3 = (void *)os_transaction_create();
  dispatch_queue_t v4 = +[_GDBAManager loadNumberForPreferenceKey:@"polygonsFetchDate"];
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    os_log_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v6 timeIntervalSinceNow];
    if (v7 > -2592000.0)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Polygons were fetched in last 30 days", buf, 2u);
      }
      id v9 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/GridData", @"polygons.json"];
      v10 = +[NSDictionary dictionaryWithContentsOfFile:v9];
      v11 = v10;
      if (v10)
      {
        v12 = [v10 allKeys];
        id v13 = [v12 count];

        if (v13) {
          goto LABEL_21;
        }
      }
    }
  }
  id v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Fetching polygons", buf, 2u);
  }
  v15 = +[_GDSBalancingAuthority fetchBalancingAuthorityPolygons];
  v11 = v15;
  if (v15)
  {
    v16 = [v15 allKeys];
    id v17 = [v16 count];

    if (v17)
    {
      os_log_t v6 = +[NSFileManager defaultManager];
      char v29 = 0;
      v18 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/GridData", @"polygons.json"];
      if ([v6 fileExistsAtPath:v18 isDirectory:&v29])
      {
        id v19 = 0;
      }
      else
      {
        id v28 = 0;
        unsigned __int8 v20 = [v6 createDirectoryAtPath:@"/var/db/GridData" withIntermediateDirectories:1 attributes:0 error:&v28];
        id v19 = v28;
        if ((v20 & 1) == 0)
        {
          v21 = self->_log;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
            sub_100004CA8((uint64_t)v19, v21);
          }
        }
      }
      v22 = +[NSURL fileURLWithPath:v18];
      id v27 = v19;
      [v11 writeToURL:v22 error:&v27];
      id v9 = v27;

      v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v18;
        __int16 v32 = 2112;
        id v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Wrote to File %@. Error: %@", buf, 0x16u);
      }
      v24 = +[NSDate date];
      [v24 timeIntervalSinceReferenceDate];
      v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      +[_GDBAManager saveNumber:v25 forKey:@"polygonsFetchDate"];

LABEL_21:
    }
  }

  return v11;
}

- (void)updateBAStatus
{
  v3 = +[_GDSBalancingAuthority loadBalancingAuthorityStatus];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v4 = +[NSMutableDictionary dictionary];
  }
  clientIDToLocationManager = self->_clientIDToLocationManager;
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100002D80;
  v10 = &unk_100008398;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)clientIDToLocationManager enumerateKeysAndObjectsUsingBlock:&v7];
  +[_GDSBalancingAuthority saveBalancingAuthorityStatus:](_GDSBalancingAuthority, "saveBalancingAuthorityStatus:", v6, v7, v8, v9, v10, v11);
}

- (void)updateBA
{
  v3 = (void *)os_transaction_create();
  id v4 = [(_GDBAManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002F98;
  block[3] = &unk_100008330;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)setupLocationManagerForPath:(id)a3 identifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!self->_clientIDToLocationManager)
  {
    double v7 = +[NSMutableDictionary dictionary];
    clientIDToLocationManager = self->_clientIDToLocationManager;
    self->_clientIDToLocationManager = v7;
  }
  id v9 = objc_alloc((Class)CLLocationManager);
  v10 = +[NSBundle bundleWithPath:v12];
  id v11 = [v9 initWithEffectiveBundle:v10 delegate:self onQueue:self->_queue];

  [v11 setDesiredAccuracy:3000.0];
  [(NSMutableDictionary *)self->_clientIDToLocationManager setObject:v11 forKeyedSubscript:v6];
  [(_GDBAManager *)self updateBAStatus];
}

- (void)registerClientID:(id)a3 locationBundlePath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000038F0;
  v15[3] = &unk_100008510;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync((dispatch_queue_t)queue, v15);
}

- (void)updateBAClientID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Received request for BA update from %@!", (uint8_t *)&v9, 0xCu);
  }
  [(_GDBAManager *)self updateBA];
  v7[2](v7, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100004E5C();
  }
  id v8 = [v7 valueForEntitlement:@"com.apple.griddata.allow"];
  int v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) != 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = log;
      v16[0] = 67109120;
      v16[1] = [v7 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Listener accepted new connection from PID %d\n", (uint8_t *)v16, 8u);
    }
    id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GDSManagerProtocol];
    [v7 setExportedInterface:v12];

    [v7 setExportedObject:self];
    [v7 resume];
    BOOL v13 = 1;
  }
  else
  {
    id v14 = [(_GDBAManager *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100004DD0(v7, v14);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
}

- (NSMutableDictionary)clientIDToLocationManager
{
  return self->_clientIDToLocationManager;
}

- (void)setClientIDToLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIDToLocationManager, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end