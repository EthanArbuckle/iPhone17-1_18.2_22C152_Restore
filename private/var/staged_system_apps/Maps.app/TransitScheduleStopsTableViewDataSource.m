@interface TransitScheduleStopsTableViewDataSource
+ (void)registerCellsForCollectionView:(id)a3;
- (BOOL)_hasVehicleDepartedStation;
- (BOOL)_isPastDeparture:(id)a3;
- (BOOL)canShowMoreStops;
- (BOOL)hasStops;
- (GEOTransitLine)transitLine;
- (NSArray)stopIdentifiers;
- (NSArray)transitTripStopItems;
- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 alightStopMuid:(unint64_t)a4 alightHallMuid:(unint64_t)a5 alightStationMuid:(unint64_t)a6 transitLine:(id)a7 referenceDate:(id)a8;
- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 transitLine:(id)a4 referenceDate:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)stopItemAtIndex:(unint64_t)a3;
- (unint64_t)_linkColorTypeForStopAtIndex:(unint64_t)a3;
- (unint64_t)remoteNetworkState;
- (void)_adjustIndexesForCollapsedStopsBeforeBoardingIndex:(unint64_t)a3;
- (void)_updatePastDepartureAndVehicleIndexes;
- (void)buildTransitTripStopItemsWithTransitStops:(id)a3 boardingStopDepartureDate:(id)a4 maintainingCollapsedState:(BOOL)a5;
- (void)expandTransitTripStops;
- (void)removeAllStops;
- (void)setReferenceDate:(id)a3 dataSource:(id)a4;
- (void)setRemoteNetworkState:(unint64_t)a3;
- (void)setTransitLine:(id)a3;
@end

@implementation TransitScheduleStopsTableViewDataSource

- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 alightStopMuid:(unint64_t)a4 alightHallMuid:(unint64_t)a5 alightStationMuid:(unint64_t)a6 transitLine:(id)a7 referenceDate:(id)a8
{
  result = [(TransitScheduleStopsTableViewDataSource *)self initWithBoardingStopMuid:a3 transitLine:a7 referenceDate:a8];
  if (result)
  {
    result->_alightStopMuid = a4;
    result->_alightHallMuid = a5;
    result->_alightStationMuid = a6;
    result->_hasAlightStop = 1;
  }
  return result;
}

- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 transitLine:(id)a4 referenceDate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TransitScheduleStopsTableViewDataSource;
  v11 = [(TransitScheduleStopsTableViewDataSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_boardingStopMuid = a3;
    objc_storeStrong((id *)&v11->_transitLine, a4);
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    v12->_remoteNetworkState = 0;
    *(int64x2_t *)&v12->_alightStopItemIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }

  return v12;
}

