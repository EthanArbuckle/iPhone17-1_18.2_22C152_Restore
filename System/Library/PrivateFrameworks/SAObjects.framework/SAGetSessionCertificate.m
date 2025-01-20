@interface SAGetSessionCertificate
+ (id)getSessionCertificate;
- (BOOL)requiresResponse;
- (NSNumber)deviceAuthVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeviceAuthVersion:(id)a3;
@end

@implementation SAGetSessionCertificate

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetSessionCertificate";
}

+ (id)getSessionCertificate
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

- (BOOL)requiresResponse
{
  return 1;
}

@end