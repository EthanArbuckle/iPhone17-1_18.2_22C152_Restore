@interface TransitDirectionsStepsListDataProvider
- (BOOL)hasBuiltItems;
- (BOOL)hasIncidentItems;
- (GEOComposedRoute)composedRoute;
- (GEOComposedRoute)route;
- (NSArray)items;
- (NSArray)segmentRanges;
- (TransitDirectionsStepsListDataProvider)initWithRoute:(id)a3 forGuidance:(BOOL)a4;
- (id)_artworksForIntraSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5;
- (id)_boardingInfoItemForStep:(id)a3;
- (id)_destinationItem;
- (id)_destinationTitle;
- (id)_enterItemForStep:(id)a3 passStop:(id)a4 previouslySkippedPassStops:(id)a5;
- (id)_exitItemForAlightStep:(id)a3;
- (id)_fareAndOperatingHoursItemForBlockTransferStep:(id)a3 lineColor:(id)a4 alternateLineColor:(id)a5 parentItem:(id)a6;
- (id)_imageForInterSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5 dimmedOrigin:(BOOL)a6;
- (id)_incidentItemWithIncidentMessage:(id)a3;
- (id)_itemAtIndexPath:(id)a3 currentPosition:(unint64_t)a4 inItems:(id)a5 includingHiddenSubitems:(BOOL)a6;
- (id)_itemAtIndexPath:(id)a3 includingHiddenSubitems:(BOOL)a4;
- (id)_mergeTransitRoutingIncidentsForSteps:(id)a3;
- (id)_nextLeaveStopStepAfterStep:(id)a3;
- (id)_nextStepAfterStep:(id)a3 withManeuvers:(id)a4 beforeManeuvers:(id)a5;
- (id)_nextStepWithManeuver:(int)a3 beforeManeuver:(int)a4;
- (id)_nextTransferStepBeforeBoarding;
- (id)_originItem;
- (id)_originTitle;
- (id)_passStopSubItemForSteps:(id)a3 boardStep:(id)a4 previousPassStop:(id)a5 currentRideDuration:(unsigned int)a6 fromLineColor:(id)a7 toLineColor:(id)a8;
- (id)_previousStepBeforeStep:(id)a3 withManeuvers:(id)a4 afterManeuver:(int)a5;
- (id)_titleForWaypoint:(id)a3;
- (id)_transitTripAlightItem;
- (id)_transitTripBoardItem;
- (id)_walkingItemForWalkingSegment:(id)a3 toBoardStep:(id)a4;
- (id)indexPathForItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (unint64_t)_startRangeIndexForAlightItem:(id)a3;
- (unint64_t)indexForItem:(id)a3 inSection:(unint64_t)a4;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3 includingHiddenSubitems:(BOOL)a4;
- (unint64_t)numberOfSections;
- (void)_appendItem:(id)a3 toArray:(id)a4;
- (void)_buildItems;
- (void)_consumeTransitTripSegment;
- (void)_consumeWalkingSegment;
- (void)_debugPrintHierarchy;
- (void)_incrementStep;
- (void)_insertItem:(id)a3 atIndex:(unint64_t)a4 inArray:(id)a5;
- (void)_populateAccessPointArtworkForItem:(id)a3 fromStep:(id)a4;
- (void)_populateAccessPointArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4;
- (void)_populateStationArtworkForItem:(id)a3 fromStep:(id)a4;
- (void)_populateStationArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4;
- (void)_updateCurrentStepToIndex:(unint64_t)a3;
@end

@implementation TransitDirectionsStepsListDataProvider

- (TransitDirectionsStepsListDataProvider)initWithRoute:(id)a3 forGuidance:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsStepsListDataProvider;
  v7 = [(TransitDirectionsStepsListDataProvider *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_route, v6);
    v8->_forGuidance = a4;
  }

  return v8;
}

- (BOOL)hasBuiltItems
{
  return self->_mutableItems != 0;
}

- (NSArray)items
{
  mutableItems = self->_mutableItems;
  if (!mutableItems)
  {
    [(TransitDirectionsStepsListDataProvider *)self _buildItems];
    mutableItems = self->_mutableItems;
  }

  return (NSArray *)mutableItems;
}

- (unint64_t)numberOfSections
{
  v2 = [(TransitDirectionsStepsListDataProvider *)self items];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return [(TransitDirectionsStepsListDataProvider *)self numberOfItemsInSection:a3 includingHiddenSubitems:0];
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3 includingHiddenSubitems:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(TransitDirectionsStepsListDataProvider *)self items];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a3) {
    return 0;
  }
  v9 = [(TransitDirectionsStepsListDataProvider *)self items];
  objc_super v10 = [v9 objectAtIndexedSubscript:a3];

  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])
  {
    id v11 = [v10 numberOfSubItemsWithForceExpand:v4];
  }
  else
  {
    v13 = [v10 subItems];
    id v11 = [v13 count];
  }
  unint64_t v12 = (unint64_t)v11 + 1;

  return v12;
}

- (id)itemAtIndexPath:(id)a3
{
  return [(TransitDirectionsStepsListDataProvider *)self _itemAtIndexPath:a3 includingHiddenSubitems:0];
}

- (id)_itemAtIndexPath:(id)a3 includingHiddenSubitems:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(TransitDirectionsStepsListDataProvider *)self items];
  id v8 = [(TransitDirectionsStepsListDataProvider *)self _itemAtIndexPath:v6 currentPosition:0 inItems:v7 includingHiddenSubitems:v4];

  return v8;
}

- (id)_itemAtIndexPath:(id)a3 currentPosition:(unint64_t)a4 inItems:(id)a5 includingHiddenSubitems:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if ((unint64_t)[v10 length] <= a4
    || (id v12 = [v10 indexAtPosition:a4], v12 >= objc_msgSend(v11, "count")))
  {
    id v14 = 0;
  }
  else
  {
    v13 = [v11 objectAtIndexedSubscript:v12];
    if ((char *)[v10 length] - 1 == (unsigned char *)a4)
    {
      id v14 = v13;
    }
    else
    {
      v15 = +[NSMutableArray arrayWithObject:v13];
      if ([v13 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]) {
        [v13 subItemsWithForceExpand:v6];
      }
      else {
      v16 = [v13 subItems];
      }
      [v15 addObjectsFromArray:v16];

      id v14 = [(TransitDirectionsStepsListDataProvider *)self _itemAtIndexPath:v10 currentPosition:a4 + 1 inItems:v15 includingHiddenSubitems:v6];
    }
  }

  return v14;
}

- (id)indexPathForItem:(id)a3
{
  id v4 = a3;
  if ([(TransitDirectionsStepsListDataProvider *)self numberOfSections])
  {
    uint64_t v5 = 0;
    while (1)
    {
      BOOL v6 = +[NSIndexPath indexPathForRow:0 inSection:v5];
      uint64_t v7 = [(TransitDirectionsStepsListDataProvider *)self itemAtIndexPath:v6];
      if ((id)v7 == v4) {
        break;
      }
      id v8 = (void *)v7;
      uint64_t v9 = [(TransitDirectionsStepsListDataProvider *)self numberOfItemsInSection:v5];
      if (v9 < 2)
      {
        id v13 = v8;
      }
      else
      {
        uint64_t v10 = v9;
        uint64_t v11 = 1;
        while (1)
        {
          id v12 = +[NSIndexPath indexPathForRow:v11 inSection:v5];
          id v13 = [(TransitDirectionsStepsListDataProvider *)self itemAtIndexPath:v12];

          if (v13 == v4) {
            break;
          }
          ++v11;
          id v8 = v13;
          if (v10 == v11) {
            goto LABEL_11;
          }
        }
        id v13 = v4;
        if (v6) {
          goto LABEL_14;
        }
      }
LABEL_11:

      if (++v5 >= [(TransitDirectionsStepsListDataProvider *)self numberOfSections]) {
        goto LABEL_12;
      }
    }
    id v14 = v6;
LABEL_14:
  }
  else
  {
LABEL_12:
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)indexForItem:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  id v8 = [(TransitDirectionsStepsListDataProvider *)self itemAtIndexPath:v7];

  if (v8 == v6)
  {
    unint64_t v14 = 0;
LABEL_9:
    id v8 = v6;
    goto LABEL_10;
  }
  uint64_t v9 = [(TransitDirectionsStepsListDataProvider *)self numberOfItemsInSection:a4];
  if (v9 >= 2)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 1;
    while (1)
    {
      id v12 = v8;
      id v13 = +[NSIndexPath indexPathForRow:v11 inSection:a4];
      id v8 = [(TransitDirectionsStepsListDataProvider *)self itemAtIndexPath:v13];

      if (v8 == v6) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_6;
      }
    }
    v15 = +[NSIndexPath indexPathForRow:v11 inSection:a4];
    unint64_t v14 = (unint64_t)[v15 row];

    goto LABEL_9;
  }
