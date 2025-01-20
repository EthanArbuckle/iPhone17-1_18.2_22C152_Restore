@interface RBProcessMap
- (BOOL)containsIdentity:(id)a3;
- (RBProcessMap)init;
- (id)allIdentities;
- (id)allValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)removeValueForIdentity:(id)a3;
- (id)removeValueForIdentity:(id)a3 withPredicate:(id)a4;
- (id)setValue:(id)a3 forIdentity:(id)a4;
- (id)valueForIdentity:(id)a3;
- (unint64_t)count;
- (void)addIdentity:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeIdentity:(id)a3;
@end

@implementation RBProcessMap

- (id)setValue:(id)a3 forIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [MEMORY[0x263F08B88] callStackSymbols];
    [v15 handleFailureInMethod:a2, self, @"RBProcessMap.m", 128, @"identity cannot be nil %@", v16 object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = [(NSMutableDictionary *)self->_valueMap objectForKey:v8];
  if (v10)
  {
    v11 = [MEMORY[0x263EFF9D0] null];

    if (v10 == v11)
    {

      v10 = 0;
    }
  }
  valueMap = self->_valueMap;
  if (v7)
  {
    [(NSMutableDictionary *)valueMap setObject:v7 forKey:v8];
  }
  else
  {
    v13 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableDictionary *)valueMap setObject:v13 forKey:v8];
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)allValue
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_valueMap allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10)
        {
          v11 = [MEMORY[0x263EFF9D0] null];

          if (v10 != v11) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSMutableDictionary *)self->_valueMap count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_valueMap removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

- (id)valueForIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_valueMap objectForKey:v4];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];

    if (v6 == v7)
    {

LABEL_5:
      uint64_t v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (BOOL)containsIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_valueMap objectForKey:v4];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)allIdentities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_valueMap allKeys];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (RBProcessMap)init
{
  v7.receiver = self;
  v7.super_class = (Class)RBProcessMap;
  v2 = [(RBProcessMap *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    valueMap = v3->_valueMap;
    v3->_valueMap = v4;
  }
  return v3;
}

- (void)removeIdentity:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RBProcessMap.m" lineNumber:57 description:@"identity cannot be nil"];
  }
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_valueMap removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)removeValueForIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_valueMap objectForKey:v4];
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 != v6)
    {
      [(NSMutableDictionary *)self->_valueMap removeObjectForKey:v4];
      goto LABEL_7;
    }
  }
  v5 = 0;
LABEL_7:
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)enumerateWithBlock:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = (void *)[(NSMutableDictionary *)self->_valueMap copy];
  os_unfair_lock_unlock(p_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__RBProcessMap_enumerateWithBlock___block_invoke;
  v8[3] = &unk_2647C86F0;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)addIdentity:(id)a3
{
  id v11 = a3;
  if (!v11)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = [MEMORY[0x263F08B88] callStackSymbols];
    [v9 handleFailureInMethod:a2, self, @"RBProcessMap.m", 47, @"identity cannot be nil %@", v10 object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_valueMap objectForKey:v11];

  if (!v6)
  {
    valueMap = self->_valueMap;
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableDictionary *)valueMap setObject:v8 forKey:v11];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)removeValueForIdentity:(id)a3 withPredicate:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned int (**)(id, void *))a4;
  os_unfair_lock_lock_with_options();
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_valueMap objectForKey:v6];
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = [MEMORY[0x263EFF9D0] null];

  if (v8 == v9)
  {

LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (v7[2](v7, v8)) {
    [(NSMutableDictionary *)self->_valueMap removeObjectForKey:v6];
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

void __35__RBProcessMap_enumerateWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)MEMORY[0x263EFF9D0];
  id v8 = a3;
  id v9 = a2;
  id v11 = [v7 null];
  if (v11 == v8) {
    id v10 = 0;
  }
  else {
    id v10 = v8;
  }
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v9, v10, a4);
}

- (id)dictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_valueMap copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RBProcessMap);
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)v4->_valueMap addEntriesFromDictionary:self->_valueMap];
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end