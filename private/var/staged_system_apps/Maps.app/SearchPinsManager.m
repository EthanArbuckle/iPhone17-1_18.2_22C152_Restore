@interface SearchPinsManager
- (BOOL)_canDroppedPinBeVisibleInVenue;
- (BOOL)_isShowingDirectionsPins;
- (BOOL)canSelectPin:(id)a3;
- (BOOL)disableEndPins;
- (BOOL)disableStartPin;
- (BOOL)hasAutoSelectedResult;
- (BOOL)useAlternateDirectionsPins;
- (CustomPOIsController)customPOIsController;
- (MKMapView)mapView;
- (MapCameraController)mapCameraController;
- (MapSelectionManager)mapSelectionManager;
- (NSArray)endPOIShapesIfLoaded;
- (NSArray)endPins;
- (POIShape)startPOIShapeIfLoaded;
- (PlaceCardLinkedPlacesItemSource)placeCardLinkedPlacesItemSource;
- (RouteStartEndItemSource)routeStartEndItemSource;
- (SearchDotPlacesItemSource)searchDotPlacesItemSource;
- (SearchPinsManager)initWithMapViewCameraController:(id)a3;
- (SearchPinsManagerDelegate)delegate;
- (SearchResult)droppedPin;
- (SearchResult)endPin;
- (SearchResult)startPin;
- (SearchResultsDebugOverlay)searchResultsDebugOverlay;
- (SearchResultsItemSource)collectionPinsItemSource;
- (SearchResultsItemSource)droppedPinsItemSource;
- (SearchResultsItemSource)searchResultsItemSource;
- (SearchResultsItemSource)singleSearchResultItemSource;
- (UIEdgeInsets)carRecommendedMapPadding;
- (VenuesManager)venuesManager;
- (id)_setOfPinsForPinType:(unint64_t)a3;
- (id)allSearchResults;
- (void)_animateShowingSearchResults:(id)a3 selectedSearchResult:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10;
- (void)_clearEndPins;
- (void)_clearShowSearchResultsAnimation;
- (void)_clearStartPin;
- (void)_completeShowSearchResultsAnimation;
- (void)_notifyDidLoadStartPOIShape:(id)a3 endPOIShapes:(id)a4;
- (void)_setEndPOIShapes:(id)a3;
- (void)_setStartPOIShape:(id)a3;
- (void)_startLoadingNewEndPOIShapes;
- (void)_startLoadingNewStartPOIShape;
- (void)_updateDroppedPinVisibility;
- (void)addPOIShapeLoadingObserver:(id)a3;
- (void)clearCollectionPins;
- (void)clearDirectionsPins;
- (void)clearDroppedPin;
- (void)clearLinkedPlacesAndPolygon;
- (void)clearSearchPins;
- (void)clearSingleResultPins;
- (void)dealloc;
- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5;
- (void)dropPinsForSearchResults:(id)a3 animate:(BOOL)a4;
- (void)dropPinsForSearchResults:(id)a3 searchDotPlaces:(id)a4 selectedSearchResult:(id)a5 animate:(BOOL)a6 itemSource:(id)a7;
- (void)dropPinsForSearchResults:(id)a3 selectedSearchResult:(id)a4 animate:(BOOL)a5;
- (void)mapSelectionManagerDidDeselectSearchResult:(id)a3;
- (void)mapViewDidBecomeFullyDrawn;
- (void)removePOIShapeLoadingObserver:(id)a3;
- (void)selectAndShowSearchResult:(id)a3 animated:(BOOL)a4;
- (void)selectDroppedPinIsAnimated:(BOOL)a3;
- (void)selectLabelMarkerForSearchResult:(id)a3 animated:(BOOL)a4;
- (void)setCollectionsPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6;
- (void)setCustomPOIsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableEndPins:(BOOL)a3;
- (void)setDisableStartPin:(BOOL)a3;
- (void)setDroppedPin:(id)a3 animated:(BOOL)a4 shouldSelect:(BOOL)a5;
- (void)setMapCameraController:(id)a3;
- (void)setMapSelectionManager:(id)a3;
- (void)setSearchPins:(id)a3 selectedPin:(id)a4 animated:(BOOL)a5;
- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 itemSource:(id)a8 completion:(id)a9;
- (void)setSearchResultsDebugOverlay:(id)a3;
- (void)setSingleSearchPinFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)setStartPin:(id)a3 endPin:(id)a4;
- (void)setStartPin:(id)a3 endPin:(id)a4 useAlternateDirectionsPins:(BOOL)a5;
- (void)setStartPin:(id)a3 endPins:(id)a4;
- (void)setStartPin:(id)a3 endPins:(id)a4 useAlternateDirectionsPins:(BOOL)a5;
- (void)setVenuesManager:(id)a3;
- (void)showLinkedPlacesAndPolygonForPlaceCardItem:(id)a3;
@end

@implementation SearchPinsManager

- (void)setCustomPOIsController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_customPOIsController, obj);
    v5 = obj;
    if (obj)
    {
      if (self->_startPin) {
        [(SearchPinsManager *)self _startLoadingNewStartPOIShape];
      }
      NSUInteger v6 = [(NSArray *)self->_endPins count];
      v5 = obj;
      if (v6)
      {
        [(SearchPinsManager *)self _startLoadingNewEndPOIShapes];
        v5 = obj;
      }
    }
  }
}

- (SearchPinsManager)initWithMapViewCameraController:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SearchPinsManager;
  NSUInteger v6 = [(SearchPinsManager *)&v31 init];
  if (v6)
  {
    v7 = sub_100109DFC();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      objc_storeStrong((id *)&v6->_mapCameraController, a3);
      v14 = objc_alloc_init(SearchResultsItemSource);
      searchResultsItemSource = v6->_searchResultsItemSource;
      v6->_searchResultsItemSource = v14;

      [(SearchResultsItemSource *)v6->_searchResultsItemSource setMode:0];
      [(SearchResultsItemSource *)v6->_searchResultsItemSource setPreferredDisplayedSearchResultType:1];
      v16 = objc_alloc_init(SearchResultsItemSource);
      droppedPinsItemSource = v6->_droppedPinsItemSource;
      v6->_droppedPinsItemSource = v16;

      [(SearchResultsItemSource *)v6->_droppedPinsItemSource setMode:1];
      v18 = objc_alloc_init(SearchResultsItemSource);
      collectionPinsItemSource = v6->_collectionPinsItemSource;
      v6->_collectionPinsItemSource = v18;

      [(SearchResultsItemSource *)v6->_collectionPinsItemSource setMode:0];
      v20 = objc_alloc_init(SearchResultsItemSource);
      singleSearchResultItemSource = v6->_singleSearchResultItemSource;
      v6->_singleSearchResultItemSource = v20;

      [(SearchResultsItemSource *)v6->_singleSearchResultItemSource setMode:0];
      v22 = objc_alloc_init(RouteStartEndItemSource);
      routeStartEndItemSource = v6->_routeStartEndItemSource;
      v6->_routeStartEndItemSource = v22;

      v24 = objc_alloc_init(PlaceCardLinkedPlacesItemSource);
      placeCardLinkedPlacesItemSource = v6->_placeCardLinkedPlacesItemSource;
      v6->_placeCardLinkedPlacesItemSource = v24;

      v26 = objc_alloc_init(SearchDotPlacesItemSource);
      searchDotPlacesItemSource = v6->_searchDotPlacesItemSource;
      v6->_searchDotPlacesItemSource = v26;

      uint64_t v28 = +[NSHashTable weakObjectsHashTable];
      poiShapeLoadingObservers = v6->_poiShapeLoadingObservers;
      v6->_poiShapeLoadingObservers = (NSHashTable *)v28;

      goto LABEL_10;
    }
    v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(SearchPinsManager *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (SearchResultsItemSource)singleSearchResultItemSource
{
  return self->_singleSearchResultItemSource;
}

- (SearchResultsItemSource)searchResultsItemSource
{
  return self->_searchResultsItemSource;
}

- (SearchDotPlacesItemSource)searchDotPlacesItemSource
{
  return self->_searchDotPlacesItemSource;
}

- (RouteStartEndItemSource)routeStartEndItemSource
{
  return self->_routeStartEndItemSource;
}

- (PlaceCardLinkedPlacesItemSource)placeCardLinkedPlacesItemSource
{
  return self->_placeCardLinkedPlacesItemSource;
}

- (SearchResultsItemSource)droppedPinsItemSource
{
  return self->_droppedPinsItemSource;
}

- (SearchResultsItemSource)collectionPinsItemSource
{
  return self->_collectionPinsItemSource;
}

- (void)setVenuesManager:(id)a3
{
}

- (void)setMapSelectionManager:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    NSUInteger v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
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
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocating", buf, 0xCu);
  }
  [(SearchPinsManager *)self _clearShowSearchResultsAnimation];
  hiddenStartPin = self->_hiddenStartPin;
  self->_hiddenStartPin = 0;

  v11.receiver = self;
  v11.super_class = (Class)SearchPinsManager;
  [(SearchPinsManager *)&v11 dealloc];
}

