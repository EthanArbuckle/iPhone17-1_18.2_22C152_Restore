@interface _UIInteractiveHighlightEffectWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_isHostingPortalViews;
- (BOOL)isInternalWindow;
- (id)_roleHint;
@end

@implementation _UIInteractiveHighlightEffectWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_isHostingPortalViews
{
  return 1;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintPeekAndPop";
}

@end