@interface PXContentSyndicationMockSingleAssetsDataSource
- (PXContentSyndicationMockSingleAssetsDataSource)initWithFetchResult:(id)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4;
- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForCollection:(id)a3;
- (id)mostRecentlyAddedDate;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)countForCollection:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXContentSyndicationMockSingleAssetsDataSource

- (void).cxx_destruct
{
}

- (id)mostRecentlyAddedDate
{
  v2 = [(PHFetchResult *)self->_fetchResult firstObject];
  [v2 fetchPropertySetsIfNeeded];
  v3 = [v2 curationProperties];
  v4 = [v3 addedDate];

  return v4;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXContentSyndicationMockSingleAssetsDataSource *)self identifier])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 126, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 127, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  v9 = -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:");
  id v10 = objc_alloc(MEMORY[0x1E4F39150]);
  v20[0] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v12 = [(PHFetchResult *)self->_fetchResult photoLibrary];
  v13 = [(PHFetchResult *)self->_fetchResult fetchType];
  v14 = [(PHFetchResult *)self->_fetchResult fetchPropertySets];
  v15 = (void *)[v10 initWithObjects:v11 photoLibrary:v12 fetchType:v13 fetchPropertySets:v14 identifier:0 registerIfNeeded:0];

  v16 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v15 subtype:1000000501];

  return v16;
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  v4 = [(PXContentSyndicationMockSingleAssetsDataSource *)self assetCollectionAtItemIndexPath:v7];
  v5 = [[PXContentSyndicationItem alloc] initWithAssetCollection:v4];

  return v5;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationMockSingleAssetsDataSource.m" lineNumber:114 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  return 1;
}

- (id)collectionListForSection:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationMockSingleAssetsDataSource.m" lineNumber:106 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationMockSingleAssetsDataSource.m" lineNumber:102 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)indexPathForCollection:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationMockSingleAssetsDataSource.m" lineNumber:98 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a3, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 81, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = *(void *)off_1E5DAAED8;
LABEL_18:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a3, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 82, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

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
  v24.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSource;
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
    [v19 handleFailureInMethod:a3, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 86, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v21 object file lineNumber description];
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
    [v19 handleFailureInMethod:a3, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 86, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v21, v23 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_13:
  NSUInteger v13 = [(PHFetchResult *)self->_fetchResult indexOfObject:v12];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v14 = v13;
    long long v25 = (unint64_t)[(PXContentSyndicationMockSingleAssetsDataSource *)self identifier];
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
  v4 = [(PXContentSyndicationMockSingleAssetsDataSource *)self assetCollectionAtItemIndexPath:v6];
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

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  v6 = [a3 changeDetailsForFetchResult:self->_fetchResult];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 fetchResultAfterChanges];
    fetchResult = v8;
    if (!v8) {
      fetchResult = self->_fetchResult;
    }
    id v10 = fetchResult;

    v11 = [[PXContentSyndicationMockSingleAssetsDataSource alloc] initWithFetchResult:v10];
    if (a4) {
      goto LABEL_5;
    }
  }
  else
  {
    v11 = self;
    if (a4)
    {
LABEL_5:
      *a4 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v7];
    }
  }

  return v11;
}

- (PXContentSyndicationMockSingleAssetsDataSource)initWithFetchResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 36, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSource;
  id v7 = [(PXContentSyndicationMockSingleAssetsDataSource *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_fetchResult, a3);
  }

  return v8;
}

@end