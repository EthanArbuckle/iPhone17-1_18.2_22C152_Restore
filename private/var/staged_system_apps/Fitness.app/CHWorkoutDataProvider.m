@interface CHWorkoutDataProvider
+ (id)localizedNameForWorkoutTypeKey:(id)a3;
+ (id)localizedShortNameForWorkoutTypeKey:(id)a3;
- (BOOL)dataAvailable;
- (BOOL)hasWorkouts;
- (BOOL)isCurrentFilterValid;
- (BOOL)isRetrying;
- (BOOL)isWatchWorkout:(id)a3;
- (CHWorkoutDataProvider)init;
- (CHWorkoutDataProvider)initWithHealthStore:(id)a3;
- (CHWorkoutTypeKey)currentFilteredTypeIdentifier;
- (NSArray)sortedDateComponentKeys;
- (NSArray)sortedTypeIdentifiers;
- (NSArray)sortedYearDateComponents;
- (NSDictionary)dateComponentsByYear;
- (NSDictionary)localizedWorkoutTypeNamesByTypeIdentifier;
- (NSDictionary)workoutStatisticsForMonthAndYear;
- (NSDictionary)workoutStatisticsForYear;
- (NSDictionary)workoutsByDay;
- (NSDictionary)workoutsByMonthAndYear;
- (id)_UUIDsForWorkoutsWithEndDate:(id)a3;
- (id)unfilteredWorkouts;
- (id)unfilteredWorkoutsWithMaxCount:(int64_t)a3;
- (id)workoutForUUID:(id)a3;
- (id)workoutsEndingInDateInterval:(id)a3;
- (void)_calculateStatistics;
- (void)_commonInit;
- (void)_countWorkouts;
- (void)_handleInitialResults:(id)a3;
- (void)_handleRemovedObjects:(id)a3;
- (void)_queue_sortAllWorkoutsByMonthAndYearWithCurrentFilter;
- (void)_recreateFilterObjects;
- (void)_retryAnchoredObjectQueryWithRetryCount:(unint64_t)a3;
- (void)_runAnchoredObjectQueryWithRetryCount:(unint64_t)a3;
- (void)_runAnimatedUpdateHandlers;
- (void)_runFilterActionFinishedHandlers;
- (void)_runFilterActionStartedHandlers;
- (void)_runHandlers:(id)a3;
- (void)_runUpdateHandlers;
- (void)_timeZoneDidChange:(id)a3;
- (void)addAnimatedUpdateHandler:(id)a3;
- (void)addFilterActionFinishedHandler:(id)a3;
- (void)addFilterActionStartedHandler:(id)a3;
- (void)addUpdateHandler:(id)a3;
- (void)cancelAllFetches;
- (void)dealloc;
- (void)deleteWorkout:(id)a3 shouldDeleteAssociatedSamples:(BOOL)a4 completion:(id)a5;
- (void)setCurrentFilteredTypeIdentifier:(id)a3;
- (void)setCurrentFilteredTypeIdentifier:(id)a3 completion:(id)a4;
- (void)setDataAvailable:(BOOL)a3;
- (void)setLocalizedWorkoutTypeNamesByTypeIdentifier:(id)a3;
- (void)setSortedTypeIdentifiers:(id)a3;
- (void)startFetching;
@end

@implementation CHWorkoutDataProvider

- (id)unfilteredWorkouts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(HKSortedSampleArray *)self->_workouts allSamples];
  v5 = +[NSArray arrayWithArray:v4];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (CHWorkoutDataProvider)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHWorkoutDataProvider;
  v6 = [(CHWorkoutDataProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    [(CHWorkoutDataProvider *)v7 _commonInit];
  }

  return v7;
}

- (void)_handleInitialResults:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKSortedSampleArray *)self->_workouts insertSamples:v5];

  os_unfair_lock_unlock(p_lock);
  [(CHWorkoutDataProvider *)self _recreateFilterObjects];
  self->_dataAvailable = 1;
  sortingQueue = self->_sortingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDD70;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async(sortingQueue, block);
}

