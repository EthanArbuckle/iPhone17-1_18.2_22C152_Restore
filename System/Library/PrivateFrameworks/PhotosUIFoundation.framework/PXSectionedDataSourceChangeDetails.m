@interface PXSectionedDataSourceChangeDetails
+ (BOOL)changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5;
+ (BOOL)changesHaveAnyInsertionsRemovalsOrMoves:(id)a3;
+ (PXSectionedDataSourceChangeDetails)changeDetailsWithNoChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
+ (PXSectionedDataSourceChangeDetails)changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6;
+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7;
+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6;
+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7;
+ (id)indexPathSetAfterApplyingChanges:(id)a3 toIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5;
+ (id)indexPathSetAfterRevertingChanges:(id)a3 fromIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5;
+ (void)debug_assertValidChangeDetails:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5;
- (BOOL)hasAnyChanges;
- (BOOL)hasAnyInsertionsRemovalsOrMoves;
- (NSIndexSet)sectionsWithItemChanges;
- (PXArrayChangeDetails)sectionChanges;
- (PXSectionedDataSourceChangeDetails)init;
- (PXSectionedDataSourceChangeDetails)initWithFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4 sectionChanges:(id)a5 itemChangeDetailsBySection:(id)a6 subitemChangeDetailsByItemBySection:(id)a7;
- (PXSectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 withFromDataSourceIdentifier:(int64_t)a4 toDataSourceIdentifier:(int64_t)a5;
- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5;
- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6;
- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5;
- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6;
- (id)changedItemsInSection:(int64_t)a3;
- (id)deletedItemsInSection:(int64_t)a3;
- (id)description;
- (id)indexPathSetAfterApplyingChangesToIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4;
- (id)indexPathSetAfterRevertingChangesFromIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4;
- (id)insertedItemsInSection:(int64_t)a3;
- (id)itemChangesInSection:(int64_t)a3;
- (id)itemsWithSubitemChangesInSection:(int64_t)a3;
- (id)subitemChangesInItem:(int64_t)a3 section:(int64_t)a4;
- (int64_t)fromDataSourceIdentifier;
- (int64_t)toDataSourceIdentifier;
@end

@implementation PXSectionedDataSourceChangeDetails

void __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  v6 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 hasAnyInsertionsRemovalsOrMoves];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v7 = 1;
  }
  else
  {
    v8 = [*(id *)(a1 + 32) itemsWithSubitemChangesInSection:a2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke_2;
    v9[3] = &unk_26545B958;
    uint64_t v11 = a2;
    long long v10 = *(_OWORD *)(a1 + 32);
    [v8 enumerateIndexesUsingBlock:v9];

    char v7 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *a3 = v7;
}

- (id)itemChangesInSection:(int64_t)a3
{
  if ([(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges])
  {
    itemChangeDetailsBySection = self->_itemChangeDetailsBySection;
    v6 = [NSNumber numberWithInteger:a3];
    char v7 = [(NSDictionary *)itemChangeDetailsBySection objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
    }
    long long v10 = v9;
  }
  else
  {
    long long v10 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
  }

  return v10;
}

+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6
{
  long long v7 = *(_OWORD *)&a5->item;
  v9[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v9[1] = v7;
  return (PXSimpleIndexPath *)[a2 indexPathAfterApplyingChanges:a4 toIndexPath:v9 hasIncrementalChanges:a6 objectChanged:a7 changedProperties:0];
}

+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a8;
  long long v15 = *(_OWORD *)&a5->item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&a5->dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v15;
  long long v33 = 0u;
  long long v34 = 0u;
  char v16 = [v13 count] != 0;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        __int16 v32 = 0;
        if (v23)
        {
          long long v24 = *(_OWORD *)&retstr->item;
          v29[0] = *(_OWORD *)&retstr->dataSourceIdentifier;
          v29[1] = v24;
          [v23 indexPathAfterApplyingChangesToIndexPath:v29 hasIncrementalChanges:&v32 objectChanged:(char *)&v32 + 1 changedProperties:v14];
          int v25 = HIBYTE(v32);
          int v26 = v32;
        }
        else
        {
          int v26 = 0;
          int v25 = 0;
          long long v30 = 0u;
          long long v31 = 0u;
        }
        long long v27 = v31;
        *(_OWORD *)&retstr->dataSourceIdentifier = v30;
        *(_OWORD *)&retstr->item = v27;
        v20 |= v25 != 0;
        v16 &= v26 != 0;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }
  else
  {
    char v20 = 0;
  }

  if (a7) {
    *a7 = v20 & 1;
  }
  if (a6) {
    *a6 = v16;
  }

  return result;
}

- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6
{
  id v12 = a7;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (a4->dataSourceIdentifier != self->_fromDataSourceIdentifier || !a4->dataSourceIdentifier) {
    goto LABEL_6;
  }
  int64_t item = a4->item;
  if (a4->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a4->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_6:
        char v15 = 0;
        char v16 = 0;
        goto LABEL_25;
      }
LABEL_15:
      id v39 = v12;
      char v16 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
      unint64_t v28 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterApplyingChangesToIndex:a4->section];
      if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
      int64_t v29 = v28;
      v23 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:v28];
      char v16 = [v23 hasIncrementalChanges];
      uint64_t v30 = [v23 indexAfterApplyingChangesToIndex:a4->item];
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v31 = v30;
        __int16 v32 = [(PXSectionedDataSourceChangeDetails *)self subitemChangesInItem:v30 section:v29];
        char v16 = [v32 hasIncrementalChanges];
        uint64_t v33 = [v32 indexAfterApplyingChangesToIndex:a4->subitem];
        if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        {
          char v15 = 0;
        }
        else
        {
          int64_t v34 = v33;
          long long v36 = [v32 changedIndexes];
          int64_t v38 = v34;
          char v15 = [v36 containsIndex:v34];

          v37 = [v32 changedPropertiesForIndex:v38];
          [v39 addObjectsFromArray:v37];

          retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
          retstr->section = v29;
          retstr->int64_t item = v31;
          retstr->subint64_t item = v38;
        }

        goto LABEL_23;
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v39 = v12;
      char v16 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
      unint64_t v17 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterApplyingChangesToIndex:a4->section];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v18 = v17;
        uint64_t v19 = [(PXArrayChangeDetails *)self->_sectionChanges changedIndexes];
        char v15 = [v19 containsIndex:v18];

        char v20 = [(PXArrayChangeDetails *)self->_sectionChanges changedPropertiesForIndex:v18];
        [v39 addObjectsFromArray:v20];

        id v12 = v39;
        retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
        retstr->section = v18;
        *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        goto LABEL_25;
      }
      goto LABEL_16;
    }
    subint64_t item = a4->subitem;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  id v39 = v12;
  char v16 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
  unint64_t v21 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterApplyingChangesToIndex:a4->section];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v22 = v21;
    v23 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:v21];
    char v16 = [v23 hasIncrementalChanges];
    uint64_t v24 = [v23 indexAfterApplyingChangesToIndex:a4->item];
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v25 = v24;
      int v26 = [v23 changedIndexes];
      char v15 = [v26 containsIndex:v25];

      long long v27 = [v23 changedPropertiesForIndex:v25];
      [v39 addObjectsFromArray:v27];

      retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
      retstr->section = v22;
      retstr->int64_t item = v25;
      retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:
    char v15 = 0;
    goto LABEL_23;
  }
