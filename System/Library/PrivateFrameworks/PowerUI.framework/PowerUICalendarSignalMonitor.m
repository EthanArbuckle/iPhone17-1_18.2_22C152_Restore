@interface PowerUICalendarSignalMonitor
+ (id)monitorWithDelegate:(id)a3;
+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5;
- (BOOL)isEventEligible:(id)a3 AtTime:(id)a4;
- (EKEventStore)calendar;
- (OS_os_log)log;
- (PowerUICalendarSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5;
- (PowerUISignalMonitorDelegate)delegate;
- (id)detectedSignals;
- (id)nextFlightEventWithEventIDs:(id)a3;
- (id)nextRelevantDeadlineWithEventIDs:(id)a3;
- (id)requiredFullChargeDate;
- (id)upcomingEventIDs;
- (unint64_t)signalID;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)sourceInformationChangedNotification:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PowerUICalendarSignalMonitor

- (PowerUICalendarSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PowerUICalendarSignalMonitor;
  v10 = [(PowerUICalendarSignalMonitor *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x263F04B98]) initWithEKOptions:128];
    calendar = v10->_calendar;
    v10->_calendar = (EKEventStore *)v11;

    objc_storeStrong((id *)&v10->_delegate, a3);
    os_log_t v13 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke;
    v23[3] = &unk_2645A6878;
    id v15 = v9;
    id v24 = v15;
    v16 = v10;
    v25 = v16;
    v17 = (void (**)(void))MEMORY[0x223C80C20](v23);
    v17[2]();
    [v15 addUpdateHandler:v17];
    int out_token = 0;
    v18 = dispatch_get_global_queue(-2, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke_71;
    v20[3] = &unk_2645A5CA8;
    v21 = v16;
    notify_register_dispatch("com.apple.powerui.calendar.test", &out_token, v18, v20);
  }
  return v10;
}

void __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) doubleFactorForName:@"calendarSignalBuffer"];
  if (v2 > 1.0) {
    kBufferBeforeFirstCalendarEvent = *(void *)&v2;
  }
  v3 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = kBufferBeforeFirstCalendarEvent;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "Event Buffer: %lf", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) doubleFactorForName:@"calendarSignalBufferShort"];
  if (v4 > 1.0) {
    kBufferBeforeFirstCalendarEventShort = *(void *)&v4;
  }
  v5 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = kBufferBeforeFirstCalendarEventShort;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Short Event Buffer: %lf", (uint8_t *)&v6, 0xCu);
  }
}

id __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke_71(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Got notification", v4, 2u);
  }

  return (id)[*(id *)(a1 + 32) requiredFullChargeDate];
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3 = a3;
  double v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3 trialManager:0 withContext:0];

  return v4;
}

+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v9 trialManager:v8 withContext:v7];

  return v10;
}

- (unint64_t)signalID
{
  return 3;
}

- (void)startMonitoring
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_sourceInformationChangedNotification_ name:*MEMORY[0x263F04AD8] object:0];
}

- (void)sourceInformationChangedNotification:(id)a3
{
  id v4 = [(PowerUICalendarSignalMonitor *)self requiredFullChargeDate];
  [(PowerUISignalMonitorDelegate *)self->_delegate monitor:self maySuggestNewFullChargeDeadline:v4];
}

- (void)stopMonitoring
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F04AD8] object:0];
}

- (id)upcomingEventIDs
{
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:-86400.0];
  v5 = [v3 dateByAddingTimeInterval:86400.0];
  int v6 = [(EKEventStore *)self->_calendar predicateForEventsWithStartDate:v4 endDate:v5 calendars:0 loadDefaultProperties:1];
  id v7 = [(PowerUICalendarSignalMonitor *)self calendar];
  id v8 = [v7 eventObjectIDsMatchingPredicate:v6];

  return v8;
}

- (id)nextFlightEventWithEventIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF910] distantFuture];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    os_log_t log = 0;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138412546;
    long long v25 = v8;
    id v28 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(void *)(*((void *)&v31 + 1) + 8 * i), v25);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if (([v13 isAllDay] & 1) == 0)
          {
            v14 = [v13 suggestionInfo];

            if (v14)
            {
              id v15 = [MEMORY[0x263F38258] eventMetadataFromEKEvent:v13];
              v16 = [v15 categoryDescription];
              int v17 = [v16 localizedCaseInsensitiveContainsString:@"flight"];

              if (v17
                && ([v13 startDate],
                    v18 = objc_claimAutoreleasedReturnValue(),
                    [v18 timeIntervalSinceDate:v5],
                    double v20 = v19,
                    v18,
                    v20 < 0.0))
              {
                os_log_t v21 = (os_log_t)v13;

                uint64_t v22 = [v21 startDate];

                v23 = self->_log;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  loga = v23;
                  v27 = [v21 startDate];
                  objc_super v26 = [v21 endDate];
                  *(_DWORD *)buf = v25;
                  v36 = v27;
                  __int16 v37 = 2112;
                  v38 = v26;
                  _os_log_impl(&dword_22135E000, loga, OS_LOG_TYPE_DEFAULT, "Found flight from %@-%@", buf, 0x16u);
                }
              }
              else
              {
                uint64_t v22 = (uint64_t)v5;
                os_log_t v21 = log;
              }

              v5 = (void *)v22;
              os_log_t log = v21;
              id v6 = v28;
            }
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }
  else
  {
    os_log_t log = 0;
  }

  return log;
}

