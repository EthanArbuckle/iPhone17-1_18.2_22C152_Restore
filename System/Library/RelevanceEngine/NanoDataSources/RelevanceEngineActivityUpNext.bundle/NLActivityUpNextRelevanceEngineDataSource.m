@interface NLActivityUpNextRelevanceEngineDataSource
+ (BOOL)wantsReloadForSignificantTimeChange;
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
- (BOOL)_shouldShowWalkSuggestion;
- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)isRebuildingTypicalDayModel;
- (BOOL)isUpdatingTypicalDayCachedValues;
- (BOOL)progressUpdatesEnabled;
- (BOOL)shouldSuggestWalk;
- (BOOL)willCompleteGoal;
- (FIActivitySettingsController)settingsController;
- (FITypicalDayActivityModel)typicalDayModel;
- (HKActivitySummary)currentSummary;
- (HKHealthStore)healthStore;
- (NLActivityUpNextRelevanceEngineDataSource)init;
- (NSDictionary)historicalSummariesByIndex;
- (NSSet)queries;
- (OS_dispatch_queue)serialQueue;
- (double)suggestedWalkTime;
- (id)_activitySummaryPredicateForTypicalDateInterval;
- (id)_createWalkSuggestionElement;
- (id)_typicalDayDateInterval;
- (id)_wristOffDate;
- (id)currentCalendar;
- (id)currentDate;
- (id)firstOnWristDateToday;
- (id)supportedSections;
- (unint64_t)_walkSuggestionDurationInMinutes;
- (void)_addNotificationObservers;
- (void)_executeQuery:(id)a3;
- (void)_queryActivitySummaryHistory;
- (void)_queryActivitySummaryHistoryWithRemainingRetries:(unint64_t)a3;
- (void)_queue_handleNewActivitySummaries:(id)a3;
- (void)_queue_handleUpdatedCurrentActivitySummary:(id)a3;
- (void)_queue_updateCachedTypicalDayValues;
- (void)_rebuildTypicalDayModel;
- (void)_removeNotificationObservers;
- (void)_significantTimeChangeOccurred;
- (void)_startCurrentActivitySummaryQuery;
- (void)_startCurrentActivitySummaryQueryWithRemainingRetries:(unint64_t)a3;
- (void)_stopQueries;
- (void)_typicalDayTodayActivityChanged;
- (void)dealloc;
- (void)fetchProjectedOffWristDateTodayWithDateInterval:(id)a3 completion:(id)a4;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)pause;
- (void)periodOfDayPredictorDidUpdatePredictedIntervals:(id)a3;
- (void)resume;
- (void)setCurrentSummary:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHistoricalSummariesByIndex:(id)a3;
- (void)setIsRebuildingTypicalDayModel:(BOOL)a3;
- (void)setIsUpdatingTypicalDayCachedValues:(BOOL)a3;
- (void)setProgressUpdatesEnabled:(BOOL)a3;
- (void)setQueries:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setShouldSuggestWalk:(BOOL)a3;
- (void)setSuggestedWalkTime:(double)a3;
- (void)setTypicalDayModel:(id)a3;
- (void)setWillCompleteGoal:(BOOL)a3;
@end

@implementation NLActivityUpNextRelevanceEngineDataSource

- (NLActivityUpNextRelevanceEngineDataSource)init
{
  v18.receiver = self;
  v18.super_class = (Class)NLActivityUpNextRelevanceEngineDataSource;
  v2 = [(NLActivityUpNextRelevanceEngineDataSource *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UNSPECIFIED, 0);

    v5 = dispatch_queue_attr_make_with_overcommit();

    dispatch_queue_t v6 = dispatch_queue_create((const char *)[@"com.apple.Activity.UpNext.Serial" UTF8String], v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = +[NSDictionary dictionary];
    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setHistoricalSummariesByIndex:v8];

    v9 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setHealthStore:v9];

    id v10 = objc_alloc((Class)FIActivitySettingsController);
    v11 = [(NLActivityUpNextRelevanceEngineDataSource *)v2 healthStore];
    id v12 = [v10 initWithHealthStore:v11];
    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setSettingsController:v12];

    v13 = +[NSSet set];
    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setQueries:v13];

    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setProgressUpdatesEnabled:_CoachingProgressUpdatesEnabled()];
    id v14 = objc_alloc((Class)FITypicalDayActivityModel);
    v15 = [(NLActivityUpNextRelevanceEngineDataSource *)v2 _typicalDayDateInterval];
    id v16 = [v14 initForDateInterval:v15 delegate:v2];
    [(NLActivityUpNextRelevanceEngineDataSource *)v2 setTypicalDayModel:v16];
  }
  return v2;
}

