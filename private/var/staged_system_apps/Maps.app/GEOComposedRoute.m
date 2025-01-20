@interface GEOComposedRoute
+ (id)_maps_composedRouteWithPersistentData:(id)a3;
- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingMapRect;
- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3;
- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3 fromPoint:(unint64_t)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_maps_closestMapPointToMapPoint:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)arrivalStorefrontLocation;
- (BOOL)_isChargingWaypoint:(id)a3;
- (BOOL)_isStartWaypoint:(id)a3;
- (BOOL)_maps_isEqualToComposedRoute:(id)a3;
- (BOOL)carplayDestinationHandoffRequired;
- (BOOL)hasArrivalStorefrontGeometry;
- (BOOL)isLegIndexOfLastLeg:(unint64_t)a3;
- (BOOL)shouldReturnToRoutePickerWhenEndingDirectionsAtStepIndex:(unint64_t)a3;
- (CLLocationCoordinate2D)_mkCoordAt:(unsigned int)a3;
- (GEOComposedRouteAdvisory)clickableAdvisory;
- (GEOComposedRouteStep)startRouteStep;
- (GuidanceETA)guidanceETA;
- (MNTraceRecordingData)_maps_traceRecordingData;
- (NSArray)_maps_directionsWaypoints;
- (NSArray)_maps_trafficIncidentsOnRoute;
- (NSArray)composedGuidanceEventsWithLaneGuidance;
- (NSArray)composedGuidanceEventsWithSignGuidance;
- (NSArray)shareETAWaypointContacts;
- (NSArray)steppingSigns;
- (NSArray)transitLinesOnRoute;
- (NSData)rideSelectionsAsNSData;
- (NSDate)transitRouteArrivalDate;
- (NSString)abbreviatedDistance;
- (NSString)accessibilityExpandedDistance;
- (NSString)clientPickingDescription;
- (NSString)expandedDistance;
- (NSString)expandedTravelTime;
- (RouteCollection)_maps_routeCollection;
- (TransitDirectionsStepsListDataProvider)transitDirectionsStepsListDataProvider;
- (id)_arrivalInstructionStringForStep:(id)a3;
- (id)_maps_convertToNavigableRouteWithTraits:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5;
- (id)_maps_routeRequestStorage;
- (id)_maps_trafficIncidentsObservers:(BOOL)a3;
- (id)_signForTransitStationStep:(id)a3;
- (id)_signForTransitTripStep:(id)a3;
- (id)_signForWalkingStep:(id)a3;
- (id)advisoriesStyleAttributes;
- (id)arrivalInstructionStringForLegIndex:(unint64_t)a3;
- (id)arrivalInstructionStringForStepIndex:(unint64_t)a3;
- (id)batteryLevelForStepIndex:(unint64_t)a3;
- (id)bookmarkRepresentation;
- (id)chargingStationInfos;
- (id)combinedDescriptionForFont:(id)a3;
- (id)distanceAndElevationString;
- (id)nextLaneGuidanceEventAfterEvent:(id)a3;
- (id)nextWaypoint;
- (id)rapDestinationTitle;
- (id)timeAndElevationDescriptionStringWithAttributes:(id)a3;
- (id)timeStringWithAttributes:(id)a3;
- (id)waypointsAfterStepIndex:(unint64_t)a3;
- (id)waypointsAfterStepIndex:(unint64_t)a3 legIndex:(unint64_t *)a4;
- (unint64_t)_maps_routeIndex;
- (unint64_t)mapType;
- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4;
- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5;
- (unsigned)tollCurrencyType;
- (void)_getMapPoints:(id *)a3 count:(unint64_t *)a4 startIndex:(unint64_t)a5 limit:(unint64_t)a6;
- (void)_maps_addTrafficIncidentsObserver:(id)a3;
- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4;
- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4 forStep:(id)a5;
- (void)_maps_refreshTrafficIncidentsOnRoute;
- (void)_maps_removeTrafficIncidentsObserver:(id)a3;
- (void)_maps_routeCollectionOnly_Clear;
- (void)_maps_routeCollectionOnly_setRouteCollectionWhenNil:(id)a3;
- (void)_maps_setTraceRecordingData:(id)a3;
- (void)updateCustomRouteStartEndCaptions;
- (void)updateMyLocationAnchorNames;
- (void)updateWaypointStyleAttributesWithItemSource:(id)a3 personalizedItemManager:(id)a4;
@end

@implementation GEOComposedRoute

- (NSArray)_maps_directionsWaypoints
{
  v3 = objc_getAssociatedObject(self, &unk_10160EB38);
  if (!v3)
  {
    v4 = [(GEOComposedRoute *)self waypoints];
    v3 = sub_100099700(v4, &stru_1012E88E0);

    objc_setAssociatedObject(self, &unk_10160EB38, v3, (void *)1);
  }

  return (NSArray *)v3;
}

- (BOOL)_isStartWaypoint:(id)a3
{
  id v4 = a3;
  v5 = [(GEOComposedRoute *)self _maps_directionsWaypoints];
  v6 = [v5 firstObject];
  unsigned __int8 v7 = [v6 isEqual:v4];

  return v7;
}

- (BOOL)_isChargingWaypoint:(id)a3
{
  id v4 = a3;
  v5 = [(GEOComposedRoute *)self _maps_directionsWaypoints];
  id v6 = [v5 indexOfObject:v4];

  unsigned __int8 v7 = [(GEOComposedRoute *)self waypoints];
  if (v6 >= [v7 count])
  {
    v9 = 0;
  }
  else
  {
    v8 = [(GEOComposedRoute *)self waypoints];
    v9 = [v8 objectAtIndexedSubscript:v6];
  }
  v10 = [v9 chargingInfo];
  BOOL v11 = v10 != 0;

  return v11;
}