- (BOOL)isEventEligible:(id)a3 AtTime:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isAllDay])
  {
    BOOL v7 = 1;
  }
  else
  {
    long long v8 = [v5 endDate];
    uint64_t v9 = [v5 startDate];
    [v8 timeIntervalSinceDate:v9];
    if (v10 > 2073600.0 || [v5 status] == 3)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v11 = [v5 endDate];
      [v11 timeIntervalSinceDate:v6];
      BOOL v7 = v12 < 0.0;
    }
  }

  return !v7;
}

- (id)nextRelevantDeadlineWithEventIDs:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50 = [MEMORY[0x263EFF910] distantFuture];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = +[PowerUISmartChargeManager manager];
  v46 = [v6 lastAcquiredLocation];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
  v47 = v7;
  if (v8)
  {
    uint64_t v10 = v8;
    v49 = 0;
    uint64_t v11 = *(void *)v52;
    *(void *)&long long v9 = 138412546;
    long long v44 = v9;
    uint64_t v48 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(void *)(*((void *)&v51 + 1) + 8 * i), v44);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          if ([(PowerUICalendarSignalMonitor *)self isEventEligible:v14 AtTime:v5])
          {
            id v15 = [v14 startDate];
            [v15 timeIntervalSinceDate:v5];
            double v17 = v16;

            if (v17 >= 0.0)
            {
              uint64_t v19 = kBufferBeforeFirstCalendarEvent;
              if (*(double *)&kBufferBeforeFirstCalendarEvent > *(double *)&kBufferBeforeFirstCalendarEventShort)
              {
                os_log_t log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                {
                  long long v33 = log;
                  long long v34 = [v14 title];
                  v45 = [v14 preferredLocation];
                  v35 = [v45 geoLocation];
                  *(_DWORD *)buf = v44;
                  v56 = v34;
                  __int16 v57 = 2112;
                  double v58 = *(double *)&v35;
                  _os_log_debug_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);
                }
                if (v46)
                {
                  os_log_t v21 = [v14 preferredLocation];
                  uint64_t v22 = [v21 geoLocation];

                  if (v22)
                  {
                    v23 = [v14 preferredLocation];
                    id v24 = [v23 geoLocation];
                    [v46 distanceFromLocation:v24];
                    double v26 = v25;

                    v27 = self->_log;
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      v36 = v27;
                      __int16 v37 = [v14 title];
                      *(_DWORD *)buf = v44;
                      v56 = v37;
                      __int16 v57 = 2048;
                      double v58 = v26;
                      _os_log_debug_impl(&dword_22135E000, v36, OS_LOG_TYPE_DEBUG, "%@ is %fm away", buf, 0x16u);
                    }
                    if (v26 < 2000.0) {
                      uint64_t v19 = kBufferBeforeFirstCalendarEventShort;
                    }
                  }
                }
              }
              v18 = [v14 startDate];
            }
            else
            {
              v18 = [v14 endDate];
              uint64_t v19 = kBufferBeforeFirstCalendarEvent;
            }
            id v28 = [v18 dateByAddingTimeInterval:-*(double *)&v19];

            [v28 timeIntervalSinceDate:v50];
            if (v29 < 0.0)
            {
              id v30 = v14;

              long long v31 = v5;
              id v32 = v28;

              v49 = v30;
              v50 = v32;
              id v5 = v31;
              id v7 = v47;
            }
            uint64_t v11 = v48;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v10);
  }
  else
  {
    v49 = 0;
  }

  v38 = self->_log;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    uint64_t v40 = [v49 startDate];
    v41 = [v49 endDate];
    *(_DWORD *)buf = 138412802;
    v56 = v40;
    __int16 v57 = 2112;
    double v58 = *(double *)&v41;
    __int16 v59 = 2112;
    v60 = v50;
    _os_log_impl(&dword_22135E000, v39, OS_LOG_TYPE_DEFAULT, "Found upcoming event: %@-%@, requiring full charge by %@", buf, 0x20u);
  }
  id v42 = v50;

  return v42;
}

- (id)requiredFullChargeDate
{
  id v3 = [(PowerUICalendarSignalMonitor *)self upcomingEventIDs];
  id v4 = [(PowerUICalendarSignalMonitor *)self nextFlightEventWithEventIDs:v3];
  if (v4)
  {
    os_log_t log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Upcoming or recent flight; forcing immediate charge",
        v9,
        2u);
    }
    uint64_t v6 = [MEMORY[0x263EFF910] distantPast];
  }
  else
  {
    uint64_t v6 = [(PowerUICalendarSignalMonitor *)self nextRelevantDeadlineWithEventIDs:v3];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)detectedSignals
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(PowerUICalendarSignalMonitor *)self upcomingEventIDs];
  id v15 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(EKEventStore *)self->_calendar publicObjectWithObjectID:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([(PowerUICalendarSignalMonitor *)self isEventEligible:v11 AtTime:v3])
          {
            double v12 = [v11 startDate];
            [v15 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v15];

  return v13;
}

- (EKEventStore)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end