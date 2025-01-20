@interface SUItemValidator
- (BOOL)validateItems:(id)a3 error:(id *)a4;
- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5;
- (NSArray)validationTests;
- (void)addCollectionValidationTests:(id)a3;
- (void)addItemValidationTests:(id)a3;
- (void)dealloc;
- (void)removeValidationTest:(id)a3;
@end

@implementation SUItemValidator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemValidator;
  [(SUItemValidator *)&v3 dealloc];
}

- (void)addCollectionValidationTests:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_collectionTests) {
    self->_collectionTests = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_collectionTests containsObject:v9] & 1) == 0)
        {
          v10 = (void *)[v9 copy];
          [(NSMutableArray *)self->_collectionTests addObject:v10];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addItemValidationTests:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_itemTests) {
    self->_itemTests = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_itemTests containsObject:v9] & 1) == 0)
        {
          v10 = (void *)[v9 copy];
          [(NSMutableArray *)self->_itemTests addObject:v10];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)removeValidationTest:(id)a3
{
  -[NSMutableArray removeObject:](self->_collectionTests, "removeObject:");
  itemTests = self->_itemTests;

  [(NSMutableArray *)itemTests removeObject:a3];
}

- (BOOL)validateItems:(id)a3 error:(id *)a4
{
  return [(SUItemValidator *)self validateItems:a3 offers:0 error:a4];
}

- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  collectionTests = self->_collectionTests;
  uint64_t v10 = [(NSMutableArray *)collectionTests countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(collectionTests);
      }
      int v14 = [*(id *)(*((void *)&v34 + 1) + 8 * v13) validateItems:a3 offers:a4 error:&v38];
      if (!v14) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)collectionTests countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = self->_itemTests;
    uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (!v28)
    {
      LOBYTE(v14) = 1;
      if (a5) {
        goto LABEL_26;
      }
      return v14;
    }
    uint64_t v29 = *(void *)v31;
    v26 = a5;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
        uint64_t v17 = [a3 count];
        uint64_t v18 = [a4 count];
        if (v17 >= 1)
        {
          uint64_t v19 = v18;
          uint64_t v20 = 0;
          while (1)
          {
            uint64_t v21 = [a3 objectAtIndex:v20];
            uint64_t v22 = v20 >= v19 ? 0 : [a4 objectAtIndex:v20];
            uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObject:v21];
            if ((objc_msgSend(v16, "validateItems:offers:error:", v23, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v22, 0), &v38) & 1) == 0)break; {
            if (v17 == ++v20)
            }
              goto LABEL_21;
          }
          LOBYTE(v14) = 0;
          a5 = v26;
          goto LABEL_25;
        }
LABEL_21:
        ++v15;
      }
      while (v15 != v28);
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
      LOBYTE(v14) = 1;
      a5 = v26;
      uint64_t v28 = v24;
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_25:
  if (a5) {
LABEL_26:
  }
    *a5 = v38;
  return v14;
}

- (NSArray)validationTests
{
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  v4 = v3;
  if (self->_collectionTests) {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  if (self->_itemTests) {
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:");
  }
  return v4;
}

@end