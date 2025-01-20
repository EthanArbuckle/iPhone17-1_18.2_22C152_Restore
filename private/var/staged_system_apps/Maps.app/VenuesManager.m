@interface VenuesManager
- (ActionCoordination)actionCoordinator;
- (BOOL)hasSearchResultsInVenue:(id)a3;
- (BOOL)hasSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4;
- (BOOL)hasSearchResultsInVenue:(id)a3 matching:(id)a4;
- (BOOL)hasSearchResultsInVenueForAnyFloorOrdinal:(id)a3;
- (BOOL)isUserAtSameVenueAsCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)isUserAtSameVenueAsMapItem:(id)a3;
- (BOOL)isUserAtVenueWithID:(unint64_t)a3;
- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3;
- (MKMapView)mapView;
- (MapsUserLocationView)userLocationView;
- (NSDictionary)searchResultCountInVenue;
- (NSMutableDictionary)visitedVenues;
- (NSNumber)userLocationFloorOrdinal;
- (NSTimer)visitedVenuesEvictionTimer;
- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus;
- (VKVenueFeatureMarker)venueWithFocus;
- (VenueFloorCardViewController)floorCard;
- (VenueFloorViewControlling)venueFloorViewController;
- (VenuesManager)init;
- (VenuesManager)initWithActionCoordinator:(id)a3 mapView:(id)a4 userLocationView:(id)a5;
- (VenuesStack)venueCardStack;
- (id)_userVenueMarker;
- (id)searchResultCountInVenueWithViewController:(id)a3;
- (id)sortedFloorOrdinalsForVenue:(id)a3;
- (id)userLocationFloorOrdinalInVenue:(id)a3;
- (id)venue:(id)a3 buildingWithId:(unint64_t)a4;
- (id)venueFeatureMarkerAtCoordinate:(CLLocationCoordinate2D)a3;
- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3;
- (signed)firstAbovegroundFloorOrdinalForVenue:(id)a3;
- (signed)floorOrdinalWithFocus;
- (signed)pendingDisplayFloorForSelectionFloorOrdinal;
- (unint64_t)pendingDisplayFloorForSelectionVenueID;
- (unint64_t)searchVenueIdentifier;
- (void)_containerWillPresentContainee:(id)a3;
- (void)addChangeObserver:(id)a3;
- (void)dismissLastPlaceCardViewControllerIfNecessary;
- (void)displayFloorForCurrentOrPendingSelection;
- (void)displayFloorForPendingSelection;
- (void)displayFloorForSelectedLabelMarker:(id)a3;
- (void)displayFloorForSelectedSearchResult:(id)a3;
- (void)displayUserLocationFloorOrdinalIfNeededWithVenue:(id)a3 asNewlyFocusedVenue:(BOOL)a4;
- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 forDisplayingLabelMarker:(id)a5;
- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 resultsForDeterminingRegion:(id *)a5 forDisplayingResults:(id)a6 fromSearch:(id)a7;
- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5;
- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)notifyChangeObservers;
- (void)presentPlaceCardForVenueWithFocusAndAddToHistory:(BOOL)a3 source:(unint64_t)a4 centeringOnVenue:(BOOL)a5;
- (void)recordVenueVisitWithIdentifier:(id)a3;
- (void)removeChangeObserver:(id)a3;
- (void)scheduleEviction;
- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4;
- (void)setFloorCard:(id)a3;
- (void)setPendingDisplayFloorForSelectionFloorOrdinal:(signed __int16)a3;
- (void)setPendingDisplayFloorForSelectionVenueID:(unint64_t)a3;
- (void)setPendingValuesAndDisplayVenueID:(id)a3 floorOrdinal:(signed __int16)a4;
- (void)setSearchResultCountInVenue:(id)a3;
- (void)setSearchVenueIdentifier:(unint64_t)a3;
- (void)setUserLocationView:(id)a3;
- (void)setVenueCardStack:(id)a3;
- (void)setVenueFloorViewController:(id)a3;
- (void)setVisitedVenuesEvictionTimer:(id)a3;
- (void)updateDimmingOutsideVenue;
- (void)updateFocusedVenueFloor;
- (void)updateSearchResultCountFromCurrentViewController;
- (void)updateSearchResultCountFromViewController:(id)a3;
- (void)updateUserLocation;
- (void)venueFloorViewControllerStateDidChange;
- (void)visitedVenuesEvictionTimerFired:(id)a3;
@end

@implementation VenuesManager

- (id)searchResultCountInVenueWithViewController:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___VenuesControlCoordinating]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v3 searchResultCountInVenue];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateSearchResultCountFromViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(VenuesManager *)self floorCard];

  v5 = v7;
  if (v4 != v7)
  {
    v6 = [(VenuesManager *)self searchResultCountInVenueWithViewController:v7];
    [(VenuesManager *)self setSearchResultCountInVenue:v6];

    v5 = v7;
  }
}

