@interface RTPersistentTimer
- (NSDate)fireDate;
- (NSString)serviceIdentifier;
- (OS_dispatch_queue)queue;
- (PCPersistentTimer)timer;
- (RTPersistentTimer)initWithFireDate:(id)a3 interval:(double)a4 serviceIdentifier:(id)a5 queue:(id)a6 handler:(id)a7;
- (RTPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 handler:(id)a6;
- (double)interval;
- (id)handler;
- (void)_invalidateTimer;
- (void)_onTimerFired:(id)a3;
- (void)_setupNextTimer;
- (void)_startTimer;
- (void)invalidate;
- (void)setFireDate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation RTPersistentTimer

- (RTPersistentTimer)initWithFireDate:(id)a3 interval:(double)a4 serviceIdentifier:(id)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
      __int16 v30 = 1024;
      int v31 = 37;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fireDate (in %s:%d)", buf, 0x12u);
    }

    if (v14)
    {
LABEL_3:
      if (v16) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
    __int16 v30 = 1024;
    int v31 = 38;
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceIdentifer (in %s:%d)", buf, 0x12u);
  }

  if (!v16)
  {
LABEL_11:
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
      __int16 v30 = 1024;
      int v31 = 39;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  v27.receiver = self;
  v27.super_class = (Class)RTPersistentTimer;
  v20 = [(RTPersistentTimer *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_fireDate, a3);
    objc_storeStrong((id *)&v21->_queue, a6);
    v21->_interval = a4;
    uint64_t v22 = [v14 copy];
    serviceIdentifier = v21->_serviceIdentifier;
    v21->_serviceIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    id handler = v21->_handler;
    v21->_id handler = (id)v24;

    [(RTPersistentTimer *)v21 _startTimer];
  }

  return v21;
}

- (RTPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 handler:(id)a6
{
  return [(RTPersistentTimer *)self initWithFireDate:a3 interval:a4 serviceIdentifier:a5 queue:a6 handler:INFINITY];
}

- (void)_startTimer
{
  [(RTPersistentTimer *)self _invalidateTimer];
  v3 = [(RTPersistentTimer *)self fireDate];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F89D38]);
    v5 = [(RTPersistentTimer *)self fireDate];
    v6 = [(RTPersistentTimer *)self serviceIdentifier];
    v7 = (void *)[v4 initWithFireDate:v5 serviceIdentifier:v6 target:self selector:sel__onTimerFired_ userInfo:0];
    [(RTPersistentTimer *)self setTimer:v7];

    v8 = [(RTPersistentTimer *)self timer];
    [v8 setMinimumEarlyFireProportion:0.9];

    id v10 = [(RTPersistentTimer *)self timer];
    v9 = [(RTPersistentTimer *)self queue];
    [v10 scheduleInQueue:v9];
  }
}

- (void)_onTimerFired:(id)a3
{
  id v4 = [(RTPersistentTimer *)self handler];

  if (v4)
  {
    v5 = [(RTPersistentTimer *)self handler];
    v5[2]();
  }

  [(RTPersistentTimer *)self _setupNextTimer];
}

- (void)_setupNextTimer
{
  [(RTPersistentTimer *)self interval];
  if (v3 == INFINITY)
  {
    [(RTPersistentTimer *)self setFireDate:0];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [(RTPersistentTimer *)self interval];
    v5 = [v4 dateWithTimeIntervalSinceNow:x0];
    [(RTPersistentTimer *)self setFireDate:v5];
  }

  [(RTPersistentTimer *)self _startTimer];
}

- (void)_invalidateTimer
{
  double v3 = [(RTPersistentTimer *)self timer];
  [v3 invalidate];

  [(RTPersistentTimer *)self setTimer:0];
}

- (void)invalidate
{
  [(RTPersistentTimer *)self _invalidateTimer];
  [(RTPersistentTimer *)self setHandler:0];
  [(RTPersistentTimer *)self setFireDate:0];

  [(RTPersistentTimer *)self setInterval:INFINITY];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (PCPersistentTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end