- (MKMapView)mapView
{
  v2 = [(SearchPinsManager *)self mapCameraController];
  v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (void)setMapCameraController:(id)a3
{
  id v5 = (MapCameraController *)a3;
  if (self->_mapCameraController != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_mapCameraController, a3);
    NSUInteger v6 = [(SearchPinsManager *)self searchResultsItemSource];
    v7 = [(SearchPinsManager *)self searchResultsItemSource];
    v8 = [v7 searchResults];
    [v6 setSearchResults:v8];

    v9 = [(SearchPinsManager *)self droppedPinsItemSource];
    v10 = [(SearchPinsManager *)self droppedPinsItemSource];
    objc_super v11 = [v10 searchResults];
    [v9 setSearchResults:v11];

    v12 = [(SearchPinsManager *)self routeStartEndItemSource];
    [v12 setStartLocation:self->_startPin endLocations:self->_endPins];

    v13 = [(SearchPinsManager *)self searchDotPlacesItemSource];
    v14 = [(SearchPinsManager *)self searchDotPlacesItemSource];
    v15 = [v14 searchDotPlaces];
    [v13 setSearchDotPlaces:v15];

    id v5 = v16;
  }
}

- (id)allSearchResults
{
  return [(SearchResultsItemSource *)self->_searchResultsItemSource searchResults];
}

- (id)_setOfPinsForPinType:(unint64_t)a3
{
  char v3 = a3;
  id v5 = [(SearchPinsManager *)self allSearchResults];
  NSUInteger v6 = v5;
  if ((v3 & 1) != 0 && [v5 count]) {
    id v7 = [objc_alloc((Class)NSMutableSet) initWithArray:v6];
  }
  else {
    id v7 = [objc_alloc((Class)NSMutableSet) initWithCapacity:3];
  }
  v8 = v7;
  if ((v3 & 2) != 0 && self->_startPin) {
    [v7 addObject:];
  }
  if ((v3 & 4) != 0 && [(NSArray *)self->_endPins count]) {
    [v8 addObjectsFromArray:self->_endPins];
  }
  if ((v3 & 8) != 0 && self->_droppedPin) {
    [v8 addObject:];
  }

  return v8;
}

- (SearchResult)endPin
{
  v2 = [(SearchPinsManager *)self endPins];
  char v3 = [v2 lastObject];

  return (SearchResult *)v3;
}

- (void)setSearchPins:(id)a3 selectedPin:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(SearchPinsManager *)self clearSearchPins];
  v10 = [(SearchPinsManager *)self _setOfPinsForPinType:6];
  id v11 = [v8 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 removeObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v14);
  }

  [(SearchPinsManager *)self dropPinsForSearchResults:v11 animate:v5];
  v17 = sub_100109DFC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    unsigned int v37 = v5;
    v18 = self;
    if (!v18)
    {
      v23 = @"<nil>";
      goto LABEL_17;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      v21 = [(SearchPinsManager *)v18 performSelector:"accessibilityIdentifier"];
      v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_15;
      }
    }
    v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_15:

LABEL_17:
    v24 = v23;
    id v25 = [v8 count];
    unsigned int v26 = [(SearchResultsItemSource *)v18->_searchResultsItemSource shouldHideSearchResults];

    v27 = @"NO";
    if (v26) {
      v27 = @"YES";
    }
    uint64_t v28 = v27;
    *(_DWORD *)buf = 138543874;
    v44 = v23;
    __int16 v45 = 2048;
    id v46 = v25;
    __int16 v47 = 2112;
    v48 = v28;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Setting %lu search results for SearchResultsItemSource. SearchResultsItemSource hiding results: %@", buf, 0x20u);

    uint64_t v5 = v37;
  }

  if (![(SearchResultsItemSource *)self->_searchResultsItemSource shouldHideSearchResults]) {
    goto LABEL_29;
  }
  v29 = sub_100109DFC();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    unsigned int v38 = v5;
    v30 = self;
    objc_super v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    if (objc_opt_respondsToSelector())
    {
      v33 = [(SearchPinsManager *)v30 performSelector:"accessibilityIdentifier"];
      v34 = v33;
      if (v33 && ![v33 isEqualToString:v32])
      {
        v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];

        goto LABEL_27;
      }
    }
    v35 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
LABEL_27:

    *(_DWORD *)buf = 138543618;
    v44 = v35;
    __int16 v45 = 2112;
    id v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] Setting search results:\n(%@) but results were hidden. Unhiding them.", buf, 0x16u);

    uint64_t v5 = v38;
  }

  [(SearchResultsItemSource *)self->_searchResultsItemSource setShouldHideSearchResults:0];
LABEL_29:
  [(SearchResultsItemSource *)self->_searchResultsItemSource setSearchResults:v8];
  v36 = [(SearchPinsManager *)self mapView];
  [v36 _setApplicationState:0];

  if (v9) {
    [(SearchPinsManager *)self selectLabelMarkerForSearchResult:v9 animated:v5];
  }
}

- (void)setStartPin:(id)a3 endPin:(id)a4
{
}

- (void)setStartPin:(id)a3 endPins:(id)a4
{
}

- (void)setStartPin:(id)a3 endPin:(id)a4 useAlternateDirectionsPins:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v12 = v8;
    id v10 = a3;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    -[SearchPinsManager setStartPin:endPins:useAlternateDirectionsPins:](self, "setStartPin:endPins:useAlternateDirectionsPins:", v10, v11, v5, v12);
  }
  else
  {
    id v11 = a3;
    [(SearchPinsManager *)self setStartPin:v11 endPins:0 useAlternateDirectionsPins:v5];
  }
}

- (void)setStartPin:(id)a3 endPins:(id)a4 useAlternateDirectionsPins:(BOOL)a5
{
  int v5 = a5;
  unint64_t v8 = (unint64_t)a3;
  id v63 = a4;
  [(SearchPinsManager *)self _completeShowSearchResultsAnimation];
  int useAlternateDirectionsPins = self->_useAlternateDirectionsPins;
  v62 = (void *)v8;
  if (useAlternateDirectionsPins == v5)
  {
    if (v8 | (unint64_t)self->_startPin)
    {
      unsigned int v10 = [v8 isEqualToSearchResult:forPurpose:];
      int useAlternateDirectionsPins = self->_useAlternateDirectionsPins;
    }
    else
    {
      unsigned int v10 = 1;
      int useAlternateDirectionsPins = v5;
    }
    int v11 = v10 ^ 1;
  }
  else
  {
    int v11 = 1;
  }
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  BOOL v74 = 0;
  if (useAlternateDirectionsPins == v5)
  {
    id v12 = [(NSArray *)self->_endPins count];
    BOOL v13 = v12 != [v63 count];
    id v14 = (BOOL *)(v72 + 3);
  }
  else
  {
    id v14 = &v74;
    BOOL v13 = 1;
  }
  BOOL v74 = v13;
  if (!*v14)
  {
    endPins = self->_endPins;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1009F5144;
    v68[3] = &unk_1012F7E68;
    id v69 = v63;
    v70 = &v71;
    [(NSArray *)endPins enumerateObjectsUsingBlock:v68];
  }
  v16 = [(SearchPinsManager *)self _setOfPinsForPinType:9];
  self->_int useAlternateDirectionsPins = v5;
  if (v11)
  {
    p_startPin = &self->_startPin;
    if (self->_startPin) {
      [(SearchPinsManager *)self _clearStartPin];
    }
    uint64_t v18 = [v16 _maps_searchResultMemberEqualToResult:v62 forPurpose:1];
    v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v62;
    }
    objc_storeStrong((id *)&self->_startPin, v20);
    [(SearchResult *)*p_startPin setAppearance:2];
    v21 = sub_100109DFC();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    v22 = self;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      id v25 = [(SearchPinsManager *)v22 performSelector:"accessibilityIdentifier"];
      unsigned int v26 = v25;
      if (v25 && ([v25 isEqualToString:v24] & 1) == 0)
      {
        v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        goto LABEL_24;
      }
    }
    v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_24:

    uint64_t v28 = *p_startPin;
    *(_DWORD *)buf = 138543618;
    v77 = v27;
    __int16 v78 = 2112;
    v79 = (NSArray *)v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] Setting start pin: %@", buf, 0x16u);

