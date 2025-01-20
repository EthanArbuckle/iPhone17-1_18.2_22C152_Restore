@interface LookAroundPIPAnalyticsController
- (LookAroundPIPAnalyticsController)initWithDataCoordinator:(id)a3;
- (LookAroundPIPDataCoordinator)dataCoordinator;
- (int)_targetForLookAroundPIPDataCoordinator:(id)a3;
- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomInMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomOutMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndRotatingMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidPinchZoomInMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidPinchZoomOutMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidRotateMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidSelectMapItem:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomInMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomOutMapView:(id)a3;
- (void)setDataCoordinator:(id)a3;
@end

@implementation LookAroundPIPAnalyticsController

- (LookAroundPIPAnalyticsController)initWithDataCoordinator:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LookAroundPIPAnalyticsController;
  v5 = [(LookAroundPIPAnalyticsController *)&v7 init];
  if (v5)
  {
    [v4 addObserver:v5];
    [(LookAroundPIPAnalyticsController *)v5 setDataCoordinator:v4];
  }

  return v5;
}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
}

- (void)lookAroundPIPDataCoordinatorDidRotateMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1004 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidPinchZoomInMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1043 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidPinchZoomOutMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1044 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomInMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1047 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomOutMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1048 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomInMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1045 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomOutMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1046 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidSelectMapItem:(id)a3
{
  p_dataCoordinator = &self->_dataCoordinator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataCoordinator);
  objc_super v7 = [WeakRetained mapView];
  id v11 = [v7 _selectedLabelMarker];

  v8 = [v11 styleAttributes];
  LODWORD(v7) = [v8 isLandmarkPOI];

  if (v7) {
    uint64_t v9 = 6071;
  }
  else {
    uint64_t v9 = 1010;
  }
  uint64_t v10 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:v5];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:v9 onTarget:v10 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidEndRotatingMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1004 onTarget:v4 eventValue:0];
}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  uint64_t v4 = [(LookAroundPIPAnalyticsController *)self _targetForLookAroundPIPDataCoordinator:a3];

  [(LookAroundPIPAnalyticsController *)self _captureUserAction:1001 onTarget:v4 eventValue:0];
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v25 = a5;
  p_dataCoordinator = &self->_dataCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);
  uint64_t v10 = [WeakRetained mapView];

  id v11 = objc_loadWeakRetained((id *)p_dataCoordinator);
  v12 = [v11 lookAroundView];

  [v10 centerCoordinate];
  id v15 = [objc_alloc((Class)GEOLocation) initWithLatitude:v13 longitude:v14];
  v16 = [v10 camera];
  [v16 heading];
  double v18 = v17;
  [v10 _zoomLevel];
  double v20 = v19;
  v21 = [v12 visiblePlaceMUIDs];
  id v22 = [v21 count];
  if ([v12 showsRoadLabels]) {
    unsigned __int8 v23 = 1;
  }
  else {
    unsigned __int8 v23 = [v12 showsPointLabels];
  }
  LOBYTE(v24) = v23;
  +[GEOAPPortal captureLookAroundUserAction:v6 onTarget:v5 eventValue:v25 location:v15 heading:v18 zoom:v22 numberPoisInView:v20 labelingShown:v24];
}

- (int)_targetForLookAroundPIPDataCoordinator:(id)a3
{
  v3 = [a3 mapView];
  unint64_t v4 = (unint64_t)[v3 _lookAroundAvailability];

  if (v4 > 2) {
    return 0;
  }
  else {
    return dword_100F73888[v4];
  }
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (LookAroundPIPDataCoordinator *)WeakRetained;
}

- (void)setDataCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end