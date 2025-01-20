@interface AppStateManager
- (AppCoordinator)appCoordinator;
- (AppStateManager)initWithPlatformController:(id)a3;
- (BOOL)_shouldSkipStateRestorationForDirectionPlan:(id)a3 source:(int64_t)a4;
- (BOOL)tryMovingStepModeToStepAtIndex:(unint64_t)a3 forRouteWithHandle:(id)a4;
- (PlatformController)platformController;
- (id)directionsPlanWithFidelity:(unint64_t)a3;
- (id)iosChrome;
- (id)mapsActivityWithFidelity:(unint64_t)a3;
- (void)openCommuteEntry:(id)a3;
- (void)openMapsSuggestion:(id)a3;
- (void)openSearchWithQuery:(id)a3;
- (void)openTransitIncidents:(id)a3;
- (void)resetNonActivityStateForMapView:(id)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setDirectionsPlan:(id)a3 source:(int64_t)a4;
- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5;
- (void)setPPTTestDirectionsPlan:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation AppStateManager

- (AppStateManager)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppStateManager;
  v6 = [(AppStateManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    v7->_defaultZoomLevel = GEOConfigGetUInteger();
  }

  return v7;
}

- (id)mapsActivityWithFidelity:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFF) != 0)
  {
    unint64_t v3 = a3;
    id v5 = objc_alloc_init(MapsActivity);
    v6 = [(AppStateManager *)self iosChrome];
    v7 = [v6 mapView];

    if ((v3 & 2) != 0)
    {
      id v8 = objc_alloc_init((Class)GEOURLOptions);
      objc_super v9 = [v7 camera];
      [v9 centerCoordinate];
      if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
      {
        v12 = [v9 geoCamera];
        [v8 setCamera:v12];
      }
      v13 = [(AppStateManager *)self iosChrome];
      unint64_t v14 = (unint64_t)[v13 displayedViewMode] - 1;
      if (v14 > 6) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = dword_100F73E00[v14];
      }
      [v8 setMapType:v15];

      id v16 = [v7 userTrackingMode];
      if (v16 == (id)1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = 2 * (v16 == (id)2);
      }
      [v8 setUserTrackingMode:v17];
      [(MapsActivity *)v5 setDisplayOptions:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v19 = [WeakRetained baseActionCoordinator];
      v20 = [v19 currentTransitLineItem];

      if (v20)
      {
        -[MapsActivity setSelectedTransitFeatureID:](v5, "setSelectedTransitFeatureID:", [v20 muid]);
        v21 = [v20 name];
        [(MapsActivity *)v5 setSelectedTransitLineName:v21];

        id v22 = [objc_alloc((Class)MSPTransitStorageLineItem) initWithLineItem:v20];
        [(MapsActivity *)v5 setLineItem:v22];
      }
    }
    if (v3)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v24 = [v23 baseActionCoordinator];
      v25 = [v24 currentSearchSession];

      id v26 = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v27 = [v26 baseActionCoordinator];
      v28 = [v27 currentMapItem];

      v29 = [v25 currentResultsSearchInfo];
      LODWORD(v27) = [v29 isSearchAlongRoute];

      if (v27)
      {

        v25 = 0;
      }
      v89 = v7;
      v90 = self;
      id v30 = objc_alloc((Class)GEOSearchCategoryStorage);
      v31 = [v25 searchFieldItem];
      v32 = [v31 searchCategory];
      id v33 = [v30 initWithSearchCategory:v32];
      [(MapsActivity *)v5 setSearchCategoryStorage:v33];

      v34 = [v25 searchFieldItem];
      v35 = [v34 searchString];
      [(MapsActivity *)v5 setSearchString:v35];

      v88 = v25;
      v36 = [v25 searchInfo];
      v37 = [v36 results];

      id v92 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v37 count]];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id obj = v37;
      id v38 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
      if (v38)
      {
        id v39 = v38;
        v40 = 0;
        uint64_t v41 = 0;
        uint64_t v42 = *(void *)v106;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v106 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = [*(id *)(*((void *)&v105 + 1) + 8 * i) mapItem];
            v45 = v44;
            if (!v40)
            {
              v40 = [v44 name];
            }
            if (v45 == v28
              || [v45 _muid] && (id v46 = objc_msgSend(v45, "_muid"), v46 == objc_msgSend(v28, "_muid")))
            {
              [(MapsActivity *)v5 setSelectedPlaceIndex:(char *)i + v41];
            }
            v47 = [v45 _geoMapItem];

            if (v47) {
              [v92 addObject:v45];
            }
          }
          id v39 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
          v41 += (uint64_t)i;
        }
        while (v39);
      }
      else
      {
        v40 = 0;
      }

      id v48 = objc_alloc_init((Class)NSMutableArray);
      if ((v3 & 0x10) != 0)
      {
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v57 = v92;
        id v63 = [v57 countByEnumeratingWithState:&v93 objects:v109 count:16];
        if (v63)
        {
          id v64 = v63;
          uint64_t v65 = *(void *)v94;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(void *)v94 != v65) {
                objc_enumerationMutation(v57);
              }
              v67 = [*(id *)(*((void *)&v93 + 1) + 8 * (void)j) _geoMapItemStorageForPersistence];
              if (v67) {
                [v48 addObject:v67];
              }
            }
            id v64 = [v57 countByEnumeratingWithState:&v93 objects:v109 count:16];
          }
          while (v64);
        }
      }
      else
      {
        unint64_t v86 = v3;
        v87 = v5;
        id v49 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v92, "count"));
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v50 = v92;
        id v51 = [v50 countByEnumeratingWithState:&v101 objects:v111 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v102;
          do
          {
            for (k = 0; k != v52; k = (char *)k + 1)
            {
              if (*(void *)v102 != v53) {
                objc_enumerationMutation(v50);
              }
              v55 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)k) _geoMapItem];
              v56 = [v55 _mapItemByStrippingOptionalData];

              if (v56) {
                [v49 addObject:v56];
              }
            }
            id v52 = [v50 countByEnumeratingWithState:&v101 objects:v111 count:16];
          }
          while (v52);
        }

        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v57 = v49;
        id v58 = [v57 countByEnumeratingWithState:&v97 objects:v110 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v98;
          do
          {
            for (m = 0; m != v59; m = (char *)m + 1)
            {
              if (*(void *)v98 != v60) {
                objc_enumerationMutation(v57);
              }
              v62 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:*(void *)(*((void *)&v97 + 1) + 8 * (void)m)];
              if (v62) {
                [v48 addObject:v62];
              }
            }
            id v59 = [v57 countByEnumeratingWithState:&v97 objects:v110 count:16];
          }
          while (v59);
        }

        unint64_t v3 = v86;
        id v5 = v87;
      }

      [(MapsActivity *)v5 setSearchPlaces:v48];
      v68 = [(MapsActivity *)v5 searchString];

      if (!v68) {
        [(MapsActivity *)v5 setSearchString:v40];
      }
      if (v28) {
        [(MapsActivity *)v5 setIsPresentingSelectedPlace:1];
      }
      v69 = +[MapsPinsController sharedController];
      v70 = [v69 droppedPin];

      if (v70)
      {
        [(MapsActivity *)v5 setDroppedPin:v70];
        [(MapsActivity *)v5 setIsDroppedPinPresented:0];
        [(MapsActivity *)v5 setIsDroppedPinSelected:0];
        if (v28)
        {
          [v28 _coordinate];
          double v72 = v71;
          double v74 = v73;
          v75 = [v70 latLng];
          [v75 lat];
          double v77 = v76;
          v78 = [v70 latLng];
          [v78 lng];
          if (vabdd_f64(v72, v77) >= 0.00000000999999994)
          {
          }
          else
          {
            double v80 = vabdd_f64(v74, v79);

            if (v80 < 0.00000000999999994)
            {
              [(MapsActivity *)v5 setIsDroppedPinSelected:1];
              if ([(MapsActivity *)v5 isPresentingSelectedPlace]) {
                [(MapsActivity *)v5 setIsDroppedPinPresented:1];
              }
            }
          }
        }
      }
      if ([(MapsActivity *)v5 isPresentingSelectedPlace]
        && ![(MapsActivity *)v5 isDroppedPinPresented]
        && ![(MapsActivity *)v5 hasSelectedPlaceIndex])
      {
        if ((v3 & 0x10) != 0)
        {
          v82 = [v28 _geoMapItemStorageForPersistence];
          [(MapsActivity *)v5 setPresentedMapItem:v82];
        }
        else
        {
          v81 = [v28 _geoMapItem];
          v82 = [v81 _mapItemByStrippingOptionalData];

          v83 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v82];
          [(MapsActivity *)v5 setPresentedMapItem:v83];
        }
      }

      v7 = v89;
      self = v90;
    }
    if ((v3 & 0xC) != 0)
    {
      v84 = [(AppStateManager *)self directionsPlanWithFidelity:v3];
      [(MapsActivity *)v5 setDirectionsPlan:v84];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)iosChrome
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  unint64_t v3 = [WeakRetained chromeViewController];

  return v3;
}

