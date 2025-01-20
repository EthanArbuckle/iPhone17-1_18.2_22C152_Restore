@interface SBStatusBarWindow
+ (BOOL)_isSecure;
+ (BOOL)_isSystemWindow;
+ (CGRect)_defaultStatusBarSceneReferenceBounds;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_isStatusBarWindow;
- (BOOL)_shouldAdjustSizeClassesAndResizeWindow;
- (BOOL)_shouldForceTraitPropagationThroughHierarchy;
- (CGRect)_statusBarWindowBoundsForOrientation:(int64_t)a3;
- (CGRect)_statusBarWindowFrame;
- (SBStatusBarWindow)initWithFrame:(CGRect)a3;
- (STUIStatusBar_Wrapper)statusBar;
- (UIEdgeInsets)safeAreaInsets;
- (id)_initWithOrientation:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)orientation;
- (void)_rotate;
- (void)_setStatusBarWindowOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4;
- (void)setStatusBar:(id)a3;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBStatusBarWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBStatusBarWindow;
  -[SBStatusBarWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBStatusBarWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (id)_initWithOrientation:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBStatusBarWindow;
  id result = [(SBStatusBarWindow *)&v5 _initWithOrientation:v3];
  if (result) {
    *((void *)result + 114) = v3;
  }
  return result;
}

- (SBStatusBarWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBStatusBarWindow;
  int64_t v3 = -[SBStatusBarWindow initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    [(SBStatusBarWindow *)v3 _statusBarWindowBoundsForOrientation:1];
    -[SBStatusBarWindow setFrame:](v4, "setFrame:");
    [(SBStatusBarWindow *)v4 setOpaque:0];
  }
  return v4;
}

+ (CGRect)_defaultStatusBarSceneReferenceBounds
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v10 = a3;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStatusBar"))
  {
    id v5 = [(UIWindow *)self _sbWindowScene];

    if (v5 != v10)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBStatusBarWindow.m" lineNumber:81 description:@"should connect to the window scene we are on"];
    }
    double v6 = [(UIWindow *)self _sbWindowScene];
    double v7 = [v6 traitsArbiter];

    if (!v7)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBStatusBarWindow.m" lineNumber:82 description:@"do not call this before the window scene is fully configured!"];
    }
    [(SBStatusBarWindow *)self _setRoleHint:@"SBTraitsParticipantRoleStatusBar"];
  }
}

- (void)setStatusBar:(id)a3
{
  id v5 = (STUIStatusBar_Wrapper *)a3;
  p_statusBar = &self->_statusBar;
  statusBar = self->_statusBar;
  double v14 = v5;
  if (statusBar != v5)
  {
    [(STUIStatusBar_Wrapper *)statusBar removeFromSuperview];
    objc_storeStrong((id *)&self->_statusBar, a3);
    [(STUIStatusBar_Wrapper *)*p_statusBar frame];
    [(SBStatusBarWindow *)self bounds];
    -[STUIStatusBar_Wrapper setFrame:](*p_statusBar, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(STUIStatusBar_Wrapper *)*p_statusBar setAutoresizingMask:34];
    [(STUIStatusBar_Wrapper *)*p_statusBar setOrientation:self->_orientation];
    [(SBStatusBarWindow *)self addSubview:*p_statusBar];
    double v8 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v10 = [(UIWindow *)self _sbWindowScene];
      char v11 = [v10 isExtendedDisplayWindowScene];

      if ((v11 & 1) == 0)
      {
        double v12 = [[_SBStatusBarWindowRootViewController alloc] initWithWindow:self];
        statusBarWindowRootViewController = self->_statusBarWindowRootViewController;
        self->_statusBarWindowRootViewController = v12;

        [(SBStatusBarWindow *)self setRootViewController:self->_statusBarWindowRootViewController];
      }
    }
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6 = a4;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStatusBar") & 1) == 0)
  {
    if (v6 && (int v7 = [v6 orientationAnimation]) != 0)
    {
      if (self->_orientation != a3)
      {
        self->_orientation = a3;
        if (v7 == 2)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke;
          v15[3] = &unk_1E6AF4AC0;
          v15[4] = self;
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_2;
          v14[3] = &unk_1E6AF5350;
          v14[4] = self;
          [MEMORY[0x1E4F42E30] animateWithParameters:v6 fromCurrentState:1 animations:v15 completion:v14];
        }
        else
        {
          [v6 duration];
          double v9 = v8 * 0.5;
          id v10 = (void *)MEMORY[0x1E4F42FF0];
          [v6 delay];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_3;
          v13[3] = &unk_1E6AF4AC0;
          v13[4] = self;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_4;
          v12[3] = &unk_1E6AFF1A8;
          v12[4] = self;
          *(double *)&v12[5] = v9;
          [v10 animateWithDuration:0x10000 delay:v13 options:v12 animations:v9 completion:v11];
        }
      }
    }
    else
    {
      self->_orientation = a3;
      [(SBStatusBarWindow *)self _rotate];
    }
  }
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 904) _statusBarWillAnimateRotation];
  v2 = *(void **)(a1 + 32);
  return [v2 _rotate];
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) _statusBarDidAnimateRotation];
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) setAlpha:0.0];
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _rotate];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 904) isHidden];
  if ((result & 1) == 0)
  {
    double v3 = *(double *)(a1 + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_5;
    v4[3] = &unk_1E6AF4AC0;
    v4[4] = *(void *)(a1 + 32);
    return [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v4 options:0 animations:v3 completion:0.0];
  }
  return result;
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) setAlpha:1.0];
}

- (void)_setStatusBarWindowOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_rotate
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStatusBar") & 1) == 0)
  {
    [(STUIStatusBar_Wrapper *)self->_statusBar setOrientation:self->_orientation];
    int64_t orientation = self->_orientation;
    [(SBStatusBarWindow *)self _legacySetRotatableViewOrientation:orientation updateStatusBar:0 duration:1 force:0.0];
  }
}

- (CGRect)_statusBarWindowFrame
{
  [(SBStatusBarWindow *)self _statusBarWindowBoundsForOrientation:self->_orientation];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_statusBarWindowBoundsForOrientation:(int64_t)a3
{
  double v3 = [(SBStatusBarWindow *)self windowScene];
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 _FBSScene];
    id v6 = [v5 settings];
    [v6 frame];
  }
  else
  {
    [(id)objc_opt_class() _defaultStatusBarSceneReferenceBounds];
  }
  _UIWindowConvertRectFromOrientationToOrientation();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_isStatusBarWindow
{
  return 1;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  return 1;
}

- (BOOL)_shouldForceTraitPropagationThroughHierarchy
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (STUIStatusBar_Wrapper)statusBar
{
  return self->_statusBar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWindowRootViewController, 0);
}

@end