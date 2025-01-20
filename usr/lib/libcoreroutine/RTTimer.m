@interface RTTimer
- (NSString)identifier;
- (RTTimer)init;
- (RTTimer)initWithIdentifier:(id)a3 dispatchSource:(id)a4;
- (RTTimer)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)fireAfterDelay:(double)a3;
- (void)fireAfterDelay:(double)a3 interval:(double)a4;
- (void)fireAfterDelay:(double)a3 interval:(double)a4 leeway:(double)a5;
- (void)fireWithInterval:(double)a3;
- (void)fireWithInterval:(double)a3 leeway:(double)a4;
- (void)invalidate;
- (void)resume;
- (void)suspend;
@end

@implementation RTTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)RTTimer;
  [(RTTimer *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)resume
{
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4 leeway:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v24 = 1024;
      int v25 = 108;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: delay > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }
  }
  if (a4 <= 0.0)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v24 = 1024;
      int v25 = 109;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: interval > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }
  }
  if (a5 <= 0.0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v24 = 1024;
      int v25 = 110;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: leeway > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }
  }
  timer = self->_timer;
  double v13 = fabs(a3);
  if (v13 == INFINITY) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = 0;
  }
  dispatch_time_t v15 = v14;
  if (a3 > 0.0 && v13 != INFINITY) {
    dispatch_time_t v15 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = -1;
  }
  else
  {
    uint64_t v18 = (unint64_t)(a4 * 1000000000.0);
  }
  if ((*(uint64_t *)&a5 <= -1 || ((*(void *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a5 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = -1;
  }
  else
  {
    uint64_t v21 = (unint64_t)(a5 * 1000000000.0);
  }
  dispatch_source_set_timer(timer, v15, v18, v21);
}

- (RTTimer)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
      __int16 v18 = 1024;
      int v19 = 30;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
LABEL_13:
      v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315394;
        v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
        __int16 v18 = 1024;
        int v19 = 32;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v16, 0x12u);
      }
      v11 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
    __int16 v18 = 1024;
    int v19 = 31;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", (uint8_t *)&v16, 0x12u);
  }

  if (!v10) {
    goto LABEL_13;
  }
LABEL_4:
  v11 = 0;
  if (v8 && v9)
  {
    v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);
    dispatch_source_set_event_handler(v12, v10);
    self = [(RTTimer *)self initWithIdentifier:v8 dispatchSource:v12];
    v11 = self;
LABEL_16:
  }
  return v11;
}

- (RTTimer)initWithIdentifier:(id)a3 dispatchSource:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      __int16 v19 = 1024;
      int v20 = 53;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_9:
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      __int16 v19 = 1024;
      int v20 = 54;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTTimer;
  v9 = [(RTTimer *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_timer, a4);
  }
  self = v9;
  v12 = self;
LABEL_13:

  return v12;
}

- (void)fireAfterDelay:(double)a3
{
}

- (void)fireWithInterval:(double)a3 leeway:(double)a4
{
}

- (void)suspend
{
}

- (RTTimer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_queue_handler_);
}

- (void)fireWithInterval:(double)a3
{
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4
{
}

- (void)cancel
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end