@interface OfflineRegionSelectorContext
- (AutocompletePOIMapDownloadHandler)downloadDelegate;
- (BOOL)downloadSelectedOfflineRegion;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)shouldUseSessionlessAnalytics;
- (BOOL)wantsRouteAnnotationsControl;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)route;
- (OfflineRegionSelectorContext)initWithRegion:(id)a3 name:(id)a4;
- (OfflineRegionSelectorContext)initWithSubscriptionInfo:(id)a3;
- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration;
- (id)desiredCards;
- (id)dismissalBlock;
- (id)postDismissalBlock;
- (void)_commonInit;
- (void)_restoreMapView;
- (void)_saveMapViewConfiguration;
- (void)_setMapRegion:(id)a3 animated:(BOOL)a4;
- (void)_setMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setupMapView;
- (void)_updateZoomRange;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)didAdjustSelectedRegion;
- (void)didAdjustSelectorCropHandle;
- (void)dismiss;
- (void)mapInsetsDidChangeAnimated:(BOOL)a3;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setDownloadDelegate:(id)a3;
- (void)setPostDismissalBlock:(id)a3;
- (void)setRoute:(id)a3;
- (void)setShouldUseSessionlessAnalytics:(BOOL)a3;
- (void)willAdjustSelectedRegion;
@end

@implementation OfflineRegionSelectorContext

- (OfflineRegionSelectorContext)initWithRegion:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OfflineRegionSelectorContext;
  v9 = [(OfflineRegionSelectorContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapRegion, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
    [(OfflineRegionSelectorContext *)v10 _commonInit];
  }

  return v10;
}

- (OfflineRegionSelectorContext)initWithSubscriptionInfo:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OfflineRegionSelectorContext;
  v6 = [(OfflineRegionSelectorContext *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    id v8 = [v5 subscription];
    uint64_t v9 = [v8 region];
    mapRegion = v7->_mapRegion;
    v7->_mapRegion = (GEOMapRegion *)v9;

    [(OfflineRegionSelectorContext *)v7 _commonInit];
  }

  return v7;
}

- (void)_commonInit
{
  v3 = objc_alloc_init(OfflineRegionSelectorViewController);
  offlineRegionSelectorViewController = self->_offlineRegionSelectorViewController;
  self->_offlineRegionSelectorViewController = v3;

  [(OfflineRegionSelectorViewController *)self->_offlineRegionSelectorViewController setDelegate:self];
  id v5 = [[OfflineRegionSelectorOverlay alloc] initWithRegion:self->_mapRegion];
  overlay = self->_overlay;
  self->_overlay = v5;

  id v7 = self->_overlay;

  [(OfflineRegionSelectorOverlay *)v7 setRegionSelectorDelegate:self];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10079D0A8;
  v10[3] = &unk_1012E6708;
  objc_copyWeak(&v11, &location);
  [v7 addPreparation:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10079D0EC;
  v8[3] = &unk_1012E6998;
  objc_copyWeak(&v9, &location);
  [v7 addCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 nextTopContext];
  objc_opt_class();
  self->_aboutToBecomeBaseMode = objc_opt_isKindOfClass() & 1;
  [(GEOCancellable *)self->_currentSizeEstimationRequest cancel];
  currentSizeEstimationRequest = self->_currentSizeEstimationRequest;
  self->_currentSizeEstimationRequest = 0;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10079D2C0;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, &location);
  [v7 addPreparation:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10079D340;
  v10[3] = &unk_1012E7D28;
  void v10[4] = self;
  [v7 addCompletion:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)setChromeViewController:(id)a3
{
  p_chromeViewController = &self->_chromeViewController;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_chromeViewController, v6);
  [(OfflineRegionSelectorOverlay *)self->_overlay setMapViewProvider:v6];
}

- (id)desiredCards
{
  v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_offlineRegionSelectorViewController) {
    [v3 addObject:];
  }

  return v4;
}