LABEL_6:
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v14;
}

- (void)_buildItems
{
  id v3 = [(TransitDirectionsStepsListDataProvider *)self route];
  id v4 = sub_10066ABFC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 origin];
    id v6 = [v5 navDisplayName];
    uint64_t v7 = [v3 destination];
    id v8 = [v7 navDisplayName];
    *(_DWORD *)buf = 138478339;
    unint64_t v30 = (unint64_t)v6;
    __int16 v31 = 2113;
    v32 = v8;
    __int16 v33 = 2048;
    id v34 = [v3 stepsCount];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Start building items for route \"%{private}@ → %{private}@\", %lu steps", buf, 0x20u);
  }
  v28 = v3;

  uint64_t v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mutableItems = self->_mutableItems;
  self->_mutableItems = v9;

  uint64_t v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mutableSegmentRanges = self->_mutableSegmentRanges;
  self->_mutableSegmentRanges = v11;

  self->_hasIncidentItems = 0;
  self->_unint64_t stepIdx = 0;
  self->_segmentRangeLocation = 0;
  self->_segmentRangeLength = 0;
  id v13 = [(TransitDirectionsStepsListDataProvider *)self _originItem];
  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v13 toArray:self->_mutableItems];
  unint64_t v14 = self->_mutableSegmentRanges;
  v15 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1);
  [(NSMutableArray *)v14 addObject:v15];

  ++self->_segmentRangeLocation;
  [(TransitDirectionsStepsListDataProvider *)self _updateCurrentStepToIndex:self->_stepIdx];
  if (self->_currentStep)
  {
    location = (id *)&self->_prefixStepForNextBoardItem;
    while (1)
    {
      unint64_t stepIdx = self->_stepIdx;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = self->_currentStep;
        switch([(GEOComposedRouteStep *)v18 maneuver])
        {
          case 0u:
          case 1u:
          case 2u:
          case 4u:
          case 5u:
          case 8u:
          case 9u:
          case 0xAu:
            goto LABEL_18;
          case 3u:
            [(TransitDirectionsStepsListDataProvider *)self _consumeTransitTripSegment];
            prefixStepForNextBoardItem = self->_prefixStepForNextBoardItem;
            self->_prefixStepForNextBoardItem = 0;

            break;
          case 6u:
          case 7u:
            objc_storeStrong(location, self->_currentStep);
            goto LABEL_18;
          default:
            goto LABEL_20;
        }
        goto LABEL_20;
      }
      [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
LABEL_21:
      if (stepIdx == self->_stepIdx)
      {
        [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
        v22 = sub_10066ABFC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v30 = stepIdx;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "stepIdx had to be manually incremented from %lu", buf, 0xCu);
        }
      }
      if (!self->_currentStep) {
        goto LABEL_28;
      }
    }
    v17 = [(GEOComposedRouteStep *)self->_currentStep getPreviousStep];
    v18 = [v17 transitStep];

    v19 = [(GEOComposedRouteStep *)self->_currentStep transitStep];
    if ([v19 maneuverType] == 10)
    {
      if ([(GEOComposedRouteStep *)v18 maneuverType] == 7)
      {

        goto LABEL_15;
      }
      unsigned int v20 = [(GEOComposedRouteStep *)v18 maneuverType];

      if (v20 == 5)
      {
LABEL_15:
        v21 = sub_10066ABFC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Skipping over Walking/Arrival step since it follows GOTO_STOP or ALIGHT", buf, 2u);
        }

LABEL_18:
        [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
        goto LABEL_20;
      }
    }
    else
    {
    }
    [(TransitDirectionsStepsListDataProvider *)self _consumeWalkingSegment];
LABEL_20:

    goto LABEL_21;
  }
LABEL_28:
  v24 = [(TransitDirectionsStepsListDataProvider *)self _destinationItem];
  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v24 toArray:self->_mutableItems];
  v25 = self->_mutableSegmentRanges;
  v26 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1);
  [(NSMutableArray *)v25 addObject:v26];

  [(TransitDirectionsStepsListDataProvider *)self _debugPrintHierarchy];
}

- (void)_debugPrintHierarchy
{
  id v3 = sub_10066ABFC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_mutableItems, "count")];
    mutableItems = self->_mutableItems;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10066B0B0;
    v9[3] = &unk_1012F3890;
    uint64_t v11 = &stru_1012F3840;
    id v7 = v5;
    id v10 = v7;
    [(NSMutableArray *)mutableItems enumerateObjectsUsingBlock:v9];
    id v8 = sub_10066ABFC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Finished building items: %@", buf, 0xCu);
    }
  }
}

- (void)_incrementStep
{
}

- (void)_insertItem:(id)a3 atIndex:(unint64_t)a4 inArray:(id)a5
{
  id v14 = a3;
  id v8 = (NSMutableArray *)a5;
  id v9 = [(NSMutableArray *)v8 count];
  unint64_t v10 = (unint64_t)v9;
  if ((unint64_t)v9 >= a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = (unint64_t)v9;
  }
  if (v14 && v8)
  {
    if (self->_mutableItems == v8)
    {
      if (v11)
      {
        id v12 = [(NSMutableArray *)v8 objectAtIndexedSubscript:v11 - 1];
        [v12 setNextItem:v14];
        [v14 setPreviousItem:v12];
      }
      if (v10 > a4)
      {
        id v13 = [(NSMutableArray *)v8 objectAtIndexedSubscript:v11];
        [v14 setNextItem:v13];
        [v13 setPreviousItem:v14];
      }
    }
    [(NSMutableArray *)v8 insertObject:v14 atIndex:v11];
  }
}

- (void)_appendItem:(id)a3 toArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[TransitDirectionsStepsListDataProvider _insertItem:atIndex:inArray:](self, "_insertItem:atIndex:inArray:", v7, [v6 count], v6);
}

- (void)_updateCurrentStepToIndex:(unint64_t)a3
{
  self->_unint64_t stepIdx = a3;
  id v5 = [(TransitDirectionsStepsListDataProvider *)self route];
  id v6 = [v5 steps];
  if ((unint64_t)[v6 count] <= a3)
  {
    currentStep = self->_currentStep;
    p_currentStep = &self->_currentStep;
    id v7 = currentStep;
    *p_currentStep = 0;
  }
  else
  {
    id v7 = [(TransitDirectionsStepsListDataProvider *)self route];
    id v8 = [v7 steps];
    uint64_t v9 = [v8 objectAtIndexedSubscript:self->_stepIdx];
    unint64_t v11 = self->_currentStep;
    p_currentStep = &self->_currentStep;
    *p_currentStep = (GEOComposedRouteStep *)v9;
  }
  id v13 = *p_currentStep;
  id v14 = sub_10066ABFC();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      v16 = *p_currentStep;
      int v20 = 138412290;
      v21 = v16;
      v17 = "-> %@";
      v18 = v14;
      uint32_t v19 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v20, v19);
    }
  }
  else if (v15)
  {
    LOWORD(v20) = 0;
    v17 = "End of route";
    v18 = v14;
    uint32_t v19 = 2;
    goto LABEL_9;
  }
}

