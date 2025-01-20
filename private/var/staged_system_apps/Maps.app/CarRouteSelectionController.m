@interface CarRouteSelectionController
- (BOOL)handleKnobPress:(id)a3;
- (BOOL)isActive;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (CGRect)_frameForRoute:(id)a3 offset:(unint64_t)a4;
- (CarRouteSelectableSession)currentSession;
- (CarRouteSelectionController)initWithPlatformController:(id)a3 chromeViewController:(id)a4;
- (GEOComposedRoute)currentRoute;
- (MKMapView)mapView;
- (NSArray)alternateRouteFocusItems;
- (NSArray)focusableRouteItems;
- (NSArray)routes;
- (id)routeAnnotationsController;
- (unint64_t)focusedRouteIndex;
- (void)_rebuildAlternateRouteFocusItems;
- (void)_selectRouteAtIndex:(unint64_t)a3;
- (void)_updateAlternateRouteItemContainingView;
- (void)_updateFocusItemsIfNeeded;
- (void)_updateRouteFrames;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routeItemDidUpdateFocus:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAlternateRouteFocusItems:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setFocusedRouteIndex:(unint64_t)a3;
- (void)setMapView:(id)a3;
@end

@implementation CarRouteSelectionController

- (CarRouteSelectionController)initWithPlatformController:(id)a3 chromeViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CarRouteSelectionController;
  v8 = [(CarRouteSelectionController *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chromeViewController, v7);
    id v10 = objc_storeWeak((id *)&v9->_platformController, v6);
    [v6 addObserver:v9];

    v9->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
    v12 = [WeakRetained currentSession];

    if ([v12 conformsToProtocol:&OBJC_PROTOCOL___CarRouteSelectableSession]) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    [(CarRouteSelectionController *)v9 setCurrentSession:v14];
    v15 = [[CarAlternateRouteItemsContainingView alloc] initWithDataSource:v9];
    routeItemContainingView = v9->_routeItemContainingView;
    v9->_routeItemContainingView = v15;

    [(CarAlternateRouteItemsContainingView *)v9->_routeItemContainingView setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained removeObserver:self forKeyPath:@"edgeInsets"];

  id v4 = objc_loadWeakRetained((id *)&self->_platformController);
  [v4 removeObserver:self];

  v5 = [(CarRouteSelectionController *)self currentSession];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CarRouteSelectionController;
  [(CarRouteSelectionController *)&v6 dealloc];
}

- (void)_updateAlternateRouteItemContainingView
{
  if (self->_active)
  {
    v3 = [(CarRouteSelectionController *)self mapView];

    if (v3)
    {
      id v4 = [(CarAlternateRouteItemsContainingView *)self->_routeItemContainingView superview];
      v5 = [(CarRouteSelectionController *)self mapView];

      if (v4 != v5)
      {
        objc_super v6 = [(CarRouteSelectionController *)self mapView];
        [v6 addSubview:self->_routeItemContainingView];

        routeItemContainingView = self->_routeItemContainingView;
        id v17 = [(CarRouteSelectionController *)self mapView];
        v8 = -[CarAlternateRouteItemsContainingView _maps_constraintsForCenteringInView:](routeItemContainingView, "_maps_constraintsForCenteringInView:");
        +[NSLayoutConstraint activateConstraints:v8];
      }
      return;
    }
    id v10 = sub_100015DB4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      return;
    }
    v11 = self;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [(CarRouteSelectionController *)v11 performSelector:"accessibilityIdentifier"];
      v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_16;
      }
    }
    v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: tried to insert _routeItemContainingView, but self.mapView is nil.", buf, 0xCu);

    goto LABEL_17;
  }
  v9 = self->_routeItemContainingView;

  [(CarAlternateRouteItemsContainingView *)v9 removeFromSuperview];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    id v4 = sub_100015DB4();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(CarRouteSelectionController *)self _updateAlternateRouteItemContainingView];
      [(CarRouteSelectionController *)self _updateFocusItemsIfNeeded];
      return;
    }
    v5 = self;
    objc_super v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CarRouteSelectionController *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    if (self->_active) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    v12 = v11;
    *(_DWORD *)buf = 138543618;
    id v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: setting active: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (void)setMapView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_mapView);
    [v6 removeObserver:self forKeyPath:@"edgeInsets"];

    id v7 = objc_storeWeak((id *)&self->_mapView, obj);
    [obj addObserver:self forKeyPath:@"edgeInsets" options:3 context:off_1015E1FC0];

    id v8 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v8) {
      [(CarRouteSelectionController *)self _updateAlternateRouteItemContainingView];
    }
    else {
      [(CarRouteSelectionController *)self setActive:0];
    }
    [(CarRouteSelectionController *)self _updateFocusItemsIfNeeded];
    v5 = obj;
  }
}