- (void)_maps_refreshTrafficIncidentsOnRoute
{
  id v13 = [(GEOComposedRoute *)self traffic];
  v3 = [v13 trafficIncidents];
  id v4 = [v13 trafficIncidentOffsets];
  id v5 = [v3 count];
  if (v5 == [v4 count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [v3 objectAtIndexedSubscript:v7];
        v9 = [v4 objectAtIndexedSubscript:v7];
        id v10 = objc_msgSend(objc_alloc((Class)VKTrafficIncidentFeature), "initWithRouteIncident:routeOffsetInMeters:routeRelevance:onRoute:", v8, objc_msgSend(v9, "unsignedIntValue"), 3, self);
        [v6 addObject:v10];

        ++v7;
      }
      while (v7 < (unint64_t)[v3 count]);
    }
    id v11 = [v6 copy];
    objc_setAssociatedObject(self, &unk_10160EFD1, v11, (void *)1);
    v12 = [(GEOComposedRoute *)self _maps_trafficIncidentsObservers:0];
    [v12 composedRoute:self didUpdateTrafficIncidentsOnRoute:v11];
  }
}

- (NSArray)_maps_trafficIncidentsOnRoute
{
  v3 = objc_getAssociatedObject(self, &unk_10160EFD1);
  if (!v3)
  {
    [(GEOComposedRoute *)self _maps_refreshTrafficIncidentsOnRoute];
    v3 = objc_getAssociatedObject(self, &unk_10160EFD1);
    if (!v3)
    {
      id v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = +[NSString stringWithFormat:@"trafficIncidentsOnRoute should be non-nil after forced refresh (empty permitted)"];
        int v9 = 136316162;
        id v10 = "-[GEOComposedRoute(TrafficIncidents) _maps_trafficIncidentsOnRoute]";
        __int16 v11 = 2080;
        v12 = "GEOComposedRoute+TrafficIncidents.m";
        __int16 v13 = 1024;
        int v14 = 63;
        __int16 v15 = 2080;
        v16 = "trafficIncidentsOnRoute != nil";
        __int16 v17 = 2112;
        v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v9, 0x30u);
      }
      if (sub_100BB36BC())
      {
        unint64_t v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = +[NSThread callStackSymbols];
          int v9 = 138412290;
          id v10 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
        }
      }
      v3 = 0;
    }
  }

  return (NSArray *)v3;
}

- (id)_maps_trafficIncidentsObservers:(BOOL)a3
{
  BOOL v3 = a3;
  objc_getAssociatedObject(self, &unk_10160EFD2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___GEOComposedRouteTrafficIncidentsObserver queue:&_dispatch_main_q];
    objc_setAssociatedObject(self, &unk_10160EFD2, v5, (void *)1);
  }

  return v5;
}

- (void)_maps_addTrafficIncidentsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOComposedRoute *)self _maps_trafficIncidentsObservers:1];
  [v5 registerObserver:v4];
}

- (void)_maps_removeTrafficIncidentsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOComposedRoute *)self _maps_trafficIncidentsObservers:0];
  [v5 unregisterObserver:v4];
}

- (void)updateWaypointStyleAttributesWithItemSource:(id)a3 personalizedItemManager:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  unint64_t v7 = [(GEOComposedRoute *)self waypoints];
  v8 = +[NSMapTable strongToStrongObjectsMapTable];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        __int16 v15 = [v14 styleAttributesData];

        if (!v15)
        {
          v16 = [[SearchResult alloc] initWithComposedWaypoint:v14];
          __int16 v17 = [v6 itemMatchingLocation:v16];
          if (v17) {
            [v8 setObject:v14 forKey:v17];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    v18 = sub_1005768D4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v8 count];
      *(_DWORD *)buf = 134218242;
      id v34 = v19;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Will attempt to find custom style attributes for %lu waypoints from item source: %@", buf, 0x16u);
    }

    v20 = [v6 allItems];
    if ([v25 updateInProgress]) {
      [v25 previousItems];
    }
    else {
    v21 = [v25 allItems];
    }
    v22 = sub_1005768D4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v21 count];
      *(_DWORD *)buf = 134217984;
      id v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Received all personalized compound items: %lu", buf, 0xCu);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10054DB1C;
    v26[3] = &unk_1012EE900;
    id v27 = v21;
    id v28 = v8;
    id v24 = v21;
    [v20 enumerateObjectsUsingBlock:v26];
  }
}

- (void)updateCustomRouteStartEndCaptions
{
  BOOL v3 = [(GEOComposedRoute *)self waypoints];
  id v10 = [v3 firstObject];

  id v4 = [(GEOComposedRoute *)self waypoints];
  id v5 = [v4 lastObject];

  id v6 = [(GEOComposedRoute *)self waypointDisplayInfoForWaypoint:v10];
  unint64_t v7 = [(GEOComposedRoute *)self waypointDisplayInfoForWaypoint:v5];
  v8 = [(GEOComposedRoute *)self anchorPoints];
  unsigned int v9 = [v8 startAndEndAreTheSame];

  if (v9)
  {
    [v7 _routeCreation_setStartEndWaypointCaption];
  }
  else
  {
    [v6 _routeCreation_setStartWaypointCaption];
    [v7 _routeCreation_setEndWaypointCaption];
  }
}

