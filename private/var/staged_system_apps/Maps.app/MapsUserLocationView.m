@interface MapsUserLocationView
- (BOOL)_isSelectable;
- (BOOL)isOnAnotherFloorInVenue;
- (BOOL)isPedestrianARAvailable;
- (BOOL)isVLFBannerVisible;
- (BOOL)isVLFLocalizationInProgress;
- (BOOL)isVLFOutsideEdgeInsets;
- (BOOL)isVLFOverlappingFloatingControls;
- (BOOL)isVLFPuckVisible;
- (BOOL)shouldShowVLFBanner;
- (BOOL)shouldShowVLFPuck;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (CGPoint)_bottomCalloutOffset;
- (CGRect)_significantBounds;
- (MapsUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)vlfCalloutViewWidthConstraint;
- (UIEdgeInsets)_annotationTrackingInsets;
- (VLFCalloutView)vlfCalloutView;
- (VLFPuckModeCircleView)vlfPuckModeCircleView;
- (double)maxVLFCalloutWidth;
- (double)vlfCalloutAlpha;
- (float)_selectionPriority;
- (id)detailCalloutAccessoryView;
- (id)vlfSessionAnalyticsTracker;
- (id)vlfSessionTask;
- (int64_t)vlfMode;
- (unint64_t)_allowedCalloutEdges;
- (void)_mapVisibleCenteringRectChanged;
- (void)_setIsOnAnotherFloorInVenue:(BOOL)a3;
- (void)_setMapPitchRadians:(double)a3;
- (void)_updateFromMap;
- (void)adjustVLFUIVisibility;
- (void)animateVLFPuckOnce;
- (void)calloutViewWasDismissed:(id)a3;
- (void)checkIsWithinEdgeInsets;
- (void)deselectOrUpdateCalloutViewIfNeeded;
- (void)selectOrUpdateCalloutViewIfNeeded;
- (void)setIsPedestrianARAvailable:(BOOL)a3;
- (void)setVlfCalloutAlpha:(double)a3;
- (void)setVlfCalloutView:(id)a3;
- (void)setVlfCalloutViewWidthConstraint:(id)a3;
- (void)setVlfLocalizationInProgress:(BOOL)a3;
- (void)setVlfMode:(int64_t)a3;
- (void)setVlfOutsideEdgeInsets:(BOOL)a3;
- (void)setVlfOverlappingFloatingControls:(BOOL)a3;
- (void)setVlfPuckModeCircleView:(id)a3;
- (void)updateStateFromLocation:(id)a3 duration:(double)a4;
- (void)updateVLFCalloutWidth;
- (void)updateVlfCalloutAlpha;
- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3;
- (void)vlfContaineeViewControllerWillHideFailureViewNotification:(id)a3;
- (void)vlfContaineeViewControllerWillShowFailureViewNotification:(id)a3;
- (void)vlfSessionDidStartNotification:(id)a3;
- (void)vlfSessionDidStopNotification:(id)a3;
- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3;
@end

@implementation MapsUserLocationView

- (void)_setMapPitchRadians:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MapsUserLocationView;
  -[MapsUserLocationView _setMapPitchRadians:](&v9, "_setMapPitchRadians:");
  if (+[VLFSessionTask isVLFModeSupported])
  {
    if (self->_vlfPuckModeCircleView)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      CATransform3DMakeRotation(&v8, a3, 1.0, 0.0, 0.0);
      v5 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView backgroundView];
      v6 = [v5 layer];
      CATransform3D v7 = v8;
      [v6 setTransform:&v7];

      +[CATransaction commit];
    }
  }
}

- (id)detailCalloutAccessoryView
{
  if ((id)[(MapsUserLocationView *)self vlfMode] == (id)2)
  {
    v3 = [(MapsUserLocationView *)self vlfCalloutView];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationView;
    v3 = [(MapsUserLocationView *)&v5 detailCalloutAccessoryView];
  }

  return v3;
}

