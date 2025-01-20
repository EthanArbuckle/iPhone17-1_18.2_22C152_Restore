@interface PXSectionedDataSource
+ (id)emptyDataSource;
- (BOOL)containsAnyItems;
- (BOOL)containsMultipleItems;
- (BOOL)couldObjectReferenceAppear:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)objectReferenceClassForItem;
- (Class)objectReferenceClassForSection;
- (Class)objectReferenceClassForSubItem;
- (OS_os_log)sectionedDataSourceLog;
- (PXFastEnumeration)allItemsEnumerator;
- (PXFastEnumeration)allObjectsEnumerator;
- (PXFastEnumeration)allSectionsEnumerator;
- (PXIndexPathSet)allIndexPaths;
- (PXIndexPathSet)allItemIndexPaths;
- (PXIndexPathSet)allSectionIndexPaths;
- (PXSectionedDataSource)init;
- (PXSimpleIndexPath)convertIndexPath:(SEL)a3 fromSectionedDataSource:(PXSimpleIndexPath *)a4;
- (PXSimpleIndexPath)firstItemIndexPath;
- (PXSimpleIndexPath)firstNonEmptySectionAtOrBeforeSection:(SEL)a3;
- (PXSimpleIndexPath)firstSectionIndexPath;
- (PXSimpleIndexPath)indexPathForIndexPath:(SEL)a3 offset:(PXSimpleIndexPath *)a4;
- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXSimpleIndexPath)lastItemIndexPath;
- (PXSimpleIndexPath)lastSectionIndexPath;
- (id)convertIndexPathSet:(id)a3 fromSectionedDataSource:(id)a4;
- (id)description;
- (id)fetchAllItemObjects;
- (id)indexPathSetForItemsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathSetForObjectIDs:(id)a3;
- (id)indexPathSetFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4;
- (id)itemIndexPathsForSections:(id)a3;
- (id)itemsEnumeratorForIndexPaths:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectIDsForIndexPathSet:(id)a3;
- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectReferenceForObjectReference:(id)a3;
- (id)objectsEnumeratorForIndexPaths:(id)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)sectionsEnumeratorForIndexPaths:(id)a3;
- (int64_t)_numberOfAssetsWithMaximum:(int64_t)a3;
- (int64_t)identifier;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (int64_t)totalNumberOfItems;
- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 untilEndIndexPath:(PXSimpleIndexPath *)a4 usingBlock:(id)a5;
@end

@implementation PXSectionedDataSource

