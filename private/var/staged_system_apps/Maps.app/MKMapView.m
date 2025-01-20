@interface MKMapView
+ (double)_animationDurationFromMapRect:(id)a3 toMapRect:(id)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5;
- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5 withFixedPoint:(id)a6;
- ($C79183323B9A0D5602617FF3BE5395AC)displayMapRegionForSearchResult:(id)a3;
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3;
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3 edgePadding:(UIEdgeInsets)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectThatFits:(id)a3 minMetersPerPoint:(double)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)regionForSearchResults:(id)a3 suggestedRegion:(id)a4 minZoom:(id)a5 maxZoom:(id)a6 disableAdditionalViewportPadding:(BOOL)a7;
- (BOOL)isCoordinateVisible:(CLLocationCoordinate2D)a3;
- (BOOL)isShowingImagery;
- (BOOL)rectIsEmpty:(id)a3;
- (UIEdgeInsets)defaultInsetsForBalloonCallout;
- (UIEdgeInsets)defaultInsetsForPinAnnotations;
- (UIEdgeInsets)splitViewInsetsForPinAnnotations;
- (id)snapshotImage;
- (id)snapshotImageWithScale:(double)a3;
- (id)snapshotImageWithScale:(double)a3 allowSnapshotting:(BOOL)a4;
- (id)snapshotOptions;
- (void)_performFlyoverAnnouncementAnimation:(id)a3;
- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 completion:(id)a5;
- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 resetHeading:(BOOL)a5 completion:(id)a6;
- (void)getRapSnapshotImageDataWithCompletion:(id)a3;
- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 animation:(int64_t)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10;
- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 setCameraFromMapItemViewportFrame:(BOOL)a6 animation:(int64_t)a7 minZoom:(id)a8 maxZoom:(id)a9 disableAdditionalViewportPadding:(BOOL)a10 completion:(id)a11;
@end

@implementation MKMapView

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectThatFits:(id)a3 minMetersPerPoint:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double y = a3.var0.var1;
  double x = a3.var0.var0;
  double v10 = a3.var0.var0 + a3.var1.var0;
  double v11 = a3.var0.var1 + a3.var1.var1;
  double v9 = v11;
  MKCoordinateForMapPoint((MKMapPoint)a3.var0);
  v23.double x = v10;
  v23.double y = v9;
  MKCoordinateForMapPoint(v23);
  GEOCalculateDistance();
  double v13 = v12;
  [(MKMapView *)self bounds];
  if (v13 / v14 < a4)
  {
    double v15 = a4 / (v13 / v14);
    double v16 = -(var0 * v15) * 0.5;
    double v17 = -(var1 * v15) * 0.5;
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.width = var0;
    v24.size.height = var1;
    MKMapRect v25 = MKMapRectInset(v24, v16, v17);
    double x = v25.origin.x;
    double y = v25.origin.y;
    double var0 = v25.size.width;
    double var1 = v25.size.height;
  }
  double v18 = x;
  double v19 = y;
  double v20 = var0;
  double v21 = var1;
  result.var1.double var1 = v21;
  result.var1.double var0 = v20;
  result.var0.double var1 = v19;
  result.var0.double var0 = v18;
  return result;
}

