@interface PXIndexPathSet
+ (id)indexPathSet;
+ (id)indexPathSetWithIndexPath:(PXSimpleIndexPath *)a3;
+ (id)indexPathSetWithItemIndexPaths:(id)a3 dataSourceIdentifier:(int64_t)a4;
+ (id)indexPathSetWithItemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5;
+ (id)indexPathSetWithSectionIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4;
+ (id)indexPathSetWithSubitemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5 item:(int64_t)a6;
- (BOOL)containsIndexPath:(PXSimpleIndexPath *)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (BOOL)isSupersetOfSet:(id)a3;
- (NSMutableDictionary)_indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
- (NSMutableDictionary)_indexesForSectionsWithItemsByDataSourceIdentifier;
- (NSMutableDictionary)_itemIndexesBySectionByDataSourceIdentifier;
- (NSMutableDictionary)_sectionIndexesByDataSourceIdentifier;
- (NSMutableDictionary)_subitemIndexesByItemBySectionByDataSourceIdentifier;
- (PXIndexPathSet)init;
- (PXSimpleIndexPath)anyItemIndexPath;
- (PXSimpleIndexPath)anySectionIndexPath;
- (PXSimpleIndexPath)anySubitemIndexPath;
- (PXSimpleIndexPath)firstItemIndexPathForDataSourceIdentifier:(SEL)a3;
- (PXSimpleIndexPath)indexPathGreaterThanIndexPath:(SEL)a3;
- (PXSimpleIndexPath)indexPathLessThanIndexPath:(SEL)a3;
- (PXSimpleIndexPath)lastItemIndexPathForDataSourceIdentifier:(SEL)a3;
- (id)description;
- (id)indexPathSetByReplacingDataSourceIdentifier:(int64_t)a3 withDataSourceIdentifier:(int64_t)a4;
- (id)itemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4;
- (id)itemsWithSubitemsForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sectionIndexSetForDataSourceIdentifier:(int64_t)a3;
- (id)sectionsWithItemsForDataSourceIdentifier:(int64_t)a3;
- (id)subitemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 item:(int64_t)a5;
- (int64_t)count;
- (int64_t)itemCount;
- (int64_t)sectionCount;
- (int64_t)subitemCount;
- (void)enumerateAllIndexPathsUsingBlock:(id)a3;
- (void)enumerateDataSourceIdentifiers:(id)a3;
- (void)enumerateItemIndexPathsUsingBlock:(id)a3;
- (void)enumerateItemIndexSetsUsingBlock:(id)a3;
- (void)enumerateSectionIndexPathsUsingBlock:(id)a3;
- (void)enumerateSectionIndexSetsUsingBlock:(id)a3;
- (void)enumerateSubitemIndexPathsUsingBlock:(id)a3;
- (void)enumerateSubitemIndexSetsUsingBlock:(id)a3;
@end

@implementation PXIndexPathSet

- (id)sectionIndexSetForDataSourceIdentifier:(int64_t)a3
{
  sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sectionIndexesByDataSourceIdentifier objectForKeyedSubscript:v4];
  v6 = (void *)[v5 copy];

  return v6;
}

void __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke_2(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = (void *)a1[4];
  v6 = [NSNumber numberWithUnsignedInteger:a2];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if ([v7 count])
  {
    (*(void (**)(void))(a1[5] + 16))();
    *a3 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
  }
}

+ (id)indexPathSetWithItemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(PXMutableIndexPathSet);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__PXIndexPathSet_indexPathSetWithItemIndexes_dataSourceIdentifier_section___block_invoke;
  v11[3] = &unk_26545A208;
  id v12 = v7;
  id v9 = v7;
  [(PXMutableIndexPathSet *)v8 modifyItemIndexSetForDataSourceIdentifier:a4 section:a5 usingBlock:v11];

  return v8;
}

- (NSMutableDictionary)_itemIndexesBySectionByDataSourceIdentifier
{
  return self->__itemIndexesBySectionByDataSourceIdentifier;
}

- (NSMutableDictionary)_indexesForSectionsWithItemsByDataSourceIdentifier
{
  return self->__indexesForSectionsWithItemsByDataSourceIdentifier;
}