- (void)_addNotificationObservers
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_significantTimeChangeOccurred" name:NSCalendarDayChangedNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_typicalDayTodayActivityChanged" name:FITypicalDayActivityModelTodayActivityDidChangeNotification object:0];

  id v5 = +[REPeriodOfDayPredictor sharedInstance];
  [v5 addObserver:self];
}

- (void)_removeNotificationObservers
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCalendarDayChangedNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:FITypicalDayActivityModelTodayActivityDidChangeNotification object:0];

  id v5 = +[REPeriodOfDayPredictor sharedInstance];
  [v5 removeObserver:self];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_significantTimeChangeToken)) {
    notify_cancel(self->_significantTimeChangeToken);
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[REPeriodOfDayPredictor sharedInstance];
  [v4 removeObserver:self];

  if (notify_is_valid_token(self->_preferenceChangeNotifyToken)) {
    notify_cancel(self->_preferenceChangeNotifyToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)NLActivityUpNextRelevanceEngineDataSource;
  [(NLActivityUpNextRelevanceEngineDataSource *)&v5 dealloc];
}

- (id)currentDate
{
  return +[NSDate date];
}

- (id)currentCalendar
{
  return +[NSCalendar currentCalendar];
}

- (void)fetchProjectedOffWristDateTodayWithDateInterval:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(NLActivityUpNextRelevanceEngineDataSource *)self _wristOffDate];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)firstOnWristDateToday
{
  v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  v4 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  objc_super v5 = [v3 startOfDayForDate:v4];

  id v6 = +[REPeriodOfDayPredictor sharedInstance];
  id v7 = [v6 dateIntervalForPreviousPeriodOfDay:0];

  v8 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  v9 = [v7 endDate];
  id v10 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  unsigned int v11 = [v8 isDate:v9 inSameDayAsDate:v10];

  if (v11)
  {
    id v12 = [v7 startDate];
LABEL_5:
    v15 = v12;
    goto LABEL_7;
  }
  v13 = +[REPeriodOfDayPredictor sharedInstance];
  id v14 = [v13 currentPeriodOfDay];

  if (v14)
  {
    id v12 = v5;
    goto LABEL_5;
  }
  id v16 = +[REPeriodOfDayPredictor sharedInstance];
  v17 = [v16 intervalForCurrentPeriodOfDay];
  v15 = [v17 startDate];

LABEL_7:
  objc_super v18 = [v15 laterDate:v5];
  [v18 timeIntervalSinceReferenceDate];
  double v20 = v19;
  v21 = [(NLActivityUpNextRelevanceEngineDataSource *)self _wristOffDate];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  if (v20 >= v23)
  {
    v25 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
    v26 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
    id v24 = [v25 startOfDayForDate:v26];
  }
  else
  {
    id v24 = v18;
  }

  return v24;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = (void (**)(id, void *))a6;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_4848;
  v47 = sub_4858;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_4848;
  serialQueue = self->_serialQueue;
  v41 = sub_4858;
  id v42 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4860;
  block[3] = &unk_C3B0;
  block[4] = self;
  block[5] = &v43;
  block[6] = &v37;
  dispatch_sync(serialQueue, block);
  v31 = v9;
  v13 = [(id)v44[5] dateFromComponents:v9];
  v30 = v10;
  id v14 = [(id)v44[5] dateFromComponents:v10];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = (id)v38[5];
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        double v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v20 = (void *)v44[5];
        v21 = [v19 dateComponentsForCalendar:v20];
        double v22 = [v20 dateFromComponents:v21];

        [v22 timeIntervalSinceReferenceDate];
        double v24 = v23;
        [v13 timeIntervalSinceReferenceDate];
        if (v24 >= v25)
        {
          [v22 timeIntervalSinceReferenceDate];
          double v27 = v26;
          [v14 timeIntervalSinceReferenceDate];
          if (v27 <= v28) {
            v11[2](v11, v19);
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v32 objects:v49 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return 1;
}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  return 1;
}

- (void)pause
{
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7B04();
  }
  [(NLActivityUpNextRelevanceEngineDataSource *)self _stopQueries];
  notify_suspend(self->_significantTimeChangeToken);
  notify_suspend(self->_preferenceChangeNotifyToken);
  [(NLActivityUpNextRelevanceEngineDataSource *)self _removeNotificationObservers];
}

