@interface SASettingOpenPreference
+ (id)openPreference;
- (BOOL)requiresResponse;
- (NSString)pane;
- (NSString)tag;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPane:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SASettingOpenPreference

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenPreference";
}

+ (id)openPreference
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)pane
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pane"];
}

- (void)setPane:(id)a3
{
}

- (NSString)tag
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tag"];
}

- (void)setTag:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end