- (id)directionsPlanWithFidelity:(unint64_t)a3
{
  v4 = [(AppStateManager *)self platformController];
  id v5 = [v4 sessionStack];

  if ([v5 count])
  {
    v6 = sub_10050D1A0(v5, a3);
    v7 = [v6 buildDirectionsPlan];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setAppCoordinator:(id)a3
{
}

- (void)openSearchWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "opening search with query: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v6 setSearchString:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  id v8 = [WeakRetained baseActionCoordinator];
  [v8 viewController:0 doSearchItem:v6 withUserInfo:0];
}

- (void)openMapsSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "opening suggestion: %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v7 = [WeakRetained baseActionCoordinator];
  [v7 viewController:0 openMapsSuggestionEntry:v4 withUserInfo:0];
}

- (void)openTransitIncidents:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "opening transit incident: %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v7 = [WeakRetained baseActionCoordinator];
  [v7 viewController:0 openTransitIncidents:v4 fromView:0 withUserInfo:0];
}

- (void)openCommuteEntry:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "opening commute entry: %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v7 = [WeakRetained baseActionCoordinator];
  [v7 viewController:0 openCommuteEntry:v4];
}

- (void)resetNonActivityStateForMapView:(id)a3
{
}

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v6 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    unint64_t v111 = a4;
    v114 = v6;
    v7 = +[NSUUID UUID];
    int v8 = [v7 UUIDString];

    id v9 = sub_1000A930C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setting Maps activity (tag %@)", buf, 0xCu);
    }

    id v10 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CC0D60;
    block[3] = &unk_1012EA9E0;
    id v112 = v8;
    id v136 = v112;
    int64_t v138 = a5;
    id v118 = v114;
    id v137 = v118;
    dispatch_async(v10, block);

    if (!v118) {
      goto LABEL_97;
    }
    GEOFindOrCreateLog();
    double v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v118;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setting Maps activity from source: %ld : state: %@", buf, 0x16u);
    }

    v12 = [(AppStateManager *)self iosChrome];
    v113 = [v12 mapView];

    [(AppStateManager *)self resetNonActivityStateForMapView:v113];
    v13 = [v118 displayOptions];
    v116 = v13;
    if (v13)
    {
      if ([v13 hasCamera])
      {
        unint64_t v14 = [v116 camera];
        uint64_t v15 = [v14 mapCamera];

        [v15 centerCoordinate];
        int v18 = 0;
        int v19 = 1;
        if (v17 >= -180.0 && v17 <= 180.0 && v16 >= -90.0 && v16 <= 90.0)
        {
          [v113 setCamera:v15];
          int v19 = 0;
          int v18 = 1;
        }
      }
      else
      {
        int v18 = 0;
        int v19 = 1;
      }
      if ([v116 hasMapType]
        && !+[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay])
      {
        unsigned int v20 = [v116 mapType] - 1;
        if (v20 > 3) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = qword_100F73E20[v20];
        }
        id v22 = [(AppStateManager *)self iosChrome];
        id v23 = [v22 settingsController];
        id v24 = [v23 bestMapViewModeForViewMode:v21 ignoringLabelPreference:[v116 ignoreLabelPreference]];

        v25 = [(AppStateManager *)self iosChrome];
        [v25 updateViewMode:v24 animated:0];
      }
      if ([v116 hasEnableTraffic])
      {
        id v26 = [v116 enableTraffic];
        v27 = [(AppStateManager *)self iosChrome];
        v28 = [v27 settingsController];
        [v28 setUserDesiresTraffic:v26];
      }
      if ([v116 hasUserTrackingMode])
      {
        unsigned int v29 = [v116 userTrackingMode];
        if (v29 == 1) {
          uint64_t v30 = 1;
        }
        else {
          uint64_t v30 = 2 * (v29 == 2);
        }
        [v113 setUserTrackingMode:v30];
        int v19 = 0;
      }
      if ([v116 hasCenterSpan])
      {
        v31 = [v116 centerSpan];
        [v31 latitude];
        CLLocationDegrees v33 = v32;
        [v31 longitude];
        CLLocationCoordinate2D v35 = CLLocationCoordinate2DMake(v33, v34);
        [v31 latitudeDelta];
        double v37 = v36;
        [v31 longitudeDelta];
        [v113 setRegion:0, v35.latitude, v35.longitude, v37, v38];

        int v19 = 0;
      }
      BOOL v110 = v18 != 0;
      if ([v116 hasUserTrackingMode]
        && [v116 hasUserTrackingMode]
        && [v116 hasPitchedWhileTracking]
        && [v116 pitchedWhileTracking])
      {
        [v113 _enter3DMode];
        if (!v19)
        {
LABEL_40:
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v142 = sub_1001044F0;
          v143 = sub_100104AE8;
          id v144 = 0;
          if ([v118 hasSearchString])
          {
            id v39 = objc_alloc_init(SearchFieldItem);
            v40 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v39;

            uint64_t v41 = [v118 searchString];
            [*(id *)(*(void *)&buf[8] + 40) setSearchString:v41];
          }
          if ([v118 hasSearchCategoryStorage])
          {
            id v42 = objc_alloc((Class)GEOSearchCategory);
            v43 = [v118 searchCategoryStorage];
            id v44 = [v42 initWithStorage:v43];

            if (v44)
            {
              v45 = *(void **)(*(void *)&buf[8] + 40);
              if (!v45)
              {
                id v46 = objc_alloc_init(SearchFieldItem);
                v47 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v46;

                v45 = *(void **)(*(void *)&buf[8] + 40);
              }
              [v45 setSearchCategory:v44];
            }
          }
          id v48 = objc_alloc((Class)NSMutableArray);
          id v49 = [v118 searchPlaces];
          id v120 = [v48 initWithCapacity:[v49 count]];

          id v50 = [v118 searchPlaces];

          if (v50)
          {
            id v51 = [v118 searchPlaces];
            v119 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v51 count]);

            long long v133 = 0u;
            long long v134 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            id v52 = [v118 searchPlaces];
            id v53 = [v52 countByEnumeratingWithState:&v131 objects:v140 count:16];
            if (v53)
            {
              uint64_t v54 = *(void *)v132;
              double v55 = MKCoordinateInvalid[0];
              double v56 = MKCoordinateInvalid[1];
              do
              {
                for (i = 0; i != v53; i = (char *)i + 1)
                {
                  if (*(void *)v132 != v54) {
                    objc_enumerationMutation(v52);
                  }
                  id v58 = [*(id *)(*((void *)&v131 + 1) + 8 * i) data];
                  id v59 = +[GEOMapItemStorage mapItemStorageForSerializedMapItemStorage:v58];

                  if ([v59 _hasMUID])
                  {
                    if (![v59 _muid]) {
                      goto LABEL_62;
                    }
                    id v60 = [objc_alloc((Class)MKMapItemIdentifier) initWithMUID:[v59 _muid] resultProviderID:0 coordinate:v55 v56];
                    if (v60) {
                      [v119 addObject:v60];
                    }
                  }
                  else
                  {
                    id v60 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v59 isPlaceHolderPlace:0];
                    v61 = [[SearchResult alloc] initWithMapItem:v60];
                    if (v61) {
                      [v120 addObject:v61];
                    }
                  }
LABEL_62:
                }
                id v53 = [v52 countByEnumeratingWithState:&v131 objects:v140 count:16];
              }
              while (v53);
            }

            v127[0] = _NSConcreteStackBlock;
            v127[1] = 3221225472;
            v127[2] = sub_100CC0E24;
            v127[3] = &unk_101320D30;
            id v62 = v118;
            v130 = buf;
            id v128 = v62;
            v129 = self;
            id v63 = objc_retainBlock(v127);
            if ([v119 count]
              && (([v62 directionsPlan], (id v64 = objc_claimAutoreleasedReturnValue()) == 0)
               || ([v62 directionsPlan],
                   uint64_t v65 = objc_claimAutoreleasedReturnValue(),
                   unsigned int v66 = [v65 isPlayingTrace],
                   v65,
                   v64,
                   v66)))
            {
              v67 = +[MKMapService sharedService];
              v68 = [v67 ticketForIdentifiers:v119 traits:0];

              v124[0] = _NSConcreteStackBlock;
              v124[1] = 3221225472;
              v124[2] = sub_100CC0F90;
              v124[3] = &unk_1012E6EF8;
              id v125 = v120;
              v126 = v63;
              [v68 submitWithHandler:v124 networkActivity:&stru_101320D50];
            }
            else if ([v120 count])
            {
              ((void (*)(void *, id))v63[2])(v63, v120);
            }
          }
          if ([v118 hasLineItem])
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
            v70 = [WeakRetained baseActionCoordinator];
            double v71 = [v118 lineItem];
            if (a5 == 3) {
              uint64_t v72 = 3;
            }
            else {
              uint64_t v72 = 0;
            }
            [(IncompleteTransitLineItem *)v70 setCurrentTransitLineItem:v71 zoomToMapRegion:!v110 preferredLayout:v72];
          }
          else
          {
            if (![v118 hasSelectedTransitFeatureID])
            {
LABEL_81:
              v78 = [v118 droppedPin];

              if (v78)
              {
                double v79 = [v118 droppedPin];
                if ([v79 hasFloorOrdinal])
                {
                  double v80 = [v118 droppedPin];
                  uint64_t v81 = (uint64_t)[v80 floorOrdinal];
                }
                else
                {
                  uint64_t v81 = 0x7FFFFFFFLL;
                }

                v82 = [v118 droppedPin];
                v83 = [v82 latLng];
                [v83 lat];
                CLLocationDegrees v85 = v84;
                unint64_t v86 = [v118 droppedPin];
                v87 = [v86 latLng];
                [v87 lng];
                CLLocationCoordinate2D v89 = CLLocationCoordinate2DMake(v85, v88);
                v90 = +[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v81, v89.latitude, v89.longitude);

                v91 = +[CustomSearchManager sharedManager];
                [v91 setCustomSearchResult:v90 animated:0 shouldSelectOnMap:0];

                if ([v118 isDroppedPinSelected])
                {
                  id v92 = [(AppStateManager *)self iosChrome];
                  long long v93 = [v92 searchPinsManager];

                  [v93 selectDroppedPinIsAnimated:0];
                }
              }
              long long v94 = [v118 presentedMapItem];

              if (v94)
              {
                objc_initWeak(&location, self);
                long long v95 = [v118 presentedMapItem];
                v121[0] = _NSConcreteStackBlock;
                v121[1] = 3221225472;
                v121[2] = sub_100CC10C0;
                v121[3] = &unk_1013034E0;
                objc_copyWeak(&v122, &location);
                long long v96 = [v95 searchResultForFidelity:v111 refinedHandler:v121];

                if (v96)
                {
                  long long v97 = objc_alloc_init(SearchFieldItem);
                  long long v98 = [v96 title];
                  [(SearchFieldItem *)v97 setSearchString:v98];

                  id v99 = objc_loadWeakRetained((id *)&self->_appCoordinator);
                  long long v100 = [v99 baseActionCoordinator];
                  v139 = v96;
                  long long v101 = +[NSArray arrayWithObjects:&v139 count:1];
                  long long v102 = +[SearchInfo searchInfoWithResults:v101];
                  [v100 restoreSearchForItem:v97 withResults:v102];
                }
                objc_destroyWeak(&v122);
                objc_destroyWeak(&location);
              }
              long long v103 = [v118 directionsPlan];
              unsigned __int8 v104 = [v103 isPlayingTrace];

              if ((v104 & 1) == 0)
              {
                long long v105 = [v118 directionsPlan];
                [(AppStateManager *)self setDirectionsPlan:v105 source:a5];
              }
              long long v106 = [v118 userCreatedCollectionID];

              if (v106)
              {
                id v107 = objc_loadWeakRetained((id *)&self->_appCoordinator);
                long long v108 = [v107 baseActionCoordinator];
                v109 = [v118 userCreatedCollectionID];
                [v108 viewController:0 showCollectionWithID:v109];
              }
              _Block_object_dispose(buf, 8);

LABEL_97:
              id v6 = v114;
              goto LABEL_98;
            }
            id v73 = objc_alloc((Class)MKMapItemIdentifier);
            id v74 = [v118 selectedTransitFeatureID];
            id WeakRetained = [v73 initWithMUID:v74 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
            if (!WeakRetained)
            {
LABEL_80:

              goto LABEL_81;
            }
            v75 = [IncompleteTransitLineItem alloc];
            double v76 = [v118 selectedTransitLineName];
            v70 = [(IncompleteTransitLineItem *)v75 initWithIdentifier:WeakRetained name:v76];

            double v71 = objc_loadWeakRetained((id *)&self->_appCoordinator);
            double v77 = [v71 baseActionCoordinator];
            [v77 setCurrentTransitLineItem:v70 zoomToMapRegion:!v110];
          }
          goto LABEL_80;
        }
      }
      else if (!v19)
      {
        goto LABEL_40;
      }
    }
    else
    {
      BOOL v110 = 0;
    }
    [v113 setUserTrackingMode:1];
    goto LABEL_40;
  }
