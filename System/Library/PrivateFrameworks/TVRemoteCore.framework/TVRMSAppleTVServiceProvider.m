@interface TVRMSAppleTVServiceProvider
- (id)searchType;
- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3;
- (int64_t)serviceTypeFromTXTDictionary:(id)a3;
@end

@implementation TVRMSAppleTVServiceProvider

- (id)searchType
{
  return @"_appletv-v2._tcp.";
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  return 2;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVRMSAppleTVServiceProvider;
  return (id)[(TVRMSBonjourServiceProvider *)&v4 serviceTypeFromTXTDictionary:a3] == (id)2;
}

@end