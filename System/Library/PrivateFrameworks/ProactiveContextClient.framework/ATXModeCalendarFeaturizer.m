@interface ATXModeCalendarFeaturizer
+ (BOOL)isCalendarLikelyWork:(id)a3;
- (ATXModeCalendarFeaturizer)initWithLocationManager:(id)a3;
- (ATXModeFeaturizerDelegate)delegate;
- (BOOL)_isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5;
- (BOOL)_shouldConsiderEventBasedOnParticipantStatus:(int64_t)a3;
- (BOOL)_shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:(id)a3 upcomingWorkEvent:(id)a4 now:(id)a5;
- (BOOL)_shouldStayInWorkModeInBetweenMostRecentWorkEvent:(id)a3 andUpcomingWorkEvent:(id)a4;
- (BOOL)calendarRefreshCoalesceTimerIsEnabled;
- (id)_fetchEligibleEventsForDay;
- (id)provideFeatures;
- (void)_addTimerForDate:(id)a3;
- (void)_eventsDidChange:(id)a3;
- (void)_setFeaturesForEventsCurrentlyIn:(id)a3 now:(id)a4 featureSet:(id)a5;
- (void)_updateFeatures;
- (void)beginListening;
- (void)dealloc;
- (void)setCalendarRefreshCoalesceTimerIsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXModeCalendarFeaturizer

- (ATXModeCalendarFeaturizer)initWithLocationManager:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATXModeCalendarFeaturizer;
  v5 = [(ATXModeCalendarFeaturizer *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    timers = v5->_timers;
    v5->_timers = (NSHashTable *)v6;

    objc_initWeak(&location, v5);
    id v8 = objc_alloc(MEMORY[0x1E4F93B98]);
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__ATXModeCalendarFeaturizer_initWithLocationManager___block_invoke;
    v18[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v19, &location);
    uint64_t v11 = [v8 initWithQueue:v9 operation:v18];
    featureUpdateTimer = v5->_featureUpdateTimer;
    v5->_featureUpdateTimer = (_PASSimpleCoalescingTimer *)v11;

    v5->_calendarRefreshCoalesceTimerIsEnabled = 1;
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"RemoveCalendarRefreshCoalesce", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
      {
        v5->_calendarRefreshCoalesceTimerIsEnabled = 0;
      }
    }
    v13 = objc_alloc_init(ATXMicrolocationLocalization);
    microlocationLocalization = v5->_microlocationLocalization;
    v5->_microlocationLocalization = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
    eventStore = v5->_eventStore;
    v5->_eventStore = (EKEventStore *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __53__ATXModeCalendarFeaturizer_initWithLocationManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFeatures];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXModeCalendarFeaturizer;
  [(ATXModeCalendarFeaturizer *)&v4 dealloc];
}

- (void)_eventsDidChange:(id)a3
{
  double v3 = 120.0;
  if (!self->_calendarRefreshCoalesceTimerIsEnabled) {
    double v3 = 0.0;
  }
  [(_PASSimpleCoalescingTimer *)self->_featureUpdateTimer runAfterDelaySeconds:1 coalescingBehavior:v3];
}

- (void)_updateFeatures
{
  double v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Refreshing due to event change", v6, 2u);
  }

  objc_super v4 = [(ATXModeCalendarFeaturizer *)self provideFeatures];
  v5 = [(ATXModeCalendarFeaturizer *)self delegate];
  [v5 featurizer:self didUpdateFeatures:v4];
}

+ (BOOL)isCalendarLikelyWork:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 title];
  char v5 = [v4 localizedCaseInsensitiveContainsString:@"work"];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    v7 = [v3 source];
    id v8 = v7;
    if (v7 && [v7 supportsLocationDirectorySearches]) {
      char v6 = [v3 isAffectingAvailability];
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

- (void)_setFeaturesForEventsCurrentlyIn:(id)a3 now:(id)a4 featureSet:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__7;
  v56 = __Block_byref_object_dispose__7;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__7;
  v50 = __Block_byref_object_dispose__7;
  id v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  id v35 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__ATXModeCalendarFeaturizer__setFeaturesForEventsCurrentlyIn_now_featureSet___block_invoke;
  v21[3] = &unk_1E6BE6FD8;
  v21[4] = self;
  v25 = &v52;
  v26 = &v46;
  v27 = &v42;
  id v12 = v10;
  id v22 = v12;
  id v13 = v11;
  id v23 = v13;
  v28 = &v36;
  id v14 = v9;
  id v24 = v14;
  v29 = &v30;
  [v14 enumerateObjectsUsingBlock:v21];
  objc_msgSend(v13, "setValue:forBinaryFeatureOfType:", -[ATXModeCalendarFeaturizer _shouldStayInWorkModeInBetweenMostRecentWorkEvent:andUpcomingWorkEvent:](self, "_shouldStayInWorkModeInBetweenMostRecentWorkEvent:andUpcomingWorkEvent:", v37[5], v31[5]), 27);
  if ([(ATXModeCalendarFeaturizer *)self _shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:v37[5] upcomingWorkEvent:v31[5] now:v12])
  {
    uint64_t v15 = __atxlog_handle_modes();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = [(id)v37[5] startDate];
      id v19 = [(id)v31[5] startDate];
      *(_DWORD *)buf = 138413058;
      id v59 = v16;
      __int16 v60 = 2112;
      id v61 = v17;
      __int16 v62 = 2112;
      v63 = v18;
      __int16 v64 = 2112;
      v65 = v19;
      _os_log_impl(&dword_1DAFF9000, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@] Last work event just ended at %@, and the next one doesn't start until %@, initiating microlocation localization", buf, 0x2Au);
    }
    [(ATXMicrolocationLocalization *)self->_microlocationLocalization initiateLocalization];
  }
  if (v53[5]
    && v47[5]
    && -[ATXModeCalendarFeaturizer _isDate:betweenStartDate:andEndDate:](self, "_isDate:betweenStartDate:andEndDate:", v12))
  {
    [v13 setValue:1 forBinaryFeatureOfType:13];
    BOOL v20 = *((unsigned char *)v43 + 24) != 0;
  }
  else
  {
    [v13 setValue:0 forBinaryFeatureOfType:13];
    BOOL v20 = 0;
  }
  [v13 setValue:v20 forBinaryFeatureOfType:14];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