- (id)_originItem
{
  id v3 = [(TransitDirectionsStepsListDataProvider *)self route];
  BOOL v4 = [v3 origin];
  id v5 = [v4 mkMapItem];
  id v6 = +[MKSystemController sharedInstance];
  [v6 screenScale];
  id v7 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v5, 3, 1);

  id v8 = [[TransitDirectionsListImageItem alloc] initWithImage:v7 instructions:0];
  [(TransitDirectionsListItem *)v8 setType:0];
  uint64_t v9 = +[NSBundle mainBundle];
  unint64_t v10 = [v9 localizedStringForKey:@"Start [Transit List View]" value:@"localized string not found" table:0];

  id v11 = [objc_alloc((Class)GEOComposedString) initWithString:v10];
  id v24 = v11;
  id v12 = +[NSArray arrayWithObjects:&v24 count:1];
  [(TransitDirectionsListItem *)v8 setMajorFormattedStrings:v12];

  id v13 = objc_alloc((Class)GEOComposedString);
  id v14 = [(TransitDirectionsStepsListDataProvider *)self _originTitle];
  id v15 = [v13 initWithString:v14];

  if (v15)
  {
    id v23 = v15;
    v16 = +[NSArray arrayWithObjects:&v23 count:1];
    [(TransitDirectionsListItem *)v8 setMinorFormattedStrings:v16];
  }
  v17 = [(TransitDirectionsStepsListDataProvider *)self route];
  v18 = [v17 steps];
  uint32_t v19 = [v18 firstObject];

  if (v19)
  {
    v22 = v19;
    int v20 = +[NSArray arrayWithObjects:&v22 count:1];
    [(TransitDirectionsListItem *)v8 setComposedRouteStepsDisplayedOnMap:v20];
  }

  return v8;
}

- (id)_originTitle
{
  id v3 = [(TransitDirectionsStepsListDataProvider *)self route];
  BOOL v4 = [v3 _maps_directionsWaypoints];
  id v5 = [v4 firstObject];
  id v6 = [(TransitDirectionsStepsListDataProvider *)self _titleForWaypoint:v5];

  return v6;
}

- (id)_destinationItem
{
  id v3 = [(TransitDirectionsStepsListDataProvider *)self route];
  BOOL v4 = [v3 destination];
  id v5 = [v4 mkMapItem];
  id v6 = +[MKSystemController sharedInstance];
  [v6 screenScale];
  id v7 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v5, 3, 1);

  id v8 = [[TransitDirectionsListImageItem alloc] initWithImage:v7 instructions:0];
  [(TransitDirectionsListItem *)v8 setType:1];
  uint64_t v9 = +[NSBundle mainBundle];
  unint64_t v10 = [v9 localizedStringForKey:@"Arrive [Transit List View]" value:@"localized string not found" table:0];

  id v11 = [objc_alloc((Class)GEOComposedString) initWithString:v10];
  id v24 = v11;
  id v12 = +[NSArray arrayWithObjects:&v24 count:1];
  [(TransitDirectionsListItem *)v8 setMajorFormattedStrings:v12];

  id v13 = objc_alloc((Class)GEOComposedString);
  id v14 = [(TransitDirectionsStepsListDataProvider *)self _destinationTitle];
  id v15 = [v13 initWithString:v14];

  if (v15)
  {
    id v23 = v15;
    v16 = +[NSArray arrayWithObjects:&v23 count:1];
    [(TransitDirectionsListItem *)v8 setMinorFormattedStrings:v16];
  }
  v17 = [(TransitDirectionsStepsListDataProvider *)self route];
  v18 = [v17 steps];
  uint32_t v19 = [v18 lastObject];

  if (v19)
  {
    v22 = v19;
    int v20 = +[NSArray arrayWithObjects:&v22 count:1];
    [(TransitDirectionsListItem *)v8 setComposedRouteSteps:v20];
  }

  return v8;
}

- (id)_destinationTitle
{
  id v3 = [(TransitDirectionsStepsListDataProvider *)self route];
  BOOL v4 = [v3 _maps_directionsWaypoints];
  id v5 = [v4 lastObject];
  id v6 = [(TransitDirectionsStepsListDataProvider *)self _titleForWaypoint:v5];

  return v6;
}

- (id)_titleForWaypoint:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 responseSearch];
  id v5 = [v4 singleLineAddress];

  id v6 = [v3 responseSearch];
  id v7 = [v6 mapItem];
  if ([v7 _hasTransitDisplayName])
  {
  }
  else
  {
    id v8 = [v5 length];

    if (v8)
    {
      id v9 = v5;
      goto LABEL_6;
    }
  }
  unint64_t v10 = [v3 responseSearch];
  id v9 = [v10 title];

LABEL_6:

  return v9;
}

- (void)_consumeTransitTripSegment
{
  id v3 = sub_10066ABFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[TransitDirectionsStepsListDataProvider _consumeTransitTripSegment]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  BOOL v4 = self->_currentStep;
  id v5 = [(TransitDirectionsStepsListDataProvider *)self _transitTripBoardItem];
  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v5 toArray:self->_mutableItems];
  id v6 = [(TransitDirectionsStepsListDataProvider *)self _transitTripAlightItem];
  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v6 toArray:self->_mutableItems];
}

- (id)_transitTripBoardItem
{
  id v3 = self->_currentStep;
  BOOL v4 = sub_10066ABFC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "- creating BOARD item for trip", buf, 2u);
  }

  id v5 = [(GEOComposedRouteStep *)v3 routeDetailsPrimaryArtwork];
  uint64_t v6 = [v5 firstObject];

  v47 = +[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v3, +[TransitDirectionsListItem defaultInstructionContextForItemType:2 forGuidance:self->_forGuidance]);
  v48 = (void *)v6;
  int v7 = [[TransitDirectionsListArtworkItem alloc] initWithArtwork:v6 instructions:v47];
  id v8 = [(GEOComposedRouteStep *)v3 transitStep];
  id v9 = [v8 badges];
  id v10 = [v9 copy];
  [(TransitDirectionsListItem *)v7 setBadges:v10];

  [(TransitDirectionsListItem *)v7 setType:2];
  if (!self->_currentLineColor)
  {
    id v11 = [(GEOComposedRouteStep *)v3 transitLine];
    id v12 = +[UIColor _mapkit_colorForTransitLine:v11];
    currentLineColor = self->_currentLineColor;
    self->_currentLineColor = v12;
  }
  id v14 = v7;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  v16 = +[NSMutableArray array];
  v17 = v16;
  if (v3) {
    [v16 addObject:v3];
  }
  v49 = v3;
  v46 = v17;
  [(TransitDirectionsStepsListDataProvider *)self _mergeTransitRoutingIncidentsForSteps:v17];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v52;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v23 = [v22 routingMessage];
        id v24 = [v23 length];

        if (v24)
        {
          self->_hasIncidentItems = 1;
          v25 = [(TransitDirectionsStepsListDataProvider *)self _incidentItemWithIncidentMessage:v22];
          v26 = sub_10066ABFC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v27 = [v22 routingMessage];
            *(_DWORD *)buf = 138477827;
            v57 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "- adding merged incidents item: \"%{private}@\"", buf, 0xCu);
          }
          [v25 setParentItem:v14];
          [(TransitDirectionsStepsListDataProvider *)self _appendItem:v25 toArray:v15];
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v19);
  }
  v28 = [(TransitDirectionsStepsListDataProvider *)self _boardingInfoItemForStep:v49];
  v29 = v14;
  if (v28)
  {
    unint64_t v30 = sub_10066ABFC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "- adding boarding info item for trip", buf, 2u);
    }

    [v28 setParentItem:v14];
    [(TransitDirectionsStepsListDataProvider *)self _appendItem:v28 toArray:v15];
  }
  __int16 v31 = [(GEOComposedRouteStep *)v49 tripSegment];
  id v32 = [v31 rideOptionsCount];

  if ((unint64_t)v32 >= 2)
  {
    __int16 v33 = sub_10066ABFC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "- adding clustered rides item", buf, 2u);
    }

    id v34 = [TransitDirectionsListClusteredVehicleItem alloc];
    v35 = [(GEOComposedRouteStep *)v49 tripSegment];
    v36 = [(TransitDirectionsListClusteredVehicleItem *)v34 initWithClusteredRouteSegment:v35];

    [(TransitDirectionsStepsListDataProvider *)self _appendItem:v36 toArray:v15];
    ++self->_segmentRangeLength;
  }
  id v37 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v38 = self->_prefixStepForNextBoardItem;
  v39 = [(GEOComposedRouteStep *)v38 transitStep];
  id v40 = [v39 maneuverType];

  if (v38 && (v40 & 0xFFFFFFFE) == 6)
  {
    v41 = sub_10066ABFC();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      if (v40 == 6)
      {
        v42 = @"TRANSFER_STOP_TO_STOP";
      }
      else if (v40 == 7)
      {
        v42 = @"GOTO_STOP";
      }
      else
      {
        v42 = +[NSString stringWithFormat:@"(unknown: %i)", v40];
      }
      *(_DWORD *)buf = 138412290;
      v57 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "- including previous %@", buf, 0xCu);
    }
    [v37 addObject:v38];
  }
  [v37 addObject:v49];
  id v43 = [v37 copy];
  [(TransitDirectionsListItem *)v29 setComposedRouteSteps:v43];

  v55 = v49;
  v44 = +[NSArray arrayWithObjects:&v55 count:1];
  [(TransitDirectionsListItem *)v29 setComposedRouteStepsDisplayedOnMap:v44];

  [(TransitDirectionsListItem *)v29 setPostTertiaryItems:v15];

  return v29;
}

