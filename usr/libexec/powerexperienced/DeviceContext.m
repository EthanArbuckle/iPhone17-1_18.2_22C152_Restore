@interface DeviceContext
+ (DeviceContext)sharedInstance;
- (DeviceContext)init;
- (NSMutableDictionary)currentContext;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)objectForKeyedSubscript:(id)a3;
- (void)handleBatteryLevelChange;
- (void)handleLockStateChange;
- (void)handlePowerSourceChange;
- (void)handleXPCEvent:(id)a3;
- (void)initLockStateChange;
- (void)initPowerSourceChange;
- (void)initializeMonitors;
- (void)setCurrentContext:(id)a3;
- (void)setLog:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation DeviceContext

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(DeviceContext *)self currentContext];
    v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  v5 = sub_100003E44();
  dispatch_assert_queue_V2(v5);

  string = xpc_dictionary_get_string(v4, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.system.powersources.source"))
  {
    [(DeviceContext *)self handlePowerSourceChange];
  }
  else if (!strcmp(string, "com.apple.springboard.lockstate"))
  {
    [(DeviceContext *)self handleLockStateChange];
  }
}

- (NSMutableDictionary)currentContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

+ (DeviceContext)sharedInstance
{
  if (qword_10001BE78 != -1) {
    dispatch_once(&qword_10001BE78, &stru_100014628);
  }
  v2 = (void *)qword_10001BE70;

  return (DeviceContext *)v2;
}

- (DeviceContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceContext;
  v2 = [(DeviceContext *)&v9 init];
  if (v2)
  {
    v3 = sub_100003E44();
    [(DeviceContext *)v2 setQueue:v3];

    os_log_t v4 = os_log_create("com.apple.powerexperienced", "contextmonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentContext = v2->_currentContext;
    v2->_currentContext = v6;
  }
  return v2;
}

- (void)start
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Starting Device Context", v4, 2u);
  }
  [(DeviceContext *)self initializeMonitors];
}

- (void)initializeMonitors
{
  v3 = (void *)MGGetStringAnswer();
  CFStringRef v4 = @"iPhone";
  unsigned __int8 v5 = [v3 isEqualToString:@"iPhone"];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MGGetStringAnswer();
    CFStringRef v4 = @"Watch";
    unsigned __int8 v7 = [v6 isEqualToString:@"Watch"];

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MGGetStringAnswer();
      unsigned int v9 = [v8 isEqualToString:@"AppleTV"];

      if (!v9) {
        goto LABEL_6;
      }
      CFStringRef v4 = @"TV";
    }
  }
  [(DeviceContext *)self setObject:v4 forKeyedSubscript:@"kPlatformContext"];
LABEL_6:
  [(DeviceContext *)self initPowerSourceChange];

  [(DeviceContext *)self initLockStateChange];
}

- (void)handlePowerSourceChange
{
  uint64_t v3 = IOPSDrawingUnlimitedPower();
  CFStringRef v4 = +[NSNumber numberWithBool:v3];
  [(DeviceContext *)self setObject:v4 forKeyedSubscript:@"kPluggedInContext"];

  unsigned __int8 v5 = [(DeviceContext *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power source update. AC powered %d", (uint8_t *)v6, 8u);
  }
}

- (void)handleBatteryLevelChange
{
  if (!IOPSGetPercentRemaining())
  {
    uint64_t v3 = +[NSNumber numberWithInt:0];
    [(DeviceContext *)self setObject:v3 forKeyedSubscript:@"kBatteryLevelContext"];

    CFStringRef v4 = [(DeviceContext *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v5 = [(DeviceContext *)self objectForKeyedSubscript:@"kBatteryLevelContext"];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "battery level %@", buf, 0xCu);
    }
  }
}

- (void)initPowerSourceChange
{
  if (notify_register_check("com.apple.system.powersources.source", &dword_10001BE60))
  {
    uint64_t v3 = [(DeviceContext *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000CE30(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = [(DeviceContext *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008668;
  handler[3] = &unk_100014608;
  handler[4] = self;
  uint32_t v12 = notify_register_dispatch("com.apple.system.powersources.percent", &dword_10001BE64, v11, handler);

  if (v12)
  {
    v13 = [(DeviceContext *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000CDF8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v21 = [(DeviceContext *)self queue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100008670;
  v22[3] = &unk_1000145C0;
  v22[4] = self;
  dispatch_async(v21, v22);
}

- (void)initLockStateChange
{
  if (notify_register_check("com.apple.springboard.lockstate", &dword_10001BE68))
  {
    uint64_t v3 = [(DeviceContext *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000CE68(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  [(DeviceContext *)self handleLockStateChange];
}

- (void)handleLockStateChange
{
  uint64_t v3 = sub_100003E44();
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0;
  if (notify_get_state(dword_10001BE68, &state64))
  {
    uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:state64];
    [(DeviceContext *)self setObject:v4 forKeyedSubscript:@"kLockStateContext"];
  }
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DeviceContext *)self willChangeValueForKey:@"currentContext"];
  uint64_t v8 = [(DeviceContext *)self currentContext];
  [v8 setObject:v7 forKeyedSubscript:v6];

  [(DeviceContext *)self didChangeValueForKey:@"currentContext"];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (void)setCurrentContext:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end