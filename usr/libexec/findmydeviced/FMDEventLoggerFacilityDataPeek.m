@interface FMDEventLoggerFacilityDataPeek
+ (id)facilityName;
- (BOOL)shouldLog;
- (FMDEventLoggerFacilityDataPeek)init;
- (NSString)baseIdentifierKey;
- (id)loggedEvents;
- (void)logEvent:(id)a3;
- (void)setBaseIdentifierKey:(id)a3;
@end

@implementation FMDEventLoggerFacilityDataPeek

+ (id)facilityName
{
  return @"FMDEventLoggerFacilityDataPeek";
}

- (FMDEventLoggerFacilityDataPeek)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMDEventLoggerFacilityDataPeek;
  v2 = [(FMDEventLoggerFacilityDataPeek *)&v7 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 bundleIdentifier];

    v5 = [v4 stringByAppendingString:@"."];
    [(FMDEventLoggerFacilityDataPeek *)v2 setBaseIdentifierKey:v5];
  }
  return v2;
}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  if ([(FMDEventLoggerFacilityDataPeek *)self shouldLog])
  {
    v5 = [(FMDEventLoggerFacilityDataPeek *)self baseIdentifierKey];
    v6 = [v4 eventName];
    objc_super v7 = [v5 stringByAppendingString:v6];

    v8 = [v4 userInfo];
    v9 = [v8 objectForKeyedSubscript:@"FMDEventLoggerFacilityDataPeekDistributionValue"];

    if (v9)
    {
      [v9 doubleValue];
      v11 = v10;
      v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        v18 = v7;
        __int16 v19 = 2048;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DataPeek Distribution : %@ %f", (uint8_t *)&v17, 0x16u);
      }

      ADClientPushValueForDistributionKey();
    }
    v13 = [v4 userInfo];
    v14 = [v13 objectForKeyedSubscript:@"FMDEventLoggerFacilityDataPeekCompoundScalarValue"];

    if (v14)
    {
      id v15 = [v14 integerValue];
      v16 = sub_100004238();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        v18 = v7;
        __int16 v19 = 2048;
        id v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DataPeek Compound Scalar : %@ %lli", (uint8_t *)&v17, 0x16u);
      }

      ADClientAddValueForScalarKey();
    }
  }
}

- (BOOL)shouldLog
{
  return 1;
}

- (NSString)baseIdentifierKey
{
  return self->_baseIdentifierKey;
}

- (void)setBaseIdentifierKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end