- (void)resume
{
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7B38();
  }
  [(NLActivityUpNextRelevanceEngineDataSource *)self _startCurrentActivitySummaryQuery];
  [(NLActivityUpNextRelevanceEngineDataSource *)self _queryActivitySummaryHistory];
  if (notify_is_valid_token(self->_significantTimeChangeToken))
  {
    notify_resume(self->_significantTimeChangeToken);
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = (const char *)[@"SignificantTimeChangeNotification" UTF8String];
    id v4 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_4BE0;
    handler[3] = &unk_C3D8;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v3, &self->_significantTimeChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (notify_is_valid_token(self->_preferenceChangeNotifyToken))
  {
    notify_resume(self->_preferenceChangeNotifyToken);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v5 = (const char *)FINanoLifestylePreferencesChangedNotificationKey;
    id v6 = &_dispatch_main_q;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4C20;
    v7[3] = &unk_C3D8;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch(v5, &self->_preferenceChangeNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  [(NLActivityUpNextRelevanceEngineDataSource *)self _addNotificationObservers];
}

+ (id)bundleIdentifier
{
  return @"com.apple.SessionTrackerApp.UpNext";
}

+ (id)applicationBundleIdentifier
{
  return @"com.apple.SessionTrackerApp";
}

- (id)supportedSections
{
  uint64_t v4 = REDefaultSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7BA0((uint64_t)v6, v8);
  }
  if ([(NLActivityUpNextRelevanceEngineDataSource *)self _shouldShowWalkSuggestion])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4F34;
    v9[3] = &unk_C400;
    v9[4] = self;
    id v10 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
      sub_7B6C();
    }
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSArray0__struct);
  }
}

- (void)periodOfDayPredictorDidUpdatePredictedIntervals:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[Supergreen] Routines changed, so wrist-off time may have changed.", buf, 2u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_511C;
  block[3] = &unk_C428;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (unint64_t)_walkSuggestionDurationInMinutes
{
  [(NLActivityUpNextRelevanceEngineDataSource *)self suggestedWalkTime];
  return vcvtpd_u64_f64(v2 / 60.0);
}

- (BOOL)_shouldShowWalkSuggestion
{
  BOOL progressUpdatesEnabled = self->_progressUpdatesEnabled;
  _HKInitializeLogging();
  uint64_t v4 = HKLogCoaching;
  BOOL v5 = os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT);
  if (!progressUpdatesEnabled)
  {
    if (!v5) {
      return v5;
    }
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[Supergreen] Walk suggestion not appropriate because progress updates are disabled by user setting.", (uint8_t *)v8, 2u);
LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (v5)
  {
    id v6 = v4;
    v8[0] = 67109376;
    v8[1] = [(NLActivityUpNextRelevanceEngineDataSource *)self willCompleteGoal];
    __int16 v9 = 1024;
    unsigned int v10 = [(NLActivityUpNextRelevanceEngineDataSource *)self shouldSuggestWalk];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[Supergreen] Checking if walk is appropriate to suggest: willCompleteGoal=%{BOOL}d, shouldSuggestWalk=%{BOOL}d.", (uint8_t *)v8, 0xEu);
  }
  if ([(NLActivityUpNextRelevanceEngineDataSource *)self willCompleteGoal]) {
    goto LABEL_8;
  }
  LOBYTE(v5) = [(NLActivityUpNextRelevanceEngineDataSource *)self shouldSuggestWalk];
  return v5;
}

- (id)_createWalkSuggestionElement
{
  v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentSummary];
  uint64_t v4 = (char *)[v3 activityMoveMode];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    _HKInitializeLogging();
    BOOL v5 = (void *)HKLogCoaching;
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentSummary];
      *(_DWORD *)buf = 138412290;
      v54 = v7;
      id v8 = "[Supergreen] Not creating walk suggestion element for user in move minutes mode. Current summary = %@";