LABEL_16:
  char v15 = 0;
LABEL_24:
  id v12 = v39;
LABEL_25:
  if (a5) {
    *a5 = v16;
  }
  if (a6) {
    *a6 = v15;
  }

  return result;
}

- (id)indexPathSetAfterApplyingChangesToIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 1;
  if ([(PXSectionedDataSourceChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    int64_t v7 = [(PXSectionedDataSourceChangeDetails *)self fromDataSourceIdentifier];
    int64_t v8 = [(PXSectionedDataSourceChangeDetails *)self toDataSourceIdentifier];
    id v9 = [(PXSectionedDataSourceChangeDetails *)self sectionChanges];
    long long v10 = +[PXIndexPathSet indexPathSet];
    if ([v9 hasIncrementalChanges])
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke;
      v30[3] = &unk_26545B9D0;
      int64_t v34 = v7;
      id v11 = v10;
      id v31 = v11;
      int64_t v35 = v8;
      id v12 = v9;
      id v32 = v12;
      uint64_t v33 = &v36;
      [v6 enumerateSectionIndexSetsUsingBlock:v30];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_3;
      v23[3] = &unk_26545B9F8;
      int64_t v28 = v7;
      id v13 = v12;
      id v24 = v13;
      int64_t v25 = self;
      id v14 = v11;
      int64_t v29 = v8;
      id v26 = v14;
      long long v27 = &v36;
      [v6 enumerateItemIndexSetsUsingBlock:v23];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_5;
      v16[3] = &unk_26545BA20;
      int64_t v21 = v7;
      id v17 = v13;
      int64_t v18 = self;
      int64_t v22 = v8;
      id v19 = v14;
      char v20 = &v36;
      [v6 enumerateSubitemIndexSetsUsingBlock:v16];
    }
    else
    {
      *((unsigned char *)v37 + 24) = 0;
    }

    if (!a4) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v10 = objc_msgSend(v6, "indexPathSetByReplacingDataSourceIdentifier:withDataSourceIdentifier:", -[PXSectionedDataSourceChangeDetails fromDataSourceIdentifier](self, "fromDataSourceIdentifier"), -[PXSectionedDataSourceChangeDetails toDataSourceIdentifier](self, "toDataSourceIdentifier"));
    if (!a4) {
      goto LABEL_6;
    }
  }
  *a4 = *((unsigned char *)v37 + 24);
LABEL_6:
  _Block_object_dispose(&v36, 8);

  return v10;
}

- (PXArrayChangeDetails)sectionChanges
{
  return self->_sectionChanges;
}

- (int64_t)toDataSourceIdentifier
{
  return self->_toDataSourceIdentifier;
}

- (int64_t)fromDataSourceIdentifier
{
  return self->_fromDataSourceIdentifier;
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  v3 = self->_hasAnyInsertionsRemovalsOrMovesCache;
  v4 = v3;
  if (v3)
  {
    BOOL v5 = [(NSNumber *)v3 BOOLValue];
  }
  else
  {
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v6 = [(PXSectionedDataSourceChangeDetails *)self sectionChanges];
    char v7 = [v6 hasAnyInsertionsRemovalsOrMoves];

    char v17 = v7;
    if (*((unsigned char *)v15 + 24))
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(PXSectionedDataSourceChangeDetails *)self sectionsWithItemChanges];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke;
      v13[3] = &unk_26545B980;
      v13[4] = self;
      v13[5] = &v14;
      [v9 enumerateIndexesUsingBlock:v13];

      BOOL v8 = *((unsigned char *)v15 + 24) != 0;
    }
    long long v10 = [NSNumber numberWithBool:v8];
    hasAnyInsertionsRemovalsOrMovesCache = self->_hasAnyInsertionsRemovalsOrMovesCache;
    self->_hasAnyInsertionsRemovalsOrMovesCache = v10;

    BOOL v5 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