void __77__ATXModeCalendarFeaturizer__setFeaturesForEventsCurrentlyIn_now_featureSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldConsiderEventBasedOnParticipantStatus:", objc_msgSend(v5, "participationStatus")))
  {
    char v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v7 = [v5 startDate];
    id v8 = [v6 earlierDate:v7];
    id v9 = v8;
    if (!v8)
    {
      id v9 = [v5 startDate];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
    if (!v8) {

    }
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v11 = [v5 endDate];
    id v12 = [v10 laterDate:v11];
    id v13 = v12;
    if (!v12)
    {
      id v13 = [v5 endDate];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v13);
    if (!v12) {

    }
    id v14 = [v5 calendar];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= [(id)objc_opt_class() isCalendarLikelyWork:v14];
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [v5 startDate];
    v18 = [v5 endDate];
    if ([v15 _isDate:v16 betweenStartDate:v17 andEndDate:v18])
    {
      int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);

      if (v19)
      {
        BOOL v20 = (id *)(a1 + 48);
        uint64_t v21 = 1;
        goto LABEL_19;
      }
    }
    else
    {
    }
    BOOL v20 = (id *)(a1 + 48);
    id v23 = [*(id *)(a1 + 48) valueForFeatureType:26];

    if (v23)
    {
LABEL_20:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
        || *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
      {
        goto LABEL_27;
      }
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      double v25 = v24;
      v26 = [v5 endDate];
      [v26 timeIntervalSinceReferenceDate];
      if (v25 > v27 + -120.0)
      {
        unint64_t v28 = a3 + 1;
        unint64_t v29 = [*(id *)(a1 + 56) count];

        if (v28 >= v29) {
          goto LABEL_27;
        }
        uint64_t v30 = [*(id *)(a1 + 56) objectAtIndex:v28];
        uint64_t v31 = *(void *)(*(void *)(a1 + 96) + 8);
        uint64_t v32 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = v30;

        [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
        double v34 = v33;
        id v35 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) startDate];
        [v35 timeIntervalSinceReferenceDate];
        double v37 = v36;

        if (v34 >= v37) {
          goto LABEL_27;
        }
        uint64_t v38 = *(void *)(*(void *)(a1 + 88) + 8);
        id v39 = v5;
        v26 = *(void **)(v38 + 40);
        *(void *)(v38 + 40) = v39;
      }

LABEL_27:
      goto LABEL_28;
    }
    uint64_t v21 = 0;
LABEL_19:
    [*v20 setValue:v21 forBinaryFeatureOfType:26];
    goto LABEL_20;
  }
  id v22 = __atxlog_handle_modes();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 134217984;
    uint64_t v41 = [v5 participationStatus];
    _os_log_impl(&dword_1DAFF9000, v22, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: skipping event due to participation status: %lu", (uint8_t *)&v40, 0xCu);
  }

LABEL_28:
}

- (BOOL)_shouldStayInWorkModeInBetweenMostRecentWorkEvent:(id)a3 andUpcomingWorkEvent:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v6 = a3;
    v7 = [a4 startDate];
    [v7 timeIntervalSince1970];
    double v9 = v8;
    id v10 = [v6 endDate];

    [v10 timeIntervalSince1970];
    double v12 = v9 - v11;

    return v12 <= 4500.0 && v12 > 0.0;
  }
  return result;
}

