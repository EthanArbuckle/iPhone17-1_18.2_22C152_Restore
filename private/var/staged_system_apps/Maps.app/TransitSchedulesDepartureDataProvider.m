@interface TransitSchedulesDepartureDataProvider
+ (double)durationForVisibleDeparturesStartingAtDate:(id)a3 timeZone:(id)a4;
+ (id)departureSequenceContainingTripIdentifier:(unint64_t)a3 departureSequences:(id)a4;
+ (id)serviceTraitsForScheduleDate:(id)a3 timeZone:(id)a4;
- (BOOL)requestAllDirections;
- (BOOL)selectDepartureWithTripIdentifier:(unint64_t)a3;
- (GEOTransitDeparture)selectedDeparture;
- (GEOTransitDepartureSequence)selectedDepartureSequence;
- (NSArray)departureSequences;
- (NSArray)departures;
- (NSDate)scheduleWindowStartDate;
- (NSTimeZone)timeZone;
- (TransitSchedulesDepartureDataProvider)initWithTransitMapItem:(id)a3 selectedDepartureSequence:(id)a4 departureSequences:(id)a5 timeZone:(id)a6 initialScheduleDate:(id)a7;
- (TransitSchedulesDepartureDataProviderDelegate)delegate;
- (id)_departureSequenceContainingTripIdentifier:(unint64_t)a3;
- (id)filterActiveDepartureSequencesFrom:(id)a3 referenceDate:(id)a4;
- (id)frequencyStringForDeparture:(id)a3;
- (id)selectDepartureAtIndex:(unint64_t)a3;
- (unint64_t)_indexForNextIncomingDeparture;
- (unint64_t)_indexForSelectedTripIdentifier;
- (unint64_t)_indexForTripIdentifier:(unint64_t)a3 scheduledDepartureDate:(id)a4;
- (unint64_t)indexForDepartureSequence:(id)a3;
- (unint64_t)indexForSelectedDepartureSequence;
- (unint64_t)remoteNetworkState;
- (unint64_t)timeDisplayStyle;
- (void)_clearDepartures;
- (void)_fetchNewScheduleDataForDate:(id)a3 tripIdentifier:(unint64_t)a4 withHandler:(id)a5;
- (void)processDeparturesFromDepartureSequences:(id)a3 animatingDifferences:(BOOL)a4;
- (void)selectDepartureSequence:(id)a3;
- (void)selectDepartureSequenceAtIndex:(unint64_t)a3;
- (void)selectNextIncomingDeparture;
- (void)setDelegate:(id)a3;
- (void)setRemoteNetworkState:(unint64_t)a3;
- (void)setRequestAllDirections:(BOOL)a3;
- (void)setScheduleWindowStartDate:(id)a3;
@end

@implementation TransitSchedulesDepartureDataProvider

- (TransitSchedulesDepartureDataProvider)initWithTransitMapItem:(id)a3 selectedDepartureSequence:(id)a4 departureSequences:(id)a5 timeZone:(id)a6 initialScheduleDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)TransitSchedulesDepartureDataProvider;
  v17 = [(TransitSchedulesDepartureDataProvider *)&v34 init];
  if (v17)
  {
    if (v15)
    {
      v18 = (NSTimeZone *)v15;
    }
    else
    {
      v18 = [v12 timeZone];
    }
    timeZone = v17->_timeZone;
    v17->_timeZone = v18;

    uint64_t v20 = [v12 _identifier];
    stationIdentifier = v17->_stationIdentifier;
    v17->_stationIdentifier = (MKMapItemIdentifier *)v20;

    uint64_t v22 = [v12 name];
    stationName = v17->_stationName;
    v17->_stationName = (NSString *)v22;

    v24 = (NSArray *)[v14 copy];
    departureSequences = v17->_departureSequences;
    v17->_departureSequences = v24;

    objc_storeStrong((id *)&v17->_selectedDepartureSequence, a4);
    v26 = [(GEOTransitDepartureSequence *)v17->_selectedDepartureSequence departures];
    v17->_remoteNetworkState = v26 != 0;

    v27 = [v13 line];
    v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      v30 = [v14 firstObject];
      id v29 = [v30 line];
    }
    v17->_transitLineIdentifier = (unint64_t)[v29 muid];
    objc_storeStrong((id *)&v17->_scheduleWindowStartDate, a7);
    v31 = +[GEOCountryConfiguration sharedConfiguration];
    v32 = [v31 countryCode];
    v17->_arePastDeparturesDroppedByService = [v32 isEqualToString:@"CN"];
  }
  return v17;
}

