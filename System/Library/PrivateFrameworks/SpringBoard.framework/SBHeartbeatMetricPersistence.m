@interface SBHeartbeatMetricPersistence
+ (NSURL)defaultPersistenceURL;
- (BOOL)_queue_writeToPersistenceURL;
- (NSDictionary)metricsByDatestamp;
- (NSURL)persistenceURL;
- (SBHeartbeatMetricPersistence)init;
- (SBHeartbeatMetricPersistence)initWithPersistenceURL:(id)a3 persistenceDelay:(double)a4 persistenceLeeway:(double)a5;
- (double)persistenceDelay;
- (double)persistenceLeeway;
- (void)_queue_initializeIfNeeded;
- (void)_queue_scheduleWriteIfNeeded;
- (void)migrateDataFromDefaultsIfNeeded:(id)a3;
- (void)trackInteractionWithFeatureNamed:(id)a3;
- (void)trackInteractionWithFeatureNamed:(id)a3 duration:(double)a4;
@end

@implementation SBHeartbeatMetricPersistence

+ (NSURL)defaultPersistenceURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = SBHomeDirectory();
  v4 = [v3 stringByAppendingPathComponent:@"HeartbeatMetrics"];
  v5 = [v4 stringByAppendingPathExtension:@"plist"];
  v6 = [v2 fileURLWithPath:v5 isDirectory:0];

  return (NSURL *)v6;
}

- (SBHeartbeatMetricPersistence)initWithPersistenceURL:(id)a3 persistenceDelay:(double)a4 persistenceLeeway:(double)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHeartbeatMetricPersistence;
  v9 = [(SBHeartbeatMetricPersistence *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    persistenceURL = v9->_persistenceURL;
    v9->_persistenceURL = (NSURL *)v10;

    v9->_persistenceDelay = a4;
    v9->_persistenceLeeway = a5;
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SpringBoard.Analytics.SBHeartbeatMetricPersistence", v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;
  }
  return v9;
}

- (SBHeartbeatMetricPersistence)init
{
  v3 = [(id)objc_opt_class() defaultPersistenceURL];
  v4 = [(SBHeartbeatMetricPersistence *)self initWithPersistenceURL:v3 persistenceDelay:10.0 persistenceLeeway:5.0];

  return v4;
}

- (NSDictionary)metricsByDatestamp
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  uint64_t v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBHeartbeatMetricPersistence_metricsByDatestamp__block_invoke;
  v5[3] = &unk_1E6AF52B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __50__SBHeartbeatMetricPersistence_metricsByDatestamp__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNeeded");
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)trackInteractionWithFeatureNamed:(id)a3
{
}

- (void)trackInteractionWithFeatureNamed:(id)a3 duration:(double)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke;
  block[3] = &unk_1E6AF6FC0;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNeeded");
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v2 startOfDayForDate:v3];

  v5 = [*(id *)(*(void *)(a1 + 32) + 24) stringFromDate:v4];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v5];
  v7 = (void *)[v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v10 = v9;

  double v11 = [v10 objectForKey:@"Counts"];
  v12 = (void *)[v11 mutableCopy];
  dispatch_queue_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v15 = v14;

  objc_super v16 = [v15 objectForKey:*(void *)(a1 + 40)];
  uint64_t v17 = [v16 integerValue];

  v18 = [NSNumber numberWithInteger:v17 + 1];
  [v15 setObject:v18 forKey:*(void *)(a1 + 40)];

  [v10 setObject:v15 forKey:@"Counts"];
  if (BSFloatGreaterThanFloat())
  {
    v19 = [v10 objectForKey:@"Durations"];
    v20 = (void *)[v19 mutableCopy];
    v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v23 = v22;

    v24 = [v23 objectForKey:*(void *)(a1 + 40)];
    [v24 doubleValue];
    double v26 = v25;

    v27 = [NSNumber numberWithDouble:v26 + *(double *)(a1 + 48)];
    [v23 setObject:v27 forKey:*(void *)(a1 + 40)];

    [v10 setObject:v23 forKey:@"Durations"];
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v10 forKey:v5];
  v28 = [*(id *)(*(void *)(a1 + 32) + 16) dateByAddingUnit:16 value:-30 toDate:v4 options:0];
  v29 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke_2;
  v36 = &unk_1E6AF9700;
  uint64_t v37 = *(void *)(a1 + 32);
  id v38 = v28;
  id v30 = v28;
  v31 = [v29 indexesOfObjectsPassingTest:&v33];
  v32 = objc_msgSend(v29, "objectsAtIndexes:", v31, v33, v34, v35, v36, v37);

  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKeys:v32];
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleWriteIfNeeded");
}

