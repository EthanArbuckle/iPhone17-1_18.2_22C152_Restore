@interface MapsRouteCreationContext
- (BOOL)_wouldDuplicateTrailingAnchorWithCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)chromeDidSelectAnnotationView:(id)a3;
- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3;
- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3;
- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3;
- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3;
- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5;
- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3;
- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3;
- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3;
- (BOOL)closeLoopEnabled;
- (BOOL)outAndBackEnabled;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)reverseEnabled;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)undoEnabled;
- (BOOL)wantsCompassLayoutControl;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsMapSelectionControl;
- (BOOL)wantsRouteAnnotationsControl;
- (BOOL)wantsWeatherShowing;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)composedRoute;
- (MapsRouteCreationContext)initWithExistingMapItems:(id)a3;
- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration;
- (id)_anchorNearCoordinate:(CLLocationCoordinate2D)a3;
- (id)_anchorNearMapItem:(id)a3;
- (id)_anchorNearPoint:(CGPoint)a3;
- (id)_anchorPointNearMapItem:(id)a3 inAnchorPoints:(id)a4;
- (id)_errorMessageForError:(id)a3 directionsError:(id)a4 request:(id)a5 isOffline:(BOOL)a6 shouldBackoutEdit:(BOOL *)a7;
- (id)_errorMessageForUnsupportedCountry:(id)a3;
- (id)_mostRecentlyAddedAnchor;
- (id)_traits;
- (id)desiredCards;
- (id)emptyStateVideoName;
- (id)routeData;
- (int64_t)desiredFloatingControls;
- (unint64_t)_routeEditorActionForEditReason:(unint64_t)a3;
- (void)_appendAnchorPoint:(id)a3;
- (void)_appendCoordinate:(CLLocationCoordinate2D)a3 isCurrentLocation:(BOOL)a4;
- (void)_appendMapItem:(id)a3 isCurrentLocation:(BOOL)a4 isCoordinate:(BOOL)a5;
- (void)_backoutLastState;
- (void)_centerOnCurrentRouteAnimated:(BOOL)a3;
- (void)_createFakeButton;
- (void)_deleteFirstAnchorPointMatchingAnchorPoint:(id)a3;
- (void)_deleteLastAnchorPointMatchingAnchorPoint:(id)a3;
- (void)_expandCardIfNeeded;
- (void)_insertEditStackButtons;
- (void)_insertRecenterButtonIfNeeded;
- (void)_insertRippleAnnotationAtCoordinate:(CLLocationCoordinate2D)a3;
- (void)_moveContextMenuToPoint:(CGPoint)a3 anchorPoint:(id)a4;
- (void)_popEditStack;
- (void)_presentPopupViewForMessage:(id)a3 timeout:(double)a4 isError:(BOOL)a5 ignoreChromeTransitioning:(BOOL)a6;
- (void)_pushEditState:(id)a3 shouldRecenterOnCompletion:(BOOL)a4;
- (void)_removeEditStackButtons;
- (void)_removeRippleView;
- (void)_requeryStateWithAction:(unint64_t)a3 shouldRecenterOnCompletion:(BOOL)a4;
- (void)_setMenuAttachedAnchorPoint:(id)a3;
- (void)_showRecenterButton;
- (void)_undoEditStack:(id)a3;
- (void)_updateCoachingPillWithIgnoreChromeTransitioning:(BOOL)a3;
- (void)_updateMenu;
- (void)_updateScaleAndCompass;
- (void)_updateUndoVisibility;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)didSaveCustomRoute:(id)a3;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)menuWillDismissWithAnimator:(id)a3;
- (void)popContainee;
- (void)pressedCloseLoop;
- (void)pressedOutAndBack;
- (void)pressedRecenter;
- (void)pressedReverse;
- (void)pressedRoutePlanning;
- (void)pressedSave;
- (void)pressedStartNavigationWithCompletion:(id)a3;
- (void)pressedStartSteppingWithCompletion:(id)a3;
- (void)pressedUndo;
- (void)pushSaveContainee;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
@end

@implementation MapsRouteCreationContext

- (MapsRouteCreationContext)initWithExistingMapItems:(id)a3
{
  id v4 = a3;
  v89.receiver = self;
  v89.super_class = (Class)MapsRouteCreationContext;
  v5 = [(MapsRouteCreationContext *)&v89 init];
  if (v5)
  {
    v6 = (MNRouteEditor *)[objc_alloc((Class)MNRouteEditor) initWithTraceRecordingEnabled:GEOConfigGetBOOL()];
    routeEditor = v5->_routeEditor;
    v5->_routeEditor = v6;

    v8 = [[MapsRouteCreationContainee alloc] initWithContext:v5];
    editContainee = v5->_editContainee;
    v5->_editContainee = v8;

    v10 = [[MapsSaveRouteContainee alloc] initWithDelegate:v5 isEditing:0 showInitialKeyboard:1];
    saveContainee = v5->_saveContainee;
    v5->_saveContainee = v10;

    uint64_t v12 = +[NSMutableArray arrayWithObject:v5->_editContainee];
    containees = v5->_containees;
    v5->_containees = (NSMutableArray *)v12;

    [(ContaineeViewController *)v5->_editContainee setContaineeDelegate:v5];
    id v87 = v4;
    if ([v4 count]) {
      +[RouteCreationEditState initialEditStateFromMapItems:v4];
    }
    else {
    v14 = +[RouteCreationEditState initialEditStateFromRoute:0];
    }
    uint64_t v15 = +[NSMutableArray arrayWithObject:v14];
    editStack = v5->_editStack;
    v5->_editStack = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    undoManager = v5->_undoManager;
    v5->_undoManager = (NSUndoManager *)v17;

    v19 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
    uint64_t v20 = +[UIImageSymbolConfiguration configurationWithFont:v19];

    v21 = [[CardView alloc] initAllowingBlurredForButton:1];
    [(CardView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CardView *)v21 setLayoutStyle:6];
    id v22 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v23 = [v22 CGColor];
    v24 = [(CardView *)v21 layer];
    [v24 setBorderColor:v23];

    v25 = [(CardView *)v21 layer];
    [v25 setCornerRadius:8.0];

    v26 = [(CardView *)v21 layer];
    [v26 setBorderWidth:0.5];

    id v27 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v28 = [v27 CGColor];
    v29 = [(CardView *)v21 layer];
    [v29 setShadowColor:v28];

    v30 = [(CardView *)v21 layer];
    LODWORD(v31) = *(_DWORD *)"\nף=";
    [v30 setShadowOpacity:v31];

    v32 = [(CardView *)v21 layer];
    [v32 setShadowOffset:0.0, -2.0];

    v33 = [(CardView *)v21 layer];
    [v33 setShadowPathIsBounds:1];

    undoButtonContainer = v5->_undoButtonContainer;
    v5->_undoButtonContainer = v21;
    v88 = v21;

    v35 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 44.0, 44.0];
    [(UIButton *)v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v35 setAccessibilityIdentifier:@"UndoButton"];
    v86 = (void *)v20;
    v36 = +[UIImage systemImageNamed:@"arrow.uturn.backward" withConfiguration:v20];
    [(UIButton *)v35 setImage:v36 forState:0];

    [(UIButton *)v35 addTarget:v5 action:"pressedUndo" forControlEvents:64];
    v37 = +[NSBundle mainBundle];
    v38 = [v37 localizedStringForKey:@"[Route Creation] Undo" value:@"localized string not found" table:0];
    [(UIButton *)v35 setAccessibilityLabel:v38];

    undoButton = v5->_undoButton;
    v5->_undoButton = v35;
    v40 = v35;

    v41 = [[CardView alloc] initAllowingBlurredForButton:1];
    [(CardView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CardView *)v41 setLayoutStyle:6];
    id v42 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v43 = [v42 CGColor];
    v44 = [(CardView *)v41 layer];
    [v44 setBorderColor:v43];

    v45 = [(CardView *)v41 layer];
    [v45 setCornerRadius:8.0];

    v46 = [(CardView *)v41 layer];
    [v46 setBorderWidth:0.5];

    id v47 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v48 = [v47 CGColor];
    v49 = [(CardView *)v41 layer];
    [v49 setShadowColor:v48];

    v50 = [(CardView *)v41 layer];
    LODWORD(v51) = *(_DWORD *)"\nף=";
    [v50 setShadowOpacity:v51];

    v52 = [(CardView *)v41 layer];
    [v52 setShadowOffset:0.0, -2.0];

    v53 = [(CardView *)v41 layer];
    [v53 setShadowPathIsBounds:1];

    recenterButtonContainer = v5->_recenterButtonContainer;
    v5->_recenterButtonContainer = v41;
    v55 = v41;

    v56 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 44.0, 44.0];
    [(UIButton *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v56 setAccessibilityIdentifier:@"RecenterButton"];
    v57 = +[UIImage _systemImageNamed:@"location.bottomleft.forward.to.point.topright.scurvepath.dashed" withConfiguration:v20];
    [(UIButton *)v56 setImage:v57 forState:0];

    [(UIButton *)v56 addTarget:v5 action:"pressedRecenter" forControlEvents:64];
    [(UIButton *)v56 imageEdgeInsets];
    -[UIButton setImageEdgeInsets:](v56, "setImageEdgeInsets:");
    [(CardView *)v55 setAlpha:0.0];
    recenterButton = v5->_recenterButton;
    v5->_recenterButton = v56;
    v80 = v56;

    v59 = +[UIColor colorWithDynamicProvider:&stru_1012F8228];
    v82 = v40;
    [(UIButton *)v40 setTintColor:v59];

    v60 = [(UIButton *)v40 tintColor];
    [(UIButton *)v80 setTintColor:v60];

    [(MapsRouteCreationContext *)v5 _createFakeButton];
    uint64_t v61 = objc_opt_new();
    notificationGenerator = v5->_notificationGenerator;
    v5->_notificationGenerator = (UINotificationFeedbackGenerator *)v61;

    uint64_t v63 = objc_opt_new();
    rippleAnnotation = v5->_rippleAnnotation;
    v5->_rippleAnnotation = (MapsRippleAnnotation *)v63;

    v85 = [(CardView *)v88 widthAnchor];
    v84 = [v85 constraintEqualToConstant:44.0];
    v90[0] = v84;
    v83 = [(CardView *)v88 heightAnchor];
    v81 = [v83 constraintEqualToConstant:44.0];
    v90[1] = v81;
    v79 = [(UIButton *)v5->_undoButton widthAnchor];
    v78 = [v79 constraintEqualToConstant:44.0];
    v90[2] = v78;
    v77 = [(UIButton *)v5->_undoButton heightAnchor];
    v76 = [v77 constraintEqualToConstant:44.0];
    v90[3] = v76;
    v65 = v55;
    v75 = [(CardView *)v55 widthAnchor];
    v66 = [v75 constraintEqualToConstant:44.0];
    v90[4] = v66;
    v67 = [(CardView *)v55 heightAnchor];
    v68 = [v67 constraintEqualToConstant:44.0];
    v90[5] = v68;
    v69 = [(UIButton *)v5->_recenterButton widthAnchor];
    v70 = [v69 constraintEqualToConstant:44.0];
    v90[6] = v70;
    v71 = [(UIButton *)v5->_recenterButton heightAnchor];
    v72 = [v71 constraintEqualToConstant:44.0];
    v90[7] = v72;
    v73 = +[NSArray arrayWithObjects:v90 count:8];
    +[NSLayoutConstraint activateConstraints:v73];

    id v4 = v87;
  }

  return v5;
}

