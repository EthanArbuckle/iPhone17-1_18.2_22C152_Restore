@interface MapCameraController
- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 includePadding:(BOOL)a5;
- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRouteLines:(id)a3 includePadding:(BOOL)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 startPOIShape:(id)a5 endPOIShapes:(id)a6;
- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5;
- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectFromLocation:(id)a3 alongRoute:(id)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForTripFromLocation:(id)a3 alongRoute:(id)a4;
- (BOOL)_frameVenueLabelMarker:(id)a3 completion:(id)a4;
- (BOOL)_mapViewFitsLabelMarker:(id)a3 withEdgeInsets:(UIEdgeInsets)a4;
- (BOOL)searchResultIsVenueOrBuilding:(id)a3;
- (MKMapView)mapView;
- (MapCameraController)initWithMapView:(id)a3;
- (UIEdgeInsets)_insetsByAddingCompassPaddingToInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)_insetsForPin;
- (double)_maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:(id)a3;
- (id)_poiShapeAnchorPointMarkersFromRoute:(id)a3;
- (id)_poiShapeWaypointMarkersFromRoute:(id)a3;
- (void)_frameMapRect:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)_frameNotVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5;
- (void)_frameSearchResult:(id)a3 minZoom:(id)a4 maxZoom:(id)a5 completion:(id)a6;
- (void)_frameVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5;
- (void)_notifyObserversWillChangeVisibleRect;
- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 duration:(double)a4 completion:(id)a5;
- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5;
- (void)_setMapCamera:(id)a3 duration:(double)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)addObserver:(id)a3;
- (void)displayMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)displayTransitRoute:(id)a3 boardingStopCoord:(id)a4 boardingStopIndex:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)frameApproximateRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)frameLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 minZoom:(id)a5 maxZoom:(id)a6 completion:(id)a7;
- (void)frameMapItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)frameMapRect:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)frameSearchResults:(id)a3 withResultToSelect:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10;
- (void)removeObserver:(id)a3;
- (void)restoreRegionForMapSelectionForLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5;
- (void)restoreRegionForMapSelectionWithCamera:(id)a3 completion:(id)a4;
- (void)setMapView:(id)a3;
@end

@implementation MapCameraController

- (MapCameraController)initWithMapView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapCameraController;
  v5 = [(MapCameraController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = v6;
  }

  return v6;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  v12 = (void (**)(id, uint64_t))a7;
  [(MapCameraController *)self _mapRectForRoutes:a3 includeCompassInset:v9 waypoints:v8];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  -[MapCameraController _maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:](self, "_maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:");
  double v22 = v21;
  if (v21 <= 10.0)
  {
    v23 = sub_1006C49AC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v14, *(void *)&v16];
      v25 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v18, *(void *)&v20];
      v26 = +[NSString stringWithFormat:@"{%@, %@}", v24, v25];

      id v27 = v26;
      v28 = [(MapCameraController *)self mapView];
      [v28 visibleMapRect];
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      v35 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v33, v34];
      v36 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v30, v32];
      v37 = +[NSString stringWithFormat:@"{%@, %@}", v35, v36];

      *(_DWORD *)buf = 138413058;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v37;
      __int16 v42 = 2048;
      double v43 = v22;
      __int16 v44 = 2048;
      uint64_t v45 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "not framing routes, target map rect %@ not different enough from current map rect %@ (%#.1lf <= %#.1lf)", buf, 0x2Au);
    }
    if (v12) {
      v12[2](v12, 1);
    }
  }
  else
  {
    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v7, v12, v14, v16, v18, v20);
  }
}

- (void)frameApproximateRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (v10 || [v11 count])
  {
    [(MapCameraController *)self mapRectApproximatingRouteFromStartPOIShape:v10 toEndPOIShapes:v11];
    double v14 = v13;
    double v47 = v13;
    double v48 = v15;
    double v17 = v16;
    double v18 = v15;
    double v20 = v19;
    double v21 = [(MapCameraController *)self mapView];
    [v21 visibleMapRect];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    uint64_t v30 = [(MapCameraController *)self mapView];
    [v30 _zoomLevelForMapRect:0 includeAccessoryPadding:v14, v17, v18, v20];
    MKZoomScaleForZoomLevelF();
    double v32 = v31;

    uint64_t v33 = [(MapCameraController *)self mapView];
    [v33 _zoomLevelForMapRect:0 includeAccessoryPadding:v23, v25, v27, v29];
    MKZoomScaleForZoomLevelF();
    double v35 = v34;

    if (v32 <= v35) {
      double v36 = v35;
    }
    else {
      double v36 = v32;
    }
    double v37 = fmax(fmax(fmax(vabdd_f64(v47, v23), vabdd_f64(v17, v25)), vabdd_f64(v47 + v48, v23 + v27)), vabdd_f64(v17 + v20, v25 + v29))* v36;
    if (v37 <= 20.0)
    {
      v38 = sub_1006C49AC();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v47, *(void *)&v17];
        __int16 v40 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v48, *(void *)&v20];
        v41 = +[NSString stringWithFormat:@"{%@, %@}", v39, v40];

        id v42 = v41;
        double v43 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v23, *(void *)&v25];
        __int16 v44 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v27, *(void *)&v29];
        uint64_t v45 = +[NSString stringWithFormat:@"{%@, %@}", v43, v44];

        *(_DWORD *)buf = 138413058;
        v50 = v41;
        __int16 v51 = 2112;
        v52 = v45;
        __int16 v53 = 2048;
        double v54 = v37;
        __int16 v55 = 2048;
        uint64_t v56 = 0x4034000000000000;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "not framing approx route, target map rect %@ not different enough from current map rect %@ (%#.1lf <= %#.1lf)", buf, 0x2Au);
      }
      if (v12) {
        v12[2](v12, 1);
      }
    }
    else
    {
      [(MapCameraController *)self frameMapRect:v7 animated:v12 completion:v47];
    }
  }
  else
  {
    v46 = sub_1006C49AC();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "not framing approx route, no POI shapes provided", buf, 2u);
    }
  }
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForTripFromLocation:(id)a3 alongRoute:(id)a4
{
  [(MapCameraController *)self _mapRectFromLocation:a3 alongRoute:a4];
  result.var1.var1 = v7;
  result.var1.var0 = v6;
  result.var0.var1 = v5;
  result.var0.var0 = v4;
  return result;
}

