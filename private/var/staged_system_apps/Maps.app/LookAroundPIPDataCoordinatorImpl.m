@interface LookAroundPIPDataCoordinatorImpl
- (BOOL)isLookAroundDataAvailable;
- (BOOL)isLookAroundViewUserInteractionStarted;
- (BOOL)isMapViewInSyncWithLookAroundView;
- (BOOL)isMapViewUserInteractionStarted;
- (BOOL)isPanningMapView;
- (BOOL)isRotatingMapView;
- (BOOL)isZoomingMapView;
- (CLLocationCoordinate2D)lastCoordinate;
- (LookAroundPIPDataCoordinatorImpl)initWithMapView:(id)a3;
- (LookAroundPIPStateMachine)stateMachine;
- (MKLookAroundView)lookAroundView;
- (MKMapServiceTicket)refineTicket;
- (MKMapView)mapView;
- (NSHashTable)observers;
- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver;
- (NSObject)mapViewDidChangeLookAroundAvailabilityObserver;
- (SEL)_selectorForObserverEventType:(unint64_t)a3;
- (VKLabelMarker)labelMarkerToRefine;
- (VKMuninMarker)muninMarker;
- (double)_filteredHeadingWithHeading:(double)result;
- (double)lastHeading;
- (double)lookAroundViewHeading;
- (void)_didEndMovingLookAroundView:(BOOL)a3;
- (void)_dispatchSelector:(SEL)a3 toObserver:(id)a4;
- (void)_filteredHeadingReset;
- (void)_getEntryMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5;
- (void)_getEntryMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5;
- (void)_getMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5;
- (void)_getMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5;
- (void)_handleMapView:(id)a3 didDidChangeLookAroundAvailability:(int64_t)a4;
- (void)_handleMapViewDidResumeIfNeeded:(id)a3;
- (void)_handleMapViewOneFingerPanWithZoomDirection:(int64_t)a3;
- (void)_handleMapViewPanStart:(id)a3;
- (void)_handleMapViewPanStop:(id)a3 shouldMoveLookAroundView:(BOOL)a4;
- (void)_handleMapViewPanningIfNeeded:(id)a3;
- (void)_handleMapViewPinchWithZoomDirection:(int64_t)a3;
- (void)_handleMapViewRotateStart:(id)a3;
- (void)_handleMapViewRotateStop:(id)a3;
- (void)_handleMapViewRotatingIfNeeded:(id)a3;
- (void)_handleMapViewTap:(id)a3 atPoint:(CGPoint)a4;
- (void)_handleMapViewZoomStart:(id)a3;
- (void)_handleMapViewZoomStop:(id)a3 zoomGestureType:(int64_t)a4 zoomDirection:(int64_t)a5;
- (void)_moveLookAroundViewIfNeeded;
- (void)_moveLookAroundViewToCoordinate:(CLLocationCoordinate2D)a3;
- (void)_moveLookAroundViewToMapItem:(id)a3;
- (void)_nearestMuninMarkerWithCompleteMarkerHandler:(id)a3;
- (void)_nonselectingTapGestureRecognizerAction:(id)a3;
- (void)_notifyObservers:(unint64_t)a3;
- (void)_onSuccess:(BOOL)a3 setLookAroundViewEntryPointWithMapItem:(id)a4 orMuninMarker:(id)a5 andContinue:(id)a6;
- (void)_onSuccess:(BOOL)a3 synchronizeMapViewCenterToLookAroundViewCenterAndContinue:(id)a4;
- (void)_onSuccess:(BOOL)a3 waitForLookAroundViewToBecomeAdequatelyDrawnIfNeededAndContinue:(id)a4;
- (void)_onSuccessProceedToEnterLookArounPIP:(BOOL)a3;
- (void)_refineLabelMarker:(id)a3;
- (void)_startMovingLookAroundViewToMapItem:(id)a3 orMuninMarker:(id)a4 heading:(double)a5 shouldZoom:(BOOL)a6;
- (void)_willEndMovingLookAroundView:(BOOL)a3 shouldZoomIfFinished:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)coordinateLookAroundViewDidChangeVisibleRegion:(id)a3;
- (void)coordinateLookAroundViewDidStartUserInteraction:(id)a3;
- (void)coordinateLookAroundViewDidStopUserInteraction:(id)a3;
- (void)coordinateMapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4;
- (void)coordinateMapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)coordinateMapView:(id)a3 willSelectLabelMarker:(id)a4;
- (void)coordinateMapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)coordinateMapViewDidChangeVisibleRegion:(id)a3;
- (void)coordinateMapViewDidStartUserInteraction:(id)a3;
- (void)coordinateMapViewDidStopUserInteraction:(id)a3;
- (void)coordinateMapViewRegionDidChange:(id)a3;
- (void)dealloc;
- (void)enterLookAroundPIPWithLookAroundView:(id)a3 mapItem:(id)a4;
- (void)exitLookAroundPIPAfter:(double)a3 withCompletion:(id)a4;
- (void)pause;
- (void)removeObserver:(id)a3;
- (void)resume;
- (void)setIsLookAroundViewUserInteractionStarted:(BOOL)a3;
- (void)setIsMapViewInSyncWithLookAroundView:(BOOL)a3;
- (void)setIsMapViewUserInteractionStarted:(BOOL)a3;
- (void)setIsRotatingMapView:(BOOL)a3;
- (void)setIsZoomingMapView:(BOOL)a3;
- (void)setLabelMarkerToRefine:(id)a3;
- (void)setLastCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLastHeading:(double)a3;
- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3;
- (void)setLookAroundViewHeading:(double)a3;
- (void)setMapViewDidChangeLookAroundAvailabilityObserver:(id)a3;
- (void)setNeedsLookAroundAvailabilityUpdate;
- (void)setNeedsMapViewSynchronization;
- (void)setObservers:(id)a3;
- (void)setRefineTicket:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)synchronizeMapViewIfNeeded;
@end

@implementation LookAroundPIPDataCoordinatorImpl

- (LookAroundPIPDataCoordinatorImpl)initWithMapView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LookAroundPIPDataCoordinatorImpl;
  v6 = [(LookAroundPIPDataCoordinatorImpl *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_mapView, a3);
    v9 = [(MKMapView *)v6->_mapView _nonselectingTapGestureRecognizer];
    [v9 addTarget:v6 action:"_nonselectingTapGestureRecognizerAction:"];

    v10 = objc_alloc_init(LookAroundPIPStateMachine);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v10;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(MKMapView *)self->_mapView _nonselectingTapGestureRecognizer];
  [v3 removeTarget:self action:0];

  [(MKMapServiceTicket *)self->_refineTicket cancel];
  refineTicket = self->_refineTicket;
  self->_refineTicket = 0;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundPIPDataCoordinatorImpl;
  [(LookAroundPIPDataCoordinatorImpl *)&v5 dealloc];
}

- (BOOL)isPanningMapView
{
  return [(LookAroundPIPStateMachine *)self->_stateMachine isPanning];
}