- (MapsUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MapsUserLocationView;
  v4 = [(UserLocationView *)&v11 initWithAnnotation:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4)
  {
    [(MapsUserLocationView *)v4 _setCalloutStyle:1];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"vlfSessionDidStartNotification:" name:@"VLFSessionDidStartNotification" object:0];

    CATransform3D v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"vlfSessionTaskWillShowVLFUINotification:" name:@"VLFSessionTaskWillShowVLFUINotification" object:0];

    CATransform3D v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"vlfContaineeViewControllerWillShowFailureViewNotification:" name:off_1015F7860 object:0];

    objc_super v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"vlfContaineeViewControllerWillHideFailureViewNotification:" name:off_1015F7868 object:0];
  }
  return v5;
}

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MapsUserLocationView;
  [(UserLocationView *)&v5 updateStateFromLocation:a3 duration:a4];
  if (+[VLFSessionTask isVLFModeSupported])
  {
    [(MapsUserLocationView *)self checkIsWithinEdgeInsets];
    [(MapsUserLocationView *)self adjustVLFUIVisibility];
  }
}

- (void)_setIsOnAnotherFloorInVenue:(BOOL)a3
{
  if (self->_isOnAnotherFloorInVenue != a3)
  {
    self->_isOnAnotherFloorInVenue = a3;
    if (a3) {
      double v4 = 0.300000012;
    }
    else {
      double v4 = 1.0;
    }
    if (a3) {
      float v5 = 249.0;
    }
    else {
      float v5 = 1000.0;
    }
    [(MapsUserLocationView *)self setPuckAlpha:v4];
    [(MapsUserLocationView *)self setAccuracyRingAlpha:v4];
    *(float *)&double v6 = v5;
    [(MapsUserLocationView *)self _setSelectionPriority:v6];
  }
}

- (void)setVlfCalloutAlpha:(double)a3
{
  self->_vlfCalloutAlpha = a3;
  [(MapsUserLocationView *)self updateVlfCalloutAlpha];
}

- (VLFPuckModeCircleView)vlfPuckModeCircleView
{
  if (!+[VLFSessionTask isVLFModeSupported])
  {
    v20 = sub_1005762E4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[MapsUserLocationView vlfPuckModeCircleView]";
      __int16 v28 = 2080;
      v29 = "MapsUserLocationView.m";
      __int16 v30 = 1024;
      int v31 = 271;
      __int16 v32 = 2080;
      v33 = "VLFSessionTask.isVLFModeSupported";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
  if (!vlfPuckModeCircleView)
  {
    double v4 = -[VLFPuckModeCircleView initWithFrame:]([VLFPuckModeCircleView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    float v5 = self->_vlfPuckModeCircleView;
    self->_vlfPuckModeCircleView = v4;

    [(MapsUserLocationView *)self addSubview:self->_vlfPuckModeCircleView];
    double v6 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView centerXAnchor];
    CATransform3D v7 = [(MapsUserLocationView *)self centerXAnchor];
    CATransform3D v8 = [v6 constraintEqualToAnchor:v7];
    v25[0] = v8;
    objc_super v9 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView centerYAnchor];
    v10 = [(MapsUserLocationView *)self centerYAnchor];
    objc_super v11 = [v9 constraintEqualToAnchor:v10];
    v25[1] = v11;
    v12 = +[NSArray arrayWithObjects:v25 count:2];
    +[NSLayoutConstraint activateConstraints:v12];

    [*(id *)&self->super._MKUserLocationView_opaque[OBJC_IVAR____MKPuckAnnotationView__puckLayer] zPosition];
    double v14 = v13 + 1.0;
    v15 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView layer];
    [v15 setZPosition:v14];

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(MapsUserLocationView *)self _mapPitchRadians];
    CATransform3DMakeRotation(&v24, v16, 1.0, 0.0, 0.0);
    v17 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView backgroundView];
    v18 = [v17 layer];
    CATransform3D v23 = v24;
    [v18 setTransform:&v23];

    +[CATransaction commit];
    vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
  }

  return vlfPuckModeCircleView;
}

- (void)setVlfOverlappingFloatingControls:(BOOL)a3
{
  if (self->_vlfOverlappingFloatingControls != a3)
  {
    self->_vlfOverlappingFloatingControls = a3;
    [(MapsUserLocationView *)self updateVlfCalloutAlpha];
  }
}

