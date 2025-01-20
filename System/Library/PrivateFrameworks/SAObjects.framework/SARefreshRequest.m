@interface SARefreshRequest
+ (id)refreshRequest;
- (BOOL)requiresResponse;
- (NSData)nlResultState;
- (NSData)serializedIntent;
- (NSString)source;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNlResultState:(id)a3;
- (void)setSerializedIntent:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SARefreshRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RefreshRequest";
}

+ (id)refreshRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)nlResultState
{
  return (NSData *)[(AceObject *)self propertyForKey:@"nlResultState"];
}

- (void)setNlResultState:(id)a3
{
}

- (NSData)serializedIntent
{
  return (NSData *)[(AceObject *)self propertyForKey:@"serializedIntent"];
}

- (void)setSerializedIntent:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end