@interface RMSAppleTVServiceProvider
- (id)searchType;
- (int64_t)serviceFlagsFromTXTDictionary:(id)a3;
- (int64_t)serviceTypeFromTXTDictionary:(id)a3;
@end

@implementation RMSAppleTVServiceProvider

- (id)searchType
{
  return @"_appletv-v2._tcp.";
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  return 2;
}

- (int64_t)serviceFlagsFromTXTDictionary:(id)a3
{
  v3 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"DFID" inTXTDictionary:a3];
  int64_t v4 = [v3 integerValue] < 3;

  return v4;
}

@end