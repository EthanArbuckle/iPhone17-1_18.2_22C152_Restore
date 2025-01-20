@interface TUIKTStateManager
- (BOOL)isCDPErrorState;
- (BOOL)isErrorState;
- (BOOL)isVerifyCDPRunning;
- (NSUUID)firstRecentFailedEventId;
- (TUIKTStateManager)init;
- (id)stateDescription;
- (id)stateLabel;
- (int64_t)expectedResolutionDays;
- (int64_t)state;
- (unint64_t)optIn;
- (unint64_t)recentFailedEventIdsCount;
- (void)init;
- (void)isManateeAvailableWithCompletion:(id)a3;
- (void)setExpectedResolutionDays:(id)a3;
- (void)setIsVerifyCDPRunning:(BOOL)a3;
- (void)stateLabel;
- (void)updateStateWithKTStatusResult:(id)a3;
@end

@implementation TUIKTStateManager

- (TUIKTStateManager)init
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_12);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStateManager init]();
  }
  v4.receiver = self;
  v4.super_class = (Class)TUIKTStateManager;
  result = [(TUIKTStateManager *)&v4 init];
  if (result) {
    result->_state = -1;
  }
  return result;
}

uint64_t __25__TUIKTStateManager_init__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (int64_t)state
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (unint64_t)optIn
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(KTStatusResult *)v2->_ktStatusResult optIn];
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)recentFailedEventIdsCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(KTStatusResult *)v2->_ktStatusResult recentFailedEventIds];
  unint64_t v4 = [v3 count];

  objc_sync_exit(v2);
  return v4;
}

- (NSUUID)firstRecentFailedEventId
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(KTStatusResult *)v2->_ktStatusResult recentFailedEventIds];
  if ([v3 count])
  {
    unint64_t v4 = [(KTStatusResult *)v2->_ktStatusResult recentFailedEventIds];
    v5 = [v4 firstObject];
  }
  else
  {
    v5 = 0;
  }

  objc_sync_exit(v2);
  return (NSUUID *)v5;
}

- (void)updateStateWithKTStatusResult:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = (TUIKTStateManager *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_20);
  }
  v7 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(TUIKTStateManager *)v6 stateDescription];
    int v17 = 136315906;
    v18 = "-[TUIKTStateManager updateStateWithKTStatusResult:]";
    __int16 v19 = 2114;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v5;
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%s current %{public}@, %{public}@ on %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  objc_storeStrong((id *)&v6->_ktStatusResult, a3);
  if ([(TUIKTStateManager *)v5 accountStatus] == 5)
  {
    uint64_t v9 = 10;
    goto LABEL_37;
  }
  if ([(TUIKTStateManager *)v5 optIn] == 1)
  {
    if ([(TUIKTStateManager *)v5 accountStatus] == 2)
    {
LABEL_9:
      uint64_t v9 = 5;
      goto LABEL_37;
    }
    if ([(TUIKTStateManager *)v5 idsAccountStatus] != 3)
    {
      uint64_t v9 = 3;
      goto LABEL_37;
    }
    if ([(TUIKTStateManager *)v5 accountStatus] == 3)
    {
      uint64_t v9 = 6;
      goto LABEL_37;
    }
    if ([(TUIKTStateManager *)v5 accountStatus] == 4
      && [(TUIKTStateManager *)v5 selfStatus] == 1)
    {
      uint64_t v9 = 4;
      goto LABEL_37;
    }
    if ([(TUIKTStateManager *)v5 accountStatus] == 4
      && ([(TUIKTStateManager *)v5 selfStatus] == 3
       || [(TUIKTStateManager *)v5 selfStatus] == 4))
    {
      BOOL v10 = [(TUIKTStateManager *)v5 systemStatus] == 3;
      uint64_t v9 = 7;
      uint64_t v11 = 9;
LABEL_35:
      if (v10) {
        uint64_t v9 = v11;
      }
      goto LABEL_37;
    }
    if ([(TUIKTStateManager *)v5 accountStatus] == 4
      && ([(TUIKTStateManager *)v5 selfStatus] == 2
       || [(TUIKTStateManager *)v5 systemStatus] == 2
       || [(TUIKTStateManager *)v5 systemStatus] == 4))
    {
      uint64_t v15 = [(TUIKTStateManager *)v5 systemStatus];
      uint64_t v9 = 8;
      if (v15 == 3) {
        uint64_t v9 = 9;
      }
    }
    else
    {
      uint64_t v16 = [(TUIKTStateManager *)v5 systemStatus];
      uint64_t v9 = 12;
      if (v16 != 5) {
        uint64_t v9 = 1;
      }
    }
  }
  else
  {
    if ([(TUIKTStateManager *)v5 optIn] == 2)
    {
      if ([(TUIKTStateManager *)v5 serverOptIn] == 1)
      {
        if ([(TUIKTStateManager *)v5 accountStatus] == 2) {
          goto LABEL_9;
        }
        BOOL v10 = [(TUIKTStateManager *)v5 accountStatus] == 3;
        uint64_t v9 = 2;
        uint64_t v11 = 6;
      }
      else
      {
        if ([(TUIKTStateManager *)v5 serverOptIn] != 2)
        {
          uint64_t v9 = 2;
          goto LABEL_37;
        }
        if ([(TUIKTStateManager *)v5 accountStatus] == 3)
        {
          uint64_t v9 = 11;
          goto LABEL_37;
        }
        BOOL v10 = [(TUIKTStateManager *)v5 accountStatus] == 2;
        uint64_t v9 = 2;
        uint64_t v11 = 10;
      }
      goto LABEL_35;
    }
    if ([(TUIKTStateManager *)v5 optIn])
    {
      uint64_t v9 = -1;
    }
    else
    {
      uint64_t v12 = [(TUIKTStateManager *)v5 systemStatus];
      uint64_t v9 = 12;
      if (v12 != 5) {
        uint64_t v9 = 0;
      }
    }
  }
