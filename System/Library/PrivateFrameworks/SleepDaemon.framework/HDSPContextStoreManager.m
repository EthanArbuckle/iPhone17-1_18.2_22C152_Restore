@interface HDSPContextStoreManager
+ (id)contextualKeyPath;
+ (id)healthAppForegroundPredicate;
+ (id)sleepAppForegroundPredicate;
- (HDSPContextStoreManager)initWithEnvironment:(id)a3;
- (HDSPContextStoreManager)initWithEnvironment:(id)a3 context:(id)a4;
- (HDSPEnvironment)environment;
- (_CDLocalContext)context;
- (id)registerPredicate:(id)a3 identifier:(id)a4 callback:(id)a5;
- (os_unfair_lock_s)contextLock;
- (void)_withLock:(id)a3;
- (void)_writeSleepInfoToContextStore:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)unregister:(id)a3;
- (void)updateForScheduleModelModifiedOnDate:(id)a3;
@end

@implementation HDSPContextStoreManager

- (HDSPContextStoreManager)initWithEnvironment:(id)a3
{
  v4 = (void *)MEMORY[0x263F351B8];
  id v5 = a3;
  v6 = [v4 userContext];
  v7 = [(HDSPContextStoreManager *)self initWithEnvironment:v5 context:v6];

  return v7;
}

- (HDSPContextStoreManager)initWithEnvironment:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPContextStoreManager;
  v8 = [(HDSPContextStoreManager *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    v9->_contextLock._os_unfair_lock_opaque = 0;
    v10 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  p_contextLock = &self->_contextLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_contextLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_contextLock);
}

- (id)registerPredicate:(id)a3 identifier:(id)a4 callback:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  objc_super v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] registering predicate %{public}@ for identifier %{public}@", buf, 0x20u);
  }

  v13 = (void *)MEMORY[0x263F351E8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__HDSPContextStoreManager_registerPredicate_identifier_callback___block_invoke;
  v18[3] = &unk_2645D96A8;
  id v20 = v10;
  uint64_t v21 = v11;
  id v19 = v9;
  id v14 = v10;
  id v15 = v9;
  v16 = [v13 localWakingRegistrationWithIdentifier:v15 contextualPredicate:v8 clientIdentifier:@"com.apple.sleepd.contextstore-registration" callback:v18];
  [(_CDLocalContext *)self->_context registerCallback:v16];

  return v16;
}

void __65__HDSPContextStoreManager_registerPredicate_identifier_callback___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a2 isEqualToString:a1[4]])
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[6];
      uint64_t v8 = a1[4];
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing callback with identifier %{public}@", (uint8_t *)&v14, 0x16u);
    }

    id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F35258]];
    id v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F35260]];
    uint64_t v11 = a1[5];
    objc_super v12 = [v9 value];
    v13 = [v10 value];
    (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);
  }
}

- (void)unregister:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] unregistering %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(_CDLocalContext *)self->_context deregisterCallback:v4];
}

+ (id)healthAppForegroundPredicate
{
  v2 = (void *)MEMORY[0x263F351F8];
  v3 = [MEMORY[0x263F351D0] keyPathForDefaultPairedDeviceForegroundApp];
  id v4 = [v2 predicateForKeyPath:v3 equalToValue:*MEMORY[0x263F0AD08]];

  return v4;
}

