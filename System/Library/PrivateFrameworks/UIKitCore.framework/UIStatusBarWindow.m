@interface UIStatusBarWindow
+ (BOOL)_isSystemWindow;
+ (CGRect)_convertRect:(CGRect)a3 fromSceneReferenceSpaceToSceneSpaceWithOrientation:(int64_t)a4;
+ (CGRect)_defaultStatusBarSceneReferenceBounds;
+ (CGRect)_defaultStatusBarSceneReferenceBoundsForOrientation:(int64_t)a3;
+ (CGRect)statusBarWindowFrame;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_isStatusBarWindow;
- (BOOL)_shouldAdjustSizeClassesAndResizeWindow;
- (BOOL)_shouldForceTraitPropagationThroughHierarchy;
- (CGRect)_defaultStatusBarSceneBoundsForOrientation:(int64_t)a3;
- (CGRect)_statusBarFrameForOrientation:(int64_t)a3;
- (CGRect)statusBarWindowFrame;
- (UIEdgeInsets)safeAreaInsets;
- (UIStatusBarWindow)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)orientation;
- (void)_didMoveFromScene:(id)a3 toScene:(id)a4;
- (void)_rotate;
- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4;
- (void)setStatusBar:(id)a3;
@end

@implementation UIStatusBarWindow

+ (CGRect)_defaultStatusBarSceneReferenceBounds
{
  v2 = +[UIScreen mainScreen];
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

+ (CGRect)_convertRect:(CGRect)a3 fromSceneReferenceSpaceToSceneSpaceWithOrientation:(int64_t)a4
{
  double v4 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)_defaultStatusBarSceneReferenceBoundsForOrientation:(int64_t)a3
{
  [a1 _defaultStatusBarSceneReferenceBounds];
  objc_msgSend(a1, "_convertRect:fromSceneReferenceSpaceToSceneSpaceWithOrientation:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)statusBarWindowFrame
{
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"UIStatusBarWindow.m" lineNumber:59 description:@"Deprecated SPI only supported for SpringBoard"];
  }
  double v4 = [(id)UIApp statusBarWindow];
  if (!v4)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"UIStatusBarWindow.m" lineNumber:64 description:@"+[UIApp statusBarWindow] should have created a window"];
  }
  double v5 = [v4 windowScene];
  objc_msgSend(a1, "_defaultStatusBarSceneReferenceBoundsForOrientation:", objc_msgSend(v5, "interfaceOrientation"));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_defaultStatusBarSceneBoundsForOrientation:(int64_t)a3
{
  double v5 = objc_opt_class();
  [(UIWindow *)self _sceneReferenceBounds];
  objc_msgSend(v5, "_convertRect:fromSceneReferenceSpaceToSceneSpaceWithOrientation:", a3);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)statusBarWindowFrame
{
  [(UIStatusBarWindow *)self _defaultStatusBarSceneBoundsForOrientation:self->_orientation];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIStatusBarWindow)initWithFrame:(CGRect)a3
{
  unint64_t viewOrientation = self->super._viewOrientation;
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarWindow;
  double v4 = -[UIWindow initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4)
  {
    if (viewOrientation <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = viewOrientation;
    }
    v4->_orientation = v6;
    -[UIStatusBarWindow _defaultStatusBarSceneBoundsForOrientation:](v4, "_defaultStatusBarSceneBoundsForOrientation:");
    -[UIWindow setFrame:](v5, "setFrame:");
    [(UIView *)v5 setOpaque:0];
  }
  return v5;
}

- (void)setStatusBar:(id)a3
{
  double v5 = (UIStatusBar *)a3;
  p_statusBar = &self->_statusBar;
  statusBar = self->_statusBar;
  if (statusBar != v5)
  {
    objc_super v8 = v5;
    [(UIView *)statusBar removeFromSuperview];
    objc_storeStrong((id *)&self->_statusBar, a3);
    [(UIView *)*p_statusBar frame];
    [(UIView *)self bounds];
    -[UIView setFrame:](*p_statusBar, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(UIView *)*p_statusBar setAutoresizingMask:34];
    [(UIView *)self addSubview:*p_statusBar];
    double v5 = v8;
  }
}

- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (v6 && (int v8 = [v6 orientationAnimation]) != 0)
  {
    if (self->_orientation != a3)
    {
      self->_orientation = a3;
      if (v8 == 2)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke;
        v15[3] = &unk_1E52D9F70;
        v15[4] = self;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_2;
        v14[3] = &unk_1E52DC3A0;
        v14[4] = self;
        +[UIStatusBarAnimationParameters animateWithParameters:v7 fromCurrentState:1 animations:v15 completion:v14];
      }
      else
      {
        [v7 duration];
        double v10 = v9 * 0.5;
        [v7 delay];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_3;
        v13[3] = &unk_1E52D9F70;
        v13[4] = self;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_4;
        v12[3] = &unk_1E52E0000;
        v12[4] = self;
        *(double *)&v12[5] = v10;
        +[UIView animateWithDuration:0x10000 delay:v13 options:v12 animations:v10 completion:v11];
      }
    }
  }
  else
  {
    self->_orientation = a3;
    [(UIStatusBarWindow *)self _rotate];
  }
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 896) _statusBarWillAnimateRotation];
  double v2 = *(void **)(a1 + 32);
  return [v2 _rotate];
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 896) _statusBarDidAnimateRotation];
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 896) setAlpha:0.0];
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _rotate];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 896) isHidden];
  if ((result & 1) == 0)
  {
    double v3 = *(double *)(a1 + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_5;
    v4[3] = &unk_1E52D9F70;
    v4[4] = *(void *)(a1 + 32);
    return +[UIView animateWithDuration:0x20000 delay:v4 options:0 animations:v3 completion:0.0];
  }
  return result;
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 896) setAlpha:1.0];
}

- (CGRect)_statusBarFrameForOrientation:(int64_t)a3
{
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(UIView *)self->_statusBar frame];
  double Height = CGRectGetHeight(v14);
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = Height;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_rotate
{
  [(UIStatusBar *)self->_statusBar setOrientation:self->_orientation];
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    int64_t orientation = self->_orientation;
    [(UIWindow *)self _rotateWindowToOrientation:orientation updateStatusBar:0 duration:0 skipCallbacks:0.0];
  }
  else
  {
    memset(&v7, 0, sizeof(v7));
    int64_t v4 = self->_orientation;
    switch(v4)
    {
      case 1:
        double v5 = 0.0;
        break;
      case 3:
        double v5 = 1.57079633;
        break;
      case 4:
        double v5 = -1.57079633;
        break;
      default:
        double v5 = 3.14159265;
        if (v4 != 2) {
          double v5 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v7, v5);
    *(float64x2_t *)&v7.a = vrndaq_f64(*(float64x2_t *)&v7.a);
    *(float64x2_t *)&v7.c = vrndaq_f64(*(float64x2_t *)&v7.c);
    *(float64x2_t *)&v7.tx = vrndaq_f64(*(float64x2_t *)&v7.tx);
    CGAffineTransform v6 = v7;
    [(UIView *)self setTransform:&v6];
    [(UIStatusBarWindow *)self statusBarWindowFrame];
    -[UIWindow setFrame:](self, "setFrame:");
  }
}

- (UIEdgeInsets)safeAreaInsets
{
  char v3 = dyld_program_sdk_at_least();
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if ((v3 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIStatusBarWindow;
    [(UIWindow *)&v8 safeAreaInsets];
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarWindow;
  id v7 = a4;
  [(UIWindow *)&v12 _didMoveFromScene:v6 toScene:v7];
  objc_msgSend((id)UIApp, "_statusBarWindow:didMoveFromScene:toScene:", self, v6, v7, v12.receiver, v12.super_class);
  objc_super v8 = (void *)UIApp;
  uint64_t v9 = [v7 _interfaceOrientation];

  if (v6) {
    uint64_t v10 = [v6 _interfaceOrientation];
  }
  else {
    uint64_t v10 = 0;
  }
  double v11 = [(UIWindow *)self windowScene];
  [v8 setStatusBarOrientation:v9 fromOrientation:v10 windowScene:v11 animationParameters:0 updateBlock:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UIStatusBarWindow *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
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

- (void).cxx_destruct
{
}

@end