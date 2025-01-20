@interface PXDiscoveryFeedDataSource
- (PHFetchResult)assetCollections;
- (PXDiscoveryFeedDataSource)init;
- (PXDiscoveryFeedDataSource)initWithAssetCollections:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXDiscoveryFeedDataSource

- (void).cxx_destruct
{
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section = a3->section;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL
    || section != 0)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  return [(PXDiscoveryFeedDataSource *)self assetCollections];
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(PXDiscoveryFeedDataSource *)self assetCollections];
  v5 = [v4 objectAtIndex:a3->item];

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXDiscoveryFeedDataSource *)self assetCollections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXDiscoveryFeedDataSource)initWithAssetCollections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiscoveryFeedDataSource;
  v6 = [(PXDiscoveryFeedDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetCollections, a3);
  }

  return v7;
}

- (PXDiscoveryFeedDataSource)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDiscoveryFeedDataSource.m", 16, @"%s is not available as initializer", "-[PXDiscoveryFeedDataSource init]");

  abort();
}

@end