- (void)_runHandlers:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000702A0;
  block[3] = &unk_1008ABA78;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_countWorkouts
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_workouts;
  id v4 = [(HKSortedSampleArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = +[CHWorkoutTypeKey initForWorkout:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        uint64_t v9 = [v3 objectForKeyedSubscript:v8];
        if (v9) {
          v10 = (_UNKNOWN **)v9;
        }
        else {
          v10 = &off_1008DE808;
        }
        v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v10 unsignedIntegerValue] + 1);

        [v3 setObject:v11 forKeyedSubscript:v8];
      }
      id v5 = [(HKSortedSampleArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_lock);
  v12 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v3];
  workoutCountByTypeIdentifier = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = v12;
}

- (void)_recreateFilterObjects
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_workouts;
  id v5 = [(HKSortedSampleArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[CHWorkoutTypeKey initForWorkout:*(void *)(*((void *)&v13 + 1) + 8 * (void)v8)];
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(HKSortedSampleArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  v10 = [v3 allObjects];
  [(CHWorkoutDataProvider *)self _countWorkouts];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100158EB0;
  v12[3] = &unk_1008ADCF8;
  v12[4] = self;
  v11 = [v10 sortedArrayUsingComparator:v12];

  [(CHWorkoutDataProvider *)self setSortedTypeIdentifiers:v11];
}

- (void)_runAnchoredObjectQueryWithRetryCount:(unint64_t)a3
{
  if (self->_currentAnchoredObjectQuery)
  {
    self->_isRetrying = 0;
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CHWorkoutDataProvider] Running anchored object workout query with retry count: %lu", buf, 0xCu);
    }
    self->_isFirstQueryReturn = 1;
    objc_initWeak((id *)buf, self);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = sub_10001F3AC;
    long long v14 = &unk_1008ADC50;
    v15[1] = (id)a3;
    objc_copyWeak(v15, (id *)buf);
    id v6 = objc_retainBlock(&v11);
    id v7 = objc_alloc((Class)HKAnchoredObjectQuery);
    v8 = +[HKObjectType workoutType];
    uint64_t v9 = (HKAnchoredObjectQuery *)[v7 initWithType:v8 predicate:0 anchor:0 limit:0 resultsHandler:v6];
    currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
    self->_currentAnchoredObjectQuery = v9;

    [(HKAnchoredObjectQuery *)self->_currentAnchoredObjectQuery setUpdateHandler:v6];
    [(HKAnchoredObjectQuery *)self->_currentAnchoredObjectQuery setDebugIdentifier:@"CHWorkoutDataProvider.currentAnchoredObjectQuery"];
    [(HKHealthStore *)self->_healthStore executeQuery:self->_currentAnchoredObjectQuery];

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)addAnimatedUpdateHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000158E0;
  v7[3] = &unk_1008AD938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

- (BOOL)hasWorkouts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKSortedSampleArray *)self->_workouts count];
  os_unfair_lock_unlock(p_lock);
  return (uint64_t)v4 > 0;
}

- (void)addUpdateHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000829B4;
  v7[3] = &unk_1008AD938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

- (BOOL)dataAvailable
{
  return self->_dataAvailable;
}