+ (id)sleepAppForegroundPredicate
{
  v2 = (void *)MEMORY[0x263F351F8];
  v3 = [MEMORY[0x263F351D0] keyPathForForegroundApp];
  id v4 = [v2 predicateForKeyPath:v3 equalToValue:*MEMORY[0x263F75AB8]];

  return v4;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sleepCoordinator];
  [v5 addObserver:self];

  id v6 = [v4 sleepScheduleModelManager];
  [v6 addObserver:self];

  int v7 = [v4 sleepModeManager];
  [v7 addObserver:self];

  id v8 = [v4 sleepScheduler];

  [v8 addEventHandler:self];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a4 != a3)
  {
    int v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = NSStringFromHKSPSleepScheduleState();
      uint64_t v11 = NSStringFromHKSPSleepScheduleState();
      objc_super v12 = NSStringFromHKSPSleepScheduleStateChangeReason();
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v11;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep state changed from %{public}@ to %{public}@ (%{public}@)", buf, 0x2Au);
    }
    if (a3 == 1 && (HKSPSleepScheduleStateChangeReasonIsExpected() & 1) == 0)
    {
      v13 = HKSPLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v16;
        id v17 = v16;
        _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring wake up state as it was not due to normal reason", buf, 0xCu);
      }
    }
    else
    {
      v13 = [MEMORY[0x263F351D0] sleepScheduleState];
      int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, v13);
      id v19 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [(HDSPContextStoreManager *)self _writeSleepInfoToContextStore:v15];
    }
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 lastModifiedDate];

  if (v6)
  {
    int v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2114;
      id v13 = v5;
      id v8 = v11;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [v5 lastModifiedDate];
    [(HDSPContextStoreManager *)self updateForScheduleModelModifiedOnDate:v9];
  }
}

- (void)updateForScheduleModelModifiedOnDate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F351D0];
  id v5 = a3;
  id v6 = [v4 sleepScheduleModelDateModified];
  id v8 = v6;
  v9[0] = v5;
  int v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(HDSPContextStoreManager *)self _writeSleepInfoToContextStore:v7];
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event due %{public}@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x263F351D0] sleepEvent];
  int v10 = objc_msgSend(v4, "identifier", v9);
  id v13 = v10;
  id v11 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [(HDSPContextStoreManager *)self _writeSleepInfoToContextStore:v11];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3 != a4)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      int v10 = NSStringFromHKSPSleepMode();
      id v11 = NSStringFromHKSPSleepMode();
      uint64_t v12 = NSStringFromHKSPSleepModeChangeReason();
      *(_DWORD *)buf = 138544130;
      __int16 v22 = v8;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      __int16 v25 = 2114;
      __int16 v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode changed from %{public}@ to %{public}@ (%{public}@)", buf, 0x2Au);
    }
    BOOL v13 = a3 != 0;
    uint64_t v14 = [MEMORY[0x263F351D0] sleepModeState];
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", a3, v14);
    v20[0] = v15;
    __int16 v16 = [MEMORY[0x263F351D0] sleepModeOn];
    v19[1] = v16;
    id v17 = [NSNumber numberWithBool:v13];
    v20[1] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [(HDSPContextStoreManager *)self _writeSleepInfoToContextStore:v18];
  }
}

- (void)_writeSleepInfoToContextStore:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding %{public}@ to context", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HDSPContextStoreManager__writeSleepInfoToContextStore___block_invoke;
  v8[3] = &unk_2645D9288;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HDSPContextStoreManager *)self _withLock:v8];
}

void __57__HDSPContextStoreManager__writeSleepInfoToContextStore___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() contextualKeyPath];
  v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v2];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v15 = 138543618;
    *(void *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2114;
    *(void *)&v15[14] = v3;
    id v5 = *(id *)&v15[4];
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] previous context is %{public}@", v15, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id)[v3 mutableCopy];
  }
  else
  {
    if (v3)
    {
      id v7 = HKSPLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = objc_opt_class();
        id v13 = v12;
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)uint64_t v15 = 138543618;
        *(void *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2114;
        *(void *)&v15[14] = v14;
        _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] previous context is of unexpected class %{public}@", v15, 0x16u);
      }
    }
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v8 = v6;
  objc_msgSend(v6, "addEntriesFromDictionary:", *(void *)(a1 + 40), *(_OWORD *)v15, *(void *)&v15[16], v16);
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = objc_opt_class();
    *(_DWORD *)uint64_t v15 = 138543618;
    *(void *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2114;
    *(void *)&v15[14] = v8;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] new context is %{public}@", v15, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKeyedSubscript:v2];
}

- (_CDLocalContext)context
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  id v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__HDSPContextStoreManager_context__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPContextStoreManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (_CDLocalContext *)v2;
}

void __34__HDSPContextStoreManager_context__block_invoke(uint64_t a1)
{
}

+ (id)contextualKeyPath
{
  return (id)[MEMORY[0x263F351D0] keyPathForSleepStateDictionary];
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (os_unfair_lock_s)contextLock
{
  return self->_contextLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end