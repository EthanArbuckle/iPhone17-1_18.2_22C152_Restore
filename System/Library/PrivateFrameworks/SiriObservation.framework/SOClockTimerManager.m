@interface SOClockTimerManager
+ (void)warmUp;
- (SOClockTimerManager)init;
- (SOClockTimerManager)initWithInstanceContext:(id)a3;
- (id)_registeredObservations;
- (id)addTimer:(id)a3;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)removeTimer:(id)a3;
- (id)timers;
- (id)updateTimer:(id)a3;
- (void)addHandler:(id)a3 forEvent:(int64_t)a4;
- (void)checkIn;
- (void)dealloc;
- (void)removeHandlerForEvent:(int64_t)a3;
@end

@implementation SOClockTimerManager

void __43__SOClockTimerManager_addHandler_forEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 136315394;
    *(void *)&v12[4] = "-[SOClockTimerManager addHandler:forEvent:]_block_invoke";
    *(_WORD *)&v12[12] = 2112;
    *(void *)&v12[14] = v3;
    _os_log_impl(&dword_21DE53000, v4, OS_LOG_TYPE_INFO, "%s notification = %@", v12, 0x16u);
  }
  v5 = [v3 userInfo];
  v6 = getMTTimerManagerTimersKey();
  v7 = [v5 objectForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id MTTimerClass = getMTTimerClass();
    *(void *)v12 = MEMORY[0x263EF8330];
    *(void *)&v12[8] = 3221225472;
    *(void *)&v12[16] = ___SOClockTimerManagerGetMTTimersFromNotification_block_invoke;
    v13 = &__block_descriptor_40_e24_B32__0__MTTimer_8Q16_B24lu32l8;
    id v14 = MTTimerClass;
    v9 = [v7 indexesOfObjectsPassingTest:v12];
    v10 = [v7 objectsAtIndexes:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  v11 = SOClockTimerCreateFromMTTimers(v10);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) == 0 && self->_mtTimerManager)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    v4 = [(SOClockTimerManager *)self _registeredObservations];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__SOClockTimerManager_dealloc__block_invoke;
    v9[3] = &unk_264487170;
    id v10 = v3;
    id v5 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];

    mtTimerManager = self->_mtTimerManager;
    self->_mtTimerManager = 0;
  }
  [(NSMutableDictionary *)self->_registeredObservations removeAllObjects];
  registeredObservations = self->_registeredObservations;
  self->_registeredObservations = 0;

  v8.receiver = self;
  v8.super_class = (Class)SOClockTimerManager;
  [(SOClockTimerManager *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtTimerManager, 0);
  objc_storeStrong((id *)&self->_registeredObservations, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SOClockTimerManager dismissTimerWithIdentifier:]";
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) != 0
    || (mtTimerManager = self->_mtTimerManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = [(MTTimerManager *)mtTimerManager dismissTimerWithIdentifier:v4];
  }

  return v7;
}

- (id)removeTimer:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SOClockTimerManager removeTimer:]";
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) != 0
    || (mtTimerManager = self->_mtTimerManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = [(MTTimerManager *)mtTimerManager removeTimer:v4];
  }

  return v7;
}

- (id)updateTimer:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SOClockTimerManager updateTimer:]";
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) != 0
    || (mtTimerManager = self->_mtTimerManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = [(MTTimerManager *)mtTimerManager updateTimer:v4];
  }

  return v7;
}

- (id)addTimer:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SOClockTimerManager addTimer:]";
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) != 0
    || (mtTimerManager = self->_mtTimerManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = [(MTTimerManager *)mtTimerManager addTimer:v4];
  }

  return v7;
}

- (id)timers
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[SOClockTimerManager timers]";
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if ([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled])
  {
    mtTimerManager = 0;
  }
  else
  {
    mtTimerManager = self->_mtTimerManager;
    if (mtTimerManager)
    {
      mtTimerManager = [mtTimerManager timers];
    }
  }
  return mtTimerManager;
}

