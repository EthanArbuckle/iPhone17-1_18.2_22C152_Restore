@interface ChromeMapSelectionHandler
- (BOOL)_checkAndPropagateSpecificCallbacksForAnnotationView:(id)a3;
- (BOOL)_checkAndPropagateSpecificCallbacksForMarker:(id)a3;
- (BOOL)_propagateDidSelectInvocation:(id)a3;
- (BOOL)_propagateShouldSelectInvocation:(id)a3;
- (BOOL)mapSelectionManager:(id)a3 shouldSelectAnnotationView:(id)a4;
- (BOOL)mapSelectionManager:(id)a3 shouldSelectVKLabelMarker:(id)a4;
- (ChromeMapSelectionHandler)initWithChromeViewController:(id)a3;
- (id)_invocationWithSelector:(SEL)a3 argument:(id)a4;
- (id)protocolMethodSignatureForSelector:(SEL)a3;
- (id)searchPinsManagerForMapSelectionManager:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (void)mapSelectionManager:(id)a3 selectAnnotationView:(id)a4;
- (void)mapSelectionManager:(id)a3 selectVKLabelMarker:(id)a4;
- (void)mapSelectionManagerClearSelection:(id)a3;
@end

@implementation ChromeMapSelectionHandler

- (ChromeMapSelectionHandler)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ChromeMapSelectionHandler;
  v5 = [(ChromeMapSelectionHandler *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
    objc_storeStrong((id *)&v6->_protocol, &OBJC_PROTOCOL___ChromeMapSelectionDelegate);
  }

  return v6;
}

- (BOOL)mapSelectionManager:(id)a3 shouldSelectVKLabelMarker:(id)a4
{
  v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeShouldAllowSelectingLabelMarker:" argument:a4];
  unsigned int v6 = [(ChromeMapSelectionHandler *)self _propagateShouldSelectInvocation:v5];
  BOOL v7 = 1;
  if (v6)
  {
    char v9 = 1;
    [v5 getReturnValue:&v9];
    BOOL v7 = v9 != 0;
  }

  return v7;
}

- (void)mapSelectionManager:(id)a3 selectVKLabelMarker:(id)a4
{
  id v6 = a4;
  if (!-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:](self, "_checkAndPropagateSpecificCallbacksForMarker:"))
  {
    v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectLabelMarker:" argument:v6];
    [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v5];
  }
}

