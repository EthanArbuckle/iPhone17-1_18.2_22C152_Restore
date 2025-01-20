@interface CarBasicRouteGeniusModeController
- (BOOL)navigationAidedDrivingEnabled;
- (BOOL)shouldAccessoriesModifyMapInsets;
- (BOOL)shouldMapControlsModifyMapInsets;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (BOOL)wantsNavigationDisplay;
- (BOOL)wantsRouteAnnotationsControl;
- (CarBasicRouteGeniusModeController)initWithSuggestion:(id)a3;
- (ChromeMapSettings)routeGeniusMapSettings;
- (ChromeViewController)chromeViewController;
- (MapsSuggestionsRouteGeniusEntry)currentSuggestion;
- (NSArray)carFocusOrderSequences;
- (SearchResult)destinationPin;
- (id)currentRoute;
- (id)personalizedItemSources;
- (id)routeAnnotationsProvider;
- (int64_t)state;
- (void)_clearAnnotations;
- (void)_externalDeviceUpdated:(id)a3;
- (void)_updateForCurrentRoute;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)didUpdateRouteGenius:(id)a3;
- (void)frameRouteAnimated:(BOOL)a3;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5;
- (void)recenterCameraOnRouteAnimated:(BOOL)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setDestinationPin:(id)a3;
- (void)setNavigationAidedDrivingEnabled:(BOOL)a3;
- (void)setRouteGeniusMapSettings:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateRouteAnnotations;
- (void)updateSearchPins;
@end

@implementation CarBasicRouteGeniusModeController

- (CarBasicRouteGeniusModeController)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarBasicRouteGeniusModeController;
  v6 = [(CarBasicRouteGeniusModeController *)&v11 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_state = 0;
    objc_storeStrong((id *)&v6->_currentSuggestion, a3);
    v9 = +[CarRouteGeniusService sharedService];
    [v9 registerObserver:v6];
  }
  return v6;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3) {
    self->_state = a3;
  }
}

- (void)_updateForCurrentRoute
{
  v3 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  unsigned __int8 v4 = [v3 isCurrentContext:self];

  if (v4)
  {
    currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
    v6 = [(CarBasicRouteGeniusModeController *)self currentRoute];
    unsigned int v7 = [(GEOComposedRoute *)currentlyDisplayedRoute _MapsCarPlay_isEqual:v6];

    v8 = sub_100577E34();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (!v9)
      {
LABEL_10:

        [(CarBasicRouteGeniusModeController *)self recenterCameraOnRouteAnimated:1];
        return;
      }
      v10 = self;
      objc_super v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      if (objc_opt_respondsToSelector())
      {
        v13 = [(CarBasicRouteGeniusModeController *)v10 performSelector:"accessibilityIdentifier"];
        v14 = v13;
        if (v13 && ![v13 isEqualToString:v12])
        {
          v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

          goto LABEL_9;
        }
      }
      v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

      v16 = v15;
      v50 = [(CarBasicRouteGeniusModeController *)v10 currentRoute];
      v47 = [v50 name];
      v49 = [(CarBasicRouteGeniusModeController *)v10 currentRoute];
      v48 = [v49 uniqueRouteID];
      v46 = [v48 UUIDString];
      v17 = [(CarBasicRouteGeniusModeController *)v10 currentRoute];
      unint64_t v18 = [v17 pointCount];
      v19 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute name];
      v20 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute uniqueRouteID];
      v21 = [v20 UUIDString];
      unsigned int v22 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute pointCount];

      *(_DWORD *)buf = 138544898;
      v52 = v15;
      __int16 v53 = 2112;
      v54 = v47;
      __int16 v55 = 2112;
      v56 = v46;
      __int16 v57 = 2048;
      unint64_t v58 = v18;
      __int16 v59 = 2112;
      unint64_t v60 = (unint64_t)v19;
      __int16 v61 = 2112;
      v62 = v21;
      __int16 v63 = 2048;
      uint64_t v64 = v22;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] setRoute, new route (name: %@, id: %@, points: %lu) was considered equal to current route (name: %@, id: %@, points: %lu), just recenter instead.", buf, 0x48u);

      goto LABEL_10;
    }
    if (!v9) {
      goto LABEL_26;
    }
    v30 = self;
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    if (objc_opt_respondsToSelector())
    {
      v33 = [(CarBasicRouteGeniusModeController *)v30 performSelector:"accessibilityIdentifier"];
      v34 = v33;
      if (v33 && ![v33 isEqualToString:v32])
      {
        v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];

        goto LABEL_25;
      }
    }
    v35 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
