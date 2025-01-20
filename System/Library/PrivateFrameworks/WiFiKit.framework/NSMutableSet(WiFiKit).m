@interface NSMutableSet(WiFiKit)
- (void)compareAndUpdateDuplicateScanRecords:()WiFiKit;
@end

@implementation NSMutableSet(WiFiKit)

- (void)compareAndUpdateDuplicateScanRecords:()WiFiKit
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21 = a1;
  v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    v9 = v24;
    v10 = &unk_26478FB98;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v24[0] = __62__NSMutableSet_WiFiKit__compareAndUpdateDuplicateScanRecords___block_invoke;
        v24[1] = v10;
        v24[2] = v12;
        v13 = [v4 objectsPassingTest:v23];
        if ([v13 count] == 1)
        {
          v14 = v9;
          uint64_t v15 = v8;
          id v16 = v4;
          v17 = v10;
          v18 = [v13 anyObject];
          if ([v18 compare:v12] == 1)
          {
            [v21 removeObject:v12];
            [v21 addObject:v18];
          }

          v10 = v17;
          id v4 = v16;
          uint64_t v8 = v15;
          v9 = v14;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  v19 = (void *)[v4 mutableCopy];
  [v19 minusSet:v21];
  if ([v19 count])
  {
    v20 = [v19 allObjects];
    [v21 addObjectsFromArray:v20];
  }
}

@end