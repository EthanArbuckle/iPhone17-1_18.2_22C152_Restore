@interface PXSelectionSnapshot
- (BOOL)areAllItemsSelected;
- (BOOL)isAnyItemSelected;
- (BOOL)isAnySectionSelected;
- (BOOL)isEmptySelectionAvoided;
- (BOOL)isIndexPathSelected:(PXSimpleIndexPath *)a3;
- (BOOL)isSelectionLimitReached;
- (NSObject)firstObject;
- (NSOrderedSet)overallSelectionOrder;
- (PXFastEnumeration)allItemsEnumerator;
- (PXFastEnumeration)allObjectsEnumerator;
- (PXFastEnumeration)allSectionsEnumerator;
- (PXIndexPathSet)sectionIndexPathsContainingSelection;
- (PXIndexPathSet)selectedIndexPaths;
- (PXSectionedDataSource)dataSource;
- (PXSelectionSnapshot)init;
- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPath:(PXSimpleIndexPath *)a4;
- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4;
- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5;
- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5 pendingIndexPath:(PXSimpleIndexPath *)a6 pressedIndexPath:(PXSimpleIndexPath *)a7 selectionLimitReached:(BOOL)a8 emptySelectionAvoided:(BOOL)a9 overallSelectionOrder:(id)a10;
- (PXSimpleIndexPath)cursorIndexPath;
- (PXSimpleIndexPath)firstSelectedIndexPath;
- (PXSimpleIndexPath)indexPathOfObjectPassingTest:(SEL)a3;
- (PXSimpleIndexPath)lastSelectedIndexPath;
- (PXSimpleIndexPath)pendingIndexPath;
- (PXSimpleIndexPath)pressedIndexPath;
- (id)description;
- (id)fetchSelectedObjects;
- (int64_t)overallSelectionOrderIndexForIndexPath:(PXSimpleIndexPath *)a3;
- (void)enumerateSelectedObjectsUsingBlock:(id)a3;
@end

@implementation PXSelectionSnapshot

- (NSObject)firstObject
{
  [(PXSelectionSnapshot *)self firstSelectedIndexPath];

  return 0;
}

- (PXSimpleIndexPath)firstSelectedIndexPath
{
  id v14 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v5 = [(PXSelectionSnapshot *)self dataSource];
  int64_t v6 = [v5 identifier];

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  v7 = [v14 sectionsWithItemsForDataSourceIdentifier:v6];
  v8 = v7;
  if (v7 && (uint64_t v9 = [v7 firstIndex], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    int64_t v11 = v9;
    v10 = [v14 itemIndexSetForDataSourceIdentifier:v6 section:v9];
    int64_t v12 = [v10 firstIndex];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
  }
  else
  {
    v10 = [v14 sectionIndexSetForDataSourceIdentifier:v6];
    if (![v10 count]) {
      goto LABEL_7;
    }
    int64_t v11 = [v10 firstIndex];
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->dataSourceIdentifier = v6;
  retstr->section = v11;
  retstr->item = v12;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return result;
}

- (BOOL)isSelectionLimitReached
{
  return self->_isSelectionLimitReached;
}

- (PXSimpleIndexPath)pressedIndexPath
{
  long long v3 = *(_OWORD *)&self[3].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5 pendingIndexPath:(PXSimpleIndexPath *)a6 pressedIndexPath:(PXSimpleIndexPath *)a7 selectionLimitReached:(BOOL)a8 emptySelectionAvoided:(BOOL)a9 overallSelectionOrder:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PXSelectionSnapshot;
  v20 = [(PXSelectionSnapshot *)&v28 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dataSource, a3);
    objc_storeStrong((id *)&v21->_selectedIndexPaths, a4);
    long long v22 = *(_OWORD *)&a5->dataSourceIdentifier;
    *(_OWORD *)&v21->_cursorIndexPath.item = *(_OWORD *)&a5->item;
    *(_OWORD *)&v21->_cursorIndexPath.dataSourceIdentifier = v22;
    long long v23 = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)&v21->_pendingIndexPath.item = *(_OWORD *)&a6->item;
    *(_OWORD *)&v21->_pendingIndexPath.dataSourceIdentifier = v23;
    long long v24 = *(_OWORD *)&a7->dataSourceIdentifier;
    *(_OWORD *)&v21->_pressedIndexPath.item = *(_OWORD *)&a7->item;
    *(_OWORD *)&v21->_pressedIndexPath.dataSourceIdentifier = v24;
    v21->_isSelectionLimitReached = a8;
    v21->_isEmptySelectionAvoided = a9;
    uint64_t v25 = [v19 copy];
    overallSelectionOrder = v21->_overallSelectionOrder;
    v21->_overallSelectionOrder = (NSOrderedSet *)v25;
  }
  return v21;
}