- (void)_commonInit
{
  if (!self->_healthStore)
  {
    id v3 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = self->_healthStore;
    self->_healthStore = v3;
  }
  id v5 = (HKSortedSampleArray *)objc_alloc_init((Class)HKSortedSampleArray);
  workouts = self->_workouts;
  self->_workouts = v5;

  id v7 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:0];
  [(HKSortedSampleArray *)self->_workouts setSortDescriptor:v7];

  workoutsByMonthAndYear = self->_workoutsByMonthAndYear;
  self->_workoutsByMonthAndYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutsByDay = self->_workoutsByDay;
  self->_workoutsByDay = (NSDictionary *)&__NSDictionary0__struct;

  workoutsByIdentifier = self->_workoutsByIdentifier;
  self->_workoutsByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  sortedDateComponentKeys = self->_sortedDateComponentKeys;
  self->_sortedDateComponentKeys = (NSArray *)&__NSArray0__struct;

  sortedYearDateComponents = self->_sortedYearDateComponents;
  self->_sortedYearDateComponents = (NSArray *)&__NSArray0__struct;

  dateComponentsByYear = self->_dateComponentsByYear;
  self->_dateComponentsByYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutStatisticsForMonthAndYear = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutStatisticsForYear = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutCountByTypeIdentifier = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  unint64_t v17 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  localizedWorkoutTypeNamesByTypeIdentifier = self->_localizedWorkoutTypeNamesByTypeIdentifier;
  self->_localizedWorkoutTypeNamesByTypeIdentifier = v17;

  sortedTypeIdentifiers = self->_sortedTypeIdentifiers;
  self->_sortedTypeIdentifiers = (NSArray *)&__NSArray0__struct;

  v20 = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  updateHandlers = self->_updateHandlers;
  self->_updateHandlers = v21;

  v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  animatedUpdateHandlers = self->_animatedUpdateHandlers;
  self->_animatedUpdateHandlers = v23;

  v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  filterActionStartedHandlers = self->_filterActionStartedHandlers;
  self->_filterActionStartedHandlers = v25;

  v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  filterActionEndedHandlers = self->_filterActionEndedHandlers;
  self->_filterActionEndedHandlers = v27;

  v29 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = v29;

  v31 = self->_gregorianCalendar;
  v32 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)v31 setTimeZone:v32];

  v33 = +[NSCalendar autoupdatingCurrentCalendar];
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v33;

  HKCreateSerialDispatchQueueWithQOSClass();
  v35 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  sortingQueue = self->_sortingQueue;
  self->_sortingQueue = v35;

  HKCreateSerialDispatchQueueWithQOSClass();
  v37 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v37;

  self->_lock._os_unfair_lock_opaque = 0;
  v39 = +[NSNotificationCenter defaultCenter];
  [v39 addObserver:self selector:"_timeZoneDidChange:" name:NSSystemTimeZoneDidChangeNotification object:0];

  self->_demoDataProvider = objc_alloc_init(CHDemoDataProvider);

  _objc_release_x1();
}

- (void)_calculateStatistics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  workoutStatisticsForMonthAndYear = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = v4;

  id v6 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  workoutStatisticsForYear = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = v6;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = self->_sortedDateComponentKeys;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
  v10 = AKAccountManager_ptr;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        long long v15 = [(NSDictionary *)self->_workoutsByMonthAndYear objectForKeyedSubscript:v14];
        id v16 = [objc_alloc((Class)FIUIWorkoutStatistics) initWithWorkouts:v15];
        [v3 setObject:v16 forKeyedSubscript:v14];
      }
      id v11 = [(NSArray *)v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v11);
  }
  v32 = v3;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_sortedYearDateComponents;
  id v36 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        long long v18 = v10;
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
        id v20 = objc_alloc_init((Class)NSMutableArray);
        v21 = [(NSDictionary *)self->_dateComponentsByYear objectForKeyedSubscript:v19];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v22 = [v21 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v38;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = [(NSDictionary *)self->_workoutsByMonthAndYear objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * (void)k)];
              [v20 addObjectsFromArray:v26];
            }
            id v23 = [v21 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v23);
        }
        v10 = v18;
        id v27 = [objc_alloc((Class)v18[114]) initWithWorkouts:v20];
        [v35 setObject:v27 forKeyedSubscript:v19];
      }
      id v36 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v36);
  }

  v28 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v32];
  v29 = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = v28;

  v30 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v35];
  v31 = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = v30;
}