LABEL_25:
  }
  if (*((unsigned char *)v72 + 24))
  {
    if (self->_endPins) {
      [(SearchPinsManager *)self _clearEndPins];
    }
    id v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v63, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v30 = v63;
    id v31 = [v30 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v65;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v65 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v35 = [v16 _maps_searchResultMemberEqualToResult:v34 forPurpose:1];
          v36 = (void *)v35;
          if (v35) {
            unsigned int v37 = (void *)v35;
          }
          else {
            unsigned int v37 = v34;
          }
          id v38 = v37;
          [v38 setAppearance:1];
          [v29 addObject:v38];
        }
        id v31 = [v30 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v31);
    }

    long long v39 = (NSArray *)[v29 copy];
    long long v40 = self->_endPins;
    self->_endPins = v39;

    long long v41 = sub_100109DFC();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
      goto LABEL_46;
    }
    long long v42 = self;
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    if (objc_opt_respondsToSelector())
    {
      __int16 v45 = [(SearchPinsManager *)v42 performSelector:"accessibilityIdentifier"];
      id v46 = v45;
      if (v45 && ([v45 isEqualToString:v44] & 1) == 0)
      {
        __int16 v47 = +[NSString stringWithFormat:@"%@<%p, %@>", v44, v42, v46];

        goto LABEL_45;
      }
    }
    __int16 v47 = +[NSString stringWithFormat:@"%@<%p>", v44, v42];
LABEL_45:

    v48 = self->_endPins;
    *(_DWORD *)buf = 138543618;
    v77 = v47;
    __int16 v78 = 2112;
    v79 = v48;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}@] Setting end pins: %@", buf, 0x16u);

LABEL_46:
  }
  if ((v11 & 1) != 0 || *((unsigned char *)v72 + 24))
  {
    v49 = [(SearchPinsManager *)self routeStartEndItemSource];
    [v49 setStartLocation:self->_startPin endLocations:self->_endPins];

    v50 = [(SearchPinsManager *)self mapSelectionManager];
    [v50 clearSelection];

    if (v11 && self->_startPin) {
      [(SearchPinsManager *)self _startLoadingNewStartPOIShape];
    }
    if (*((unsigned char *)v72 + 24) && [(NSArray *)self->_endPins count]) {
      [(SearchPinsManager *)self _startLoadingNewEndPOIShapes];
    }
    v51 = [(SearchPinsManager *)self mapView];
    BOOL v52 = sub_1000BBB44(v51) == 5;

    if (v52) {
      goto LABEL_64;
    }
    v53 = sub_100109DFC();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
LABEL_63:

      v60 = [(SearchPinsManager *)self searchResultsItemSource];
      [v60 setShouldHideSearchResults:1];

      v61 = [(SearchPinsManager *)self searchDotPlacesItemSource];
      [v61 setShouldHideSearchDotPlaces:1];

LABEL_64:
      [(SearchPinsManager *)self _updateDroppedPinVisibility];
      goto LABEL_65;
    }
    v54 = self;
    v55 = (objc_class *)objc_opt_class();
    v56 = NSStringFromClass(v55);
    if (objc_opt_respondsToSelector())
    {
      v57 = [(SearchPinsManager *)v54 performSelector:"accessibilityIdentifier"];
      v58 = v57;
      if (v57 && ([v57 isEqualToString:v56] & 1) == 0)
      {
        v59 = +[NSString stringWithFormat:@"%@<%p, %@>", v56, v54, v58];

        goto LABEL_62;
      }
    }
    v59 = +[NSString stringWithFormat:@"%@<%p>", v56, v54];
LABEL_62:

    *(_DWORD *)buf = 138543362;
    v77 = v59;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}@] searchResultsItemSource will hide search results.", buf, 0xCu);

    goto LABEL_63;
  }
LABEL_65:

  _Block_object_dispose(&v71, 8);
}

- (void)setDroppedPin:(id)a3 animated:(BOOL)a4 shouldSelect:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unint64_t v8 = (SearchResult *)a3;
  if (self->_droppedPin) {
    [(SearchPinsManager *)self clearDroppedPin];
  }
  droppedPinsItemSource = self->_droppedPinsItemSource;
  v16 = v8;
  unsigned int v10 = +[NSArray arrayWithObjects:&v16 count:1];
  [(SearchResultsItemSource *)droppedPinsItemSource setSearchResults:v10];

  droppedPin = self->_droppedPin;
  self->_droppedPin = v8;
  id v12 = v8;

  [(SearchPinsManager *)self _updateDroppedPinVisibility];
  if (v5) {
    [(SearchPinsManager *)self selectDroppedPinIsAnimated:v6];
  }
  BOOL v13 = [(SearchPinsManager *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(SearchPinsManager *)self delegate];
    [v15 setNeedsUserActivityUpdate];
  }
}

- (void)selectDroppedPinIsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    [(SearchPinsManager *)self selectLabelMarkerForSearchResult:droppedPin animated:v3];
    BOOL v6 = self->_droppedPin;
    CFStringRef v9 = @"selectedSearchResult";
    unsigned int v10 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    unint64_t v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"MapsPinsDroppedForSearchResultsNotification" object:self userInfo:v7];
  }
}

- (BOOL)canSelectPin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SearchPinsManager *)self allSearchResults];
  unsigned __int8 v6 = [v5 _maps_containsSearchResultEqualToResult:v4 forPurpose:5];

  uint64_t v7 = [(SearchResultsItemSource *)self->_droppedPinsItemSource searchResults];
  unsigned __int8 v8 = [_maps_containsSearchResultEqualToResult:v4 forPurpose:5];

  CFStringRef v9 = [(SearchResultsItemSource *)self->_singleSearchResultItemSource searchResults];
  LOBYTE(v7) = [v9 _maps_containsSearchResultEqualToResult:v4 forPurpose:5];

  return v6 | v8 | v7;
}

- (BOOL)disableStartPin
{
  v2 = [(SearchPinsManager *)self routeStartEndItemSource];
  BOOL v3 = ((unint64_t)[v2 visibilityMask] & 1) == 0;

  return v3;
}

- (void)setDisableStartPin:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchPinsManager *)self routeStartEndItemSource];
  [v4 setVisibilityMask:((unint64_t)[v4 visibilityMask] & 0xFFFFFFFFFFFFFFFELL | !v3)];
}

- (BOOL)disableEndPins
{
  v2 = [(SearchPinsManager *)self routeStartEndItemSource];
  BOOL v3 = ((unint64_t)[v2 visibilityMask] & 4) == 0;

  return v3;
}

- (void)setDisableEndPins:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SearchPinsManager *)self routeStartEndItemSource];
  unint64_t v4 = (unint64_t)[v6 visibilityMask] & 0xFFFFFFFFFFFFFFF9;
  uint64_t v5 = 6;
  if (v3) {
    uint64_t v5 = 0;
  }
  [v6 setVisibilityMask:v4 | v5];
}

- (void)_clearStartPin
{
  if (!self->_startPin) {
    return;
  }
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Clearing start pin", buf, 0xCu);
  }
  unsigned int v10 = [(SearchPinsManager *)self _setOfPinsForPinType:9];
  if ([v10 containsObject:self->_startPin])
  {
    startPin = self->_startPin;
    if (startPin == self->_droppedPin) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 1;
    }
    [(SearchResult *)startPin setAppearance:v12];
  }
  BOOL v13 = self->_startPin;
  self->_startPin = 0;

  hiddenStartPin = self->_hiddenStartPin;
  self->_hiddenStartPin = 0;

  [(SearchPinsManager *)self _setStartPOIShape:0];
}

- (void)_clearEndPins
{
  if (![(NSArray *)self->_endPins count]) {
    return;
  }
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Clearing end pins", buf, 0xCu);
  }
  unsigned int v10 = [(SearchPinsManager *)self _setOfPinsForPinType:9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v11 = self->_endPins;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(SearchResult **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 containsObject:v16])
        {
          if (v16 == self->_droppedPin) {
            uint64_t v17 = 3;
          }
          else {
            uint64_t v17 = 1;
          }
          [(SearchResult *)v16 setAppearance:v17];
        }
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  endPins = self->_endPins;
  self->_endPins = 0;

  [(SearchPinsManager *)self _setEndPOIShapes:0];
}

- (void)clearDirectionsPins
{
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    if (!v4)
    {
      CFStringRef v9 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Clearing directions pins.", buf, 0xCu);
  }
  [(SearchPinsManager *)self _clearStartPin];
  [(SearchPinsManager *)self _clearEndPins];
  unsigned int v10 = [(SearchPinsManager *)self routeStartEndItemSource];
  [v10 clearStartAndEndLocations];

  int v11 = [(SearchPinsManager *)self searchResultsItemSource];
  [v11 setShouldHideSearchResults:0];

  id v12 = [(SearchPinsManager *)self searchDotPlacesItemSource];
  [v12 setShouldHideSearchDotPlaces:0];

  [(SearchPinsManager *)self _updateDroppedPinVisibility];
}