- (id)_transitTripAlightItem
{
  v118 = self->_currentStep;
  id v3 = sub_10066ABFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "- creating TRIP item for trip", buf, 2u);
  }

  id v117 = objc_alloc_init((Class)NSMutableArray);
  id v121 = objc_alloc_init((Class)NSMutableArray);
  id v110 = objc_alloc_init((Class)NSMutableArray);
  currentStep = self->_currentStep;
  id v5 = +[NSSet setWithObject:&off_1013A8038];
  uint64_t v6 = [(TransitDirectionsStepsListDataProvider *)self _nextStepAfterStep:currentStep withManeuvers:v5 beforeManeuvers:0];

  int v7 = [[TransitDirectionsListItemTransitTrip alloc] initWithTripStep:v6];
  [(TransitDirectionsListItem *)v7 setType:3];
  location = (id *)&self->_currentLineColor;
  if (!self->_currentLineColor)
  {
    id v8 = [(__CFString *)v6 transitLine];
    uint64_t v9 = +[UIColor _mapkit_colorForTransitLine:v8];
    id v10 = *location;
    id *location = (id)v9;
  }
  v115 = v6;
  v120 = v7;
  [(TransitDirectionsListItemTransitTrip *)v7 setExpanded:0];
  [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
  id v11 = self->_currentStep;
  if (v11)
  {
    id v12 = v11;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [(GEOComposedRouteStep *)v12 maneuver] != 4) {
        break;
      }
      id v13 = [(GEOComposedRouteStep *)v12 transitVehicle];
      id v14 = (__CFString *)v12;
      unsigned int v15 = [v13 pickupDropoffType];

      v116 = (GEOComposedRouteStep *)v14;
      if (v15 != 100) {
        goto LABEL_15;
      }
      v16 = sub_10066ABFC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v145 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "- skipping pre-ENTER pass stop: %@", buf, 0xCu);
      }

      [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
      v17 = self->_currentStep;

      id v12 = v17;
    }
    while (v12);
    v116 = v12;
  }
  else
  {
    v116 = 0;
  }
LABEL_15:
  LODWORD(v18) = 0;
  v123 = 0;
  v114 = 0;
  do
  {
    id v19 = self->_currentStep;
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472;
    v139[2] = sub_10066D42C;
    v139[3] = &unk_1012F38B8;
    v139[4] = self;
    v130 = v120;
    v140 = v130;
    id v129 = v121;
    id v141 = v129;
    uint64_t v20 = objc_retainBlock(v139);
    v21 = (uint64_t (**)(void, GEOComposedRouteStep *))v20;
    if ([(GEOComposedRouteStep *)v19 maneuver] == 9)
    {
      int v22 = ((uint64_t (*)(void *, GEOComposedRouteStep *))v20[2])(v20, v19);
      id v23 = [(GEOComposedRouteStep *)v19 transitLine];
      uint64_t v24 = +[UIColor _mapkit_colorForTransitLine:v23];
      id v25 = *location;
      id *location = (id)v24;
    }
    else
    {
      int v22 = 0;
    }
    if ([(GEOComposedRouteStep *)v19 maneuver] != 4 && v22 == 0)
    {
      int v53 = 0;
      goto LABEL_80;
    }
    v27 = [(GEOComposedRouteStep *)v19 transitLine];
    id obj = +[UIColor _mapkit_colorForTransitLine:v27];

    unsigned int v28 = [(GEOComposedRouteStep *)v19 duration];
    id v29 = [objc_alloc((Class)NSMutableArray) initWithObjects:v19, 0];
    id v126 = 0;
    if (!v123) {
      id v126 = objc_alloc_init((Class)NSMutableArray);
    }
    id v127 = v29;
    uint64_t v18 = v28 + v18;
    uint64_t v30 = [(GEOComposedRouteStep *)self->_currentStep getNextStep];
    if (!v30)
    {
LABEL_52:
      id v40 = 0;
      goto LABEL_58;
    }
    __int16 v31 = (void *)v30;
    while (1)
    {
      id v32 = v31;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v32 maneuver] == 4)
      {
        __int16 v33 = [v32 transitVehicle];
        unsigned int v34 = [v33 pickupDropoffType];

        if (v34 == 100) {
          goto LABEL_41;
        }
      }
      else
      {
      }
      id v35 = v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v35 maneuver] == 9)
      {
        v36 = [v35 originStop];
        id v37 = [v36 muid];
        v38 = [v35 destinationStop];
        id v39 = [v38 muid];

        if (v37 == v39) {
          goto LABEL_41;
        }
      }
      else
      {
      }
      id v40 = (__CFString *)v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = v40;
        goto LABEL_56;
      }
      unsigned int v41 = [(__CFString *)v40 maneuver];

      if (v41 != 9) {
        goto LABEL_57;
      }
      v42 = [(__CFString *)v40 originStop];
      id v43 = [v42 muid];
      v44 = [(__CFString *)v40 destinationStop];
      if (v43 == [v44 muid]) {
        break;
      }
      v45 = [(__CFString *)v40 transitVehicle];
      unsigned int v46 = [v45 pickupDropoffType];

      if (v46 != 100) {
        goto LABEL_58;
      }
LABEL_41:
      id v47 = v32;

      unsigned int v48 = [v47 duration];
      id v19 = (GEOComposedRouteStep *)v47;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v49 = [(GEOComposedRouteStep *)v19 maneuver];

        if (v49 == 9 && (v21[2](v21, v19) & 1) != 0) {
          goto LABEL_49;
        }
      }
      else
      {
      }
      v50 = v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [(GEOComposedRouteStep *)v50 maneuver] != 4)
      {

        goto LABEL_51;
      }
      long long v51 = [(GEOComposedRouteStep *)v50 transitVehicle];
      unsigned int v52 = [v51 pickupDropoffType];

      if (v52 == 100)
      {
LABEL_49:
        [v127 addObject:v19];
        [v126 addObject:v19];
      }
LABEL_51:
      uint64_t v18 = v48 + v18;
      [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
      __int16 v31 = [(GEOComposedRouteStep *)self->_currentStep getNextStep];

      if (!v31) {
        goto LABEL_52;
      }
    }

LABEL_56:
LABEL_57:

