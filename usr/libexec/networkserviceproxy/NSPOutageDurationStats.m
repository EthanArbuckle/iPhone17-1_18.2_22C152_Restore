@interface NSPOutageDurationStats
- (id)analyticsDict;
- (id)eventName;
- (id)outageTypeToString;
- (unint64_t)outageDurationSec;
- (unint64_t)outageType;
- (void)setOutageDurationSec:(unint64_t)a3;
- (void)setOutageType:(unint64_t)a3;
@end

@implementation NSPOutageDurationStats

- (id)eventName
{
  return @"com.apple.nsp.OutageDurationStats";
}

- (id)outageTypeToString
{
  unint64_t v2 = [(NSPOutageDurationStats *)self outageType];
  if (v2 - 1 > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_100105F60 + v2 - 1);
  }
}

- (id)analyticsDict
{
  if ([(NSPOutageDurationStats *)self outageType])
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = [(NSPOutageDurationStats *)self outageTypeToString];
    [v3 setObject:v4 forKeyedSubscript:@"OutageType"];

    v5 = +[NSNumber numberWithUnsignedInteger:[(NSPOutageDurationStats *)self outageDurationSec]];
    [v3 setObject:v5 forKeyedSubscript:@"OutageDuration"];
  }
  else
  {
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[NSPOutageDurationStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null self.outageType", (uint8_t *)&v8, 0xCu);
    }

    id v3 = 0;
  }

  return v3;
}

- (unint64_t)outageType
{
  return self->_outageType;
}

- (void)setOutageType:(unint64_t)a3
{
  self->_outageType = a3;
}

- (unint64_t)outageDurationSec
{
  return self->_outageDurationSec;
}

- (void)setOutageDurationSec:(unint64_t)a3
{
  self->_outageDurationSec = a3;
}

@end