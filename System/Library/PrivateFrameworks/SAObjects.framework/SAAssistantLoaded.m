@interface SAAssistantLoaded
+ (id)assistantLoaded;
- (BOOL)requiresResponse;
- (NSArray)syncAnchors;
- (NSNumber)requestSync;
- (NSString)appleConnectSessionToken;
- (NSString)dataAnchor;
- (NSString)version;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppleConnectSessionToken:(id)a3;
- (void)setDataAnchor:(id)a3;
- (void)setRequestSync:(id)a3;
- (void)setSyncAnchors:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SAAssistantLoaded

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AssistantLoaded";
}

+ (id)assistantLoaded
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appleConnectSessionToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appleConnectSessionToken"];
}

- (void)setAppleConnectSessionToken:(id)a3
{
}

- (NSString)dataAnchor
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dataAnchor"];
}

- (void)setDataAnchor:(id)a3
{
}

- (NSNumber)requestSync
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"requestSync"];
}

- (void)setRequestSync:(id)a3
{
}

- (NSArray)syncAnchors
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"syncAnchors", v3);
}

- (void)setSyncAnchors:(id)a3
{
}

- (NSString)version
{
  return (NSString *)[(AceObject *)self propertyForKey:@"version"];
}

- (void)setVersion:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end