- (void)_updateFromMap
{
  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationView;
  [(MapsUserLocationView *)&v3 _updateFromMap];
  if (+[VLFSessionTask isVLFModeSupported])
  {
    [(MapsUserLocationView *)self checkIsWithinEdgeInsets];
    [(MapsUserLocationView *)self adjustVLFUIVisibility];
  }
}

- (void)setVlfOutsideEdgeInsets:(BOOL)a3
{
  if (self->_vlfOutsideEdgeInsets != a3)
  {
    self->_vlfOutsideEdgeInsets = a3;
    [(MapsUserLocationView *)self updateVlfCalloutAlpha];
  }
}

- (void)adjustVLFUIVisibility
{
  if ([(MapsUserLocationView *)self shouldShowVLFPuck])
  {
    [(MapsUserLocationView *)self setCanShowCallout:1];
    objc_super v3 = +[VLFSessionUsageTracker sharedInstance];
    unsigned int v4 = [v3 hasUserSeenVLFCallout];

    if (v4)
    {
      float v5 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
      unsigned __int8 v6 = [v5 isVisible];

      CATransform3D v7 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
      [v7 show];

      if ((v6 & 1) == 0)
      {
        CATransform3D v8 = [(MapsUserLocationView *)self vlfSessionAnalyticsTracker];
        [v8 registerVLFPuckWasShown];

        if ([(MapsUserLocationView *)self isSelected])
        {
          objc_super v9 = [(MapsUserLocationView *)self _mapView];
          v10 = [(MapsUserLocationView *)self annotation];
          [v9 deselectAnnotation:v10 animated:1];
        }
      }
    }
    else
    {
      [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView hide];
    }
    if ([(MapsUserLocationView *)self shouldShowVLFBanner]
      && ![(MapsUserLocationView *)self isVLFBannerVisible])
    {
      [(MapsUserLocationView *)self selectOrUpdateCalloutViewIfNeeded];
    }
    else if ([(MapsUserLocationView *)self isVLFBannerVisible] {
           && ![(MapsUserLocationView *)self shouldShowVLFBanner])
    }
    {
      goto LABEL_13;
    }
  }
  else
  {
    [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView hide];
    [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView stopPulsing];
    if ([(MapsUserLocationView *)self isVLFBannerVisible]) {
LABEL_13:
    }
      [(MapsUserLocationView *)self deselectOrUpdateCalloutViewIfNeeded];
  }
  [(MapsUserLocationView *)self updateVlfCalloutAlpha];

  [(MapsUserLocationView *)self updateVLFCalloutWidth];
}

- (BOOL)shouldShowVLFPuck
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"VLFSessionAlwaysShowPuckKey"];

  if (v4)
  {
    float v5 = sub_1000D46EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Debug key to always show the puck is enabled; should show VLF puck",
        buf,
        2u);
    }

    return 1;
  }
  if (![(MapsUserLocationView *)self vlfMode])
  {
    CATransform3D v7 = sub_1000D46EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      CATransform3D v8 = "VLF mode is .Off; should NOT show VLF puck";
      objc_super v9 = v19;
      goto LABEL_11;
    }
LABEL_12:

    return 0;
  }
  if ([(MapsUserLocationView *)self isPedestrianARAvailable])
  {
    CATransform3D v7 = sub_1000D46EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      CATransform3D v8 = "Pedestrian AR is available; should NOT show VLF puck";
      objc_super v9 = (uint8_t *)&v18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  [(MapsUserLocationView *)self locationAccuracy];
  double v11 = v10;
  GEOConfigGetDouble();
  if (v11 >= v12)
  {
    [(MapsUserLocationView *)self _locationAccuracyInScreenPoints];
    double v15 = v14;
    GEOConfigGetDouble();
    BOOL v13 = v15 >= v16;
  }
  else
  {
    BOOL v13 = 0;
  }
  [(MapsUserLocationView *)self _locationAccuracyInScreenPoints];
  return v17 >= 44.0 && v13;
}

- (int64_t)vlfMode
{
  return self->_vlfMode;
}

