@interface UICollectionViewDiffableDataSource(IC)
- (id)ic_firstIndexPathOfItemIdentifiers:()IC;
- (id)ic_indexPathsOfItemIdentifiers:()IC;
- (id)ic_sortedIndexPathsOfItemIdentifiers:()IC;
@end

@implementation UICollectionViewDiffableDataSource(IC)

- (id)ic_firstIndexPathOfItemIdentifiers:()IC
{
  v1 = objc_msgSend(a1, "ic_sortedIndexPathsOfItemIdentifiers:");
  v2 = [v1 firstObject];

  return v2;
}

- (id)ic_indexPathsOfItemIdentifiers:()IC
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "indexPathForItemIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        objc_msgSend(v5, "ic_addNonNilObject:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)ic_sortedIndexPathsOfItemIdentifiers:()IC
{
  v1 = objc_msgSend(a1, "ic_indexPathsOfItemIdentifiers:");
  v2 = [v1 allObjects];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

@end