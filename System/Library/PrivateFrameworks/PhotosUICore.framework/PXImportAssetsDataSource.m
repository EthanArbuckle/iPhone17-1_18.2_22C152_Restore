@interface PXImportAssetsDataSource
- (BOOL)hasAlreadyImportedSection;
- (BOOL)startsAtEnd;
- (NSArray)assetCollections;
- (NSDictionary)assetCollectionsById;
- (NSDictionary)assetsMap;
- (PXImportAssetsDataSource)init;
- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4;
- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4 startsAtEnd:(BOOL)a5;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXSimpleIndexPath)itemIndexPathForItem:(SEL)a3;
- (id)allItems;
- (id)allItemsUnsorted;
- (id)allSelectableItems;
- (id)alreadyImportedCollection;
- (id)alreadyImportedItems;
- (id)assetCollectionForIdentifier:(id)a3;
- (id)assetCollectionForSection:(unint64_t)a3;
- (id)description;
- (id)itemForImportAssetUuid:(id)a3;
- (id)notYetImportedItems;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (int64_t)sectionForAssetCollection:(id)a3;
- (unint64_t)numberOfAlreadyImportedItems;
- (unint64_t)numberOfItems;
- (unint64_t)numberOfNotYetImportedItems;
- (unint64_t)numberOfSelectableItems;
@end

@implementation PXImportAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsMap, 0);
  objc_storeStrong((id *)&self->_assetCollectionsById, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

- (NSDictionary)assetsMap
{
  return self->_assetsMap;
}

- (NSDictionary)assetCollectionsById
{
  return self->_assetCollectionsById;
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (id)itemForImportAssetUuid:(id)a3
{
  id v4 = a3;
  v5 = [(PXImportAssetsDataSource *)self assetsMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)alreadyImportedItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke;
        v11[3] = &unk_1E5DAE2E8;
        id v12 = v3;
        [v9 arrangedObjects:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

void __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_34];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  [*(id *)(a1 + 32) addObjectsFromArray:v6];
}

uint64_t __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isNotYetImported] ^ 1;
}

- (id)notYetImportedItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke;
        v11[3] = &unk_1E5DAE2E8;
        id v12 = v3;
        [v9 arrangedObjects:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

void __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_32];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  [*(id *)(a1 + 32) addObjectsFromArray:v6];
}

uint64_t __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isNotYetImported];
}

- (id)allItemsUnsorted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PXImportAssetsDataSource *)self assetCollections];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) unsortedObjects];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allSelectableItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) unsortedObjects];
        v10 = [v9 firstObject];
        int v11 = [v10 isSelectable];

        if (v11) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __36__PXImportAssetsDataSource_allItems__block_invoke;
        v11[3] = &unk_1E5DAE2E8;
        id v12 = v3;
        [v9 arrangedObjects:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

void __36__PXImportAssetsDataSource_allItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

- (id)alreadyImportedCollection
{
  id v3 = +[PXImportItemViewModel alreadyImportedGroupIdentifier];
  id v4 = [(PXImportAssetsDataSource *)self assetCollectionsById];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (BOOL)hasAlreadyImportedSection
{
  v2 = [(PXImportAssetsDataSource *)self alreadyImportedCollection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)numberOfItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) numberOfItems];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfSelectableItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke;
        v9[3] = &unk_1E5DB33D0;
        v9[4] = &v14;
        [v6 arrangedObjects:v9];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }

  unint64_t v7 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_29];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 count];
}

uint64_t __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSelectable];
}

- (unint64_t)numberOfAlreadyImportedItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke;
        v9[3] = &unk_1E5DB33D0;
        v9[4] = &v14;
        [v6 arrangedObjects:v9];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }

  unint64_t v7 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_27];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 count];
}

BOOL __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDuplicate])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [v2 importDate];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (unint64_t)numberOfNotYetImportedItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(PXImportAssetsDataSource *)self assetCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke;
        v9[3] = &unk_1E5DB33D0;
        v9[4] = &v14;
        [v6 arrangedObjects:v9];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }

  unint64_t v7 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_1514];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 count];
}

uint64_t __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isNotYetImported];
}

