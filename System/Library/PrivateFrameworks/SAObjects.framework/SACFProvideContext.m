@interface SACFProvideContext
+ (id)provideContext;
- (BOOL)requiresResponse;
- (NSString)context;
- (NSString)contextVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
- (void)setContextVersion:(id)a3;
@end

@implementation SACFProvideContext

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ProvideContext";
}

+ (id)provideContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)context
{
  return (NSString *)[(AceObject *)self propertyForKey:@"context"];
}

- (void)setContext:(id)a3
{
}

- (NSString)contextVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contextVersion"];
}

- (void)setContextVersion:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end