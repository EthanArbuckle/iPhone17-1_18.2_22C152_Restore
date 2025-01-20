@interface SXJSONDictionary
- (NSArray)keys;
- (NSDictionary)json;
- (NSMutableDictionary)objects;
- (SXJSONDictionary)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7;
- (id)JSONRepresentation;
- (id)NSDictionary;
- (id)allKeys;
- (id)allObjects;
- (id)description;
- (id)jsonDictionary;
- (id)keyAtIndex:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (id)objectValueClassBlock;
- (id)valueClassBlock;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation SXJSONDictionary

- (SXJSONDictionary)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (SXJSONDictionary *)a6;
  id v16 = a7;
  if (v12)
  {
    v37.receiver = self;
    v37.super_class = (Class)SXJSONDictionary;
    v17 = [(SXJSONObject *)&v37 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._specificationVersion, a7);
      v19 = (void *)[(SXJSONDictionary *)v15 mutableCopy];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __102__SXJSONDictionary_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke;
      v33[3] = &unk_2646525A0;
      id v34 = v19;
      id v36 = v14;
      id v35 = v16;
      id v20 = v19;
      [(SXJSONDictionary *)v15 enumerateKeysAndObjectsUsingBlock:v33];
      uint64_t v21 = [v13 copy];
      id objectValueClassBlock = v18->_objectValueClassBlock;
      v18->_id objectValueClassBlock = (id)v21;

      uint64_t v23 = [v12 copy];
      id valueClassBlock = v18->_valueClassBlock;
      v18->_id valueClassBlock = (id)v23;

      uint64_t v25 = [v20 copy];
      json = v18->_json;
      v18->_json = (NSDictionary *)v25;

      v18->_count = [(NSDictionary *)v18->_json count];
      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      objects = v18->_objects;
      v18->_objects = v27;

      uint64_t v29 = [(NSDictionary *)v18->_json allKeys];
      keys = v18->_keys;
      v18->_keys = (NSArray *)v29;
    }
    self = v18;
  }
  else
  {
    v18 = v15;
  }
  v31 = v18;

  return v31;
}

void __102__SXJSONDictionary_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF9D0] null];

  if (v6 == v5
    || (uint64_t v7 = *(void *)(a1 + 48)) != 0
    && (*(unsigned int (**)(uint64_t, id, void))(v7 + 16))(v7, v5, *(void *)(a1 + 40)))
  {
    [*(id *)(a1 + 32) removeObjectForKey:v8];
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_23;
  }
  os_unfair_lock_lock_with_options();
  id v5 = [(NSMutableDictionary *)self->_objects objectForKey:v4];
  os_unfair_lock_unlock(&self->super._unfairLock);
  if (v5) {
    goto LABEL_23;
  }
  id v6 = [(NSDictionary *)self->_json objectForKey:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
    {
      id v5 = v6;
LABEL_20:
      os_unfair_lock_lock_with_options();
      [(NSMutableDictionary *)self->_objects setObject:v5 forKey:v4];
      os_unfair_lock_unlock(&self->super._unfairLock);
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id objectValueClassBlock = (uint64_t (**)(id, void *, void, NSString *))self->_objectValueClassBlock;
  if (objectValueClassBlock)
  {
    id v8 = (objc_class *)objectValueClassBlock[2](objectValueClassBlock, v6, 0, self->super._specificationVersion);
  }
  else if (self->_valueClassBlock)
  {
    v9 = [v6 objectForKeyedSubscript:@"type"];
    id v8 = (objc_class *)(*((uint64_t (**)(void))self->_valueClassBlock + 2))();
  }
  else
  {
    id v8 = 0;
  }
  if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
  {
    id v5 = (id)[[v8 alloc] initWithJSONObject:v6 andVersion:self->super._specificationVersion];
    goto LABEL_19;
  }
  if (![(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
  {
    if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
    {
      v10 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:v4];
      v11 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:v4];
      id v12 = [(id)objc_opt_class() purgeClassBlockForPropertyWithName:v4];
      id v13 = SXJSONArray;
      goto LABEL_18;
    }
LABEL_21:
    id v5 = 0;
    goto LABEL_22;
  }
  v10 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:v4];
  v11 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:v4];
  id v12 = [(id)objc_opt_class() purgeClassBlockForPropertyWithName:v4];
  id v13 = SXJSONDictionary;
LABEL_18:
  id v5 = (id)[[v13 alloc] initWithValueClassBlock:v11 objectValueClassBlock:v10 purgeBlock:v12 andJSONObject:v6 andVersion:self->super._specificationVersion];

LABEL_19:
  if (v5) {
    goto LABEL_20;
  }
LABEL_22:

LABEL_23:
  return v5;
}

- (id)keyAtIndex:(unint64_t)a3
{
  if (self->_count <= a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:");
  }
  return v3;
}

- (id)allKeys
{
  return self->_keys;
}

- (id)allObjects
{
  if (self->_count)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
    if (self->_count)
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [(NSArray *)self->_keys objectAtIndex:v4];
        id v6 = [(SXJSONDictionary *)self objectForKey:v5];
        [v3 addObject:v6];

        ++v4;
      }
      while (v4 < self->_count);
    }
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (id)NSDictionary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = self->_keys;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = -[SXJSONDictionary objectForKey:](self, "objectForKey:", v9, (void)v12);
        [v3 setObject:v10 forKey:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  return self->_json;
}

- (id)JSONRepresentation
{
  return self->_json;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (self->_count - a3->var0 >= a5) {
    unint64_t v7 = a5;
  }
  else {
    unint64_t v7 = self->_count - a3->var0;
  }
  a3->var1 = a4;
  a3->var2 = a3->var3;
  if (v7)
  {
    id v8 = a4;
    unint64_t v10 = var0;
    unint64_t v11 = v7;
    do
    {
      *v8++ = [(SXJSONDictionary *)self keyAtIndex:v10++];
      --v11;
    }
    while (v11);
  }
  a3->unint64_t var0 = v7 + var0;
  return v7;
}

- (id)description
{
  v3 = [(SXJSONDictionary *)self allKeys];
  unint64_t v4 = [(SXJSONDictionary *)self allObjects];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{"];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [v3 objectAtIndex:v6];
      id v8 = [v4 objectAtIndex:v6];
      if (v6 != [v3 count] - 1) {
        [v5 appendFormat:@"%@ => %@,\n", v7, v8];
      }

      ++v6;
    }
    while (v6 < [v3 count]);
  }
  [v5 appendString:@"}"];

  return v5;
}

- (id)objectValueClassBlock
{
  return self->_objectValueClassBlock;
}

- (id)valueClassBlock
{
  return self->_valueClassBlock;
}

- (NSDictionary)json
{
  return self->_json;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (NSArray)keys
{
  return self->_keys;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong(&self->_valueClassBlock, 0);
  objc_storeStrong(&self->_objectValueClassBlock, 0);
}

@end