LABEL_25:

    v36 = self->_currentlyDisplayedRoute;
    v37 = v35;
    v38 = [(GEOComposedRoute *)v36 name];
    unsigned int v39 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute pointCount];

    v40 = (void *)v39;
    v41 = [(CarBasicRouteGeniusModeController *)v30 currentRoute];
    v42 = [v41 name];
    v43 = [(CarBasicRouteGeniusModeController *)v30 currentRoute];
    *(_DWORD *)buf = 138544386;
    v52 = v35;
    __int16 v53 = 2112;
    v54 = v38;
    __int16 v55 = 2048;
    v56 = v40;
    __int16 v57 = 2112;
    unint64_t v58 = (unint64_t)v42;
    __int16 v59 = 2048;
    unint64_t v60 = [v43 pointCount];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] _updateForCurrentRoute route changed, updating pins and route annotations, previous: (%@, points: %lu), new: (%@, points: %lu)", buf, 0x34u);

LABEL_26:
    v44 = [(CarBasicRouteGeniusModeController *)self currentRoute];
    v45 = self->_currentlyDisplayedRoute;
    self->_currentlyDisplayedRoute = v44;

    [(CarBasicRouteGeniusModeController *)self updateRouteAnnotations];
    [(CarBasicRouteGeniusModeController *)self updateSearchPins];
    return;
  }
  v23 = sub_100577E34();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = self;
    if (!v24)
    {
      v29 = @"<nil>";
      goto LABEL_28;
    }
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      v27 = [(CarBasicRouteGeniusModeController *)v24 performSelector:"accessibilityIdentifier"];
      v28 = v27;
      if (v27 && ![v27 isEqualToString:v26])
      {
        v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

        goto LABEL_18;
      }
    }
    v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_18:

LABEL_28:
    *(_DWORD *)buf = 138543362;
    v52 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[%{public}@] _updateForCurrentRoute route changed, but we are not the current context; ignoring",
      buf,
      0xCu);
  }
}

- (void)updateSearchPins
{
  v3 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  unsigned __int8 v4 = +[SearchResult carSearchResultFromDestination:v3];
  [(CarBasicRouteGeniusModeController *)self setDestinationPin:v4];

  id v5 = sub_100577E34();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_10;
  }
  v6 = self;
  unsigned int v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(CarBasicRouteGeniusModeController *)v6 performSelector:"accessibilityIdentifier"];
    v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_7;
    }
  }
  objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_7:

  v12 = [(CarBasicRouteGeniusModeController *)v6 destinationPin];
  CFStringRef v13 = @"updating";
  if (!v12) {
    CFStringRef v13 = @"clearing";
  }
  *(_DWORD *)buf = 138543618;
  v27 = v11;
  __int16 v28 = 2112;
  CFStringRef v29 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %@ pins.", buf, 0x16u);

LABEL_10:
  v14 = [(CarBasicRouteGeniusModeController *)self currentRoute];
  BOOL v15 = v14 != 0;

  v16 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  v17 = [v16 searchPinsManager];
  [v17 setDisableStartPin:v15];

  unint64_t v18 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  v19 = [v18 searchPinsManager];
  [v19 setDisableEndPins:v15];

  v20 = [(CarBasicRouteGeniusModeController *)self destinationPin];

  v21 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  unsigned int v22 = [v21 searchPinsManager];
  v23 = v22;
  if (v20)
  {
    v24 = +[SearchResult currentLocationSearchResult];
    v25 = [(CarBasicRouteGeniusModeController *)self destinationPin];
    [v23 setStartPin:v24 endPin:v25];
  }
  else
  {
    [v22 clearDirectionsPins];
  }
}

