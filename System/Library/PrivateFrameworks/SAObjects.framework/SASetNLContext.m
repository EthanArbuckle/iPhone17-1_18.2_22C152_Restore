@interface SASetNLContext
+ (id)setNLContext;
- (BOOL)requiresResponse;
- (NSString)parseOverrideQuery;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setParseOverrideQuery:(id)a3;
@end

@implementation SASetNLContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetNLContext";
}

+ (id)setNLContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)parseOverrideQuery
{
  return (NSString *)[(AceObject *)self propertyForKey:@"parseOverrideQuery"];
}

- (void)setParseOverrideQuery:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end