BOOL __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) dateFromString:a2];
  BOOL v4 = [v3 compare:*(void *)(a1 + 40)] == -1;

  return v4;
}

- (void)migrateDataFromDefaultsIfNeeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBHeartbeatMetricPersistence_migrateDataFromDefaultsIfNeeded___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__SBHeartbeatMetricPersistence_migrateDataFromDefaultsIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) engagementPlistRepresentation];
  if (v2)
  {
    objc_msgSend(*(id *)(v1 + 40), "_queue_initializeIfNeeded");
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v26 = v2;
    id obj = v2;
    uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v29)
    {
      uint64_t v27 = *(void *)v39;
      uint64_t v28 = v1;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v4 = *(void *)(*((void *)&v38 + 1) + 8 * v3);
          v5 = objc_msgSend(*(id *)(*(void *)(v1 + 40) + 32), "objectForKey:", v4, v26);
          id v6 = (void *)[v5 mutableCopy];
          v7 = v6;
          if (v6) {
            id v8 = v6;
          }
          else {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v9 = v8;

          id v10 = [v9 objectForKey:@"Counts"];
          double v11 = (void *)[v10 mutableCopy];
          v12 = v11;
          uint64_t v33 = v3;
          v31 = v9;
          if (v11) {
            id v13 = v11;
          }
          else {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v14 = v13;

          uint64_t v32 = v4;
          v15 = [obj objectForKey:v4];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                v21 = [v14 objectForKey:v20];
                uint64_t v22 = [v21 integerValue];
                v23 = [v15 objectForKey:v20];
                uint64_t v24 = [v23 integerValue] + v22;

                double v25 = [NSNumber numberWithInteger:v24];
                [v14 setObject:v25 forKey:v20];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v17);
          }
          [v31 setObject:v14 forKey:@"Counts"];
          uint64_t v1 = v28;
          [*(id *)(*(void *)(v28 + 40) + 32) setObject:v31 forKey:v32];

          uint64_t v3 = v33 + 1;
        }
        while (v33 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v29);
    }

    objc_msgSend(*(id *)(v1 + 40), "_queue_writeToPersistenceURL");
    [*(id *)(v1 + 32) setEngagementPlistRepresentation:0];
    uint64_t v2 = v26;
  }
}

- (void)_queue_initializeIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_calendar)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [(NSCalendar *)v3 setTimeZone:v4];

    queue_calendar = self->_queue_calendar;
    self->_queue_calendar = v3;
  }
  if (!self->_queue_dateFormatter)
  {
    id v6 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    queue_dateFormatter = self->_queue_dateFormatter;
    self->_queue_dateFormatter = v6;
  }
  if (!self->_queue_metricsByDatestamp)
  {
    id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_persistenceURL];
    id v13 = v8;
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:1 format:0 error:0];
      queue_metricsByDatestamp = self->_queue_metricsByDatestamp;
      self->_queue_metricsByDatestamp = v9;

      id v8 = v13;
    }
    if (!self->_queue_metricsByDatestamp)
    {
      double v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v12 = self->_queue_metricsByDatestamp;
      self->_queue_metricsByDatestamp = v11;

      id v8 = v13;
    }
  }
}

- (void)_queue_scheduleWriteIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_persistenceTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_persistenceDelay * 1000000000.0));
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_persistenceLeeway * 1000000000.0));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__SBHeartbeatMetricPersistence__queue_scheduleWriteIfNeeded__block_invoke;
    v6[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v7, &location);
    dispatch_source_set_event_handler(v3, v6);
    dispatch_resume(v3);
    queue_persistenceTimer = self->_queue_persistenceTimer;
    self->_queue_persistenceTimer = (OS_dispatch_source *)v3;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __60__SBHeartbeatMetricPersistence__queue_scheduleWriteIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_writeToPersistenceURL");
}

- (BOOL)_queue_writeToPersistenceURL
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_persistenceTimer = self->_queue_persistenceTimer;
  if (queue_persistenceTimer)
  {
    dispatch_source_cancel(queue_persistenceTimer);
    dispatch_time_t v4 = self->_queue_persistenceTimer;
    self->_queue_persistenceTimer = 0;
  }
  v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_queue_metricsByDatestamp format:100 options:0 error:0];
  char v6 = [v5 writeToURL:self->_persistenceURL atomically:1];

  return v6;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (double)persistenceDelay
{
  return self->_persistenceDelay;
}

- (double)persistenceLeeway
{
  return self->_persistenceLeeway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_queue_persistenceTimer, 0);
  objc_storeStrong((id *)&self->_queue_metricsByDatestamp, 0);
  objc_storeStrong((id *)&self->_queue_dateFormatter, 0);
  objc_storeStrong((id *)&self->_queue_calendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end