- (BOOL)_checkAndPropagateSpecificCallbacksForMarker:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend(v4, "_maps_hasCustomPOIAnnotation"))
  {
    if ([v4 isRouteEta])
    {
      v10 = [v4 routeInfo];
      v5 = [v10 route];

      if (!v5)
      {
        v31 = sub_1005762E4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          __int16 v45 = 2080;
          v46 = "ChromeMapSelectionHandler.m";
          __int16 v47 = 1024;
          int v48 = 99;
          __int16 v49 = 2080;
          v50 = "route != nil";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v32 = sub_1005762E4();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      v11 = "chromeDidSelectETAMarkerForRoute:";
      goto LABEL_8;
    }
    if ([v4 isFlyoverTour])
    {
      v5 = [v4 flyoverTourIdentifier];
      if (!v5)
      {
        v34 = sub_1005762E4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          __int16 v45 = 2080;
          v46 = "ChromeMapSelectionHandler.m";
          __int16 v47 = 1024;
          int v48 = 106;
          __int16 v49 = 2080;
          v50 = "identifier != nil";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v35 = sub_1005762E4();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      v11 = "chromeDidSelectFlyoverTourLabelMarker:";
LABEL_16:
      v12 = self;
      id v13 = v4;
      goto LABEL_17;
    }
    if ([v4 isTransitLine])
    {
      v19 = "chromeDidSelectTransitLineMarker:";
LABEL_24:
      v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:v19 argument:v4];
      BOOL v17 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v5];
      goto LABEL_20;
    }
    if ([v4 isTrafficIncident])
    {
      v5 = [v4 incident];
      if (!v5)
      {
        v37 = sub_1005762E4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          __int16 v45 = 2080;
          v46 = "ChromeMapSelectionHandler.m";
          __int16 v47 = 1024;
          int v48 = 118;
          __int16 v49 = 2080;
          v50 = "trafficIncident";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v38 = sub_1005762E4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      BOOL v7 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectTrafficIncident:latitude:longitude:" argument:v5];
      [v4 coordinate];
      double v21 = v20;
      *(void *)buf = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v43 = +[NSNumber numberWithDouble:v21];
      [v7 setArgument:buf atIndex:3];
      [v7 setArgument:&v43 atIndex:4];
      BOOL v17 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v7];

      goto LABEL_19;
    }
    if ([v4 isRouteWaypoint])
    {
      v22 = [v4 waypointInfo];
      v5 = [v22 waypoint];

      if (![v5 hasFindMyHandleID])
      {
        v24 = [v5 addressBookAddress];
        BOOL v7 = v24;
        if (v24 && ([v24 isMeCard] & 1) == 0)
        {
          v14 = "chromeDidSelectWaypointMarkerForAddress:";
          v15 = self;
          id v16 = v7;
        }
        else
        {
          if (![v4 featureID])
          {
            char v9 = [v4 _maps_mapItem];
            if (v9)
            {
              v25 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectMarkerForMapItem:" argument:v9];
              BOOL v17 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v25];
            }
            else
            {
              BOOL v17 = 0;
            }
            goto LABEL_12;
          }
          v14 = "chromeDidSelectRouteWaypointMarker:";
          v15 = self;
          id v16 = v4;
        }
        goto LABEL_10;
      }
      v23 = [v5 findMyHandleID];
      BOOL v7 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:" argument:v23];

LABEL_18:
      BOOL v17 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v7];
      goto LABEL_19;
    }
    if ([v4 isRouteAnnotation])
    {
      v5 = [v4 _maps_selectableRouteAnnotations];
      if (![v5 count])
      {
        v40 = sub_1005762E4();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          __int16 v45 = 2080;
          v46 = "ChromeMapSelectionHandler.m";
          __int16 v47 = 1024;
          int v48 = 159;
          __int16 v49 = 2080;
          v50 = "selectableAnnotations.count > 0";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v41 = sub_1005762E4();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      v11 = "chromeDidSelectRouteAnnotations:";
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "_maps_isOfflineAnnotation") & 1) != 0
      || objc_msgSend(v4, "_maps_isOfflineClusterAnnotation"))
    {
      v19 = "chromeDidSelectOfflineAnnotationMarker:";
      goto LABEL_24;
    }
    if ([v4 isCluster])
    {
      v5 = [v4 clusterWaypointInfos];
      if ((unint64_t)[v5 count] <= 1)
      {
        if (![v4 clusterFeatureCount]
          || (objc_msgSend(v4, "_maps_isOfflineClusterAnnotation") & 1) != 0)
        {
          BOOL v17 = 0;
          goto LABEL_20;
        }
        v26 = &selRef_chromeDidSelectClusteredFeatureAnnotationsMarker_;
      }
      else
      {
        v26 = &selRef_chromeDidSelectClusteredWaypointMarker_;
      }
      v11 = *v26;
      goto LABEL_16;
    }
    if (MapsFeature_IsEnabled_ShelbyvilleSearch())
    {
      if ((objc_msgSend(v4, "_mapkit_hasMUID") & 1) == 0) {
        goto LABEL_57;
      }
    }
    else if (![v4 hasBusinessID])
    {
      goto LABEL_57;
    }
    uint64_t v27 = [v4 _maps_mapItem];
    if (v27)
    {
      v5 = (void *)v27;
      v11 = "chromeDidSelectMarkerForMapItem:";
LABEL_8:
      v12 = self;
      id v13 = v5;
LABEL_17:
      BOOL v7 = [(ChromeMapSelectionHandler *)v12 _invocationWithSelector:v11 argument:v13];
      goto LABEL_18;
    }
LABEL_57:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  v5 = [v4 _maps_customPOIAnnotation];
  if (!v5)
  {
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
      __int16 v45 = 2080;
      v46 = "ChromeMapSelectionHandler.m";
      __int16 v47 = 1024;
      int v48 = 85;
      __int16 v49 = 2080;
      v50 = "customPOI != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v6 = [v5 searchResult];
  BOOL v7 = [v6 composedWaypoint];

  if (![v7 hasFindMyHandleID])
  {
    v14 = "chromeDidSelectCustomPOIAnnotation:";
    v15 = self;
    id v16 = v5;
LABEL_10:
    char v9 = [(ChromeMapSelectionHandler *)v15 _invocationWithSelector:v14 argument:v16];
    goto LABEL_11;
  }
  objc_super v8 = [v7 findMyHandleID];
  char v9 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:" argument:v8];

LABEL_11:
  BOOL v17 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v9];