- (void)_containerWillPresentContainee:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"ContainerContainee"];

  uint64_t v6 = [(VenuesManager *)self venueFloorViewController];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(VenuesManager *)self floorCard];

    if (v5 != v8)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B2FBA8;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  id v9 = [(NSDictionary *)self->_searchResultCountInVenue copy];
  [(VenuesManager *)self updateSearchResultCountFromViewController:v5];
  v10 = [(VenuesManager *)self floorCard];

  if (v5 != v10)
  {
    v11 = [(VenuesManager *)self searchResultCountInVenueWithViewController:v5];
    if (!+[NSDictionary dictionary:v9 isEqualToDictionary:v11])[(VenuesManager *)self updateFocusedVenueFloor]; {
  }
    }
}

- (VenuesManager)initWithActionCoordinator:(id)a3 mapView:(id)a4 userLocationView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VenuesManager;
  v11 = [(VenuesManager *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_actionCoordinator, v8);
    objc_storeWeak((id *)&v12->_mapView, v9);
    objc_storeWeak((id *)&v12->_userLocationView, v10);
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    visitedVenues = v12->_visitedVenues;
    v12->_visitedVenues = v13;

    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    changeObservers = v12->_changeObservers;
    v12->_changeObservers = (NSHashTable *)v15;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v12 selector:"_containerWillPresentContainee:" name:@"ContainerWillPresentContaineeNotification" object:0];
  }
  return v12;
}

- (void)addChangeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    unsigned __int8 v5 = [(NSHashTable *)self->_changeObservers containsObject:v4];
    id v4 = v6;
    if ((v5 & 1) == 0)
    {
      [(NSHashTable *)self->_changeObservers addObject:v6];
      id v4 = v6;
    }
  }
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  [(VenuesManager *)self updateUserLocation];
  id v5 = [(VenuesManager *)self venueWithFocus];
  [(VenuesManager *)self displayUserLocationFloorOrdinalIfNeededWithVenue:v5 asNewlyFocusedVenue:0];
}

- (void)updateUserLocation
{
  id v9 = [(VenuesManager *)self userLocationFloorOrdinal];
  id v3 = [(VenuesManager *)self venueFloorViewController];
  [v3 setUserLocationFloorOrdinal:v9];

  id v4 = [(VenuesManager *)self floorCard];
  [v4 userLocationDidChange];

  id v5 = [(VenuesManager *)self venueWithFocus];
  BOOL v6 = 0;
  if (v5 && v9)
  {
    unsigned int v7 = [(VenuesManager *)self displayedFloorOrdinalForBuildingsInVenue:v5];
    BOOL v6 = v7 != [v9 shortValue];
  }
  id v8 = [(VenuesManager *)self userLocationView];
  [v8 _setIsOnAnotherFloorInVenue:v6];
}

- (VenueFloorViewControlling)venueFloorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venueFloorViewController);

  return (VenueFloorViewControlling *)WeakRetained;
}

- (MapsUserLocationView)userLocationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);

  return (MapsUserLocationView *)WeakRetained;
}

- (NSNumber)userLocationFloorOrdinal
{
  id v3 = [(VenuesManager *)self mapView];
  id v4 = [v3 userLocation];
  id v5 = [(VenuesManager *)self venueWithFocus];
  BOOL v6 = [(VenuesManager *)self mapView];
  unsigned int v7 = [v4 floorOrdinalInVenue:v5 forMapView:v6];

  return (NSNumber *)v7;
}

- (VKVenueFeatureMarker)venueWithFocus
{
  v2 = [(VenuesManager *)self mapView];
  id v3 = [v2 venueWithFocus];

  return (VKVenueFeatureMarker *)v3;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (VenueFloorCardViewController)floorCard
{
  return self->_floorCard;
}

- (void)displayUserLocationFloorOrdinalIfNeededWithVenue:(id)a3 asNewlyFocusedVenue:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  BOOL v6 = [(VenuesManager *)self mapView];
  id v7 = [v6 userTrackingMode];

  if (v7 || v4)
  {
    if (!v4
      || ([(VenuesManager *)self mapView],
          id v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 displayedFloorIsDefaultForBuildingsInVenue:v15],
          v8,
          v9))
    {
      id v10 = [(VenuesManager *)self userLocationFloorOrdinalInVenue:v15];
      v11 = v10;
      if (v10)
      {
        unsigned int v12 = [v10 shortValue];
        v13 = [(VenuesManager *)self mapView];
        unsigned int v14 = [v13 displayedFloorOrdinalForBuildingsInVenue:v15];

        if (v12 != v14) {
          -[VenuesManager setDisplayedFloorOrdinal:forBuildingsInVenue:](self, "setDisplayedFloorOrdinal:forBuildingsInVenue:", [v11 shortValue], v15);
        }
      }
    }
  }
}

- (void)setSearchResultCountInVenue:(id)a3
{
  id v7 = a3;
  if (!+[NSDictionary dictionary:isEqualToDictionary:](NSDictionary, "dictionary:isEqualToDictionary:", self->_searchResultCountInVenue))
  {
    BOOL v4 = (NSDictionary *)[v7 copy];
    searchResultCountInVenue = self->_searchResultCountInVenue;
    self->_searchResultCountInVenue = v4;

    BOOL v6 = [(VenuesManager *)self venueFloorViewController];
    [v6 didChangeSearchResultsInVenue];
  }
}

- (VenuesManager)init
{
  return 0;
}

- (void)removeChangeObserver:(id)a3
{
}

