@interface PMMMusicStateProcessor
+ (id)shared;
- (BOOL)inCar;
- (OS_dispatch_queue)queue;
- (PMMMusicContainer)lastPlayed;
- (PMMMusicContainer)lastPlayedInCar;
- (PMMMusicStateProcessor)init;
- (id)_init;
- (void)_handlePause;
- (void)_handlePlay;
- (void)_initNowPlayingPause;
- (void)_initNowPlayingPlay;
- (void)_initStarkConnect;
- (void)_initStarkDisconnect;
- (void)_persist;
- (void)init;
- (void)lastPlayedInCarWithHandler:(id)a3;
- (void)lastPlayedWithHandler:(id)a3;
- (void)setInCar:(BOOL)a3;
- (void)setLastPlayed:(id)a3;
- (void)setLastPlayedInCar:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PMMMusicStateProcessor

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)shared___sharedInstance;
  return v2;
}

uint64_t __32__PMMMusicStateProcessor_shared__block_invoke()
{
  shared___sharedInstance = [[PMMMusicStateProcessor alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (PMMMusicStateProcessor)init
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[PMMMusicStateProcessor init]();
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Create a MusicStateProcessor using [... shared]"];

  return 0;
}

- (id)_init
{
  v35.receiver = self;
  v35.super_class = (Class)PMMMusicStateProcessor;
  v2 = [(PMMMusicStateProcessor *)&v35 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"%@-%p", v5, v2];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DuetExpertCenter.MagicalMoments"];
    v12 = (void *)MEMORY[0x22A618A50]();
    v13 = [v11 objectForKey:@"lastPlayed"];
    if (v13)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v13 error:0];
      uint64_t v15 = [v14 decodeObject];
      lastPlayed = v2->_lastPlayed;
      v2->_lastPlayed = (PMMMusicContainer *)v15;
    }
    v17 = (void *)MEMORY[0x22A618A50]();
    v18 = [v11 objectForKey:@"lastPlayedInCar"];
    if (v18)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v18 error:0];
      uint64_t v20 = [v19 decodeObject];
      lastPlayedInCar = v2->_lastPlayedInCar;
      v2->_lastPlayedInCar = (PMMMusicContainer *)v20;
    }
    if (!v2->_lastPlayed)
    {
      uint64_t v22 = objc_opt_new();
      v23 = v2->_lastPlayed;
      v2->_lastPlayed = (PMMMusicContainer *)v22;
    }
    if (!v2->_lastPlayedInCar)
    {
      uint64_t v24 = objc_opt_new();
      v25 = v2->_lastPlayedInCar;
      v2->_lastPlayedInCar = (PMMMusicContainer *)v24;
    }
    v26 = +[PMMContextHelper sharedInstance];
    v27 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
    v28 = [v26 fetchContextValueForKeyPath:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v29 = [v28 BOOLValue];
    }
    else {
      uint64_t v29 = 0;
    }
    [(PMMMusicStateProcessor *)v2 setInCar:v29];
    v30 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
    v31 = [v26 fetchDataDictionaryForKeyPath:v30];
    if (v31)
    {
      v32 = [MEMORY[0x263F351D0] nowPlayingBundleIdKey];
      v33 = [v31 objectForKeyedSubscript:v32];

      if ([v33 isEqualToString:@"unknown"]) {
        [(PMMMusicStateProcessor *)v2 _handlePause];
      }
      else {
        [(PMMMusicStateProcessor *)v2 _handlePlay];
      }
    }
    [(PMMMusicStateProcessor *)v2 _initStarkConnect];
    [(PMMMusicStateProcessor *)v2 _initStarkDisconnect];
    [(PMMMusicStateProcessor *)v2 _initNowPlayingPause];
    [(PMMMusicStateProcessor *)v2 _initNowPlayingPlay];
  }
  return v2;
}

- (void)_handlePause
{
  [(PMMMusicContainer *)self->_lastPlayed setPauseIfUnset];
  [(PMMMusicContainer *)self->_lastPlayedInCar setPauseIfUnset];
  [(PMMMusicStateProcessor *)self _persist];
}

- (void)_handlePlay
{
  id v11 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
  v3 = +[PMMContextHelper sharedInstance];
  v4 = [v3 fetchDataDictionaryForKeyPath:v11];

  if (v4)
  {
    v5 = [MEMORY[0x263F351D0] nowPlayingBundleIdKey];
    id v6 = [v4 objectForKeyedSubscript:v5];

    v7 = [MEMORY[0x263F351D0] nowPlayingTrackKey];
    v8 = [v4 objectForKeyedSubscript:v7];

    dispatch_queue_t v9 = [MEMORY[0x263F351D0] nowPlayingCreationDateKey];
    v10 = [v4 objectForKeyedSubscript:v9];

    [(PMMMusicContainer *)self->_lastPlayed setPlayingWithBundleId:v6 trackIdentifier:v8 playTime:v10];
    if ([(PMMMusicStateProcessor *)self inCar]) {
      [(PMMMusicContainer *)self->_lastPlayedInCar setPlayingWithBundleId:v6 trackIdentifier:v8 playTime:v10];
    }
    [(PMMMusicStateProcessor *)self _persist];
  }
}