LABEL_12:

LABEL_19:
LABEL_20:

LABEL_21:
  return v17;
}

- (BOOL)mapSelectionManager:(id)a3 shouldSelectAnnotationView:(id)a4
{
  v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeShouldAllowSelectingAnnotationView:" argument:a4];
  unsigned int v6 = [(ChromeMapSelectionHandler *)self _propagateShouldSelectInvocation:v5];
  BOOL v7 = 1;
  if (v6)
  {
    char v9 = 1;
    [v5 getReturnValue:&v9];
    BOOL v7 = v9 != 0;
  }

  return v7;
}

- (void)mapSelectionManager:(id)a3 selectAnnotationView:(id)a4
{
  id v6 = a4;
  if (!-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForAnnotationView:](self, "_checkAndPropagateSpecificCallbacksForAnnotationView:"))
  {
    v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectAnnotationView:" argument:v6];
    [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v5];
  }
}

- (BOOL)_checkAndPropagateSpecificCallbacksForAnnotationView:(id)a3
{
  id v4 = [a3 annotation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidSelectUserLocationAnnotation:" argument:v4];
    BOOL v6 = [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)mapSelectionManagerClearSelection:(id)a3
{
  id v4 = [(ChromeMapSelectionHandler *)self _invocationWithSelector:"chromeDidClearMapSelection" argument:0];
  [(ChromeMapSelectionHandler *)self _propagateDidSelectInvocation:v4];
}

- (id)searchPinsManagerForMapSelectionManager:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v4 = [WeakRetained searchPinsManager];

  return v4;
}

- (int)currentUITargetForAnalytics
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned int v4 = [WeakRetained conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_chromeViewController);
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentUITargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned int v4 = [WeakRetained conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_chromeViewController);
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (id)_invocationWithSelector:(SEL)a3 argument:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  BOOL v7 = [(ChromeMapSelectionHandler *)self protocolMethodSignatureForSelector:a3];
  if (!v7)
  {
    v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "-[ChromeMapSelectionHandler _invocationWithSelector:argument:]";
      __int16 v16 = 2080;
      BOOL v17 = "ChromeMapSelectionHandler.m";
      __int16 v18 = 1024;
      int v19 = 275;
      __int16 v20 = 2080;
      double v21 = "methodSignature != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  objc_super v8 = +[NSInvocation invocationWithMethodSignature:v7];
  [v8 setSelector:a3];
  if (v6) {
    [v8 setArgument:&v13 atIndex:2];
  }

  return v8;
}

- (id)protocolMethodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (objc_method_description v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    objc_super v8 = +[NSMethodSignature signatureWithObjCTypes:types];
  }
  else
  {
    [(ChromeMapSelectionHandler *)self doesNotRecognizeSelector:a3];
    objc_super v8 = 0;
  }

  return v8;
}

