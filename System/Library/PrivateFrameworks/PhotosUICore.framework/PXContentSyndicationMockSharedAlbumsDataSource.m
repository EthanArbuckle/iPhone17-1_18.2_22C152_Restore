@interface PXContentSyndicationMockSharedAlbumsDataSource
- (PXCollectionsDataSource)sharedAlbumsDataSource;
- (PXContentSyndicationMockSharedAlbumsDataSource)initWithSharedAlbumsDataSource:(id)a3;
- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)mostRecentlyAddedDate;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)countForCollection:(id)a3;
- (int64_t)identifier;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXContentSyndicationMockSharedAlbumsDataSource

- (void).cxx_destruct
{
}

- (PXCollectionsDataSource)sharedAlbumsDataSource
{
  return self->_sharedAlbumsDataSource;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v5;
  v6 = [v4 objectAtIndexPath:v8];

  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  v6 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v7 = [v6 numberOfSubitemsInItem:a3 section:a4];

  return v7;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v4 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v5 = [v4 numberOfItemsInSection:a3];

  return v5;
}

- (int64_t)numberOfSections
{
  v2 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)countForCollection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v6 = [v5 countForCollection:v4];

  return v6;
}

- (id)collectionListForSection:(int64_t)a3
{
  id v4 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v5 = [v4 collectionListForSection:a3];

  return v5;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v6 = [v5 collectionAtIndexPath:v4];

  return v6;
}

- (id)mostRecentlyAddedDate
{
  id v4 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v5 = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  if (v4)
  {
    [v4 firstItemIndexPath];
    uint64_t v6 = v16;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 == *(void *)off_1E5DAAED8)
  {
    int64_t v7 = 0;
    goto LABEL_9;
  }
  v15[0] = v16;
  v15[1] = v17;
  v8 = [v5 objectAtIndexPath:v15];
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 73, @"%@ should be an instance inheriting from %@, but it is nil", @"[sharedAlbumsDataSource objectAtIndexPath:firstItemIndexPath]", v12 object file lineNumber description];
LABEL_14:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 73, @"%@ should be an instance inheriting from %@, but it is %@", @"[sharedAlbumsDataSource objectAtIndexPath:firstItemIndexPath]", v12, v14 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_8:
  int64_t v7 = [v8 endDate];

LABEL_9:
  return v7;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v6 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  long long v7 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v7;
  v8 = [v6 objectAtIndexPath:v15];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 64, @"%@ should be an instance inheriting from %@, but it is %@", @"[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 64, @"%@ should be an instance inheriting from %@, but it is nil", @"[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]", v12 object file lineNumber description];
  }

LABEL_3:
  return v8;
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v6 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  long long v7 = *(_OWORD *)&a3->item;
  v16[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v16[1] = v7;
  v8 = [v6 objectAtIndexPath:v16];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 58, @"%@ should be an instance inheriting from %@, but it is %@", @"[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSharedAlbumsDataSource.m", 58, @"%@ should be an instance inheriting from %@, but it is nil", @"[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]", v13 object file lineNumber description];
  }

LABEL_3:
  v9 = [[PXContentSyndicationItem alloc] initWithAssetCollection:v8];

  return v9;
}

- (int64_t)identifier
{
  v2 = [(PXContentSyndicationMockSharedAlbumsDataSource *)self sharedAlbumsDataSource];
  int64_t v3 = [v2 identifier];

  return v3;
}

- (PXContentSyndicationMockSharedAlbumsDataSource)initWithSharedAlbumsDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationMockSharedAlbumsDataSource;
  uint64_t v6 = [(PXContentSyndicationMockSharedAlbumsDataSource *)&v9 init];
  long long v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sharedAlbumsDataSource, a3);
  }

  return v7;
}

@end