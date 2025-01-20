@interface RTXPCTimerAlarm
- (BOOL)_isEndDateValid:(id)a3;
- (BOOL)fireWithDate:(id)a3 error:(id *)a4;
- (BOOL)invalidate;
- (NSDate)endDate;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (RTXPCTimerAlarm)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
- (id)handler;
- (unint64_t)state;
- (void)_deregisterAlarm;
- (void)_fireWithDate:(id)a3;
- (void)_handleDurationExpiry;
- (void)_invalidate;
- (void)_resetState;
- (void)_setAlarmWithEndDate:(id)a3 userVisible:(BOOL)a4;
- (void)_setup;
- (void)onNotification:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setup;
@end

@implementation RTXPCTimerAlarm

- (RTXPCTimerAlarm)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTXPCTimerAlarm initWithIdentifier:queue:handler:]";
      __int16 v22 = 1024;
      int v23 = 26;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)RTXPCTimerAlarm;
  v12 = [(RTXPCTimerAlarm *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    v13->_state = 0;
    uint64_t v14 = [v8 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id handler = v13->_handler;
    v13->_id handler = (id)v16;

    [(RTXPCTimerAlarm *)v13 setup];
  }

  return v13;
}

- (void)setup
{
  v3 = [(RTXPCTimerAlarm *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__RTXPCTimerAlarm_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__RTXPCTimerAlarm_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v3 = [(RTXPCTimerAlarm *)self identifier];
  [v4 addObserver:self selector:sel_onNotification_ name:v3 object:0];
}

- (void)onNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTXPCTimerAlarm *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__RTXPCTimerAlarm_onNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__RTXPCTimerAlarm_onNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNotification:*(void *)(a1 + 40)];
}

- (BOOL)fireWithDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(RTXPCTimerAlarm *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__RTXPCTimerAlarm_fireWithDate_error___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(v7, v10);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"endDate");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 != 0;
}

uint64_t __38__RTXPCTimerAlarm_fireWithDate_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireWithDate:*(void *)(a1 + 40)];
}

- (BOOL)invalidate
{
  v3 = [(RTXPCTimerAlarm *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RTXPCTimerAlarm_invalidate__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

uint64_t __29__RTXPCTimerAlarm_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_fireWithDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(RTXPCTimerAlarm *)self _deregisterAlarm];
    [(RTXPCTimerAlarm *)self _resetState];
    if ([(RTXPCTimerAlarm *)self _isEndDateValid:v4])
    {
      [(RTXPCTimerAlarm *)self setState:2];
      [(RTXPCTimerAlarm *)self _setAlarmWithEndDate:v4 userVisible:1];
    }
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v6, 2u);
    }
  }
}

- (void)_handleDurationExpiry
{
  [(RTXPCTimerAlarm *)self setState:3];
  [(RTXPCTimerAlarm *)self _deregisterAlarm];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(RTXPCTimerAlarm *)self setEndDate:v3];

  id v4 = [(RTXPCTimerAlarm *)self handler];

  if (v4)
  {
    v5 = [(RTXPCTimerAlarm *)self handler];
    v5[2]();
  }
}

- (void)_invalidate
{
  [(RTXPCTimerAlarm *)self _deregisterAlarm];
  [(RTXPCTimerAlarm *)self _resetState];
  [(RTXPCTimerAlarm *)self setState:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v3 = [(RTXPCTimerAlarm *)self identifier];
  [v4 removeObserver:self name:v3 object:0];
}

- (void)_setAlarmWithEndDate:(id)a3 userVisible:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(RTXPCTimerAlarm *)self identifier];
  [v7 cStringUsingEncoding:4];

  [v6 timeIntervalSince1970];
  double v9 = v8;

  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (uint64_t)v9);
  xpc_dictionary_set_BOOL(xdict, "UserVisible", a4);
  xpc_set_event();
}

- (void)_deregisterAlarm
{
  id v2 = [(RTXPCTimerAlarm *)self identifier];
  [v2 cStringUsingEncoding:4];

  xpc_set_event();
}

- (BOOL)_isEndDateValid:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  uint64_t v7 = [v6 compare:v5];

  if (v7 == 1) {
    [(RTXPCTimerAlarm *)self _handleDurationExpiry];
  }

  return v7 != 1;
}

- (void)_resetState
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end