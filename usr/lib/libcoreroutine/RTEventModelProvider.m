@interface RTEventModelProvider
+ (int64_t)periodicPurgePolicy;
- (BOOL)_deleteUserInteractionsBeforeDate:(id)a3;
- (BOOL)_hasSuggestedLocationForEvent:(id)a3;
- (BOOL)_persistEventModel;
- (BOOL)_persistUserInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5;
- (BOOL)deleteEventModel;
- (BOOL)highProbabilityHistogramItem:(id)a3;
- (BOOL)locationsOfInterestsAvailable;
- (BOOL)relativeHighProbabilityHistogramItem:(id)a3 toItem:(id)a4;
- (NSDictionary)locationOfInterestHistograms;
- (NSManagedObjectContext)managedObjectContext;
- (RTDefaultsManager)defaultsManager;
- (RTEventManager)eventManager;
- (RTEventModelProvider)init;
- (RTEventModelProvider)initWithDefaultsManager:(id)a3 eventManager:(id)a4 learnedLocationManager:(id)a5 managedObjectContext:(id)a6 metricManager:(id)a7 persistenceManager:(id)a8;
- (RTInvocationDispatcher)dispatcher;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationShifter)locationShifter;
- (RTMetricManager)metricManager;
- (RTPersistenceManager)persistenceManager;
- (double)getOverlapTimeForIntervalStart1:(id)a3 intervalEnd1:(id)a4 intervalStart2:(id)a5 intervalEnd2:(id)a6;
- (double)highProbabilityItemMinProbability;
- (double)relativeHighProbabilityItemMinDifference;
- (id)_createMetricFromEventCounter:(id)a3 categories:(id)a4;
- (id)_fetchCalendarEvents;
- (id)_geoLocationOfEvent:(id)a3;
- (id)_getLocationOfInterestWithIdentifier:(id)a3 fromArray:(id)a4;
- (id)_predictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5;
- (id)_suggestedLocationForEvent:(id)a3;
- (id)appendFieldToCategoryString:(id)a3 field:(id)a4 value:(int64_t)a5;
- (id)categoryForLocationState:(unint64_t)a3 ttlTrigggerd:(BOOL)a4;
- (id)getAllLOIHistogramsForEvents:(id)a3 andLocationsOfInterest:(id)a4;
- (id)getLOIHistogramForEvents:(id)a3 andLocationsOfInterest:(id)a4;
- (id)getObjectWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5 fromDictionary:(id)a6;
- (id)keywordForCategory:(id)a3 visited:(unint64_t)a4;
- (id)lastDateOfLOIVisits:(id)a3;
- (int)highProbabilityItemMinNumOfEvents;
- (unint64_t)_locationStateOfEvent:(id)a3;
- (unint64_t)lengthOfEvent:(id)a3;
- (unint64_t)timeOfDayOfEvent:(id)a3;
- (unint64_t)verifyPresenceOfUserWithEventLocation:(id)a3 deviceLOIs:(id)a4;
- (void)_buildLocationOfInterestHistogramWithHandler:(id)a3;
- (void)_fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4;
- (void)_finishRestoreEventModelWithIdentifiers:(id)a3 histoItems:(id)a4 locationsOfInterest:(id)a5 handler:(id)a6;
- (void)_restoreEventModelWithHandler:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_submitMetricScoreBoardFromStartDate:(id)a3 endDate:(id)a4 submissionHandler:(id)a5;
- (void)_submitMetricScoreBoardOnDate:(id)a3;
- (void)_submitMetricScoreBoardOnDate:(id)a3 submissionHandler:(id)a4;
- (void)_updateRegisteredDefaults:(id)a3;
- (void)addEvent:(id)a3 toIdentifierDict:(id)a4 useCalendarIdentifier:(BOOL)a5;
- (void)fetchAllLOIHistogramsWithHandler:(id)a3;
- (void)fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6;
- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6;
- (void)onDailyMetricNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)onManagedObjectContextCreated:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)persistEventModel;
- (void)refreshAllLOIHistogramsWithHandler:(id)a3;
- (void)restoreEventModelIfAppropriate;
- (void)restoreEventModelWithHandler:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setHighProbabilityItemMinNumOfEvents:(int)a3;
- (void)setHighProbabilityItemMinProbability:(double)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationOfInterestHistograms:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setLocationsOfInterestsAvailable:(BOOL)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setRelativeHighProbabilityItemMinDifference:(double)a3;
- (void)updateValueForKey:(id)a3 expectedClass:(Class)a4 handler:(id)a5;
- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 mapItem:(id)a6 handler:(id)a7;
@end

@implementation RTEventModelProvider

- (id)_predictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 length];
  v12 = [(RTEventModelProvider *)self locationOfInterestHistograms];
  if (v11)
  {
    v13 = [(RTEventModelProvider *)self getObjectWithName:v9 source:1 calendarIdentifier:v10 fromDictionary:v12];

    v14 = [(RTEventModelProvider *)self locationOfInterestHistograms];
    v15 = self;
    id v16 = v9;
    uint64_t v17 = 1;
  }
  else
  {
    v13 = [(RTEventModelProvider *)self getObjectWithName:v8 source:2 calendarIdentifier:v10 fromDictionary:v12];

    v14 = [(RTEventModelProvider *)self locationOfInterestHistograms];
    v15 = self;
    id v16 = v8;
    uint64_t v17 = 2;
  }
  v18 = [(RTEventModelProvider *)v15 getObjectWithName:v16 source:v17 calendarIdentifier:0 fromDictionary:v14];

  v19 = objc_opt_new();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke;
  v33[3] = &unk_1E6B99020;
  id v34 = v9;
  v35 = self;
  id v36 = v19;
  id v20 = v19;
  id v21 = v9;
  v22 = (void (**)(void, void))MEMORY[0x1E016DB00](v33);
  ((void (**)(void, void *))v22)[2](v22, v13);
  ((void (**)(void, void *))v22)[2](v22, v18);
  v23 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_2;
  v31[3] = &unk_1E6B99048;
  id v32 = v23;
  id v24 = v23;
  v25 = (void *)MEMORY[0x1E016DB00](v31);
  [v20 enumerateObjectsUsingBlock:v25];
  v26 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v24 count]];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_3;
  v29[3] = &unk_1E6B99070;
  id v27 = v26;
  id v30 = v27;
  [v24 enumerateKeysAndObjectsUsingBlock:v29];
  [v27 sortUsingComparator:&__block_literal_global_208_0];

  return v27;
}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  if ([v17 count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [v17 objectAtIndexedSubscript:v3];
      v5 = [v4 locationOfInterest];
      v6 = [v5 mapItem];

      if (v6)
      {
        if (![*(id *)(a1 + 32) length]
          || ([v17 objectAtIndexedSubscript:v3],
              v7 = objc_claimAutoreleasedReturnValue(),
              [v7 locationOfInterest],
              id v8 = objc_claimAutoreleasedReturnValue(),
              uint64_t v9 = [v8 type],
              v8,
              v7,
              v9))
        {
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = [v17 objectAtIndexedSubscript:v3];
          LODWORD(v10) = [v10 highProbabilityHistogramItem:v11];

          if (v10) {
            goto LABEL_7;
          }
          if ([v17 count] > v3 + 1)
          {
            v14 = *(void **)(a1 + 40);
            v15 = [v17 objectAtIndexedSubscript:v3];
            id v16 = [v17 objectAtIndexedSubscript:v3 + 1];
            LODWORD(v14) = [v14 relativeHighProbabilityHistogramItem:v15 toItem:v16];

            if (v14)
            {
LABEL_7:
              v12 = *(void **)(a1 + 48);
              v13 = [v17 objectAtIndexedSubscript:v3];
              [v12 addObject:v13];
            }
          }
        }
      }
      ++v3;
    }
    while ([v17 count] > v3);
  }
}

- (NSDictionary)locationOfInterestHistograms
{
  return self->_locationOfInterestHistograms;
}

- (id)getObjectWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5 fromDictionary:(id)a6
{
  reusableLookupIdentifier = self->_reusableLookupIdentifier;
  id v12 = a6;
  v13 = (RTEventLocationIdentifier *)a5;
  id v14 = a3;
  if (reusableLookupIdentifier)
  {
    [(RTEventLocationIdentifier *)reusableLookupIdentifier setName:v14];

    [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier setSource:a4];
    [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier setCalendarIdentifier:v13];
  }
  else
  {
    v15 = [[RTEventLocationIdentifier alloc] initWithName:v14 source:a4 calendarIdentifier:v13];

    v13 = self->_reusableLookupIdentifier;
    self->_reusableLookupIdentifier = v15;
  }

  id v16 = [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier normalize];
  id v17 = [a6 objectForKey:self->_reusableLookupIdentifier];

  [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier setName:0];
  [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier setSource:0];
  [(RTEventLocationIdentifier *)self->_reusableLookupIdentifier setCalendarIdentifier:0];

  return v17;
}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F5CEA0];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  [v6 doubleValue];
  double v10 = v9;

  id v11 = (id)[v8 initWithLocationOfInterest:v7 confidence:0 nextEntryTime:0 modeOfTransportation:0 sources:v10];
  [*(id *)(a1 + 32) addObject:v11];
}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    v15 = [(RTNotifier *)self queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __115__RTEventModelProvider_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
    v16[3] = &unk_1E6B916E0;
    SEL v22 = a2;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    id v20 = self;
    id v21 = v14;
    dispatch_async(v15, v16);
  }
}