+ (double)durationForVisibleDeparturesStartingAtDate:(id)a3 timeZone:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSCalendar currentCalendar];
  [v7 setTimeZone:v5];

  v8 = [v7 components:2097180 fromDate:v6];
  [v8 setDay:((char *)[v8 day]) + 1];
  [v8 setHour:3];
  v9 = [v7 dateFromComponents:v8];
  [v9 timeIntervalSinceDate:v6];
  double v11 = v10;

  return fmax(v11, 43200.0);
}

+ (id)serviceTraitsForScheduleDate:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MKMapService sharedService];
  v9 = [v8 defaultTraits];

  [a1 durationForVisibleDeparturesStartingAtDate:v7 timeZone:v6];
  double v11 = v10;

  [v7 timeIntervalSinceReferenceDate];
  double v13 = v12;

  id v14 = [v9 transitScheduleFilter];
  id v15 = [v14 highFrequencyFilter];
  id v16 = [v15 timeRange];
  [v16 setStartTime:v13];

  v17 = [v14 highFrequencyFilter];
  v18 = [v17 timeRange];
  [v18 setDuration:v11];

  v19 = [v14 highFrequencyFilter];
  [v19 setNumAdditionalDepartures:0];

  uint64_t v20 = [v14 lowFrequencyFilter];
  v21 = [v20 timeRange];
  [v21 setStartTime:v13];

  uint64_t v22 = [v14 lowFrequencyFilter];
  v23 = [v22 timeRange];
  [v23 setDuration:v11];

  v24 = [v14 lowFrequencyFilter];
  [v24 setNumAdditionalDepartures:0];

  v25 = [v14 operatingHoursRange];
  [v25 setStartTime:v13];

  v26 = [v14 operatingHoursRange];
  [v26 setDuration:v11];

  return v9;
}

