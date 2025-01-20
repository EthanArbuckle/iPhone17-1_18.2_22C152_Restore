@interface PDRelevantPassProvider
- (BOOL)_findMatchingLocation:(id *)a3 beacon:(id *)a4 forCandidatePass:(id)a5 passStyleRadius:(double)a6 usingNearbyLocations:(id)a7;
- (BOOL)_handleNewLocation:(id)a3 forceAcceptance:(BOOL)a4 from:(id)a5;
- (BOOL)_isDoingBeaconSearch;
- (BOOL)_isDoingLocationSearch;
- (BOOL)_locationIsNewEnoughAndHasGoodAccuracy:(id)a3;
- (BOOL)_proxPendingPassExistsWithBeacon;
- (BOOL)_proxPendingPassExistsWithLocation;
- (BOOL)_shouldScheduleEagerRecalculation;
- (NSArray)currentRelevantPassInfo;
- (PDRelevantPassProvider)init;
- (PDRelevantPassProvider)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 dynamicStateManager:(id)a5 notificationManager:(id)a6 delegate:(id)a7;
- (PDRelevantPassProviderDelegate)delegate;
- (PDRemoteInterfacePresenter)remoteInterfacePresenter;
- (id)_findDateRelevantPassesFromCandidates:(id)a3 betweenWindowStart:(id)a4 windowEnd:(id)a5 aroundDate:(id)a6;
- (id)_groupForPass:(id)a3 inGroups:(id)a4;
- (id)createCurrentNotificationRegistrationState;
- (int64_t)updateTypeFromCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5;
- (void)_addDateRelevantAndLocationPendingCardsForStyle:(int64_t)a3 locationAvailable:(BOOL)a4;
- (void)_beginBeaconSearchTimer;
- (void)_beginLocationSearchTimeout;
- (void)_clearBeaconSearchTimer;
- (void)_clearLocationSearchTimer;
- (void)_clearPersistedProximityInfo;
- (void)_handleNewBeacons:(id)a3;
- (void)_insertPass:(id)a3 intoGroups:(id)a4 forBeacon:(id)a5;
- (void)_insertPass:(id)a3 intoGroups:(id)a4 forDate:(id)a5;
- (void)_insertPass:(id)a3 intoGroups:(id)a4 forLocation:(id)a5;
- (void)_loadPersistedLocationInfoIfNecessary;
- (void)_processStateChangesFromRelevantCandidates:(id)a3;
- (void)_reallyStartCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5;
- (void)_relevantCardExpirationTimerFired;
- (void)_scheduleEagerRecalculationWithPasses:(id)a3 fenceLocation:(BOOL)a4 minRadius:(double)a5 beaconUUIDs:(id)a6;
- (void)_sendGroups:(id)a3 candidatePasses:(id)a4;
- (void)_startBeaconSearchIfNecessary;
- (void)_startCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4;
- (void)_startCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5;
- (void)_startLocationSearchIfNecessaryWithSearchMode:(int64_t)a3;
- (void)_stopBeaconSearch;
- (void)_stopLocationSearch;
- (void)_tearDownExitFenceTimerFired;
- (void)_unscheduleEagerRecalculation;
- (void)_updateAndSendRelevantCards;
- (void)clearRelevantCardItems;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)handleSignificantTimeChangedEvent;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailRangingBeaconsForConstraint:(id)a4 error:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didRangeBeacons:(id)a4 satisfyingConstraint:(id)a5;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)passUpdated:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3;
- (void)requestWhenInUseAuthorizationIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setRemoteInterfacePresenter:(id)a3;
- (void)startObservingEvents;
@end

@implementation PDRelevantPassProvider

- (PDRelevantPassProvider)init
{
  return 0;
}

- (PDRelevantPassProvider)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 dynamicStateManager:(id)a5 notificationManager:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PDRelevantPassProvider;
  v17 = [(PDRelevantPassProvider *)&v30 init];
  if (v17)
  {
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passd.relevancy", v18);
    relevancySerialQueue = v17->_relevancySerialQueue;
    v17->_relevancySerialQueue = (OS_dispatch_queue *)v19;

    v21 = v17->_relevancySerialQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10011CDC0;
    v23[3] = &unk_100736010;
    v24 = v17;
    id v25 = v12;
    id v26 = v13;
    id v27 = v14;
    id v28 = v16;
    id v29 = v15;
    dispatch_sync(v21, v23);
  }
  return v17;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_proximityManager setDelegate:0];
  [(CLLocationManager *)self->_backingManager setDelegate:0];
  [(PDRelevantPassProvider *)self _clearLocationSearchTimer];
  [(PDRelevantPassProvider *)self _clearBeaconSearchTimer];
  v3.receiver = self;
  v3.super_class = (Class)PDRelevantPassProvider;
  [(PDRelevantPassProvider *)&v3 dealloc];
}

- (void)startObservingEvents
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011CFD4;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  if (qword_100808C08 != -1) {
    dispatch_once(&qword_100808C08, block);
  }
}

- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3
{
  relevancySerialQueue = self->_relevancySerialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011D254;
  v4[3] = &unk_10072F840;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(relevancySerialQueue, v4);
}

- (void)handleSignificantTimeChangedEvent
{
  +[NSTimeZone resetSystemTimeZone];
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D360;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(relevancySerialQueue, block);
}

- (NSArray)currentRelevantPassInfo
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000208AC;
  v10 = sub_100020F48;
  id v11 = 0;
  relevancySerialQueue = self->_relevancySerialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011D460;
  v5[3] = &unk_10072FAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(relevancySerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)requestWhenInUseAuthorizationIfNeeded
{
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D520;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_sync(relevancySerialQueue, block);
}

- (void)passUpdated:(id)a3
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"RelevanceExpiration"])
  {
    [(PDRelevantPassProvider *)self _relevantCardExpirationTimerFired];
  }
  else if ([v5 isEqualToString:@"RelevantTearDownFence"])
  {
    [(PDRelevantPassProvider *)self _tearDownExitFenceTimerFired];
  }
}

- (void)_relevantCardExpirationTimerFired
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Relevant cards expiration timer fired.", v4, 2u);
  }

  [(PDRelevantPassProvider *)self _startCardSearchUpdatingWithCachedProximity:1 refreshingProximity:0];
}

- (void)_tearDownExitFenceTimerFired
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tear down exit fence timer fired. Clearing persisted location and recomputing relevant cards.", v4, 2u);
  }

  [(PDRelevantPassProvider *)self _clearPersistedProximityInfo];
  [(PDRelevantPassProvider *)self _startCardSearchUpdatingWithCachedProximity:1 refreshingProximity:0];
}

- (void)_startCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4
{
}

