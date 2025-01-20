@interface SASettingSetMidnightMode
+ (id)setMidnightMode;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingSetMidnightMode

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetMidnightMode";
}

+ (id)setMidnightMode
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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