- (void)notifyChangeObservers
{
  id v3 = [(VenuesManager *)self venueWithFocus];
  BOOL v4 = [(VenuesManager *)self venueBuildingWithFocus];
  uint64_t v5 = [(VenuesManager *)self floorOrdinalWithFocus];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSHashTable *)self->_changeObservers copy];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) didChangeFocusedVenue:v3 focusedBuilding:v4 displayedFloorOrdinal:v5];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)scheduleEviction
{
  id v3 = [(VenuesManager *)self visitedVenuesEvictionTimer];
  unsigned __int8 v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"visitedVenuesEvictionTimerFired:" selector:0 userInfo:0 repeats:86400.0];
    [(VenuesManager *)self setVisitedVenuesEvictionTimer:v5];

    id v6 = [(VenuesManager *)self visitedVenuesEvictionTimer];
    [v6 setTolerance:8640.0];
  }
}

- (void)recordVenueVisitWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSDate date];
  id v6 = [(VenuesManager *)self visitedVenues];
  [v6 setObject:v5 forKeyedSubscript:v4];

  [(VenuesManager *)self scheduleEviction];
}

- (void)visitedVenuesEvictionTimerFired:(id)a3
{
  id v4 = [(VenuesManager *)self visitedVenues];
  uint64_t v5 = [v4 keysOfEntriesPassingTest:&stru_101318608];

  if ([v5 count])
  {
    id v6 = [(VenuesManager *)self visitedVenues];
    id v7 = [v5 allObjects];
    [v6 removeObjectsForKeys:v7];
  }
  id v8 = [(VenuesManager *)self visitedVenues];
  id v9 = [v8 count];

  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B2DB20;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus
{
  v2 = [(VenuesManager *)self mapView];
  id v3 = [v2 venueBuildingWithFocus];

  return (VKVenueBuildingFeatureMarker *)v3;
}

- (signed)floorOrdinalWithFocus
{
  v2 = self;
  id v3 = [(VenuesManager *)self venueWithFocus];
  LOWORD(v2) = [(VenuesManager *)v2 displayedFloorOrdinalForBuildingsInVenue:v3];

  return (__int16)v2;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(VenuesManager *)self mapView];
  [v7 setDisplayedFloorOrdinal:v4 forBuildingsInVenue:v6];
}

- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VenuesManager *)self mapView];
  signed __int16 v6 = (unsigned __int16)[v5 displayedFloorOrdinalForBuildingsInVenue:v4];

  return v6;
}

- (id)venueFeatureMarkerAtCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v5 = [(VenuesManager *)self mapView];
  signed __int16 v6 = [v5 _mapLayer];
  id v7 = [v6 venueAtLocation:0 withMarginForError:latitude longitude];

  return v7;
}

- (BOOL)isUserAtSameVenueAsMapItem:(id)a3
{
  id v4 = [a3 _venueInfo];
  uint64_t v5 = [v4 venueIdentifier];
  LOBYTE(self) = -[VenuesManager isUserAtVenueWithID:](self, "isUserAtVenueWithID:", [v5 venueID]);

  return (char)self;
}

- (BOOL)isUserAtSameVenueAsCoordinate:(CLLocationCoordinate2D)a3
{
  id v3 = self;
  id v4 = -[VenuesManager venueFeatureMarkerAtCoordinate:](self, "venueFeatureMarkerAtCoordinate:", a3.latitude, a3.longitude);
  LOBYTE(v3) = -[VenuesManager isUserAtVenueWithID:](v3, "isUserAtVenueWithID:", [v4 venueID]);

  return (char)v3;
}

- (BOOL)isUserAtVenueWithID:(unint64_t)a3
{
  id v3 = (id)a3;
  if (a3)
  {
    id v4 = [(VenuesManager *)self _userVenueMarker];
    LOBYTE(v3) = [v4 venueID] == v3;
  }
  return (char)v3;
}