- (void)_startCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  int64_t v9 = -[PDRelevantPassProvider updateTypeFromCachedProximity:refreshingProximity:searchMode:](self, "updateTypeFromCachedProximity:refreshingProximity:searchMode:");
  pendingUpdates = self->_pendingUpdates;
  id v11 = +[NSNumber numberWithInteger:v9];
  id v12 = [(NSMutableDictionary *)pendingUpdates objectForKey:v11];

  if (v12)
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      BOOL v22 = v7;
      __int16 v23 = 2048;
      BOOL v24 = v6;
      __int16 v25 = 2048;
      int64_t v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Relevance update already pending for %ld, %ld, %ld", buf, 0x20u);
    }
  }
  else
  {
    id v14 = self->_pendingUpdates;
    id v15 = +[NSNumber numberWithInteger:v9];
    [(NSMutableDictionary *)v14 setObject:&__kCFBooleanTrue forKey:v15];

    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    relevancySerialQueue = self->_relevancySerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011D89C;
    block[3] = &unk_100738930;
    BOOL v19 = v7;
    BOOL v20 = v6;
    block[4] = self;
    void block[5] = a5;
    dispatch_after(v16, relevancySerialQueue, block);
  }
}

- (int64_t)updateTypeFromCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5
{
  return (1 << a4) | (1 << a3) | (unint64_t)(1 << a5);
}

- (void)_reallyStartCardSearchUpdatingWithCachedProximity:(BOOL)a3 refreshingProximity:(BOOL)a4 searchMode:(int64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  remoteInterfacePresenter = (os_unfair_lock_s *)self->_remoteInterfacePresenter;
  if (remoteInterfacePresenter && sub_100207784(remoteInterfacePresenter))
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Delaying relevance update because an interface is active.", buf, 2u);
    }

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    relevancySerialQueue = self->_relevancySerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011DBEC;
    block[3] = &unk_100738930;
    BOOL v22 = v7;
    BOOL v23 = v6;
    block[4] = self;
    void block[5] = a5;
    dispatch_after(v11, relevancySerialQueue, block);
  }
  else
  {
    int64_t v13 = [(PDRelevantPassProvider *)self updateTypeFromCachedProximity:v7 refreshingProximity:v6 searchMode:a5];
    pendingUpdates = self->_pendingUpdates;
    id v15 = +[NSNumber numberWithInteger:v13];
    [(NSMutableDictionary *)pendingUpdates removeObjectForKey:v15];

    if (self->_startedObservingEvents
      && +[PKWalletVisibility isWalletVisible])
    {
      dispatch_time_t v16 = (void *)PDOSTransactionCreate("PDRelevantPassProvider");
      int v18 = PKRelevancyLocationServicesEnabled();
      if ((v18 & 1) == 0) {
        [(PDRelevantPassProvider *)self _clearPersistedProximityInfo];
      }
      BOOL v19 = PKLogFacilityTypeGetObject();
      PKLogTimeToPerformBlockWithIdentifier();

      if (!v18 || v7)
      {
        [(PDRelevantPassProvider *)self _loadPersistedLocationInfoIfNecessary];
        [(PDRelevantPassProvider *)self _updateAndSendRelevantCards];
      }
      if (v6)
      {
        id v20 = [(NSMutableSet *)self->_proxPendingCards count];
        if (v18)
        {
          if (v20)
          {
            [(PDRelevantPassProvider *)self _startLocationSearchIfNecessaryWithSearchMode:a5];
            [(PDRelevantPassProvider *)self _startBeaconSearchIfNecessary];
          }
        }
      }
    }
  }
}

- (void)_loadPersistedLocationInfoIfNecessary
{
  if (!self->_lastLocation)
  {
    id v3 = objc_alloc((Class)NSData);
    v4 = sub_100122FE0();
    id v5 = [v3 initWithContentsOfFile:v4 options:1 error:0];

    if (v5)
    {
      id v38 = 0;
      id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:&v38];
      id v7 = v38;
      if (v6)
      {
        uint64_t v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        [v6 finishDecoding];
      }
      else
      {
        int64_t v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = sub_100122FE0();
          *(_DWORD *)buf = 138412546;
          v40 = v10;
          __int16 v41 = 2112;
          id v42 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "exception trying to read %@. The data should be discarded. %@", buf, 0x16u);
        }
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    dispatch_time_t v11 = +[NSDate date];
    id v12 = [(CLLocation *)v8 timestamp];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 >= 3600.0)
    {
LABEL_12:
      sub_10011E180(0);

      uint64_t v8 = 0;
    }

    lastLocation = self->_lastLocation;
    self->_lastLocation = v8;
  }
  if (!self->_lastBeacons)
  {
    id v16 = objc_alloc((Class)NSData);
    v17 = sub_100123034();
    id v18 = [v16 initWithContentsOfFile:v17 options:1 error:0];

    if (!v18) {
      goto LABEL_33;
    }
    id v19 = objc_alloc((Class)NSKeyedUnarchiver);
    id v38 = 0;
    id v20 = [v19 initForReadingFromData:v18 error:&v38];
    id v21 = v38;
    if (v20)
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      if (v21)
      {
        __int16 v25 = 0;
      }
      else
      {
        id v27 = objc_alloc((Class)NSSet);
        uint64_t v28 = objc_opt_class();
        id v29 = objc_msgSend(v27, "initWithObjects:", v22, v28, v23, v24, objc_opt_class(), 0);
        id v37 = 0;
        __int16 v25 = [v20 decodeTopLevelObjectOfClasses:v29 forKey:NSKeyedArchiveRootObjectKey error:&v37];
        id v21 = v37;
      }
      [v20 finishDecoding];
      if (objc_opt_isKindOfClass())
      {
        objc_super v30 = [v25 PKDateForKey:@"timestamp"];
        if (v30
          && (+[NSDate date],
              v31 = objc_claimAutoreleasedReturnValue(),
              [v31 timeIntervalSinceDate:v30],
              double v33 = v32,
              v31,
              v33 < 3600.0))
        {
          int64_t v26 = [v25 PKArrayContaining:v24 forKey:@"beacons"];
        }
        else
        {
          int64_t v26 = 0;
        }
      }
      else
      {
        int64_t v26 = 0;
      }

      if (!v21)
      {
LABEL_32:

        if (v26)
        {
LABEL_34:

          lastBeacons = self->_lastBeacons;
          self->_lastBeacons = v26;

          return;
        }
LABEL_33:
        sub_10011E25C(0);
        int64_t v26 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      int64_t v26 = 0;
    }
    v34 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = sub_100123034();
      *(_DWORD *)buf = 138412546;
      v40 = v35;
      __int16 v41 = 2112;
      id v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PDRelevantPassProvider: error trying to read %@. The data should be discarded. %@.", buf, 0x16u);
    }
    goto LABEL_32;
  }
}

