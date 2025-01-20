@interface SASiriSupport
+ (id)siriSupport;
- (NSArray)endpoints;
- (NSArray)useCases;
- (NSString)authToken;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAuthToken:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setUseCases:(id)a3;
@end

@implementation SASiriSupport

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SiriSupport";
}

+ (id)siriSupport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)authToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"authToken"];
}

- (void)setAuthToken:(id)a3
{
}

- (NSArray)endpoints
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"endpoints", v3);
}

- (void)setEndpoints:(id)a3
{
}

- (NSArray)useCases
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"useCases"];
}

- (void)setUseCases:(id)a3
{
}

@end