uint64_t __75__PXIndexPathSet_indexPathSetWithItemIndexes_dataSourceIdentifier_section___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__subitemIndexesByItemBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__itemIndexesBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__indexesForSectionsWithItemsByDataSourceIdentifier, 0);

  objc_storeStrong((id *)&self->__sectionIndexesByDataSourceIdentifier, 0);
}

- (void)enumerateDataSourceIdentifiers:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, char *))a3;
  char v32 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = [(NSMutableDictionary *)self->__sectionIndexesByDataSourceIdentifier keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, [*(id *)(*((void *)&v28 + 1) + 8 * v9) unsignedIntValue], &v32);
      if (v32) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v32)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = [(NSMutableDictionary *)self->__itemIndexesBySectionByDataSourceIdentifier keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
LABEL_12:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v4[2](v4, [*(id *)(*((void *)&v24 + 1) + 8 * v14) unsignedIntValue], &v32);
        if (v32) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
          if (v12) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    if (!v32)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v15 = [(NSMutableDictionary *)self->__subitemIndexesByItemBySectionByDataSourceIdentifier keyEnumerator];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
LABEL_21:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          v4[2](v4, [*(id *)(*((void *)&v20 + 1) + 8 * v19) unsignedIntValue], &v32);
          if (v32) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v33 count:16];
            if (v17) {
              goto LABEL_21;
            }
            break;
          }
        }
      }
    }
  }
}

