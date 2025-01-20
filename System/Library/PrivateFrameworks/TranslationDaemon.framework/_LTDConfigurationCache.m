@interface _LTDConfigurationCache
+ (id)_errorForType:(int64_t)a3 reason:(unint64_t)a4;
- (_LTDConfigurationCache)init;
- (id)objectForType:(int64_t)a3 error:(id *)a4;
- (void)objectForType:(int64_t)a3 completion:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForType:(int64_t)a3;
- (void)setObject:(id)a3 forType:(int64_t)a4;
@end

@implementation _LTDConfigurationCache

- (_LTDConfigurationCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LTDConfigurationCache;
  v2 = [(_LTDConfigurationCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = v2;
  }

  return v2;
}

- (void)setObject:(id)a3 forType:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache setObject:v7 forKey:v8];

  objc_super v9 = [(NSMutableDictionary *)self->_conditions objectForKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_conditions removeObjectForKey:v8];
  os_unfair_lock_unlock(&self->_lock);
  [v9 lock];
  [v9 broadcast];
  [v9 unlock];
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_LTDConfigurationCache setObject:forType:]();
  }
}

+ (id)_errorForType:(int64_t)a3 reason:(unint64_t)a4
{
  switch(a4)
  {
    case 2uLL:
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"Timeout waiting on cache value for type %zd", a3);
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = 11;
      goto LABEL_7;
    case 1uLL:
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"Cache-miss with writer pass-through on cache value for type %zd", a3);
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = 2;
      goto LABEL_7;
    case 0uLL:
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"No value found in cache for type %zd", a3);
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = 7;
LABEL_7:
      id v7 = objc_msgSend(v5, "ltd_errorWithCode:description:userInfo:", v6, v4, 0);

      goto LABEL_9;
  }
  id v7 = 0;
LABEL_9:
  return v7;
}

- (id)objectForType:(int64_t)a3 error:(id *)a4
{
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
  os_unfair_lock_lock(&self->_lock);
  v8 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v7];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (char v11 = objc_msgSend(v10, "lt_ensureTypesForKeys:values:", v9, 0), v12 = v10, (v11 & 1) == 0))
  {

    v12 = 0;
  }

  if (v12)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_32;
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_conditions objectForKeyedSubscript:v7];
  if (v13)
  {
    v14 = (void *)v13;
    os_unfair_lock_unlock(&self->_lock);
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_LTDConfigurationCache objectForType:error:].cold.5();
    }
    [v14 lock];
    v16 = [MEMORY[0x263EFF910] now];
    v17 = [v16 dateByAddingTimeInterval:_LTDPreferencesConfigurationCacheTimeout()];
    char v18 = [v14 waitUntilDate:v17];

    [v14 unlock];
    v19 = _LTOSLogAssets();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[_LTDConfigurationCache objectForType:error:].cold.4();
      if (v18) {
        goto LABEL_12;
      }
    }
    else if (v18)
    {
LABEL_12:
      os_unfair_lock_lock(&self->_lock);
      v20 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v7];
      uint64_t v21 = objc_opt_class();
      id v22 = v20;
      if (!v22
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (char v23 = objc_msgSend(v22, "lt_ensureTypesForKeys:values:", v21, 0), v12 = v22, (v23 & 1) == 0))
      {

        v12 = 0;
      }

      os_unfair_lock_unlock(&self->_lock);
      if (v12) {
        goto LABEL_21;
      }
      v24 = [(id)objc_opt_class() _errorForType:a3 reason:0];
      v25 = _LTOSLogAssets();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[_LTDConfigurationCache objectForType:error:]();
        if (!a4) {
          goto LABEL_20;
        }
      }
      else if (!a4)
      {
LABEL_20:

LABEL_21:
        goto LABEL_32;
      }
      *a4 = v24;
      goto LABEL_20;
    }
    v27 = [(id)objc_opt_class() _errorForType:a3 reason:2];
    v28 = _LTOSLogAssets();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[_LTDConfigurationCache objectForType:error:]((uint64_t)v27, a3, v28);
      if (!a4) {
        goto LABEL_30;
      }
    }
    else if (!a4)
    {
LABEL_30:

      goto LABEL_31;
    }
    *a4 = v27;
    goto LABEL_30;
  }
  v14 = objc_opt_new();
  [(NSMutableDictionary *)self->_conditions setObject:v14 forKeyedSubscript:v7];
  v26 = _LTOSLogAssets();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    -[_LTDConfigurationCache objectForType:error:]();
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (a4)
  {
LABEL_24:
    *a4 = [(id)objc_opt_class() _errorForType:a3 reason:1];
  }
LABEL_25:
  os_unfair_lock_unlock(&self->_lock);
LABEL_31:

  v12 = 0;
LABEL_32:

  return v12;
}

- (void)objectForType:(int64_t)a3 completion:(id)a4
{
  id v11 = 0;
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = [(_LTDConfigurationCache *)self objectForType:a3 error:&v11];
  id v8 = v11;
  if (v8)
  {
    uint64_t v9 = 0;
    id v10 = v8;
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = 0;
  }
  v6[2](v6, v9, v10);
}

- (void)removeObjectForType:(int64_t)a3
{
  uint64_t v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_LTDConfigurationCache removeObjectForType:]();
  }
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache removeObjectForKey:v6];
  id v7 = [(NSMutableDictionary *)self->_conditions objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_conditions removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
  [v7 lock];
  [v7 broadcast];
  [v7 unlock];
}

- (void)removeAllObjects
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Configuration cache remove all", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setObject:forType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Configuration cache set and signaled waiters for type %zd", v2, v3, v4, v5, v6);
}

- (void)objectForType:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Configuration cache-miss, writer pass-through for type %zd", v2, v3, v4, v5, v6);
}

- (void)objectForType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Received no result in cache for key %{public}@: %@");
}

- (void)objectForType:(NSObject *)a3 error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_2600DC000, a2, a3, "Timed out loading configuration cache object for type %zd: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)objectForType:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Configuration reader block-wait end for type %zd", v2, v3, v4, v5, v6);
}

- (void)objectForType:error:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Configuration cache-miss, reader block-wait for type %zd", v2, v3, v4, v5, v6);
}

- (void)removeObjectForType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Configuration cache remove type: %zd", v2, v3, v4, v5, v6);
}

@end