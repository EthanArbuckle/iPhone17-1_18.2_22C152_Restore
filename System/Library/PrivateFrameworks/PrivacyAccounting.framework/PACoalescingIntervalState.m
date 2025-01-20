@interface PACoalescingIntervalState
- (NSSet)assetIdentifiers;
- (PAAccessInterval)interval;
- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7;
- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7 expiry:(double)a8;
- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5;
- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5 expiry:(double)a6;
- (double)idleTime;
- (double)intervalEndTime;
- (double)timestampAdjustment;
- (id)clock;
- (id)description;
- (int64_t)accessCount;
- (void)dealloc;
- (void)invalidate;
- (void)setAccessCount:(int64_t)a3;
- (void)setClock:(id)a3;
- (void)setIntervalEndTime:(double)a3;
- (void)touch;
@end

@implementation PACoalescingIntervalState

- (void)touch
{
  v3 = [(PACoalescingIntervalState *)self clock];
  self->_startTimes.absolute = v3[2]();
  self->_startTimes.continuous = v4;

  self->_lastCoalescedTime = self->_startTimes.absolute;
  [(PACoalescingIntervalState *)self intervalEndTime];
  endTimer = self->_endTimer;
  if (endTimer)
  {
    unint64_t v7 = (unint64_t)(v5 * 1000000000.0);
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(endTimer, v8, 0xFFFFFFFFFFFFFFFFLL, v7 >> 2);
  }
}

__uint64_t __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke()
{
  __uint64_t v0 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  return v0;
}

- (PAAccessInterval)interval
{
  return self->_interval;
}

- (double)intervalEndTime
{
  return self->_intervalEndTime;
}

- (id)clock
{
  return self->_clock;
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5 expiry:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  [v12 intervalEndTime];
  double v14 = v13;
  v15 = [v12 logger];
  v16 = [v15 queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke_2;
  v20[3] = &unk_1E5D71288;
  objc_copyWeak(&v22, &from);
  objc_copyWeak(&v23, &location);
  id v17 = v11;
  id v21 = v17;
  v18 = [(PACoalescingIntervalState *)self initWithInterval:v10 intervalExpirationTime:v16 expiryQueue:&__block_literal_global_5 clock:v20 onExpiration:v14 expiry:a6];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v18;
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 matcher:(id)a4 tracker:(id)a5
{
  return [(PACoalescingIntervalState *)self initWithInterval:a3 matcher:a4 tracker:a5 expiry:-1.0];
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7 expiry:(double)a8
{
  id v15 = a3;
  v16 = a5;
  id v17 = (uint64_t (**)(void))a6;
  id v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PACoalescingIntervalState;
  v19 = [(PACoalescingIntervalState *)&v39 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interval, a3);
    uint64_t v21 = v17[2](v17);
    v20->_startTimes.absolute = v21;
    v20->_startTimes.continuous = v22;
    v20->_lastCoalescedTime = v21;
    v20->_intervalEndTime = a4;
    id v23 = _Block_copy(v17);
    id clock = v20->_clock;
    v20->_id clock = v23;

    objc_initWeak(&location, v20);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__2;
    v36[4] = __Block_byref_object_dispose__2;
    id v37 = (id)os_transaction_create();
    signal(15, (void (__cdecl *)(int))1);
    dispatch_source_t v25 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, v16);
    sigTermSource = v20->_sigTermSource;
    v20->_sigTermSource = (OS_dispatch_source *)v25;

    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v16);
    endTimer = v20->_endTimer;
    v20->_endTimer = (OS_dispatch_source *)v27;

    if (a8 == -1.0) {
      dispatch_time_t v29 = -1;
    }
    else {
      dispatch_time_t v29 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    }
    dispatch_source_set_timer((dispatch_source_t)v20->_endTimer, v29, 0xFFFFFFFFFFFFFFFFLL, 0);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __107__PACoalescingIntervalState_initWithInterval_intervalExpirationTime_expiryQueue_clock_onExpiration_expiry___block_invoke;
    v32[3] = &unk_1E5D712B0;
    objc_copyWeak(&v35, &location);
    id v33 = v18;
    v34 = v36;
    v30 = _Block_copy(v32);
    dispatch_source_set_event_handler((dispatch_source_t)v20->_endTimer, v30);
    dispatch_activate((dispatch_object_t)v20->_endTimer);
    dispatch_source_set_event_handler((dispatch_source_t)v20->_sigTermSource, v30);
    dispatch_activate((dispatch_object_t)v20->_sigTermSource);

    objc_destroyWeak(&v35);
    _Block_object_dispose(v36, 8);

    objc_destroyWeak(&location);
  }

  return v20;
}

void __69__PACoalescingIntervalState_initWithInterval_matcher_tracker_expiry___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 expireIntervalWithMatcher:*(void *)(a1 + 32) state:WeakRetained];
}

- (PACoalescingIntervalState)initWithInterval:(id)a3 intervalExpirationTime:(double)a4 expiryQueue:(id)a5 clock:(id)a6 onExpiration:(id)a7
{
  return [(PACoalescingIntervalState *)self initWithInterval:a3 intervalExpirationTime:a5 expiryQueue:a6 clock:a7 onExpiration:a4 expiry:-1.0];
}

void __107__PACoalescingIntervalState_initWithInterval_intervalExpirationTime_expiryQueue_clock_onExpiration_expiry___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)dealloc
{
  [(PACoalescingIntervalState *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PACoalescingIntervalState;
  [(PACoalescingIntervalState *)&v3 dealloc];
}

- (void)invalidate
{
  endTimer = self->_endTimer;
  if (endTimer)
  {
    dispatch_source_cancel(endTimer);
    unint64_t v4 = self->_endTimer;
    self->_endTimer = 0;
  }
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel(sigTermSource);
    v6 = self->_sigTermSource;
    self->_sigTermSource = 0;
  }
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  interval = self->_interval;
  v6 = NSNumber;
  [(PACoalescingIntervalState *)self idleTime];
  unint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  dispatch_time_t v8 = [v3 stringWithFormat:@"<%@ %p interval:%@ idleTime:%@>", v4, self, interval, v7];

  return v8;
}

- (double)idleTime
{
  objc_super v3 = [(PACoalescingIntervalState *)self clock];
  unint64_t v4 = (v3[2]() - self->_lastCoalescedTime) / 0x3E8;

  return (double)v4 / 1000000.0;
}

- (double)timestampAdjustment
{
  objc_super v3 = [(PACoalescingIntervalState *)self clock];
  v3[2]();
  uint64_t v5 = v4;

  return (double)((v5 + self->_startTimes.absolute - (self->_startTimes.continuous + self->_lastCoalescedTime)) / 0x3E8)
       / -1000000.0;
}

- (void)setIntervalEndTime:(double)a3
{
  self->_intervalEndTime = a3;
}

- (NSSet)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_accessCount = a3;
}

- (void)setClock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clock, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);

  objc_storeStrong((id *)&self->_endTimer, 0);
}

@end