void __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 unsignedIntValue];
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 16);
  v10 = [NSNumber numberWithInteger:v8];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke_2;
  v15[3] = &unk_26545AA88;
  id v16 = v7;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v17 = v12;
  uint64_t v18 = v13;
  uint64_t v19 = v8;
  id v14 = v7;
  [v11 enumerateIndexesUsingBlock:v15];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (PXSimpleIndexPath)firstItemIndexPathForDataSourceIdentifier:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXIndexPathSet sectionsWithItemsForDataSourceIdentifier:](self, "sectionsWithItemsForDataSourceIdentifier:");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if ([v15 count])
  {
    itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
    uint64_t v8 = [NSNumber numberWithInteger:a4];
    uint64_t v9 = [(NSMutableDictionary *)itemIndexesBySectionByDataSourceIdentifier objectForKeyedSubscript:v8];

    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "firstIndex"));
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if ([v11 count])
    {
      int64_t v12 = [v15 firstIndex];
      int64_t v13 = [v11 firstIndex];
      retstr->dataSourceIdentifier = a4;
      retstr->section = v12;
      retstr->item = v13;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

- (id)sectionsWithItemsForDataSourceIdentifier:(int64_t)a3
{
  indexesForSectionsWithItemsByDataSourceIdentifier = self->__indexesForSectionsWithItemsByDataSourceIdentifier;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)indexesForSectionsWithItemsByDataSourceIdentifier objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (int64_t)count
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__PXIndexPathSet_count__block_invoke;
  v7[3] = &unk_26545A900;
  v7[4] = &v8;
  [(PXIndexPathSet *)self enumerateSectionIndexSetsUsingBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __23__PXIndexPathSet_count__block_invoke_2;
  v6[3] = &unk_26545A928;
  v6[4] = &v8;
  [(PXIndexPathSet *)self enumerateItemIndexSetsUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23__PXIndexPathSet_count__block_invoke_3;
  v5[3] = &unk_26545A258;
  v5[4] = &v8;
  [(PXIndexPathSet *)self enumerateSubitemIndexSetsUsingBlock:v5];
  int64_t v3 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (void)enumerateItemIndexSetsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_26545A2D0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  [(NSMutableDictionary *)itemIndexesBySectionByDataSourceIdentifier enumerateKeysAndObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

- (void)enumerateSubitemIndexSetsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_26545A348;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  [(NSMutableDictionary *)subitemIndexesByItemBySectionByDataSourceIdentifier enumerateKeysAndObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

- (void)enumerateSectionIndexSetsUsingBlock:(id)a3
{
  id v4 = a3;
  sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__PXIndexPathSet_enumerateSectionIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_26545A2A8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sectionIndexesByDataSourceIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PXMutableIndexPathSet);
  [(PXMutableIndexPathSet *)v4 unionIndexPathSet:self];
  return v4;
}

+ (id)indexPathSet
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (PXIndexPathSet)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXIndexPathSet;
  id v2 = [(PXIndexPathSet *)&v14 init];
  if (v2)
  {
    int64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sectionIndexesByDataSourceIdentifier = v2->__sectionIndexesByDataSourceIdentifier;
    v2->__sectionIndexesByDataSourceIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    indexesForSectionsWithItemsByDataSourceIdentifier = v2->__indexesForSectionsWithItemsByDataSourceIdentifier;
    v2->__indexesForSectionsWithItemsByDataSourceIdentifier = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    itemIndexesBySectionByDataSourceIdentifier = v2->__itemIndexesBySectionByDataSourceIdentifier;
    v2->__itemIndexesBySectionByDataSourceIdentifier = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = v2->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
    v2->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = v9;

    char v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    subitemIndexesByItemBySectionByDataSourceIdentifier = v2->__subitemIndexesByItemBySectionByDataSourceIdentifier;
    v2->__subitemIndexesByItemBySectionByDataSourceIdentifier = v11;
  }
  return v2;
}

- (NSMutableDictionary)_subitemIndexesByItemBySectionByDataSourceIdentifier
{
  return self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
}

- (NSMutableDictionary)_sectionIndexesByDataSourceIdentifier
{
  return self->__sectionIndexesByDataSourceIdentifier;
}

- (NSMutableDictionary)_indexesForItemsWithSubitemsBySectionByDataSourceIdentifier
{
  return self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
}

- (int64_t)itemCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__PXIndexPathSet_itemCount__block_invoke;
  v4[3] = &unk_26545A928;
  v4[4] = &v5;
  [(PXIndexPathSet *)self enumerateItemIndexSetsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)description
{
  int64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PXIndexPathSet;
  id v4 = [(PXIndexPathSet *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@ sectionIndexPaths=%@, itemIndexPaths=%@, subitemIndexPaths=%@>", v4, self->__sectionIndexesByDataSourceIdentifier, self->__itemIndexesBySectionByDataSourceIdentifier, self->__subitemIndexesByItemBySectionByDataSourceIdentifier];

  return v5;
}

- (id)indexPathSetByReplacingDataSourceIdentifier:(int64_t)a3 withDataSourceIdentifier:(int64_t)a4
{
  objc_super v7 = objc_alloc_init(PXMutableIndexPathSet);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke;
  v22[3] = &unk_26545A488;
  int64_t v24 = a3;
  uint64_t v8 = v7;
  long long v23 = v8;
  int64_t v25 = a4;
  [(PXIndexPathSet *)self enumerateSectionIndexSetsUsingBlock:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_3;
  v18[3] = &unk_26545A4B0;
  int64_t v20 = a3;
  uint64_t v9 = v8;
  uint64_t v19 = v9;
  int64_t v21 = a4;
  [(PXIndexPathSet *)self enumerateItemIndexSetsUsingBlock:v18];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_5;
  v14[3] = &unk_26545A4D8;
  int64_t v16 = a3;
  uint64_t v10 = v9;
  id v15 = v10;
  int64_t v17 = a4;
  [(PXIndexPathSet *)self enumerateSubitemIndexSetsUsingBlock:v14];
  char v11 = v15;
  int64_t v12 = v10;

  return v12;
}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a1[5] == a2)
  {
    objc_super v7 = (void *)a1[4];
    uint64_t v8 = a1[6];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_2;
    v9[3] = &unk_26545A208;
    id v10 = v5;
    [v7 modifySectionIndexSetForDataSourceIdentifier:v8 usingBlock:v9];
  }
}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a1[5] == a2)
  {
    uint64_t v9 = (void *)a1[4];
    uint64_t v10 = a1[6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_4;
    v11[3] = &unk_26545A208;
    id v12 = v7;
    [v9 modifyItemIndexSetForDataSourceIdentifier:v10 section:a3 usingBlock:v11];
  }
}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_5(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = v9;
  if (a1[5] == a2)
  {
    char v11 = (void *)a1[4];
    uint64_t v12 = a1[6];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_6;
    v13[3] = &unk_26545A208;
    id v14 = v9;
    [v11 modifySubitemIndexSetForDataSourceIdentifier:v12 section:a3 item:a4 usingBlock:v13];
  }
}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (PXSimpleIndexPath)indexPathLessThanIndexPath:(SEL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  int64_t dataSourceIdentifier = a4->dataSourceIdentifier;
  if (!a4->dataSourceIdentifier) {
    return self;
  }
  uint64_t v8 = self;
  int64_t item = a4->item;
  if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = (void *)self->section;
      uint64_t v12 = [NSNumber numberWithInteger:a4->dataSourceIdentifier];
      v35 = [section objectForKeyedSubscript:v12];

      id v14 = v35;
      if (v35)
      {
        int64_t v13 = [v35 indexLessThanIndex:a4->section];
        id v14 = v35;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v13;
          *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        }
      }
      return (PXSimpleIndexPath *)MEMORY[0x270F9A758](v13, v14);
    }
    subint64_t item = a4->subitem;
    goto LABEL_14;
  }
  subint64_t item = a4->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    if (subitem != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_32;
    }
    id v15 = (void *)self->subitem;
    int64_t v16 = [NSNumber numberWithInteger:a4->dataSourceIdentifier];
    int64_t v17 = [v15 objectForKeyedSubscript:v16];

    uint64_t v18 = [NSNumber numberWithInteger:a4->section];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    if (v19 && (int64_t v20 = [v19 indexLessThanIndex:a4->item], v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
      int64_t v32 = a4->section;
      retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
      retstr->section = v32;
      retstr->int64_t item = v20;
      retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263F089C8]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v22 = [v17 allKeys];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v22);
            }
            objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "unsignedIntegerValue"));
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v24);
      }

      uint64_t v27 = [v21 indexLessThanIndex:a4->section];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v28 = v27;
        long long v29 = [NSNumber numberWithUnsignedInteger:v27];
        long long v30 = [v17 objectForKeyedSubscript:v29];

        int64_t v31 = [v30 lastIndex];
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v28;
          retstr->int64_t item = v31;
          retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }

    return self;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_32:
    v33 = [MEMORY[0x263F08690] currentHandler];
    v34 = NSStringFromSelector(a3);
    [v33 handleFailureInMethod:a3, v8, @"PXIndexPathSet.m", 470, @"%@ not implementd for subitems", v34 object file lineNumber description];

    abort();
  }
  return self;
}

