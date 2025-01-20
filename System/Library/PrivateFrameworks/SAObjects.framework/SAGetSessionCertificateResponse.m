@interface SAGetSessionCertificateResponse
+ (id)getSessionCertificateResponse;
- (BOOL)requiresResponse;
- (NSData)certificate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCertificate:(id)a3;
@end

@implementation SAGetSessionCertificateResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetSessionCertificateResponse";
}

+ (id)getSessionCertificateResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)certificate
{
  return (NSData *)[(AceObject *)self propertyForKey:@"certificate"];
}

- (void)setCertificate:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end