- (BOOL)_propagateShouldSelectInvocation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v95 = 1;
  v84 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v5 = [WeakRetained contexts];
  id v6 = [v5 reverseObjectEnumerator];
  objc_method_description v7 = [v6 allObjects];

  aSelector = (const char *)[v4 selector];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v7;
  id v88 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
  char v8 = 0;
  if (v88)
  {
    char v9 = &selRef__updateSortedAppStoreAppsForTransportType_;
    uint64_t v87 = *(void *)v92;
    id v83 = v4;
    do
    {
      v10 = 0;
      v86 = v9[326];
      do
      {
        if (*(void *)v92 != v87) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v91 + 1) + 8 * (void)v10);
        v12 = v11;
        if (objc_opt_respondsToSelector())
        {
          v12 = [v11 mapSelectionDelegate];
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v23 = sub_10060B004();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v24 = v84;
            if (v84)
            {
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_29;
              }
              uint64_t v27 = [(ChromeMapSelectionHandler *)v24 performSelector:v86];
              v28 = v27;
              if (v27 && ![v27 isEqualToString:v26])
              {
                v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];
              }
              else
              {

LABEL_29:
                v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
              }
            }
            else
            {
              v29 = @"<nil>";
            }

            v37 = v29;
            id v38 = v12;
            if (v38)
            {
              v39 = (objc_class *)objc_opt_class();
              v40 = NSStringFromClass(v39);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_45;
              }
              v41 = [v38 performSelector:v86];
              v42 = v41;
              if (v41 && ![v41 isEqualToString:v40])
              {
                id v43 = +[NSString stringWithFormat:@"%@<%p, %@>", v40, v38, v42];

                id v4 = v83;
              }
              else
              {

                id v4 = v83;
LABEL_45:
                id v43 = +[NSString stringWithFormat:@"%@<%p>", v40, v38];
              }
            }
            else
            {
              id v43 = @"<nil>";
            }

            NSStringFromSelector(aSelector);
            v46 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v97 = v37;
            __int16 v98 = 2114;
            v99 = v43;
            __int16 v100 = 2114;
            v101 = v46;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ does not respond to %{public}@", buf, 0x20u);
          }
          goto LABEL_57;
        }
        id v13 = [v4 _maps_copy];
        [v13 invokeWithTarget:v12];
        char v90 = 1;
        [v13 getReturnValue:&v90];
        if (v95) {
          BOOL v14 = v90 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        int v15 = !v14;
        unsigned __int8 v95 = v15;
        __int16 v16 = sub_10060B004();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          BOOL v17 = v84;
          if (v84)
          {
            __int16 v18 = (objc_class *)objc_opt_class();
            int v19 = NSStringFromClass(v18);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_21;
            }
            __int16 v20 = [(ChromeMapSelectionHandler *)v17 performSelector:v86];
            double v21 = v20;
            if (v20 && ![v20 isEqualToString:v19])
            {
              v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];
            }
            else
            {

LABEL_21:
              v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
            }
          }
          else
          {
            v22 = @"<nil>";
          }

          v30 = v22;
          id v31 = v12;
          if (v31)
          {
            v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_37;
            }
            v34 = [v31 performSelector:v86];
            v35 = v34;
            if (v34 && ![v34 isEqualToString:v33])
            {
              v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];
            }
            else
            {

LABEL_37:
              v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
            }
          }
          else
          {
            v36 = @"<nil>";
          }

          if (v90) {
            v44 = "allows";
          }
          else {
            v44 = "disallows";
          }
          __int16 v45 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138544130;
          v97 = v30;
          __int16 v98 = 2114;
          v99 = v36;
          __int16 v100 = 2080;
          v101 = v44;
          __int16 v102 = 2114;
          v103 = v45;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %s %{public}@ ", buf, 0x2Au);

          int v15 = v95;
          id v4 = v83;
        }

        char v8 = 1;
        if (!v15) {
          goto LABEL_86;
        }
LABEL_57:
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 wantsMapSelectionControl])
        {
          int v48 = sub_10060B004();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            __int16 v49 = v84;
            if (v84)
            {
              v50 = (objc_class *)objc_opt_class();
              v51 = NSStringFromClass(v50);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_73;
              }
              v52 = [(ChromeMapSelectionHandler *)v49 performSelector:v86];
              v53 = v52;
              if (v52 && ![v52 isEqualToString:v51])
              {
                v54 = +[NSString stringWithFormat:@"%@<%p, %@>", v51, v49, v53];
              }
              else
              {

LABEL_73:
                v54 = +[NSString stringWithFormat:@"%@<%p>", v51, v49];
              }
            }
            else
            {
              v54 = @"<nil>";
            }

            v55 = v54;
            id v56 = v12;
            if (v56)
            {
              v57 = (objc_class *)objc_opt_class();
              v58 = NSStringFromClass(v57);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_81;
              }
              v59 = [v56 performSelector:v86];
              v60 = v59;
              if (v59 && ![v59 isEqualToString:v58])
              {
                v61 = +[NSString stringWithFormat:@"%@<%p, %@>", v58, v56, v60];
              }
              else
              {

LABEL_81:
                v61 = +[NSString stringWithFormat:@"%@<%p>", v58, v56];
              }
            }
            else
            {
              v61 = @"<nil>";
            }

            NSStringFromSelector(aSelector);
            v62 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v97 = v55;
            __int16 v98 = 2114;
            v99 = v61;
            __int16 v100 = 2114;
            v101 = v62;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ wants map selection control (%{public}@)", buf, 0x20u);
          }