- (BOOL)_shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:(id)a3 upcomingWorkEvent:(id)a4 now:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = 0;
  if (a3 && v8)
  {
    id v11 = a3;
    double v12 = [v11 endDate];
    id v13 = (void *)MEMORY[0x1E4F1C9C8];
    id v14 = [v11 endDate];

    [v14 timeIntervalSinceReferenceDate];
    uint64_t v16 = [v13 dateWithTimeIntervalSinceReferenceDate:v15 + 120.0];
    if ([(ATXModeCalendarFeaturizer *)self _isDate:v9 betweenStartDate:v12 andEndDate:v16])
    {
      id v17 = [v8 startDate];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = v18;
      [v9 timeIntervalSinceReferenceDate];
      BOOL v10 = v19 - v20 > 1800.0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v8 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v10 >= v12)
  {
    [v7 timeIntervalSinceReferenceDate];
    BOOL v13 = v10 < v14;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldConsiderEventBasedOnParticipantStatus:(int64_t)a3
{
  if ((unint64_t)a3 >= 8)
  {
    id v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXModeCalendarFeaturizer _shouldConsiderEventBasedOnParticipantStatus:](a3, v5);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0xC4u >> a3) & 1;
  }
  return v4;
}

- (id)_fetchEligibleEventsForDay
{
  id v3 = objc_opt_new();
  BOOL v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 startOfDayForDate:v3];
  id v6 = [v4 dateByAddingUnit:16 value:1 toDate:v5 options:0];
  id v7 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v5 endDate:v6 calendars:0];
  id v8 = [(EKEventStore *)self->_eventStore eventsMatchingPredicate:v7];
  double v9 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_8);

  return v9;
}

uint64_t __55__ATXModeCalendarFeaturizer__fetchEligibleEventsForDay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 3
    || ([v2 isAllDay] & 1) != 0
    || ![v2 hasAttendees])
  {
    goto LABEL_6;
  }
  id v3 = [v2 attendees];
  if ([v3 count] != 1)
  {

    goto LABEL_9;
  }
  BOOL v4 = [v2 attendees];
  id v5 = [v4 firstObject];
  char v6 = [v5 isCurrentUser];

  if ((v6 & 1) == 0)
  {
LABEL_9:
    double v9 = [v2 customObjectForKey:@"SGEventMetadataKey"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v7 = isKindOfClass ^ 1;
    goto LABEL_7;
  }
LABEL_6:
  char v7 = 0;
LABEL_7:

  return v7 & 1;
}

- (void)_addTimerForDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 earlierDate:v5];

  if (v6 != v4)
  {
    char v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Scheduling calendar refresh timer for: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v8 = (void *)MEMORY[0x1E4F4B678];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__ATXModeCalendarFeaturizer__addTimerForDate___block_invoke;
    v11[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v12, (id *)buf);
    double v9 = [v8 fireAtDate:v4 block:v11];
    double v10 = self->_timers;
    objc_sync_enter(v10);
    [(NSHashTable *)self->_timers addObject:v9];
    objc_sync_exit(v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __46__ATXModeCalendarFeaturizer__addTimerForDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = __atxlog_handle_modes();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1DAFF9000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Refreshing due to event start / end date passing", v5, 2u);
    }

    id v3 = [WeakRetained provideFeatures];
    id v4 = [WeakRetained delegate];
    [v4 featurizer:WeakRetained didUpdateFeatures:v3];
  }
}

- (void)beginListening
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__eventsDidChange_ name:*MEMORY[0x1E4F25460] object:0];
}

- (id)provideFeatures
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = self->_timers;
  objc_sync_enter(v3);
  [(NSHashTable *)self->_timers removeAllObjects];
  objc_sync_exit(v3);

  id v4 = objc_opt_new();
  id v5 = [(ATXModeCalendarFeaturizer *)self _fetchEligibleEventsForDay];
  id v6 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v6, "setValue:forBinaryFeatureOfType:", [v5 count] != 0, 12);
  [(ATXModeCalendarFeaturizer *)self _setFeaturesForEventsCurrentlyIn:v5 now:v4 featureSet:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "startDate", (void)v15);
        if (v12) {
          [(ATXModeCalendarFeaturizer *)self _addTimerForDate:v12];
        }
        BOOL v13 = [v11 endDate];
        if (v13) {
          [(ATXModeCalendarFeaturizer *)self _addTimerForDate:v13];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v6;
}

- (ATXModeFeaturizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeFeaturizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)calendarRefreshCoalesceTimerIsEnabled
{
  return self->_calendarRefreshCoalesceTimerIsEnabled;
}

- (void)setCalendarRefreshCoalesceTimerIsEnabled:(BOOL)a3
{
  self->_calendarRefreshCoalesceTimerIsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_microlocationLocalization, 0);
  objc_storeStrong((id *)&self->_featureUpdateTimer, 0);

  objc_storeStrong((id *)&self->_timers, 0);
}

- (void)_shouldConsiderEventBasedOnParticipantStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "ATXModeCalendarClassifier: unknown participation status: %lu", (uint8_t *)&v2, 0xCu);
}

@end