- (void)_fetchNewScheduleDataForDate:(id)a3 tripIdentifier:(unint64_t)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MKMapItemIdentifier *)self->_stationIdentifier muid];
  double v11 = [(id)objc_opt_class() serviceTraitsForScheduleDate:v8 timeZone:self->_timeZone];
  objc_initWeak(&location, self);
  double v12 = +[MKMapService sharedService];
  double v13 = [v12 ticketForTransitDeparturesAtStation:v10 line:self->_transitLineIdentifier referenceTripID:a4 includeAllDirectionNames:[self requestAllDirections] traits:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A7A84C;
  v15[3] = &unk_1012EB628;
  objc_copyWeak(&v17, &location);
  id v14 = v9;
  id v16 = v14;
  [v13 submitWithHandler:v15 networkActivity:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_clearDepartures
{
  departureSequences = self->_departureSequences;
  self->_departureSequences = 0;

  id v4 = [(TransitSchedulesDepartureDataProvider *)self delegate];
  [v4 departureDataProvider:self updatedDepartures:0];
}

- (void)setScheduleWindowStartDate:(id)a3
{
  id v5 = a3;
  if (![(NSDate *)self->_scheduleWindowStartDate isEqualToDate:v5])
  {
    objc_storeStrong((id *)&self->_scheduleWindowStartDate, a3);
    id v6 = [(GEOTransitDeparture *)self->_selectedDeparture tripIdentifier];
    [(TransitSchedulesDepartureDataProvider *)self _clearDepartures];
    [(TransitSchedulesDepartureDataProvider *)self setRemoteNetworkState:2];
    objc_initWeak(&location, self);
    scheduleWindowStartDate = self->_scheduleWindowStartDate;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A7AC80;
    v8[3] = &unk_101315B78;
    objc_copyWeak(&v9, &location);
    [(TransitSchedulesDepartureDataProvider *)self _fetchNewScheduleDataForDate:scheduleWindowStartDate tripIdentifier:v6 withHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (id)frequencyStringForDeparture:(id)a3
{
  if (a3)
  {
    id v4 = [a3 scheduledDepartureDate];
    id v5 = [(GEOTransitDepartureSequence *)self->_selectedDepartureSequence frequencyToDescribeAtDate:v4];
    if (v5)
    {
      id v6 = +[NSString _navigation_formattedDescriptionForFrequency:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)filterActiveDepartureSequencesFrom:(id)a3 referenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == (id)1)
  {
    id v8 = v6;
  }
  else
  {
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100A7AFA0;
    id v16 = &unk_101315BA0;
    id v17 = v7;
    v18 = self;
    id v9 = [v6 indexesOfObjectsPassingTest:&v13];
    if (objc_msgSend(v9, "count", v13, v14, v15, v16)
      && (id v10 = [v9 count], v10 != objc_msgSend(v6, "count")))
    {
      id v11 = [v6 objectsAtIndexes:v9];
    }
    else
    {
      id v11 = v6;
    }
    id v8 = v11;
  }

  return v8;
}

- (void)processDeparturesFromDepartureSequences:(id)a3 animatingDifferences:(BOOL)a4
{
  id v5 = a3;
  if (![v5 count])
  {
    id v6 = sub_100576CFC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v7 = [(NSArray *)self->_departureSequences count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The data provider is attempting to process a response without departure sequences. The provider currently has %ld sequences", buf, 0xCu);
    }
  }
  id v8 = +[MKTransitItemReferenceDateUpdater referenceDate];
  id v9 = [(TransitSchedulesDepartureDataProvider *)self filterActiveDepartureSequencesFrom:v5 referenceDate:v8];

  id v10 = [v9 copy];
  objc_storeStrong((id *)&self->_departureSequences, v10);
  id v11 = [(GEOTransitDepartureSequence *)self->_selectedDepartureSequence headsign];
  if (self->_arePastDeparturesDroppedByService)
  {
    if (!self->_accruedDepartures)
    {
      double v12 = +[NSMutableDictionary dictionary];
      accruedDepartures = self->_accruedDepartures;
      self->_accruedDepartures = v12;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100A7B314;
    v25[3] = &unk_101315BC8;
    v25[4] = self;
    [v10 enumerateObjectsUsingBlock:v25];
  }
  selectedDeparture = self->_selectedDeparture;
  if (selectedDeparture)
  {
    id v15 = [(TransitSchedulesDepartureDataProvider *)self _departureSequenceContainingTripIdentifier:[(GEOTransitDeparture *)selectedDeparture tripIdentifier]];
    selectedDepartureSequence = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v15;
  }
  if (!self->_selectedDepartureSequence)
  {
    id v17 = sub_100576CFC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      NSUInteger v27 = (NSUInteger)v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "No selectedDepartureSequence found after update. Selected headsign prior to update: %@", buf, 0xCu);
    }

    v18 = [(NSArray *)self->_departureSequences firstObject];
    v19 = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v18;
  }
  uint64_t v20 = [(TransitSchedulesDepartureDataProvider *)self delegate];
  [v20 departureDataProvider:self updatedDepartureSequences:self->_departureSequences];

  v21 = [(TransitSchedulesDepartureDataProvider *)self delegate];
  uint64_t v22 = [(TransitSchedulesDepartureDataProvider *)self departures];
  [v21 departureDataProvider:self updatedDepartures:v22];

  unint64_t v23 = [(TransitSchedulesDepartureDataProvider *)self _indexForSelectedTripIdentifier];
  if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
    id v24 = [(TransitSchedulesDepartureDataProvider *)self selectDepartureAtIndex:v23];
  }
}

- (NSArray)departures
{
  if (!self->_selectedDepartureSequence)
  {
    v3 = sub_100576CFC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Requested departures but there is no selected departure sequence", v8, 2u);
    }
  }
  if ([(NSMutableDictionary *)self->_accruedDepartures count])
  {
    accruedDepartures = self->_accruedDepartures;
    id v5 = [(GEOTransitDepartureSequence *)self->_selectedDepartureSequence headsign];
    id v6 = [(NSMutableDictionary *)accruedDepartures objectForKeyedSubscript:v5];
  }
  else
  {
    id v6 = [(GEOTransitDepartureSequence *)self->_selectedDepartureSequence departures];
  }

  return (NSArray *)v6;
}

- (BOOL)selectDepartureWithTripIdentifier:(unint64_t)a3
{
  if (!self->_selectedDepartureSequence)
  {
    id v5 = [(TransitSchedulesDepartureDataProvider *)self _departureSequenceContainingTripIdentifier:a3];
    selectedDepartureSequence = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v5;
  }
  unint64_t v7 = [(TransitSchedulesDepartureDataProvider *)self _indexForTripIdentifier:a3 scheduledDepartureDate:0];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    id v8 = [(TransitSchedulesDepartureDataProvider *)self selectDepartureAtIndex:v7];
  }
  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)departureSequenceContainingTripIdentifier:(unint64_t)a3 departureSequences:(id)a4
{
  id v5 = a4;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100104274;
  id v15 = sub_1001049B8;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A7BA60;
  v10[3] = &unk_101315C18;
  v10[4] = &v11;
  v10[5] = a3;
  [v5 enumerateObjectsUsingBlock:v10];
  id v6 = (void *)v12[5];
  if (!v6)
  {
    unint64_t v7 = sub_100576CFC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not find a departureSequence containing the trip identifier %llu", buf, 0xCu);
    }

    id v6 = (void *)v12[5];
  }
  id v8 = v6;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_departureSequenceContainingTripIdentifier:(unint64_t)a3
{
  id v5 = objc_opt_class();
  departureSequences = self->_departureSequences;

  return [v5 departureSequenceContainingTripIdentifier:a3 departureSequences:departureSequences];
}

- (unint64_t)_indexForTripIdentifier:(unint64_t)a3 scheduledDepartureDate:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(TransitSchedulesDepartureDataProvider *)self departures];
  if ([v7 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A7BC94;
    v10[3] = &unk_101315C40;
    unint64_t v12 = a3;
    id v11 = v6;
    unint64_t v8 = (unint64_t)[v7 indexOfObjectPassingTest:v10];
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)_indexForSelectedTripIdentifier
{
  selectedDeparture = self->_selectedDeparture;
  if (!selectedDeparture) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(GEOTransitDeparture *)selectedDeparture tripIdentifier];
  id v5 = [(GEOTransitDeparture *)self->_selectedDeparture scheduledDepartureDate];
  unint64_t v6 = [(TransitSchedulesDepartureDataProvider *)self _indexForTripIdentifier:v4 scheduledDepartureDate:v5];

  return v6;
}

- (unint64_t)_indexForNextIncomingDeparture
{
  v2 = [(TransitSchedulesDepartureDataProvider *)self departures];
  if ([v2 count])
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100A7BEE4;
    v7[3] = &unk_101315C68;
    v7[4] = &v8;
    [v2 enumerateObjectsUsingBlock:v7];
    unint64_t v3 = v9[3];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = sub_100576CFC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "No incoming departures, so selecting the most recent one", v6, 2u);
      }

      unint64_t v3 = (unint64_t)[v2 count] - 1;
      v9[3] = v3;
    }
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

