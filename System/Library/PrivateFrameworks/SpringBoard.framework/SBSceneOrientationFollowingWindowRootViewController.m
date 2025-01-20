@interface SBSceneOrientationFollowingWindowRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (SBIsolatedSceneOrientationFollowingWrapperViewController)hostingViewController;
- (SBSceneOrientationFollowingWindowRootViewController)initWithHostingViewController:(id)a3;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIView)overlayContentView;
- (unint64_t)supportedInterfaceOrientations;
- (void)setHostingViewController:(id)a3;
- (void)setOverlayContentView:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBSceneOrientationFollowingWindowRootViewController

- (SBSceneOrientationFollowingWindowRootViewController)initWithHostingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSceneOrientationFollowingWindowRootViewController;
  v5 = [(SBSceneOrientationFollowingWindowRootViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostingViewController, v4);
  }

  return v6;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setOverlayContentView:(id)a3
{
  v5 = (UIView *)a3;
  overlayContentView = self->_overlayContentView;
  objc_super v8 = v5;
  if (overlayContentView != v5)
  {
    [(UIView *)overlayContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayContentView, a3);
    if (self->_overlayContentView)
    {
      v7 = [(SBSceneOrientationFollowingWindowRootViewController *)self view];
      [v7 addSubview:v8];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  v3 = [WeakRetained orientationDelegate];
  unint64_t v4 = [v3 supportedInterfaceOrientations];

  return v4;
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBSceneOrientationFollowingWindowRootViewController;
  [(SBSceneOrientationFollowingWindowRootViewController *)&v15 viewWillLayoutSubviews];
  v3 = [(SBSceneOrientationFollowingWindowRootViewController *)self view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  [WeakRetained _boundsForOverlayRootView];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [v3 window];
  [v13 center];
  objc_msgSend(v3, "setCenter:");

  objc_msgSend(v3, "setBounds:", v6, v8, v10, v12);
  overlayContentView = self->_overlayContentView;
  [v3 center];
  -[UIView setCenter:](overlayContentView, "setCenter:");
  -[UIView setFrame:](self->_overlayContentView, "setFrame:", v6, v8, v10, v12);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  int v7 = [WeakRetained _isSceneStatusBarHidden];
  double v8 = [WeakRetained _sbWindowScene];
  double v9 = [v8 statusBarManager];

  double v10 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
  double v11 = v10;
  if (v7)
  {
    double v12 = objc_msgSend(v10, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", 0.0);
  }
  else
  {
    v13 = [v9 statusBar];
    [v13 currentHeight];
    double v12 = objc_msgSend(v11, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:");
  }
  uint64_t v14 = [WeakRetained _hostOrientation];
  objc_super v15 = [(SBSceneOrientationFollowingWindowRootViewController *)self traitCollection];
  objc_msgSend(v12, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  if (a4) {
    *a4 = 1;
  }

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (SBIsolatedSceneOrientationFollowingWrapperViewController)hostingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  return (SBIsolatedSceneOrientationFollowingWrapperViewController *)WeakRetained;
}

- (void)setHostingViewController:(id)a3
{
}

- (UIView)overlayContentView
{
  return self->_overlayContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_destroyWeak((id *)&self->_hostingViewController);
}

@end