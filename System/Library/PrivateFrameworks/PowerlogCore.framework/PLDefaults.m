@interface PLDefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (BOOL)BOOLForKey:(id)a3 ifNotSet:(BOOL)a4;
+ (BOOL)debugEnabled;
+ (BOOL)eplEnabled;
+ (BOOL)fullMode;
+ (BOOL)fullModeForClass:(Class)a3;
+ (BOOL)fullPLLog;
+ (BOOL)isClassDebugEnabled:(Class)a3;
+ (BOOL)isClassDebugEnabled:(Class)a3 forKey:(id)a4;
+ (BOOL)isClassNameDebugEnabled:(id)a3;
+ (BOOL)isClassNameDebugEnabled:(id)a3 forKey:(id)a4;
+ (BOOL)isDevBoard;
+ (BOOL)isModelTrigger;
+ (BOOL)isModelingDebugEnabled;
+ (BOOL)isTaskFullEPLMode;
+ (BOOL)liteMode;
+ (BOOL)objectExistsForKey:(id)a3;
+ (BOOL)oldFullMode;
+ (BOOL)taskMode;
+ (double)doubleForKey:(id)a3;
+ (double)doubleForKey:(id)a3 ifNotSet:(double)a4;
+ (id)allDefaultsEnabled;
+ (id)applicationID;
+ (id)objectForKey:(id)a3;
+ (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5;
+ (id)objectForKey:(id)a3 ifNotSet:(id)a4;
+ (id)objectForKey:(id)a3 synchronize:(BOOL)a4;
+ (id)sharedDefaults;
+ (int)liveModeQuery;
+ (int64_t)longForKey:(id)a3;
+ (int64_t)longForKey:(id)a3 ifNotSet:(int64_t)a4;
+ (int64_t)mode;
+ (void)enableRestartAtEPL;
+ (void)registerEPLNotificationWithQueue:(id)a3;
+ (void)resetUserDefaultCacheForKey:(id)a3;
+ (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4;
+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4;
+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4 forKey:(id)a5;
+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4;
+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4 forKey:(id)a5;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6;
+ (void)setObject:(id)a3 forKey:(id)a4 saveToDisk:(BOOL)a5;
- (BOOL)debugEnabled;
- (BOOL)enableRestartAtEPL;
- (BOOL)eplEnabled;
- (NSMutableDictionary)instancePrefsCache;
- (NSMutableDictionary)managedPrefsCache;
- (NSMutableDictionary)userPrefsCache;
- (PLDefaults)init;
- (id)instancePrefsObjectForKey:(id)a3;
- (id)managedPrefsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5;
- (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5;
- (id)userDefaultsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5;
- (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4;
- (void)setDebugEnabled:(BOOL)a3;
- (void)setEnableRestartAtEPL:(BOOL)a3;
- (void)setEplEnabled:(BOOL)a3;
- (void)setInstancePrefsCache:(id)a3;
- (void)setManagedPrefsCache:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6;
- (void)setUserPrefsCache:(id)a3;
@end

@implementation PLDefaults

+ (BOOL)fullMode
{
  return +[PLDefaults mode] == 1;
}

+ (int64_t)mode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__PLDefaults_mode__block_invoke;
  block[3] = &unk_1E62538C8;
  v5 = @"Mode";
  if (mode_defaultOnce != -1) {
    dispatch_once(&mode_defaultOnce, block);
  }
  int64_t v2 = mode_objectForKey;

  return v2;
}

+ (BOOL)isClassDebugEnabled:(Class)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = +[PLDefaults sharedDefaults];
  int v7 = [v6 debugEnabled];

  if (v7)
  {
    v8 = NSStringFromClass(a3);
    BOOL v9 = +[PLDefaults isClassNameDebugEnabled:v8 forKey:v5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)debugEnabled
{
  int64_t v2 = +[PLDefaults sharedDefaults];
  char v3 = [v2 debugEnabled];

  return v3;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_onceSharedDefaults != -1) {
    dispatch_once(&sharedDefaults_onceSharedDefaults, &__block_literal_global_33_0);
  }
  int64_t v2 = (void *)sharedDefaults_sharedDefaults;
  return v2;
}

- (BOOL)debugEnabled
{
  return self->_debugEnabled;
}

+ (BOOL)taskMode
{
  return +[PLDefaults mode] == 2;
}

+ (BOOL)isDevBoard
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__PLDefaults_isDevBoard__block_invoke;
  block[3] = &unk_1E62538C8;
  id v5 = @"DevBoard";
  if (isDevBoard_defaultOnce != -1) {
    dispatch_once(&isDevBoard_defaultOnce, block);
  }
  char v2 = isDevBoard_objectForKey;

  return v2;
}

+ (BOOL)BOOLForKey:(id)a3 ifNotSet:(BOOL)a4
{
  id v5 = +[PLDefaults objectForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

+ (int64_t)longForKey:(id)a3 ifNotSet:(int64_t)a4
{
  id v5 = +[PLDefaults objectForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 longLongValue];
  }

  return a4;
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() applicationID];
  id v5 = +[PLDefaults objectForKey:v3 forApplicationID:v4 synchronize:0];

  return v5;
}

+ (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = +[PLDefaults sharedDefaults];
  v10 = [v9 objectForKey:v8 forApplicationID:v7 synchronize:v5];

  return v10;
}

- (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [(PLDefaults *)self userDefaultsObjectForKey:v8 forApplicationID:a4 synchronize:v5];
  if (!v9)
  {
    BOOL v9 = [(PLDefaults *)self instancePrefsObjectForKey:v8];
  }

  return v9;
}

- (id)instancePrefsObjectForKey:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"__instancePrefsCacheSync__");
  BOOL v5 = [(PLDefaults *)self instancePrefsCache];
  v6 = [v5 objectForKey:v4];

  objc_sync_exit(@"__instancePrefsCacheSync__");
  return v6;
}

