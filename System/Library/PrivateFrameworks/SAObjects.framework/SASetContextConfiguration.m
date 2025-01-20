@interface SASetContextConfiguration
+ (id)setContextConfiguration;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)contextTimeoutSeconds;
- (void)setContextTimeoutSeconds:(int64_t)a3;
@end

@implementation SASetContextConfiguration

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetContextConfiguration";
}

+ (id)setContextConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)contextTimeoutSeconds
{
  return AceObjectIntegerForProperty(self, @"contextTimeoutSeconds");
}

- (void)setContextTimeoutSeconds:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end