LABEL_98:
}

- (BOOL)_shouldSkipStateRestorationForDirectionPlan:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 routeRequestStorage];
  unsigned int v8 = [v7 transportType];

  BOOL v9 = 0;
  if (a4 == 6 && v8 - 7 <= 0xFFFFFFFC)
  {
    id v10 = +[MKLocationManager sharedLocationManager];
    double v11 = [v10 currentLocation];
    v12 = [v11 latLng];
    [v12 coordinate];
    double v14 = v13;
    double v16 = v15;

    double v17 = [v6 routeRequestStorage];
    int v18 = [v17 waypoints];
    int v19 = [v18 lastObject];
    unsigned int v20 = [v19 latLng];
    [v20 coordinate];
    double v22 = v21;
    double v24 = v23;

    GEOCalculateDistance();
    double v26 = v25;
    GEOConfigGetDouble();
    if (fabs(v14) >= 0.00000000999999994 || fabs(v16) >= 0.00000000999999994)
    {
      BOOL v29 = fabs(v22) >= 0.00000000999999994;
      if (fabs(v24) >= 0.00000000999999994) {
        BOOL v29 = 1;
      }
      BOOL v28 = v26 < v27 && v29;
    }
    else
    {
      BOOL v28 = 0;
    }
    uint64_t v30 = sub_100CC154C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = @"NO";
      if (v28) {
        v31 = @"YES";
      }
      double v32 = v31;
      int v40 = 138412546;
      uint64_t v41 = v32;
      __int16 v42 = 2048;
      double v43 = v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Ignoring direction plan %@ for location change %f", (uint8_t *)&v40, 0x16u);
    }
    if (v28) {
      goto LABEL_24;
    }
    CLLocationDegrees v33 = [(PlatformController *)self->_platformController currentSession];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CLLocationCoordinate2D v35 = sub_100CC154C();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
