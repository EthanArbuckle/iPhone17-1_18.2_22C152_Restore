@interface PXMutableIndexPathSet
- (void)addIndexPath:(PXSimpleIndexPath *)a3;
- (void)minusIndexPathSet:(id)a3;
- (void)modifyItemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 usingBlock:(id)a5;
- (void)modifySectionIndexSetForDataSourceIdentifier:(int64_t)a3 usingBlock:(id)a4;
- (void)modifySubitemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 item:(int64_t)a5 usingBlock:(id)a6;
- (void)removeAllIndexPaths;
- (void)removeIndexPath:(PXSimpleIndexPath *)a3;
- (void)unionIndexPathSet:(id)a3;
@end

@implementation PXMutableIndexPathSet

- (void)modifyItemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 usingBlock:(id)a5
{
  v17 = (void (**)(id, void *))a5;
  v8 = [NSNumber numberWithInteger:a3];
  v9 = [(PXIndexPathSet *)self _itemIndexesBySectionByDataSourceIdentifier];
  v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    v10 = [MEMORY[0x263EFF9A0] dictionary];
    v11 = [(PXIndexPathSet *)self _itemIndexesBySectionByDataSourceIdentifier];
    [v11 setObject:v10 forKeyedSubscript:v8];
  }
  v12 = [NSNumber numberWithInteger:a4];
  v13 = [v10 objectForKeyedSubscript:v12];
  if (!v13)
  {
    v13 = [MEMORY[0x263F089C8] indexSet];
    [v10 setObject:v13 forKeyedSubscript:v12];
  }
  v17[2](v17, v13);
  v14 = [(PXIndexPathSet *)self _indexesForSectionsWithItemsByDataSourceIdentifier];
  id v15 = [v14 objectForKeyedSubscript:v8];

  if (!v15)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F089C8]);
    v16 = [(PXIndexPathSet *)self _indexesForSectionsWithItemsByDataSourceIdentifier];
    [v16 setObject:v15 forKeyedSubscript:v8];
  }
  if ([v13 count]) {
    [v15 addIndex:a4];
  }
  else {
    [v15 removeIndex:a4];
  }
}

- (void)unionIndexPathSet:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke;
  v7[3] = &unk_26545A520;
  v7[4] = self;
  id v4 = a3;
  [v4 enumerateSectionIndexSetsUsingBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_3;
  v6[3] = &unk_26545A978;
  v6[4] = self;
  [v4 enumerateItemIndexSetsUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_5;
  v5[3] = &unk_26545A548;
  v5[4] = self;
  [v4 enumerateSubitemIndexSetsUsingBlock:v5];
}

- (void)removeAllIndexPaths
{
  v3 = [(PXIndexPathSet *)self _sectionIndexesByDataSourceIdentifier];
  [v3 removeAllObjects];

  id v4 = [(PXIndexPathSet *)self _indexesForSectionsWithItemsByDataSourceIdentifier];
  [v4 removeAllObjects];

  v5 = [(PXIndexPathSet *)self _itemIndexesBySectionByDataSourceIdentifier];
  [v5 removeAllObjects];

  v6 = [(PXIndexPathSet *)self _indexesForItemsWithSubitemsBySectionByDataSourceIdentifier];
  [v6 removeAllObjects];

  id v7 = [(PXIndexPathSet *)self _subitemIndexesByItemBySectionByDataSourceIdentifier];
  [v7 removeAllObjects];
}

- (void)modifySubitemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 item:(int64_t)a5 usingBlock:(id)a6
{
  v22 = (void (**)(id, void *))a6;
  v10 = [NSNumber numberWithInteger:a3];
  v11 = [(PXIndexPathSet *)self _subitemIndexesByItemBySectionByDataSourceIdentifier];
  v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    v12 = [MEMORY[0x263EFF9A0] dictionary];
    v13 = [(PXIndexPathSet *)self _subitemIndexesByItemBySectionByDataSourceIdentifier];
    [v13 setObject:v12 forKeyedSubscript:v10];
  }
  v14 = [NSNumber numberWithInteger:a4];
  id v15 = [v12 objectForKeyedSubscript:v14];
  if (!v15)
  {
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    [v12 setObject:v15 forKeyedSubscript:v14];
  }
  v16 = [NSNumber numberWithInteger:a5];
  v17 = [v15 objectForKeyedSubscript:v16];
  if (!v17)
  {
    v17 = [MEMORY[0x263F089C8] indexSet];
    [v15 setObject:v17 forKeyedSubscript:v16];
  }
  v22[2](v22, v17);
  v18 = [(PXIndexPathSet *)self _indexesForItemsWithSubitemsBySectionByDataSourceIdentifier];
  id v19 = [v18 objectForKeyedSubscript:v10];

  if (!v19)
  {
    id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v20 = [(PXIndexPathSet *)self _indexesForItemsWithSubitemsBySectionByDataSourceIdentifier];
    [v20 setObject:v19 forKeyedSubscript:v10];
  }
  id v21 = [v19 objectForKeyedSubscript:v14];
  if (!v21)
  {
    id v21 = objc_alloc_init(MEMORY[0x263F089C8]);
    [v19 setObject:v21 forKeyedSubscript:v14];
  }
  if ([v17 count]) {
    [v21 addIndex:a5];
  }
  else {
    [v21 removeIndex:a5];
  }
}

- (void)modifySectionIndexSetForDataSourceIdentifier:(int64_t)a3 usingBlock:(id)a4
{
  v10 = (void (**)(id, void *))a4;
  v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(PXIndexPathSet *)self _sectionIndexesByDataSourceIdentifier];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v8 = [MEMORY[0x263F089C8] indexSet];
    v9 = [(PXIndexPathSet *)self _sectionIndexesByDataSourceIdentifier];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  v10[2](v10, v8);
}