- (id)routeAnnotationsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = [WeakRetained routeAnnotationsController];

  return v3;
}

- (void)setCurrentSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSession);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_currentSession);
    [v5 removeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_currentSession, obj);
    [obj addObserver:self];

    [(CarRouteSelectionController *)self _updateFocusItemsIfNeeded];
  }
}

- (void)setFocusedRouteIndex:(unint64_t)a3
{
  if (self->_focusedRouteIndex != a3)
  {
    self->_focusedRouteIndex = a3;
    id v4 = [(CarRouteSelectionController *)self routeAnnotationsController];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10045D45C;
    v5[3] = &unk_1012EAD50;
    v5[4] = a3;
    [v4 updateConfigurationWithBlock:v5];
  }
}

- (void)setAlternateRouteFocusItems:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_alternateRouteFocusItems != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_alternateRouteFocusItems, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [WeakRetained setNeedsFocusUpdate];

    id v5 = v7;
  }
}

- (NSArray)focusableRouteItems
{
  v3 = [(CarRouteSelectionController *)self routeAnnotationsController];
  id v4 = [v3 configuration];
  if ([v4 alternateRoutesEnabled])
  {
    id v5 = [(CarRouteSelectionController *)self routes];
    BOOL v6 = (unint64_t)[v5 count] < 2;
  }
  else
  {
    BOOL v6 = 1;
  }

  id v7 = [(CarRouteSelectionController *)self alternateRouteFocusItems];
  id v8 = &__NSArray0__struct;
  if (v7 && !v6)
  {
    id v8 = [(CarRouteSelectionController *)self alternateRouteFocusItems];
  }

  return (NSArray *)v8;
}

- (NSArray)routes
{
  v3 = [(CarRouteSelectionController *)self currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5 && [v5 currentTransportType] != (id)1)
  {
    id v8 = 0;
  }
  else
  {
    BOOL v6 = [(CarRouteSelectionController *)self currentSession];
    id v7 = [v6 currentRouteCollection];
    id v8 = [v7 routes];
  }

  return (NSArray *)v8;
}

- (GEOComposedRoute)currentRoute
{
  v2 = [(CarRouteSelectionController *)self currentSession];
  v3 = [v2 currentRouteCollection];
  id v4 = [v3 currentRoute];

  return (GEOComposedRoute *)v4;
}

- (void)_updateFocusItemsIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045D744;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)handleKnobPress:(id)a3
{
  id v4 = a3;
  if ([v4 type] != (id)4)
  {
    BOOL v10 = 0;
    goto LABEL_49;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = [(CarRouteSelectionController *)self focusableRouteItems];
  id v6 = [v5 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v44;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v44 != v7) {
        objc_enumerationMutation(v5);
      }
      v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
      if ([v9 isFocused]) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v43 objects:v54 count:16];
        if (v6) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    v11 = [v9 route];

    if (!v11) {
      goto LABEL_22;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = [(CarRouteSelectionController *)self routeAnnotationsController];
    v13 = [v12 configuration];
    id v14 = [v13 routes];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10045DD64;
    v40[3] = &unk_1012EAD78;
    __int16 v15 = v11;
    v41 = v15;
    p_long long buf = &buf;
    [v14 enumerateObjectsUsingBlock:v40];

    uint64_t v16 = *(void *)(*((void *)&buf + 1) + 24);
    id v17 = sub_100015DB4();
    objc_super v18 = v17;
    BOOL v19 = v16 == 0x7FFFFFFFFFFFFFFFLL;
    BOOL v10 = v16 != 0x7FFFFFFFFFFFFFFFLL;
    if (!v19)
    {
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
LABEL_43:

        [(CarRouteSelectionController *)self _selectRouteAtIndex:*(void *)(*((void *)&buf + 1) + 24)];
LABEL_47:

        _Block_object_dispose(&buf, 8);
        goto LABEL_48;
      }
      v20 = self;
      if (!v20)
      {
        v25 = @"<nil>";
        goto LABEL_42;
      }
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      if (objc_opt_respondsToSelector())
      {
        v23 = [(CarRouteSelectionController *)v20 performSelector:"accessibilityIdentifier"];
        v24 = v23;
        if (v23 && ([v23 isEqualToString:v22] & 1) == 0)
        {
          v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

          goto LABEL_21;
        }
      }
      v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_21:

LABEL_42:
      uint64_t v38 = *(void *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)v47 = 138543618;
      v48 = v25;
      __int16 v49 = 2048;
      uint64_t v50 = v38;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] handleKnobPress: will attempt an alternate route with index: %lu", v47, 0x16u);

      goto LABEL_43;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_46:

      goto LABEL_47;
    }
    v32 = self;
    if (!v32)
    {
      v37 = @"<nil>";
      goto LABEL_45;
    }
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    if (objc_opt_respondsToSelector())
    {
      v35 = [(CarRouteSelectionController *)v32 performSelector:"accessibilityIdentifier"];
      v36 = v35;
      if (v35 && ([v35 isEqualToString:v34] & 1) == 0)
      {
        v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

        goto LABEL_37;
      }
    }
    v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