- (void)updateMyLocationAnchorNames
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(GEOComposedRoute *)self waypoints];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isCurrentLocation])
        {
          unsigned int v9 = [(GEOComposedRoute *)self waypointDisplayInfoForWaypoint:v8];
          [v9 _routeCreation_setMyLocationName];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (unint64_t)mapType
{
  if ([(GEOComposedRoute *)self transportType] == 1) {
    return 104;
  }
  else {
    return 0;
  }
}

- (id)nextWaypoint
{
  BOOL v3 = [(GEOComposedRoute *)self waypoints];
  id v4 = [v3 count];

  if ((unint64_t)v4 > 2)
  {
    uint64_t v6 = [(GEOComposedRoute *)self waypoints];
    id v5 = [v6 objectAtIndexedSubscript:1];
  }
  else
  {
    id v5 = [(GEOComposedRoute *)self destination];
  }

  return v5;
}

- (NSData)rideSelectionsAsNSData
{
  BOOL v3 = [(GEOComposedRoute *)self rideSelections];
  size_t v4 = 4 * (void)[v3 count];

  id v5 = malloc_type_malloc(v4, 0x72753CCEuLL);
  uint64_t v6 = [(GEOComposedRoute *)self rideSelections];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10058160C;
  v9[3] = &unk_1012F0190;
  v9[4] = v5;
  [v6 enumerateObjectsUsingBlock:v9];

  unint64_t v7 = +[NSData dataWithBytesNoCopy:v5 length:v4 freeWhenDone:1];

  return (NSData *)v7;
}

- (id)rapDestinationTitle
{
  BOOL v3 = [(GEOComposedRoute *)self destination];
  unsigned int v4 = [v3 hasFindMyHandleID];

  if (v4)
  {
    id v5 = [(GEOComposedRoute *)self destination];
    [v5 arrivingDisplayName];
  }
  else
  {
    id v6 = objc_alloc((Class)MKMapItem);
    unint64_t v7 = [(GEOComposedRoute *)self destination];
    v8 = [v7 mapItemStorage];
    id v5 = [v6 initWithGeoMapItem:v8 isPlaceHolderPlace:0];

    [v5 name];
  unsigned int v9 = };

  return v9;
}

- (MNTraceRecordingData)_maps_traceRecordingData
{
  objc_getAssociatedObject(self, &unk_10160F1D8);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init((Class)MNTraceRecordingData);
    unsigned int v4 = [(GEOComposedRoute *)self routeInitializerData];
    id v5 = [v4 directionsRequest];
    [v3 setInitialDirectionsRequest:v5];

    id v6 = [(GEOComposedRoute *)self routeInitializerData];
    unint64_t v7 = [v6 directionsResponse];
    [v3 setInitialDirectionsResponse:v7];

    v8 = [(GEOComposedRoute *)self userRequestedWaypoints];
    [v3 setWaypoints:v8];

    [(GEOComposedRoute *)self _maps_setTraceRecordingData:v3];
  }

  return (MNTraceRecordingData *)v3;
}

- (void)_maps_setTraceRecordingData:(id)a3
{
}

- (id)batteryLevelForStepIndex:(unint64_t)a3
{
  id v5 = [(GEOComposedRoute *)self steps];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v13 = 0;
  }
  else
  {
    unint64_t v7 = [(GEOComposedRoute *)self steps];
    v8 = [v7 objectAtIndexedSubscript:a3];

    unsigned int v9 = [v8 evInfo];
    if (v9)
    {
      id v10 = objc_alloc((Class)NSMeasurement);
      double v11 = (double)[v9 remainingBatteryCharge];
      long long v12 = +[NSUnitEnergy wattHours];
      id v13 = [v10 initWithDoubleValue:v12 unit:v11];
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

- (id)chargingStationInfos
{
  id v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v4 = [(GEOComposedRoute *)self legs];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 chargingStationInfo];

        if (v10)
        {
          double v11 = [v9 chargingStationInfo];
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isLegIndexOfLastLeg:(unint64_t)a3
{
  unsigned int v4 = [(GEOComposedRoute *)self legs];
  LOBYTE(a3) = (char *)[v4 count] - 1 == (unsigned char *)a3;

  return a3;
}

- (GEOComposedRouteStep)startRouteStep
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(GEOComposedRoute *)self steps];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 geoStep];
        unsigned int v8 = [v7 maneuverType];

        if (v8 == 17)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (GEOComposedRouteStep *)v3;
}

