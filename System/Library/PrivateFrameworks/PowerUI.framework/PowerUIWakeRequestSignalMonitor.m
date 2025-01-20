@interface PowerUIWakeRequestSignalMonitor
+ (id)monitorWithDelegate:(id)a3;
- (OS_os_log)log;
- (PowerUISignalMonitorDelegate)delegate;
- (PowerUIWakeRequestSignalMonitor)initWithDelegate:(id)a3;
- (_CDContext)context;
- (_CDContextualChangeRegistration)registration;
- (id)nextUserVisibleWakeDate;
- (unint64_t)signalID;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setRegistration:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PowerUIWakeRequestSignalMonitor

- (PowerUIWakeRequestSignalMonitor)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PowerUIWakeRequestSignalMonitor;
  v3 = [(PowerUIWakeRequestSignalMonitor *)&v7 init];
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;
  }
  return v3;
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3 = a3;
  os_log_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3];

  return v4;
}

- (unint64_t)signalID
{
  return 6;
}

- (id)nextUserVisibleWakeDate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  context = self->_context;
  os_log_t v4 = [MEMORY[0x263F351D0] keyPathForNextUserVisibleWakeDate];
  v5 = [(_CDContext *)context objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [v5 dateByAddingTimeInterval:15.01];
  }
  else
  {
    v6 = [MEMORY[0x263EFF910] distantFuture];
  }
  objc_super v7 = [MEMORY[0x263F351F0] keyPathWithKey:@"/system/nextUserVisibleWakeRequestor"];
  v8 = [(_CDContext *)self->_context objectForKeyedSubscript:v7];
  v9 = [(PowerUIWakeRequestSignalMonitor *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "%@ requests a wake at %@, requesting", (uint8_t *)&v12, 0x16u);
  }

  v10 = [v6 dateByAddingTimeInterval:-3600.0];

  return v10;
}

- (void)startMonitoring
{
  if (!self->_context)
  {
    id v3 = [MEMORY[0x263F351B8] userContext];
    context = self->_context;
    self->_context = v3;
  }
  v5 = (void *)MEMORY[0x263F351F8];
  v6 = [MEMORY[0x263F351D0] keyPathForNextUserVisibleWakeDate];
  objc_super v7 = [v5 predicateForChangeAtKeyPath:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUIWakeRequestSignalMonitor_startMonitoring__block_invoke;
  v10[3] = &unk_2645A5F80;
  v10[4] = self;
  v8 = [MEMORY[0x263F351E8] localNonWakingRegistrationWithIdentifier:@"com.apple.powerui.nextwake" contextualPredicate:v7 callback:v10];
  registration = self->_registration;
  self->_registration = v8;
}

uint64_t __50__PowerUIWakeRequestSignalMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nextUserVisibleWakeDate];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 monitor:*(void *)(a1 + 32) maySuggestNewFullChargeDeadline:v2];

  return 1;
}

- (void)stopMonitoring
{
  if (self->_registration)
  {
    -[_CDContext deregisterCallback:](self->_context, "deregisterCallback:");
    registration = self->_registration;
    self->_registration = 0;
  }
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualChangeRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end