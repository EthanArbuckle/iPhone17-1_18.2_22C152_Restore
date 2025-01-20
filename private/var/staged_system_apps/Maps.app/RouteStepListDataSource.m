@interface RouteStepListDataSource
- (GEOComposedRoute)route;
- (NSArray)items;
- (NSIndexSet)allowedStepIndices;
- (NSLocale)currentLocale;
- (NSMutableIndexSet)excludedStepIndices;
- (RouteStepListDataSource)initWithTraitCollection:(id)a3 options:(unint64_t)a4 metrics:(id)a5 context:(int64_t)a6;
- (RouteStepListDataSourceDelegate)delegate;
- (RouteStepListMetrics)metrics;
- (UITraitCollection)traitCollection;
- (VGVehicle)vehicle;
- (id)firstStepManeuverItem;
- (id)lastStepManeuverItem;
- (int64_t)context;
- (unint64_t)_firstDisplayedStepIndex;
- (unint64_t)_highlightedStepIndex;
- (unint64_t)activeStepIndex;
- (unint64_t)itemIndexForStepIndex:(unint64_t)a3;
- (unint64_t)missedStepIndex;
- (unint64_t)options;
- (void)_appendItem:(id)a3 toArray:(id)a4;
- (void)_calculateItems;
- (void)_localeDidChange;
- (void)setActiveStepIndex:(unint64_t)a3;
- (void)setAllowedStepIndices:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedStepIndices:(id)a3;
- (void)setItems:(id)a3;
- (void)setMissedStepIndex:(unint64_t)a3;
- (void)setRoute:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setVehicle:(id)a3;
@end

@implementation RouteStepListDataSource

- (void)setRoute:(id)a3
{
  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = sub_10000AF10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(GEOComposedRoute *)self->_route uniqueRouteID];
      v8 = [(GEOComposedRoute *)v5 uniqueRouteID];
      int v13 = 138412546;
      v14 = v7;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing data source's route from %@ to %@", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong((id *)&self->_route, a3);
    self->_activeStepIndex = 0;
    excludedStepIndices = self->_excludedStepIndices;
    self->_excludedStepIndices = 0;

    allowedStepIndices = self->_allowedStepIndices;
    self->_allowedStepIndices = 0;

    self->_missedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    items = self->_items;
    self->_items = 0;

    v12 = [(RouteStepListDataSource *)self delegate];
    [v12 reloadDataSource:self];
  }
}

- (NSMutableIndexSet)excludedStepIndices
{
  excludedStepIndices = self->_excludedStepIndices;
  if (!excludedStepIndices)
  {
    v4 = (NSMutableIndexSet *)objc_opt_new();
    v5 = self->_excludedStepIndices;
    self->_excludedStepIndices = v4;

    excludedStepIndices = self->_excludedStepIndices;
  }

  return excludedStepIndices;
}