- (NSIndexSet)sectionsWithItemChanges
{
  return self->_sectionsWithItemChanges;
}

+ (id)indexPathSetAfterApplyingChanges:(id)a3 toIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  char v9 = [v7 count] != 0;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    uint64_t v14 = v8;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = v14;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        char v17 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        char v19 = 0;
        uint64_t v14 = [v17 indexPathSetAfterApplyingChangesToIndexPathSet:v16 hasIncrementalChanges:&v19];

        v9 &= v19 != 0;
        ++v15;
        uint64_t v16 = v14;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v14 = v8;
  }

  if (a5) {
    *a5 = v9;
  }

  return v14;
}

+ (PXSectionedDataSourceChangeDetails)changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  id v7 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
  id v8 = (void *)[v6 initWithFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4 sectionChanges:v7 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

  return (PXSectionedDataSourceChangeDetails *)v8;
}

- (PXSectionedDataSourceChangeDetails)initWithFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4 sectionChanges:(id)a5 itemChangeDetailsBySection:(id)a6 subitemChangeDetailsByItemBySection:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PXSectionedDataSourceChangeDetails;
  uint64_t v16 = [(PXSectionedDataSourceChangeDetails *)&v39 init];
  char v17 = v16;
  if (v16)
  {
    v16->_fromDataSourceIdentifier = a3;
    v16->_toDataSourceIdentifier = a4;
    objc_storeStrong((id *)&v16->_sectionChanges, a5);
    if ([v13 hasIncrementalChanges])
    {
      uint64_t v18 = [v14 copy];
      itemChangeDetailsBySection = v17->_itemChangeDetailsBySection;
      v17->_itemChangeDetailsBySection = (NSDictionary *)v18;

      uint64_t v20 = [v15 copy];
      subitemChangeDetailsByItemBySection = v17->_subitemChangeDetailsByItemBySection;
      v17->_subitemChangeDetailsByItemBySection = (NSDictionary *)v20;

      long long v22 = [MEMORY[0x263F089C8] indexSet];
      long long v23 = v17->_itemChangeDetailsBySection;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke;
      v37[3] = &unk_26545B908;
      id v24 = v22;
      id v38 = v24;
      [(NSDictionary *)v23 enumerateKeysAndObjectsUsingBlock:v37];
      uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
      id v26 = v17->_subitemChangeDetailsByItemBySection;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_2;
      v34[3] = &unk_26545B930;
      long long v27 = (NSIndexSet *)v24;
      int64_t v35 = v27;
      int64_t v28 = v25;
      uint64_t v36 = v28;
      [(NSDictionary *)v26 enumerateKeysAndObjectsUsingBlock:v34];
      itemsWithSubitemChangesBySection = v17->_itemsWithSubitemChangesBySection;
      v17->_itemsWithSubitemChangesBySection = v28;
      uint64_t v30 = v28;

      sectionsWithItemChanges = v17->_sectionsWithItemChanges;
      v17->_sectionsWithItemChanges = v27;
      id v32 = v27;
    }
  }

  return v17;
}

uint64_t __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v4 = *(void **)(a1 + 32);

  return [v4 addIndex:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsWithItemChanges, 0);
  objc_storeStrong((id *)&self->_sectionChanges, 0);
  objc_storeStrong((id *)&self->_hasAnyInsertionsRemovalsOrMovesCache, 0);
  objc_storeStrong((id *)&self->_hasAnyChangesCache, 0);
  objc_storeStrong((id *)&self->_subitemChangeDetailsByItemBySection, 0);
  objc_storeStrong((id *)&self->_itemsWithSubitemChangesBySection, 0);

  objc_storeStrong((id *)&self->_itemChangeDetailsBySection, 0);
}

+ (BOOL)changesHaveAnyInsertionsRemovalsOrMoves:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "hasAnyInsertionsRemovalsOrMoves", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (PXSectionedDataSourceChangeDetails)changeDetailsWithNoChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  id v7 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
  long long v8 = (void *)[v6 initWithFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4 sectionChanges:v7 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

  return (PXSectionedDataSourceChangeDetails *)v8;
}

- (id)changedItemsInSection:(int64_t)a3
{
  id v3 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:a3];
  uint64_t v4 = [v3 changedIndexes];

  return v4;
}

- (id)insertedItemsInSection:(int64_t)a3
{
  id v3 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:a3];
  uint64_t v4 = [v3 insertedIndexes];

  return v4;
}

- (id)deletedItemsInSection:(int64_t)a3
{
  id v3 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:a3];
  uint64_t v4 = [v3 removedIndexes];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PXSectionedDataSourceChangeDetails;
  uint64_t v4 = [(PXSectionedDataSourceChangeDetails *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@ ds:%lu->%lu sectionChanges:%@ itemChangesBySection:%@>", v4, self->_fromDataSourceIdentifier, self->_toDataSourceIdentifier, self->_sectionChanges, self->_itemChangeDetailsBySection];

  return v5;
}

- (id)indexPathSetAfterRevertingChangesFromIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  objc_super v7 = +[PXIndexPathSet indexPathSet];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChangesFromIndexPathSet_hasIncrementalChanges___block_invoke;
  v12[3] = &unk_26545BA48;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  id v14 = &v15;
  [v6 enumerateAllIndexPathsUsingBlock:v12];
  if (a4) {
    *a4 = *((unsigned char *)v16 + 24);
  }
  long long v9 = v13;
  id v10 = v8;

  _Block_object_dispose(&v15, 8);

  return v10;
}

