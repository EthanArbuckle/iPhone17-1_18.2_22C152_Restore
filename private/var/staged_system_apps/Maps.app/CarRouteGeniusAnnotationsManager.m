@interface CarRouteGeniusAnnotationsManager
- (BOOL)_shouldIgnoreRoute;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (CarRouteGeniusAnnotationsManager)initWithChromeViewController:(id)a3;
- (MKMapItem)destination;
- (id)mapView;
- (void)_updateRouteAnnotation;
- (void)clearAnnotations;
- (void)frameRouteAnimated:(BOOL)a3;
- (void)recenterCameraOnRouteAnimated:(BOOL)a3;
- (void)recenterCameraOnRouteAnimated:(BOOL)a3 force:(BOOL)a4;
- (void)setComposedRoute:(id)a3;
- (void)setDestination:(id)a3;
- (void)updateTrafficForRoute:(id)a3;
@end

@implementation CarRouteGeniusAnnotationsManager

- (CarRouteGeniusAnnotationsManager)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarRouteGeniusAnnotationsManager;
  v5 = [(CarRouteGeniusAnnotationsManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
  }

  return v6;
}

- (void)frameRouteAnimated:(BOOL)a3
{
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(CarRouteGeniusAnnotationsManager *)self _shouldIgnoreRoute])
  {
    v7 = [(CarRouteGeniusAnnotationsManager *)self mapView];
    objc_super v8 = [v7 userLocation];
    v9 = [v8 location];

    v10 = sub_100577E34();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    v11 = self;
    v89 = v9;
    if (!v11)
    {
      v17 = v7;
      v16 = @"<nil>";
      goto LABEL_11;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      v14 = [(CarRouteGeniusAnnotationsManager *)v11 performSelector:"accessibilityIdentifier"];
      v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:
    v17 = v7;

LABEL_11:
    if (v5) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    v19 = v18;
    if (v4) {
      v20 = @"YES";
    }
    else {
      v20 = @"NO";
    }
    *(double *)&v21 = COERCE_DOUBLE(v20);
    route = v11->_route;
    *(_DWORD *)buf = 138544386;
    v91 = v16;
    __int16 v92 = 2112;
    v93 = v19;
    __int16 v94 = 2112;
    double v95 = *(double *)&v21;
    __int16 v96 = 2048;
    double v97 = *(double *)&route;
    __int16 v98 = 2112;
    double v99 = *(double *)&v89;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] recenterCameraOnRouteAnimated:animated %@, force: %@, route %p, userLocation: %@", buf, 0x34u);

    v7 = v17;
    v9 = v89;
LABEL_18:

    if (!self->_route || !v9) {
      goto LABEL_50;
    }
    p_chromeViewController = &self->_chromeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v25 = [WeakRetained mapCameraController];
    id v26 = [objc_alloc((Class)MNLocation) initWithCLLocation:v9];
    [v25 mapRectForTripFromLocation:v26 alongRoute:self->_route];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    if (v4)
    {
      v35 = sub_100577E34();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = self;
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        if (objc_opt_respondsToSelector())
        {
          v39 = [(CarRouteGeniusAnnotationsManager *)v36 performSelector:"accessibilityIdentifier"];
          v40 = v39;
          if (v39 && ![v39 isEqualToString:v38])
          {
            v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

            goto LABEL_27;
          }
        }
        v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_27:

        *(_DWORD *)buf = 138543362;
        v91 = v41;
        v42 = "[%{public}@] - updating framing (forced)";
LABEL_46:
        v72 = v35;
        uint32_t v73 = 12;
        goto LABEL_47;
      }
LABEL_48:

      v35 = objc_loadWeakRetained((id *)p_chromeViewController);
      v79 = [v35 mapCameraController];
      [v79 frameMapRect:v5 animated:0 completion:v28, v30, v32, v34];

LABEL_49:
LABEL_50:

      return;
    }
    [v7 visibleMapRect];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    [v9 coordinate];
    MKMapPoint v103 = MKMapPointForCoordinate(v102);
    v104.origin.x = v44;
    v104.origin.y = v46;
    v104.size.width = v48;
    v104.size.height = v50;
    if (MKMapRectContainsPoint(v104, v103))
    {
      double v88 = v28;
      double v51 = v28;
      double v52 = v30;
      double v53 = v30;
      double v54 = v32;
      double v55 = v32;
      double v56 = v34;
      [v7 _zoomLevelForMapRect:0 includeAccessoryPadding:v51, v53, v55, v34];
      double v58 = v57;
      GEOConfigGetDouble();
      double v86 = v59;
      double v87 = v58;
      if (v58 >= v59) {
        double v58 = v59;
      }
      [v7 _zoomLevelForMapRect:0 includeAccessoryPadding:v44, v46, v48, v50];
      double v61 = v60;
      double v62 = vabdd_f64(v60, v58);
      GEOConfigGetDouble();
      double v64 = v63;
      v35 = sub_100577E34();
      BOOL v65 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
      if (v62 > v64)
      {
        double v66 = v58;
        double v34 = v56;
        double v32 = v54;
        double v30 = v52;
        double v28 = v88;
        if (!v65) {
          goto LABEL_48;
        }
        v67 = self;
        v68 = (objc_class *)objc_opt_class();
        v69 = NSStringFromClass(v68);
        if (objc_opt_respondsToSelector())
        {
          v70 = [(CarRouteGeniusAnnotationsManager *)v67 performSelector:"accessibilityIdentifier"];
          v71 = v70;
          if (v70 && ![v70 isEqualToString:v69])
          {
            v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v69, v67, v71];

            goto LABEL_38;
          }
        }
        v41 = +[NSString stringWithFormat:@"%@<%p>", v69, v67];
LABEL_38:

        *(_DWORD *)buf = 138544642;
        v91 = v41;
        __int16 v92 = 2048;
        v93 = *(__CFString **)&v61;
        __int16 v94 = 2048;
        double v95 = v66;
        __int16 v96 = 2048;
        double v97 = v87;
        __int16 v98 = 2048;
        double v99 = v86;
        __int16 v100 = 2048;
        double v101 = v62;
        v42 = "[%{public}@] - updating framing (zoom current: %lf, target: %lf, desired: %lf, max: %lf, difference: %lf)";
        v72 = v35;
        uint32_t v73 = 62;
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, v42, buf, v73);

        goto LABEL_48;
      }
      if (!v65) {
        goto LABEL_49;
      }
      v80 = self;
      v81 = (objc_class *)objc_opt_class();
      v82 = NSStringFromClass(v81);
      if (objc_opt_respondsToSelector())
      {
        v83 = [(CarRouteGeniusAnnotationsManager *)v80 performSelector:"accessibilityIdentifier"];
        v84 = v83;
        if (v83 && ![v83 isEqualToString:v82])
        {
          v85 = +[NSString stringWithFormat:@"%@<%p, %@>", v82, v80, v84];

          goto LABEL_58;
        }
      }
      v85 = +[NSString stringWithFormat:@"%@<%p>", v82, v80];