LABEL_86:

          goto LABEL_87;
        }

        v10 = (char *)v10 + 1;
      }
      while (v88 != v10);
      id v47 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
      id v88 = v47;
      char v9 = &selRef__updateSortedAppStoreAppsForTransportType_;
    }
    while (v47);
  }
LABEL_87:

  if (v95 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v63 = [v4 _maps_copy];
    [v63 invokeWithTarget:WeakRetained];
    char v90 = 1;
    [v63 getReturnValue:&v90];
    unsigned __int8 v95 = v90;
    v64 = sub_10060B004();
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
LABEL_112:

      goto LABEL_113;
    }
    v65 = v84;
    if (!v65)
    {
      v70 = @"<nil>";
LABEL_100:

      v72 = v70;
      id v73 = WeakRetained;
      if (!v73)
      {
        v78 = @"<nil>";
        goto LABEL_108;
      }
      v74 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v74);
      if (objc_opt_respondsToSelector())
      {
        v76 = [v73 performSelector:"accessibilityIdentifier"];
        v77 = v76;
        if (v76 && ![v76 isEqualToString:v75])
        {
          v78 = +[NSString stringWithFormat:@"%@<%p, %@>", v75, v73, v77];

          goto LABEL_106;
        }
      }
      v78 = +[NSString stringWithFormat:@"%@<%p>", v75, v73];
LABEL_106:

LABEL_108:
      if (v90) {
        v79 = "allows";
      }
      else {
        v79 = "disallows";
      }
      v80 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138544130;
      v97 = v72;
      __int16 v98 = 2114;
      v99 = v78;
      __int16 v100 = 2080;
      v101 = v79;
      __int16 v102 = 2114;
      v103 = v80;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %s %{public}@ ", buf, 0x2Au);

      goto LABEL_112;
    }
    v66 = (objc_class *)objc_opt_class();
    v67 = NSStringFromClass(v66);
    if (objc_opt_respondsToSelector())
    {
      v68 = [(ChromeMapSelectionHandler *)v65 performSelector:"accessibilityIdentifier"];
      v69 = v68;
      if (v68 && ![v68 isEqualToString:v67])
      {
        v70 = +[NSString stringWithFormat:@"%@<%p, %@>", v67, v65, v69];

        goto LABEL_96;
      }
    }
    v70 = +[NSString stringWithFormat:@"%@<%p>", v67, v65];
LABEL_96:

    goto LABEL_100;
  }
  if (v8)
  {
LABEL_113:
    [v4 setReturnValue:&v95];
    BOOL v71 = 1;
    goto LABEL_114;
  }
  BOOL v71 = 0;
LABEL_114:

  return v71;
}