- (void)_createFakeButton
{
  [(MapsMenuButton *)self->_contextMenuFakeButton removeFromSuperview];
  v3 = [[MapsMenuButton alloc] initWithDelegate:self];
  contextMenuFakeButton = self->_contextMenuFakeButton;
  self->_contextMenuFakeButton = v3;

  [(MapsMenuButton *)self->_contextMenuFakeButton setShowsMenuAsPrimaryAction:1];
  [(MapsMenuButton *)self->_contextMenuFakeButton setHidden:1];
  objc_initWeak(&location, self);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100783034;
  uint64_t v12 = &unk_1012F8250;
  objc_copyWeak(&v13, &location);
  [(MapsMenuButton *)self->_contextMenuFakeButton _setMenuProvider:&v9];
  v5 = [(MapsRouteCreationContext *)self chromeViewController];
  unsigned int v6 = [v5 isTopContext:self];

  if (v6)
  {
    v7 = [(MapsRouteCreationContext *)self chromeViewController];
    v8 = [v7 mapView];
    [v8 addSubview:self->_contextMenuFakeButton];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  return self->_containees;
}

- (int64_t)desiredFloatingControls
{
  return 0;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007831BC;
  v8[3] = &unk_1012E6708;
  objc_copyWeak(&v9, &location);
  [v7 addPreparation:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(MNRouteEditor *)self->_routeEditor endSession];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100783590;
  v15[3] = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  [v7 addPreparation:v15];
  v8 = [v6 currentContextTransition];
  id v9 = [v8 enterAnimation];

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1007836F4;
    v13[3] = &unk_1012E6708;
    uint64_t v10 = &v14;
    objc_copyWeak(&v14, &location);
    [v9 addAnimations:v13];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100783740;
    v11[3] = &unk_1012E6998;
    uint64_t v10 = &v12;
    objc_copyWeak(&v12, &location);
    [v7 addCompletion:v11];
  }
  objc_destroyWeak(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)pushSaveContainee
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[MapsRouteCreationContext pushSaveContainee]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(MapsRouteCreationContext *)self _traits];
  [(MapsSaveRouteContainee *)self->_saveContainee setTraits:v4];

  [(NSMutableArray *)self->_containees addObject:self->_saveContainee];
  v5 = [(MapsRouteCreationContext *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)popContainee
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[MapsRouteCreationContext popContainee]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NSMutableArray *)self->_containees removeLastObject];
  id v4 = [(MapsRouteCreationContext *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)didSaveCustomRoute:(id)a3
{
  id v4 = a3;
  int v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[MapsRouteCreationContext didSaveCustomRoute:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  int v6 = [v4 routeID];
  id v7 = [(GEOComposedRoute *)self->_composedRoute uniqueRouteID];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    [(GEOComposedRoute *)self->_composedRoute updateWithPersistentData:v4];
    id v9 = [[MapsCustomRouteViewContext alloc] initWithExistingRoute:self->_composedRoute];
  }
  else
  {
    id v9 = [[MapsCustomRouteViewContext alloc] initWithExistingRouteData:v4];
  }
  uint64_t v10 = v9;
  [(MapsCustomRouteViewContext *)v9 setExitRouteCreationOnClose:1];
  v11 = [(MapsRouteCreationContext *)self chromeViewController];
  [v11 pushContext:v10 animated:1 completion:0];
}

- (id)_traits
{
  v3 = +[GEOMapService sharedService];
  id v4 = [v3 defaultUserInitiatedTraits];

  int v5 = [(MapsRouteCreationContext *)self chromeViewController];
  id v6 = [v5 currentTraits];

  if (v6) {
    [v4 copyTo:v6];
  }
  else {
    id v6 = v4;
  }

  return v6;
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5 = [(MapsRouteCreationContext *)self chromeViewController];
  [v5 popContext:self animated:1 completion:0];
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsRouteCreationContext *)self chromeViewController];
  unsigned int v6 = [v5 isTransitioning];

  if (v6)
  {
    id v7 = sub_10057683C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ignoring POI selection: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(UINotificationFeedbackGenerator *)self->_notificationGenerator notificationOccurred:0];
    [(MapsRouteCreationContext *)self _expandCardIfNeeded];
    unsigned int v8 = [v4 mapItem];
    [(MapsRouteCreationContext *)self _appendMapItem:v8 isCurrentLocation:0 isCoordinate:0];
  }
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v7 = a5;
  [a4 doubleValue];
  CLLocationDegrees v9 = v8;
  [v7 doubleValue];
  CLLocationDegrees v11 = v10;

  CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v9, v11);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v12.latitude, v12.longitude);
  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  [a3 coordinate];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  [a3 coordinate];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  id v4 = a3;
  CLLocationDegrees v5 = [(MapsRouteCreationContext *)self _anchorNearMapItem:v4];
  CLLocationCoordinate2D v6 = [(NSMutableArray *)self->_editStack lastObject];
  id v7 = [v6 anchorPoints];
  double v8 = [(MapsRouteCreationContext *)self _anchorPointNearMapItem:v4 inAnchorPoints:v7];

  anchorPointAttachedToMenu = self->_anchorPointAttachedToMenu;
  if (anchorPointAttachedToMenu)
  {
    double v10 = sub_10057683C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_15;
    }
    int v23 = 138412290;
    id v24 = v5;
    CLLocationDegrees v11 = "Ignoring anchor point at index: %@ (marker) due to an existing context menu";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v23, 0xCu);
    goto LABEL_5;
  }
  if (!v5)
  {
    composedRoute = self->_composedRoute;
    [(UINotificationFeedbackGenerator *)self->_notificationGenerator notificationOccurred:0];
    if (composedRoute || !v8)
    {
      [(MapsRouteCreationContext *)self _expandCardIfNeeded];
      [(MapsRouteCreationContext *)self _appendMapItem:v4 isCurrentLocation:0 isCoordinate:0];
      goto LABEL_15;
    }
    double v10 = sub_10057683C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    int v23 = 138412290;
    id v24 = v8;
    CLLocationDegrees v11 = "Pretending to add anchorPoint (%@) because it's already in the anchor point list";
    goto LABEL_4;
  }
  CLLocationCoordinate2D v12 = sub_10057683C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(MapsRouteCreationContext *)self composedRoute];
    id v14 = [v13 anchorPoints];
    int v23 = 134217984;
    id v24 = [v14 indexOfAnchorPoint:v5];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (marker)", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v15 = [(MapsRouteCreationContext *)self chromeViewController];
  id v16 = [v15 mapView];

  [v5 locationCoordinate];
  double v18 = v17;
  double v20 = v19;
  [(MapsRouteCreationContext *)self _setMenuAttachedAnchorPoint:v5];
  [v16 convertCoordinate:v16 toPointToView:v18];
  -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v5);

