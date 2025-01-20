@interface PXPeoplePickerMockDataSource
- (PXPeoplePickerMockDataSource)initWithMocks:(id)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)personAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXPeoplePickerMockDataSource

- (void).cxx_destruct
{
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a3, self, @"PXPeoplePickerMockDataSourceManager.m", 53, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

LABEL_16:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a3, self, @"PXPeoplePickerMockDataSourceManager.m", 54, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

    goto LABEL_10;
  }
  [v7 indexPath];
  if (v22 == *(void *)off_1E5DAAED8 || v23 == 0x7FFFFFFFFFFFFFFFLL || v24 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
LABEL_10:
  v11 = [v8 itemObject];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a3, self, @"PXPeoplePickerMockDataSourceManager.m", 56, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a3, self, @"PXPeoplePickerMockDataSourceManager.m", 56, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v18 object file lineNumber description];
  }

LABEL_12:
  int64_t v12 = [(NSArray *)self->_mocks indexOfObject:v11];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a3, self, @"PXPeoplePickerMockDataSourceManager.m", 58, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  retstr->dataSourceIdentifier = [(PXPeoplePickerMockDataSource *)self identifier];
  retstr->section = 0;
  retstr->item = v12;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPeoplePickerMockDataSource *)self identifier])
  {
    int64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerMockDataSourceManager.m", 45, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPeoplePickerMockDataSourceManager.m", 46, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  mocks = self->_mocks;
  return -[NSArray objectAtIndexedSubscript:](mocks, "objectAtIndexedSubscript:");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(NSArray *)self->_mocks count];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)personAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  v6 = [(PXPeoplePickerMockDataSource *)self objectAtIndexPath:v13];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    int64_t v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerMockDataSourceManager.m", 29, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectAtIndexPath:indexPath]", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerMockDataSourceManager.m", 29, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectAtIndexPath:indexPath]", v10 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

- (PXPeoplePickerMockDataSource)initWithMocks:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPeoplePickerMockDataSourceManager.m", 19, @"Invalid parameter not satisfying: %@", @"mocks" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPeoplePickerMockDataSource;
  id v7 = [(PXPeoplePickerMockDataSource *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_mocks, a3);
  }

  return v8;
}

@end