- (id)_userVenueMarker
{
  id v3 = +[MKLocationManager sharedLocationManager];
  id v4 = [v3 lastGoodLocation];

  if (v4
    || (+[MKLocationManager sharedLocationManager],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isAuthorizedForPreciseLocation],
        v5,
        v6))
  {
    [v4 coordinate];
    id v7 = -[VenuesManager venueFeatureMarkerAtCoordinate:](self, "venueFeatureMarkerAtCoordinate:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)userLocationFloorOrdinalInVenue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VenuesManager *)self userLocationFloorOrdinal];
  if (v5)
  {
    unsigned int v6 = [(VenuesManager *)self mapView];
    id v7 = [v6 userLocation];
    [v7 coordinate];

    id v8 = [(VenuesManager *)self mapView];
    id v9 = [v8 _mapLayer];
    VKLocationCoordinate2DMake();
    id v10 = [v9 venueAtLocation:];

    id v11 = [v10 venueID];
    if (v11 == [v4 venueID]) {
      long long v12 = v5;
    }
    else {
      long long v12 = 0;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)hasSearchResultsInVenue:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned int (**)(id, void *))a4;
  if (v6)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [(VenuesManager *)self searchResultCountInVenue];
    id v9 = (void *)v8;
    id v10 = &__NSArray0__struct;
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      v23 = self;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v17 = [v16 venueID];
          if (v17 == [v6 venueID])
          {
            if (v7[2](v7, v16))
            {
              v18 = [(VenuesManager *)v23 searchResultCountInVenue];
              objc_super v19 = [v18 objectForKeyedSubscript:v16];
              unsigned int v20 = [v19 shortValue];

              if (v20)
              {
                BOOL v21 = 1;
                goto LABEL_17;
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v21 = 0;
LABEL_17:
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)hasSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B2E1D8;
  v5[3] = &unk_101318628;
  signed __int16 v6 = a4;
  return [(VenuesManager *)self hasSearchResultsInVenue:a3 matching:v5];
}

- (BOOL)hasSearchResultsInVenueForAnyFloorOrdinal:(id)a3
{
  return [(VenuesManager *)self hasSearchResultsInVenue:a3 matching:&stru_101318668];
}

- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 resultsForDeterminingRegion:(id *)a5 forDisplayingResults:(id)a6 fromSearch:(id)a7
{
  id v11 = a6;
  id v12 = [a7 venueCategoryItem];
  id v13 = [v12 venueIdentifier];

  if (v13 && [v13 venueID])
  {
    uint64_t v14 = [(VenuesManager *)self mapView];
    uint64_t v15 = [v14 venueWithID:[v13 venueID]];

    v69 = (void *)v15;
    if (v15)
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v16 = [v13 componentIdentifiers];
      id v17 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v17)
      {
        id v18 = v17;
        objc_super v19 = a3;
        uint64_t v20 = *(void *)v77;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v77 != v20) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if ([v22 _hasBuildingID])
            {
              uint64_t v23 = -[VenuesManager venue:buildingWithId:](self, "venue:buildingWithId:", v69, [v22 buildingID]);
              if (v23)
              {
                uint64_t v24 = v23;
                goto LABEL_17;
              }
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
          if (v18) {
            continue;
          }
          break;
        }
        uint64_t v24 = 0;
LABEL_17:
        a3 = v19;
      }
      else
      {
        uint64_t v24 = 0;
      }

      int v25 = 1;
      uint64_t v15 = v24;
    }
    else
    {
      int v25 = 0;
      v69 = 0;
    }
  }
  else
  {
    int v25 = 0;
    v69 = 0;
    uint64_t v15 = 0;
  }
  v71 = [(VenuesManager *)self venueWithFocus];
  uint64_t v26 = [(VenuesManager *)self venueBuildingWithFocus];
  v65 = self;
  v66 = (void *)v26;
  v67 = (void *)v15;
  if (v15)
  {
    long long v27 = [(VenuesManager *)self mapView];
    [v27 zoomToFocusVenueBuilding:v15];
LABEL_24:
    double v29 = v28;
    int v30 = 0;
LABEL_25:
    v31 = v71;
    goto LABEL_26;
  }
  if (v25)
  {
    long long v27 = [(VenuesManager *)self mapView];
    [v27 zoomToFocusVenue:v69];
    goto LABEL_24;
  }
  if (v26)
  {
    uint64_t v49 = v26;
    long long v27 = [(VenuesManager *)self mapView];
    [v27 zoomToFocusVenueBuilding:v49];
    double v29 = v50;
    int v30 = 1;
    goto LABEL_25;
  }
  v31 = v71;
  if (!v71)
  {
    *a3 = 0;
    *a4 = 0;
    goto LABEL_51;
  }
  long long v27 = [(VenuesManager *)self mapView];
  [v27 zoomToFocusVenue:v71];
  double v29 = v51;
  int v30 = 1;
LABEL_26:

  if (v29 <= 0.0)
  {
    *a3 = 0;
    *a4 = 0;
    if (v30) {
      goto LABEL_35;
    }
    goto LABEL_51;
  }
  id v32 = +[NSNumber numberWithDouble:v29];
  *a3 = v32;

  v33 = [(VenuesManager *)self mapView];
  [v33 _zoomLevel];
  if (v34 < v29)
  {

    goto LABEL_34;
  }

  if (!v71)
  {
LABEL_34:
    *a4 = 0;
    v31 = v71;
    if (v30) {
      goto LABEL_35;
    }
LABEL_51:
    v48 = a5;
    *a5 = [v11 copy];
    if (!v31) {
      goto LABEL_58;
    }
    goto LABEL_52;
  }
  v35 = [(VenuesManager *)self mapView];
  [v35 _zoomLevel];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v31 = v71;
  if (!v30) {
    goto LABEL_51;
  }
LABEL_35:
  v63 = a3;
  v60 = a4;
  v61 = v13;
  id v70 = (id)objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v62 = v11;
  id v36 = v11;
  id v37 = [v36 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v73;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v73 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
        v42 = [v41 mapItem];
        v43 = [v42 _venueInfo];
        v44 = [v43 venueIdentifier];
        id v45 = [v44 venueID];
        id v46 = [v71 venueID];

        if (v45 == v46) {
          [v70 addObject:v41];
        }
      }
      id v38 = [v36 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v38);
  }

  id v47 = v70;
  v48 = a5;
  *a5 = v47;

  id v13 = v61;
  id v11 = v62;
  a4 = v60;
  a3 = v63;
  v31 = v71;
  if (v71)
  {
LABEL_52:
    if ([*v48 count] == (id)1)
    {
      v52 = [*v48 firstObject];
      v53 = [v52 mapItem];
      if ([v53 _venueFeatureType] == (id)4)
      {
        v64 = a3;
        v54 = [v52 mapItem];
        v55 = [v54 _venueInfo];
        v56 = [v55 venueIdentifier];
        id v57 = [v56 venueID];
        id v58 = [v71 venueID];

        if (v57 == v58)
        {
          v59 = [(VenuesManager *)v65 mapView];
          [v59 _zoomLevel];
          +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          id *v64 = (id)objc_claimAutoreleasedReturnValue();

          *a4 = *v64;
        }
      }
      else
      {
      }
      v31 = v71;
    }
  }