LABEL_58:
    if (v123)
    {
      long long v54 = sub_10066ABFC();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)[v127 count] <= 1) {
          CFStringRef v55 = @" ";
        }
        else {
          CFStringRef v55 = @"\n-| ";
        }
        id v56 = [v127 count];
        if ((unint64_t)v56 >= 2)
        {
          v112 = [v127 valueForKey:@"description"];
          uint64_t v57 = [v112 componentsJoinedByString:@"\n-| "];
          v111 = (void *)v57;
          v58 = v113;
        }
        else
        {
          uint64_t v57 = [v127 firstObject];
          v58 = (void *)v57;
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v145 = v55;
        __int16 v146 = 2112;
        uint64_t v147 = v57;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "- adding PASS_STOP item for:%@%@", buf, 0x16u);
        v64 = v58;
        if ((unint64_t)v56 >= 2)
        {

          v64 = v112;
        }
        v113 = v58;
      }
      v65 = [v117 lastObject];
      v59 = [v65 composedRouteSteps];

      v66 = [v59 firstObject];
      v60 = [(TransitDirectionsStepsListDataProvider *)self _passStopSubItemForSteps:v127 boardStep:v118 previousPassStop:v66 currentRideDuration:v18 fromLineColor:self->_currentLineColor toLineColor:obj];

      [(__CFString *)v60 setParentItem:v130];
      [(TransitDirectionsStepsListDataProvider *)self _appendItem:v60 toArray:v117];
      objc_storeStrong(location, obj);
    }
    else
    {
      v59 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A8050, &off_1013A8068, &off_1013A8080, 0);
      v60 = [(TransitDirectionsStepsListDataProvider *)self _previousStepBeforeStep:v118 withManeuvers:v59 afterManeuver:1];
      v61 = sub_10066ABFC();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v145 = v60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "- creating ENTER item for boarding step: %@", buf, 0xCu);
      }

      v62 = [v127 firstObject];
      v63 = [(TransitDirectionsStepsListDataProvider *)self _enterItemForStep:v60 passStop:v62 previouslySkippedPassStops:v126];

      v123 = v63;
      [v63 setParentItem:v130];
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(__CFString *)v40 maneuver] == 5)
    {
      v67 = sub_10066ABFC();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v145 = v40;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "- creating EXIT item for alight step: %@", buf, 0xCu);
      }

      v68 = v40;
      v69 = [(TransitDirectionsStepsListDataProvider *)self _exitItemForAlightStep:v68];

      [v69 setParentItem:v130];
      objc_storeStrong(location, obj);
      [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
      int v70 = 0;
      int v53 = 1;
      v114 = v69;
      v115 = v68;
    }
    else
    {
      int v53 = 0;
      int v70 = 1;
    }

    uint64_t v20 = v21;
    if (v70) {
LABEL_80:
    }
      [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
  }
  while (!v53);
  if ([v117 count])
  {
    v71 = [v117 firstObject];
    v72 = objc_alloc_init(TransitDirectionsListItem);
    [(TransitDirectionsListItem *)v72 setType:6];
    [(TransitDirectionsListItem *)v72 setParentItem:v130];
    v73 = [v71 fromLineColor];
    [(TransitDirectionsListItem *)v72 setFromLineColor:v73];

    v74 = [v71 toLineColor];
    [(TransitDirectionsListItem *)v72 setToLineColor:v74];

    v75 = [v71 alternateFromLineColor];
    [(TransitDirectionsListItem *)v72 setAlternateFromLineColor:v75];

    v76 = [v71 alternateToLineColor];
    [(TransitDirectionsListItem *)v72 setAlternateToLineColor:v76];

    [v117 insertObject:v72 atIndex:0];
  }
  [(TransitDirectionsListItemTransitTrip *)v130 setExpandedItems:v117];
  v77 = +[NSMutableArray array];
  v78 = v77;
  if (v115) {
    [v77 addObject:];
  }
  v79 = [(GEOComposedRouteStep *)v118 getNextStep];
  v80 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A8050, 0);
  v81 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A8098, 0);
  uint64_t v82 = [(TransitDirectionsStepsListDataProvider *)self _nextStepAfterStep:v79 withManeuvers:v80 beforeManeuvers:v81];

  if (v82) {
    [v78 addObject:v82];
  }
  v122 = (void *)v82;
  id obja = v78;
  [(TransitDirectionsStepsListDataProvider *)self _mergeTransitRoutingIncidentsForSteps:v78];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v128 = (id)objc_claimAutoreleasedReturnValue();
  id v83 = [v128 countByEnumeratingWithState:&v135 objects:v143 count:16];
  if (v83)
  {
    id v84 = v83;
    uint64_t v85 = *(void *)v136;
    do
    {
      for (i = 0; i != v84; i = (char *)i + 1)
      {
        if (*(void *)v136 != v85) {
          objc_enumerationMutation(v128);
        }
        v87 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        v88 = [v87 routingMessage];
        id v89 = [v88 length];

        if (v89)
        {
          self->_hasIncidentItems = 1;
          v90 = [(TransitDirectionsStepsListDataProvider *)self _incidentItemWithIncidentMessage:v87];
          v91 = sub_10066ABFC();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v92 = [v87 routingMessage];
            *(_DWORD *)buf = 138477827;
            CFStringRef v145 = v92;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "- adding merged incidents item: \"%{private}@\"", buf, 0xCu);
          }
          [v90 setParentItem:v130];
          [(TransitDirectionsStepsListDataProvider *)self _appendItem:v90 toArray:v129];
        }
      }
      id v84 = [v128 countByEnumeratingWithState:&v135 objects:v143 count:16];
    }
    while (v84);
  }
  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v123 toArray:v129];
  v93 = sub_10066ABFC();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "- added board pass item", buf, 2u);
  }

  [(TransitDirectionsStepsListDataProvider *)self _insertItem:v114 atIndex:0 inArray:v110];
  v94 = sub_10066ABFC();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "- added alight pass item", buf, 2u);
  }

  id v95 = [objc_alloc((Class)NSMutableArray) initWithCapacity:(char *)[v117 count] + 2];
  v96 = [v123 composedRouteSteps];
  [v95 addObjectsFromArray:v96];

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v97 = v117;
  id v98 = [v97 countByEnumeratingWithState:&v131 objects:v142 count:16];
  if (v98)
  {
    id v99 = v98;
    uint64_t v100 = *(void *)v132;
    do
    {
      for (j = 0; j != v99; j = (char *)j + 1)
      {
        if (*(void *)v132 != v100) {
          objc_enumerationMutation(v97);
        }
        v102 = [*(id *)(*((void *)&v131 + 1) + 8 * (void)j) composedRouteSteps];
        [v95 addObjectsFromArray:v102];
      }
      id v99 = [v97 countByEnumeratingWithState:&v131 objects:v142 count:16];
    }
    while (v99);
  }

  v103 = [v114 composedRouteSteps];
  [v95 addObjectsFromArray:v103];

  [(TransitDirectionsListItem *)v130 setComposedRouteStepsDisplayedOnMap:v95];
  v104 = objc_alloc_init(TransitDirectionsListItem);
  [(TransitDirectionsListItem *)v104 setType:7];
  [(TransitDirectionsListItem *)v104 setParentItem:v130];
  v105 = [v123 toLineColor];
  [(TransitDirectionsListItem *)v104 setFromLineColor:v105];

  [(TransitDirectionsStepsListDataProvider *)self _appendItem:v104 toArray:v129];
  v106 = sub_10066ABFC();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v107 = (const __CFString *)[v97 count];
    *(_DWORD *)buf = 134217984;
    CFStringRef v145 = v107;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "- added expand item representing %lu hidden items", buf, 0xCu);
  }

  ++self->_segmentRangeLength;
  [(TransitDirectionsListItem *)v130 setPostTertiaryItems:v129];
  [(TransitDirectionsListItem *)v130 setFooterItems:v110];
  v108 = v130;

  return v108;
}

- (id)_boardingInfoItemForStep:(id)a3
{
  id v3 = a3;
  id v4 = [v3 boardingInfo];
  if (v4) {
    goto LABEL_2;
  }
  uint64_t v6 = [v3 instructions];
  int v7 = [v6 transitListInstruction];
  unsigned int v8 = [v7 hasTimeInstructions];

  if (!v8) {
    goto LABEL_5;
  }
  id v4 = objc_alloc_init((Class)GEOTransitBoardingInfo);
  id v9 = objc_alloc_init((Class)GEOTransitBoardingInfoEntry);
  id v10 = [v3 instructions];
  id v11 = [v10 transitListInstruction];
  id v12 = [v11 timeInstructions];
  [v9 setMainTimeInstruction:v12];

  [v4 addEntry:v9];
  if (v4)
  {
LABEL_2:
    id v5 = [[TransitDirectionsListBoardingInfoItem alloc] initWithBoardingInfo:v4];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }

  return v5;
}

