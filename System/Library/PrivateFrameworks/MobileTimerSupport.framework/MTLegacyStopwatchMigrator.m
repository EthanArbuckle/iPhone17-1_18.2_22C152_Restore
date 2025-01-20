@interface MTLegacyStopwatchMigrator
- (BOOL)isTimerRunning;
- (BOOL)needsMigration;
- (MTLegacyStopwatchMigrator)initWithDefaults:(id)a3 manager:(id)a4;
- (MTStopwatchManagerProtocol)manager;
- (NSUserDefaults)defaults;
- (double)currentInterval;
- (id)generateStopwatchFromDefaults;
- (id)migrateLegacyStopwatch;
- (void)eraseLocalDefaults;
- (void)loadInitialState;
- (void)setCurrentInterval:(double)a3;
- (void)setDefaults:(id)a3;
- (void)setIsTimerRunning:(BOOL)a3;
- (void)setManager:(id)a3;
@end

@implementation MTLegacyStopwatchMigrator

- (MTLegacyStopwatchMigrator)initWithDefaults:(id)a3 manager:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTLegacyStopwatchMigrator;
  v8 = [(MTLegacyStopwatchMigrator *)&v11 init];
  if (v8)
  {
    v9 = MTLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1BE27A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    [(MTLegacyStopwatchMigrator *)v8 setDefaults:v6];
    [(MTLegacyStopwatchMigrator *)v8 setManager:v7];
    [(MTLegacyStopwatchMigrator *)v8 loadInitialState];
  }

  return v8;
}

- (void)setManager:(id)a3
{
}

- (void)setDefaults:(id)a3
{
}

- (void)loadInitialState
{
  v3 = [(MTLegacyStopwatchMigrator *)self defaults];
  -[MTLegacyStopwatchMigrator setIsTimerRunning:](self, "setIsTimerRunning:", [v3 BOOLForKey:@"TIMERRUNNING"]);

  id v5 = [(MTLegacyStopwatchMigrator *)self defaults];
  v4 = [v5 objectForKey:@"LASTTIME"];
  [v4 doubleValue];
  -[MTLegacyStopwatchMigrator setCurrentInterval:](self, "setCurrentInterval:");
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setIsTimerRunning:(BOOL)a3
{
  self->_isTimerRunning = a3;
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
}

- (id)migrateLegacyStopwatch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = self;
    _os_log_impl(&dword_1BE27A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating legacy stopwatch", buf, 0xCu);
  }

  v4 = [(MTLegacyStopwatchMigrator *)self generateStopwatchFromDefaults];
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1BE27A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ generated stopwatch from previous defaults: %{public}@", buf, 0x16u);
  }

  id v6 = [(MTLegacyStopwatchMigrator *)self manager];
  id v7 = [v6 getStopwatches];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke;
  v11[3] = &unk_1E637CBC0;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  v9 = [v7 flatMap:v11];

  return v9;
}

id __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [a2 firstObject];
  v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    __int16 v15 = v3;
    _os_log_impl(&dword_1BE27A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved default stopwatch: %{public}@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 32) manager];
  id v7 = [v6 createStopwatch:*(void *)(a1 + 40)];

  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke_16;
    v10[3] = &unk_1E637CB98;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    id v8 = [v7 flatMap:v10];
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

id __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke_16(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE27A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ created stopwatch from previous defaults, proceeding to delete default one", (uint8_t *)&v7, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) manager];
  uint64_t v5 = [v4 removeStopwatch:*(void *)(a1 + 40)];

  return v5;
}

- (BOOL)needsMigration
{
  if ([(MTLegacyStopwatchMigrator *)self isTimerRunning]) {
    return 1;
  }
  [(MTLegacyStopwatchMigrator *)self currentInterval];
  return v4 > 0.0;
}

- (id)generateStopwatchFromDefaults
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v4 = [(MTLegacyStopwatchMigrator *)self defaults];
  uint64_t v5 = [v4 objectForKey:@"LAPS"];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v3 addObject:v11];
        [v11 doubleValue];
        double v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  uint64_t v13 = [(MTLegacyStopwatchMigrator *)self defaults];
  __int16 v14 = [v13 objectForKey:@"OFFSET"];
  [v14 doubleValue];
  double v16 = v15;

  uint64_t v17 = [(MTLegacyStopwatchMigrator *)self defaults];
  v18 = [v17 objectForKey:@"STARTTIME"];

  v19 = objc_opt_new();
  v20 = (void *)[v19 mutableCopy];

  [v20 setStartDate:v18];
  [v20 setOffset:v16];
  [(MTLegacyStopwatchMigrator *)self currentInterval];
  objc_msgSend(v20, "setCurrentInterval:");
  [v20 setPreviousLapsTotalInterval:v9];
  [v20 setLaps:v3];
  [v20 setState:0];
  if ([(MTLegacyStopwatchMigrator *)self isTimerRunning])
  {
    uint64_t v21 = 2;
  }
  else
  {
    [(MTLegacyStopwatchMigrator *)self currentInterval];
    if (v22 <= 0.0) {
      goto LABEL_15;
    }
    uint64_t v21 = 1;
  }
  [v20 setState:v21];
LABEL_15:

  return v20;
}

- (void)eraseLocalDefaults
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1BE27A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ erasing local defaults", (uint8_t *)&v9, 0xCu);
  }

  double v4 = [(MTLegacyStopwatchMigrator *)self defaults];
  [v4 removeObjectForKey:@"TIMERRUNNING"];

  uint64_t v5 = [(MTLegacyStopwatchMigrator *)self defaults];
  [v5 removeObjectForKey:@"LASTTIME"];

  uint64_t v6 = [(MTLegacyStopwatchMigrator *)self defaults];
  [v6 removeObjectForKey:@"LAPS"];

  uint64_t v7 = [(MTLegacyStopwatchMigrator *)self defaults];
  [v7 removeObjectForKey:@"OFFSET"];

  uint64_t v8 = [(MTLegacyStopwatchMigrator *)self defaults];
  [v8 removeObjectForKey:@"STARTTIME"];
}

- (MTStopwatchManagerProtocol)manager
{
  return self->_manager;
}

- (BOOL)isTimerRunning
{
  return self->_isTimerRunning;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end