+ (id)emptyDataSource
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (PXSectionedDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedDataSource;
  result = [(PXSectionedDataSource *)&v3 init];
  if (result)
  {
    result->_identifier = (int)atomic_fetch_add(uniqueDataSourceIdentifier, 1u);
    result->_lastItemIndexPathCache.dataSourceIdentifier = 1;
    *(_OWORD *)&result->_totalNumberOfItemsCache = xmmword_259D747E0;
  }
  return result;
}

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSectionedDataSource *)self identifier])
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 133, @"%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use.", self, a3->dataSourceIdentifier, -[PXSectionedDataSource identifier](self, "identifier") object file lineNumber description];
  }
  if (!a3->dataSourceIdentifier) {
    goto LABEL_7;
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a3->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v13 = *(_OWORD *)&a3->item;
      long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
      long long v28 = v13;
      v12 = [(PXSectionedDataSource *)self objectAtIndexPath:&v27];
      v11 = [(PXSectionedDataSource *)self objectReferenceClassForSection];
      v9 = 0;
LABEL_13:
      v10 = 0;
      goto LABEL_15;
    }
    subint64_t item = a3->subitem;
  }
  if (subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v14 = *(_OWORD *)&a3->item;
    long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v28 = v14;
    v9 = [(PXSectionedDataSource *)self objectAtIndexPath:&v27];
    v26[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v26[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v12 = [(PXSectionedDataSource *)self objectAtIndexPath:v26];
    v11 = [(PXSectionedDataSource *)self objectReferenceClassForItem];
    goto LABEL_13;
  }
LABEL_14:
  long long v15 = *(_OWORD *)&a3->item;
  long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v28 = v15;
  v10 = [(PXSectionedDataSource *)self objectAtIndexPath:&v27];
  int64_t v16 = a3->item;
  long long v23 = *(_OWORD *)&a3->dataSourceIdentifier;
  int64_t v24 = v16;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = [(PXSectionedDataSource *)self objectAtIndexPath:&v23];
  v22[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v22[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v12 = [(PXSectionedDataSource *)self objectAtIndexPath:v22];
  v11 = [(PXSectionedDataSource *)self objectReferenceClassForSubItem];
LABEL_15:
  id v17 = [v11 alloc];
  long long v18 = *(_OWORD *)&a3->item;
  long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v28 = v18;
  v19 = (void *)[v17 initWithSectionObject:v12 itemObject:v9 subitemObject:v10 indexPath:&v27];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(PXSectionedDataSource *)self identifier];
    uint64_t v7 = [v5 identifier];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)containsAnyItems
{
  containsAnyItemsCache = self->_containsAnyItemsCache;
  if (containsAnyItemsCache)
  {
    return [(NSNumber *)containsAnyItemsCache BOOLValue];
  }
  else
  {
    BOOL v5 = [(PXSectionedDataSource *)self _numberOfAssetsWithMaximum:1] > 0;
    int64_t v6 = [NSNumber numberWithBool:v5];
    uint64_t v7 = self->_containsAnyItemsCache;
    self->_containsAnyItemsCache = v6;

    return v5;
  }
}

- (int64_t)_numberOfAssetsWithMaximum:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = [(PXSectionedDataSource *)self identifier];
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__PXSectionedDataSource__numberOfAssetsWithMaximum___block_invoke;
  v7[3] = &unk_26545AD78;
  v7[4] = &v9;
  v7[5] = a3;
  [(PXSectionedDataSource *)self enumerateItemIndexPathsStartingAtIndexPath:v8 reverseDirection:0 usingBlock:v7];
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v26 = a4;
  BOOL v8 = a5;
  uint64_t v9 = v8;
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (!a3->dataSourceIdentifier) {
    goto LABEL_25;
  }
  if (v8)
  {
    if (dataSourceIdentifier)
    {
LABEL_4:
      if (a3->item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_6;
      }
    }
  }
  else
  {
    long long v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 240, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
    if (a3->dataSourceIdentifier) {
      goto LABEL_4;
    }
  }
  int64_t v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 241, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(startIndexPath)" object file lineNumber description];

  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
LABEL_6:
  if (dataSourceIdentifier != [(PXSectionedDataSource *)self identifier])
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 242, @"%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use.", self, a3->dataSourceIdentifier, -[PXSectionedDataSource identifier](self, "identifier") object file lineNumber description];
  }
  if (v26) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  int64_t section = a3->section;
  int64_t v13 = [(PXSectionedDataSource *)self numberOfSections];
  int64_t item = a3->item;
  char v28 = 0;
  if ((section & 0x8000000000000000) == 0)
  {
    int64_t v15 = v13;
    int64_t v16 = a3->dataSourceIdentifier;
    subint64_t item = a3->subitem;
    uint64_t v18 = section;
    do
    {
      if (v18 >= v15 || v28) {
        break;
      }
      int64_t v19 = [(PXSectionedDataSource *)self numberOfItemsInSection:v18];
      int64_t v20 = v19 - 1;
      if (!v26) {
        int64_t v20 = 0;
      }
      if (v18 != section) {
        int64_t item = v20;
      }
      if ((item & 0x8000000000000000) == 0)
      {
        int64_t v21 = v19;
        do
        {
          if (item >= v21) {
            break;
          }
          if (v28) {
            break;
          }
          v22 = (void (*)(void *, void *, char *))v9[2];
          v27[0] = v16;
          v27[1] = v18;
          v27[2] = item;
          v27[3] = subitem;
          v22(v9, v27, &v28);
          item += v11;
        }
        while (item >= 0);
      }
      v18 += v11;
    }
    while (v18 >= 0);
  }
LABEL_25:
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containsMultipleItemsCache, 0);

  objc_storeStrong((id *)&self->_containsAnyItemsCache, 0);
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = v6;
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->int64_t item = 0u;
  if (v6)
  {
    [v6 indexPath];
    if (v13 == [(PXSectionedDataSource *)self identifier])
    {
      [v7 indexPath];
LABEL_7:
      long long v8 = v11;
      long long v9 = v12;
      goto LABEL_8;
    }
  }
  else if (![(PXSectionedDataSource *)self identifier])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    goto LABEL_7;
  }
  long long v8 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v9 = *(_OWORD *)&PXSimpleIndexPathNull[16];