LABEL_11:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  __int16 v9 = [(NLActivityUpNextRelevanceEngineDataSource *)self settingsController];
  unsigned int v10 = (char *)[v9 experienceType];

  _HKInitializeLogging();
  unsigned int v11 = (void *)HKLogCoaching;
  if (v10 != (unsigned char *)&dword_0 + 1)
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v11;
      id v7 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentSummary];
      *(_DWORD *)buf = 138412290;
      v54 = v7;
      id v8 = "[Supergreen] Not creating walk suggestion element for user in fitness jr. experience. Current summary = %@";
      goto LABEL_11;
    }
LABEL_12:
    id v25 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEBUG)) {
    sub_7CC4(v11, self);
  }
  unint64_t v12 = [(NLActivityUpNextRelevanceEngineDataSource *)self _walkSuggestionDurationInMinutes];
  v13 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentSummary];
  id v14 = [v13 activeEnergyBurnedGoal];
  id v15 = +[HKUnit kilocalorieUnit];
  [v14 doubleValueForUnit:v15];
  double v17 = v16;
  objc_super v18 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentSummary];
  double v19 = [v18 activeEnergyBurned];
  double v20 = +[HKUnit kilocalorieUnit];
  [v19 doubleValueForUnit:v20];
  double v22 = v17 - v21;

  double v23 = [(NLActivityUpNextRelevanceEngineDataSource *)self _wristOffDate];
  v49 = NLActivityUpNextRelevanceEngineContent(v12);
  id v24 = objc_alloc_init((Class)NSURLComponents);
  [v24 setScheme:@"SessionTrackerApp"];
  if (v22 >= 1.0)
  {
    [v24 setHost:@"startworkout"];
    double v26 = +[NSString stringWithFormat:@"%lu", 52];
    double v27 = +[NSURLQueryItem queryItemWithName:@"activityType" value:v26];
    v52 = v27;
    double v28 = +[NSArray arrayWithObjects:&v52 count:1];
    [v24 setQueryItems:v28];

    v29 = +[NSString stringWithFormat:@"%lu", 3];
    v30 = +[NSURLQueryItem queryItemWithName:@"goalType" value:v29];
    v51[0] = v30;
    v31 = +[NSString stringWithFormat:@"%lf", *(void *)&v22];
    long long v32 = +[NSURLQueryItem queryItemWithName:@"goalValue" value:v31];
    v51[1] = v32;
    long long v33 = +[NSURLQueryItem queryItemWithName:@"presentConfiguration" value:@"1"];
    v51[2] = v33;
    long long v34 = +[NSArray arrayWithObjects:v51 count:3];

    long long v35 = [v24 queryItems];
    v36 = [v35 arrayByAddingObjectsFromArray:v34];
    [v24 setQueryItems:v36];
  }
  else
  {
    [v24 setHost:@"startworkoutwithpicker"];
  }
  id v37 = objc_alloc((Class)REElementOpenAction);
  v38 = [v24 URL];
  id v39 = [v37 initWithURL:v38 applicationID:@"com.apple.SessionTrackerApp"];

  v40 = [v23 dateByAddingTimeInterval:-10800.0];
  v41 = [v23 dateByAddingTimeInterval:10800.0 * -0.33];
  id v42 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v41 endDate:v23];
  id v43 = [objc_alloc((Class)REDateRelevanceProvider) initWithEventInterval:v42 becomesIrrelevantDate:v23 firstBecomesRelevantDate:v40 recentDuration:0.0];
  [v43 providerWithPriority:1];
  v44 = id v48 = v23;
  id v45 = objc_alloc((Class)REElement);
  v50 = v44;
  v46 = +[NSArray arrayWithObjects:&v50 count:1];
  id v25 = [v45 initWithIdentifier:@"com.apple.SessionTrackerApp.WalkSuggestion" content:v49 action:v39 relevanceProviders:v46 privacyBehavior:1];

LABEL_15:

  return v25;
}