- (void)clearSearchPins
{
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    if (!v4)
    {
      CFStringRef v9 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    long long v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will clear search pins.", buf, 0xCu);
  }
  [(SearchPinsManager *)self _clearShowSearchResultsAnimation];
  unsigned int v10 = [(SearchPinsManager *)self delegate];
  [v10 setSuggestedApplicationState:0];

  if (self->_selectedLabelMarker)
  {
    int v11 = [(SearchPinsManager *)self mapView];
    [v11 _deselectLabelMarkerAnimated:0];
  }
  if (!self->_startPin && ![(NSArray *)self->_endPins count])
  {
    id v12 = sub_100109DFC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      long long v19 = [(SearchPinsManager *)self mapView];
      long long v20 = [v19 preferredConfiguration];

      if ([v20 conformsToProtocol:&OBJC_PROTOCOL___MKMapConfigurationHiking]) {
        long long v21 = v20;
      }
      else {
        long long v21 = 0;
      }
      id v22 = v21;

      [v22 setShowsTopographicFeatures:0];
      goto LABEL_26;
    }
    id v13 = self;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(SearchPinsManager *)v13 performSelector:"accessibilityIdentifier"];
      uint64_t v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        uint64_t v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_21;
      }
    }
    uint64_t v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_21:

    *(_DWORD *)buf = 138543362;
    long long v41 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Clearing the topographic map", buf, 0xCu);

    goto LABEL_22;
  }
LABEL_26:
  v23 = sub_100109DFC();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
    goto LABEL_33;
  }
  v24 = self;
  id v25 = (objc_class *)objc_opt_class();
  unsigned int v26 = NSStringFromClass(v25);
  if (objc_opt_respondsToSelector())
  {
    v27 = [(SearchPinsManager *)v24 performSelector:"accessibilityIdentifier"];
    uint64_t v28 = v27;
    if (v27 && ![v27 isEqualToString:v26])
    {
      id v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

      goto LABEL_32;
    }
  }
  id v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_32:

  *(_DWORD *)buf = 138543362;
  long long v41 = v29;
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] SearchResultsItemSource is clearing search results.", buf, 0xCu);

LABEL_33:
  [(SearchResultsItemSource *)self->_searchResultsItemSource setSearchResults:&__NSArray0__struct];
  [(SearchDotPlacesItemSource *)self->_searchDotPlacesItemSource setSearchDotPlaces:&__NSArray0__struct];
  id v30 = [(SearchPinsManager *)self delegate];
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    uint64_t v32 = [(SearchPinsManager *)self delegate];
    [v32 setNeedsUserActivityUpdate];
  }
  v33 = sub_100109DFC();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = self;
    uint64_t v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v37 = [(SearchPinsManager *)v34 performSelector:"accessibilityIdentifier"];
      id v38 = v37;
      if (v37 && ![v37 isEqualToString:v36])
      {
        long long v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

        goto LABEL_41;
      }
    }
    long long v39 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_41:

    *(_DWORD *)buf = 138543362;
    long long v41 = v39;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] Clearing search pins completed", buf, 0xCu);
  }
}

- (void)clearDroppedPin
{
  BOOL v3 = [(SearchPinsManager *)self customPOIsController];

  if (v3)
  {
    unint64_t v4 = sub_100109DFC();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(SearchResultsItemSource *)self->_droppedPinsItemSource setSearchResults:&__NSArray0__struct];
      goto LABEL_13;
    }
    uint64_t v5 = self;
    if (!v5)
    {
      unsigned int v10 = @"<nil>";
      goto LABEL_11;
    }
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v8 = [(SearchPinsManager *)v5 performSelector:"accessibilityIdentifier"];
      CFStringRef v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unsigned int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    unsigned int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing DroppedPinsItemSource.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:
  if (!self->_droppedPin) {
    return;
  }
  int v11 = [(SearchPinsManager *)self mapSelectionManager];
  id v12 = [v11 customLabelMarker];
  id v13 = [v12 searchResult];

  if (v13 && [v13 type] == 3)
  {
    uint64_t v14 = [(SearchPinsManager *)self mapSelectionManager];
    [v14 clearSelection];
  }
  uint64_t v15 = sub_100109DFC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = self;
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      long long v19 = [(SearchPinsManager *)v16 performSelector:"accessibilityIdentifier"];
      long long v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        long long v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_23;
      }
    }
    long long v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_23:

    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Setting dropped pin to nil.", buf, 0xCu);
  }
  droppedPin = self->_droppedPin;
  self->_droppedPin = 0;
}

- (void)clearSingleResultPins
{
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    if (!v4)
    {
      CFStringRef v9 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    long long v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will clear single result pins.", buf, 0xCu);
  }
  unsigned int v10 = [(SearchResultsItemSource *)self->_singleSearchResultItemSource searchResults];
  id v11 = [v10 count];

  id v12 = sub_100109DFC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (!v13) {
      goto LABEL_36;
    }
    uint64_t v35 = self;
    v36 = (objc_class *)objc_opt_class();
    unsigned int v37 = NSStringFromClass(v36);
    if (objc_opt_respondsToSelector())
    {
      id v38 = [(SearchPinsManager *)v35 performSelector:"accessibilityIdentifier"];
      long long v39 = v38;
      if (v38 && ![v38 isEqualToString:v37])
      {
        v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v37, v35, v39];

        goto LABEL_34;
      }
    }
    v33 = +[NSString stringWithFormat:@"%@<%p>", v37, v35];
LABEL_34:

    *(_DWORD *)buf = 138543362;
    long long v41 = v33;
    v34 = "[%{public}@] No single result pins to clear, returning.";
    goto LABEL_35;
  }
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = self;
  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [(SearchPinsManager *)v14 performSelector:"accessibilityIdentifier"];
    uint64_t v18 = v17;
    if (v17 && ![v17 isEqualToString:v16])
    {
      long long v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

      goto LABEL_18;
    }
  }
  long long v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_18:

  *(_DWORD *)buf = 138543362;
  long long v41 = v19;
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] _singleSearchResultItemSource is clearing search results.", buf, 0xCu);

LABEL_19:
  [(SearchResultsItemSource *)self->_singleSearchResultItemSource setSearchResults:&__NSArray0__struct];
  searchResultsItemSource = self->_searchResultsItemSource;
  long long v21 = [(SearchPinsManager *)self searchResultsItemSource];
  id v22 = [v21 searchResults];
  [(SearchResultsItemSource *)searchResultsItemSource setSearchResults:v22];

  searchDotPlacesItemSource = self->_searchDotPlacesItemSource;
  uint64_t v24 = [(SearchPinsManager *)self searchDotPlacesItemSource];
  id v25 = [(id)v24 searchDotPlaces];
  [(SearchDotPlacesItemSource *)searchDotPlacesItemSource setSearchDotPlaces:v25];

  unsigned int v26 = [(SearchPinsManager *)self delegate];
  LOBYTE(v24) = objc_opt_respondsToSelector();

  if (v24)
  {
    v27 = [(SearchPinsManager *)self delegate];
    [v27 setNeedsUserActivityUpdate];
  }
  id v12 = sub_100109DFC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = self;
    id v29 = (objc_class *)objc_opt_class();
    id v30 = NSStringFromClass(v29);
    if (objc_opt_respondsToSelector())
    {
      char v31 = [(SearchPinsManager *)v28 performSelector:"accessibilityIdentifier"];
      uint64_t v32 = v31;
      if (v31 && ![v31 isEqualToString:v30])
      {
        v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v30, v28, v32];

        goto LABEL_27;
      }
    }
    v33 = +[NSString stringWithFormat:@"%@<%p>", v30, v28];
LABEL_27:

    *(_DWORD *)buf = 138543362;
    long long v41 = v33;
    v34 = "[%{public}@] Clearing single result pins completed";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v34, buf, 0xCu);
  }
LABEL_36:
}

- (void)clearCollectionPins
{
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = self;
    if (!v4)
    {
      CFStringRef v9 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    unsigned int v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will clear collection pins.", buf, 0xCu);
  }
  unsigned int v10 = [(SearchPinsManager *)self delegate];
  [v10 setSuggestedApplicationState:0];

  if (self->_selectedLabelMarker)
  {
    id v11 = [(SearchPinsManager *)self mapView];
    [v11 _deselectLabelMarkerAnimated:0];
  }
  id v12 = [(SearchResultsItemSource *)self->_collectionPinsItemSource searchResults];

  BOOL v13 = sub_100109DFC();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (!v14) {
      goto LABEL_38;
    }
    char v31 = self;
    uint64_t v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    if (objc_opt_respondsToSelector())
    {
      v34 = [(SearchPinsManager *)v31 performSelector:"accessibilityIdentifier"];
      uint64_t v35 = v34;
      if (v34 && ![v34 isEqualToString:v33])
      {
        id v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

        goto LABEL_36;
      }
    }
    id v29 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_36:

    *(_DWORD *)buf = 138543362;
    unsigned int v37 = v29;
    id v30 = "[%{public}@] No collections pins to clear, returning.";
    goto LABEL_37;
  }
  if (!v14) {
    goto LABEL_21;
  }
  uint64_t v15 = self;
  v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [(SearchPinsManager *)v15 performSelector:"accessibilityIdentifier"];
    long long v19 = v18;
    if (v18 && ![v18 isEqualToString:v17])
    {
      long long v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

      goto LABEL_20;
    }
  }
  long long v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_20:

  *(_DWORD *)buf = 138543362;
  unsigned int v37 = v20;
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] CollectionPinsItemSource is clearing search results.", buf, 0xCu);