- (id)selectDepartureAtIndex:(unint64_t)a3
{
  id v5 = [(TransitSchedulesDepartureDataProvider *)self departures];
  if ((unint64_t)[v5 count] > a3)
  {
    unint64_t v6 = [v5 objectAtIndexedSubscript:a3];
    selectedDeparture = self->_selectedDeparture;
    self->_selectedDeparture = v6;
    uint64_t v8 = v6;

    id v9 = [(TransitSchedulesDepartureDataProvider *)self delegate];
    [v9 departureDataProvider:self selectedDeparture:v8 withIndex:a3];
  }
  return 0;
}

- (unint64_t)indexForSelectedDepartureSequence
{
  return [(TransitSchedulesDepartureDataProvider *)self indexForDepartureSequence:self->_selectedDepartureSequence];
}

- (unint64_t)indexForDepartureSequence:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_selectedDepartureSequence)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    departureSequences = self->_departureSequences;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A7C0D0;
    v9[3] = &unk_101315C90;
    id v10 = v4;
    uint64_t v11 = &v12;
    [(NSArray *)departureSequences enumerateObjectsUsingBlock:v9];
    unint64_t v6 = v13[3];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (void)selectDepartureSequence:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TransitSchedulesDepartureDataProvider *)self indexForDepartureSequence:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = sub_100576CFC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = [v4 headsign];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "attempted to select headsign %@ but couldn't find it", (uint8_t *)&v8, 0xCu);
    }
  }
  [(TransitSchedulesDepartureDataProvider *)self selectDepartureSequenceAtIndex:v5];
}