+ (void)registerCellsForCollectionView:(id)a3
{
  id v7 = a3;
  uint64_t v3 = objc_opt_class();
  v4 = +[TransitSchedulesStopViewCell identifier];
  [v7 registerClass:v3 forCellWithReuseIdentifier:v4];

  uint64_t v5 = objc_opt_class();
  v6 = +[TransitSchedulesCollapsedStopsPlaceholderViewCell identifier];
  [v7 registerClass:v5 forCellWithReuseIdentifier:v6];

  [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TransitScheduleNetworkActivityTableViewCellIdentifier"];
}

- (void)removeAllStops
{
  transitTripStopItems = self->_transitTripStopItems;
  self->_transitTripStopItems = 0;

  [(TransitScheduleStopsTableViewDataSource *)self setRemoteNetworkState:0];
}

- (void)buildTransitTripStopItemsWithTransitStops:(id)a3 boardingStopDepartureDate:(id)a4 maintainingCollapsedState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSArray *)[v8 copy];
  transitStops = self->_transitStops;
  self->_transitStops = v10;

  objc_storeStrong((id *)&self->_boardingStopDepartureDate, a4);
  *(int64x2_t *)&self->_alightStopItemIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_mostRecentPastDepartureStopItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5) {
    self->_canShowMoreStops = 1;
  }
  id v12 = objc_alloc_init((Class)NSMutableIndexSet);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100432458;
  v67[3] = &unk_1012EA308;
  v67[4] = self;
  id v55 = v9;
  id v68 = v55;
  id v13 = v12;
  id v69 = v13;
  [v8 enumerateObjectsUsingBlock:v67];
  if (self->_boardingStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v14 = sub_100576CFC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t boardingStopMuid = self->_boardingStopMuid;
      *(_DWORD *)buf = 134217984;
      unint64_t v72 = boardingStopMuid;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not find the a boarding trip stop with muid %llu", buf, 0xCu);
    }
  }
  if (self->_hasAlightStop && self->_alightStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = sub_100576CFC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t alightStopMuid = self->_alightStopMuid;
      *(_DWORD *)buf = 134217984;
      unint64_t v72 = alightStopMuid;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not find an alight trip stop with muid %llu", buf, 0xCu);
    }
  }
  if (!self->_canShowMoreStops)
  {
    int v58 = 0;
    goto LABEL_27;
  }
  unint64_t boardingStopItemIndex = self->_boardingStopItemIndex;
  BOOL v20 = boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL && boardingStopItemIndex > 1;
  int v58 = v20;
  if (!self->_hasAlightStop) {
    goto LABEL_27;
  }
  alightStopItemIndex = (char *)self->_alightStopItemIndex;
  if (alightStopItemIndex == (char *)0x7FFFFFFFFFFFFFFFLL
    || alightStopItemIndex >= (char *)[v8 count] - 1)
  {
    goto LABEL_27;
  }
  int v57 = 1;
  if (boardingStopItemIndex >= 2 && boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_alightStopItemIndex > self->_boardingStopItemIndex)
    {
      int v57 = 1;
      goto LABEL_28;
    }
    v53 = sub_100576CFC();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "The alighting stop was found before the boarding stop.", buf, 2u);
    }

LABEL_27:
    int v57 = 0;
  }