- (void)_nonselectingTapGestureRecognizerAction:(id)a3
{
  mapView = self->_mapView;
  id v5 = a3;
  id v10 = [(LookAroundPIPDataCoordinatorImpl *)self mapView];
  [v5 locationInView:v10];
  double v7 = v6;
  double v9 = v8;

  -[LookAroundPIPDataCoordinatorImpl _handleMapViewTap:atPoint:](self, "_handleMapViewTap:atPoint:", mapView, v7, v9);
}

- (VKMuninMarker)muninMarker
{
  [(MKMapView *)self->_mapView centerCoordinate];
  double v4 = v3;
  [(MKMapView *)self->_mapView centerCoordinate];
  double v6 = v5;
  double v7 = [(MKMapView *)self->_mapView _mapLayer];
  double v8 = [v7 muninMarkerAtCoordinate:v4, v6];

  return (VKMuninMarker *)v8;
}

- (BOOL)isLookAroundDataAvailable
{
  return [(MKMapView *)self->_mapView _lookAroundAvailability] == (id)2;
}

- (void)enterLookAroundPIPWithLookAroundView:(id)a3 mapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_lookAroundView)
  {
    objc_storeStrong((id *)&self->_lookAroundView, a3);
    double v9 = [(MKMapView *)self->_mapView _mapLayer];
    [v9 setDesiredMapMode:3];

    [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:0];
    if (v8)
    {
      id v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      +[NSString stringWithFormat:@", mapItem=<%@: %p>", v11, v8];
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &stru_101324E70;
    }
    objc_super v13 = sub_1005764AC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      lookAroundView = self->_lookAroundView;
      *(_DWORD *)buf = 138412802;
      v21 = v15;
      __int16 v22 = 2048;
      v23 = lookAroundView;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Enter LookAround PIP with lookAroundView=<%@: %p>%@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100BE2434;
    v17[3] = &unk_10131AD00;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v8;
    [(LookAroundPIPDataCoordinatorImpl *)self _getEntryMuninMarkerWithMapViewOrMapItem:v18 shouldWait:0 andContinue:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_getEntryMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = self->_lookAroundView;
  stateMachine = self->_stateMachine;
  id v10 = a5;
  if ([(LookAroundPIPStateMachine *)stateMachine isActive]
    || ![(MKLookAroundView *)v8 hasEnteredLookAround])
  {
    [v11 closeUpViewCoordinate];
  }
  else
  {
    [(MKLookAroundView *)v8 centerCoordinate];
  }
  -[LookAroundPIPDataCoordinatorImpl _getEntryMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getEntryMuninMarkerAtCoordinate:shouldWait:andContinue:", v6, v10);
}

- (void)_getMuninMarkerWithMapViewOrMapItem:(id)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = self->_lookAroundView;
  stateMachine = self->_stateMachine;
  id v10 = a5;
  if ([(LookAroundPIPStateMachine *)stateMachine isActive]
    || ![(MKLookAroundView *)v8 hasEnteredLookAround])
  {
    [v11 closeUpViewCoordinate];
  }
  else
  {
    [(MKLookAroundView *)v8 centerCoordinate];
  }
  -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", v6, v10);
}

- (void)_getEntryMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  BOOL v5 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  lookAroundView = self->_lookAroundView;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([(MKLookAroundView *)lookAroundView hasEnteredLookAround]) {
    v10[2](v10, 1, 0);
  }
  else {
    -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", v5, v10, latitude, longitude);
  }
}

- (void)_getMuninMarkerAtCoordinate:(CLLocationCoordinate2D)a3 shouldWait:(BOOL)a4 andContinue:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a5;
  id v10 = self->_mapView;
  id v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v23 = latitude;
    __int16 v24 = 2048;
    double v25 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Asking mapView for a muninMarker at coordinate=(%g, %g)", buf, 0x16u);
  }

  v12 = [(MKMapView *)v10 _mapLayer];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BE2A90;
  v16[3] = &unk_10131AD28;
  BOOL v21 = a4;
  v17 = v10;
  id v18 = v9;
  double v19 = latitude;
  double v20 = longitude;
  id v13 = v9;
  v14 = v10;
  id v15 = [v12 muninMarkerAtCoordinate:v16 completeMarkerHandler:latitude, longitude];
}

- (void)_onSuccess:(BOOL)a3 setLookAroundViewEntryPointWithMapItem:(id)a4 orMuninMarker:(id)a5 andContinue:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, BOOL))a6;
  if (v11
    && v8
    && ([(MKLookAroundView *)self->_lookAroundView hasEnteredLookAround] & 1) == 0)
  {
    if ([v10 _hasLookAroundStorefront])
    {
      id v13 = sub_1005764AC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v10 name];
        *(_DWORD *)buf = 138412290;
        double v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Entering lookAroundView with mapItem=\"%@\"", buf, 0xCu);
      }
      lookAroundView = self->_lookAroundView;
      v16 = +[MKLookAroundEntryPoint entryPointWithMapItem:v10];
      [(MKLookAroundView *)lookAroundView enterLookAroundWithEntryPoint:v16];
    }
    else
    {
      [(MKMapView *)self->_mapView presentationYaw];
      if (v10)
      {
        [v11 coordinate];
        [v11 coordinate];
        [v10 _coordinate];
        [v10 _coordinate];
        GEOBearingFromCoordinateToCoordinate();
        double v19 = v18;
        double v20 = [v10 name];
        +[NSString stringWithFormat:@"and mapItem=\"%@\"", v20];
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v19 = v17;
        v16 = &stru_101324E70;
      }
      BOOL v21 = sub_1005764AC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Entering lookAroundView with muninMarker %@", buf, 0xCu);
      }

      __int16 v22 = self->_lookAroundView;
      double v23 = +[MKLookAroundEntryPoint entryPointWithMuninMarker:v11 heading:v19];
      [(MKLookAroundView *)v22 enterLookAroundWithEntryPoint:v23];
    }
  }
  v12[2](v12, v8);
}

- (void)_onSuccess:(BOOL)a3 waitForLookAroundViewToBecomeAdequatelyDrawnIfNeededAndContinue:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v4) {
    goto LABEL_6;
  }
  [(MKMapView *)self->_mapView centerCoordinate];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will enter LookAround PIP at coordinate=(%g, %g)", buf, 0x16u);
  }

  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:0];
  lookAroundView = self->_lookAroundView;
  if (lookAroundView && ([(MKLookAroundView *)lookAroundView adequatelyDrawn] & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    id v13 = sub_1005764AC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Waiting for lookAroundView to become adequately drawn", v23, 2u);
    }

    v14 = +[NSNotificationCenter defaultCenter];
    id v15 = self->_lookAroundView;
    v16 = +[NSOperationQueue mainQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100BE32E0;
    v20[3] = &unk_1012E6778;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v17 = MKLookAroundViewDidBecomeAdequatelyDrawnNotification;
    id v21 = v6;
    double v18 = [v14 addObserverForName:v17 object:v15 queue:v16 usingBlock:v20];
    lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
    self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_6:
    (*((void (**)(id, BOOL))v6 + 2))(v6, v4);
  }
}

