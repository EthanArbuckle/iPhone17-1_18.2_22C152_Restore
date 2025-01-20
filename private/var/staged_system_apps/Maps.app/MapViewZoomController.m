@interface MapViewZoomController
- ($C79183323B9A0D5602617FF3BE5395AC)_boundingMapRectForLocation:(id)a3;
- (IOSBasedChromeViewController)chromeViewController;
- (MKMapView)mapView;
- (MapViewZoomController)initWithNavigationDisplay:(id)a3;
- (MapViewZoomControllerDelegate)delegate;
- (NavigationDisplay)navigationDisplay;
- (double)_horizontalCameraOffset;
- (double)currentCameraOffset;
- (unint64_t)zoom;
- (void)_applyOffsetCameraForOverlay:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5;
- (void)_zoomToDetail:(BOOL)a3 startCameraTracking:(BOOL)a4;
- (void)_zoomToOverview:(BOOL)a3 startCameraTracking:(BOOL)a4;
- (void)dealloc;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentCameraOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationDisplay:(id)a3;
- (void)setZoomTo:(unint64_t)a3;
- (void)setZoomTo:(unint64_t)a3 startCameraTracking:(BOOL)a4;
- (void)setZoomToTargetWithRect:(id)a3;
- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4;
@end

@implementation MapViewZoomController

- (void)dealloc
{
  [(MapViewZoomController *)self _applyOffsetCameraForOverlay:0 animated:0 forced:1];
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MapViewZoomController;
  [(MapViewZoomController *)&v4 dealloc];
}

- (MapViewZoomController)initWithNavigationDisplay:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapViewZoomController;
  v6 = [(MapViewZoomController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationDisplay, a3);
    v8 = +[MNNavigationService sharedService];
    [v8 registerObserver:v7];
  }
  return v7;
}

- (MKMapView)mapView
{
  v2 = [(MapViewZoomController *)self chromeViewController];
  v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (void)setZoomTo:(unint64_t)a3
{
}

- (void)setZoomTo:(unint64_t)a3 startCameraTracking:(BOOL)a4
{
  if (self->_zoom != a3)
  {
    BOOL v4 = a4;
    v7 = sub_100576084();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t zoom = self->_zoom;
      if (zoom >= 3)
      {
        v9 = +[NSString stringWithFormat:@"MapViewZoom(%lu)", self->_zoom];
      }
      else
      {
        v9 = off_101322610[zoom];
      }
      objc_super v10 = v9;
      if (a3 >= 3)
      {
        v11 = +[NSString stringWithFormat:@"MapViewZoom(%lu)", a3];
      }
      else
      {
        v11 = off_101322610[a3];
      }
      v12 = [(MapViewZoomController *)self mapView];
      *(_DWORD *)buf = 138544130;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 1024;
      BOOL v19 = v4;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Changing zoom from %{public}@ to %{public}@, startCameraTracking: %d on mapView: %{public}@", buf, 0x26u);
    }
    self->_unint64_t zoom = a3;
    if (a3 == 2)
    {
      self->_unint64_t zoom = 0;
    }
    else
    {
      if (a3 == 1)
      {
        [(MapViewZoomController *)self _zoomToOverview:1 startCameraTracking:v4];
        goto LABEL_17;
      }
      if (a3) {
        goto LABEL_17;
      }
    }
    [(MapViewZoomController *)self _zoomToDetail:1 startCameraTracking:v4];
LABEL_17:
    v13 = [(MapViewZoomController *)self delegate];
    [v13 mapViewZoomController:self didChangeMapViewZoom:self->_zoom];
  }
}

- (void)setZoomToTargetWithRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  self->_unint64_t zoom = 2;
  v8 = [(MapViewZoomController *)self navigationDisplay];
  [v8 stopCameraMotion];

  v9 = [(MapViewZoomController *)self mapView];
  [v9 animateToVisibleMapRect:1 usingDefaultAnimationDuration:0 completion:v6, v5, var0, var1];

  id v10 = [(MapViewZoomController *)self delegate];
  [v10 mapViewZoomController:self didChangeMapViewZoom:self->_zoom];
}

- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4
{
  id v10 = a3;
  unsigned int v6 = (a4 > 7) | (0x1Cu >> a4);
  if (!self->_zoom)
  {
    [(MapViewZoomController *)self _applyOffsetCameraForOverlay:v6 & 1 animated:1 forced:0];
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    if ([v10 horizontalSizeClass] == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
    {
      v7 = [(MapViewZoomController *)self navigationDisplay];
      v8 = v7;
      uint64_t v9 = 1;
    }
    else
    {
      v7 = [(MapViewZoomController *)self navigationDisplay];
      v8 = v7;
      uint64_t v9 = 0;
    }
    goto LABEL_9;
  }
  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  v7 = [(MapViewZoomController *)self navigationDisplay];
  v8 = v7;
  uint64_t v9 = 2;
LABEL_9:
  [v7 setSky:v9];
}

- (void)_zoomToDetail:(BOOL)a3 startCameraTracking:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(MapViewZoomController *)self _applyOffsetCameraForOverlay:1 animated:a3 forced:0];
  if (v4)
  {
    v7 = [(MapViewZoomController *)self navigationDisplay];
    [v7 startMotion:v5];
  }
  v8 = [(MapViewZoomController *)self navigationDisplay];
  [v8 setNavigationCameraMode:0];

  uint64_t v9 = sub_100576084();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(MapViewZoomController *)self mapView];
    int v13 = 136315394;
    v14 = "-[MapViewZoomController _zoomToDetail:startCameraTracking:]";
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v11 = [(MapViewZoomController *)self navigationDisplay];
  v12 = [v11 mapView];
  [v12 navigationCameraReturnToPuck];
}

- (void)_zoomToOverview:(BOOL)a3 startCameraTracking:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(MapViewZoomController *)self _applyOffsetCameraForOverlay:1 animated:a3 forced:0];
  if (v4)
  {
    v7 = [(MapViewZoomController *)self navigationDisplay];
    [v7 startMotion:v5];
  }
  v8 = [(MapViewZoomController *)self navigationDisplay];
  [v8 setNavigationCameraMode:1];

  uint64_t v9 = sub_100576084();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(MapViewZoomController *)self mapView];
    int v13 = 136315394;
    v14 = "-[MapViewZoomController _zoomToOverview:startCameraTracking:]";
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v11 = [(MapViewZoomController *)self navigationDisplay];
  v12 = [v11 mapView];
  [v12 navigationCameraReturnToPuck];
}

- ($C79183323B9A0D5602617FF3BE5395AC)_boundingMapRectForLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MapViewZoomController *)self chromeViewController];
  unsigned int v6 = [v5 routeAnnotationsController];
  [v6 mapRectForRouteRemainingAtLocation:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  UIEdgeInsetsMakeWithEdges();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(MapViewZoomController *)self mapView];
  [v23 mapRectThatFits:v8 edgePadding:v10, v12, v14, v16, v18, v20, v22];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.var1.double var1 = v35;
  result.var1.double var0 = v34;
  result.var0.double var1 = v33;
  result.var0.double var0 = v32;
  return result;
}

- (void)_applyOffsetCameraForOverlay:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  double v9 = 0.0;
  if (a3)
  {
    [(MapViewZoomController *)self _horizontalCameraOffset];
    double v9 = v10;
  }
  if (a5 || self->_currentCameraOffset != v9)
  {
    self->_currentCameraOffset = v9;
    double v11 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
    if (v6) {
      double v12 = 2.5;
    }
    else {
      double v12 = 0.0;
    }
    if (!v7) {
      double v11 = (id *)&kCAMediaTimingFunctionDefault;
    }
    id v13 = *v11;
    id v16 = [(MapViewZoomController *)self mapView];
    double v14 = [v16 _mapLayer];
    double v15 = +[CAMediaTimingFunction functionWithName:v13];

    [v14 setCameraHorizontalOffset:v15 duration:v9 timingFunction:v12];
  }
}

- (double)_horizontalCameraOffset
{
  v3 = [(MapViewZoomController *)self chromeViewController];
  id v4 = [v3 view];
  [v4 layoutIfNeeded];

  BOOL v5 = [(MapViewZoomController *)self chromeViewController];
  [v5 unobscuredMapContentBoundsInContainingView];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  double MidX = CGRectGetMidX(v18);
  double v15 = [(MapViewZoomController *)self mapView];
  [v15 bounds];
  double v16 = MidX - CGRectGetMidX(v19);

  return v16;
}

- (unint64_t)zoom
{
  return self->_zoom;
}

- (MapViewZoomControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapViewZoomControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (void)setNavigationDisplay:(id)a3
{
}

- (double)currentCameraOffset
{
  return self->_currentCameraOffset;
}

- (void)setCurrentCameraOffset:(double)a3
{
  self->_currentCameraOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end