- (BOOL)isVLFBannerVisible
{
  objc_super v3 = [(MapsUserLocationView *)self _calloutView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [(MapsUserLocationView *)self _calloutView];
    unsigned __int8 v5 = [v4 isVisible];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)updateVLFCalloutWidth
{
  [(MapsUserLocationView *)self maxVLFCalloutWidth];
  double v4 = v3 + -27.0;
  id v5 = [(MapsUserLocationView *)self vlfCalloutViewWidthConstraint];
  [v5 setConstant:v4];
}

- (NSLayoutConstraint)vlfCalloutViewWidthConstraint
{
  return self->_vlfCalloutViewWidthConstraint;
}

- (double)maxVLFCalloutWidth
{
  double v3 = [(MapsUserLocationView *)self _mapView];
  [v3 bounds];
  double v5 = v4;
  unsigned __int8 v6 = [(MapsUserLocationView *)self _mapView];
  [v6 bounds];
  double v8 = v7;
  objc_super v9 = [(MapsUserLocationView *)self _mapView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if (v5 >= v8) {
    double v14 = v13;
  }
  else {
    double v14 = v11;
  }

  double result = v14 + -32.0;
  if (MKPopoverSmallCalloutDeviceIndependentMaxWidth < v14 + -32.0) {
    return MKPopoverSmallCalloutDeviceIndependentMaxWidth;
  }
  return result;
}

- (void)checkIsWithinEdgeInsets
{
  if (+[VLFSessionTask isVLFModeSupported])
  {
    vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
    [(VLFPuckModeCircleView *)vlfPuckModeCircleView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(MapsUserLocationView *)self _mapView];
    -[VLFPuckModeCircleView convertRect:toView:](vlfPuckModeCircleView, "convertRect:toView:", v12, v5, v7, v9, v11);
    CGFloat v14 = v13;
    CGFloat v64 = v16;
    CGFloat v65 = v15;
    CGFloat rect2 = v17;

    __int16 v18 = [(MapsUserLocationView *)self _calloutView];
    v19 = [(MapsUserLocationView *)self _calloutView];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    __int16 v28 = [(MapsUserLocationView *)self _mapView];
    [v18 convertRect:v28 toView:v21];
    CGFloat v61 = v30;
    CGFloat v62 = v29;
    CGFloat v59 = v32;
    CGFloat v60 = v31;

    v33 = [(MapsUserLocationView *)self _mapView];
    [v33 _edgeInsets];
    double v35 = v34;

    v36 = [(MapsUserLocationView *)self _mapView];
    [v36 bounds];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;

    v45 = [(MapsUserLocationView *)self _mapView];
    [v45 bounds];
    double v57 = v46;
    CGFloat v58 = v47;
    double v49 = v48;
    double v51 = v50;

    if (!self->_vlfPuckModeCircleView) {
      goto LABEL_6;
    }
    v69.origin.x = v14;
    double v52 = v35 + 0.0;
    v67.origin.x = v38 + 0.0 + 22.0;
    v67.origin.y = v40 + 0.0;
    v67.size.width = v42 + -44.0;
    v67.size.height = v44 - v52 + -22.0;
    v69.size.width = v64;
    v69.origin.y = v65;
    v69.size.height = rect2;
    if (!CGRectContainsRect(v67, v69)) {
      goto LABEL_6;
    }
    uint64_t v53 = [(MapsUserLocationView *)self _calloutView];
    if (v53)
    {
      v54 = (void *)v53;
      v68.origin.x = v57 + 0.0;
      v68.origin.y = v49 + 0.0;
      v68.size.height = v51 - v52 + -15.0;
      v68.size.width = v58;
      v70.size.height = v59;
      v70.origin.y = v61;
      v70.origin.x = v62;
      v70.size.width = v60;
      BOOL v55 = CGRectContainsRect(v68, v70);

      uint64_t v56 = !v55;
    }
    else
    {
LABEL_6:
      uint64_t v56 = 1;
    }
    [(MapsUserLocationView *)self setVlfOutsideEdgeInsets:v56];
  }
}

- (void)updateVlfCalloutAlpha
{
  double v3 = [(MapsUserLocationView *)self _calloutView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(MapsUserLocationView *)self isVLFOverlappingFloatingControls]
      || [(MapsUserLocationView *)self isVLFOutsideEdgeInsets])
    {
      double v5 = [(MapsUserLocationView *)self _calloutView];
      [v5 setAlpha:0.0];
    }
    else
    {
      double v16 = [(MapsUserLocationView *)self _calloutView];
      [v16 alpha];
      double v18 = v17;

      [(MapsUserLocationView *)self vlfCalloutAlpha];
      double v20 = v19;
      double v21 = [(MapsUserLocationView *)self _calloutView];
      [v21 setAlpha:v20];

      if (fabs(v18) <= 2.22044605e-16)
      {
        double v22 = [(MapsUserLocationView *)self _calloutView];
        [v22 alpha];
        double v24 = v23;

        if (v24 > 0.0)
        {
          double v25 = [(MapsUserLocationView *)self vlfSessionAnalyticsTracker];
          [v25 registerVLFCalloutWasShown];
        }
      }
      [(MapsUserLocationView *)self vlfCalloutAlpha];
      if (v26 > 0.0)
      {
        double v27 = +[VLFSessionUsageTracker sharedInstance];
        unsigned __int8 v28 = [v27 hasUserSeenVLFCallout];

        if ((v28 & 1) == 0)
        {
          double v29 = +[VLFSessionUsageTracker sharedInstance];
          [v29 registerUserWasShownCallout];

          double v30 = sub_1000D46EC();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Detected that user was just shown the VLF callout for the first time; updating VLF UI visibility",
              v31,
              2u);
          }

          [(MapsUserLocationView *)self adjustVLFUIVisibility];
        }
      }
    }
    double v6 = [(MapsUserLocationView *)self _calloutView];
    [v6 alpha];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView stopPulsing];
    }
    else
    {
      double v9 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
      [v9 startPulsing];
    }
  }
  else
  {
    double v10 = [(MapsUserLocationView *)self _calloutView];
    double v11 = [v10 layer];
    double v12 = [v11 animationKeys];
    id v13 = [v12 count];

    if (!v13)
    {
      CGFloat v14 = [(MapsUserLocationView *)self _calloutView];
      [v14 setAlpha:1.0];

      vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
      [(VLFPuckModeCircleView *)vlfPuckModeCircleView stopPulsing];
    }
  }
}

