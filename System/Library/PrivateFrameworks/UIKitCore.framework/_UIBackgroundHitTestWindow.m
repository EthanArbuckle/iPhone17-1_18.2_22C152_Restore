@interface _UIBackgroundHitTestWindow
+ (BOOL)_isSystemWindow;
- (id)_roleHint;
@end

@implementation _UIBackgroundHitTestWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintHitTesting";
}

@end