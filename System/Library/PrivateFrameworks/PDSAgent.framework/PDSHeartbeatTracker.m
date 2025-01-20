@interface PDSHeartbeatTracker
- (BOOL)isPassedTrackedHeartbeatDate;
- (BOOL)scheduledActivity;
- (IDSServerBag)serverBag;
- (IMDispatchTimer)heartbeatTimer;
- (NSDate)trackedHeartbeatDate;
- (OS_dispatch_queue)queue;
- (PDSHeartbeatTracker)initWithDelegate:(id)a3 queue:(id)a4 kvStoreBlock:(id)a5 serverBag:(id)a6;
- (PDSHeartbeatTrackerDelegate)delegate;
- (id)kvStoreBlock;
- (void)_handleHeartbeatFired;
- (void)_markNextCheckpointTimeWithTTL:(double)a3;
- (void)_setupMaintenanceActivity;
- (void)noteShouldNotTrackHeartbeat;
- (void)noteShouldTrackHeartbeat;
- (void)noteUpdatedHeartbeatTTL:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setKvStoreBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScheduledActivity:(BOOL)a3;
- (void)setServerBag:(id)a3;
@end

@implementation PDSHeartbeatTracker

- (PDSHeartbeatTracker)initWithDelegate:(id)a3 queue:(id)a4 kvStoreBlock:(id)a5 serverBag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PDSHeartbeatTracker.m", 34, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"PDSHeartbeatTracker.m", 36, @"Invalid parameter not satisfying: %@", @"kvStoreBlock" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PDSHeartbeatTracker.m", 35, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PDSHeartbeatTracker.m", 37, @"Invalid parameter not satisfying: %@", @"serverBag" object file lineNumber description];

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PDSHeartbeatTracker;
  v15 = [(PDSHeartbeatTracker *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v11);
    objc_storeStrong((id *)&v16->_queue, a4);
    uint64_t v17 = MEMORY[0x223C8A560](v13);
    id kvStoreBlock = v16->_kvStoreBlock;
    v16->_id kvStoreBlock = (id)v17;

    objc_storeStrong((id *)&v16->_serverBag, a6);
  }

  return v16;
}

- (void)_handleHeartbeatFired
{
  id v3 = [(PDSHeartbeatTracker *)self delegate];
  [v3 heartbeatFiredForTracker:self];
}

- (void)noteUpdatedHeartbeatTTL:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = [(PDSHeartbeatTracker *)self serverBag];
  double v6 = (double)arc4random_uniform([v5 ttlWindowFromBag]);

  v7 = [(PDSHeartbeatTracker *)self serverBag];
  double v8 = (double)[v7 ttlGracePeriodFromBag];

  if (a3 - v8 - v6 >= 3600.0) {
    double v9 = a3 - v8 - v6;
  }
  else {
    double v9 = 3600.0;
  }
  v10 = pds_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = v9;
    _os_log_impl(&dword_221791000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling heartbeat in: %f", (uint8_t *)&v11, 0xCu);
  }

  [(PDSHeartbeatTracker *)self _markNextCheckpointTimeWithTTL:v9];
  [(PDSHeartbeatTracker *)self noteShouldTrackHeartbeat];
}

- (void)_setupMaintenanceActivity
{
  if (![(PDSHeartbeatTracker *)self scheduledActivity])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v3 = (const char *)*MEMORY[0x263F5BA00];
    v4 = (void *)*MEMORY[0x263EF8188];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke;
    double v8 = &unk_2645C8E88;
    objc_copyWeak(&v9, &location);
    xpc_activity_register(v3, v4, &v5);
    -[PDSHeartbeatTracker setScheduledActivity:](self, "setScheduledActivity:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    uint64_t v6 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke_22;
    block[3] = &unk_2645C8BE0;
    block[4] = WeakRetained;
    dispatch_async(v6, block);
LABEL_10:

    goto LABEL_11;
  }
  if (!state)
  {
    uint64_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x263EF8180], 0);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    double v8 = v7;
    if (!v7 || !xpc_equal(v7, v6)) {
      xpc_activity_set_criteria(v3, v6);
    }
    id v9 = pds_defaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v12 = v6;
      _os_log_impl(&dword_221791000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling heartbeat XPC activity %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke_22(uint64_t a1)
{
  v2 = pds_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_221791000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat XPC activity fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _handleHeartbeatFired];
}