- (UIEdgeInsets)defaultInsetsForPinAnnotations
{
  v2 = [(MKMapView *)self traitCollection];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)3) {
    double v4 = 10.0;
  }
  else {
    double v4 = 40.0;
  }
  if (v3 == (id)3) {
    double v5 = 0.0;
  }
  else {
    double v5 = MKPopoverSmallCalloutHeight;
  }
  +[MKPinAnnotationView _perceivedSize];
  double v7 = v6;
  double v8 = v5 + v6;
  double v9 = v4;
  double v10 = v4;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultInsetsForBalloonCallout
{
  double v2 = 82.0;
  double v3 = 45.0;
  double v4 = 40.0;
  double v5 = 40.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)splitViewInsetsForPinAnnotations
{
  +[MKPinAnnotationView _perceivedSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = v3;
  result.right = v3;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3
{
  id v4 = a3;
  [(MKMapView *)self defaultInsetsForPinAnnotations];
  -[MKMapView mapRectContainingSearchResults:edgePadding:](self, "mapRectContainingSearchResults:edgePadding:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var1.double var1 = v16;
  result.var1.double var0 = v15;
  result.var0.double var1 = v14;
  result.var0.double var0 = v13;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", sub_10050943C(a3));

  -[MKMapView mapRectThatFits:minMetersPerPoint:](self, "mapRectThatFits:minMetersPerPoint:");
  result.var1.double var1 = v8;
  result.var1.double var0 = v7;
  result.var0.double var1 = v6;
  result.var0.double var0 = v5;
  return result;
}

- (BOOL)isCoordinateVisible:(CLLocationCoordinate2D)a3
{
  -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a3.latitude, a3.longitude);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [(MKMapView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(MKMapView *)self _edgeInsets];
  double v17 = v11 + v16;
  double v20 = v13 - (v18 + v19);
  double v22 = v15 - (v16 + v21);
  double v23 = v9 + v18;
  double v24 = v17;
  double v25 = v20;
  uint64_t v26 = v5;
  uint64_t v27 = v7;

  return CGRectContainsPoint(*(CGRect *)&v23, *(CGPoint *)&v26);
}

- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 animation:(int64_t)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  LOBYTE(v10) = a9;
  [(MKMapView *)self goToSearchResults:a3 mapRegion:a4 requireMapMovement:a5 setCameraFromMapItemViewportFrame:1 animation:a6 minZoom:a7 maxZoom:a8 disableAdditionalViewportPadding:v10 completion:a10];
}

- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 setCameraFromMapItemViewportFrame:(BOOL)a6 animation:(int64_t)a7 minZoom:(id)a8 maxZoom:(id)a9 disableAdditionalViewportPadding:(BOOL)a10 completion:(id)a11
{
  BOOL v12 = a6;
  uint64_t v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a11;
  if ([v16 count])
  {
    if ([v16 count] == (id)1)
    {
      id v92 = v18;
      double v21 = [v16 firstObject];
      double v22 = [v21 mapItem];
      double v23 = [v22 _viewportFrame];

      if (v23 && v12)
      {
        [v22 _viewportFrame];
        v25 = id v24 = v19;
        [v25 latitude];
        CLLocationDegrees v27 = v26;
        [v25 longitude];
        CLLocationCoordinate2D v113 = CLLocationCoordinate2DMake(v27, v28);
        MKMapPointForCoordinate(v113);
        [v25 distance];
        [(MKMapView *)self frame];
        MKMapRectMakeWithZoomLevel();
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [(MKMapView *)self frame];
        v39 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v30, v32, v34, v36, v37, v38);
        [v25 pitch];
        [v39 setPitch:v40];
        [v25 heading];
        [v39 setHeading:v41];
        v106[0] = _NSConcreteStackBlock;
        v106[1] = 3221225472;
        v106[2] = sub_10050A00C;
        v106[3] = &unk_1012ED840;
        id v107 = v20;
        double v108 = v30;
        double v109 = v32;
        double v110 = v34;
        double v111 = v36;
        [(MKMapView *)self setCamera:v39 animated:0 completionHandler:v106];

        id v19 = v24;
        id v18 = v92;
        goto LABEL_54;
      }

      id v18 = v92;
    }
    uint64_t v42 = a10;
    if (v13)
    {
      id v43 = 0;
      uint64_t v44 = 0;
    }
    else
    {
      unint64_t v89 = __PAIR64__(v13, a10);
      id v90 = v19;
      id v91 = v17;
      id v93 = v18;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v45 = v16;
      id v46 = [v45 countByEnumeratingWithState:&v102 objects:v112 count:16];
      if (v46)
      {
        id v47 = v46;
        id v43 = 0;
        uint64_t v44 = 0;
        uint64_t v48 = *(void *)v103;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v103 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            [v50 coordinate:v89, v90, v91];
            if (-[MKMapView isCoordinateVisible:](self, "isCoordinateVisible:"))
            {
              if (!v43) {
                id v43 = v50;
              }
              ++v44;
            }
          }
          id v47 = [v45 countByEnumeratingWithState:&v102 objects:v112 count:16];
        }
        while (v47);
      }
      else
      {
        id v43 = 0;
        uint64_t v44 = 0;
      }

      id v17 = v91;
      id v18 = v93;
      id v19 = v90;
      uint64_t v42 = v89;
      uint64_t v13 = HIDWORD(v89);
    }
    GEOMapRectForMapRegion();
    -[MKMapView regionForSearchResults:suggestedRegion:minZoom:maxZoom:disableAdditionalViewportPadding:](self, "regionForSearchResults:suggestedRegion:minZoom:maxZoom:disableAdditionalViewportPadding:", v16, v18, v19, v42);
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    [(MKMapView *)self bounds];
    double v94 = v56;
    double v60 = v52 + v56;
    double v61 = v58;
    double v63 = v62 / (v60 - v52);
    if (v63 >= v59 / (v54 + v58 - v54)) {
      double v64 = v59 / (v54 + v58 - v54);
    }
    else {
      double v64 = v63;
    }
    double v65 = fabs(v64);
    if (v65 >= INFINITY && v65 <= INFINITY)
    {
      MKZoomScaleForZoomLevelF();
      double v64 = v66;
    }
    [(MKMapView *)self visibleMapRect];
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;
    [(MKMapView *)self bounds];
    if (v75 / (v68 + v72 - v68) >= v76 / (v70 + v74 - v70)) {
      double v77 = v76 / (v70 + v74 - v70);
    }
    else {
      double v77 = v75 / (v68 + v72 - v68);
    }
    double v78 = fabs(v77);
    if (v78 >= INFINITY && v78 <= INFINITY)
    {
      MKZoomScaleForZoomLevelF();
      double v77 = v79;
    }
    double v80 = v61;
    if (v20)
    {
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10050A034;
      v96[3] = &unk_1012ED840;
      id v97 = v20;
      double v98 = v52;
      double v99 = v54;
      double v81 = v94;
      double v100 = v94;
      double v101 = v80;
      v82 = objc_retainBlock(v96);

      if (v13) {
        goto LABEL_45;
      }
    }
    else
    {
      v82 = 0;
      double v81 = v94;
      if (v13) {
        goto LABEL_45;
      }
    }
    if (v44)
    {
      if (v64 / v77 <= 4.0)
      {
        if (v20) {
          (*((void (**)(id, uint64_t, id, double, double, double, double))v20 + 2))(v20, 1, v43, v52, v54, v81, v80);
        }
        goto LABEL_53;
      }
      if (a7) {
        BOOL v83 = a7 != 2;
      }
      else {
        BOOL v83 = v64 / v77 < 18.0;
      }
      v84 = self;
      double v85 = v52;
      double v86 = v54;
      double v87 = v81;
      double v88 = v80;
LABEL_52:
      -[MKMapView _setVisibleMapRect:animated:completionHandler:](v84, "_setVisibleMapRect:animated:completionHandler:", v83, v82, v85, v86, v87, v88);
LABEL_53:

      goto LABEL_54;
    }
LABEL_45:
    if (a7) {
      uint64_t v13 = a7 != 2;
    }
    v84 = self;
    double v85 = v52;
    double v86 = v54;
    double v87 = v81;
    double v88 = v80;
    BOOL v83 = v13;
    goto LABEL_52;
  }
  if (v20) {
    (*((void (**)(id, uint64_t, void, double, double, double, double))v20 + 2))(v20, 1, 0, MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
  }
LABEL_54:
}

