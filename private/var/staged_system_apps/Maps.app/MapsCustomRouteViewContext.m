@interface MapsCustomRouteViewContext
- (BOOL)chromeDidSelectAnnotationView:(id)a3;
- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3;
- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3;
- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3;
- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5;
- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3;
- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3;
- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3;
- (BOOL)exitRouteCreationOnClose;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)wantsCompassLayoutControl;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsMapSelectionControl;
- (BOOL)wantsRouteAnnotationsControl;
- (BOOL)wantsSidebarControl;
- (BOOL)wantsWeatherShowing;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)composedRoute;
- (MapsCustomRouteViewContext)initWithExistingRoute:(id)a3;
- (MapsCustomRouteViewContext)initWithExistingRouteData:(id)a3;
- (NSUUID)historyUUID;
- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration;
- (id)_analyticsValue;
- (id)_traits;
- (id)desiredCards;
- (id)routeData;
- (int)_analyticsTarget;
- (int64_t)desiredFloatingControls;
- (void)_frameRouteAnimated:(BOOL)a3;
- (void)_insertRecenterButton;
- (void)_resetUserInteractionState;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)didSaveCustomRoute:(id)a3;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)popContainee;
- (void)pressedRecenter;
- (void)pushSaveContaineeWithCompletionHandler:(id)a3;
- (void)pushSuggestedNavigationMode:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setExitRouteCreationOnClose:(BOOL)a3;
- (void)setHistoryUUID:(id)a3;
@end

@implementation MapsCustomRouteViewContext

- (MapsCustomRouteViewContext)initWithExistingRoute:(id)a3
{
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MapsCustomRouteViewContext;
  v6 = [(MapsCustomRouteViewContext *)&v50 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composedRoute, a3);
    [(GEOComposedRoute *)v7->_composedRoute updateCustomRouteStartEndCaptions];
    uint64_t v8 = [v5 persistentData];
    routeData = v7->_routeData;
    v7->_routeData = (GEOComposedGeometryRoutePersistentData *)v8;

    v10 = [[MapsCustomRouteViewContainee alloc] initWithContext:v7];
    customRouteViewContainee = v7->_customRouteViewContainee;
    v7->_customRouteViewContainee = v10;

    [(ContaineeViewController *)v7->_customRouteViewContainee setContaineeDelegate:v7];
    uint64_t v12 = +[NSMutableArray arrayWithObject:v7->_customRouteViewContainee];
    containees = v7->_containees;
    v7->_containees = (NSMutableArray *)v12;

    v14 = [[MapsSaveRouteContainee alloc] initWithDelegate:v7 isEditing:0 showInitialKeyboard:1];
    saveRouteContainee = v7->_saveRouteContainee;
    v7->_saveRouteContainee = v14;

    id v49 = v5;
    v16 = [[CardView alloc] initAllowingBlurredForButton:1];
    [(CardView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CardView *)v16 setLayoutStyle:6];
    id v17 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v18 = [v17 CGColor];
    v19 = [(CardView *)v16 layer];
    [v19 setBorderColor:v18];

    v20 = [(CardView *)v16 layer];
    [v20 setCornerRadius:8.0];

    v21 = [(CardView *)v16 layer];
    [v21 setBorderWidth:0.5];

    id v22 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v23 = [v22 CGColor];
    v24 = [(CardView *)v16 layer];
    [v24 setShadowColor:v23];

    v25 = [(CardView *)v16 layer];
    LODWORD(v26) = *(_DWORD *)"\nף=";
    [v25 setShadowOpacity:v26];

    v27 = [(CardView *)v16 layer];
    [v27 setShadowOffset:0.0, -2.0];

    v28 = [(CardView *)v16 layer];
    [v28 setShadowPathIsBounds:1];

    recenterButtonContainer = v7->_recenterButtonContainer;
    v7->_recenterButtonContainer = v16;
    v30 = v16;

    v31 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 44.0, 44.0];
    [(UIButton *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v31 setAccessibilityIdentifier:@"RecenterButton"];
    v32 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
    v48 = +[UIImageSymbolConfiguration configurationWithFont:v32];

    v33 = +[UIImage _systemImageNamed:@"location.bottomleft.forward.to.point.topright.scurvepath" withConfiguration:v48];
    [(UIButton *)v31 setImage:v33 forState:0];

    [(UIButton *)v31 addTarget:v7 action:"pressedRecenter" forControlEvents:64];
    [(CardView *)v30 setAlpha:0.0];
    v34 = +[UIColor colorWithDynamicProvider:&stru_1012F0A18];
    [(UIButton *)v31 setTintColor:v34];

    [(UIButton *)v31 imageEdgeInsets];
    -[UIButton setImageEdgeInsets:](v31, "setImageEdgeInsets:");
    recenterButton = v7->_recenterButton;
    v7->_recenterButton = v31;
    v46 = v31;

    v36 = v30;
    v47 = [(CardView *)v30 widthAnchor];
    v37 = [v47 constraintEqualToConstant:44.0];
    v51[0] = v37;
    v38 = [(CardView *)v30 heightAnchor];
    v39 = [v38 constraintEqualToConstant:44.0];
    v51[1] = v39;
    v40 = [(UIButton *)v7->_recenterButton widthAnchor];
    v41 = [v40 constraintEqualToConstant:44.0];
    v51[2] = v41;
    v42 = [(UIButton *)v7->_recenterButton heightAnchor];
    v43 = [v42 constraintEqualToConstant:44.0];
    v51[3] = v43;
    v44 = +[NSArray arrayWithObjects:v51 count:4];
    +[NSLayoutConstraint activateConstraints:v44];

    id v5 = v49;
  }

  return v7;
}

