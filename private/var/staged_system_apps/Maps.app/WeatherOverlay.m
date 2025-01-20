@interface WeatherOverlay
- (BOOL)isHidden;
- (ChromeOverlayHosting)host;
- (MapViewProviding)mapViewProvider;
- (WeatherLocationDataProvider)locationDataProvider;
- (WeatherMapPanningCoordinator)mapPanningCoordinator;
- (WeatherStackViewController)stackViewController;
- (double)alpha;
- (id)mapView;
- (id)view;
- (id)weatherLocationDataProvider;
- (unint64_t)containerStyle;
- (void)_installInContentView:(id)a3;
- (void)_invalidateConstraints;
- (void)_updateConstraintsIfNeeded;
- (void)_updateLayout;
- (void)_updateLocation;
- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setAlpha:(double)a3;
- (void)setContainerStyle:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)setLocationDataProvider:(id)a3;
- (void)setMapPanningCoordinator:(id)a3;
- (void)setMapViewProvider:(id)a3;
- (void)setStackViewController:(id)a3;
- (void)weatherStackViewController:(id)a3 openURL:(id)a4;
@end

@implementation WeatherOverlay

- (BOOL)isHidden
{
  v2 = [(WeatherOverlay *)self stackViewController];
  unsigned __int8 v3 = [v2 overlayHidden];

  return v3;
}

- (id)mapView
{
  v2 = [(WeatherOverlay *)self mapViewProvider];
  unsigned __int8 v3 = [v2 mapView];

  return v3;
}

- (void)setMapViewProvider:(id)a3
{
  id v4 = a3;
  p_mapViewProvider = &self->_mapViewProvider;
  unint64_t v6 = (unint64_t)objc_loadWeakRetained((id *)p_mapViewProvider);
  unint64_t v7 = (unint64_t)v4;
  if (v7 | v6)
  {
    id obj = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)obj;
    if ((v8 & 1) == 0)
    {
      objc_storeWeak((id *)p_mapViewProvider, obj);
      unint64_t v7 = (unint64_t)obj;
    }
  }
}