- (void)_clearPersistedProximityInfo
{
  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  sub_10011E180(0);
  lastBeacons = self->_lastBeacons;
  self->_lastBeacons = 0;

  sub_10011E25C(0);
}

- (BOOL)_shouldScheduleEagerRecalculation
{
  return SBSEventObserverGetValueForState() != 0;
}

- (void)_scheduleEagerRecalculationWithPasses:(id)a3 fenceLocation:(BOOL)a4 minRadius:(double)a5 beaconUUIDs:(id)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  id v9 = a6;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (!v10)
  {
    id v12 = 0;
    goto LABEL_53;
  }
  id v11 = v10;
  id v67 = v9;
  id v12 = 0;
  uint64_t v13 = *(void *)v75;
  do
  {
    double v14 = 0;
    id v15 = v12;
    do
    {
      if (*(void *)v75 != v13) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v14);
      v17 = [v16 embeddedBeacons];
      if ([v17 count]) {
        unsigned int v18 = 1;
      }
      else {
        unsigned int v18 = [v16 hasLocations];
      }

      id v19 = v16;
      id v20 = [v19 matchedRelevantDate];
      if (!v20)
      {
        v36 = 0;
        goto LABEL_45;
      }
      id v21 = (double *)((char *)&__PassStyleMatchConditions + 64 * (void)[v19 style]);
      double v22 = *v21;
      double v23 = v21[1];
      double v24 = v21[3];
      double v25 = v21[4];
      double v26 = v21[5];
      double v27 = v21[6];
      double v28 = v21[7];
      id v29 = +[NSDate date];
      uint64_t v30 = [v20 date];
      v31 = (void *)v30;
      if (v24 == 0.0) {
        unsigned int v32 = 0;
      }
      else {
        unsigned int v32 = v18;
      }
      if (v32 == 1 && v30 != 0)
      {
        BOOL IsWithinWindowAroundReferenceDate = PDDateIsWithinWindowAroundReferenceDate(v29, v20, v25, v26);
        BOOL v38 = PDDateIsWithinWindowAroundReferenceDate(v29, v20, v27, v28);
        if (!IsWithinWindowAroundReferenceDate || !v38)
        {
          if (IsWithinWindowAroundReferenceDate)
          {
            *(void *)buf = 0;
            double v34 = v25;
            double v35 = v26;
          }
          else
          {
            if (!v38)
            {
LABEL_43:
              v36 = 0;
              goto LABEL_44;
            }
            *(void *)buf = 0;
            double v34 = v27;
            double v35 = v28;
          }
        }
        else
        {
          if (v25 <= v27) {
            double v34 = v27;
          }
          else {
            double v34 = v25;
          }
          if (v26 >= v28) {
            double v35 = v28;
          }
          else {
            double v35 = v26;
          }
          if (v34 >= v35)
          {
            double v34 = 0.0;
            double v35 = 0.0;
          }
          *(void *)buf = 0;
        }
        goto LABEL_41;
      }
      if (v30)
      {
        if (!PDDateIsWithinWindowAroundReferenceDate(v29, v20, v22, v23)) {
          goto LABEL_43;
        }
        *(void *)buf = 0;
        double v34 = v22;
        double v35 = v23;
LABEL_41:
        PDGetStartAndEndDatesForWindowAroundDate(0, buf, v20, v34, v35);
        id v40 = *(id *)buf;
        goto LABEL_42;
      }
      id v40 = [v20 effectiveEndDate];
LABEL_42:
      v36 = v40;
LABEL_44:

LABEL_45:
      id v12 = PKEarlierDate();

      double v14 = (char *)v14 + 1;
      id v15 = v12;
    }
    while (v11 != v14);
    id v11 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  }
  while (v11);
  if (v12)
  {
    __int16 v41 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v12];
    id v42 = [v12 dateByAddingTimeInterval:1800.0];
    [v41 setEndDate:v42];

    v43 = PKLogFacilityTypeGetObject();
    id v9 = v67;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Scheduling Activity to to expire relevant passes at around %@", buf, 0xCu);
    }

    PDScheduledActivityRegister();
  }
  else
  {
    id v9 = v67;
  }
LABEL_53:
  if ((unint64_t)[v9 count] < 4 || !self->_lastLocation)
  {
    if (v7) {
      goto LABEL_59;
    }
LABEL_65:
    char v50 = 0;
    goto LABEL_66;
  }

  v44 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Too many beacons to fence each one separately; using region fence instead.",
      buf,
      2u);
  }

  id v9 = 0;
LABEL_59:
  lastLocation = self->_lastLocation;
  if (!lastLocation) {
    goto LABEL_65;
  }
  [(CLLocation *)lastLocation horizontalAccuracy];
  if (v46 < 100.0) {
    [(CLLocation *)self->_lastLocation horizontalAccuracy];
  }
  id v47 = objc_alloc((Class)CLCircularRegion);
  [(CLLocation *)self->_lastLocation coordinate];
  id v48 = objc_msgSend(v47, "initWithCenter:radius:identifier:", @"passd-circular");
  v49 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v48;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Monitoring circular region %@", buf, 0xCu);
  }

  [(CLLocationManager *)self->_proximityManager startMonitoringForRegion:v48];
  char v50 = 1;
LABEL_66:
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v51 = v9;
  id v52 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = 0;
    uint64_t v55 = *(void *)v71;
LABEL_68:
    uint64_t v56 = 0;
    while (1)
    {
      if (*(void *)v71 != v55) {
        objc_enumerationMutation(v51);
      }
      v57 = *(void **)(*((void *)&v70 + 1) + 8 * v56);
      v58 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Monitoring region with beacon UUID %@", buf, 0xCu);
      }

      v59 = [v57 UUIDString];
      v60 = +[NSString stringWithFormat:@"passd-%@", v59];

      id v61 = [objc_alloc((Class)CLBeaconRegion) initWithUUID:v57 identifier:v60];
      [(CLLocationManager *)self->_proximityManager startMonitoringForRegion:v61];

      if ((unint64_t)(v54 + v56 + 1) > 2) {
        break;
      }
      if (v53 == (id)++v56)
      {
        id v53 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
        v54 += v56;
        if (v53) {
          goto LABEL_68;
        }
        break;
      }
    }

LABEL_78:
    v62 = +[NSDate date];
    v63 = [v62 dateByAddingTimeInterval:3600.0];

    v64 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v63];
    [v64 setStartDate:v63];
    v65 = [v63 dateByAddingTimeInterval:1800.0];
    [v64 setEndDate:v65];

    v66 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v63;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Scheduling Activity to tear down exit fences at around %@", buf, 0xCu);
    }

    PDScheduledActivityRegister();
  }
  else
  {

    if (v50) {
      goto LABEL_78;
    }
  }
}

