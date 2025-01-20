@interface PUCameraTransientAssetsDataSource
- (BOOL)isEmpty;
- (NSArray)_assetUUIDs;
- (NSDictionary)_assetsByUUID;
- (NSDictionary)_representativeAssetsByBurstIdentifier;
- (PUCameraTransientAssetsDataSource)initWithUUIDs:(id)a3 mapping:(id)a4 representativeMapping:(id)a5 inAssetCollection:(id)a6;
- (PUDisplayAssetCollection)_transientAssetCollection;
- (id)_uuidAtIndexPath:(id)a3;
- (id)assetAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)assetReferenceForAssetReference:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (id)startingAssetReference;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUCameraTransientAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByUUID, 0);
  objc_storeStrong((id *)&self->__assetUUIDs, 0);
  objc_storeStrong((id *)&self->__transientAssetCollection, 0);
}

- (NSDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (NSDictionary)_assetsByUUID
{
  return self->__assetsByUUID;
}

- (NSArray)_assetUUIDs
{
  return self->__assetUUIDs;
}

- (PUDisplayAssetCollection)_transientAssetCollection
{
  return self->__transientAssetCollection;
}

- (id)_uuidAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  unint64_t v6 = [v4 item];

  if (v6 >= [v5 count] - 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

- (BOOL)isEmpty
{
  v2 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)startingAssetReference
{
  BOOL v3 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 - 1 inSection:0];
    unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self assetReferenceAtIndexPath:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  v5 = [a4 _uuidAtIndexPath:a3];
  if (v5)
  {
    unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
    uint64_t v7 = [v6 indexOfObject:v5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:0];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  uint64_t v4 = [a3 asset];
  v5 = [v4 uuid];
  unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  uint64_t v7 = [v6 indexOfObject:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    v10 = [(PUCameraTransientAssetsDataSource *)self _assetsByUUID];
    v11 = [v10 objectForKey:v5];
    v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
    v13 = [PUAssetReference alloc];
    v14 = [(PUCameraTransientAssetsDataSource *)self _transientAssetCollection];
    v15 = [(PUTilingDataSource *)self identifier];
    v8 = [(PUAssetReference *)v13 initWithAsset:v11 assetCollection:v14 indexPath:v12 dataSourceIdentifier:v15];
  }
  return v8;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self _assetsByUUID];
  uint64_t v7 = [v4 item];

  v8 = [v5 objectAtIndex:v7];
  uint64_t v9 = [v6 objectForKey:v8];

  return v9;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self _assetsByUUID];
  uint64_t v7 = [v4 item];

  v8 = [v5 objectAtIndex:v7];
  uint64_t v9 = [v6 objectForKey:v8];
  int v10 = [v9 isHDR];
  unint64_t v11 = [v9 mediaSubtypes];
  int v12 = [v9 canPlayPhotoIris];
  v13 = [v9 burstIdentifier];
  unint64_t v14 = [v9 numberOfRepresentedAssets];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F91308] + 8);
  uint64_t v16 = *(void *)(MEMORY[0x1E4F91308] + 24);
  BOOL v17 = v13 != 0;
  BOOL v18 = v14 > 1;
  BOOL v19 = !v17 || !v18;
  if (v17 && v18) {
    uint64_t v20 = *MEMORY[0x1E4F91308] | 8;
  }
  else {
    uint64_t v20 = *MEMORY[0x1E4F91308];
  }
  if (v19) {
    unint64_t v21 = *(void *)(MEMORY[0x1E4F91308] + 16);
  }
  else {
    unint64_t v21 = v14;
  }
  if (v12) {
    v20 |= 0x40uLL;
  }
  if (v10) {
    v20 |= 4uLL;
  }
  v24[0] = v20 | (v11 >> 10) & 0x400;
  v24[1] = v15;
  v24[2] = v21;
  v24[3] = v16;
  v22 = [[PUBadgeInfoPromise alloc] initWithBadgeInfo:v24];

  return v22;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCameraTransientAssetsDataSource *)self _transientAssetCollection];

  if (v5 == v4)
  {
    unint64_t v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 dataSourceIdentifier],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [(PUTilingDataSource *)self identifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        v6,
        !v8))
  {
    int v10 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
    unint64_t v11 = [v5 asset];
    int v12 = [v11 uuid];
    uint64_t v13 = [v10 indexOfObject:v12];

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
    }
  }
  else
  {
    uint64_t v9 = [v5 indexPath];
  }

  return v9;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
  unint64_t v6 = [(PUCameraTransientAssetsDataSource *)self _assetsByUUID];
  uint64_t v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
  int v8 = [v6 objectForKey:v7];
  uint64_t v9 = [(PUCameraTransientAssetsDataSource *)self _transientAssetCollection];
  int v10 = [PUAssetReference alloc];
  unint64_t v11 = [(PUTilingDataSource *)self identifier];
  int v12 = [(PUAssetReference *)v10 initWithAsset:v8 assetCollection:v9 indexPath:v4 dataSourceIdentifier:v11];

  return v12;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6 == 1)
  {
    uint64_t v7 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
    int64_t v8 = [v7 count];
  }
  else if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCameraTransientAssetsDataSource.m", 62, @"invalid indexPath %@", v5 object file lineNumber description];
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(PUCameraTransientAssetsDataSource *)self _assetUUIDs];
    int64_t v8 = [v7 count] != 0;
  }

  return v8;
}

- (PUCameraTransientAssetsDataSource)initWithUUIDs:(id)a3 mapping:(id)a4 representativeMapping:(id)a5 inAssetCollection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PUCameraTransientAssetsDataSource;
  uint64_t v15 = [(PUTilingDataSource *)&v19 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->__assetUUIDs, a3);
    objc_storeStrong((id *)&v16->__assetsByUUID, a4);
    objc_storeStrong((id *)&v16->__representativeAssetsByBurstIdentifier, a5);
    objc_storeStrong((id *)&v16->__transientAssetCollection, a6);
    BOOL v17 = v16;
  }

  return v16;
}

@end