- (void)updateRouteAnnotations
{
  id v3 = objc_alloc((Class)MKMapItem);
  unsigned __int8 v4 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  id v5 = [v4 geoMapItem];
  id v6 = [v3 initWithGeoMapItem:v5 isPlaceHolderPlace:0];
  unsigned int v7 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  v8 = [v7 routeGeniusAnnotationsManager];
  [v8 setDestination:v6];

  BOOL v9 = [(CarBasicRouteGeniusModeController *)self currentRoute];
  if (v9)
  {
    v10 = [(CarBasicRouteGeniusModeController *)self currentRoute];
    unsigned int v11 = [v10 isNavigable];
  }
  else
  {
    unsigned int v11 = 1;
  }

  v12 = 0;
  unsigned int v88 = v11;
  if (![(CarBasicRouteGeniusModeController *)self navigationAidedDrivingEnabled] && v11)
  {
    v12 = [(CarBasicRouteGeniusModeController *)self currentRoute];
  }
  CFStringRef v13 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  v14 = [v13 entry];
  v90 = +[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:v14];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = [v12 waypoints];
  id v15 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v102;
    double v18 = GEOMapItemEquivalenceDistanceThreshold;
    v91 = self;
    uint64_t v92 = *(void *)v102;
    v89 = v12;
    do
    {
      v19 = 0;
      id v93 = v16;
      do
      {
        if (*(void *)v102 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v19);
        uint64_t v21 = [v12 origin];
        if (v20 == (void *)v21) {
          goto LABEL_35;
        }
        unsigned int v22 = (void *)v21;
        unsigned __int8 v23 = [v20 hasStyleAttributesData];

        if (v23) {
          goto LABEL_36;
        }
        v24 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
        v25 = [v24 entry];
        uint64_t v26 = (uint64_t)[v25 type];

        if (v26 <= 6)
        {
          if (v26 == 1)
          {
            uint64_t v27 = +[GEOFeatureStyleAttributes homeStyleAttributes];
            goto LABEL_28;
          }
          if (v26 == 2)
          {
            uint64_t v27 = +[GEOFeatureStyleAttributes workStyleAttributes];
            goto LABEL_28;
          }
        }
        else
        {
          switch(v26)
          {
            case 7:
              uint64_t v27 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
              goto LABEL_28;
            case 19:
              uint64_t v27 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
              goto LABEL_28;
            case 24:
              uint64_t v27 = +[GEOFeatureStyleAttributes sharedLocationStyleAttributes];
              goto LABEL_28;
          }
        }
        __int16 v28 = [v12 destination];

        if (v20 == v28)
        {
          v41 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
          v42 = [v41 entry];
          v43 = [v42 geoMapItem];
          CFStringRef v29 = [v43 _styleAttributes];

          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v94 = v90;
          id v44 = [v94 countByEnumeratingWithState:&v97 objects:v112 count:16];
          if (v44)
          {
            id v45 = v44;
            uint64_t v46 = *(void *)v98;
LABEL_41:
            uint64_t v47 = 0;
            while (1)
            {
              if (*(void *)v98 != v46) {
                objc_enumerationMutation(v94);
              }
              v48 = *(void **)(*((void *)&v97 + 1) + 8 * v47);
              v49 = [v48 searchResult];
              v50 = [v49 mapItem];
              v51 = [v50 _geoMapItem];

              v52 = [v20 geoMapItem];
              [v51 coordinate];
              [v52 coordinate];
              GEOCalculateDistance();
              if (v53 < v18)
              {
                v54 = [v51 name];
                [v52 name];
                v96 = v48;
                __int16 v55 = v19;
                v56 = v20;
                id v57 = v45;
                v59 = uint64_t v58 = v46;
                unsigned __int8 v60 = [v54 isEqualToString:v59];

                uint64_t v46 = v58;
                id v45 = v57;
                v20 = v56;
                v19 = v55;

                if (v60) {
                  break;
                }
              }

              if (v45 == (id)++v47)
              {
                id v45 = [v94 countByEnumeratingWithState:&v97 objects:v112 count:16];
                if (v45) {
                  goto LABEL_41;
                }
                goto LABEL_48;
              }
            }
            __int16 v61 = v96;

            if (!v61) {
              goto LABEL_51;
            }
            v62 = [v61 searchResult];
            CFStringRef v29 = +[GEOFeatureStyleAttributes styleAttributesForSearchResult:v62];

            v12 = v89;
            self = v91;
            goto LABEL_59;
          }
LABEL_48:

LABEL_51:
          CFStringRef v29 = +[GEOFeatureStyleAttributes genericMarkerStyleAttributes];
          __int16 v61 = sub_100577E34();
          self = v91;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            __int16 v63 = v91;
            uint64_t v64 = (objc_class *)objc_opt_class();
            v65 = NSStringFromClass(v64);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_56;
            }
            v66 = [(CarBasicRouteGeniusModeController *)v63 performSelector:"accessibilityIdentifier"];
            v67 = v66;
            if (v66 && ![v66 isEqualToString:v65])
            {
              v68 = +[NSString stringWithFormat:@"%@<%p, %@>", v65, v63, v67];
            }
            else
            {

LABEL_56:
              v68 = +[NSString stringWithFormat:@"%@<%p>", v65, v63];
            }

            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v68;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v20;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get styleAttributes for waypoint: %@", buf, 0x16u);
          }
          v12 = v89;
LABEL_59:

          goto LABEL_29;
        }
        uint64_t v27 = +[GEOFeatureStyleAttributes evChargerStyleAttributes];
LABEL_28:
        CFStringRef v29 = (void *)v27;
LABEL_29:
        id v30 = [v29 copy];

        *(_OWORD *)buf = xmmword_100F73750;
        [v30 replaceAttributes:buf count:2];
        [v20 setStyleAttributes:v30];
        v31 = [v20 mapItemStorage];

        if (v31)
        {
          v32 = [v20 mapItemStorage];
          v33 = [v32 userValues];
          v34 = v33;
          if (v33) {
            id v35 = v33;
          }
          else {
            id v35 = (id)objc_opt_new();
          }
          v36 = v35;

          v37 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
          v38 = [v37 entry];
          unsigned int v39 = [v38 poiTitle];
          [v36 setName:v39];

          self = v91;
          v40 = [v20 mapItemStorage];
          [v40 setUserValues:v36];
        }
        v20 = v30;
        uint64_t v17 = v92;
        id v16 = v93;
LABEL_35:

LABEL_36:
        v19 = (char *)v19 + 1;
      }
      while (v19 != v16);
      id v69 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
      id v16 = v69;
    }
    while (v69);
  }

  v70 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  v71 = [v70 routeGeniusAnnotationsManager];
  [v71 setComposedRoute:v12];

  if (v12)
  {
    v72 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v72 captureUserAction:3072];
  }
  if (![(CarBasicRouteGeniusModeController *)self wantsNavigationDisplay])
  {
    v73 = [(CarBasicRouteGeniusModeController *)self currentRoute];

    if (v73)
    {
      [(CarBasicRouteGeniusModeController *)self recenterCameraOnRouteAnimated:1];
    }
    else
    {
      v74 = [(CarBasicRouteGeniusModeController *)self routeGeniusMapSettings];
      [v74 applyToMapViewAnimated:1 duration:0 completion:0.0];
    }
  }
  v75 = sub_100577E34();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    v76 = self;
    if (!v76)
    {
      v81 = @"<nil>";
      goto LABEL_77;
    }
    v77 = (objc_class *)objc_opt_class();
    v78 = NSStringFromClass(v77);
    if (objc_opt_respondsToSelector())
    {
      v79 = [(CarBasicRouteGeniusModeController *)v76 performSelector:"accessibilityIdentifier"];
      v80 = v79;
      if (v79 && ![v79 isEqualToString:v78])
      {
        v81 = +[NSString stringWithFormat:@"%@<%p, %@>", v78, v76, v80];

        goto LABEL_75;
      }
    }
    v81 = +[NSString stringWithFormat:@"%@<%p>", v78, v76];
