@interface REAppUsagePredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (RETimeline)timeline;
- (id)_nextTimelineTransitionDateAfter:(id)a3;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (void)_scheduleTimelineProgressionTimerAfter:(id)a3;
- (void)update;
@end

@implementation REAppUsagePredictor

+ (id)supportedFeatures
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature appUsageFeature];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [(REFeatureSet *)v2 initWithFeatures:v4];

  return v5;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (void)update
{
  [(REPredictor *)self beginFetchingData];
  v3 = +[RESingleton sharedInstance];
  v4 = [v3 queryForTopNApplications:20 withLikelihoodGreaterThan:300 withTemporalResolution:0.0];

  objc_initWeak(&location, self);
  v5 = +[RESingleton sharedInstance];
  v6 = [(REPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __29__REAppUsagePredictor_update__block_invoke;
  v7[3] = &unk_2644BCE88;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v5 executeQuery:v4 responseQueue:v6 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __29__REAppUsagePredictor_update__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = v7;
    [WeakRetained finishFetchingData];
    if (v5)
    {
      char v6 = [WeakRetained[9] isEqual:v5];
      objc_storeStrong(WeakRetained + 9, a2);
      if ((v6 & 1) == 0) {
        [WeakRetained updateObservers];
      }
    }
    [*(id *)(a1 + 32) _scheduleTimelineProgressionTimerAfter:0];
  }
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v8 = a6;
  v9 = [a4 applicationBundleIdentifier];
  if (v9)
  {
    v10 = [v8 attributeForKey:@"RETrainingContextDateKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v10)
      {
LABEL_8:
        v12 = [(RETimeline *)self->_timeline valueForDate:v10];
        v13 = [v12 objectForKeyedSubscript:v9];

        if (v13) {
          [v13 doubleValue];
        }
        else {
          double v14 = 0.0;
        }
        v11 = +[REFeatureValue featureValueWithDouble:v14];

        goto LABEL_12;
      }
    }
    else
    {
    }
    v10 = [MEMORY[0x263EFF910] date];
    goto LABEL_8;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (RETimeline)timeline
{
  return self->_timeline;
}

- (id)_nextTimelineTransitionDateAfter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v5 = [(RETimeline *)self->_timeline transitionDates];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__REAppUsagePredictor__nextTimelineTransitionDateAfter___block_invoke;
  v9[3] = &unk_2644BCEB0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__REAppUsagePredictor__nextTimelineTransitionDateAfter___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 compare:*(void *)(a1 + 32)] == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_scheduleTimelineProgressionTimerAfter:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF910] date];
  }
  [(REUpNextTimer *)self->_timelineProgressionTimer invalidate];
  timelineProgressionTimer = self->_timelineProgressionTimer;
  self->_timelineProgressionTimer = 0;

  id v6 = [(REAppUsagePredictor *)self _nextTimelineTransitionDateAfter:v4];
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF910] distantFuture];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      objc_initWeak(&location, self);
      v9 = [(REPredictor *)self queue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__REAppUsagePredictor__scheduleTimelineProgressionTimerAfter___block_invoke;
      v12[3] = &unk_2644BCED8;
      objc_copyWeak(&v14, &location);
      id v13 = v6;
      id v10 = +[REUpNextTimer timerWithFireDate:v13 queue:v9 block:v12];

      v11 = self->_timelineProgressionTimer;
      self->_timelineProgressionTimer = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __62__REAppUsagePredictor__scheduleTimelineProgressionTimerAfter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateObservers];
    [v3 _scheduleTimelineProgressionTimerAfter:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_timelineProgressionTimer, 0);
}

@end