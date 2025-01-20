@interface NSPProactiveTokenFetchAnalytics
- (BOOL)tokenFetchTriggered;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSDictionary)stats;
- (NSString)type;
- (NSString)vendor;
- (id)analyticsDict;
- (id)eventName;
- (void)setFromDate:(id)a3;
- (void)setStats:(id)a3;
- (void)setToDate:(id)a3;
- (void)setTokenFetchTriggered:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setVendor:(id)a3;
@end

@implementation NSPProactiveTokenFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.proactiveTokenFetch";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  v4 = v3;
  if (v3)
  {
    [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    v5 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [v4 setTimeZone:v5];

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    if (v6)
    {
      v7 = v6;
      v8 = [(NSPProactiveTokenFetchAnalytics *)self vendor];
      [v7 setObject:v8 forKeyedSubscript:@"Vendor"];

      v9 = [(NSPProactiveTokenFetchAnalytics *)self type];
      [v7 setObject:v9 forKeyedSubscript:@"Type"];

      v10 = [(NSPProactiveTokenFetchAnalytics *)self stats];
      [v7 addEntriesFromDictionary:v10];

      v11 = [(NSPProactiveTokenFetchAnalytics *)self fromDate];
      v12 = [v4 stringFromDate:v11];
      [v7 setObject:v12 forKeyedSubscript:@"FromDate"];

      v13 = [(NSPProactiveTokenFetchAnalytics *)self toDate];
      v14 = [v4 stringFromDate:v13];
      [v7 setObject:v14 forKeyedSubscript:@"ToDate"];

      if ([(NSPProactiveTokenFetchAnalytics *)self tokenFetchTriggered]) {
        CFStringRef v15 = @"Yes";
      }
      else {
        CFStringRef v15 = @"No";
      }
      [v7 setObject:v15 forKeyedSubscript:@"TokenFetchTriggered"];
      v16 = v7;
      v17 = v16;
      goto LABEL_7;
    }
    v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315138;
      v21 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v20, 0xCu);
    }

    v16 = 0;
  }
  else
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315138;
      v21 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null dateFormatter", (uint8_t *)&v20, 0xCu);
    }
  }
  v17 = 0;
LABEL_7:

  return v17;
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  self->_stats = (NSDictionary *)a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  self->_fromDate = (NSDate *)a3;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  self->_toDate = (NSDate *)a3;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  self->_vendor = (NSString *)a3;
}

- (BOOL)tokenFetchTriggered
{
  return self->_tokenFetchTriggered;
}

- (void)setTokenFetchTriggered:(BOOL)a3
{
  self->_tokenFetchTriggered = a3;
}

@end