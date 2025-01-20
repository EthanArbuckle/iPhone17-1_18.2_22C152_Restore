@interface _UIDragSetDownAnimationWindow
+ (BOOL)_isSecure;
- (BOOL)_isHostingPortalViews;
- (id)_roleHint;
@end

@implementation _UIDragSetDownAnimationWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_isHostingPortalViews
{
  return 1;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintDragAnimation";
}

@end