- (void)_onSuccess:(BOOL)a3 synchronizeMapViewCenterToLookAroundViewCenterAndContinue:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v4)
  {
    lookAroundView = self->_lookAroundView;
    if (lookAroundView)
    {
      [(MKLookAroundView *)lookAroundView centerCoordinate];
      double v9 = v8;
      double v11 = v10;
      v12 = sub_1005764AC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 134218240;
        double v14 = v9;
        __int16 v15 = 2048;
        double v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Synchronizing mapView with lookAroundView at coordinate=(%g, %g)", (uint8_t *)&v13, 0x16u);
      }

      -[MKMapView setCenterCoordinate:animated:](self->_mapView, "setCenterCoordinate:animated:", 1, v9, v11);
    }
  }
  v6[2](v6, v4);
}

- (void)_onSuccessProceedToEnterLookArounPIP:(BOOL)a3
{
  if (a3)
  {
    [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:2];
    [(MKMapView *)self->_mapView centerCoordinate];
    CLLocationDegrees v5 = v4;
    CLLocationDegrees v7 = v6;
    [(MKLookAroundView *)self->_lookAroundView presentationYaw];
    double v9 = v8;
    [(MKMapView *)self->_mapView _zoomLevel];
    uint64_t v11 = v10;
    v12 = sub_1005764AC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218752;
      CLLocationDegrees v14 = v5;
      __int16 v15 = 2048;
      CLLocationDegrees v16 = v7;
      __int16 v17 = 2048;
      double v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Did enter LookAround PIP at coordinate=(%g, %g), heading=%g, zoomLevel=%g", (uint8_t *)&v13, 0x2Au);
    }

    self->_isMapViewInSyncWithLookAroundView = 1;
    self->_lastCoordinate.double latitude = v5;
    self->_lastCoordinate.double longitude = v7;
    self->_lookAroundViewHeading = v9;
    self->_lastHeading = v9;
    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:1];
  }
  else
  {
    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:2];
  }
}

- (void)exitLookAroundPIPAfter:(double)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (self->_lookAroundView)
  {
    CLLocationDegrees v7 = sub_1005764AC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will exit LookAround PIP", (uint8_t *)buf, 2u);
    }

    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:4];
    if (self->_isLookAroundViewUserInteractionStarted)
    {
      self->_isLookAroundViewUserInteractionStarted = 0;
      [(MKMapView *)self->_mapView setUserInteractionEnabled:1];
    }
    if ([(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:1])
    {
      [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:1];
      double v8 = sub_1005764AC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)buf, 2u);
      }

      [(MKLookAroundView *)self->_lookAroundView cancelPendingMove];
    }
    if (self->_mapViewDidChangeLookAroundAvailabilityObserver)
    {
      double v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:self->_mapViewDidChangeLookAroundAvailabilityObserver];

      mapViewDidChangeLookAroundAvailabilityObserver = self->_mapViewDidChangeLookAroundAvailabilityObserver;
      self->_mapViewDidChangeLookAroundAvailabilityObserver = 0;
    }
    if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
    {
      uint64_t v11 = +[NSNotificationCenter defaultCenter];
      [v11 removeObserver:self->_lookAroundViewDidBecomeAdequatelyDrawnObserver];

      lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
      self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = 0;
    }
    int v13 = [(MKMapView *)self->_mapView _mapLayer];
    [v13 setDesiredMapMode:0];

    [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:0];
    lookAroundView = self->_lookAroundView;
    self->_lookAroundView = 0;

    objc_initWeak(buf, self);
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100BE3874;
    v16[3] = &unk_1012E9950;
    objc_copyWeak(&v18, buf);
    id v17 = v6;
    dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

- (void)coordinateMapViewDidStartUserInteraction:(id)a3
{
  double v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      if ([(LookAroundPIPStateMachine *)self->_stateMachine isActive])
      {
        self->_isMapViewUserInteractionStarted = 1;
        [(MKLookAroundView *)self->_lookAroundView setUserInteractionEnabled:0];
        if ([(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:1])
        {
          [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:1];
          CLLocationDegrees v5 = sub_1005764AC();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)id v6 = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did cancel pending move", v6, 2u);
          }

          [(MKLookAroundView *)self->_lookAroundView cancelPendingMove];
        }
      }
    }
  }
}

- (void)coordinateMapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  CLLocationDegrees v7 = (MKMapView *)a3;
  if (self->_mapView == v7)
  {
    if (self->_lookAroundView)
    {
      double v9 = v7;
      unsigned int v8 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      CLLocationDegrees v7 = v9;
      if (v8)
      {
        if (a4 == 2)
        {
          [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewRotateStart:v9];
        }
        else if (a4 == 1)
        {
          [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewZoomStart:v9];
        }
        else
        {
          if (a4) {
            goto LABEL_2;
          }
          [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPanStart:v9];
        }
        CLLocationDegrees v7 = v9;
      }
    }
  }
LABEL_2:
}

- (void)coordinateMapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  v12 = (MKMapView *)a3;
  if (self->_mapView == v12)
  {
    if (self->_lookAroundView)
    {
      CLLocationDegrees v14 = v12;
      unsigned int v13 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      v12 = v14;
      if (v13)
      {
        if (a4 == 1)
        {
          [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewZoomStop:v14 zoomGestureType:a6 zoomDirection:a5];
        }
        else
        {
          if (a4 != 2) {
            goto LABEL_2;
          }
          [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewRotateStop:v14];
        }
        v12 = v14;
      }
    }
  }
LABEL_2:
}

- (void)coordinateMapViewDidStopUserInteraction:(id)a3
{
  double v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      id v6 = v4;
      unsigned int v5 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      double v4 = v6;
      if (v5)
      {
        [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPanStop:v6 shouldMoveLookAroundView:1];
        self->_isMapViewUserInteractionStarted = 0;
        [(MKLookAroundView *)self->_lookAroundView setUserInteractionEnabled:[(LookAroundPIPDataCoordinatorImpl *)self isLookAroundDataAvailable]];
        double v4 = v6;
      }
    }
  }
}

- (void)coordinateMapView:(id)a3 willSelectLabelMarker:(id)a4
{
  id v6 = (MKMapView *)a3;
  id v7 = a4;
  if (self->_mapView == v6
    && self->_lookAroundView
    && [(LookAroundPIPStateMachine *)self->_stateMachine isActive])
  {
    if ([(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:1])
    {
      [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:1];
      unsigned int v8 = sub_1005764AC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)&v10, 2u);
      }

      [(MKLookAroundView *)self->_lookAroundView cancelPendingMove];
    }
    double v9 = sub_1005764AC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MapView will refine label marker %@", (uint8_t *)&v10, 0xCu);
    }

    [(LookAroundPIPDataCoordinatorImpl *)self _refineLabelMarker:v7];
  }
}