- (BOOL)shouldResetStateAfterResigning
{
  return self->_didDownloadRegion && !self->_aboutToBecomeBaseMode;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  BOOL changedRegion = self->_changedRegion;
  id v5 = [(OfflineRegionSelectorOverlay *)self->_overlay currentMapRegion];
  [(OfflineRegionSelectorContext *)self _setMapRegion:v5 animated:0];
  [(OfflineRegionSelectorOverlay *)self->_overlay setMapRegion:v5];
  [(OfflineRegionSelectorContext *)self _updateZoomRange];
  self->_BOOL changedRegion = changedRegion;
}

- (BOOL)wantsRouteAnnotationsControl
{
  v2 = [(OfflineRegionSelectorContext *)self route];
  BOOL v3 = v2 != 0;

  return v3;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  BOOL v3 = [(OfflineRegionSelectorContext *)self route];

  if (v3)
  {
    v4 = [RouteAnnotationsMutableConfiguration alloc];
    id v5 = [(OfflineRegionSelectorContext *)self route];
    id v6 = [(RouteAnnotationsConfiguration *)v4 initWithRoute:v5];

    [(RouteAnnotationsConfiguration *)v6 setRouteTrafficFeaturesActive:0];
    id v7 = [(RouteAnnotationsMutableConfiguration *)v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return (RouteAnnotationsConfiguration *)v7;
}

- (void)dismiss
{
  BOOL v3 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  unsigned int v4 = [v3 isCurrentContext:self];

  id v5 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  id v6 = v5;
  if (v4)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10079D798;
    v14[3] = &unk_1012E5D08;
    v14[4] = self;
    [v5 popContextAnimated:1 completion:v14];

    id v7 = [(OfflineRegionSelectorContext *)self dismissalBlock];

    if (v7)
    {
      if (self->_didDownloadRegion) {
        downloadedMapRegion = self->_downloadedMapRegion;
      }
      else {
        downloadedMapRegion = 0;
      }
      id v11 = downloadedMapRegion;
      id v12 = [(OfflineRegionSelectorContext *)self dismissalBlock];
      ((void (**)(void, GEOMapRegion *))v12)[2](v12, v11);
    }
  }
  else
  {
    id v9 = [v5 contexts];
    id v13 = [v9 mutableCopy];

    [v13 removeObject:self];
    v10 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
    [v10 setContexts:v13 animated:0 completion:0];
  }
}

- (void)_saveMapViewConfiguration
{
  BOOL v3 = [(OfflineRegionSelectorContext *)self chromeViewController];
  id v7 = [v3 mapView];

  unsigned int v4 = [[MapViewRestoreProperties alloc] initFromMapView:v7];
  savedMapViewProperties = self->_savedMapViewProperties;
  self->_savedMapViewProperties = v4;

  id v6 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  self->_savedViewMode = (int64_t)[v6 displayedViewMode];
}

- (void)_setupMapView
{
  BOOL v3 = [(OfflineRegionSelectorContext *)self chromeViewController];
  id v16 = [v3 mapView];

  unsigned int v4 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  id v5 = [v4 acquireModernMapTokenForReason:4];
  id offlineMapPreviewModernMapToken = self->_offlineMapPreviewModernMapToken;
  self->_id offlineMapPreviewModernMapToken = v5;

  id v7 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  if ([v7 displayedViewMode])
  {
    id v8 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
    id v9 = [v8 displayedViewMode];

    if (v9 == (id)3) {
      goto LABEL_5;
    }
    id v7 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
    [v7 updateViewMode:0 animated:0];
  }

LABEL_5:
  [v16 setRotateEnabled:0];
  [v16 setPitchEnabled:0];
  [v16 _setOfflineRegionVisibility:1];
  v10 = [v16 _mapLayer];
  [v10 setOfflineRegionSelector:1];

  [(OfflineRegionSelectorContext *)self _updateZoomRange];
  [(OfflineRegionSelectorContext *)self _setMapRegion:self->_mapRegion animated:0];
  id v11 = [(OfflineRegionSelectorContext *)self chromeViewController];
  id v12 = [v11 overlayController];
  overlay = self->_overlay;
  v14 = [(OfflineRegionSelectorContext *)self chromeViewController];
  v15 = [v14 viewportLayoutGuide];
  [v12 addOverlay:overlay inLayoutGuide:v15];
}

- (void)_updateZoomRange
{
  v2 = [(OfflineRegionSelectorContext *)self chromeViewController];
  id v16 = [v2 mapView];

  [v16 bounds];
  double v4 = v3;
  double v6 = v5;
  [v16 _edgeInsets];
  double v11 = 3052640.66;
  if (v4 - (v9 + v10) > 0.0 && v6 - (v7 + v8) > 0.0 && GEOConfigGetBOOL())
  {
    GEOConfigGetDouble();
    CLLocationCoordinate2DMake(0.0, 0.0);
    MKMapRectMakeWithRadialDistance();
    _MKMapRectThatFits();
    id v12 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", 0x4041800000000000, 0x4041800000000000, 0x4041800000000000, 0x4041800000000000);
    [v12 centerCoordinateDistance];
    double v11 = 95394.9663;
    if (v13 > 95394.9663)
    {
      [v12 centerCoordinateDistance];
      double v11 = v14;
    }
  }
  id v15 = [objc_alloc((Class)MKMapCameraZoomRange) initWithMinCenterCoordinateDistance:95394.9663 maxCenterCoordinateDistance:v11];
  [v15 _setBouncesZoom:1];
  [v16 setCameraZoomRange:v15];
}

- (void)_setMapRegion:(id)a3 animated:(BOOL)a4
{
}

- (void)_setMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  double v9 = [(OfflineRegionSelectorContext *)self chromeViewController];
  double v10 = [v9 mapView];

  GEOMapRectForMapRegion();
  [v10 mapRectThatFits:];
  [v10 _setVisibleMapRect:v6 animated:v8];
}

