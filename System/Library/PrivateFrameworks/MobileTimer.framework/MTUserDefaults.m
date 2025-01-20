@interface MTUserDefaults
+ (id)_distributedNotificationForLocalNotification:(id)a3;
+ (id)_localNotificationForDistributedNotification:(id)a3;
+ (id)sharedUserDefaults;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 exists:(BOOL *)a4;
- (MTUserDefaults)initWithUserDefaults:(id)a3;
- (NAScheduler)serializer;
- (NSMutableDictionary)observers;
- (NSUserDefaults)userDefaults;
- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4;
- (double)timeIntervalForKey:(id)a3 exists:(BOOL *)a4;
- (double)timeIntervalForKey:(id)a3 isValid:(id)a4 defaultValue:(double)a5;
- (float)floatForKey:(id)a3;
- (float)floatForKey:(id)a3 exists:(BOOL *)a4;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 defaultValue:(id)a4;
- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)integerForKey:(id)a3 exists:(BOOL *)a4;
- (int64_t)integerForKey:(id)a3 isValid:(id)a4 defaultValue:(int64_t)a5;
- (void)_cleanupObserversForNotification:(id)a3;
- (void)_postNotification:(id)a3;
- (void)distributedNotificationPosted:(id)a3;
- (void)registerNotification:(id)a3 observer:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4 notification:(id)a5;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4 notification:(id)a5;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 notification:(id)a5;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 notification:(id)a5;
- (void)setObservers:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setTimeInterval:(double)a3 forKey:(id)a4;
- (void)setTimeInterval:(double)a3 forKey:(id)a4 notification:(id)a5;
- (void)setUserDefaults:(id)a3;
- (void)synchronize;
- (void)unregisterNotification:(id)a3 observer:(id)a4;
@end

@implementation MTUserDefaults

+ (id)sharedUserDefaults
{
  if (sharedUserDefaults_onceToken != -1) {
    dispatch_once(&sharedUserDefaults_onceToken, &__block_literal_global_11_0);
  }
  v2 = (void *)sharedUserDefaults_sharedUserDefaults;
  return v2;
}

- (id)objectForKey:(id)a3 defaultValue:(id)a4
{
  userDefaults = self->_userDefaults;
  id v6 = a4;
  v7 = [(NSUserDefaults *)userDefaults objectForKey:a3];
  v8 = v7;
  if (!v7) {
    v7 = v6;
  }
  id v9 = v7;

  return v9;
}

- (id)objectForKey:(id)a3
{
  return [(MTUserDefaults *)self objectForKey:a3 defaultValue:0];
}

void __48__MTUserDefaults_registerNotification_observer___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  id v7 = v2;
  if (v2)
  {
    [v2 addObject:a1[6]];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v4 = a1[4];
    v5 = [(id)objc_opt_class() _distributedNotificationForLocalNotification:a1[5]];
    [v3 addObserver:v4 selector:sel_distributedNotificationPosted_ name:v5 object:0];

    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [v6 addObject:a1[6]];
    [*(id *)(a1[4] + 24) setObject:v6 forKeyedSubscript:a1[5]];
  }
}

+ (id)_distributedNotificationForLocalNotification:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"Distributed", a3];
}

- (void)registerNotification:(id)a3 observer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = MTLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_debug_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ registering %{public}@ for %{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__MTUserDefaults_registerNotification_observer___block_invoke;
  v12[3] = &unk_1E5915078;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NAScheduler *)serializer performBlock:v12];
}

void __36__MTUserDefaults_sharedUserDefaults__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v0 bundleIdentifier];

  int v1 = [v7 isEqualToString:@"com.apple.mobiletimerd"];
  v2 = [MTUserDefaults alloc];
  if (v1)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobiletimerd"];
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(MTUserDefaults *)v2 initWithUserDefaults:v3];
  id v6 = (void *)sharedUserDefaults_sharedUserDefaults;
  sharedUserDefaults_sharedUserDefaults = v5;
}

- (MTUserDefaults)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTUserDefaults;
  id v6 = [(MTUserDefaults *)&v13 init];
  if (v6)
  {
    id v7 = MTLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MTUserDefaults initWithUserDefaults:]((uint64_t)v6, v7);
    }

    objc_storeStrong((id *)&v6->_userDefaults, a3);
    uint64_t v8 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (NSMutableDictionary *)v8;

    uint64_t v10 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.mobiletimer.MTUserDefaults", +[MTScheduler defaultPriority]);
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v10;
  }
  return v6;
}

- (void)initWithUserDefaults:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19CC95000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ initializing...", (uint8_t *)&v2, 0xCu);
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
}

- (void)setFloat:(float)a3 forKey:(id)a4 notification:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a5;
  id v10 = a4;
  *(float *)&double v11 = a3;
  id v12 = [v8 numberWithFloat:v11];
  [(MTUserDefaults *)self setObject:v12 forKey:v10 notification:v9];
}

- (float)floatForKey:(id)a3
{
  [(MTUserDefaults *)self floatForKey:a3 exists:0];
  return result;
}

- (float)floatForKey:(id)a3 exists:(BOOL *)a4
{
  id v5 = [(MTUserDefaults *)self objectForKey:a3];
  id v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  [v5 floatValue];
  float v8 = v7;

  return v8;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
}

- (void)setBool:(BOOL)a3 forKey:(id)a4 notification:(id)a5
{
  BOOL v6 = a3;
  float v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithBool:v6];
  [(MTUserDefaults *)self setObject:v11 forKey:v10 notification:v9];
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(MTUserDefaults *)self BOOLForKey:a3 exists:0];
}

