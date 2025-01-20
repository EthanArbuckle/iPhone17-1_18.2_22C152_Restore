@interface TILanguageModelMaintainer
+ (id)sharedLanguageModelMaintainer;
- (BOOL)isMaintenanceDue;
- (NSDate)nextEligibleMaintenanceDate;
- (NSTimer)dynamicLearningCacheTimer;
- (TILanguageModelMaintainer)init;
- (void)dealloc;
- (void)dynamicLearningCacheTimerFired:(id)a3;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)performMaintenanceIfNecessary;
- (void)setDynamicLearningCacheTimer:(id)a3;
- (void)setNextEligibleMaintenanceDate:(id)a3;
- (void)touchDynamicLearningCacheTimer;
@end

@implementation TILanguageModelMaintainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicLearningCacheTimer, 0);

  objc_storeStrong((id *)&self->_nextEligibleMaintenanceDate, 0);
}

- (void)setDynamicLearningCacheTimer:(id)a3
{
}

- (NSTimer)dynamicLearningCacheTimer
{
  return self->_dynamicLearningCacheTimer;
}

- (void)setNextEligibleMaintenanceDate:(id)a3
{
}

- (NSDate)nextEligibleMaintenanceDate
{
  return self->_nextEligibleMaintenanceDate;
}

- (void)dynamicLearningCacheTimerFired:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[TILanguageModelMaintainer dynamicLearningCacheTimerFired:]";
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Clearing dynamic learning caches", (uint8_t *)&v3, 0xCu);
  }
  +[TILanguageModelLoaderManager clearDynamicLearningCaches];
}

- (void)performMaintenanceIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(TILanguageModelMaintainer *)self isMaintenanceDue])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      int v3 = TIOSLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%s Perform language model maintenance", "-[TILanguageModelMaintainer performMaintenanceIfNecessary]");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1800.0];
    [(TILanguageModelMaintainer *)self setNextEligibleMaintenanceDate:v4];

    +[TILanguageModelLoaderManager performMaintenance];
    if (_os_feature_enabled_impl())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[TILanguageModelMaintainer performMaintenanceIfNecessary]";
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Performing transient lexicon maintenance (reloading named entities)", buf, 0xCu);
      }
      uint64_t v5 = +[TITransientLexiconManager sharedInstance];
      [v5 performMaintenance];

      v6 = +[TIKeyboardInputManagerLoader sharedLoader];
      [v6 releaseAllLanguageModelBuffers];

      v7 = +[TIKeyboardInputManagerLoader sharedLoader];
      [v7 releaseAllInputManagers];
    }
    v8 = [MEMORY[0x1E4F962A8] sharedManager];
    [v8 flushDynamicData];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"TILanguageModelPerformBackgroundMaintenanceNotification" object:0];
  }
}

- (BOOL)isMaintenanceDue
{
  int v3 = [(TILanguageModelMaintainer *)self nextEligibleMaintenanceDate];
  if (v3)
  {
    v4 = [(TILanguageModelMaintainer *)self nextEligibleMaintenanceDate];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v6 = [v4 compare:v5] == -1;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)touchDynamicLearningCacheTimer
{
  int v3 = [(TILanguageModelMaintainer *)self dynamicLearningCacheTimer];
  int v4 = [v3 isValid];

  if (v4)
  {
    id v6 = [(TILanguageModelMaintainer *)self dynamicLearningCacheTimer];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:900.0];
    [v6 setFireDate:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_dynamicLearningCacheTimerFired_ selector:0 userInfo:0 repeats:900.0];
    -[TILanguageModelMaintainer setDynamicLearningCacheTimer:](self, "setDynamicLearningCacheTimer:");
  }
}

- (void)keyboardActivityDidTransition:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 toState];
  switch(v4)
  {
    case 3:
      [(TILanguageModelMaintainer *)self performMaintenanceIfNecessary];
      break;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "-[TILanguageModelMaintainer keyboardActivityDidTransition:]";
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Setting dynamic learning cache timer", (uint8_t *)&v6, 0xCu);
      }
      [(TILanguageModelMaintainer *)self touchDynamicLearningCacheTimer];
      break;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "-[TILanguageModelMaintainer keyboardActivityDidTransition:]";
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Invalidating dynamic learning cache timer", (uint8_t *)&v6, 0xCu);
      }
      uint64_t v5 = [(TILanguageModelMaintainer *)self dynamicLearningCacheTimer];
      [v5 invalidate];

      break;
  }
}

- (TILanguageModelMaintainer)init
{
  v7.receiver = self;
  v7.super_class = (Class)TILanguageModelMaintainer;
  v2 = [(TILanguageModelMaintainer *)&v7 init];
  if (v2)
  {
    int v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    nextEligibleMaintenanceDate = v2->_nextEligibleMaintenanceDate;
    v2->_nextEligibleMaintenanceDate = v3;

    uint64_t v5 = +[TIKeyboardActivityController sharedController];
    [v5 addActivityObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  int v3 = +[TIKeyboardActivityController sharedController];
  [v3 removeActivityObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TILanguageModelMaintainer;
  [(TILanguageModelMaintainer *)&v4 dealloc];
}

+ (id)sharedLanguageModelMaintainer
{
  if (sharedLanguageModelMaintainer_onceToken != -1) {
    dispatch_once(&sharedLanguageModelMaintainer_onceToken, &__block_literal_global_19274);
  }
  v2 = (void *)sharedLanguageModelMaintainer___sharedInstance;

  return v2;
}

uint64_t __58__TILanguageModelMaintainer_sharedLanguageModelMaintainer__block_invoke()
{
  v0 = objc_alloc_init(TILanguageModelMaintainer);
  uint64_t v1 = sharedLanguageModelMaintainer___sharedInstance;
  sharedLanguageModelMaintainer___sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end