- (void)_mapVisibleCenteringRectChanged
{
  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationView;
  [(MapsUserLocationView *)&v3 _mapVisibleCenteringRectChanged];
  if (+[VLFSessionTask isVLFModeSupported])
  {
    [(MapsUserLocationView *)self checkIsWithinEdgeInsets];
    [(MapsUserLocationView *)self adjustVLFUIVisibility];
  }
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MapsUserLocationView *)self isSelected];
  double v6 = [(MapsUserLocationView *)self annotation];
  if (!v6) {
    goto LABEL_20;
  }
  if (v5 && ![(MapsUserLocationView *)self isVLFPuckVisible])
  {
    double v7 = +[MKMapService sharedService];
    [v7 captureUserAction:1034 onTarget:0 eventValue:0];
  }
  if (![(MapsUserLocationView *)self shouldShowVLFPuck]
    || ([(MapsUserLocationView *)self _calloutView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    double v10 = sub_1000D46EC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      double v11 = @"NO";
      if (v5) {
        double v11 = @"YES";
      }
      double v12 = v11;
      *(_DWORD *)buf = 138412290;
      double v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Updating regular callout for selected: %@", buf, 0xCu);
    }
    id v13 = [v6 annotation];
    [v13 setSelected:v5];
    v21.receiver = self;
    v21.super_class = (Class)MapsUserLocationView;
    BOOL v14 = [(MapsUserLocationView *)&v21 updateCalloutViewIfNeededAnimated:v3];

    goto LABEL_21;
  }
  if ([(MapsUserLocationView *)self shouldShowVLFBanner]
    && ![(MapsUserLocationView *)self isVLFBannerVisible]
    && ((v5 ^ 1) & 1) == 0)
  {
    double v15 = sub_1000D46EC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Showing VLF banner", buf, 2u);
    }

    [(MapsUserLocationView *)self _setCalloutStyle:2];
    v20.receiver = self;
    v20.super_class = (Class)MapsUserLocationView;
    BOOL v14 = [(MapsUserLocationView *)&v20 updateCalloutViewIfNeededAnimated:0];
    double v16 = [(MapsUserLocationView *)self _calloutView];
    [v16 setHideTitle:1];
    [v16 _updateCalloutAnimated:0];
    [v16 _layoutSubviews:0];
    [(MapsUserLocationView *)self _setCalloutStyle:1];

    goto LABEL_21;
  }
  if ([(MapsUserLocationView *)self shouldShowVLFBanner]
    || ((![(MapsUserLocationView *)self isVLFBannerVisible] | v5) & 1) != 0)
  {
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  double v18 = sub_1000D46EC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Hiding VLF banner", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)MapsUserLocationView;
  BOOL v14 = [(MapsUserLocationView *)&v19 updateCalloutViewIfNeededAnimated:v3];
LABEL_21:

  return v14;
}

