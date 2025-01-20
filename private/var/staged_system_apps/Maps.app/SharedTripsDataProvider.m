@interface SharedTripsDataProvider
- (BOOL)active;
- (BOOL)combineAllTrips;
- (BOOL)hasInitialData;
- (GEOObserverHashTable)observers;
- (NSArray)sharedTripSummaries;
- (SharedTripsDataProvider)initWithCombineAllTrips:(BOOL)a3;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3;
@end

@implementation SharedTripsDataProvider

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = +[MSPSharedTripService sharedInstance];
    id v6 = v5;
    if (v3)
    {
      [v5 addReceivingObserver:self];

      [(SharedTripsDataProvider *)self _updateAndNotifyObservers:0];
    }
    else
    {
      [v5 removeReceivingObserver:self];
    }
  }
}

- (SharedTripsDataProvider)initWithCombineAllTrips:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SharedTripsDataProvider;
  v4 = [(SharedTripsDataProvider *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_combineAllTrips = a3;
    sharedTripSummaries = v4->_sharedTripSummaries;
    v4->_sharedTripSummaries = (NSArray *)&__NSArray0__struct;
  }
  return v5;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    self->_hasInitialData = 1;
    id v6 = +[MSPSharedTripService sharedInstance];
    v7 = [v6 receivedTrips];
    sharedTrips = self->_sharedTrips;
    self->_sharedTrips = v7;

    id v9 = objc_alloc_init((Class)NSMutableArray);
    if ([(NSArray *)self->_sharedTrips count])
    {
      if ([(SharedTripsDataProvider *)self combineAllTrips])
      {
        v10 = +[SharedTripSummary summaryWithSharedTrips:self->_sharedTrips];
        [v9 addObject:v10];
      }
      else
      {
        v25 = a2;
        BOOL v26 = v3;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v11 = self->_sharedTrips;
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            v15 = 0;
            do
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v37 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v15);
              v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1, v25);
              v17 = +[SharedTripSummary summaryWithSharedTrips:v16];
              [v9 addObject:v17];

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
          }
          while (v13);
        }

        BOOL v3 = v26;
        a2 = v25;
      }
    }
    v18 = [v9 copy];
    sharedTripSummaries = self->_sharedTripSummaries;
    self->_sharedTripSummaries = v18;

    v20 = sub_1000AA148();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = NSStringFromSelector(a2);
      v24 = sub_100097E28(v3);
      *(_DWORD *)buf = 138412802;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      __int16 v35 = 2112;
      v36 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);
    }
    if (v3) {
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
}

- (BOOL)combineAllTrips
{
  return self->_combineAllTrips;
}

- (NSArray)sharedTripSummaries
{
  return self->_sharedTripSummaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTripSummaries, 0);
  objc_storeStrong((id *)&self->_sharedTrips, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end