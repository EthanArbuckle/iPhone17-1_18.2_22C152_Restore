@interface SBFloatingDockWindow
+ (BOOL)sb_autorotates;
+ (id)_traitsArbiterOrientationActuationRole;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)isContentHidden;
- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBFloatingDockWindow

+ (BOOL)sb_autorotates
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] != 9) {
    goto LABEL_9;
  }
  if (![v7 _isTouchRoutingPolicyBased]) {
    goto LABEL_13;
  }
  v8 = [(UIWindow *)self _sbWindowScene];
  v9 = [(SBFloatingDockWindow *)v8 floatingDockController];
  v10 = [(SBFloatingDockWindow *)self floatingDockRootViewController];
  if (([v9 isPresentingLibraryInFloatingDockWindow] & 1) != 0
    || [v10 isPresentingFolder])
  {
    v31.receiver = self;
    v31.super_class = (Class)SBFloatingDockWindow;
    uint64_t v11 = -[SBFloatingDockWindow hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
LABEL_6:

LABEL_12:
    v8 = (SBFloatingDockWindow *)v11;
    goto LABEL_14;
  }
  [v10 presentedProgress];
  if (v12 <= 0.0)
  {
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  [v10 floatingDockScreenFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v21 = [(SBFloatingDockWindow *)self _screen];
  v22 = [v21 fixedCoordinateSpace];
  -[SBFloatingDockWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v34.origin.double x = v14;
  v34.origin.double y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  v33.double x = v24;
  v33.double y = v26;
  LODWORD(v21) = CGRectContainsPoint(v34, v33);

  if (v21)
  {
LABEL_9:
    v30.receiver = self;
    v30.super_class = (Class)SBFloatingDockWindow;
    -[SBFloatingDockWindow hitTest:withEvent:](&v30, sel_hitTest_withEvent_, v7, x, y);
    v8 = (SBFloatingDockWindow *)objc_claimAutoreleasedReturnValue();
    if (v8 == self
      || ([(SBFloatingDockWindow *)self rootViewController],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v27 view],
          v28 = (SBFloatingDockWindow *)objc_claimAutoreleasedReturnValue(),
          v28,
          v27,
          v8 == v28))
    {
      uint64_t v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
LABEL_13:
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (BOOL)isContentHidden
{
  v3 = [(SBFloatingDockWindow *)self floatingDockRootViewController];
  v4 = [(UIWindow *)self _sbWindowScene];
  v5 = [v4 floatingDockController];
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockWindow;
  if ([(SBFWindow *)&v8 isContentHidden])
  {
    LOBYTE(v6) = 1;
  }
  else if ([v3 isFloatingDockPresented] & 1) != 0 || (objc_msgSend(v3, "isPresentingFolder"))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v6 = [v5 isPresentingLibraryInFloatingDockWindow] ^ 1;
  }

  return v6;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return @"SBTraitsParticipantRoleFloatingDock";
}

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

@end