LABEL_21:
  [(SearchResultsItemSource *)self->_collectionPinsItemSource setSearchResults:&__NSArray0__struct];
  long long v21 = [(SearchPinsManager *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(SearchPinsManager *)self delegate];
    [v23 setNeedsUserActivityUpdate];
  }
  BOOL v13 = sub_100109DFC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = self;
    id v25 = (objc_class *)objc_opt_class();
    unsigned int v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      v27 = [(SearchPinsManager *)v24 performSelector:"accessibilityIdentifier"];
      uint64_t v28 = v27;
      if (v27 && ![v27 isEqualToString:v26])
      {
        id v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

        goto LABEL_29;
      }
    }
    id v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_29:

    *(_DWORD *)buf = 138543362;
    unsigned int v37 = v29;
    id v30 = "[%{public}@] Clearing collection pins completed";
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v30, buf, 0xCu);
  }
LABEL_38:
}

- (BOOL)_isShowingDirectionsPins
{
  BOOL v3 = [(SearchPinsManager *)self startPin];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(SearchPinsManager *)self endPin];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)setSingleSearchPinFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)setCollectionsPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6
{
}

- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
}

- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 itemSource:(id)a8 completion:(id)a9
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (SearchResultsItemSource *)a8;
  id v18 = a9;
  if (self->_startPin && [(NSArray *)self->_endPins count] && self->_searchResultsItemSource == v17) {
    [(SearchResultsItemSource *)v17 setShouldHideSearchResults:0];
  }
  id v80 = v16;
  if (self->_searchResultsItemSource == v17) {
    [(SearchPinsManager *)self clearSearchPins];
  }
  long long v19 = [(SearchPinsManager *)self delegate];
  [v19 setSuggestedApplicationState:0];

  long long v20 = [(SearchPinsManager *)self mapView];
  [v20 setUserTrackingMode:0 animated:0];

  if ([v14 mapDisplayType] == 1)
  {
    long long v21 = [(SearchPinsManager *)self mapView];
    char v22 = [v21 preferredConfiguration];

    if ([v22 conformsToProtocol:&OBJC_PROTOCOL___MKMapConfigurationHiking]) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    [v24 setShowsTopographicFeatures:1];
  }
  id v25 = [(SearchPinsManager *)self mapView];
  [v25 _selectAnnotation:0 animated:0];

  self->_hasAutoSelectedResult = 1;
  uint64_t v83 = [v14 selectedResult];
  uint64_t v82 = [v14 mapRegion];
  unsigned int v26 = [v14 results];
  v81 = v15;
  if (self->_singleSearchResultItemSource == v17)
  {
    id v30 = [(SearchPinsManager *)self allSearchResults];
    char v31 = [v26 arrayByAddingObjectsFromArray:v30];

    uint64_t v28 = [(SearchResultsItemSource *)self->_collectionPinsItemSource searchResults];
    id v29 = [v31 arrayByAddingObjectsFromArray:v28];
    unsigned int v26 = v31;
  }
  else
  {
    collectionPinsItemSource = self->_collectionPinsItemSource;
    if (collectionPinsItemSource == v17)
    {
      uint64_t v32 = [(SearchPinsManager *)self allSearchResults];
      id v29 = [v26 arrayByAddingObjectsFromArray:v32];

      if (!v15) {
        goto LABEL_19;
      }
      uint64_t v28 = [v15 mapItem];
      [v28 _displayMapRegion];
      v82 = unsigned int v26 = (void *)v82;
    }
    else
    {
      uint64_t v28 = [(SearchResultsItemSource *)collectionPinsItemSource searchResults];
      id v29 = [v26 arrayByAddingObjectsFromArray:v28];
    }
  }

LABEL_19:
  v33 = sub_100109DFC();
  if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_26;
  }
  v34 = self;
  uint64_t v35 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v35);
  id v77 = v14;
  BOOL v76 = v12;
  if (objc_opt_respondsToSelector())
  {
    unsigned int v37 = [(SearchPinsManager *)v34 performSelector:"accessibilityIdentifier"];
    id v38 = v37;
    if (v37 && ![v37 isEqualToString:v36])
    {
      long long v39 = v17;
      id v40 = v18;
      long long v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

      goto LABEL_25;
    }
  }
  long long v39 = v17;
  id v40 = v18;
  long long v41 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_25:

  *(_DWORD *)buf = 138543618;
  v97 = v41;
  __int16 v98 = 2048;
  id v99 = [v29 count];
  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "[%{public}@] Setting search results with determining Region:%lu", buf, 0x16u);

  id v18 = v40;
  uint64_t v17 = v39;
  id v14 = v77;
  BOOL v12 = v76;
LABEL_26:

  long long v42 = [(SearchPinsManager *)self venuesManager];
  id v94 = 0;
  id v95 = 0;
  id v93 = v29;
  v43 = [v14 searchFieldItem];
  [v42 getMinZoom:&v95 maxZoom:&v94 resultsForDeterminingRegion:&v93 forDisplayingResults:v29 fromSearch:v43];
  id v44 = v95;
  id v79 = v94;
  id v45 = v93;

  if ([v45 count])
  {
    id v46 = (void *)v83;
    if (v83 && ([v45 containsObject:v83] & 1) == 0)
    {

      uint64_t v59 = [v14 results];

      id v44 = 0;
      id v45 = (id)v59;
    }
    else
    {
      id v47 = [v45 count];
      v48 = [v14 results];
      id v49 = [v48 count];

      if (v47 < v49)
      {
        v50 = (void *)v82;
        uint64_t v82 = 0;
        goto LABEL_32;
      }
      id v46 = (void *)v83;
      if (!v83) {
        goto LABEL_35;
      }
    }
LABEL_38:
    v60 = [(SearchPinsManager *)self mapSelectionManager];
    [v60 suspendUpdates];

    v61 = sub_100109DFC();
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
LABEL_45:
      v53 = v18;

      unsigned __int8 v71 = [v14 disableAdditionalViewportPadding];
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_1009F7874;
      v89[3] = &unk_101313C80;
      v89[4] = self;
      id v90 = v14;
      v58 = v46;
      id v91 = v46;
      v92 = v17;
      LOBYTE(v75) = v71;
      v72 = self;
      v56 = v79;
      v55 = v80;
      v57 = (void *)v82;
      [(SearchPinsManager *)v72 _animateShowingSearchResults:v45 selectedSearchResult:v91 historyItem:v80 suggestedMapRegion:v82 minZoom:v44 maxZoom:v79 disableAdditionalViewportPadding:v75 completion:v89];

      goto LABEL_46;
    }
    v62 = self;
    id v63 = (objc_class *)objc_opt_class();
    long long v64 = NSStringFromClass(v63);
    if (objc_opt_respondsToSelector())
    {
      id v78 = v14;
      long long v65 = v17;
      id v66 = v18;
      long long v67 = [(SearchPinsManager *)v62 performSelector:"accessibilityIdentifier"];
      v68 = v67;
      if (v67 && ![v67 isEqualToString:v64])
      {
        id v69 = +[NSString stringWithFormat:@"%@<%p, %@>", v64, v62, v68];

        id v18 = v66;
        uint64_t v17 = v65;
        id v14 = v78;
        goto LABEL_44;
      }

      id v18 = v66;
      uint64_t v17 = v65;
      id v14 = v78;
    }
    id v69 = +[NSString stringWithFormat:@"%@<%p>", v64, v62];
LABEL_44:

    id v70 = [v45 count];
    *(_DWORD *)buf = 138543618;
    v97 = v69;
    __int16 v98 = 2048;
    id v99 = v70;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "[%{public}@] Animate showing search results. Count: %lu", buf, 0x16u);

    id v46 = (void *)v83;
    goto LABEL_45;
  }

  uint64_t v51 = [v14 results];
  id v44 = 0;
  v50 = v45;
  id v45 = (id)v51;
LABEL_32:
  id v46 = (void *)v83;

  if (v83) {
    goto LABEL_38;
  }
