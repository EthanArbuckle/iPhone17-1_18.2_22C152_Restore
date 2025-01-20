@interface REKeyMultiValueMap
- (REKeyMultiValueMap)init;
- (REKeyMultiValueMap)initWithValuePointFunctionOptions:(unint64_t)a3;
- (id)keyForValue:(id)a3;
- (id)valuesForKey:(id)a3;
- (unint64_t)keyCount;
- (unint64_t)valueCount;
- (void)addKey:(id)a3 withValues:(id)a4;
- (void)enumerateValuesForKey:(id)a3 usingBlock:(id)a4;
- (void)insertValue:(id)a3 forKey:(id)a4;
- (void)removeKey:(id)a3;
- (void)removeValue:(id)a3 forKey:(id)a4;
@end

@implementation REKeyMultiValueMap

- (REKeyMultiValueMap)initWithValuePointFunctionOptions:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)REKeyMultiValueMap;
  v4 = [(REKeyMultiValueMap *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:a3];
    keyMap = v4->_keyMap;
    v4->_keyMap = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] mapTableWithKeyOptions:a3 valueOptions:0];
    valueMap = v4->_valueMap;
    v4->_valueMap = (NSMapTable *)v7;
  }
  return v4;
}

- (REKeyMultiValueMap)init
{
  return [(REKeyMultiValueMap *)self initWithValuePointFunctionOptions:0];
}

- (unint64_t)keyCount
{
  return [(NSMapTable *)self->_keyMap count];
}

- (unint64_t)valueCount
{
  return [(NSMapTable *)self->_valueMap count];
}

- (void)addKey:(id)a3 withValues:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSMapTable *)self->_keyMap setObject:v7 forKey:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NSMapTable setObject:forKey:](self->_valueMap, "setObject:forKey:", v6, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)removeKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = -[NSMapTable objectForKey:](self->_keyMap, "objectForKey:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSMapTable *)self->_valueMap removeObjectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMapTable *)self->_keyMap removeObjectForKey:v4];
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(REKeyMultiValueMap *)self valuesForKey:v6];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [(REKeyMultiValueMap *)self removeKey:v6];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
  }
  [v8 addObject:v10];
  uint64_t v9 = (void *)[v8 copy];
  [(REKeyMultiValueMap *)self addKey:v6 withValues:v9];
}

- (void)removeValue:(id)a3 forKey:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  uint64_t v7 = [(REKeyMultiValueMap *)self valuesForKey:v10];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [(REKeyMultiValueMap *)self removeKey:v10];
  [v8 removeObject:v6];

  if ([v8 count])
  {
    uint64_t v9 = (void *)[v8 copy];
    [(REKeyMultiValueMap *)self addKey:v10 withValues:v9];
  }
}

- (void)enumerateValuesForKey:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = -[REKeyMultiValueMap valuesForKey:](self, "valuesForKey:", a3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)valuesForKey:(id)a3
{
  return [(NSMapTable *)self->_keyMap objectForKey:a3];
}

- (id)keyForValue:(id)a3
{
  return [(NSMapTable *)self->_valueMap objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMap, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);
}

@end