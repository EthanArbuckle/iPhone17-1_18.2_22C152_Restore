@interface _UIKeyCommandMatchingCache
+ (id)keyCommandMatchingCacheForLayout:(uint64_t)a1;
- (NSMutableDictionary)commandKeyPlaneConflictsByInput;
- (NSMutableDictionary)reachabilityByInput;
- (_UIKeyCommandMatchingCache)init;
- (uint64_t)_cacheValueForDictionary:(void *)a3 input:(uint64_t)a4 modifiers:;
- (void)_setCacheValue:(void *)a3 dictionary:(void *)a4 input:(uint64_t)a5 modifiers:;
- (void)conflictStateForCommandKeyPlaneSwitchForInput:(uint64_t)a3 modifiers:;
- (void)directReachabilityStateForInput:(uint64_t)a3 modifiers:;
- (void)setCommandKeyPlaneHasSwitchingConflict:(void *)a3 input:(uint64_t)a4 modifiers:;
- (void)setDirectlyReachable:(void *)a3 input:(uint64_t)a4 modifiers:;
@end

@implementation _UIKeyCommandMatchingCache

+ (id)keyCommandMatchingCacheForLayout:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    if (!_MergedGlobals_969 || ([(id)qword_1EB25F288 isEqualToString:v2] & 1) == 0)
    {
      uint64_t v3 = [v2 copy];
      v4 = (void *)qword_1EB25F288;
      qword_1EB25F288 = v3;

      v5 = objc_alloc_init(_UIKeyCommandMatchingCache);
      v6 = (void *)_MergedGlobals_969;
      _MergedGlobals_969 = (uint64_t)v5;
    }
    id v7 = (id)_MergedGlobals_969;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (_UIKeyCommandMatchingCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyCommandMatchingCache;
  id v2 = [(_UIKeyCommandMatchingCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    commandKeyPlaneConflictsByInput = v2->_commandKeyPlaneConflictsByInput;
    v2->_commandKeyPlaneConflictsByInput = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    reachabilityByInput = v2->_reachabilityByInput;
    v2->_reachabilityByInput = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)_setCacheValue:(void *)a3 dictionary:(void *)a4 input:(uint64_t)a5 modifiers:
{
  id v11 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = [v11 objectForKey:v9];
    if (!v10)
    {
      v10 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
      [v11 setObject:v10 forKey:v9];
    }
    NSMapInsert(v10, (const void *)(a5 + 1), (const void *)a2);
  }
}

- (uint64_t)_cacheValueForDictionary:(void *)a3 input:(uint64_t)a4 modifiers:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [v7 objectForKey:v8];
    v10 = v9;
    if (v9) {
      unsigned __int8 v11 = NSMapGet(v9, (const void *)(a4 + 1));
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)conflictStateForCommandKeyPlaneSwitchForInput:(uint64_t)a3 modifiers:
{
  if (result)
  {
    v4 = result;
    id v5 = a2;
    v6 = [v4 commandKeyPlaneConflictsByInput];
    uint64_t v7 = -[_UIKeyCommandMatchingCache _cacheValueForDictionary:input:modifiers:]((uint64_t)v4, v6, v5, a3);

    return (void *)v7;
  }
  return result;
}

- (void)setCommandKeyPlaneHasSwitchingConflict:(void *)a3 input:(uint64_t)a4 modifiers:
{
  if (a1)
  {
    id v7 = a3;
    id v8 = [a1 commandKeyPlaneConflictsByInput];
    id v10 = v8;
    if (a2) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = 2;
    }
    -[_UIKeyCommandMatchingCache _setCacheValue:dictionary:input:modifiers:]((uint64_t)a1, v9, v8, v7, a4);
  }
}

- (void)setDirectlyReachable:(void *)a3 input:(uint64_t)a4 modifiers:
{
  if (a1)
  {
    id v7 = a3;
    id v8 = [a1 reachabilityByInput];
    id v10 = v8;
    if (a2) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = 2;
    }
    -[_UIKeyCommandMatchingCache _setCacheValue:dictionary:input:modifiers:]((uint64_t)a1, v9, v8, v7, a4);
  }
}

- (void)directReachabilityStateForInput:(uint64_t)a3 modifiers:
{
  if (result)
  {
    v4 = result;
    id v5 = a2;
    v6 = [v4 reachabilityByInput];
    uint64_t v7 = -[_UIKeyCommandMatchingCache _cacheValueForDictionary:input:modifiers:]((uint64_t)v4, v6, v5, a3);

    return (void *)v7;
  }
  return result;
}

- (NSMutableDictionary)commandKeyPlaneConflictsByInput
{
  return self->_commandKeyPlaneConflictsByInput;
}

- (NSMutableDictionary)reachabilityByInput
{
  return self->_reachabilityByInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityByInput, 0);
  objc_storeStrong((id *)&self->_commandKeyPlaneConflictsByInput, 0);
}

@end