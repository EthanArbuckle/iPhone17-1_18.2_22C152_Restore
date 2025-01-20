@interface FloatingControlsOverlay
- (BOOL)automaticallyUpdateCompassInsets;
- (BOOL)isHidden;
- (BOOL)shouldShowSearchOverlay;
- (ChromeOverlayHosting)host;
- (ControlContainerViewController)containerViewController;
- (FloatingControlsOverlayDelegate)delegate;
- (FloatingControlsViewController)floatingControlsViewController;
- (MapViewProviding)mapViewProvider;
- (NSString)blurGroupName;
- (VenuesManager)venuesManager;
- (double)alpha;
- (double)margin;
- (id)view;
- (int64_t)settingsTipState;
- (void)_installInContentView:(id)a3 layoutGuide:(id)a4;
- (void)_setupViewportConstraintsInHost:(id)a3;
- (void)createRadar;
- (void)didUpdateMapInsets;
- (void)enterPedestrianAR:(id)a3;
- (void)exit3dMode;
- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)refreshControls;
- (void)refreshCurrentSearch;
- (void)select3dMode;
- (void)setAlpha:(double)a3;
- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3;
- (void)setBlurGroupName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)setMapViewProvider:(id)a3;
- (void)setMargin:(double)a3;
- (void)setSearchSession:(id)a3;
- (void)setSettingsTipState:(int64_t)a3;
- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)showRedoSearchOverlay:(BOOL)a3;
- (void)toggleSSAO;
- (void)viewControllerCloseSettingsTip:(id)a3;
- (void)viewControllerOpenSettings:(id)a3;
@end

@implementation FloatingControlsOverlay

- (int64_t)settingsTipState
{
  v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  id v3 = [v2 settingsTipState];

  return (int64_t)v3;
}

- (void)setMapViewProvider:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_mapViewProvider);
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id obj = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_mapViewProvider, obj);
      v8 = [(FloatingControlsOverlay *)self floatingControlsViewController];
      [v8 setMapViewProviding:obj];

      unint64_t v6 = (unint64_t)obj;
    }
  }
}

- (void)_setupViewportConstraintsInHost:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 viewportLayoutGuide];
  if (v5)
  {
    unint64_t v6 = [(FloatingControlsOverlay *)self floatingControlsViewController];
    unsigned int v7 = [v6 isViewLoaded];

    if (v7)
    {
      v8 = [v4 overlayContentView];
      uint64_t v9 = sub_1000BBB44(v8);

      if (v9 != 5)
      {
        v10 = [(FloatingControlsOverlay *)self floatingControlsViewController];
        v11 = [v5 trailingAnchor];
        v12 = [v10 buttonsContainerViewController];
        v13 = [v12 view];
        v14 = [v13 leadingAnchor];
        v15 = [v11 constraintLessThanOrEqualToAnchor:v14];
        v17 = v15;
        v16 = +[NSArray arrayWithObjects:&v17 count:1];
        [v4 setViewportConstraints:v16 forOverlay:self];

        [v4 setViewportConstraintsEnabled:1 forOverlay:self];
      }
    }
  }
}

- (void)didUpdateMapInsets
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v2 updateCompassInsets];
}

- (void)setAlpha:(double)a3
{
  id v4 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v4 setAlpha:a3];
}

- (void)_installInContentView:(id)a3 layoutGuide:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  unsigned int v7 = [(FloatingControlsOverlay *)self view];
  id v8 = [v7 superview];

  if (v8 != v28)
  {
    uint64_t v9 = [(FloatingControlsOverlay *)self floatingControlsViewController];
    unsigned int v10 = [v9 isViewLoaded];

    if (v10)
    {
      v11 = [(FloatingControlsOverlay *)self view];
      [v11 removeFromSuperview];
    }
    if (v28)
    {
      v12 = [(FloatingControlsOverlay *)self view];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

      [v28 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(FloatingControlsOverlay *)self view];
      [v21 setFrame:v14, v16, v18, v20];

      v22 = [(FloatingControlsOverlay *)self view];
      [v28 addSubview:v22];

      v23 = [(FloatingControlsOverlay *)self view];
      LODWORD(v24) = 1148846080;
      [v23 _maps_constraintsEqualToEdgesOfLayoutGuide:v6 priority:v24];
      v25 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue();
      edgeConstraints = self->_edgeConstraints;
      self->_edgeConstraints = v25;

      v27 = [(MapsEdgeConstraints *)self->_edgeConstraints allConstraints];
      +[NSLayoutConstraint activateConstraints:v27];
    }
  }
}

- (id)view
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  id v3 = [v2 view];

  return v3;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
  id v4 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v4 setMargin:a3];
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v6 setVisible:!v5 animated:v4];
}

- (void)setBlurGroupName:(id)a3
{
  id v4 = a3;
  id v5 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v5 setBlurGroupName:v4];
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((a3 & 0x40) != 0)
  {
    unsigned int v7 = [(FloatingControlsOverlay *)self venuesManager];
    id v8 = [(FloatingControlsOverlay *)self floatingControlsViewController];
    [v7 addChangeObserver:v8];

    uint64_t v9 = [(FloatingControlsOverlay *)self floatingControlsViewController];
    unsigned int v10 = [(FloatingControlsOverlay *)self venuesManager];
    v11 = [v10 venueWithFocus];
    [v9 didChangeFocusedVenue:v11];
  }
  id v12 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v12 showControlsIfNeeded:a3 animated:v4];
}

- (FloatingControlsViewController)floatingControlsViewController
{
  return self->_floatingControlsViewController;
}