LABEL_23:

LABEL_24:
        BOOL v9 = 1;
        goto LABEL_25;
      }
      LOWORD(v40) = 0;
      double v36 = "Ignoring direction plan state restoration because the user is in route planning";
    }
    else
    {
      double v37 = [(PlatformController *)self->_platformController currentSession];
      objc_opt_class();
      char v38 = objc_opt_isKindOfClass();

      if ((v38 & 1) == 0)
      {
        BOOL v9 = 0;
        goto LABEL_25;
      }
      CLLocationCoordinate2D v35 = sub_100CC154C();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      LOWORD(v40) = 0;
      double v36 = "Ignoring direction plan state restoration because the user is in navigation";
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v36, (uint8_t *)&v40, 2u);
    goto LABEL_23;
  }
LABEL_25:

  return v9;
}

- (void)setDirectionsPlan:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSUUID UUID];
  unsigned int v8 = [v7 UUIDString];

  BOOL v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v137 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setting directions plan (tag %@)", buf, 0xCu);
  }

  id v10 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100CC2688;
  block[3] = &unk_1012EA9E0;
  id v11 = v8;
  id v133 = v11;
  int64_t v135 = a4;
  v12 = (DrivePreferences *)v6;
  long long v134 = v12;
  dispatch_async(v10, block);

  if (v12
    && ![(AppStateManager *)self _shouldSkipStateRestorationForDirectionPlan:v12 source:a4])
  {
    double v13 = sub_100CC154C();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetDirectionsPlan", "", buf, 2u);
    }

    double v14 = [(AppStateManager *)self iosChrome];
    double v15 = [v14 mapView];

    v116 = v15;
    id v112 = [v15 userTrackingMode];
    id v120 = [(DrivePreferences *)v12 routeRequestStorage];
    v119 = [v120 waypoints];
    id v16 = [v119 count];
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v121 = objc_alloc_init((Class)NSMutableDictionary);
    int64_t v114 = a4;
    unsigned int v18 = ((unint64_t)a4 > 5) | (0xAu >> a4);
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_100CC27E4;
    v130[3] = &unk_101320D70;
    char v131 = ((unint64_t)a4 > 5) | (0xAu >> a4) & 1;
    int v19 = objc_retainBlock(v130);
    id v118 = [(DrivePreferences *)v12 originString];
    v117 = [(DrivePreferences *)v12 destinationString];
    unsigned int v20 = [(DrivePreferences *)v12 planningWaypoints];
    id v21 = [v20 count];

    if (v21)
    {
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v22 = [(DrivePreferences *)v12 planningWaypoints];
      id v23 = [v22 countByEnumeratingWithState:&v126 objects:v141 count:16];
      if (!v23)
      {
LABEL_30:
        CLLocationCoordinate2D v35 = v120;
LABEL_31:

        goto LABEL_32;
      }
      id v24 = v23;
      id v110 = v11;
      unint64_t v111 = self;
      uint64_t v25 = *(void *)v127;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v127 != v25) {
            objc_enumerationMutation(v22);
          }
          double v27 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          if ([v27 hasWaypoint])
          {
            BOOL v28 = [v27 waypoint];
            ((void (*)(void *, void *))v19[2])(v19, v28);
          }
          else
          {
            BOOL v28 = [v27 searchString];
            sub_100CC274C(v28);
          BOOL v29 = };
          [v17 addObject:v29];
        }
        id v24 = [v22 countByEnumeratingWithState:&v126 objects:v141 count:16];
      }
      while (v24);
      id v11 = v110;