- (void)_unscheduleEagerRecalculation
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unscheduling exit fences and background timers.", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CLLocationManager *)self->_proximityManager monitoredRegions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v13;
    *(void *)&long long v6 = 138412290;
    long long v11 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        -[CLLocationManager stopMonitoringForRegion:](self->_proximityManager, "stopMonitoringForRegion:", v10, v11);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          uint64_t v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring region %@.", buf, 0xCu);
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  PDScheduledActivityRemove();
  PDScheduledActivityRemove();
}

- (void)_startLocationSearchIfNecessaryWithSearchMode:(int64_t)a3
{
  if ([(PDRelevantPassProvider *)self _proxPendingPassExistsWithLocation])
  {
    id v5 = a3 ? &kCLLocationAccuracyHundredMeters : (const CLLocationAccuracy *)&kCLLocationAccuracyLeech;
    if (![(PDRelevantPassProvider *)self _isDoingLocationSearch]
      || self->_locationSearchMode < a3)
    {
      long long v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = "eager";
        if (!a3) {
          id v7 = "opportunistic";
        }
        int v15 = 136315138;
        double v16 = *(double *)&v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting location search (%s)", (uint8_t *)&v15, 0xCu);
      }
      double v8 = *v5;

      self->_locationSearchState = 1;
      if (!self->_locationSearchTransaction)
      {
        id v9 = (OS_os_transaction *)PDOSTransactionCreate("PDRelevantPassProvider.location_search");
        locationSearchTransaction = self->_locationSearchTransaction;
        self->_locationSearchTransaction = v9;
      }
      long long v11 = +[NSDate date];
      locationSearchStartDate = self->_locationSearchStartDate;
      self->_locationSearchStartDate = v11;

      [(CLLocationManager *)self->_proximityManager setDesiredAccuracy:v8];
      self->_locationSearchMode = a3;
      long long v13 = [(CLLocationManager *)self->_proximityManager location];
      unsigned __int8 v14 = [(PDRelevantPassProvider *)self _handleNewLocation:v13 forceAcceptance:0 from:@"CLLocationManager cache"];

      if ((v14 & 1) == 0)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134217984;
          double v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   Cached location wasn't good enough, START SEARCHING with accuracy %f", (uint8_t *)&v15, 0xCu);
        }

        [(CLLocationManager *)self->_proximityManager startUpdatingLocation];
        self->_locationSearchState = 2;
        [(PDRelevantPassProvider *)self _beginLocationSearchTimeout];
      }
    }
  }
}

- (BOOL)_handleNewLocation:(id)a3 forceAcceptance:(BOOL)a4 from:(id)a5
{
  id v9 = (CLLocation *)a3;
  uint64_t v10 = (__CFString *)a5;
  long long v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    CFStringRef v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling new location from '%@': %@", (uint8_t *)&v17, 0x16u);
  }

  unsigned int v12 = [(PDRelevantPassProvider *)self _locationIsNewEnoughAndHasGoodAccuracy:v9];
  char v13 = v12 | a4;
  BOOL v14 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v14)
    {
      CFStringRef v15 = @"This will have to do";
      if (v12) {
        CFStringRef v15 = @"Good enough";
      }
      int v17 = 138412290;
      CFStringRef v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "   %@, stopping search", (uint8_t *)&v17, 0xCu);
    }

    [(PDRelevantPassProvider *)self _stopLocationSearch];
    if (v9 && self->_lastLocation != v9) {
      objc_storeStrong((id *)&self->_lastLocation, a3);
    }
    sub_10011E180(self->_lastLocation);
    [(PDRelevantPassProvider *)self _startCardSearchUpdatingWithCachedProximity:1 refreshingProximity:0];
  }
  else
  {
    if (v14)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "   Not good enough, we'll hold onto it and keep searching", (uint8_t *)&v17, 2u);
    }

    objc_storeStrong((id *)&self->_roughLocation, a3);
  }

  return v13;
}

- (BOOL)_isDoingLocationSearch
{
  return self->_locationSearchState != 0;
}

- (void)_stopLocationSearch
{
  if ([(PDRelevantPassProvider *)self _isDoingLocationSearch])
  {
    if (self->_locationSearchState == 2) {
      [(CLLocationManager *)self->_proximityManager stopUpdatingLocation];
    }
    self->_locationSearchState = 0;
    locationSearchTransaction = self->_locationSearchTransaction;
    self->_locationSearchTransaction = 0;

    locationSearchStartDate = self->_locationSearchStartDate;
    self->_locationSearchStartDate = 0;

    roughLocation = self->_roughLocation;
    self->_roughLocation = 0;

    [(PDRelevantPassProvider *)self _clearLocationSearchTimer];
    long long v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping location search", v7, 2u);
    }
  }
}

- (void)_beginLocationSearchTimeout
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = 0x4024000000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning location search timer with duration %g", buf, 0xCu);
  }

  [(PDRelevantPassProvider *)self _clearLocationSearchTimer];
  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_relevancySerialQueue);
  locationSearchTimeout = self->_locationSearchTimeout;
  self->_locationSearchTimeout = v4;

  long long v6 = self->_locationSearchTimeout;
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  double v8 = self->_locationSearchTimeout;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10011F390;
  handler[3] = &unk_10072E1E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume((dispatch_object_t)self->_locationSearchTimeout);
}

- (void)_clearLocationSearchTimer
{
  locationSearchTimeout = self->_locationSearchTimeout;
  if (locationSearchTimeout)
  {
    dispatch_source_cancel(locationSearchTimeout);
    v4 = self->_locationSearchTimeout;
    self->_locationSearchTimeout = 0;
  }
}

- (void)_startBeaconSearchIfNecessary
{
  if (![(PDRelevantPassProvider *)self _isDoingBeaconSearch]
    && [(PDRelevantPassProvider *)self _proxPendingPassExistsWithBeacon])
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting beacon search", v8, 2u);
    }

    self->_beaconSearchState = 1;
    if (!self->_beaconSearchTransaction)
    {
      v4 = (OS_os_transaction *)PDOSTransactionCreate("PDRelevantPassProvider.beacon_search");
      beaconSearchTransaction = self->_beaconSearchTransaction;
      self->_beaconSearchTransaction = v4;
    }
    proximityManager = self->_proximityManager;
    dispatch_time_t v7 = +[CLBeaconIdentityConstraint any];
    [(CLLocationManager *)proximityManager startRangingBeaconsSatisfyingConstraint:v7];

    self->_beaconSearchState = 2;
    [(PDRelevantPassProvider *)self _beginBeaconSearchTimer];
  }
}

