@interface MTTimerDurationManager
+ (double)intervalWithMinutes:(unint64_t)a3;
+ (id)defaultDurations;
+ (id)durationFromTimer:(id)a3;
+ (id)durationWithMinutes:(unint64_t)a3;
- (MTDurationUpdateDelegate)updateDelegate;
- (MTPersistence)persistence;
- (MTTimerDuration)_latestDuration;
- (MTTimerDurationManager)initWithPersistence:(id)a3;
- (MTTimerDurationManager)initWithPersistence:(id)a3 storage:(id)a4;
- (NSMutableArray)_favoriteDurations;
- (NSMutableArray)_recentDurations;
- (id)favoriteDurations;
- (id)latestDuration;
- (id)recentDurations;
- (id)restoreDurationWithKey:(id)a3;
- (id)restoreDurationsWithKey:(id)a3;
- (void)addDuration:(id)a3 toCollection:(id)a4 withKey:(id)a5 limit:(unint64_t)a6;
- (void)addFavoriteDuration:(id)a3;
- (void)addRecentDuration:(id)a3;
- (void)clearAllDurations;
- (void)removeDuration:(id)a3 fromCollection:(id)a4 withKey:(id)a5;
- (void)removeFavoriteDuration:(id)a3;
- (void)removeRecentDuration:(id)a3;
- (void)saveLatestDuration:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)set_favoriteDurations:(id)a3;
- (void)set_latestDuration:(id)a3;
- (void)set_recentDurations:(id)a3;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5;
- (void)synchronizeCollection:(id)a3 withKey:(id)a4;
- (void)syncrhonizeObject:(id)a3 withKey:(id)a4;
@end

@implementation MTTimerDurationManager

- (id)recentDurations
{
  v2 = [(MTTimerDurationManager *)self _recentDurations];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)latestDuration
{
  v2 = [(MTTimerDurationManager *)self _latestDuration];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() durationWithMinutes:15];
  }
  v5 = v4;

  return v5;
}

- (id)favoriteDurations
{
  v2 = [(MTTimerDurationManager *)self _favoriteDurations];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSMutableArray)_recentDurations
{
  return self->__recentDurations;
}

- (MTTimerDuration)_latestDuration
{
  return self->__latestDuration;
}

- (NSMutableArray)_favoriteDurations
{
  return self->__favoriteDurations;
}

+ (id)defaultDurations
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v3 = [a1 durationWithMinutes:1];
  v13[0] = v3;
  id v4 = [a1 durationWithMinutes:3];
  v13[1] = v4;
  v5 = [a1 durationWithMinutes:5];
  v13[2] = v5;
  v6 = [a1 durationWithMinutes:10];
  v13[3] = v6;
  v7 = [a1 durationWithMinutes:15];
  v13[4] = v7;
  v8 = [a1 durationWithMinutes:30];
  v13[5] = v8;
  v9 = [a1 durationWithMinutes:60];
  v13[6] = v9;
  v10 = [a1 durationWithMinutes:120];
  v13[7] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];

  return v11;
}

+ (id)durationWithMinutes:(unint64_t)a3
{
  v5 = [MTTimerDuration alloc];
  [a1 intervalWithMinutes:a3];
  v6 = -[MTTimerDuration initWithTitle:duration:](v5, "initWithTitle:duration:", 0);
  return v6;
}

+ (double)intervalWithMinutes:(unint64_t)a3
{
  return (double)a3 * 60.0;
}

- (MTTimerDurationManager)initWithPersistence:(id)a3 storage:(id)a4
{
  id v6 = a4;
  v7 = [(MTTimerDurationManager *)self initWithPersistence:a3];
  if (v7) {
    [v6 registerObserver:v7];
  }

  return v7;
}

- (MTTimerDurationManager)initWithPersistence:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTTimerDurationManager;
  v5 = [(MTTimerDurationManager *)&v13 init];
  if (v5)
  {
    id v6 = MTLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initWithPersistence", buf, 0xCu);
    }

    [(MTTimerDurationManager *)v5 setPersistence:v4];
    v7 = [(MTTimerDurationManager *)v5 restoreDurationsWithKey:@"kMTTimerDurationRecents"];
    v8 = (void *)[v7 mutableCopy];
    [(MTTimerDurationManager *)v5 set_recentDurations:v8];

    v9 = [(MTTimerDurationManager *)v5 restoreDurationsWithKey:@"kMTTimerDurationFavorites"];
    v10 = (void *)[v9 mutableCopy];
    [(MTTimerDurationManager *)v5 set_favoriteDurations:v10];

    v11 = [(MTTimerDurationManager *)v5 restoreDurationWithKey:@"kMTTimerDurationLatest"];
    [(MTTimerDurationManager *)v5 set_latestDuration:v11];
  }
  return v5;
}

