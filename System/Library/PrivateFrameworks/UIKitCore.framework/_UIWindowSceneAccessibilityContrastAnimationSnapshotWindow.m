@interface _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow
+ (BOOL)_isSecure;
- (BOOL)_ignoresHitTest;
- (id)_roleHint;
@end

@implementation _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintSnapshotting";
}

@end