void *__110__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChangesFromIndexPathSet_hasIncrementalChanges___block_invoke(void *a1, long long *a2)
{
  char v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  result = (void *)a1[4];
  if (result)
  {
    long long v4 = a2[1];
    long long v9 = *a2;
    long long v10 = v4;
    result = (void *)[result indexPathAfterRevertingChangesFromIndexPath:&v9 hasIncrementalChanges:&v13 objectChanged:0 changedProperties:0];
    if ((void)v11)
    {
      uint64_t v5 = (void *)a1[5];
      long long v9 = v11;
      long long v10 = v12;
      result = (void *)[v5 addIndexPath:&v9];
    }
  }
  uint64_t v6 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v6 + 24)) {
    BOOL v7 = v13 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  char v8 = !v7;
  *(unsigned char *)(v6 + 24) = v8;
  return result;
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 56) == a2)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_2;
    v8[3] = &unk_26545B9A8;
    BOOL v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    [v7 modifySectionIndexSetForDataSourceIdentifier:v6 usingBlock:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 64) == a2)
  {
    uint64_t v8 = [*(id *)(a1 + 32) indexAfterApplyingChangesToIndex:a3];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      id v10 = [*(id *)(a1 + 40) itemChangesInSection:v8];
      if ([v10 hasIncrementalChanges])
      {
        long long v11 = *(void **)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 72);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_4;
        v13[3] = &unk_26545B9A8;
        id v14 = v10;
        id v15 = v7;
        [v11 modifyItemIndexSetForDataSourceIdentifier:v12 section:v9 usingBlock:v13];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (*(void *)(a1 + 64) == a2)
  {
    uint64_t v10 = [*(id *)(a1 + 32) indexAfterApplyingChangesToIndex:a3];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      uint64_t v12 = [*(id *)(a1 + 40) itemChangesInSection:v10];
      if ([v12 hasIncrementalChanges])
      {
        uint64_t v13 = [v12 indexAfterApplyingChangesToIndex:a4];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = v13;
          id v15 = [*(id *)(a1 + 40) subitemChangesInItem:v13 section:v11];
          if ([v15 hasIncrementalChanges])
          {
            uint64_t v16 = *(void **)(a1 + 48);
            uint64_t v17 = *(void *)(a1 + 72);
            v18[0] = MEMORY[0x263EF8330];
            v18[1] = 3221225472;
            v18[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_6;
            v18[3] = &unk_26545B9A8;
            id v19 = v15;
            id v20 = v9;
            [v16 modifySubitemIndexSetForDataSourceIdentifier:v17 section:v11 item:v14 usingBlock:v18];
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          }
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 indexSetAfterApplyingChangesToIndexSet:v3];
  [v4 addIndexes:v5];
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 indexSetAfterApplyingChangesToIndexSet:v3];
  [v4 addIndexes:v5];
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 indexSetAfterApplyingChangesToIndexSet:v3];
  [v4 addIndexes:v5];
}

- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6
{
  id v12 = a7;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (a4->dataSourceIdentifier != self->_toDataSourceIdentifier || !a4->dataSourceIdentifier)
  {
LABEL_6:
    char v16 = 0;
    char v17 = 0;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int64_t section = a4->section;
  int64_t item = a4->item;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a4->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
LABEL_17:
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v38 = v12;
      long long v22 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:section];
      char v17 = [v22 hasIncrementalChanges];
      long long v23 = [v22 changedIndexes];
      char v16 = [v23 containsIndex:a4->item];

      id v24 = [v22 changedPropertiesForIndex:a4->item];
      [v38 addObjectsFromArray:v24];

      uint64_t v25 = [v22 indexAfterRevertingChangesFromIndex:a4->item];
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v26 = v25;
        char v17 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
        int64_t v27 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterRevertingChangesFromIndex:a4->section];
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
          retstr->int64_t section = v27;
          retstr->int64_t item = v26;
          retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      goto LABEL_27;
    }
LABEL_21:
    id v38 = v12;
    long long v22 = -[PXSectionedDataSourceChangeDetails subitemChangesInItem:section:](self, "subitemChangesInItem:section:");
    char v17 = [v22 hasIncrementalChanges];
    int64_t v28 = [v22 changedIndexes];
    char v16 = [v28 containsIndex:a4->subitem];

    int64_t v29 = [v22 changedPropertiesForIndex:a4->subitem];
    [v38 addObjectsFromArray:v29];

    uint64_t v30 = [v22 indexAfterRevertingChangesFromIndex:a4->subitem];
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v31 = v30;
      id v32 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:a4->section];
      char v17 = [v32 hasIncrementalChanges];
      v37 = v32;
      uint64_t v33 = [v32 indexAfterRevertingChangesFromIndex:a4->item];
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v34 = v32;
      }
      else
      {
        int64_t v35 = v33;
        char v17 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
        int64_t v36 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterRevertingChangesFromIndex:a4->section];
        int64_t v34 = v37;
        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
          retstr->int64_t section = v36;
          retstr->int64_t item = v35;
          retstr->subint64_t item = v31;
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a4->subitem;
    goto LABEL_17;
  }
  id v38 = v12;
  char v17 = [(PXArrayChangeDetails *)self->_sectionChanges hasIncrementalChanges];
  id v19 = [(PXArrayChangeDetails *)self->_sectionChanges changedIndexes];
  char v16 = [v19 containsIndex:a4->section];

  id v20 = [(PXArrayChangeDetails *)self->_sectionChanges changedPropertiesForIndex:a4->section];
  [v38 addObjectsFromArray:v20];

  int64_t v21 = [(PXArrayChangeDetails *)self->_sectionChanges indexAfterRevertingChangesFromIndex:a4->section];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
    retstr->int64_t section = v21;
    *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