void __115__RTEventModelProvider_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 138413058;
    double v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %@, location, %@, calendarIdentifier, %@", (uint8_t *)&v8, 0x2Au);
  }
  unint64_t v3 = [*(id *)(a1 + 56) _predictedLocationsOfInterestAssociatedToTitle:*(void *)(a1 + 32) location:*(void *)(a1 + 40) calendarIdentifier:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v14 = v3;
  uint64_t v5 = [v3 locationOfInterest];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6 || ([v6 doubleValue], double v8 = v7, objc_msgSend(v14, "probability"), v8 < v9))
  {
    __int16 v10 = NSNumber;
    [v14 probability];
    uint64_t v11 = [v10 numberWithDouble:];
    __int16 v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v14 locationOfInterest];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
}

- (BOOL)highProbabilityHistogramItem:(id)a3
{
  id v4 = a3;
  [v4 probability];
  double v6 = v5;
  [(RTEventModelProvider *)self highProbabilityItemMinProbability];
  if (v6 >= v7)
  {
    uint64_t v9 = [v4 numOfEvents];
    BOOL v8 = v9 >= [(RTEventModelProvider *)self highProbabilityItemMinNumOfEvents];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)highProbabilityItemMinProbability
{
  return self->_highProbabilityItemMinProbability;
}

- (int)highProbabilityItemMinNumOfEvents
{
  return self->_highProbabilityItemMinNumOfEvents;
}

- (RTEventModelProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager_);
}

- (RTEventModelProvider)initWithDefaultsManager:(id)a3 eventManager:(id)a4 learnedLocationManager:(id)a5 managedObjectContext:(id)a6 metricManager:(id)a7 persistenceManager:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  unint64_t v17 = (unint64_t)a6;
  id v36 = a7;
  unint64_t v18 = (unint64_t)a8;
  id v19 = (void *)v18;
  if (!v15)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_15;
  }
  if (!v16)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: eventManager";
    goto LABEL_14;
  }
  if (!v37)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: learnedLocationManager";
      goto LABEL_14;
    }
LABEL_15:

    v26 = 0;
LABEL_16:
    id v27 = v36;
    goto LABEL_17;
  }
  if (v17 | v18)
  {
    v42.receiver = self;
    v42.super_class = (Class)RTEventModelProvider;
    id v20 = [(RTNotifier *)&v42 init];
    id v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_learnedLocationManager, a5);
      objc_storeStrong((id *)&v21->_eventManager, a4);
      objc_storeStrong((id *)&v21->_metricManager, a7);
      objc_storeStrong((id *)&v21->_persistenceManager, a8);
      if (v17)
      {
        SEL v22 = (NSManagedObjectContext *)(id)v17;
        managedObjectContext = v21->_managedObjectContext;
        v21->_managedObjectContext = v22;
      }
      else
      {
        persistenceManager = v21->_persistenceManager;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke;
        v40[3] = &unk_1E6B95C10;
        v41 = v21;
        [(RTPersistenceManager *)persistenceManager createManagedObjectContext:v40];
        managedObjectContext = (NSManagedObjectContext *)v41;
      }

      objc_storeStrong((id *)&v21->_defaultsManager, a3);
      v31 = [RTInvocationDispatcher alloc];
      id v32 = [(RTNotifier *)v21 queue];
      uint64_t v33 = [(RTInvocationDispatcher *)v31 initWithQueue:v32];
      dispatcher = v21->_dispatcher;
      v21->_dispatcher = (RTInvocationDispatcher *)v33;

      v21->_highProbabilityItemMinProbability = 0.8;
      v21->_relativeHighProbabilityItemMinDifference = 0.65;
      v21->_highProbabilityItemMinNumOfEvents = 3;
      v35 = [(RTNotifier *)v21 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_3;
      block[3] = &unk_1E6B90E70;
      v39 = v21;
      dispatch_async(v35, block);
    }
    self = v21;
    v26 = self;
    goto LABEL_16;
  }
  v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  id v27 = v36;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager", buf, 2u);
  }

  v26 = 0;
LABEL_17:

  return v26;
}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_2;
  v6[3] = &unk_1E6B90BF0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) onManagedObjectContextCreated:*(void *)(a1 + 40)];
}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  id v4 = +[RTNotification notificationName];
  [v3 addObserver:v2 selector:sel_onLearnedLocationManagerNotification_ name:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 48);
  id v7 = +[RTNotification notificationName];
  [v6 addObserver:v5 selector:sel_onLearnedLocationManagerNotification_ name:v7];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel_onDailyMetricNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  uint64_t v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_4;
  v10[3] = &unk_1E6B90E70;
  id v11 = v9;
  [v11 _updateRegisteredDefaults:v10];
}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) highProbabilityItemMinProbability];
    uint64_t v4 = v3;
    [*(id *)(a1 + 32) relativeHighProbabilityItemMinDifference];
    uint64_t v6 = v5;
    int v7 = [*(id *)(a1 + 32) highProbabilityItemMinNumOfEvents];
    int v8 = 134218496;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Updated defaults, highProbabilityItemMinProbability, %f, relativeHighProbabilityItemMinDifference, %f, highProbabilityItemMinNumOfEvents, %d", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Shutdown RTEventModelProvider", v8, 2u);
  }

  [(RTNotifier *)self->_learnedLocationManager removeObserver:self];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  int v7 = [(RTEventModelProvider *)self dispatcher];
  [v7 shutdown];

  if (v4) {
    v4[2](v4, 0);
  }
}

- (RTLocationShifter)locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    uint64_t v4 = (RTLocationShifter *)objc_opt_new();
    uint64_t v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (void)_updateRegisteredDefaults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v6 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke;
  v20[3] = &unk_1E6B98DD0;
  v20[4] = self;
  int v7 = v5;
  id v21 = v7;
  [(RTEventModelProvider *)self updateValueForKey:@"RTDefaultsEventModelProviderHighProbabilityItemMinProbability" expectedClass:v6 handler:v20];
  dispatch_group_enter(v7);
  uint64_t v8 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_2;
  v18[3] = &unk_1E6B98DD0;
  v18[4] = self;
  uint64_t v9 = v7;
  id v19 = v9;
  [(RTEventModelProvider *)self updateValueForKey:@"RTDefaultsEventModelProviderRelativeHighProbabilityItemMinDifference" expectedClass:v8 handler:v18];
  dispatch_group_enter(v9);
  uint64_t v10 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_3;
  v16[3] = &unk_1E6B98DD0;
  void v16[4] = self;
  unint64_t v17 = v9;
  uint64_t v11 = v9;
  [(RTEventModelProvider *)self updateValueForKey:@"RTDefaultsEventModelProviderHighProbabilityItemMinNumOfEvents" expectedClass:v10 handler:v16];
  __int16 v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_4;
  block[3] = &unk_1E6B90868;
  id v15 = v4;
  id v13 = v4;
  dispatch_group_notify(v11, v12, block);
}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  [*(id *)(a1 + 32) setHighProbabilityItemMinProbability:];
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  [*(id *)(a1 + 32) setRelativeHighProbabilityItemMinDifference:];
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  [*(id *)(a1 + 32) setHighProbabilityItemMinNumOfEvents:[a3 intValue]];
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

uint64_t __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateValueForKey:(id)a3 expectedClass:(Class)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__RTEventModelProvider_updateValueForKey_expectedClass_handler___block_invoke;
    v11[3] = &unk_1E6B98DF8;
    v11[4] = self;
    id v12 = v8;
    Class v14 = a4;
    id v13 = v9;
    dispatch_async(v10, v11);
  }
}

void __64__RTEventModelProvider_updateValueForKey_expectedClass_handler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) defaultsManager];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "onDefaultsUpdate, %@ = %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"RTDefaultsEventModelProviderHighProbabilityItemMinProbability"])
    {
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"RTDefaultsEventModelProviderRelativeHighProbabilityItemMinDifference"])
    {
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"RTDefaultsEventModelProviderHighProbabilityItemMinNumOfEvents"])
    {
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = 138412802;
        uint64_t v10 = v8;
        __int16 v11 = 2080;
        id v12 = "-[RTEventModelProvider updateValueForKey:expectedClass:handler:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 331;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unhandled update for key, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
      }

      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v5();
  }
}

- (double)getOverlapTimeForIntervalStart1:(id)a3 intervalEnd1:(id)a4 intervalStart2:(id)a5 intervalEnd2:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  __int16 v11 = [a3 laterDate:a5];
  id v12 = [v10 earlierDate:v9];

  [v12 timeIntervalSinceDate:v11];
  double v14 = fmax(v13, 0.0);

  return v14;
}

