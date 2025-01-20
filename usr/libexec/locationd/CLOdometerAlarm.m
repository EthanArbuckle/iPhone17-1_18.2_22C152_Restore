@interface CLOdometerAlarm
- (BOOL)invalid;
- (CLOdometerAlarm)init;
- (CLOdometerAlarm)initWithDistance:(double)a3 inUniverse:(id)a4 handler:(id)a5;
- (CLOdometerAlarmManagerProtocol)manager;
- (double)odometerTarget;
- (id)handler;
- (void)dealloc;
- (void)fire:(double)a3 withError:(id)a4;
- (void)invalidate;
- (void)setHandler:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setOdometerTarget:(double)a3;
@end

@implementation CLOdometerAlarm

- (CLOdometerAlarm)init
{
  return 0;
}

- (CLOdometerAlarm)initWithDistance:(double)a3 inUniverse:(id)a4 handler:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLOdometerAlarm;
  v8 = [(CLOdometerAlarm *)&v10 init];
  if (v8)
  {
    if (objc_msgSend(objc_msgSend(a4, "vendor"), "isServiceEnabled:", @"CLOdometerAlarmManager"))
    {
      [(CLOdometerAlarm *)v8 setOdometerTarget:a3];
      [(CLOdometerAlarm *)v8 setHandler:a5];
      -[CLOdometerAlarm setManager:[objc_msgSend(objc_msgSend(a4, "vendor"), "proxyForService:", @"CLOdometerAlarmManager")];
      [(CLOdometerAlarmManagerProtocol *)[(CLOdometerAlarm *)v8 manager] addAlarm:v8];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  [(CLOdometerAlarm *)self setHandler:0];
  [(CLOdometerAlarm *)self setManager:0];
  v3.receiver = self;
  v3.super_class = (Class)CLOdometerAlarm;
  [(CLOdometerAlarm *)&v3 dealloc];
}

- (void)invalidate
{
  objc_sync_enter(self);
  [(CLOdometerAlarm *)self setInvalid:1];
  objc_sync_exit(self);
  objc_super v3 = [(CLOdometerAlarm *)self manager];

  [(CLOdometerAlarmManagerProtocol *)v3 removeAlarm:self];
}

- (void)fire:(double)a3 withError:(id)a4
{
  objc_sync_enter(self);
  unsigned __int8 v6 = [(CLOdometerAlarm *)self invalid];
  objc_sync_exit(self);
  if ((v6 & 1) == 0)
  {
    v7 = (void (*)(__n128))*((void *)[(CLOdometerAlarm *)self handler] + 2);
    v8.n128_f64[0] = a3;
    v7(v8);
  }
}

- (double)odometerTarget
{
  return self->odometerTarget;
}

- (void)setOdometerTarget:(double)a3
{
  self->odometerTarget = a3;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)invalid
{
  return self->invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->invalid = a3;
}

- (CLOdometerAlarmManagerProtocol)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

@end