LABEL_8:
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v8;
  *(_OWORD *)&retstr->int64_t item = v9;

  return result;
}

- (PXSimpleIndexPath)lastItemIndexPath
{
  id v4 = self + 2;
  if (self[2].dataSourceIdentifier == 1)
  {
    int64_t v5 = self;
    *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
    self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)self containsAnyItems];
    if (self)
    {
      self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 numberOfSections];
      int64_t v6 = (int64_t)self;
      while (v6-- >= 1)
      {
        self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 numberOfItemsInSection:v6];
        long long v8 = (char *)&self[-1].subitem + 7;
        if ((uint64_t)self >= 1)
        {
          self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 identifier];
          retstr->int64_t dataSourceIdentifier = (int64_t)self;
          retstr->int64_t section = v6;
          retstr->int64_t item = (int64_t)v8;
          retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }
    long long v9 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&v4->int64_t dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&v4->int64_t item = v9;
  }
  else
  {
    long long v10 = *(_OWORD *)&self[2].item;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)&v4->dataSourceIdentifier;
    *(_OWORD *)&retstr->int64_t item = v10;
  }
  return self;
}

uint64_t __52__PXSectionedDataSource__numberOfAssetsWithMaximum___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= *(void *)(result + 40)) {
    *a3 = 1;
  }
  return result;
}

- (id)fetchAllItemObjects
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(PXSectionedDataSource *)self allSectionIndexPaths];
  [(PXSectionedDataSource *)self prefetchSections:v4];

  [(PXSectionedDataSource *)self firstItemIndexPath];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__PXSectionedDataSource_fetchAllItemObjects__block_invoke;
  v8[3] = &unk_26545ACE8;
  id v5 = v3;
  id v9 = v5;
  long long v10 = self;
  [(PXSectionedDataSource *)self enumerateItemIndexPathsStartingAtIndexPath:v11 reverseDirection:0 usingBlock:v8];
  id v6 = v5;

  return v6;
}

void __44__PXSectionedDataSource_fetchAllItemObjects__block_invoke(uint64_t a1, _OWORD *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  id v5 = [v2 objectAtIndexPath:v6];
  [v3 addObject:v5];
}

- (BOOL)couldObjectReferenceAppear:(id)a3
{
  return 1;
}

- (id)objectIDsForIndexPathSet:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v5, "count"));
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__PXSectionedDataSource_objectIDsForIndexPathSet___block_invoke;
    v11[3] = &unk_26545AD50;
    v11[4] = self;
    SEL v13 = a2;
    id v7 = v6;
    id v12 = v7;
    [v5 enumerateAllIndexPathsUsingBlock:v11];
    long long v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9D8] orderedSet];
  }

  return v9;
}

void __50__PXSectionedDataSource_objectIDsForIndexPathSet___block_invoke(uint64_t a1, _OWORD *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  id v5 = [v3 objectIDAtIndexPath:v6];
  [*(id *)(a1 + 40) addObject:v5];
}

