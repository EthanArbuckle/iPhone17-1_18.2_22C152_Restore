@interface _UISystemGestureWindow
+ (BOOL)_isSecure;
- (BOOL)_appearsInLoupe;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_isSystemGestureWindow;
- (BOOL)_shouldPrepareScreenForWindow;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)canBecomeKeyWindow;
- (_UISystemGestureWindow)initWithDisplay:(id)a3;
- (_UISystemGestureWindow)initWithDisplayConfiguration:(id)a3;
- (_UISystemGestureWindow)initWithScreen:(id)a3;
- (id)_systemGestureView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UISystemGestureWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UISystemGestureWindow;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISystemGestureWindow *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics() && hitTest_withEvent__onceToken != -1) {
    dispatch_once(&hitTest_withEvent__onceToken, &__block_literal_global_264);
  }
  if (_UIApplicationProcessIsSpringBoard() && !v5)
  {
    [(_UIRootWindow *)self _additionalRootLayerAffineTransform];
    if (CGAffineTransformIsIdentity(&v9))
    {
      v5 = 0;
    }
    else
    {
      v5 = [(_UISystemGestureWindow *)self _systemGestureView];
    }
  }
  if (v5 == self) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)_systemGestureView
{
  return self->_systemGestureView;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_isSystemGestureWindow
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (_UISystemGestureWindow)initWithDisplay:(id)a3
{
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"_UISystemGestureWindow.m" lineNumber:72 description:@"you can't call this"];

  return [(_UISystemGestureWindow *)self initWithDisplayConfiguration:a3];
}

- (_UISystemGestureWindow)initWithScreen:(id)a3
{
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"_UISystemGestureWindow.m" lineNumber:77 description:@"you can't call this"];

  v7 = [a3 displayConfiguration];
  v8 = [(_UISystemGestureWindow *)self initWithDisplayConfiguration:v7];

  return v8;
}

- (_UISystemGestureWindow)initWithDisplayConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UISystemGestureWindow;
  v3 = [(_UIRootWindow *)&v9 initWithDisplay:a3];
  v4 = v3;
  if (v3)
  {
    [(_UIRootWindow *)v3 setHidden:0];
    [(UIWindow *)v4 setLevel:0.0];
    v5 = [UISystemGestureView alloc];
    [(UIView *)v4 bounds];
    uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    systemGestureView = v4->_systemGestureView;
    v4->_systemGestureView = (UISystemGestureView *)v6;

    [(UIView *)v4->_systemGestureView setAutoresizingMask:18];
    [(UIView *)v4->_systemGestureView setMultipleTouchEnabled:1];
    [(UIView *)v4 addSubview:v4->_systemGestureView];
  }
  return v4;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (void).cxx_destruct
{
}

@end