LABEL_29:
      self = v111;
      goto LABEL_30;
    }
    if ((unint64_t)v16 >= 2)
    {
      if (v18) {
        [v121 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DirectionsAttemptCachedRouteKey"];
      }
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v22 = v119;
      id v30 = [v22 countByEnumeratingWithState:&v122 objects:v140 count:16];
      if (!v30) {
        goto LABEL_30;
      }
      id v31 = v30;
      unint64_t v111 = self;
      uint64_t v32 = *(void *)v123;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v123 != v32) {
            objc_enumerationMutation(v22);
          }
          CLLocationDegrees v34 = ((void (*)(void *, void))v19[2])(v19, *(void *)(*((void *)&v122 + 1) + 8 * (void)j));
          [v17 addObject:v34];
        }
        id v31 = [v22 countByEnumeratingWithState:&v122 objects:v140 count:16];
      }
      while (v31);
      goto LABEL_29;
    }
    if (v16 == (id)1)
    {
      CLLocationCoordinate2D v35 = v120;
      if (v118)
      {
        id v39 = sub_100CC274C(v118);
        [v17 addObject:v39];

LABEL_42:
        id v22 = [v119 firstObject];
        int v40 = ((void (*)(void *, id))v19[2])(v19, v22);
        [v17 addObject:v40];

        goto LABEL_31;
      }
      if (!v117)
      {
        long long v103 = +[SearchResult currentLocationSearchResult];
        unsigned __int8 v104 = +[SearchFieldItem searchFieldItemWithObject:v103];
        [v17 addObject:v104];

        goto LABEL_42;
      }
      CLLocationDegrees v85 = [v119 firstObject];
      unint64_t v86 = ((void (*)(void *, void *))v19[2])(v19, v85);
      [v17 addObject:v86];

      double v84 = v117;
    }
    else
    {
      CLLocationCoordinate2D v35 = v120;
      if (!v118 || !v117)
      {
LABEL_32:
        if ((unint64_t)[v17 count] <= 1)
        {
          double v36 = sub_1000A930C();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Applying MapsActivity: Not enough waypoints in directions plan", buf, 2u);
          }
LABEL_122:

          goto LABEL_123;
        }
        if ([v35 hasTransportType])
        {
          unsigned int v37 = [v35 transportType] - 1;
          if (v37 > 5) {
            uint64_t v38 = 1;
          }
          else {
            uint64_t v38 = qword_100F73E40[v37];
          }
        }
        else
        {
          uint64_t v38 = 0;
        }
        uint64_t v41 = [DirectionItem alloc];
        id v42 = [v17 copy];
        double v36 = [(DirectionItem *)v41 initWithItems:v42 transportType:v38];

        double v43 = [v35 destinationRouteData];
        [v36 setPersistentData:v43];

        if (![(DrivePreferences *)v12 hasDisplayMethod]) {
          goto LABEL_119;
        }
        if ([(DrivePreferences *)v12 hasCurrentRouteIndex])
        {
          id v44 = +[NSNumber numberWithUnsignedLongLong:[(DrivePreferences *)v12 currentRouteIndex]];
          [v121 setObject:v44 forKeyedSubscript:@"DirectionsRouteIndexKey"];
        }
        if ([(DrivePreferences *)v12 hasCurrentRouteStep])
        {
          v45 = +[NSNumber numberWithUnsignedLongLong:[(DrivePreferences *)v12 currentRouteStep]];
          [v121 setObject:v45 forKeyedSubscript:@"DirectionsStepIndex"];
        }
        if ([v35 hasRouteHandle])
        {
          id v46 = [v35 routeHandle];
          [v121 setObject:v46 forKeyedSubscript:@"DirectionsRouteHandle"];
        }
        if ([(DrivePreferences *)v12 hasDepartureTime])
        {
          [(DrivePreferences *)v12 departureTime];
          v47 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          [v121 setObject:v47 forKeyedSubscript:@"DirectionsDepartureDateKey"];
        }
        if ([(DrivePreferences *)v12 hasArrivalTime])
        {
          [(DrivePreferences *)v12 arrivalTime];
          id v48 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          [v121 setObject:v48 forKeyedSubscript:@"DirectionsArrivalDateKey"];
        }
        CLLocationCoordinate2D v35 = v120;
        if ([v120 hasAutomobileOptions])
        {
          id v49 = [DrivePreferences alloc];
          id v50 = [v120 automobileOptions];
          id v51 = +[NSUserDefaults standardUserDefaults];
          id v52 = [(DrivePreferences *)v49 initWithAutomobileOptions:v50 defaults:v51];
          [v36 setDrivePreferences:v52];
        }
        else
        {
          if (([(DrivePreferences *)v12 hasAvoidTolls] & 1) == 0
            && ![(DrivePreferences *)v12 hasAvoidHighways])
          {
LABEL_67:
            if ([v120 hasTransitOptions])
            {
              id v57 = [TransitPreferences alloc];
              id v58 = [v120 transitOptions];
              id v59 = +[NSUserDefaults standardUserDefaults];
              id v60 = [(TransitPreferences *)v57 initWithTransitOptions:v58 defaults:v59];
              [v36 setTransitPreferences:v60];
            }
            else
            {
              if ([(DrivePreferences *)v12 hasTransitPreferences])
              {
                v61 = [(DrivePreferences *)v12 transitPreferences];
                id v62 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v61 avoidedTransitModes]);
                [v121 setObject:v62 forKeyedSubscript:@"DirectionsAvoidedTransitModesKey"];
              }
              if ([(DrivePreferences *)v12 hasTransitPrioritization])
              {
                id v63 = +[NSNumber numberWithInt:[(DrivePreferences *)v12 transitPrioritization]];
                [v121 setObject:v63 forKeyedSubscript:@"DirectionsSortOptionKey"];
              }
              if (![(DrivePreferences *)v12 hasTransitSurchargeOption])
              {
LABEL_76:
                if ([v120 hasWalkingOptions])
                {
                  id v64 = [WalkPreferences alloc];
                  uint64_t v65 = [v120 walkingOptions];
                  unsigned int v66 = +[NSUserDefaults standardUserDefaults];
                  v67 = [(WalkPreferences *)v64 initWithWalkingOptions:v65 defaults:v66];
                  [v36 setWalkPreferences:v67];
                }
                if ([v120 hasCyclingOptions])
                {
                  v68 = [CyclePreferences alloc];
                  v69 = [v120 cyclingOptions];
                  v70 = +[NSUserDefaults standardUserDefaults];
                  double v71 = [(CyclePreferences *)v68 initWithCyclingOptions:v69 defaults:v70];
                  [v36 setCyclePreferences:v71];
                }
                if ([(DrivePreferences *)v12 hasShouldRestoreLowGuidance])
                {
                  uint64_t v72 = +[NSNumber numberWithBool:[(DrivePreferences *)v12 shouldRestoreLowGuidance]];
                  [v121 setObject:v72 forKeyedSubscript:@"DirectionsShouldRestoreLowGuidanceKey"];
                }
                id v73 = +[NSNumber numberWithInteger:v112];
                [v121 setObject:v73 forKeyedSubscript:@"DirectionsTrackingModeKey"];

                id v74 = +[NSNumber numberWithInteger:v114];
                [v121 setObject:v74 forKeyedSubscript:@"DirectionsSourceKey"];

                if ([(DrivePreferences *)v12 hasCompanionRouteContextData])
                {
                  v75 = [(DrivePreferences *)v12 companionRouteContextData];
                  id v76 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v75];
                  [v121 setObject:v76 forKeyedSubscript:@"DirectionsCompanionRouteContextKey"];
                }
                unsigned int v77 = [(DrivePreferences *)v12 displayMethod];
                if (v77 < 2)
                {
                  v78 = sub_1000A930C();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "Performing direction plan for route planning...", buf, 2u);
                  }
                  goto LABEL_117;
                }
                if (v77 == 2)
                {
                  double v79 = sub_1000A930C();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Performing direction plan for active navigation...", buf, 2u);
                  }

                  double v80 = [v36 items];
                  uint64_t v81 = [v80 firstObject];
                  v82 = [v81 searchResult];
                  if ([v82 isDynamicCurrentLocation])
                  {
                  }
                  else
                  {
                    [v36 persistentData];
                    v87 = v113 = v80;

                    if (!v87)
                    {
LABEL_105:
                      if (!GEOConfigGetBOOL())
                      {
LABEL_118:
                        id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
                        long long v108 = [WeakRetained baseActionCoordinator];
                        [v108 setCurrentDirectionItem:v36 withOptions:v121];

                        goto LABEL_119;
                      }
                      id v97 = v11;
                      long long v98 = sub_1000A930C();
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                      {
                        id v115 = [(DrivePreferences *)v12 handlesForSharingETAsCount];
                        id v99 = [(DrivePreferences *)v12 handlesForSharingETAs];
                        long long v100 = v99;
                        if (v99)
                        {
                          if ([v99 count])
                          {
                            long long v101 = [v100 componentsJoinedByString:@", "];
                            long long v102 = +[NSString stringWithFormat:@"<%p> [%@]", v100, v101];
                          }
                          else
                          {
                            long long v102 = +[NSString stringWithFormat:@"<%p> (empty)", v100];
                          }
                        }
                        else
                        {
                          long long v102 = @"<nil>";
                        }

                        long long v105 = v102;
                        *(_DWORD *)buf = 134218242;
                        id v137 = v115;
                        __int16 v138 = 2112;
                        v139 = v105;
                        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "Found %lu handles in directions plan for trip sharing: %@", buf, 0x16u);
                      }
                      long long v106 = [(DrivePreferences *)v12 handlesForSharingETAs];
                      v78 = +[MSPSharedTripContact contactsFromHandles:v106];

                      if ([v78 count]) {
                        [v121 setObject:v78 forKeyedSubscript:@"DirectionsPreviousContactsForTripSharing"];
                      }
                      id v11 = v97;
                      CLLocationCoordinate2D v35 = v120;
LABEL_117:

                      goto LABEL_118;
                    }
                  }
                  if (v114 == 5)
                  {
                    id v88 = +[NSNumber numberWithDouble:5.0];
                    CLLocationCoordinate2D v89 = +[NSUserDefaults standardUserDefaults];
                    [v89 objectForKey:@"NavigationAutoLaunchDelayKey"];
                    v91 = id v90 = v11;

                    if (v91) {
                      id v92 = v91;
                    }
                    else {
                      id v92 = v88;
                    }
                    id v93 = v92;

                    id v11 = v90;
                    CLLocationCoordinate2D v35 = v120;

                    [v93 doubleValue];
                    double v95 = v94;

                    long long v96 = +[NSNumber numberWithDouble:v95];
                    [v121 setObject:v96 forKeyedSubscript:@"DirectionsNavigationAutoLaunchDelayKey"];
                  }
                  else
                  {
                    [v121 setObject:&off_1013AAF78 forKeyedSubscript:@"DirectionsNavigationAutoLaunchDelayKey"];
                  }
                  goto LABEL_105;
                }