- (void)_queue_sortAllWorkoutsByMonthAndYearWithCurrentFilter
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKSortedSampleArray *)self->_workouts allSamples];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);
  id v70 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v74 = objc_alloc_init((Class)NSMutableDictionary);
  id v69 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v7;
  id v73 = objc_alloc_init((Class)NSMutableDictionary);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v87;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v87 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        uint64_t v14 = [v13 UUID];
        long long v15 = [v14 UUIDString];
        [v74 setObject:v13 forKeyedSubscript:v15];

        currentCalendar = self->_currentCalendar;
        unint64_t v17 = [v13 endDate];
        long long v18 = [(NSCalendar *)currentCalendar components:12 fromDate:v17];

        uint64_t v19 = [v6 objectForKeyedSubscript:v18];

        if (!v19)
        {
          [v70 addObject:v18];
          id v20 = objc_alloc_init((Class)NSMutableArray);
          [v6 setObject:v20 forKeyedSubscript:v18];
        }
        v21 = [v13 startDate];
        id v22 = _HKActivityCacheDateComponentsFromDate();

        id v23 = [v8 objectForKeyedSubscript:v22];

        if (!v23)
        {
          id v24 = objc_alloc_init((Class)NSMutableArray);
          [v8 setObject:v24 forKeyedSubscript:v22];
        }
        v25 = [v8 objectForKeyedSubscript:v22];
        [v25 addObject:v13];
      }
      id v10 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    }
    while (v10);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v71 = v70;
  id v26 = [v71 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v83;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v83 != v28) {
          objc_enumerationMutation(v71);
        }
        uint64_t v30 = *(void *)(*((void *)&v82 + 1) + 8 * (void)j);
        v31 = self->_currentCalendar;
        v32 = [(NSCalendar *)v31 dateFromComponents:v30];
        v33 = [(NSCalendar *)v31 components:4 fromDate:v32];

        id v34 = [v73 objectForKeyedSubscript:v33];
        if (!v34)
        {
          id v34 = objc_alloc_init((Class)NSMutableArray);
          [v69 addObject:v33];
        }
        [v34 addObject:v30];
        [v73 setObject:v34 forKeyedSubscript:v33];
      }
      id v27 = [v71 countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v27);
  }
  v68 = v8;

  currentFilteredTypeIdentifier = self->_currentFilteredTypeIdentifier;
  v67 = self;
  if (currentFilteredTypeIdentifier)
  {
    id v36 = +[CHWorkoutTypeKey emptyKey];
    unsigned __int8 v37 = [(CHWorkoutTypeKey *)currentFilteredTypeIdentifier isEqual:v36];

    if ((v37 & 1) == 0)
    {
      unint64_t v38 = [(CHWorkoutTypeKey *)self->_currentFilteredTypeIdentifier activityType];
      unsigned __int8 v39 = [(CHWorkoutTypeKey *)self->_currentFilteredTypeIdentifier isIndoor];
      if (+[CHWorkoutTypeKey historyFilterDisambiguatesLocationForActivityType:v38])
      {
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100158D9C;
        v80[3] = &unk_1008ADC70;
        unsigned __int8 v81 = v39;
        v80[4] = v38;
        long long v40 = (Block_layout *)v80;
      }
      else if (v38 == 77)
      {
        long long v40 = &stru_1008ADCD0;
      }
      else
      {
        if (v38 != 46)
        {
          v66 = +[NSNumber numberWithUnsignedInteger:[(CHWorkoutTypeKey *)self->_currentFilteredTypeIdentifier activityType]];
          long long v42 = +[NSPredicate predicateWithFormat:@"workoutActivityType==%@", v66];

          goto LABEL_30;
        }
        int64_t v41 = [(CHWorkoutTypeKey *)self->_currentFilteredTypeIdentifier swimLocationType];
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = sub_100158E14;
        v79[3] = &unk_1008ADC90;
        v79[4] = v41;
        long long v40 = (Block_layout *)v79;
      }
      long long v42 = +[NSPredicate predicateWithBlock:v40];
LABEL_30:
      uint64_t v43 = [obj filteredArrayUsingPredicate:v42];

      id obj = (id)v43;
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v44 = obj;
  id v45 = [v44 countByEnumeratingWithState:&v75 objects:v90 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v76;
    do
    {
      for (k = 0; k != v46; k = (char *)k + 1)
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
        v50 = +[NSCalendar currentCalendar];
        v51 = [v49 endDate];
        v52 = [v50 components:12 fromDate:v51];

        v53 = [v6 objectForKeyedSubscript:v52];
        [v53 addObject:v49];
        [v6 setObject:v53 forKeyedSubscript:v52];
      }
      id v46 = [v44 countByEnumeratingWithState:&v75 objects:v90 count:16];
    }
    while (v46);
  }

  v54 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v6];
  workoutsByMonthAndYear = v67->_workoutsByMonthAndYear;
  v67->_workoutsByMonthAndYear = v54;

  v56 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v68];
  workoutsByDay = v67->_workoutsByDay;
  v67->_workoutsByDay = v56;

  v58 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v71];
  sortedDateComponentKeys = v67->_sortedDateComponentKeys;
  v67->_sortedDateComponentKeys = v58;

  v60 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v69];
  sortedYearDateComponents = v67->_sortedYearDateComponents;
  v67->_sortedYearDateComponents = v60;

  v62 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v73];
  dateComponentsByYear = v67->_dateComponentsByYear;
  v67->_dateComponentsByYear = v62;

  v64 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v74];
  workoutsByIdentifier = v67->_workoutsByIdentifier;
  v67->_workoutsByIdentifier = v64;

  [(CHWorkoutDataProvider *)v67 _calculateStatistics];
}