- (id)indexPathSetForObjectIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[PXIndexPathSet indexPathSet];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        [(PXSectionedDataSource *)self indexPathForObjectID:v11];
        v13[0] = v14;
        v13[1] = v15;
        [v5 addIndexPath:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)indexPathSetFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4
{
  v42 = objc_alloc_init(PXMutableIndexPathSet);
  int64_t v8 = [(PXSectionedDataSource *)self identifier];
  if (!a3->dataSourceIdentifier)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 463, @"Invalid parameter not satisfying: %@", @"!PXSimpleIndexPathIsNull(fromIndexPath)" object file lineNumber description];
  }
  if (!a4->dataSourceIdentifier)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 464, @"Invalid parameter not satisfying: %@", @"!PXSimpleIndexPathIsNull(toIndexPath)" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier != v8)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 465, @"Invalid parameter not satisfying: %@", @"fromIndexPath.dataSourceIdentifier == dataSourceIdentifier" object file lineNumber description];
  }
  int64_t dataSourceIdentifier = v8;
  if (a4->dataSourceIdentifier != v8)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 466, @"Invalid parameter not satisfying: %@", @"toIndexPath.dataSourceIdentifier == dataSourceIdentifier" object file lineNumber description];

    int64_t dataSourceIdentifier = a4->dataSourceIdentifier;
  }
  int64_t v10 = a3->dataSourceIdentifier;
  int64_t item = a3->item;
  BOOL v12 = a3->dataSourceIdentifier < dataSourceIdentifier;
  if (a3->dataSourceIdentifier != dataSourceIdentifier
    || (section = a3->section, int64_t v14 = a4->section, v12 = section < v14, section != v14)
    || (int64_t v15 = a4->item, v12 = item < v15, item != v15))
  {
    if (v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (a3->subitem > a4->subitem)
  {
LABEL_15:
    long long v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v16 = *(_OWORD *)&a4->item;
    long long v18 = *(_OWORD *)&a3->item;
    *(_OWORD *)&a4->int64_t dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&a4->int64_t item = v18;
    *(_OWORD *)&a3->int64_t dataSourceIdentifier = v17;
    *(_OWORD *)&a3->int64_t item = v16;
    int64_t v10 = a3->dataSourceIdentifier;
    int64_t item = a3->item;
  }
LABEL_16:
  if (!v10) {
    goto LABEL_63;
  }
  int64_t v19 = a3->section;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a3->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_63;
      }
      int64_t v21 = a4->dataSourceIdentifier;
      goto LABEL_41;
    }
  }
  else
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!a4->dataSourceIdentifier || a4->section == 0x7FFFFFFFFFFFFFFFLL || a4->item != 0x7FFFFFFFFFFFFFFFLL)
      {
        v39 = [MEMORY[0x263F08690] currentHandler];
        [v39 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 476, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(toIndexPath)" object file lineNumber description];
      }
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke;
      v45[3] = &__block_descriptor_96_e27_v16__0__NSMutableIndexSet_8l;
      long long v22 = *(_OWORD *)&a3->item;
      long long v46 = *(_OWORD *)&a3->dataSourceIdentifier;
      long long v47 = v22;
      long long v23 = *(_OWORD *)&a4->item;
      long long v48 = *(_OWORD *)&a4->dataSourceIdentifier;
      long long v49 = v23;
      [(PXMutableIndexPathSet *)v42 modifySectionIndexSetForDataSourceIdentifier:v8 usingBlock:v45];
      goto LABEL_63;
    }
    subint64_t item = a3->subitem;
  }
  int64_t v21 = a4->dataSourceIdentifier;
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_41:
    if (!v21 || a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = [MEMORY[0x263F08690] currentHandler];
      [v41 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 498, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSubitem(toIndexPath)" object file lineNumber description];

      int64_t v19 = a3->section;
    }
    if (v19 <= a4->section)
    {
      do
      {
        uint64_t v27 = [(PXSectionedDataSource *)self numberOfItemsInSection:v19];
        int64_t v28 = v27 - 1;
        if (v27 >= 1)
        {
          if (a3->section == v19) {
            int64_t v29 = a3->item;
          }
          else {
            int64_t v29 = 0;
          }
          if (a4->section == v19) {
            int64_t v28 = a4->item;
          }
          if (v29 <= v28)
          {
            int64_t v30 = v28 + 1;
            do
            {
              uint64_t v31 = [(PXSectionedDataSource *)self numberOfSubitemsInItem:v29 section:v19];
              int64_t v32 = v31 - 1;
              if (v31 >= 1)
              {
                if (a3->section == v19 && v29 == a3->item) {
                  int64_t v33 = a3->subitem;
                }
                else {
                  int64_t v33 = 0;
                }
                if (a4->section == v19 && v29 == a4->item) {
                  int64_t v32 = a4->subitem;
                }
                v43[0] = MEMORY[0x263EF8330];
                v43[1] = 3221225472;
                v43[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_3;
                v43[3] = &__block_descriptor_48_e27_v16__0__NSMutableIndexSet_8l;
                v43[4] = v33;
                v43[5] = v32 - v33 + 1;
                [(PXMutableIndexPathSet *)v42 modifySubitemIndexSetForDataSourceIdentifier:v8 section:v19 item:v29 usingBlock:v43];
              }
              ++v29;
            }
            while (v30 != v29);
          }
        }
        BOOL v12 = v19++ < a4->section;
      }
      while (v12);
    }
    goto LABEL_63;
  }
  if (!v21 || a4->item == 0x7FFFFFFFFFFFFFFFLL || a4->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 483, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(toIndexPath)" object file lineNumber description];

    int64_t v19 = a3->section;
  }
  if (v19 <= a4->section)
  {
    do
    {
      uint64_t v24 = [(PXSectionedDataSource *)self numberOfItemsInSection:v19];
      int64_t v25 = v24 - 1;
      if (v24 >= 1)
      {
        if (v19 == a3->section) {
          int64_t v26 = a3->item;
        }
        else {
          int64_t v26 = 0;
        }
        if (v19 == a4->section) {
          int64_t v25 = a4->item;
        }
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_2;
        v44[3] = &__block_descriptor_48_e27_v16__0__NSMutableIndexSet_8l;
        v44[4] = v26;
        v44[5] = v25 - v26 + 1;
        [(PXMutableIndexPathSet *)v42 modifyItemIndexSetForDataSourceIdentifier:v8 section:v19 usingBlock:v44];
      }
      BOOL v12 = v19++ < a4->section;
    }
    while (v12);
  }
LABEL_63:

  return v42;
}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:");
}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)itemIndexPathsForSections:(id)a3
{
  id v4 = a3;
  id v5 = +[PXIndexPathSet indexPathSet];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__PXSectionedDataSource_itemIndexPathsForSections___block_invoke;
  v10[3] = &unk_26545ACE8;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateSectionIndexPathsUsingBlock:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __51__PXSectionedDataSource_itemIndexPathsForSections___block_invoke(uint64_t a1, _OWORD *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  id v5 = [v3 indexPathSetForItemsInIndexPath:v6];
  [*(id *)(a1 + 40) unionIndexPathSet:v5];
}

- (id)indexPathSetForItemsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSectionedDataSource *)self identifier])
  {
    long long v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 427, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (!a3->dataSourceIdentifier)
  {
LABEL_6:
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 428, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath) || PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];

    int64_t section = a3->section;
    int64_t item = a3->item;
    if (!a3->dataSourceIdentifier) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  int64_t section = a3->section;
  int64_t item = a3->item;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