LABEL_37:

LABEL_45:
    *(_DWORD *)v47 = 138543362;
    v48 = v37;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: Failed to find a route associated with focused route item in routeAnnotationsController.", v47, 0xCu);

    goto LABEL_46;
  }
LABEL_10:

LABEL_22:
  __int16 v15 = sub_100015DB4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v26 = self;
    if (!v26)
    {
      v31 = @"<nil>";
      goto LABEL_39;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      v29 = [(CarRouteSelectionController *)v26 performSelector:"accessibilityIdentifier"];
      v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_29;
      }
    }
    v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_29:

LABEL_39:
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v31;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: Didn't find a focused alternate route item for knob press.", (uint8_t *)&buf, 0xCu);
  }
  BOOL v10 = 0;
LABEL_48:

LABEL_49:
  return v10;
}

- (CGRect)_frameForRoute:(id)a3 offset:(unint64_t)a4
{
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_mapView);
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = objc_loadWeakRetained((id *)p_mapView);
    [v16 _edgeInsets];
    CGFloat v18 = v9 + v17;
    CGFloat v20 = v11 + v19;
    CGFloat v22 = v13 - (v17 + v21);
    CGFloat v24 = v15 - (v19 + v23);

    v31.origin.double x = v18;
    v31.origin.y = v20;
    v31.size.double width = v22;
    v31.size.height = v24;
    double x = CGRectGetMidX(v31) + (double)a4;
    v32.origin.double x = v18;
    v32.origin.y = v20;
    v32.size.double width = v22;
    v32.size.height = v24;
    CGFloat MinY = CGRectGetMinY(v32);
    v33.origin.double x = v18;
    v33.origin.y = v20;
    v33.size.double width = v22;
    v33.size.height = v24;
    double Height = CGRectGetHeight(v33);
    double width = 10.0;
  }
  else
  {
    double x = CGRectZero.origin.x;
    CGFloat MinY = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double Height = CGRectZero.size.height;
  }
  double v29 = x;
  double v30 = MinY;
  result.size.height = Height;
  result.size.double width = width;
  result.origin.y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)_rebuildAlternateRouteFocusItems
{
  if (![(CarRouteSelectionController *)self isActive]
    || ([(CarRouteSelectionController *)self routes],
        v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        (unint64_t)v4 <= 1))
  {
    id v5 = sub_100015DB4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      [(CarRouteSelectionController *)self setAlternateRouteFocusItems:0];
      return;
    }
    id v6 = self;
    if (!v6)
    {
      double v11 = @"<nil>";
      goto LABEL_20;
    }
    id v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      double v9 = [(CarRouteSelectionController *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        double v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    double v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

LABEL_20:
    unsigned int v22 = [(CarRouteSelectionController *)v6 isActive];
    double v23 = @"NO";
    if (v22) {
      double v23 = @"YES";
    }
    CGFloat v24 = v23;
    v25 = [(CarRouteSelectionController *)v6 routes];
    *(_DWORD *)long long buf = 138543874;
    v36 = v11;
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    __int16 v39 = 2048;
    id v40 = [v25 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: Not rebuilding alternate route items. Reson: active: %@, routesCount: %lu", buf, 0x20u);

    goto LABEL_23;
  }
  double v12 = [(CarRouteSelectionController *)self routes];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10045E398;
  v34[3] = &unk_1012EADA0;
  v34[4] = self;
  double v13 = +[NSPredicate predicateWithBlock:v34];
  double v14 = [v12 filteredArrayUsingPredicate:v13];

  double v15 = sub_100015DB4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = self;
    if (!v16)
    {
      double v21 = @"<nil>";
      goto LABEL_25;
    }
    double v17 = (objc_class *)objc_opt_class();
    CGFloat v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      double v19 = [(CarRouteSelectionController *)v16 performSelector:"accessibilityIdentifier"];
      CGFloat v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        double v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_18;
      }
    }
    double v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_18:

LABEL_25:
    v26 = (__CFString *)[v14 count];
    *(_DWORD *)long long buf = 138543618;
    v36 = v21;
    __int16 v37 = 2048;
    uint64_t v38 = v26;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: Rebuilding alternate route items. Alternate routes count: %lu", buf, 0x16u);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10045E3F8;
  v33[3] = &unk_1012EADC8;
  v33[4] = self;
  sub_100099700(v14, v33);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10045E434;
  v30[3] = &unk_1012EADF0;
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  CGRect v32 = self;
  id v27 = v31;
  v28 = sub_100099700(v14, v30);
  double v29 = [v28 sortedArrayUsingComparator:&stru_1012EAE30];
  [(CarRouteSelectionController *)self setAlternateRouteFocusItems:v29];
}

