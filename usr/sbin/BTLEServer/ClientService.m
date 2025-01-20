@interface ClientService
+ (id)UUID;
- (BOOL)isPrimary;
- (BOOL)isStarted;
- (CBPeripheral)peripheral;
- (CBService)service;
- (ClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (ClientServiceManager)manager;
- (NSTimer)startTimer;
- (double)startTimeout;
- (unint64_t)priority;
- (void)notifyDidStart;
- (void)setIsPrimary:(BOOL)a3;
- (void)setIsStarted:(BOOL)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setStartTimeout:(double)a3;
- (void)setStartTimer:(id)a3;
- (void)start;
- (void)startDidTimeout;
- (void)stop;
@end

@implementation ClientService

+ (id)UUID
{
  return 0;
}

- (void)start
{
  [(ClientService *)self startTimeout];
  if (v3 != 0.0)
  {
    [(ClientService *)self startTimeout];
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "startDidTimeout", 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ClientService *)self setStartTimer:v4];
  }
}

- (void)stop
{
  id v2 = [(ClientService *)self startTimer];
  [v2 invalidate];
}

- (ClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ClientService;
  v11 = [(ClientService *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    objc_storeStrong((id *)&v12->_peripheral, a4);
    objc_storeStrong((id *)&v12->_service, a5);
    *(_WORD *)&v12->_isPrimary = 0;
    v12->_startTimeout = 10.0;
    startTimer = v12->_startTimer;
    v12->_priority = 10;
    v12->_startTimer = 0;
  }
  return v12;
}

- (void)notifyDidStart
{
  if (![(ClientService *)self isStarted])
  {
    double v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      v5 = v3;
      v6 = [(CBService *)service UUID];
      v7 = [(CBPeripheral *)self->_peripheral name];
      int v10 = 138412546;
      v11 = v6;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Service \"%@\" has started on peripheral \"%@\"", (uint8_t *)&v10, 0x16u);
    }
    [(ClientService *)self setIsStarted:1];
    id v8 = [(ClientService *)self startTimer];
    [v8 invalidate];

    id v9 = [(ClientService *)self manager];
    [v9 clientServiceDidStart:self];
  }
}

- (void)startDidTimeout
{
  double v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10007145C((uint64_t)self, v3);
  }
  id v4 = [(ClientService *)self manager];
  [v4 clientServiceDidStart:self];
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (NSTimer)startTimer
{
  return self->_startTimer;
}

- (void)setStartTimer:(id)a3
{
}

- (ClientServiceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (ClientServiceManager *)WeakRetained;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBService)service
{
  return self->_service;
}

- (double)startTimeout
{
  return self->_startTimeout;
}

- (void)setStartTimeout:(double)a3
{
  self->_startTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_startTimer, 0);
}

@end