@interface SADPDeviceSearch
+ (id)deviceSearch;
- (BOOL)requiresResponse;
- (NSArray)deviceSearchQueries;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeviceSearchQueries:(id)a3;
@end

@implementation SADPDeviceSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.devicePlaySound";
}

- (id)encodedClassName
{
  return @"DeviceSearch";
}

+ (id)deviceSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)deviceSearchQueries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"deviceSearchQueries", v3);
}

- (void)setDeviceSearchQueries:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end