- (id)getLOIHistogramForEvents:(id)a3 andLocationsOfInterest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id v9 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke;
  v21[3] = &unk_1E6B98E70;
  id v10 = v7;
  id v22 = v10;
  v23 = self;
  id v11 = v9;
  id v24 = v11;
  [v6 enumerateObjectsUsingBlock:v21];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_4;
  v17[3] = &unk_1E6B98E98;
  id v19 = v20;
  id v12 = v8;
  id v18 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_5;
  v16[3] = &unk_1E6B98EC0;
  void v16[4] = v20;
  [v12 enumerateObjectsUsingBlock:v16];
  [v12 sortUsingComparator:&__block_literal_global_77];
  double v13 = v18;
  id v14 = v12;

  _Block_object_dispose(v20, 8);

  return v14;
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_2;
  v7[3] = &unk_1E6B98E48;
  id v4 = (void *)a1[4];
  uint64_t v5 = (void *)a1[6];
  v7[4] = a1[5];
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 visits];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_3;
  v7[3] = &unk_1E6B98E20;
  uint64_t v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 startDate];
  id v7 = [*(id *)(a1 + 40) endDate];
  id v8 = [v5 entryDate];
  id v9 = [v5 exitDate];

  [v3 getOverlapTimeForIntervalStart1:v6 intervalEnd1:v7 intervalStart2:v8 intervalEnd2:v9];
  double v11 = v10;

  if (v11 > 0.0)
  {
    id v12 = *(void **)(a1 + 48);
    double v13 = [*(id *)(a1 + 56) identifier];
    id v18 = [v12 objectForKey:v13];

    if (v18)
    {
      [v18 timeOfStay];
      [v18 setTimeOfStay:v11 + v14];
      [v18 setNumOfEvents:[v18 numOfEvents] + 1];
    }
    else
    {
      uint64_t v15 = *(void **)(a1 + 48);
      id v16 = [[RTLOIHistogramItem alloc] initWithLocationOfInterest:*(void *)(a1 + 56) timeOfStay:1 andNumOfEvents:v11];
      unint64_t v17 = [*(id *)(a1 + 56) identifier];
      [v15 setObject:v16 forKey:v17];
    }
  }
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [v5 timeOfStay];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  [*(id *)(a1 + 32) addObject:v5];
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 timeOfStay];
  [v4 setProbability:v3 / *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 probability];
  double v7 = v6;
  [v5 probability];
  if (v7 >= v8)
  {
    [v4 probability];
    double v11 = v10;
    [v5 probability];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTEventModelProvider_fetchLOIHistogramForEventLocation_withHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTEventModelProvider_fetchLOIHistogramForEventLocation_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLOIHistogramForEventLocation:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)_fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(RTEventModelProvider *)self locationOfInterestHistograms];
  double v8 = [(RTEventModelProvider *)self getObjectWithName:v10 source:1 calendarIdentifier:0 fromDictionary:v7];

  if (!v8)
  {
    id v9 = [(RTEventModelProvider *)self locationOfInterestHistograms];
    double v8 = [(RTEventModelProvider *)self getObjectWithName:v10 source:2 calendarIdentifier:0 fromDictionary:v9];
  }
  v6[2](v6, v8, 0);
}

- (void)fetchAllLOIHistogramsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTEventModelProvider_fetchAllLOIHistogramsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__RTEventModelProvider_fetchAllLOIHistogramsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) locationOfInterestHistograms];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)addEvent:(id)a3 toIdentifierDict:(id)a4 useCalendarIdentifier:(BOOL)a5
{
  BOOL v5 = a5;
  id v24 = a3;
  id v8 = a4;
  if (v5)
  {
    id v9 = [v24 calendar];
    id v10 = [v9 calendarIdentifier];
  }
  else
  {
    id v10 = 0;
  }
  double v11 = [v24 locationWithoutPrediction];
  if ([v11 length])
  {
    id v12 = [v24 locationsWithoutPrediction];
    unint64_t v13 = [v12 count];

    double v14 = v24;
    if (v13 > 1) {
      goto LABEL_10;
    }
    uint64_t v15 = [v24 locationWithoutPrediction];
    double v11 = [(RTEventModelProvider *)self getObjectWithName:v15 source:1 calendarIdentifier:v10 fromDictionary:v8];

    if (!v11)
    {
      id v16 = [[RTEventLocationIdentifier alloc] initWithEvent:v24 source:1 useCalendarIdentifier:v5];
      unint64_t v17 = [(RTEventLocationIdentifier *)v16 normalize];

      double v11 = objc_opt_new();
      [v8 setObject:v11 forKey:v17];
    }
    [v11 addObject:v24];
  }

  double v14 = v24;
LABEL_10:
  id v18 = [v14 title];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    id v20 = [v24 title];
    id v21 = [(RTEventModelProvider *)self getObjectWithName:v20 source:2 calendarIdentifier:v10 fromDictionary:v8];

    if (!v21)
    {
      id v22 = [[RTEventLocationIdentifier alloc] initWithEvent:v24 source:2 useCalendarIdentifier:v5];
      v23 = [(RTEventLocationIdentifier *)v22 normalize];

      id v21 = objc_opt_new();
      [v8 setObject:v21 forKey:v23];
    }
    [v21 addObject:v24];
  }
}

- (BOOL)relativeHighProbabilityHistogramItem:(id)a3 toItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 probability];
  double v9 = v8;
  [v7 probability];
  double v11 = v10;

  [(RTEventModelProvider *)self relativeHighProbabilityItemMinDifference];
  if (v9 - v11 >= v12)
  {
    uint64_t v14 = [v6 numOfEvents];
    BOOL v13 = v14 >= [(RTEventModelProvider *)self highProbabilityItemMinNumOfEvents];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)getAllLOIHistogramsForEvents:(id)a3 andLocationsOfInterest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke;
  v19[3] = &unk_1E6B90A68;
  v19[4] = self;
  id v20 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v19];

  double v10 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke_2;
  v16[3] = &unk_1E6B98F08;
  void v16[4] = self;
  id v17 = v6;
  id v11 = v10;
  id v18 = v11;
  id v12 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  BOOL v13 = v18;
  id v14 = v11;

  return v14;
}

void __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 participationStatus];
  if (([v10 isAllDay] & 1) == 0 && v3 == 2)
  {
    id v4 = [v10 endDate];
    BOOL v5 = [v10 startDate];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    if (v7 > 600.0)
    {
      [*(id *)(a1 + 32) addEvent:v10 toIdentifierDict:*(void *)(a1 + 40) useCalendarIdentifier:0];
      double v8 = [v10 calendar];
      id v9 = [v8 calendarIdentifier];

      if (v9) {
        [*(id *)(a1 + 32) addEvent:v10 toIdentifierDict:*(void *)(a1 + 40) useCalendarIdentifier:1];
      }
    }
  }
}

void __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  BOOL v5 = [*(id *)(a1 + 32) getLOIHistogramForEvents:a3 andLocationsOfInterest:*(void *)(a1 + 40)];
  if ([v5 count]) {
    [*(id *)(a1 + 48) setObject:v5 forKey:v6];
  }
}

- (id)_fetchCalendarEvents
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  int v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__96;
  v49 = __Block_byref_object_dispose__96;
  id v50 = (id)objc_opt_new();
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] now];
  id v36 = 0;
  int v2 = -1;
  int v3 = 1;
  uint64_t v29 = *MEMORY[0x1E4F5CFE8];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    int v37 = *((_DWORD *)v52 + 6);
    if (v37 < 1501)
    {
      BOOL v5 = [v33 dateByAddingTimeInterval:(double)v2 * 604800.0];
      id v6 = [v33 dateByAddingTimeInterval:(double)(v2 + 1) * 604800.0];
      double v7 = [(RTEventModelProvider *)self eventManager];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __44__RTEventModelProvider__fetchCalendarEvents__block_invoke;
      v39[3] = &unk_1E6B98F30;
      id v4 = v5;
      v40 = v4;
      id v8 = v6;
      id v41 = v8;
      v43 = &v45;
      v44 = &v51;
      id v9 = v32;
      objc_super v42 = v9;
      v35 = v8;
      [v7 fetchEventsBetweenStartDate:v4 andEndDate:v8 withHandler:v39];

      id v10 = v9;
      id v11 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v12 = dispatch_time(0, 3600000000000);
      id v13 = v36;
      if (dispatch_semaphore_wait(v10, v12))
      {
        id v34 = [MEMORY[0x1E4F1C9C8] now];
        [v34 timeIntervalSinceDate:v11];
        double v15 = v14;
        id v16 = objc_opt_new();
        id v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_467];
        id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
        id v20 = [v19 firstObject];

        [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        id v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v55 = v30;
        *(void *)buf = @"semaphore wait timeout";
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v55 count:1];
        id v24 = [v22 errorWithDomain:v29 code:15 userInfo:v23];

        id v13 = v36;
        if (v24)
        {
          id v13 = v24;
        }
      }

      id v25 = v13;
      id v36 = v25;
    }
    else
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Fetched max number of events, stopped week %d", buf, 8u);
      }
    }

    BOOL v26 = v37 > 1500 || v2-- == -7;
    ++v3;
  }
  while (!v26);
  id v27 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v27;
}