- (BOOL)rectIsEmpty:(id)a3
{
  BOOL v3 = fabs(a3.var1.var0) < 0.000001;
  return fabs(a3.var1.var1) < 0.000001 || v3;
}

- ($C79183323B9A0D5602617FF3BE5395AC)regionForSearchResults:(id)a3 suggestedRegion:(id)a4 minZoom:(id)a5 maxZoom:(id)a6 disableAdditionalViewportPadding:(BOOL)a7
{
  BOOL v7 = a7;
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v12 = a4.var0.var1;
  double v13 = a4.var0.var0;
  id v15 = a3;
  unint64_t v16 = (unint64_t)a5;
  unint64_t v17 = (unint64_t)a6;
  if (-[MKMapView rectIsEmpty:](self, "rectIsEmpty:", v13, v12, var0, var1))
  {
    if ([v15 count] != (id)1)
    {
      id v18 = 0;
LABEL_21:
      [(MKMapView *)self mapRectContainingSearchResults:v15];
      double v13 = v30;
      double v12 = v31;
      double var0 = v32;
      double var1 = v33;
      unsigned int v29 = -[MKMapView rectIsEmpty:](self, "rectIsEmpty:");
      goto LABEL_22;
    }
    id v18 = [v15 firstObject];
LABEL_16:
    if (v18)
    {
      [(MKMapView *)self displayMapRegionForSearchResult:v18];
      double v13 = v25;
      double v12 = v26;
      double var0 = v27;
      double var1 = v28;
      if (!-[MKMapView rectIsEmpty:](self, "rectIsEmpty:"))
      {
        unsigned int v29 = 0;
        goto LABEL_23;
      }
    }
    goto LABEL_21;
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v19 = v15;
  id v20 = [v19 countByEnumeratingWithState:&v93 objects:v97 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v94;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v94 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v93 + 1) + 8 * i) coordinate];
        MKMapPoint v101 = MKMapPointForCoordinate(v98);
        v104.origin.double x = v13;
        v104.origin.double y = v12;
        v104.size.width = var0;
        v104.size.height = var1;
        if (MKMapRectContainsPoint(v104, v101))
        {
          char v24 = 0;
          goto LABEL_14;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v93 objects:v97 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  char v24 = 1;
LABEL_14:

  if ([v19 count] != (id)1)
  {
    id v18 = 0;
    if ((v24 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  id v18 = [v19 firstObject];
  if (v24) {
    goto LABEL_16;
  }
  unsigned int v29 = 0;
LABEL_22:
  if (v18)
  {
LABEL_23:
    [v18 coordinate];
    MKMapPoint v102 = MKMapPointForCoordinate(v99);
    v105.origin.double x = v13;
    v105.origin.double y = v12;
    v105.size.width = var0;
    v105.size.height = var1;
    if (!MKMapRectContainsPoint(v105, v102))
    {
      [(MKMapView *)self displayMapRegionForSearchResult:v18];
      double v13 = v34;
      double v12 = v35;
      double var0 = v36;
      double var1 = v37;
      unsigned int v29 = -[MKMapView rectIsEmpty:](self, "rectIsEmpty:");
    }
    id v38 = [v18 mapItem];
    if ([v38 _hasVenueFeatureType])
    {
      v39 = [v18 mapItem];
      if ([v39 _venueFeatureType] == (id)1)
      {
      }
      else
      {
        [v18 mapItem];
        unsigned int v49 = v29;
        id v50 = v15;
        unint64_t v51 = v16;
        unint64_t v52 = v17;
        v54 = BOOL v53 = v7;
        id v91 = [v54 _venueFeatureType];

        BOOL v7 = v53;
        unint64_t v17 = v52;
        unint64_t v16 = v51;
        id v15 = v50;
        unsigned int v29 = v49;

        if (v91 != (id)2) {
          goto LABEL_36;
        }
      }
      double v55 = [v18 mapItem];
      unsigned int v56 = [v55 _hasDisplayMaxZoom];

      if (!v56)
      {
LABEL_36:
        if (v29)
        {
          [v18 coordinate];
          MKMapRectMakeWithRadialDistance();
          double v13 = v62;
          double v12 = v63;
          double var0 = v64;
          double var1 = v65;
        }
        char v40 = 0;
        if (v7) {
          goto LABEL_39;
        }
LABEL_29:
        [(MKMapView *)self splitViewInsetsForPinAnnotations];
        double top = v41;
        double left = v43;
        double bottom = v45;
        double right = v47;
        goto LABEL_40;
      }
      double v57 = [v18 mapItem];
      [v57 _displayMaxZoom];
      [(MKMapView *)self _mapKitZoomLevelForVectorKitTileZoomLevel:v58];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v38 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16 || ([v38 floatValue], float v60 = v59, objc_msgSend((id)v16, "floatValue"), v60 > v61))
      {
        id v38 = v38;

        unint64_t v16 = (unint64_t)v38;
      }
    }

    goto LABEL_36;
  }
LABEL_28:
  char v40 = 1;
  if (!v7) {
    goto LABEL_29;
  }
LABEL_39:
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
LABEL_40:
  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v13, v12, var0, var1, top, left, bottom, right);
  -[MKMapView mapRectThatFits:minMetersPerPoint:](self, "mapRectThatFits:minMetersPerPoint:");
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  if (v17 | v16)
  {
    if (v40)
    {
      double v74 = sub_10050943C(v15);
      v103.double x = v74 + v75 * 0.5;
      v103.double y = v77 + v76 * 0.5;
      double y = v103.y;
      double x = v103.x;
      v106.origin.double x = v67;
      v106.origin.double y = v69;
      v106.size.width = v71;
      v106.size.height = v73;
      BOOL v78 = MKMapRectContainsPoint(v106, v103);
      double v80 = y;
      double v79 = x;
      if (!v78)
      {
        double v79 = var0 * 0.5 + v13;
        double v80 = var1 * 0.5 + v12;
      }
    }
    else
    {
      [v18 coordinate];
      MKMapPoint v81 = MKMapPointForCoordinate(v100);
      double v79 = v81.x;
      double v80 = v81.y;
    }
    -[MKMapView clampRect:toMinZoom:maxZoom:withFixedPoint:](self, "clampRect:toMinZoom:maxZoom:withFixedPoint:", v16, v17, v67, v69, v71, v73, v79, v80, *(void *)&y);
    double v67 = v82;
    double v69 = v83;
    double v71 = v84;
    double v73 = v85;
  }

  double v86 = v67;
  double v87 = v69;
  double v88 = v71;
  double v89 = v73;
  result.var1.double var1 = v89;
  result.var1.double var0 = v88;
  result.var0.double var1 = v87;
  result.var0.double var0 = v86;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)displayMapRegionForSearchResult:(id)a3
{
  BOOL v3 = [a3 mapItem];
  uint64_t v4 = [v3 _geoMapItem];
  uint64_t v5 = [v4 displayMapRegionOrNil];

  if (v5)
  {
    GEOMapRectForMapRegion();
    double x = v6;
    double y = v8;
    double width = v10;
    double height = v12;
  }
  else
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.var1.double var1 = v17;
  result.var1.double var0 = v16;
  result.var0.double var1 = v15;
  result.var0.double var0 = v14;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5
{
  -[MKMapView clampRect:toMinZoom:maxZoom:withFixedPoint:](self, "clampRect:toMinZoom:maxZoom:withFixedPoint:", a4, a5, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, a3.var0.var0 + a3.var1.var0 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5);
  result.var1.double var1 = v8;
  result.var1.double var0 = v7;
  result.var0.double var1 = v6;
  result.var0.double var0 = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5 withFixedPoint:(id)a6
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  double v9 = a3.var1.var1;
  double v10 = a3.var1.var0;
  double v11 = a3.var0.var1;
  double v12 = a3.var0.var0;
  id v14 = a4;
  id v15 = a5;
  -[MKMapView _zoomLevelForMapRect:includeAccessoryPadding:](self, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v12, v11, v10, v9);
  double v17 = v16;
  if (v14 && ([v14 doubleValue], id v18 = v14, v17 < v19)
    || v15 && ([v15 doubleValue], id v18 = v15, v17 > v20))
  {
    [v18 doubleValue];
    long double v22 = exp2(v17 - v21);
    double v23 = v10 * v22;
    double v24 = v9 * v22;
    double v12 = v12 * (v23 / v10) + var0 * (1.0 - v23 / v10);
    double v11 = v11 * (v24 / v9) + var1 * (1.0 - v24 / v9);
    double v10 = v23;
    double v9 = v24;
  }

  double v25 = v12;
  double v26 = v11;
  double v27 = v10;
  double v28 = v9;
  result.var1.double var1 = v28;
  result.var1.double var0 = v27;
  result.var0.double var1 = v26;
  result.var0.double var0 = v25;
  return result;
}

- (BOOL)isShowingImagery
{
  MKMapType v2 = [(MKMapView *)self mapType];
  return v2 != MKMapTypeMutedStandard && v2 != MKMapTypeStandard;
}

- (id)snapshotImage
{
  BOOL v3 = +[UIScreen mainScreen];
  [v3 scale];
  uint64_t v4 = -[MKMapView snapshotImageWithScale:](self, "snapshotImageWithScale:");

  return v4;
}

- (id)snapshotImageWithScale:(double)a3
{
  return [(MKMapView *)self snapshotImageWithScale:1 allowSnapshotting:a3];
}

- (id)snapshotImageWithScale:(double)a3 allowSnapshotting:(BOOL)a4
{
  BOOL v4 = a4;
  [(MKMapView *)self bounds];
  v21.double width = v7;
  v21.double height = v8;
  UIGraphicsBeginImageContextWithOptions(v21, 0, a3);
  double v9 = [(MKMapView *)self window];
  double v10 = [v9 windowScene];

  if ([v10 activationState])
  {
    id v11 = [v10 activationState];
    if (!v4 || v11 != (id)1) {
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  double v12 = [(MKMapView *)self window];
  uint64_t v13 = [v12 screen];
  if (v13)
  {
    id v14 = (void *)v13;
    unsigned int v15 = +[UIApplication _maps_isAnySceneForegroundForRole:_UIWindowSceneSessionTypeCoverSheet];

    if (!v15)
    {
      [(MKMapView *)self bounds];
      -[MKMapView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
      goto LABEL_11;
    }
  }
  else
  {
  }
LABEL_10:
  id v16 = [(MKMapView *)self rendersInBackground];
  [(MKMapView *)self setRendersInBackground:1];
  double v17 = [(MKMapView *)self layer];
  [v17 renderInContext:UIGraphicsGetCurrentContext()];

  [(MKMapView *)self setRendersInBackground:v16];
LABEL_11:
  id v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

+ (double)_animationDurationFromMapRect:(id)a3 toMapRect:(id)a4
{
  double v4 = sqrt((a3.var0.var1 + a3.var1.var1 * 0.5 - (a3.var0.var1 + a3.var1.var1 * 0.5))* (a3.var0.var1 + a3.var1.var1 * 0.5 - (a3.var0.var1 + a3.var1.var1 * 0.5))+ (a3.var0.var0 + a3.var1.var0 * 0.5 - (a4.var0.var0 + a4.var1.var0 * 0.5))* (a3.var0.var0 + a3.var1.var0 * 0.5 - (a4.var0.var0 + a4.var1.var0 * 0.5)));
  double v5 = vabdd_f64(a3.var1.var0 * 0.866025404, a4.var1.var0 * 0.866025404);
  if (v4 <= v5) {
    double v4 = v5;
  }
  return fmin(fmax(v4 * 0.00001, 0.2), 1.0);
}

- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 completion:(id)a5
{
}

- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 resetHeading:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v10 = a3.var0.var1;
  double v11 = a3.var0.var0;
  id v13 = a6;
  if (v11 != MKMapRectNull.origin.x || v10 != MKMapRectNull.origin.y)
  {
    -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v11, v10, var0, var1, 60.0, 60.0, 60.0, 60.0);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(MKMapView *)self bounds];
    double v25 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v16, v18, v20, v22, v23, v24);
    double v26 = v25;
    if (v6)
    {
      [v25 setHeading:0.0];
      if (!v7)
      {
LABEL_7:
        double v27 = objc_opt_class();
        [(MKMapView *)self visibleMapRect];
        [v27 _animationDurationFromMapRect:toMapRect:];
        double v29 = v28;
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100AD4DF8;
        v31[3] = &unk_1012E5D58;
        v31[4] = self;
        id v32 = v26;
        +[UIView animateWithDuration:v31 animations:v13 completion:v29];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      double v30 = [(MKMapView *)self camera];
      [v30 heading];
      [v26 setHeading:];

      if (!v7) {
        goto LABEL_7;
      }
    }
    [(MKMapView *)self setCamera:v26 animated:1 completionHandler:v13];
    goto LABEL_10;
  }
LABEL_11:
}

- (id)snapshotOptions
{
  id v3 = objc_alloc_init((Class)MKMapSnapshotOptions);
  [(MKMapView *)self bounds];
  [v3 setSize:v4, v5];
  BOOL v6 = +[UIScreen mainScreen];
  [v6 scale];
  [v3 setScale:];

  [v3 setMapType:[self mapType]];
  [(MKMapView *)self visibleMapRect];
  [v3 setMapRect:];
  BOOL v7 = [(MKMapView *)self camera];
  [v3 setCamera:v7];

  return v3;
}

- (void)getRapSnapshotImageDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    double v5 = [(MKMapView *)self snapshotOptions];
    id v6 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v5];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C0709C;
    v7[3] = &unk_10131B6D0;
    id v8 = v4;
    [v6 startWithCompletionHandler:v7];
  }
  else
  {
    double v5 = [(MKMapView *)self snapshotImage];
    UIImageJPEGRepresentation(v5, 0.400000006);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }
}

- (void)_performFlyoverAnnouncementAnimation:(id)a3
{
  id v4 = a3;
  double v5 = +[MKMapService sharedService];
  [v5 captureUserAction:17024 flyoverAnimationID:[v4 animationID]];

  id v6 = [v4 flyover];

  [(MKMapView *)self _performFlyoverAnimation:v6];
}

@end