- (PXSimpleIndexPath)indexPathGreaterThanIndexPath:(SEL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  int64_t dataSourceIdentifier = a4->dataSourceIdentifier;
  if (!a4->dataSourceIdentifier) {
    return self;
  }
  uint64_t v8 = self;
  int64_t item = a4->item;
  if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = (void *)self->section;
      uint64_t v12 = [NSNumber numberWithInteger:a4->dataSourceIdentifier];
      v35 = [section objectForKeyedSubscript:v12];

      id v14 = v35;
      if (v35)
      {
        int64_t v13 = [v35 indexGreaterThanIndex:a4->section];
        id v14 = v35;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v13;
          *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        }
      }
      return (PXSimpleIndexPath *)MEMORY[0x270F9A758](v13, v14);
    }
    subint64_t item = a4->subitem;
    goto LABEL_14;
  }
  subint64_t item = a4->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    if (subitem != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_32;
    }
    id v15 = (void *)self->subitem;
    int64_t v16 = [NSNumber numberWithInteger:a4->dataSourceIdentifier];
    int64_t v17 = [v15 objectForKeyedSubscript:v16];

    uint64_t v18 = [NSNumber numberWithInteger:a4->section];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    if (v19 && (int64_t v20 = [v19 indexGreaterThanIndex:a4->item], v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
      int64_t v32 = a4->section;
      retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
      retstr->section = v32;
      retstr->int64_t item = v20;
      retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263F089C8]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v22 = [v17 allKeys];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v22);
            }
            objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "unsignedIntegerValue"));
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v24);
      }

      uint64_t v27 = [v21 indexGreaterThanIndex:a4->section];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v28 = v27;
        long long v29 = [NSNumber numberWithUnsignedInteger:v27];
        long long v30 = [v17 objectForKeyedSubscript:v29];

        int64_t v31 = [v30 firstIndex];
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->int64_t dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v28;
          retstr->int64_t item = v31;
          retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }

    return self;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_32:
    v33 = [MEMORY[0x263F08690] currentHandler];
    v34 = NSStringFromSelector(a3);
    [v33 handleFailureInMethod:a3, v8, @"PXIndexPathSet.m", 433, @"%@ not implementd for subitems", v34 object file lineNumber description];

    abort();
  }
  return self;
}

