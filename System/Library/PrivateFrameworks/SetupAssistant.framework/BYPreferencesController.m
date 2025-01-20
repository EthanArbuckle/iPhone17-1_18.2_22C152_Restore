@interface BYPreferencesController
+ (id)buddyPreferences;
+ (id)buddyPreferencesEphemeral;
+ (id)buddyPreferencesExcludedFromBackup;
+ (id)buddyPreferencesInternal;
+ (id)genericPreferencesEphemeral;
+ (id)randomPreferences;
+ (void)flushEverything;
+ (void)persistEverything;
- (BOOL)BOOLForKey:(id)a3;
- (BYPreferencesController)init;
- (BYPreferencesController)initWithDomain:(id)a3;
- (NSMutableDictionary)preferences;
- (NSString)domain;
- (OS_dispatch_queue)queue;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 includeCache:(BOOL)a4;
- (void)flush;
- (void)persist;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3 onlyFromMemory:(BOOL)a4;
- (void)reset;
- (void)setDomain:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 persistImmediately:(BOOL)a5;
- (void)setPreferences:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BYPreferencesController

void __53__BYPreferencesController_objectForKey_includeCache___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) preferences];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

- (BOOL)BOOLForKey:(id)a3
{
  uint64_t v3 = [(BYPreferencesController *)self objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)objectForKey:(id)a3 includeCache:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__CFString *)a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  if (!v4) {
    goto LABEL_4;
  }
  v7 = [(BYPreferencesController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BYPreferencesController_objectForKey_includeCache___block_invoke;
  block[3] = &unk_1E5D2C550;
  v15 = &v16;
  block[4] = self;
  v14 = v6;
  dispatch_sync(v7, block);

  v8 = (void *)v17[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
LABEL_4:
    v10 = [(BYPreferencesController *)self domain];

    if (v10)
    {
      v11 = [(BYPreferencesController *)self domain];
      id v9 = (id)CFPreferencesCopyValue(v6, v11, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    }
    else
    {
      id v9 = 0;
    }
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)objectForKey:(id)a3
{
  return [(BYPreferencesController *)self objectForKey:a3 includeCache:1];
}

+ (id)buddyPreferencesInternal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__BYPreferencesController_buddyPreferencesInternal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buddyPreferencesInternal_onceToken != -1) {
    dispatch_once(&buddyPreferencesInternal_onceToken, block);
  }
  uint64_t v2 = (void *)buddyPreferencesInternal_preferences;
  return v2;
}

+ (id)buddyPreferences
{
  if (buddyPreferences_onceToken != -1) {
    dispatch_once(&buddyPreferences_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)buddyPreferences_preferences;
  return v2;
}

uint64_t __43__BYPreferencesController_buddyPreferences__block_invoke()
{
  buddyPreferences_preferences = [[BYPreferencesController alloc] initWithDomain:@"com.apple.purplebuddy"];
  return MEMORY[0x1F41817F8]();
}

+ (id)buddyPreferencesExcludedFromBackup
{
  if (buddyPreferencesExcludedFromBackup_onceToken != -1) {
    dispatch_once(&buddyPreferencesExcludedFromBackup_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)buddyPreferencesExcludedFromBackup_preferences;
  return v2;
}

uint64_t __61__BYPreferencesController_buddyPreferencesExcludedFromBackup__block_invoke()
{
  buddyPreferencesExcludedFromBackup_preferences = [[BYPreferencesController alloc] initWithDomain:@"com.apple.purplebuddy.notbackedup"];
  return MEMORY[0x1F41817F8]();
}

+ (id)buddyPreferencesEphemeral
{
  if (buddyPreferencesEphemeral_onceToken != -1) {
    dispatch_once(&buddyPreferencesEphemeral_onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)buddyPreferencesEphemeral_preferences;
  return v2;
}

uint64_t __52__BYPreferencesController_buddyPreferencesEphemeral__block_invoke()
{
  buddyPreferencesEphemeral_preferences = objc_alloc_init(BYPreferencesController);
  return MEMORY[0x1F41817F8]();
}

uint64_t __51__BYPreferencesController_buddyPreferencesInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  if (result)
  {
    buddyPreferencesInternal_preferences = [(id)objc_opt_class() buddyPreferences];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)genericPreferencesEphemeral
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)randomPreferences
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  BOOL v4 = [v3 UUIDString];
  id v5 = (void *)[v2 initWithDomain:v4];

  return v5;
}

- (BYPreferencesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYPreferencesController;
  id v2 = [(BYPreferencesController *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(BYPreferencesController *)v2 setPreferences:v3];

    dispatch_queue_t v4 = dispatch_queue_create("Preferences Queue", 0);
    [(BYPreferencesController *)v2 setQueue:v4];
  }
  return v2;
}

- (BYPreferencesController)initWithDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(BYPreferencesController *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(BYPreferencesController *)v5 setDomain:v4];
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BYPreferencesController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BYPreferencesController_setObject_forKey___block_invoke;
  block[3] = &unk_1E5D2C578;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __44__BYPreferencesController_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferences];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)setObject:(id)a3 forKey:(id)a4 persistImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id value = a3;
  v8 = (__CFString *)a4;
  [(BYPreferencesController *)self setObject:value forKey:v8];
  if (v5)
  {
    id v9 = [(BYPreferencesController *)self domain];
    CFPreferencesSetValue(v8, value, v9, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BYPreferencesController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__BYPreferencesController_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5D2C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__BYPreferencesController_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferences];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeObjectForKey:(id)a3 onlyFromMemory:(BOOL)a4
{
  key = (__CFString *)a3;
  -[BYPreferencesController removeObjectForKey:](self, "removeObjectForKey:");
  if (!a4)
  {
    id v6 = [(BYPreferencesController *)self domain];

    if (v6)
    {
      id v7 = [(BYPreferencesController *)self domain];
      CFPreferencesSetValue(key, 0, v7, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    }
  }
}

- (void)reset
{
  id v3 = [(BYPreferencesController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__BYPreferencesController_reset__block_invoke;
  block[3] = &unk_1E5D2BA60;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __32__BYPreferencesController_reset__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) preferences];
  [v1 removeAllObjects];
}

- (void)persist
{
  id v3 = [(BYPreferencesController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__BYPreferencesController_persist__block_invoke;
  block[3] = &unk_1E5D2BA60;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __34__BYPreferencesController_persist__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) preferences];
  id v3 = [v2 allKeys];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v11 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "preferences", (void)v15);
        id v13 = [v12 objectForKey:v11];

        v14 = [*(id *)(a1 + 32) domain];
        CFPreferencesSetValue(v11, v13, v14, v8, v9);

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

+ (void)persistEverything
{
  id v2 = [(id)objc_opt_class() buddyPreferences];
  [v2 persist];

  id v3 = [(id)objc_opt_class() buddyPreferencesExcludedFromBackup];
  [v3 persist];

  id v4 = [(id)objc_opt_class() buddyPreferencesInternal];
  [v4 persist];
}

- (void)flush
{
  id v2 = [(BYPreferencesController *)self domain];
  _CFPreferencesFlushCachesForIdentifier();
}

+ (void)flushEverything
{
  id v2 = [(id)objc_opt_class() buddyPreferences];
  [v2 flush];

  id v3 = [(id)objc_opt_class() buddyPreferencesExcludedFromBackup];
  [v3 flush];

  id v4 = [(id)objc_opt_class() buddyPreferencesInternal];
  [v4 flush];
}

- (void)setDomain:(id)a3
{
}

- (void)setPreferences:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end