LABEL_58:
}

- (void)getMinZoom:(id *)a3 maxZoom:(id *)a4 forDisplayingLabelMarker:(id)a5
{
  id v15 = a5;
  uint64_t v8 = [(VenuesManager *)self venueWithFocus];
  id v9 = [(VenuesManager *)self venueBuildingWithFocus];
  if ([v15 venueID] && (id v10 = objc_msgSend(v15, "venueID"), v10 == objc_msgSend(v8, "venueID")))
  {
    if ([v15 venueLevelID])
    {
      id v11 = [(VenuesManager *)self mapView];
      [v11 _zoomLevel];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = *a3;
    }
    else
    {
      if ([v15 venueBuildingID]
        && (id v13 = [v15 venueBuildingID], v13 == objc_msgSend(v9, "buildingId")))
      {
        uint64_t v14 = [(VenuesManager *)self mapView];
        [v14 zoomToFocusVenueBuilding:v9];
      }
      else
      {
        uint64_t v14 = [(VenuesManager *)self mapView];
        [v14 zoomToFocusVenue:v8];
      }
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
    *a3 = 0;
  }
  *a4 = v12;
}

- (BOOL)hasSearchResultsInVenue:(id)a3
{
  return [(VenuesManager *)self hasSearchResultsInVenue:a3 matching:&stru_101318688];
}

- (void)setVenueFloorViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venueFloorViewController);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    changeObservers = self->_changeObservers;
    id v7 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
    LODWORD(changeObservers) = [(NSHashTable *)changeObservers containsObject:v7];

    if (changeObservers)
    {
      uint64_t v8 = self->_changeObservers;
      id v9 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
      [(NSHashTable *)v8 removeObject:v9];
    }
    objc_storeWeak((id *)&self->_venueFloorViewController, obj);
    id v10 = [(VenuesManager *)self userLocationFloorOrdinal];
    [obj setUserLocationFloorOrdinal:v10];

    id v11 = objc_loadWeakRetained((id *)&self->_venueFloorViewController);
    [(VenuesManager *)self addChangeObserver:v11];

    [(VenuesManager *)self updateSearchResultCountFromCurrentViewController];
    [(VenuesManager *)self updateFocusedVenueFloor];
    [(VenuesManager *)self venueFloorViewControllerStateDidChange];
    uint64_t v5 = obj;
  }
}

- (void)setVenueCardStack:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venueCardStack);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_venueCardStack);
    [v5 removeStackObserver:self];

    id v6 = objc_storeWeak((id *)&self->_venueCardStack, obj);
    [obj addStackObserver:self];

    [(VenuesManager *)self updateDimmingOutsideVenue];
  }
}

- (void)displayFloorForSelectedSearchResult:(id)a3
{
  id v4 = [a3 mapItem];
  id v5 = [v4 _venueInfo];

  if (v5
    && ([v5 venueIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 _hasVenueID],
        v6,
        v7))
  {
    uint64_t v8 = [v5 venueIdentifier];
    id v9 = [v8 venueID];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = [v5 venueIdentifier];
    id v11 = [v10 componentIdentifiers];

    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v16 = [v15 floorInfo];

          if (v16)
          {
            id v17 = [v15 floorInfo];
            id v12 = [v17 ordinal];

            goto LABEL_14;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_14:
  }
  else
  {
    id v12 = 0;
    id v9 = 0;
  }
  [(VenuesManager *)self setPendingDisplayFloorForSelectionVenueID:v9];
  [(VenuesManager *)self setPendingDisplayFloorForSelectionFloorOrdinal:v12];
  [(VenuesManager *)self displayFloorForPendingSelection];
}

- (void)displayFloorForSelectedLabelMarker:(id)a3
{
  id v16 = a3;
  id v4 = [v16 featureAnnotation];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation];

  if (v5)
  {
    id v6 = [v16 featureAnnotation];
    unsigned int v7 = [v6 searchResult];
    BOOL v8 = [v7 type] == 3;
  }
  else
  {
    BOOL v8 = 0;
  }
  if ([v16 hasVenueLookInsideFloorOrdinal])
  {
    id v9 = [v16 venueLookInsideFloorOrdinal];
LABEL_11:
    [(VenuesManager *)self setPendingValuesAndDisplayVenueID:v16 floorOrdinal:v9];
    goto LABEL_12;
  }
  if ([v16 venueLevelID]) {
    char v10 = 1;
  }
  else {
    char v10 = v8;
  }
  if (v10)
  {
    id v9 = [v16 venueFloorOrdinal];
    goto LABEL_11;
  }
  if ([v16 venueID])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    id v12 = [WeakRetained venueWithID:[v16 venueID]];

    uint64_t v13 = [v12 mapIdentifier];
    if (v13)
    {
      [(VenuesManager *)self recordVenueVisitWithIdentifier:v13];
      uint64_t v14 = [(VenuesManager *)self mapView];
      id v15 = [v14 defaultFloorForBuildingsInVenue:v12];

      [(VenuesManager *)self setPendingValuesAndDisplayVenueID:v16 floorOrdinal:v15];
    }
  }