- (void)_typicalDayTodayActivityChanged
{
  _HKInitializeLogging();
  v3 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen] Did receive typical day activity model update notification.", buf, 2u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5904;
  block[3] = &unk_C428;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_significantTimeChangeOccurred
{
  _HKInitializeLogging();
  v3 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen] Significant time change occurred.", v4, 2u);
  }
  [(NLActivityUpNextRelevanceEngineDataSource *)self _rebuildTypicalDayModel];
}

- (void)_queue_updateCachedTypicalDayValues
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned __int8 v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self isUpdatingTypicalDayCachedValues];
  _HKInitializeLogging();
  uint64_t v4 = HKLogCoaching;
  if (v3)
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[Supergreen] Cache update in progress, skipping.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[Supergreen] No cache update in progress, updating cached values.", buf, 2u);
    }
    [(NLActivityUpNextRelevanceEngineDataSource *)self setIsUpdatingTypicalDayCachedValues:1];
    BOOL v5 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5AC8;
    block[3] = &unk_C428;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)_rebuildTypicalDayModel
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E9C;
  block[3] = &unk_C428;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (id)_wristOffDate
{
  unsigned __int8 v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  uint64_t v4 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  BOOL v5 = objc_msgSend(v3, "hk_startOfDateByAddingDays:toDate:", 1, v4);

  id v6 = +[REPeriodOfDayPredictor sharedInstance];
  id v7 = [v6 dateIntervalForNextPeriodOfDay:1];

  id v8 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  __int16 v9 = [v7 startDate];
  unsigned int v10 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  unsigned int v11 = [v8 isDate:v9 inSameDayAsDate:v10];

  if (v11)
  {
    id v12 = [v7 endDate];
  }
  else
  {
    v13 = +[REPeriodOfDayPredictor sharedInstance];
    id v14 = (char *)[v13 currentPeriodOfDay];

    if (v14 == (unsigned char *)&dword_0 + 1)
    {
      id v15 = +[REPeriodOfDayPredictor sharedInstance];
      double v16 = [v15 intervalForCurrentPeriodOfDay];
      double v17 = [v16 endDate];

      goto LABEL_7;
    }
    id v12 = v5;
  }
  double v17 = v12;
LABEL_7:
  objc_super v18 = [v17 earlierDate:v5];

  return v18;
}

- (id)_typicalDayDateInterval
{
  unsigned __int8 v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  uint64_t v4 = FITypicalDayActivityModelDaysOfActivityHistory;
  BOOL v5 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  id v6 = objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", v4, v5);

  id v7 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  id v8 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentDate];
  __int16 v9 = [v7 startOfDayForDate:v8];

  unsigned int v10 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  unsigned int v11 = [v10 dateByAddingUnit:128 value:-1 toDate:v9 options:0];

  id v12 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v6 endDate:v11];

  return v12;
}

- (id)_activitySummaryPredicateForTypicalDateInterval
{
  unsigned __int8 v3 = [(NLActivityUpNextRelevanceEngineDataSource *)self _typicalDayDateInterval];
  uint64_t v4 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  BOOL v5 = [v3 startDate];
  id v6 = objc_msgSend(v4, "hk_activitySummaryDateComponentsFromDate:", v5);

  id v7 = [(NLActivityUpNextRelevanceEngineDataSource *)self currentCalendar];
  id v8 = [v3 endDate];
  __int16 v9 = objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", v8);

  unsigned int v10 = +[HKQuery predicateForActivitySummariesBetweenStartDateComponents:v6 endDateComponents:v9];

  return v10;
}

- (void)_queue_handleUpdatedCurrentActivitySummary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(NLActivityUpNextRelevanceEngineDataSource *)self setCurrentSummary:v4];
  BOOL v5 = +[NSSet setWithObject:v4];
  [(NLActivityUpNextRelevanceEngineDataSource *)self _queue_handleNewActivitySummaries:v5];

  id v6 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_6568;
  v8[3] = &unk_C478;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_queue_handleNewActivitySummaries:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v5 = [(NLActivityUpNextRelevanceEngineDataSource *)self historicalSummariesByIndex];
  id v6 = [v5 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((uint64_t)objc_msgSend(v12, "_activitySummaryIndex", (void)v15) >= 1)
        {
          v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 _activitySummaryIndex]);
          [v6 setObject:v12 forKeyedSubscript:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v14 = [v6 copy];
  [(NLActivityUpNextRelevanceEngineDataSource *)self setHistoricalSummariesByIndex:v14];
}