void __44__RTEventModelProvider__fetchCalendarEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v6 description];
      int v16 = 138412290;
      uint64_t v17 = (uint64_t)v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Error fetching events: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = [v5 count];
      id v11 = [*(id *)(a1 + 32) stringFromDate];
      dispatch_time_t v12 = [*(id *)(a1 + 40) stringFromDate];
      int v16 = 134218498;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Fetched %lu events, startDate, %@, endDate, %@", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) arrayByAddingObjectsFromArray:v5];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    double v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v5 count];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_buildLocationOfInterestHistogramWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTEventModelProvider *)self _fetchCalendarEvents];
  id v6 = dispatch_group_create();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__96;
  v19[4] = __Block_byref_object_dispose__96;
  id v20 = 0;
  dispatch_group_enter(v6);
  double v7 = [(RTEventModelProvider *)self learnedLocationManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke;
  v16[3] = &unk_1E6B90700;
  __int16 v18 = v19;
  BOOL v8 = v6;
  uint64_t v17 = v8;
  [v7 fetchRecentLocationsOfInterestWithHandler:v16];

  id v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_178;
  v12[3] = &unk_1E6B98FF8;
  v12[4] = self;
  id v13 = v5;
  id v14 = v4;
  double v15 = v19;
  id v10 = v4;
  id v11 = v5;
  dispatch_group_notify(v8, v9, v12);

  _Block_object_dispose(v19, 8);
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v6 description];
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Error fetching LOIs: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v12 = 134217984;
      uint64_t v13 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Fetched %lu LOIs.", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:v5];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_178(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) getAllLOIHistogramsForEvents:*(void *)(a1 + 40) andLocationsOfInterest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [*(id *)(a1 + 32) setLocationOfInterestHistograms:v2];

  int v3 = [*(id *)(a1 + 32) _persistEventModel];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Start logging %lu fetched events.", buf, 0xCu);
    }

    [*(id *)(a1 + 40) enumerateObjectsUsingBlock:&__block_literal_global_182_0];
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Start logging %lu fetched LOIs.", buf, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) enumerateObjectsUsingBlock:&__block_literal_global_185];
    BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 32) locationOfInterestHistograms];
      uint64_t v10 = [v9 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "associated %lu events with LOIs", buf, 0xCu);
    }
    uint64_t v11 = [*(id *)(a1 + 32) locationOfInterestHistograms];
    [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_191_0];
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      __int16 v18 = @"persist event model was unsuccessful";
      double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      int v16 = [v13 errorWithDomain:v14 code:0 userInfo:v15];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);
    }
  }
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_179(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [v4 participationStatus];
  if (([v4 isAllDay] & 1) == 0 && v5 == 2)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 title];
      uint64_t v14 = [v4 locationWithoutPrediction];
      BOOL v8 = [v4 startDate];
      id v9 = [v8 stringFromDate];
      uint64_t v10 = [v4 endDate];
      uint64_t v11 = [v10 stringFromDate];
      uint64_t v12 = [v4 calendar];
      uint64_t v13 = [v12 calendarIdentifier];
      *(_DWORD *)buf = 134219266;
      uint64_t v16 = a3;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      BOOL v26 = v13;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Event %lu, %@, %@, %@, %@, %@", buf, 0x3Eu);
    }
  }
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_183(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v8 = 134218242;
    uint64_t v9 = a3;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "LOI %lu, %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [v4 visits];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_188_1];
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v2 entryDate];
    uint64_t v5 = [v4 stringFromDate];
    id v6 = [v2 exitDate];
    uint64_t v7 = [v6 stringFromDate];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "entry, %@, exit, %@", (uint8_t *)&v8, 0x16u);
  }
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, possible LOIs, %lu", (uint8_t *)&v7, 0x16u);
  }

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_194_1];
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_192(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "possible LOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)refreshAllLOIHistogramsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RTEventModelProvider_refreshAllLOIHistogramsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__RTEventModelProvider_refreshAllLOIHistogramsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildLocationOfInterestHistogramWithHandler:*(void *)(a1 + 40)];
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTEventModelProvider_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__RTEventModelProvider_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) name];
    int v14 = 138412290;
    double v15 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "received %@", (uint8_t *)&v14, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [*(id *)(a1 + 40) _buildLocationOfInterestHistogramWithHandler:0];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) name];
    id v8 = +[RTNotification notificationName];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      int v10 = [*(id *)(a1 + 32) available];
      uint64_t v11 = *(void **)(a1 + 40);
      if (v10)
      {
        [v11 setLocationsOfInterestsAvailable:1];
        [*(id *)(a1 + 40) restoreEventModelIfAppropriate];
      }
      else
      {
        [v11 setLocationsOfInterestsAvailable:0];
      }
    }
    else
    {
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [*(id *)(a1 + 32) name];
        int v14 = 138412290;
        double v15 = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "unhandled notification, %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke;
  v10[3] = &unk_1E6B91508;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RTEventModelProvider *)self fetchLOIHistogramForEventLocation:v9 withHandler:v10];
}

void __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = [[v3 alloc] initWithCapacity:[v4 count]];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2;
  uint64_t v13 = &unk_1E6B90A68;
  uint64_t v14 = a1[4];
  id v6 = v5;
  id v15 = v6;
  [v4 enumerateObjectsUsingBlock:&v10];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 count:v10, v11, v12, v13, v14];
    uint64_t v9 = a1[5];
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "found %lu locations of interest associated with identifer, %@", buf, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "highProbabilityHistogramItem:"))
  {
    int v3 = *(void **)(a1 + 40);
    id v4 = [v5 locationOfInterest];
    [v3 addObject:v4];
  }
}

- (void)fetchLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__RTEventModelProvider_fetchLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
    block[3] = &unk_1E6B914E0;
    void block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(v14, block);
  }
}

void __106__RTEventModelProvider_fetchLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _predictedLocationsOfInterestAssociatedToTitle:*(void *)(a1 + 40) location:*(void *)(a1 + 48) calendarIdentifier:*(void *)(a1 + 56)];
  id v2 = [v3 valueForKeyPath:@"locationOfInterest"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  double v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v4 confidence];
    double v11 = v10;
    [v5 confidence];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)onManagedObjectContextCreated:(id)a3
{
  if (a3)
  {
    -[RTEventModelProvider setManagedObjectContext:](self, "setManagedObjectContext:");
    id v4 = [(RTEventModelProvider *)self dispatcher];
    int v5 = [v4 invocationsPending];

    if (v5)
    {
      double v6 = [(RTEventModelProvider *)self dispatcher];
      [v6 dispatchPendingInvocations];
    }
    [(RTEventModelProvider *)self restoreEventModelIfAppropriate];
  }
  else
  {
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Failed to create managed object context.", v8, 2u);
    }
  }
}

- (BOOL)deleteEventModel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(RTEventModelProvider *)self managedObjectContext];

  if (v3)
  {
    *(void *)buf = 0;
    id v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__96;
    id v16 = __Block_byref_object_dispose__96;
    id v17 = 0;
    id v4 = [(RTEventModelProvider *)self managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__RTEventModelProvider_deleteEventModel__block_invoke;
    v11[3] = &unk_1E6B90E98;
    v11[4] = self;
    void v11[5] = buf;
    [v4 performBlockAndWait:v11];

    uint64_t v5 = *((void *)v13 + 5);
    BOOL v6 = v5 == 0;
    if (v5)
    {
      double v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        double v10 = [*((id *)v13 + 5) description];
        *(_DWORD *)id v18 = 138412290;
        id v19 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Error deleting event model, %@", v18, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "No managed object context, not purging.", buf, 2u);
    }

    return 0;
  }
  return v6;
}

void __40__RTEventModelProvider_deleteEventModel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[NSManagedObject entityName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 deleteAllWithEntityName:v3 predicate:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
    BOOL v6 = +[NSManagedObject entityName];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(id *)(v7 + 40);
    [v5 deleteAllWithEntityName:v6 predicate:0 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      double v8 = [*(id *)(a1 + 32) managedObjectContext];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(id *)(v9 + 40);
      [v8 save:&v10];
      objc_storeStrong((id *)(v9 + 40), v10);
    }
  }
}

- (BOOL)_persistEventModel
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(RTEventModelProvider *)self deleteEventModel])
  {
    id v3 = [(RTEventModelProvider *)self locationOfInterestHistograms];

    if (v3)
    {
      *(void *)id v15 = 0;
      id v16 = v15;
      uint64_t v17 = 0x3032000000;
      id v18 = __Block_byref_object_copy__96;
      id v19 = __Block_byref_object_dispose__96;
      id v20 = 0;
      uint64_t v4 = [(RTEventModelProvider *)self managedObjectContext];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __42__RTEventModelProvider__persistEventModel__block_invoke;
      v14[3] = &unk_1E6B90E98;
      v14[4] = self;
      v14[5] = v15;
      [v4 performBlockAndWait:v14];

      uint64_t v5 = *((void *)v16 + 5);
      BOOL v6 = v5 == 0;
      if (v5)
      {
        uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          double v8 = [*((id *)v16 + 5) description];
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = (uint64_t)v8;
          _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Error persisting event model, %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v11 = [(RTEventModelProvider *)self locationOfInterestHistograms];
          uint64_t v12 = [v11 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Persisted event model for %lu identifiers.", buf, 0xCu);
        }
      }

      _Block_object_dispose(v15, 8);
    }
    else
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v15 = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "Nothing to save.", v15, 2u);
      }

      return 1;
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v15 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Can't delete previous event model, not saving.", v15, 2u);
    }

    return 0;
  }
  return v6;
}

