@interface RPThermalPressure
- (RPThermalPressureDelegate)delegate;
- (int)getStateWithToken:(int)a3;
- (int64_t)convertThermalPressureLevel:(int)a3;
- (int64_t)getCurrentPressureLevel;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)thermalPressureDidChangeWithThermalLevel:(int)a3;
@end

@implementation RPThermalPressure

- (void)dealloc
{
  [(RPThermalPressure *)self stopMonitoring];
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)RPThermalPressure;
  [(RPThermalPressure *)&v3 dealloc];
}

- (void)startMonitoring
{
  p_thermalNotificationToken = &self->_thermalNotificationToken;
  notify_register_check(kOSThermalNotificationPressureLevelName, &self->_thermalNotificationToken);
  int v4 = [(RPThermalPressure *)self getStateWithToken:self->_thermalNotificationToken];
  self->_thermalLevel = v4;
  self->_newThermalLevel = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002300;
  handler[3] = &unk_100084D60;
  handler[4] = self;
  notify_register_dispatch(kOSThermalNotificationPressureLevelName, p_thermalNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)stopMonitoring
{
}

- (int64_t)getCurrentPressureLevel
{
  return [(RPThermalPressure *)self convertThermalPressureLevel:self->_newThermalLevel];
}

- (void)thermalPressureDidChangeWithThermalLevel:(int)a3
{
  int newThermalLevel = self->_newThermalLevel;
  if (newThermalLevel != a3)
  {
    self->_thermalLevel = newThermalLevel;
    self->_int newThermalLevel = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained thermalPressureDidChangeWithLevel:-[RPThermalPressure convertThermalPressureLevel:](self, "convertThermalPressureLevel:", self->_thermalLevel)];
  }
}

- (int64_t)convertThermalPressureLevel:(int)a3
{
  int64_t v3 = a3;
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return 30;
      case 40:
        return 40;
      case 50:
        return 50;
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return v3;
      case 10:
        return 10;
      case 20:
        return 20;
    }
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[RPThermalPressure convertThermalPressureLevel:]";
    __int16 v7 = 1024;
    int v8 = 70;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d unknown pressure level", (uint8_t *)&v5, 0x12u);
  }
  return v3;
}

- (int)getStateWithToken:(int)a3
{
  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  return state64;
}

- (RPThermalPressureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RPThermalPressureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end