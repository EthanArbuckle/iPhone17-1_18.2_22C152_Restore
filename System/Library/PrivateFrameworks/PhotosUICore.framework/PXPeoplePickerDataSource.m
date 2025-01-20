@interface PXPeoplePickerDataSource
- (BOOL)isItemDisabledAtIndexPath:(PXSimpleIndexPath *)a3;
- (NSArray)allSelectedLocalIdentifiers;
- (NSArray)disabledLocalIdentifiers;
- (NSOrderedSet)newlyDeselectedObjectIDs;
- (NSOrderedSet)newlySelectedObjectIDs;
- (PHFetchResult)_fetchResult;
- (PXPeoplePickerDataSource)initWithFetchResult:(id)a3 disabledLocalIdentifiers:(id)a4 allSelectedLocalIdentifiers:(id)a5 newlySelectedObjectIDs:(id)a6 newlyDeselectedObjectIDs:(id)a7;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)personAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXPeoplePickerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fetchResult, 0);
  objc_storeStrong((id *)&self->_newlyDeselectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_newlySelectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_allSelectedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_disabledLocalIdentifiers, 0);
}

- (PHFetchResult)_fetchResult
{
  return self->__fetchResult;
}

- (NSOrderedSet)newlyDeselectedObjectIDs
{
  return self->_newlyDeselectedObjectIDs;
}

- (NSOrderedSet)newlySelectedObjectIDs
{
  return self->_newlySelectedObjectIDs;
}

- (NSArray)allSelectedLocalIdentifiers
{
  return self->_allSelectedLocalIdentifiers;
}

- (NSArray)disabledLocalIdentifiers
{
  return self->_disabledLocalIdentifiers;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a3, self, @"PXPeoplePickerDataSourceManager.m", 108, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = *(void *)off_1E5DAAED8;
LABEL_18:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a3, self, @"PXPeoplePickerDataSourceManager.m", 109, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

    goto LABEL_10;
  }
  [v7 indexPath];
  uint64_t v9 = *(void *)off_1E5DAAED8;
  if ((void)v27 == *(void *)off_1E5DAAED8
    || (void)v28 == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)&v28 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  long long v25 = 0u;
  long long v26 = 0u;
  v24.receiver = self;
  v24.super_class = (Class)PXPeoplePickerDataSource;
  [(PXSimpleIndexPath *)&v24 indexPathForObjectReference:v8];
  if ((void)v25 != v9) {
    goto LABEL_16;
  }
  v12 = [v8 itemObject];
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a3, self, @"PXPeoplePickerDataSourceManager.m", 113, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v21 object file lineNumber description];
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a3, self, @"PXPeoplePickerDataSourceManager.m", 113, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v21, v23 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_13:
  v13 = [(PXPeoplePickerDataSource *)self _fetchResult];
  uint64_t v14 = [v13 indexOfObject:v12];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v25 = (unint64_t)[(PXPeoplePickerDataSource *)self identifier];
    *(void *)&long long v26 = v14;
    *((void *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  long long v15 = v26;
  *(_OWORD *)&retstr->dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPeoplePickerDataSource *)self identifier])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 100, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 101, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  uint64_t v9 = [(PXPeoplePickerDataSource *)self _fetchResult];
  v10 = [v9 objectAtIndexedSubscript:a3->item];

  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXPeoplePickerDataSource *)self _fetchResult];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  id v6 = a3;
  id v7 = [(PXPeoplePickerDataSource *)self _fetchResult];
  v8 = [v6 changeDetailsForFetchResult:v7];

  if (v8)
  {
    uint64_t v9 = [v8 fetchResultAfterChanges];
    v10 = [v8 removedObjects];
    v11 = [(PXPeoplePickerDataSource *)self allSelectedLocalIdentifiers];
    v12 = (void *)[v11 mutableCopy];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __70__PXPeoplePickerDataSource_dataSourceUpdatedWithChange_changeDetails___block_invoke;
    objc_super v24 = &unk_1E5DB1258;
    id v25 = v12;
    id v26 = v13;
    id v14 = v13;
    id v15 = v12;
    [v10 enumerateObjectsUsingBlock:&v21];
    v16 = [PXPeoplePickerDataSource alloc];
    v17 = [(PXPeoplePickerDataSource *)self disabledLocalIdentifiers];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v19 = [(PXPeoplePickerDataSource *)v16 initWithFetchResult:v9 disabledLocalIdentifiers:v17 allSelectedLocalIdentifiers:v15 newlySelectedObjectIDs:v18 newlyDeselectedObjectIDs:v14];

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v19 = self;
  if (a4)
  {
LABEL_3:
    *a4 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v8];
  }
LABEL_4:

  return v19;
}

void __70__PXPeoplePickerDataSource_dataSourceUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 localIdentifier];
  [v3 removeObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 objectID];

  [v6 addObject:v7];
}

- (BOOL)isItemDisabledAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPeoplePickerDataSource *)self identifier])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 52, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 53, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  long long v9 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v9;
  v10 = [(PXPeoplePickerDataSource *)self personAtItemIndexPath:v17];
  v11 = [(PXPeoplePickerDataSource *)self disabledLocalIdentifiers];
  v12 = [v10 localIdentifier];
  char v13 = [v11 containsObject:v12];

  return v13;
}

- (id)personAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  id v6 = [(PXPeoplePickerDataSource *)self objectAtIndexPath:v13];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 48, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectAtIndexPath:indexPath]", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerDataSourceManager.m", 48, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectAtIndexPath:indexPath]", v10 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

- (PXPeoplePickerDataSource)initWithFetchResult:(id)a3 disabledLocalIdentifiers:(id)a4 allSelectedLocalIdentifiers:(id)a5 newlySelectedObjectIDs:(id)a6 newlyDeselectedObjectIDs:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PXPeoplePickerDataSource;
  id v18 = [(PXPeoplePickerDataSource *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->__fetchResult, a3);
    uint64_t v20 = [v14 copy];
    disabledLocalIdentifiers = v19->_disabledLocalIdentifiers;
    v19->_disabledLocalIdentifiers = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    allSelectedLocalIdentifiers = v19->_allSelectedLocalIdentifiers;
    v19->_allSelectedLocalIdentifiers = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    newlySelectedObjectIDs = v19->_newlySelectedObjectIDs;
    v19->_newlySelectedObjectIDs = (NSOrderedSet *)v24;

    uint64_t v26 = [v17 copy];
    newlyDeselectedObjectIDs = v19->_newlyDeselectedObjectIDs;
    v19->_newlyDeselectedObjectIDs = (NSOrderedSet *)v26;
  }
  return v19;
}

@end