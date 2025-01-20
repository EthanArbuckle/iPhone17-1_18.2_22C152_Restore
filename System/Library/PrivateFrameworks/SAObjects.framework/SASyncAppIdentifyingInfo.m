@interface SASyncAppIdentifyingInfo
+ (id)appIdentifyingInfo;
- (NSString)buildNumber;
- (NSString)bundleId;
- (NSString)clientIdentifier;
- (NSString)version;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBuildNumber:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SASyncAppIdentifyingInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"AppIdentifyingInfo";
}

+ (id)appIdentifyingInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)buildNumber
{
  return (NSString *)[(AceObject *)self propertyForKey:@"buildNumber"];
}

- (void)setBuildNumber:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (NSString)clientIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"clientIdentifier"];
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)version
{
  return (NSString *)[(AceObject *)self propertyForKey:@"version"];
}

- (void)setVersion:(id)a3
{
}

@end