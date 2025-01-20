@interface TCSCallLog
- (NSMutableDictionary)calls;
- (NSMutableOrderedSet)identifiers;
- (TCSCallLog)init;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)_trimCache;
- (void)addCall:(id)a3;
- (void)setCalls:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation TCSCallLog

- (TCSCallLog)init
{
  v9.receiver = self;
  v9.super_class = (Class)TCSCallLog;
  v2 = [(TCSCallLog *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    calls = v3->_calls;
    v3->_calls = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
    identifiers = v3->_identifiers;
    v3->_identifiers = (NSMutableOrderedSet *)v6;
  }
  return v3;
}

- (void)addCall:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];

  if (v5)
  {
    if ([v4 status] == 6)
    {
      uint64_t v6 = [v4 uniqueProxyIdentifier];
      v7 = (void *)[v6 copy];

      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_calls setObject:v4 forKeyedSubscript:v7];
      [(NSMutableOrderedSet *)self->_identifiers insertObject:v7 atIndex:0];
      os_unfair_lock_unlock(&self->_lock);
      [(TCSCallLog *)self _trimCache];
    }
    else
    {
      _TCSInitializeLogging();
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSCallLog addCall:]();
      }
    }
  }
  else
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSCallLog addCall:]();
    }
  }
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_calls objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_trimCache
{
  v3 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)[(NSMutableOrderedSet *)self->_identifiers count] >= 9)
  {
    uint64_t v4 = [(NSMutableOrderedSet *)self->_identifiers count];
    id v5 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 8, v4 - 8);
    uint64_t v6 = [(NSMutableOrderedSet *)self->_identifiers objectsAtIndexes:v5];
    [v3 addObjectsFromArray:v6];
  }
  calls = self->_calls;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __24__TCSCallLog__trimCache__block_invoke;
  v10[3] = &unk_2644C8E30;
  id v11 = v3;
  id v8 = v3;
  [(NSMutableDictionary *)calls enumerateKeysAndObjectsUsingBlock:v10];
  objc_super v9 = [v8 allObjects];
  [(NSMutableDictionary *)self->_calls removeObjectsForKeys:v9];
  [(NSMutableOrderedSet *)self->_identifiers removeObjectsInArray:v9];
  os_unfair_lock_unlock(&self->_lock);
}

void __24__TCSCallLog__trimCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = [a3 dateAnsweredOrDialed];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 <= -21600.0) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (NSMutableDictionary)calls
{
  return self->_calls;
}

- (void)setCalls:(id)a3
{
}

- (NSMutableOrderedSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_calls, 0);
}

- (void)addCall:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21E834000, v0, OS_LOG_TYPE_ERROR, "%s: cannot add entry for TCSCall object lacking uPI: %@", (uint8_t *)v1, 0x16u);
}

- (void)addCall:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21E834000, v0, OS_LOG_TYPE_ERROR, "%s: usage error, should not be adding an entry for a TCSCall object whose call state is not disconnected: %@", (uint8_t *)v1, 0x16u);
}

@end