LABEL_35:
  if (v12)
  {
    BOOL v52 = [(SearchPinsManager *)self mapSelectionManager];
    [v52 suspendUpdates];

    LOBYTE(v52) = [v14 disableAdditionalViewportPadding];
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_1009F7968;
    v84[3] = &unk_101313CA8;
    v84[4] = self;
    id v85 = v14;
    id v86 = v81;
    v87 = v17;
    v53 = v18;
    id v88 = v18;
    LOBYTE(v75) = (_BYTE)v52;
    v54 = self;
    v56 = v79;
    v55 = v80;
    v57 = (void *)v82;
    [(SearchPinsManager *)v54 _animateShowingSearchResults:v45 selectedSearchResult:v86 historyItem:v80 suggestedMapRegion:v82 minZoom:v44 maxZoom:v79 disableAdditionalViewportPadding:v75 completion:v84];

    v58 = (void *)v83;
  }
  else
  {
    v53 = v18;
    uint64_t v73 = [v14 results];
    BOOL v74 = [v14 searchDotPlaces];
    [(SearchPinsManager *)self dropPinsForSearchResults:v73 searchDotPlaces:v74 selectedSearchResult:v81 animate:1 itemSource:v17];

    v57 = (void *)v82;
    v58 = (void *)v83;
    v56 = v79;
    v55 = v80;
  }
LABEL_46:
}

- (void)_animateShowingSearchResults:(id)a3 selectedSearchResult:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  id v16 = a3;
  id v38 = a6;
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  [(SearchPinsManager *)self _clearShowSearchResultsAnimation];
  char v22 = sub_100109DFC();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = self;
    id v37 = v17;
    if (!v23)
    {
      uint64_t v28 = @"<nil>";
      goto LABEL_10;
    }
    id v36 = v16;
    id v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v26 = [(SearchPinsManager *)v23 performSelector:"accessibilityIdentifier"];
      v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        uint64_t v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_8;
      }
    }
    uint64_t v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_8:

    id v16 = v36;
LABEL_10:

    *(_DWORD *)buf = 138543618;
    long long v42 = v28;
    __int16 v43 = 2048;
    id v44 = [v16 count];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Initializing animation for %lu results", buf, 0x16u);

    id v17 = v37;
  }

  id v29 = [SearchPinsManagerShowSearchResultsAnimation alloc];
  id v30 = [(SearchPinsManager *)self mapCameraController];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1009F7DCC;
  v39[3] = &unk_101313CD0;
  id v31 = v17;
  v39[4] = self;
  id v40 = v31;
  LOBYTE(v35) = a9;
  uint64_t v32 = [(SearchPinsManagerShowSearchResultsAnimation *)v29 initWithSearchResults:v16 selectedSearchResult:v21 historyItem:v20 suggestedMapRegion:v38 mapCameraController:v30 minZoom:v19 maxZoom:v18 disableAdditionalViewportPadding:v35 completion:v39];

  showSearchResultsAnimation = self->_showSearchResultsAnimation;
  self->_showSearchResultsAnimation = v32;

  [(SearchPinsManagerShowSearchResultsAnimation *)self->_showSearchResultsAnimation start];
  if (GEOConfigGetBOOL())
  {
    v34 = [(SearchPinsManager *)self searchResultsDebugOverlay];
    [v34 drawDebugMapRegionsWithSearchResults:v16 suggestedMapRegion:v38];
  }
}

- (void)mapViewDidBecomeFullyDrawn
{
  BOOL v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = self;
    if (!v4)
    {
      CFStringRef v9 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    unsigned int v10 = [(SearchPinsManagerShowSearchResultsAnimation *)v4->_showSearchResultsAnimation debugDescription];
    *(_DWORD *)buf = 138543618;
    BOOL v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Map view is fully drawn, proceeding with dropping pins using animation: %@", buf, 0x16u);
  }
  [(SearchPinsManagerShowSearchResultsAnimation *)self->_showSearchResultsAnimation proceedWithDroppingPins:1];
}

- (void)_clearShowSearchResultsAnimation
{
  BOOL v3 = sub_100109DFC();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  BOOL v4 = self;
  if (!v4)
  {
    CFStringRef v9 = @"<nil>";
    goto LABEL_10;
  }
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
    unsigned __int8 v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  CFStringRef v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  unsigned int v10 = [(SearchPinsManagerShowSearchResultsAnimation *)v4->_showSearchResultsAnimation debugDescription];
  *(_DWORD *)buf = 138543618;
  id v17 = v9;
  __int16 v18 = 2112;
  id v19 = v10;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Cancelling search result animation: %@", buf, 0x16u);

LABEL_11:
  [(SearchPinsManagerShowSearchResultsAnimation *)self->_showSearchResultsAnimation cancel];
  showSearchResultsAnimation = self->_showSearchResultsAnimation;
  self->_showSearchResultsAnimation = 0;

  BOOL v12 = [(SearchPinsManager *)self searchResultsDebugOverlay];
  __int16 v13 = [v12 polygons];
  id v14 = [v13 count];

  if (v14)
  {
    id v15 = [(SearchPinsManager *)self searchResultsDebugOverlay];
    [v15 removeDrawnDebugMapRegions];
  }
}

- (void)_completeShowSearchResultsAnimation
{
  [(SearchPinsManagerShowSearchResultsAnimation *)self->_showSearchResultsAnimation proceedWithDroppingPins:0];

  [(SearchPinsManager *)self _clearShowSearchResultsAnimation];
}

- (UIEdgeInsets)carRecommendedMapPadding
{
  UIEdgeInsetsMakeWithEdges();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)selectLabelMarkerForSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SearchResultsItemSource *)self->_searchResultsItemSource keysForSearchResult:v6];
  if (![v7 count])
  {
    uint64_t v8 = [(SearchResultsItemSource *)self->_droppedPinsItemSource keysForSearchResult:v6];

    uint64_t v7 = (void *)v8;
  }
  if (![v7 count])
  {
    uint64_t v9 = [(SearchResultsItemSource *)self->_singleSearchResultItemSource keysForSearchResult:v6];

    uint64_t v7 = (void *)v9;
  }
  if (![v7 count])
  {
    unsigned int v10 = [(RouteStartEndItemSource *)self->_routeStartEndItemSource itemMatchingLocation:v6];
    uint64_t v11 = [v10 keys];

    uint64_t v7 = (void *)v11;
  }
  if (![v7 count])
  {
    id v15 = sub_100109DFC();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_20;
    }
    id v16 = self;
    id v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      id v19 = [(SearchPinsManager *)v16 performSelector:"accessibilityIdentifier"];
      id v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        id v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_16;
      }
    }
    id v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_16:

    *(_DWORD *)buf = 138543618;
    id v25 = v21;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] No keys found for search result: %@", buf, 0x16u);

    goto LABEL_17;
  }
  BOOL v12 = [v6 autocompletePerson];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapSelectionManager);
  id v14 = WeakRetained;
  if (v12)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1009F86CC;
    v23[3] = &unk_101313CF8;
    v23[4] = self;
    [WeakRetained selectLabelMarkerWithKeys:v7 animated:v4 restoreRegion:0 completion:v23];
  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1009F86D8;
    v22[3] = &unk_101313CF8;
    v22[4] = self;
    [WeakRetained selectLabelMarkerWithKeys:v7 animated:v4 completion:v22];
  }

LABEL_20:
}

- (void)dropPinsForSearchResults:(id)a3 selectedSearchResult:(id)a4 animate:(BOOL)a5
{
}

- (void)dropPinsForSearchResults:(id)a3 searchDotPlaces:(id)a4 selectedSearchResult:(id)a5 animate:(BOOL)a6 itemSource:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = sub_100109DFC();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  id v17 = self;
  unsigned int v42 = v8;
  if (!v17)
  {
    char v22 = @"<nil>";
    goto LABEL_10;
  }
  __int16 v18 = (objc_class *)objc_opt_class();
  id v19 = NSStringFromClass(v18);
  if (objc_opt_respondsToSelector())
  {
    id v20 = [(SearchPinsManager *)v17 performSelector:"accessibilityIdentifier"];
    id v21 = v20;
    if (v20 && ![v20 isEqualToString:v19])
    {
      char v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

      goto LABEL_8;
    }
  }
  char v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_8:

LABEL_10:
  v23 = v22;
  id v24 = [v12 count];
  unsigned int v25 = [(SearchResultsItemSource *)v17->_searchResultsItemSource shouldHideSearchResults];

  __int16 v26 = @"NO";
  if (v25) {
    __int16 v26 = @"YES";
  }
  id v27 = v26;
  *(_DWORD *)buf = 138544130;
  id v46 = v22;
  __int16 v47 = 2048;
  id v48 = v24;
  __int16 v49 = 2112;
  id v50 = v14;
  __int16 v51 = 2112;
  BOOL v52 = v27;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Setting %lu results for %@. Hiding Results: %@", buf, 0x2Au);

  uint64_t v8 = v42;
