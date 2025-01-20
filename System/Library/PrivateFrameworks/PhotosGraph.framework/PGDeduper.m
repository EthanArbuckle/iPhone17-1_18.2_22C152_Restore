@interface PGDeduper
- (BOOL)itemIsRequired:(id)a3;
- (NSSet)identifiersOfRequiredItems;
- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5;
- (id)requiredItemsInItems:(id)a3;
- (void)setIdentifiersOfRequiredItems:(id)a3;
@end

@implementation PGDeduper

- (void).cxx_destruct
{
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (id)requiredItemsInItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (identifiersOfRequiredItems && [(NSSet *)identifiersOfRequiredItems count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = self->_identifiersOfRequiredItems;
          v14 = [v12 clsIdentifier];
          LODWORD(v13) = [(NSSet *)v13 containsObject:v14];

          if (v13)
          {
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v9 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v4 = v16;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)itemIsRequired:(id)a3
{
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (!identifiersOfRequiredItems) {
    return 0;
  }
  id v4 = [a3 clsIdentifier];
  BOOL v5 = [(NSSet *)identifiersOfRequiredItems containsObject:v4];

  return v5;
}

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end