LABEL_15:
  return anchorPointAttachedToMenu == 0;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  [a3 coordinate];
  double v5 = v4;
  double v7 = v6;
  double v8 = -[MapsRouteCreationContext _anchorNearCoordinate:](self, "_anchorNearCoordinate:");
  if (v8)
  {
    CLLocationDegrees v9 = [(MapsRouteCreationContext *)self chromeViewController];
    double v10 = [v9 mapView];

    [v10 convertCoordinate:v10 toPointToView:v5];
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = sub_10057683C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [(MapsRouteCreationContext *)self composedRoute];
      double v17 = [v16 anchorPoints];
      int v19 = 134217984;
      id v20 = [v17 indexOfAnchorPoint:v8];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (user annotation)", (uint8_t *)&v19, 0xCu);
    }
    [(MapsRouteCreationContext *)self _setMenuAttachedAnchorPoint:v8];
    -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v8, v12, v14);
  }
  else
  {
    -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 1, v5, v7);
  }

  return v8 == 0;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [v4 annotation];
    [v6 coordinate];
    double v8 = v7;
    double v10 = v9;

    double v11 = -[MapsRouteCreationContext _anchorNearCoordinate:](self, "_anchorNearCoordinate:", v8, v10);
    BOOL v5 = v11 == 0;
    if (v11)
    {
      double v12 = [(MapsRouteCreationContext *)self chromeViewController];
      double v13 = [v12 mapView];

      [v13 convertCoordinate:v13 toPointToView:v8];
      double v15 = v14;
      double v17 = v16;
      double v18 = sub_10057683C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = [(MapsRouteCreationContext *)self composedRoute];
        id v20 = [v19 anchorPoints];
        int v22 = 134217984;
        id v23 = [v20 indexOfAnchorPoint:v11];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (annotation view)", (uint8_t *)&v22, 0xCu);
      }
      [(MapsRouteCreationContext *)self _setMenuAttachedAnchorPoint:v11];
      -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v11, v15, v17);
    }
    else
    {
      double v13 = [v4 annotation];
      [v13 coordinate];
      -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0);
    }
  }
  return v5;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v4 = a3;
  if ([v4 featureType] == 19)
  {
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;

    double v9 = [(MapsRouteCreationContext *)self chromeViewController];
    double v10 = [v9 mapView];

    [v10 convertCoordinate:v10 toPointToView:v6];
    double v11 = -[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:");
    if (v11 && !self->_anchorPointAttachedToMenu)
    {
      double v15 = sub_10057683C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = [(MapsRouteCreationContext *)self composedRoute];
        double v17 = [v16 anchorPoints];
        int v18 = 134217984;
        id v19 = [v17 indexOfAnchorPoint:v11];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (label marker)", (uint8_t *)&v18, 0xCu);
      }
      BOOL v12 = [v11 anchorPointType] == (id)3 || [v11 anchorPointType] == (id)4;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = [v4 isTrail];

    return v13 ^ 1;
  }
  return v12;
}

- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3
{
  [a3 coordinate];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v4, v5);
  -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0, v6.latitude, v6.longitude);
  return 1;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (id)_anchorNearCoordinate:(CLLocationCoordinate2D)a3
{
  id v4 = [objc_alloc((Class)CLLocation) initWithLatitude:a3.latitude longitude:a3.longitude];
  id v5 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v4];
  CLLocationCoordinate2D v6 = [(MapsRouteCreationContext *)self _anchorNearMapItem:v5];

  return v6;
}

- (id)_anchorPointNearMapItem:(id)a3 inAnchorPoints:(id)a4
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "muid", (void)v13))
        {
          id v11 = [v10 muid];
          if (v11 == [v5 _muid])
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)_anchorNearMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsRouteCreationContext *)self composedRoute];
  id v6 = [v5 anchorPoints];
  id v7 = [(MapsRouteCreationContext *)self _anchorPointNearMapItem:v4 inAnchorPoints:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    double v9 = [(MapsRouteCreationContext *)self chromeViewController];
    double v10 = [v9 mapView];

    id v11 = [v4 placemark];
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;

    [v10 convertCoordinate:v10 toPointToView:v13];
    -[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_anchorNearPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MapsRouteCreationContext *)self chromeViewController];
  id v7 = [v6 mapView];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [(MapsRouteCreationContext *)self composedRoute];
  double v9 = [v8 anchorPoints];

  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v10)
  {
    id v12 = v10;
    double v13 = 0;
    uint64_t v14 = *(void *)v28;
    double v15 = 1600.0;
    *(void *)&long long v11 = 134218496;
    long long v26 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v9);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v17 locationCoordinate:v26];
        [v7 convertCoordinate:v7 toPointToView:v7];
        double v19 = v18;
        double v21 = v20;
        double v22 = (y - v20) * (y - v20) + (x - v18) * (x - v18);
        id v23 = sub_10057683C();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          double v32 = v19;
          __int16 v33 = 2048;
          double v34 = v21;
          __int16 v35 = 2048;
          double v36 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Anchor position: %g, %g. Tap point distance from anchor: %g", buf, 0x20u);
        }

        if (v22 < v15)
        {
          id v24 = v17;

          double v15 = v22;
          double v13 = v24;
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v12);
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = sub_10057683C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v18 = 134218240;
    double v19 = x;
    __int16 v20 = 2048;
    double v21 = y;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Tap point: %g, %g", (uint8_t *)&v18, 0x16u);
  }

  double v9 = -[MapsRouteCreationContext _anchorNearPoint:](self, "_anchorNearPoint:", x, y);
  if (v9)
  {
    id v10 = [(MapsRouteCreationContext *)self composedRoute];
    long long v11 = [v10 anchorPoints];
    uint64_t v12 = (uint64_t)[v11 indexOfAnchorPoint:v9];

    if (!self->_anchorPointAttachedToMenu)
    {
      double v13 = sub_10057683C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [(MapsRouteCreationContext *)self composedRoute];
        double v15 = [v14 anchorPoints];
        id v16 = [v15 indexOfAnchorPoint:v9];
        int v18 = 134217984;
        double v19 = *(double *)&v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Tapped anchor point at index: %lu (map view)", (uint8_t *)&v18, 0xCu);
      }
      -[MapsRouteCreationContext _moveContextMenuToPoint:anchorPoint:](self, "_moveContextMenuToPoint:anchorPoint:", v9, x, y);
      goto LABEL_13;
    }
  }
  else
  {
    if (!self->_anchorPointAttachedToMenu)
    {
      [v7 convertPoint:v7 toCoordinateFromView:x, y];
      -[MapsRouteCreationContext _appendCoordinate:isCurrentLocation:](self, "_appendCoordinate:isCurrentLocation:", 0);
      goto LABEL_13;
    }
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v17 = sub_10057683C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = 134217984;
    double v19 = *(double *)&v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Ignoring anchor point at index: %lu (map view) due to an existing context menu", (uint8_t *)&v18, 0xCu);
  }

LABEL_13:
}

- (void)_showRecenterButton
{
  composedRoute = self->_composedRoute;
  [(CardView *)self->_recenterButtonContainer alpha];
  if (composedRoute) {
    BOOL v5 = v4 < 1.0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = sub_10057683C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "animating to show recenter button", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100784E74;
    v7[3] = &unk_1012E5D08;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:0.3];
  }
}

- (void)_insertRippleAnnotationAtCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = sub_10057683C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Start ripple animation", v10, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_removeRippleView" object:0];
  -[MapsRippleAnnotation setCoordinate:](self->_rippleAnnotation, "setCoordinate:", latitude, longitude);
  id v7 = [(MapsRouteCreationContext *)self chromeViewController];
  id v8 = [v7 mapView];
  [v8 addAnnotation:self->_rippleAnnotation];

  double v9 = [(MapsRippleAnnotation *)self->_rippleAnnotation rippleView];
  [v9 startAnimating];
}

- (void)_removeRippleView
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stop ripple animation", v7, 2u);
  }

  double v4 = [(MapsRippleAnnotation *)self->_rippleAnnotation rippleView];
  [v4 stopAnimating];

  BOOL v5 = [(MapsRouteCreationContext *)self chromeViewController];
  id v6 = [v5 mapView];
  [v6 removeAnnotation:self->_rippleAnnotation];
}

- (void)_appendMapItem:(id)a3 isCurrentLocation:(BOOL)a4 isCoordinate:(BOOL)a5
{
  id v8 = a3;
  [(GEOMapServiceTicket *)self->_currentReverseGeocodeTicket cancel];
  objc_initWeak(&location, self);
  long long v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  long long v30 = sub_1007853E4;
  double v31 = &unk_1012F82A0;
  objc_copyWeak(&v33, &location);
  BOOL v34 = a4;
  id v9 = v8;
  id v32 = v9;
  BOOL v35 = a5;
  id v10 = objc_retainBlock(&v28);
  if ((objc_msgSend(v9, "_hasMUID", v28, v29, v30, v31) & 1) == 0)
  {
    __int16 v20 = sub_10057683C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Reverse geocoding and appending mapItem: %@", buf, 0xCu);
    }

    double v21 = +[MKMapService sharedService];
    [v9 _coordinate];
    double v23 = v22;
    double v25 = v24;
    long long v26 = [(MapsRouteCreationContext *)self _traits];
    int v18 = [v21 ticketForReverseGeocodeCoordinate:v26 traits:v23];

    id v27 = &_dispatch_main_q;
    [v18 submitWithHandler:v10 queue:&_dispatch_main_q networkActivity:0];
    goto LABEL_9;
  }
  unsigned int v11 = [v9 _hasResolvablePartialInformation];
  uint64_t v12 = sub_10057683C();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Refining map item and appending mapItem: %@", buf, 0xCu);
    }

    uint64_t v14 = +[MKMapService sharedService];
    double v15 = [v9 _identifier];
    v38 = v15;
    id v16 = +[NSArray arrayWithObjects:&v38 count:1];
    double v17 = [(MapsRouteCreationContext *)self _traits];
    int v18 = [v14 ticketForIdentifiers:v16 traits:v17];

    id v19 = &_dispatch_main_q;
    [v18 submitWithHandler:v10 queue:&_dispatch_main_q networkActivity:0];
LABEL_9:

    goto LABEL_13;
  }
  if (v13)
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Appending mapItem without reverse geocoding: %@", buf, 0xCu);
  }

  id v37 = v9;
  int v18 = +[NSArray arrayWithObjects:&v37 count:1];
  ((void (*)(void ***, void *, void))v10[2])(v10, v18, 0);
LABEL_13:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)_appendAnchorPoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Appending anchor point: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  routeEditor = self->_routeEditor;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100785A70;
  v8[3] = &unk_1012EB690;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [(MNRouteEditor *)routeEditor validateAnchorPoint:v7 handler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_wouldDuplicateTrailingAnchorWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  BOOL v5 = [(NSMutableArray *)self->_editStack lastObject];
  id v6 = [v5 anchorPoints];
  id v7 = [v6 lastObject];
  [v7 locationCoordinate];
  BOOL v11 = vabdd_f64(latitude, v10) < 0.000000999999997
     && vabdd_f64(longitude, v8) < 0.000000999999997
     && vabdd_f64(1.79769313e308, v9) < 0.000000999999997;

  return v11;
}

- (void)_appendCoordinate:(CLLocationCoordinate2D)a3 isCurrentLocation:(BOOL)a4
{
  BOOL v4 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (-[MapsRouteCreationContext _wouldDuplicateTrailingAnchorWithCoordinate:](self, "_wouldDuplicateTrailingAnchorWithCoordinate:"))
  {
    double v8 = sub_10057683C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v12 = latitude;
      __int16 v13 = 2048;
      double v14 = longitude;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Dropping appending coordinate: %f, %f", buf, 0x16u);
    }
  }
  else
  {
    if (!v4) {
      -[MapsRouteCreationContext _insertRippleAnnotationAtCoordinate:](self, "_insertRippleAnnotationAtCoordinate:", latitude, longitude);
    }
    [(UINotificationFeedbackGenerator *)self->_notificationGenerator notificationOccurred:0];
    [(MapsRouteCreationContext *)self _expandCardIfNeeded];
    id v10 = [objc_alloc((Class)MKPlacemark) initWithCoordinate:latitude, longitude];
    id v9 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v10];
    [(MapsRouteCreationContext *)self _appendMapItem:v9 isCurrentLocation:v4 isCoordinate:1];
  }
}

- (void)_deleteFirstAnchorPointMatchingAnchorPoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting first anchor point: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NSMutableArray *)self->_editStack lastObject];
  id v7 = [v6 instanceByRemovingFirstAnchorPoint:v4];
  [(MapsRouteCreationContext *)self _pushEditState:v7 shouldRecenterOnCompletion:0];
}

- (void)_deleteLastAnchorPointMatchingAnchorPoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting last anchor point: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NSMutableArray *)self->_editStack lastObject];
  id v7 = [v6 instanceByRemovingLastAnchorPoint:v4];
  [(MapsRouteCreationContext *)self _pushEditState:v7 shouldRecenterOnCompletion:0];
}

- (void)pressedUndo
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[MapsRouteCreationContext pressedUndo]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(NSUndoManager *)self->_undoManager undo];
}

- (void)pressedReverse
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[MapsRouteCreationContext pressedReverse]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  if ([(MapsRouteCreationContext *)self reverseEnabled])
  {
    int v4 = [(NSMutableArray *)self->_editStack lastObject];
    BOOL v5 = [v4 instanceByReversingAnchorPoints];
    [(MapsRouteCreationContext *)self _pushEditState:v5 shouldRecenterOnCompletion:1];
  }
  else
  {
    int v4 = sub_10057683C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reverse is disabled; ignoring",
        (uint8_t *)&v6,
        2u);
    }
  }
}

- (void)pressedOutAndBack
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[MapsRouteCreationContext pressedOutAndBack]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  if ([(MapsRouteCreationContext *)self outAndBackEnabled])
  {
    int v4 = [(NSMutableArray *)self->_editStack lastObject];
    BOOL v5 = [v4 instanceByFormingOutAndBackAnchors];
    [(MapsRouteCreationContext *)self _pushEditState:v5 shouldRecenterOnCompletion:1];
  }
  else
  {
    int v4 = sub_10057683C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Out and back is disabled; ignoring",
        (uint8_t *)&v6,
        2u);
    }
  }
}

- (void)pressedCloseLoop
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[MapsRouteCreationContext pressedCloseLoop]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  if ([(MapsRouteCreationContext *)self closeLoopEnabled])
  {
    int v4 = [(NSMutableArray *)self->_editStack lastObject];
    BOOL v5 = [v4 instanceByClosingTheLoop];
    [(MapsRouteCreationContext *)self _pushEditState:v5 shouldRecenterOnCompletion:1];
  }
  else
  {
    int v4 = sub_10057683C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Close loop is disabled; ignoring",
        (uint8_t *)&v6,
        2u);
    }
  }
}

- (BOOL)undoEnabled
{
  v3 = [(NSMutableArray *)self->_editStack lastObject];
  int v4 = v3;
  if (v3 && [v3 reason])
  {
    BOOL v5 = [(NSMutableArray *)self->_containees lastObject];
    BOOL v6 = v5 != self->_saveContainee;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)reverseEnabled
{
  v2 = [(NSMutableArray *)self->_editStack lastObject];
  v3 = [v2 anchorPoints];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)outAndBackEnabled
{
  v2 = [(NSMutableArray *)self->_editStack lastObject];
  v3 = [v2 anchorPoints];
  if ((unint64_t)[v3 count] < 2) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = [v3 isOutAndBackAllowed];
  }

  return v4;
}

