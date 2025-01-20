@interface NSMapTable(TSPersistence)
+ (uint64_t)newTspStrongObjectsMapTable;
+ (uint64_t)newTspWeakObjectsMapTable;
- (void)enumerateIdentifiersAndObjectsUsingBlock:()TSPersistence;
- (void)enumerateObjectsUsingBlock:()TSPersistence;
@end

@implementation NSMapTable(TSPersistence)

+ (uint64_t)newTspWeakObjectsMapTable
{
  id v0 = objc_alloc(MEMORY[0x263F08968]);

  return [v0 initWithKeyOptions:1282 valueOptions:5 capacity:16];
}

+ (uint64_t)newTspStrongObjectsMapTable
{
  id v0 = objc_alloc(MEMORY[0x263F08968]);

  return [v0 initWithKeyOptions:1282 valueOptions:0 capacity:16];
}

- (void)enumerateObjectsUsingBlock:()TSPersistence
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    char v15 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        v4[2](v4, v10, &v15);

        if (v15) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateIdentifiersAndObjectsUsingBlock:()TSPersistence
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    char v16 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        long long v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v12);
        v4[2](v4, v10, v11, &v16);

        if (v16) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end