LABEL_28:
  if (v5 && [(NSArray *)self->_transitTripStopItems count])
  {
    id v22 = v13;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v23 = self->_transitTripStopItems;
    id v24 = [(NSArray *)v23 countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v24)
    {
      id v25 = v24;
      int v26 = 0;
      int v27 = 0;
      uint64_t v28 = *(void *)v64;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v23);
          }
          v30 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if ([v30 type] == (id)1) {
            int v27 = 1;
          }
          else {
            v26 |= [v30 type] == (id)2;
          }
        }
        id v25 = [(NSArray *)v23 countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v25);
    }
    else
    {
      int v26 = 0;
      int v27 = 0;
    }

    v58 &= v27;
    v57 &= v26;
    id v13 = v22;
  }
  v31 = +[NSMutableArray array];
  if ((v58 & 1) != 0 || (v57 & 1) != 0 || [v13 count])
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10043254C;
    v61[3] = &unk_1012EA330;
    id v56 = objc_alloc_init((Class)NSMutableArray);
    id v62 = v56;
    [v13 enumerateRangesUsingBlock:v61];
    if (v58 && (unint64_t v32 = self->_boardingStopItemIndex) != 0)
    {
      unint64_t v33 = v32 - 1;
      v34 = [v8 objectAtIndexedSubscript:v32 - 1];
      if ([v34 isHidden]) {
        unint64_t v33 = self->_boardingStopItemIndex;
      }
    }
    else
    {
      unint64_t v33 = 0;
    }
    v54 = v13;
    if (v57) {
      unint64_t v35 = self->_alightStopItemIndex;
    }
    else {
      unint64_t v35 = (unint64_t)[v8 count] - 1;
    }
    if ([v8 count])
    {
      unint64_t v36 = 0;
      unint64_t v37 = ~v35;
      do
      {
        v38 = [v8 objectAtIndexedSubscript:v36];
        v39 = v38;
        int v40 = v58;
        if (v36 >= v33) {
          int v40 = 0;
        }
        if (v40 == 1)
        {
          v41 = [[TransitTripStopItem alloc] initWithPlaceHolderType:1 numCollapsedStops:v33];
          [v31 addObject:v41];
          [(TransitScheduleStopsTableViewDataSource *)self _adjustIndexesForCollapsedStopsBeforeBoardingIndex:v33];
          uint64_t v42 = v33;
        }
        else
        {
          if (v36 > v35) {
            int v43 = v57;
          }
          else {
            int v43 = 0;
          }
          if (v43 == 1)
          {
            uint64_t v42 = (uint64_t)[v8 count] + v37;
            v41 = [[TransitTripStopItem alloc] initWithPlaceHolderType:2 numCollapsedStops:v42];
            [v31 addObject:v41];
          }
          else if ([v38 isHidden])
          {
            v44 = [v56 firstObject];
            [v44 rangeValue];
            uint64_t v42 = v45;

            [v56 removeObjectAtIndex:0];
            unint64_t v46 = self->_boardingStopItemIndex;
            v47 = [TransitTripStopItem alloc];
            if (v36 >= v46)
            {
              v41 = [(TransitTripStopItem *)v47 initWithPlaceHolderType:2 numCollapsedStops:v42];
              [v31 addObject:v41];
            }
            else
            {
              v41 = [(TransitTripStopItem *)v47 initWithPlaceHolderType:1 numCollapsedStops:v42];
              [v31 addObject:v41];
              [(TransitScheduleStopsTableViewDataSource *)self _adjustIndexesForCollapsedStopsBeforeBoardingIndex:v42];
            }
            unint64_t v37 = ~v35;
          }
          else
          {
            v41 = [[TransitTripStopItem alloc] initWithTransitTripStop:v39 stopIndex:v36];
            [v31 addObject:v41];
            uint64_t v42 = 1;
          }
        }

        v36 += v42;
      }
      while (v36 < (unint64_t)[v8 count]);
    }
    if (v58)
    {
      id v13 = v54;
      char v48 = [v54 containsIndexesInRange:0, v33] ^ 1;
    }
    else
    {
      char v48 = 0;
      id v13 = v54;
    }
    v49 = (char *)[v8 count];
    char v50 = v57;
    if (v57) {
      char v50 = [v13 containsIndexesInRange:v35 + 1, v49[-v35 - 1]];
    }
    self->_canShowMoreStops = v48 | v50;
  }
  else
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1004325B0;
    v59[3] = &unk_1012EA358;
    id v60 = v31;
    [v8 enumerateObjectsUsingBlock:v59];
    self->_canShowMoreStops = 0;
  }
  v51 = (NSArray *)[v31 copy];
  transitTripStopItems = self->_transitTripStopItems;
  self->_transitTripStopItems = v51;

  [(TransitScheduleStopsTableViewDataSource *)self _updatePastDepartureAndVehicleIndexes];
  [(TransitScheduleStopsTableViewDataSource *)self setRemoteNetworkState:1];
}

- (void)_adjustIndexesForCollapsedStopsBeforeBoardingIndex:(unint64_t)a3
{
  unint64_t boardingStopItemIndex = self->_boardingStopItemIndex;
  unint64_t mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
  if (mostRecentPastDepartureStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (mostRecentPastDepartureStopItemIndex >= boardingStopItemIndex) {
      unint64_t v5 = mostRecentPastDepartureStopItemIndex - a3 + 1;
    }
    else {
      unint64_t v5 = 0;
    }
    self->_unint64_t mostRecentPastDepartureStopItemIndex = v5;
  }
  self->_unint64_t boardingStopItemIndex = boardingStopItemIndex - a3 + 1;
  unint64_t alightStopItemIndex = self->_alightStopItemIndex;
  if (alightStopItemIndex != 0x7FFFFFFFFFFFFFFFLL) {
    self->_unint64_t alightStopItemIndex = alightStopItemIndex - a3 + 1;
  }
}

- (id)stopItemAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (BOOL)hasStops
{
  return [(NSArray *)self->_transitTripStopItems count] != 0;
}

- (NSArray)stopIdentifiers
{
  transitTripStopItems = self->_transitTripStopItems;
  uint64_t v3 = NSStringFromSelector("identifier");
  v4 = [(NSArray *)transitTripStopItems valueForKey:v3];

  return (NSArray *)v4;
}