- (MapsCustomRouteViewContext)initWithExistingRouteData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v4];

  v6 = [v5 buildRoute];
  v7 = [(MapsCustomRouteViewContext *)self initWithExistingRoute:v6];

  return v7;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (BOOL)wantsSidebarControl
{
  return 0;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 0;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  return 0;
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

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void)pushSuggestedNavigationMode:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(MapsCustomRouteViewContext *)self composedRoute];
  uint64_t v8 = [v7 userProvidedName];
  if ([v8 length]) {
    [v7 userProvidedName];
  }
  else {
  v9 = [v7 name];
  }

  v10 = [(MapsCustomRouteViewContext *)self chromeViewController];
  [v10 resetForcedExploreModernMapFlag];

  if (a3 - 1 < 3)
  {
    uint64_t v11 = [(MapsCustomRouteViewContext *)self _analyticsTarget];
    uint64_t v12 = [(MapsCustomRouteViewContext *)self _analyticsValue];
    +[GEOAPPortal captureUserAction:3001 target:v11 value:v12];

    v13 = [(MapsCustomRouteViewContext *)self chromeViewController];
    v14 = [v13 _maps_platformController];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1005AAD3C;
    v36[3] = &unk_1012F0A40;
    v37 = v7;
    id v38 = v9;
    id v39 = v6;
    [v14 pushNavigationWithRoute:v37 navigationMode:a3 shouldCheckNavSafetyAlert:1 completion:v36];

    v15 = v37;
LABEL_32:

    goto LABEL_33;
  }
  if (a3 == 4)
  {
    uint64_t v16 = [(MapsCustomRouteViewContext *)self _analyticsTarget];
    id v17 = [(MapsCustomRouteViewContext *)self _analyticsValue];
    +[GEOAPPortal captureUserAction:6003 target:v16 value:v17];

    id v18 = [(MapsCustomRouteViewContext *)self chromeViewController];
    v15 = [v18 contexts];

    v19 = sub_1000990A8(v15, &stru_1012F0A60);
    if (v19)
    {
      v20 = [(MapsCustomRouteViewContext *)self chromeViewController];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1005AAE48;
      v32[3] = &unk_1012E80F0;
      v33 = v19;
      v34 = self;
      id v35 = v6;
      [v20 popToContext:v33 animated:0 completion:v32];

      v21 = v33;
LABEL_30:

      goto LABEL_31;
    }
    id v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[MapsCustomRouteViewContext pushSuggestedNavigationMode:withCompletionHandler:]";
      __int16 v42 = 2080;
      v43 = "MapsCustomRouteViewContext.m";
      __int16 v44 = 1024;
      int v45 = 248;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v21 = sub_10057683C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    double v26 = self;
    if (!v26)
    {
      v31 = @"<nil>";
      goto LABEL_29;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      v29 = [(MapsCustomRouteViewContext *)v26 performSelector:"accessibilityIdentifier"];
      v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_27;
      }
    }
    v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v41 = (const char *)v31;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Missing base mode controller for pushing route planning", buf, 0xCu);

    goto LABEL_30;
  }
  id v22 = sub_1005762E4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v41 = "-[MapsCustomRouteViewContext pushSuggestedNavigationMode:withCompletionHandler:]";
    __int16 v42 = 2080;
    v43 = "MapsCustomRouteViewContext.m";
    __int16 v44 = 1024;
    int v45 = 276;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v15 = sub_1005762E4();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v19 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    v41 = (const char *)v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:
}