- (BOOL)_isDoingBeaconSearch
{
  return self->_beaconSearchState != 0;
}

- (void)_handleNewBeacons:(id)a3
{
  id v5 = (NSArray *)a3;
  [(PDRelevantPassProvider *)self _stopBeaconSearch];
  p_lastBeacons = &self->_lastBeacons;
  dispatch_time_t v7 = v5;
  if (self->_lastBeacons != v5)
  {
    objc_storeStrong((id *)&self->_lastBeacons, a3);
    dispatch_time_t v7 = *p_lastBeacons;
  }
  sub_10011E25C(v7);
  double v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *p_lastBeacons;
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got beacons %@", (uint8_t *)&v10, 0xCu);
  }

  [(PDRelevantPassProvider *)self _startCardSearchUpdatingWithCachedProximity:1 refreshingProximity:0];
}

- (void)_stopBeaconSearch
{
  if ([(PDRelevantPassProvider *)self _isDoingBeaconSearch])
  {
    if (self->_beaconSearchState == 2)
    {
      proximityManager = self->_proximityManager;
      v4 = +[CLBeaconIdentityConstraint any];
      [(CLLocationManager *)proximityManager stopRangingBeaconsSatisfyingConstraint:v4];
    }
    self->_beaconSearchState = 0;
    beaconSearchTransaction = self->_beaconSearchTransaction;
    self->_beaconSearchTransaction = 0;

    [(PDRelevantPassProvider *)self _clearBeaconSearchTimer];
    long long v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping beacon search", v7, 2u);
    }
  }
}

- (void)_beginBeaconSearchTimer
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = 0x4018000000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning beacon search timer with duration %g", buf, 0xCu);
  }

  [(PDRelevantPassProvider *)self _clearBeaconSearchTimer];
  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_relevancySerialQueue);
  beaconSearchTimeout = self->_beaconSearchTimeout;
  self->_beaconSearchTimeout = v4;

  long long v6 = self->_beaconSearchTimeout;
  dispatch_time_t v7 = dispatch_time(0, 6000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  double v8 = self->_beaconSearchTimeout;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011F918;
  v9[3] = &unk_10072E288;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_beaconSearchTimeout);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_clearBeaconSearchTimer
{
  beaconSearchTimeout = self->_beaconSearchTimeout;
  if (beaconSearchTimeout)
  {
    dispatch_source_cancel(beaconSearchTimeout);
    v4 = self->_beaconSearchTimeout;
    self->_beaconSearchTimeout = 0;
  }
}

- (void)_addDateRelevantAndLocationPendingCardsForStyle:(int64_t)a3 locationAvailable:(BOOL)a4
{
  long long v6 = (double *)((char *)&__PassStyleMatchConditions + 64 * a3);
  double v7 = *v6;
  double v8 = v6[1];
  double v10 = v6[4];
  double v9 = v6[5];
  double v12 = v6[6];
  double v11 = v6[7];
  if (a4)
  {
    double v13 = v6[2];
    double v14 = v6[3];
  }
  else
  {
    double v13 = 0.0;
    if (v7 == 0.0)
    {
      double v14 = 0.0;
      if (v8 == 0.0) {
        return;
      }
    }
    else
    {
      double v14 = 0.0;
    }
  }
  CFStringRef v15 = +[NSDate date];
  if (v7 == 0.0 && v8 == 0.0)
  {
    id v16 = 0;
    id v17 = 0;
  }
  else
  {
    id v60 = 0;
    id v61 = 0;
    PDGetCurrentStartAndEndDatesForDateWindow(&v61, &v60, v7, v8);
    id v16 = v61;
    id v17 = v60;
    databaseManager = self->_databaseManager;
    if (v14 == 0.0) {
      [(PDDatabaseManager *)databaseManager candidatePassesOfStyle:a3];
    }
    else {
    __int16 v19 = [(PDDatabaseManager *)databaseManager unlocatedCandidatePassesOfStyle:a3];
    }
    dateRelevantCards = self->_dateRelevantCards;
    id v21 = [(PDRelevantPassProvider *)self _findDateRelevantPassesFromCandidates:v19 betweenWindowStart:v16 windowEnd:v17 aroundDate:v15];
    [(NSMutableSet *)dateRelevantCards unionSet:v21];
  }
  if (v14 != 0.0)
  {
    BOOL v22 = v12 == 0.0;
    if (v11 != 0.0) {
      BOOL v22 = 0;
    }
    if (v10 != 0.0 || v9 != 0.0)
    {
      if (!v22)
      {
        double v58 = 0.0;
        double v59 = 0.0;
        double v56 = 0.0;
        double v57 = 0.0;
        double v54 = 0.0;
        double v55 = 0.0;
        sub_10011FE60(&v58, &v56, &v54, v10, v9, v12, v11);
        id v29 = [(PDDatabaseManager *)self->_databaseManager locatedCandidatePassesOfStyle:a3];
        if (v56 != 0.0 || v57 != 0.0)
        {
          id v52 = v17;
          id v53 = v16;
          PDGetCurrentStartAndEndDatesForDateWindow(&v53, &v52, v56, v57);
          id v30 = v53;

          id v31 = v52;
          unsigned int v32 = self->_dateRelevantCards;
          double v33 = [(PDRelevantPassProvider *)self _findDateRelevantPassesFromCandidates:v29 betweenWindowStart:v30 windowEnd:v31 aroundDate:v15];
          [(NSMutableSet *)v32 unionSet:v33];

          id v16 = v30;
          id v17 = v31;
        }
        if (v58 != 0.0 || v59 != 0.0)
        {
          id v50 = v17;
          id v51 = v16;
          PDGetCurrentStartAndEndDatesForDateWindow(&v51, &v50, v58, v59);
          id v34 = v51;

          id v35 = v50;
          proxPendingCards = self->_proxPendingCards;
          id v37 = [(PDRelevantPassProvider *)self _findDateRelevantPassesFromCandidates:v29 betweenWindowStart:v34 windowEnd:v35 aroundDate:v15];
          [(NSMutableSet *)proxPendingCards unionSet:v37];

          id v16 = v34;
          id v17 = v35;
        }
        if (v54 != 0.0 || v55 != 0.0)
        {
          id v48 = v17;
          id v49 = v16;
          PDGetCurrentStartAndEndDatesForDateWindow(&v49, &v48, v54, v55);
          id v38 = v49;

          id v39 = v48;
          id v40 = self->_proxPendingCards;
          __int16 v41 = [(PDRelevantPassProvider *)self _findDateRelevantPassesFromCandidates:v29 betweenWindowStart:v38 windowEnd:v39 aroundDate:v15];
          [(NSMutableSet *)v40 unionSet:v41];

          id v16 = v38;
          id v17 = v39;
        }

        goto LABEL_34;
      }
      id v46 = v17;
      id v47 = v16;
      PDGetCurrentStartAndEndDatesForDateWindow(&v47, &v46, v10, v9);
      id v23 = v47;

      double v24 = v46;
      goto LABEL_23;
    }
    if (!v22)
    {
      id v44 = v17;
      id v45 = v16;
      PDGetCurrentStartAndEndDatesForDateWindow(&v45, &v44, v12, v11);
      id v23 = v45;

      double v24 = v44;
LABEL_23:
      id v25 = v24;

      double v26 = [(PDDatabaseManager *)self->_databaseManager locatedCandidatePassesOfStyle:a3];
      double v27 = self->_proxPendingCards;
      double v28 = [(PDRelevantPassProvider *)self _findDateRelevantPassesFromCandidates:v26 betweenWindowStart:v23 windowEnd:v25 aroundDate:v15];
      [(NSMutableSet *)v27 unionSet:v28];

      id v16 = v23;
      id v17 = v25;
    }
  }
LABEL_34:
  if (v13 != 0.0)
  {
    id v42 = self->_proxPendingCards;
    v43 = [(PDDatabaseManager *)self->_databaseManager locatedDatelessCandidatePassesOfStyle:a3];
    [(NSMutableSet *)v42 unionSet:v43];
  }
}