- (void)frameMapItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 _displayMapRegion];
  [(MapCameraController *)self displayMapRegion:v9 animated:v5 completion:v8];
}

- (void)frameLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 minZoom:(id)a5 maxZoom:(id)a6 completion:(id)a7
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v21 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  double v18 = [v21 featureAnnotation];
  if ([v18 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
  {
    double v19 = [v18 searchResult];
    if (v19 && [(MapCameraController *)self searchResultIsVenueOrBuilding:v19])
    {
      [(MapCameraController *)self _frameSearchResult:v19 minZoom:v15 maxZoom:v16 completion:v17];

      goto LABEL_12;
    }
  }
  if (![v21 isVenueButton]
    || ![(MapCameraController *)self _frameVenueLabelMarker:v21 completion:v17])
  {
    double v20 = [v21 mapRegion];

    if (v20)
    {
      if ([v21 isVisible]) {
        -[MapCameraController _frameVisibleLabelMarker:edgeInsets:completion:](self, "_frameVisibleLabelMarker:edgeInsets:completion:", v21, v17, top, left, bottom, right);
      }
      else {
        -[MapCameraController _frameNotVisibleLabelMarker:edgeInsets:completion:](self, "_frameNotVisibleLabelMarker:edgeInsets:completion:", v21, v17, top, left, bottom, right);
      }
    }
  }
LABEL_12:
}

- (void)_frameVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  double right = a4.right;
  double rect = a4.bottom;
  CGFloat left = a4.left;
  double top = a4.top;
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 mapRegion];
  GEOMapRectForMapRegion();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(MapCameraController *)self mapView];
  v139.origin.double x = v11;
  v139.origin.double y = v13;
  v139.size.double width = v15;
  v139.size.double height = v17;
  MKCoordinateRegion v140 = MKCoordinateRegionForMapRect(v139);
  double latitude = v140.center.latitude;
  double longitude = v140.center.longitude;
  double latitudeDelta = v140.span.latitudeDelta;
  double longitudeDelta = v140.span.longitudeDelta;
  double v23 = [(MapCameraController *)self mapView];
  [v18 convertRegion:v23 toRectToView:latitude, longitude, latitudeDelta, longitudeDelta];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  double v32 = [(MapCameraController *)self mapView];
  uint64_t v33 = [v32 viewForAnnotation:v7];

  if (v33)
  {
    [v33 bounds];
    double x = v34;
    double y = v36;
    double width = v38;
    double height = v40;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v42 = [v33 subviews];
    id v43 = [v42 countByEnumeratingWithState:&v134 objects:v138 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v135;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(void *)v135 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v134 + 1) + 8 * i) frame:left];
          v162.origin.double x = v47;
          v162.origin.double y = v48;
          v162.size.double width = v49;
          v162.size.double height = v50;
          v141.origin.double x = v25;
          v141.origin.double y = v27;
          v141.size.double width = v29;
          v141.size.double height = v31;
          CGRect v142 = CGRectUnion(v141, v162);
        }
        double x = v142.origin.x;
        double y = v142.origin.y;
        double width = v142.size.width;
        double height = v142.size.height;
        id v44 = [v42 countByEnumeratingWithState:&v134 objects:v138 count:16];
      }
      while (v44);
    }

    if (width != CGSizeZero.width || height != CGSizeZero.height)
    {
      v52 = [(MapCameraController *)self mapView];
      [v52 convertRect:v33 fromView:x, y, width, height];
      CGFloat v25 = v53;
      CGFloat v27 = v54;
      CGFloat v29 = v55;
      CGFloat v31 = v56;
    }
  }
  v57 = [(MapCameraController *)self mapView];
  [v7 screenCollisionBounds];
  [v57 convertRect:0 fromView:];
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;

  v143.origin.double x = v25;
  v143.origin.double y = v27;
  v143.size.double width = v29;
  v143.size.double height = v31;
  v163.origin.double x = v59;
  v163.origin.double y = v61;
  v163.size.double width = v63;
  v163.size.double height = v65;
  CGRect v144 = CGRectUnion(v143, v163);
  CGRect v145 = CGRectInset(v144, -5.0, -5.0);
  CGFloat v66 = v145.origin.x;
  CGFloat v67 = v145.origin.y;
  CGFloat v68 = v145.size.width;
  CGFloat v69 = v145.size.height;
  double v70 = fabs(v145.origin.y);
  double v71 = fabs(v145.size.width);
  double v72 = fabs(v145.size.height);
  if (fabs(v145.origin.x) != INFINITY && v70 != INFINITY && v71 != INFINITY && v72 != INFINITY)
  {
    v76 = [(MapCameraController *)self mapView];
    [v76 bounds];
    double v78 = v127 + v77;
    CGFloat v80 = top + v79;
    double v82 = v81 - (v127 + right);
    double v84 = v83 - (top + rect);

    v146.origin.double x = v66;
    v146.origin.double y = v67;
    v146.size.double width = v68;
    CGFloat v131 = v69;
    v146.size.double height = v69;
    double MinX = CGRectGetMinX(v146);
    v147.origin.double x = v78;
    CGFloat recta = v80;
    v147.origin.double y = v80;
    CGFloat v86 = v82;
    v147.size.double width = v82;
    v147.size.double height = v84;
    if (MinX >= CGRectGetMinX(v147))
    {
      v150.origin.double x = v66;
      v150.origin.double y = v67;
      v150.size.double width = v68;
      v150.size.double height = v131;
      double MaxX = CGRectGetMaxX(v150);
      v151.origin.double x = v78;
      v151.origin.double y = recta;
      v151.size.double width = v82;
      v151.size.double height = v84;
      CGFloat v90 = v78;
      if (MaxX <= CGRectGetMaxX(v151))
      {
        double horizontal = UIOffsetZero.horizontal;
        CGFloat v91 = v68;
        CGFloat v89 = v131;
      }
      else
      {
        v152.origin.double x = v66;
        v152.origin.double y = v67;
        v152.size.double width = v68;
        CGFloat v91 = v68;
        CGFloat v89 = v131;
        v152.size.double height = v131;
        double v93 = CGRectGetMaxX(v152);
        v153.origin.double x = v90;
        v153.origin.double y = recta;
        v153.size.double width = v86;
        v153.size.double height = v84;
        double horizontal = v93 - CGRectGetMaxX(v153);
      }
    }
    else
    {
      v148.origin.double x = v78;
      v148.origin.double y = recta;
      v148.size.double width = v82;
      v148.size.double height = v84;
      double v87 = CGRectGetMinX(v148);
      v149.origin.double x = v66;
      v149.origin.double y = v67;
      v149.size.double width = v68;
      double v88 = v68;
      CGFloat v89 = v131;
      v149.size.double height = v131;
      double horizontal = -(v87 - CGRectGetMinX(v149));
      CGFloat v90 = v78;
      CGFloat v91 = v88;
    }
    v154.origin.double x = v66;
    v154.origin.double y = v67;
    v154.size.double width = v91;
    v154.size.double height = v89;
    double MinY = CGRectGetMinY(v154);
    v155.origin.double x = v90;
    v155.origin.double y = recta;
    v155.size.double width = v86;
    v155.size.double height = v84;
    if (MinY >= CGRectGetMinY(v155))
    {
      v158.origin.double x = v66;
      v158.origin.double y = v67;
      v158.size.double width = v91;
      v158.size.double height = v89;
      double MaxY = CGRectGetMaxY(v158);
      v159.origin.double x = v90;
      v159.origin.double y = recta;
      v159.size.double width = v86;
      v159.size.double height = v84;
      if (MaxY <= CGRectGetMaxY(v159))
      {
        double vertical = UIOffsetZero.vertical;
      }
      else
      {
        v160.origin.double x = v66;
        v160.origin.double y = v67;
        v160.size.double width = v91;
        v160.size.double height = v89;
        double v98 = CGRectGetMaxY(v160);
        v161.origin.double x = v90;
        v161.origin.double y = recta;
        v161.size.double width = v86;
        v161.size.double height = v84;
        double vertical = v98 - CGRectGetMaxY(v161);
      }
    }
    else
    {
      v156.origin.double x = v90;
      v156.origin.double y = recta;
      v156.size.double width = v86;
      v156.size.double height = v84;
      double v95 = CGRectGetMinY(v156);
      v157.origin.double x = v66;
      v157.origin.double y = v67;
      v157.size.double width = v91;
      v157.size.double height = v89;
      double vertical = -(v95 - CGRectGetMinY(v157));
    }
    v99 = [(MapCameraController *)self mapView];
    [v99 centerCoordinate];
    double v101 = v100;
    double v103 = v102;

    if (horizontal > 0.0 || vertical > 0.0)
    {
      v106 = [(MapCameraController *)self mapView];
      v107 = [(MapCameraController *)self mapView];
      [v106 convertCoordinate:v107 toPointToView:v101];
      double v109 = v108;
      double v111 = v110;

      v112 = [(MapCameraController *)self mapView];
      v113 = [(MapCameraController *)self mapView];
      [v112 convertPoint:v113 toCoordinateFromView:horizontal + v109, vertical + v111];
      double v104 = v114;
      double v105 = v115;
    }
    else
    {
      double v104 = v101;
      double v105 = v103;
    }
    if (v104 != v101 || v105 != v103)
    {
      v116 = [(MapCameraController *)self mapView];
      [v116 region];

      MKMapRectForCoordinateRegion();
      id v121 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v117, v118, v119, v120];
      v122 = [(MapCameraController *)self mapView];
      v123 = [v122 _mapLayer];
      [v123 durationToAnimateToMapRegion:v121];
      double v125 = v124;

      -[MapCameraController _setCenterCoordinate:duration:completion:](self, "_setCenterCoordinate:duration:completion:", v8, v104, v105, v125);
    }
  }
}