- (NSMutableDictionary)instancePrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

+ (id)applicationID
{
  if (applicationID_onceToken != -1) {
    dispatch_once(&applicationID_onceToken, &__block_literal_global_19);
  }
  char v2 = (void *)applicationID_applicationID;
  return v2;
}

- (id)userDefaultsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (__CFString *)a3;
  BOOL v9 = (__CFString *)a4;
  v10 = (void *)MEMORY[0x1C1869120]();
  objc_sync_enter(@"__userPrefsCacheSync__");
  v11 = [(PLDefaults *)self userPrefsCache];
  v12 = [v11 objectForKeyedSubscript:v9];

  if (!v12)
  {
    v13 = objc_opt_new();
    v14 = [(PLDefaults *)self userPrefsCache];
    [v14 setObject:v13 forKeyedSubscript:v9];

    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    v15 = [(PLDefaults *)self userPrefsCache];
    v16 = [v15 objectForKeyedSubscript:v9];
    [v16 removeObjectForKey:v8];

    PLCFPreferencesAppSynchronize((uint64_t)v9);
  }
LABEL_6:
  v17 = [(PLDefaults *)self userPrefsCache];
  v18 = [v17 objectForKeyedSubscript:v9];
  v19 = [v18 objectForKeyedSubscript:v8];

  if (!v19)
  {
    if ([(__CFString *)v9 isEqualToString:@"com.apple.powerlogd"])
    {
      if (CFPreferencesAppValueIsForced(v8, v9)) {
        uint64_t v20 = PLCFPreferencesCopyAppValue((uint64_t)v8, (uint64_t)v9);
      }
      else {
        uint64_t v20 = PLCFPreferencesCopyValue((uint64_t)v8, (uint64_t)v9, *MEMORY[0x1E4F1D3D0], *MEMORY[0x1E4F1D3E0]);
      }
    }
    else
    {
      uint64_t v20 = (uint64_t)CFPreferencesCopyValue(v8, v9, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    }
    v21 = (void *)v20;
    if (v20)
    {
      v22 = [(PLDefaults *)self userPrefsCache];
      v23 = [v22 objectForKeyedSubscript:v9];
      [v23 setObject:v21 forKeyedSubscript:v8];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      v23 = [(PLDefaults *)self userPrefsCache];
      v24 = [v23 objectForKeyedSubscript:v9];
      [v24 setObject:v22 forKeyedSubscript:v8];
    }
  }
  v25 = [(PLDefaults *)self userPrefsCache];
  v26 = [v25 objectForKeyedSubscript:v9];
  v27 = [v26 objectForKeyedSubscript:v8];
  v28 = [MEMORY[0x1E4F1CA98] null];

  if (v27 == v28)
  {
    v31 = 0;
  }
  else
  {
    v29 = [(PLDefaults *)self userPrefsCache];
    v30 = [v29 objectForKeyedSubscript:v9];
    v31 = [v30 objectForKeyedSubscript:v8];
  }
  objc_sync_exit(@"__userPrefsCacheSync__");

  return v31;
}