void __42__RTEventModelProvider__persistEventModel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locationOfInterestHistograms];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTEventModelProvider__persistEventModel__block_invoke_2;
  v7[3] = &unk_1E6B990E0;
  void v7[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v3 save:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
  [v5 reset];
}

void __42__RTEventModelProvider__persistEventModel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 managedObjectContext];
  uint64_t v9 = +[RTEventLocationIdentifierMO managedObjectWithEventLocationIdentifier:v7 inManagedObjectContext:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__RTEventModelProvider__persistEventModel__block_invoke_3;
  v11[3] = &unk_1E6B990B8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  [v6 enumerateObjectsUsingBlock:v11];
}

void __42__RTEventModelProvider__persistEventModel__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 managedObjectContext];
  id v6 = +[RTLOIHistogramItemMO managedObjectWithLOIHistogramItem:v4 inManagedObjectContext:v5];

  [v6 setEventLocationIdentifier:*(void *)(a1 + 40)];
}

- (void)_restoreEventModelWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTEventModelProvider *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[NSManagedObject entityName];
  id v22 = 0;
  id v4 = [v2 fetchAllWithEntityName:v3 predicate:0 sortDescriptors:0 error:&v22];
  id v5 = v22;

  id v6 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Retrieved %lu identifiers from disk.", buf, 0xCu);
  }

  if (v5)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) managedObjectContext];
    id v10 = +[NSManagedObject entityName];
    id v21 = 0;
    id v8 = [v9 fetchAllWithEntityName:v10 predicate:0 sortDescriptors:0 error:&v21];
    id v5 = v21;

    id v11 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Retrieved %lu histogram items from disk.", buf, 0xCu);
    }

    if (!v5)
    {
      uint64_t v14 = [*(id *)(a1 + 32) learnedLocationManager];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_212;
      v17[3] = &unk_1E6B99130;
      id v15 = *(void **)(a1 + 40);
      void v17[4] = *(void *)(a1 + 32);
      id v20 = v15;
      id v18 = v4;
      id v8 = v8;
      id v19 = v8;
      [v14 fetchRecentLocationsOfInterestWithHandler:v17];

      id v5 = 0;
      goto LABEL_11;
    }
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v5 description];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = (uint64_t)v16;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Error restoring event model, %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_2;
  v12[3] = &unk_1E6B99108;
  id v13 = v6;
  id v18 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v2();
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [*(id *)(a1 + 40) count];
      int v9 = 134217984;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Fetched %lu LOIs during restore.", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 40)];
    [v7 _finishRestoreEventModelWithIdentifiers:v5 histoItems:v6 locationsOfInterest:v8 handler:*(void *)(a1 + 72)];
  }
}

- (id)_getLocationOfInterestWithIdentifier:(id)a3 fromArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__96;
  id v17 = __Block_byref_object_dispose__96;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__RTEventModelProvider__getLocationOfInterestWithIdentifier_fromArray___block_invoke;
  v10[3] = &unk_1E6B99158;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __71__RTEventModelProvider__getLocationOfInterestWithIdentifier_fromArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 identifier];
  id v8 = [v7 UUIDString];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_finishRestoreEventModelWithIdentifiers:(id)a3 histoItems:(id)a4 locationsOfInterest:(id)a5 handler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(void))a6;
  id v14 = objc_opt_new();
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__96;
  dispatch_semaphore_t v32 = __Block_byref_object_dispose__96;
  id v33 = 0;
  uint64_t v15 = [(RTEventModelProvider *)self managedObjectContext];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke;
  v22[3] = &unk_1E6B991D0;
  id v16 = v10;
  id v23 = v16;
  uint64_t v24 = self;
  id v17 = v12;
  id v25 = v17;
  uint64_t v27 = &v28;
  id v18 = v14;
  id v26 = v18;
  [v15 performBlockAndWait:v22];

  if (v29[5])
  {
    v13[2](v13);
  }
  else
  {
    [(RTEventModelProvider *)self setLocationOfInterestHistograms:v18];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v18 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = v20;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Finished restoring event model with %lu identifiers.", buf, 0xCu);
      }

      id v21 = [(RTEventModelProvider *)self locationOfInterestHistograms];
      [v21 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_219];
    }
    ((void (*)(void (**)(void), void))v13[2])(v13, 0);
  }

  _Block_object_dispose(&v28, 8);
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_2;
  v7[3] = &unk_1E6B991A8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v6;
  long long v9 = v6;
  [v2 enumerateObjectsUsingBlock:v7];
  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  [v5 reset];
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [RTEventLocationIdentifier alloc];
  id v8 = [v6 name];
  long long v9 = [v6 source];
  uint64_t v10 = [v9 integerValue];
  id v11 = [v6 calendarIdentifier];
  id v12 = [(RTEventLocationIdentifier *)v7 initWithName:v8 source:v10 calendarIdentifier:v11];

  uint64_t v13 = objc_opt_new();
  id v14 = [v6 loiHistogramItems];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_3;
  id v22 = &unk_1E6B99180;
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 32);
  id v16 = v15;
  uint64_t v17 = *(void *)(a1 + 56);
  id v24 = v16;
  uint64_t v26 = v17;
  id v18 = v13;
  id v25 = v18;
  [v14 enumerateObjectsUsingBlock:&v19];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    *a4 = 1;
  }
  [v18 sortUsingComparator:&__block_literal_global_215, v19, v20, v21, v22, v23];
  [*(id *)(a1 + 48) setObject:v18 forKey:v12];
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 locationOfInterestIdentifier];
  id v18 = [v5 _getLocationOfInterestWithIdentifier:v7 fromArray:*(void *)(a1 + 40)];

  if (!v18)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a3 = 1;
  }
  id v11 = [RTLOIHistogramItem alloc];
  id v12 = [v6 timeOfStay];
  [v12 doubleValue];
  double v14 = v13;
  uint64_t v15 = [v6 numOfEvents];
  id v16 = -[RTLOIHistogramItem initWithLocationOfInterest:timeOfStay:andNumOfEvents:](v11, "initWithLocationOfInterest:timeOfStay:andNumOfEvents:", v18, [v15 integerValue], v14);

  uint64_t v17 = [v6 probability];

  [v17 doubleValue];
  -[RTLOIHistogramItem setProbability:](v16, "setProbability:");

  [*(id *)(a1 + 48) addObject:v16];
}

uint64_t __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 probability];
  double v7 = v6;
  [v5 probability];
  if (v7 >= v8)
  {
    [v4 probability];
    double v11 = v10;
    [v5 probability];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v5 count];
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, possible LOIs, %lu", (uint8_t *)&v7, 0x16u);
  }

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_222];
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_220(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "possible LOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)restoreEventModelIfAppropriate
{
  uint64_t v3 = [(RTEventModelProvider *)self managedObjectContext];
  if (v3 && (id v5 = (id)v3, [(RTEventModelProvider *)self locationsOfInterestsAvailable]))
  {
    id v4 = [(RTEventModelProvider *)self locationOfInterestHistograms];

    if (!v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __54__RTEventModelProvider_restoreEventModelIfAppropriate__block_invoke;
      v6[3] = &unk_1E6B90840;
      void v6[4] = self;
      [(RTEventModelProvider *)self _restoreEventModelWithHandler:v6];
    }
  }
  else
  {
    MEMORY[0x1F41817F8]();
  }
}

void __54__RTEventModelProvider_restoreEventModelIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 description];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Error restoring the event model, %@. Compute from scratch.", (uint8_t *)&v6, 0xCu);
    }
    [*(id *)(a1 + 32) _buildLocationOfInterestHistogramWithHandler:0];
  }
}

- (void)persistEventModel
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RTEventModelProvider_persistEventModel__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__RTEventModelProvider_persistEventModel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistEventModel];
}

- (void)restoreEventModelWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTEventModelProvider_restoreEventModelWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__RTEventModelProvider_restoreEventModelWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreEventModelWithHandler:*(void *)(a1 + 40)];
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 mapItem:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(RTNotifier *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke;
  v21[3] = &unk_1E6B916E0;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = self;
  id v26 = v15;
  unint64_t v27 = a4;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

void __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "userInteraction, %lu, PLOI, %@, feedback, %@, mapItem, %@", buf, 0x2Au);
  }

  [*(id *)(a1 + 56) _persistUserInteractionWithPredictedLocationOfInterest:*(void *)(a1 + 32) interaction:*(void *)(a1 + 72) feedback:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    uint64_t v7 = [*(id *)(a1 + 56) learnedLocationManager];
    id v8 = [*(id *)(a1 + 32) locationOfInterest];
    id v9 = [v8 identifier];
    uint64_t v10 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke_224;
    v12[3] = &unk_1E6B92370;
    id v13 = *(id *)(a1 + 64);
    [v7 updateLocationOfInterestWithIdentifier:v9 mapItem:v10 mapItemSource:264 handler:v12];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
}