- (BOOL)closeLoopEnabled
{
  v2 = [(NSMutableArray *)self->_editStack lastObject];
  v3 = [v2 anchorPoints];
  if ((unint64_t)[v3 count] < 2) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = [v3 startAndEndAreTheSame] ^ 1;
  }

  return v4;
}

- (void)pressedStartNavigationWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v20 = "-[MapsRouteCreationContext pressedStartNavigationWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:3001 target:131 value:0];
  BOOL v6 = [(MapsRouteCreationContext *)self chromeViewController];
  [v6 resetForcedExploreModernMapFlag];

  id v7 = self->_composedRoute;
  int v8 = [(GEOComposedRoute *)v7 userProvidedName];
  if ([v8 length]) {
    [(GEOComposedRoute *)v7 userProvidedName];
  }
  else {
  id v9 = [(GEOComposedRoute *)v7 name];
  }

  id v10 = [(MapsRouteCreationContext *)self chromeViewController];
  BOOL v11 = [v10 _maps_platformController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1007867C8;
  v15[3] = &unk_1012F0A40;
  id v16 = v7;
  id v17 = v9;
  id v18 = v4;
  id v12 = v4;
  id v13 = v9;
  double v14 = v7;
  [v11 pushNavigationWithRoute:v14 navigationMode:1 shouldCheckNavSafetyAlert:1 completion:v15];
}

- (void)pressedStartSteppingWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v20 = "-[MapsRouteCreationContext pressedStartSteppingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:3001 target:131 value:0];
  BOOL v6 = [(MapsRouteCreationContext *)self chromeViewController];
  [v6 resetForcedExploreModernMapFlag];

  id v7 = self->_composedRoute;
  int v8 = [(GEOComposedRoute *)v7 userProvidedName];
  if ([v8 length]) {
    [(GEOComposedRoute *)v7 userProvidedName];
  }
  else {
  id v9 = [(GEOComposedRoute *)v7 name];
  }

  id v10 = [(MapsRouteCreationContext *)self chromeViewController];
  BOOL v11 = [v10 _maps_platformController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100786A84;
  v15[3] = &unk_1012F0A40;
  id v16 = v7;
  id v17 = v9;
  id v18 = v4;
  id v12 = v4;
  id v13 = v9;
  double v14 = v7;
  [v11 pushNavigationWithRoute:v14 navigationMode:2 shouldCheckNavSafetyAlert:1 completion:v15];
}

- (void)pressedRoutePlanning
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[MapsRouteCreationContext pressedRoutePlanning]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:6003 target:131 value:0];
  id v4 = [(MapsRouteCreationContext *)self chromeViewController];
  [v4 resetForcedExploreModernMapFlag];

  BOOL v5 = [(MapsRouteCreationContext *)self chromeViewController];
  BOOL v6 = [v5 contexts];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_14;
    }
    double v14 = [(MapsRouteCreationContext *)self chromeViewController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100786EC4;
    v19[3] = &unk_1012E5D58;
    id v20 = v13;
    double v21 = self;
    double v15 = v13;
    [v14 popToContext:v15 animated:0 completion:v19];
  }
  else
  {
LABEL_11:

LABEL_14:
    id v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v27 = "-[MapsRouteCreationContext pressedRoutePlanning]";
      __int16 v28 = 2080;
      uint64_t v29 = "MapsRouteCreationContext.m";
      __int16 v30 = 1024;
      int v31 = 943;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      id v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    double v15 = sub_10057683C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Missing base mode controller for pushing route planning", buf, 2u);
    }
  }
}

- (void)pressedSave
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed save", v4, 2u);
  }

  [(MapsRouteCreationContext *)self pushSaveContainee];
}

- (void)pressedRecenter
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed recenter", v4, 2u);
  }

  [(MapsRouteCreationContext *)self _centerOnCurrentRouteAnimated:1];
}

- (id)emptyStateVideoName
{
  v3 = [(NSMutableArray *)self->_editStack lastObject];
  id v4 = [(MapsRouteCreationContainee *)self->_editContainee traitCollection];
  id v5 = [v4 userInterfaceStyle];

  BOOL v6 = [v3 anchorPoints];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    id v8 = @"Coaching_Continue_Light";
    CFStringRef v9 = @"Coaching_Continue_Dark";
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    id v8 = @"Coaching_Start_Light";
    CFStringRef v9 = @"Coaching_Start_Dark";
  }
  if (v5 == (id)2) {
    id v8 = (__CFString *)v9;
  }
  uint64_t v10 = v8;
LABEL_9:

  return v10;
}

- (void)_updateUndoVisibility
{
  [(CardView *)self->_undoButtonContainer setHidden:[(MapsRouteCreationContext *)self undoEnabled] ^ 1];
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = ![(MapsRouteCreationContext *)self undoEnabled];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_updateUndoVisibility: undo hidden: %d", (uint8_t *)v4, 8u);
  }
}

- (void)_setMenuAttachedAnchorPoint:(id)a3
{
  id v4 = (GEOComposedRouteAnchorPoint *)a3;
  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting _anchorPointAttachedToMenu to %p", (uint8_t *)&v7, 0xCu);
  }

  anchorPointAttachedToMenu = self->_anchorPointAttachedToMenu;
  self->_anchorPointAttachedToMenu = v4;
}

- (void)_moveContextMenuToPoint:(CGPoint)a3 anchorPoint:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  int v7 = [(MapsMenuButton *)self->_contextMenuFakeButton superview];

  if (v7)
  {
    -[MapsMenuButton setFrame:](self->_contextMenuFakeButton, "setFrame:", x, y, 1.0, 1.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007874F4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v8 = sub_10057683C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Aborting context menu presentation", buf, 2u);
    }

    [(MapsRouteCreationContext *)self _setMenuAttachedAnchorPoint:0];
  }
}

- (void)_centerOnCurrentRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_centerOnCurrentRouteAnimated: %d", buf, 8u);
  }

  double v6 = 0.3;
  if (!v3) {
    double v6 = 0.0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100787714;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  +[UIView animateWithDuration:v10 animations:v6];
  if (self->_composedRoute)
  {
    int v7 = [(MapsRouteCreationContext *)self chromeViewController];
    id v8 = [v7 mapCameraController];
    composedRoute = self->_composedRoute;
    CFStringRef v9 = +[NSArray arrayWithObjects:&composedRoute count:1];
    [v8 frameRoutes:v9 includeCompassInset:0 animated:v3 completion:0];
  }
}

- (void)menuWillDismissWithAnimator:(id)a3
{
  id v4 = a3;
  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v14 = "-[MapsRouteCreationContext menuWillDismissWithAnimator:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10078791C;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, (id *)buf);
  double v6 = objc_retainBlock(v11);
  int v7 = v6;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100787994;
    v9[3] = &unk_1012E6EA8;
    uint64_t v10 = v6;
    [v4 addCompletion:v9];
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v7);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (id)routeData
{
  v2 = [(MapsRouteCreationContext *)self composedRoute];
  BOOL v3 = [v2 persistentData];

  return v3;
}

- (void)_pushEditState:(id)a3 shouldRecenterOnCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  editStack = self->_editStack;
  id v7 = a3;
  [(NSMutableArray *)editStack addObject:v7];
  [(NSUndoManager *)self->_undoManager registerUndoWithTarget:self selector:"_undoEditStack:" object:0];
  dispatch_time_t v8 = sub_1004C8FBC((uint64_t)[v7 reason], 0);
  [(NSUndoManager *)self->_undoManager setActionName:v8];

  id v9 = [v7 reason];
  [(MapsRouteCreationContext *)self _requeryStateWithAction:[(MapsRouteCreationContext *)self _routeEditorActionForEditReason:v9] shouldRecenterOnCompletion:v4];

  [(MapsRouteCreationContext *)self _updateCoachingPillWithIgnoreChromeTransitioning:0];
}

- (void)_undoEditStack:(id)a3
{
  id v5 = [(NSMutableArray *)self->_editStack lastObject];
  [(NSUndoManager *)self->_undoManager registerUndoWithTarget:self selector:"_undoEditStack:" object:v5];
  BOOL v4 = sub_1004C8FBC((uint64_t)[v5 reason], 1);
  [(NSUndoManager *)self->_undoManager setActionName:v4];

  [(MapsRouteCreationContext *)self _popEditStack];
}