- (void)addRecentDuration:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerDurationManager *)self _recentDurations];
  [(MTTimerDurationManager *)self addDuration:v4 toCollection:v5 withKey:@"kMTTimerDurationRecents" limit:20];

  id v8 = [(MTTimerDurationManager *)self updateDelegate];
  id v6 = [(MTTimerDurationManager *)self _recentDurations];
  v7 = (void *)[v6 copy];
  [v8 recentTimerDurationsDidUpdate:v7];
}

- (void)removeRecentDuration:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerDurationManager *)self _recentDurations];
  [(MTTimerDurationManager *)self removeDuration:v4 fromCollection:v5 withKey:@"kMTTimerDurationRecents"];

  id v8 = [(MTTimerDurationManager *)self updateDelegate];
  id v6 = [(MTTimerDurationManager *)self _recentDurations];
  v7 = (void *)[v6 copy];
  [v8 recentTimerDurationsDidUpdate:v7];
}

- (void)addDuration:(id)a3 toCollection:(id)a4 withKey:(id)a5 limit:(unint64_t)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v10 containsObject:v12] & 1) == 0)
  {
    if ([v10 count] >= a6) {
      objc_msgSend(v10, "removeObjectsInRange:", 0, objc_msgSend(v10, "count") - a6 + 1);
    }
    [v10 addObject:v12];
  }
  [(MTTimerDurationManager *)self synchronizeCollection:v10 withKey:v11];
}

- (void)removeDuration:(id)a3 fromCollection:(id)a4 withKey:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 containsObject:v10]) {
    [v8 removeObject:v10];
  }
  [(MTTimerDurationManager *)self synchronizeCollection:v8 withKey:v9];
}

- (id)restoreDurationsWithKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring timer durations", buf, 0xCu);
  }

  id v6 = [(MTTimerDurationManager *)self persistence];
  v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v15 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v7 error:&v15];
    id v9 = v15;
    if (v9)
    {
      id v10 = MTLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v17 = self;
        __int16 v18 = 2114;
        v19 = v4;
        __int16 v20 = 2114;
        v21 = v9;
        _os_log_error_impl(&dword_19CC95000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error decoding durations with key: %{public}@, %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = MTLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no recent timer durations restored", buf, 0xCu);
    }
    id v8 = 0;
  }

  id v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ restored durations: %{public}@ with key: %{public}@", buf, 0x20u);
  }

  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = objc_opt_new();
  }
  objc_super v13 = v12;

  return v13;
}

- (void)synchronizeCollection:(id)a3 withKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing timer durations with key: %{public}@", buf, 0x16u);
  }

  id v14 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];

  id v10 = v14;
  if (v10)
  {
    id v11 = MTLogForCategory(8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MTTimerDurationManager synchronizeCollection:withKey:]((uint64_t)self, (uint64_t)v10, v11);
    }
  }
  else
  {
    id v12 = MTLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized recent durations successfully", buf, 0xCu);
    }

    objc_super v13 = [(MTTimerDurationManager *)self persistence];
    [v13 setObject:v9 forKey:v6];

    id v11 = [(MTTimerDurationManager *)self persistence];
    [v11 synchronize];
  }
}

- (id)restoreDurationWithKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring timer duration with key: %{public}@ ", buf, 0x16u);
  }

  id v6 = [(MTTimerDurationManager *)self persistence];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v13 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v13];
    id v9 = v13;
    if (v9)
    {
      id v10 = MTLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v15 = self;
        __int16 v16 = 2114;
        __int16 v17 = v4;
        __int16 v18 = 2114;
        uint64_t v19 = v9;
        _os_log_error_impl(&dword_19CC95000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error decoding duration with key: %{public}@, %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = MTLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v4;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no timer duration restored with key: %{public}@", buf, 0x16u);
    }
    id v8 = 0;
  }

  id v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v4;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ restored duration: %{public}@ with key: %{public}@", buf, 0x20u);
  }

  return v8;
}