- (void)_updateRouteFrames
{
  v3 = [(CarRouteSelectionController *)self alternateRouteFocusItems];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10045E5F4;
  v4[3] = &unk_1012EAE58;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)_selectRouteAtIndex:(unint64_t)a3
{
  id v5 = [(CarRouteSelectionController *)self routeAnnotationsController];
  id v6 = [v5 configuration];

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v6 routes];
    id v8 = [v7 count];

    if ((unint64_t)v8 > a3)
    {
      double v9 = [v6 routes];
      double v10 = [v9 objectAtIndex:a3];

      if ([v6 selectedRouteIndex] == (id)a3
        || ([(CarRouteSelectionController *)self currentRoute],
            double v11 = objc_claimAutoreleasedReturnValue(),
            unsigned int v12 = [v11 isEqual:v10],
            v11,
            v12))
      {
        double v13 = sub_100015DB4();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_26:

LABEL_29:
          goto LABEL_30;
        }
        double v14 = self;
        if (!v14)
        {
          double v19 = @"<nil>";
          goto LABEL_25;
        }
        double v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        if (objc_opt_respondsToSelector())
        {
          double v17 = [(CarRouteSelectionController *)v14 performSelector:"accessibilityIdentifier"];
          CGFloat v18 = v17;
          if (v17 && ![v17 isEqualToString:v16])
          {
            double v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

            goto LABEL_12;
          }
        }
        double v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_12:

LABEL_25:
        *(_DWORD *)long long buf = 138543362;
        v41 = v19;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController attempted to select alternate route which is already selected.", buf, 0xCu);

        goto LABEL_26;
      }
      CGFloat v20 = [(CarRouteSelectionController *)self currentSession];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
        double v23 = [WeakRetained navigationDisplay];
        double v13 = [v23 trafficAlert];

        if ([v13 alertType] == (id)1)
        {
          CGFloat v24 = [v13 originalRoute];
          unsigned int v25 = [v24 isEqual:v10];

          if (v25)
          {
            v26 = sub_100015DB4();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
LABEL_34:

              goto LABEL_26;
            }
            id v27 = self;
            if (!v27)
            {
              CGRect v32 = @"<nil>";
              goto LABEL_33;
            }
            v28 = (objc_class *)objc_opt_class();
            double v29 = NSStringFromClass(v28);
            if (objc_opt_respondsToSelector())
            {
              double v30 = [(CarRouteSelectionController *)v27 performSelector:"accessibilityIdentifier"];
              id v31 = v30;
              if (v30 && ![v30 isEqualToString:v29])
              {
                CGRect v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

                goto LABEL_23;
              }
            }
            CGRect v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_23:

LABEL_33:
            *(_DWORD *)long long buf = 138543362;
            v41 = v32;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}@] CarRouteSelectionController attempted to select LAR with MNTrafficIncidentAlertType_Blockage, ignoring.", buf, 0xCu);

            goto LABEL_34;
          }
        }
        id v33 = objc_loadWeakRetained((id *)&self->_chromeViewController);
        v34 = [v33 navigationDisplay];
        [v34 setTemporaryDisplayRate:-1 forDuration:-1.0];
      }
      v35 = [(CarRouteSelectionController *)self currentSession];
      [v35 selectRoute:v10];

      [(CarRouteSelectionController *)self setFocusedRouteIndex:0x7FFFFFFFFFFFFFFFLL];
      v36 = [(CarRouteSelectionController *)self currentSession];
      __int16 v37 = [v36 currentRouteCollection];
      id v38 = [v37 indexOfRoute:v10];

      id v39 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      [v39 captureUserAction:3015 selectedRouteIndex:v38];

      goto LABEL_29;
    }
  }
