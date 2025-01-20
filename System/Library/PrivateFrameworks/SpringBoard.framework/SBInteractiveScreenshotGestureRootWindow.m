@interface SBInteractiveScreenshotGestureRootWindow
+ (BOOL)_isSecure;
- (BOOL)_appearsInLoupe;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_shouldPrepareScreenForWindow;
- (BOOL)_usesWindowServerHitTesting;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBInteractiveScreenshotGestureRootWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureRootWindow;
  -[SBInteractiveScreenshotGestureRootWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBInteractiveScreenshotGestureRootWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  if (self == a5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SBInteractiveScreenshotGestureRootWindow;
    v7 = -[SBInteractiveScreenshotGestureRootWindow _hitTest:withEvent:windowServerHitTestWindow:](&v9, sel__hitTest_withEvent_windowServerHitTestWindow_, a4, self, a3.x, a3.y);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end