- (void)_restoreMapView
{
  id offlineMapPreviewModernMapToken = self->_offlineMapPreviewModernMapToken;
  self->_id offlineMapPreviewModernMapToken = 0;

  double v4 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
  id v5 = [v4 displayedViewMode];
  int64_t savedViewMode = self->_savedViewMode;

  if (v5 != (id)savedViewMode)
  {
    double v7 = [(OfflineRegionSelectorContext *)self iosChromeViewController];
    [v7 updateViewMode:self->_savedViewMode animated:0];
  }
  id v8 = [(OfflineRegionSelectorContext *)self chromeViewController];
  id v10 = [v8 mapView];

  double v9 = [v10 _mapLayer];
  [v9 setOfflineRegionSelector:0];

  [(MapViewRestoreProperties *)self->_savedMapViewProperties applyToMapView:v10 animated:0];
}

- (BOOL)downloadSelectedOfflineRegion
{
  if ([(OfflineRegionSelectorContext *)self shouldUseSessionlessAnalytics]) {
    uint64_t v3 = 368;
  }
  else {
    uint64_t v3 = 372;
  }
  if (MapsFeature_IsEnabled_StandaloneWatchOffline()
    && GEOConfigGetBOOL()
    && (+[NRPairedDeviceRegistry sharedInstance],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 getActivePairedDeviceExcludingAltAccount],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"];
    unsigned int v7 = [v5 supportsCapability:v6];

    if (v7) {
      CFStringRef v8 = @"watch pending";
    }
    else {
      CFStringRef v8 = 0;
    }
  }
  else
  {
    CFStringRef v8 = 0;
  }
  +[GEOAPPortal captureUserAction:v3 target:89 value:v8];
  if (self->_determinedSupportForCurrentRegion)
  {
    double v9 = +[MapsOfflineUIHelper sharedHelper];
    id v10 = [v9 alertControllerForInsufficientDiskSpaceForDownloadSize:self->_estimatedSizeInBytes];

    BOOL v11 = v10 == 0;
    if (v10)
    {
      id v12 = sub_1000493C0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int64_t estimatedSizeInBytes = self->_estimatedSizeInBytes;
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = estimatedSizeInBytes;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Displaying insufficient disk space alert for attempted download of %{bytes}llu", (uint8_t *)&buf, 0xCu);
      }

      double v14 = [(OfflineRegionSelectorContext *)self chromeViewController];
      [v14 _maps_topMostPresentViewController:v10 animated:1 completion:0];

      goto LABEL_45;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    v18 = [(OfflineRegionSelectorOverlay *)self->_overlay currentMapRegion];
    objc_initWeak(&location, self);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10079E4F8;
    v73[3] = &unk_1012F8618;
    v60 = &v76;
    objc_copyWeak(&v76, &location);
    p_long long buf = &buf;
    id v19 = v18;
    id v74 = v19;
    v20 = objc_retainBlock(v73);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10079E678;
    v70[3] = &unk_1012F8668;
    v70[4] = self;
    id v21 = v19;
    id v71 = v21;
    v22 = v20;
    id v72 = v22;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10079E82C;
    v67[3] = &unk_1012F86B8;
    v67[4] = self;
    v23 = objc_retainBlock(v70);
    id v68 = v23;
    v69 = &buf;
    v24 = objc_retainBlock(v67);
    if (self->_subscriptionInfo)
    {
      ((void (*)(void *, NSString *))v23[2])(v23, self->_displayName);
LABEL_44:

      objc_destroyWeak(v60);
      objc_destroyWeak(&location);

      _Block_object_dispose(&buf, 8);
LABEL_45:

      return v11;
    }
    BOOL v25 = [(NSString *)self->_displayName length] != 0;
    if (self->_changedRegion)
    {
      id v26 = v21;
      GEOMapRectForMapRegion();
      double rect1 = v27;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;

      v34 = self->_mapRegion;
      GEOMapRectForMapRegion();
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;

      v81.origin.x = v29;
      v81.origin.y = v31;
      v81.size.double width = rect1;
      v81.size.double height = v33;
      v83.origin.x = v36;
      v83.origin.y = v38;
      v83.size.double width = v40;
      v83.size.double height = v42;
      MKMapRect v82 = MKMapRectIntersection(v81, v83);
      double width = v82.size.width;
      double height = v82.size.height;
      if (v82.origin.x == MKMapRectNull.origin.x && v82.origin.y == MKMapRectNull.origin.y)
      {
LABEL_27:
        v45 = sub_1000493C0();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v66 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Region changed significantly. Attempting to fetch a new suggested region name", v66, 2u);
        }
        BOOL v25 = 0;
        goto LABEL_40;
      }
      BOOL v25 = 0;
      double v46 = rect1 * v33;
      if (v46 > 0.0)
      {
        double v47 = v40 * v42;
        if (v47 > 0.0)
        {
          GEOConfigGetDouble();
          double v49 = width * height / v47;
          if (width * height / v46 < v49) {
            double v49 = width * height / v46;
          }
          if (v49 < 1.0 - v48) {
            goto LABEL_27;
          }
          BOOL v25 = 0;
        }
      }
    }
    if ([(NSString *)self->_displayName length])
    {
      ((void (*)(void *, NSString *))v24[2])(v24, self->_displayName);
      goto LABEL_44;
    }
    v45 = sub_1000493C0();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Region had no original display name. Attempting to fetch a suggested region name", v66, 2u);
    }
