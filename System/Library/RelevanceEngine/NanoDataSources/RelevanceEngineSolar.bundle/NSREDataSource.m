@interface NSREDataSource
+ (BOOL)wantsLocationInUseAsserton;
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
- (NSREDataSource)init;
- (NSREDataSourceModel)model;
- (REUpNextScheduler)invalidationScheduler;
- (REUpNextTimer)sunriseTimer;
- (REUpNextTimer)sunsetTimer;
- (id)_elementForEvent:(id)a3;
- (id)_scheduledUpdateElementTimerFor:(id)a3;
- (id)supportedSections;
- (void)_localeChanged:(id)a3;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)modelUpdated:(id)a3;
- (void)pause;
- (void)resume;
- (void)setInvalidationScheduler:(id)a3;
- (void)setModel:(id)a3;
- (void)setSunriseTimer:(id)a3;
- (void)setSunsetTimer:(id)a3;
@end

@implementation NSREDataSource

- (NSREDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)NSREDataSource;
  v2 = [(REElementDataSource *)&v13 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2293829C4;
    v11[3] = &unk_264863F80;
    v4 = v2;
    v12 = v4;
    v5 = (void *)MEMORY[0x22A6B7210](v11);
    uint64_t v6 = [MEMORY[0x263F62DA0] schedulerWithQueue:v3 delay:v5 updateBlock:1.0];
    invalidationScheduler = v4->_invalidationScheduler;
    v4->_invalidationScheduler = (REUpNextScheduler *)v6;

    v8 = [[NSREDataSourceModel alloc] initWithDelegate:v4];
    model = v4->_model;
    v4->_model = v8;
  }
  return v2;
}

+ (id)applicationBundleIdentifier
{
  return @"com.apple.NanoWorldClock";
}

+ (id)bundleIdentifier
{
  return @"com.apple.NanoWorldClock.solar";
}

+ (BOOL)wantsLocationInUseAsserton
{
  return 1;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void))a4;
  uint64_t v6 = [(NSREDataSource *)self sunriseTimer];
  [v6 invalidate];

  [(NSREDataSource *)self setSunriseTimer:0];
  v7 = [(NSREDataSource *)self sunsetTimer];
  [v7 invalidate];

  [(NSREDataSource *)self setSunsetTimer:0];
  v8 = [(NSREDataSource *)self model];
  v9 = [v8 events];

  if (![v9 count])
  {
    v5[2](v5, 0);
    goto LABEL_20;
  }
  v33 = v5;
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v32 = v9;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      objc_msgSend(v16, "coordinate", v32);
      double v18 = v17;
      double v20 = v19;
      uint64_t v21 = [v16 type];
      v22 = [v16 date];
      if (v21 == 1)
      {
        v27 = NSRELogger();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = NSRELocationKey(v18, v20);
          uint64_t v29 = NSRELocationKeyHash(v18, v20);
          *(_DWORD *)buf = 138543874;
          v39 = v22;
          __int16 v40 = 2112;
          v41 = v28;
          __int16 v42 = 2048;
          uint64_t v43 = v29;
          _os_log_impl(&dword_229381000, v27, OS_LOG_TYPE_DEFAULT, "Adding sunset element at %{public}@ for %@[%lu].", buf, 0x20u);
        }
        v26 = [(NSREDataSource *)self _scheduledUpdateElementTimerFor:v16];
        [(NSREDataSource *)self setSunsetTimer:v26];
      }
      else
      {
        if (v21) {
          goto LABEL_16;
        }
        v23 = NSRELogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = NSRELocationKey(v18, v20);
          uint64_t v25 = NSRELocationKeyHash(v18, v20);
          *(_DWORD *)buf = 138543874;
          v39 = v22;
          __int16 v40 = 2112;
          v41 = v24;
          __int16 v42 = 2048;
          uint64_t v43 = v25;
          _os_log_impl(&dword_229381000, v23, OS_LOG_TYPE_DEFAULT, "Adding sunrise element at %{public}@ for %@[%lu].", buf, 0x20u);
        }
        v26 = [(NSREDataSource *)self _scheduledUpdateElementTimerFor:v16];
        [(NSREDataSource *)self setSunriseTimer:v26];
      }