- (NSDictionary)workoutsByDay
{
  return self->_workoutsByDay;
}

- (void)startFetching
{
  if ([(CHDemoDataProvider *)self->_demoDataProvider hasDemoWorkouts])
  {
    id v3 = [(CHDemoDataProvider *)self->_demoDataProvider workouts];
    [(CHWorkoutDataProvider *)self _handleInitialResults:v3];
  }
  else
  {
    [(CHWorkoutDataProvider *)self _runAnchoredObjectQueryWithRetryCount:0];
  }
}

- (void)setSortedTypeIdentifiers:(id)a3
{
}

- (BOOL)isRetrying
{
  return self->_isRetrying;
}

- (void)_runUpdateHandlers
{
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDE90;
  block[3] = &unk_1008ABA78;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

+ (id)localizedNameForWorkoutTypeKey:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  if (v4 == (id)_HKWorkoutActivityTypeNone)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"ALL_WORKOUTS";
LABEL_3:
    CFStringRef v8 = @"Localizable";
LABEL_4:
    id v9 = [v5 localizedStringForKey:v7 value:&stru_1008D8AB8 table:v8];

    goto LABEL_9;
  }
  unint64_t v10 = (unint64_t)[v3 activityType];
  if (v10 > 0x3F) {
    goto LABEL_18;
  }
  if (((1 << v10) & 0x8010102000010000) != 0) {
    goto LABEL_7;
  }
  if (v10 == 13)
  {
    unsigned int v14 = [v3 isIndoor];
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    if (v14) {
      CFStringRef v7 = @"WORKOUT_FILTER_INDOOR_CYCLE_DESCRIPTION";
    }
    else {
      CFStringRef v7 = @"WORKOUT_FILTER_OUTDOOR_CYCLE_DESCRIPTION";
    }
    CFStringRef v8 = @"Localizable";
    goto LABEL_4;
  }
  if (v10 != 46)
  {
LABEL_18:
    if (v10 == 84)
    {
      id v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"UNDERWATER_DIVING_DESCRIPTION";
      goto LABEL_3;
    }
    if (v10 != 3000)
    {
      [v3 activityType];
      [v3 swimLocationType];
      [v3 isIndoor];
      uint64_t v11 = FILocalizedNameForActivityType();
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v11 = FILocalizedNameForIndoorAgnosticActivityType();
LABEL_8:
    id v9 = (void *)v11;
    goto LABEL_9;
  }
  id v13 = [v3 swimLocationType];
  if (!v13)
  {
    id v5 = FIUIBundle();
    id v6 = v5;
    CFStringRef v7 = @"SWIMMING_DESCRIPTION";
    goto LABEL_28;
  }
  if (v13 == (id)2)
  {
    id v5 = FIUIBundle();
    id v6 = v5;
    CFStringRef v7 = @"SWIMMING_DESCRIPTION_OPEN_WATER";
    goto LABEL_28;
  }
  if (v13 == (id)1)
  {
    id v5 = FIUIBundle();
    id v6 = v5;
    CFStringRef v7 = @"SWIMMING_DESCRIPTION_POOL";
LABEL_28:
    CFStringRef v8 = @"Localizable-Ariel";
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

+ (id)localizedShortNameForWorkoutTypeKey:(id)a3
{
  id v4 = a3;
  [v4 activityType];
  id v5 = _HKWorkoutActivityNameForActivityType();
  id v6 = +[NSString stringWithFormat:@"WORKOUT_FILTER_SHORT_TITLE_%@", v5];

  CFStringRef v7 = +[NSBundle mainBundle];
  CFStringRef v8 = [v7 localizedStringForKey:v6 value:&stru_1008D8AB8 table:@"Localizable"];

  if ([v8 isEqualToString:v6])
  {
    uint64_t v9 = [a1 localizedNameForWorkoutTypeKey:v4];

    CFStringRef v8 = (void *)v9;
  }

  return v8;
}

- (CHWorkoutDataProvider)init
{
  return 0;
}

- (void)_timeZoneDidChange:(id)a3
{
  gregorianCalendar = self->_gregorianCalendar;
  id v4 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)gregorianCalendar setTimeZone:v4];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDataProvider;
  [(CHWorkoutDataProvider *)&v4 dealloc];
}