LABEL_28:
  id v12 = v38;
  if (a5) {
LABEL_7:
  }
    *a5 = v17;
LABEL_8:
  if (a6) {
    *a6 = v16;
  }

  return result;
}

- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5
{
  long long v6 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v6;
  return [(PXSectionedDataSourceChangeDetails *)self indexPathAfterRevertingChangesFromIndexPath:v8 hasIncrementalChanges:a5 objectChanged:a6 changedProperties:0];
}

- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5
{
  long long v6 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v6;
  return [(PXSectionedDataSourceChangeDetails *)self indexPathAfterApplyingChangesToIndexPath:v8 hasIncrementalChanges:a5 objectChanged:a6 changedProperties:0];
}

void __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) subitemChangesInItem:a2 section:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 hasAnyInsertionsRemovalsOrMoves];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)hasAnyChanges
{
  uint64_t v3 = self->_hasAnyChangesCache;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [(NSNumber *)v3 BOOLValue];
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    long long v6 = [(PXSectionedDataSourceChangeDetails *)self sectionChanges];
    char v7 = [v6 hasAnyChanges];

    char v17 = v7;
    if (*((unsigned char *)v15 + 24))
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(PXSectionedDataSourceChangeDetails *)self sectionsWithItemChanges];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke;
      v13[3] = &unk_26545B980;
      void v13[4] = self;
      v13[5] = &v14;
      [v9 enumerateIndexesUsingBlock:v13];

      BOOL v8 = *((unsigned char *)v15 + 24) != 0;
    }
    uint64_t v10 = [NSNumber numberWithBool:v8];
    hasAnyChangesCache = self->_hasAnyChangesCache;
    self->_hasAnyChangesCache = v10;

    BOOL v5 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

void __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  long long v6 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 hasAnyChanges];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) itemsWithSubitemChangesInSection:a2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    _OWORD v9[2] = __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke_2;
    v9[3] = &unk_26545B958;
    uint64_t v11 = a2;
    long long v10 = *(_OWORD *)(a1 + 32);
    [v8 enumerateIndexesUsingBlock:v9];

    char v7 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *a3 = v7;
}

void __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) subitemChangesInItem:a2 section:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 hasAnyChanges];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)subitemChangesInItem:(int64_t)a3 section:(int64_t)a4
{
  char v7 = [(PXSectionedDataSourceChangeDetails *)self itemChangesInSection:a4];
  if ([v7 hasIncrementalChanges])
  {
    subitemChangeDetailsByItemBySection = self->_subitemChangeDetailsByItemBySection;
    id v9 = [NSNumber numberWithInteger:a4];
    long long v10 = [(NSDictionary *)subitemChangeDetailsByItemBySection objectForKeyedSubscript:v9];
    uint64_t v11 = [NSNumber numberWithInteger:a3];
    id v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
    }
    id v15 = v14;
  }
  else
  {
    id v15 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
  }

  return v15;
}

- (id)itemsWithSubitemChangesInSection:(int64_t)a3
{
  itemsWithSubitemChangesBySection = self->_itemsWithSubitemChangesBySection;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)itemsWithSubitemChangesBySection objectForKeyedSubscript:v4];
  long long v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F088D0] indexSet];
  }
  BOOL v8 = v7;

  return v8;
}

- (PXSectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 withFromDataSourceIdentifier:(int64_t)a4 toDataSourceIdentifier:(int64_t)a5
{
  BOOL v8 = a3;
  id v9 = [v8 sectionChanges];
  uint64_t v10 = v8[1];
  uint64_t v11 = v8[3];

  id v12 = [(PXSectionedDataSourceChangeDetails *)self initWithFromDataSourceIdentifier:a4 toDataSourceIdentifier:a5 sectionChanges:v9 itemChangeDetailsBySection:v10 subitemChangeDetailsByItemBySection:v11];
  return v12;
}

void __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v6 = (void *)MEMORY[0x263F089C8];
  id v7 = a3;
  BOOL v8 = [v6 indexSet];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_3;
  v10[3] = &unk_26545B908;
  id v9 = v8;
  id v11 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v9 count])
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v5, "integerValue"));
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
  }
}

uint64_t __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];

  return [v2 addIndex:v3];
}

- (PXSectionedDataSourceChangeDetails)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXSectionedDataSourceChangeDetails.m", 128, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