- (void)_popEditStack
{
  id v3 = [(NSMutableArray *)self->_editStack lastObject];
  if (![v3 reason]) {
    +[NSException raise:NSInternalInconsistencyException format:@"You should never be able to pop the initial state"];
  }
  [(NSMutableArray *)self->_editStack removeLastObject];
  [(MapsRouteCreationContext *)self _requeryStateWithAction:1001 shouldRecenterOnCompletion:0];
  [(MapsRouteCreationContext *)self _updateCoachingPillWithIgnoreChromeTransitioning:0];
}

- (unint64_t)_routeEditorActionForEditReason:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return qword_100F72080[a3 - 1];
  }
}

- (void)_requeryStateWithAction:(unint64_t)a3 shouldRecenterOnCompletion:(BOOL)a4
{
  [(MapsRouteCreationContext *)self _updateUndoVisibility];
  id v7 = [(NSMutableArray *)self->_editStack lastObject];
  dispatch_time_t v8 = [v7 anchorPoints];
  id v9 = [v8 count];

  if ((unint64_t)v9 > 1)
  {
    id v18 = objc_opt_new();
    id v19 = [v7 anchorPoints];
    [v18 setAnchorPoints:v19];

    [v18 setAction:a3];
    [v18 setCurrentRoute:self->_composedRoute];
    if (a3 - 1001 <= 1)
    {
      id v20 = [v7 routePersistentData];
      [v18 setUndoRedoRouteData:v20];
    }
    double v21 = objc_opt_new();
    [v21 setMainTransportType:2];
    [v21 setIncludeRoutingPathLeg:1];
    [v18 setRouteAttributes:v21];
    long long v22 = +[MapsOfflineUIHelper sharedHelper];
    unsigned __int8 v23 = [v22 isUsingOfflineMaps];

    objc_initWeak(&location, self);
    routeEditor = self->_routeEditor;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100787F38;
    v26[3] = &unk_1012F82C8;
    objc_copyWeak(&v29, &location);
    id v27 = v7;
    BOOL v30 = a4;
    id v12 = v18;
    id v28 = v12;
    unsigned __int8 v31 = v23;
    id v25 = [(MNRouteEditor *)routeEditor requestRouteGeometry:v12 finishedHandler:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    composedRoute = self->_composedRoute;
    self->_composedRoute = 0;

    [(MapsRouteCreationContainee *)self->_editContainee setRoute:0];
    uint64_t v11 = [v7 anchorPoints];
    id v12 = [v11 firstObject];

    BOOL v13 = [v12 displayInfo];
    [v13 _routeCreation_setStartWaypointCaption];

    if ([v12 isCurrentLocation])
    {
      double v14 = [v12 displayInfo];
      [v14 _routeCreation_setMyLocationName];
    }
    __int16 v15 = [(MapsRouteCreationContext *)self chromeViewController];
    [v15 setNeedsUpdateComponent:@"routeAnnotations" animated:1];

    id v16 = [(MapsRouteCreationContext *)self chromeViewController];
    id v17 = [v16 mapSelectionManager];
    [v17 clearSelection];

    [(CardView *)self->_recenterButtonContainer removeFromSuperview];
    [(UIButton *)self->_recenterButton removeFromSuperview];
  }
}

- (id)_mostRecentlyAddedAnchor
{
  id v3 = [(NSMutableArray *)self->_editStack lastObject];
  BOOL v4 = (char *)[(NSMutableArray *)self->_editStack count] - 2;
  if (v4 < [(NSMutableArray *)self->_editStack count]
    && ([(NSMutableArray *)self->_editStack objectAtIndexedSubscript:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v6 = (void *)v5;
    id v7 = [v3 anchorPoints];
    id v8 = [v7 copy];

    id v9 = [v6 anchorPoints];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) uniqueID];
          [v8 removeAnchorPointWithID:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    __int16 v15 = [v8 lastObject];
  }
  else
  {
    double v6 = [v3 anchorPoints];
    __int16 v15 = [v6 lastObject];
  }

  return v15;
}

- (id)_errorMessageForUnsupportedCountry:(id)a3
{
  id v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"[Route Creation] Custom Routes generic unavailability" value:@"localized string not found" table:0];

  return v4;
}

- (id)_errorMessageForError:(id)a3 directionsError:(id)a4 request:(id)a5 isOffline:(BOOL)a6 shouldBackoutEdit:(BOOL *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100788BC0;
  v45[3] = &unk_1012E63F0;
  v45[4] = a7;
  BOOL v13 = objc_retainBlock(v45);
  if (v12 && [v12 problemDetailsCount])
  {
    uint64_t v14 = 0;
    __int16 v15 = GEOResultRefinementSort_ptr;
    CFStringRef v16 = @"[Route Creation] Anchor too far MacOS";
    id v44 = v12;
    while (1)
    {
      switch(objc_msgSend(v12, "problemDetailAtIndex:", v14, v44))
      {
        case 2u:
        case 5u:
        case 0xDu:
          long long v17 = [(MapsRouteCreationContext *)self chromeViewController];
          uint64_t v18 = sub_1000BBB44(v17);

          long long v19 = [v15[504] mainBundle];
          long long v20 = v19;
          if (v18 == 5) {
            CFStringRef v21 = v16;
          }
          else {
            CFStringRef v21 = @"[Route Creation] Anchor too far";
          }
          goto LABEL_14;
        case 3u:
          long long v20 = [(MapsRouteCreationContext *)self _mostRecentlyAddedAnchor];
          [v20 countryCode];
          CFStringRef v22 = v16;
          unsigned __int8 v23 = v15;
          id v24 = v11;
          BOOL v25 = v8;
          id v27 = v26 = v13;
          id v28 = [(MapsRouteCreationContext *)self _errorMessageForUnsupportedCountry:v27];

          BOOL v13 = v26;
          BOOL v8 = v25;
          id v11 = v24;
          __int16 v15 = v23;
          CFStringRef v16 = v22;
          id v12 = v44;
          goto LABEL_15;
        case 4u:
          long long v19 = [v15[504] mainBundle];
          long long v20 = v19;
          CFStringRef v21 = @"[Route Creation] Custom Routes no pedestrians";
          goto LABEL_14;
        case 9u:
        case 0x12u:
          long long v19 = [v15[504] mainBundle];
          long long v20 = v19;
          CFStringRef v21 = @"[Route Creation] Custom Routes too far";
          goto LABEL_14;
        case 0x15u:
          long long v19 = [v15[504] mainBundle];
          long long v20 = v19;
          CFStringRef v21 = @"[Route Creation] Custom Routes too many anchors";
          goto LABEL_14;
        case 0x16u:
          if (!v8) {
            goto LABEL_16;
          }
          long long v19 = [v15[504] mainBundle];
          long long v20 = v19;
          CFStringRef v21 = @"[Route Creation] Offline route creation error";
LABEL_14:
          id v28 = [v19 localizedStringForKey:v21 value:@"localized string not found" table:0];
LABEL_15:

          if (v28)
          {
            ((void (*)(void *))v13[2])(v13);
            goto LABEL_30;
          }
LABEL_16:
          if (++v14 >= (unint64_t)[v12 problemDetailsCount]) {
            goto LABEL_17;
          }
          break;
        default:
          goto LABEL_16;
      }
    }
  }
LABEL_17:
  id v29 = [v11 domain];
  unsigned int v30 = [v29 isEqual:MNErrorDomain];

  if (v30)
  {
    id v31 = [v11 code];
    if (v31 == (id)9)
    {
      ((void (*)(void *))v13[2])(v13);
      id v40 = [v11 userInfo];
      v41 = [v40 objectForKeyedSubscript:MNRouteEditorErrorUnsupportedCountriesKey];

      id v42 = [v41 anyObject];
      id v28 = [(MapsRouteCreationContext *)self _errorMessageForUnsupportedCountry:v42];

      goto LABEL_30;
    }
    if (v31 == (id)8)
    {
      ((void (*)(void *))v13[2])(v13);
      id v32 = [(MapsRouteCreationContext *)self chromeViewController];
      uint64_t v33 = sub_1000BBB44(v32);

      BOOL v34 = +[NSBundle mainBundle];
      BOOL v35 = v34;
      if (v33 == 5) {
        CFStringRef v36 = @"[Route Creation] Anchor too far MacOS";
      }
      else {
        CFStringRef v36 = @"[Route Creation] Anchor too far";
      }
      goto LABEL_29;
    }
  }
  id v37 = [v11 domain];
  if ([v37 isEqual:NSURLErrorDomain])
  {
  }
  else
  {
    v38 = [v11 domain];
    unsigned int v39 = [v38 isEqual:kCFErrorDomainCFNetwork];

    if (!v39)
    {
      BOOL v34 = +[NSBundle mainBundle];
      BOOL v35 = v34;
      CFStringRef v36 = @"[Route Creation] Default error message";
      goto LABEL_29;
    }
  }
  BOOL v34 = +[NSBundle mainBundle];
  BOOL v35 = v34;
  CFStringRef v36 = @"[Route Creation] Network error message";
LABEL_29:
  id v28 = [v34 localizedStringForKey:v36 value:@"localized string not found" table:0];

LABEL_30:

  return v28;
}

- (void)_presentPopupViewForMessage:(id)a3 timeout:(double)a4 isError:(BOOL)a5 ignoreChromeTransitioning:(BOOL)a6
{
  id v10 = a3;
  id v11 = sub_10057683C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Presenting popup for message: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  CFStringRef v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  unsigned __int8 v23 = sub_100788E2C;
  id v24 = &unk_1012F82F0;
  objc_copyWeak(v26, (id *)buf);
  BOOL v27 = a6;
  id v12 = v10;
  id v25 = v12;
  v26[1] = *(id *)&a4;
  BOOL v28 = a5;
  BOOL v13 = objc_retainBlock(&v21);
  if ([(MapsPopupMessageView *)self->_popupMessageView isDismissing]
    || ([(MapsPopupMessageView *)self->_popupMessageView superview],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([(MapsPopupMessageView *)self->_popupMessageView message],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v15 isEqual:v12],
        v15,
        v14,
        !v16))
  {
    popupMessageView = self->_popupMessageView;
    if (!popupMessageView)
    {
      ((void (*)(void ***))v13[2])(v13);
      goto LABEL_14;
    }
    if (!a5)
    {
      [(MapsPopupMessageView *)popupMessageView timeout];
      popupMessageView = self->_popupMessageView;
      if (v18 > 2.22044605e-16)
      {
        long long v19 = [(MapsPopupMessageView *)popupMessageView superview];
        BOOL v20 = v19 == 0;

        if (!v20) {
          goto LABEL_14;
        }
        popupMessageView = self->_popupMessageView;
      }
    }
    [(MapsPopupMessageView *)popupMessageView dismissAnimated:1 completion:v13];
    goto LABEL_14;
  }
  [(MapsPopupMessageView *)self->_popupMessageView resetTimerAnimated:1];
LABEL_14:

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);
}

