@interface PXGadgetDataSource
- (BOOL)hasNoContentGadget;
- (NSArray)gadgetSections;
- (NSString)publiclySafeDescription;
- (PXGadgetDataSource)init;
- (PXGadgetDataSource)initWithGadgetSections:(id)a3;
- (PXSimpleIndexPath)indexPathForGadget:(SEL)a3;
- (PXSimpleIndexPath)indexPathForGadgetSectionWithIdentifier:(SEL)a3;
- (id)_gadgetsMatchingPredicate:(id)a3;
- (id)gadgetAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)gadgetSectionAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)gadgetSectionWithIdentifier:(id)a3;
- (id)gadgetWithId:(id)a3;
- (id)gadgetsOfClass:(Class)a3;
- (id)gadgetsOfType:(unint64_t)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_enumerateGadgetSectionsUsingBlock:(id)a3;
- (void)_enumerateGadgetsInSection:(id)a3 atSectionIndex:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateGadgetSectionsUsingBlock:(id)a3;
- (void)enumerateGadgetsUsingBlock:(id)a3;
@end

@implementation PXGadgetDataSource

- (void).cxx_destruct
{
}

- (NSArray)gadgetSections
{
  return self->_gadgetSections;
}

- (void)_enumerateGadgetsInSection:(id)a3 atSectionIndex:(unint64_t)a4 usingBlock:(id)a5
{
  id v7 = a5;
  v8 = [a3 gadgets];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PXGadgetDataSource__enumerateGadgetsInSection_atSectionIndex_usingBlock___block_invoke;
  v10[3] = &unk_1E5DC1300;
  id v11 = v7;
  unint64_t v12 = a4;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v10];
}

uint64_t __75__PXGadgetDataSource__enumerateGadgetsInSection_atSectionIndex_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void, uint64_t, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40), a3, &v6);
  if (v6) {
    *a4 = 1;
  }
  return result;
}

- (void)_enumerateGadgetSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  gadgetSections = self->_gadgetSections;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXGadgetDataSource__enumerateGadgetSectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC1288;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)gadgetSections enumerateObjectsUsingBlock:v7];
}

uint64_t __57__PXGadgetDataSource__enumerateGadgetSectionsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6) {
    *a4 = 1;
  }
  return result;
}

- (NSString)publiclySafeDescription
{
  v3 = NSString;
  uint64_t v4 = [(PXGadgetDataSource *)self identifier];
  int64_t v5 = [(PXGadgetDataSource *)self numberOfSections];
  uint64_t v6 = [(PXGadgetDataSource *)self totalNumberOfItems];
  id v7 = [(PXGadgetDataSource *)self allSectionIndexPaths];
  id v8 = [(PXGadgetDataSource *)self allItemIndexPaths];
  id v9 = [v3 stringWithFormat:@"identifier: %ld, numberOfSections: %ld, totalNumberOfItems: %ld, allSectionIndexPaths: %@, allItemIndexPaths: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (void)enumerateGadgetsUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 154, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke;
  v8[3] = &unk_1E5DC12D8;
  v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  [(PXGadgetDataSource *)self _enumerateGadgetSectionsUsingBlock:v8];
}

void __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke_2;
  v8[3] = &unk_1E5DC12B0;
  id v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = a4;
  [v7 _enumerateGadgetsInSection:a2 atSectionIndex:a3 usingBlock:v8];
}

uint64_t __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v8)
  {
    *a5 = 1;
    **(unsigned char **)(a1 + 40) = 1;
  }
  return result;
}

- (void)enumerateGadgetSectionsUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 147, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXGadgetDataSource_enumerateGadgetSectionsUsingBlock___block_invoke;
  v8[3] = &unk_1E5DC1288;
  id v9 = v5;
  id v6 = v5;
  [(PXGadgetDataSource *)self _enumerateGadgetSectionsUsingBlock:v8];
}

uint64_t __56__PXGadgetDataSource_enumerateGadgetSectionsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasNoContentGadget
{
  v2 = [(NSArray *)self->_gadgetSections firstObject];
  v3 = [v2 gadgets];
  uint64_t v4 = [v3 firstObject];

  if (v4) {
    BOOL v5 = [v4 gadgetType] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)gadgetWithId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 127, @"Invalid parameter not satisfying: %@", @"gadgetId" object file lineNumber description];
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__164641;
  v17 = __Block_byref_object_dispose__164642;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__PXGadgetDataSource_gadgetWithId___block_invoke;
  v10[3] = &unk_1E5DC1260;
  id v6 = v5;
  id v11 = v6;
  unint64_t v12 = &v13;
  [(PXGadgetDataSource *)self enumerateGadgetsUsingBlock:v10];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __35__PXGadgetDataSource_gadgetWithId___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v8 uniqueGadgetIdentifier];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

- (id)gadgetsOfClass:(Class)a3
{
  if (!a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 119, @"Invalid parameter not satisfying: %@", @"gadgetClass" object file lineNumber description];
  }
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", a3];
  id v6 = [(PXGadgetDataSource *)self _gadgetsMatchingPredicate:v5];

  return v6;
}

- (id)gadgetsOfType:(unint64_t)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"gadgetType == %d", a3);
  id v5 = [(PXGadgetDataSource *)self _gadgetsMatchingPredicate:v4];

  return v5;
}