LABEL_16:
      v30 = [(NSREDataSource *)self _elementForEvent:v16];
      [v10 addObject:v30];
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  }
  while (v13);
LABEL_18:

  v31 = (void *)[v10 copy];
  v5 = v33;
  ((void (**)(id, void *))v33)[2](v33, v31);

  v9 = v32;
LABEL_20:
}

- (void)pause
{
  v3 = NSRELogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_229381000, v3, OS_LOG_TYPE_INFO, "Pausing data source.", v6, 2u);
  }

  v4 = [(NSREDataSource *)self model];
  [v4 pause];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];
}

- (void)resume
{
  v3 = NSRELogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_229381000, v3, OS_LOG_TYPE_INFO, "Resuming data source.", v6, 2u);
  }

  v4 = [(NSREDataSource *)self model];
  [v4 resume];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];
}

- (id)supportedSections
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F62DC0];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)_elementForEvent:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = NSRESolarEventTypeSuffix([v3 type]);
  v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.NanoWorldClock.solar", v4];

  uint64_t v6 = +[NSREContentFormatter solarContentForEvent:v3];
  v7 = [NSURL URLWithString:@"nwc://curLoc"];
  v8 = (void *)[objc_alloc(MEMORY[0x263F62D68]) initWithURL:v7 applicationID:@"com.apple.NanoWorldClock"];

  v9 = [v3 date];

  v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 duration:60.0];
  id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v12 = [v11 dateByAddingUnit:16 value:-1 toDate:v9 options:0];
  id v13 = objc_alloc(MEMORY[0x263F62D50]);
  uint64_t v14 = [v10 endDate];
  v15 = (void *)[v13 initWithEventInterval:v10 becomesIrrelevantDate:v14 firstBecomesRelevantDate:v12 recentDuration:0.0];

  v19[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F62D60]) initWithIdentifier:v5 content:v6 action:v8 relevanceProviders:v16 privacyBehavior:0];

  return v17;
}

- (id)_scheduledUpdateElementTimerFor:(id)a3
{
  id v4 = a3;
  v5 = [v4 date];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_229383354;
  v13[3] = &unk_264863FA8;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v14 = v6;
  v7 = (void *)MEMORY[0x22A6B7210](v13);
  v8 = (void *)MEMORY[0x263F62DA8];
  uint64_t v9 = MEMORY[0x263EF83A0];
  id v10 = MEMORY[0x263EF83A0];
  id v11 = [v8 timerWithFireDate:v5 queue:v9 block:v7];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_localeChanged:(id)a3
{
  id v4 = NSRELogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_229381000, v4, OS_LOG_TYPE_INFO, "Locale has changed; invalidate elements.", v6, 2u);
  }

  v5 = [(NSREDataSource *)self invalidationScheduler];
  [v5 schedule];
}

- (void)modelUpdated:(id)a3
{
  id v3 = [(NSREDataSource *)self invalidationScheduler];
  [v3 schedule];
}

- (NSREDataSourceModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (REUpNextTimer)sunriseTimer
{
  return self->_sunriseTimer;
}

- (void)setSunriseTimer:(id)a3
{
}

- (REUpNextTimer)sunsetTimer
{
  return self->_sunsetTimer;
}

- (void)setSunsetTimer:(id)a3
{
}

- (REUpNextScheduler)invalidationScheduler
{
  return self->_invalidationScheduler;
}

- (void)setInvalidationScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationScheduler, 0);
  objc_storeStrong((id *)&self->_sunsetTimer, 0);
  objc_storeStrong((id *)&self->_sunriseTimer, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end