- (void)syncrhonizeObject:(id)a3 withKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing timer duration with key: %{public}@", buf, 0x16u);
  }

  id v14 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];

  id v10 = v14;
  if (v10)
  {
    id v11 = MTLogForCategory(8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_19CC95000, v11, OS_LOG_TYPE_ERROR, "%{public}@ error encoding duration with key: %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v12 = MTLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized duration with key: %{public}@  successfully", buf, 0x16u);
    }

    id v13 = [(MTTimerDurationManager *)self persistence];
    [v13 setObject:v9 forKey:v6];

    id v11 = [(MTTimerDurationManager *)self persistence];
    [v11 synchronize];
  }
}

- (void)clearAllDurations
{
  v3 = [(MTTimerDurationManager *)self _recentDurations];
  [v3 removeAllObjects];

  id v4 = [(MTTimerDurationManager *)self persistence];
  [v4 removeObjectForKey:@"kMTTimerDurationRecents"];

  v5 = [(MTTimerDurationManager *)self persistence];
  [v5 removeObjectForKey:@"kMTTimerDurationFavorites"];

  id v6 = [(MTTimerDurationManager *)self persistence];
  [v6 removeObjectForKey:@"kMTTimerDurationLatest"];

  id v7 = [(MTTimerDurationManager *)self persistence];
  [v7 synchronize];
}

- (void)addFavoriteDuration:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerDurationManager *)self _favoriteDurations];
  [(MTTimerDurationManager *)self addDuration:v4 toCollection:v5 withKey:@"kMTTimerDurationFavorites" limit:20];

  id v8 = [(MTTimerDurationManager *)self updateDelegate];
  id v6 = [(MTTimerDurationManager *)self _favoriteDurations];
  id v7 = (void *)[v6 copy];
  [v8 favoriteTimerDurationsDidUpdate:v7];
}

- (void)removeFavoriteDuration:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerDurationManager *)self _favoriteDurations];
  [(MTTimerDurationManager *)self removeDuration:v4 fromCollection:v5 withKey:@"kMTTimerDurationFavorites"];

  id v8 = [(MTTimerDurationManager *)self updateDelegate];
  id v6 = [(MTTimerDurationManager *)self _favoriteDurations];
  id v7 = (void *)[v6 copy];
  [v8 favoriteTimerDurationsDidUpdate:v7];
}

- (void)saveLatestDuration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MTTimerDurationManager *)self set_latestDuration:v4];
  [(MTTimerDurationManager *)self syncrhonizeObject:v4 withKey:@"kMTTimerDurationLatest"];
  v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MTTimerDurationManager *)self updateDelegate];
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ saved latest duration, calling update delegate %{public}@ with duration: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [(MTTimerDurationManager *)self updateDelegate];
  id v8 = (void *)[v4 copy];
  [v7 latestTimerDurationDidUpdate:v8];
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didAddTimers %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [v5 firstObject];
  if ([v7 state] == 3)
  {
    id v8 = [(id)objc_opt_class() durationFromTimer:v7];
    [(MTTimerDurationManager *)self saveLatestDuration:v8];
    [(MTTimerDurationManager *)self addRecentDuration:v8];
  }
}

- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  int v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateTimers fromTimers: %{public}@ toTimers: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  id v10 = [v8 firstObject];
  uint64_t v11 = [v7 firstObject];
  id v12 = (void *)v11;
  if (v10 && v11 && [v10 state] != 3 && objc_msgSend(v12, "state") == 3)
  {
    uint64_t v13 = [(id)objc_opt_class() durationFromTimer:v12];
    [(MTTimerDurationManager *)self saveLatestDuration:v13];
    [(MTTimerDurationManager *)self addRecentDuration:v13];
  }
}

+ (id)durationFromTimer:(id)a3
{
  id v3 = a3;
  id v4 = [MTTimerDuration alloc];
  char v5 = [v3 isCurrentTimer];
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 title];
  }
  [v3 duration];
  double v8 = v7;
  int v9 = [v3 sound];
  id v10 = [(MTTimerDuration *)v4 initWithTitle:v6 duration:v9 sound:v8];

  if ((v5 & 1) == 0) {
  return v10;
  }
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void)set_recentDurations:(id)a3
{
}

- (void)set_favoriteDurations:(id)a3
{
}

- (void)set_latestDuration:(id)a3
{
}

- (MTDurationUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (MTDurationUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->__latestDuration, 0);
  objc_storeStrong((id *)&self->__favoriteDurations, 0);
  objc_storeStrong((id *)&self->__recentDurations, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)synchronizeCollection:(os_log_t)log withKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ error encoding durations: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end