- (unint64_t)_allowedCalloutEdges
{
  if ([(MapsUserLocationView *)self shouldShowVLFBanner]) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  return [(MapsUserLocationView *)&v4 _allowedCalloutEdges];
}

- (CGPoint)_bottomCalloutOffset
{
  if ([(MapsUserLocationView *)self shouldShowVLFBanner])
  {
    double v3 = 5.0;
    double v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationView;
    [(MapsUserLocationView *)&v5 _bottomCalloutOffset];
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  if ([(MapsUserLocationView *)self isVLFLocalizationInProgress])
  {
    double v3 = [(MapsUserLocationView *)self _mapView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v8 = [(MapsUserLocationView *)self _mapView];
    [v8 _edgeInsets];
    double v11 = v5 - (v9 + v10);
    double v14 = v7 - (v12 + v13);

    if (v11 >= v14) {
      double v15 = v14;
    }
    else {
      double v15 = v11;
    }
    double v16 = v15 * 0.6;
    double v17 = (v14 - v15 * 0.6) * 0.5;
    double v18 = (v11 - v16) * 0.5;
    double v19 = v17;
    double v20 = v18;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MapsUserLocationView;
    [(MapsUserLocationView *)&v21 _annotationTrackingInsets];
  }
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGRect)_significantBounds
{
  if ([(MapsUserLocationView *)self isVLFPuckVisible])
  {
    double v3 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    double v4 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    [v4 bounds];
    [v3 convertRect:self];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MapsUserLocationView;
    [(MapsUserLocationView *)&v21 _significantBounds];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (float)_selectionPriority
{
  if ([(MapsUserLocationView *)self isVLFPuckVisible]) {
    return 1000.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  [(MapsUserLocationView *)&v4 _selectionPriority];
  return result;
}

- (BOOL)_isSelectable
{
  if ([(MapsUserLocationView *)self isVLFPuckVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  return [(MapsUserLocationView *)&v4 _isSelectable];
}

- (void)animateVLFPuckOnce
{
  id v2 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
  [v2 pulseOnce];
}

- (BOOL)isVLFPuckVisible
{
  unsigned int v3 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView isVisible];
  if (v3) {
    LOBYTE(v3) = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView isHidden] ^ 1;
  }
  return v3;
}

- (BOOL)shouldShowVLFBanner
{
  if ((id)[(MapsUserLocationView *)self vlfMode] != (id)2
    || ![(MapsUserLocationView *)self shouldShowVLFPuck]
    || [(MapsUserLocationView *)self isVLFLocalizationInProgress])
  {
    return 0;
  }

  return GEOConfigGetBOOL();
}

- (void)selectOrUpdateCalloutViewIfNeeded
{
  if ([(MapsUserLocationView *)self isSelected])
  {
    [(MapsUserLocationView *)self updateCalloutViewIfNeededAnimated:0];
  }
  else
  {
    [(MapsUserLocationView *)self setSelected:1 animated:1];
  }
}

- (void)deselectOrUpdateCalloutViewIfNeeded
{
  if ([(MapsUserLocationView *)self isSelected])
  {
    [(MapsUserLocationView *)self setSelected:0 animated:1];
  }
  else
  {
    [(MapsUserLocationView *)self updateCalloutViewIfNeededAnimated:0];
  }
}

- (void)setVlfMode:(int64_t)a3
{
  if (self->_vlfMode != a3)
  {
    self->_int64_t vlfMode = a3;
    objc_super v4 = sub_1000D46EC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t vlfMode = self->_vlfMode;
      int v6 = 134217984;
      int64_t v7 = vlfMode;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting VLF Mode: %ld", (uint8_t *)&v6, 0xCu);
    }

    [(MapsUserLocationView *)self checkIsWithinEdgeInsets];
    [(MapsUserLocationView *)self adjustVLFUIVisibility];
  }
}

- (void)setIsPedestrianARAvailable:(BOOL)a3
{
  if (self->_isPedestrianARAvailable != a3)
  {
    self->_isPedestrianARAvailable = a3;
    objc_super v4 = sub_1000D46EC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_isPedestrianARAvailable) {
        double v5 = @"YES";
      }
      else {
        double v5 = @"NO";
      }
      int v6 = v5;
      int v7 = 138412290;
      double v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating pedestrian AR availability: %@", (uint8_t *)&v7, 0xCu);
    }
    [(MapsUserLocationView *)self checkIsWithinEdgeInsets];
    [(MapsUserLocationView *)self adjustVLFUIVisibility];
  }
}

- (VLFCalloutView)vlfCalloutView
{
  vlfCalloutView = self->_vlfCalloutView;
  if (!vlfCalloutView)
  {
    objc_super v4 = -[VLFCalloutView initWithFrame:]([VLFCalloutView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v5 = self->_vlfCalloutView;
    self->_vlfCalloutView = v4;

    [(VLFCalloutView *)self->_vlfCalloutView setDelegate:self];
    int v6 = [(VLFCalloutView *)self->_vlfCalloutView widthAnchor];
    [(MapsUserLocationView *)self maxVLFCalloutWidth];
    [v6 constraintEqualToConstant:];
    int v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    vlfCalloutViewWidthConstraint = self->_vlfCalloutViewWidthConstraint;
    self->_vlfCalloutViewWidthConstraint = v7;

    double v11 = self->_vlfCalloutViewWidthConstraint;
    double v9 = +[NSArray arrayWithObjects:&v11 count:1];
    +[NSLayoutConstraint activateConstraints:v9];

    vlfCalloutView = self->_vlfCalloutView;
  }

  return vlfCalloutView;
}

- (id)vlfSessionTask
{
  id v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  unsigned int v3 = [v2 platformController];
  objc_super v4 = [v3 auxiliaryTasksManager];
  double v5 = [v4 auxilaryTaskForClass:objc_opt_class()];

  return v5;
}

- (id)vlfSessionAnalyticsTracker
{
  id v2 = [(MapsUserLocationView *)self vlfSessionTask];
  unsigned int v3 = [v2 analyticsTracker];

  return v3;
}

- (void)calloutViewWasDismissed:(id)a3
{
  id v3 = +[VLFSessionUsageTracker sharedInstance];
  [v3 registerUserDismissedCallout];
}

- (void)vlfSessionDidStartNotification:(id)a3
{
  objc_super v4 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
  [v4 setHidden:1];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"vlfSessionDidStopNotification:" name:@"VLFSessionDidStopNotification" object:0];
}

- (void)vlfSessionDidStopNotification:(id)a3
{
  objc_super v4 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
  [v4 setHidden:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"VLFSessionDidStopNotification" object:0];
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  if ([(MapsUserLocationView *)self isVLFBannerVisible])
  {
    objc_super v4 = [(MapsUserLocationView *)self _calloutView];
    [v4 alpha];
    double v6 = v5;

    if (v6 > 0.0)
    {
      int v7 = +[VLFSessionUsageTracker sharedInstance];
      [v7 registerUserTappedCallout];
    }
  }
  double v8 = +[VLFSessionUsageTracker sharedInstance];
  [v8 registerUserEnteredVLF];

  [(MapsUserLocationView *)self setVlfLocalizationInProgress:1];
  [(MapsUserLocationView *)self setHeadingIndicatorStyle:2];
  double v9 = sub_1000D46EC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VLFSession started; setting heading indicator style to .VisualLocalizationScan",
      v11,
      2u);
  }

  [(MapsUserLocationView *)self setEnabled:0];
  double v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"vlfContaineeViewControllerDidDisappearNotification:" name:off_1015F7850 object:0];
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:off_1015F7850 object:0];

  [(MapsUserLocationView *)self setVlfLocalizationInProgress:0];
  if (![(MapsUserLocationView *)self shouldShowVLFPuck])
  {
    double v5 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    double v6 = [v5 layer];
    [v6 removeAllAnimations];

    int v7 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    double v8 = [(VLFPuckModeCircleView *)self->_vlfPuckModeCircleView layer];
    [v8 opacity];
    [v7 hideWithDuration:1 startingOpacity:0 shouldShrink:0.0 suppressOtherAnimations:v9];
  }
  if ([(UserLocationView *)self mode]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = GEOConfigGetBOOL() ^ 1;
  }
  [(MapsUserLocationView *)self setHeadingIndicatorStyle:v10];
  double v11 = sub_1000D46EC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    id v13 = [(MapsUserLocationView *)self headingIndicatorStyle];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "VLFSession stopped; resetting heading indicator style: %ld",
      (uint8_t *)&v12,
      0xCu);
  }

  [(MapsUserLocationView *)self setEnabled:1];
}

