@interface NSSet(ThreeBars)
- (id)bssidPredicate;
- (id)reformatBSSIDs;
- (id)tilePredicate;
@end

@implementation NSSet(ThreeBars)

- (id)tilePredicate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)MEMORY[0x1D9440170]();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)MEMORY[0x1E4F28F60];
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) key];
        v11 = [v9 predicateWithFormat:@"key == %@", v10];
        [v2 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v2];

  return v12;
}

- (id)reformatBSSIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = (void *)MEMORY[0x1D9440170]();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "reformatBSSID", (void)v11);
        if (v9) {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (id)bssidPredicate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)MEMORY[0x1D9440170]();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)MEMORY[0x1E4F28F60];
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) reformatBSSID];
        long long v11 = [v9 predicateWithFormat:@"bssid == %@", v10];
        [v2 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v12 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v2];

  return v12;
}

@end