LABEL_12:
}

- (void)setPendingValuesAndDisplayVenueID:(id)a3 floorOrdinal:(signed __int16)a4
{
  uint64_t v4 = a4;
  -[VenuesManager setPendingDisplayFloorForSelectionVenueID:](self, "setPendingDisplayFloorForSelectionVenueID:", [a3 venueID]);
  [(VenuesManager *)self setPendingDisplayFloorForSelectionFloorOrdinal:v4];

  [(VenuesManager *)self displayFloorForPendingSelection];
}

- (void)displayFloorForCurrentOrPendingSelection
{
  id v3 = [(VenuesManager *)self actionCoordinator];
  uint64_t v4 = [v3 mapSelectionManager];
  id v5 = [v4 labelMarker];

  if (v5) {
    [(VenuesManager *)self displayFloorForSelectedLabelMarker:v5];
  }
  else {
    [(VenuesManager *)self displayFloorForPendingSelection];
  }
}

- (void)displayFloorForPendingSelection
{
  if ([(VenuesManager *)self pendingDisplayFloorForSelectionVenueID])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained venueWithID:[self pendingDisplayFloorForSelectionVenueID]];
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4) {
      [(VenuesManager *)self setDisplayedFloorOrdinal:[(VenuesManager *)self pendingDisplayFloorForSelectionFloorOrdinal] forBuildingsInVenue:v4];
    }
  }
}