- (id)_passStopSubItemForSteps:(id)a3 boardStep:(id)a4 previousPassStop:(id)a5 currentRideDuration:(unsigned int)a6 fromLineColor:(id)a7 toLineColor:(id)a8
{
  id v11 = a3;
  id v32 = &off_1013A80B0;
  if (a8) {
    id v12 = a8;
  }
  else {
    id v12 = a7;
  }
  id v13 = a8;
  id v14 = a7;
  unsigned int v15 = [v12 _maps_hexString];
  v16 = +[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:v15];
  __int16 v33 = v16;
  v17 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  uint64_t v18 = [[TransitDirectionsListArtworkItem alloc] initWithArtworks:v17 instructions:0];
  [(TransitDirectionsListItem *)v18 setType:5];
  id v19 = [v11 firstObject];
  uint64_t v20 = +[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v19, +[TransitDirectionsListItem defaultInstructionContextForItemType:5 forGuidance:self->_forGuidance]);
  v21 = [v20 majorInstructionStrings];
  id v22 = [v21 count];

  if (v22)
  {
    id v23 = [v20 majorInstructionStrings];
    [(TransitDirectionsListItem *)v18 setMajorFormattedStrings:v23];
  }
  else
  {
    id v23 = [v19 originStopIntermediateListName];
    if (v23)
    {
      id v24 = [objc_alloc((Class)GEOComposedString) initWithString:v23];
      id v31 = v24;
      id v25 = +[NSArray arrayWithObjects:&v31 count:1];
      [(TransitDirectionsListItem *)v18 setMajorFormattedStrings:v25];
    }
  }

  v26 = [v20 minorInstructionStrings];
  [(TransitDirectionsListItem *)v18 setMinorFormattedStrings:v26];

  v27 = [v20 tertiaryInstructionStrings];
  [(TransitDirectionsListItem *)v18 setTertiaryFormattedStrings:v27];

  unsigned int v28 = [v20 primaryTimeInstructionString];
  [(TransitDirectionsListItem *)v18 setPrimaryAccessoryString:v28];

  id v29 = [v20 secondaryTimeInstructionString];
  [(TransitDirectionsListItem *)v18 setSecondaryAccessoryString:v29];

  [(TransitDirectionsListItem *)v18 setFromLineColor:v14];
  [(TransitDirectionsListItem *)v18 setToLineColor:v13];

  [(TransitDirectionsListArtworkItem *)v18 setSelectedSize:2];
  [(TransitDirectionsListArtworkItem *)v18 setAdaptiveShieldSize:0];
  [(TransitDirectionsListItem *)v18 setComposedRouteSteps:v11];

  return v18;
}

- (id)_enterItemForStep:(id)a3 passStop:(id)a4 previouslySkippedPassStops:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL forGuidance = self->_forGuidance;
  id v11 = a5;
  id v12 = +[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v9, +[TransitDirectionsListItem defaultInstructionContextForItemType:10 forGuidance:forGuidance]);
  id v13 = [v9 transitLine];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = [v8 nextBoardingStep];
    id v15 = [v16 transitLine];
  }
  id v35 = &off_1013A80B0;
  v17 = [v15 lineColorString];
  uint64_t v18 = +[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:v17];
  v36 = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  uint64_t v20 = [[TransitDirectionsListArtworkItem alloc] initWithArtworks:v19 instructions:v12];
  v21 = v20;
  if (self->_forGuidance) {
    uint64_t v22 = 5;
  }
  else {
    uint64_t v22 = 4;
  }
  [(TransitDirectionsListArtworkItem *)v20 setSelectedSize:v22];
  [(TransitDirectionsListArtworkItem *)v21 setAdaptiveShieldSize:0];
  id v23 = [v12 primaryTimeInstructionString];
  [(TransitDirectionsListItem *)v21 setPrimaryAccessoryString:v23];

  id v24 = [v12 secondaryTimeInstructionString];
  [(TransitDirectionsListItem *)v21 setSecondaryAccessoryString:v24];

  -[TransitDirectionsListItem setHideAccessoryStringsWhenCollapsed:](v21, "setHideAccessoryStringsWhenCollapsed:", [v12 hideTimeInstructionsWhenCollapsed]);
  [(TransitDirectionsListItem *)v21 setType:10];
  [(TransitDirectionsStepsListDataProvider *)self _populateAccessPointArtworkForItem:v21 fromStep:v9];
  if (v15)
  {
    uint64_t v25 = +[UIColor _mapkit_colorForTransitLine:v15];
    currentLineColor = self->_currentLineColor;
    p_currentLineColor = &self->_currentLineColor;
    v26 = currentLineColor;
    *p_currentLineColor = (UIColor *)v25;
  }
  else
  {
    id v29 = self->_currentLineColor;
    p_currentLineColor = &self->_currentLineColor;
    v26 = v29;
    *p_currentLineColor = 0;
  }

  [(TransitDirectionsListItem *)v21 setFromLineColor:0];
  [(TransitDirectionsListItem *)v21 setToLineColor:*p_currentLineColor];
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v31 = v30;
  if (v9) {
    id v32 = v9;
  }
  else {
    id v32 = v8;
  }
  [v30 addObject:v32];
  [v31 addObjectsFromArray:v11];

  id v33 = [v31 copy];
  [(TransitDirectionsListItem *)v21 setComposedRouteSteps:v33];

  return v21;
}

- (id)_exitItemForAlightStep:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TransitDirectionsStepsListDataProvider *)self _nextLeaveStopStepAfterStep:v4];
  uint64_t v6 = [v4 nextTransitStep];
  if ([v6 maneuver] == 6)
  {
    uint64_t v7 = [v4 nextTransitStep];
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (v5 | v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = v8;
    if (v7) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = v5;
    }
    [v8 setObject:v10 forKeyedSubscript:&off_1013A80C8];
  }
  else
  {
    id v9 = 0;
  }
  id v11 = +[MNTransitStepInstruction instructionForStep:overrides:context:](MNTransitStepInstruction, "instructionForStep:overrides:context:", v4, v9, +[TransitDirectionsListItem defaultInstructionContextForItemType:11 forGuidance:self->_forGuidance]);
  id v39 = &off_1013A80B0;
  id v12 = [(UIColor *)self->_currentLineColor _maps_hexString];
  id v13 = +[MKTransitArtwork stationNodeArtworkWithHexColor:v12];
  id v40 = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  v36 = (void *)v14;
  id v15 = [[TransitDirectionsListArtworkItem alloc] initWithArtworks:v14 instructions:v11];
  v16 = v15;
  if (self->_forGuidance) {
    uint64_t v17 = 5;
  }
  else {
    uint64_t v17 = 4;
  }
  [(TransitDirectionsListArtworkItem *)v15 setSelectedSize:v17];
  [(TransitDirectionsListArtworkItem *)v16 setAdaptiveShieldSize:0];
  uint64_t v18 = [v11 primaryTimeInstructionString];
  [(TransitDirectionsListItem *)v16 setPrimaryAccessoryString:v18];

  id v19 = [v11 secondaryTimeInstructionString];
  [(TransitDirectionsListItem *)v16 setSecondaryAccessoryString:v19];

  -[TransitDirectionsListItem setHideAccessoryStringsWhenCollapsed:](v16, "setHideAccessoryStringsWhenCollapsed:", [v11 hideTimeInstructionsWhenCollapsed]);
  uint64_t v20 = [(TransitDirectionsListItem *)v16 badges];
  id v21 = [v20 count];

  if (!v21 && v7)
  {
    uint64_t v22 = [(id)v7 transitStep];
    id v23 = [v22 badges];
    [(TransitDirectionsListItem *)v16 setBadges:v23];
  }
  [(TransitDirectionsListItem *)v16 setType:11];
  [(TransitDirectionsListItem *)v16 setFromLineColor:self->_currentLineColor];
  [(TransitDirectionsListItem *)v16 setToLineColor:0];
  unint64_t v24 = [(TransitDirectionsStepsListDataProvider *)self _startRangeIndexForAlightItem:v4];
  id v37 = v9;
  v38 = (void *)v7;
  if (v5) {
    uint64_t v25 = (void *)v5;
  }
  else {
    uint64_t v25 = v4;
  }
  v26 = [v25 stepIndex];
  v27 = [v4 composedRoute];
  unsigned int v28 = [v27 steps];
  id v29 = [v28 subarrayWithRange:v24, &v26[-v24 + 1]];
  [(TransitDirectionsListItem *)v16 setComposedRouteSteps:v29];

  id v30 = [v4 composedRoute];
  id v31 = [v30 steps];
  id v32 = [v31 subarrayWithRange:[v4 stepIndex] v26 - (unsigned char *)[v4 stepIndex] + 1];
  [(TransitDirectionsListItem *)v16 setComposedRouteStepsDisplayedOnMap:v32];

  id v33 = +[NSMutableArray array];
  unsigned int v34 = v33;
  if (v5) {
    [v33 addObject:v5];
  }
  if (v4) {
    [v34 addObject:v4];
  }
  [(TransitDirectionsStepsListDataProvider *)self _populateAccessPointArtworkForItem:v16 fromStepsInPreferedOrder:v34];

  return v16;
}