- (void)removeHandlerForEvent:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = AFClockTimerManagerEventGetName();
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[SOClockTimerManager removeHandlerForEvent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s event = %@", (uint8_t *)&v11, 0x16u);
  }
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) == 0)
  {
    int v6 = [(SOClockTimerManager *)self _registeredObservations];
    v7 = [v6 objectForKey:v4];

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    int v9 = v8;
    if (v7)
    {
      [v8 removeObserver:v7];
      id v10 = [(SOClockTimerManager *)self _registeredObservations];
      [v10 removeObjectForKey:v4];
    }
  }
}

- (void)addHandler:(id)a3 forEvent:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = AFClockTimerManagerEventGetName();
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SOClockTimerManager addHandler:forEvent:]";
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_21DE53000, v8, OS_LOG_TYPE_INFO, "%s event = %@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __43__SOClockTimerManager_addHandler_forEvent___block_invoke;
  v19[3] = &unk_264487198;
  id v9 = v6;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x223C1AA80](v19);
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) == 0)
  {
    int v11 = [(SOClockTimerManager *)self _registeredObservations];
    v12 = [v11 objectForKey:v7];

    __int16 v13 = [MEMORY[0x263F08A00] defaultCenter];
    id v14 = v13;
    if (v12) {
      [v13 removeObserver:v12];
    }
    if ((unint64_t)(a4 - 1) <= 7)
    {
      uint64_t v15 = ((void (*)(void))*off_2644871D8[a4 - 1])();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = [v14 addObserverForName:v15 object:self->_mtTimerManager queue:0 usingBlock:v10];
        v18 = [(SOClockTimerManager *)self _registeredObservations];
        [v18 setObject:v17 forKey:v7];
      }
    }
  }
}

- (void)checkIn
{
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) == 0)
  {
    mtTimerManager = self->_mtTimerManager;
    if (mtTimerManager)
    {
      [(MTTimerManager *)mtTimerManager checkIn];
    }
  }
}

uint64_t __30__SOClockTimerManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
}

- (SOClockTimerManager)initWithInstanceContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SOClockTimerManager;
  id v5 = [(SOClockTimerManager *)&v17 init];
  if (!v5) {
    goto LABEL_11;
  }
  if (v4)
  {
    id v6 = (AFInstanceContext *)v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F28528] defaultContext];
  }
  instanceContext = v5->_instanceContext;
  v5->_instanceContext = v6;

  uint64_t v8 = (NSObject **)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SOClockTimerManager initWithInstanceContext:]";
    __int16 v20 = 2112;
    v21 = (MTTimerManager *)v4;
    _os_log_impl(&dword_21DE53000, v9, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }
  if ([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled]) {
    goto LABEL_11;
  }
  id v10 = (MTTimerManager *)objc_alloc_init((Class)getMTTimerManagerClass_1091());
  mtTimerManager = v5->_mtTimerManager;
  v5->_mtTimerManager = v10;

  v12 = v5->_mtTimerManager;
  __int16 v13 = *v8;
  id v14 = *v8;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SOClockTimerManager initWithInstanceContext:]";
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_21DE53000, v13, OS_LOG_TYPE_INFO, "%s Initialized for MobileTimer (%@)", buf, 0x16u);
    }
LABEL_11:
    uint64_t v15 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SOClockTimerManager initWithInstanceContext:]";
    _os_log_error_impl(&dword_21DE53000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of MTTimerManager", buf, 0xCu);
  }
  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

- (SOClockTimerManager)init
{
  id v3 = [MEMORY[0x263F28528] defaultContext];
  id v4 = [(SOClockTimerManager *)self initWithInstanceContext:v3];

  return v4;
}

- (id)_registeredObservations
{
  registeredObservations = self->_registeredObservations;
  if (!registeredObservations)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = self->_registeredObservations;
    self->_registeredObservations = v4;

    registeredObservations = self->_registeredObservations;
  }
  return registeredObservations;
}

+ (void)warmUp
{
  if (([MEMORY[0x263F28510] isTimerAlarmCoordinationEnabled] & 1) == 0)
  {
    id MTTimerManagerClass_1091 = getMTTimerManagerClass_1091();
    [MTTimerManagerClass_1091 warmUp];
  }
}

@end