- (unint64_t)_firstDisplayedStepIndex
{
  if (([(RouteStepListDataSource *)self options] & 8) != 0) {
    return 0;
  }
  v3 = [(RouteStepListDataSource *)self route];
  v4 = [v3 steps];
  v5 = [v4 firstObject];

  if ([v5 maneuverType] == 17)
  {
    v6 = [v5 geoStep];
    v7 = [v6 instructionSet];
    unint64_t v8 = [v7 hasDrivingWalkingListInstruction] ^ 1;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)_highlightedStepIndex
{
  unint64_t v3 = [(RouteStepListDataSource *)self _firstDisplayedStepIndex];
  v4 = [(RouteStepListDataSource *)self route];
  v5 = [v4 steps];
  id v6 = [v5 count];

  if (v3 >= (unint64_t)v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 0;
  while (v3 + v7 != [(RouteStepListDataSource *)self activeStepIndex])
  {
    if ([(RouteStepListDataSource *)self activeStepIndex] < v3 + v7 && !v7) {
      return v3;
    }
    unint64_t v8 = [(RouteStepListDataSource *)self route];
    v9 = [v8 steps];
    id v10 = [v9 count];

    ++v7;
    if (v3 + v7 >= (unint64_t)v10) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v3 += v7;
  return v3;
}

- (void)setActiveStepIndex:(unint64_t)a3
{
  unint64_t activeStepIndex = self->_activeStepIndex;
  if (activeStepIndex == a3) {
    return;
  }
  self->_unint64_t activeStepIndex = a3;
  id v6 = [(RouteStepListDataSource *)self items];
  id v7 = [v6 count];

  if (!v7) {
    return;
  }
  id v18 = (id)objc_opt_new();
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && activeStepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = [(RouteStepListDataSource *)self items];
    if ((unint64_t)[v8 count] <= a3)
    {
    }
    else
    {
      v9 = [(RouteStepListDataSource *)self items];
      id v10 = [v9 count];

      if (activeStepIndex < (unint64_t)v10)
      {
        if (activeStepIndex >= a3) {
          unint64_t v11 = a3;
        }
        else {
          unint64_t v11 = activeStepIndex;
        }
        if (activeStepIndex <= a3) {
          v12 = (char *)a3;
        }
        else {
          v12 = (char *)activeStepIndex;
        }
        goto LABEL_16;
      }
    }
  }
  unint64_t v11 = 0;
  v12 = (char *)[(NSArray *)self->_items count] - 1;
  do
  {
LABEL_16:
    if (a3 == v11) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v11 >= a3;
    }
    v14 = [(RouteStepListDataSource *)self items];
    __int16 v15 = [v14 objectAtIndexedSubscript:v11];

    [v15 setState:v13];
    [v18 addIndex:v11];

    ++v11;
  }
  while (v11 <= (unint64_t)v12);
  v16 = [(RouteStepListDataSource *)self delegate];
  id v17 = [v18 copy];
  [v16 reloadStepIndices:v17 forDataSource:self];
}

- (void)setMissedStepIndex:(unint64_t)a3
{
  if (self->_missedStepIndex != a3)
  {
    self->_missedStepIndex = a3;
    items = self->_items;
    self->_items = 0;

    id v5 = [(RouteStepListDataSource *)self delegate];
    [v5 reloadDataSource:self];
  }
}

- (void)setVehicle:(id)a3
{
  id v5 = a3;
  p_vehicle = &self->_vehicle;
  unint64_t v7 = self->_vehicle;
  unint64_t v8 = (unint64_t)v5;
  if (v8 | v7)
  {
    id v17 = (id)v8;
    unsigned __int8 v9 = [(id)v7 isEqual:v8];

    unint64_t v8 = (unint64_t)v17;
    if ((v9 & 1) == 0)
    {
      id v10 = [(VGVehicle *)*p_vehicle displayName];
      unint64_t v11 = [v17 displayName];
      if ([v10 isEqualToString:v11])
      {
        v12 = [(VGVehicle *)*p_vehicle currentVehicleState];
        uint64_t v13 = [v17 currentVehicleState];
        unsigned int v14 = [v12 isSignificantlyDifferentFromVehicleState:v13];

        unint64_t v8 = (unint64_t)v17;
        if (!v14) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_vehicle, a3);
      items = self->_items;
      self->_items = 0;

      v16 = [(RouteStepListDataSource *)self delegate];
      [v16 reloadDataSource:self];

      unint64_t v8 = (unint64_t)v17;
    }
  }
LABEL_8:
}

- (void)setAllowedStepIndices:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_allowedStepIndices;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v11 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v11;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_allowedStepIndices, a3);
      items = self->_items;
      self->_items = 0;

      id v10 = [(RouteStepListDataSource *)self delegate];
      [v10 reloadDataSource:self];

      unint64_t v7 = (unint64_t)v11;
    }
  }
}

- (void)setTraitCollection:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_traitCollection;
  v19 = (UITraitCollection *)v5;
  if (v6 == v19)
  {

    id v18 = v19;
    goto LABEL_11;
  }
  id v7 = [(UITraitCollection *)v6 userInterfaceStyle];
  if (v7 != (id)[(UITraitCollection *)v19 userInterfaceStyle]) {
    goto LABEL_8;
  }
  [(UITraitCollection *)v6 displayScale];
  double v9 = v8;
  [(UITraitCollection *)v19 displayScale];
  if (v9 != v10) {
    goto LABEL_8;
  }
  id v11 = [(UITraitCollection *)v6 preferredContentSizeCategory];
  v12 = [(UITraitCollection *)v19 preferredContentSizeCategory];
  uint64_t v13 = sub_1000E93B0(v11, v12);

  if (v13
    || (id v14 = [(UITraitCollection *)v6 horizontalSizeClass],
        v14 != (id)[(UITraitCollection *)v19 horizontalSizeClass]))
  {
LABEL_8:

    goto LABEL_9;
  }
  id v15 = [(UITraitCollection *)v6 verticalSizeClass];
  id v16 = [(UITraitCollection *)v19 verticalSizeClass];

  if (v15 != v16)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_traitCollection, a3);
    items = self->_items;
    self->_items = 0;

    id v18 = [(RouteStepListDataSource *)self delegate];
    [v18 reloadUIForDataSource:self];
