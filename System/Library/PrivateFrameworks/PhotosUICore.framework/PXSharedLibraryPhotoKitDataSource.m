@interface PXSharedLibraryPhotoKitDataSource
- (PXSharedLibraryPhotoKitDataSource)initWithFetchResult:(id)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXSharedLibraryPhotoKitDataSource

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(PHFetchResult *)self->_fetchResult count];
}

- (PXSharedLibraryPhotoKitDataSource)initWithFetchResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 54, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitDataSource;
  v7 = [(PXSharedLibraryPhotoKitDataSource *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_fetchResult, a3);
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a3, self, @"PXSharedLibraryPhotoKitDataSource.m", 104, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v9 = *(void *)off_1E5DAAED8;
LABEL_18:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a3, self, @"PXSharedLibraryPhotoKitDataSource.m", 105, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

    goto LABEL_10;
  }
  [v7 indexPath];
  uint64_t v9 = *(void *)off_1E5DAAED8;
  if ((void)v28 == *(void *)off_1E5DAAED8
    || (void)v29 == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)&v29 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  long long v26 = 0u;
  long long v27 = 0u;
  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibraryPhotoKitDataSource;
  [(PXSimpleIndexPath *)&v25 indexPathForObjectReference:v8];
  if ((void)v26 != v9) {
    goto LABEL_16;
  }
  v12 = [v8 itemObject];
  if (!v12)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a3, self, @"PXSharedLibraryPhotoKitDataSource.m", 109, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v22 object file lineNumber description];
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a3, self, @"PXSharedLibraryPhotoKitDataSource.m", 109, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v22, v24 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_13:
  v13 = [v12 libraryScope];
  NSUInteger v14 = [(PHFetchResult *)self->_fetchResult indexOfObject:v13];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v15 = v14;
    long long v26 = (unint64_t)[(PXSharedLibraryPhotoKitDataSource *)self identifier];
    *(void *)&long long v27 = v15;
    *((void *)&v27 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  long long v16 = v27;
  *(_OWORD *)&retstr->dataSourceIdentifier = v26;
  *(_OWORD *)&retstr->item = v16;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSharedLibraryPhotoKitDataSource *)self identifier])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 95, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 96, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  uint64_t v9 = -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:");
  v10 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v9];

  return v10;
}

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  v5 = [a3 changeDetailsForFetchResult:self->_fetchResult];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fetchResultAfterChanges];
    v8 = [[PXSharedLibraryPhotoKitDataSource alloc] initWithFetchResult:v7];

    if (a4 && v8)
    {
      *a4 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v6];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  id v6 = [(PXSharedLibraryPhotoKitDataSource *)self objectAtIndexPath:v13];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 64, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectAtIndexPath:indexPath]", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 64, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectAtIndexPath:indexPath]", v10 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

@end