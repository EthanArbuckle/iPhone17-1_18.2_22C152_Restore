@interface NSObject(_UITraitStorageAccessors)
- (id)_traitStorageList;
- (void)_applyTraitStorageRecordsForTraitCollection:()_UITraitStorageAccessors;
- (void)_setTraitStorageList:()_UITraitStorageAccessors;
@end

@implementation NSObject(_UITraitStorageAccessors)

- (id)_traitStorageList
{
  return objc_getAssociatedObject(a1, &UITraitStorageListAssociationKey);
}

- (void)_setTraitStorageList:()_UITraitStorageAccessors
{
}

- (void)_applyTraitStorageRecordsForTraitCollection:()_UITraitStorageAccessors
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "_traitStorageList", 0);
  v6 = [v5 traitStorages];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) applyRecordsMatchingTraitCollection:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

@end