- (id)_signForWalkingStep:(id)a3
{
  id v4 = a3;
  id v5 = -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", [v4 stepIndex]);
  if ([v4 isArrivalStep])
  {
    id v6 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, [v4 stepIndex], 1);
  }
  else
  {
    uint64_t v7 = [v5 steps];
    id v8 = [v7 firstObject];

    if (v8 == v4)
    {
      unsigned int v9 = [v5 steps];
      long long v10 = [v9 lastObject];

      if ([v10 isArrivalStep])
      {
        uint64_t v11 = [v10 getPreviousStep];

        long long v10 = (void *)v11;
      }
      long long v12 = [v4 stepIndex];
      long long v13 = [v10 stepIndex];
      long long v14 = [v4 getPreviousStep];
      long long v15 = v14;
      if (v14 && [v14 routeSegmentType] == (id)5)
      {
        id v16 = v15;
        if ([v16 maneuver] == 8)
        {
          __int16 v17 = [v16 transitInstructionInContext:1];
          v18 = [v17 majorInstructionStrings];

          if (!v18) {
            long long v12 = [v16 stepIndex];
          }
        }
      }
      id v19 = [v10 getNextStep];
      v20 = v19;
      if (v19 && [v19 routeSegmentType] == (id)5)
      {
        id v21 = v20;
        if ([v21 maneuver] == 7)
        {
          v22 = [v21 transitInstructionInContext:1];
          id v23 = [v22 majorInstructionStrings];

          if (!v23) {
            long long v13 = [v21 stepIndex];
          }
        }
      }
      id v6 = -[TransitSegmentSteppingModeSign initWithWalkingSegment:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithWalkingSegment:stepIndexRange:", v5, v12, v13 - v12 + 1);
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)_signForTransitStationStep:(id)a3
{
  id v3 = a3;
  if ([v3 maneuver] - 6 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v3, [v3 stepIndex], 1);
  }

  return v4;
}

- (id)_signForTransitTripStep:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 maneuver];
  if (v5 == 9 || v5 == 5)
  {
    if ([v4 maneuver] == 9)
    {
      uint64_t v7 = [v4 getPreviousStep];
      id v8 = -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", [v7 stepIndex]);
      unsigned int v9 = (char *)[v8 startStepIndex];
    }
    else
    {
      uint64_t v7 = -[GEOComposedRoute segmentForStepIndex:](self, "segmentForStepIndex:", [v4 stepIndex]);
      unsigned int v9 = (char *)[v7 startStepIndex] + 1;
    }

    long long v14 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, v9, (unsigned char *)[v4 stepIndex] - v9 + 1);
  }
  else if (v5 == 3)
  {
    id v10 = [v4 getPreviousStep];
    uint64_t v11 = v10;
    if (v10)
    {
      long long v12 = v10;
      do
      {
        if ([v12 routeSegmentType] != (id)5) {
          break;
        }
        uint64_t v13 = [v12 getPreviousStep];

        long long v12 = (void *)v13;
      }
      while (v13);
    }
    else
    {
      long long v12 = 0;
    }
    long long v15 = [v4 stepIndex];
    id v16 = [v4 stepIndex];
    if (v11 && [v11 routeSegmentType] == (id)5)
    {
      id v17 = v11;
      if ([v17 maneuver] == 6)
      {
        v18 = [v17 transitInstructionInContext:1];
        id v19 = [v18 majorInstructionStrings];

        if (!v19) {
          long long v15 = [v17 stepIndex];
        }
      }
    }
    long long v14 = -[TransitSegmentSteppingModeSign initWithStep:stepIndexRange:]([TransitSegmentSteppingModeSign alloc], "initWithStep:stepIndexRange:", v4, v15, v16 - v15 + 1);
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (NSArray)steppingSigns
{
  id v3 = [(GEOComposedRoute *)self segments];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned int v5 = [(GEOComposedRoute *)self steps];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 routeSegmentType];
        if (v11 == (id)6)
        {
          uint64_t v12 = [(GEOComposedRoute *)self _signForTransitTripStep:v10];
          goto LABEL_12;
        }
        if (v11 == (id)5)
        {
          uint64_t v12 = [(GEOComposedRoute *)self _signForTransitStationStep:v10];
          goto LABEL_12;
        }
        if (v11 == (id)2)
        {
          uint64_t v12 = [(GEOComposedRoute *)self _signForWalkingStep:v10];
LABEL_12:
          uint64_t v13 = (void *)v12;
          goto LABEL_14;
        }
        uint64_t v13 = 0;
LABEL_14:
        if ([v13 hasValidInstructions])
        {
          long long v14 = [v4 lastObject];
          long long v15 = v14;
          if (v14)
          {
            id v16 = [v14 stepIndexRange];
            v18 = v17;
          }
          else
          {
            id v16 = 0;
            v18 = 0;
          }
          if ((unsigned char *)((unsigned char *)[v13 stepIndexRange] - v16) != v18)
          {
            [v13 stepIndexRange];
            [v13 setStepIndexRange:];
          }
          [v4 addObject:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)waypointsAfterStepIndex:(unint64_t)a3
{
  return [(GEOComposedRoute *)self waypointsAfterStepIndex:a3 legIndex:0];
}

- (id)waypointsAfterStepIndex:(unint64_t)a3 legIndex:(unint64_t *)a4
{
  id v7 = objc_opt_new();
  uint64_t v8 = (char *)[(GEOComposedRoute *)self legIndexForStepIndex:a3];
  unsigned int v9 = [(GEOComposedRoute *)self legs];
  id v10 = (char *)[v9 count];

  if (v8 < v10)
  {
    id v11 = v8;
    do
    {
      uint64_t v12 = [(GEOComposedRoute *)self legs];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v11];

      long long v14 = [v13 destination];
      [v7 addObject:v14];

      ++v11;
      long long v15 = [(GEOComposedRoute *)self legs];
      id v16 = (char *)[v15 count];
    }
    while (v11 < v16);
  }
  if (a4) {
    *a4 = (unint64_t)v8;
  }

  return v7;
}

- (unsigned)tollCurrencyType
{
  if ([(GEOComposedRoute *)self avoidsTolls]) {
    return 0;
  }
  id v3 = +[NSLocale currentLocale];
  id v4 = [v3 objectForKey:NSLocaleCurrencySymbol];
  if (qword_10160F3A8 != -1) {
    dispatch_once(&qword_10160F3A8, &stru_1012F36F8);
  }
  unsigned int v5 = [(id)qword_10160F3A0 objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5) {
    unsigned __int8 v2 = [v5 unsignedIntegerValue];
  }
  else {
    unsigned __int8 v2 = 1;
  }

  return v2;
}

- (id)combinedDescriptionForFont:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GEOComposedRoute *)self routeDescriptions];
  if ([v5 count])
  {
    if (v4)
    {
      NSAttributedStringKey v19 = NSFontAttributeName;
      id v20 = v4;
      id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v8 = [v5 firstObject];
    unsigned int v9 = +[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:v8 defaultAttributes:v6];

    id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v9];
    id v11 = objc_alloc((Class)NSAttributedString);
    uint64_t v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@" · [Route description delimiter]" value:@"localized string not found" table:0];
    id v14 = [v11 initWithString:v13];

    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v15 = 1;
      do
      {
        [v10 appendAttributedString:v14];
        id v16 = [v5 objectAtIndexedSubscript:v15];
        id v17 = +[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:v16 defaultAttributes:v6];
        [v10 appendAttributedString:v17];

        ++v15;
      }
      while (v15 < (unint64_t)[v5 count]);
    }
    id v7 = [v10 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)shareETAWaypointContacts
{
  if (+[AddressBookManager addressBookAllowed])
  {
    id v3 = +[NSMapTable strongToStrongObjectsMapTable];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v4 = +[SharedTripSuggestionsCache sharedInstance];
    unsigned int v5 = [v4 suggestedContacts];

    id v6 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v11 = [v10 contact];
          uint64_t v12 = [v11 identifier];
          [v3 setObject:v10 forKey:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v7);
    }

    uint64_t v13 = +[NSMutableArray array];
    id v14 = +[AddressBookManager sharedManager];
    unint64_t v15 = [v14 meCard];
    v38 = [v15 identifier];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(GEOComposedRoute *)self waypoints];
    id v16 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          long long v21 = [v20 findMyHandle];
          long long v22 = [v21 contact];

          if (v22)
          {
            long long v23 = [v20 findMyHandle];
            id v24 = [v23 contact];

            id v25 = [v20 findMyHandle];
            v26 = [v25 identifier];
          }
          else
          {
            id v27 = [v20 addressBookAddress];
            v26 = [v27 contact];

            if (!v26)
            {
              id v24 = 0;
              goto LABEL_27;
            }
            id v25 = [v20 addressBookAddress];
            id v24 = [v25 contact];
            v26 = 0;
          }

          if (v24)
          {
            id v28 = [v24 identifier];
            unsigned __int8 v29 = [v28 isEqualToString:v38];

            if ((v29 & 1) == 0)
            {
              long long v30 = [v24 identifier];
              id v31 = [v3 objectForKey:v30];

              if (v31) {
                goto LABEL_26;
              }
              if (!v26)
              {
                id v36 = [v20 addressBookAddress];
                long long v32 = [v36 contact];
                +[MSPSharedTripContact contactsFromCNContact:v32];
                id v34 = v33 = v13;
                id v31 = [v34 firstObject];

                uint64_t v13 = v33;
                if (!v31) {
                  goto LABEL_27;
                }
LABEL_26:
                [v13 addObject:v31];

                goto LABEL_27;
              }
              id v31 = [objc_alloc((Class)MSPSharedTripContact) initWithContact:v24 handle:v26];
              if (v31) {
                goto LABEL_26;
              }
            }
          }