- (void)vlfContaineeViewControllerWillShowFailureViewNotification:(id)a3
{
  if ([(MapsUserLocationView *)self shouldShowVLFPuck])
  {
    objc_super v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"VLFSessionScanningAnimationSlowDownKey"];

    if (v5) {
      double v6 = 5.0;
    }
    else {
      double v6 = 0.3;
    }
    id v8 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    [v8 showWithDuration:0 startingOpacity:1 shouldGrow:v6 suppressOtherAnimations:0.0];
  }
  else
  {
    int v7 = sub_1000D46EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VLF failure UI was shown but we shouldn't be showing the VLF puck; ignoring",
        buf,
        2u);
    }
  }
}

- (void)vlfContaineeViewControllerWillHideFailureViewNotification:(id)a3
{
  if ([(MapsUserLocationView *)self shouldShowVLFPuck])
  {
    objc_super v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"VLFSessionScanningAnimationSlowDownKey"];

    if (v5) {
      double v6 = 5.0;
    }
    else {
      double v6 = 0.2;
    }
    id v8 = [(MapsUserLocationView *)self vlfPuckModeCircleView];
    [v8 hideWithDuration:0 startingOpacity:1 shouldShrink:v6 suppressOtherAnimations:1.0];
  }
  else
  {
    int v7 = sub_1000D46EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VLF failure UI was hidden but we shouldn't be showing the VLF puck; ignoring",
        buf,
        2u);
    }
  }
}

- (BOOL)isOnAnotherFloorInVenue
{
  return self->_isOnAnotherFloorInVenue;
}

- (BOOL)isPedestrianARAvailable
{
  return self->_isPedestrianARAvailable;
}

- (void)setVlfPuckModeCircleView:(id)a3
{
}

- (BOOL)isVLFOverlappingFloatingControls
{
  return self->_vlfOverlappingFloatingControls;
}

- (BOOL)isVLFOutsideEdgeInsets
{
  return self->_vlfOutsideEdgeInsets;
}

- (double)vlfCalloutAlpha
{
  return self->_vlfCalloutAlpha;
}

- (BOOL)isVLFLocalizationInProgress
{
  return self->_vlfLocalizationInProgress;
}

- (void)setVlfLocalizationInProgress:(BOOL)a3
{
  self->_vlfLocalizationInProgress = a3;
}

- (void)setVlfCalloutView:(id)a3
{
}

- (void)setVlfCalloutViewWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfCalloutViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_vlfCalloutView, 0);

  objc_storeStrong((id *)&self->_vlfPuckModeCircleView, 0);
}

@end