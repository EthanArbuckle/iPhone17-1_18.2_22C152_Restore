@interface SBOldFloatingDockWindow
+ (BOOL)sb_autorotates;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)isContentHidden;
- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBOldFloatingDockWindow

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
    goto LABEL_10;
  }
  v8 = [(UIWindow *)self _sbWindowScene];
  v9 = [v8 floatingDockController];
  v10 = [(SBOldFloatingDockWindow *)self floatingDockRootViewController];
  if (([v9 isPresentingLibraryInFloatingDockWindow] & 1) != 0
    || [v10 isPresentingFolder])
  {
    v29.receiver = self;
    v29.super_class = (Class)SBOldFloatingDockWindow;
    v11 = -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
LABEL_6:

    goto LABEL_11;
  }
  [v10 presentedProgress];
  if (v12 <= 0.0)
  {
    v11 = 0;
    goto LABEL_6;
  }
  [v10 floatingDockScreenFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v21 = [(SBOldFloatingDockWindow *)self _screen];
  v22 = [v21 fixedCoordinateSpace];
  -[SBOldFloatingDockWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v32.origin.double x = v14;
  v32.origin.double y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  v31.double x = v24;
  v31.double y = v26;
  LODWORD(v21) = CGRectContainsPoint(v32, v31);

  if (v21)
  {
LABEL_9:
    v28.receiver = self;
    v28.super_class = (Class)SBOldFloatingDockWindow;
    v11 = -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
LABEL_10:
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (BOOL)isContentHidden
{
  v3 = [(SBOldFloatingDockWindow *)self floatingDockRootViewController];
  v6.receiver = self;
  v6.super_class = (Class)SBOldFloatingDockWindow;
  if ([(SBFWindow *)&v6 isContentHidden]) {
    LOBYTE(v4) = 1;
  }
  else {
    int v4 = [v3 isFloatingDockPresented] ^ 1;
  }

  return v4;
}

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

@end