@interface PXTuple
- (BOOL)isEqual:(id)a3;
- (NSArray)objects;
- (PXTuple)init;
- (PXTuple)initWithObjects:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXTuple

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
}

- (PXTuple)initWithObjects:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXTuple.m", 22, @"Invalid parameter not satisfying: %@", @"[objects count] > 0" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PXTuple;
  v6 = [(PXTuple *)&v22 init];
  if (v6)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * i) copy];
          [(NSArray *)v7 addObject:v14];
          uint64_t v12 = [v14 hash] - v12 + 32 * v12;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v12 = 1;
    }

    objects = v6->_objects;
    v6->_hash = v12;
    v6->_objects = v7;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXTuple *)self objects];
    v7 = [v5 objects];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSArray)objects
{
  return self->_objects;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PXTuple;
  v3 = [(PXTuple *)&v8 description];
  id v4 = [(PXTuple *)self objects];
  id v5 = [v4 description];
  v6 = [v3 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (PXTuple)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTuple.m", 18, @"%s is not available as initializer", "-[PXTuple init]");

  abort();
}

@end