- (void)_updateLayout
{
  unsigned __int8 v3 = +[UIDevice currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == (id)5;

  if (self->_hasLeadingEdgeLayout != v4)
  {
    self->_hasLeadingEdgeLayout = v4;
    [(WeatherOverlay *)self _invalidateConstraints];
  }

  [(WeatherOverlay *)self _updateConstraintsIfNeeded];
}

- (id)weatherLocationDataProvider
{
  locationDataProvider = self->_locationDataProvider;
  if (!locationDataProvider)
  {
    BOOL v4 = objc_alloc_init(WeatherLocationDataProvider);
    v5 = self->_locationDataProvider;
    self->_locationDataProvider = v4;

    unint64_t v6 = [[WeatherMapPanningCoordinator alloc] initWithWeatherLocationDataProvider:self->_locationDataProvider];
    [(WeatherOverlay *)self setMapPanningCoordinator:v6];

    unint64_t v7 = [(WeatherOverlay *)self mapPanningCoordinator];
    unsigned __int8 v8 = [(WeatherOverlay *)self mapView];
    [v7 handleMapViewRegionDidChange:v8];

    locationDataProvider = self->_locationDataProvider;
  }

  return locationDataProvider;
}

- (void)_installInContentView:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(WeatherOverlay *)self view];
  id v5 = [v4 superview];

  if (v5 != v8)
  {
    unint64_t v6 = [(WeatherOverlay *)self view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    unint64_t v7 = [(WeatherOverlay *)self view];
    [v8 addSubview:v7];

    [(WeatherOverlay *)self _updateLayout];
  }
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != obj)
  {
    stackViewController = self->_stackViewController;
    if (stackViewController)
    {
      unint64_t v6 = [(WeatherStackViewController *)stackViewController parentViewController];

      if (v6)
      {
        [(WeatherStackViewController *)self->_stackViewController willMoveToParentViewController:0];
        if ([(WeatherStackViewController *)self->_stackViewController isViewLoaded])
        {
          unint64_t v7 = [(WeatherStackViewController *)self->_stackViewController view];
          [v7 removeFromSuperview];
        }
        [(WeatherStackViewController *)self->_stackViewController removeFromParentViewController];
        [(WeatherOverlay *)self _invalidateConstraints];
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    if (obj)
    {
      if (!self->_stackViewController)
      {
        id v8 = [WeatherStackViewController alloc];
        v9 = [(WeatherOverlay *)self weatherLocationDataProvider];
        v10 = [(WeatherStackViewController *)v8 initWithWeatherLocationDataProvider:v9 delegate:self];
        v11 = self->_stackViewController;
        self->_stackViewController = v10;
      }
      v12 = [obj containingViewController];
      [(WeatherStackViewController *)self->_stackViewController willMoveToParentViewController:v12];
      [v12 addChildViewController:self->_stackViewController];
      v13 = [obj overlayContentView];
      [(WeatherOverlay *)self _installInContentView:v13];

      [(WeatherStackViewController *)self->_stackViewController didMoveToParentViewController:v12];
    }
    v14 = +[NSNotificationCenter defaultCenter];
    v15 = +[WeatherSettingsManager settingsUpdatedNotification];
    [v14 addObserver:self selector:"_updateLocation" name:v15 object:0];
  }
}

- (void)_updateConstraintsIfNeeded
{
  if (!self->_constraints)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    BOOL v4 = [WeakRetained layoutGuideForOverlay:self];

    if (v4)
    {
      BOOL hasLeadingEdgeLayout = self->_hasLeadingEdgeLayout;
      unint64_t v6 = [(WeatherOverlay *)self view];
      unint64_t v7 = v6;
      if (hasLeadingEdgeLayout)
      {
        id v8 = [v6 leadingAnchor];
        v9 = [v4 leadingAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        v19[0] = v10;
        v11 = [(WeatherOverlay *)self view];
        v12 = [v11 bottomAnchor];
        v13 = [v4 bottomAnchor];
        v14 = [v12 constraintEqualToAnchor:v13];
        v19[1] = v14;
        v15 = v19;
      }
      else
      {
        id v8 = [v6 trailingAnchor];
        v9 = [v4 trailingAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        v18[0] = v10;
        v11 = [(WeatherOverlay *)self view];
        v12 = [v11 bottomAnchor];
        v13 = [v4 bottomAnchor];
        v14 = [v12 constraintEqualToAnchor:v13];
        v18[1] = v14;
        v15 = v18;
      }
      v16 = +[NSArray arrayWithObjects:v15 count:2];
      constraints = self->_constraints;
      self->_constraints = v16;

      +[NSLayoutConstraint activateConstraints:self->_constraints];
    }
  }
}

- (void)setAlpha:(double)a3
{
  id v4 = [(WeatherOverlay *)self stackViewController];
  [v4 setOverlayAlpha:a3];
}

- (id)view
{
  v2 = [(WeatherOverlay *)self stackViewController];
  unsigned __int8 v3 = [v2 view];

  return v3;
}

- (WeatherStackViewController)stackViewController
{
  return self->_stackViewController;
}

- (void)setMapPanningCoordinator:(id)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(WeatherOverlay *)self isHidden])
  {
    if (!v5)
    {
      unint64_t v7 = [(WeatherOverlay *)self locationDataProvider];
      [v7 coordinate];
      double v9 = v8;
      double v11 = v10;

      v12 = [(WeatherOverlay *)self mapPanningCoordinator];
      v13 = [(WeatherOverlay *)self mapView];
      [v12 handleMapViewRegionDidChange:v13];

      v14 = [(WeatherOverlay *)self locationDataProvider];
      [v14 coordinate];
      double v16 = v15;
      double v18 = v17;

      v22.latitude = v9;
      v22.longitude = v11;
      LODWORD(v14) = CLLocationCoordinate2DIsValid(v22);
      v23.latitude = v16;
      v23.longitude = v18;
      if (v14 != CLLocationCoordinate2DIsValid(v23) || v9 != v16 || v11 != v18)
      {
        v19 = [(WeatherOverlay *)self stackViewController];
        [v19 clearSavedLocation];
      }
    }
  }
  id v20 = [(WeatherOverlay *)self stackViewController];
  [v20 setOverlayHidden:v5 animated:v4];
}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    [(WeatherOverlay *)self _updateLayout];
  }
}

- (MapViewProviding)mapViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProvider);

  return (MapViewProviding *)WeakRetained;
}

- (WeatherMapPanningCoordinator)mapPanningCoordinator
{
  return self->_mapPanningCoordinator;
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (void)_invalidateConstraints
{
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;
  }
}

- (void)setHidden:(BOOL)a3
{
}

- (double)alpha
{
  v2 = [(WeatherOverlay *)self stackViewController];
  [v2 overlayAlpha];
  double v4 = v3;

  return v4;
}

- (void)_updateLocation
{
  id v4 = [(WeatherOverlay *)self mapPanningCoordinator];
  double v3 = [(WeatherOverlay *)self mapView];
  [v4 handleMapViewRegionDidChange:v3 forceUpdate:1];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  if (![(WeatherOverlay *)self isHidden]) {
    [(WeatherMapPanningCoordinator *)self->_mapPanningCoordinator handleMapViewRegionDidChange:v5];
  }
}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  if (a4 - 1 < 4 || a4 == 107) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [(WeatherOverlay *)self stackViewController];
  [v5 setOverrideUserInterfaceStyle:v4];
}

- (void)weatherStackViewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [MapsWebLinkPresenter alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  double v8 = [WeakRetained containingViewController];
  double v9 = [(MapsWebLinkPresenter *)v6 initWithPresentingViewController:v8];

  [(MapsWebLinkPresenter *)v9 presentWebURL:v5];
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (void)setStackViewController:(id)a3
{
}

- (WeatherLocationDataProvider)locationDataProvider
{
  return self->_locationDataProvider;
}

- (void)setLocationDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapPanningCoordinator, 0);
  objc_storeStrong((id *)&self->_locationDataProvider, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_host);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end