LABEL_37:
  v6->_int64_t state = v9;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_23);
  }
  v13 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(TUIKTStateManager *)v6 stateDescription];
    int v17 = 136315650;
    v18 = "-[TUIKTStateManager updateStateWithKTStatusResult:]";
    __int16 v19 = 2114;
    v20 = v14;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_DEFAULT, "%s new %{public}@ on %{public}@", (uint8_t *)&v17, 0x20u);
  }
  objc_sync_exit(v6);
}

uint64_t __51__TUIKTStateManager_updateStateWithKTStatusResult___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __51__TUIKTStateManager_updateStateWithKTStatusResult___block_invoke_21()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)isManateeAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_25);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStateManager isManateeAvailableWithCompletion:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_26;
  block[3] = &unk_265553528;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_26(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_28);
    }
    unint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v10 = "-[TUIKTStateManager isManateeAvailableWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  id v4 = objc_alloc(MEMORY[0x263F343F0]);
  uint64_t v5 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v6 = (void *)[v4 initWithContext:v5];

  id v8 = 0;
  LOBYTE(v5) = [v6 isManateeAvailable:&v8];
  id v7 = v8;
  if ((v5 & 1) == 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_32);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR)) {
      __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_26_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_30()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (BOOL)isErrorState
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (unint64_t)(v2->_state - 3) < 0xA;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isCDPErrorState
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = (v2->_state < 0xCuLL) & (0xC60u >> v2->_state);
  objc_sync_exit(v2);

  return v3;
}

- (id)stateLabel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  unint64_t state = v2->_state;
  if (state <= 0xC)
  {
    if (((1 << state) & 0x1708) != 0)
    {
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"UNAVAILABLE" value:&stru_270C3F140 table:@"Localizable"];
      goto LABEL_8;
    }
    if (((1 << state) & 0xB0) != 0)
    {
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"ERROR" value:&stru_270C3F140 table:@"Localizable"];
LABEL_8:
      id v6 = (__CFString *)v5;

      goto LABEL_9;
    }
    if (((1 << state) & 0x840) != 0)
    {
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"WAITING" value:&stru_270C3F140 table:@"Localizable"];
      goto LABEL_8;
    }
  }
  id v8 = [(KTStatusResult *)v2->_ktStatusResult recentFailedEventIds];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_50_0);
    }
    BOOL v10 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(KTStatusResult *)v2->_ktStatusResult recentFailedEventIds];
      [(TUIKTStateManager *)v11 stateLabel];
    }

    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v12 localizedStringForKey:@"ERROR" value:&stru_270C3F140 table:@"Localizable"];
  }
  else
  {
    id v6 = &stru_270C3F140;
  }
LABEL_9:
  objc_sync_exit(v2);

  return v6;
}

uint64_t __31__TUIKTStateManager_stateLabel__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)setExpectedResolutionDays:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v7 = [MEMORY[0x263EFF910] now];
    id v8 = [v6 components:16 fromDate:v7 toDate:v4 options:0];

    v5->_expectedResolutionDays = [v8 day] + 1;
  }
  else
  {
    v5->_expectedResolutionDays = 0;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_54_1);
  }
  uint64_t v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStateManager setExpectedResolutionDays:]((uint64_t)v5, v9);
  }
  objc_sync_exit(v5);
}

uint64_t __47__TUIKTStateManager_setExpectedResolutionDays___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)stateDescription
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_state + 1;
  if (v3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unexpected UI state (%ld)", v2->_state);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = off_265553548[v3];
  }
  v5 = [NSString stringWithFormat:@"UI unint64_t state = %@", v4];

  objc_sync_exit(v2);
  return v5;
}

- (int64_t)expectedResolutionDays
{
  return self->_expectedResolutionDays;
}

- (BOOL)isVerifyCDPRunning
{
  return self->_isVerifyCDPRunning;
}

- (void)setIsVerifyCDPRunning:(BOOL)a3
{
  self->_isVerifyCDPRunning = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)isManateeAvailableWithCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_26_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_260338000, v2, OS_LOG_TYPE_ERROR, "%s error = %{public}@ on %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)stateLabel
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[TUIKTStateManager stateLabel]";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_debug_impl(&dword_260338000, log, OS_LOG_TYPE_DEBUG, "%s recentFailedEventIds: %{public}@ on %{public}@", buf, 0x20u);
}

- (void)setExpectedResolutionDays:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315650;
  __int16 v4 = "-[TUIKTStateManager setExpectedResolutionDays:]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%s expectedResolutionDays = %ld on %{public}@", (uint8_t *)&v3, 0x20u);
}

@end