- (BOOL)_propagateDidSelectInvocation:(id)a3
{
  id v4 = a3;
  __int16 v98 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v5 = [WeakRetained contexts];
  id v6 = [v5 reverseObjectEnumerator];
  objc_method_description v7 = [v6 allObjects];

  char v8 = (const char *)[v4 selector];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  char v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v105 objects:v115 count:16];
  v101 = v4;
  v97 = v9;
  aSelector = v8;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v106;
    id v13 = &selRef_loadListEditAllActions;
    BOOL v14 = &selRef__updateSortedAppStoreAppsForTransportType_;
    do
    {
      int v15 = 0;
      __int16 v16 = v13[480];
      BOOL v17 = v14[326];
      __int16 v100 = v17;
      do
      {
        if (*(void *)v106 != v12) {
          objc_enumerationMutation(v9);
        }
        id v18 = *(id *)(*((void *)&v105 + 1) + 8 * (void)v15);
        int v19 = v18;
        if (objc_opt_respondsToSelector())
        {
          int v19 = [v18 mapSelectionDelegate];
        }
        if (objc_opt_respondsToSelector())
        {
          __int16 v20 = v16;
          id v21 = v11;
          v22 = [v101 _maps_copy];
          [v22 invokeWithTarget:v19];
          unsigned __int8 v104 = 0;
          __int16 v102 = v22;
          [v22 getReturnValue:&v104];
          LODWORD(v22) = v104;
          log = sub_10060B004();
          BOOL v23 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
          if (v22)
          {
            v39 = WeakRetained;
            if (v23)
            {
              v40 = v98;
              if (v98)
              {
                v41 = (objc_class *)objc_opt_class();
                v42 = NSStringFromClass(v41);
                if ((objc_opt_respondsToSelector() & 1) == 0) {
                  goto LABEL_43;
                }
                id v43 = [(ChromeMapSelectionHandler *)v40 performSelector:v100];
                v44 = v43;
                if (v43 && ![v43 isEqualToString:v42])
                {
                  __int16 v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v42, v40, v44];
                }
                else
                {

LABEL_43:
                  __int16 v45 = +[NSString stringWithFormat:@"%@<%p>", v42, v40];
                }
              }
              else
              {
                __int16 v45 = @"<nil>";
              }

              v62 = v45;
              id v63 = v19;
              if (v63)
              {
                v64 = (objc_class *)objc_opt_class();
                v65 = NSStringFromClass(v64);
                if ((objc_opt_respondsToSelector() & 1) == 0) {
                  goto LABEL_70;
                }
                v66 = [v63 performSelector:v100];
                v67 = v66;
                if (v66 && ![v66 isEqualToString:v65])
                {
                  v68 = +[NSString stringWithFormat:@"%@<%p, %@>", v65, v63, v67];
                }
                else
                {

LABEL_70:
                  v68 = +[NSString stringWithFormat:@"%@<%p>", v65, v63];
                }
              }
              else
              {
                v68 = @"<nil>";
              }

              v69 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138543874;
              v110 = v62;
              __int16 v111 = 2114;
              v112 = v68;
              __int16 v113 = 2114;
              v114 = v69;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ handled %{public}@", buf, 0x20u);

              char v9 = v97;
            }

            BOOL v70 = 1;
            v46 = v9;
            goto LABEL_108;
          }
          if (v23)
          {
            v24 = v98;
            if (v98)
            {
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_16;
              }
              uint64_t v27 = [(ChromeMapSelectionHandler *)v24 performSelector:v17];
              v28 = v27;
              if (v27 && ![v27 isEqualToString:v26])
              {
                v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];
              }
              else
              {

LABEL_16:
                v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
              }
            }
            else
            {
              v29 = @"<nil>";
            }

            v30 = v29;
            id v31 = v19;
            if (v31)
            {
              v32 = (objc_class *)objc_opt_class();
              v33 = NSStringFromClass(v32);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_24;
              }
              v96 = v33;
              v34 = [v31 performSelector:v100];
              v35 = v34;
              if (v34 && ![v34 isEqualToString:v96])
              {
                v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v96, v31, v35];

                v33 = v96;
              }
              else
              {

                v33 = v96;
LABEL_24:
                v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
              }
            }
            else
            {
              v36 = @"<nil>";
            }

            v37 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138543874;
            v110 = v30;
            __int16 v111 = 2114;
            v112 = v36;
            __int16 v113 = 2114;
            v114 = v37;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ did not handle %{public}@", buf, 0x20u);

            char v9 = v97;
            BOOL v17 = v100;
          }

          id v11 = v21;
          __int16 v16 = v20;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 wantsMapSelectionControl])
        {

          goto LABEL_46;
        }

        int v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      id v38 = [v9 countByEnumeratingWithState:&v105 objects:v115 count:16];
      id v11 = v38;
      id v13 = &selRef_loadListEditAllActions;
      BOOL v14 = &selRef__updateSortedAppStoreAppsForTransportType_;
    }
    while (v38);
  }
LABEL_46:

  v39 = WeakRetained;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_97:
    v46 = sub_10060B004();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
LABEL_107:
      BOOL v70 = 0;
      goto LABEL_108;
    }
    uint64_t v87 = v98;
    if (!v87)
    {
      long long v92 = @"<nil>";
      goto LABEL_106;
    }
    id v88 = (objc_class *)objc_opt_class();
    v89 = NSStringFromClass(v88);
    if (objc_opt_respondsToSelector())
    {
      char v90 = [(ChromeMapSelectionHandler *)v87 performSelector:"accessibilityIdentifier"];
      long long v91 = v90;
      if (v90 && ![v90 isEqualToString:v89])
      {
        long long v92 = +[NSString stringWithFormat:@"%@<%p, %@>", v89, v87, v91];

        goto LABEL_104;
      }
    }
    long long v92 = +[NSString stringWithFormat:@"%@<%p>", v89, v87];