- (PXSimpleIndexPath)itemIndexPathForItem:(SEL)a3
{
  id v12 = a4;
  long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v6;
  if ([(NSArray *)self->_assetCollections count])
  {
    int64_t v7 = 0;
    while (1)
    {
      v8 = [(NSArray *)self->_assetCollections objectAtIndexedSubscript:v7];
      uint64_t v9 = [v8 indexOfItem:v12];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (++v7 >= [(NSArray *)self->_assetCollections count]) {
        goto LABEL_7;
      }
    }
    int64_t v10 = v9;
    retstr->dataSourceIdentifier = [(PXImportAssetsDataSource *)self identifier];
    retstr->section = v7;
    retstr->item = v10;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_7:

  return result;
}

- (int64_t)sectionForAssetCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  long long v6 = [(PXImportAssetsDataSource *)self assetCollectionsById];
  int64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    v8 = [(PXImportAssetsDataSource *)self assetCollections];
    int64_t v9 = [v8 indexOfObject:v4];
  }
  else
  {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)assetCollectionForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PXImportAssetsDataSource *)self assetCollectionsById];
    long long v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    long long v6 = 0;
  }
  return v6;
}

- (id)assetCollectionForSection:(unint64_t)a3
{
  uint64_t v5 = [(PXImportAssetsDataSource *)self assetCollections];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    int64_t v7 = [(PXImportAssetsDataSource *)self assetCollections];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }
  return v8;
}

- (BOOL)startsAtEnd
{
  return self->_startsAtEnd;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x4010000000;
  v26 = &unk_1AB5D584F;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v27 = *(_OWORD *)off_1E5DAB028;
  long long v28 = v8;
  int64_t v9 = [v7 itemObject];
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a3, self, @"PXImportAssetsDataSource.m", 100, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v16 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v17);
    uint64_t v18 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a3, self, @"PXImportAssetsDataSource.m", 100, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v16, v18 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  assetCollections = self->_assetCollections;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__PXImportAssetsDataSource_indexPathForObjectReference___block_invoke;
  v19[3] = &unk_1E5DAE2A0;
  id v11 = v9;
  v21 = self;
  v22 = &v23;
  id v20 = v11;
  [(NSArray *)assetCollections enumerateObjectsUsingBlock:v19];
  long long v12 = *((_OWORD *)v24 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v24 + 2);
  *(_OWORD *)&retstr->item = v12;

  _Block_object_dispose(&v23, 8);
  return result;
}

uint64_t __56__PXImportAssetsDataSource_indexPathForObjectReference___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 indexOfItem:*(void *)(a1 + 32)];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = result;
    uint64_t result = [*(id *)(a1 + 40) identifier];
    int64_t v9 = *(void **)(*(void *)(a1 + 48) + 8);
    v9[4] = result;
    void v9[5] = a3;
    v9[6] = v8;
    v9[7] = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5 = *(void *)off_1E5DAAED8;
  if (a3->dataSourceIdentifier != *(void *)off_1E5DAAED8 && a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXImportAssetsDataSource.m" lineNumber:85 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  unint64_t v6 = [(NSArray *)self->_assetCollections objectAtIndexedSubscript:a3->section];
  id v7 = v6;
  int64_t item = a3->item;
  if (a3->dataSourceIdentifier != v5 && a3->section != 0x7FFFFFFFFFFFFFFFLL && item == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = v6;
  }
  else
  {
    id v11 = [v6 itemAtIndex:item];
  }
  long long v12 = v11;

  return v12;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if ([(NSArray *)self->_assetCollections count] <= a3) {
    return 0;
  }
  uint64_t v5 = [(NSArray *)self->_assetCollections objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 numberOfItems];

  return v6;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_assetCollections count];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ <%p> \"%lu\"\n%@", objc_opt_class(), self, -[PXImportAssetsDataSource identifier](self, "identifier"), self->_assetCollections];
}

- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4 startsAtEnd:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXImportAssetsDataSource;
  int64_t v10 = [(PXImportAssetsDataSource *)&v31 init];
  if (v10)
  {
    BOOL v26 = a5;
    uint64_t v11 = [v8 copy];
    assetCollections = v10->_assetCollections;
    v10->_assetCollections = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    assetsMap = v10->_assetsMap;
    v10->_assetsMap = (NSDictionary *)v13;

    long long v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v10->_assetCollections, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = v10->_assetCollections;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v22 = [v21 identifier];
          [v15 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    uint64_t v23 = [v15 copy];
    assetCollectionsById = v10->_assetCollectionsById;
    v10->_assetCollectionsById = (NSDictionary *)v23;

    v10->_startsAtEnd = v26;
  }

  return v10;
}

- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4
{
  return [(PXImportAssetsDataSource *)self initWithAssetCollections:a3 assetsMap:a4 startsAtEnd:0];
}

- (PXImportAssetsDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportAssetsDataSource.m", 28, @"%s is not available as initializer", "-[PXImportAssetsDataSource init]");

  abort();
}

@end