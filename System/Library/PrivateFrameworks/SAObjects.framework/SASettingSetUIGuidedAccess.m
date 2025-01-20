@interface SASettingSetUIGuidedAccess
+ (id)setUIGuidedAccess;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingSetUIGuidedAccess

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetUIGuidedAccess";
}

+ (id)setUIGuidedAccess
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end