- (void)pushSaveContaineeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(MapsCustomRouteViewContext *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    id v17 = v11;
    __int16 v18 = 2080;
    v19 = "-[MapsCustomRouteViewContext pushSaveContaineeWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);
  }
  id v12 = objc_retainBlock(v4);

  id saveCompletionHandler = self->_saveCompletionHandler;
  self->_id saveCompletionHandler = v12;

  v14 = [(MapsCustomRouteViewContext *)self _traits];
  [(MapsSaveRouteContainee *)self->_saveRouteContainee setTraits:v14];

  [(NSMutableArray *)self->_containees addObject:self->_saveRouteContainee];
  v15 = [(MapsCustomRouteViewContext *)self chromeViewController];
  [v15 setNeedsUpdateComponent:@"cards" animated:1];
}

- (id)_traits
{
  v3 = +[GEOMapService sharedService];
  id v4 = [v3 defaultUserInitiatedTraits];

  id v5 = [(MapsCustomRouteViewContext *)self chromeViewController];
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
  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(MapsCustomRouteViewContext *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    id v23 = v11;
    __int16 v24 = 2080;
    v25 = "-[MapsCustomRouteViewContext containeeViewControllerGoToPreviousState:withSender:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);
  }
  unsigned int v12 = [(MapsCustomRouteViewContext *)self exitRouteCreationOnClose];
  v13 = [(MapsCustomRouteViewContext *)self chromeViewController];
  v14 = v13;
  if (v12)
  {
    v15 = [v13 contexts];

    if ((unint64_t)[v15 count] < 2)
    {
LABEL_17:
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      while (1)
      {
        id v17 = [v15 objectAtIndexedSubscript:v16 + 1];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }

        id v18 = [v15 count];
        unint64_t v19 = v16 + 2;
        ++v16;
        if (v19 >= (unint64_t)v18) {
          goto LABEL_17;
        }
      }
    }
    v20 = [(MapsCustomRouteViewContext *)self chromeViewController];
    v21 = [v15 objectAtIndexedSubscript:v16];
    [v20 popToContext:v21 animated:1 completion:0];
  }
  else
  {
    [v13 popContext:self animated:1 completion:0];
    v15 = v14;
  }
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  return 1;
}

- (id)routeData
{
  return self->_routeData;
}

- (void)popContainee
{
  v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(MapsCustomRouteViewContext *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    __int16 v14 = 2080;
    v15 = "-[MapsCustomRouteViewContext popContainee]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);
  }
  [(NSMutableArray *)self->_containees removeLastObject];
  v10 = [(MapsCustomRouteViewContext *)self chromeViewController];
  [v10 setNeedsUpdateComponent:@"cards" animated:1];

  id saveCompletionHandler = self->_saveCompletionHandler;
  self->_id saveCompletionHandler = 0;
}

- (void)didSaveCustomRoute:(id)a3
{
  id v4 = sub_10057683C();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v5 = self;
  if (!v5)
  {
    v10 = @"<nil>";
    goto LABEL_10;
  }
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(MapsCustomRouteViewContext *)v5 performSelector:"accessibilityIdentifier"];
    v9 = v8;
    if (v8 && ![v8 isEqualToString:v7])
    {
      v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

      goto LABEL_8;
    }
  }
  v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v15 = v10;
  __int16 v16 = 2080;
  id v17 = "-[MapsCustomRouteViewContext didSaveCustomRoute:]";
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