+ (void)debug_assertValidChangeDetails:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v75 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = v10;
  if (v9)
  {
    v74 = v10;
    if (![v9 count])
    {
      uint64_t v65 = [v75 identifier];
      id v12 = v74;
      if (v65 == [v74 identifier]) {
        goto LABEL_75;
      }
      id v64 = [MEMORY[0x263F08690] currentHandler];
      [v64 handleFailureInMethod:a2, a1, @"PXSectionedDataSourceChangeDetails.m", 580, @"Invalid parameter not satisfying: %@", @"fromDataSource.identifier == toDataSource.identifier" object file lineNumber description];
      goto LABEL_73;
    }
    SEL v68 = a2;
    id v69 = a1;
    uint64_t v13 = [v9 firstObject];
    uint64_t v14 = [v13 fromDataSourceIdentifier];
    uint64_t v15 = [v75 identifier];

    if (v14 != v15)
    {
      v66 = [MEMORY[0x263F08690] currentHandler];
      [v66 handleFailureInMethod:v68, a1, @"PXSectionedDataSourceChangeDetails.m", 584, @"Invalid parameter not satisfying: %@", @"changeDetailsArray.firstObject.fromDataSourceIdentifier == fromDataSource.identifier" object file lineNumber description];
    }
    uint64_t v16 = [v9 lastObject];
    uint64_t v17 = [v16 toDataSourceIdentifier];
    uint64_t v18 = [v74 identifier];

    if (v17 != v18)
    {
      v67 = [MEMORY[0x263F08690] currentHandler];
      [v67 handleFailureInMethod:v68, a1, @"PXSectionedDataSourceChangeDetails.m", 585, @"Invalid parameter not satisfying: %@", @"changeDetailsArray.lastObject.toDataSourceIdentifier == toDataSource.identifier" object file lineNumber description];
    }
    id v71 = v9;
    if ([v75 numberOfSections] >= 1)
    {
      uint64_t v19 = 0;
      while (1)
      {
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v20 = v11;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v101 objects:v108 count:16];
        uint64_t v22 = v19;
        if (v21)
        {
          uint64_t v23 = v21;
          uint64_t v24 = *(void *)v102;
          uint64_t v22 = v19;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v102 != v24) {
                objc_enumerationMutation(v20);
              }
              int64_t v26 = [*(id *)(*((void *)&v101 + 1) + 8 * i) sectionChanges];
              uint64_t v22 = [v26 indexAfterApplyingChangesToIndex:v22];

              if (v22 == 0x7FFFFFFFFFFFFFFFLL)
              {
                int64_t v27 = v20;
                goto LABEL_20;
              }
            }
            uint64_t v23 = [v20 countByEnumeratingWithState:&v101 objects:v108 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        if (v22 >= [v74 numberOfSections])
        {
          int64_t v27 = [MEMORY[0x263F08690] currentHandler];
          [v27 handleFailureInMethod:v68, v69, @"PXSectionedDataSourceChangeDetails.m", 595, @"Invalid parameter not satisfying: %@", @"section == NSNotFound || section < toDataSource.numberOfSections" object file lineNumber description];
LABEL_20:
        }
        uint64_t v72 = [v75 numberOfItemsInSection:v19];
        if (v72 >= 1) {
          break;
        }
LABEL_38:
        ++v19;
        id v11 = v71;
        if (v19 >= [v75 numberOfSections]) {
          goto LABEL_39;
        }
      }
      uint64_t v28 = 0;
      id v70 = v20;
      while (1)
      {
        uint64_t v29 = [v75 identifier];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v30 = v20;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v97 objects:v107 count:16];
        if (v31) {
          break;
        }

        if (v29)
        {
          uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v37 = v19;
          uint64_t v35 = v28;
LABEL_36:
          uint64_t v93 = v29;
          uint64_t v94 = v37;
          uint64_t v95 = v35;
          uint64_t v96 = v34;
          id v40 = (id)[v74 objectAtIndexPath:&v93];
        }
LABEL_37:
        if (++v28 == v72) {
          goto LABEL_38;
        }
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v98;
      uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v35 = v28;
      uint64_t v36 = v19;
      uint64_t v37 = v19;
      while (2)
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v98 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_super v39 = *(void **)(*((void *)&v97 + 1) + 8 * j);
          if (!v39
            || (uint64_t v89 = v29,
                uint64_t v90 = v37,
                uint64_t v91 = v35,
                uint64_t v92 = v34,
                [v39 indexPathAfterApplyingChangesToIndexPath:&v89 hasIncrementalChanges:0 objectChanged:0 changedProperties:0], (uint64_t v29 = v93) == 0))
          {

            uint64_t v19 = v36;
            id v20 = v70;
            goto LABEL_37;
          }
          uint64_t v37 = v94;
          uint64_t v35 = v95;
          uint64_t v34 = v96;
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v97 objects:v107 count:16];
        if (v32) {
          continue;
        }
        break;
      }

      uint64_t v19 = v36;
      id v20 = v70;
      goto LABEL_36;
    }
LABEL_39:
    id v12 = v74;
    if ([v74 numberOfSections] >= 1)
    {
      uint64_t v41 = 0;
      while (1)
      {
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v42 = [v11 reverseObjectEnumerator];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v85 objects:v106 count:16];
        uint64_t v44 = v41;
        if (v43)
        {
          uint64_t v45 = v43;
          uint64_t v46 = *(void *)v86;
          uint64_t v44 = v41;
          while (2)
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v86 != v46) {
                objc_enumerationMutation(v42);
              }
              v48 = [*(id *)(*((void *)&v85 + 1) + 8 * k) sectionChanges];
              uint64_t v44 = [v48 indexAfterRevertingChangesFromIndex:v44];

              if (v44 == 0x7FFFFFFFFFFFFFFFLL)
              {
                id v12 = v74;
                goto LABEL_52;
              }
            }
            uint64_t v45 = [v42 countByEnumeratingWithState:&v85 objects:v106 count:16];
            if (v45) {
              continue;
            }
            break;
          }
        }

        id v12 = v74;
        if (v44 >= [v75 numberOfSections])
        {
          v42 = [MEMORY[0x263F08690] currentHandler];
          [v42 handleFailureInMethod:v68, v69, @"PXSectionedDataSourceChangeDetails.m", 620, @"Invalid parameter not satisfying: %@", @"section == NSNotFound || section < fromDataSource.numberOfSections" object file lineNumber description];
LABEL_52:
        }
        uint64_t v73 = [v12 numberOfItemsInSection:v41];
        if (v73 >= 1) {
          break;
        }
