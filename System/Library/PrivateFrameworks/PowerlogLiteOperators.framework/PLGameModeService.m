@interface PLGameModeService
+ (void)load;
- (BOOL)previousGameModeState;
- (PLCFNotificationOperatorComposition)consoleModeListener;
- (PLGameModeService)init;
- (void)initOperatorDependancies;
- (void)postGameModeStatusChangeNotification:(id)a3;
- (void)setConsoleModeListener:(id)a3;
- (void)setPreviousGameModeState:(BOOL)a3;
- (void)updateGameMode;
@end

@implementation PLGameModeService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLGameModeService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLGameModeService)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLGameModeService;
  result = [(PLOperator *)&v3 init];
  result->_previousGameModeState = 0;
  return result;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
  v4 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PLGameModeService_initOperatorDependancies__block_invoke;
  v7[3] = &unk_1E692A0F0;
  v7[4] = self;
  v5 = (PLCFNotificationOperatorComposition *)[v3 initWithWorkQueue:v4 forNotification:@"com.apple.system.console_mode_changed" requireState:1 withBlock:v7];
  consoleModeListener = self->_consoleModeListener;
  self->_consoleModeListener = v5;
}

uint64_t __45__PLGameModeService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogGameMode();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Received notifiction for Console Mode change", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateGameMode];
}

- (void)updateGameMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  id v3 = [(PLGameModeService *)self consoleModeListener];
  uint32_t state = notify_get_state([v3 stateToken], &state64);

  if (state)
  {
    v5 = PLLogGameMode();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Console Mode state Unavailable", buf, 2u);
    }
LABEL_10:

    return;
  }
  uint64_t v6 = state64;
  v7 = PLLogGameMode();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v6 != 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Console Mode state: %d", buf, 8u);
  }

  if ((v6 != 0) != [(PLGameModeService *)self previousGameModeState])
  {
    [(PLGameModeService *)self setPreviousGameModeState:v6 != 0];
    v8 = PLLogGameMode();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v10 = [(PLGameModeService *)self previousGameModeState];
      *(_DWORD *)buf = 67109120;
      BOOL v15 = v10;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "self.previousGameModeState: %d", buf, 8u);
    }

    v12 = @"gameMode";
    v5 = [NSNumber numberWithBool:v6 != 0];
    v13 = v5;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(PLGameModeService *)self postGameModeStatusChangeNotification:v9];

    goto LABEL_10;
  }
}

- (void)postGameModeStatusChangeNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogGameMode();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"gameMode"];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "Sent game mode notification to submodules: %@", (uint8_t *)&v7, 0xCu);
  }
  [MEMORY[0x1E4F92A88] postNotificationName:@"PLGameModeNotification" object:self userInfo:v4];
}

- (PLCFNotificationOperatorComposition)consoleModeListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConsoleModeListener:(id)a3
{
}

- (BOOL)previousGameModeState
{
  return self->_previousGameModeState;
}

- (void)setPreviousGameModeState:(BOOL)a3
{
  self->_previousGameModeState = a3;
}

- (void).cxx_destruct
{
}

@end