- (void)_frameNotVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v16 = a3;
  double v11 = (void (**)(id, uint64_t))a5;
  if (-[MapCameraController _mapViewFitsLabelMarker:withEdgeInsets:](self, "_mapViewFitsLabelMarker:withEdgeInsets:", v16, top, left, bottom, right))
  {
    if (v11) {
      v11[2](v11, 1);
    }
  }
  else
  {
    [v16 coordinate];
    CLLocationDegrees v13 = v12;
    [v16 coordinate];
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
    -[MapCameraController _setCenterCoordinate:duration:completion:](self, "_setCenterCoordinate:duration:completion:", v11, v15.latitude, v15.longitude, 0.25);
  }
}

- (BOOL)_frameVenueLabelMarker:(id)a3 completion:(id)a4
{
  CLLocationDegrees v12 = 0.0;
  CLLocationDegrees v13 = 0.0;
  float v11 = 0.0;
  unsigned int v5 = [a3 positionOfInterest:&v12 zoom:&v11];
  if (v5)
  {
    double v6 = [(MapCameraController *)self mapView];
    [v6 _mapKitZoomLevelForVectorKitTileZoomLevel:v11];
    double v8 = v7;

    CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v12, v13);
    -[MapCameraController _setCenterCoordinate:zoomLevel:animated:](self, "_setCenterCoordinate:zoomLevel:animated:", 1, v9.latitude, v9.longitude, v8);
  }
  return v5;
}

