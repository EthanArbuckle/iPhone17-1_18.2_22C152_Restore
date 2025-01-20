@interface SAFetchLanguageSettings
+ (id)fetchLanguageSettings;
- (BOOL)requiresResponse;
- (NSString)idiom;
- (NSString)systemBuildPrefix;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdiom:(id)a3;
- (void)setSystemBuildPrefix:(id)a3;
@end

@implementation SAFetchLanguageSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"FetchLanguageSettings";
}

+ (id)fetchLanguageSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)idiom
{
  return (NSString *)[(AceObject *)self propertyForKey:@"idiom"];
}

- (void)setIdiom:(id)a3
{
}

- (NSString)systemBuildPrefix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"systemBuildPrefix"];
}

- (void)setSystemBuildPrefix:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end