- (id)_findDateRelevantPassesFromCandidates:(id)a3 betweenWindowStart:(id)a4 windowEnd:(id)a5 aroundDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v38 = a6;
  id v33 = objc_alloc_init((Class)NSMutableSet);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v36 = v13;
        uint64_t v37 = v12;
        double v14 = [v13 relevantDates];
        id v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (!v15) {
          goto LABEL_25;
        }
        id v16 = v15;
        uint64_t v17 = *(void *)v40;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v14);
            }
            __int16 v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v20 = [v19 date];
            id v21 = [v19 effectiveStartDate];
            uint64_t v22 = [v19 effectiveEndDate];
            id v23 = (void *)v22;
            if (v20)
            {
              [v10 timeIntervalSinceDate:v20];
              if (v24 >= 0.0) {
                goto LABEL_21;
              }
              id v25 = v11;
              id v26 = v20;
            }
            else
            {
              if (v21) {
                BOOL v27 = v22 == 0;
              }
              else {
                BOOL v27 = 1;
              }
              if (v27) {
                goto LABEL_21;
              }
              [v21 timeIntervalSinceDate:v38];
              if (v28 >= 0.0) {
                goto LABEL_21;
              }
              id v25 = v23;
              id v26 = v38;
            }
            [v25 timeIntervalSinceDate:v26];
            if (v29 > 0.0)
            {
              [v33 addObject:v36];
              [v36 setMatchedRelevantDate:v19];

              goto LABEL_25;
            }
LABEL_21:
          }
          id v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v16) {
            continue;
          }
          break;
        }
LABEL_25:

        uint64_t v12 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v35);
  }

  id v30 = [v33 copy];
  return v30;
}

- (BOOL)_proxPendingPassExistsWithLocation
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_proxPendingCards;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasLocations", (void)v12) & 1) == 0)
        {
          double v8 = [v7 embeddedBeacons];
          id v9 = [v8 count];

          if (!v9) {
            continue;
          }
        }
        BOOL v10 = 1;
        goto LABEL_13;
      }
      id v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (BOOL)_proxPendingPassExistsWithBeacon
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_proxPendingCards;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "embeddedBeacons", (void)v9);
        id v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)_groupForPass:(id)a3 inGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v7 style];
  long long v10 = [v7 passTypeIdentifier];

  id v11 = [v8 initWithFormat:@"%ld:%@", v9, v10];
  long long v12 = [v6 objectForKey:v11];
  if (!v12)
  {
    long long v12 = [[PDRelevantPassGroup alloc] initWithDatabaseManager:self->_databaseManager cardFileManager:self->_cardFileManager];
    [v6 setObject:v12 forKey:v11];
  }

  return v12;
}

- (void)_insertPass:(id)a3 intoGroups:(id)a4 forDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PDRelevantPassProvider *)self _groupForPass:v9 inGroups:a4];
  [v10 addCandidate:v9 forDate:v8];
}

- (void)_insertPass:(id)a3 intoGroups:(id)a4 forLocation:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PDRelevantPassProvider *)self _groupForPass:v9 inGroups:a4];
  [v10 addCandidate:v9 forLocation:v8];
}

- (void)_insertPass:(id)a3 intoGroups:(id)a4 forBeacon:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PDRelevantPassProvider *)self _groupForPass:v9 inGroups:a4];
  [v10 addCandidate:v9 forBeacon:v8];
}

- (void)_updateAndSendRelevantCards
{
  v2 = PKLogFacilityTypeGetObject();
  PKLogTimeToPerformBlockWithIdentifier();
}