- (void)presentPlaceCardForVenueWithFocusAndAddToHistory:(BOOL)a3 source:(unint64_t)a4 centeringOnVenue:(BOOL)a5
{
  id v9 = [(VenuesManager *)self venueWithFocus];
  char v10 = v9;
  if (v9)
  {
    id v11 = [v9 mapIdentifier];
    if (v11)
    {
      id v12 = [objc_alloc((Class)MKMapItemIdentifier) initWithGEOMapItemIdentifier:v11];
      uint64_t v13 = +[MKMapService sharedService];
      id v21 = v12;
      uint64_t v14 = +[NSArray arrayWithObjects:&v21 count:1];
      id v15 = [v13 ticketForIdentifiers:v14 traits:0];

      objc_initWeak(&location, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100B2F288;
      v16[3] = &unk_1013186B0;
      objc_copyWeak(v17, &location);
      BOOL v18 = a5;
      BOOL v19 = a3;
      v17[1] = (id)a4;
      [v15 submitWithHandler:v16 networkActivity:0];
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v6 = [(VenuesManager *)self venueWithFocus];
  [(VenuesManager *)self displayUserLocationFloorOrdinalIfNeededWithVenue:v6 asNewlyFocusedVenue:0];
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v4 = [(VenuesManager *)self venueFloorViewController];
  unsigned int v5 = [v4 isOpen];

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B2F4A4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v5 ^ 1;
}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = v9;
  if (v8)
  {
    [(VenuesManager *)self displayUserLocationFloorOrdinalIfNeededWithVenue:v8 asNewlyFocusedVenue:1];
    [(VenuesManager *)self updateFocusedVenueFloor];
    [(VenuesManager *)self displayFloorForCurrentOrPendingSelection];
  }
  else if (!v9)
  {
    [(VenuesManager *)self setSearchVenueIdentifier:0];
    uint64_t v13 = +[GEOAPSharedStateData sharedData];
    [v13 setVenueExperienceShown:0];
    uint64_t v14 = 1057;
    goto LABEL_7;
  }
  id v11 = +[GEOAPSharedStateData sharedData];
  unsigned __int8 v12 = [v11 venueExperienceShown];

  if (v12) {
    goto LABEL_8;
  }
  uint64_t v13 = +[GEOAPSharedStateData sharedData];
  [v13 setVenueExperienceShown:1];
  uint64_t v14 = 1056;
LABEL_7:

  +[GEOAPPortal captureUserAction:v14 target:0 value:0];
LABEL_8:
  [(VenuesManager *)self updateUserLocation];
  id v15 = [(VenuesManager *)self mapView];
  unsigned int v16 = [v15 displayedFloorIsDefaultForBuildingsInVenue:v8];

  if (v16)
  {
    id v17 = [(VenuesManager *)self venueWithFocus];

    unsigned int v18 = [(VenuesManager *)self floorOrdinalWithFocus];
    if (v17)
    {
      id v19 = [(VenuesManager *)self searchVenueIdentifier];
      long long v20 = [(VenuesManager *)self venueWithFocus];
      BOOL v21 = v19 == [v20 venueID];
    }
    else
    {
      BOOL v21 = 1;
    }
    v22 = [v8 mapIdentifier];
    uint64_t v23 = [(VenuesManager *)self visitedVenues];
    uint64_t v24 = [v23 objectForKeyedSubscript:v22];

    if ((v18 & 0x80000000) == 0 || v21 || v24) {
      uint64_t v25 = [(VenuesManager *)self displayedFloorOrdinalForBuildingsInVenue:v8];
    }
    else {
      uint64_t v25 = [(VenuesManager *)self firstAbovegroundFloorOrdinalForVenue:v8];
    }
    [(VenuesManager *)self setDisplayedFloorOrdinal:v25 forBuildingsInVenue:v8];
  }
  [(VenuesManager *)self updateDimmingOutsideVenue];
  [(VenuesManager *)self notifyChangeObservers];
}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  id v6 = a5;
  [(VenuesManager *)self notifyChangeObservers];
  [(VenuesManager *)self updateUserLocation];
  unint64_t v7 = [(VenuesManager *)self pendingDisplayFloorForSelectionVenueID];
  id v8 = [v6 venueID];

  if ((id)v7 == v8) {
    [(VenuesManager *)self setPendingDisplayFloorForSelectionVenueID:0];
  }
  [(VenuesManager *)self dismissLastPlaceCardViewControllerIfNecessary];

  [(VenuesManager *)self updateDimmingOutsideVenue];
}

- (id)venue:(id)a3 buildingWithId:(unint64_t)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [a3 buildings];
  id v6 = (void *)v5;
  unint64_t v7 = &__NSArray0__struct;
  if (v5) {
    unint64_t v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 buildingId] == (id)a4)
        {
          id v14 = v13;
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (void)updateFocusedVenueFloor
{
  v2 = self;
  id v3 = [(VenuesManager *)self venueWithFocus];
  if (v3)
  {
    id v4 = (id)[(VenuesManager *)v2 displayedFloorOrdinalForBuildingsInVenue:v3];
    if ([(VenuesManager *)v2 hasSearchResultsInVenueForAnyFloorOrdinal:v3])
    {
      if (!-[VenuesManager hasSearchResultsInVenue:forFloorOrdinal:](v2, "hasSearchResultsInVenue:forFloorOrdinal:", v3, v4)|| (-[VenuesManager mapView](v2, "mapView"), v5 = objc_claimAutoreleasedReturnValue(), unsigned int v6 = [v5 displayedFloorIsDefaultForBuildingsInVenue:v3], v5, v6))
      {
        unint64_t v7 = [(VenuesManager *)v2 userLocationFloorOrdinalInVenue:v3];
        id v8 = v7;
        if (v7
          && -[VenuesManager hasSearchResultsInVenue:forFloorOrdinal:](v2, "hasSearchResultsInVenue:forFloorOrdinal:", v3, [v7 shortValue]))
        {
          signed __int16 v27 = (unsigned __int16)[v8 shortValue];
        }
        else
        {
          uint64_t v25 = v8;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id obj = [(VenuesManager *)v2 searchResultCountInVenue];
          id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v9)
          {
            id v10 = v9;
            id v11 = 0;
            uint64_t v12 = *(void *)v30;
            int v26 = (int)v4;
            signed __int16 v27 = (__int16)v4;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v30 != v12) {
                  objc_enumerationMutation(obj);
                }
                id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                id v15 = [v14 venueID];
                if (v15 == [v3 venueID])
                {
                  long long v16 = [v14 floorOrdinal];

                  if (v16)
                  {
                    [(VenuesManager *)v2 searchResultCountInVenue];
                    v18 = long long v17 = v2;
                    long long v19 = [v18 objectForKeyedSubscript:v14];
                    id v20 = [v19 unsignedIntegerValue];

                    v2 = v17;
                    BOOL v21 = [v14 floorOrdinal];
                    unsigned int v22 = [v21 shortValue];

                    if (v20 > v11) {
                      goto LABEL_22;
                    }
                    if (v20 == v11)
                    {
                      unsigned int v23 = v22 - v26;
                      if ((int)(v22 - v26) < 0) {
                        unsigned int v23 = v26 - v22;
                      }
                      int v24 = v27 - v26;
                      if (v24 < 0) {
                        int v24 = v26 - v27;
                      }
                      if (v23 < v24)
                      {
LABEL_22:
                        signed __int16 v27 = v22;
                        id v11 = v20;
                      }
                    }
                  }
                }
              }
              id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
            }
            while (v10);
          }
          else
          {
            signed __int16 v27 = (__int16)v4;
          }

          id v8 = v25;
        }
        [(VenuesManager *)v2 setDisplayedFloorOrdinal:v27 forBuildingsInVenue:v3];
      }
    }
  }
}

- (void)updateSearchResultCountFromCurrentViewController
{
  id v4 = [(VenuesManager *)self actionCoordinator];
  id v3 = [v4 currentViewController];
  [(VenuesManager *)self updateSearchResultCountFromViewController:v3];
}

