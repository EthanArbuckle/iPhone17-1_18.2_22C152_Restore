@interface SXJSONArray
- (NSArray)json;
- (NSMutableArray)objects;
- (SXJSONArray)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7;
- (id)JSONRepresentation;
- (id)NSArray;
- (id)description;
- (id)firstObject;
- (id)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectValueClassBlock;
- (id)valueClassBlock;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation SXJSONArray

- (SXJSONArray)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (SXJSONArray *)a6;
  id v16 = a7;
  if (v12)
  {
    v38.receiver = self;
    v38.super_class = (Class)SXJSONArray;
    v17 = [(SXJSONObject *)&v38 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._specificationVersion, a7);
      v19 = (void *)MEMORY[0x263F08A98];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __97__SXJSONArray_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke;
      v35[3] = &unk_264652CF0;
      id v34 = v14;
      id v37 = v14;
      id v36 = v16;
      v20 = [v19 predicateWithBlock:v35];
      uint64_t v21 = [(SXJSONArray *)v15 filteredArrayUsingPredicate:v20];
      json = v18->_json;
      v18->_json = (NSArray *)v21;

      uint64_t v23 = [v13 copy];
      id objectValueClassBlock = v18->_objectValueClassBlock;
      v18->_id objectValueClassBlock = (id)v23;

      uint64_t v25 = [v12 copy];
      id valueClassBlock = v18->_valueClassBlock;
      v18->_id valueClassBlock = (id)v25;

      v18->_count = [(NSArray *)v18->_json count];
      uint64_t v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v18->_count];
      objects = v18->_objects;
      v18->_objects = (NSMutableArray *)v27;

      if (v18->_count)
      {
        unint64_t v29 = 0;
        do
        {
          v30 = v18->_objects;
          v31 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v34);
          [(NSMutableArray *)v30 addObject:v31];

          ++v29;
        }
        while (v29 < v18->_count);
      }

      self = v18;
      id v14 = v34;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v18 = v15;
  }
  v32 = v18;

  return v32;
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
    v8 = a4;
    unint64_t v10 = var0;
    unint64_t v11 = v7;
    do
    {
      *v8++ = [(SXJSONArray *)self objectAtIndex:v10++];
      --v11;
    }
    while (v11);
  }
  a3->unint64_t var0 = v7 + var0;
  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count <= a3)
  {
    v6 = 0;
    goto LABEL_23;
  }
  p_unfairLock = &self->super._unfairLock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableArray *)self->_objects objectAtIndex:a3];
  os_unfair_lock_unlock(p_unfairLock);
  unint64_t v7 = [MEMORY[0x263EFF9D0] null];

  if (v6 != v7) {
    goto LABEL_23;
  }
  v8 = [(NSArray *)self->_json objectAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id objectValueClassBlock = (uint64_t (**)(id, void *, void, NSString *))self->_objectValueClassBlock;
    if (objectValueClassBlock)
    {
      unint64_t v10 = (objc_class *)objectValueClassBlock[2](objectValueClassBlock, v8, 0, self->super._specificationVersion);
    }
    else
    {
      id v12 = [v8 objectForKeyedSubscript:@"type"];
      unint64_t v10 = (objc_class *)(*((uint64_t (**)(void))self->_valueClassBlock + 2))();
    }
    if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
    {
      id v13 = (SXJSONDictionary *)[[v10 alloc] initWithJSONObject:v8 andVersion:self->super._specificationVersion];
    }
    else if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v22 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:0];
      id v14 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:0];
      v15 = [(id)objc_opt_class() purgeClassBlockForPropertyWithName:0];
      id v13 = [[SXJSONDictionary alloc] initWithValueClassBlock:v14 objectValueClassBlock:v22 purgeBlock:v15 andJSONObject:v8 andVersion:self->super._specificationVersion];

      v6 = (void *)v22;
    }
    else
    {
      if (![(objc_class *)v10 isSubclassOfClass:objc_opt_class()]) {
        goto LABEL_17;
      }
      uint64_t v16 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:0];
      v17 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:0];
      id v13 = [[SXJSONArray alloc] initWithValueClassBlock:v17 objectValueClassBlock:v16 purgeBlock:0 andJSONObject:v8 andVersion:self->super._specificationVersion];

      v6 = (void *)v16;
    }

    v6 = v13;
  }
  else if (v8)
  {
    id v11 = v8;

    v6 = v11;
LABEL_18:
    os_unfair_lock_lock_with_options();
    v18 = [(NSMutableArray *)self->_objects objectAtIndex:a3];
    v19 = [MEMORY[0x263EFF9D0] null];

    if (v18 == v19)
    {
      [(NSMutableArray *)self->_objects replaceObjectAtIndex:a3 withObject:v6];
    }
    else
    {
      id v20 = v18;

      v6 = v20;
    }
    os_unfair_lock_unlock(p_unfairLock);

    goto LABEL_22;
  }
LABEL_17:
  if (v6) {
    goto LABEL_18;
  }
LABEL_22:

LABEL_23:
  return v6;
}

BOOL __97__SXJSONArray_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9D0] null];

  BOOL v6 = v4 != v3
    && ((uint64_t v5 = *(void *)(a1 + 40)) == 0
     || ((*(uint64_t (**)(uint64_t, id, void))(v5 + 16))(v5, v3, *(void *)(a1 + 32)) & 1) == 0)
    && v3 != 0;

  return v6;
}

- (id)firstObject
{
  id v3 = [(SXJSONArray *)self count];
  if (v3)
  {
    id v3 = [(SXJSONArray *)self objectAtIndex:0];
  }
  return v3;
}

- (id)lastObject
{
  unint64_t count = self->_count;
  if (count)
  {
    id v3 = [(SXJSONArray *)self objectAtIndex:count - 1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)NSArray
{
  id v3 = [MEMORY[0x263EFF980] array];
  if (self->_count)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      BOOL v6 = [(SXJSONArray *)self objectAtIndex:v4];
      [v3 addObject:v6];

      uint64_t v4 = v5;
    }
    while (self->_count > v5++);
  }
  return v3;
}

- (id)JSONRepresentation
{
  return self->_json;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{"];
  if (self->_count)
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(SXJSONArray *)self objectAtIndex:v4];
      BOOL v6 = (void *)v5;
      if (v4 == self->_count - 1) {
        unint64_t v7 = @"%@";
      }
      else {
        unint64_t v7 = @"%@,\n";
      }
      objc_msgSend(v3, "appendFormat:", v7, v5);

      ++v4;
    }
    while (v4 < self->_count);
  }
  [v3 appendString:@"}"];
  return v3;
}

- (id)objectValueClassBlock
{
  return self->_objectValueClassBlock;
}

- (id)valueClassBlock
{
  return self->_valueClassBlock;
}

- (NSArray)json
{
  return self->_json;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong(&self->_valueClassBlock, 0);
  objc_storeStrong(&self->_objectValueClassBlock, 0);
}

@end