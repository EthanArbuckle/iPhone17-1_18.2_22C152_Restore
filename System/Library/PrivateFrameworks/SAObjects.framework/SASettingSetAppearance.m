@interface SASettingSetAppearance
+ (id)setAppearance;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)appearance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppearance:(id)a3;
@end

@implementation SASettingSetAppearance

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetAppearance";
}

+ (id)setAppearance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appearance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appearance"];
}

- (void)setAppearance:(id)a3
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