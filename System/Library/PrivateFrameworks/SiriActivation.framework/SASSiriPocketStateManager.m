@interface SASSiriPocketStateManager
+ (id)new;
+ (id)sharedManager;
- (BOOL)pocketStateShouldPreventVoiceTrigger;
- (BOOL)pocketStateShouldPreventVoiceTriggerForActivationRequest:(id)a3;
- (CMPocketStateManager)_pocketStateManager;
- (SASSiriPocketStateManager)init;
- (id)_init;
- (id)_stringForPocketState:(int64_t)a3;
- (int64_t)_currentPocketState;
- (void)_setCurrentPocketState:(int64_t)a3;
- (void)_setPocketStateManager:(id)a3;
- (void)_updateForPocketState:(int64_t)a3;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)queryForPocketStateWithCompletion:(id)a3;
@end

@implementation SASSiriPocketStateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __42__SASSiriPocketStateManager_sharedManager__block_invoke()
{
  sharedManager_manager = [[SASSiriPocketStateManager alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SASSiriPocketStateManager;
  v2 = [(SASSiriPocketStateManager *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F22268]);
    [(SASSiriPocketStateManager *)v2 _setPocketStateManager:v3];

    v4 = [(SASSiriPocketStateManager *)v2 _pocketStateManager];
    [v4 setDelegate:v2];

    [(SASSiriPocketStateManager *)v2 _setCurrentPocketState:4];
  }
  return v2;
}

- (SASSiriPocketStateManager)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)queryForPocketStateWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Querying Pocket State", buf, 0xCu);
  }
  [(SASSiriPocketStateManager *)self _updateForPocketState:4];
  objc_super v6 = [(SASSiriPocketStateManager *)self _pocketStateManager];
  id v7 = MEMORY[0x1E4F14428];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke;
  v9[3] = &unk_1E6B67688;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v6 queryStateOntoQueue:MEMORY[0x1E4F14428] andMonitorFor:v9 withTimeout:0.5 andHandler:0.3];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = *MEMORY[0x1E4F4E360];
    id v8 = *MEMORY[0x1E4F4E360];
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke_cold_1((uint64_t)v5, v7);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v7;
        id v10 = [WeakRetained _stringForPocketState:a2];
        int v12 = 136315394;
        v13 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Pocket state query successful with state: %@", (uint8_t *)&v12, 0x16u);
      }
      [WeakRetained _updateForPocketState:a2];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
    }
  }
}

- (BOOL)pocketStateShouldPreventVoiceTriggerForActivationRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 context];
  id v5 = [v4 speechRequestOptions];
  objc_super v6 = [v5 voiceTriggerEventInfo];

  if (v6
    && ([v6 objectForKey:@"hfpTriggerDuringPhoneCall"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v8))
  {
    v9 = *MEMORY[0x1E4F4E360];
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SASSiriPocketStateManager pocketStateShouldPreventVoiceTriggerForActivationRequest:]";
      _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation hfpTriggerDuringPhoneCall = YES bypassing pocket state detector", (uint8_t *)&v12, 0xCu);
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = [(SASSiriPocketStateManager *)self pocketStateShouldPreventVoiceTrigger];
  }

  return v10;
}

- (BOOL)pocketStateShouldPreventVoiceTrigger
{
  unint64_t v2 = [(SASSiriPocketStateManager *)self _currentPocketState];
  return (v2 > 4) | v2 & 1;
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
}

- (void)_updateForPocketState:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    id v7 = [(SASSiriPocketStateManager *)self _stringForPocketState:a3];
    int v8 = 136315394;
    v9 = "-[SASSiriPocketStateManager _updateForPocketState:]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: PocketState changed to %@", (uint8_t *)&v8, 0x16u);
  }
  [(SASSiriPocketStateManager *)self _setCurrentPocketState:a3];
}

- (id)_stringForPocketState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"CMPocketStateTypeOutOfPocket";
  }
  else {
    return off_1E6B676A8[a3 - 1];
  }
}

- (CMPocketStateManager)_pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)_setPocketStateManager:(id)a3
{
}

- (int64_t)_currentPocketState
{
  return self->_currentPocketState;
}

- (void)_setCurrentPocketState:(int64_t)a3
{
  self->_currentPocketState = a3;
}

- (void).cxx_destruct
{
}

void __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #SiriPocketStateManager: Failed to query for pocket state: %@", (uint8_t *)&v2, 0x16u);
}

@end