- (void)displayMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  double v8 = (void (**)(id, void))a5;
  if (v9)
  {
    GEOMapRectForMapRegion();
    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v6, v8);
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

- (void)displayTransitRoute:(id)a3 boardingStopCoord:(id)a4 boardingStopIndex:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v56 = a3;
  CLLocationDegrees v12 = (void (**)(id, void))a7;
  if (v56)
  {
    [v56 pointAt:[v56 routeCoordinateAtDistance:a4 beforeRouteCoordinate:500.0]];
    GEOMapPoint3DForCoordinate();
    double v14 = v13;
    double v16 = v15;
    double v17 = [v56 stops];
    id v18 = [v17 count];

    if ((unint64_t)v18 <= a5)
    {
      double v20 = v14;
      double v19 = v16;
    }
    else
    {
      double v19 = v16;
      double v20 = v14;
      id v21 = v56;
      do
      {
        double v22 = [v21 stops];
        double v23 = [v22 objectAtIndexedSubscript:a5];

        double v24 = [v23 latLng];
        CGFloat v25 = v24;
        if (v24)
        {
          [v24 lat];
          [v25 lng];
          GEOMapPoint3DForCoordinate();
          if (v20 >= v26) {
            double v20 = v26;
          }
          if (v14 <= v26) {
            double v14 = v26;
          }
          if (v19 >= v27) {
            double v19 = v27;
          }
          if (v16 <= v27) {
            double v16 = v27;
          }
        }

        ++a5;
        double v28 = [v56 stops];
        id v29 = [v28 count];

        id v21 = v56;
      }
      while (a5 < (unint64_t)v29);
    }
    id v30 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v20, v19, v14 - v20, v16 - v19];
    UIEdgeInsetsMakeWithEdges();
    -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:");
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    GEOMapRectForMapRegion();
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    CGFloat v47 = [(MapCameraController *)self mapView];
    [v47 mapRectThatFits:v40 edgePadding:v42, v44, v46, v32, v34, v36, v38];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;

    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v8, v12, v49, v51, v53, v55);
  }
  else if (v12)
  {
    v12[2](v12, 0);
  }
}

- (void)frameSearchResults:(id)a3 withResultToSelect:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  id v24 = a3;
  id v16 = a10;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  double v20 = [(MapCameraController *)self mapView];
  [v20 setUserTrackingMode:0];

  [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
  if (a4) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = (unint64_t)[v24 count] > 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  LOBYTE(v23) = a9;
  [WeakRetained goToSearchResults:v24 mapRegion:v19 requireMapMovement:v21 setCameraFromMapItemViewportFrame:a5 == 0 animation:0 minZoom:v18 maxZoom:v17 disableAdditionalViewportPadding:v23 completion:v16];
}

- (void)_frameSearchResult:(id)a3 minZoom:(id)a4 maxZoom:(id)a5 completion:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    double v14 = [(MapCameraController *)self mapView];
    [v14 setUserTrackingMode:0];

    [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    id v20 = v13;
    id v16 = +[NSArray arrayWithObjects:&v20 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1006C5E34;
    v18[3] = &unk_1012F5180;
    id v19 = v10;
    LOBYTE(v17) = 0;
    [WeakRetained goToSearchResults:v16 mapRegion:0 requireMapMovement:1 animation:0 minZoom:v12 maxZoom:v11 disableAdditionalViewportPadding:v17 completion:v18];
  }
}

- (BOOL)searchResultIsVenueOrBuilding:(id)a3
{
  v3 = [a3 mapItem];
  if ([v3 _hasVenueFeatureType]) {
    BOOL v4 = [v3 _venueFeatureType] == (id)1 || [v3 _venueFeatureType] == (id)2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)restoreRegionForMapSelectionForLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v19 = a3;
  id v11 = (void (**)(id, uint64_t))a5;
  if (-[MapCameraController _mapViewFitsLabelMarker:withEdgeInsets:](self, "_mapViewFitsLabelMarker:withEdgeInsets:", v19, top, left, bottom, right))
  {
    if (v11) {
      v11[2](v11, 1);
    }
  }
  else
  {
    id v12 = [(MapCameraController *)self mapView];
    id v13 = [v12 camera];
    id v14 = [v13 copy];

    [v19 coordinate];
    CLLocationDegrees v16 = v15;
    [v19 coordinate];
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
    [v14 setCenterCoordinate:v18.latitude, v18.longitude];
    [(MapCameraController *)self restoreRegionForMapSelectionWithCamera:v14 completion:v11];
  }
}

- (void)restoreRegionForMapSelectionWithCamera:(id)a3 completion:(id)a4
{
}

- (void)frameMapRect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = a5;
  double y = MKMapRectNull.origin.y;
  id v13 = sub_1006C49AC();
  id v14 = v13;
  if (v9 == MKMapRectNull.origin.x && v8 == y)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v22 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v9, *(void *)&v8];
      uint64_t v23 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&var0, *(void *)&var1];
      id v24 = +[NSString stringWithFormat:@"{%@, %@}", v22, v23];

      *(_DWORD *)buf = 138412290;
      double v26 = v24;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "not framing target map rect %@, it's null", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CLLocationDegrees v16 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v9, *(void *)&v8];
      CLLocationDegrees v17 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&var0, *(void *)&var1];
      CLLocationCoordinate2D v18 = +[NSString stringWithFormat:@"{%@, %@}", v16, v17];

      id v19 = [(MapCameraController *)self mapView];
      [v19 _edgeInsets];
      id v20 = NSStringFromUIEdgeInsets(v31);
      *(_DWORD *)buf = 138412802;
      double v26 = v18;
      __int16 v27 = 1024;
      BOOL v28 = v5;
      __int16 v29 = 2114;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "setting map camera to frame: %@, animated: %d, current edge insets: %{public}@", buf, 0x1Cu);
    }
    BOOL v21 = [(MapCameraController *)self mapView];
    [v21 setUserTrackingMode:0];

    [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
    id v14 = [(MapCameraController *)self mapView];
    -[NSObject _setVisibleMapRect:animated:completionHandler:](v14, "_setVisibleMapRect:animated:completionHandler:", v5, v11, v9, v8, var0, var1);
  }
}

