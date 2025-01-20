@interface PCCarrierBundleHelper
+ (id)helper;
- (BOOL)BOOLValueFromPushBundleForKey:(id)a3 error:(id *)a4;
- (NSDictionary)cachedPushSettings;
- (PCCarrierBundleHelper)init;
- (id)copyValueForKey:(id)a3 error:(id *)a4;
- (id)copyValueFromPushBundleForKey:(id)a3 error:(id *)a4;
- (void)_processCarrierBundleChange:(id)a3;
- (void)_updateCurrentDataSimContext:(id)a3;
- (void)addDelegate:(id)a3;
- (void)currentDataSimChanged:(id)a3;
- (void)operatorBundleChange:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setCachedPushSettings:(id)a3;
@end

@implementation PCCarrierBundleHelper

+ (id)helper
{
  if (helper_onceToken != -1) {
    dispatch_once(&helper_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)helper_sInstance;
  return v2;
}

uint64_t __31__PCCarrierBundleHelper_helper__block_invoke()
{
  helper_sInstance = objc_alloc_init(PCCarrierBundleHelper);
  return MEMORY[0x1F41817F8]();
}

- (PCCarrierBundleHelper)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PCCarrierBundleHelper;
  v2 = [(PCCarrierBundleHelper *)&v17 init];
  if (v2)
  {
    uint64_t v3 = PCCreateQueue("PCCarrierBundleHelper-ctQueue");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_queue];
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:2];
    bundle = v2->_bundle;
    v2->_bundle = (CTBundle *)v7;

    [(CoreTelephonyClient *)v2->_ctClient setDelegate:v2];
    v9 = v2->_ctClient;
    id v16 = 0;
    v10 = [(CoreTelephonyClient *)v9 getCurrentDataSubscriptionContextSync:&v16];
    id v11 = v16;
    if (v11 || !v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to get currentDataSimContext. {error: %@}", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v12 = [v10 copy];
      currentDataContext = v2->_currentDataContext;
      v2->_currentDataContext = (CTXPCServiceSubscriptionContext *)v12;
    }
    cachedPushSettings = v2->_cachedPushSettings;
    v2->_cachedPushSettings = 0;
  }
  return v2;
}

- (id)copyValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)[(CTXPCServiceSubscriptionContext *)v7->_currentDataContext copy];
  objc_sync_exit(v7);

  if (v8)
  {
    if (a4) {
      *a4 = 0;
    }
    ctClient = v7->_ctClient;
    bundle = v7->_bundle;
    id v14 = 0;
    id v11 = (void *)[(CoreTelephonyClient *)ctClient copyCarrierBundleValue:v8 key:v6 bundleType:bundle error:&v14];
    id v12 = v14;
    if (v12)
    {

      if (a4) {
        *a4 = v12;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PCCarrierBundleHelper copyValueForKey:error:]((uint64_t)v6, (uint64_t)v12);
      }
      id v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to copy carrier bundle value but we don't have a valid CTXPCServiceSubscriptionContext yet", buf, 2u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)copyValueFromPushBundleForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  cachedPushSettings = v7->_cachedPushSettings;
  if (cachedPushSettings)
  {
    v9 = [(NSDictionary *)cachedPushSettings objectForKey:v6];
    id v10 = (id)[v9 copy];

    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    id v21 = 0;
    id v11 = [(PCCarrierBundleHelper *)v7 copyValueForKey:@"PushSettings" error:&v21];
    id v12 = v21;
    v13 = v12;
    if (a4) {
      *a4 = v12;
    }
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = (NSDictionary *)v11;
      v15 = v7;
      objc_sync_enter(v15);
      id v16 = v7->_cachedPushSettings;
      v7->_cachedPushSettings = v14;
      objc_super v17 = v14;

      objc_sync_exit(v15);
      v18 = [(NSDictionary *)v17 objectForKey:v6];

      id v19 = (void *)[v18 copy];
    }
    else
    {
      id v19 = 0;
    }
    id v10 = v19;
  }
  return v10;
}

- (BOOL)BOOLValueFromPushBundleForKey:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v5 = a3;
  id v6 = +[PCCarrierBundleHelper helper];
  id v11 = 0;
  uint64_t v7 = (void *)[v6 copyValueFromPushBundleForKey:v5 error:&v11];

  id v8 = v11;
  if (a4) {
    *a4 = v8;
  }
  char v9 = [v7 BOOLValue];

  return v9;
}

- (void)addDelegate:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = v9;
  delegates = v4->_delegates;
  if (!delegates)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    id v8 = v4->_delegates;
    v4->_delegates = (NSHashTable *)v7;

    delegates = v4->_delegates;
    id v5 = v9;
  }
  [(NSHashTable *)delegates addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_delegates removeObject:v6];
  if (![(NSHashTable *)v4->_delegates count])
  {
    delegates = v4->_delegates;
    v4->_delegates = 0;
  }
  objc_sync_exit(v4);
}

- (void)_processCarrierBundleChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = 0;
  if (v4 && v5->_currentDataContext)
  {
    uint64_t v7 = [v4 slotID];
    BOOL v6 = v7 == [(CTXPCServiceSubscriptionContext *)v5->_currentDataContext slotID];
  }
  id v8 = (void *)[(NSHashTable *)v5->_delegates copy];
  cachedPushSettings = v5->_cachedPushSettings;
  v5->_cachedPushSettings = 0;

  objc_sync_exit(v5);
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "carrierBundleDidChange", (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_updateCurrentDataSimContext:(id)a3
{
  id v4 = (CTXPCServiceSubscriptionContext *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentDataContext = obj->_currentDataContext;
  obj->_currentDataContext = v4;

  objc_sync_exit(obj);
}

- (void)operatorBundleChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "operatorBundleChange - context %@", (uint8_t *)&v5, 0xCu);
  }
  [(PCCarrierBundleHelper *)self _processCarrierBundleChange:v4];
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "currentDataSimChanged - context %@", (uint8_t *)&v5, 0xCu);
  }
  [(PCCarrierBundleHelper *)self _updateCurrentDataSimContext:v4];
  [(PCCarrierBundleHelper *)self _processCarrierBundleChange:v4];
}

- (NSDictionary)cachedPushSettings
{
  return self->_cachedPushSettings;
}

- (void)setCachedPushSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPushSettings, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_currentDataContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
}

- (void)copyValueForKey:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to copy carrier bundle value. {key: %@, error: %@}", (uint8_t *)&v2, 0x16u);
}

@end