- (void)_queryActivitySummaryHistory
{
}

- (void)_queryActivitySummaryHistoryWithRemainingRetries:(unint64_t)a3
{
  _HKInitializeLogging();
  BOOL v5 = HKLogCoaching;
  if (a3)
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Supergreen] Trying to start historical activity summary query with remaining retries %lu.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_693C;
    v13 = &unk_C4A0;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a3;
    id v6 = objc_retainBlock(&v10);
    id v7 = objc_alloc((Class)HKActivitySummaryQuery);
    id v8 = [(NLActivityUpNextRelevanceEngineDataSource *)self _activitySummaryPredicateForTypicalDateInterval];
    id v9 = [v7 initWithPredicate:v8 resultsHandler:v6];

    [v9 setShouldIncludeActivitySummaryPrivateProperties:1];
    [v9 setShouldIncludeActivitySummaryStatistics:1];
    [(NLActivityUpNextRelevanceEngineDataSource *)self _executeQuery:v9];

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR))
  {
    sub_7DA0();
  }
}

- (void)_startCurrentActivitySummaryQuery
{
}

- (void)_startCurrentActivitySummaryQueryWithRemainingRetries:(unint64_t)a3
{
  _HKInitializeLogging();
  BOOL v5 = HKLogCoaching;
  if (a3)
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Supergreen] Trying to start current activity summary query with remaining retries %lu.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_6D3C;
    id v12 = &unk_C4C8;
    objc_copyWeak(v13, (id *)buf);
    v13[1] = (id)a3;
    id v6 = objc_retainBlock(&v9);
    id v7 = objc_alloc((Class)_HKCurrentActivitySummaryQuery);
    id v8 = objc_msgSend(v7, "initWithUpdateHandler:", v6, v9, v10, v11, v12);
    [(NLActivityUpNextRelevanceEngineDataSource *)self _executeQuery:v8];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR))
  {
    sub_7E48();
  }
}

- (void)_executeQuery:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6F48;
  v7[3] = &unk_C478;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_stopQueries
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_704C;
  block[3] = &unk_C428;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (NSDictionary)historicalSummariesByIndex
{
  return self->_historicalSummariesByIndex;
}

- (void)setHistoricalSummariesByIndex:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (FIActivitySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (NSSet)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (FITypicalDayActivityModel)typicalDayModel
{
  return self->_typicalDayModel;
}

- (void)setTypicalDayModel:(id)a3
{
}

- (HKActivitySummary)currentSummary
{
  return self->_currentSummary;
}

- (void)setCurrentSummary:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (double)suggestedWalkTime
{
  return self->_suggestedWalkTime;
}

- (void)setSuggestedWalkTime:(double)a3
{
  self->_suggestedWalkTime = a3;
}

- (BOOL)willCompleteGoal
{
  return self->_willCompleteGoal;
}

- (void)setWillCompleteGoal:(BOOL)a3
{
  self->_willCompleteGoal = a3;
}

- (BOOL)shouldSuggestWalk
{
  return self->_shouldSuggestWalk;
}

- (void)setShouldSuggestWalk:(BOOL)a3
{
  self->_shouldSuggestWalk = a3;
}

- (BOOL)isUpdatingTypicalDayCachedValues
{
  return self->_isUpdatingTypicalDayCachedValues;
}

- (void)setIsUpdatingTypicalDayCachedValues:(BOOL)a3
{
  self->_isUpdatingTypicalDayCachedValues = a3;
}

- (BOOL)isRebuildingTypicalDayModel
{
  return self->_isRebuildingTypicalDayModel;
}

- (void)setIsRebuildingTypicalDayModel:(BOOL)a3
{
  self->_isRebuildingTypicalDayModel = a3;
}

- (BOOL)progressUpdatesEnabled
{
  return self->_progressUpdatesEnabled;
}

- (void)setProgressUpdatesEnabled:(BOOL)a3
{
  self->_BOOL progressUpdatesEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_currentSummary, 0);
  objc_storeStrong((id *)&self->_typicalDayModel, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_historicalSummariesByIndex, 0);
}

@end