- (BOOL)isAnyItemSelected
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__PXSelectionSnapshot_isAnyItemSelected__block_invoke;
  v4[3] = &unk_26545A928;
  v4[4] = &v5;
  [v2 enumerateItemIndexSetsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (PXIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (BOOL)isEmptySelectionAvoided
{
  return self->_isEmptySelectionAvoided;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overallSelectionOrder, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (NSOrderedSet)overallSelectionOrder
{
  return self->_overallSelectionOrder;
}

- (PXSimpleIndexPath)pendingIndexPath
{
  long long v3 = *(_OWORD *)&self[2].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)cursorIndexPath
{
  long long v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (id)description
{
  long long v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PXSelectionSnapshot;
  v4 = [(PXSelectionSnapshot *)&v9 description];
  uint64_t v5 = [(PXSelectionSnapshot *)self dataSource];
  int64_t v6 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ dataSource:%@ selectedIndexPaths:%@>", v4, v5, v6];

  return v7;
}

- (PXFastEnumeration)allObjectsEnumerator
{
  long long v3 = [(PXSelectionSnapshot *)self dataSource];
  v4 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  uint64_t v5 = [v3 objectsEnumeratorForIndexPaths:v4];

  return (PXFastEnumeration *)v5;
}

- (PXFastEnumeration)allSectionsEnumerator
{
  long long v3 = [(PXSelectionSnapshot *)self dataSource];
  v4 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  uint64_t v5 = [v3 sectionsEnumeratorForIndexPaths:v4];

  return (PXFastEnumeration *)v5;
}

- (PXFastEnumeration)allItemsEnumerator
{
  long long v3 = [(PXSelectionSnapshot *)self dataSource];
  v4 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  uint64_t v5 = [v3 itemsEnumeratorForIndexPaths:v4];

  return (PXFastEnumeration *)v5;
}

- (id)fetchSelectedObjects
{
  long long v3 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v4 = [(PXSelectionSnapshot *)self dataSource];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__PXSelectionSnapshot_fetchSelectedObjects__block_invoke;
  v11[3] = &unk_26545ACE8;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [v3 enumerateAllIndexPathsUsingBlock:v11];
  char v8 = v13;
  id v9 = v6;

  return v9;
}

void __43__PXSelectionSnapshot_fetchSelectedObjects__block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v5 = [v3 objectAtIndexPath:v6];
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)enumerateSelectedObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSelectionSnapshot *)self dataSource];
  id v6 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__PXSelectionSnapshot_enumerateSelectedObjectsUsingBlock___block_invoke;
  v9[3] = &unk_26545A9C8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateAllIndexPathsUsingBlock:v9];
}

void __58__PXSelectionSnapshot_enumerateSelectedObjectsUsingBlock___block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v5 = [v3 objectAtIndexPath:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PXSimpleIndexPath)indexPathOfObjectPassingTest:(SEL)a3
{
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x4010000000;
  v20 = &unk_259D809E3;
  long long v21 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v22 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  id v7 = [(PXSelectionSnapshot *)self dataSource];
  id v8 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__PXSelectionSnapshot_indexPathOfObjectPassingTest___block_invoke;
  v13[3] = &unk_26545A9A0;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  v16 = &v17;
  [v8 enumerateAllIndexPathsUsingBlock:v13];

  long long v11 = *((_OWORD *)v18 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v18 + 2);
  *(_OWORD *)&retstr->item = v11;

  _Block_object_dispose(&v17, 8);
  return result;
}

void __52__PXSelectionSnapshot_indexPathOfObjectPassingTest___block_invoke(void *a1, _OWORD *a2, unsigned char *a3)
{
  id v6 = (void *)a1[4];
  long long v7 = a2[1];
  v11[0] = *a2;
  v11[1] = v7;
  id v8 = [v6 objectAtIndexPath:v11];
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    long long v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }
}

- (PXIndexPathSet)sectionIndexPathsContainingSelection
{
  long long v3 = objc_alloc_init(PXMutableIndexPathSet);
  long long v4 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke;
  v13[3] = &unk_26545A950;
  uint64_t v5 = v3;
  id v14 = v5;
  [v4 enumerateSectionIndexPathsUsingBlock:v13];

  id v6 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke_2;
  v11[3] = &unk_26545A978;
  long long v7 = v5;
  id v12 = v7;
  [v6 enumerateItemIndexSetsUsingBlock:v11];

  id v8 = v12;
  uint64_t v9 = v7;

  return v9;
}

uint64_t __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke(uint64_t a1, _OWORD *a2)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  return [v2 addIndexPath:v5];
}

