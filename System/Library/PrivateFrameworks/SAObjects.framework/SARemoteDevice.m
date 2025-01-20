@interface SARemoteDevice
+ (id)remoteDevice;
- (BOOL)siriEnabled;
- (NSNumber)personalDomainsEnabled;
- (NSString)assistantId;
- (NSString)brandName;
- (NSString)deviceName;
- (NSString)discoveryMode;
- (NSString)language;
- (NSString)personalDomainsAuthenticationMode;
- (NSString)userAgent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssistantId:(id)a3;
- (void)setBrandName:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDiscoveryMode:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPersonalDomainsAuthenticationMode:(id)a3;
- (void)setPersonalDomainsEnabled:(id)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SARemoteDevice

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RemoteDevice";
}

+ (id)remoteDevice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)brandName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"brandName"];
}

- (void)setBrandName:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceName"];
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)discoveryMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"discoveryMode"];
}

- (void)setDiscoveryMode:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)personalDomainsAuthenticationMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personalDomainsAuthenticationMode"];
}

- (void)setPersonalDomainsAuthenticationMode:(id)a3
{
}

- (NSNumber)personalDomainsEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"personalDomainsEnabled"];
}

- (void)setPersonalDomainsEnabled:(id)a3
{
}

- (BOOL)siriEnabled
{
  return AceObjectBoolForProperty(self, @"siriEnabled");
}

- (void)setSiriEnabled:(BOOL)a3
{
}

- (NSString)userAgent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userAgent"];
}

- (void)setUserAgent:(id)a3
{
}

@end