LABEL_11:
  [(GEOComposedRoute *)self->_composedRoute updateWithPersistentData:self->_routeData];
  [(NSMutableArray *)self->_containees removeLastObject];
  uint64_t v11 = [(MapsCustomRouteViewContext *)self chromeViewController];
  [v11 setNeedsUpdateComponent:@"cards" animated:1];

  id saveCompletionHandler = (void (**)(void))self->_saveCompletionHandler;
  if (saveCompletionHandler)
  {
    saveCompletionHandler[2]();
    id v13 = self->_saveCompletionHandler;
    self->_id saveCompletionHandler = 0;
  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v4 = a3;
  if (!self->_userInteractedWithMap)
  {
    id v5 = sub_10057683C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_userInteractedWithMap = 1;
      goto LABEL_10;
    }
    id v6 = self;
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(MapsCustomRouteViewContext *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] User started interacting with map, will suppress camera updates", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  [(CardView *)self->_recenterButtonContainer alpha];
  if (v12 < 1.0)
  {
    id v13 = sub_10057683C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_18:

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1005ABC94;
      v20[3] = &unk_1012E5D08;
      v20[4] = self;
      +[UIView animateWithDuration:v20 animations:0.3];
      goto LABEL_19;
    }
    __int16 v14 = self;
    v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      id v17 = [(MapsCustomRouteViewContext *)v14 performSelector:"accessibilityIdentifier"];
      id v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        unint64_t v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    unint64_t v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

    *(_DWORD *)buf = 138543362;
    id v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] animating to show recenter button", buf, 0xCu);

    goto LABEL_18;
  }
LABEL_19:
}

- (void)_resetUserInteractionState
{
  if (self->_userInteractedWithMap)
  {
    v3 = sub_10057683C();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *(_WORD *)&self->_userInteractedWithMap = 0;
      return;
    }
    id v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(MapsCustomRouteViewContext *)v4 performSelector:"accessibilityIdentifier"];
      uint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Clearing user interacted state, will allow camera updates", buf, 0xCu);

    goto LABEL_9;
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 isAnimated];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005ABFDC;
  v15[3] = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005AC100;
  v12[3] = &unk_1012E6830;
  objc_copyWeak(&v13, &location);
  unsigned __int8 v14 = v8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005AC154;
  v9[3] = &unk_1012E7D90;
  objc_copyWeak(&v10, &location);
  unsigned __int8 v11 = v8;
  [v7 addPreparation:v15 animations:v12 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005AC3D4;
  v15[3] = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  [v7 addPreparation:v15];
  unsigned __int8 v8 = [v6 currentContextTransition];
  v9 = [v8 enterAnimation];

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005AC4B0;
    v13[3] = &unk_1012E6708;
    id v10 = &v14;
    objc_copyWeak(&v14, &location);
    [v9 addAnimations:v13];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005AC4FC;
    v11[3] = &unk_1012E6998;
    id v10 = &v12;
    objc_copyWeak(&v12, &location);
    [v7 addCompletion:v11];
  }
  objc_destroyWeak(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)wantsCompassLayoutControl
{
  v2 = [(MapsCustomRouteViewContext *)self chromeViewController];
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
  id v4 = [(MapsCustomRouteViewContext *)self composedRoute];
  id v5 = [(RouteAnnotationsConfiguration *)v3 initWithRoute:v4];

  [(RouteAnnotationsConfiguration *)v5 setRouteTrafficFeaturesActive:0];
  id v6 = [(RouteAnnotationsMutableConfiguration *)v5 copy];

  return (RouteAnnotationsConfiguration *)v6;
}