- (NSMutableDictionary)userPrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

+ (BOOL)liteMode
{
  return !+[PLDefaults mode]
      || +[PLDefaults mode] > 2;
}

+ (BOOL)isClassDebugEnabled:(Class)a3
{
  id v4 = +[PLDefaults sharedDefaults];
  int v5 = [v4 debugEnabled];

  if (!v5) {
    return 0;
  }
  v6 = NSStringFromClass(a3);
  BOOL v7 = +[PLDefaults isClassNameDebugEnabled:v6];

  return v7;
}

uint64_t __27__PLDefaults_applicationID__block_invoke()
{
  BOOL v0 = +[PLUtilities isPowerlogHelperd];
  v1 = @"com.apple.powerlogd";
  if (v0) {
    v1 = @"com.apple.powerlogHelperd";
  }
  applicationID_applicationID = (uint64_t)v1;
  return MEMORY[0x1F41817F8]();
}

uint64_t __28__PLDefaults_sharedDefaults__block_invoke()
{
  sharedDefaults_sharedDefaults = objc_alloc_init(PLDefaults);
  return MEMORY[0x1F41817F8]();
}

+ (id)allDefaultsEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  CFStringRef v4 = (const __CFString *)[(id)objc_opt_class() applicationID];
  CFArrayRef v5 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFArrayRef v6 = v5;
  uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "objectForKey:", v11, (void)v14);
        [v3 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v3;
}

+ (BOOL)objectExistsForKey:(id)a3
{
  id v3 = +[PLDefaults objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)objectForKey:(id)a3 ifNotSet:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 objectForKey:a3];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

+ (id)objectForKey:(id)a3 synchronize:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() applicationID];
  uint64_t v7 = +[PLDefaults objectForKey:v5 forApplicationID:v6 synchronize:v4];

  return v7;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
}

+ (void)setObject:(id)a3 forKey:(id)a4 saveToDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() applicationID];
  +[PLDefaults setObject:v8 forKey:v7 forApplicationID:v9 saveToDisk:v5];
}

+ (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[PLDefaults sharedDefaults];
  [v12 setObject:v11 forKey:v10 forApplicationID:v9 saveToDisk:v6];
}

+ (void)resetUserDefaultCacheForKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() applicationID];
  +[PLDefaults resetUserDefaultCacheForKey:v3 forApplicationID:v4];
}

+ (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PLDefaults sharedDefaults];
  [v7 resetUserDefaultCacheForKey:v6 forApplicationID:v5];
}

+ (BOOL)fullModeForClass:(Class)a3
{
  id v4 = NSString;
  id v5 = NSStringFromClass(a3);
  id v6 = [v4 stringWithFormat:@"%@_FullMode", v5];

  id v7 = +[PLDefaults objectForKey:v6];

  if (v7)
  {
    id v8 = +[PLDefaults objectForKey:v6];
    char v9 = [v8 BOOLValue];
  }
  else
  {
    char v9 = [a1 fullMode];
  }

  return v9;
}

