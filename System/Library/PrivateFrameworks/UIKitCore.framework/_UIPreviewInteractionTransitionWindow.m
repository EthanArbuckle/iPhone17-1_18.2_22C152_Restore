@interface _UIPreviewInteractionTransitionWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_isSettingFirstResponder;
- (BOOL)canBecomeKeyWindow;
- (BOOL)isInternalWindow;
- (_UIPreviewInteractionTransitionWindow)init;
- (id)_roleHint;
@end

@implementation _UIPreviewInteractionTransitionWindow

- (_UIPreviewInteractionTransitionWindow)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionTransitionWindow;
  v2 = [(UIWindow *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(UIWindow *)v2 setWindowLevel:2150.0];
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = v3;
  }

  return v3;
}

+ (BOOL)_isSystemWindow
{
  return 1;
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

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintPeekAndPop";
}

@end