LABEL_75:

LABEL_77:
    v82 = [v12 name];
    v83 = [v12 uniqueRouteID];
    v84 = [v83 UUIDString];
    unsigned int v85 = [v12 pointCount];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v81;
    v86 = @"NO";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v82;
    if (v88) {
      v86 = @"YES";
    }
    __int16 v106 = 2112;
    v107 = v84;
    __int16 v108 = 2048;
    uint64_t v109 = v85;
    __int16 v110 = 2112;
    v111 = v86;
    v87 = v86;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "[%{public}@] updating route annotations for route: %@, id: %@, points: %lu, isNavigable: %@", buf, 0x34u);
  }
}

- (id)personalizedItemSources
{
  v2 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  id v3 = [v2 searchPinsManager];
  unsigned __int8 v4 = [v3 routeStartEndItemSource];

  if (v4)
  {
    unsigned int v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  int IsDriveCameraEnabled = CarDisplayIsDriveCameraEnabled();
  if (IsDriveCameraEnabled)
  {
    unsigned __int8 v4 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
    id v5 = [v4 defaultMapSettings];
    unsigned __int8 v6 = [v5 pitched];

    LOBYTE(IsDriveCameraEnabled) = v6;
  }
  return IsDriveCameraEnabled;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return 1;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4 = a3;
  [v4 setCameraStyle:4];
  [v4 setCameraPaused:0];
  id v5 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  [v4 setRouteGeniusEntry:v5];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];

  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100BBA514;
    v15[3] = &unk_1012E5D08;
    v15[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100BBA79C;
    v12[3] = &unk_1012E5D58;
    id v13 = v6;
    v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BBA87C;
    v10[3] = &unk_1012E6160;
    v10[4] = self;
    id v11 = v13;
    [v7 addPreparation:v15 animations:v12 completion:v10];
  }
  else
  {
    BOOL v9 = +[CarChromeModeCoordinator sharedInstance];
    [v9 endRouteGenius];
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BBAD94;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 addPreparation:v6];
}