- (void)setReferenceDate:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![(NSDate *)self->_referenceDate isEqualToDate:v7])
  {
    objc_storeStrong((id *)&self->_referenceDate, a3);
    unint64_t v9 = self->_mostRecentPastDepartureStopItemIndex == 0x7FFFFFFFFFFFFFFFLL
       ? 0
       : self->_mostRecentPastDepartureStopItemIndex;
    [(TransitScheduleStopsTableViewDataSource *)self _updatePastDepartureAndVehicleIndexes];
    unint64_t mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
    if (mostRecentPastDepartureStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (mostRecentPastDepartureStopItemIndex <= self->_vehicleStopItemIndex) {
        unint64_t mostRecentPastDepartureStopItemIndex = self->_vehicleStopItemIndex;
      }
      v11 = (char *)(mostRecentPastDepartureStopItemIndex + 1);
      if ((char *)(mostRecentPastDepartureStopItemIndex + 1) >= (char *)[(NSArray *)self->_transitTripStopItems count]- 1)v11 = (char *)[(NSArray *)self->_transitTripStopItems count] - 1; {
      id v12 = &v11[-v9];
      }
      if (v12 && (id)[(TransitScheduleStopsTableViewDataSource *)self remoteNetworkState] == (id)1)
      {
        id v33 = v7;
        v31 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v9, v12);
        id v13 = -[NSArray objectsAtIndexes:](self->_transitTripStopItems, "objectsAtIndexes:");
        objc_super v14 = NSStringFromSelector("identifier");
        v15 = [v13 valueForKeyPath:v14];

        unint64_t v32 = v8;
        v16 = [v8 snapshot];
        v30 = v15;
        id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v15 count]];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v18 = v13;
        id v19 = [v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              id v24 = [v23 identifier];
              if ([v16 indexOfItemIdentifier:v24] == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                id v25 = sub_100576CFC();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  id v26 = v18;
                  v28 = id v27 = v17;
                  v29 = [v23 description];
                  *(_DWORD *)buf = 138412802;
                  int v40 = v28;
                  __int16 v41 = 2112;
                  uint64_t v42 = v24;
                  __int16 v43 = 2112;
                  v44 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@ - Could not find identifier %@ for stop %@ in snapshot", buf, 0x20u);

                  id v17 = v27;
                  id v18 = v26;
                }
              }
              else
              {
                [v17 addObject:v24];
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v20);
        }

        [v16 reloadItemsWithIdentifiers:v17];
        id v8 = v32;
        [v32 applySnapshot:v16 animatingDifferences:1];

        id v7 = v33;
      }
    }
  }
}

- (BOOL)_isPastDeparture:(id)a3
{
  return [a3 isPastDepartureRelativeToDate:self->_referenceDate usingGracePeriod:0];
}

