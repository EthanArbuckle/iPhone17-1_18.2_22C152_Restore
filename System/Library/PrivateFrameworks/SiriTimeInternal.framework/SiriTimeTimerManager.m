@interface SiriTimeTimerManager
+ (id)timerManagerWithEndpointUUIDString:(id)a3;
- (MTTimerManagerIntentSupport)timerManager;
- (SiriTimeTimerManager)initWithEndpointUUID:(id)a3;
- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)addTimer:(id)a3;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)removeTimer:(id)a3;
- (id)timers;
- (id)updateTimer:(id)a3;
- (void)setTimerManager:(id)a3;
@end

@implementation SiriTimeTimerManager

+ (id)timerManagerWithEndpointUUIDString:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "+[SiriTimeTimerManager timerManagerWithEndpointUUIDString:]";
    _os_log_impl(&dword_23C9B6000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating MTTimerManager", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F55DA0]);
  return v4;
}

- (SiriTimeTimerManager)initWithEndpointUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriTimeTimerManager;
  v5 = [(SiriTimeTimerManager *)&v8 init];
  if (v5)
  {
    int v6 = +[SiriTimeTimerManager timerManagerWithEndpointUUIDString:v4];
    [(SiriTimeTimerManager *)v5 setTimerManager:v6];
  }
  return v5;
}

- (id)timers
{
  v2 = [(SiriTimeTimerManager *)self timerManager];
  v3 = [v2 timers];

  return v3;
}

- (id)addTimer:(id)a3
{
  id v4 = a3;
  v5 = [(SiriTimeTimerManager *)self timerManager];
  int v6 = [v5 addTimer:v4];

  return v6;
}

- (id)updateTimer:(id)a3
{
  id v4 = a3;
  v5 = [(SiriTimeTimerManager *)self timerManager];
  int v6 = [v5 updateTimer:v4];

  return v6;
}

- (id)removeTimer:(id)a3
{
  id v4 = a3;
  v5 = [(SiriTimeTimerManager *)self timerManager];
  int v6 = [v5 removeTimer:v4];

  return v6;
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SiriTimeTimerManager *)self timerManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(SiriTimeTimerManager *)self timerManager];
    id v8 = (id)[v7 dismissTimerWithIdentifier:v4];
  }
  v9 = [MEMORY[0x263F58190] futureWithNoResult];

  return v9;
}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4, a5);
}

- (MTTimerManagerIntentSupport)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end