uint64_t __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke_224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (BOOL)_persistUserInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(RTEventModelProvider *)self managedObjectContext];

  if (!v10)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v26 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "managedObjectContext is nil, not persisting user interaction.", v26, 2u);
    }
    goto LABEL_11;
  }
  uint64_t v11 = [v8 locationOfInterest];
  id v12 = [v11 identifier];

  if (!v12)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v26 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "No LOI identifier, not persisting user interaction.", v26, 2u);
    }
LABEL_11:

    BOOL v15 = 0;
    goto LABEL_15;
  }
  *(void *)id v26 = 0;
  unint64_t v27 = v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__96;
  uint64_t v30 = __Block_byref_object_dispose__96;
  id v31 = 0;
  id v13 = [(RTEventModelProvider *)self managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__RTEventModelProvider__persistUserInteractionWithPredictedLocationOfInterest_interaction_feedback___block_invoke;
  v20[3] = &unk_1E6B964B8;
  id v21 = v9;
  unint64_t v25 = a4;
  id v22 = v8;
  id v23 = self;
  id v24 = v26;
  [v13 performBlockAndWait:v20];

  uint64_t v14 = *((void *)v27 + 5);
  BOOL v15 = v14 == 0;
  if (v14)
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [*((id *)v27 + 5) description];
      *(_DWORD *)buf = 138412290;
      id v33 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Error persisting user interaction, %@", buf, 0xCu);
    }
  }
  else
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "Persisted a user interaction.", buf, 2u);
    }
  }

  _Block_object_dispose(v26, 8);
LABEL_15:

  return v15;
}

void __100__RTEventModelProvider__persistUserInteractionWithPredictedLocationOfInterest_interaction_feedback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  uint64_t v4 = [*(id *)(a1 + 40) locationOfInterest];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [*(id *)(a1 + 48) managedObjectContext];
  id v9 = +[RTEventModelUserInteractionMO managedObjectWithFeedback:v2 interaction:v3 locationOfInterestIdentifier:v6 date:v7 inManagedObjectContext:v8];

  uint64_t v10 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  [v10 save:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
}

- (BOOL)_deleteUserInteractionsBeforeDate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(RTEventModelProvider *)self managedObjectContext];

  if (v6)
  {
    *(void *)buf = 0;
    id v23 = buf;
    uint64_t v24 = 0x3032000000;
    unint64_t v25 = __Block_byref_object_copy__96;
    id v26 = __Block_byref_object_dispose__96;
    id v27 = 0;
    uint64_t v7 = [(RTEventModelProvider *)self managedObjectContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_231;
    v18[3] = &unk_1E6B91128;
    id v19 = v5;
    __int16 v20 = self;
    id v21 = buf;
    [v7 performBlockAndWait:v18];

    uint64_t v8 = *((void *)v23 + 5);
    BOOL v9 = v8 == 0;
    if (v8)
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *((void *)v23 + 5);
        *(_DWORD *)id v31 = 138412290;
        uint64_t v32 = v17;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Error deleting user interactions, %@", v31, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "No managed object context, queuing purge operation.", buf, 2u);
    }

    id v12 = [(RTEventModelProvider *)self dispatcher];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke;
    v29[3] = &unk_1E6B90BF0;
    void v29[4] = self;
    id v30 = v5;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_2;
    v28[3] = &__block_descriptor_40_e5_v8__0l;
    v28[4] = a2;
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    BOOL v15 = NSStringFromSelector(a2);
    [v12 enqueueBlock:v29, v28, @"%@-%@", v14, v15 failureBlock description];

    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteUserInteractionsBeforeDate:*(void *)(a1 + 40)];
}

void __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "failure block invoked for %@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_231(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(date < %@)", *(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  int v4 = +[NSManagedObject entityName];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  [v3 deleteAllWithEntityName:v4 predicate:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 40) managedObjectContext];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(id *)(v7 + 40);
    [v6 save:&v8];
    objc_storeStrong((id *)(v7 + 40), v8);
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__RTEventModelProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  id v14 = v8;
  BOOL v15 = self;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __68__RTEventModelProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) _deleteUserInteractionsBeforeDate:v2];
  }
  else
  {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)locationsOfInterestsAvailable
{
  return self->_locationsOfInterestsAvailable;
}

- (void)setLocationsOfInterestsAvailable:(BOOL)a3
{
  self->_locationsOfInterestsAvailable = a3;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (void)setLocationShifter:(id)a3
{
}

- (void)setHighProbabilityItemMinProbability:(double)a3
{
  self->_highProbabilityItemMinProbability = a3;
}

- (double)relativeHighProbabilityItemMinDifference
{
  return self->_relativeHighProbabilityItemMinDifference;
}

- (void)setRelativeHighProbabilityItemMinDifference:(double)a3
{
  self->_relativeHighProbabilityItemMinDifference = a3;
}

- (void)setHighProbabilityItemMinNumOfEvents:(int)a3
{
  self->_highProbabilityItemMinNumOfEvents = a3;
}

- (void)setLocationOfInterestHistograms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterestHistograms, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);

  objc_storeStrong((id *)&self->_reusableLookupIdentifier, 0);
}

- (unint64_t)_locationStateOfEvent:(id)a3
{
  id v4 = a3;
  if ([v4 hasConfirmedSuggestedLocation])
  {
    unint64_t v5 = 2;
  }
  else if ([v4 hasUserSpecifiedLocation])
  {
    unint64_t v5 = 3;
  }
  else
  {
    unint64_t v5 = ([v4 hasRejectedSuggestion] & 1) == 0
      && [(RTEventModelProvider *)self _hasSuggestedLocationForEvent:v4];
  }

  return v5;
}

- (id)_geoLocationOfEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 preferredLocationWithoutPrediction];
  uint64_t v6 = [v5 geoLocation];

  if (v6)
  {
    uint64_t v7 = [v4 preferredLocationWithoutPrediction];
    id v8 = [v7 geoLocation];
LABEL_3:

    goto LABEL_8;
  }
  if (([v4 hasRejectedSuggestion] & 1) == 0)
  {
    uint64_t v9 = [(RTEventModelProvider *)self _suggestedLocationForEvent:v4];
    if (v9)
    {
      uint64_t v7 = (void *)v9;
      id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      id v11 = [v7 locationOfInterest];
      id v8 = (void *)[v10 initWithRTLocationOfInterest:v11];

      goto LABEL_3;
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_hasSuggestedLocationForEvent:(id)a3
{
  id v3 = [(RTEventModelProvider *)self _suggestedLocationForEvent:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_suggestedLocationForEvent:(id)a3
{
  id v4 = a3;
  if ([v4 needsSuggestedLocation])
  {
    unint64_t v5 = [v4 title];
    uint64_t v6 = [v4 locationWithoutPrediction];
    uint64_t v7 = [v4 calendar];
    id v8 = [v7 calendarIdentifier];
    uint64_t v9 = [(RTEventModelProvider *)self _predictedLocationsOfInterestAssociatedToTitle:v5 location:v6 calendarIdentifier:v8];

    if ([v9 count])
    {
      id v10 = [v9 firstObject];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_submitMetricScoreBoardOnDate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardOnDate:]";
      __int16 v8 = 1024;
      int v9 = 1316;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }
  }
  [(RTEventModelProvider *)self _submitMetricScoreBoardOnDate:v4 submissionHandler:0];
}

- (void)_submitMetricScoreBoardOnDate:(id)a3 submissionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    __int16 v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardOnDate:submissionHandler:]";
      __int16 v13 = 1024;
      int v14 = 1323;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }
  }
  int v9 = [v6 startOfDay];
  uint64_t v10 = [v6 endOfDay];
  [(RTEventModelProvider *)self _submitMetricScoreBoardFromStartDate:v9 endDate:v10 submissionHandler:v7];
}

