@interface PXContentSyndicationMockCMMDataSource
- (PXCMMInvitationsDataSource)cmmDataSource;
- (PXContentSyndicationMockCMMDataSource)initWithCMMDataSource:(id)a3;
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

@implementation PXContentSyndicationMockCMMDataSource

- (void).cxx_destruct
{
}

- (PXCMMInvitationsDataSource)cmmDataSource
{
  return self->_cmmDataSource;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  v6 = [v4 invitationAtItemIndexPath:v9];

  v7 = [v6 assetCollection];

  return v7;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  v6 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  int64_t v7 = [v6 numberOfSubitemsInItem:a3 section:a4];

  return v7;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  int64_t v4 = [v3 numberOfItemsInSection:0];

  return v4;
}

- (int64_t)numberOfSections
{
  v2 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)countForCollection:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (([v5 conformsToProtocol:&unk_1F0352298] & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PXContentSyndicationMockCMMDataSource.m", 98, @"%@ should be nil or conform to protocol %@, but %@ doesn't", @"collection", @"PXDisplayAssetCollection", v10 object file lineNumber description];
    }
    int64_t v7 = [v6 estimatedAssetCount];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)collectionListForSection:(int64_t)a3
{
  return 0;
}

- (id)collectionAtIndexPath:(id)a3
{
  long long v6 = 0u;
  long long v7 = 0u;
  id v4 = a3;
  [(PXContentSyndicationMockCMMDataSource *)self identifier];
  PXSimpleIndexPathFromIndexPath();
}

- (id)mostRecentlyAddedDate
{
  v2 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  int64_t v3 = v2;
  long long v9 = 0u;
  long long v10 = 0u;
  if (v2)
  {
    [v2 firstItemIndexPath];
    uint64_t v4 = v9;
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (v4 == *(void *)off_1E5DAAED8)
  {
    id v5 = 0;
  }
  else
  {
    v8[0] = v9;
    v8[1] = v10;
    long long v6 = [v3 invitationAtItemIndexPath:v8];
    id v5 = [v6 creationDate];
  }
  return v5;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v4 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  long long v6 = [v4 invitationAtItemIndexPath:v9];

  long long v7 = [v6 assetCollection];

  return v7;
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v4 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v5;
  long long v6 = [v4 invitationAtItemIndexPath:v10];

  long long v7 = [v6 assetCollection];
  v8 = [[PXContentSyndicationItem alloc] initWithAssetCollection:v7];

  return v8;
}

- (int64_t)identifier
{
  v2 = [(PXContentSyndicationMockCMMDataSource *)self cmmDataSource];
  int64_t v3 = [v2 identifier];

  return v3;
}

- (PXContentSyndicationMockCMMDataSource)initWithCMMDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationMockCMMDataSource;
  long long v6 = [(PXContentSyndicationMockCMMDataSource *)&v9 init];
  long long v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cmmDataSource, a3);
  }

  return v7;
}

@end