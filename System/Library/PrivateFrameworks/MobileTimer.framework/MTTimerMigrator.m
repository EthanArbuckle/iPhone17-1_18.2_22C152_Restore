@interface MTTimerMigrator
- (MTTimer)timer;
- (void)migrateFromOldStorage;
- (void)removeFromOldStorage;
- (void)setTimer:(id)a3;
@end

@implementation MTTimerMigrator

- (void)migrateFromOldStorage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = MTIsHorseman();
  v4 = MTLogForCategory(4);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping migration from old storage, as this device doesn't support the old storage", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating old timers to storage", (uint8_t *)&v14, 0xCu);
    }

    v6 = +[MTLegacyManager sharedManager];
    [v6 loadLegacyData];

    v7 = +[MTLegacyManager sharedManager];
    [v7 defaultDuration];
    double v9 = v8;

    +[MTTimerManager setDefaultDuration:v9];
    v10 = [(MTTimer *)[MTMutableTimer alloc] initWithState:1 duration:v9];
    [(MTTimer *)v10 setTitle:@"CURRENT_TIMER"];
    v11 = +[MTLegacyManager sharedManager];
    v4 = [v11 defaultSound];

    v12 = +[MTSound toneSoundWithIdentifier:v4 vibrationIdentifer:0 volume:0];
    [(MTTimer *)v10 setSound:v12];

    timer = self->_timer;
    self->_timer = &v10->super;
  }
}

- (void)removeFromOldStorage
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing old timers and notifications from storage", (uint8_t *)&v5, 0xCu);
  }

  v4 = +[MTLegacyManager sharedManager];
  [v4 purgeLegacyData];
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end