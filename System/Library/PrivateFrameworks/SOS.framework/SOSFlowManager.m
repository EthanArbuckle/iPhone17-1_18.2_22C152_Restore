@interface SOSFlowManager
+ (id)sharedInstance;
- (SOSFlow)activeSOSFlow;
- (SOSFlowManager)init;
- (id)_init;
- (void)emergencyCallInitiated;
- (void)kappaWasRequested;
- (void)setActiveSOSFlow:(id)a3;
- (void)sosFlow:(id)a3 didChangeToState:(int64_t)a4;
- (void)startFreshSOSFlowWithTriggerMechanism:(int64_t)a3;
- (void)startSOSFlowWithTriggerMechanism:(int64_t)a3;
@end

@implementation SOSFlowManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SOSFlowManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sSOSFlowManager;

  return v2;
}

uint64_t __32__SOSFlowManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSOSFlowManager = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x1F41817F8]();
}

- (SOSFlowManager)init
{
  v3 = +[SOSFlowManager sharedInstance];

  return v3;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)SOSFlowManager;
  v2 = [(SOSFlowManager *)&v8 init];
  if (v2)
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSFlowManager, init", v7, 2u);
    }

    v4 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    healthStore = v2->_healthStore;
    v2->_healthStore = v4;

    [(HKHealthStore *)v2->_healthStore setDebugIdentifier:@"com.apple.sos"];
    [(HKHealthStore *)v2->_healthStore resume];
  }
  return v2;
}

- (void)kappaWasRequested
{
  id v2 = [(SOSFlowManager *)self activeSOSFlow];
  [v2 handleSOSFlowEvent:12 withMetaData:0];
}

- (void)emergencyCallInitiated
{
  id v2 = [(SOSFlowManager *)self activeSOSFlow];
  [v2 handleSOSFlowEvent:13 withMetaData:0];
}

- (void)startSOSFlowWithTriggerMechanism:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = SOSStringForSOSTriggerMechanism(a3);
    int v7 = 136315394;
    objc_super v8 = "-[SOSFlowManager startSOSFlowWithTriggerMechanism:]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting SOSFlow with trigger: %@", (uint8_t *)&v7, 0x16u);
  }
  [(SOSFlowManager *)self startFreshSOSFlowWithTriggerMechanism:a3];
}

- (void)startFreshSOSFlowWithTriggerMechanism:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[SOSFlowManager startFreshSOSFlowWithTriggerMechanism:]";
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting a fresh SOSFlow", (uint8_t *)&v15, 0xCu);
  }

  v6 = [(SOSFlowManager *)self activeSOSFlow];

  if (v6)
  {
    int v7 = [(SOSFlowManager *)self activeSOSFlow];
    [v7 removeObserver:self];
  }
  objc_super v8 = [[SOSFlow alloc] initWithTriggerMechanism:a3 healthStore:self->_healthStore];
  [(SOSFlowManager *)self setActiveSOSFlow:v8];

  __int16 v9 = [(SOSFlowManager *)self activeSOSFlow];
  [v9 addObserver:self];

  v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = [(SOSFlowManager *)self activeSOSFlow];
  v12 = [v10 dictionaryWithObject:v11 forKey:@"activeSOSFlow"];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"SOSFlowWillStartNotification" object:0 userInfo:v12];

  v14 = [(SOSFlowManager *)self activeSOSFlow];
  [v14 handleSOSFlowEvent:0 withMetaData:0];
}

- (void)sosFlow:(id)a3 didChangeToState:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[SOSFlow isTerminalState:a4])
  {
    v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      objc_super v8 = "-[SOSFlowManager sosFlow:didChangeToState:]";
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "%s: SOSFlow reached terminal state, tearing down", (uint8_t *)&v7, 0xCu);
    }

    v6 = [(SOSFlowManager *)self activeSOSFlow];
    [v6 removeObserver:self];

    [(SOSFlowManager *)self setActiveSOSFlow:0];
  }
}

- (SOSFlow)activeSOSFlow
{
  return self->_activeSOSFlow;
}

- (void)setActiveSOSFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSOSFlow, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end