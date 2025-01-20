@interface SASettingSetAppService
+ (id)setAppService;
- (BOOL)requiresResponse;
- (NSString)appWithSettingsId;
- (NSString)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppWithSettingsId:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SASettingSetAppService

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetAppService";
}

+ (id)setAppService
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appWithSettingsId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appWithSettingsId"];
}

- (void)setAppWithSettingsId:(id)a3
{
}

- (NSString)location
{
  return (NSString *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end