- (void)selectDepartureSequenceAtIndex:(unint64_t)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_departureSequences, "objectAtIndexedSubscript:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [obj headsign];
  unint64_t v6 = [(GEOTransitDepartureSequence *)self->_selectedDepartureSequence headsign];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    selectedDeparture = self->_selectedDeparture;
    self->_selectedDeparture = 0;

    objc_storeStrong((id *)&self->_selectedDepartureSequence, obj);
    id v9 = [(TransitSchedulesDepartureDataProvider *)self delegate];
    [v9 departureDataProvider:self selectedDepartureSequence:self->_selectedDepartureSequence withIndex:a3];

    id v10 = [(TransitSchedulesDepartureDataProvider *)self delegate];
    uint64_t v11 = [(TransitSchedulesDepartureDataProvider *)self departures];
    [v10 departureDataProvider:self updatedDepartures:v11];
  }
}

- (void)selectNextIncomingDeparture
{
  unint64_t v3 = [(TransitSchedulesDepartureDataProvider *)self _indexForNextIncomingDeparture];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    id v4 = [(TransitSchedulesDepartureDataProvider *)self selectDepartureAtIndex:v3];
  }
}

- (unint64_t)timeDisplayStyle
{
  v2 = [(NSArray *)self->_departureSequences firstObject];
  id v3 = [v2 departureTimeDisplayStyle];

  return (unint64_t)v3;
}

- (unint64_t)remoteNetworkState
{
  return self->_remoteNetworkState;
}

- (void)setRemoteNetworkState:(unint64_t)a3
{
  self->_remoteNetworkState = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOTransitDeparture)selectedDeparture
{
  return self->_selectedDeparture;
}

- (NSArray)departureSequences
{
  return self->_departureSequences;
}

- (GEOTransitDepartureSequence)selectedDepartureSequence
{
  return self->_selectedDepartureSequence;
}

- (BOOL)requestAllDirections
{
  return self->_requestAllDirections;
}

- (void)setRequestAllDirections:(BOOL)a3
{
  self->_requestAllDirections = a3;
}

- (NSDate)scheduleWindowStartDate
{
  return self->_scheduleWindowStartDate;
}

- (TransitSchedulesDepartureDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesDepartureDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduleWindowStartDate, 0);
  objc_storeStrong((id *)&self->_selectedDepartureSequence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_accruedDepartures, 0);
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_selectedDeparture, 0);
  objc_storeStrong((id *)&self->_stationName, 0);

  objc_storeStrong((id *)&self->_stationIdentifier, 0);
}

@end