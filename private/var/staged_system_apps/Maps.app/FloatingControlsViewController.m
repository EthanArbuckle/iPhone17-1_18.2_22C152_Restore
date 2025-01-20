@interface FloatingControlsViewController
- (BOOL)automaticallyUpdateCompassInsets;
- (BOOL)hasReceivedLocationUpdate;
- (BOOL)shouldHide:(int64_t)a3 withControlOptions:(int64_t)a4;
- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4;
- (BOOL)visible;
- (CGRect)floatingButtonsFrame;
- (CGRect)lookAroundButtonFrame;
- (FloatingControlsViewControllerActionCoordination)actionCoordinator;
- (FloatingControlsViewControllerOpenSettingsDelegate)openSettingsDelegate;
- (MKMapView)mapView;
- (MapViewProviding)mapViewProviding;
- (NSLayoutXAxisAnchor)floatingButtonLeadingGuide;
- (NSString)blurGroupName;
- (WeatherLocationDataProvider)weatherLocationDataProvider;
- (WeatherMapPanningCoordinator)weatherMapPanningCoordinator;
- (double)alpha;
- (double)compassDiameter;
- (double)margin;
- (id)controlsStackViewIfLoaded;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)_sanitizedControlsFromControls:(int64_t)a3;
- (int64_t)settingsTipState;
- (int64_t)visibleControls;
- (void)_addSubview:(id)a3 withConstraints:(id)a4;
- (void)_updateAlphaAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setActionCoordinator:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3;
- (void)setBlurGroupName:(id)a3;
- (void)setHasReceivedLocationUpdate:(BOOL)a3;
- (void)setMapViewProviding:(id)a3;
- (void)setMargin:(double)a3;
- (void)setOpenSettingsDelegate:(id)a3;
- (void)setSettingsTipState:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setVisibleControls:(int64_t)a3;
- (void)setWeatherLocationDataProvider:(id)a3;
- (void)setWeatherMapPanningCoordinator:(id)a3;
- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)updateCompassInsets;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FloatingControlsViewController

- (double)compassDiameter
{
  v2 = [(FloatingControlsViewController *)self mapView];
  [v2 _compassDiameter];
  double v4 = v3;

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FloatingControlsViewController;
  [(FloatingControlsViewController *)&v6 viewDidLoad];
  double v3 = [(FloatingControlsViewController *)self view];
  double v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  self->_visible = 1;
  self->_isConfigured = 0;
  self->_alpha = 1.0;
  v5 = [(FloatingControlsViewController *)self view];
  [v5 _setHostsLayoutEngine:1];

  [(FloatingControlsViewController *)self setVisibleControls:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FloatingControlsViewController;
  [(FloatingControlsViewController *)&v13 viewWillAppear:a3];
  if (!self->_isConfigured)
  {
    self->_isConfigured = 1;
    [(MapsThemeViewController *)self updateTheme];
  }
  double v4 = [(FloatingControlsViewController *)self mapView];
  v5 = (char *)[v4 mapType];
  BOOL v6 = 0;
  if ((unint64_t)(v5 - 1) >= 4 && v5 != (char *)107)
  {
    v7 = [(FloatingControlsViewController *)self traitCollection];
    BOOL v6 = [v7 userInterfaceStyle] != (id)2;
  }
  v8 = [(FloatingControlsViewController *)self mapView];
  [v8 _setCompassViewSize:1 style:v6];

  v9 = [(FloatingControlsViewController *)self view];
  id v10 = [v9 effectiveUserInterfaceLayoutDirection];

  if (v10 == (id)1) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = 4;
  }
  v12 = [(FloatingControlsViewController *)self mapView];
  [v12 setAttributionCorner:v11];
}

- (FloatingControlsViewControllerActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (FloatingControlsViewControllerActionCoordination *)WeakRetained;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FloatingControlsViewController;
  [(FloatingControlsViewController *)&v3 viewDidLayoutSubviews];
  [(FloatingControlsViewController *)self updateCompassInsets];
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  [(FloatingControlsViewController *)self _updateAlphaAnimated:0 completion:0];
}

- (void)_updateAlphaAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (self->_visible)
    {
      v7 = [(FloatingControlsViewController *)self view];
      [v7 setHidden:0];

      v8 = [(FloatingControlsViewController *)self view];
      [v8 setAlpha:0.0];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006BC154;
    v11[3] = &unk_1012E5D08;
    v11[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v11 completion:v6];
  }
  else
  {
    if (self->_visible) {
      double alpha = self->_alpha;
    }
    else {
      double alpha = 0.0;
    }
    id v10 = [(FloatingControlsViewController *)self view];
    [v10 setAlpha:alpha];

    [(FloatingControlsViewController *)self updateCompassInsets];
  }
}

- (void)setVisibleControls:(int64_t)a3
{
  self->_visibleControls = a3;
}

- (BOOL)shouldHide:(int64_t)a3 withControlOptions:(int64_t)a4
{
  return ([(FloatingControlsViewController *)self visibleControls] & a3) != 0 && (a4 & a3) != 0;
}

- (int64_t)visibleControls
{
  return self->_visibleControls;
}

- (int64_t)_sanitizedControlsFromControls:(int64_t)a3
{
  return a3;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    [(FloatingControlsViewController *)self _updateAlphaAnimated:a4 completion:a5];
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (void)setBlurGroupName:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;
}