LABEL_13:

  [v14 setSearchResults:v12];
  uint64_t v28 = [(SearchPinsManager *)self searchDotPlacesItemSource];
  id v29 = [v15 copy];

  [v28 setSearchDotPlaces:v29];
  if (![(SearchResultsItemSource *)self->_searchResultsItemSource shouldHideSearchResults]) {
    goto LABEL_22;
  }
  id v30 = sub_100109DFC();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = self;
    uint64_t v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    if (objc_opt_respondsToSelector())
    {
      v34 = [(SearchPinsManager *)v31 performSelector:"accessibilityIdentifier"];
      uint64_t v35 = v34;
      if (v34 && ![v34 isEqualToString:v33])
      {
        id v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

        goto LABEL_20;
      }
    }
    id v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_20:

    *(_DWORD *)buf = 138543362;
    id v46 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] SearchResultsItemSource is hiding results but we are setting search results. So unhide them", buf, 0xCu);
  }
  [(SearchResultsItemSource *)self->_searchResultsItemSource setShouldHideSearchResults:0];
LABEL_22:
  if (v13) {
    [(SearchPinsManager *)self selectLabelMarkerForSearchResult:v13 animated:v8];
  }
  id v37 = [(SearchPinsManager *)self delegate];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    long long v39 = [(SearchPinsManager *)self delegate];
    [v39 setNeedsUserActivityUpdate];
  }
  if (v13)
  {
    CFStringRef v43 = @"selectedSearchResult";
    id v44 = v13;
    id v40 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  }
  else
  {
    id v40 = 0;
  }
  long long v41 = +[NSNotificationCenter defaultCenter];
  [v41 postNotificationName:@"MapsPinsDroppedForSearchResultsNotification" object:self userInfo:v40];
}

- (void)dropPinsForSearchResults:(id)a3 animate:(BOOL)a4
{
}

- (void)selectAndShowSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  unsigned __int8 v9 = [(SearchPinsManager *)self canSelectPin:v6];
  if (v8 != (id)5)
  {
    if (v9) {
      goto LABEL_16;
    }
    id v12 = sub_100109DFC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v13 = self;
    if (!v13)
    {
      __int16 v18 = @"<nil>";
      goto LABEL_14;
    }
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      id v16 = [(SearchPinsManager *)v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_12;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to show a search result not in the search pins manager!", buf, 0xCu);

LABEL_15:
    goto LABEL_16;
  }
  if ((v9 & 1) == 0)
  {
    unsigned int v10 = [(SearchPinsManager *)self mapCameraController];
    uint64_t v11 = [v6 mapItem];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1009F8EA4;
    v24[3] = &unk_1012ED4B8;
    v24[4] = self;
    id v25 = v6;
    BOOL v26 = v4;
    [v10 frameMapItem:v11 animated:1 completion:v24];

    goto LABEL_20;
  }
LABEL_16:
  if (v6)
  {
    if (self->_showSearchResultsAnimation)
    {
      objc_initWeak((id *)buf, self);
      showSearchResultsAnimation = self->_showSearchResultsAnimation;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1009F8F14;
      v20[3] = &unk_101313D20;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v6;
      BOOL v23 = v4;
      [(SearchPinsManagerShowSearchResultsAnimation *)showSearchResultsAnimation addCompletion:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(SearchPinsManager *)self selectLabelMarkerForSearchResult:v6 animated:v4];
    }
  }
LABEL_20:
}

- (void)mapSelectionManagerDidDeselectSearchResult:(id)a3
{
  [(SearchPinsManager *)self clearSingleResultPins];
  id v6 = [(SearchPinsManager *)self mapView];
  if (sub_1000BBB44(v6) == 5)
  {
  }
  else
  {
    BOOL v4 = [(SearchPinsManager *)self allSearchResults];
    id v5 = [v4 count];

    if (v5 == (id)1)
    {
      [(SearchPinsManager *)self clearSearchPins];
    }
  }
}

- (void)showLinkedPlacesAndPolygonForPlaceCardItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchPinsManager *)self placeCardLinkedPlacesItemSource];
  [v5 updateForPlaceCardItem:v4];

  id v8 = [(SearchPinsManager *)self placeCardLinkedPlacesItemSource];
  id v6 = [v8 featureID];
  uint64_t v7 = [(SearchPinsManager *)self mapView];
  [v7 _setSelectedFeatureID:v6];
}

- (void)clearLinkedPlacesAndPolygon
{
  double v3 = [(SearchPinsManager *)self placeCardLinkedPlacesItemSource];
  [v3 updateForPlaceCardItem:0];

  id v4 = [(SearchPinsManager *)self mapView];
  [v4 _setSelectedFeatureID:0];
}

- (POIShape)startPOIShapeIfLoaded
{
  return self->_startPOIShape;
}

- (NSArray)endPOIShapesIfLoaded
{
  double v3 = [(NSArray *)self->_endPins count];
  if (v3)
  {
    id v4 = [(NSArray *)self->_endPOIShapes count];
    if (v4 == (void *)[(NSArray *)self->_endPins count]) {
      endPOIShapes = self->_endPOIShapes;
    }
    else {
      endPOIShapes = 0;
    }
    double v3 = endPOIShapes;
  }

  return v3;
}

- (void)addPOIShapeLoadingObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109DFC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v9 = [(SearchPinsManager *)v6 performSelector:"accessibilityIdentifier"];
      unsigned int v10 = v9;
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
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding observer: %@", buf, 0x16u);
  }
  [(NSHashTable *)self->_poiShapeLoadingObservers addObject:v4];
}

- (void)removePOIShapeLoadingObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109DFC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v9 = [(SearchPinsManager *)v6 performSelector:"accessibilityIdentifier"];
      unsigned int v10 = v9;
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
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Removing observer: %@", buf, 0x16u);
  }
  [(NSHashTable *)self->_poiShapeLoadingObservers removeObject:v4];
}

- (void)_setStartPOIShape:(id)a3
{
  id v5 = (POIShape *)a3;
  if (self->_startPOIShape == v5) {
    goto LABEL_13;
  }
  id v6 = sub_100109DFC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    unsigned __int8 v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v10 = [(SearchPinsManager *)v7 performSelector:"accessibilityIdentifier"];
      uint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    *(_DWORD *)buf = 138543618;
    id v16 = v12;
    __int16 v17 = 2112;
    __int16 v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Setting start POI shape: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_startPOIShape, a3);
  uint64_t v13 = [(SearchPinsManager *)self endPOIShapesIfLoaded];
  __int16 v14 = (void *)v13;
  if (v5 && v13) {
    [(SearchPinsManager *)self _notifyDidLoadStartPOIShape:v5 endPOIShapes:v13];
  }

LABEL_13:
}

- (void)_setEndPOIShapes:(id)a3
{
  id v5 = a3;
  endPOIShapes = self->_endPOIShapes;
  unint64_t v7 = (unint64_t)v5;
  id v8 = endPOIShapes;
  if (!(v7 | (unint64_t)v8)) {
    goto LABEL_14;
  }
  unsigned __int8 v9 = v8;
  unsigned __int8 v10 = [(id)v7 isEqual:v8];

  if (v10) {
    goto LABEL_14;
  }
  uint64_t v11 = sub_100109DFC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = self;
    uint64_t v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      id v15 = [(SearchPinsManager *)v12 performSelector:"accessibilityIdentifier"];
      id v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        __int16 v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    __int16 v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

    *(_DWORD *)buf = 138543618;
    id v21 = v17;
    __int16 v22 = 2112;
    unint64_t v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Setting end POI shapes: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_endPOIShapes, a3);
  uint64_t v18 = [(SearchPinsManager *)self startPOIShapeIfLoaded];
  id v19 = (void *)v18;
  if (v7 && v18) {
    [(SearchPinsManager *)self _notifyDidLoadStartPOIShape:v18 endPOIShapes:v7];
  }

LABEL_14:
}

- (void)_notifyDidLoadStartPOIShape:(id)a3 endPOIShapes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  unsigned __int8 v10 = sub_100109DFC();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  uint64_t v11 = self;
  if (!v11)
  {
    id v16 = @"<nil>";
    goto LABEL_10;
  }
  id v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    __int16 v14 = [(SearchPinsManager *)v11 performSelector:"accessibilityIdentifier"];
    id v15 = v14;
    if (v14 && ![v14 isEqualToString:v13])
    {
      id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_8;
    }
  }
  id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

  id v8 = v6;
LABEL_10:

  *(_DWORD *)buf = 138543874;
  unsigned int v42 = v16;
  __int16 v43 = 2112;
  id v44 = v8;
  __int16 v45 = 2112;
  id v46 = v9;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Notifying start and end POI shapes have finished loading: %@, %@", buf, 0x20u);

