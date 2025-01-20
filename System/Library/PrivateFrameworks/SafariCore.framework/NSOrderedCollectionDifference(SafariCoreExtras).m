@interface NSOrderedCollectionDifference(SafariCoreExtras)
- (id)safari_insertionIndexes;
- (id)safari_removalIndexes;
@end

@implementation NSOrderedCollectionDifference(SafariCoreExtras)

- (id)safari_removalIndexes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E60] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "removals", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v2, "addIndex:", objc_msgSend(v8, "index"));
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v2 copy];
  return v9;
}

- (id)safari_insertionIndexes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E60] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "insertions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v2, "addIndex:", objc_msgSend(v8, "index"));
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v2 copy];
  return v9;
}

@end