- (void)updateCompassInsets
{
  if (![(FloatingControlsViewController *)self automaticallyUpdateCompassInsets]) {
    return;
  }
  id v31 = [(FloatingControlsViewController *)self controlsStackViewIfLoaded];
  if (!v31 || !self->_visible)
  {
    v15 = [(FloatingControlsViewController *)self view];
    v17 = [v15 window];
    [v17 safeAreaInsets];
    double v13 = v18;

    goto LABEL_8;
  }
  objc_super v3 = [(FloatingControlsViewController *)self mapView];
  [v31 bounds];
  [v3 convertRect:v31];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  double MaxY = CGRectGetMaxY(v33);
  double v13 = 0.0;
  if (MaxY > 0.0)
  {
    double v14 = MaxY + sub_1000BBAF8();
    v15 = [(FloatingControlsViewController *)self mapView];
    [v15 _edgeInsets];
    double v13 = v14 - v16;
LABEL_8:
  }
  v19 = [(FloatingControlsViewController *)self mapView];
  [v19 _compassInsets];
  double v21 = v20;
  double v23 = v22;

  v24 = [(FloatingControlsViewController *)self mapView];
  [v24 _compassInsets];
  if (v21 != v28 || v13 != v25 || v23 != v27)
  {

LABEL_15:
    v30 = [(FloatingControlsViewController *)self mapView];
    [v30 _setCompassInsets:v13, v21, 0.0, v23];

    goto LABEL_16;
  }
  double v29 = v26;

  if (v29 != 0.0) {
    goto LABEL_15;
  }
LABEL_16:
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProviding);
  objc_super v3 = [WeakRetained mapView];

  return (MKMapView *)v3;
}

- (BOOL)automaticallyUpdateCompassInsets
{
  return self->_automaticallyUpdateCompassInsets;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
}

- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3
{
  if (self->_automaticallyUpdateCompassInsets != a3)
  {
    self->_automaticallyUpdateCompassInsets = a3;
    [(FloatingControlsViewController *)self updateCompassInsets];
  }
}

- (BOOL)visible
{
  return self->_visible;
}

- (int64_t)settingsTipState
{
  return self->_settingsTipState;
}

- (void)setMapViewProviding:(id)a3
{
}

- (void)setActionCoordinator:(id)a3
{
}

- (double)margin
{
  return self->_margin;
}

- (id)controlsStackViewIfLoaded
{
  return 0;
}

- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4
{
  return ((a4 | [(FloatingControlsViewController *)self visibleControls]) & a3) != 0;
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v5 = [(FloatingControlsViewController *)self visibleControls];

  [(FloatingControlsViewController *)self setVisibleControls:v5];
}

- (void)_addSubview:(id)a3 withConstraints:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGFloat v7 = [(FloatingControlsViewController *)self view];
  [v7 addSubview:v6];

  +[NSLayoutConstraint activateConstraints:v8];
}

- (void)setVisible:(BOOL)a3
{
}

- (int)currentUITargetForAnalytics
{
  objc_super v3 = [(FloatingControlsViewController *)self actionCoordinator];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(FloatingControlsViewController *)self actionCoordinator];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentUITargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  objc_super v3 = [(FloatingControlsViewController *)self actionCoordinator];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(FloatingControlsViewController *)self actionCoordinator];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (void)setSettingsTipState:(int64_t)a3
{
  self->_settingsTipState = a3;
}

- (MapViewProviding)mapViewProviding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProviding);

  return (MapViewProviding *)WeakRetained;
}

- (double)alpha
{
  return self->_alpha;
}

- (NSLayoutXAxisAnchor)floatingButtonLeadingGuide
{
  return self->_floatingButtonLeadingGuide;
}

- (CGRect)floatingButtonsFrame
{
  double x = self->_floatingButtonsFrame.origin.x;
  double y = self->_floatingButtonsFrame.origin.y;
  double width = self->_floatingButtonsFrame.size.width;
  double height = self->_floatingButtonsFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lookAroundButtonFrame
{
  double x = self->_lookAroundButtonFrame.origin.x;
  double y = self->_lookAroundButtonFrame.origin.y;
  double width = self->_lookAroundButtonFrame.size.width;
  double height = self->_lookAroundButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (FloatingControlsViewControllerOpenSettingsDelegate)openSettingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openSettingsDelegate);

  return (FloatingControlsViewControllerOpenSettingsDelegate *)WeakRetained;
}

- (void)setOpenSettingsDelegate:(id)a3
{
}

- (BOOL)hasReceivedLocationUpdate
{
  return self->_hasReceivedLocationUpdate;
}

- (void)setHasReceivedLocationUpdate:(BOOL)a3
{
  self->_hasReceivedLocationUpdate = a3;
}

- (WeatherLocationDataProvider)weatherLocationDataProvider
{
  return self->_weatherLocationDataProvider;
}

- (void)setWeatherLocationDataProvider:(id)a3
{
}

- (WeatherMapPanningCoordinator)weatherMapPanningCoordinator
{
  return self->_weatherMapPanningCoordinator;
}

- (void)setWeatherMapPanningCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherMapPanningCoordinator, 0);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);
  objc_destroyWeak((id *)&self->_openSettingsDelegate);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_floatingButtonLeadingGuide, 0);
  objc_destroyWeak((id *)&self->_mapViewProviding);

  objc_destroyWeak((id *)&self->_actionCoordinator);
}

@end