- (void)_backoutLastState
{
  id v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Programmatically undoing last action", v4, 2u);
  }

  [(NSUndoManager *)self->_undoManager undo];
}

- (BOOL)wantsCompassLayoutControl
{
  v2 = [(MapsRouteCreationContext *)self chromeViewController];
  BOOL v3 = sub_1000BBB44(v2) != 5;

  return v3;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  BOOL v3 = [RouteAnnotationsMutableConfiguration alloc];
  BOOL v4 = [(MapsRouteCreationContext *)self composedRoute];
  uint64_t v5 = [(RouteAnnotationsConfiguration *)v3 initWithRoute:v4];

  [(RouteAnnotationsConfiguration *)v5 setRouteTrafficFeaturesActive:0];
  double v6 = [(NSMutableArray *)self->_editStack lastObject];
  id v7 = [v6 anchorPoints];
  [(RouteAnnotationsConfiguration *)v5 setAnchorPoints:v7];

  id v8 = [(RouteAnnotationsMutableConfiguration *)v5 copy];

  return (RouteAnnotationsConfiguration *)v8;
}

- (void)_insertEditStackButtons
{
  BOOL v3 = [(MapsRouteCreationContext *)self chromeViewController];
  BOOL v4 = [v3 viewport];

  uint64_t v5 = [(CardView *)self->_undoButtonContainer contentView];
  [v5 addSubview:self->_undoButton];

  [v4 addSubview:self->_undoButtonContainer];
  double v6 = [(CardView *)self->_undoButtonContainer leadingAnchor];
  long long v26 = v4;
  id v7 = [v4 leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7 constant:10.0];
  v28[0] = v8;
  id v9 = [(CardView *)self->_undoButtonContainer bottomAnchor];
  id v10 = [v4 bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:-10.0];
  v28[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v28 count:2];
  +[NSLayoutConstraint activateConstraints:v12];

  id v25 = [(UIButton *)self->_undoButton leadingAnchor];
  id v24 = [(CardView *)self->_undoButtonContainer leadingAnchor];
  unsigned __int8 v23 = [v25 constraintEqualToAnchor:v24];
  v27[0] = v23;
  uint64_t v22 = [(UIButton *)self->_undoButton trailingAnchor];
  BOOL v13 = [(CardView *)self->_undoButtonContainer trailingAnchor];
  uint64_t v14 = [v22 constraintEqualToAnchor:v13];
  v27[1] = v14;
  __int16 v15 = [(UIButton *)self->_undoButton topAnchor];
  unsigned int v16 = [(CardView *)self->_undoButtonContainer topAnchor];
  long long v17 = [v15 constraintEqualToAnchor:v16];
  v27[2] = v17;
  double v18 = [(UIButton *)self->_undoButton bottomAnchor];
  long long v19 = [(CardView *)self->_undoButtonContainer bottomAnchor];
  BOOL v20 = [v18 constraintEqualToAnchor:v19];
  v27[3] = v20;
  CFStringRef v21 = +[NSArray arrayWithObjects:v27 count:4];
  +[NSLayoutConstraint activateConstraints:v21];

  [(MapsRouteCreationContext *)self _updateUndoVisibility];
}

- (void)_insertRecenterButtonIfNeeded
{
  BOOL v3 = [(CardView *)self->_recenterButtonContainer superview];

  if (!v3)
  {
    BOOL v4 = [(CardView *)self->_recenterButtonContainer contentView];
    [v4 addSubview:self->_recenterButton];

    uint64_t v5 = [(MapsRouteCreationContext *)self chromeViewController];
    double v6 = [v5 viewport];

    [v6 addSubview:self->_recenterButtonContainer];
    id v7 = [(CardView *)self->_recenterButtonContainer trailingAnchor];
    BOOL v27 = v6;
    id v8 = [v6 trailingAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8 constant:-10.0];
    v29[0] = v9;
    id v10 = [(CardView *)self->_recenterButtonContainer bottomAnchor];
    id v11 = [v6 bottomAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11 constant:-10.0];
    v29[1] = v12;
    BOOL v13 = +[NSArray arrayWithObjects:v29 count:2];
    +[NSLayoutConstraint activateConstraints:v13];

    long long v26 = [(UIButton *)self->_recenterButton leadingAnchor];
    id v25 = [(CardView *)self->_recenterButtonContainer leadingAnchor];
    id v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    uint64_t v14 = [(UIButton *)self->_recenterButton trailingAnchor];
    __int16 v15 = [(CardView *)self->_recenterButtonContainer trailingAnchor];
    unsigned int v16 = [v14 constraintEqualToAnchor:v15];
    v28[1] = v16;
    long long v17 = [(UIButton *)self->_recenterButton topAnchor];
    double v18 = [(CardView *)self->_recenterButtonContainer topAnchor];
    long long v19 = [v17 constraintEqualToAnchor:v18];
    void v28[2] = v19;
    BOOL v20 = [(UIButton *)self->_recenterButton bottomAnchor];
    CFStringRef v21 = [(CardView *)self->_recenterButtonContainer bottomAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    v28[3] = v22;
    unsigned __int8 v23 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v23];
  }
}

- (void)_removeEditStackButtons
{
  [(CardView *)self->_undoButtonContainer removeFromSuperview];
  [(UIButton *)self->_undoButton removeFromSuperview];
  [(CardView *)self->_recenterButtonContainer removeFromSuperview];
  recenterButton = self->_recenterButton;

  [(UIButton *)recenterButton removeFromSuperview];
}

- (void)_expandCardIfNeeded
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"__internal_EnableAutomaticCardExpanion"];

  if (v4)
  {
    id v8 = [(NSMutableArray *)self->_containees lastObject];
    uint64_t v5 = [v8 cardPresentationController];
    id v6 = [v5 containeeLayout];

    if (v6 == (id)1)
    {
      id v7 = [v8 cardPresentationController];
      [v7 wantsExpandLayout];
    }
  }
}