LABEL_13:
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (item != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_13;
  }
  int64_t item = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
  if (section != 0x7FFFFFFFFFFFFFFFLL && item == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = [(PXSectionedDataSource *)self numberOfItemsInSection:section];
    id v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v10);
    uint64_t v12 = +[PXIndexPathSet indexPathSetWithItemIndexes:v11 dataSourceIdentifier:[(PXSectionedDataSource *)self identifier] section:section];
    goto LABEL_17;
  }
LABEL_14:
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 437, @"Invalid parameter not satisfying: %@", @"indexPath.section != NSNotFound" object file lineNumber description];

    int64_t section = a3->section;
    int64_t item = a3->item;
  }
  int64_t v13 = [(PXSectionedDataSource *)self numberOfSubitemsInItem:item section:section];
  id v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v13);
  uint64_t v12 = +[PXIndexPathSet indexPathSetWithSubitemIndexes:v11 dataSourceIdentifier:[(PXSectionedDataSource *)self identifier] section:section item:item];
LABEL_17:
  int64_t v14 = (void *)v12;

  return v14;
}

- (PXFastEnumeration)allObjectsEnumerator
{
  objc_super v3 = [(PXSectionedDataSource *)self allIndexPaths];
  long long v4 = [(PXSectionedDataSource *)self objectsEnumeratorForIndexPaths:v3];

  return (PXFastEnumeration *)v4;
}

- (id)objectsEnumeratorForIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSectionedDataSourceEnumerator alloc] initWithDataSource:self indexPathSet:v4 enumeratedTypes:7];

  return v5;
}

- (PXFastEnumeration)allSectionsEnumerator
{
  objc_super v3 = [(PXSectionedDataSource *)self allSectionIndexPaths];
  id v4 = [(PXSectionedDataSource *)self sectionsEnumeratorForIndexPaths:v3];

  return (PXFastEnumeration *)v4;
}

- (id)sectionsEnumeratorForIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSectionedDataSourceEnumerator alloc] initWithDataSource:self indexPathSet:v4 enumeratedTypes:1];

  return v5;
}

- (PXFastEnumeration)allItemsEnumerator
{
  objc_super v3 = [(PXSectionedDataSource *)self allItemIndexPaths];
  id v4 = [(PXSectionedDataSource *)self itemsEnumeratorForIndexPaths:v3];

  return (PXFastEnumeration *)v4;
}