- (BOOL)BOOLForKey:(id)a3 exists:(BOOL *)a4
{
  id v5 = [(MTUserDefaults *)self objectForKey:a3];
  BOOL v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  char v7 = [v5 BOOLValue];

  return v7;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 notification:(id)a5
{
  float v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithInteger:a3];
  [(MTUserDefaults *)self setObject:v11 forKey:v10 notification:v9];
}

- (int64_t)integerForKey:(id)a3 exists:(BOOL *)a4
{
  id v5 = [(MTUserDefaults *)self objectForKey:a3];
  BOOL v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  int64_t v7 = [v5 integerValue];

  return v7;
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return [(MTUserDefaults *)self integerForKey:a3 isValid:&__block_literal_global_21 defaultValue:a4];
}

uint64_t __45__MTUserDefaults_integerForKey_defaultValue___block_invoke()
{
  return 1;
}

- (int64_t)integerForKey:(id)a3 isValid:(id)a4 defaultValue:(int64_t)a5
{
  float v8 = (uint64_t (**)(id, int64_t))a4;
  char v12 = 0;
  int64_t v9 = [(MTUserDefaults *)self integerForKey:a3 exists:&v12];
  if (!v12 || (int64_t v10 = v9, (v8[2](v8, v9) & 1) == 0)) {
    int64_t v10 = a5;
  }

  return v10;
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4
{
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4 notification:(id)a5
{
  float v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithDouble:a3];
  [(MTUserDefaults *)self setObject:v11 forKey:v10 notification:v9];
}

- (double)timeIntervalForKey:(id)a3 exists:(BOOL *)a4
{
  id v5 = [(MTUserDefaults *)self objectForKey:a3];
  BOOL v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  [v5 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4
{
  [(MTUserDefaults *)self timeIntervalForKey:a3 isValid:&__block_literal_global_23 defaultValue:a4];
  return result;
}

uint64_t __50__MTUserDefaults_timeIntervalForKey_defaultValue___block_invoke()
{
  return 1;
}

- (double)timeIntervalForKey:(id)a3 isValid:(id)a4 defaultValue:(double)a5
{
  double v8 = (uint64_t (**)(void))a4;
  char v12 = 0;
  [(MTUserDefaults *)self timeIntervalForKey:a3 exists:&v12];
  if (!v12 || (double v10 = v9, (v8[2](v8) & 1) == 0)) {
    double v10 = a5;
  }

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)setObject:(id)a3 forKey:(id)a4 notification:(id)a5
{
  userDefaults = self->_userDefaults;
  id v9 = a5;
  [(NSUserDefaults *)userDefaults setObject:a3 forKey:a4];
  [(MTUserDefaults *)self _postNotification:v9];
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeAllObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(NSUserDefaults *)self->_userDefaults dictionaryRepresentation];
  uint64_t v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * v8)) {
          -[MTUserDefaults removeObjectForKey:](self, "removeObjectForKey:");
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_postNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = MTLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(MTUserDefaults *)(uint64_t)self _postNotification:v5];
    }

    uint64_t v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v7 = [(id)objc_opt_class() _distributedNotificationForLocalNotification:v4];
    [v6 postNotificationName:v7 object:0];
  }
}

- (void)distributedNotificationPosted:(id)a3
{
  id v4 = [a3 name];
  uint64_t v5 = [(id)objc_opt_class() _localNotificationForDistributedNotification:v4];
  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MTUserDefaults_distributedNotificationPosted___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(NAScheduler *)serializer performBlock:v8];
}

void __48__MTUserDefaults_distributedNotificationPosted___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _cleanupObserversForNotification:*(void *)(a1 + 40)];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector())
        {
          id v7 = [v6 notificationObject];
        }
        else
        {
          id v7 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          [v6 notificationCenter];
        }
        else {
        uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        }
        id v9 = MTLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          uint64_t v14 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v25 = v13;
          __int16 v26 = 2114;
          uint64_t v27 = v14;
          __int16 v28 = 2114;
          v29 = v7;
          _os_log_debug_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ posting %{public}@ for %{public}@", buf, 0x20u);
        }

        long long v10 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__MTUserDefaults_distributedNotificationPosted___block_invoke_34;
        v16[3] = &unk_1E5915078;
        id v17 = v8;
        id v18 = *(id *)(a1 + 40);
        id v19 = v7;
        id v11 = v7;
        id v12 = v8;
        [v10 performBlock:v16];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v3);
  }
}

uint64_t __48__MTUserDefaults_distributedNotificationPosted___block_invoke_34(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationName:*(void *)(a1 + 40) object:*(void *)(a1 + 48)];
}

- (void)unregisterNotification:(id)a3 observer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_debug_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ unregistering %{public}@ for %{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__MTUserDefaults_unregisterNotification_observer___block_invoke;
  v12[3] = &unk_1E5915078;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NAScheduler *)serializer performBlock:v12];
}

void __50__MTUserDefaults_unregisterNotification_observer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 removeObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _cleanupObserversForNotification:*(void *)(a1 + 40)];
}

- (void)_cleanupObserversForNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v11 = v4;
    id v6 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v4];
    id v7 = [v6 allObjects];
    uint64_t v8 = [v7 count];

    id v5 = v11;
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
      id v10 = [(id)objc_opt_class() _distributedNotificationForLocalNotification:v11];
      [v9 removeObserver:self name:v10 object:0];

      id v4 = (id)[(NSMutableDictionary *)self->_observers removeObjectForKey:v11];
      id v5 = v11;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

+ (id)_localNotificationForDistributedNotification:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"Distributed"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"Distributed", "length")];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)synchronize
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

- (void)_postNotification:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19CC95000, log, OS_LOG_TYPE_DEBUG, "%{public}@ broadcasting %{public}@", (uint8_t *)&v3, 0x16u);
}

@end