- (void)_updateMenu
{
  BOOL v3 = self->_anchorPointAttachedToMenu;
  unsigned int v4 = sub_10057683C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v72 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Building context menu with %@", buf, 0xCu);
  }

  if (v3)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v5 = [(NSMutableArray *)self->_editStack lastObject];
    id v6 = [v5 anchorPoints];

    id v7 = [v6 firstObject];
    if ([v7 isEqual:v3])
    {
      unsigned int v8 = 1;
    }
    else
    {
      id v12 = [v6 lastObject];
      unsigned int v8 = [v12 isEqual:v3];
    }
    v53 = objc_opt_new();
    if (([(MapsRouteCreationContext *)self reverseEnabled] & v8) == 1)
    {
      BOOL v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"[Route Creation] Menu Option Reverse" value:@"localized string not found" table:0];
      __int16 v15 = +[UIImage systemImageNamed:@"arrow.up.arrow.down"];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10078A398;
      v68[3] = &unk_1012E8CD0;
      objc_copyWeak(&v69, (id *)buf);
      unsigned int v16 = +[UIAction actionWithTitle:v14 image:v15 identifier:0 handler:v68];

      [v53 addObject:v16];
      objc_destroyWeak(&v69);
    }
    if (([(MapsRouteCreationContext *)self outAndBackEnabled] & v8) == 1)
    {
      long long v17 = +[NSBundle mainBundle];
      double v18 = [v17 localizedStringForKey:@"[Route Creation] Menu Option Out-n-Back" value:@"localized string not found" table:0];
      long long v19 = +[UIImage systemImageNamed:@"point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill"];
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10078A3E4;
      v66[3] = &unk_1012E8CD0;
      objc_copyWeak(&v67, (id *)buf);
      BOOL v20 = +[UIAction actionWithTitle:v18 image:v19 identifier:0 handler:v66];

      [v53 addObject:v20];
      objc_destroyWeak(&v67);
    }
    if (([(MapsRouteCreationContext *)self closeLoopEnabled] & v8) == 1)
    {
      CFStringRef v21 = +[NSBundle mainBundle];
      uint64_t v22 = [v21 localizedStringForKey:@"[Route Creation] Menu Option Close Loop" value:@"localized string not found" table:0];
      unsigned __int8 v23 = +[UIImage systemImageNamed:@"point.forward.to.point.capsulepath.fill"];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10078A430;
      v64[3] = &unk_1012E8CD0;
      objc_copyWeak(&v65, (id *)buf);
      id v24 = +[UIAction actionWithTitle:v22 image:v23 identifier:0 handler:v64];

      [v53 addObject:v24];
      objc_destroyWeak(&v65);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    id v25 = v6;
    id v26 = [v25 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v26)
    {
      unint64_t v27 = 0;
      uint64_t v28 = *(void *)v61;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v61 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v60 + 1) + 8 * i) locationCoordinate];
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          [(GEOComposedRouteAnchorPoint *)v3 locationCoordinate];
          if (vabdd_f64(v31, v38) < 0.000000999999997
            && vabdd_f64(v33, v36) < 0.000000999999997
            && fabs(v35 - v37) < 0.000000999999997)
          {
            ++v27;
          }
        }
        id v26 = [v25 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v26);

      if (v27 >= 2)
      {
        unsigned int v39 = +[NSBundle mainBundle];
        id v40 = [v39 localizedStringForKey:@"[Route Creation] Delete First Anchor" value:@"localized string not found" table:0];
        v41 = +[UIImage systemImageNamed:@"trash"];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10078A47C;
        v58[3] = &unk_1012E8CD0;
        id v42 = &v59;
        objc_copyWeak(&v59, (id *)buf);
        id v43 = +[UIAction actionWithTitle:v40 image:v41 identifier:0 handler:v58];

        [v43 setAttributes:2];
        [v53 addObject:v43];
        id v44 = +[NSBundle mainBundle];
        v45 = [v44 localizedStringForKey:@"[Route Creation] Delete Last Anchor" value:@"localized string not found" table:0];
        v46 = +[UIImage systemImageNamed:@"trash"];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10078A4C8;
        v56[3] = &unk_1012E8CD0;
        objc_copyWeak(&v57, (id *)buf);
        id v47 = +[UIAction actionWithTitle:v45 image:v46 identifier:0 handler:v56];

        [v47 setAttributes:2];
        [v53 addObject:v47];

        objc_destroyWeak(&v57);
LABEL_34:

        objc_destroyWeak(v42);
        double v51 = +[UIMenu menuWithChildren:v53];
        menu = self->_menu;
        self->_menu = v51;

        objc_destroyWeak((id *)buf);
        goto LABEL_35;
      }
    }
    else
    {
    }
    id v48 = +[NSBundle mainBundle];
    v49 = [v48 localizedStringForKey:@"[Route Creation] Delete Anchor" value:@"localized string not found" table:0];
    v50 = +[UIImage systemImageNamed:@"trash"];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10078A514;
    v54[3] = &unk_1012E8CD0;
    id v42 = &v55;
    objc_copyWeak(&v55, (id *)buf);
    id v43 = +[UIAction actionWithTitle:v49 image:v50 identifier:0 handler:v54];

    [v43 setAttributes:2];
    [v53 addObject:v43];
    goto LABEL_34;
  }
  id v9 = sub_1005762E4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v72 = "-[MapsRouteCreationContext _updateMenu]";
    __int16 v73 = 2080;
    v74 = "MapsRouteCreationContext.m";
    __int16 v75 = 1024;
    int v76 = 1500;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v72 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
LABEL_35:
}

- (void)_updateScaleAndCompass
{
  BOOL v3 = [(MapsPopupMessageView *)self->_popupMessageView superview];
  BOOL v4 = v3 == 0;

  uint64_t v5 = [(MapsRouteCreationContext *)self chromeViewController];
  id v8 = [v5 mapView];

  [v8 setShowsScale:v4];
  [v8 setShowsCompass:v4];
  id v6 = [(MapsRouteCreationContext *)self chromeViewController];
  uint64_t v7 = sub_1000BBB44(v6);

  if (v7 != 5 && !v3)
  {
    [v8 _compassInsets];
    [v8 _setCompassInsets:0.0];
  }
}

- (void)_updateCoachingPillWithIgnoreChromeTransitioning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_editStack lastObject];
  id v6 = [v5 anchorPoints];

  uint64_t v7 = [(MapsRouteCreationContext *)self chromeViewController];
  uint64_t v8 = sub_1000BBB44(v7);

  if (![v6 count])
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = v9;
    CFStringRef v11 = @"[Route Creation] Empty State Start";
    CFStringRef v12 = @"[Route Creation] Empty State Start MacOS";
    goto LABEL_5;
  }
  if ([v6 count] == (id)1)
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = v9;
    CFStringRef v11 = @"[Route Creation] Empty State Continue";
    CFStringRef v12 = @"[Route Creation] Empty State Continue MacOS";
LABEL_5:
    if (v8 == 5) {
      CFStringRef v13 = v12;
    }
    else {
      CFStringRef v13 = v11;
    }
    uint64_t v14 = [v9 localizedStringForKey:v13 value:@"localized string not found" table:0];

    [(MapsRouteCreationContext *)self _presentPopupViewForMessage:v14 timeout:0 isError:v3 ignoreChromeTransitioning:0.0];
    goto LABEL_9;
  }
  uint64_t v15 = [(MapsPopupMessageView *)self->_popupMessageView superview];
  if (v15)
  {
    unsigned int v16 = (void *)v15;
    [(MapsPopupMessageView *)self->_popupMessageView timeout];
    double v18 = v17;

    if (v18 <= 2.22044605e-16)
    {
      objc_initWeak(&location, self);
      popupMessageView = self->_popupMessageView;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10078A838;
      v20[3] = &unk_1012E6708;
      objc_copyWeak(&v21, &location);
      [(MapsPopupMessageView *)popupMessageView dismissAnimated:1 completion:v20];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
LABEL_9:
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_rippleAnnotation, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_popupMessageView, 0);
  objc_storeStrong(&self->_hikingMapToken, 0);
  objc_storeStrong((id *)&self->_contextMenuFakeButton, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_anchorPointAttachedToMenu, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_storeStrong((id *)&self->_undoButtonContainer, 0);
  objc_storeStrong((id *)&self->_currentReverseGeocodeTicket, 0);
  objc_storeStrong((id *)&self->_editStack, 0);
  objc_storeStrong((id *)&self->_routeEditor, 0);
  objc_storeStrong((id *)&self->_containees, 0);
  objc_storeStrong((id *)&self->_saveContainee, 0);

  objc_storeStrong((id *)&self->_editContainee, 0);
}

@end