LABEL_70:
        if (++v41 >= [v12 numberOfSections]) {
          goto LABEL_71;
        }
      }
      uint64_t v49 = 0;
      while (1)
      {
        uint64_t v50 = [v12 identifier];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v51 = [v11 reverseObjectEnumerator];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v81 objects:v105 count:16];
        if (v52) {
          break;
        }

        id v12 = v74;
        if (v50)
        {
          uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v58 = v49;
          uint64_t v57 = v41;
LABEL_68:
          uint64_t v93 = v50;
          uint64_t v94 = v57;
          uint64_t v95 = v58;
          uint64_t v96 = v55;
          id v61 = (id)[v75 objectAtIndexPath:&v93];
          id v11 = v71;
        }
LABEL_69:
        if (++v49 == v73) {
          goto LABEL_70;
        }
      }
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v82;
      uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v56 = v41;
      uint64_t v57 = v41;
      uint64_t v58 = v49;
      while (2)
      {
        for (uint64_t m = 0; m != v53; ++m)
        {
          if (*(void *)v82 != v54) {
            objc_enumerationMutation(v51);
          }
          v60 = *(void **)(*((void *)&v81 + 1) + 8 * m);
          if (!v60
            || (uint64_t v89 = v50,
                uint64_t v90 = v57,
                uint64_t v91 = v58,
                uint64_t v92 = v55,
                [v60 indexPathAfterRevertingChangesFromIndexPath:&v89 hasIncrementalChanges:0 objectChanged:0 changedProperties:0], (uint64_t v50 = v93) == 0))
          {

            id v11 = v71;
            id v12 = v74;
            uint64_t v41 = v56;
            goto LABEL_69;
          }
          uint64_t v57 = v94;
          uint64_t v58 = v95;
          uint64_t v55 = v96;
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v81 objects:v105 count:16];
        if (v53) {
          continue;
        }
        break;
      }

      id v12 = v74;
      uint64_t v41 = v56;
      goto LABEL_68;
    }
LABEL_71:
    if ([v11 count] == 1)
    {
      v62 = [v11 lastObject];
      v63 = [v62 sectionsWithItemChanges];
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __97__PXSectionedDataSourceChangeDetails_debug_assertValidChangeDetails_fromDataSource_toDataSource___block_invoke;
      v76[3] = &unk_26545BA98;
      SEL v79 = v68;
      id v80 = v69;
      id v77 = v74;
      id v78 = v62;
      id v64 = v62;
      [v63 enumerateIndexesUsingBlock:v76];

LABEL_73:
      id v12 = v74;
    }
  }
LABEL_75:
}

void __97__PXSectionedDataSourceChangeDetails_debug_assertValidChangeDetails_fromDataSource_toDataSource___block_invoke(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(a1 + 32) numberOfSections] <= a2)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"PXSectionedDataSourceChangeDetails.m", 640, @"Invalid parameter not satisfying: %@", @"section < toDataSource.numberOfSections" object file lineNumber description];
  }
  id v7 = [*(id *)(a1 + 40) changedItemsInSection:a2];
  if ([v7 count])
  {
    unint64_t v4 = [v7 lastIndex];
    if (v4 >= [*(id *)(a1 + 32) numberOfItemsInSection:a2])
    {
      long long v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"PXSectionedDataSourceChangeDetails.m", 642, @"Invalid parameter not satisfying: %@", @"changedItems.count == 0 || changedItems.lastIndex < [toDataSource numberOfItemsInSection:section]" object file lineNumber description];
    }
  }
}

+ (BOOL)changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ((unint64_t)[v10 count] >= 2)
  {
    id v11 = +[PXSectionedChangeDetailsCoalescer changeDetailsByCoalescingChangeDetails:v10];

    v30[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    char v13 = [a1 changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:v12 fromDataSource:v8 toDataSource:v9];
LABEL_17:

    goto LABEL_18;
  }
  id v11 = [v10 firstObject];

  if ([v11 hasAnyInsertionsRemovalsOrMoves])
  {
    id v12 = [v11 sectionChanges];
    if (![v12 hasIncrementalChanges] || (objc_msgSend(v12, "hasMoves") & 1) != 0) {
      goto LABEL_16;
    }
    __int16 v29 = 0;
    if (([v12 hasAnyInsertionsRemovalsOrMoves] & 1) == 0)
    {
      uint64_t v15 = [v9 numberOfSections];
      goto LABEL_15;
    }
    if (objc_msgSend(v12, "isOnlyInsertionAtEnd:orRemovalAtEnd:countBeforeChange:countAfterChange:", (char *)&v29 + 1, &v29, objc_msgSend(v8, "numberOfSections"), objc_msgSend(v9, "numberOfSections")))
    {
      if (HIBYTE(v29))
      {
        uint64_t v14 = [v12 insertedIndexes];
LABEL_14:
        uint64_t v16 = v14;
        uint64_t v15 = [v14 firstIndex];

LABEL_15:
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_16;
        }
        id v18 = objc_alloc_init(MEMORY[0x263F089C8]);
        uint64_t v19 = [v11 sectionsWithItemChanges];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __116__PXSectionedDataSourceChangeDetails_changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd_fromDataSource_toDataSource___block_invoke;
        v26[3] = &unk_26545BA70;
        id v20 = v11;
        id v27 = v20;
        id v21 = v18;
        id v28 = v21;
        [v19 enumerateIndexesUsingBlock:v26];

        if ([v21 count])
        {
          if (objc_msgSend(v21, "px_isSingleRangeWithMax:", v15) && objc_msgSend(v21, "count") == 1)
          {
            uint64_t v22 = [v21 firstIndex];
            uint64_t v23 = [v20 itemChangesInSection:v22];
            __int16 v25 = 0;
            if ([v23 hasAnyInsertionsRemovalsOrMoves])
            {
              if (!objc_msgSend(v23, "isOnlyInsertionAtEnd:orRemovalAtEnd:countBeforeChange:countAfterChange:", (char *)&v25 + 1, &v25, objc_msgSend(v8, "numberOfItemsInSection:", v22), objc_msgSend(v9, "numberOfItemsInSection:", v22))|| HIBYTE(v25) && (_BYTE)v29)
              {
                char v13 = 0;
LABEL_33:

                goto LABEL_34;
              }
              BOOL v24 = (_BYTE)v25 == 0;
            }
            else
            {
              BOOL v24 = 1;
            }
            if (HIBYTE(v29)) {
              char v13 = v24;
            }
            else {
              char v13 = 1;
            }
            goto LABEL_33;
          }
          char v13 = 0;
        }
        else
        {
          char v13 = 1;
        }
LABEL_34:

        goto LABEL_17;
      }
      if ((_BYTE)v29)
      {
        uint64_t v14 = [v12 removedIndexes];
        goto LABEL_14;
      }
    }
LABEL_16:
    char v13 = 0;
    goto LABEL_17;
  }
  char v13 = 0;