LABEL_27:
        }
        id v17 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v17);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return (NSArray *)v13;
}

- (id)arrivalInstructionStringForStepIndex:(unint64_t)a3
{
  unsigned int v5 = [(GEOComposedRoute *)self steps];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    uint64_t v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      id v17 = "-[GEOComposedRoute(NavExtras) arrivalInstructionStringForStepIndex:]";
      __int16 v18 = 2080;
      NSAttributedStringKey v19 = "GEOComposedRoute+NavExtras.m";
      __int16 v20 = 1024;
      int v21 = 73;
      __int16 v22 = 2080;
      long long v23 = "stepIndex < self.steps.count";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  id v7 = [(GEOComposedRoute *)self steps];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a3)
  {
    id v11 = 0;
  }
  else
  {
    unsigned int v9 = [(GEOComposedRoute *)self steps];
    id v10 = [v9 objectAtIndex:a3];

    id v11 = [(GEOComposedRoute *)self _arrivalInstructionStringForStep:v10];
  }

  return v11;
}

- (id)arrivalInstructionStringForLegIndex:(unint64_t)a3
{
  unsigned int v5 = [(GEOComposedRoute *)self legs];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    uint64_t v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      id v17 = "-[GEOComposedRoute(NavExtras) arrivalInstructionStringForLegIndex:]";
      __int16 v18 = 2080;
      NSAttributedStringKey v19 = "GEOComposedRoute+NavExtras.m";
      __int16 v20 = 1024;
      int v21 = 83;
      __int16 v22 = 2080;
      long long v23 = "legIndex < self.legs.count";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  id v7 = [(GEOComposedRoute *)self legs];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a3)
  {
    id v11 = 0;
  }
  else
  {
    unsigned int v9 = [(GEOComposedRoute *)self legs];
    id v10 = [v9 objectAtIndex:a3];

    id v11 = -[GEOComposedRoute arrivalInstructionStringForStepIndex:](self, "arrivalInstructionStringForStepIndex:", [v10 endStepIndex]);
  }

  return v11;
}

- (id)_arrivalInstructionStringForStep:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 waypoint];
  id v6 = [v5 findMyHandleID];
  if (v6)
  {

LABEL_4:
    id v8 = [v5 arrivingDisplayName];
LABEL_5:
    unsigned int v9 = v8;
    id v10 = [(RouteStepManeuverItem *)v8 copy];
    goto LABEL_6;
  }
  id v7 = [v5 addressBookAddress];

  if (v7) {
    goto LABEL_4;
  }
  if ([v4 maneuverType] - 33 > 1)
  {
    id v8 = [v5 navDisplayName];
    goto LABEL_5;
  }
  uint64_t v12 = [RouteStepManeuverItem alloc];
  uint64_t v13 = objc_opt_class();
  id v14 = +[RouteStepListMetrics navSignMetrics];
  LOBYTE(v17) = 0;
  unsigned int v9 = [(RouteStepManeuverItem *)v12 initWithRouteStep:v4 cellClass:v13 state:1 metrics:v14 context:1 route:self scale:0.0 isMissedStep:v17];

  unint64_t v15 = [(RouteStepManeuverItem *)v9 secondaryText];
  int v16 = [v15 string];
  id v10 = [v16 copy];

LABEL_6:

  return v10;
}

- (NSArray)transitLinesOnRoute
{
  objc_getAssociatedObject(self, off_1015EB8F8);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[GEOComposedRoute stepsCount]];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(GEOComposedRoute *)self segments];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            if ([v10 rideOptionsCount])
            {
              unint64_t v11 = 0;
              do
              {
                uint64_t v12 = [v10 transitLineForRideOption:v11];
                [v3 addObject:v12];

                ++v11;
              }
              while (v11 < (unint64_t)[v10 rideOptionsCount]);
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    objc_setAssociatedObject(self, off_1015EB8F8, v3, (void *)1);
  }

  return (NSArray *)v3;
}

- (NSDate)transitRouteArrivalDate
{
  id v3 = [(GEOComposedRoute *)self startDate];
  id v4 = [v3 dateByAddingTimeInterval:-[GEOComposedRoute expectedTime]];

  return (NSDate *)v4;
}

- (RouteCollection)_maps_routeCollection
{
  return (RouteCollection *)objc_getAssociatedObject(self, &unk_10160F940);
}

- (void)_maps_routeCollectionOnly_Clear
{
}

- (void)_maps_routeCollectionOnly_setRouteCollectionWhenNil:(id)a3
{
  id value = a3;
  id v4 = [(GEOComposedRoute *)self _maps_routeCollection];
  if (!v4) {
    objc_setAssociatedObject(self, &unk_10160F940, value, 0);
  }
}