- (BOOL)_findMatchingLocation:(id *)a3 beacon:(id *)a4 forCandidatePass:(id)a5 passStyleRadius:(double)a6 usingNearbyLocations:(id)a7
{
  id v69 = a5;
  id v11 = a7;
  lastLocation = self->_lastLocation;
  if (!lastLocation)
  {
    BOOL v51 = 0;
    goto LABEL_41;
  }
  [(CLLocation *)lastLocation horizontalAccuracy];
  double v13 = 100.0;
  if (v14 < 100.0)
  {
    [(CLLocation *)self->_lastLocation horizontalAccuracy];
    double v13 = v15;
  }
  id v16 = [v69 uniqueIdentifier];
  uint64_t v17 = [v11 locationsForUniqueID:v16];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (!v19)
  {
    id v21 = 0;
    LOBYTE(v22) = 0;
    id v50 = v18;
LABEL_37:

    goto LABEL_40;
  }
  id v20 = v19;
  id v65 = v11;
  id v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = *(void *)v78;
  double v24 = 0.0;
  id v68 = v18;
  do
  {
    id v25 = 0;
    id v67 = v20;
    do
    {
      if (*(void *)v78 != v23) {
        objc_enumerationMutation(v18);
      }
      id v26 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v25);
      [v26 maxDistance];
      if (v27 <= a6) {
        double v28 = v27;
      }
      else {
        double v28 = a6;
      }
      if (v27 <= 0.0) {
        double v29 = a6;
      }
      else {
        double v29 = v28;
      }
      double v30 = v13 + v29;
      id v31 = [v26 CLLocation];
      [v31 distanceFromLocation:self->_lastLocation];
      double v33 = v32;

      if (v33 >= v30)
      {
        if (v33 <= v30) {
          goto LABEL_28;
        }
        long long v39 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = v23;
          long long v41 = self;
          long long v42 = a3;
          id v43 = v21;
          uint64_t v44 = v22;
          long long v45 = [v69 passTypeIdentifier];
          long long v46 = [v69 serialNumber];
          *(_DWORD *)buf = 138413314;
          v83 = v45;
          __int16 v84 = 2112;
          v85 = v46;
          __int16 v86 = 2112;
          id v87 = v26;
          __int16 v88 = 2048;
          double v89 = v33;
          __int16 v90 = 2048;
          double v91 = v30;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "   %@:%@ card location %@ does NOT match because %g meters away. r: %g", buf, 0x34u);

          uint64_t v22 = v44;
          id v21 = v43;
          a3 = v42;
          self = v41;
          uint64_t v23 = v40;
          id v20 = v67;

          id v18 = v68;
        }
        goto LABEL_26;
      }
      if (!v21 || v33 < v24)
      {
        id v34 = v26;

        id v21 = v34;
        double v24 = v33;
      }
      id v35 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v69 passTypeIdentifier];
        uint64_t v37 = [v69 serialNumber];
        *(_DWORD *)buf = 138413314;
        v83 = v36;
        __int16 v84 = 2112;
        v85 = v37;
        __int16 v86 = 2112;
        id v87 = v26;
        __int16 v88 = 2048;
        double v89 = v33;
        __int16 v90 = 2048;
        double v91 = v30;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "   %@:%@ card location %@ MATCHES because %g meters away. r: %g", buf, 0x34u);

        id v18 = v68;
      }

      if (a3)
      {
        id v38 = v26;
        long long v39 = *a3;
        *a3 = v38;
        uint64_t v22 = 1;
LABEL_26:

        goto LABEL_28;
      }
      uint64_t v22 = 1;
LABEL_28:
      id v25 = (char *)v25 + 1;
    }
    while (v20 != v25);
    id v20 = [v18 countByEnumeratingWithState:&v77 objects:v92 count:16];
  }
  while (v20);

  if (v21)
  {
    id v47 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = [v69 passTypeIdentifier];
      id v49 = [v69 serialNumber];
      *(_DWORD *)buf = 138413058;
      v83 = v48;
      __int16 v84 = 2112;
      v85 = v49;
      __int16 v86 = 2112;
      id v87 = v21;
      __int16 v88 = 2048;
      double v89 = v24;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "   %@:%@ card closest location: %@ (%g meters away)", buf, 0x2Au);
    }
    id v11 = v65;
    if (a3)
    {
      id v21 = v21;
      id v50 = *a3;
      *a3 = v21;
      LOBYTE(v22) = 1;
      goto LABEL_37;
    }
    LOBYTE(v22) = 1;
  }
  else
  {
    id v11 = v65;
  }
LABEL_40:

  BOOL v51 = v22 & 1;
LABEL_41:
  if (self->_lastBeacons && !v51)
  {
    id v66 = v11;
    id v52 = objc_alloc_init((Class)NSMutableArray);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v53 = [v69 embeddedBeacons];
    id v54 = [v53 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v74;
      do
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v74 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          lastBeacons = self->_lastBeacons;
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1001212A0;
          v70[3] = &unk_100738958;
          v70[4] = v58;
          id v71 = v52;
          id v72 = v69;
          [(NSArray *)lastBeacons enumerateObjectsUsingBlock:v70];
        }
        id v55 = [v53 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v55);
    }

    id v60 = [v52 count];
    BOOL v51 = v60 != 0;
    if (v60)
    {
      [v52 sortUsingComparator:&stru_100738998];
      if (a4)
      {
        id v61 = [v52 objectAtIndex:0];
        id v62 = *a4;
        *a4 = v61;
      }
    }

    id v11 = v66;
  }

  return v51;
}

- (void)clearRelevantCardItems
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing passes sent to SB", v6, 2u);
  }

  [(SBSCardItemsController *)self->_cardItemsController setCardItems:0];
  [(PDRelevantPassLiveActivityManager *)self->_relevantPassLiveActivityManager endAllActivities];
  currentRelevantPassInfo = self->_currentRelevantPassInfo;
  self->_currentRelevantPassInfo = 0;

  uint64_t v5 = [(PDRelevantPassProvider *)self delegate];
  [v5 relevantPassProviderDidChangeCurrentRelevantPasses:self];
}

- (void)_processStateChangesFromRelevantCandidates:(id)a3
{
  id v4 = a3;
  databaseManager = self->_databaseManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100121860;
  v7[3] = &unk_100738A00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v7];
}