LABEL_40:

    if ([(NSString *)self->_displayName length]) {
      displayName = self->_displayName;
    }
    else {
      displayName = 0;
    }
    v51 = displayName;
    v52 = +[GEOMapService sharedService];
    v53 = [v52 ticketForOfflineRegionNameSuggestionWithRegion:v21 traits:0];

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10079E9D0;
    v61[3] = &unk_1012F86E0;
    BOOL v65 = v25;
    v54 = v51;
    v62 = v54;
    id v63 = v21;
    v64 = v24;
    GEOConfigGetDouble();
    uint64_t v56 = (uint64_t)v55;
    id v57 = &_dispatch_main_q;
    [v53 submitWithHandler:v61 timeout:v56 networkActivity:0 queue:&_dispatch_main_q];

    goto LABEL_44;
  }
  id v15 = sub_1000493C0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can not download region until size/support has been determined", (uint8_t *)&buf, 2u);
  }

  if ((id)[(OfflineRegionSelectorViewController *)self->_offlineRegionSelectorViewController state] == (id)1)
  {
    updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
    if (updateRegionSizeTimeoutTimer)
    {
      [(GCDTimer *)updateRegionSizeTimeoutTimer invalidate];
      v17 = self->_updateRegionSizeTimeoutTimer;
      self->_updateRegionSizeTimeoutTimer = 0;

      [(OfflineRegionSelectorViewController *)self->_offlineRegionSelectorViewController setState:0];
    }
  }
  return 0;
}

