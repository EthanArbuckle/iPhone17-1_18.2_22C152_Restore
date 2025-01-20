@interface MTSampling
- (BOOL)isSampledInWithEventType:(id)a3 samplingForced:(id)a4 sessionSamplingPercentage:(id)a5 sessionDuration:(id)a6 samplingPercentage:(id)a7;
- (BOOL)isSampledInWithEventType:(id)a3 sessionSamplingPercentage:(double)a4 sessionDurationMs:(unint64_t)a5;
- (BOOL)isSampledInWithMetricsData:(id)a3;
- (BOOL)isSampledInWithSamplingPercentage:(double)a3;
- (MTSampling)init;
- (NSMutableDictionary)sessions;
- (void)clearSessionWithEventType:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation MTSampling

- (MTSampling)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTSampling;
  v2 = [(MTSampling *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MTSampling *)v2 setSessions:v3];
  }
  return v2;
}

- (BOOL)isSampledInWithMetricsData:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"eventType"];
  objc_super v5 = [v3 objectForKeyedSubscript:@"xpSamplingPercentageUsers"];
  v6 = [v3 objectForKeyedSubscript:@"xpSessionDuration"];
  v7 = [v3 objectForKeyedSubscript:@"xpSamplingForced"];
  v8 = [v3 objectForKeyedSubscript:@"xpSamplingPercentage"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v4;
  }
  else {
    v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v7;
  }
  else {
    v10 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v5;
  }
  else {
    v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v6;
  }
  else {
    v12 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v8;
  }
  else {
    v13 = 0;
  }
  BOOL v14 = [(MTSampling *)self isSampledInWithEventType:v9 samplingForced:v10 sessionSamplingPercentage:v11 sessionDuration:v12 samplingPercentage:v13];

  return v14;
}

- (BOOL)isSampledInWithEventType:(id)a3 samplingForced:(id)a4 sessionSamplingPercentage:(id)a5 sessionDuration:(id)a6 samplingPercentage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v20 = 1;
  if (!v13 || ([v13 BOOLValue] & 1) == 0)
  {
    if (!v12
      || (v14 ? (v17 = v14) : (v17 = &unk_26C96FCD0),
          ([v17 doubleValue], v15) ? (v19 = v15) : (v19 = &unk_26C96FCD0),
          !-[MTSampling isSampledInWithEventType:sessionSamplingPercentage:sessionDurationMs:](self, "isSampledInWithEventType:sessionSamplingPercentage:sessionDurationMs:", v12, [v19 unsignedIntValue], v18)))
    {
      if (!v16
        || ([v16 doubleValue],
            !-[MTSampling isSampledInWithSamplingPercentage:](self, "isSampledInWithSamplingPercentage:")))
      {
        BOOL v20 = 0;
      }
    }
  }

  return v20;
}

- (BOOL)isSampledInWithEventType:(id)a3 sessionSamplingPercentage:(double)a4 sessionDurationMs:(unint64_t)a5
{
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  v10 = [(MTSampling *)v9 sessions];
  v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    id v12 = [MEMORY[0x263EFF910] now];
    uint64_t v13 = [v12 compare:v11];

    if (v13 != -1)
    {
      id v14 = [(MTSampling *)v9 sessions];
      [v14 removeObjectForKey:v8];

      v11 = 0;
    }
  }
  objc_sync_exit(v9);

  if (v11)
  {
    id v15 = [MEMORY[0x263EFF910] now];
    uint64_t v16 = [v15 compare:v11];

    if (v16 == -1) {
      goto LABEL_13;
    }
  }
  if (a4 == 0.0)
  {
    BOOL v17 = 0;
    goto LABEL_14;
  }
  BOOL v18 = [(MTSampling *)v9 isSampledInWithSamplingPercentage:a4];
  BOOL v17 = v18;
  if (a5 && v18)
  {
    double v19 = (double)a5 / 1000.0;
    BOOL v20 = [MEMORY[0x263EFF910] now];
    v21 = [v20 dateByAddingTimeInterval:v19];

    v22 = v9;
    objc_sync_enter(v22);
    v23 = [(MTSampling *)v22 sessions];
    v24 = [v23 objectForKeyedSubscript:v8];

    if (!v24)
    {
      v25 = [(MTSampling *)v22 sessions];
      [v25 setObject:v21 forKeyedSubscript:v8];
    }
    objc_sync_exit(v22);

    objc_initWeak(&location, v22);
    v26 = (void *)MEMORY[0x263EFFA20];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__MTSampling_isSampledInWithEventType_sessionSamplingPercentage_sessionDurationMs___block_invoke;
    v29[3] = &unk_26430F3B8;
    objc_copyWeak(&v31, &location);
    id v30 = v8;
    id v27 = (id)[v26 scheduledTimerWithTimeInterval:0 repeats:v29 block:v19];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

LABEL_13:
    BOOL v17 = 1;
  }
LABEL_14:

  return v17;
}

void __83__MTSampling_isSampledInWithEventType_sessionSamplingPercentage_sessionDurationMs___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained clearSessionWithEventType:*(void *)(a1 + 32)];
}

- (void)clearSessionWithEventType:(id)a3
{
  id v9 = a3;
  v4 = [(MTSampling *)self sessions];
  objc_super v5 = [v4 objectForKeyedSubscript:v9];

  if (v5)
  {
    v6 = [MEMORY[0x263EFF910] now];
    uint64_t v7 = [v6 compare:v5];

    if (v7 != -1)
    {
      id v8 = [(MTSampling *)self sessions];
      [v8 removeObjectForKey:v9];
    }
  }
}

- (BOOL)isSampledInWithSamplingPercentage:(double)a3
{
  return drand48() < a3;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end