LABEL_58:

      *(_DWORD *)buf = 138544642;
      v91 = v85;
      __int16 v92 = 2048;
      v93 = *(__CFString **)&v61;
      __int16 v94 = 2048;
      double v95 = v58;
      __int16 v96 = 2048;
      double v97 = v87;
      __int16 v98 = 2048;
      double v99 = v86;
      __int16 v100 = 2048;
      double v101 = v62;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}@] - not updating framing (zoom current: %lf, target: %lf, desired: %lf, max: %lf, difference: %lf)", buf, 0x3Eu);

      goto LABEL_49;
    }
    v35 = sub_100577E34();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      goto LABEL_48;
    }
    v74 = self;
    v75 = (objc_class *)objc_opt_class();
    v76 = NSStringFromClass(v75);
    if (objc_opt_respondsToSelector())
    {
      v77 = [(CarRouteGeniusAnnotationsManager *)v74 performSelector:"accessibilityIdentifier"];
      v78 = v77;
      if (v77 && ![v77 isEqualToString:v76])
      {
        v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v76, v74, v78];

        goto LABEL_45;
      }
    }
    v41 = +[NSString stringWithFormat:@"%@<%p>", v76, v74];
LABEL_45:

    *(_DWORD *)buf = 138543362;
    v91 = v41;
    v42 = "[%{public}@] - updating framing (user location outside visible rect)";
    goto LABEL_46;
  }
}

- (void)_updateRouteAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = @"the route is nil";
  if (!self->_route) {
    goto LABEL_5;
  }
  if (![(CarRouteGeniusAnnotationsManager *)self _shouldIgnoreRoute])
  {
    v14 = sub_100577E34();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      route = self->_route;
      double v27 = +[NSArray arrayWithObjects:&route count:1];
      [v4 setRoutes:v27];

      goto LABEL_21;
    }
    v15 = self;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      v18 = [(CarRouteGeniusAnnotationsManager *)v15 performSelector:"accessibilityIdentifier"];
      v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_19;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_19:

    v21 = self->_route;
    id v22 = v20;
    v23 = [(GEOComposedRoute *)v21 name];
    v24 = [(GEOComposedRoute *)self->_route uniqueRouteID];
    v25 = [v24 UUIDString];
    unsigned int v26 = [(GEOComposedRoute *)self->_route pointCount];

    *(_DWORD *)buf = 138544130;
    double v31 = v20;
    __int16 v32 = 2112;
    double v33 = v23;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 2048;
    uint64_t v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Drawing route: (name: %@, id: %@, points: %lu)", buf, 0x2Au);

    goto LABEL_20;
  }
  if (self->_route) {
    BOOL v5 = @"the route has multiple legs";
  }
