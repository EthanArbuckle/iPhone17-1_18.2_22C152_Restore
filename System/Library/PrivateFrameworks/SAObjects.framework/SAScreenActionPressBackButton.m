@interface SAScreenActionPressBackButton
+ (id)pressBackButton;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAScreenActionPressBackButton

- (id)groupIdentifier
{
  return @"com.apple.ace.onscreenaction";
}

- (id)encodedClassName
{
  return @"PressBackButton";
}

+ (id)pressBackButton
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end