- (void)_frameMapRect:(id)a3 duration:(double)a4 completion:(id)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = a5;
  double y = MKMapRectNull.origin.y;
  id v13 = sub_1006C49AC();
  id v14 = v13;
  if (v9 == MKMapRectNull.origin.x && v8 == y)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v22 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v9, *(void *)&v8];
      uint64_t v23 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&var0, *(void *)&var1];
      id v24 = +[NSString stringWithFormat:@"{%@, %@}", v22, v23];

      *(_DWORD *)buf = 138412290;
      double v26 = v24;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "not framing target map rect %@, it's null", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CLLocationDegrees v16 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v9, *(void *)&v8];
      CLLocationDegrees v17 = +[NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&var0, *(void *)&var1];
      CLLocationCoordinate2D v18 = +[NSString stringWithFormat:@"{%@, %@}", v16, v17];

      id v19 = [(MapCameraController *)self mapView];
      [v19 _edgeInsets];
      id v20 = NSStringFromUIEdgeInsets(v31);
      *(_DWORD *)buf = 138543874;
      double v26 = v18;
      __int16 v27 = 2048;
      double v28 = a4;
      __int16 v29 = 2114;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "setting map camera to frame: %{public}@, duration: %#.1lfs, current edge insets: %{public}@", buf, 0x20u);
    }
    BOOL v21 = [(MapCameraController *)self mapView];
    [v21 setUserTrackingMode:0];

    [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
    id v14 = [(MapCameraController *)self mapView];
    -[NSObject _setVisibleMapRect:duration:completionHandler:](v14, "_setVisibleMapRect:duration:completionHandler:", v11, v9, v8, var0, var1, a4);
  }
}

- (void)_setMapCamera:(id)a3 duration:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(MapCameraController *)self mapView];
  [v12 setUserTrackingMode:0];

  [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
  id v13 = sub_1006C49AC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "setting camera %@ animated", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006C66F0;
  v15[3] = &unk_1012E5D58;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  +[UIView animateWithDuration:a5 delay:v15 options:v11 animations:a4 completion:0.0];
}

- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 duration:(double)a4 completion:(id)a5
{
  id v7 = a5;
  double v8 = [(MapCameraController *)self mapView];
  [v8 setUserTrackingMode:0];

  [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
  double v9 = sub_1006C49AC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromCLLocationCoordinate();
    int v28 = 138412290;
    __int16 v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setting center coordinate %@ animated", (uint8_t *)&v28, 0xCu);
  }
  id v11 = [(MapCameraController *)self mapView];
  id v12 = [v11 _mapLayer];
  VKLocationCoordinate2DMake();
  double v14 = v13;
  double v16 = v15;
  CLLocationDegrees v17 = [(MapCameraController *)self mapView];
  id v18 = [v17 _mapLayer];
  [v18 altitude];
  double v20 = v19;
  BOOL v21 = [(MapCameraController *)self mapView];
  double v22 = [v21 _mapLayer];
  [v22 yaw];
  double v24 = v23;
  CGFloat v25 = [(MapCameraController *)self mapView];
  double v26 = [v25 _mapLayer];
  [v26 pitch];
  [v12 setCenterCoordinate:0 altitude:v7 yaw:v14 pitch:v16 duration:v20 timingCurve:v24 completion:a4];
}

- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v10 = sub_1006C49AC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromCLLocationCoordinate();
    int v14 = 138412546;
    double v15 = v11;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "setting center coordinate %@, zoom level %#.2lf animated", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(MapCameraController *)self mapView];
  [v12 setUserTrackingMode:0];

  [(MapCameraController *)self _notifyObserversWillChangeVisibleRect];
  double v13 = [(MapCameraController *)self mapView];
  [v13 setCenterCoordinate:v5 zoomLevel:latitude longitude:longitude animated:a4];
}

