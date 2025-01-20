@interface _UIWindowSystemOverlayWindow
+ (BOOL)_isSecure;
+ (BOOL)_isSystemWindow;
+ (BOOL)_needsPassthroughInteraction;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_isSettingFirstResponder;
- (BOOL)_shouldAdjustSizeClassesAndResizeWindow;
- (BOOL)canBecomeKeyWindow;
- (BOOL)isInternalWindow;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIWindowSystemOverlayWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)_needsPassthroughInteraction
{
  return 0;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  return 1;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5 = a4;
  if (![v5 _isInteractionBehaviorInactive]
    || [v5 type] == 9
    || +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:v5])
  {
    v6 = 0;
  }
  else
  {
    v6 = self;
  }

  return v6;
}

@end