- (void)coordinateMapViewRegionDidChange:(id)a3
{
  double v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      id v6 = v4;
      unsigned int v5 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      double v4 = v6;
      if (v5)
      {
        [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewDidResumeIfNeeded:v6];
        double v4 = v6;
      }
    }
  }
}

- (void)coordinateMapViewDidChangeVisibleRegion:(id)a3
{
  double v4 = (MKMapView *)a3;
  if (self->_mapView == v4)
  {
    if (self->_lookAroundView)
    {
      id v6 = v4;
      unsigned int v5 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      double v4 = v6;
      if (v5)
      {
        [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPanningIfNeeded:v6];
        [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewRotatingIfNeeded:v6];
        double v4 = v6;
      }
    }
  }
}

- (void)coordinateMapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  id v6 = (MKMapView *)a3;
  if (self->_mapView == v6)
  {
    if (self->_lookAroundView)
    {
      unsigned int v8 = v6;
      unsigned int v7 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
      id v6 = v8;
      if (v7)
      {
        [(LookAroundPIPDataCoordinatorImpl *)self _handleMapView:v8 didDidChangeLookAroundAvailability:a4];
        [(MKLookAroundView *)self->_lookAroundView setUserInteractionEnabled:[(LookAroundPIPDataCoordinatorImpl *)self isLookAroundDataAvailable]];
        id v6 = v8;
      }
    }
  }
}

- (void)coordinateLookAroundViewDidStartUserInteraction:(id)a3
{
  lookAroundView = self->_lookAroundView;
  if (lookAroundView) {
    BOOL v4 = lookAroundView == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4 && [(LookAroundPIPStateMachine *)self->_stateMachine isActive])
  {
    self->_isLookAroundViewUserInteractionStarted = 1;
    mapView = self->_mapView;
    [(MKMapView *)mapView setUserInteractionEnabled:0];
  }
}

- (void)coordinateLookAroundViewDidStopUserInteraction:(id)a3
{
  lookAroundView = self->_lookAroundView;
  if (lookAroundView) {
    BOOL v4 = lookAroundView == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4 && [(LookAroundPIPStateMachine *)self->_stateMachine isActive])
  {
    self->_isLookAroundViewUserInteractionStarted = 0;
    mapView = self->_mapView;
    [(MKMapView *)mapView setUserInteractionEnabled:1];
  }
}

- (void)coordinateLookAroundViewDidChangeVisibleRegion:(id)a3
{
  BOOL v4 = (MKLookAroundView *)a3;
  unsigned int v5 = v4;
  lookAroundView = self->_lookAroundView;
  if (lookAroundView) {
    BOOL v7 = lookAroundView == v4;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v11 = v4;
    unsigned int v8 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
    unsigned int v5 = v11;
    if (v8)
    {
      [(MKLookAroundView *)v11 presentationYaw];
      self->_lookAroundViewHeading = v9;
      if (self->_isLookAroundViewUserInteractionStarted) {
        goto LABEL_11;
      }
      if (![(LookAroundPIPStateMachine *)self->_stateMachine isCancellingPendingMove])
      {
        mapView = self->_mapView;
        [(MKLookAroundView *)v11 centerCoordinate];
        -[MKMapView setCenterCoordinate:](mapView, "setCenterCoordinate:");
        [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:14];
      }
      unsigned int v5 = v11;
      if (self->_isLookAroundViewUserInteractionStarted)
      {
LABEL_11:
        [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:12];
        unsigned int v5 = v11;
      }
    }
  }
}

