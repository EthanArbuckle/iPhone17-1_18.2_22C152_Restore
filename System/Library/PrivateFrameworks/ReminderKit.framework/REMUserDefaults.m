@interface REMUserDefaults
+ (REMDaemonUserDefaults)daemonUserDefaults;
- (BOOL)showRemindersAsOverdue_cached;
- (NSMutableDictionary)observers;
- (NSString)suiteName;
- (NSUserDefaults)userDefaults;
- (REMUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4;
- (id)_addObserverForKey:(id)a3 block:(id)a4;
- (id)_startObservingValuesForKey:(id)a3 block:(id)a4;
- (id)_startStreamingValuesForKey:(id)a3 block:(id)a4;
- (void)_removeObserver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setShowRemindersAsOverdue_cached:(BOOL)a3;
@end

@implementation REMUserDefaults

uint64_t __37__REMUserDefaults_daemonUserDefaults__block_invoke()
{
  daemonUserDefaults_defaults = [[REMDaemonUserDefaults alloc] initWithSuiteName:@"com.apple.remindd" containerURL:0];

  return MEMORY[0x1F41817F8]();
}

- (void)setShowRemindersAsOverdue_cached:(BOOL)a3
{
  self->_showRemindersAsOverdue_cached = a3;
}

- (REMUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)REMUserDefaults;
  v8 = [(REMUserDefaults *)&v29 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    suiteName = v8->_suiteName;
    v8->_suiteName = (NSString *)v9;

    if (v7)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:v8->_suiteName container:v7];
      userDefaults = v8->_userDefaults;
      v8->_userDefaults = (NSUserDefaults *)v11;

      v13 = +[REMLog utility];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v8->_suiteName;
        *(_DWORD *)buf = 138412546;
        v31 = v14;
        __int16 v32 = 2112;
        id v33 = v7;
        v15 = "REMUserDefaults created {suiteName: %@, container: %@}";
        v16 = v13;
        uint32_t v17 = 22;
LABEL_10:
        _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      }
    }
    else
    {
      v18 = [MEMORY[0x1E4F28B50] mainBundle];
      v19 = [v18 bundleIdentifier];
      int v20 = [v19 isEqualToString:v8->_suiteName];

      if (v20)
      {
        uint64_t v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        v22 = v8->_userDefaults;
        v8->_userDefaults = (NSUserDefaults *)v21;

        v13 = +[REMLog utility];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v15 = "REMUserDefaults created {standardUserDefaults: true}";
          v16 = v13;
          uint32_t v17 = 2;
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v8->_suiteName];
        v24 = v8->_userDefaults;
        v8->_userDefaults = (NSUserDefaults *)v23;

        v13 = +[REMLog utility];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v25 = v8->_suiteName;
          *(_DWORD *)buf = 138412290;
          v31 = v25;
          v15 = "REMUserDefaults created {suiteName: %@}";
          v16 = v13;
          uint32_t v17 = 12;
          goto LABEL_10;
        }
      }
    }

    uint64_t v26 = objc_opt_new();
    observers = v8->_observers;
    v8->_observers = (NSMutableDictionary *)v26;
  }
  return v8;
}

+ (REMDaemonUserDefaults)daemonUserDefaults
{
  if (daemonUserDefaults_onceToken != -1) {
    dispatch_once(&daemonUserDefaults_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)daemonUserDefaults_defaults;

  return (REMDaemonUserDefaults *)v2;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (id)_startObservingValuesForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = [(REMUserDefaults *)self _addObserverForKey:v6 block:a4];
  v8 = [(REMUserDefaults *)self userDefaults];
  [v8 addObserver:self forKeyPath:v6 options:0 context:0];

  return v7;
}

- (id)_startStreamingValuesForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = [(REMUserDefaults *)self _addObserverForKey:v6 block:a4];
  v8 = [(REMUserDefaults *)self userDefaults];
  [v8 addObserver:self forKeyPath:v6 options:4 context:0];

  return v7;
}

- (id)_addObserverForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(REMUserDefaults *)self observers];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:8];
    v10 = [(REMUserDefaults *)self observers];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  uint64_t v11 = [[REMUserDefaultsObserver alloc] initWithUserDefaults:self key:v6 block:v7];

  [v9 addObject:v11];

  return v11;
}

- (void)_removeObserver:(id)a3
{
  id v9 = a3;
  v4 = [v9 userDefaultsKey];
  v5 = [(REMUserDefaults *)self observers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 removeObject:v9];
    if (![v6 count])
    {
      id v7 = [(REMUserDefaults *)self observers];
      [v7 removeObjectForKey:v4];

      v8 = [(REMUserDefaults *)self userDefaults];
      [v8 removeObserver:self forKeyPath:v4];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[REMLog utility];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[REMUserDefaults observeValueForKeyPath:ofObject:change:context:]((uint64_t)v8, v10);
  }

  id v11 = [(REMUserDefaults *)self userDefaults];

  if (v11 == v9)
  {
    v12 = [(REMUserDefaults *)self observers];
    v13 = [v12 objectForKeyedSubscript:v8];

    if ([v13 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "block", (void)v20);
            v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v19[2]();

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
    }
  }
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (BOOL)showRemindersAsOverdue_cached
{
  return self->_showRemindersAsOverdue_cached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_suiteName, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_DEBUG, "REMUserDefaults KVO change observed {userDefaultsKey: %@}", (uint8_t *)&v2, 0xCu);
}

@end