@interface STMutableSizeDict
- (BOOL)hasKey:(id)a3;
- (STMutableSizeDict)init;
- (STMutableSizeDict)initWithDictionary:(id)a3;
- (void)addSize:(id)a3 toKey:(id)a4;
- (void)plusEquals:(id)a3;
- (void)removeSmallerThan:(int64_t)a3;
- (void)setSize:(id)a3 forKey:(id)a4;
@end

@implementation STMutableSizeDict

- (STMutableSizeDict)init
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(STMutableSizeDict *)self initWithDictionary:v3];

  return v4;
}

- (STMutableSizeDict)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMutableSizeDict;
  v6 = [(STSizeDict *)&v9 initWithDictionary:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutableDictionary, a3);
  }

  return v7;
}

- (void)plusEquals:(id)a3
{
  if (a3)
  {
    v4 = [a3 dictionary];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__STMutableSizeDict_plusEquals___block_invoke;
    v5[3] = &unk_264305420;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __32__STMutableSizeDict_plusEquals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  v8 = [v6 plus:v9];

  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v8 forKeyedSubscript:v7];
}

- (void)addSize:(id)a3 toKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (([v10 isZero] & 1) == 0)
  {
    id v7 = [(NSMutableDictionary *)self->_mutableDictionary objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7)
    {
      id v9 = [v7 plus:v10];
      [(NSMutableDictionary *)self->_mutableDictionary setObject:v9 forKeyedSubscript:v6];
    }
    else
    {
      [(NSMutableDictionary *)self->_mutableDictionary setObject:v10 forKeyedSubscript:v6];
    }
  }
}

- (void)setSize:(id)a3 forKey:(id)a4
{
  mutableDictionary = self->_mutableDictionary;
  if (a3) {
    [(NSMutableDictionary *)mutableDictionary setObject:a3 forKeyedSubscript:a4];
  }
  else {
    [(NSMutableDictionary *)mutableDictionary removeObjectForKey:a4];
  }
}

- (void)removeSmallerThan:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_mutableDictionary allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [(NSMutableDictionary *)self->_mutableDictionary objectForKeyedSubscript:v10];
        if ([v11 userTotal] < a3) {
          [(NSMutableDictionary *)self->_mutableDictionary removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_mutableDictionary objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
}

@end