- (PXSimpleIndexPath)lastItemIndexPathForDataSourceIdentifier:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXIndexPathSet sectionsWithItemsForDataSourceIdentifier:](self, "sectionsWithItemsForDataSourceIdentifier:");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if ([v15 count])
  {
    itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
    uint64_t v8 = [NSNumber numberWithInteger:a4];
    id v9 = [(NSMutableDictionary *)itemIndexesBySectionByDataSourceIdentifier objectForKeyedSubscript:v8];

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "lastIndex"));
    char v11 = [v9 objectForKeyedSubscript:v10];

    if ([v11 count])
    {
      int64_t v12 = [v15 lastIndex];
      int64_t v13 = [v11 lastIndex];
      retstr->int64_t dataSourceIdentifier = a4;
      retstr->section = v12;
      retstr->int64_t item = v13;
      retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

- (void)enumerateAllIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  int64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke;
  v13[3] = &unk_26545A460;
  id v5 = v4;
  id v14 = v5;
  id v15 = &v16;
  [(PXIndexPathSet *)self enumerateSectionIndexPathsUsingBlock:v13];
  if (!*((unsigned char *)v17 + 24))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_2;
    void v10[3] = &unk_26545A460;
    id v6 = v5;
    id v11 = v6;
    int64_t v12 = &v16;
    [(PXIndexPathSet *)self enumerateItemIndexPathsUsingBlock:v10];

    if (!*((unsigned char *)v17 + 24))
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_3;
      v7[3] = &unk_26545A460;
      id v8 = v6;
      id v9 = &v16;
      [(PXIndexPathSet *)self enumerateSubitemIndexPathsUsingBlock:v7];
    }
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  id v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  id v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_3(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  id v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateSubitemIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_26545A438;
  id v5 = v4;
  id v7 = v5;
  id v8 = v9;
  [(PXIndexPathSet *)self enumerateSubitemIndexSetsUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unsigned char *a6)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke_2;
  v11[3] = &unk_26545A410;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = v9;
  uint64_t v13 = v10;
  [a5 enumerateIndexesUsingBlock:v11];
  *a6 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  id v9 = *(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(v7 + 16);
  long long v11 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = v6;
  uint64_t v13 = a2;
  uint64_t result = v9(v7, &v11, v8, a4);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateItemIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_26545A3E8;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(PXIndexPathSet *)self enumerateItemIndexSetsUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke_2;
  void v10[3] = &unk_26545A3C0;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  [a4 enumerateIndexesUsingBlock:v10];
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  long long v10 = *(_OWORD *)(a1 + 48);
  uint64_t v11 = a2;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t result = v7(v6, &v10, v8, a4);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateSectionIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_26545A398;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(PXIndexPathSet *)self enumerateSectionIndexSetsUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke_2;
  void v9[3] = &unk_26545A370;
  uint64_t v12 = a2;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a3 enumerateIndexesUsingBlock:v9];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke_2(void *a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8) + 24;
  uint64_t v9 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v7 + 16);
  v11[0] = v6;
  v11[1] = a2;
  int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t result = v9(v7, v11, v8, a4);
  *a3 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
  return result;
}

- (id)subitemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 item:(int64_t)a5
{
  subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [(NSMutableDictionary *)subitemIndexesByItemBySectionByDataSourceIdentifier objectForKeyedSubscript:v8];
  id v10 = [NSNumber numberWithInteger:a4];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  int64x2_t v12 = [NSNumber numberWithInteger:a5];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v14 = (void *)[v13 copy];

  return v14;
}