- (void)_sendGroups:(id)a3 candidatePasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v75 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  double v57 = self;
  uint64_t v58 = v7;
  [(PDRelevantPassLiveActivityManager *)self->_relevantPassLiveActivityManager updateLiveActivitiesForCandidatePasses:v7];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v70 = [obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  id v72 = v6;
  if (v70)
  {
    context = *(void **)v88;
    uint64_t v8 = PKPassLibraryRelevantInfoUniqueID;
    uint64_t v9 = PKPassLibraryRelevantInfoRelevantText;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void **)v88 != context) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v10;
        id v11 = *(void **)(*((void *)&v87 + 1) + 8 * v10);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v12 = [v6 allValues];
        id v13 = [v12 countByEnumeratingWithState:&v83 objects:v96 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v84;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v84 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              id v18 = [v17 passes];
              unsigned int v19 = [v18 containsObject:v11];

              if (v19)
              {
                id v20 = objc_alloc_init((Class)NSMutableDictionary);
                id v21 = [v11 uniqueIdentifier];
                [v20 setObject:v21 forKeyedSubscript:v8];

                uint64_t v22 = [v17 relevantText];
                [v20 setObject:v22 forKeyedSubscript:v9];

                [(NSArray *)v75 addObject:v20];
                [v17 removeCandidate:v11];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v83 objects:v96 count:16];
          }
          while (v14);
        }

        id v6 = v72;
        uint64_t v10 = v73 + 1;
      }
      while ((id)(v73 + 1) != v70);
      id v70 = [obj countByEnumeratingWithState:&v87 objects:v97 count:16];
    }
    while (v70);
  }

  id v59 = objc_alloc_init((Class)NSMutableArray);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v63 = [v6 allKeys];
  id v66 = [v63 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v80;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v80 != v65) {
          objc_enumerationMutation(v63);
        }
        uint64_t v71 = v23;
        uint64_t v67 = *(void *)(*((void *)&v79 + 1) + 8 * v23);
        double v24 = [v6 objectForKey:v67];
        id v25 = [v24 sortedPasses];
        id v26 = (char *)[v25 count];
        double v27 = v24;
        long long v74 = [v24 seedPass];
        id v28 = objc_alloc_init((Class)NSMutableArray);
        id v29 = objc_alloc_init((Class)NSMutableArray);
        double v30 = 0;
        if (v26)
        {
          for (j = 0; j != v26; ++j)
          {
            double v32 = [v25 objectAtIndexedSubscript:j];
            double v33 = [v32 uniqueIdentifier];
            uint64_t v34 = [v32 manifestHash];
            id v35 = (void *)v34;
            if (v33)
            {
              if (v34)
              {
                [v28 addObject:v33];
                [v29 addObject:v35];
                if (v32 == v74) {
                  double v30 = j;
                }
              }
            }
          }
        }
        v36 = v27;
        if ([v28 count] && objc_msgSend(v29, "count"))
        {
          uint64_t v37 = [v27 titleText];
          uint64_t v38 = [v27 iconData];
          long long v39 = (void *)v38;
          if (v37 && v38)
          {
            uint64_t v40 = [v27 relevantText];
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_10012217C;
            v76[3] = &unk_1007317B8;
            id v61 = v40;
            id v77 = v61;
            long long v78 = v75;
            [v28 enumerateObjectsUsingBlock:v76];
            long long v41 = [v27 seedPass];
            long long v42 = [v41 passTypeIdentifier];
            uint64_t v43 = PKPassTypeForPassTypeIdentifier();

            BOOL v44 = v43 == 1;
            id v60 = v41;
            BOOL v45 = [v41 style] == (id)4;
            v94[0] = v28;
            v93[0] = @"uniqueIDs";
            v93[1] = @"seedIndex";
            +[NSNumber numberWithUnsignedInteger:v30];
            long long v46 = v62 = v39;
            v94[1] = v46;
            v94[2] = v29;
            v93[2] = @"manifestHashes";
            v93[3] = @"useContactlessInterface";
            id v47 = +[NSNumber numberWithBool:v44];
            v94[3] = v47;
            v93[4] = @"isTimeSensitive";
            v36 = v27;
            id v48 = +[NSNumber numberWithBool:v45];
            v94[4] = v48;
            id v49 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:5];

            long long v39 = v62;
            id v50 = objc_alloc((Class)SBSCardItem);
            BOOL v51 = [v27 bodyText];
            LOBYTE(v56) = 0;
            id v52 = [v50 initWithIdentifier:v67 categoryIdentifier:0 iconData:v62 title:v37 subtitle:0 body:v51 requiresPasscode:v56 bundleName:@"PassesLockScreenPlugin" userInfo:v49];

            if (v52) {
              [v59 addObject:v52];
            }
          }
        }

        id v6 = v72;
        uint64_t v23 = v71 + 1;
      }
      while ((id)(v71 + 1) != v66);
      id v66 = [v63 countByEnumeratingWithState:&v79 objects:v95 count:16];
    }
    while (v66);
  }

  id v53 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v92 = v59;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Sending cards to SB: %@", buf, 0xCu);
  }

  [(SBSCardItemsController *)v57->_cardItemsController setCardItems:v59];
  currentRelevantPassInfo = v57->_currentRelevantPassInfo;
  v57->_currentRelevantPassInfo = v75;

  id v55 = [(PDRelevantPassProvider *)v57 delegate];
  [v55 relevantPassProviderDidChangeCurrentRelevantPasses:v57];
}

- (id)createCurrentNotificationRegistrationState
{
  if (![(PDDatabaseManager *)self->_databaseManager hasCandidatePasses]) {
    return 0;
  }
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v3 = objc_alloc((Class)NSSet);
  id v4 = objc_msgSend(v3, "initWithObjects:", PKDarwinNotificationEventBacklightStateChanged, PDDarwinNotificationEventSignificantTimeChanged, 0);
  [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v4 forStream:0];

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012236C;
  block[3] = &unk_10072E238;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(relevancySerialQueue, block);
}

- (BOOL)_locationIsNewEnoughAndHasGoodAccuracy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v11 = v4
     && (locationSearchStartDate = self->_locationSearchStartDate,
         [v4 timestamp],
         id v7 = objc_claimAutoreleasedReturnValue(),
         [(NSDate *)locationSearchStartDate timeIntervalSinceDate:v7],
         double v9 = v8,
         v7,
         [v5 horizontalAccuracy],
         v10 >= 0.0)
     && v10 < 100.0
     && v9 <= 90.0;

  return v11;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012258C;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(relevancySerialQueue, block);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001226E8;
  block[3] = &unk_10072E238;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(relevancySerialQueue, block);
}

- (void)locationManager:(id)a3 didRangeBeacons:(id)a4 satisfyingConstraint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012281C;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(relevancySerialQueue, block);
}

- (void)locationManager:(id)a3 didFailRangingBeaconsForConstraint:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012293C;
  block[3] = &unk_10072E238;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(relevancySerialQueue, block);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 code])
  {
    relevancySerialQueue = self->_relevancySerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100122B64;
    block[3] = &unk_10072E238;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    dispatch_async(relevancySerialQueue, block);

    id v9 = v13;
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Location Manager %@ unable to retreve location, will retry.", buf, 0x16u);
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 authorizationStatus];
  relevancySerialQueue = self->_relevancySerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122CEC;
  block[3] = &unk_100738A28;
  void block[4] = self;
  id v9 = v4;
  unsigned int v10 = v5;
  id v7 = v4;
  dispatch_async(relevancySerialQueue, block);
}

- (PDRelevantPassProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDRelevantPassProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PDRemoteInterfacePresenter)remoteInterfacePresenter
{
  return self->_remoteInterfacePresenter;
}

- (void)setRemoteInterfacePresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relevantPassLiveActivityManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_currentRelevantPassInfo, 0);
  objc_storeStrong((id *)&self->_cardItemsController, 0);
  objc_storeStrong((id *)&self->_proxPendingCards, 0);
  objc_storeStrong((id *)&self->_dateRelevantCards, 0);
  objc_storeStrong((id *)&self->_beaconSearchTransaction, 0);
  objc_storeStrong((id *)&self->_beaconSearchTimeout, 0);
  objc_storeStrong((id *)&self->_lastBeacons, 0);
  objc_storeStrong((id *)&self->_locationSearchTransaction, 0);
  objc_storeStrong((id *)&self->_locationSearchTimeout, 0);
  objc_storeStrong((id *)&self->_locationSearchStartDate, 0);
  objc_storeStrong((id *)&self->_roughLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_backingManager, 0);
  objc_storeStrong((id *)&self->_proximityManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_relevancySerialQueue, 0);
  objc_storeStrong((id *)&self->_dynamicStateManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end