LABEL_119:
                v109 = sub_100CC154C();
                if (os_signpost_enabled(v109))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v109, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetDirectionsPlan", "", buf, 2u);
                }

                goto LABEL_122;
              }
              id v58 = +[NSNumber numberWithInt:[(DrivePreferences *)v12 transitSurchargeOption]];
              [v121 setObject:v58 forKeyedSubscript:@"DirectionsTransitSurchargeOptionKey"];
            }

            goto LABEL_76;
          }
          id v53 = [DrivePreferences alloc];
          uint64_t v54 = +[NSUserDefaults standardUserDefaults];
          id v50 = [(DrivePreferences *)v53 initWithDefaults:v54];

          if ([(DrivePreferences *)v12 hasAvoidTolls]) {
            double v55 = v12;
          }
          else {
            double v55 = v50;
          }
          [(DrivePreferences *)v50 setAvoidTolls:[(DrivePreferences *)v55 avoidTolls]];
          if ([(DrivePreferences *)v12 hasAvoidHighways]) {
            double v56 = v12;
          }
          else {
            double v56 = v50;
          }
          [(DrivePreferences *)v50 setAvoidHighways:[(DrivePreferences *)v56 avoidHighways]];
          [v36 setDrivePreferences:v50];
        }

        goto LABEL_67;
      }
      v83 = sub_100CC274C(v118);
      [v17 addObject:v83];

      double v84 = v117;
    }
    sub_100CC274C(v84);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [v17 addObject:v22];
    goto LABEL_31;
  }