+ (int)liveModeQuery
{
  char v2 = +[PLDefaults objectForKey:@"Mode"];
  id v3 = v2;
  if (v2)
  {
    int v4 = [v2 intValue];
  }
  else
  {
    if (!+[PLPlatform isWatch]) {
      +[PLDefaults setObject:&unk_1F15808E8 forKey:@"Mode" saveToDisk:1];
    }
    int v4 = 0;
  }

  return v4;
}

+ (BOOL)oldFullMode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__PLDefaults_oldFullMode__block_invoke;
  block[3] = &unk_1E62538C8;
  id v5 = @"FullMode";
  if (oldFullMode_defaultOnce != -1) {
    dispatch_once(&oldFullMode_defaultOnce, block);
  }
  char v2 = oldFullMode_objectForKey;

  return v2;
}

BOOL __25__PLDefaults_oldFullMode__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32)];
  oldFullMode_objectForKey = result;
  return result;
}

int64_t __18__PLDefaults_mode__block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32)];
  mode_objectForKey = result;
  return result;
}

BOOL __24__PLDefaults_isDevBoard__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32)];
  isDevBoard_objectForKey = result;
  return result;
}

+ (BOOL)isModelingDebugEnabled
{
  if (+[PLDefaults isDevBoard])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLDefaults_isModelingDebugEnabled__block_invoke;
    block[3] = &unk_1E62538C8;
    id v5 = @"ModelingDebugEnabled";
    if (isModelingDebugEnabled_defaultOnce != -1) {
      dispatch_once(&isModelingDebugEnabled_defaultOnce, block);
    }
    int v2 = isModelingDebugEnabled_objectForKey;

    isModelingDebugEnabled__modelingDebugEnabled = v2;
  }
  else
  {
    int v2 = isModelingDebugEnabled__modelingDebugEnabled;
  }
  return v2 != 0;
}

BOOL __36__PLDefaults_isModelingDebugEnabled__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32)];
  isModelingDebugEnabled_objectForKey = result;
  return result;
}

+ (BOOL)isModelTrigger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PLDefaults_isModelTrigger__block_invoke;
  block[3] = &unk_1E62538C8;
  id v5 = @"ModelTrigger";
  if (isModelTrigger_defaultOnce != -1) {
    dispatch_once(&isModelTrigger_defaultOnce, block);
  }
  char v2 = isModelTrigger_objectForKey;

  return v2;
}

BOOL __28__PLDefaults_isModelTrigger__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32)];
  isModelTrigger_objectForKey = result;
  return result;
}

+ (BOOL)BOOLForKey:(id)a3
{
  return +[PLDefaults BOOLForKey:a3 ifNotSet:0];
}

+ (double)doubleForKey:(id)a3
{
  +[PLDefaults doubleForKey:a3 ifNotSet:0.0];
  return result;
}

