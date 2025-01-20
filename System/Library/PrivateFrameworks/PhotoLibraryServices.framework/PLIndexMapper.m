@interface PLIndexMapper
- (BOOL)applyContainerChangeNotification:(id)a3 changeTypes:(int)a4 toFilteredIndexes:(id)a5;
- (PLIndexMapper)initWithDataSource:(id)a3;
- (id)backingIndexesForIndexes:(id)a3;
- (id)indexesForBackingIndexes:(id)a3;
- (unint64_t)backingIndexForIndex:(unint64_t)a3;
- (unint64_t)indexForBackingIndex:(unint64_t)a3;
@end

@implementation PLIndexMapper

- (BOOL)applyContainerChangeNotification:(id)a3 changeTypes:(int)a4 toFilteredIndexes:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  char v10 = [v8 shouldReload];
  if (v8) {
    char v11 = v10;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x19F38D3B0]();
    if (v6)
    {
      v13 = [v8 deletedIndexes];
      objc_msgSend(v9, "pl_adjustIndexesForDeletions:", v13);

      if ((v6 & 2) == 0)
      {
LABEL_7:
        if ((v6 & 4) == 0) {
          goto LABEL_8;
        }
        goto LABEL_17;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_7;
    }
    v14 = [v8 insertedIndexes];
    uint64_t v15 = [v14 firstIndex];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v15; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v14 indexGreaterThanIndex:i])
      {
        [v9 shiftIndexesStartingAtIndex:i by:1];
        if (-[PLIndexMapperDataSource shouldIncludeObjectAtIndex:](self->_dataSource, "shouldIncludeObjectAtIndex:", i))[v9 addIndex:i]; {
      }
        }
    }

    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_18;
    }
LABEL_17:
    v17 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __80__PLIndexMapper_applyContainerChangeNotification_changeTypes_toFilteredIndexes___block_invoke;
    v27 = &unk_1E5868ED0;
    id v18 = v9;
    id v28 = v18;
    id v29 = v17;
    id v19 = v17;
    [v8 enumerateMovesWithBlock:&v24];
    objc_msgSend(v18, "addIndexes:", v19, v24, v25, v26, v27);

    if ((v6 & 8) == 0)
    {
LABEL_25:
      goto LABEL_26;
    }
LABEL_18:
    v20 = [v8 changedIndexes];
    uint64_t v21 = [v20 firstIndex];
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t j = v21; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = [v20 indexGreaterThanIndex:j])
      {
        if (-[PLIndexMapperDataSource shouldIncludeObjectAtIndex:](self->_dataSource, "shouldIncludeObjectAtIndex:", j))[v9 addIndex:j]; {
        else
        }
          [v9 removeIndex:j];
      }
    }

    goto LABEL_25;
  }
LABEL_26:

  return v11 ^ 1;
}

uint64_t __80__PLIndexMapper_applyContainerChangeNotification_changeTypes_toFilteredIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result)
  {
    [*(id *)(a1 + 32) removeIndex:a2];
    v7 = *(void **)(a1 + 40);
    return [v7 addIndex:a3];
  }
  return result;
}

- (unint64_t)backingIndexForIndex:(unint64_t)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(PLIndexMapperDataSource *)self->_dataSource filteredIndexes];
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__PLIndexMapper_backingIndexForIndex___block_invoke;
    v7[3] = &unk_1E5868EA8;
    v7[5] = &v8;
    v7[6] = a3;
    v7[4] = v12;
    [v5 enumerateRangesUsingBlock:v7];
    unint64_t v3 = v9[3];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v3 = [v5 lastIndex] + 1;
    }
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(v12, 8);
  }
  return v3;
}

void *__38__PLIndexMapper_backingIndexForIndex___block_invoke(void *result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(result[4] + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  unint64_t v6 = result[6] - v5;
  if (v6 < a3)
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = v6 + a2;
    *a4 = 1;
    uint64_t v4 = *(void *)(result[4] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 + a3;
  return result;
}

- (id)backingIndexesForIndexes:(id)a3
{
  dataSource = self->_dataSource;
  id v6 = a3;
  v7 = [(PLIndexMapperDataSource *)dataSource filteredIndexes];
  uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PLIndexMapper_backingIndexesForIndexes___block_invoke;
  v13[3] = &unk_1E5868E80;
  id v14 = v7;
  id v9 = v8;
  v16 = self;
  SEL v17 = a2;
  id v15 = v9;
  id v10 = v7;
  [v6 enumerateRangesUsingBlock:v13];

  id v11 = v9;
  return v11;
}

void __42__PLIndexMapper_backingIndexesForIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_19BBAE189;
  void v13[4] = a2;
  v13[5] = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PLIndexMapper_backingIndexesForIndexes___block_invoke_2;
  v7[3] = &unk_1E5868E58;
  id v10 = v13;
  id v11 = v14;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 enumerateRangesUsingBlock:v7];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
}

void __42__PLIndexMapper_backingIndexesForIndexes___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v7 = *(void *)(v6 + 32) - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v8 = a3 - v7;
  if (a3 > v7)
  {
    uint64_t v10 = v7 + a2;
    if (*(void *)(v6 + 40) + v7 <= a3)
    {
      [*(id *)(a1 + 32) addIndexesInRange:v10];
      *a4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", v10, v8);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) += v8;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) -= v8;
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"PLIndexMapper.m", 89, @"We split, but there's nothing left?" object file lineNumber description];
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a3;
}

- (unint64_t)indexForBackingIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(PLIndexMapperDataSource *)self->_dataSource filteredIndexes];
  unint64_t v6 = objc_msgSend(v5, "countOfIndexesInRange:", 0, a3);

  return v6;
}

- (id)indexesForBackingIndexes:(id)a3
{
  dataSource = self->_dataSource;
  id v4 = a3;
  id v5 = [(PLIndexMapperDataSource *)dataSource filteredIndexes];
  unint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__PLIndexMapper_indexesForBackingIndexes___block_invoke;
  v12[3] = &unk_1E5871AD0;
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [v4 enumerateRangesUsingBlock:v12];

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

uint64_t __42__PLIndexMapper_indexesForBackingIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", 0, a2);
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", a2, a3);
  id v8 = *(void **)(a1 + 40);
  return objc_msgSend(v8, "addIndexesInRange:", v6, v7);
}

- (PLIndexMapper)initWithDataSource:(id)a3
{
  id v5 = (PLIndexMapperDataSource *)a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLIndexMapper.m" lineNumber:25 description:@"Must initialize with a data source"];
  }
  v10.receiver = self;
  v10.super_class = (Class)PLIndexMapper;
  uint64_t v6 = [(PLIndexMapper *)&v10 init];
  uint64_t v7 = v6;
  if (v6) {
    v6->_dataSource = v5;
  }

  return v7;
}

@end