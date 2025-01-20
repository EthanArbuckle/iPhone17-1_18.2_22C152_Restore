@interface NSPIPAddressLocationPreferenceStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)locationPreference;
- (void)setLocationPreference:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPIPAddressLocationPreferenceStats

- (id)eventName
{
  return @"com.apple.nsp.ipLocationPreference";
}

- (id)analyticsDict
{
  v3 = [(NSPIPAddressLocationPreferenceStats *)self tierType];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSNumber numberWithUnsignedInteger:[(NSPIPAddressLocationPreferenceStats *)self locationPreference]];
    [v4 setObject:v5 forKeyedSubscript:@"LocationSharingPreference"];

    v6 = [(NSPIPAddressLocationPreferenceStats *)self tierType];
    [v4 setObject:v6 forKeyedSubscript:@"TierType"];
  }
  else
  {
    v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      v10 = "-[NSPIPAddressLocationPreferenceStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null self.tierType", (uint8_t *)&v9, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (unint64_t)locationPreference
{
  return self->_locationPreference;
}

- (void)setLocationPreference:(unint64_t)a3
{
  self->_locationPreference = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end