- (id)_fareAndOperatingHoursItemForBlockTransferStep:(id)a3 lineColor:(id)a4 alternateLineColor:(id)a5 parentItem:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if ([v9 maneuver] != 9)
  {
    id v53 = v12;
    uint64_t v14 = [v9 transitLine];
    id v15 = [v14 operatingHours];

    id v16 = [v15 count];
    uint64_t v17 = [v9 composedRoute];
    unsigned __int8 v18 = [v17 shouldShowSchedule];

    if ((v18 & 1) == 0 && v16)
    {
      id v51 = v11;
      id v52 = v10;
      id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v16];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v50 = v15;
      id v20 = v15;
      id v21 = [v20 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v56;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v56 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            [v25 startTime];
            double v27 = v26;
            [v25 duration];
            if (v28 > 0.0)
            {
              double v29 = v28;
              id v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v27];
              id v31 = +[NSDate dateWithTimeInterval:v30 sinceDate:v29];
              [v19 addObject:v30];
              [v19 addObject:v31];
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v55 objects:v59 count:16];
        }
        while (v22);
      }

      id v11 = v51;
      if ([v19 count])
      {
        id v32 = [v9 startingStop];
        id v33 = [v32 timezone];
        unsigned int v34 = +[NSTimeZone timeZoneWithName:v33];

        uint64_t v35 = +[NSString _navigation_formattedStringForHourRanges:v19 timeZone:v34];
        v36 = +[NSBundle mainBundle];
        uint64_t v37 = [v36 localizedStringForKey:@"Transit_List_Operating_Hours" value:@"localized string not found" table:0];

        v38 = (void *)v37;
        id v39 = (void *)v35;
        id v40 = +[NSString stringWithValidatedFormat:v37, @"%@", 0, v35 validFormatSpecifiers error];
        id v41 = [objc_alloc((Class)GEOComposedString) initWithString:v40];
        [v13 addObject:v41];
        v42 = sub_10066ABFC();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "- adding operating hours", buf, 2u);
        }
      }
      id v10 = v52;
      id v15 = v50;
    }

    id v12 = v53;
  }
  id v43 = [v9 instructions];
  v44 = [v43 transitListInstruction];
  v45 = [v44 priceFormatteds];
  unsigned int v46 = [v45 _geo_map:&stru_1012F38F8];

  if ([v46 count])
  {
    id v47 = sub_10066ABFC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "- adding fares", buf, 2u);
    }
  }
  [v13 addObjectsFromArray:v46];
  if ([v13 count])
  {
    unsigned int v48 = objc_alloc_init(TransitDirectionsListItem);
    [(TransitDirectionsListItem *)v48 setType:15];
    [(TransitDirectionsListItem *)v48 setParentItem:v12];
    [(TransitDirectionsListItem *)v48 setFromLineColor:v10];
    [(TransitDirectionsListItem *)v48 setToLineColor:v10];
    [(TransitDirectionsListItem *)v48 setAlternateFromLineColor:v11];
    [(TransitDirectionsListItem *)v48 setAlternateToLineColor:v11];
    [(TransitDirectionsListItem *)v48 setMajorFormattedStrings:v13];
  }
  else
  {
    unsigned int v48 = 0;
  }

  return v48;
}

- (id)_incidentItemWithIncidentMessage:(id)a3
{
  id v3 = a3;
  id v4 = [[TransitDirectionsListItemIncident alloc] initWithIncidentMessage:v3];

  return v4;
}

- (id)_mergeTransitRoutingIncidentsForSteps:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  id v29 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    *(void *)&long long v6 = 134218240;
    long long v25 = v6;
    id v26 = v5;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v9 = [v8 advisories:v25];

        if (v9)
        {
          id v30 = i;
          id v10 = [v8 advisories];
          [v5 addObjectsFromArray:v10];

          id v11 = sub_10066ABFC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v12 = [v5 count];
            id v13 = [obj count];
            *(_DWORD *)buf = v25;
            id v41 = v12;
            __int16 v42 = 2048;
            id v43 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "- found %lu advisories across %lu steps", buf, 0x16u);
          }

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v5;
          id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v32;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
                id v20 = [MergedTransitRoutingIncidentMessage alloc];
                id v21 = [v8 transitIncidents];
                id v22 = [(MergedTransitRoutingIncidentMessage *)v20 initWithGEOComposedRouteAdvisory:v19 transitIncidents:v21];

                [v4 addObject:v22];
              }
              id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v16);
          }

          id v5 = v26;
          i = v30;
        }
      }
      id v29 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v29);
  }

  id v23 = [v4 copy];

  return v23;
}

- (void)_consumeWalkingSegment
{
  id v3 = sub_10066ABFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    double v27 = "-[TransitDirectionsStepsListDataProvider _consumeWalkingSegment]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v4 = [(TransitDirectionsStepsListDataProvider *)self route];
  id v5 = [v4 segmentForStepIndex:[self->_currentStep stepIndex]];

  long long v6 = [v5 lastWalkingStep];
  uint64_t v7 = [v6 getNextStep];
  id v8 = +[NSSet setWithObject:&off_1013A8098];
  id v9 = [(TransitDirectionsStepsListDataProvider *)self _nextStepAfterStep:v7 withManeuvers:v8 beforeManeuvers:0];

  if (self->_forGuidance) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = [(TransitDirectionsStepsListDataProvider *)self _walkingItemForWalkingSegment:v5 toBoardStep:v10];
  id v12 = [v11 majorFormattedStrings];
  id v13 = [v12 firstObject];
  id v14 = [v13 stringWithDefaultOptions];

  if ([v14 length])
  {
    [(TransitDirectionsStepsListDataProvider *)self _appendItem:v11 toArray:self->_mutableItems];
    mutableSegmentRanges = self->_mutableSegmentRanges;
    id v16 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1);
    [(NSMutableArray *)mutableSegmentRanges addObject:v16];

    ++self->_segmentRangeLocation;
  }
  uint64_t v17 = (char *)[v5 stepRange];
  [(TransitDirectionsStepsListDataProvider *)self _updateCurrentStepToIndex:&v17[v18]];
  uint64_t v19 = [(GEOComposedRouteStep *)self->_currentStep transitStep];
  id v20 = [v19 maneuverType];

  if ((v20 & 0xFFFFFFFE) == 6)
  {
    id v21 = sub_10066ABFC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if (v20 == 6)
      {
        id v22 = @"TRANSFER_STOP_TO_STOP";
      }
      else if (v20 == 7)
      {
        id v22 = @"GOTO_STOP";
      }
      else
      {
        id v22 = +[NSString stringWithFormat:@"(unknown: %i)", v20];
      }
      *(_DWORD *)buf = 138412290;
      double v27 = (const char *)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "- including next %@", buf, 0xCu);
    }
    id v23 = [v11 composedRouteSteps];
    id v24 = [v23 mutableCopy];

    [v24 addObject:self->_currentStep];
    id v25 = [v24 copy];
    [v11 setComposedRouteSteps:v25];

    [(TransitDirectionsStepsListDataProvider *)self _incrementStep];
  }
}