- (void)pause
{
  if (self->_lookAroundView
    && [(LookAroundPIPStateMachine *)self->_stateMachine isActive]
    && [(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:5])
  {
    stateMachine = self->_stateMachine;
    [(LookAroundPIPStateMachine *)stateMachine setStateTo:5];
  }
}

- (void)resume
{
  if (self->_lookAroundView
    && [(LookAroundPIPStateMachine *)self->_stateMachine isActive]
    && [(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:6])
  {
    stateMachine = self->_stateMachine;
    [(LookAroundPIPStateMachine *)stateMachine setStateTo:6];
  }
}

- (void)setNeedsMapViewSynchronization
{
  if (self->_lookAroundView
    && [(LookAroundPIPStateMachine *)self->_stateMachine isActive]
    && [(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:6])
  {
    [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
    mapView = self->_mapView;
    -[MKMapView setCenterCoordinate:](mapView, "setCenterCoordinate:");
  }
}

- (void)synchronizeMapViewIfNeeded
{
  if (self->_lookAroundView && [(LookAroundPIPStateMachine *)self->_stateMachine isActive])
  {
    [(MKMapView *)self->_mapView centerCoordinate];
    id v5 = [objc_alloc((Class)CLLocation) initWithLatitude:v3 longitude:v4];
    [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
    id v8 = [objc_alloc((Class)CLLocation) initWithLatitude:v6 longitude:v7];
    [v5 distanceFromLocation:v8];
    if (v9 >= 10.0
      && ![(LookAroundPIPStateMachine *)self->_stateMachine isCancellingPendingMove]
      && ![(LookAroundPIPStateMachine *)self->_stateMachine isMoving]
      && ![(LookAroundPIPStateMachine *)self->_stateMachine isPanning])
    {
      int v10 = sub_1005764AC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        [(MKMapView *)self->_mapView centerCoordinate];
        uint64_t v12 = v11;
        [(MKMapView *)self->_mapView centerCoordinate];
        uint64_t v14 = v13;
        [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
        uint64_t v16 = v15;
        [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
        uint64_t v18 = v17;
        __int16 v19 = sub_100BF7E04([(LookAroundPIPStateMachine *)self->_stateMachine state]);
        int v21 = 134219010;
        uint64_t v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Synchronizing mapView={%g, %g} with lookAroundView={%g, %g}, state=%@", (uint8_t *)&v21, 0x34u);
      }
      mapView = self->_mapView;
      [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
      -[MKMapView setCenterCoordinate:animated:](mapView, "setCenterCoordinate:animated:", 0);
    }
  }
}

- (void)setNeedsLookAroundAvailabilityUpdate
{
  id v5 = self->_mapView;
  [(LookAroundPIPDataCoordinatorImpl *)self coordinateMapView:v5 didChangeLookAroundAvailability:[(MKMapView *)v5 _lookAroundAvailability]];
  if ([(MKMapView *)v5 _lookAroundAvailability] != (id)2)
  {
    double v3 = [(MKMapView *)v5 camera];
    id v4 = [v3 copy];

    [v4 setCenterCoordinateDistance:950.0];
    [(MKMapView *)v5 setCamera:v4 animated:0];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_filteredHeadingReset
{
  self->_absoluteHeadings[4] = 0.0;
  *(_OWORD *)self->_absoluteHeadings = 0u;
  *(_OWORD *)&self->_absoluteHeadings[2] = 0u;
  *(_OWORD *)&self->_absoluteHeadingsAverage = 0u;
  *(_OWORD *)&self->_filteredHeadingsCount = 0u;
  *(_OWORD *)self->_headingsQuadrants = 0u;
  *(_OWORD *)&self->_headingsQuadrants[2] = 0u;
  self->_headingsQuadrants[4] = 0.0;
  self->_headingsQuadrantsSum = 0.0;
}

- (double)_filteredHeadingWithHeading:(double)result
{
  double v3 = -result;
  if (result >= 0.0) {
    double v3 = result;
  }
  double v4 = -1.0;
  if (result >= 0.0) {
    double v4 = 1.0;
  }
  unint64_t filteredHeadingsCount = self->_filteredHeadingsCount;
  unint64_t filteredHeadingsIndex = self->_filteredHeadingsIndex;
  if (filteredHeadingsCount > 4)
  {
    double v7 = (double *)(&self->super.isa + filteredHeadingsIndex);
    self->_absoluteHeadingsSum = self->_absoluteHeadingsSum - v7[2];
    self->_headingsQuadrantsSum = self->_headingsQuadrantsSum - v7[11];
  }
  id v8 = (double *)(&self->super.isa + filteredHeadingsIndex);
  v8[2] = v3;
  self->_absoluteHeadingsSum = v3 + self->_absoluteHeadingsSum;
  v8[11] = v4;
  double v9 = v4 + self->_headingsQuadrantsSum;
  self->_headingsQuadrantsSum = v9;
  self->_unint64_t filteredHeadingsIndex = (filteredHeadingsIndex + 1) % 5;
  if (filteredHeadingsCount >= 5)
  {
    double absoluteHeadingsAverage = self->_absoluteHeadingsAverage;
    self->_double absoluteHeadingsAverage = self->_absoluteHeadingsSum / (double)filteredHeadingsCount;
  }
  else
  {
    self->_unint64_t filteredHeadingsCount = filteredHeadingsCount + 1;
    double absoluteHeadingsAverage = self->_absoluteHeadingsAverage;
    self->_double absoluteHeadingsAverage = self->_absoluteHeadingsSum / (double)(filteredHeadingsCount + 1);
    if (filteredHeadingsCount != 4) {
      return result;
    }
  }
  if (v3 < absoluteHeadingsAverage + -45.0 || v3 > absoluteHeadingsAverage + 45.0)
  {
    result = -absoluteHeadingsAverage;
    if (v9 >= 0.0) {
      return absoluteHeadingsAverage;
    }
  }
  return result;
}

- (void)_handleMapViewPanStart:(id)a3
{
  id v4 = a3;
  if ([(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:4])
  {
    [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:4];
    [v4 centerCoordinate];
    CLLocationDegrees v6 = v5;
    CLLocationDegrees v8 = v7;
    double v9 = sub_1005764AC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134218240;
      CLLocationDegrees v11 = v6;
      __int16 v12 = 2048;
      CLLocationDegrees v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MapView did start panning at coordinate=(%g, %g)", (uint8_t *)&v10, 0x16u);
    }

    self->_lastCoordinate.double latitude = v6;
    self->_lastCoordinate.double longitude = v8;
    [(LookAroundPIPDataCoordinatorImpl *)self _filteredHeadingReset];
    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:6];
  }
}

- (void)_handleMapViewRotateStart:(id)a3
{
  id v4 = a3;
  [v4 centerCoordinate];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [v4 presentationYaw];
  uint64_t v10 = v9;

  CLLocationDegrees v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218496;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MapView did start rotating at coordinate=(%g, %g), heading=%g", (uint8_t *)&v12, 0x20u);
  }

  self->_isRotatingMapView = 1;
  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:9];
}

- (void)_handleMapViewZoomStart:(id)a3
{
  id v4 = a3;
  [v4 centerCoordinate];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [v4 _zoomLevel];
  uint64_t v10 = v9;

  CLLocationDegrees v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218496;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MapView did start zooming at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v12, 0x20u);
  }

  self->_isZoomingMapView = 1;
}

- (void)_handleMapViewPanningIfNeeded:(id)a3
{
  id v10 = a3;
  if ([(LookAroundPIPDataCoordinatorImpl *)self isPanningMapView])
  {
    [v10 centerCoordinate];
    double v5 = v4;
    double longitude = self->_lastCoordinate.longitude;
    double v8 = vabdd_f64(self->_lastCoordinate.latitude, v7);
    self->_lastCoordinate.double latitude = v7;
    self->_lastCoordinate.double longitude = v5;
    if (v8 >= 0.00000000999999994 || vabdd_f64(longitude, v5) >= 0.00000000999999994)
    {
      GEOBearingFromCoordinateToCoordinate();
      -[LookAroundPIPDataCoordinatorImpl _filteredHeadingWithHeading:](self, "_filteredHeadingWithHeading:");
      self->_lookAroundViewHeading = v9;
      self->_lastHeading = v9;
      [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:7];
    }
  }
}

- (void)_handleMapViewRotatingIfNeeded:(id)a3
{
  if (self->_isRotatingMapView) {
    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:10];
  }
}

- (void)_handleMapViewPanStop:(id)a3 shouldMoveLookAroundView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(LookAroundPIPDataCoordinatorImpl *)self isPanningMapView])
  {
    [v6 centerCoordinate];
    CLLocationDegrees v8 = v7;
    CLLocationDegrees v10 = v9;
    double lastHeading = self->_lastHeading;
    int v12 = sub_1005764AC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      CLLocationDegrees v15 = v8;
      __int16 v16 = 2048;
      CLLocationDegrees v17 = v10;
      __int16 v18 = 2048;
      double v19 = lastHeading;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MapView did end panning at coordinate=(%g, %g), heading=%g", buf, 0x20u);
    }

    self->_isMapViewInSyncWithLookAroundView = 0;
    self->_lastCoordinate.double latitude = v8;
    self->_lastCoordinate.double longitude = v10;
    [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:8];
    if (v4 && [(LookAroundPIPDataCoordinatorImpl *)self isLookAroundDataAvailable])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100BE4AD4;
      v13[3] = &unk_10131AD50;
      v13[4] = self;
      *(double *)&v13[5] = lastHeading;
      [(LookAroundPIPDataCoordinatorImpl *)self _nearestMuninMarkerWithCompleteMarkerHandler:v13];
    }
    else
    {
      [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:2];
    }
  }
}

- (void)_handleMapViewRotateStop:(id)a3
{
  id v4 = a3;
  [v4 centerCoordinate];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [v4 presentationYaw];
  uint64_t v10 = v9;

  CLLocationDegrees v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218496;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MapView did end rotating at coordinate=(%g, %g), heading=%g", (uint8_t *)&v12, 0x20u);
  }

  self->_isRotatingMapView = 0;
  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:11];
}