- (void)_notifyObserversWillChangeVisibleRect
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSHashTable *)self->_observers copy];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) mapCameraControllerWillChangeVisibleRect:self];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 startPOIShape:(id)a5 endPOIShapes:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  [(MapCameraController *)self _mapRectForRouteLines:a3 includePadding:0];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(MapCameraController *)self _mapRectApproximatingRouteFromStartPOIShape:v11 toEndPOIShapes:v10 includePadding:0];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v64.origin.double x = v21;
  v64.origin.double y = v23;
  v64.size.double width = v25;
  v64.size.double height = v27;
  v67.origin.double x = v13;
  v67.origin.double y = v15;
  v67.size.double width = v17;
  v67.size.double height = v19;
  MKMapRect v65 = MKMapRectUnion(v64, v67);
  double y = v65.origin.y;
  double x = v65.origin.x;
  double height = v65.size.height;
  double width = v65.size.width;
  double v28 = MKMapRectNull.origin.y;
  BOOL v29 = v23 == v28 && v21 == MKMapRectNull.origin.x;
  if (!v29 && v25 != 0.0 && v27 != 0.0
    || ((double bottom = UIEdgeInsetsZero.bottom,
         double right = UIEdgeInsetsZero.right,
         double top = UIEdgeInsetsZero.top,
         double left = UIEdgeInsetsZero.left,
         v15 == v28)
      ? (BOOL v34 = v13 == MKMapRectNull.origin.x)
      : (BOOL v34 = 0),
        !v34 && v17 != 0.0 && v19 != 0.0))
  {
    UIEdgeInsetsMakeWithEdges();
    double top = v35;
    double left = v36;
    double bottom = v37;
    double right = v38;
  }
  if (v7)
  {
    -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:", top, left, bottom, right);
    double top = v39;
    double left = v40;
    double bottom = v41;
    double right = v42;
  }
  double v43 = [(MapCameraController *)self mapView];
  [v43 mapRectThatFits:v63 edgePadding:v61, v59, v57, top, left, bottom, right];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  double v52 = v45;
  double v53 = v47;
  double v54 = v49;
  double v55 = v51;
  result.var1.double var1 = v55;
  result.var1.double var0 = v54;
  result.var0.double var1 = v53;
  result.var0.double var0 = v52;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRouteLines:(id)a3 includePadding:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    if (v4) {
      double v7 = 10.0;
    }
    else {
      double v7 = 0.0;
    }
    long long v8 = [v6 firstObject];
    unsigned int v9 = [v8 transportType];

    if (v9 == 1) {
      double v10 = v7 + 10.0;
    }
    else {
      double v10 = v7;
    }
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * i) _maps_boundingMapRect:v37];
          v45.origin.double x = v20;
          v45.origin.double y = v21;
          v45.size.double width = v22;
          v45.size.double height = v23;
          v42.origin.double x = x;
          v42.origin.double y = y;
          v42.size.double width = width;
          v42.size.double height = height;
          MKMapRect v43 = MKMapRectUnion(v42, v45);
          double x = v43.origin.x;
          double y = v43.origin.y;
          double width = v43.size.width;
          double height = v43.size.height;
        }
        id v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }

    double v24 = [(MapCameraController *)self mapView];
    [v24 mapRectThatFits:x, y, width, height edgePadding:v10, v10, v10, v10];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
  }
  else
  {
    double v26 = MKMapRectNull.origin.x;
    double v28 = MKMapRectNull.origin.y;
    double v30 = MKMapRectNull.size.width;
    double v32 = MKMapRectNull.size.height;
  }

  double v33 = v26;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  result.var1.double var1 = v36;
  result.var1.double var0 = v35;
  result.var0.double var1 = v34;
  result.var0.double var0 = v33;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = v8;
  if (v5)
  {
    double v10 = [v8 firstObject];
    id v11 = [v10 anchorPoints];
    id v12 = [v11 count];

    if (v12) {
      [(MapCameraController *)self _poiShapeAnchorPointMarkersFromRoute:v10];
    }
    else {
    double v13 = [(MapCameraController *)self _poiShapeWaypointMarkersFromRoute:v10];
    }
  }
  else
  {
    double v13 = 0;
  }
  [(MapCameraController *)self _mapRectForRoutes:v9 includeCompassInset:v6 startPOIShape:0 endPOIShapes:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.var1.double var1 = v25;
  result.var1.double var0 = v24;
  result.var0.double var1 = v23;
  result.var0.double var0 = v22;
  return result;
}

- (id)_poiShapeAnchorPointMarkersFromRoute:(id)a3
{
  BOOL v4 = [a3 anchorPoints];
  BOOL v5 = [v4 anchorPoints];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006C7124;
  v8[3] = &unk_1012F51A8;
  v8[4] = self;
  BOOL v6 = sub_100099700(v5, v8);

  return v6;
}

