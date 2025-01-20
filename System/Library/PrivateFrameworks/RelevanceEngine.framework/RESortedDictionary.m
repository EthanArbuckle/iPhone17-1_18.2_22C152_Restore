@interface RESortedDictionary
- (BOOL)isEqual:(id)a3;
- (RESortedDictionary)init;
- (RESortedDictionary)initWithCapacity:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation RESortedDictionary

- (RESortedDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)RESortedDictionary;
  v2 = [(RESortedDictionary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    order = v2->_order;
    v2->_order = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (RESortedDictionary)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RESortedDictionary;
  v4 = [(RESortedDictionary *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    order = v4->_order;
    v4->_order = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a3];
    values = v4->_values;
    v4->_values = (NSMutableDictionary *)v7;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RESortedDictionary *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      values = self->_values;
      uint64_t v7 = v5->_values;
      if (values == v7)
      {
      }
      else
      {
        objc_super v8 = v7;
        v9 = values;
        int v10 = [(NSMutableDictionary *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      order = self->_order;
      v13 = v5->_order;
      v14 = order;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSMutableArray *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableArray *)self->_order copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_values mutableCopy];
  objc_super v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_values count];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_values objectForKeyedSubscript:a3];
}

- (void)removeObjectForKey:(id)a3
{
  values = self->_values;
  id v5 = a3;
  [(NSMutableDictionary *)values removeObjectForKey:v5];
  uint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_order, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, [(NSMutableArray *)self->_order count], 256, &__block_literal_global_21);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = (id)[(NSMutableArray *)self->_order objectAtIndex:v6];
  }
}

uint64_t __41__RESortedDictionary_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(RESortedDictionary *)self objectForKey:v6];

  if (!v7) {
    -[NSMutableArray insertObject:atIndex:](self->_order, "insertObject:atIndex:", v6, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_order, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, [(NSMutableArray *)self->_order count], 1280, &__block_literal_global_4_0));
  }
  [(NSMutableDictionary *)self->_values setObject:v8 forKeyedSubscript:v6];
}

uint64_t __39__RESortedDictionary_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeAllObjects
{
  [(NSMutableDictionary *)self->_values removeAllObjects];
  order = self->_order;
  [(NSMutableArray *)order removeAllObjects];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    order = self->_order;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__RESortedDictionary_enumerateObjectsWithOptions_usingBlock___block_invoke;
    v9[3] = &unk_2644BE0A8;
    v9[4] = self;
    id v10 = v6;
    [(NSMutableArray *)order enumerateObjectsWithOptions:a3 usingBlock:v9];
  }
}

void __61__RESortedDictionary_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end