- (BOOL)isCurrentFilterValid
{
  id v3 = [(CHWorkoutDataProvider *)self currentFilteredTypeIdentifier];
  objc_super v4 = [(NSDictionary *)self->_workoutCountByTypeIdentifier objectForKeyedSubscript:v3];
  BOOL v5 = (uint64_t)[v4 integerValue] > 0;

  return v5;
}

- (id)unfilteredWorkoutsWithMaxCount:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(HKSortedSampleArray *)self->_workouts count];
  if ((uint64_t)v6 >= a3) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = (int64_t)v6;
  }
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [(HKSortedSampleArray *)self->_workouts sampleAtIndex:i];
      [v5 addObject:v9];
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (NSDictionary)workoutsByMonthAndYear
{
  return self->_workoutsByMonthAndYear;
}

- (NSDictionary)workoutStatisticsForMonthAndYear
{
  return self->_workoutStatisticsForMonthAndYear;
}

- (id)workoutForUUID:(id)a3
{
  return [(NSDictionary *)self->_workoutsByIdentifier objectForKeyedSubscript:a3];
}

- (NSArray)sortedDateComponentKeys
{
  return self->_sortedDateComponentKeys;
}

- (void)cancelAllFetches
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_currentAnchoredObjectQuery];
  currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
  self->_currentAnchoredObjectQuery = 0;
}

- (void)addFilterActionStartedHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100158118;
  v7[3] = &unk_1008AD938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

- (void)addFilterActionFinishedHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100158204;
  v7[3] = &unk_1008AD938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

- (id)workoutsEndingInDateInterval:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int64_t v7 = [(HKSortedSampleArray *)self->_workouts allSamples];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 endDate];
        unsigned int v14 = [v4 containsDate:v13];

        if (v14)
        {
          [v6 addObject:v12];
        }
        else
        {
          long long v15 = [v4 endDate];
          [v15 timeIntervalSinceReferenceDate];
          double v17 = v16;
          long long v18 = [v12 endDate];
          [v18 timeIntervalSinceReferenceDate];
          double v20 = v19;

          if (v17 < v20) {
            goto LABEL_11;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)deleteWorkout:(id)a3 shouldDeleteAssociatedSamples:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  healthStore = self->_healthStore;
  id v15 = a3;
  id v10 = a3;
  uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015853C;
  v13[3] = &unk_1008ADBD8;
  id v14 = v8;
  id v12 = v8;
  [(HKHealthStore *)healthStore _deleteObjects:v11 options:v5 completion:v13];
}

- (void)setCurrentFilteredTypeIdentifier:(id)a3
{
}

- (void)setCurrentFilteredTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (CHWorkoutTypeKey *)a3;
  id v7 = a4;
  currentFilteredTypeIdentifier = self->_currentFilteredTypeIdentifier;
  self->_currentFilteredTypeIdentifier = v6;
  id v9 = v6;

  [(CHWorkoutDataProvider *)self _runFilterActionStartedHandlers];
  sortingQueue = self->_sortingQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001586E8;
  v12[3] = &unk_1008AD938;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(sortingQueue, v12);
}

