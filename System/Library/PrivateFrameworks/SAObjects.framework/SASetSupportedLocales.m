@interface SASetSupportedLocales
+ (id)setSupportedLocales;
- (BOOL)requiresResponse;
- (NSArray)locales;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocales:(id)a3;
@end

@implementation SASetSupportedLocales

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetSupportedLocales";
}

+ (id)setSupportedLocales
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)locales
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"locales"];
}

- (void)setLocales:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end