- (id)_poiShapeWaypointMarkersFromRoute:(id)a3
{
  BOOL v4 = [a3 waypoints];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006C7280;
  v7[3] = &unk_1012F51D0;
  v7[4] = self;
  BOOL v5 = sub_100099700(v4, v7);

  return v5;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v9 = a4;
  id v10 = a3;
  -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:", UIEdgeInsetsZero.top, left, bottom, right);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(MapCameraController *)self _mapRectApproximatingRouteFromStartPOIShape:v10 toEndPOIShapes:v9 includePadding:1];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = [(MapCameraController *)self mapView];
  [v27 mapRectThatFits:v20 edgePadding:v22, v24, v26, v12, v14, v16, v18];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  double v36 = v29;
  double v37 = v31;
  double v38 = v33;
  double v39 = v35;
  result.var1.double var1 = v39;
  result.var1.double var0 = v38;
  result.var0.double var1 = v37;
  result.var0.double var0 = v36;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 includePadding:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 || [v9 count])
  {
    if (v5)
    {
      UIEdgeInsetsMakeWithEdges();
      CGFloat top = v11;
      CGFloat left = v13;
      CGFloat bottom = v15;
      CGFloat right = v17;
    }
    else
    {
      CGFloat top = UIEdgeInsetsZero.top;
      CGFloat left = UIEdgeInsetsZero.left;
      CGFloat bottom = UIEdgeInsetsZero.bottom;
      CGFloat right = UIEdgeInsetsZero.right;
    }
    id v19 = [objc_alloc((Class)NSMutableArray) initWithArray:v10];
    double v20 = v19;
    if (v8) {
      [v19 insertObject:v8 atIndex:0];
    }
    double v21 = (char *)[v20 count];
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    if (v21)
    {
      double v26 = v21;
      double v92 = right;
      double v93 = bottom;
      v96 = v10;
      v94 = self;
      double v95 = &v90;
      __chkstk_darwin(v21);
      double v28 = &v90 - 2 * v27;
      *(void *)&double v29 = __chkstk_darwin(v27).n128_u64[0];
      double v31 = &v90 - 2 * v30;
      uint64_t v32 = 0;
      double v33 = 0;
      double v34 = v31 + 1;
      double v35 = v28 + 1;
      do
      {
        double v36 = [v20 objectAtIndexedSubscript:v33];
        [v36 centerCoordinate];
        CLLocationDegrees latitude = v100.latitude;
        CLLocationDegrees longitude = v100.longitude;
        if (CLLocationCoordinate2DIsValid(v100))
        {
          *(v35 - 1) = latitude;
          CLLocationDegrees *v35 = longitude;
          [v36 estimatedSize];
          *(v34 - 1) = v39;
          *double v34 = v40;
          ++v32;
        }

        ++v33;
        v34 += 2;
        v35 += 2;
      }
      while (v26 != v33);
      if (v32)
      {
        double v90 = left;
        double v91 = top;
        double v97 = height;
        __chkstk_darwin(v41);
        uint64_t v42 = 0;
        uint64_t v43 = v32;
        do
        {
          *(MKMapPoint *)((char *)&v90 + v42 * 8 + -16 * v32) = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)&v28[v42]);
          v42 += 2;
          --v43;
        }
        while (v43);
        MKMapRectBoundingMapPoints();
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        double v52 = v94;
        double v53 = [(MapCameraController *)v94 mapView];
        [v53 _zoomLevelForMapRect:0 includeAccessoryPadding:v45, v47, v49, v51];
        MKZoomScaleForZoomLevelF();
        double v99 = v54;

        double v55 = v31 + 1;
        id v56 = v28 + 1;
        uint64_t v57 = v32;
        double v58 = MKMapRectNull.origin.x;
        double v59 = y;
        double v60 = width;
        double v61 = v97;
        double v62 = v97;
        id v10 = v96;
        do
        {
          double v63 = x;
          double v64 = y;
          double v65 = width;
          double v66 = v61;
          if (v99 > 0.0)
          {
            double v98 = v58;
            double v67 = v59;
            double v68 = v60;
            double v69 = v62;
            double v70 = width;
            double v71 = x;
            double v72 = y;
            double v74 = *(v55 - 1);
            double v73 = *v55;
            MKMapPoint v75 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)(v56 - 1));
            double v65 = v74 / v99;
            double y = v72;
            double v66 = v73 / v99;
            double x = v71;
            double width = v70;
            double v62 = v69;
            double v60 = v68;
            double v59 = v67;
            double v61 = v97;
            double v58 = v98;
            double v63 = v75.x - v65 * 0.5;
            double v64 = v75.y - v66 * 0.5;
          }
          if (v58 == x && v59 == y)
          {
            double v62 = v66;
            double v60 = v65;
            double v59 = v64;
            double v58 = v63;
          }
          else
          {
            v104.origin.double x = v58;
            v104.origin.double y = v59;
            v104.size.double width = v60;
            v104.size.double height = v62;
            MKMapRect v105 = MKMapRectUnion(v104, *(MKMapRect *)&v63);
            double v58 = v105.origin.x;
            double v59 = v105.origin.y;
            double v60 = v105.size.width;
            double v62 = v105.size.height;
          }
          v55 += 2;
          v56 += 2;
          --v57;
        }
        while (v57);
        double v77 = [(MapCameraController *)v52 mapView];
        [v77 mapRectThatFits:v58 edgePadding:v59, v60, v62, v91, v90, v93, v92];
        double x = v78;
        double y = v79;
        double width = v80;
        double height = v81;

        if (v32 == 1)
        {
          v101.double x = x + width * 0.5;
          v101.double y = y + height * 0.5;
          v103.double x = v101.x;
          v103.double y = y;
          if (MKMetersBetweenMapPoints(v101, v103) < 175.0)
          {
            v102.double x = x + width * 0.5;
            v102.double y = y + height * 0.5;
            MKCoordinateForMapPoint(v102);
            MKMapRectMakeWithRadialDistance();
            double x = v82;
            double y = v83;
            double width = v84;
            double height = v85;
          }
        }
      }
      else
      {
        id v10 = v96;
      }
    }
  }
  else
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }

  double v86 = x;
  double v87 = y;
  double v88 = width;
  double v89 = height;
  result.var1.double var1 = v89;
  result.var1.double var0 = v88;
  result.var0.double var1 = v87;
  result.var0.double var0 = v86;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectFromLocation:(id)a3 alongRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 routeMatch];
  id v9 = (char *)[v8 stepIndex];
  unsigned int v10 = [v8 routeCoordinate];
  if (v8)
  {
    id v9 = (char *)[v8 stepIndex];
    uint64_t v11 = [v8 routeCoordinate];
  }
  else
  {
    LODWORD(v11) = v10;
    [v6 coordinate];
    GEOLocationCoordinate2DFromCLLocationCoordinate2D();
    unsigned int v12 = [v7 closestPointOnRoute:];
    if (GEOPolylineCoordinateIsValid())
    {
      uint64_t v11 = v12;
      id v9 = (char *)[v7 stepIndexForPointIndex:v12];
    }
    else
    {
      uint64_t v11 = v11;
      [v7 _maps_boundingMapRect];
    }
  }
  double v13 = [v7 steps];
  double v14 = (char *)[v13 count];

  if (v9 >= v14)
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }
  else
  {
    double v15 = [v7 steps];
    double v16 = [v15 objectAtIndexedSubscript:v9];
    [v7 _maps_boundingRectForStep:v16 fromPoint:v11];
    double x = v17;
    double y = v19;
    double width = v21;
    double height = v23;

    while (1)
    {
      ++v9;
      double v25 = [v7 steps];
      double v26 = (char *)[v25 count];

      if (v9 >= v26) {
        break;
      }
      uint64_t v27 = [v7 steps];
      double v28 = [v27 objectAtIndexedSubscript:v9];
      [v7 _maps_boundingRectForStep:v28];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      v73.origin.double x = x;
      v73.origin.double y = y;
      v73.size.double width = width;
      v73.size.double height = height;
      v78.origin.double x = v30;
      v78.origin.double y = v32;
      v78.size.double width = v34;
      v78.size.double height = v36;
      MKMapRect v74 = MKMapRectUnion(v73, v78);
      double x = v74.origin.x;
      double y = v74.origin.y;
      double width = v74.size.width;
      double height = v74.size.height;
    }
  }
  double v37 = [v7 destination];
  if (v6)
  {
    double v38 = [(MapCameraController *)self mapView];
    [v6 coordinate];
    uint64_t v39 = +[POIShapeFactory userLocationPOIShapeWithMapView:coordinate:](POIShapeFactory, "userLocationPOIShapeWithMapView:coordinate:", v38);
  }
  else
  {
    uint64_t v39 = 0;
  }
  uint64_t v40 = [(MapCameraController *)self mapView];
  uint64_t v41 = +[POIShapeFactory composedWaypointPOIShapeWithMapView:v40 composedWaypoint:v37];

  if (v41)
  {
    double v72 = v41;
    uint64_t v42 = +[NSArray arrayWithObjects:&v72 count:1];
    [(MapCameraController *)self mapRectApproximatingRouteFromStartPOIShape:v39 toEndPOIShapes:v42];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
  }
  else
  {
    [(MapCameraController *)self mapRectApproximatingRouteFromStartPOIShape:v39 toEndPOIShapes:0];
    double v44 = v51;
    double v46 = v52;
    double v48 = v53;
    double v50 = v54;
  }
  v75.origin.double x = x;
  v75.origin.double y = y;
  v75.size.double width = width;
  v75.size.double height = height;
  v79.origin.double x = v44;
  v79.origin.double y = v46;
  v79.size.double width = v48;
  v79.size.double height = v50;
  MKMapRect v76 = MKMapRectUnion(v75, v79);
  double v55 = v76.origin.x;
  double v56 = v76.origin.y;
  double v57 = v76.size.width;
  double v58 = v76.size.height;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained mapRectThatFits:v55 edgePadding:v56, v57, v58, 20.0, 20.0, 20.0, 20.0];
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;

  double v68 = v61;
  double v69 = v63;
  double v70 = v65;
  double v71 = v67;
  result.var1.double var1 = v71;
  result.var1.double var0 = v70;
  result.var0.double var1 = v69;
  result.var0.double var0 = v68;
  return result;
}