- (unint64_t)_maps_routeIndex
{
  id v3 = [(GEOComposedRoute *)self _maps_routeCollection];
  id v4 = v3;
  if (v3) {
    id v5 = [v3 indexOfRoute:self];
  }
  else {
    id v5 = [(GEOComposedRoute *)self indexInResponse];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)hasArrivalStorefrontGeometry
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self legs];
  id v3 = [v2 lastObject];

  id v4 = [v3 destinationDisplayInfo];
  id v5 = [v4 arInfo];

  unint64_t v6 = [v5 storefrontFaceGeometrys];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)arrivalStorefrontLocation
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self legs];
  id v3 = [v2 lastObject];

  id v4 = [v3 destinationDisplayInfo];
  [v4 position];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)advisoriesStyleAttributes
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self routeLabelArtwork];
  id v3 = [v2 iconDataSource];
  id v4 = [v3 styleAttributes];

  return v4;
}

- (GEOComposedRouteAdvisory)clickableAdvisory
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self advisories];
  id v3 = sub_1000AC254(v2, &stru_101312E78);

  id v4 = [v3 firstObject];

  return (GEOComposedRouteAdvisory *)v4;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingMapRect
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self boundingMapRegion];
  GEOMapRectForMapRegion();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.var1.var1 = v14;
  result.var1.var0 = v13;
  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3
{
  id v4 = a3;
  if ([v4 stepIndex] == (id)0x7FFFFFFFFFFFFFFFLL
    || (long long v17 = 0,
        uint64_t v18 = 0,
        [(GEOComposedRoute *)self _maps_getMapPoints:&v17 count:&v18 forStep:v4],
        !v18))
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }
  else
  {
    [v4 pointCount];
    MKMapRectBoundingMapPoints();
    double x = v5;
    double y = v7;
    double width = v9;
    double height = v11;
    free(v17);
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_maps_boundingRectForStep:(id)a3 fromPoint:(unint64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if (!v6)
  {
    NSLog(@"Error, Route:boundingRectForStep called with nil step");
LABEL_12:
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    goto LABEL_13;
  }
  if ([v6 stepIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  if ([v7 startPointIndex] > a4 || objc_msgSend(v7, "endPointIndex") < a4)
  {
    NSLog(@"Error, Route:boundingRectForStep called with invalid startPointIndex");
    if ([v7 startPointIndex] >= a4) {
      a4 = [v7 startPointIndex];
    }
    if (a4 >= [v7 endPointIndex]) {
      a4 = [v7 endPointIndex];
    }
  }
  uint64_t v21 = 0;
  -[GEOComposedRoute _getMapPoints:count:startIndex:limit:](self, "_getMapPoints:count:startIndex:limit:", &v20, &v21, a4, [v7 pointCount:0] - a4 + [v7 startPointIndex]);
  if (!v21) {
    goto LABEL_12;
  }
  MKMapRectBoundingMapPoints();
  double x = v8;
  double y = v10;
  double width = v12;
  double height = v14;
  free(v20);
LABEL_13:

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.var1.var1 = v19;
  result.var1.var0 = v18;
  result.var0.var1 = v17;
  result.var0.var0 = v16;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_maps_closestMapPointToMapPoint:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v15 = 0;
  unint64_t v16 = 0;
  [(GEOComposedRoute *)self _maps_getMapPoints:&v15 count:&v16];
  if (v16)
  {
    if (v16 == 1)
    {
      double v5 = 9.22337204e18;
      double v6 = 9.22337204e18;
    }
    else
    {
      uint64_t v7 = 0;
      double v8 = INFINITY;
      double v6 = 9.22337204e18;
      unint64_t v9 = 1;
      double v5 = 9.22337204e18;
      do
      {
        MKClosestMapPointInLineSegmentFromMapPoint();
        double v12 = (var1 - v11) * (var1 - v11);
        if (v12 + (var0 - v10) * (var0 - v10) < v8)
        {
          double v8 = v12 + (var0 - v10) * (var0 - v10);
          double v5 = v11;
          double v6 = v10;
        }
        ++v9;
        v7 += 16;
      }
      while (v9 < v16);
    }
    free(v15);
  }
  else
  {
    double v5 = -1.0;
    double v6 = -1.0;
  }
  double v13 = v6;
  double v14 = v5;
  result.double var1 = v14;
  result.double var0 = v13;
  return result;
}

- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4
{
  uint64_t v7 = [(GEOComposedRoute *)self pointCount];

  [(GEOComposedRoute *)self _getMapPoints:a3 count:a4 startIndex:0 limit:v7];
}

- (void)_maps_getMapPoints:(id *)a3 count:(unint64_t *)a4 forStep:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 startPointIndex];
  unsigned int v10 = [v8 pointCount];

  [(GEOComposedRoute *)self _getMapPoints:a3 count:a4 startIndex:v9 limit:v10];
}

- (void)_getMapPoints:(id *)a3 count:(unint64_t *)a4 startIndex:(unint64_t)a5 limit:(unint64_t)a6
{
  if (!a3 || !a6 || (unint64_t v8 = a5, [(GEOComposedRoute *)self pointCount] <= a5))
  {
    if (!a4) {
      return;
    }
    unint64_t v14 = 0;
    goto LABEL_13;
  }
  unint64_t v11 = a6 + v8;
  if (a6 + v8 >= [(GEOComposedRoute *)self pointCount]) {
    unint64_t v11 = [(GEOComposedRoute *)self pointCount];
  }
  double v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(16 * (v11 - v8), 0x1000040451B5BE8uLL);
  double v13 = v12;
  unint64_t v14 = v11 - v8;
  if (v11 > v8)
  {
    double v15 = (char *)v12 + 8;
    do
    {
      [(GEOComposedRoute *)self _mkCoordAt:v8];
      *(MKMapPoint *)(v15 - 8) = MKMapPointForCoordinate(v16);
      ++v8;
      v15 += 16;
    }
    while (v11 != v8);
  }
  *a3 = v13;
  if (a4) {
LABEL_13:
  }
    *a4 = v14;
}

- (CLLocationCoordinate2D)_mkCoordAt:(unsigned int)a3
{
  [(GEOComposedRoute *)self pointAt:a3];

  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v3, v4);
  double longitude = v7.longitude;
  double latitude = v7.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)distanceAndElevationString
{
  [(GEOComposedRoute *)self distance];
  CLLocationDegrees v3 = [(GEOComposedRoute *)self elevationProfile];
  CLLocationDegrees v4 = sub_100A45B1C(v3);

  return v4;
}

- (id)timeAndElevationDescriptionStringWithAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [(GEOComposedRoute *)self previewDurationString];
  [(GEOComposedRoute *)self travelAndChargingDuration];
  double v7 = v6;
  unint64_t v8 = [(GEOComposedRoute *)self elevationProfile];
  uint64_t v9 = sub_100A45808(v5, v8, v4, v7);

  return v9;
}

- (id)timeStringWithAttributes:(id)a3
{
  id v4 = a3;
  [(GEOComposedRoute *)self expectedTime];
  id v5 = v4;
  double v6 = GEOStringForDuration();
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v5];

  return v7;
}

- (id)bookmarkRepresentation
{
  CLLocationDegrees v3 = objc_alloc_init(SyncedBookmarkRepr);
  [(SyncedBookmarkRepr *)v3 setType:4];
  unsigned int v4 = [(GEOComposedRoute *)self transportType];
  if (v4 <= 4) {
    [(SyncedBookmarkRepr *)v3 setDirectionsMode:dword_100F73458[v4]];
  }
  id v5 = [(GEOComposedRoute *)self origin];
  unsigned int v6 = [v5 isCurrentLocation];

  if (v6)
  {
    id v7 = +[SearchResult currentLocationSearchResult];
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v9 = [SearchResult alloc];
    unsigned int v10 = [(GEOComposedRoute *)self origin];
    unint64_t v11 = [v10 geoMapItem];
    unint64_t v8 = [(SearchResult *)v9 initWithGEOMapItem:v11];

    if (!v8) {
      goto LABEL_8;
    }
    id v7 = v8;
  }
  double v12 = [(SearchResult *)v7 bookmarkRepresentation];
  [(SyncedBookmarkRepr *)v3 addPlaces:v12];

LABEL_8:
  double v13 = [(GEOComposedRoute *)self destination];
  unsigned int v14 = [v13 isCurrentLocation];

  if (v14)
  {
    double v15 = +[SearchResult currentLocationSearchResult];
    CLLocationCoordinate2D v16 = v15;
  }
  else
  {
    double v17 = [SearchResult alloc];
    double v18 = [(GEOComposedRoute *)self destination];
    double v19 = [v18 geoMapItem];
    CLLocationCoordinate2D v16 = [(SearchResult *)v17 initWithGEOMapItem:v19];

    if (!v16) {
      goto LABEL_13;
    }
    double v15 = v16;
  }
  __int16 v20 = [(SearchResult *)v15 bookmarkRepresentation];
  [(SyncedBookmarkRepr *)v3 addPlaces:v20];

LABEL_13:

  return v3;
}

+ (id)_maps_composedRouteWithPersistentData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v3];

  id v5 = [v4 buildRoute];
  [v5 updateCustomRouteStartEndCaptions];

  return v5;
}

- (id)_maps_convertToNavigableRouteWithTraits:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = objc_opt_new();
  double v12 = +[GEORouteAttributes defaultRouteAttributesForTransportType:[(GEOComposedRoute *)self transportType]];
  if (+[PedestrianARSessionTask isPedestrianARModeSupported])
  {
    double v13 = objc_opt_new();
    [v13 setSupportsArMode:1];
    [v11 setCommonOptions:v13];
    unsigned int v14 = sub_10000AF10();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Marking route request with supportsArMode", buf, 0xCu);
    }
  }
  else
  {
    double v13 = sub_10000AF10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] NOT marking route request with supportsArMode", buf, 0xCu);
    }
  }

  [v11 setRouteAttributes:v12];
  if (v8)
  {
    [v11 setTraits:v8];
  }
  else
  {
    double v15 = objc_opt_new();
    [v11 setTraits:v15];
  }
  CLLocationCoordinate2D v16 = objc_opt_new();
  [v11 setClientAttributes:v16];

  [v11 setCurrentRoute:self];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100AB5094;
  v21[3] = &unk_1013166B8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  double v19 = +[MNRouteEditor convertToNavigableRoute:v11 finishedHandler:v21];

  return v19;
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4
{
  return [(GEOComposedRoute *)self suggestedNavigationModeForLocation:a3 context:a4 ignoreDeviceNavigability:0];
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)MNSuggestedNavigationModeFinder) initWithRoute:self context:a4 ignoreDeviceNavigability:v5];
  id v10 = [v9 suggestedNavigationModeForLocation:v8];

  return (unint64_t)v10;
}