uint64_t __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = [a4 count];
  if (result)
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = a2;
    v9[1] = a3;
    int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    return [v8 addIndexPath:v9];
  }
  return result;
}

- (PXSimpleIndexPath)lastSelectedIndexPath
{
  id v14 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  uint64_t v5 = [(PXSelectionSnapshot *)self dataSource];
  int64_t v6 = [v5 identifier];

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  long long v7 = [v14 sectionsWithItemsForDataSourceIdentifier:v6];
  id v8 = v7;
  if (v7 && (uint64_t v9 = [v7 lastIndex], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    int64_t v11 = v9;
    int64x2_t v10 = [v14 itemIndexSetForDataSourceIdentifier:v6 section:v9];
    int64_t v12 = [v10 lastIndex];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
  }
  else
  {
    int64x2_t v10 = [v14 sectionIndexSetForDataSourceIdentifier:v6];
    if (![v10 count]) {
      goto LABEL_7;
    }
    int64_t v11 = [v10 lastIndex];
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->dataSourceIdentifier = v6;
  retstr->section = v11;
  retstr->item = v12;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return result;
}

- (BOOL)areAllItemsSelected
{
  long long v3 = [(PXSelectionSnapshot *)self dataSource];
  long long v4 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v3 && ([v3 firstItemIndexPath], (void)v14))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    [v4 lastItemIndexPath];
    v11[0] = v14;
    v11[1] = v15;
    v10[0] = v12;
    v10[1] = v13;
    uint64_t v5 = [v4 indexPathSetFromIndexPath:v11 toIndexPath:v10];
    int64_t v6 = +[PXIndexPathSet indexPathSet];
    [v6 unionIndexPathSet:v5];
    long long v7 = [(PXSelectionSnapshot *)self selectedIndexPaths];
    [v6 minusIndexPathSet:v7];

    BOOL v8 = [v6 count] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __40__PXSelectionSnapshot_isAnyItemSelected__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  uint64_t result = [a4 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)isAnySectionSelected
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PXSelectionSnapshot_isAnySectionSelected__block_invoke;
  v4[3] = &unk_26545A900;
  v4[4] = &v5;
  [v2 enumerateSectionIndexSetsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __43__PXSelectionSnapshot_isAnySectionSelected__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (int64_t)overallSelectionOrderIndexForIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5 = [(PXSelectionSnapshot *)self overallSelectionOrder];
  if (v5)
  {
    int64_t v6 = [(PXSelectionSnapshot *)self dataSource];
    long long v7 = *(_OWORD *)&a3->item;
    v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v11[1] = v7;
    char v8 = [v6 objectIDAtIndexPath:v11];

    int64_t v9 = [v5 indexOfObject:v8];
  }
  else
  {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)isIndexPathSelected:(PXSimpleIndexPath *)a3
{
  long long v4 = [(PXSelectionSnapshot *)self selectedIndexPaths];
  long long v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = [v4 containsIndexPath:v7];

  return (char)a3;
}

- (PXSelectionSnapshot)init
{
  long long v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXSectionedSelectionManager.m" lineNumber:424 description:@"Not supported"];

  abort();
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPath:(PXSimpleIndexPath *)a4
{
  long long v6 = *(_OWORD *)&a4->item;
  long long v12 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v13 = v6;
  id v7 = a3;
  char v8 = +[PXIndexPathSet indexPathSetWithIndexPath:&v12];
  long long v9 = *(_OWORD *)&a4->item;
  long long v12 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v13 = v9;
  int64x2_t v10 = [(PXSelectionSnapshot *)self initWithDataSource:v7 selectedIndexPaths:v8 cursorIndexPath:&v12];

  return v10;
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = [v6 identifier];
  if (v7)
  {
    [v7 firstItemIndexPathForDataSourceIdentifier:v8];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  v11[0] = v12;
  v11[1] = v13;
  long long v9 = [(PXSelectionSnapshot *)self initWithDataSource:v6 selectedIndexPaths:v7 cursorIndexPath:v11];

  return v9;
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5
{
  long long v5 = *(_OWORD *)&a5->item;
  v10[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v10[1] = v5;
  v9[0] = *(_OWORD *)PXSimpleIndexPathNull;
  v9[1] = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v8[0] = *(_OWORD *)PXSimpleIndexPathNull;
  v8[1] = *(_OWORD *)&PXSimpleIndexPathNull[16];
  LOBYTE(v7) = 0;
  return [(PXSelectionSnapshot *)self initWithDataSource:a3 selectedIndexPaths:a4 cursorIndexPath:v10 pendingIndexPath:v9 pressedIndexPath:v8 selectionLimitReached:0 emptySelectionAvoided:v7 overallSelectionOrder:0];
}

@end