- (void)_handleMapViewPinchWithZoomDirection:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = 21;
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v3 = 22;
  }
  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:v3];
}

- (void)_handleMapViewOneFingerPanWithZoomDirection:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = 17;
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v3 = 18;
  }
  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:v3];
}

- (void)_handleMapViewZoomStop:(id)a3 zoomGestureType:(int64_t)a4 zoomDirection:(int64_t)a5
{
  id v8 = a3;
  if (a4 == 2 && a5 == 1)
  {
    uint64_t v9 = self;
    uint64_t v10 = 19;
LABEL_7:
    [(LookAroundPIPDataCoordinatorImpl *)v9 _notifyObservers:v10];
    goto LABEL_8;
  }
  if (a4 == 3 && a5 == 2)
  {
    uint64_t v9 = self;
    uint64_t v10 = 20;
    goto LABEL_7;
  }
  if (a4 == 4)
  {
    [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewOneFingerPanWithZoomDirection:a5];
  }
  else if (a4 == 1)
  {
    [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPinchWithZoomDirection:a5];
  }
LABEL_8:
  [v8 centerCoordinate];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [v8 _zoomLevel];
  uint64_t v16 = v15;
  uint64_t v17 = sub_1005764AC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218496;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "MapView did end zooming at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v18, 0x20u);
  }

  self->_isZoomingMapView = 0;
  [(LookAroundPIPDataCoordinatorImpl *)self _moveLookAroundViewIfNeeded];
}

- (void)_handleMapViewTap:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = (MKMapView *)a3;
  if (self->_mapView == v7
    && self->_lookAroundView
    && [(LookAroundPIPStateMachine *)self->_stateMachine isActive])
  {
    if ([(LookAroundPIPStateMachine *)self->_stateMachine canSetStateTo:1])
    {
      [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:1];
      id v8 = sub_1005764AC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Did cancel pending move", (uint8_t *)&v14, 2u);
      }

      [(MKLookAroundView *)self->_lookAroundView cancelPendingMove];
    }
    -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView, x, y);
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = sub_1005764AC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218752;
      double v15 = x;
      __int16 v16 = 2048;
      double v17 = y;
      __int16 v18 = 2048;
      double v19 = v10;
      __int16 v20 = 2048;
      double v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "MapView did receive tap at point={%g, %g}, coordinate={%g, %g}", (uint8_t *)&v14, 0x2Au);
    }

    -[LookAroundPIPDataCoordinatorImpl _moveLookAroundViewToCoordinate:](self, "_moveLookAroundViewToCoordinate:", v10, v12);
  }
}

- (void)_handleMapView:(id)a3 didDidChangeLookAroundAvailability:(int64_t)a4
{
  id v6 = a3;
  [v6 centerCoordinate];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [v6 _zoomLevel];
  uint64_t v12 = v11;

  uint64_t v13 = sub_1005764AC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)a4 > 2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = (uint64_t)*(&off_10131ADE8 + a4);
    }
    int v15 = 138413058;
    uint64_t v16 = v14;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "MapView did change LookAround availability=%@ at coordinate=(%g, %g), zoomLevel=%g", (uint8_t *)&v15, 0x2Au);
  }

  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:3];
  [(LookAroundPIPDataCoordinatorImpl *)self _moveLookAroundViewIfNeeded];
}

- (void)_moveLookAroundViewIfNeeded
{
  if ([(LookAroundPIPDataCoordinatorImpl *)self isLookAroundDataAvailable]
    && ![(LookAroundPIPDataCoordinatorImpl *)self isPanningMapView]
    && !self->_isZoomingMapView
    && ![(LookAroundPIPDataCoordinatorImpl *)self isMapViewInSyncWithLookAroundView])
  {
    double lookAroundViewHeading = self->_lookAroundViewHeading;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100BE5128;
    v4[3] = &unk_10131AD50;
    v4[4] = self;
    *(double *)&v4[5] = lookAroundViewHeading;
    [(LookAroundPIPDataCoordinatorImpl *)self _nearestMuninMarkerWithCompleteMarkerHandler:v4];
  }
}

- (void)_moveLookAroundViewToCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  objc_initWeak(&location, self);
  [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPanStart:self->_mapView];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BE523C;
  v6[3] = &unk_10131AD78;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&latitude;
  v7[2] = *(id *)&longitude;
  v6[4] = self;
  -[LookAroundPIPDataCoordinatorImpl _getMuninMarkerAtCoordinate:shouldWait:andContinue:](self, "_getMuninMarkerAtCoordinate:shouldWait:andContinue:", 1, v6, latitude, longitude);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_moveLookAroundViewToMapItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(LookAroundPIPDataCoordinatorImpl *)self _handleMapViewPanStart:self->_mapView];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BE54A4;
  v6[3] = &unk_10131AD00;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LookAroundPIPDataCoordinatorImpl *)self _getMuninMarkerWithMapViewOrMapItem:v5 shouldWait:1 andContinue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleMapViewDidResumeIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = self->_stateMachine;
  if ([(LookAroundPIPStateMachine *)v5 canSetStateTo:7])
  {
    id v6 = [v4 camera];
    id v7 = [v6 copy];

    [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
    [v7 setCenterCoordinate:];
    [(LookAroundPIPStateMachine *)v5 setStateTo:7];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100BE56D4;
    v8[3] = &unk_1012E7D28;
    uint64_t v9 = v5;
    [v4 setCamera:v7 animated:1 completionHandler:v8];
  }
}