- (void)_clearAnnotations
{
  id v3 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  id v4 = [v3 routeGeniusAnnotationsManager];
  [v4 clearAnnotations];

  currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
  self->_currentlyDisplayedRoute = 0;

  id v7 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  id v6 = [v7 searchPinsManager];
  [v6 clearDirectionsPins];
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (id)routeAnnotationsProvider
{
  v2 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  id v3 = [v2 routeGeniusAnnotationsManager];

  return v3;
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  unsigned int v10 = [v9 isCurrentContext:self];

  if (v10)
  {
    id v11 = sub_100577E34();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      [(CarBasicRouteGeniusModeController *)self frameRouteAnimated:1];
      goto LABEL_18;
    }
    v12 = self;
    if (!v12)
    {
      uint64_t v17 = @"<nil>";
      goto LABEL_11;
    }
    id v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      id v15 = [(CarBasicRouteGeniusModeController *)v12 performSelector:"accessibilityIdentifier"];
      id v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        uint64_t v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    uint64_t v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

LABEL_11:
    double v18 = v17;
    id v19 = v8;
    v20 = v19;
    if (v19)
    {
      if ([v19 count])
      {
        uint64_t v21 = [v20 componentsJoinedByString:@", "];
        unsigned int v22 = +[NSString stringWithFormat:@"<%p> [%@]", v20, v21];
      }
      else
      {
        unsigned int v22 = +[NSString stringWithFormat:@"<%p> (empty)", v20];
      }
    }
    else
    {
      unsigned int v22 = @"<nil>";
    }

    *(_DWORD *)buf = 138543874;
    v24 = v18;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    __int16 v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] poiShapeLoader:didLoadStartPOIShape: %@, endPOIShapes: %@", buf, 0x20u);

    goto LABEL_17;
  }
LABEL_18:
}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4 = +[MapsExternalDevice sharedInstance];
  -[CarBasicRouteGeniusModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v4 isNavigationAidedDrivingEnabled]);
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    [(CarBasicRouteGeniusModeController *)self updateRouteAnnotations];
  }
}

- (void)frameRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
  id v6 = [v5 routeGeniusAnnotationsManager];
  id v7 = [v6 destination];

  id v8 = sub_100577E34();
  BOOL v9 = v8;
  if (v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      BOOL v9 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
      unsigned int v22 = [v9 routeGeniusAnnotationsManager];
      [v22 frameRouteAnimated:v3];

      goto LABEL_23;
    }
    unsigned int v10 = self;
    if (!v10)
    {
      id v15 = @"<nil>";
      goto LABEL_19;
    }
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      id v13 = [(CarBasicRouteGeniusModeController *)v10 performSelector:"accessibilityIdentifier"];
      v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        id v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    id v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543362;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] framing route.", buf, 0xCu);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v16 = self;
    if (!v16)
    {
      uint64_t v21 = @"<nil>";
      goto LABEL_22;
    }
    uint64_t v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      id v19 = [(CarBasicRouteGeniusModeController *)v16 performSelector:"accessibilityIdentifier"];
      v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        uint64_t v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_17;
      }
    }
    uint64_t v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] new routeGeniusAnnotationsManager.destination is nil. won't be framing on route.", buf, 0xCu);
  }
