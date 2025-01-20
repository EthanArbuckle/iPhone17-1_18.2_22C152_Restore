@interface SRDeviceUsageDefaults
- (BMBookmarkNode)deviceUsageReportServiceDataSessionPublisherBookmark;
- (BMBookmarkNode)deviceUsageReportSessionPublisherBookmark;
- (BMStoreEvent)lastDeviceUsageActivityLevelEvent;
- (BMStoreEvent)lastDeviceUsageMotionActivityEvent;
- (BOOL)isRoundingEnabled;
- (NSDate)lastDeviceUsageQueryDate;
- (NSUserDefaults)defaults;
- (SRDeviceUsageDefaults)init;
- (SRDeviceUsageDefaults)initWithDefaults:(id)a3;
- (double)queryIntervalShift;
- (id)localObjectForKey:(id)a3 ofClass:(Class)a4;
- (void)dealloc;
- (void)setDefaults:(id)a3;
- (void)setDeviceUsageReportServiceDataSessionPublisherBookmark:(id)a3;
- (void)setDeviceUsageReportSessionPublisherBookmark:(id)a3;
- (void)setLastDeviceUsageActivityLevelEvent:(id)a3;
- (void)setLastDeviceUsageMotionActivityEvent:(id)a3;
- (void)setLastDeviceUsageQueryDate:(id)a3;
- (void)setLocalObject:(id)a3 forKey:(id)a4;
- (void)setQueryIntervalShift:(double)a3;
- (void)setRoundingEnabled:(BOOL)a3;
@end

@implementation SRDeviceUsageDefaults

- (SRDeviceUsageDefaults)init
{
  v3 = +[NSUserDefaults standardUserDefaults];

  return [(SRDeviceUsageDefaults *)self initWithDefaults:v3];
}

- (SRDeviceUsageDefaults)initWithDefaults:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SRDeviceUsageDefaults;
  v4 = [(SRDeviceUsageDefaults *)&v8 init];
  if (v4)
  {
    v4->_defaults = (NSUserDefaults *)a3;
    v5 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v11 = @"queryIntervalShift";
    v12 = +[NSNumber numberWithDouble:3600.0];
    [(NSUserDefaults *)v5 registerDefaults:+[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]];
    v6 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v9 = @"roundingEnabled";
    v10 = +[NSNumber numberWithBool:1];
    [(NSUserDefaults *)v6 registerDefaults:+[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1]];
  }
  return v4;
}

- (void)dealloc
{
  [(SRDeviceUsageDefaults *)self setDefaults:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDeviceUsageDefaults;
  [(SRDeviceUsageDefaults *)&v3 dealloc];
}

- (id)localObjectForKey:(id)a3 ofClass:(Class)a4
{
  v6 = -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:");
  if (!v6)
  {
    if (qword_10002AA38 != -1) {
      dispatch_once(&qword_10002AA38, &stru_100024B48);
    }
    v12 = qword_10002AA40;
    if (!os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    id v17 = a3;
    v13 = "Could not read %@ from defaults.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
    return 0;
  }
  v7 = v6;
  id v8 = [(NSDictionary *)v6 objectForKeyedSubscript:@"deviceID"];
  if (qword_10002AA48 != -1) {
    dispatch_once(&qword_10002AA48, &stru_100024B68);
  }
  if (![v8 isEqualToString:qword_10002AA50])
  {
    if (qword_10002AA38 != -1) {
      dispatch_once(&qword_10002AA38, &stru_100024B48);
    }
    v12 = qword_10002AA40;
    if (!os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    id v17 = a3;
    v13 = "%@ value was stored on another device. Discarded.";
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:a4 fromData:[(NSDictionary *)v7 objectForKeyedSubscript:a3] error:&v15];
  if (v15 || (v10 = v9) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_10002AA38 != -1) {
      dispatch_once(&qword_10002AA38, &stru_100024B48);
    }
    CFStringRef v11 = qword_10002AA40;
    if (os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive %@ because %@", buf, 0x16u);
    }
    return 0;
  }
  return v10;
}

- (void)setLocalObject:(id)a3 forKey:(id)a4
{
  if (qword_10002AA48 == -1)
  {
    if (!a3) {
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&qword_10002AA48, &stru_100024B68);
    if (!a3) {
      goto LABEL_12;
    }
  }
  uint64_t v7 = qword_10002AA50;
  if (qword_10002AA50)
  {
    uint64_t v14 = 0;
    id v8 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v14];
    if (!v14 && v8)
    {
      v15[0] = @"deviceID";
      v15[1] = a4;
      v16[0] = v7;
      v16[1] = v8;
      [(NSUserDefaults *)self->_defaults setObject:+[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2] forKey:a4];
      return;
    }
    if (qword_10002AA38 != -1) {
      dispatch_once(&qword_10002AA38, &stru_100024B48);
    }
    uint64_t v9 = qword_10002AA40;
    if (os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = a4;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      v10 = "Failed to serilize %@ because %@";
      CFStringRef v11 = v9;
      uint32_t v12 = 22;
LABEL_17:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      return;
    }
    return;
  }
LABEL_12:
  if (qword_10002AA38 != -1) {
    dispatch_once(&qword_10002AA38, &stru_100024B48);
  }
  uint64_t v13 = qword_10002AA40;
  if (os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = a4;
    v10 = "Failed to save %@ to defaults. Invalid parameters.";
    CFStringRef v11 = v13;
    uint32_t v12 = 12;
    goto LABEL_17;
  }
}

- (NSDate)lastDeviceUsageQueryDate
{
  return (NSDate *)[(NSUserDefaults *)self->_defaults objectForKey:@"lastDeviceUsageQueryDate"];
}

- (void)setLastDeviceUsageQueryDate:(id)a3
{
}

- (double)queryIntervalShift
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"queryIntervalShift"];
  return result;
}