- (void)_submitMetricScoreBoardFromStartDate:(id)a3 endDate:(id)a4 submissionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v25 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardFromStartDate:endDate:submissionHandler:]";
    __int16 v26 = 1024;
    LODWORD(v27) = 1332;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v25 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardFromStartDate:endDate:submissionHandler:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 1333;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = [v8 stringFromDate];
    uint64_t v15 = [v9 stringFromDate];
    *(_DWORD *)buf = 138412546;
    unint64_t v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "LMP ScoreBoardOnDate:%@ - %@", buf, 0x16u);
  }
  id v16 = [(RTEventModelProvider *)self metricManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke;
  v20[3] = &unk_1E6B99310;
  void v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  [v16 fetchDiagnosticsEnabled:v20];
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke(uint64_t a1, int a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2;
    v12[3] = &unk_1E6B91490;
    id v4 = *(void **)(a1 + 40);
    void v12[4] = *(void *)(a1 + 32);
    id v13 = v4;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    dispatch_async(v3, v12);
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"LMP score board: Failed metric submission because Diagnostics and Usage is disabled."];
    id v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = v5;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v10 = [v8 errorWithDomain:@"RTMetricManagerErrorDomain" code:5 userInfo:v9];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v10);
    }
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__96;
  v19[4] = __Block_byref_object_dispose__96;
  id v20 = 0;
  id v3 = [*(id *)(a1 + 32) eventManager];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3;
  v15[3] = &unk_1E6B991F8;
  id v17 = *(id *)(a1 + 56);
  uint64_t v18 = v19;
  id v6 = v2;
  id v16 = v6;
  [v3 fetchEventsBetweenStartDate:v4 andEndDate:v5 withHandler:v15];

  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_407;
  v10[3] = &unk_1E6B992E8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v14 = v19;
  void v10[4] = v8;
  id v11 = v9;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  dispatch_group_notify(v6, v7, v10);

  _Block_object_dispose(v19, 8);
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "LMP score board: Error fetching events %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "LMP score board: Fetched %lu events.", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v5;
    uint64_t v8 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_407(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = dispatch_group_create();
    dispatch_group_enter(v2);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__96;
    uint64_t v29 = __Block_byref_object_dispose__96;
    id v30 = 0;
    id v3 = [*(id *)(a1 + 32) learnedLocationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_408;
    v20[3] = &unk_1E6B991F8;
    id v22 = *(id *)(a1 + 56);
    p_long long buf = &buf;
    id v6 = v2;
    id v21 = v6;
    [v3 fetchLocationsOfInterestVisitedBetweenStartDate:v4 endDate:v5 handler:v20];

    uint64_t v7 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_409;
    block[3] = &unk_1E6B992C0;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v18 = &buf;
    void block[4] = v8;
    id v9 = *(void **)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 64);
    id v17 = v9;
    dispatch_group_notify(v6, v7, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"LMP score board: event counter is empty"];
    id v6 = v10;
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11)
    {
      int v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      uint64_t v25 = v10;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v14 = [v12 errorWithDomain:@"RTMetricManagerErrorDomain" code:10 userInfo:v13];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
    }
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_408(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "LMP score, LOI for device: Error fetching LOIs of the device %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
  else
  {
    if (v8)
    {
      int v13 = 134217984;
      uint64_t v14 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "LMP score, LOI for device: Fetched %lu LOIs of the device.", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:v5];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_409(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = [[*(id *)(a1 + 32) lastDateOfLOIVisits:];
    id v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_412;
    v41[3] = &unk_1E6B99270;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v45 = *(void *)(a1 + 48);
    v41[4] = v6;
    id v33 = v2;
    id v42 = v33;
    uint64_t v7 = v3;
    v43 = v7;
    id v8 = v4;
    id v44 = v8;
    [v5 enumerateObjectsUsingBlock:v41];
    id v30 = v8;
    uint64_t v31 = a1;
    uint64_t v32 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) _createMetricFromEventCounter:v8 categories:v7];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v15 = [NSString alloc];
          id v16 = (void *)[v15 initWithCString:RTAnalyticsEventLearnedMeeting encoding:1];
          log_analytics_submission(v16, v14);
          id v17 = [NSString stringWithFormat:@"com.apple.%@", v16];
          AnalyticsSendEvent();
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v11);
    }
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    uint64_t v19 = v32;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v32 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v49 = v20;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "LMP score board: metric is submitted. (%lu)", buf, 0xCu);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_418;
    v34[3] = &unk_1E6B99298;
    id v21 = v30;
    uint64_t v22 = *(void *)(v31 + 32);
    id v35 = v21;
    uint64_t v36 = v22;
    [v32 enumerateObjectsUsingBlock:v34];
    uint64_t v23 = *(void *)(v31 + 40);
    if (v23) {
      (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v9, 0);
    }

    uint64_t v24 = v33;
  }
  else
  {
    uint64_t v25 = [NSString stringWithFormat:@"LMP score board: Location is not available"];
    uint64_t v24 = (void *)v25;
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v47 = v25;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v29 = [v27 errorWithDomain:@"RTMetricManagerErrorDomain" code:10 userInfo:v28];
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v29);
    }
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v49 = (uint64_t)v24;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_412(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isAllDay] & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3_413;
    v50[3] = &unk_1E6B99248;
    id v5 = v3;
    id v51 = v5;
    uint64_t v49 = [v4 predicateWithBlock:v50];
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) filteredArrayUsingPredicate:];
    uint64_t v7 = [*(id *)(a1 + 32) _geoLocationOfEvent:v5];
    uint64_t v8 = [*(id *)(a1 + 32) _locationStateOfEvent:v5];
    uint64_t v47 = (void *)v7;
    v48 = (void *)v6;
    uint64_t v9 = [*(id *)(a1 + 32) verifyPresenceOfUserWithEventLocation:v7 deviceLOIs:v6];
    uint64_t v10 = [v5 startDate];
    uint64_t v11 = [v5 endDate];

    if (v11)
    {
      uint64_t v12 = [v5 endDate];

      uint64_t v10 = (void *)v12;
    }
    uint64_t v46 = v10;
    uint64_t v13 = [*(id *)(a1 + 40) compare:v10];
    if (v9) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v13 == -1;
    }
    if (v14) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = v9;
    }
    id v16 = [*(id *)(a1 + 32) categoryForLocationState:v8 ttlTrigggerd:[v5 hasTTLBeenTriggered]];
    uint64_t v17 = [*(id *)(a1 + 32) keywordForCategory:v16 visited:v15];
    [*(id *)(a1 + 48) addObject:v16];
    uint64_t v45 = (void *)v17;
    [*(id *)(a1 + 56) addObject:v17];
    if ([v5 hasRejectedSuggestion])
    {
      uint64_t v18 = [*(id *)(a1 + 32) categoryForLocationState:4 ttlTrigggerd:[v5 hasTTLBeenTriggered]];
      [*(id *)(a1 + 48) addObject:v18];
      uint64_t v19 = *(void **)(a1 + 56);
      uint64_t v20 = [*(id *)(a1 + 32) keywordForCategory:v18 visited:v15];
      [v19 addObject:v20];
    }
    if (v8 == 1)
    {
      uint64_t v21 = [v5 locationWithoutPrediction];
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v23 = [v5 locationWithoutPrediction];
        uint64_t v24 = [v23 length];

        if (v24) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = 2;
        }
      }
      else
      {
        uint64_t v25 = 2;
      }
      uint64_t v26 = [*(id *)(a1 + 32) appendFieldToCategoryString:v16 field:@"MODEL" value:v25];
      [*(id *)(a1 + 48) addObject:v26];
      uint64_t v27 = *(void **)(a1 + 56);
      uint64_t v28 = [*(id *)(a1 + 32) keywordForCategory:v26 visited:v15];
      [v27 addObject:v28];
    }
    uint64_t v29 = [*(id *)(a1 + 32) appendFieldToCategoryString:@"LENGTH" field:[*(id *)(a1 + 32) lengthOfEvent:v5]];
    [*(id *)(a1 + 48) addObject:v29];
    id v30 = *(void **)(a1 + 56);
    uint64_t v31 = [*(id *)(a1 + 32) keywordForCategory:v29 visited:v15];
    [v30 addObject:v31];

    uint64_t v32 = [[*(id *)(a1 + 32) appendFieldToCategoryString:@"TOD" field:@"timeOfDayOfEvent:" value:[*(id *)(a1 + 32) timeOfDayOfEvent:v5]];
    [*(id *)(a1 + 48) addObject:v32];
    id v33 = *(void **)(a1 + 56);
    uint64_t v34 = [*(id *)(a1 + 32) keywordForCategory:v32 visited:v15];
    [v33 addObject:v34];

    if (v8 != 1) {
      goto LABEL_28;
    }
    id v35 = [*(id *)(a1 + 32) _suggestedLocationForEvent:v5];
    uint64_t v36 = v35;
    if (!v35)
    {
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    long long v37 = [v35 locationOfInterest];
    if ([v37 type])
    {
      long long v38 = [v36 locationOfInterest];
      uint64_t v39 = [v38 type];

      if (v39 != 1)
      {
        uint64_t v40 = -1;
LABEL_26:
        id v42 = [*(id *)(a1 + 32) appendFieldToCategoryString:v16 field:@"TYPE" value:v40];
        [*(id *)(a1 + 48) addObject:v42];
        v43 = *(void **)(a1 + 56);
        id v44 = [*(id *)(a1 + 32) keywordForCategory:v42 visited:v15];
        [v43 addObject:v44];

        goto LABEL_27;
      }
    }
    else
    {
    }
    id v41 = [v36 locationOfInterest];
    uint64_t v40 = [v41 type];

    goto LABEL_26;
  }
LABEL_29:
}