- (VenuesManager)venuesManager
{
  id v3 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 venuesManagerForFloatingControlsOverlay:self];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (VenuesManager *)v4;
}

- (FloatingControlsOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FloatingControlsOverlayDelegate *)WeakRetained;
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((a3 & 0x40) != 0)
  {
    unsigned int v7 = [(FloatingControlsOverlay *)self venuesManager];
    id v8 = [(FloatingControlsOverlay *)self floatingControlsViewController];
    [v7 removeChangeObserver:v8];
  }
  id v9 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v9 hideControlsIfNeeded:a3 animated:v4];
}

- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v4 setAutomaticallyUpdateCompassInsets:v3];
}

- (BOOL)isHidden
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  char v3 = [v2 visible] ^ 1;

  return v3;
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    floatingControlsViewController = self->_floatingControlsViewController;
    if (floatingControlsViewController)
    {
      unsigned int v7 = [(FloatingControlsViewController *)floatingControlsViewController parentViewController];

      if (v7)
      {
        [(FloatingControlsViewController *)self->_floatingControlsViewController willMoveToParentViewController:0];
        if ([(FloatingControlsViewController *)self->_floatingControlsViewController isViewLoaded])
        {
          id v8 = [(FloatingControlsViewController *)self->_floatingControlsViewController view];
          [v8 removeFromSuperview];
        }
        [(FloatingControlsViewController *)self->_floatingControlsViewController removeFromParentViewController];
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    id v5 = obj;
    if (obj)
    {
      if (!self->_floatingControlsViewController)
      {
        id v9 = (objc_class *)objc_opt_class();
        unsigned int v10 = [obj overlayContentView];
        uint64_t v11 = sub_1000BBB44(v10);

        if (v11 == 5) {
          id v9 = (objc_class *)objc_opt_class();
        }
        id v12 = (FloatingControlsViewController *)objc_alloc_init(v9);
        double v13 = self->_floatingControlsViewController;
        self->_floatingControlsViewController = v12;

        [(FloatingControlsViewController *)self->_floatingControlsViewController setActionCoordinator:self];
        [(FloatingControlsOverlay *)self margin];
        -[FloatingControlsViewController setMargin:](self->_floatingControlsViewController, "setMargin:");
        double v14 = [(FloatingControlsOverlay *)self mapViewProvider];
        [(FloatingControlsViewController *)self->_floatingControlsViewController setMapViewProviding:v14];

        if (v11 == 5) {
          [(FloatingControlsViewController *)self->_floatingControlsViewController showControlsIfNeeded:76 animated:0];
        }
      }
      double v15 = [obj containingViewController];
      [(FloatingControlsViewController *)self->_floatingControlsViewController willMoveToParentViewController:v15];
      double v16 = [obj overlayContentView];
      double v17 = [obj layoutGuideForOverlay:self];
      [(FloatingControlsOverlay *)self _installInContentView:v16 layoutGuide:v17];

      [(FloatingControlsOverlay *)self _setupViewportConstraintsInHost:obj];
      [(PassThroughViewController *)self->_floatingControlsViewController didMoveToParentViewController:v15];

      id v5 = obj;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (double)margin
{
  return self->_margin;
}

- (MapViewProviding)mapViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProvider);

  return (MapViewProviding *)WeakRetained;
}

- (double)alpha
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  char v3 = [v2 view];
  [v3 alpha];
  double v5 = v4;

  return v5;
}

- (NSString)blurGroupName
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  char v3 = [v2 blurGroupName];

  return (NSString *)v3;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)refreshControls
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v2 refreshControls];
}

- (void)setSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v5 setSearchSession:v4];
}

- (void)setSettingsTipState:(int64_t)a3
{
  id v4 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  [v4 setSettingsTipState:a3];
}

- (BOOL)automaticallyUpdateCompassInsets
{
  id v2 = [(FloatingControlsOverlay *)self floatingControlsViewController];
  unsigned __int8 v3 = [v2 automaticallyUpdateCompassInsets];

  return v3;
}

- (void)select3dMode
{
  id v3 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 floatingControlsOverlayDidTapEnter3DMode:self];
  }
}

- (void)exit3dMode
{
  id v3 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 floatingControlsOverlayDidTapExit3DMode:self];
  }
}

- (void)viewControllerOpenSettings:(id)a3
{
  id v4 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 floatingControlsOverlayDidTapOpenSettings:self];
  }
}

- (void)refreshCurrentSearch
{
  id v3 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 floatingControlsOverlayDidTapRefreshCurrentSearch:self];
  }
}

- (BOOL)shouldShowSearchOverlay
{
  id v2 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 shouldShowSearchOverlay];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)showRedoSearchOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 showRedoSearchOverlay:v3];
  }
}

- (void)enterPedestrianAR:(id)a3
{
  id v5 = a3;
  id v4 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 floatingControlsOverlay:self didTapEnterPedestrianARFromButton:v5];
    +[GEOAPPortal captureUserAction:126 target:302 value:0];
  }
}

- (void)createRadar
{
  id v3 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 floatingControlsOverlayDidTapTTRButton:self];
  }
}

- (void)toggleSSAO
{
  GEOConfigGetBOOL();

  GEOConfigSetBOOL();
}

- (void)viewControllerCloseSettingsTip:(id)a3
{
  id v4 = [(FloatingControlsOverlay *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 floatingControlsOverlayDidTapCloseSettingsTip:self];
  }
}

- (ControlContainerViewController)containerViewController
{
  return 0;
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingControlsViewController, 0);
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);

  objc_storeStrong((id *)&self->_edgeConstraints, 0);
}

@end