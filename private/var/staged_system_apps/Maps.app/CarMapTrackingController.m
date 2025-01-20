@interface CarMapTrackingController
- (BOOL)canRotateForHeading;
- (BOOL)hasRenderedSomething;
- (BOOL)hasUserLocation;
- (BOOL)isCurrentlyRotated;
- (BOOL)useForcedTrackingMode;
- (CarMapTrackingControllerDelegate)delegate;
- (MKMapView)mapView;
- (int64_t)forcedTrackingMode;
- (int64_t)userTrackingMode;
- (void)_mapViewNotified:(id)a3;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setForcedTrackingMode:(int64_t)a3;
- (void)setMapView:(id)a3;
- (void)setUseForcedTrackingMode:(BOOL)a3;
@end

@implementation CarMapTrackingController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MKUserTrackingViewModeDidChangeNotification object:self->_mapView];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MKUserTrackingViewDidUpdateUserLocationNotification object:self->_mapView];

  v5.receiver = self;
  v5.super_class = (Class)CarMapTrackingController;
  [(CarMapTrackingController *)&v5 dealloc];
}

- (void)setMapView:(id)a3
{
  id v9 = a3;
  if (self->_mapView)
  {
    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:MKUserTrackingViewModeDidChangeNotification object:self->_mapView];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:MKUserTrackingViewDidUpdateUserLocationNotification object:self->_mapView];
  }
  objc_storeStrong((id *)&self->_mapView, a3);
  if (v9)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_mapViewNotified:" name:MKUserTrackingViewModeDidChangeNotification object:self->_mapView];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"_mapViewNotified:" name:MKUserTrackingViewDidUpdateUserLocationNotification object:self->_mapView];
  }
}

- (void)_mapViewNotified:(id)a3
{
  id v4 = a3;
  id v7 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = [v4 name];
  v6 = [v4 userInfo];

  [v7 postNotificationName:v5 object:self userInfo:v6];
}

- (int64_t)userTrackingMode
{
  if (self->_useForcedTrackingMode) {
    return self->_forcedTrackingMode;
  }
  else {
    return [(MKMapView *)self->_mapView userTrackingMode];
  }
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  if (self->_useForcedTrackingMode) {
    -[CarMapTrackingController setForcedTrackingMode:](self, "setForcedTrackingMode:", a3, a4, a5);
  }
  else {
    [(MKMapView *)self->_mapView _setUserTrackingMode:a3 animated:a4 fromTrackingButton:a5];
  }
  id v6 = +[CarDisplayController sharedInstance];
  objc_super v5 = [v6 chromeViewController];
  [v5 setNeedsUpdateMapInsets];
}

- (void)setForcedTrackingMode:(int64_t)a3
{
  if (self->_forcedTrackingMode != a3)
  {
    self->_forcedTrackingMode = a3;
    if (self->_useForcedTrackingMode)
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 postNotificationName:MKUserTrackingViewModeDidChangeNotification object:self];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained trackingController:self changedToForcedTrackingMode:self->_forcedTrackingMode];
    }
  }
}

- (void)setUseForcedTrackingMode:(BOOL)a3
{
  if (self->_useForcedTrackingMode != a3)
  {
    self->_useForcedTrackingMode = a3;
    if (a3)
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 postNotificationName:MKUserTrackingViewModeDidChangeNotification object:self];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained trackingController:self changedToForcedTrackingMode:self->_forcedTrackingMode];
    }
  }
}

- (BOOL)hasUserLocation
{
  return [(MKMapView *)self->_mapView hasUserLocation];
}

- (BOOL)canRotateForHeading
{
  if (self->_useForcedTrackingMode) {
    return 0;
  }
  else {
    return [(MKMapView *)self->_mapView canRotateForHeading];
  }
}

- (BOOL)isCurrentlyRotated
{
  if (self->_useForcedTrackingMode) {
    return 0;
  }
  else {
    return [(MKMapView *)self->_mapView isCurrentlyRotated];
  }
}

- (BOOL)hasRenderedSomething
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mapView = self->_mapView;

  return [(MKMapView *)mapView hasRenderedSomething];
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (BOOL)useForcedTrackingMode
{
  return self->_useForcedTrackingMode;
}

- (int64_t)forcedTrackingMode
{
  return self->_forcedTrackingMode;
}

- (CarMapTrackingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarMapTrackingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end