uint64_t __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3_413(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = [v5 visits];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_4;
  v10[3] = &unk_1E6B99220;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = &v13;
  [v7 enumerateObjectsUsingBlock:v10];

  uint64_t v8 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 entryDate];
  uint64_t v8 = [*(id *)(a1 + 32) startDate];
  id v13 = [v7 laterDate:v8];

  uint64_t v9 = [v6 exitDate];

  uint64_t v10 = [*(id *)(a1 + 32) endDate];
  id v11 = [v9 earlierDate:v10];

  [v11 timeIntervalSinceDate:v13];
  if (v12 > 0.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_418(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:1];
    int v7 = [v5 countForObject:v6];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:2];
    int v10 = [v8 countForObject:v9];
    id v11 = *(void **)(a1 + 32);
    double v12 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:0];
    LODWORD(v11) = [v11 countForObject:v12];
    id v13 = *(void **)(a1 + 32);
    BOOL v14 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:3];
    int v15 = 138413314;
    id v16 = v3;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v10;
    __int16 v21 = 1024;
    int v22 = (int)v11;
    __int16 v23 = 1024;
    int v24 = [v13 countForObject:v14];
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "LMP score board: (%@: corrects=%d, incorrects=%d, unknowns=%d, invalid=%d)", (uint8_t *)&v15, 0x24u);
  }
}

- (id)lastDateOfLOIVisits:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v8 = [v7 visits];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              BOOL v14 = [v13 entryDate];
              int v15 = [v13 exitDate];

              if (v15)
              {
                uint64_t v16 = [v13 exitDate];

                BOOL v14 = (void *)v16;
              }
              if (!v5 || [v14 compare:v5] == 1)
              {
                id v17 = v14;

                id v5 = v17;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)lengthOfEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 endDate];
  id v5 = [v3 startDate];

  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 < 900.0) {
    return 0;
  }
  if (v7 < 1800.0) {
    return 1;
  }
  if (v7 < 2700.0) {
    return 2;
  }
  if (v7 < 3600.0) {
    return 3;
  }
  if (v7 >= 7200.0) {
    return 5;
  }
  return 4;
}

- (unint64_t)timeOfDayOfEvent:(id)a3
{
  id v3 = [a3 startDate];
  uint64_t v4 = [v3 hour];

  unint64_t v5 = 1;
  if (v4 > 18) {
    unint64_t v5 = 2;
  }
  if (v4 >= 8) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)_createMetricFromEventCounter:(id)a3 categories:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v22 = "-[RTEventModelProvider(RTMetricManager) _createMetricFromEventCounter:categories:]";
    __int16 v23 = 1024;
    int v24 = 1587;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventCounter (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v22 = "-[RTEventModelProvider(RTMetricManager) _createMetricFromEventCounter:categories:]";
      __int16 v23 = 1024;
      int v24 = 1588;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: categories (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  uint64_t v11 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__RTEventModelProvider_RTMetricManager___createMetricFromEventCounter_categories___block_invoke;
  v17[3] = &unk_1E6B99338;
  id v18 = v6;
  __int16 v19 = self;
  id v12 = v11;
  id v20 = v12;
  id v13 = v6;
  [v8 enumerateObjectsUsingBlock:v17];
  BOOL v14 = v20;
  id v15 = v12;

  return v15;
}

void __82__RTEventModelProvider_RTMetricManager___createMetricFromEventCounter_categories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v22 = (id)objc_opt_new();
  uint64_t v4 = *(void **)(a1 + 32);
  unint64_t v5 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:1];
  unint64_t v6 = [v4 countForObject:v5];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:2];
  uint64_t v9 = [v7 countForObject:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:0];
  uint64_t v12 = [v10 countForObject:v11];

  id v13 = *(void **)(a1 + 32);
  BOOL v14 = [*(id *)(a1 + 40) keywordForCategory:v3 visited:3];
  uint64_t v15 = [v13 countForObject:v14];

  uint64_t v16 = (void *)[v3 copy];
  [v22 setObject:v16 forKeyedSubscript:@"keyword"];

  id v17 = [NSNumber numberWithUnsignedInteger:v6];
  [v22 setObject:v17 forKeyedSubscript:@"corrects"];

  id v18 = [NSNumber numberWithUnsignedInteger:v9];
  [v22 setObject:v18 forKeyedSubscript:@"incorrects"];

  __int16 v19 = [NSNumber numberWithUnsignedInteger:v12];
  [v22 setObject:v19 forKeyedSubscript:@"unknown"];

  id v20 = [NSNumber numberWithUnsignedInteger:v15];
  [v22 setObject:v20 forKeyedSubscript:@"invalids"];

  if (v9 + v6)
  {
    long long v21 = [NSNumber numberWithUnsignedInteger:v6 / (v9 + v6)];
    [v22 setObject:v21 forKeyedSubscript:@"precision"];
  }
  [*(id *)(a1 + 48) addObject:v22];
}

- (id)categoryForLocationState:(unint64_t)a3 ttlTrigggerd:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(RTEventModelProvider *)self appendFieldToCategoryString:0 field:@"LOC" value:a3];
  id v7 = [(RTEventModelProvider *)self appendFieldToCategoryString:v6 field:@"TTL" value:v4];

  return v7;
}

- (id)keywordForCategory:(id)a3 visited:(unint64_t)a4
{
  return [(RTEventModelProvider *)self appendFieldToCategoryString:a3 field:@"VISIT" value:a4];
}

- (id)appendFieldToCategoryString:(id)a3 field:(id)a4 value:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v15 = "-[RTEventModelProvider(RTMetricManager) appendFieldToCategoryString:field:value:]";
      __int16 v16 = 1024;
      int v17 = 1630;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: field (in %s:%d)", buf, 0x12u);
    }

    if (!v7)
    {
LABEL_10:

      id v7 = &stru_1F33EAD88;
      uint64_t v10 = &stru_1F33EAD88;
      if (!v8) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  if (![(__CFString *)v7 length]) {
    goto LABEL_10;
  }
  uint64_t v10 = @",";
  if (!v8) {
    goto LABEL_13;
  }
LABEL_11:
  if ([v8 length])
  {
    uint64_t v11 = (__CFString *)[[NSString alloc] initWithFormat:@"%@%@%@=%ld", v7, v10, v8, a5];
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v11 = v7;
LABEL_14:
  uint64_t v12 = v11;

  return v12;
}

- (unint64_t)verifyPresenceOfUserWithEventLocation:(id)a3 deviceLOIs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    unint64_t v7 = 2;
    uint64_t v17 = 2;
    if (v5)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v5];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__RTEventModelProvider_RTMetricManager__verifyPresenceOfUserWithEventLocation_deviceLOIs___block_invoke;
      v11[3] = &unk_1E6B99158;
      id v9 = v8;
      id v12 = v9;
      id v13 = &v14;
      [v6 enumerateObjectsUsingBlock:v11];
      unint64_t v7 = v15[3];
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void __90__RTEventModelProvider_RTMetricManager__verifyPresenceOfUserWithEventLocation_deviceLOIs___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = objc_alloc(MEMORY[0x1E4F5CE00]);
  id v8 = [v6 location];
  [v8 latitude];
  double v10 = v9;
  uint64_t v11 = [v6 location];
  [v11 longitude];
  double v13 = v12;
  uint64_t v14 = [v6 location];
  [v14 horizontalUncertainty];
  double v16 = v15;
  uint64_t v17 = [v6 location];
  [v17 altitude];
  double v19 = v18;
  id v20 = [v6 location];
  [v20 verticalUncertainty];
  id v22 = (void *)[v7 initWithLatitude:0 longitude:0 horizontalUncertainty:v10 altitude:v13 verticalUncertainty:v16 date:v19 referenceFrame:v21 speed:0.0];

  __int16 v23 = objc_opt_new();
  uint64_t v24 = *(void *)(a1 + 32);
  id v34 = 0;
  [v23 distanceFromLocation:v24 toLocation:v22 error:&v34];
  double v26 = v25;
  id v27 = v34;
  if (v27)
  {
    long long v28 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v33 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Error computing distance in metrics, unable to verify user presence", v33, 2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 3;
  }
  uint64_t v29 = [v6 location];
  [v29 horizontalUncertainty];
  double v31 = v30;

  double v32 = 100.0;
  if (v31 >= 100.0) {
    double v32 = v31;
  }
  if (v26 < v32)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)onDailyMetricNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__RTEventModelProvider_RTMetricManager__onDailyMetricNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__RTEventModelProvider_RTMetricManager__onDailyMetricNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) name];
  char v3 = [v2 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v3 & 1) == 0)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      double v10 = [*(id *)(a1 + 32) name];
      int v12 = 138412802;
      double v13 = v10;
      __int16 v14 = 2080;
      double v15 = "-[RTEventModelProvider(RTMetricManager) onDailyMetricNotification:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1691;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
  id v5 = [*(id *)(a1 + 32) name];
  char v6 = [v5 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "LMP, a ScoreBoard metric is requested.", (uint8_t *)&v12, 2u);
    }

    id v8 = [MEMORY[0x1E4F1C9C8] date];
    double v9 = [v8 dateByAddingTimeInterval:-86400.0];

    [*(id *)(a1 + 40) _submitMetricScoreBoardOnDate:v9];
  }
  else
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 32) name];
      int v12 = 138412290;
      double v13 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

@end