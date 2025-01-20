@interface SAEndpoint
+ (id)endpoint;
- (BOOL)supportsAuthentication;
- (NSDictionary)operations;
- (NSString)providerId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOperations:(id)a3;
- (void)setProviderId:(id)a3;
- (void)setSupportsAuthentication:(BOOL)a3;
@end

@implementation SAEndpoint

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Endpoint";
}

+ (id)endpoint
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)operations
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"operations", v3);
}

- (void)setOperations:(id)a3
{
}

- (NSString)providerId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId"];
}

- (void)setProviderId:(id)a3
{
}

- (BOOL)supportsAuthentication
{
  return AceObjectBoolForProperty(self, @"supportsAuthentication");
}

- (void)setSupportsAuthentication:(BOOL)a3
{
}

@end