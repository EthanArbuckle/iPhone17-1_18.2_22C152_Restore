@interface SACreateSessionInfoRequest
+ (id)createSessionInfoRequest;
- (BOOL)requiresResponse;
- (NSData)sessionInfoRequest;
- (NSNumber)deviceAuthVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeviceAuthVersion:(id)a3;
- (void)setSessionInfoRequest:(id)a3;
@end

@implementation SACreateSessionInfoRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CreateSessionInfoRequest";
}

+ (id)createSessionInfoRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)deviceAuthVersion
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"deviceAuthVersion"];
}

- (void)setDeviceAuthVersion:(id)a3
{
}

- (NSData)sessionInfoRequest
{
  return (NSData *)[(AceObject *)self propertyForKey:@"sessionInfoRequest"];
}

- (void)setSessionInfoRequest:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end