LABEL_18:

  return v13;
}

void __116__PXSectionedDataSourceChangeDetails_changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd_fromDataSource_toDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  int v5 = [v4 hasAnyInsertionsRemovalsOrMoves];

  if (v5)
  {
    long long v6 = *(void **)(a1 + 40);
    [v6 addIndex:a2];
  }
}

+ (id)indexPathSetAfterRevertingChanges:(id)a3 fromIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8196;
  id v20 = __Block_byref_object_dispose__8197;
  id v8 = a4;
  id v21 = v8;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v15 = 0;
  BOOL v15 = [v7 count] != 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __111__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChanges_fromIndexPathSet_hasIncrementalChanges___block_invoke;
  v11[3] = &unk_26545B8E0;
  v11[4] = &v16;
  v11[5] = &v12;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v11];
  if (a5) {
    *a5 = *((unsigned char *)v13 + 24);
  }
  id v9 = (id)v17[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __111__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChanges_fromIndexPathSet_hasIncrementalChanges___block_invoke(uint64_t a1, void *a2)
{
  char v9 = 0;
  uint64_t v3 = [a2 indexPathSetAfterRevertingChangesFromIndexPathSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hasIncrementalChanges:&v9];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    BOOL v7 = v9 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  char v8 = !v7;
  *(unsigned char *)(v6 + 24) = v8;
}

+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7
{
  id v13 = a4;
  id v14 = a8;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x4010000000;
  uint64_t v35 = &unk_259D809E3;
  long long v15 = *(_OWORD *)&a5->item;
  long long v36 = *(_OWORD *)&a5->dataSourceIdentifier;
  long long v37 = v15;
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  BOOL v27 = 0;
  BOOL v27 = [v13 count] != 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __137__PXSectionedDataSourceChangeDetails_indexPathAfterRevertingChanges_fromIndexPath_hasIncrementalChanges_objectChanged_changedProperties___block_invoke;
  v19[3] = &unk_26545B8B8;
  id v21 = &v32;
  id v16 = v14;
  id v20 = v16;
  uint64_t v22 = &v28;
  uint64_t v23 = &v24;
  [v13 enumerateObjectsWithOptions:2 usingBlock:v19];
  if (a7) {
    *a7 = *((unsigned char *)v29 + 24);
  }
  if (a6) {
    *a6 = *((unsigned char *)v25 + 24);
  }
  long long v17 = *((_OWORD *)v33 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v33 + 2);
  *(_OWORD *)&retstr->int64_t item = v17;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return result;
}

uint64_t __137__PXSectionedDataSourceChangeDetails_indexPathAfterRevertingChanges_fromIndexPath_hasIncrementalChanges_objectChanged_changedProperties___block_invoke(void *a1, void *a2)
{
  __int16 v13 = 0;
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[5] + 8);
  long long v5 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&v12[8] = v5;
  uint64_t result = [a2 indexPathAfterRevertingChangesFromIndexPath:v12 hasIncrementalChanges:&v13 objectChanged:(char *)&v13 + 1 changedProperties:v3];
  uint64_t v7 = *(void *)(a1[5] + 8);
  long long v8 = *(_OWORD *)&v12[28];
  *(_OWORD *)(v7 + 32) = *(_OWORD *)&v12[20];
  *(_OWORD *)(v7 + 48) = v8;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) | HIBYTE(v13)) != 0;
  uint64_t v9 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v9 + 24)) {
    BOOL v10 = v13 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = !v10;
  *(unsigned char *)(v9 + 24) = v11;
  return result;
}

+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6
{
  long long v7 = *(_OWORD *)&a5->item;
  v9[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v9[1] = v7;
  return (PXSimpleIndexPath *)[a2 indexPathAfterRevertingChanges:a4 fromIndexPath:v9 hasIncrementalChanges:a6 objectChanged:a7 changedProperties:0];
}

@end