- (void)_refineLabelMarker:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_labelMarkerToRefine, a3);
  [v5 coordinate];
  double v7 = v6;
  [v5 coordinate];
  id v9 = [objc_alloc((Class)GEOMapItemIdentifier) initWithMUID:[v5 businessID] coordinate:v7 v8];
  id v10 = [objc_alloc((Class)MKMapItemIdentifier) initWithGEOMapItemIdentifier:v9];
  [(MKMapServiceTicket *)self->_refineTicket cancel];
  uint64_t v11 = +[MKMapService sharedService];
  id v21 = v10;
  uint64_t v12 = +[NSArray arrayWithObjects:&v21 count:1];
  uint64_t v13 = [v11 ticketForIdentifiers:v12 traits:0];
  refineTicket = self->_refineTicket;
  self->_refineTicket = v13;

  objc_initWeak(&location, self);
  int v15 = self->_refineTicket;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100BE58FC;
  v17[3] = &unk_1012E7418;
  objc_copyWeak(&v19, &location);
  id v16 = v5;
  id v18 = v16;
  [(MKMapServiceTicket *)v15 submitWithHandler:v17 networkActivity:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_notifyObservers:(unint64_t)a3
{
  id v5 = -[LookAroundPIPDataCoordinatorImpl _selectorForObserverEventType:](self, "_selectorForObserverEventType:");
  if (a3 > 0xC || ((1 << a3) & 0x1480) == 0)
  {
    double v6 = sub_1005764AC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v7 = NSStringFromSelector(v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Notifying observers with %@", buf, 0xCu);
    }
  }
  id v8 = [(NSHashTable *)self->_observers copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[LookAroundPIPDataCoordinatorImpl _dispatchSelector:toObserver:](self, "_dispatchSelector:toObserver:", v5, *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (SEL)_selectorForObserverEventType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      SEL result = "lookAroundPIPDataCoordinatorWillEnterLookArounPIP:";
      break;
    case 1uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:";
      break;
    case 2uLL:
      SEL result = "lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:";
      break;
    case 3uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:";
      break;
    case 4uLL:
      SEL result = "lookAroundPIPDataCoordinatorWillExitLookAroundPIP:";
      break;
    case 5uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidExitLookAroundPIP:";
      break;
    case 6uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidStartPanningMapView:";
      break;
    case 7uLL:
      SEL result = "lookAroundPIPDataCoordinatorIsPanningMapView:";
      break;
    case 8uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidEndPanningMapView:";
      break;
    case 9uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidStartRotatingMapView:";
      break;
    case 0xAuLL:
      SEL result = "lookAroundPIPDataCoordinatorIsRotatingMapView:";
      break;
    case 0xBuLL:
      SEL result = "lookAroundPIPDataCoordinatorDidEndRotatingMapView:";
      break;
    case 0xCuLL:
      SEL result = "lookAroundPIPDataCoordinatorDidPanLookAroundView:";
      break;
    case 0xDuLL:
      SEL result = "lookAroundPIPDataCoordinatorDidStartMovingLookAroundView:";
      break;
    case 0xEuLL:
      SEL result = "lookAroundPIPDataCoordinatorIsMovingLookAroundView:";
      break;
    case 0xFuLL:
      SEL result = "lookAroundPIPDataCoordinatorDidSynchronizeMapView:";
      break;
    case 0x10uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:";
      break;
    case 0x11uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidSingleFingerZoomInMapView:";
      break;
    case 0x12uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidSingleFingerZoomOutMapView:";
      break;
    case 0x13uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidDoubleTapZoomInMapView:";
      break;
    case 0x14uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidDoubleTapZoomOutMapView:";
      break;
    case 0x15uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidPinchZoomInMapView:";
      break;
    case 0x16uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidPinchZoomOutMapView:";
      break;
    case 0x17uLL:
      SEL result = "lookAroundPIPDataCoordinatorDidSelectMapItem:";
      break;
    default:
      SEL result = 0;
      break;
  }
  return result;
}

- (void)_dispatchSelector:(SEL)a3 toObserver:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    ((void (*)(id, SEL, LookAroundPIPDataCoordinatorImpl *, MKMapView *))[v6 methodForSelector:a3])(v6, a3, self, self->_mapView);
  }
}

- (void)_startMovingLookAroundViewToMapItem:(id)a3 orMuninMarker:(id)a4 heading:(double)a5 shouldZoom:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self->_stateMachine;
  if (![(LookAroundPIPStateMachine *)v12 canSetStateTo:3]) {
    goto LABEL_13;
  }
  [(LookAroundPIPStateMachine *)v12 setStateTo:3];
  [v11 coordinate];
  CLLocationDegrees v14 = v13;
  [v11 coordinate];
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v14, v15);
  long long v17 = sub_1005764AC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(CLLocationDegrees *)&uint8_t buf[4] = v16.latitude;
    *(_WORD *)&buf[12] = 2048;
    *(CLLocationDegrees *)&buf[14] = v16.longitude;
    *(_WORD *)&buf[22] = 2048;
    double v46 = a5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "LookAroundView started moving to coordinate=(%g, %g), heading=%g", buf, 0x20u);
  }

  id v18 = self->_mapView;
  id v19 = self->_lookAroundView;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v46) = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  objc_initWeak(&location, self);
  [(MKLookAroundView *)self->_lookAroundView setUserInteractionEnabled:0];
  lookAroundView = self->_lookAroundView;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100BE6394;
  v28[3] = &unk_10131ADC8;
  v28[4] = self;
  v30 = buf;
  v31 = &v35;
  id v21 = v19;
  __int16 v29 = v21;
  objc_copyWeak(&v32, &location);
  BOOL v33 = a6;
  unsigned int v22 = [(MKLookAroundView *)lookAroundView moveToMapItem:v10 wantsCloseUpView:1 orMuninMarker:v11 withHeading:v28 completionHandler:a5];
  char v23 = v22;
  if (!v22) {
    goto LABEL_12;
  }
  os_unfair_lock_lock(&self->_lock);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    int v24 = *((unsigned __int8 *)v36 + 24);
    os_unfair_lock_unlock(&self->_lock);
    if (!v24) {
      goto LABEL_12;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  __int16 v25 = sub_1005764AC();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v39 = 134218496;
    CLLocationDegrees latitude = v16.latitude;
    __int16 v41 = 2048;
    CLLocationDegrees longitude = v16.longitude;
    __int16 v43 = 2048;
    double v44 = a5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "MapView synchronizing with muninMarker at coordinate=(%g, %g), heading=%g", v39, 0x20u);
  }

  uint64_t v26 = [(MKMapView *)v18 camera];
  id v27 = [v26 copy];

  [v27 setCenterCoordinate:v16.latitude, v16.longitude];
  [(LookAroundPIPDataCoordinatorImpl *)self setLookAroundViewHeading:a5];
  [(MKMapView *)v18 setCamera:v27 animated:1];
  [(LookAroundPIPDataCoordinatorImpl *)self _notifyObservers:15];

LABEL_12:
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  if ((v23 & 1) == 0) {
LABEL_13:
  }
    [(LookAroundPIPDataCoordinatorImpl *)self _willEndMovingLookAroundView:0 shouldZoomIfFinished:0];
}

