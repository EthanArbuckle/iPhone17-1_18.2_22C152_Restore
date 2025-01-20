@interface OfflineRegionSelectorOverlay
- (BOOL)isHidden;
- (ChromeOverlayHosting)host;
- (GEOMapRegion)currentMapRegion;
- (MapViewProviding)mapViewProvider;
- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate;
- (OfflineRegionSelectorOverlay)initWithRegion:(id)a3;
- (void)_setInitialMapRegion;
- (void)animateForDownloadWithCompletion:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setMapViewProvider:(id)a3;
- (void)setRegionSelectorDelegate:(id)a3;
@end

@implementation OfflineRegionSelectorOverlay

- (OfflineRegionSelectorOverlay)initWithRegion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OfflineRegionSelectorOverlay;
  v6 = [(OfflineRegionSelectorOverlay *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapRegion, a3);
  }

  return v7;
}

- (void)setRegionSelectorDelegate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id obj = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      id v8 = objc_storeWeak((id *)&self->_regionSelectorDelegate, obj);
      [(OfflineRegionSelectorOverlayView *)self->_overlayView setRegionSelectorDelegate:obj];

      unint64_t v6 = (unint64_t)obj;
    }
  }
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

- (void)_setInitialMapRegion
{
  GEOMapRectForMapRegion();
  double v4 = v3;
  unint64_t v5 = [(OfflineRegionSelectorOverlayView *)self->_overlayView viewportLayoutGuide];
  [v5 layoutFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(OfflineRegionSelectorOverlay *)self mapViewProvider];
  v15 = [v14 mapView];
  [v15 centerCoordinate];
  MKMapPointForCoordinate(v33);
  MKMapRectMakeWithZoomLevel();
  double v17 = v16;

  if (v4 >= v17)
  {
    v22 = [(OfflineRegionSelectorOverlay *)self mapViewProvider];
    v23 = [v22 mapView];
    GEOMapRectForMapRegion();
    [v23 convertMapRect:self->_overlayView];
    double v7 = v24;
    double v9 = v25;
    double v11 = v26;
    double v13 = v27;

    v18 = sub_1000493C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      mapRegion = self->_mapRegion;
      int v29 = 138412290;
      double v30 = *(double *)&mapRegion;
      v19 = "Using map region for initial region selector framing: %@";
      v20 = v18;
      uint32_t v21 = 12;
      goto LABEL_6;
    }
  }
  else
  {
    v18 = sub_1000493C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v29 = 134218240;
      double v30 = v4;
      __int16 v31 = 2048;
      double v32 = v17;
      v19 = "Using viewport frame for initial region selector framing: mapRect width (%f) is below minimum width (%f)";
      v20 = v18;
      uint32_t v21 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v29, v21);
    }
  }

  -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self->_overlayView, "setInitialSelectedRect:animated:", 1, v7, v9, v11, v13);
}

- (void)setMapRegion:(id)a3
{
  id v14 = a3;
  double v4 = [(OfflineRegionSelectorOverlay *)self mapViewProvider];
  unint64_t v5 = [v4 mapView];
  GEOMapRectForMapRegion();
  [v5 convertMapRect:toRectToView:self->_overlayView];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self->_overlayView, "setInitialSelectedRect:animated:", 0, v7, v9, v11, v13);
}

- (GEOMapRegion)currentMapRegion
{
  double v3 = [(OfflineRegionSelectorOverlay *)self mapViewProvider];
  double v4 = [v3 mapView];
  [(OfflineRegionSelectorOverlayView *)self->_overlayView selectedRectFrame];
  [v4 convertRect:self->_overlayView];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v6, v8, v10, v12];

  return (GEOMapRegion *)v13;
}

- (void)animateForDownloadWithCompletion:(id)a3
{
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    overlayView = self->_overlayView;
    if (overlayView) {
      [(OfflineRegionSelectorOverlayView *)overlayView removeFromSuperview];
    }
    objc_storeWeak((id *)&self->_host, obj);
    double v5 = obj;
    if (obj)
    {
      if (!self->_overlayView)
      {
        double v7 = -[OfflineRegionSelectorOverlayView initWithFrame:]([OfflineRegionSelectorOverlayView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        double v8 = self->_overlayView;
        self->_overlayView = v7;

        double v9 = [(OfflineRegionSelectorOverlay *)self regionSelectorDelegate];
        [(OfflineRegionSelectorOverlayView *)self->_overlayView setRegionSelectorDelegate:v9];

        [(OfflineRegionSelectorOverlayView *)self->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(OfflineRegionSelectorOverlayView *)self->_overlayView setAccessibilityIdentifier:@"OfflineRegionSelector"];
      }
      double v10 = [obj viewportLayoutGuide];
      [(OfflineRegionSelectorOverlayView *)self->_overlayView setViewportLayoutGuide:v10];

      double v11 = [obj overlayContentView];
      [v11 addSubview:self->_overlayView];

      double v12 = self->_overlayView;
      id v13 = [obj overlayContentView];
      LODWORD(v14) = 1148846080;
      v15 = -[OfflineRegionSelectorOverlayView _maps_constraintsEqualToEdgesOfView:insets:priority:](v12, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v14);
      double v16 = [v15 allConstraints];
      +[NSLayoutConstraint activateConstraints:v16];

      double v17 = [obj overlayContentView];
      [v17 layoutIfNeeded];

      [(OfflineRegionSelectorOverlay *)self _setInitialMapRegion];
      double v5 = obj;
    }
  }
}

- (BOOL)isHidden
{
  return [(OfflineRegionSelectorOverlayView *)self->_overlayView isHidden];
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);

  return (OfflineRegionSelectorActionCoordination *)WeakRetained;
}

- (MapViewProviding)mapViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewProvider);

  return (MapViewProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_regionSelectorDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_mapRegion, 0);

  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end