LABEL_5:
  v6 = v5;
  v7 = sub_100577E34();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_super v8 = self;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(CarRouteGeniusAnnotationsManager *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_11;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_11:

    *(_DWORD *)buf = 138543618;
    double v31 = v13;
    __int16 v32 = 2112;
    double v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Won't draw route because %@", buf, 0x16u);
  }
  [v4 setRoutes:0];
LABEL_21:
  [v4 setSelectPolyline:1];
  [v4 setRouteTrafficFeaturesActive:1];
  [v4 setStyle:0];

  return 1;
}

- (BOOL)_shouldIgnoreRoute
{
  v2 = [(GEOComposedRoute *)self->_route legs];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)clearAnnotations
{
  BOOL v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    BOOL v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarRouteGeniusAnnotationsManager *)v4 performSelector:"accessibilityIdentifier"];
      objc_super v8 = v7;
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
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: clearAnnotations", buf, 0xCu);
  }
  route = self->_route;
  self->_route = 0;

  [(CarRouteGeniusAnnotationsManager *)self _updateRouteAnnotation];
  [(CarRouteGeniusAnnotationsManager *)self setDestination:0];
}

- (void)setComposedRoute:(id)a3
{
  id v5 = a3;
  p_route = &self->_route;
  unsigned int v7 = [(GEOComposedRoute *)self->_route _MapsCarPlay_isEqual:v5];
  objc_super v8 = sub_100577E34();
  v9 = v8;
  if (!v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      objc_storeStrong((id *)&self->_route, a3);
      [(CarRouteGeniusAnnotationsManager *)self _updateRouteAnnotation];
      [(CarRouteGeniusAnnotationsManager *)self updateTrafficForRoute:self->_route];
      goto LABEL_18;
    }
    v23 = self;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    log = v9;
    if (objc_opt_respondsToSelector())
    {
      unsigned int v26 = [(CarRouteGeniusAnnotationsManager *)v23 performSelector:"accessibilityIdentifier"];
      double v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        double v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_16;
      }
    }
    double v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_16:

    id v29 = v28;
    double v30 = [v5 name];
    v40 = [v5 uniqueRouteID];
    __int16 v36 = [v40 UUIDString];
    uint64_t v35 = [v5 pointCount];
    [(GEOComposedRoute *)*p_route name];
    double v31 = v38 = v5;
    __int16 v32 = [(GEOComposedRoute *)*p_route uniqueRouteID];
    double v33 = [v32 UUIDString];
    unsigned int v34 = [(GEOComposedRoute *)*p_route pointCount];

    *(_DWORD *)buf = 138544898;
    double v43 = v28;
    __int16 v44 = 2112;
    double v45 = v30;
    __int16 v46 = 2112;
    double v47 = v36;
    __int16 v48 = 2048;
    uint64_t v49 = v35;
    __int16 v50 = 2112;
    double v51 = v31;
    __int16 v52 = 2112;
    double v53 = v33;
    __int16 v54 = 2048;
    uint64_t v55 = v34;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: setRoute: route (name: %@, id: %@, points: %lu), current: (name: %@, id: %@, points: %lu). Redrawing route.", buf, 0x48u);

    id v5 = v38;
    v9 = log;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      v13 = [(CarRouteGeniusAnnotationsManager *)v10 performSelector:"accessibilityIdentifier"];
      v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_8;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

    id v16 = v15;
    uint64_t v37 = [v5 name];
    v39 = [v5 uniqueRouteID];
    v17 = [v39 UUIDString];
    uint64_t v18 = [v5 pointCount];
    v19 = [(GEOComposedRoute *)*p_route name];
    v20 = [(GEOComposedRoute *)*p_route uniqueRouteID];
    v21 = [v20 UUIDString];
    unsigned int v22 = [(GEOComposedRoute *)*p_route pointCount];

    *(_DWORD *)buf = 138544898;
    double v43 = v15;
    __int16 v44 = 2112;
    double v45 = v37;
    __int16 v46 = 2112;
    double v47 = v17;
    __int16 v48 = 2048;
    uint64_t v49 = v18;
    __int16 v50 = 2112;
    double v51 = v19;
    __int16 v52 = 2112;
    double v53 = v21;
    __int16 v54 = 2048;
    uint64_t v55 = v22;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] CarRouteGeniusAnnotationsManager: setRoute, new route (name: %@, id: %@, points: %lu) was considered equal to current route (name: %@, id: %@, points: %lu), we're not redrawing", buf, 0x48u);
  }
LABEL_18:
}

- (void)updateTrafficForRoute:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedRoute *)self->_route _MapsCarPlay_isEqual:v4])
  {
    id v5 = sub_100577E34();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(GEOComposedRoute *)self->_route _maps_refreshTrafficIncidentsOnRoute];
      goto LABEL_10;
    }
    v6 = self;
    unsigned int v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarRouteGeniusAnnotationsManager *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    v12 = [v4 uniqueRouteID];
    v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Will update traffic for route: %@", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
}

- (id)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  BOOL v3 = [WeakRetained mapView];

  return v3;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end