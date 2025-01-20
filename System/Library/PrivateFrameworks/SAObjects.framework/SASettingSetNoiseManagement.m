@interface SASettingSetNoiseManagement
+ (id)setNoiseManagement;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)noiseManagementOption;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNoiseManagementOption:(id)a3;
@end

@implementation SASettingSetNoiseManagement

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetNoiseManagement";
}

+ (id)setNoiseManagement
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)noiseManagementOption
{
  return (NSString *)[(AceObject *)self propertyForKey:@"noiseManagementOption"];
}

- (void)setNoiseManagementOption:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end