- (void)noteShouldNotTrackHeartbeat
{
  xpc_activity_unregister((const char *)*MEMORY[0x263F5BA00]);
  [(PDSHeartbeatTracker *)self setScheduledActivity:0];
  id v3 = [(PDSHeartbeatTracker *)self heartbeatTimer];
  [v3 invalidate];

  [(PDSHeartbeatTracker *)self setHeartbeatTimer:0];
}

- (void)noteShouldTrackHeartbeat
{
  id v3 = [(PDSHeartbeatTracker *)self trackedHeartbeatDate];
  v4 = [(PDSHeartbeatTracker *)self delegate];
  int v5 = [v4 shouldScheduleHeartbeatForTracker:self];

  if (v5)
  {
    [(IMDispatchTimer *)self->_heartbeatTimer invalidate];
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

    xpc_object_t v7 = [MEMORY[0x263EFF910] now];
    [v3 timeIntervalSinceDate:v7];
    double v9 = v8;

    double v10 = (double)arc4random_uniform(0x3Cu) + 21600.0;
    if (v9 < v10) {
      double v10 = v9;
    }
    double v11 = fmax(v10, 3600.0);
    id v12 = objc_alloc(MEMORY[0x263F4A820]);
    uint64_t v13 = im_primary_queue();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__PDSHeartbeatTracker_noteShouldTrackHeartbeat__block_invoke;
    v16[3] = &unk_2645C8EB0;
    v16[4] = self;
    id v14 = (IMDispatchTimer *)[v12 initWithQueue:v13 interval:(unint64_t)v11 repeats:0 handlerBlock:v16];
    v15 = self->_heartbeatTimer;
    self->_heartbeatTimer = v14;

    [(PDSHeartbeatTracker *)self _setupMaintenanceActivity];
  }
}

void __47__PDSHeartbeatTracker_noteShouldTrackHeartbeat__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleHeartbeatFired];
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (BOOL)isPassedTrackedHeartbeatDate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(PDSHeartbeatTracker *)self trackedHeartbeatDate];
  id v3 = pds_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    double v11 = v2;
    _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "Next checkpoint time %@", (uint8_t *)&v10, 0xCu);
  }

  if (v2)
  {
    [v2 timeIntervalSinceReferenceDate];
    double v5 = v4 + -300.0;
    uint64_t v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceReferenceDate];
    BOOL v8 = v7 > v5;
  }
  else
  {
    uint64_t v6 = pds_defaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_221791000, v6, OS_LOG_TYPE_DEFAULT, "No checkpoint time saved. Heartbeating", (uint8_t *)&v10, 2u);
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (NSDate)trackedHeartbeatDate
{
  uint64_t v2 = [(PDSHeartbeatTracker *)self kvStoreBlock];
  id v3 = v2[2]();

  double v4 = [v3 numberForKey:@"kPDSNextCheckpointTime"];
  double v5 = (void *)MEMORY[0x263EFF910];
  [v4 doubleValue];
  uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");

  return (NSDate *)v6;
}

- (void)_markNextCheckpointTimeWithTTL:(double)a3
{
  double v4 = [(PDSHeartbeatTracker *)self kvStoreBlock];
  v4[2]();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  double v5 = NSNumber;
  uint64_t v6 = [MEMORY[0x263EFF910] now];
  double v7 = [v6 dateByAddingTimeInterval:a3];
  [v7 timeIntervalSince1970];
  BOOL v8 = objc_msgSend(v5, "numberWithDouble:");
  [v9 setNumber:v8 forKey:@"kPDSNextCheckpointTime"];
}

- (IMDispatchTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)kvStoreBlock
{
  return self->_kvStoreBlock;
}

- (void)setKvStoreBlock:(id)a3
{
}

- (PDSHeartbeatTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDSHeartbeatTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)scheduledActivity
{
  return self->_scheduledActivity;
}

- (void)setScheduledActivity:(BOOL)a3
{
  self->_scheduledActivity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_kvStoreBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

@end