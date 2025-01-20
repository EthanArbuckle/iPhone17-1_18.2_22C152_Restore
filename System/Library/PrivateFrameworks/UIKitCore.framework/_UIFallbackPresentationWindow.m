@interface _UIFallbackPresentationWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_includeInDefaultImageSnapshot;
@end

@implementation _UIFallbackPresentationWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return 1;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

@end