LABEL_11:
  }
}

- (void)setCurrentLocale:(id)a3
{
  id v15 = a3;
  id v5 = [v15 objectForKey:NSLocaleMeasurementSystem];
  p_currentLocale = &self->_currentLocale;
  id v7 = [(NSLocale *)self->_currentLocale objectForKey:NSLocaleMeasurementSystem];
  unint64_t v8 = v5;
  unint64_t v9 = v7;
  if (v8 | v9)
  {
    v12 = (void *)v9;
    unsigned __int8 v13 = [(id)v8 isEqual:v9];

    objc_storeStrong((id *)&self->_currentLocale, a3);
    if (v13) {
      goto LABEL_6;
    }
    items = self->_items;
    self->_items = 0;

    id v11 = [(RouteStepListDataSource *)self delegate];
    [v11 reloadDataSource:self];
  }
  else
  {
    double v10 = (NSLocale *)v15;
    id v11 = *p_currentLocale;
    *p_currentLocale = v10;
  }

LABEL_6:
}

- (NSArray)items
{
  items = self->_items;
  if (!items)
  {
    [(RouteStepListDataSource *)self _calculateItems];
    items = self->_items;
  }

  return items;
}

- (unint64_t)itemIndexForStepIndex:(unint64_t)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(RouteStepListDataSource *)self excludedStepIndices];
    unsigned int v7 = [v6 containsIndex:0];

    if (a3 || (v7 & 1) == 0)
    {
      uint64_t v8 = v7;
      unint64_t v9 = [(RouteStepListDataSource *)self excludedStepIndices];
      id v10 = [v9 countOfIndexesInRange:v7, a3 - v7];

      unint64_t v3 = a3 - (void)v10;
      id v11 = [(RouteStepListDataSource *)self items];
      id v12 = [v11 count];

      if (v3 >= (unint64_t)v12)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1005274C8;
        block[3] = &unk_1012E9418;
        block[6] = v12;
        block[7] = a3;
        block[8] = v8;
        block[4] = self;
        block[5] = v3;
        if (qword_10160EFB8 != -1) {
          dispatch_once(&qword_10160EFB8, block);
        }
        if (v12) {
          return (unint64_t)v12 - 1;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (RouteStepListDataSource)initWithTraitCollection:(id)a3 options:(unint64_t)a4 metrics:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RouteStepListDataSource;
  unsigned __int8 v13 = [(RouteStepListDataSource *)&v19 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_options = a4;
    objc_storeStrong((id *)&v14->_metrics, a5);
    v14->_context = a6;
    v14->_missedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = +[NSLocale currentLocale];
    currentLocale = v14->_currentLocale;
    v14->_currentLocale = (NSLocale *)v15;

    id v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v14 selector:"_localeDidChange" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v14;
}

- (id)firstStepManeuverItem
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(RouteStepListDataSource *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)lastStepManeuverItem
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(RouteStepListDataSource *)self items];
  id v3 = [v2 reverseObjectEnumerator];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_calculateItems
{
  id v3 = objc_opt_new();
  id v4 = [(RouteStepListDataSource *)self metrics];
  unint64_t v71 = [(RouteStepListDataSource *)self activeStepIndex];
  uint64_t v5 = [(RouteStepListDataSource *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  v73 = self->_route;
  if ([(GEOComposedRoute *)v73 isEVRoute])
  {
    v68 = [(RouteStepListDataSource *)self vehicle];
  }
  else
  {
    v68 = 0;
  }
  long long v8 = [(RouteStepListDataSource *)self route];
  long long v9 = [v8 _maps_directionsWaypoints];

  long long v10 = sub_10000AF10();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = [(GEOComposedRoute *)v73 name];
    long long v12 = [(GEOComposedRoute *)v73 uniqueRouteID];
    *(_DWORD *)buf = 138412802;
    id v75 = v11;
    __int16 v76 = 2112;
    v77 = v12;
    __int16 v78 = 2048;
    id v79 = [(GEOComposedRoute *)v73 stepsCount];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Calculating items for route %@ (%@) with steps %lu", buf, 0x20u);
  }
  if ([(RouteStepListDataSource *)self options])
  {
    unsigned __int8 v13 = [(RouteStepListDataSource *)self route];
    id v14 = [v13 origin];

    if (v14)
    {
      uint64_t v15 = [RouteStepWaypointItem alloc];
      id v16 = [v9 firstObject];
      id v17 = [(RouteStepListDataSource *)self delegate];
      id v18 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v15, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v16, 0, 0, v68, v73, [v17 cellClassForItemType:0], v7, v71 == 0, v4, self->_context);

      [(RouteStepListDataSource *)self _appendItem:v18 toArray:v3];
    }
  }
  v66 = v9;
  unint64_t v70 = [(RouteStepListDataSource *)self _highlightedStepIndex];
  objc_super v19 = [(GEOComposedRoute *)v73 steps];
  v20 = (char *)[v19 count];

  v69 = v4;
  if (v20)
  {
    v21 = 0;
    v67 = v3;
    do
    {
      v22 = [(GEOComposedRoute *)v73 steps];
      v23 = [v22 objectAtIndexedSubscript:v21];

      if (v21
        || ([(RouteStepListDataSource *)self options] & 8) != 0
        || [v23 maneuverType] != 17
        || ([v23 geoStep],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v24 instructionSet],
            v25 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v26 = [v25 hasDrivingWalkingListInstruction],
            v25,
            v24,
            (v26 & 1) != 0))
      {
        if (v21 - 1 >= v20)
        {
          v28 = 0;
        }
        else
        {
          v27 = [(GEOComposedRoute *)v73 steps];
          v28 = [v27 objectAtIndexedSubscript:v21 - 1];
        }
        if ((([v28 isEVChargerStep] & 1) != 0
           || ([(RouteStepListDataSource *)self options] & 0x40) != 0)
          && [v23 maneuverType] == 85)
        {
          goto LABEL_33;
        }
        v29 = [v23 geoStep];

        if (!v29) {
          goto LABEL_33;
        }
        uint64_t v30 = [(RouteStepListDataSource *)self allowedStepIndices];
        if (!v30) {
          goto LABEL_24;
        }
        v31 = (void *)v30;
        v32 = [(RouteStepListDataSource *)self allowedStepIndices];
        unsigned __int8 v33 = [v32 containsIndex:v21];

        if ((v33 & 1) == 0)
        {
LABEL_33:
          v44 = [(RouteStepListDataSource *)self excludedStepIndices];
          [(RouteStepManeuverItem *)v44 addIndex:v21];
        }
        else
        {
LABEL_24:
          if (([(RouteStepListDataSource *)self options] & 2) != 0)
          {
            v72 = sub_100CFEC64(v23, v73);
            v34 = [(GEOComposedRoute *)v73 legs];
            v35 = objc_msgSend(v34, "objectAtIndexedSubscript:", -[GEOComposedRoute legIndexForStepIndex:](v73, "legIndexForStepIndex:", objc_msgSend(v23, "stepIndex")));

            v36 = [v35 destination];
            v37 = [v36 chargingInfo];

            v38 = [v35 destinationListSecondaryInstructions];
            id v39 = [v38 count];

            if (v72 && (v39 || !v37))
            {
              v45 = [RouteStepWaypointItem alloc];
              v65 = [(RouteStepListDataSource *)self delegate];
              v46 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v45, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v72, 1, v23, v68, v73, [v65 cellClassForItemType:0], v7, 1, v69, self->_context);

              id v4 = v69;
              id v3 = v67;
              [(RouteStepListDataSource *)self _appendItem:v46 toArray:v67];

              goto LABEL_35;
            }

            id v3 = v67;
            id v4 = v69;
          }
          if ((char *)v70 == v21) {
            uint64_t v40 = 2;
          }
          else {
            uint64_t v40 = (unint64_t)v21 >= v71;
          }
          v41 = [RouteStepManeuverItem alloc];
          v42 = [(RouteStepListDataSource *)self delegate];
          id v43 = [v42 cellClassForItemType:1];
          LOBYTE(v64) = v21 == (char *)self->_missedStepIndex;
          v44 = [(RouteStepManeuverItem *)v41 initWithRouteStep:v23 cellClass:v43 state:v40 metrics:v4 context:self->_context route:v73 scale:v7 isMissedStep:v64];

          [(RouteStepListDataSource *)self _appendItem:v44 toArray:v3];
        }
      }
      else
      {
        v28 = [(RouteStepListDataSource *)self excludedStepIndices];
        [v28 addIndex:0];
      }
LABEL_35:

      ++v21;
    }
    while (v20 != v21);
  }
  if (([(RouteStepListDataSource *)self options] & 4) != 0)
  {
    v47 = [(RouteStepListDataSource *)self route];
    v48 = [v47 destination];

    if (v48)
    {
      v49 = [RouteStepWaypointItem alloc];
      v50 = [v66 lastObject];
      v51 = [(RouteStepListDataSource *)self route];
      v52 = [v51 steps];
      v53 = [v52 lastObject];
      v54 = [(RouteStepListDataSource *)self delegate];
      v55 = -[RouteStepWaypointItem initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:](v49, "initWithWaypoint:waypointType:arrivalStep:vehicle:route:cellClass:state:metrics:context:scale:", v50, 2, v53, v68, v73, [v54 cellClassForItemType:0], v7, 1, v69, self->_context);

      id v4 = v69;
      [(RouteStepListDataSource *)self _appendItem:v55 toArray:v3];
    }
  }
  if (([(RouteStepListDataSource *)self options] & 0x20) != 0)
  {
    v56 = [(RouteStepListDataSource *)self route];
    unsigned int v57 = [v56 isMultipointRoute];

    if (v57) {
      uint64_t v58 = 0;
    }
    else {
      uint64_t v58 = 2;
    }
    if ([(GEOComposedRoute *)v73 transportType] != 1
      && ![(GEOComposedRoute *)v73 isWalkingOnlyTransitRoute])
    {
      v58 |= 8uLL;
    }
    v59 = [RouteStepFooterItem alloc];
    v60 = [(RouteStepListDataSource *)self delegate];
    v61 = -[RouteStepFooterItem initWithCommandSet:cellClass:state:metrics:context:route:scale:](v59, "initWithCommandSet:cellClass:state:metrics:context:route:scale:", v58, [v60 cellClassForItemType:2], 1, v4, self->_context, v73, v7);

    [(RouteStepListDataSource *)self _appendItem:v61 toArray:v3];
  }
  v62 = sub_10000AF10();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    id v63 = [v3 count];
    *(_DWORD *)buf = 134218242;
    id v75 = v63;
    __int16 v76 = 2112;
    v77 = v3;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Built %lu items: %@", buf, 0x16u);
  }

  [(RouteStepListDataSource *)self setItems:v3];
}

- (void)_appendItem:(id)a3 toArray:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(RouteStepListDataSource *)self traitCollection];
  [v11 setTraitCollection:v7];

  long long v8 = [(RouteStepListDataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v10 = [(RouteStepListDataSource *)self delegate];
    [v10 customizeItem:v11 forDataSource:self];
  }
  [v6 addObject:v11];
}

- (void)_localeDidChange
{
  id v3 = +[NSLocale currentLocale];
  [(RouteStepListDataSource *)self setCurrentLocale:v3];
}

- (RouteStepListDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteStepListDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)activeStepIndex
{
  return self->_activeStepIndex;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSIndexSet)allowedStepIndices
{
  return self->_allowedStepIndices;
}

- (unint64_t)missedStepIndex
{
  return self->_missedStepIndex;
}

- (RouteStepListMetrics)metrics
{
  return self->_metrics;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setExcludedStepIndices:(id)a3
{
}

- (void)setItems:(id)a3
{
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_excludedStepIndices, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_allowedStepIndices, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end