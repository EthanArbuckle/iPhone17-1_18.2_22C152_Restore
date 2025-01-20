@interface WBSContextResultGrouper
- (WBSContextResultGrouper)init;
- (id)groupItems:(id)a3;
- (unint64_t)minimumNumberOfItemsRequiredInGroup;
- (void)setMinimumNumberOfItemsRequiredInGroup:(unint64_t)a3;
@end

@implementation WBSContextResultGrouper

- (WBSContextResultGrouper)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSContextResultGrouper;
  v2 = [(WBSContextResultGrouper *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_minimumNumberOfItemsRequiredInGroup = 1;
    v4 = v2;
  }

  return v3;
}

- (id)groupItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 groupContextResult];
        if (v12)
        {
          id v13 = [v5 objectForKey:v12];
          if (!v13)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            [v5 setObject:v13 forKey:v12];
          }
          [v13 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = objc_msgSend(v5, "keyEnumerator", 0);
  v15 = [v14 allObjects];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        v21 = [v5 objectForKey:v20];
        if ([v21 count] < self->_minimumNumberOfItemsRequiredInGroup) {
          [v5 removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  return v5;
}

- (unint64_t)minimumNumberOfItemsRequiredInGroup
{
  return self->_minimumNumberOfItemsRequiredInGroup;
}

- (void)setMinimumNumberOfItemsRequiredInGroup:(unint64_t)a3
{
  self->_minimumNumberOfItemsRequiredInGroup = a3;
}

@end