LABEL_104:

LABEL_106:
    NSStringFromSelector(aSelector);
    long long v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v110 = v92;
    __int16 v111 = 2114;
    v112 = v93;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "[%{public}@] Nothing handled %{public}@", buf, 0x16u);

    goto LABEL_107;
  }
  v46 = [v101 _maps_copy];
  [v46 invokeWithTarget:WeakRetained];
  unsigned __int8 v104 = 0;
  [v46 getReturnValue:&v104];
  int v47 = v104;
  int v48 = sub_10060B004();
  BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
  if (!v47)
  {
    if (!v49)
    {
LABEL_96:

      goto LABEL_97;
    }
    id v56 = v98;
    if (!v56)
    {
      v61 = @"<nil>";
LABEL_87:

      v79 = v61;
      id v80 = WeakRetained;
      if (!v80)
      {
        v85 = @"<nil>";
        goto LABEL_95;
      }
      v81 = (objc_class *)objc_opt_class();
      v82 = NSStringFromClass(v81);
      if (objc_opt_respondsToSelector())
      {
        id v83 = [v80 performSelector:"accessibilityIdentifier"];
        v84 = v83;
        if (v83 && ![v83 isEqualToString:v82])
        {
          v85 = +[NSString stringWithFormat:@"%@<%p, %@>", v82, v80, v84];

          char v9 = v97;
          goto LABEL_93;
        }

        char v9 = v97;
      }
      v85 = +[NSString stringWithFormat:@"%@<%p>", v82, v80];
LABEL_93:

LABEL_95:
      v86 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138543874;
      v110 = v79;
      __int16 v111 = 2114;
      v112 = v85;
      __int16 v113 = 2114;
      v114 = v86;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ did not handle %{public}@", buf, 0x20u);

      goto LABEL_96;
    }
    v57 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v57);
    if (objc_opt_respondsToSelector())
    {
      v59 = [(ChromeMapSelectionHandler *)v56 performSelector:"accessibilityIdentifier"];
      v60 = v59;
      if (v59 && ![v59 isEqualToString:v58])
      {
        v61 = +[NSString stringWithFormat:@"%@<%p, %@>", v58, v56, v60];

        goto LABEL_63;
      }
    }
    v61 = +[NSString stringWithFormat:@"%@<%p>", v58, v56];
LABEL_63:

    goto LABEL_87;
  }
  if (v49)
  {
    v50 = v98;
    if (!v50)
    {
      v55 = @"<nil>";
LABEL_76:

      BOOL v71 = v55;
      id v72 = WeakRetained;
      if (!v72)
      {
        v77 = @"<nil>";
        goto LABEL_84;
      }
      id v73 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v73);
      if (objc_opt_respondsToSelector())
      {
        v75 = [v72 performSelector:"accessibilityIdentifier"];
        v76 = v75;
        if (v75 && ![v75 isEqualToString:v74])
        {
          v77 = +[NSString stringWithFormat:@"%@<%p, %@>", v74, v72, v76];

          char v9 = v97;
          goto LABEL_82;
        }

        char v9 = v97;
      }
      v77 = +[NSString stringWithFormat:@"%@<%p>", v74, v72];
LABEL_82:

LABEL_84:
      v78 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138543874;
      v110 = v71;
      __int16 v111 = 2114;
      v112 = v77;
      __int16 v113 = 2114;
      v114 = v78;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ handled %{public}@", buf, 0x20u);

      goto LABEL_85;
    }
    v51 = (objc_class *)objc_opt_class();
    v52 = NSStringFromClass(v51);
    if (objc_opt_respondsToSelector())
    {
      v53 = [(ChromeMapSelectionHandler *)v50 performSelector:"accessibilityIdentifier"];
      v54 = v53;
      if (v53 && ![v53 isEqualToString:v52])
      {
        v55 = +[NSString stringWithFormat:@"%@<%p, %@>", v52, v50, v54];

        goto LABEL_55;
      }
    }
    v55 = +[NSString stringWithFormat:@"%@<%p>", v52, v50];
LABEL_55:

    goto LABEL_76;
  }
LABEL_85:

  BOOL v70 = 1;
LABEL_108:

  return v70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end