- (void)_updatePastDepartureAndVehicleIndexes
{
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100103BCC;
  v7[4] = sub_100104670;
  id v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  uint64_t v3 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100432CB8;
  v4[3] = &unk_1012EA380;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = v7;
  v4[7] = &v9;
  v4[8] = &v13;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v4];

  self->_unint64_t mostRecentPastDepartureStopItemIndex = v10[3];
  self->_vehicleStopItemIndex = v14[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)expandTransitTripStops
{
  self->_canShowMoreStops = 0;
  [(TransitScheduleStopsTableViewDataSource *)self buildTransitTripStopItemsWithTransitStops:self->_transitStops boardingStopDepartureDate:self->_boardingStopDepartureDate maintainingCollapsedState:1];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (char *)[v7 row];
  id v10 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

  if ([v11 isPlaceholder])
  {
    uint64_t v12 = +[TransitSchedulesCollapsedStopsPlaceholderViewCell identifier];
    uint64_t v13 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];

    objc_super v14 = [v11 placeholderTextForLine:self->_transitLine];
    [v13 setPlaceholderText:v14];
  }
  else
  {
    uint64_t v15 = +[TransitSchedulesStopViewCell identifier];
    uint64_t v13 = [v8 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];

    objc_super v14 = [v11 transitTripStop];
    if (v9)
    {
      uint64_t v16 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
      id v17 = (char *)[v16 count] - 1;

      if (v9 == v17) {
        uint64_t v18 = 3;
      }
      else {
        uint64_t v18 = 2;
      }
    }
    else
    {
      uint64_t v18 = 1;
    }
    unint64_t boardingStopItemIndex = self->_boardingStopItemIndex;
    if (v9 != (char *)boardingStopItemIndex && self->_hasAlightStop && v9 == (char *)self->_alightStopItemIndex)
    {
      id v20 = [v14 departure];
      [v13 setHighlightStation:[v20 isCanceled] ^ 1];
    }
    else
    {
      [v13 setHighlightStation:v9 == (char *)boardingStopItemIndex];
    }
    unint64_t v21 = [(TransitScheduleStopsTableViewDataSource *)self _linkColorTypeForStopAtIndex:v9];
    unint64_t v22 = v21;
    if (v9)
    {
      unint64_t v33 = v21;
      v23 = [(TransitScheduleStopsTableViewDataSource *)self transitTripStopItems];
      id v24 = [v23 objectAtIndexedSubscript:v9 - 1];

      id v25 = [v24 transitTripStop];
      id v26 = [v25 timeZone];

      uint64_t v27 = 0;
      if (([v24 isPlaceholder] & 1) == 0 && v26)
      {
        uint64_t v28 = [v14 timeZone];
        if (v28)
        {
          [v14 timeZone];
          v29 = uint64_t v32 = v18;
          uint64_t v27 = [v29 isEqualToTimeZone:v26] ^ 1;

          uint64_t v18 = v32;
        }
        else
        {
          uint64_t v27 = 0;
        }
      }
      unint64_t v22 = v33;
    }
    else
    {
      uint64_t v27 = 0;
    }
    if (v9 == (char *)self->_vehicleStopItemIndex)
    {
      if ([(TransitScheduleStopsTableViewDataSource *)self _hasVehicleDepartedStation]) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    [v13 setTransitLine:self->_transitLine withTransitTripStop:v14 stopType:v18 colorStyleType:v22 vehiclePosition:v30 showTimeZone:v27];
  }

  return v13;
}

- (BOOL)_hasVehicleDepartedStation
{
  uint64_t v3 = [(NSArray *)self->_transitTripStopItems objectAtIndexedSubscript:self->_vehicleStopItemIndex];
  v4 = [v3 transitTripStop];
  unint64_t v5 = [v4 departure];

  char v6 = [v5 departureDate];

  if (v6) {
    unsigned __int8 v7 = [v5 isPastDepartureRelativeToDate:self->_referenceDate usingGracePeriod:1];
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (unint64_t)_linkColorTypeForStopAtIndex:(unint64_t)a3
{
  unint64_t boardingStopItemIndex = self->_boardingStopItemIndex;
  if (boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL && boardingStopItemIndex > a3) {
    return 2;
  }
  unint64_t mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
  if (mostRecentPastDepartureStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    if (boardingStopItemIndex == a3) {
      return 3;
    }
    else {
      return 1;
    }
  }
  if (self->_vehicleStopItemIndex != a3)
  {
    if (mostRecentPastDepartureStopItemIndex < a3)
    {
      if (mostRecentPastDepartureStopItemIndex + 1 == a3) {
        return 3;
      }
      goto LABEL_6;
    }
    return 2;
  }
  if ([(TransitScheduleStopsTableViewDataSource *)self _hasVehicleDepartedStation]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)remoteNetworkState
{
  return self->_remoteNetworkState;
}

- (void)setRemoteNetworkState:(unint64_t)a3
{
  self->_remoteNetworkState = a3;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void)setTransitLine:(id)a3
{
}

- (BOOL)canShowMoreStops
{
  return self->_canShowMoreStops;
}

- (NSArray)transitTripStopItems
{
  return self->_transitTripStopItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitTripStopItems, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_boardingStopDepartureDate, 0);
  objc_storeStrong((id *)&self->_transitStops, 0);

  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end