LABEL_123:
}

- (BOOL)tryMovingStepModeToStepAtIndex:(unint64_t)a3 forRouteWithHandle:(id)a4
{
  id v6 = a4;
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v30 = 134218242;
    unint64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "try moving stepping mode to stepIndex: %ld – routeHandle: %@", (uint8_t *)&v30, 0x16u);
  }

  p_appCoordinator = &self->_appCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  id v10 = [WeakRetained chromeViewController];
  id v11 = [v10 currentIOSBasedContext];
  id v12 = objc_loadWeakRetained((id *)p_appCoordinator);
  double v13 = [v12 stepModeController];

  if (v11 == v13)
  {
    id v19 = objc_loadWeakRetained((id *)p_appCoordinator);
    double v14 = [v19 stepModeController];

    unsigned int v20 = [v14 route];
    if ([v20 transportType] == 1)
    {
      id v21 = [v20 suggestedRoute];
      id v22 = [v21 routeHandle];
      id v23 = [v6 transitData];
      unsigned __int8 v24 = [v22 isEqualToData:v23];

      if ((v24 & 1) == 0)
      {
LABEL_9:
        uint64_t v25 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "current route ID does not match routeHandle, aborting.", (uint8_t *)&v30, 2u);
        }
        BOOL v18 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      double v26 = [v20 serverRouteID];
      double v27 = [v6 routeID];
      unsigned __int8 v28 = [v26 isEqualToData:v27];

      if ((v28 & 1) == 0) {
        goto LABEL_9;
      }
    }
    uint64_t v25 = [v20 stepAtIndex:a3];
    [v14 updateWithDisplayedStep:v25];
    BOOL v18 = 1;
LABEL_14:

    goto LABEL_15;
  }
  double v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = objc_loadWeakRetained((id *)p_appCoordinator);
    id v16 = [v15 chromeViewController];
    id v17 = [v16 currentIOSBasedContext];
    int v30 = 138412290;
    unint64_t v31 = (unint64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "current mode %@ is not stepModeController, aborting.", (uint8_t *)&v30, 0xCu);
  }
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)setPPTTestDirectionsPlan:(id)a3
{
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);

  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end