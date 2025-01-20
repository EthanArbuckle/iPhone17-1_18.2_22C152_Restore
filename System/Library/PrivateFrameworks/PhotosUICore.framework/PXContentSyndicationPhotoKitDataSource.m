@interface PXContentSyndicationPhotoKitDataSource
- (PXContentSyndicationPhotoKitDataSource)initWithFetchResult:(id)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)dataSourceUpdatedWithChange:(id)a3 underlyingArrayChangeDetails:(id *)a4;
- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForCollection:(id)a3;
- (id)mostRecentlyAddedDate;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)countForCollection:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXContentSyndicationPhotoKitDataSource

- (void).cxx_destruct
{
}

- (id)mostRecentlyAddedDate
{
  v2 = [(PHFetchResult *)self->_fetchResult firstObject];
  v3 = [v2 startDate];

  return v3;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXContentSyndicationPhotoKitDataSource *)self identifier])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 130, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 131, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  fetchResult = self->_fetchResult;
  return -[PHFetchResult objectAtIndexedSubscript:](fetchResult, "objectAtIndexedSubscript:");
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  v3 = [(PHFetchResult *)self->_fetchResult objectAtIndexedSubscript:a3->item];
  v4 = [[PXContentSyndicationItem alloc] initWithAssetCollection:v3];

  return v4;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationPhotoKitDataSource.m" lineNumber:118 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 112, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v10 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 112, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v10, v12 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  int64_t v6 = [v5 estimatedAssetCount];

  return v6;
}

- (id)collectionListForSection:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationPhotoKitDataSource.m" lineNumber:108 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5 = a3;
  int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationPhotoKitDataSource.m" lineNumber:104 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)indexPathForCollection:(id)a3
{
  id v5 = a3;
  int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationPhotoKitDataSource.m" lineNumber:100 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a3, self, @"PXContentSyndicationPhotoKitDataSource.m", 83, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = *(void *)off_1E5DAAED8;
LABEL_18:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a3, self, @"PXContentSyndicationPhotoKitDataSource.m", 84, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

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
  v24.super_class = (Class)PXContentSyndicationPhotoKitDataSource;
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
    [v19 handleFailureInMethod:a3, self, @"PXContentSyndicationPhotoKitDataSource.m", 88, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v21 object file lineNumber description];
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
    [v19 handleFailureInMethod:a3, self, @"PXContentSyndicationPhotoKitDataSource.m", 88, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v21, v23 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_13:
  NSUInteger v13 = [(PHFetchResult *)self->_fetchResult indexOfObject:v12];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v14 = v13;
    long long v25 = (unint64_t)[(PXContentSyndicationPhotoKitDataSource *)self identifier];
    *(void *)&long long v26 = v14;
    *((void *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  long long v15 = v26;
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXContentSyndicationPhotoKitDataSource *)self assetCollectionAtItemIndexPath:v6];
  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(PHFetchResult *)self->_fetchResult count];
}

- (int64_t)numberOfSections
{
  return [(PHFetchResult *)self->_fetchResult count] != 0;
}

- (id)dataSourceUpdatedWithChange:(id)a3 underlyingArrayChangeDetails:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [a3 changeDetailsForFetchResult:self->_fetchResult];
  if (v6)
  {
    id v7 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      NSUInteger v14 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: We have received changes to our fetch result: %@", (uint8_t *)&v13, 0xCu);
    }

    v8 = [v6 fetchResultAfterChanges];
    fetchResult = v8;
    if (!v8) {
      fetchResult = self->_fetchResult;
    }
    v10 = fetchResult;

    v11 = [[PXContentSyndicationPhotoKitDataSource alloc] initWithFetchResult:v10];
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v11 = self;
    if (a4)
    {
LABEL_7:
      *a4 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v6];
    }
  }

  return v11;
}

- (PXContentSyndicationPhotoKitDataSource)initWithFetchResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 37, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationPhotoKitDataSource;
  id v7 = [(PXContentSyndicationPhotoKitDataSource *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_fetchResult, a3);
  }

  return v8;
}

@end