@interface SASyncGetAnchorsResponse
+ (id)getAnchorsResponse;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)anchors;
- (NSNumber)syncDataReset;
- (NSString)authToken;
- (NSString)primeToken;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnchors:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setPrimeToken:(id)a3;
- (void)setSyncDataReset:(id)a3;
@end

@implementation SASyncGetAnchorsResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"GetAnchorsResponse";
}

+ (id)getAnchorsResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)anchors
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"anchors", v3);
}

- (void)setAnchors:(id)a3
{
}

- (NSString)authToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"authToken"];
}

- (void)setAuthToken:(id)a3
{
}

- (NSString)primeToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"primeToken"];
}

- (void)setPrimeToken:(id)a3
{
}

- (NSNumber)syncDataReset
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"syncDataReset"];
}

- (void)setSyncDataReset:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end