- (id)itemsEnumeratorForIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSectionedDataSourceEnumerator alloc] initWithDataSource:self indexPathSet:v4 enumeratedTypes:2];

  return v5;
}

- (PXIndexPathSet)allIndexPaths
{
  objc_super v3 = +[PXIndexPathSet indexPathSet];
  id v4 = [(PXSectionedDataSource *)self allSectionIndexPaths];
  [v3 unionIndexPathSet:v4];

  id v5 = [(PXSectionedDataSource *)self allItemIndexPaths];
  [v3 unionIndexPathSet:v5];

  return (PXIndexPathSet *)v3;
}

- (PXIndexPathSet)allItemIndexPaths
{
  long long v7 = 0u;
  long long v8 = 0u;
  [(PXSectionedDataSource *)self firstItemIndexPath];
  long long v5 = 0u;
  long long v6 = 0u;
  [(PXSectionedDataSource *)self lastItemIndexPath];
  objc_super v3 = +[PXIndexPathSet indexPathSet];

  return (PXIndexPathSet *)v3;
}

- (PXSimpleIndexPath)firstItemIndexPath
{
  id v4 = self + 1;
  if (self[1].dataSourceIdentifier == 1)
  {
    long long v5 = self;
    *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
    self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)self containsAnyItems];
    if (self)
    {
      self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 numberOfSections];
      if ((uint64_t)self >= 1)
      {
        int64_t v6 = 0;
        while ([(PXSimpleIndexPath *)v5 numberOfItemsInSection:v6] < 1)
        {
          ++v6;
          self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 numberOfSections];
          if (v6 >= (uint64_t)self) {
            goto LABEL_10;
          }
        }
        self = (PXSimpleIndexPath *)[(PXSimpleIndexPath *)v5 identifier];
        retstr->int64_t dataSourceIdentifier = (int64_t)self;
        retstr->int64_t section = v6;
        *(_OWORD *)&retstr->int64_t item = xmmword_259D747C0;
      }
    }
LABEL_10:
    long long v8 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&v4->int64_t dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&v4->int64_t item = v8;
  }
  else
  {
    long long v7 = *(_OWORD *)&self[1].item;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)&v4->dataSourceIdentifier;
    *(_OWORD *)&retstr->int64_t item = v7;
  }
  return self;
}

