@interface SUUIStoreItemRelationship
- (NSSet)chidItems;
- (SUUIStoreIdentifier)singleParent;
- (SUUIStoreItemRelationship)initWithParent:(id)a3 andChildren:(id)a4;
@end

@implementation SUUIStoreItemRelationship

- (SUUIStoreItemRelationship)initWithParent:(id)a3 andChildren:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SUUIStoreItemRelationship;
  v8 = [(SUUIStoreItemRelationship *)&v25 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    singleParent = v8->_singleParent;
    v8->_singleParent = (SUUIStoreIdentifier *)v9;

    id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copy", (void)v21);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [v11 copy];
    chidItems = v8->_chidItems;
    v8->_chidItems = (NSSet *)v18;
  }
  return v8;
}

- (SUUIStoreIdentifier)singleParent
{
  return self->_singleParent;
}

- (NSSet)chidItems
{
  return self->_chidItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chidItems, 0);
  objc_storeStrong((id *)&self->_singleParent, 0);
}

@end