- (void)willAdjustSelectedRegion
{
  *(_WORD *)&self->_BOOL changedRegion = 1;
  [(GCDTimer *)self->_updateRegionSizeTimeoutTimer invalidate];
  updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
  self->_updateRegionSizeTimeoutTimer = 0;
}

- (void)didAdjustSelectedRegion
{
  uint64_t v3 = self->_mapRegion;
  double v4 = [(OfflineRegionSelectorOverlay *)self->_overlay host];

  if (v4)
  {
    uint64_t v5 = [(OfflineRegionSelectorOverlay *)self->_overlay currentMapRegion];

    uint64_t v3 = (GEOMapRegion *)v5;
  }
  id v6 = (void *)(self->_regionSizeCheckGeneration + 1);
  self->_regionSizeCheckGeneration = (unint64_t)v6;
  [(GEOCancellable *)self->_currentSizeEstimationRequest cancel];
  objc_initWeak(&location, self);
  unsigned int v7 = +[MapsOfflineUIHelper sharedHelper];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10079EEA4;
  v17[3] = &unk_1012F8708;
  objc_copyWeak(v18, &location);
  v18[1] = v6;
  v17[4] = self;
  CFStringRef v8 = [v7 determineEstimatedSizeForSubscriptionWithRegion:v3 completionHandler:v17];
  currentSizeEstimationRequest = self->_currentSizeEstimationRequest;
  self->_currentSizeEstimationRequest = v8;

  GEOConfigGetDouble();
  double v11 = v10;
  if (v10 > 0.0)
  {
    id v12 = &_dispatch_main_q;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10079EFC8;
    v15[3] = &unk_1012F8730;
    objc_copyWeak(v16, &location);
    v16[1] = v6;
    v16[2] = *(id *)&v11;
    double v13 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v15 block:v11];
    updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
    self->_updateRegionSizeTimeoutTimer = v13;

    objc_destroyWeak(v16);
  }
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (void)didAdjustSelectorCropHandle
{
  if ([(OfflineRegionSelectorViewController *)self->_offlineRegionSelectorViewController downloadable]) {
    CFStringRef v2 = @"YES";
  }
  else {
    CFStringRef v2 = @"NO";
  }

  +[GEOAPPortal captureUserAction:386 target:89 value:v2];
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  unsigned int v9 = [(OfflineRegionSelectorViewController *)self->_offlineRegionSelectorViewController downloadable];
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v10 = 386;
  }
  else
  {
    uint64_t v10 = 377;
  }
  if (v9) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }

  +[GEOAPPortal captureUserAction:v10 target:89 value:v11];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (AutocompletePOIMapDownloadHandler)downloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadDelegate);

  return (AutocompletePOIMapDownloadHandler *)WeakRetained;
}

- (void)setDownloadDelegate:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (id)postDismissalBlock
{
  return self->_postDismissalBlock;
}

- (void)setPostDismissalBlock:(id)a3
{
}

- (BOOL)shouldUseSessionlessAnalytics
{
  return self->_shouldUseSessionlessAnalytics;
}

- (void)setShouldUseSessionlessAnalytics:(BOOL)a3
{
  self->_shouldUseSessionlessAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postDismissalBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_downloadDelegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_currentSizeEstimationRequest, 0);
  objc_storeStrong(&self->_offlineMapPreviewModernMapToken, 0);
  objc_storeStrong((id *)&self->_savedMapViewProperties, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_updateRegionSizeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_downloadedMapRegion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_overlay, 0);

  objc_storeStrong((id *)&self->_offlineRegionSelectorViewController, 0);
}

@end