+ (double)doubleForKey:(id)a3 ifNotSet:(double)a4
{
  id v5 = +[PLDefaults objectForKey:a3];
  id v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

+ (int64_t)longForKey:(id)a3
{
  return +[PLDefaults longForKey:a3 ifNotSet:0];
}

+ (BOOL)fullPLLog
{
  int v2 = [a1 debugEnabled];
  if (v2)
  {
    uint64_t v3 = PLD_NSLogDebugKey;
    LOBYTE(v2) = +[PLDefaults BOOLForKey:v3];
  }
  return v2;
}

+ (BOOL)isClassNameDebugEnabled:(id)a3
{
  id v3 = a3;
  int v4 = +[PLDefaults sharedDefaults];
  int v5 = [v4 debugEnabled];

  if (v5)
  {
    id v6 = [v3 stringByAppendingString:@"_Debug"];
    if (+[PLDefaults objectExistsForKey:v6])
    {
      double v7 = +[PLDefaults objectForKey:v6];
      LOBYTE(v5) = [v7 BOOLValue];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (BOOL)isClassNameDebugEnabled:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[PLDefaults sharedDefaults];
  int v8 = [v7 debugEnabled];

  if (v8)
  {
    char v9 = [v5 stringByAppendingString:@"_Debug"];
    if (+[PLDefaults objectExistsForKey:v9]
      && (+[PLDefaults objectForKey:v9],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 BOOLValue],
          v10,
          (v11 & 1) != 0))
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v13 = [v9 stringByAppendingFormat:@"_%@", v6];

      if (+[PLDefaults objectExistsForKey:v13])
      {
        long long v14 = +[PLDefaults objectForKey:v13];
        char v12 = [v14 BOOLValue];
      }
      else
      {
        char v12 = 0;
      }
      char v9 = (void *)v13;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  NSStringFromClass(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setClassName:v5 debugEnabled:v4];
}

+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4 forKey:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  NSStringFromClass(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setClassName:v8 debugEnabled:v5 forKey:v7];
}

+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [NSString stringWithFormat:@"%@%@", a3, @"_Debug"];
  BOOL v5 = [NSNumber numberWithBool:v4];
  +[PLDefaults setObject:v5 forKey:v6];
}

+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4 forKey:(id)a5
{
  BOOL v5 = a4;
  id v7 = [NSString stringWithFormat:@"%@%@_%@", a3, @"_Debug", a5];
  id v6 = [NSNumber numberWithBool:v5];
  +[PLDefaults setObject:v6 forKey:v7];
}

- (PLDefaults)init
{
  v12.receiver = self;
  v12.super_class = (Class)PLDefaults;
  int v2 = [(PLDefaults *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    managedPrefsCache = v2->_managedPrefsCache;
    v2->_managedPrefsCache = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    instancePrefsCache = v2->_instancePrefsCache;
    v2->_instancePrefsCache = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    userPrefsCache = v2->_userPrefsCache;
    v2->_userPrefsCache = (NSMutableDictionary *)v7;

    char v9 = [(id)objc_opt_class() applicationID];
    id v10 = [(PLDefaults *)v2 objectForKey:@"debugEnabled" forApplicationID:v9 synchronize:0];

    if (v10 && [v10 BOOLValue])
    {
      v2->_debugEnabled = 1;
      NSLog(&cfstr_DebugEnabled.isa);
    }
    else
    {
      v2->_debugEnabled = 0;
    }
  }
  return v2;
}

- (id)managedPrefsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_sync_enter(@"__managedPrefsCacheSync__");
  if (v5)
  {
    id v10 = objc_opt_new();
    [(PLDefaults *)self setManagedPrefsCache:v10];
  }
  char v11 = [(PLDefaults *)self managedPrefsCache];
  objc_super v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@/%@.plist", PLD_ManagedPreferencePath, v9];
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v13];
    long long v15 = [(PLDefaults *)self managedPrefsCache];
    if (v14)
    {
      [v15 setObject:v14 forKey:v9];
    }
    else
    {
      long long v16 = [MEMORY[0x1E4F1CA98] null];
      [v15 setObject:v16 forKey:v9];
    }
  }
  long long v17 = [(PLDefaults *)self managedPrefsCache];
  v18 = [v17 objectForKey:v9];
  uint64_t v19 = [MEMORY[0x1E4F1CA98] null];

  if (v18 == v19)
  {
    v22 = 0;
  }
  else
  {
    uint64_t v20 = [(PLDefaults *)self managedPrefsCache];
    v21 = [v20 objectForKey:v9];
    v22 = [v21 objectForKey:v8];
  }
  objc_sync_exit(@"__managedPrefsCacheSync__");

  return v22;
}