- (PXSimpleIndexPath)firstNonEmptySectionAtOrBeforeSection:(SEL)a3
{
  result = (PXSimpleIndexPath *)[(PXSectionedDataSource *)self containsAnyItems];
  uint64_t v9 = (PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (!result)
  {
LABEL_9:
    long long v12 = *(_OWORD *)&v9->item;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)&v9->dataSourceIdentifier;
    *(_OWORD *)&retstr->int64_t item = v12;
    return result;
  }
  int64_t dataSourceIdentifier = (PXSimpleIndexPath *)a4->dataSourceIdentifier;
  result = [(PXSectionedDataSource *)self identifier];
  if (dataSourceIdentifier != result)
  {
    int64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a3, self, @"PXSectionedDataSource.m", 334, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&retstr->int64_t item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  if ((a4->section & 0x8000000000000000) == 0)
  {
    while (1)
    {
      result = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:");
      if ((uint64_t)result > 0) {
        break;
      }
      int64_t section = a4->section;
      a4->int64_t section = section - 1;
      if (section <= 0) {
        return result;
      }
    }
    uint64_t v9 = a4;
    goto LABEL_9;
  }
  return result;
}

- (PXIndexPathSet)allSectionIndexPaths
{
  long long v7 = 0u;
  long long v8 = 0u;
  [(PXSectionedDataSource *)self firstSectionIndexPath];
  long long v5 = 0u;
  long long v6 = 0u;
  [(PXSectionedDataSource *)self lastSectionIndexPath];
  objc_super v3 = +[PXIndexPathSet indexPathSet];

  return (PXIndexPathSet *)v3;
}

- (PXSimpleIndexPath)lastSectionIndexPath
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  result = [(PXSectionedDataSource *)self numberOfSections];
  long long v6 = (char *)&result[-1].subitem + 7;
  if ((uint64_t)result >= 1)
  {
    result = [(PXSectionedDataSource *)self identifier];
    retstr->int64_t dataSourceIdentifier = (int64_t)result;
    retstr->int64_t section = (int64_t)v6;
    *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (PXSimpleIndexPath)firstSectionIndexPath
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  result = [(PXSectionedDataSource *)self numberOfSections];
  if ((uint64_t)result >= 1)
  {
    result = [(PXSectionedDataSource *)self identifier];
    retstr->int64_t dataSourceIdentifier = (int64_t)result;
    *(_OWORD *)&retstr->int64_t section = xmmword_259D747C0;
    retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PXSimpleIndexPath)indexPathForIndexPath:(SEL)a3 offset:(PXSimpleIndexPath *)a4
{
  int64_t dataSourceIdentifier = (PXSimpleIndexPath *)a4->dataSourceIdentifier;
  result = [(PXSectionedDataSource *)self identifier];
  if (dataSourceIdentifier != result)
  {
    long long v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a3, self, @"PXSectionedDataSource.m", 282, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v13 = a4->dataSourceIdentifier;
  uint64_t section = a4->section;
  uint64_t item = a4->item;
  subuint64_t item = a4->subitem;
  if (!v13)
  {
LABEL_9:
    if (section < 0) {
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = [(PXSectionedDataSource *)self numberOfSections];
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    section += a5;
    uint64_t item = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
LABEL_11:
  if (subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    item += a5;
    subuint64_t item = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    subitem += a5;
  }
  if (section < 0) {
    goto LABEL_23;
  }
LABEL_15:
  result = [(PXSectionedDataSource *)self numberOfSections];
  if (section < (uint64_t)result)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL
      || (item & 0x8000000000000000) == 0
      && (result = [(PXSectionedDataSource *)self numberOfItemsInSection:section],
          item < (uint64_t)result))
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL
        || (subitem & 0x8000000000000000) == 0
        && (result = [(PXSectionedDataSource *)self numberOfSubitemsInItem:item section:section], subitem < (uint64_t)result))
      {
        retstr->int64_t dataSourceIdentifier = v13;
        retstr->uint64_t section = section;
        retstr->uint64_t item = item;
        retstr->subuint64_t item = subitem;
        return result;
      }
    }
  }
LABEL_23:
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&retstr->uint64_t item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  return result;
}

- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 untilEndIndexPath:(PXSimpleIndexPath *)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  _OWORD v13[2] = __97__PXSectionedDataSource_enumerateItemIndexPathsStartingAtIndexPath_untilEndIndexPath_usingBlock___block_invoke;
  v13[3] = &unk_26545ACC0;
  id v14 = v8;
  long long v9 = *(_OWORD *)&a4->item;
  long long v15 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v16 = v9;
  long long v10 = *(_OWORD *)&a3->item;
  v12[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v12[1] = v10;
  id v11 = v8;
  [(PXSectionedDataSource *)self enumerateItemIndexPathsStartingAtIndexPath:v12 reverseDirection:0 usingBlock:v13];
}

uint64_t __97__PXSectionedDataSource_enumerateItemIndexPathsStartingAtIndexPath_untilEndIndexPath_usingBlock___block_invoke(uint64_t a1, int64x2_t *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(uint64_t (**)(uint64_t, _OWORD *, unsigned char *, uint64_t))(v7 + 16);
  int64x2_t v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v7, v11, a3, a4);
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 40), *a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), a2[1]))), 0xFuLL))))*a3 = 1; {
  return result;
  }
}

- (int64_t)totalNumberOfItems
{
  int64_t totalNumberOfItemsCache = self->_totalNumberOfItemsCache;
  if (totalNumberOfItemsCache == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(PXSectionedDataSource *)self numberOfSections];
    if (v4 < 1)
    {
      int64_t totalNumberOfItemsCache = 0;
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      int64_t totalNumberOfItemsCache = 0;
      do
        totalNumberOfItemsCache += [(PXSectionedDataSource *)self numberOfItemsInSection:v6++];
      while (v5 != v6);
    }
    self->_int64_t totalNumberOfItemsCache = totalNumberOfItemsCache;
  }
  return totalNumberOfItemsCache;
}

- (BOOL)containsMultipleItems
{
  containsMultipleItemsCache = self->_containsMultipleItemsCache;
  if (containsMultipleItemsCache)
  {
    return [(NSNumber *)containsMultipleItemsCache BOOLValue];
  }
  else
  {
    BOOL v5 = [(PXSectionedDataSource *)self _numberOfAssetsWithMaximum:2] > 1;
    uint64_t v6 = [NSNumber numberWithBool:v5];
    uint64_t v7 = self->_containsMultipleItemsCache;
    self->_containsMultipleItemsCache = v6;

    return v5;
  }
}