- (id)itemsWithSubitemsForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4
{
  indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)indexesForItemsWithSubitemsBySectionByDataSourceIdentifier objectForKeyedSubscript:v6];
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = (void *)[v9 copy];

  return v10;
}

- (id)itemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4
{
  itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)itemIndexesBySectionByDataSourceIdentifier objectForKeyedSubscript:v6];
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = (void *)[v9 copy];

  return v10;
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 unsignedIntValue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_2;
  v12[3] = &unk_26545A320;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = v10;
  uint64_t v14 = v11;
  uint64_t v15 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 integerValue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_3;
  v11[3] = &unk_26545A2F8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = v8;
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([v7 count])
  {
    (*(void (**)(void, void, void, uint64_t, id, uint64_t))(a1[4] + 16))(a1[4], a1[6], a1[7], [v8 integerValue], v7, *(void *)(a1[5] + 8) + 24);
    *a4 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
  }
}

void __54__PXIndexPathSet_enumerateSectionIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([v7 count]) {
    (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 unsignedIntValue], v7, a4);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXIndexPathSet *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSMutableDictionary *)self->__sectionIndexesByDataSourceIdentifier isEqual:v4->__sectionIndexesByDataSourceIdentifier]&& [(NSMutableDictionary *)self->__itemIndexesBySectionByDataSourceIdentifier isEqual:v4->__itemIndexesBySectionByDataSourceIdentifier])
    {
      char v5 = [(NSMutableDictionary *)self->__subitemIndexesByItemBySectionByDataSourceIdentifier isEqual:v4->__subitemIndexesByItemBySectionByDataSourceIdentifier];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (PXSimpleIndexPath)anySubitemIndexPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x4010000000;
  uint64_t v10 = &unk_259D809E3;
  long long v11 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__PXIndexPathSet_anySubitemIndexPath__block_invoke;
  v6[3] = &unk_26545A280;
  void v6[4] = &v7;
  [(PXIndexPathSet *)self enumerateSubitemIndexPathsUsingBlock:v6];
  long long v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->int64_t item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __37__PXIndexPathSet_anySubitemIndexPath__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

- (PXSimpleIndexPath)anyItemIndexPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x4010000000;
  uint64_t v10 = &unk_259D809E3;
  long long v11 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__PXIndexPathSet_anyItemIndexPath__block_invoke;
  v6[3] = &unk_26545A280;
  void v6[4] = &v7;
  [(PXIndexPathSet *)self enumerateItemIndexPathsUsingBlock:v6];
  long long v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->int64_t item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __34__PXIndexPathSet_anyItemIndexPath__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

- (PXSimpleIndexPath)anySectionIndexPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x4010000000;
  uint64_t v10 = &unk_259D809E3;
  long long v11 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__PXIndexPathSet_anySectionIndexPath__block_invoke;
  v6[3] = &unk_26545A280;
  void v6[4] = &v7;
  [(PXIndexPathSet *)self enumerateSectionIndexPathsUsingBlock:v6];
  long long v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->int64_t item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __37__PXIndexPathSet_anySectionIndexPath__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

- (int64_t)subitemCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__PXIndexPathSet_subitemCount__block_invoke;
  v4[3] = &unk_26545A258;
  v4[4] = &v5;
  [(PXIndexPathSet *)self enumerateSubitemIndexSetsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__PXIndexPathSet_subitemCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = [a5 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __27__PXIndexPathSet_itemCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = [a4 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (int64_t)sectionCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__PXIndexPathSet_sectionCount__block_invoke;
  v4[3] = &unk_26545A900;
  v4[4] = &v5;
  [(PXIndexPathSet *)self enumerateSectionIndexSetsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__PXIndexPathSet_sectionCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = [a4 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = [a5 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return [a3 isSupersetOfSet:self];
}

- (BOOL)isSupersetOfSet:(id)a3
{
  long long v4 = (void *)[a3 mutableCopy];
  [v4 minusIndexPathSet:self];
  LOBYTE(self) = [v4 count] == 0;

  return (char)self;
}

- (BOOL)intersectsSet:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v5 = self;
  uint64_t v6 = (PXIndexPathSet *)v4;
  uint64_t v7 = [(PXIndexPathSet *)v6 count];
  if (v7 >= [(PXIndexPathSet *)v5 count])
  {
    uint64_t v8 = v6;
  }
  else
  {

    uint64_t v8 = v5;
    uint64_t v5 = v6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__PXIndexPathSet_intersectsSet___block_invoke;
  v12[3] = &unk_26545A230;
  uint64_t v9 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = &v15;
  [(PXIndexPathSet *)v5 enumerateAllIndexPathsUsingBlock:v12];
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __32__PXIndexPathSet_intersectsSet___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  uint64_t result = [v5 containsIndexPath:v8];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)containsIndexPath:(PXSimpleIndexPath *)a3
{
  if (!a3->dataSourceIdentifier) {
    return 0;
  }
  int64_t item = a3->item;
  if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
      uint64_t v9 = [(NSMutableDictionary *)sectionIndexesByDataSourceIdentifier objectForKeyedSubscript:v8];
      char v6 = [v9 containsIndex:a3->section];
LABEL_13:

      return v6;
    }
    subint64_t item = a3->subitem;
LABEL_9:
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
      uint64_t v9 = [(NSMutableDictionary *)itemIndexesBySectionByDataSourceIdentifier objectForKeyedSubscript:v8];
      long long v11 = [NSNumber numberWithInteger:a3->section];
      long long v12 = [v9 objectForKeyedSubscript:v11];
      char v6 = [v12 containsIndex:a3->item];
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v9 = [(NSMutableDictionary *)subitemIndexesByItemBySectionByDataSourceIdentifier objectForKeyedSubscript:v8];
    long long v11 = [NSNumber numberWithInteger:a3->section];
    long long v12 = [v9 objectForKeyedSubscript:v11];
    uint64_t v14 = [NSNumber numberWithInteger:a3->item];
    uint64_t v15 = [v12 objectForKeyedSubscript:v14];
    char v6 = [v15 containsIndex:a3->subitem];

    goto LABEL_12;
  }
  subint64_t item = a3->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  return 0;
}

+ (id)indexPathSetWithSubitemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5 item:(int64_t)a6
{
  id v9 = a3;
  char v10 = objc_alloc_init(PXMutableIndexPathSet);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__PXIndexPathSet_indexPathSetWithSubitemIndexes_dataSourceIdentifier_section_item___block_invoke;
  v13[3] = &unk_26545A208;
  id v14 = v9;
  id v11 = v9;
  [(PXMutableIndexPathSet *)v10 modifySubitemIndexSetForDataSourceIdentifier:a4 section:a5 item:a6 usingBlock:v13];

  return v10;
}

uint64_t __83__PXIndexPathSet_indexPathSetWithSubitemIndexes_dataSourceIdentifier_section_item___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

+ (id)indexPathSetWithItemIndexPaths:(id)a3 dataSourceIdentifier:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = objc_alloc_init(PXMutableIndexPathSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "px_section");
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __70__PXIndexPathSet_indexPathSetWithItemIndexPaths_dataSourceIdentifier___block_invoke;
        v15[3] = &unk_26545A208;
        void v15[4] = v12;
        [(PXMutableIndexPathSet *)v6 modifyItemIndexSetForDataSourceIdentifier:a4 section:v13 usingBlock:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

void __70__PXIndexPathSet_indexPathSetWithItemIndexPaths_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "addIndex:", objc_msgSend(v2, "px_item"));
}

+ (id)indexPathSetWithSectionIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4
{
  id v5 = a3;
  char v6 = objc_alloc_init(PXMutableIndexPathSet);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__PXIndexPathSet_indexPathSetWithSectionIndexes_dataSourceIdentifier___block_invoke;
  void v9[3] = &unk_26545A208;
  id v10 = v5;
  id v7 = v5;
  [(PXMutableIndexPathSet *)v6 modifySectionIndexSetForDataSourceIdentifier:a4 usingBlock:v9];

  return v6;
}

uint64_t __70__PXIndexPathSet_indexPathSetWithSectionIndexes_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

+ (id)indexPathSetWithIndexPath:(PXSimpleIndexPath *)a3
{
  id v4 = objc_alloc_init(PXMutableIndexPathSet);
  long long v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  [(PXMutableIndexPathSet *)v4 addIndexPath:v7];

  return v4;
}

@end