- (void)_insertRecenterButton
{
  BOOL v3 = [(MapsCustomRouteViewContext *)self chromeViewController];
  id v4 = [v3 viewport];

  id v5 = [(CardView *)self->_recenterButtonContainer contentView];
  [v5 addSubview:self->_recenterButton];

  [v4 addSubview:self->_recenterButtonContainer];
  v25 = [(CardView *)self->_recenterButtonContainer trailingAnchor];
  id v23 = v4;
  __int16 v24 = [v4 trailingAnchor];
  id v22 = [v25 constraintEqualToAnchor:v24 constant:-10.0];
  v26[0] = v22;
  v21 = [(CardView *)self->_recenterButtonContainer bottomAnchor];
  v20 = [v4 bottomAnchor];
  unint64_t v19 = [v21 constraintEqualToAnchor:v20 constant:-10.0];
  v26[1] = v19;
  id v18 = [(UIButton *)self->_recenterButton leadingAnchor];
  id v17 = [(CardView *)self->_recenterButtonContainer leadingAnchor];
  id v16 = [v18 constraintEqualToAnchor:v17];
  v26[2] = v16;
  id v6 = [(UIButton *)self->_recenterButton trailingAnchor];
  id v7 = [(CardView *)self->_recenterButtonContainer trailingAnchor];
  unsigned __int8 v8 = [v6 constraintEqualToAnchor:v7];
  v26[3] = v8;
  v9 = [(UIButton *)self->_recenterButton topAnchor];
  id v10 = [(CardView *)self->_recenterButtonContainer topAnchor];
  unsigned __int8 v11 = [v9 constraintEqualToAnchor:v10];
  v26[4] = v11;
  id v12 = [(UIButton *)self->_recenterButton bottomAnchor];
  id v13 = [(CardView *)self->_recenterButtonContainer bottomAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  v26[5] = v14;
  v15 = +[NSArray arrayWithObjects:v26 count:6];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)_frameRouteAnimated:(BOOL)a3
{
  if (self->_userInteractedWithMap)
  {
    if (self->_loggedFirstCameraSuppress)
    {
      id v4 = sub_10057683C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v5 = self;
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        if (objc_opt_respondsToSelector())
        {
          unsigned __int8 v8 = [(MapsCustomRouteViewContext *)v5 performSelector:"accessibilityIdentifier"];
          v9 = v8;
          if (v8 && ![v8 isEqualToString:v7])
          {
            id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

            goto LABEL_9;
          }
        }
        id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

        *(_DWORD *)buf = 138543362;
        v34 = v10;
        unsigned __int8 v11 = v4;
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}@] Will suppress camera update, user has interacted with map since last update", buf, 0xCu);
      }
LABEL_28:

      return;
    }
    self->_loggedFirstCameraSuppress = 1;
    id v4 = sub_10057683C();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    double v26 = self;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      v29 = [(MapsCustomRouteViewContext *)v26 performSelector:"accessibilityIdentifier"];
      v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_26;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_26:

    *(_DWORD *)buf = 138543362;
    v34 = v10;
    unsigned __int8 v11 = v4;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    goto LABEL_27;
  }
  BOOL v13 = a3;
  id v14 = sub_10057683C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = self;
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      id v18 = [(MapsCustomRouteViewContext *)v15 performSelector:"accessibilityIdentifier"];
      unint64_t v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_16;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_16:

    *(_DWORD *)buf = 138543618;
    v34 = v20;
    __int16 v35 = 1024;
    BOOL v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] _frameRouteAnimated: %d", buf, 0x12u);
  }
  double v21 = 0.3;
  if (!v13) {
    double v21 = 0.0;
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1005ACD54;
  v31[3] = &unk_1012E5D08;
  v31[4] = self;
  +[UIView animateWithDuration:v31 animations:v21];
  id v22 = [(MapsCustomRouteViewContext *)self chromeViewController];
  id v23 = [v22 mapCameraController];
  __int16 v24 = [(MapsCustomRouteViewContext *)self composedRoute];
  v32 = v24;
  v25 = +[NSArray arrayWithObjects:&v32 count:1];
  [v23 frameRoutes:v25 includeCompassInset:0 animated:v13 completion:0];
}

- (void)pressedRecenter
{
  BOOL v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(MapsCustomRouteViewContext *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] pressed recenter", buf, 0xCu);
  }
  [(MapsCustomRouteViewContext *)self _resetUserInteractionState];
  [(MapsCustomRouteViewContext *)self _frameRouteAnimated:1];
}

- (id)_analyticsValue
{
  BOOL v3 = [(MapsCustomRouteViewContext *)self routeData];
  id v4 = [v3 mapItemMuid];

  if (v4)
  {
    id v5 = [(MapsCustomRouteViewContext *)self routeData];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v5 mapItemMuid]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int)_analyticsTarget
{
  v2 = [(MapsCustomRouteViewContext *)self composedRoute];
  if ([v2 source] == (id)2) {
    int v3 = 132;
  }
  else {
    int v3 = 130;
  }

  return v3;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (BOOL)exitRouteCreationOnClose
{
  return self->_exitRouteCreationOnClose;
}

- (void)setExitRouteCreationOnClose:(BOOL)a3
{
  self->_exitRouteCreationOnClose = a3;
}

- (NSUUID)historyUUID
{
  return self->_historyUUID;
}

- (void)setHistoryUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyUUID, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong(&self->_hikingMapToken, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_containees, 0);
  objc_storeStrong((id *)&self->_saveRouteContainee, 0);

  objc_storeStrong((id *)&self->_customRouteViewContainee, 0);
}

@end