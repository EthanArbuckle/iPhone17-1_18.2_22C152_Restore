@interface SAAppsAppSearch
+ (id)appSearch;
- (BOOL)requiresResponse;
- (NSString)applicationName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationName:(id)a3;
@end

@implementation SAAppsAppSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"AppSearch";
}

+ (id)appSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)applicationName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationName"];
}

- (void)setApplicationName:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end