- (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_sync_enter(@"__userPrefsCacheSync__");
  uint64_t v7 = [(PLDefaults *)self userPrefsCache];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [(PLDefaults *)self userPrefsCache];
    id v10 = [v9 objectForKeyedSubscript:v6];
    [v10 removeObjectForKey:v11];
  }
  objc_sync_exit(@"__userPrefsCacheSync__");
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6
{
  BOOL v6 = a6;
  id value = a3;
  id v10 = (__CFString *)a4;
  id v11 = (__CFString *)a5;
  objc_super v12 = [(id)objc_opt_class() applicationID];
  int v13 = [(__CFString *)v11 isEqualToString:v12];

  if (v13)
  {
    objc_sync_enter(@"__instancePrefsCacheSync__");
    long long v14 = [(PLDefaults *)self instancePrefsCache];
    if (value) {
      [v14 setObject:value forKey:v10];
    }
    else {
      [v14 removeObjectForKey:v10];
    }

    objc_sync_exit(@"__instancePrefsCacheSync__");
  }
  if (v6)
  {
    if ([(__CFString *)v11 isEqualToString:@"com.apple.powerlogd"])
    {
      if (CFPreferencesAppValueIsForced(v10, v11)) {
        PLCFPreferencesSetAppValue((uint64_t)v10, (uint64_t)value, (uint64_t)v11);
      }
      else {
        PLCFPreferencesSetValue((uint64_t)v10, (uint64_t)value, (uint64_t)v11, *MEMORY[0x1E4F1D3D0], *MEMORY[0x1E4F1D3E0]);
      }
      PLCFPreferencesAppSynchronize((uint64_t)v11);
    }
    else
    {
      CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFPreferencesSetValue(v10, value, v11, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      CFPreferencesSynchronize(v11, @"mobile", v15);
    }
    objc_sync_enter(@"__userPrefsCacheSync__");
    if (value)
    {
      long long v16 = [(PLDefaults *)self userPrefsCache];
      long long v17 = [v16 objectForKeyedSubscript:v11];
      [v17 setObject:value forKeyedSubscript:v10];
    }
    else
    {
      long long v16 = [MEMORY[0x1E4F1CA98] null];
      long long v17 = [(PLDefaults *)self userPrefsCache];
      v18 = [v17 objectForKeyedSubscript:v11];
      [v18 setObject:v16 forKeyedSubscript:v10];
    }
    objc_sync_exit(@"__userPrefsCacheSync__");
  }
}

+ (BOOL)eplEnabled
{
  int v2 = +[PLDefaults sharedDefaults];
  char v3 = [v2 eplEnabled];

  return v3;
}

+ (BOOL)isTaskFullEPLMode
{
  if (+[PLDefaults taskMode]
    || +[PLDefaults fullMode])
  {
    return 1;
  }
  return +[PLDefaults eplEnabled];
}

+ (void)enableRestartAtEPL
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLDefaults_enableRestartAtEPL__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (enableRestartAtEPL_defaultOnce != -1) {
      dispatch_once(&enableRestartAtEPL_defaultOnce, block);
    }
    if (enableRestartAtEPL_classDebugEnabled)
    {
      char v3 = [NSString stringWithFormat:@"Restart requested at EPL enable\n"];
      BOOL v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m"];
      BOOL v5 = [v4 lastPathComponent];
      BOOL v6 = [NSString stringWithUTF8String:"+[PLDefaults enableRestartAtEPL]"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:478];

      uint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v8 = +[PLDefaults sharedDefaults];
  [v8 setEnableRestartAtEPL:1];
}

BOOL __32__PLDefaults_enableRestartAtEPL__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  enableRestartAtEPL_classDebugEnabled = result;
  return result;
}