- (id)convertIndexPathSet:(id)a3 fromSectionedDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXSectionedDataSource *)self isEqual:v7])
  {
    id v8 = v6;
  }
  else
  {
    int64x2_t v9 = objc_alloc_init(PXMutableIndexPathSet);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    _OWORD v12[2] = __69__PXSectionedDataSource_convertIndexPathSet_fromSectionedDataSource___block_invoke;
    v12[3] = &unk_26545AC98;
    v12[4] = self;
    id v13 = v7;
    id v14 = v9;
    long long v10 = v9;
    [v6 enumerateItemIndexPathsUsingBlock:v12];
    id v8 = (id)[(PXMutableIndexPathSet *)v10 copy];
  }

  return v8;
}

void *__69__PXSectionedDataSource_convertIndexPathSet_fromSectionedDataSource___block_invoke(void *a1, long long *a2)
{
  uint64_t result = (void *)a1[4];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = a1[5];
    long long v5 = a2[1];
    long long v7 = *a2;
    long long v8 = v5;
    uint64_t result = (void *)[result convertIndexPath:&v7 fromSectionedDataSource:v4];
    if ((void)v9)
    {
      id v6 = (void *)a1[6];
      long long v7 = v9;
      long long v8 = v10;
      return (void *)[v6 addIndexPath:&v7];
    }
  }
  return result;
}

- (PXSimpleIndexPath)convertIndexPath:(SEL)a3 fromSectionedDataSource:(PXSimpleIndexPath *)a4
{
  id v8 = a5;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  uint64_t v9 = [v8 identifier];
  if (v9 == [(PXSectionedDataSource *)self identifier])
  {
    long long v10 = *(_OWORD *)&a4->item;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)&a4->dataSourceIdentifier;
    *(_OWORD *)&retstr->uint64_t item = v10;
  }
  else
  {
    long long v11 = *(_OWORD *)&a4->item;
    long long v15 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v16 = v11;
    long long v12 = [v8 objectReferenceAtIndexPath:&v15];
    [(PXSectionedDataSource *)self indexPathForObjectReference:v12];
    long long v13 = v16;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v15;
    *(_OWORD *)&retstr->uint64_t item = v13;
  }
  return result;
}

- (id)objectReferenceForObjectReference:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    [v4 indexPath];
    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 == [(PXSectionedDataSource *)self identifier])
  {
    id v7 = v5;
  }
  else
  {
    [(PXSectionedDataSource *)self indexPathForObjectReference:v5];
    id v7 = 0;
  }

  return v7;
}

- (OS_os_log)sectionedDataSourceLog
{
  if (sectionedDataSourceLog_onceToken != -1) {
    dispatch_once(&sectionedDataSourceLog_onceToken, &__block_literal_global_4854);
  }
  id v2 = (void *)sectionedDataSourceLog_sectionedDataSourceLog;

  return (OS_os_log *)v2;
}

uint64_t __47__PXSectionedDataSource_sectionedDataSourceLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PXSectionedDataSource");
  uint64_t v1 = sectionedDataSourceLog_sectionedDataSourceLog;
  sectionedDataSourceLog_sectionedDataSourceLog = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (Class)objectReferenceClassForSubItem
{
  return (Class)objc_opt_class();
}

- (Class)objectReferenceClassForItem
{
  return (Class)objc_opt_class();
}

- (Class)objectReferenceClassForSection
{
  return (Class)objc_opt_class();
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  id v4 = [(PXSectionedDataSource *)self objectAtIndexPath:v6];

  return v4;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 84, @"Method %s is a responsibility of subclass %@", "-[PXSectionedDataSource objectsInIndexPath:]", v7 object file lineNumber description];

  abort();
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXSectionedDataSource.m", 80, @"Method %s is a responsibility of subclass %@", "-[PXSectionedDataSource objectAtIndexPath:]", v7 object file lineNumber description];

  abort();
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSections
{
  return 0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PXSectionedDataSource;
  long long v3 = [(PXSectionedDataSource *)&v6 description];
  id v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" identifier:%ld numberOfSections:%ld", -[PXSectionedDataSource identifier](self, "identifier"), -[PXSectionedDataSource numberOfSections](self, "numberOfSections"));

  return v4;
}

@end