- (void)minusIndexPathSet:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke;
  v7[3] = &unk_26545A520;
  v7[4] = self;
  id v4 = a3;
  [v4 enumerateSectionIndexSetsUsingBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke_2;
  v6[3] = &unk_26545A978;
  v6[4] = self;
  [v4 enumerateItemIndexSetsUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke_3;
  v5[3] = &unk_26545A548;
  v5[4] = self;
  [v4 enumerateSubitemIndexSetsUsingBlock:v5];
}

void __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v8 = [v4 _sectionIndexesByDataSourceIdentifier];
  v6 = [NSNumber numberWithInteger:a2];
  id v7 = [v8 objectForKeyedSubscript:v6];
  [v7 removeIndexes:v5];
}

void __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v12 = [v6 _itemIndexesBySectionByDataSourceIdentifier];
  id v8 = [NSNumber numberWithInteger:a2];
  v9 = [v12 objectForKeyedSubscript:v8];
  v10 = [NSNumber numberWithInteger:a3];
  v11 = [v9 objectForKeyedSubscript:v10];
  [v11 removeIndexes:v7];
}

void __43__PXMutableIndexPathSet_minusIndexPathSet___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = *(void **)(a1 + 32);
  id v9 = a5;
  id v16 = [v8 _subitemIndexesByItemBySectionByDataSourceIdentifier];
  v10 = [NSNumber numberWithInteger:a2];
  v11 = [v16 objectForKeyedSubscript:v10];
  id v12 = [NSNumber numberWithInteger:a3];
  v13 = [v11 objectForKeyedSubscript:v12];
  v14 = [NSNumber numberWithInteger:a4];
  id v15 = [v13 objectForKeyedSubscript:v14];
  [v15 removeIndexes:v9];
}

void __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_2;
  v8[3] = &unk_26545A208;
  id v9 = v5;
  id v7 = v5;
  [v6 modifySectionIndexSetForDataSourceIdentifier:a2 usingBlock:v8];
}

void __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_4;
  v10[3] = &unk_26545A208;
  id v11 = v7;
  id v9 = v7;
  [v8 modifyItemIndexSetForDataSourceIdentifier:a2 section:a3 usingBlock:v10];
}

void __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_6;
  v12[3] = &unk_26545A208;
  id v13 = v9;
  id v11 = v9;
  [v10 modifySubitemIndexSetForDataSourceIdentifier:a2 section:a3 item:a4 usingBlock:v12];
}

uint64_t __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

uint64_t __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

uint64_t __43__PXMutableIndexPathSet_unionIndexPathSet___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (void)removeIndexPath:(PXSimpleIndexPath *)a3
{
  if (!a3->dataSourceIdentifier) {
    return;
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a3->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      goto LABEL_11;
    }
LABEL_9:
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = [(PXIndexPathSet *)self _itemIndexesBySectionByDataSourceIdentifier];
      v6 = [NSNumber numberWithInteger:a3->dataSourceIdentifier];
      id v7 = [v12 objectForKeyedSubscript:v6];
      id v8 = [NSNumber numberWithInteger:a3->section];
      id v9 = [v7 objectForKeyedSubscript:v8];
      [v9 removeIndex:a3->item];
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    id v12 = [(PXIndexPathSet *)self _subitemIndexesByItemBySectionByDataSourceIdentifier];
    v6 = [NSNumber numberWithInteger:a3->dataSourceIdentifier];
    id v7 = [v12 objectForKeyedSubscript:v6];
    id v8 = [NSNumber numberWithInteger:a3->section];
    id v9 = [v7 objectForKeyedSubscript:v8];
    v10 = [NSNumber numberWithInteger:a3->item];
    id v11 = [v9 objectForKeyedSubscript:v10];
    [v11 removeIndex:a3->subitem];

    goto LABEL_12;
  }
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
    subint64_t item = a3->subitem;
    goto LABEL_9;
  }
  id v12 = [(PXIndexPathSet *)self _sectionIndexesByDataSourceIdentifier];
  v6 = [NSNumber numberWithInteger:a3->dataSourceIdentifier];
  id v7 = [v12 objectForKeyedSubscript:v6];
  [v7 removeIndex:a3->section];
LABEL_13:
}

- (void)addIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier)
  {
    int64_t item = a3->item;
    if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
    {
      subint64_t item = a3->subitem;
      if (item == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (subitem == 0x7FFFFFFFFFFFFFFFLL) {
          return;
        }
LABEL_11:
        -[PXMutableIndexPathSet modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:](self, "modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:", MEMORY[0x263EF8330], 3221225472, __38__PXMutableIndexPathSet_addIndexPath___block_invoke_3, &__block_descriptor_64_e27_v16__0__NSMutableIndexSet_8l, *(_OWORD *)&a3->dataSourceIdentifier, a3->item, a3->subitem);
        return;
      }
    }
    else
    {
      if (item == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PXMutableIndexPathSet modifySectionIndexSetForDataSourceIdentifier:usingBlock:](self, "modifySectionIndexSetForDataSourceIdentifier:usingBlock:");
        return;
      }
      subint64_t item = a3->subitem;
    }
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXMutableIndexPathSet modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:](self, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:");
      return;
    }
    goto LABEL_11;
  }
}

uint64_t __38__PXMutableIndexPathSet_addIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndex:*(void *)(a1 + 40)];
}

uint64_t __38__PXMutableIndexPathSet_addIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndex:*(void *)(a1 + 48)];
}

uint64_t __38__PXMutableIndexPathSet_addIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 addIndex:*(void *)(a1 + 56)];
}

@end