- (void)_willEndMovingLookAroundView:(BOOL)a3 shouldZoomIfFinished:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(MKMapView *)self->_mapView centerCoordinate];
  id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:v7 longitude:v8];
  [(MKLookAroundView *)self->_lookAroundView centerCoordinate];
  double v11 = v10;
  double v13 = v12;
  id v14 = [objc_alloc((Class)CLLocation) initWithLatitude:v10 longitude:v12];
  [v9 distanceFromLocation:v14];
  double v16 = v15;
  unsigned int v17 = 0;
  self->_BOOL isMapViewInSyncWithLookAroundView = v15 < 10.0;
  if (!v5 && v15 < 500.0) {
    unsigned int v17 = [(LookAroundPIPStateMachine *)self->_stateMachine isMoving];
  }
  unsigned int v18 = 0;
  if (v5 && v4) {
    unsigned int v18 = [(LookAroundPIPStateMachine *)self->_stateMachine isActive];
  }
  id v19 = sub_1005764AC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    BOOL isMapViewInSyncWithLookAroundView = self->_isMapViewInSyncWithLookAroundView;
    CFStringRef v21 = @"NO";
    *(_DWORD *)v30 = 134219266;
    if (v5) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    *(double *)&v30[4] = v11;
    if (isMapViewInSyncWithLookAroundView) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    if (v17) {
      CFStringRef v21 = @"YES";
    }
    *(_WORD *)&v30[12] = 2048;
    *(double *)&v30[14] = v13;
    __int16 v31 = 2048;
    double v32 = v16;
    __int16 v33 = 2112;
    CFStringRef v34 = v22;
    __int16 v35 = 2112;
    CFStringRef v36 = v23;
    __int16 v37 = 2112;
    CFStringRef v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "LookAroundView will end moving to coordinate=(%g, %g), distance=%g, finished=%@, isMapViewInSyncWithLookAroundView=%@, shouldSnapBack=%@", v30, 0x3Eu);
  }

  if (v17)
  {
    double lastHeading = self->_lastHeading;
    __int16 v25 = [(MKMapView *)self->_mapView camera];
    id v26 = [v25 copy];

    [v26 setCenterCoordinate:v11, v13];
    [(MKMapView *)self->_mapView setCamera:v26 animated:1];
    [(LookAroundPIPDataCoordinatorImpl *)self setIsMapViewInSyncWithLookAroundView:1];
    id v27 = [(LookAroundPIPDataCoordinatorImpl *)self lookAroundView];
    [v27 setPresentationYaw:lastHeading];

LABEL_23:
    goto LABEL_24;
  }
  if (v18)
  {
    uint64_t v28 = [(MKMapView *)self->_mapView camera];
    id v26 = [v28 copy];

    [v26 centerCoordinateDistance];
    if (v29 < 950.0) {
      [v26 centerCoordinateDistance];
    }
    [v26 setCenterCoordinateDistance:*(_OWORD *)v30];
    [(MKMapView *)self->_mapView setCamera:v26 animated:1];
    goto LABEL_23;
  }
LABEL_24:
  -[LookAroundPIPDataCoordinatorImpl _didEndMovingLookAroundView:](self, "_didEndMovingLookAroundView:", v5, *(void *)v30);
}

- (void)_didEndMovingLookAroundView:(BOOL)a3
{
  BOOL v3 = a3;
  [(MKMapView *)self->_mapView centerCoordinate];
  CLLocationDegrees v6 = v5;
  CLLocationDegrees v8 = v7;
  [(MKLookAroundView *)self->_lookAroundView presentationYaw];
  double v10 = v9;
  double v11 = sub_1005764AC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v12 = @"NO";
    BOOL isMapViewInSyncWithLookAroundView = self->_isMapViewInSyncWithLookAroundView;
    *(_DWORD *)double v15 = 134219010;
    if (v3) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    *(CLLocationDegrees *)&v15[4] = v6;
    *(_WORD *)&v15[12] = 2048;
    if (isMapViewInSyncWithLookAroundView) {
      CFStringRef v12 = @"YES";
    }
    *(CLLocationDegrees *)&v15[14] = v8;
    __int16 v16 = 2048;
    double v17 = v10;
    __int16 v18 = 2112;
    CFStringRef v19 = v14;
    __int16 v20 = 2112;
    CFStringRef v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "LookAroundView did end moving to coordinate=(%g, %g), heading=%g, finished=%@, isMapViewInSyncWithLookAroundView=%@", v15, 0x34u);
  }

  if (![(LookAroundPIPStateMachine *)self->_stateMachine isCancellingPendingMove]) {
    [(LookAroundPIPStateMachine *)self->_stateMachine setStateTo:2];
  }
  self->_lastCoordinate.CLLocationDegrees latitude = v6;
  self->_lastCoordinate.CLLocationDegrees longitude = v8;
  self->_double lookAroundViewHeading = v10;
  self->_double lastHeading = v10;
  -[LookAroundPIPDataCoordinatorImpl _notifyObservers:](self, "_notifyObservers:", 16, *(_OWORD *)v15);
}

- (void)_nearestMuninMarkerWithCompleteMarkerHandler:(id)a3
{
  id v10 = a3;
  [(MKMapView *)self->_mapView centerCoordinate];
  double v5 = v4;
  [(MKMapView *)self->_mapView centerCoordinate];
  double v7 = v6;
  CLLocationDegrees v8 = [(MKMapView *)self->_mapView _mapLayer];
  id v9 = [v8 muninMarkerAtCoordinate:v10 completeMarkerHandler:v5, v7];
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (VKLabelMarker)labelMarkerToRefine
{
  return self->_labelMarkerToRefine;
}

- (void)setLabelMarkerToRefine:(id)a3
{
}

- (MKMapServiceTicket)refineTicket
{
  return self->_refineTicket;
}

- (void)setRefineTicket:(id)a3
{
}

- (NSObject)mapViewDidChangeLookAroundAvailabilityObserver
{
  return self->_mapViewDidChangeLookAroundAvailabilityObserver;
}

- (void)setMapViewDidChangeLookAroundAvailabilityObserver:(id)a3
{
}

- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver
{
  return self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3
{
}

- (LookAroundPIPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (BOOL)isMapViewInSyncWithLookAroundView
{
  return self->_isMapViewInSyncWithLookAroundView;
}

- (void)setIsMapViewInSyncWithLookAroundView:(BOOL)a3
{
  self->_BOOL isMapViewInSyncWithLookAroundView = a3;
}

- (BOOL)isRotatingMapView
{
  return self->_isRotatingMapView;
}

- (void)setIsRotatingMapView:(BOOL)a3
{
  self->_isRotatingMapView = a3;
}

- (BOOL)isZoomingMapView
{
  return self->_isZoomingMapView;
}

- (void)setIsZoomingMapView:(BOOL)a3
{
  self->_isZoomingMapView = a3;
}

- (BOOL)isMapViewUserInteractionStarted
{
  return self->_isMapViewUserInteractionStarted;
}

- (void)setIsMapViewUserInteractionStarted:(BOOL)a3
{
  self->_isMapViewUserInteractionStarted = a3;
}

- (BOOL)isLookAroundViewUserInteractionStarted
{
  return self->_isLookAroundViewUserInteractionStarted;
}

- (void)setIsLookAroundViewUserInteractionStarted:(BOOL)a3
{
  self->_isLookAroundViewUserInteractionStarted = a3;
}

- (double)lookAroundViewHeading
{
  return self->_lookAroundViewHeading;
}

- (void)setLookAroundViewHeading:(double)a3
{
  self->_double lookAroundViewHeading = a3;
}

- (CLLocationCoordinate2D)lastCoordinate
{
  double latitude = self->_lastCoordinate.latitude;
  double longitude = self->_lastCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLastCoordinate:(CLLocationCoordinate2D)a3
{
  self->_lastCoordinate = a3;
}

- (double)lastHeading
{
  return self->_lastHeading;
}

- (void)setLastHeading:(double)a3
{
  self->_double lastHeading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_mapViewDidChangeLookAroundAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_refineTicket, 0);
  objc_storeStrong((id *)&self->_labelMarkerToRefine, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end