- (NSArray)composedGuidanceEventsWithSignGuidance
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self composedGuidanceEvents];
  id v3 = +[NSPredicate predicateWithBlock:&stru_10131B540];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (NSArray)composedGuidanceEventsWithLaneGuidance
{
  unsigned __int8 v2 = [(GEOComposedRoute *)self composedGuidanceEvents];
  id v3 = +[NSPredicate predicateWithBlock:&stru_10131B560];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (id)nextLaneGuidanceEventAfterEvent:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(GEOComposedRoute *)self composedGuidanceEvents];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v7)
        {
          unint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) lanes];
          id v12 = [v11 count];

          if (v12)
          {
            id v6 = v10;
            goto LABEL_12;
          }
        }
        v7 |= v10 == v4;
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)shouldReturnToRoutePickerWhenEndingDirectionsAtStepIndex:(unint64_t)a3
{
  if ([(GEOComposedRoute *)self isWalkingOnlyTransitRoute]) {
    return 1;
  }
  if ([(GEOComposedRoute *)self transportType] != 1) {
    return 0;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  id v6 = +[MNNavigationService sharedService];
  unsigned int v7 = [v6 isTrackingCurrentLocation];

  if (!v7) {
    return 1;
  }
  uint64_t v8 = [(GEOComposedRoute *)self steps];
  id v9 = [v8 firstObject];
  id v10 = [v9 nextAlightingStep];

  BOOL v5 = (unint64_t)[v10 stepIndex] >= a3;
  return v5;
}

- (NSString)abbreviatedDistance
{
  [(GEOComposedRoute *)self distance];
  if (v3 == 0.0)
  {
    id v4 = 0;
  }
  else
  {
    [(GEOComposedRoute *)self distance];
    id v4 = +[NSString _mapkit_localizedDistanceStringWithMeters:v5 abbreviated:1];
  }

  return (NSString *)v4;
}

- (NSString)expandedTravelTime
{
  [(GEOComposedRoute *)self travelAndChargingDuration];
  if (v3 == 0.0)
  {
    id v4 = 0;
  }
  else
  {
    [(GEOComposedRoute *)self travelAndChargingDuration];
    id v4 = +[NSString _navigation_stringWithSeconds:v5 abbreviated:0];
  }

  return (NSString *)v4;
}

- (NSString)accessibilityExpandedDistance
{
  [(GEOComposedRoute *)self distance];
  if (v3 == 0.0)
  {
    id v4 = 0;
  }
  else
  {
    [(GEOComposedRoute *)self distance];
    id v4 = +[NSString _mapkit_voiceOverLocalizedDistanceStringWithMeters:v5];
  }

  return (NSString *)v4;
}

- (NSString)expandedDistance
{
  [(GEOComposedRoute *)self distance];
  if (v3 == 0.0)
  {
    id v4 = 0;
  }
  else
  {
    [(GEOComposedRoute *)self distance];
    id v4 = +[NSString _mapkit_localizedDistanceStringWithMeters:v5 abbreviated:0];
  }

  return (NSString *)v4;
}

- (NSString)clientPickingDescription
{
  double v3 = [(GEOComposedRoute *)self abbreviatedDistance];
  id v4 = [(GEOComposedRoute *)self name];
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    double v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"WalkingDrivingRoute_SecondaryTextFormat" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v3 length]) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v4;
    }
    id v7 = v8;
  }

  return (NSString *)v7;
}

- (GuidanceETA)guidanceETA
{
  [(GEOComposedRoute *)self distance];
  double v4 = v3;
  [(GEOComposedRoute *)self travelAndChargingDuration];
  double v6 = v5;
  id v7 = [(GEOComposedRoute *)self destination];
  uint64_t v8 = [v7 timezone];

  if ([(GEOComposedRoute *)self isEVRoute])
  {
    id v9 = [(GEOComposedRoute *)self lastEVStep];
    id v10 = [v9 evInfo];
    unint64_t v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 remainingBatteryPercentage]);
  }
  else
  {
    unint64_t v11 = 0;
  }
  id v12 = [[GuidanceETA alloc] initWithRemainingTime:v11 remainingDistance:v8 arrivalBatteryCharge:[(GEOComposedRoute *)self transportType] destinationTimeZone:v6 transportType:v4];

  return v12;
}

- (BOOL)_maps_isEqualToComposedRoute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [v4 uniqueRouteID];
    uint64_t v8 = [(GEOComposedRoute *)self uniqueRouteID];
    if ([v7 isEqual:v8])
    {
      id v9 = [v4 rideSelections];
      id v10 = [(GEOComposedRoute *)self rideSelections];
      unint64_t v11 = v9;
      unint64_t v12 = v10;
      if (!(v11 | v12))
      {
        unsigned __int8 v6 = 1;
LABEL_8:

        goto LABEL_9;
      }
      long long v14 = (void *)v12;
      unsigned __int8 v15 = [(id)v11 isEqual:v12];

      if (v15)
      {
        unsigned __int8 v6 = 1;
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v7 = [v4 segments];
    uint64_t v8 = [(GEOComposedRoute *)self segments];
    unsigned __int8 v6 = [v7 isEqualToArray:v8];
    goto LABEL_8;
  }
  unsigned __int8 v6 = 0;
LABEL_9:

  return v6;
}

- (TransitDirectionsStepsListDataProvider)transitDirectionsStepsListDataProvider
{
  if ([(GEOComposedRoute *)self transportType] == 1
    || [(GEOComposedRoute *)self isWalkingOnlyTransitRoute])
  {
    objc_getAssociatedObject(self, &unk_101611098);
    double v3 = (TransitDirectionsStepsListDataProvider *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      double v3 = [[TransitDirectionsStepsListDataProvider alloc] initWithRoute:self forGuidance:0];
      objc_setAssociatedObject(self, &unk_101611098, v3, (void *)1);
    }
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (BOOL)carplayDestinationHandoffRequired
{
  double v3 = +[CarDisplayController sharedInstance];
  if ([v3 isCurrentlyConnectedToCarAppScene])
  {
    id v4 = +[MapsExternalDevice sharedInstance];
    if ([v4 isNavigationAidedDrivingEnabled]) {
      BOOL v5 = [(GEOComposedRoute *)self transportType] == 0;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_maps_routeRequestStorage
{
  id v3 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  id v4 = [(GEOComposedRoute *)self waypoints];
  id v5 = [v4 mutableCopy];
  [v3 setWaypoints:v5];

  unsigned __int8 v6 = [(GEOComposedRoute *)self persistentData];
  [v3 setDestinationRouteData:v6];

  [v3 setTransportType:[self transportType]];
  id v7 = [(GEOComposedRoute *)self routeAttributes];
  uint64_t v8 = [v7 automobileOptions];
  [v3 setAutomobileOptions:v8];

  id v9 = [v7 walkingOptions];
  [v3 setWalkingOptions:v9];

  id v10 = [v7 transitOptions];
  [v3 setTransitOptions:v10];

  unint64_t v11 = [v7 cyclingOptions];
  [v3 setCyclingOptions:v11];

  return v3;
}

@end