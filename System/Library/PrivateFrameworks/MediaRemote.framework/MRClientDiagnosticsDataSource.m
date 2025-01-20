@interface MRClientDiagnosticsDataSource
+ (MRClientDiagnosticsDataSource)sharedDataSource;
- (MRClientDiagnosticsDataSource)init;
- (NSMutableDictionary)map;
- (NSString)diagnostic;
- (os_unfair_lock_s)lock;
- (void)add:(id)a3;
- (void)remove:(id)a3;
@end

@implementation MRClientDiagnosticsDataSource

+ (MRClientDiagnosticsDataSource)sharedDataSource
{
  if (sharedDataSource_onceToken != -1) {
    dispatch_once(&sharedDataSource_onceToken, &__block_literal_global_106);
  }
  v2 = (void *)sharedDataSource___dataSource;

  return (MRClientDiagnosticsDataSource *)v2;
}

uint64_t __49__MRClientDiagnosticsDataSource_sharedDataSource__block_invoke()
{
  v0 = objc_alloc_init(MRClientDiagnosticsDataSource);
  uint64_t v1 = sharedDataSource___dataSource;
  sharedDataSource___dataSource = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (MRClientDiagnosticsDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRClientDiagnosticsDataSource;
  v2 = [(MRClientDiagnosticsDataSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    map = v3->_map;
    v3->_map = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (NSString)diagnostic
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = objc_opt_new();
  [v3 appendFormat:@"Log History:\n\n"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = self;
  uint64_t v4 = [(MRClientDiagnosticsDataSource *)self map];
  v5 = [v4 allKeys];

  obuint64_t j = v5;
  uint64_t v22 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        [v3 appendFormat:@"Registered %@ Instances:\n\n", v7, lock];
        v8 = [(MRClientDiagnosticsDataSource *)v21 map];
        v9 = [v8 objectForKeyedSubscript:v7];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v23 + 1) + 8 * j) diagnosticDescription];
              [v3 appendString:v15];

              v16 = [&stru_1EE60E7D8 stringByPaddingToLength:100 withString:@"-" startingAtIndex:0];
              [v3 appendString:v16];

              [v3 appendString:@"\n"];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }

        [v3 appendString:@"\n"];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);

  return (NSString *)v3;
}

- (void)add:(id)a3
{
  id v13 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = [(MRClientDiagnosticsDataSource *)self map];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v10 = [(MRClientDiagnosticsDataSource *)self map];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  uint64_t v11 = [(MRClientDiagnosticsDataSource *)self map];
  uint64_t v12 = [v11 objectForKeyedSubscript:v6];
  [v12 addObject:v13];

  os_unfair_lock_unlock(p_lock);
}

- (void)remove:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(MRClientDiagnosticsDataSource *)self map];
  v8 = [v7 objectForKeyedSubscript:v13];
  [v8 removeObject:v5];

  v9 = [(MRClientDiagnosticsDataSource *)self map];
  id v10 = [v9 objectForKeyedSubscript:v13];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    uint64_t v12 = [(MRClientDiagnosticsDataSource *)self map];
    [v12 setObject:0 forKeyedSubscript:v13];
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end