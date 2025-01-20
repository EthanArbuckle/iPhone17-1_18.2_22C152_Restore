@interface SMHeartbeatTimer
- (NSTimer)heartbeatTimer;
- (OS_dispatch_queue)queue;
- (SMHeartbeatTimer)init;
- (void)_startHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)_stopHeartbeatWithHandler:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)startHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)stopHeartbeatWithHandler:(id)a3;
@end

@implementation SMHeartbeatTimer

- (SMHeartbeatTimer)init
{
  v12.receiver = self;
  v12.super_class = (Class)SMHeartbeatTimer;
  v2 = [(SMHeartbeatTimer *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (const char *)[(SMHeartbeatTimer *)v4 UTF8String];
    }
    else
    {
      id v7 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v4];
      v6 = (const char *)[v7 UTF8String];
    }
    dispatch_queue_t v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    heartbeatTimer = v4->_heartbeatTimer;
    v4->_heartbeatTimer = 0;
  }
  return v3;
}

- (void)startHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(SMHeartbeatTimer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SMHeartbeatTimer_startHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_265499678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __55__SMHeartbeatTimer_startHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startHeartbeatForSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(SMHeartbeatTimer *)self heartbeatTimer];
    *(_DWORD *)buf = 136315650;
    v24 = "-[SMHeartbeatTimer _startHeartbeatForSessionID:handler:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_25B6E0000, v8, OS_LOG_TYPE_INFO, "%s, sessionID, %@, heartbeatTimer, %@", buf, 0x20u);
  }
  id v10 = [(SMHeartbeatTimer *)self heartbeatTimer];

  if (v10) {
    [(SMHeartbeatTimer *)self _stopHeartbeatWithHandler:0];
  }
  v11 = (void *)MEMORY[0x263EFFA20];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __56__SMHeartbeatTimer__startHeartbeatForSessionID_handler___block_invoke;
  v20 = &unk_2654996A0;
  id v21 = v6;
  id v22 = v7;
  id v12 = v7;
  id v13 = v6;
  v14 = [v11 timerWithTimeInterval:1 repeats:&v17 block:60.0];
  -[SMHeartbeatTimer setHeartbeatTimer:](self, "setHeartbeatTimer:", v14, v17, v18, v19, v20);

  v15 = [MEMORY[0x263EFF9F0] mainRunLoop];
  v16 = [(SMHeartbeatTimer *)self heartbeatTimer];
  [v15 addTimer:v16 forMode:*MEMORY[0x263EFF588]];
}

void __56__SMHeartbeatTimer__startHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SMHeartbeatTimer _startHeartbeatForSessionID:handler:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_25B6E0000, v2, OS_LOG_TYPE_INFO, "Heartbeat timer fired %s, sessionID, %@", (uint8_t *)&v5, 0x16u);
  }

  v4 = +[SMSafetyMonitorManager defaultManager];
  [v4 sendHeartbeatForSessionID:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
}

- (void)stopHeartbeatWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(SMHeartbeatTimer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SMHeartbeatTimer_stopHeartbeatWithHandler___block_invoke;
  v7[3] = &unk_265499278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__SMHeartbeatTimer_stopHeartbeatWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopHeartbeatWithHandler:*(void *)(a1 + 40)];
}

- (void)_stopHeartbeatWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[SMHeartbeatTimer _stopHeartbeatWithHandler:]";
    _os_log_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SMHeartbeatTimer *)self heartbeatTimer];
  [v6 invalidate];

  [(SMHeartbeatTimer *)self setHeartbeatTimer:0];
  if (v4) {
    v4[2](v4, 0);
  }
}

- (NSTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

@end