- (id)_gadgetsMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PXGadgetDataSource__gadgetsMatchingPredicate___block_invoke;
  v11[3] = &unk_1E5DC1238;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(PXGadgetDataSource *)self enumerateGadgetSectionsUsingBlock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __48__PXGadgetDataSource__gadgetsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 gadgets];
  id v4 = [v3 filteredArrayUsingPredicate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObjectsFromArray:v4];
}

- (PXSimpleIndexPath)indexPathForGadget:(SEL)a3
{
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a3, self, @"PXGadgetDataSource.m", 89, @"Invalid parameter not satisfying: %@", @"gadget" object file lineNumber description];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x4010000000;
  v19 = &unk_1AB5D584F;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v20 = *(_OWORD *)off_1E5DAB028;
  long long v21 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__PXGadgetDataSource_indexPathForGadget___block_invoke;
  v13[3] = &unk_1E5DC1210;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  [(PXGadgetDataSource *)self _enumerateGadgetSectionsUsingBlock:v13];
  long long v10 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->item = v10;

  _Block_object_dispose(&v16, 8);
  return result;
}

void __41__PXGadgetDataSource_indexPathForGadget___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__PXGadgetDataSource_indexPathForGadget___block_invoke_2;
  v10[3] = &unk_1E5DC11E8;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  [v6 _enumerateGadgetsInSection:a2 atSectionIndex:a3 usingBlock:v10];
}

uint64_t __41__PXGadgetDataSource_indexPathForGadget___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v8 = result;
    uint64_t result = [*(id *)(result + 40) identifier];
    uint64_t v9 = *(void **)(*(void *)(v8 + 48) + 8);
    v9[4] = result;
    v9[5] = a3;
    v9[6] = a4;
    v9[7] = 0x7FFFFFFFFFFFFFFFLL;
    *a5 = 1;
  }
  return result;
}

- (id)gadgetAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 79, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  if ([(PXGadgetDataSource *)self identifier] != a3->dataSourceIdentifier)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 80, @"Invalid parameter not satisfying: %@", @"self.identifier == indexPath.dataSourceIdentifier" object file lineNumber description];
  }
  uint64_t v8 = [(NSArray *)self->_gadgetSections objectAtIndexedSubscript:a3->section];
  uint64_t v9 = [v8 gadgets];
  long long v10 = [v9 objectAtIndexedSubscript:a3->item];

  return v10;
}

- (PXSimpleIndexPath)indexPathForGadgetSectionWithIdentifier:(SEL)a3
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a3, self, @"PXGadgetDataSource.m", 65, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x4010000000;
  long long v21 = &unk_1AB5D584F;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v22 = *(_OWORD *)off_1E5DAB028;
  long long v23 = v8;
  gadgetSections = self->_gadgetSections;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PXGadgetDataSource_indexPathForGadgetSectionWithIdentifier___block_invoke;
  v14[3] = &unk_1E5DC1210;
  id v10 = v7;
  uint64_t v16 = self;
  v17 = &v18;
  id v15 = v10;
  [(NSArray *)gadgetSections enumerateObjectsUsingBlock:v14];
  long long v11 = *((_OWORD *)v19 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v19 + 2);
  *(_OWORD *)&retstr->item = v11;

  _Block_object_dispose(&v18, 8);
  return result;
}

int64x2_t __62__PXGadgetDataSource_indexPathForGadgetSectionWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v10 = [*(id *)(a1 + 40) identifier];
    long long v11 = *(int64x2_t **)(*(void *)(a1 + 48) + 8);
    v11[2].i64[0] = v10;
    v11[2].i64[1] = a3;
    int64x2_t result = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v11[3] = result;
    *a4 = 1;
  }
  return result;
}

- (id)gadgetSectionWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 54, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  [(PXGadgetDataSource *)self indexPathForGadgetSectionWithIdentifier:v5];
  if (*(void *)off_1E5DAAED8)
  {
    v9[0] = v10;
    v9[1] = v11;
    id v6 = [(PXGadgetDataSource *)self gadgetSectionAtIndexPath:v9];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)gadgetSectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 46, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath)" object file lineNumber description];
  }
  if ([(PXGadgetDataSource *)self identifier] != a3->dataSourceIdentifier)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGadgetDataSource.m", 47, @"Invalid parameter not satisfying: %@", @"self.identifier == indexPath.dataSourceIdentifier" object file lineNumber description];
  }
  gadgetSections = self->_gadgetSections;
  int64_t section = a3->section;
  return [(NSArray *)gadgetSections objectAtIndexedSubscript:section];
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  id v4 = [(PXGadgetDataSource *)self gadgetAtIndexPath:v6];
  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  long long v3 = [(NSArray *)self->_gadgetSections objectAtIndexedSubscript:a3];
  id v4 = [v3 gadgets];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_gadgetSections count];
}

- (PXGadgetDataSource)init
{
  return [(PXGadgetDataSource *)self initWithGadgetSections:MEMORY[0x1E4F1CBF0]];
}

- (PXGadgetDataSource)initWithGadgetSections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGadgetDataSource;
  id v6 = [(PXGadgetDataSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gadgetSections, a3);
  }

  return v7;
}

@end