- (void)venueFloorViewControllerStateDidChange
{
  id v3 = [(VenuesManager *)self venueFloorViewController];
  if (![v3 isOpen]) {
    goto LABEL_4;
  }
  id v4 = [(VenuesManager *)self venueFloorViewController];
  if ([v4 isHidden])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  if (v9 == (id)5)
  {
LABEL_5:
    uint64_t v5 = [(VenuesManager *)self floorCard];

    if (v5)
    {
      unsigned int v6 = [(VenuesManager *)self actionCoordinator];
      unint64_t v7 = [(VenuesManager *)self floorCard];
      [v6 viewControllerGoPreviousState:v7 withSender:0];

      [(VenuesManager *)self setFloorCard:0];
    }
    goto LABEL_7;
  }
  id v10 = [(VenuesManager *)self floorCard];

  if (!v10)
  {
    id v11 = [[VenueFloorCardViewController alloc] initWithVenuesManager:self];
    [(VenuesManager *)self addChangeObserver:v11];
    uint64_t v12 = [(VenuesManager *)self actionCoordinator];
    [(ControlContaineeViewController *)v11 setDelegate:v12];

    [(VenuesManager *)self setFloorCard:v11];
    uint64_t v13 = [(VenuesManager *)self actionCoordinator];
    [v13 viewController:0 presentVenueFloorCardViewController:v11];
  }
LABEL_7:

  [(VenuesManager *)self updateDimmingOutsideVenue];
}

- (void)updateDimmingOutsideVenue
{
  if (GEOConfigGetBOOL())
  {
    id v3 = [(VenuesManager *)self venueWithFocus];

    BOOL v5 = [(VenuesManager *)self floorOrdinalWithFocus] < 0 && v3 != 0;
    id v6 = [(VenuesManager *)self mapView];
    [v6 setDimmingOutsideVenueWithFocus:v5];
  }
}

- (void)dismissLastPlaceCardViewControllerIfNecessary
{
  id v3 = [(VenuesManager *)self actionCoordinator];
  id v4 = [v3 mapSelectionManager];
  id v10 = [v4 labelMarker];

  if ([v10 venueLevelID])
  {
    unsigned int v5 = [v10 venueFloorOrdinal];
    if (v5 != [(VenuesManager *)self floorOrdinalWithFocus])
    {
      id v6 = [v10 venueID];
      unint64_t v7 = [(VenuesManager *)self venueWithFocus];
      id v8 = [v7 venueID];

      if (v6 == v8)
      {
        id v9 = [(VenuesManager *)self actionCoordinator];
        [v9 dismissLastVenuePlaceCard];
      }
    }
  }
}

- (id)sortedFloorOrdinalsForVenue:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v5 = [v3 buildings];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) floorOrdinals];
        [v4 addObjectsFromArray:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = [v4 allObjects];
  uint64_t v12 = [v11 sortedArrayUsingSelector:"compare:"];
  uint64_t v13 = [v12 reverseObjectEnumerator];
  id v14 = [v13 allObjects];

  return v14;
}

- (signed)firstAbovegroundFloorOrdinalForVenue:(id)a3
{
  id v4 = a3;
  signed __int16 v5 = [(VenuesManager *)self floorOrdinalWithFocus];
  [(VenuesManager *)self sortedFloorOrdinalsForVenue:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "shortValue", (void)v13) & 0x80000000) != 0) {
        break;
      }
      signed __int16 v5 = (unsigned __int16)[v11 shortValue];
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (VenuesStack)venueCardStack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venueCardStack);

  return (VenuesStack *)WeakRetained;
}

- (void)setUserLocationView:(id)a3
{
}

- (void)setFloorCard:(id)a3
{
}

- (NSDictionary)searchResultCountInVenue
{
  return self->_searchResultCountInVenue;
}

- (unint64_t)pendingDisplayFloorForSelectionVenueID
{
  return self->_pendingDisplayFloorForSelectionVenueID;
}

- (void)setPendingDisplayFloorForSelectionVenueID:(unint64_t)a3
{
  self->_pendingDisplayFloorForSelectionVenueID = a3;
}

- (signed)pendingDisplayFloorForSelectionFloorOrdinal
{
  return self->_pendingDisplayFloorForSelectionFloorOrdinal;
}

- (void)setPendingDisplayFloorForSelectionFloorOrdinal:(signed __int16)a3
{
  self->_pendingDisplayFloorForSelectionFloorOrdinal = a3;
}

- (unint64_t)searchVenueIdentifier
{
  return self->_searchVenueIdentifier;
}

- (void)setSearchVenueIdentifier:(unint64_t)a3
{
  self->_searchVenueIdentifier = a3;
}

- (NSTimer)visitedVenuesEvictionTimer
{
  return self->_visitedVenuesEvictionTimer;
}

- (void)setVisitedVenuesEvictionTimer:(id)a3
{
}

- (NSMutableDictionary)visitedVenues
{
  return self->_visitedVenues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedVenues, 0);
  objc_storeStrong((id *)&self->_visitedVenuesEvictionTimer, 0);
  objc_storeStrong((id *)&self->_searchResultCountInVenue, 0);
  objc_storeStrong((id *)&self->_floorCard, 0);
  objc_destroyWeak((id *)&self->_userLocationView);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_venueCardStack);
  objc_destroyWeak((id *)&self->_venueFloorViewController);
  objc_destroyWeak((id *)&self->_actionCoordinator);

  objc_storeStrong((id *)&self->_changeObservers, 0);
}

@end