- (void)_retryAnchoredObjectQueryWithRetryCount:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isRetrying = 1;
  uint64_t v6 = (uint64_t)[(HKSortedSampleArray *)self->_workouts count];
  [(HKSortedSampleArray *)self->_workouts removeAllSamples];
  os_unfair_lock_unlock(p_lock);
  currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
  self->_currentAnchoredObjectQuery = 0;

  if (v6 >= 1) {
    [(CHWorkoutDataProvider *)self _runUpdateHandlers];
  }
  unint64_t v8 = 5;
  if (a3 < 5) {
    unint64_t v8 = a3;
  }
  dispatch_time_t v9 = dispatch_time(0, 1000000000 * v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001588D0;
  v10[3] = &unk_1008AD108;
  v10[4] = self;
  v10[5] = a3;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_handleRemovedObjects:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) UUID:(void)v14];
        [v5 addObject:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  [(HKSortedSampleArray *)self->_workouts removeSamplesWithUUIDs:v5];
  os_unfair_lock_unlock(&self->_lock);
  id v12 = +[NSNotificationCenter defaultCenter];
  CFStringRef v18 = @"CHDeletedWorkoutKey";
  id v19 = v6;
  id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v12 postNotificationName:@"FitnessWorkoutWasDeletedNotification" object:self userInfo:v13];
}

- (void)_runAnimatedUpdateHandlers
{
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100158FAC;
  block[3] = &unk_1008ABA78;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_runFilterActionStartedHandlers
{
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159078;
  block[3] = &unk_1008ABA78;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_runFilterActionFinishedHandlers
{
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159144;
  block[3] = &unk_1008ABA78;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (id)_UUIDsForWorkoutsWithEndDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(HKSortedSampleArray *)self->_workouts reverseSampleEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 endDate];
        if ([v13 compare:v4] == (id)1)
        {

          goto LABEL_13;
        }
        if ([v13 isEqualToDate:v4])
        {
          long long v14 = [v12 UUID];
          [v5 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (BOOL)isWatchWorkout:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_workouts;
  id v7 = [(HKSortedSampleArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    unsigned __int8 v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 UUID];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14) {
          unsigned __int8 v9 = [v12 _isWatchWorkout];
        }
      }
      id v8 = [(HKSortedSampleArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v9 & 1;
}

- (void)setDataAvailable:(BOOL)a3
{
  self->_dataAvailable = a3;
}

- (NSDictionary)workoutStatisticsForYear
{
  return self->_workoutStatisticsForYear;
}

- (NSArray)sortedYearDateComponents
{
  return self->_sortedYearDateComponents;
}

- (NSDictionary)dateComponentsByYear
{
  return self->_dateComponentsByYear;
}

- (NSArray)sortedTypeIdentifiers
{
  return self->_sortedTypeIdentifiers;
}

- (CHWorkoutTypeKey)currentFilteredTypeIdentifier
{
  return self->_currentFilteredTypeIdentifier;
}

- (NSDictionary)localizedWorkoutTypeNamesByTypeIdentifier
{
  return self->_localizedWorkoutTypeNamesByTypeIdentifier;
}

- (void)setLocalizedWorkoutTypeNamesByTypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedWorkoutTypeNamesByTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_currentFilteredTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_demoDataProvider, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_sortingQueue, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentAnchoredObjectQuery, 0);
  objc_storeStrong((id *)&self->_filterActionEndedHandlers, 0);
  objc_storeStrong((id *)&self->_filterActionStartedHandlers, 0);
  objc_storeStrong((id *)&self->_animatedUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_workoutCountByTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutStatisticsForYear, 0);
  objc_storeStrong((id *)&self->_workoutStatisticsForMonthAndYear, 0);
  objc_storeStrong((id *)&self->_dateComponentsByYear, 0);
  objc_storeStrong((id *)&self->_sortedYearDateComponents, 0);
  objc_storeStrong((id *)&self->_sortedDateComponentKeys, 0);
  objc_storeStrong((id *)&self->_workoutsByIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutsByDay, 0);
  objc_storeStrong((id *)&self->_workoutsByMonthAndYear, 0);
  objc_storeStrong((id *)&self->_workouts, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end