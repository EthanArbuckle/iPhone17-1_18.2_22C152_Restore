@interface PUPXAssetsDataSource
- (PUPXAssetsDataSource)init;
- (PUPXAssetsDataSource)initWithUnderlyingDataSource:(id)a3;
- (PXAssetsDataSource)underlyingDataSource;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4;
- (id)indexPathForAssetReference:(id)a3;
- (id)startingAssetReference;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUPXAssetsDataSource

- (void).cxx_destruct
{
}

- (PXAssetsDataSource)underlyingDataSource
{
  return self->_underlyingDataSource;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F8FFC8];
  id v5 = a3;
  v6 = [v4 defaultManager];
  v7 = [(PUPXAssetsDataSource *)self underlyingDataSource];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v5 section];
  uint64_t v10 = [v5 item];

  v19[0] = v8;
  v19[1] = v9;
  v19[2] = v10;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  v11 = [v7 assetReferenceAtItemIndexPath:v19];
  v12 = [v11 asset];

  long long v17 = 0u;
  long long v18 = 0u;
  if (v6) {
    [v6 badgeInfoForAsset:v12 inCollection:0 options:0];
  }
  v13 = [PUBadgeInfoPromise alloc];
  v16[0] = v17;
  v16[1] = v18;
  v14 = [(PUBadgeInfoPromise *)v13 initWithBadgeInfo:v16];

  return v14;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v5 = [a4 assetReferenceAtIndexPath:a3];
  v6 = [(PUPXAssetsDataSource *)self indexPathForAssetReference:v5];

  return v6;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dataSourceIdentifier];
  v6 = [(PUTilingDataSource *)self identifier];

  if (v5 == v6)
  {
    v14 = [v4 indexPath];
  }
  else
  {
    v7 = [(PUPXAssetsDataSource *)self underlyingDataSource];
    if ([v7 containsAnyItems])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F91220]);
      uint64_t v9 = [v4 assetCollection];
      uint64_t v10 = [v4 asset];
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F91348] + 16);
      long long v16 = *MEMORY[0x1E4F91348];
      long long v17 = v11;
      v12 = (void *)[v8 initWithSectionObject:v9 itemObject:v10 subitemObject:0 indexPath:&v16];

      long long v16 = 0u;
      long long v17 = 0u;
      if (v7)
      {
        [v7 indexPathForAssetReference:v12];
        uint64_t v13 = v16;
      }
      else
      {
        uint64_t v13 = 0;
      }
      if (v13 == *MEMORY[0x1E4F91310])
      {
        v14 = 0;
      }
      else
      {
        v14 = PXIndexPathFromSimpleIndexPath();
      }
    }
    else
    {
      v14 = 0;
    }
  }
  return v14;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPXAssetsDataSource *)self underlyingDataSource];
  [v5 identifier];
  PXSimpleIndexPathFromIndexPath();

  v6 = [(PUPXAssetsDataSource *)self underlyingDataSource];
  memset(v12, 0, sizeof(v12));
  v7 = [v6 assetReferenceAtItemIndexPath:v12];

  id v8 = [PUPXAssetReference alloc];
  uint64_t v9 = [(PUTilingDataSource *)self identifier];
  uint64_t v10 = [(PUPXAssetReference *)v8 initWithPXAssetReference:v7 dataSourceIdentifier:v9];

  return v10;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [(PUPXAssetsDataSource *)self underlyingDataSource];
    uint64_t v8 = [v7 numberOfSections];
  }
  else if ([v4 length] == 1 && objc_msgSend(v4, "section") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(PUPXAssetsDataSource *)self underlyingDataSource];
    uint64_t v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  }
  else
  {
    v7 = [(PUPXAssetsDataSource *)self underlyingDataSource];
    uint64_t v8 = objc_msgSend(v7, "numberOfSubitemsInItem:section:", objc_msgSend(v4, "item"), objc_msgSend(v4, "section"));
  }
  int64_t v9 = v8;

  return v9;
}

- (id)startingAssetReference
{
  v3 = [(PUPXAssetsDataSource *)self underlyingDataSource];
  id v4 = [v3 startingAssetReference];

  if (v4)
  {
    id v5 = [PUPXAssetReference alloc];
    int v6 = [(PUTilingDataSource *)self identifier];
    v7 = [(PUPXAssetReference *)v5 initWithPXAssetReference:v4 dataSourceIdentifier:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PUPXAssetsDataSource)initWithUnderlyingDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetsDataSource;
  int v6 = [(PUTilingDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingDataSource, a3);
  }

  return v7;
}

- (PUPXAssetsDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXAssetsDataSource.m", 21, @"%s is not available as initializer", "-[PUPXAssetsDataSource init]");

  abort();
}

@end