LABEL_11:
  [(NSHashTable *)self->_poiShapeLoadingObservers allObjects];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v17) {
    goto LABEL_27;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v37;
  uint64_t v33 = *(void *)v37;
  do
  {
    id v20 = 0;
    id v34 = v18;
    do
    {
      if (*(void *)v37 != v19) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v20);
      __int16 v22 = sub_100109DFC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v23 = v9;
        id v24 = self;
        id v25 = (objc_class *)objc_opt_class();
        BOOL v26 = NSStringFromClass(v25);
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_21;
        }
        id v27 = self;
        uint64_t v28 = v8;
        id v29 = [(SearchPinsManager *)v24 performSelector:"accessibilityIdentifier"];
        id v30 = v29;
        if (v29 && ![v29 isEqualToString:v26])
        {
          id v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v30];

          id v8 = v28;
          self = v27;
        }
        else
        {

          id v8 = v28;
          self = v27;
LABEL_21:
          id v31 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
        }

        *(_DWORD *)buf = 138543618;
        unsigned int v42 = v31;
        __int16 v43 = 2112;
        id v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}@] Notifying observer %@", buf, 0x16u);

        id v9 = v23;
        uint64_t v19 = v33;
        id v18 = v34;
      }

      [v21 poiShapeLoader:self didLoadStartPOIShape:v8 endPOIShapes:v9];
      id v20 = (char *)v20 + 1;
    }
    while (v18 != v20);
    id v32 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    id v18 = v32;
  }
  while (v32);
LABEL_27:
}

- (void)_startLoadingNewStartPOIShape
{
  double v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will start loading POI shape for start pin", buf, 0xCu);
  }
  [(SearchPinsManager *)self _setStartPOIShape:0];
  unsigned __int8 v10 = [(SearchPinsManager *)self mapView];
  if (!v10)
  {
    uint64_t v11 = sub_100109DFC();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    uint64_t v13 = self;
    if (!v13)
    {
      id v18 = @"<nil>";
      goto LABEL_26;
    }
    __int16 v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      id v16 = [(SearchPinsManager *)v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        id v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_21;
      }
    }
    id v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_21:

LABEL_26:
    *(_DWORD *)buf = 138543362;
    id v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Map view is nil; will not load start POI shape",
      buf,
      0xCu);

    goto LABEL_27;
  }
  uint64_t v11 = [(SearchPinsManager *)self startPin];
  if ([v11 isDynamicCurrentLocation])
  {
    uint64_t v12 = +[POIShapeFactory userLocationPOIShapeWithMapView:v10];
LABEL_24:
    uint64_t v19 = (void *)v12;
    [(SearchPinsManager *)self _setStartPOIShape:v12];

    goto LABEL_27;
  }
  if (v11)
  {
    uint64_t v12 = +[POIShapeFactory searchResultWaypointPOIShapeWithMapView:v10 searchResult:v11];
    goto LABEL_24;
  }
LABEL_27:
}

- (void)_startLoadingNewEndPOIShapes
{
  double v3 = sub_100109DFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(SearchPinsManager *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    NSUInteger v10 = [(NSArray *)v4->_endPins count];
    *(_DWORD *)buf = 138543618;
    id v25 = v9;
    __int16 v26 = 2048;
    NSUInteger v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will start loading POI shape for %lu end pins", buf, 0x16u);
  }
  [(SearchPinsManager *)self _setEndPOIShapes:0];
  uint64_t v11 = [(SearchPinsManager *)self mapView];
  uint64_t v12 = v11;
  if (!v11)
  {
    id v15 = sub_100109DFC();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    id v16 = self;
    if (!v16)
    {
      id v21 = @"<nil>";
      goto LABEL_22;
    }
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = [(SearchPinsManager *)v16 performSelector:"accessibilityIdentifier"];
      id v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        id v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_20;
      }
    }
    id v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_20:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    id v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Map view is nil; will not load end POI shapes",
      buf,
      0xCu);

    goto LABEL_23;
  }
  endPins = self->_endPins;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009FA308;
  v22[3] = &unk_101313D48;
  id v23 = v11;
  __int16 v14 = sub_100099700(endPins, v22);
  [(SearchPinsManager *)self _setEndPOIShapes:v14];

  id v15 = v23;
LABEL_23:
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  if (self->_droppedPin) {
    [(SearchPinsManager *)self _updateDroppedPinVisibility];
  }
}

- (void)_updateDroppedPinVisibility
{
  if (self->_startPin) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(NSArray *)self->_endPins count] != 0;
  }
  if ([(SearchResultRepr *)self->_droppedPin hasFloorOrdinal]
    && ![(SearchPinsManager *)self _canDroppedPinBeVisibleInVenue])
  {
    droppedPinsItemSource = self->_droppedPinsItemSource;
    uint64_t v5 = 1;
    goto LABEL_11;
  }
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    droppedPinsItemSource = self->_droppedPinsItemSource;
    uint64_t v5 = 0;
LABEL_11:
    [(SearchResultsItemSource *)droppedPinsItemSource setShouldHideSearchResults:v5];
    return;
  }
  id v7 = [(SearchPinsManager *)self mapView];
  BOOL v6 = sub_1000BBB44(v7) != 5 && v3;
  [(SearchResultsItemSource *)self->_droppedPinsItemSource setShouldHideSearchResults:v6];
}

- (BOOL)_canDroppedPinBeVisibleInVenue
{
  [(SearchResult *)self->_droppedPin coordinate];
  double v4 = v3;
  [(SearchResult *)self->_droppedPin coordinate];
  double v6 = v5;
  id v7 = [(SearchPinsManager *)self mapView];
  id v8 = [v7 _mapLayer];
  id v9 = [v8 venueAtLocation:0 withMarginForError:v4, v6];

  NSUInteger v10 = [(SearchPinsManager *)self mapView];
  unsigned int v11 = [v10 displayedFloorOrdinalForBuildingsInVenue:v9];

  uint64_t v12 = [(SearchPinsManager *)self mapView];
  uint64_t v13 = [v12 venueWithFocus];
  id v14 = [v13 venueID];
  BOOL v15 = 0;
  if (v14 == [v9 venueID]) {
    BOOL v15 = [(SearchResultRepr *)self->_droppedPin floorOrdinal] == v11;
  }

  id v16 = [(SearchPinsManager *)self mapView];
  id v17 = [v16 venueWithFocus];
  if (v17)
  {
    id v18 = [(SearchPinsManager *)self mapView];
    uint64_t v19 = [v18 venueWithFocus];
    id v20 = [v19 venueID];
    BOOL v21 = v20 != [v9 venueID];
  }
  else
  {
    BOOL v21 = 1;
  }

  return v15 || v21;
}

- (SearchResultsDebugOverlay)searchResultsDebugOverlay
{
  searchResultsDebugOverlay = self->_searchResultsDebugOverlay;
  if (!searchResultsDebugOverlay)
  {
    double v4 = [SearchResultsDebugOverlay alloc];
    double v5 = [(SearchPinsManager *)self mapView];
    double v6 = [(SearchResultsDebugOverlay *)v4 initWithMapView:v5];
    id v7 = self->_searchResultsDebugOverlay;
    self->_searchResultsDebugOverlay = v6;

    searchResultsDebugOverlay = self->_searchResultsDebugOverlay;
  }

  return searchResultsDebugOverlay;
}

- (SearchResult)startPin
{
  return self->_startPin;
}

- (NSArray)endPins
{
  return self->_endPins;
}

- (SearchResult)droppedPin
{
  return self->_droppedPin;
}

- (BOOL)useAlternateDirectionsPins
{
  return self->_useAlternateDirectionsPins;
}

- (BOOL)hasAutoSelectedResult
{
  return self->_hasAutoSelectedResult;
}

- (SearchPinsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchPinsManagerDelegate *)WeakRetained;
}

- (MapCameraController)mapCameraController
{
  return self->_mapCameraController;
}

- (CustomPOIsController)customPOIsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);

  return (CustomPOIsController *)WeakRetained;
}

- (MapSelectionManager)mapSelectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapSelectionManager);

  return (MapSelectionManager *)WeakRetained;
}

- (VenuesManager)venuesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venuesManager);

  return (VenuesManager *)WeakRetained;
}

- (void)setSearchResultsDebugOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsDebugOverlay, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_mapSelectionManager);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_searchDotPlacesItemSource, 0);
  objc_storeStrong((id *)&self->_placeCardLinkedPlacesItemSource, 0);
  objc_storeStrong((id *)&self->_routeStartEndItemSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleSearchResultItemSource, 0);
  objc_storeStrong((id *)&self->_collectionPinsItemSource, 0);
  objc_storeStrong((id *)&self->_droppedPinsItemSource, 0);
  objc_storeStrong((id *)&self->_searchResultsItemSource, 0);
  objc_storeStrong((id *)&self->_droppedPin, 0);
  objc_storeStrong((id *)&self->_endPins, 0);
  objc_storeStrong((id *)&self->_startPin, 0);
  objc_storeStrong((id *)&self->_poiShapeLoadingObservers, 0);
  objc_storeStrong((id *)&self->_endPOIShapes, 0);
  objc_storeStrong((id *)&self->_startPOIShape, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_showSearchResultsAnimation, 0);

  objc_storeStrong((id *)&self->_hiddenStartPin, 0);
}

@end