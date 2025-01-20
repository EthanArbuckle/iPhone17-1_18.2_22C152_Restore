@interface SADeviceSetDeviceToSleep
+ (id)setDeviceToSleep;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADeviceSetDeviceToSleep

- (id)groupIdentifier
{
  return @"com.apple.ace.device";
}

- (id)encodedClassName
{
  return @"SetDeviceToSleep";
}

+ (id)setDeviceToSleep
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end