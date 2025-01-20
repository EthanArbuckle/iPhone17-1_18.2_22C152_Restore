@interface PUTileTree
- (BOOL)containsObject:(id)a3 withTileIdentifier:(id)a4;
- (BOOL)useUniqueLeafs;
- (NSMutableDictionary)_objectsByTileIdentifier;
- (PUTileTree)init;
- (PUTileTree)initWithTileTree:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initUsingUniqueLeafs:(BOOL)a3;
- (id)objectWithTileIdentifier:(id)a3;
- (void)addObject:(id)a3 withTileIdentifier:(id)a4;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithTileIdentifier:(id)a3 usingBlock:(id)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3 withTileIdentifier:(id)a4;
- (void)removeObjectWithTileIdentifier:(id)a3;
@end

@implementation PUTileTree

- (void).cxx_destruct
{
}

- (NSMutableDictionary)_objectsByTileIdentifier
{
  return self->__objectsByTileIdentifier;
}

- (BOOL)useUniqueLeafs
{
  return self->_useUniqueLeafs;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUTileTree;
  v3 = [(PUTileTree *)&v7 description];
  v4 = [(PUTileTree *)self _objectsByTileIdentifier];
  v5 = [v3 stringByAppendingFormat:@" objects: %@", v4];

  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUTileTree *)self useUniqueLeafs];
  v6 = [(PUTileTree *)self _objectsByTileIdentifier];
  if (v5)
  {
    objc_super v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v8 = &unk_1E5F2C5C0;
    v9 = __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke;
  }
  else
  {
    objc_super v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v8 = &unk_1E5F2C5E8;
    v9 = __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke_2;
  }
  v7[2] = v9;
  v7[3] = v8;
  v7[4] = v4;
  id v10 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      if (a4) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateObjectsWithTileIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, char *))a4;
  uint64_t v8 = [(PUTileTree *)self _objectsByTileIdentifier];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v16 != v13) {
        objc_enumerationMutation(v10);
      }
      v7[2](v7, *(void *)(*((void *)&v15 + 1) + 8 * v14), &v19);
      if (v19) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)objectWithTileIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUTileTree *)self _objectsByTileIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)containsObject:(id)a3 withTileIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PUTileTree *)self useUniqueLeafs];
  uint64_t v9 = [(PUTileTree *)self _objectsByTileIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v8) {
    char v11 = v10 == v7;
  }
  else {
    char v11 = [v10 containsObject:v7];
  }

  return v11;
}

- (void)removeAllObjects
{
  id v2 = [(PUTileTree *)self _objectsByTileIdentifier];
  [v2 removeAllObjects];
}

- (void)removeObjectWithTileIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTileTree *)self _objectsByTileIdentifier];
  [v5 removeObjectForKey:v4];
}

- (void)removeObject:(id)a3 withTileIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUTileTree *)self _objectsByTileIdentifier];
  if ([(PUTileTree *)self useUniqueLeafs])
  {
    [v7 removeObjectForKey:v6];
  }
  else
  {
    BOOL v8 = [v7 objectForKeyedSubscript:v6];

    [v8 removeObject:v9];
    id v6 = v8;
  }
}

- (void)addObject:(id)a3 withTileIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUTileTree *)self _objectsByTileIdentifier];
  if ([(PUTileTree *)self useUniqueLeafs])
  {
    [v7 setObject:v9 forKeyedSubscript:v6];
  }
  else
  {
    id v8 = [v7 objectForKeyedSubscript:v6];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 setObject:v8 forKeyedSubscript:v6];
    }
    [v8 addObject:v9];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithTileTree:self];
}

- (PUTileTree)initWithTileTree:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUTileTree;
  id v5 = [(PUTileTree *)&v18 init];
  if (v5)
  {
    int v6 = [v4 useUniqueLeafs];
    v5->_useUniqueLeafs = v6;
    id v7 = (void *)v4[2];
    if (v6)
    {
      uint64_t v8 = [v7 mutableCopy];
      objectsByTileIdentifier = v5->__objectsByTileIdentifier;
      v5->__objectsByTileIdentifier = (NSMutableDictionary *)v8;
    }
    else
    {
      id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
      objectsByTileIdentifier = v7;
      char v11 = objc_msgSend([v10 alloc], "initWithCapacity:", -[NSMutableDictionary count](objectsByTileIdentifier, "count"));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __31__PUTileTree_initWithTileTree___block_invoke;
      v16[3] = &unk_1E5F2C598;
      uint64_t v12 = v11;
      long long v17 = v12;
      [(NSMutableDictionary *)objectsByTileIdentifier enumerateKeysAndObjectsUsingBlock:v16];
      uint64_t v13 = v5->__objectsByTileIdentifier;
      v5->__objectsByTileIdentifier = v12;
      uint64_t v14 = v12;
    }
  }

  return v5;
}

void __31__PUTileTree_initWithTileTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[a3 mutableCopy];
  [v4 setObject:v5 forKey:a2];
}

- (id)initUsingUniqueLeafs:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUTileTree;
  id v4 = [(PUTileTree *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_useUniqueLeafs = a3;
    int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectsByTileIdentifier = v5->__objectsByTileIdentifier;
    v5->__objectsByTileIdentifier = v6;
  }
  return v5;
}

- (PUTileTree)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTileTree.m" lineNumber:18 description:@"use designated initializer"];

  return (PUTileTree *)[(PUTileTree *)self initUsingUniqueLeafs:0];
}

@end