- (void)_persist
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    lastPlayed = self->_lastPlayed;
    int v11 = 138412290;
    v12 = lastPlayed;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_INFO, "Persisting playing: %@", (uint8_t *)&v11, 0xCu);
  }

  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    lastPlayedInCar = self->_lastPlayedInCar;
    int v11 = 138412290;
    v12 = lastPlayedInCar;
    _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_INFO, "Persisting playing in car: %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = (void *)MEMORY[0x22A618A50]();
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DuetExpertCenter.MagicalMoments"];
  dispatch_queue_t v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_lastPlayed requiringSecureCoding:1 error:0];
  [v8 setObject:v9 forKey:@"lastPlayed"];

  v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_lastPlayedInCar requiringSecureCoding:1 error:0];
  [v8 setObject:v10 forKey:@"lastPlayedInCar"];

  [v8 synchronize];
}

- (void)_initStarkConnect
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
  v4 = [MEMORY[0x263F351F8] predicateForChangeAtKeyPath:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__PMMMusicStateProcessor__initStarkConnect__block_invoke;
  v8[3] = &unk_2646DFCC0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x22A618C40](v8);
  id v6 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.ms.carplayconnect" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v5];
  v7 = +[PMMContextHelper sharedInstance];
  [v7 registerForNotifications:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __43__PMMMusicStateProcessor__initStarkConnect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    id v6 = (void *)os_transaction_create();
    v7 = [WeakRetained queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __43__PMMMusicStateProcessor__initStarkConnect__block_invoke_30;
    v9[3] = &unk_2646DFA18;
    v9[4] = WeakRetained;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

id __43__PMMMusicStateProcessor__initStarkConnect__block_invoke_30(uint64_t a1)
{
  return self;
}

- (void)_initStarkDisconnect
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
  v4 = [MEMORY[0x263F351F8] predicateForChangeAtKeyPath:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke;
  v8[3] = &unk_2646DFCC0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x22A618C40](v8);
  id v6 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.ms.carplaydisconnect" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v5];
  v7 = +[PMMContextHelper sharedInstance];
  [v7 registerForNotifications:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    id v6 = (void *)os_transaction_create();
    v7 = [WeakRetained queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke_36;
    v9[3] = &unk_2646DFA18;
    v9[4] = WeakRetained;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

id __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke_36(uint64_t a1)
{
  return self;
}

- (void)_initNowPlayingPause
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
  v4 = [MEMORY[0x263F351F8] predicateForChangeAtKeyPath:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke;
  v8[3] = &unk_2646DFCC0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x22A618C40](v8);
  id v6 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.ms.nowplayingpause" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v5];
  v7 = +[PMMContextHelper sharedInstance];
  [v7 registerForNotifications:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    id v6 = (void *)os_transaction_create();
    v7 = [WeakRetained queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke_40;
    v9[3] = &unk_2646DFA18;
    v9[4] = WeakRetained;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

id __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke_40(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A618A50]();
  [*(id *)(a1 + 32) _handlePause];
  return self;
}

- (void)_initNowPlayingPlay
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
  v4 = [MEMORY[0x263F351F8] predicateForChangeAtKeyPath:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke;
  v8[3] = &unk_2646DFCC0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x22A618C40](v8);
  id v6 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.ms.nowplayingplay" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v5];
  v7 = +[PMMContextHelper sharedInstance];
  [v7 registerForNotifications:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    id v6 = (void *)os_transaction_create();
    v7 = [WeakRetained queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke_44;
    v9[3] = &unk_2646DFA18;
    v9[4] = WeakRetained;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

id __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke_44(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A618A50]();
  [*(id *)(a1 + 32) _handlePlay];
  return self;
}

- (void)lastPlayedWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(PMMMusicStateProcessor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PMMMusicStateProcessor_lastPlayedWithHandler___block_invoke;
    block[3] = &unk_2646DFCE8;
    block[4] = self;
    id v9 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PMMMusicStateProcessor.m", 264, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
}

uint64_t __48__PMMMusicStateProcessor_lastPlayedWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

- (void)lastPlayedInCarWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(PMMMusicStateProcessor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PMMMusicStateProcessor_lastPlayedInCarWithHandler___block_invoke;
    block[3] = &unk_2646DFCE8;
    block[4] = self;
    id v9 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PMMMusicStateProcessor.m", 277, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
}

uint64_t __53__PMMMusicStateProcessor_lastPlayedInCarWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (void)setInCar:(BOOL)a3
{
  self->_inCar = a3;
}

- (PMMMusicContainer)lastPlayed
{
  return self->_lastPlayed;
}

- (void)setLastPlayed:(id)a3
{
}

- (PMMMusicContainer)lastPlayedInCar
{
  return self->_lastPlayedInCar;
}

- (void)setLastPlayedInCar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedInCar, 0);
  objc_storeStrong((id *)&self->_lastPlayed, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2247FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Create a MusicStateProcessor using [... shared]", v0, 2u);
}

@end