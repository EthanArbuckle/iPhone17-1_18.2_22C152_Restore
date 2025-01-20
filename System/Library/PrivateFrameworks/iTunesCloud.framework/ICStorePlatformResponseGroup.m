@interface ICStorePlatformResponseGroup
- (ICStorePlatformResponseGroup)initWithResponses:(id)a3;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (NSArray)allItems;
- (NSDate)expirationDate;
- (NSNumber)accountIdentifier;
- (NSNumber)enqueuerAccountIdentifier;
- (NSString)storefrontIdentifier;
- (id)itemForIdentifier:(id)a3;
- (id)rawResponse;
- (void)enumerateItemsUsingBlock:(id)a3;
@end

@implementation ICStorePlatformResponseGroup

- (void).cxx_destruct
{
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_childResponses, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_childResponses;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "performanceMetrics", (void)v15);

        if (v10)
        {
          v11 = [v9 performanceMetrics];
          v12 = [v11 urlMetrics];
          [v3 addObjectsFromArray:v12];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    v13 = [[ICURLAggregatedPerformanceMetrics alloc] initWithURLMetrics:v3];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (id)rawResponse
{
  return (id)[(NSArray *)self->_childResponses valueForKeyPath:@"rawResponse"];
}

- (NSString)storefrontIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_childResponses;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "storefrontIdentifier", (void)v10);
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSString *)v8;
}

- (id)itemForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_childResponses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "itemForIdentifier:", v4, (void)v13);
        if (v10)
        {
          long long v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

- (NSDate)expirationDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_childResponses;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "expirationDate", (void)v12);
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            uint64_t v10 = [v5 earlierDate:v8];

            id v5 = (id)v10;
          }
          else
          {
            id v5 = v8;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  childResponses = self->_childResponses;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E5ACA800;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)childResponses enumerateObjectsUsingBlock:v7];
}

void __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E5ACA7D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = a4;
  [a2 enumerateItemsUsingBlock:v6];
}

uint64_t __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  char v6 = v7;
  *a3 = v7;
  **(unsigned char **)(a1 + 40) = v6;
  return result;
}

- (NSNumber)enqueuerAccountIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_childResponses;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "enqueuerAccountIdentifier", (void)v10);
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (NSNumber *)v8;
}

- (NSArray)allItems
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICStorePlatformResponseGroup_allItems__block_invoke;
  v5[3] = &unk_1E5ACB768;
  v5[4] = v3;
  [(ICStorePlatformResponseGroup *)self enumerateItemsUsingBlock:v5];

  return (NSArray *)v3;
}

uint64_t __40__ICStorePlatformResponseGroup_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSNumber)accountIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_childResponses;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "accountIdentifier", (void)v10);
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (NSNumber *)v8;
}

- (ICStorePlatformResponseGroup)initWithResponses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformResponseGroup;
  uint64_t v5 = [(ICStorePlatformResponseGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    childResponses = v5->_childResponses;
    v5->_childResponses = (NSArray *)v6;
  }
  return v5;
}

@end