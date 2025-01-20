@interface SALanguageSettings
+ (id)languageSettings;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSDictionary)configuredLocales;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfiguredLocales:(id)a3;
@end

@implementation SALanguageSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"LanguageSettings";
}

+ (id)languageSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)configuredLocales
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"configuredLocales"];
}

- (void)setConfiguredLocales:(id)a3
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