LABEL_23:
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CarBasicRouteGeniusModeController *)self wantsNavigationDisplay])
  {
    id v5 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
    id v6 = [v5 routeGeniusAnnotationsManager];
    id v7 = [v6 destination];

    id v8 = sub_100577E34();
    BOOL v9 = v8;
    if (v7)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        BOOL v9 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
        unsigned int v22 = [v9 routeGeniusAnnotationsManager];
        [v22 recenterCameraOnRouteAnimated:v3];

        goto LABEL_24;
      }
      unsigned int v10 = self;
      if (!v10)
      {
        id v15 = @"<nil>";
        goto LABEL_20;
      }
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      if (objc_opt_respondsToSelector())
      {
        id v13 = [(CarBasicRouteGeniusModeController *)v10 performSelector:"accessibilityIdentifier"];
        v14 = v13;
        if (v13 && ![v13 isEqualToString:v12])
        {
          id v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

          goto LABEL_10;
        }
      }
      id v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_10:

LABEL_20:
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] recentering on route.", buf, 0xCu);

      goto LABEL_21;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_24:

      return;
    }
    id v16 = self;
    if (!v16)
    {
      uint64_t v21 = @"<nil>";
      goto LABEL_23;
    }
    uint64_t v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      id v19 = [(CarBasicRouteGeniusModeController *)v16 performSelector:"accessibilityIdentifier"];
      v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        uint64_t v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_18;
      }
    }
    uint64_t v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_18:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] new routeGeniusAnnotationsManager.destination is nil. won't be recentering on route.", buf, 0xCu);

    goto LABEL_24;
  }
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
}

- (void)setCurrentSuggestion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CarBasicRouteGeniusModeController *)self state];
  id v7 = sub_100577E34();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6 >= 1)
  {
    if (!v8)
    {
LABEL_23:

      goto LABEL_29;
    }
    BOOL v9 = self;
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_19;
    }
    unsigned int v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(CarBasicRouteGeniusModeController *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_19:
    unint64_t v21 = [(CarBasicRouteGeniusModeController *)v9 state];
    if (v21 > 4) {
      CFStringRef v22 = @"Unknown";
    }
    else {
      CFStringRef v22 = off_10131A830[v21];
    }
    unsigned __int8 v23 = [(CarBasicRouteGeniusModeController *)v9 currentSuggestion];
    *(_DWORD *)buf = 138544131;
    v32 = v14;
    __int16 v33 = 2112;
    CFStringRef v34 = v22;
    __int16 v35 = 2113;
    id v36 = v5;
    __int16 v37 = 2113;
    v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] ignoring changed prediction, state=%@ currentCommuteDestination=%{private}@ _currentCommuteDestination=%{private}@", buf, 0x2Au);

    goto LABEL_23;
  }
  if (v8)
  {
    id v15 = self;
    if (!v15)
    {
      v20 = @"<nil>";
      goto LABEL_25;
    }
    id v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      double v18 = [(CarBasicRouteGeniusModeController *)v15 performSelector:"accessibilityIdentifier"];
      id v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_17;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_17:

LABEL_25:
    v24 = [(MapsSuggestionsRouteGeniusEntry *)v15->_currentSuggestion entry];
    __int16 v25 = [v24 title];
    id v26 = [v5 entry];
    __int16 v27 = [v26 title];
    *(_DWORD *)buf = 138543875;
    v32 = v20;
    __int16 v33 = 2113;
    CFStringRef v34 = v25;
    __int16 v35 = 2113;
    id v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] setting currentCommute destination. _currentCommuteDestination: %{private}@, currentCommuteDestination: %{private}@", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
  __int16 v28 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  unsigned int v29 = [v28 isTopContext:self];

  if (v29)
  {
    id v30 = [(CarBasicRouteGeniusModeController *)self carChromeViewController];
    [v30 setNeedsUpdateComponent:@"navigationDisplay" animated:1];
  }
  [(CarBasicRouteGeniusModeController *)self _updateForCurrentRoute];
LABEL_29:
}

- (id)currentRoute
{
  return [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion route];
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)didUpdateRouteGenius:(id)a3
{
  [(CarBasicRouteGeniusModeController *)self setCurrentSuggestion:a3];

  [(CarBasicRouteGeniusModeController *)self _updateForCurrentRoute];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (ChromeMapSettings)routeGeniusMapSettings
{
  return self->_routeGeniusMapSettings;
}

- (void)setRouteGeniusMapSettings:(id)a3
{
}

- (SearchResult)destinationPin
{
  return self->_destinationPin;
}

- (void)setDestinationPin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPin, 0);
  objc_storeStrong((id *)&self->_routeGeniusMapSettings, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_locationUpdateReframingThrottler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_currentlyDisplayedRoute, 0);
}

@end