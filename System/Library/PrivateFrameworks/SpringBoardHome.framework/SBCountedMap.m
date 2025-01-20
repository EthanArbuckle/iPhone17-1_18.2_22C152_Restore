@interface SBCountedMap
- (BOOL)checkinValue:(id)a3;
- (BOOL)containsKey:(id)a3;
- (BOOL)containsValue:(id)a3;
- (SBCountedMap)init;
- (id)checkoutValueForKey:(id)a3 creationBlock:(id)a4;
- (id)description;
- (void)checkinValues:(id)a3;
@end

@implementation SBCountedMap

- (BOOL)checkinValue:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "sbh_countedMapKey");
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_map objectForKey:v5];
    if (v6 == v4
      && ([(NSCountedSet *)self->_countedKeys removeObject:v5],
          ([(NSCountedSet *)self->_countedKeys containsObject:v5] & 1) == 0))
    {
      [(NSMutableDictionary *)self->_map removeObjectForKey:v5];
      BOOL v7 = 1;
      id v6 = v4;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)checkoutValueForKey:(id)a3 creationBlock:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  if (v6)
  {
    v8 = [(NSMutableDictionary *)self->_map objectForKey:v6];
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "sbh_countedMapKey");
      [(NSCountedSet *)self->_countedKeys addObject:v10];
LABEL_7:

      goto LABEL_9;
    }
    if (v7)
    {
      v11 = v7[2](v7, v6);
      v9 = v11;
      if (!v11) {
        goto LABEL_9;
      }
      v10 = objc_msgSend(v11, "sbh_countedMapKey");
      [(NSCountedSet *)self->_countedKeys addObject:v10];
      [(NSMutableDictionary *)self->_map setObject:v9 forKey:v10];
      goto LABEL_7;
    }
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (SBCountedMap)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBCountedMap;
  v2 = [(SBCountedMap *)&v8 init];
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    countedKeys = v2->_countedKeys;
    v2->_countedKeys = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    map = v2->_map;
    v2->_map = v5;
  }
  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_map withName:@"map"];
  v5 = objc_opt_new();
  countedKeys = self->_countedKeys;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __27__SBCountedMap_description__block_invoke;
  v14 = &unk_1E6AAEDD0;
  id v15 = v5;
  v16 = self;
  id v7 = v5;
  [(NSCountedSet *)countedKeys enumerateObjectsUsingBlock:&v11];
  id v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, @"countedKeys w/ count", v11, v12, v13, v14);
  v9 = [v3 build];

  return v9;
}

void __27__SBCountedMap_description__block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  id v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", v5));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)checkinValues:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBCountedMap *)self checkinValue:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)containsKey:(id)a3
{
  return [(NSCountedSet *)self->_countedKeys containsObject:a3];
}

- (BOOL)containsValue:(id)a3
{
  id v4 = objc_msgSend(a3, "sbh_countedMapKey");
  if (v4) {
    char v5 = [(NSCountedSet *)self->_countedKeys containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_countedKeys, 0);
}

@end