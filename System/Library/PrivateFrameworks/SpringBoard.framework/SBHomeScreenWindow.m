@interface SBHomeScreenWindow
+ (BOOL)sb_autorotates;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)isContentHidden;
- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets;
- (SBHomeScreenWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7;
- (id)autorotationPreventionReasons;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)homeScreenViewController;
@end

@implementation SBHomeScreenWindow

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

- (BOOL)isContentHidden
{
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenWindow;
  if (![(SBFWindow *)&v6 isContentHidden]) {
    return 0;
  }
  v3 = [(SBHomeScreenWindow *)self homeScreenViewController];
  char v4 = [v3 isIconContentHidden];

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] != 9) {
    goto LABEL_9;
  }
  v8 = [(SBHomeScreenWindow *)self homeScreenViewController];
  char v9 = [v8 isIconContentHidden];

  if ((v9 & 1) == 0)
  {
    v10 = [(UIWindow *)self _sbWindowScene];
    v11 = [v10 floatingDockController];
    v12 = v11;
    if (!v11) {
      goto LABEL_17;
    }
    [v11 floatingDockScreenFrame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v21 = [(SBHomeScreenWindow *)self _screen];
    v22 = [v21 fixedCoordinateSpace];
    -[SBHomeScreenWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v34.origin.double x = v14;
    v34.origin.double y = v16;
    v34.size.width = v18;
    v34.size.height = v20;
    v33.double x = v24;
    v33.double y = v26;
    if (!CGRectContainsPoint(v34, v33))
    {
LABEL_17:
      if (([v12 isPresentingLibraryInFloatingDockWindow] & 1) == 0
        && ([v12 isPresentingFolder] & 1) == 0)
      {
        v27 = [v10 switcherController];
        uint64_t v28 = [v27 unlockedEnvironmentMode];

        if (v28 == 1)
        {

LABEL_9:
          v31.receiver = self;
          v31.super_class = (Class)SBHomeScreenWindow;
          v29 = -[SBHomeScreenWindow hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
          goto LABEL_12;
        }
      }
    }
  }
  v29 = 0;
LABEL_12:

  return v29;
}

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen") ^ 1;
}

- (SBHomeScreenWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SBHomeScreenWindow.m", 30, @"Invalid parameter not satisfying: %@", @"[rootViewController isKindOfClass:[SBHomeScreenViewController class]]" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)SBHomeScreenWindow;
  CGFloat v18 = [(SBWindow *)&v32 initWithWindowScene:v13 rootViewController:v14 layoutStrategy:v15 role:v16 debugName:v17];
  if (v18)
  {
    double v19 = [v13 screen];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    uint64_t v28 = [v14 view];
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    v29 = [(SBHomeScreenWindow *)v18 layer];
    [v29 setHitTestsAsOpaque:1];
  }
  return v18;
}

- (id)homeScreenViewController
{
  uint64_t v3 = objc_opt_class();
  char v4 = [(SBHomeScreenWindow *)self rootViewController];
  v5 = SBSafeCast(v3, v4);

  return v5;
}

- (id)autorotationPreventionReasons
{
  v2 = [(SBHomeScreenWindow *)self homeScreenViewController];
  uint64_t v3 = [v2 _autorotationPreventionReasons];
  char v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

@end