+ (void)registerEPLNotificationWithQueue:(id)a3
{
  BOOL v4 = a3;
  CFPreferencesAppSynchronize(@"com.apple.da");
  BOOL v5 = (void *)CFPreferencesCopyValue(@"HTEPL.EPLEnabled", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  BOOL v6 = +[PLDefaults sharedDefaults];
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 0;
  }
  [v6 setEplEnabled:v7];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (registerEPLNotificationWithQueue__defaultOnce != -1) {
      dispatch_once(&registerEPLNotificationWithQueue__defaultOnce, block);
    }
    if (registerEPLNotificationWithQueue__classDebugEnabled)
    {
      id v9 = NSString;
      id v10 = +[PLDefaults sharedDefaults];
      id v11 = [v9 stringWithFormat:@"Initially, EPLEnabled %d\n", objc_msgSend(v10, "eplEnabled")];

      objc_super v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m"];
      int v13 = [v12 lastPathComponent];
      long long v14 = [NSString stringWithUTF8String:"+[PLDefaults registerEPLNotificationWithQueue:]"];
      +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:489];

      CFStringRef v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  int out_token = 0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_96;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  handler[4] = a1;
  uint64_t v16 = notify_register_dispatch("com.apple.plde.epl_changed", &out_token, v4, handler);
  if (v16)
  {
    uint64_t v17 = v16;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_104;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v18;
      if (registerEPLNotificationWithQueue__defaultOnce_102 != -1) {
        dispatch_once(&registerEPLNotificationWithQueue__defaultOnce_102, v24);
      }
      if (registerEPLNotificationWithQueue__classDebugEnabled_103)
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"notify_register_dispatch failed %d %s", v17, "com.apple.plde.epl_changed");
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"+[PLDefaults registerEPLNotificationWithQueue:]"];
        +[PLCoreStorage logMessage:v19 fromFile:v21 fromFunction:v22 fromLineNumber:504];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerEPLNotificationWithQueue__classDebugEnabled = result;
  return result;
}

void __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_96()
{
  CFPreferencesAppSynchronize(@"com.apple.da");
  BOOL v0 = (void *)CFPreferencesCopyValue(@"HTEPL.EPLEnabled", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v1 = +[PLDefaults sharedDefaults];
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }
  [v1 setEplEnabled:v2];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_2;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (instancePrefsCacheSync_block_invoke_defaultOnce != -1) {
      dispatch_once(&instancePrefsCacheSync_block_invoke_defaultOnce, &block);
    }
    if (instancePrefsCacheSync_block_invoke_classDebugEnabled)
    {
      BOOL v4 = NSString;
      BOOL v5 = +[PLDefaults sharedDefaults];
      unsigned int v6 = [v5 eplEnabled];
      uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", @"EPLEnabled changed to %d\n", v6, block, v16, v17, v18, v19);

      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"+[PLDefaults registerEPLNotificationWithQueue:]_block_invoke"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:498];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  objc_super v12 = +[PLDefaults sharedDefaults];
  if ([v12 enableRestartAtEPL])
  {
    int v13 = +[PLDefaults sharedDefaults];
    int v14 = [v13 eplEnabled];

    if (v14) {
      +[PLUtilities exitWithReason:7];
    }
  }
  else
  {
  }
}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  instancePrefsCacheSync_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_104(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerEPLNotificationWithQueue__classDebugEnabled_103 = result;
  return result;
}

- (void)setDebugEnabled:(BOOL)a3
{
  self->_debugEnabled = a3;
}

- (BOOL)eplEnabled
{
  return self->_eplEnabled;
}

- (void)setEplEnabled:(BOOL)a3
{
  self->_eplEnabled = a3;
}

- (NSMutableDictionary)managedPrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedPrefsCache:(id)a3
{
}

- (void)setInstancePrefsCache:(id)a3
{
}

- (void)setUserPrefsCache:(id)a3
{
}

- (BOOL)enableRestartAtEPL
{
  return self->_enableRestartAtEPL;
}

- (void)setEnableRestartAtEPL:(BOOL)a3
{
  self->_enableRestartAtEPL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrefsCache, 0);
  objc_storeStrong((id *)&self->_instancePrefsCache, 0);
  objc_storeStrong((id *)&self->_managedPrefsCache, 0);
}

@end