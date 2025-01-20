@interface _UITextAttributeDictionaryImplM
+ (BOOL)_isMutable;
+ (Class)_ignoringClass;
+ (Class)_storageClass;
- (void)_removeFallbackFromStorage;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setFallback:(id)a3;
- (void)setIgnoresFallback:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _UITextAttributeDictionaryImplM

- (void)_removeFallbackFromStorage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(_UITextAttributeDefaults *)self->super._fallback _attributes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(_UITextAttributeDefaults *)self->super._fallback _attributes];
  v5 = [v4 allKeys];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:v10];
        v12 = [v3 objectForKeyedSubscript:v10];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          [(NSMutableDictionary *)self->super._storage removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

+ (Class)_storageClass
{
  return (Class)objc_opt_class();
}

- (void)removeObjectForKey:(id)a3
{
  id v6 = a3;
  if (([(id)objc_opt_class() _isMutable] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UITextAttributeDictionary.m", 356, @"%@ is not a mutable impl.", objc_opt_class() object file lineNumber description];
  }
  [(NSMutableDictionary *)self->super._storage removeObjectForKey:v6];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() _isMutable] & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UITextAttributeDictionary.m", 334, @"%@ is not a mutable impl.", objc_opt_class() object file lineNumber description];
  }
  if (self->super._fallback
    && ![(_UITextAttributeDictionaryImplI *)self ignoresFallbackForKey:v7])
  {
    v9 = [(_UITextAttributeDefaults *)self->super._fallback _attributes];
    id v10 = [v9 objectForKeyedSubscript:v7];
    id v11 = v16;
    v12 = v11;
    if (v10 == v11)
    {
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
      if (v11 && v10) {
        int v8 = [v10 isEqual:v11];
      }
    }
  }
  else
  {
    int v8 = 0;
  }
  if (v7 && (int v13 = self->super._storage) != 0 && CFDictionaryContainsKey((CFDictionaryRef)v13, v7))
  {
    storage = self->super._storage;
    if (v8)
    {
      [(NSMutableDictionary *)storage removeObjectForKey:v7];
      goto LABEL_20;
    }
  }
  else
  {
    if (v8) {
      goto LABEL_20;
    }
    storage = self->super._storage;
  }
  [(NSMutableDictionary *)storage setObject:v16 forKey:v7];
LABEL_20:
}

+ (BOOL)_isMutable
{
  return 1;
}

+ (Class)_ignoringClass
{
  return (Class)objc_opt_class();
}

- (void)removeAllObjects
{
  if (([(id)objc_opt_class() _isMutable] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UITextAttributeDictionary.m", 363, @"%@ is not a mutable impl.", objc_opt_class() object file lineNumber description];
  }
  storage = self->super._storage;
  [(NSMutableDictionary *)storage removeAllObjects];
}

- (void)setFallback:(id)a3
{
  v5 = (_UITextAttributeDefaults *)a3;
  if (([(id)objc_opt_class() _isMutable] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UITextAttributeDictionary.m", 372, @"%@ is not a mutable impl.", objc_opt_class() object file lineNumber description];
  }
  fallback = self->super._fallback;
  self->super._fallback = v5;

  [(_UITextAttributeDictionaryImplM *)self _removeFallbackFromStorage];
}

- (void)setIgnoresFallback:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  if (([(id)objc_opt_class() _isMutable] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UITextAttributeDictionary.m", 379, @"%@ is not a mutable impl.", objc_opt_class() object file lineNumber description];
  }
  id v7 = v13;
  if (v13)
  {
    ignoring = self->super._ignoring;
    if (v4)
    {
      if (ignoring)
      {
        [(NSMutableSet *)ignoring addObject:v13];
LABEL_11:
        id v7 = v13;
        goto LABEL_12;
      }
      id v11 = [MEMORY[0x1E4F1CA80] setWithObject:v13];
      id v10 = self->super._ignoring;
      self->super._ignoring = v11;
    }
    else
    {
      [(NSMutableSet *)ignoring removeObject:v13];
      uint64_t v9 = [(NSMutableSet *)self->super._ignoring count];
      id v7 = v13;
      if (v9) {
        goto LABEL_12;
      }
      id v10 = self->super._ignoring;
      self->super._ignoring = 0;
    }

    goto LABEL_11;
  }
LABEL_12:
}

@end