- (id)_walkingItemForWalkingSegment:(id)a3 toBoardStep:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[TransitDirectionsListItemWalking alloc] initWithWalkingSegment:v6 toBoardStep:v5];

  return v7;
}

- (id)_nextLeaveStopStepAfterStep:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:&off_1013A8050];
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A8080, &off_1013A8068, 0);
  uint64_t v7 = [(TransitDirectionsStepsListDataProvider *)self _nextStepAfterStep:v4 withManeuvers:v5 beforeManeuvers:v6];

  return v7;
}

- (unint64_t)_startRangeIndexForAlightItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stepIndex];
  uint64_t v5 = [v3 getPreviousStep];
  if (v5)
  {
    id v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 maneuver] == 4)
    {
      while (1)
      {
        uint64_t v7 = [v6 transitVehicle];
        unsigned int v8 = [v7 pickupDropoffType];

        if (v8 != 100) {
          break;
        }
        id v4 = [v6 stepIndex];
        id v9 = [v6 getPreviousStep];

        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v6 = v9;
            if ([v9 maneuver] == 4) {
              continue;
            }
          }
        }
        goto LABEL_10;
      }
    }
    id v9 = v6;
LABEL_10:
  }
  return (unint64_t)v4;
}

- (id)_nextTransferStepBeforeBoarding
{
  return [(TransitDirectionsStepsListDataProvider *)self _nextStepWithManeuver:6 beforeManeuver:3];
}

- (id)_nextStepWithManeuver:(int)a3 beforeManeuver:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  currentStep = self->_currentStep;
  uint64_t v7 = +[NSNumber numberWithInt:*(void *)&a3];
  unsigned int v8 = +[NSSet setWithObject:v7];
  id v9 = +[NSNumber numberWithInt:v4];
  id v10 = +[NSSet setWithObject:v9];
  id v11 = [(TransitDirectionsStepsListDataProvider *)self _nextStepAfterStep:currentStep withManeuvers:v8 beforeManeuvers:v10];

  return v11;
}

- (id)_previousStepBeforeStep:(id)a3 withManeuvers:(id)a4 afterManeuver:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = 0;
    id v12 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = [v7 maneuver];
    }
    else {
      id v9 = 0;
    }
    id v10 = +[NSNumber numberWithInt:v9];
    if ([v8 containsObject:v10])
    {
      id v11 = v7;
      goto LABEL_10;
    }
    if (!v9 || v9 == a5) {
      break;
    }
    id v11 = 0;
LABEL_10:
    id v12 = [v7 getPreviousStep];

    if (!v11)
    {
      id v7 = v12;
      if (v12) {
        continue;
      }
    }
    goto LABEL_15;
  }

  id v11 = 0;
  id v12 = v7;
LABEL_15:

  return v11;
}

- (id)_nextStepAfterStep:(id)a3 withManeuvers:(id)a4 beforeManeuvers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v12 = 0;
    id v13 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = [v7 maneuver];
    }
    else {
      id v10 = 0;
    }
    id v11 = +[NSNumber numberWithInt:v10];
    if ([v8 containsObject:v11])
    {
      id v12 = v7;
      goto LABEL_10;
    }
    if (!v10 || [v9 containsObject:v11]) {
      break;
    }
    id v12 = 0;
LABEL_10:
    id v13 = [v7 getNextStep];

    if (!v12)
    {
      id v7 = v13;
      if (v13) {
        continue;
      }
    }
    goto LABEL_15;
  }

  id v12 = 0;
  id v13 = v7;
LABEL_15:

  return v12;
}

- (id)_imageForInterSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5 dimmedOrigin:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v21 = [v9 transitLine];
  id v22 = [v21 lineColorString];
  id v13 = +[UIColor _maps_colorFromHexString:v22];

  if (v6)
  {
LABEL_3:
    uint64_t v14 = [v13 colorWithAlphaComponent:0.300000012];

    id v13 = (id)v14;
  }
LABEL_4:
  id v15 = [v13 _maps_hexString];
  id v16 = [v10 transitLine];
  uint64_t v17 = [v16 lineColorString];
  uint64_t v18 = +[UIScreen mainScreen];
  [v18 scale];
  uint64_t v19 = +[UIImage interSystemTransferFromHexColor:toHexColor:imageWithSize:scale:darkMode:](UIImage, "interSystemTransferFromHexColor:toHexColor:imageWithSize:scale:darkMode:", v15, v17, 4, 0);

  return v19;
}

- (id)_artworksForIntraSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 _maps_hexString];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [v7 transitLine];
    id v11 = [v12 lineColorString];
  }
  id v13 = [v8 transitLine];

  uint64_t v14 = [v13 lineColorString];

  id v15 = +[MKTransitArtwork stationNodeArtworkWithHexColor:v11];
  id v16 = +[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:v14];
  uint64_t v17 = +[NSMutableDictionary dictionary];
  uint64_t v18 = v17;
  if (v15) {
    [v17 setObject:v15 forKeyedSubscript:&off_1013A80E0];
  }
  if (v16)
  {
    [v18 setObject:v16 forKeyedSubscript:&off_1013A80F8];
    [v18 setObject:v16 forKeyedSubscript:&off_1013A80C8];
    [v18 setObject:v16 forKeyedSubscript:&off_1013A8110];
    [v18 setObject:v16 forKeyedSubscript:&off_1013A8128];
  }

  return v18;
}

- (void)_populateStationArtworkForItem:(id)a3 fromStep:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v10 = v6;
    id v8 = a3;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    -[TransitDirectionsStepsListDataProvider _populateStationArtworkForItem:fromStepsInPreferedOrder:](self, "_populateStationArtworkForItem:fromStepsInPreferedOrder:", v8, v9, v10);
  }
  else
  {
    id v9 = a3;
    [(TransitDirectionsStepsListDataProvider *)self _populateStationArtworkForItem:v9 fromStepsInPreferedOrder:&__NSArray0__struct];
  }
}

- (void)_populateStationArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ([v10 type] != (id)8)
  {
    id v6 = sub_100099700(v5, &stru_1012F3938);
    id v7 = [v6 firstObject];

    if (v7)
    {
      id v8 = +[UIScreen mainScreen];
      [v8 scale];
      id v9 = +[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v7, 7);

      [v10 setMajorStringImage:v9];
    }
  }
}

- (void)_populateAccessPointArtworkForItem:(id)a3 fromStep:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v10 = v6;
    id v8 = a3;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    -[TransitDirectionsStepsListDataProvider _populateAccessPointArtworkForItem:fromStepsInPreferedOrder:](self, "_populateAccessPointArtworkForItem:fromStepsInPreferedOrder:", v8, v9, v10);
  }
  else
  {
    id v9 = a3;
    [(TransitDirectionsStepsListDataProvider *)self _populateAccessPointArtworkForItem:v9 fromStepsInPreferedOrder:&__NSArray0__struct];
  }
}

- (void)_populateAccessPointArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4
{
  id v9 = a3;
  id v5 = sub_100099700(a4, &stru_1012F3958);
  id v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = +[UIScreen mainScreen];
    [v7 scale];
    id v8 = +[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v6, 5);

    [v9 setMinorStringImage:v8];
  }
}

- (NSArray)segmentRanges
{
  mutableSegmentRanges = self->_mutableSegmentRanges;
  if (!mutableSegmentRanges)
  {
    [(TransitDirectionsStepsListDataProvider *)self _buildItems];
    mutableSegmentRanges = self->_mutableSegmentRanges;
  }

  return (NSArray *)mutableSegmentRanges;
}

- (GEOComposedRoute)route
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);

  return (GEOComposedRoute *)WeakRetained;
}

- (BOOL)hasIncidentItems
{
  return self->_hasIncidentItems;
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_destroyWeak((id *)&self->_route);
  objc_storeStrong((id *)&self->_mutableSegmentRanges, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_prefixStepForNextBoardItem, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);

  objc_storeStrong((id *)&self->_currentLineColor, 0);
}

@end