- (void)setQueryIntervalShift:(double)a3
{
  if (a3 >= 0.0)
  {
    defaults = self->_defaults;
    -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"lastDeviceUsageQueryDate");
  }
  else
  {
    if (qword_10002AA38 != -1) {
      dispatch_once(&qword_10002AA38, &stru_100024B48);
    }
    v4 = qword_10002AA40;
    if (os_log_type_enabled((os_log_t)qword_10002AA40, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134218240;
      double v7 = a3;
      __int16 v8 = 2048;
      uint64_t v9 = 0x40AC200000000000;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Negative value (%f) for query shift is not supported. Valid range [0..n] seconds. Default value is %f seconds.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BMStoreEvent)lastDeviceUsageActivityLevelEvent
{
  uint64_t v3 = objc_opt_class();

  return (BMStoreEvent *)[(SRDeviceUsageDefaults *)self localObjectForKey:@"lastDeviceUsageActivityLevelEvent" ofClass:v3];
}

- (void)setLastDeviceUsageActivityLevelEvent:(id)a3
{
}

- (BMStoreEvent)lastDeviceUsageMotionActivityEvent
{
  uint64_t v3 = objc_opt_class();

  return (BMStoreEvent *)[(SRDeviceUsageDefaults *)self localObjectForKey:@"lastDeviceUsageMotionActivityEvent" ofClass:v3];
}

- (void)setLastDeviceUsageMotionActivityEvent:(id)a3
{
}

- (BMBookmarkNode)deviceUsageReportSessionPublisherBookmark
{
  uint64_t v3 = objc_opt_class();

  return (BMBookmarkNode *)[(SRDeviceUsageDefaults *)self localObjectForKey:@"deviceUsageReportSessionPublisherBookmark" ofClass:v3];
}

- (void)setDeviceUsageReportSessionPublisherBookmark:(id)a3
{
}

- (BMBookmarkNode)deviceUsageReportServiceDataSessionPublisherBookmark
{
  uint64_t v3 = objc_opt_class();

  return (BMBookmarkNode *)[(SRDeviceUsageDefaults *)self localObjectForKey:@"deviceUsageReportServiceDataSessionPublisherBookmark" ofClass:v3];
}

- (void)setDeviceUsageReportServiceDataSessionPublisherBookmark:(id)a3
{
}

- (BOOL)isRoundingEnabled
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"roundingEnabled"];
}

- (void)setRoundingEnabled:(BOOL)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

@end