- (double)_maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v26 = a3.var1.var1;
  double v4 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  id v8 = [(MapCameraController *)self mapView];
  [v8 visibleMapRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [(MapCameraController *)self mapView];
  [v17 _zoomLevelForMapRect:0 includeAccessoryPadding:v6, v5, v4, var1];
  MKZoomScaleForZoomLevelF();
  double v19 = v18;

  double v20 = [(MapCameraController *)self mapView];
  [v20 _zoomLevelForMapRect:0 includeAccessoryPadding:v10, v12, v14, v16];
  MKZoomScaleForZoomLevelF();
  double v22 = v21;

  if (v19 <= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v19;
  }
  return fmax(fmax(fmax(vabdd_f64(v6, v10), vabdd_f64(v5, v12)), vabdd_f64(v6 + var0, v10 + v14)), vabdd_f64(v5 + v26, v12 + v16))* v23;
}

- (UIEdgeInsets)_insetsByAddingCompassPaddingToInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  id v8 = [(MapCameraController *)self mapView];
  if (sub_1000BBB44(v8))
  {
    double v9 = [(MapCameraController *)self mapView];
    uint64_t v10 = sub_1000BBB44(v9);

    if (v10 != 1) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v11 = [(MapCameraController *)self mapView];
  [v11 _compassDiameter];
  double v13 = v12;

  double v14 = v13 + sub_1000BBAF8();
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  double v16 = -0.0;
  if (IsRightToLeft) {
    double v17 = -0.0;
  }
  else {
    double v17 = v14;
  }
  double right = right + v17;
  if (IsRightToLeft) {
    double v16 = v14;
  }
  double left = left + v16;
LABEL_11:
  double v18 = top;
  double v19 = left;
  double v20 = bottom;
  double v21 = right;
  result.double right = v21;
  result.CGFloat bottom = v20;
  result.double left = v19;
  result.CGFloat top = v18;
  return result;
}

- (UIEdgeInsets)_insetsForPin
{
  +[MKPinAnnotationView _perceivedSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = +[UIDevice currentDevice];
  if ([v6 userInterfaceIdiom] == (id)1) {
    double v7 = v5 + v5;
  }
  else {
    double v7 = v5 + 4.0;
  }

  double v8 = v7;
  double v9 = v3 + v3;
  double v10 = v7;
  double v11 = v3 + v3;
  result.double right = v11;
  result.CGFloat bottom = v10;
  result.double left = v9;
  result.CGFloat top = v8;
  return result;
}

- (BOOL)_mapViewFitsLabelMarker:(id)a3 withEdgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  [a3 coordinate];
  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
  double v12 = [(MapCameraController *)self mapView];
  double v13 = [(MapCameraController *)self mapView];
  [v12 convertCoordinate:v13 toPointToView:v11.latitude, v11.longitude];
  uint64_t v37 = v15;
  uint64_t v38 = v14;

  double v16 = [(MapCameraController *)self mapView];
  [v16 bounds];
  double v18 = left + v17;
  double v20 = top + v19;
  double v22 = v21 - (left + right);
  double v24 = v23 - (top + bottom);

  double v25 = [(MapCameraController *)self mapView];
  [v25 defaultInsetsForBalloonCallout];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  uint64_t v35 = v37;
  uint64_t v34 = v38;

  v40.origin.double x = v18 + v29;
  v40.origin.double y = v20 + v27;
  v40.size.double width = v22 - (v29 + v33);
  v40.size.double height = v24 - (v27 + v31);
  return CGRectContainsPoint(v40, *(CGPoint *)&v34);
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end