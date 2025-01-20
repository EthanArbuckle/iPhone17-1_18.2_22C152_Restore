@interface TUIImpressionController
+ (BOOL)debugEnabled;
+ (void)setDebugEnabled:(BOOL)a3;
- (TUIImpressionConfiguration)configuration;
- (TUIImpressionController)initWithFeedId:(id)a3 delegate:(id)a4 tracker:(id)a5 queue:(id)a6;
- (TUIImpressionControllerDelegate)delegate;
- (TUIVisibilityTracker)tracker;
- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsAtTime:(double)a4 withCompletion:(id)a5;
- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4;
- (void)collectVisibleImpressionsWithCompletion:(id)a3;
- (void)q_collectImpressions:(id)a3 time:(double)a4 flush:(BOOL)a5 stats:(id)a6;
- (void)q_collectImpressions:(id)a3 time:(double)a4 threshold:(double)a5 flush:(BOOL)a6 stats:(id)a7;
- (void)q_scheduleRefreshIfNeeded;
- (void)q_updateSnapshot;
- (void)q_updateSnapshotIfNeededWithTime:(double)a3;
- (void)reset;
- (void)teardown;
- (void)visibleContentsChanged:(id)a3;
@end

@implementation TUIImpressionController

- (TUIImpressionController)initWithFeedId:(id)a3 delegate:(id)a4 tracker:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TUIImpressionController;
  v13 = [(TUIImpressionController *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_feedId.uniqueIdentifier = a3.var0;
    objc_storeStrong((id *)&v13->_queue, a6);
    v15 = objc_alloc_init(TUIImpressionConfiguration);
    configuration = v14->_configuration;
    v14->_configuration = v15;

    v17 = objc_alloc_init(_TUIImpressionStats);
    q_stats = v14->_q_stats;
    v14->_q_stats = v17;

    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v14->_tracker, a5);
    [v11 addVisibilityObserver:v14];
    if (+[TUIImpressionController debugEnabled])
    {
      v19 = [[TUIImpressionSnapshot alloc] initWithMap:0];
      id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
      [WeakRetained impressionController:v14 didUpdateSnapshot:v19];
    }
  }

  return v14;
}

- (void)teardown
{
  [(TUIVisibilityTracker *)self->_tracker removeVisibilityObserver:self];
  tracker = self->_tracker;
  self->_tracker = 0;
}

- (void)q_updateSnapshotIfNeededWithTime:(double)a3
{
  if (+[TUIImpressionController debugEnabled])
  {
    uint64_t v5 = objc_opt_new();
    [(TUIImpressionConfiguration *)self->_configuration timingThreshold];
    [(TUIImpressionController *)self q_collectImpressions:v5 time:0 threshold:self->_q_stats flush:a3 stats:v6];
    v20 = (void *)v5;
    v7 = [[TUIImpressionSnapshot alloc] initWithMap:v5];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = [(TUIImpressionSnapshot *)self->_q_previousSnapshot impressions];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 timingCount])
          {
            v14 = [v13 identifier];
            v15 = [(TUIImpressionSnapshot *)v7 impressionForIdentifier:v14];

            if (!v15 || ![v15 timingCount])
            {
              v16 = TUIDefaultLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
                *(_DWORD *)buf = 134217984;
                unint64_t v26 = uniqueIdentifier;
                _os_log_error_impl(&def_141F14, v16, OS_LOG_TYPE_ERROR, "[fid:%lu] unexpected change in impression", buf, 0xCu);
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained impressionController:self didUpdateSnapshot:v7];

    q_previousSnapshot = self->_q_previousSnapshot;
    self->_q_previousSnapshot = v7;

    [(TUIImpressionController *)self q_scheduleRefreshIfNeeded];
  }
}

- (void)q_scheduleRefreshIfNeeded
{
  if (!self->_q_pendingRefresh)
  {
    self->_q_pendingRefresh = 1;
    objc_initWeak(&location, self);
    [(TUIImpressionConfiguration *)self->_configuration minUpdateInterval];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_224D4;
    v6[3] = &unk_251DA0;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)q_updateSnapshot
{
  self->_q_pendingRefresh = 0;
  double v3 = sub_1A768();

  [(TUIImpressionController *)self q_updateSnapshotIfNeededWithTime:v3];
}

- (void)q_collectImpressions:(id)a3 time:(double)a4 flush:(BOOL)a5 stats:(id)a6
{
  BOOL v6 = a5;
  configuration = self->_configuration;
  id v11 = a6;
  id v13 = a3;
  [(TUIImpressionConfiguration *)configuration timingThreshold];
  [(TUIImpressionController *)self q_collectImpressions:v13 time:v6 threshold:v11 flush:a4 stats:v12];
}

- (void)q_collectImpressions:(id)a3 time:(double)a4 threshold:(double)a5 flush:(BOOL)a6 stats:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a7;
  id v13 = [v12 impressions];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_226E0;
  v19 = &unk_251DC8;
  BOOL v23 = v8;
  double v21 = a4;
  double v22 = a5;
  id v14 = v11;
  id v20 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:&v16];

  if (v8)
  {
    [v12 impressions:v16, v17, v18, v19];
    [v15 removeAllObjects];
  }
}

- (void)visibleContentsChanged:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  double v6 = v5;
  [(TUIImpressionConfiguration *)self->_configuration timingThreshold];
  double v8 = v7;
  id v9 = [v4 rootNode];
  sub_22868(v9, self->_q_stats, v6, v8);

  id v10 = [v4 rootNode];
  q_currentVisible = self->_q_currentVisible;
  self->_q_currentVisible = v10;

  [v4 timestamp];
  double v13 = v12;

  [(TUIImpressionController *)self q_updateSnapshotIfNeededWithTime:v13];
}

- (void)reset
{
  double v3 = sub_1A768();
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22BB0;
  v5[3] = &unk_251A30;
  v5[4] = self;
  *(double *)&v5[5] = v3;
  dispatch_async(queue, v5);
}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(TUIImpressionController *)self collectAndFlush:v4 accumulatedImpressionsAtTime:v6 withCompletion:sub_1A768()];
}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsAtTime:(double)a4 withCompletion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_22F28;
  v11[3] = &unk_251DF0;
  double v13 = a4;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)collectVisibleImpressionsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = sub_1A768();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_230A0;
    block[3] = &unk_251E18;
    double v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

+ (BOOL)debugEnabled
{
  if (qword_2DF218 != -1) {
    dispatch_once(&qword_2DF218, &stru_251E38);
  }
  return byte_2DF220;
}

+ (void)setDebugEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  byte_2DF220 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"TUIOverlayImpressions"];
}

- (TUIImpressionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIImpressionControllerDelegate *)WeakRetained;
}

- (TUIImpressionConfiguration)configuration
{
  return self->_configuration;
}

- (TUIVisibilityTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_q_currentVisible, 0);
  objc_storeStrong((id *)&self->_q_previousSnapshot, 0);
  objc_storeStrong((id *)&self->_q_stats, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end