LABEL_30:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (off_1015E1FC0 == a6)
  {
    id v12 = a5;
    double v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
    double v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    if (v13 == v14 || ![v10 isEqualToString:@"edgeInsets"])
    {
    }
    else
    {
      unsigned __int8 v15 = [(CarRouteSelectionController *)self isActive];

      if (v15) {
        [(CarRouteSelectionController *)self _updateRouteFrames];
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CarRouteSelectionController;
    id v11 = a5;
    [(CarRouteSelectionController *)&v16 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CarRouteSelectionController *)self routeAnnotationsController];
  double v9 = [v8 configuration];

  if ([v9 alternateRoutesEnabled])
  {
    id v10 = [v9 routes];
    id v11 = [v9 selectedRoute];
    id v12 = &stru_1012F10B0;
    double v13 = +[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v7, v10, v11, &stru_1012F10B0, x, y);

    double v14 = sub_100015DB4();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v28 = [v9 routes];
      -[CarRouteSelectionController _selectRouteAtIndex:](self, "_selectRouteAtIndex:", [v28 indexOfObject:v13]);

      goto LABEL_23;
    }
    unsigned __int8 v15 = self;
    if (!v15)
    {
      CGFloat v20 = @"<nil>";
      goto LABEL_19;
    }
    objc_super v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      CGFloat v18 = [(CarRouteSelectionController *)v15 performSelector:"accessibilityIdentifier"];
      double v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        CGFloat v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_9;
      }
    }
    CGFloat v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_9:

LABEL_19:
    v35.double x = x;
    v35.double y = y;
    id v27 = NSStringFromCGPoint(v35);
    *(_DWORD *)long long buf = 138543874;
    double v30 = v20;
    __int16 v31 = 2112;
    CGRect v32 = v27;
    __int16 v33 = 2048;
    id v34 = [v13 _maps_routeIndex];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] didTapMapView:atPoint: %@. selectedRoute.routeIndex: %lu", buf, 0x20u);

    goto LABEL_20;
  }
  double v13 = sub_100015DB4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    double v21 = self;
    if (!v21)
    {
      v26 = @"<nil>";
      goto LABEL_22;
    }
    unsigned int v22 = (objc_class *)objc_opt_class();
    double v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      CGFloat v24 = [(CarRouteSelectionController *)v21 performSelector:"accessibilityIdentifier"];
      unsigned int v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_17;
      }
    }
    v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_17:

LABEL_22:
    *(_DWORD *)long long buf = 138543362;
    double v30 = v26;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] didTapMapView:atPoint: alternate routes were not enabled, ignoring call", buf, 0xCu);
  }
LABEL_23:
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return [a4 isRouteEta];
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5 = a4;
  if ([v5 isRouteEta])
  {
    id v6 = [(CarRouteSelectionController *)self routeAnnotationsController];
    id v7 = [v6 configuration];

    id v8 = [v7 routes];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10045F0E0;
    v10[3] = &unk_1012EAE80;
    id v11 = v5;
    id v9 = [v8 indexOfObjectPassingTest:v10];

    [(CarRouteSelectionController *)self _selectRouteAtIndex:v9];
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___CarRouteSelectableSession]) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(CarRouteSelectionController *)self setCurrentSession:v7];
}

- (void)routeItemDidUpdateFocus:(id)a3
{
  id v8 = a3;
  if ([v8 isFocused])
  {
    id v4 = [(CarRouteSelectionController *)self routeAnnotationsController];
    id v5 = [v4 configuration];
    id v6 = [v5 routes];
    id v7 = [v8 route];
    -[CarRouteSelectionController setFocusedRouteIndex:](self, "setFocusedRouteIndex:", [v6 indexOfObject:v7]);
  }
  else
  {
    [(CarRouteSelectionController *)self setFocusedRouteIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (CarRouteSelectableSession)currentSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSession);

  return (CarRouteSelectableSession *)WeakRetained;
}

- (unint64_t)focusedRouteIndex
{
  return self->_focusedRouteIndex;
}

- (NSArray)alternateRouteFocusItems
{
  return self->_alternateRouteFocusItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateRouteFocusItems, 0);
  objc_destroyWeak((id *)&self->_currentSession);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_routeItemContainingView, 0);
  objc_destroyWeak((id *)&self->_platformController);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end