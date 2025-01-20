@interface SUUIStoreItemRelationshipCounsellor
- (BOOL)itemHasChildren:(id)a3;
- (BOOL)itemHasParent:(id)a3;
- (NSMutableDictionary)relationshipsDictionary;
- (NSRecursiveLock)lock;
- (SUUIStoreItemRelationshipCounsellor)init;
- (id)childItemsForItem:(id)a3;
- (id)familyForItem:(id)a3;
- (id)parentItemForItem:(id)a3;
- (id)siblingItemsForItem:(id)a3;
- (void)addChildren:(id)a3 forParent:(id)a4;
- (void)removeAllRelationshipsForItem:(id)a3;
- (void)setChildren:(id)a3 forParent:(id)a4;
- (void)setRelationshipsDictionary:(id)a3;
@end

@implementation SUUIStoreItemRelationshipCounsellor

- (SUUIStoreItemRelationshipCounsellor)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIStoreItemRelationshipCounsellor;
  v2 = [(SUUIStoreItemRelationshipCounsellor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    relationshipsDictionary = v2->_relationshipsDictionary;
    v2->_relationshipsDictionary = (NSMutableDictionary *)v3;

    v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    lock = v2->_lock;
    v2->_lock = v5;

    [(NSRecursiveLock *)v2->_lock setName:@"com.apple.iTunesStoreUI.SUUIStoreItemRelationshipCounsellor"];
  }
  return v2;
}

- (BOOL)itemHasParent:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_super v8 = [v7 chidItems];
  char v9 = [v8 containsObject:v4];

  v10 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v10 unlock];

  return v9;
}

- (BOOL)itemHasChildren:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_super v8 = [v7 singleParent];
  char v9 = [v8 isEqual:v4];

  v10 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v10 unlock];

  return v9;
}

- (id)childItemsForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_super v8 = [v7 singleParent];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    v10 = [v7 chidItems];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v11 unlock];

  return v10;
}

- (id)parentItemForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_super v8 = [v7 chidItems];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    v10 = [v7 singleParent];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v11 unlock];

  return v10;
}

- (id)siblingItemsForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_super v8 = [v7 chidItems];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    v10 = [v7 chidItems];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v11 unlock];

  return v10;
}

- (id)familyForItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 set];
  v7 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v7 lock];

  objc_super v8 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  int v9 = [v8 objectForKeyedSubscript:v5];

  if (v9)
  {
    v10 = [v9 chidItems];
    [v6 unionSet:v10];

    v11 = [v9 singleParent];
    [v6 addObject:v11];

    v12 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v12 unlock];

    if ([v6 count])
    {
      v13 = (void *)[v6 copy];
      goto LABEL_6;
    }
  }
  else
  {
    v14 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v14 unlock];
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (void)setChildren:(id)a3 forParent:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_super v8 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v8 lock];

    int v9 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
    v10 = [v9 objectForKeyedSubscript:v7];

    if (v10) {
      [(SUUIStoreItemRelationshipCounsellor *)self removeAllRelationshipsForItem:v7];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
          v17 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
          v18 = [v17 objectForKeyedSubscript:v16];

          if (v18) {
            [(SUUIStoreItemRelationshipCounsellor *)self removeAllRelationshipsForItem:v16];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    v19 = [[SUUIStoreItemRelationship alloc] initWithParent:v7 andChildren:v11];
    v20 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
    [v20 setObject:v19 forKeyedSubscript:v7];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * v25);
          v27 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
          [v27 setObject:v19 forKeyedSubscript:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }

    v28 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v28 unlock];
  }
}

- (void)addChildren:(id)a3 forParent:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_super v8 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v8 lock];

    int v9 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
    v10 = [v9 objectForKeyedSubscript:v7];

    if (v10)
    {
      id v11 = [v10 chidItems];
      uint64_t v12 = [v6 setByAddingObjectsFromSet:v11];

      uint64_t v13 = [[SUUIStoreItemRelationship alloc] initWithParent:v7 andChildren:v12];
      uint64_t v14 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
      [v14 setObject:v13 forKeyedSubscript:v7];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * v19);
            id v21 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
            [v21 setObject:v13 forKeyedSubscript:v20];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }
    }
    else
    {
      [(SUUIStoreItemRelationshipCounsellor *)self setChildren:v6 forParent:v7];
    }
    uint64_t v22 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
    [v22 unlock];
  }
}

- (void)removeAllRelationshipsForItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v5 lock];

  id v6 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    objc_super v8 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
    int v9 = [v7 singleParent];
    [v8 removeObjectForKey:v9];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v7, "chidItems", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
          uint64_t v16 = [(SUUIStoreItemRelationshipCounsellor *)self relationshipsDictionary];
          [v16 removeObjectForKey:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  uint64_t v17 = [(SUUIStoreItemRelationshipCounsellor *)self lock];
  [v17 unlock];
}

- (NSMutableDictionary)relationshipsDictionary
{
  return self->_relationshipsDictionary;
}

- (void)setRelationshipsDictionary:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_relationshipsDictionary, 0);
}

@end