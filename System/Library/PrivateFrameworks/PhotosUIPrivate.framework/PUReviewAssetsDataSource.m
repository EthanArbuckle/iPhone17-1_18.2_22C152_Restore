@interface PUReviewAssetsDataSource
- (BOOL)isEmpty;
- (NSArray)_assetIdentifiers;
- (NSDictionary)_assetsByIdentifier;
- (PUDisplayAssetCollection)_reviewAssetCollection;
- (PUReviewAssetsDataSource)initWithAssetsByIdentifier:(id)a3 usingOrdering:(id)a4 inAssetCollection:(id)a5;
- (id)_identifierAtIndexPath:(id)a3;
- (id)assetAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)assetReferenceForAssetReference:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (id)indexPathForAssetWithIdentifier:(id)a3;
- (id)startingAssetReference;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUReviewAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetIdentifiers, 0);
  objc_storeStrong((id *)&self->__assetsByIdentifier, 0);
  objc_storeStrong((id *)&self->__reviewAssetCollection, 0);
}

- (NSArray)_assetIdentifiers
{
  return self->__assetIdentifiers;
}

- (NSDictionary)_assetsByIdentifier
{
  return self->__assetsByIdentifier;
}

- (PUDisplayAssetCollection)_reviewAssetCollection
{
  return self->__reviewAssetCollection;
}

- (id)_identifierAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
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
  v2 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)startingAssetReference
{
  BOOL v3 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 - 1 inSection:0];
    unint64_t v6 = [(PUReviewAssetsDataSource *)self assetReferenceAtIndexPath:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 _identifierAtIndexPath:v7];

    if (v8)
    {
      v9 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
      uint64_t v10 = [v9 indexOfObject:v8];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
      }
      else
      {
        v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUReviewAssetsDataSource;
    v11 = [(PUAssetsDataSource *)&v13 convertIndexPath:v7 fromAssetsDataSource:v6];
  }
  return v11;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  uint64_t v4 = [a3 asset];
  v5 = [v4 identifier];
  id v6 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  uint64_t v7 = [v6 indexOfObject:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    uint64_t v10 = [(PUReviewAssetsDataSource *)self _assetsByIdentifier];
    v11 = [v10 objectForKey:v5];
    v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
    objc_super v13 = [PUAssetReference alloc];
    v14 = [(PUReviewAssetsDataSource *)self _reviewAssetCollection];
    v15 = [(PUTilingDataSource *)self identifier];
    v8 = [(PUAssetReference *)v13 initWithAsset:v11 assetCollection:v14 indexPath:v12 dataSourceIdentifier:v15];
  }
  return v8;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  id v6 = [(PUReviewAssetsDataSource *)self _assetsByIdentifier];
  uint64_t v7 = [v4 item];

  v8 = [v5 objectAtIndex:v7];
  uint64_t v9 = [v6 objectForKey:v8];

  return v9;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  id v6 = [(PUReviewAssetsDataSource *)self _assetsByIdentifier];
  uint64_t v7 = [v4 item];

  v8 = [v5 objectAtIndex:v7];
  uint64_t v9 = [v6 objectForKey:v8];
  int v10 = [v9 isHDR];
  int v11 = [v9 canPlayPhotoIris];
  v12 = [v9 burstIdentifier];
  unint64_t v13 = [v9 numberOfRepresentedAssets];
  uint64_t v14 = *(void *)(MEMORY[0x1E4F91308] + 8);
  uint64_t v15 = *(void *)(MEMORY[0x1E4F91308] + 24);
  BOOL v16 = v12 != 0;
  BOOL v17 = v13 > 1;
  BOOL v18 = !v16 || !v17;
  if (v16 && v17) {
    uint64_t v19 = *MEMORY[0x1E4F91308] | 8;
  }
  else {
    uint64_t v19 = *MEMORY[0x1E4F91308];
  }
  if (v18) {
    unint64_t v20 = *(void *)(MEMORY[0x1E4F91308] + 16);
  }
  else {
    unint64_t v20 = v13;
  }
  if (v11) {
    v19 |= 0x40uLL;
  }
  if (v10) {
    uint64_t v21 = v19 | 4;
  }
  else {
    uint64_t v21 = v19;
  }
  v24[0] = ((unint64_t)[v9 mediaSubtypes] >> 10) & 0x400 | v21;
  v24[1] = v14;
  v24[2] = v20;
  v24[3] = v15;
  v22 = [[PUBadgeInfoPromise alloc] initWithBadgeInfo:v24];

  return v22;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PUReviewAssetsDataSource *)self _reviewAssetCollection];

  if (v5 == v4)
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)indexPathForAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
  }

  return v7;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 dataSourceIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [(PUTilingDataSource *)self identifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        v6,
        !v8))
  {
    int v10 = [v5 asset];
    int v11 = [v10 identifier];
    uint64_t v9 = [(PUReviewAssetsDataSource *)self indexPathForAssetWithIdentifier:v11];
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
  id v5 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
  uint64_t v6 = [(PUReviewAssetsDataSource *)self _assetsByIdentifier];
  uint64_t v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
  int v8 = [v6 objectForKey:v7];
  uint64_t v9 = [(PUReviewAssetsDataSource *)self _reviewAssetCollection];
  int v10 = [PUAssetReference alloc];
  int v11 = [(PUTilingDataSource *)self identifier];
  v12 = [(PUAssetReference *)v10 initWithAsset:v8 assetCollection:v9 indexPath:v4 dataSourceIdentifier:v11];

  return v12;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6 == 1)
  {
    uint64_t v7 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
    int64_t v8 = [v7 count];
  }
  else if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUReviewAssetsDataSource.m", 57, @"invalid indexPath %@", v5 object file lineNumber description];
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(PUReviewAssetsDataSource *)self _assetIdentifiers];
    int64_t v8 = [v7 count] != 0;
  }

  return v8;
}

- (PUReviewAssetsDataSource)initWithAssetsByIdentifier:(id)a3 usingOrdering:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUReviewAssetsDataSource;
  int v11 = [(PUTilingDataSource *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    assetsByIdentifier = v11->__assetsByIdentifier;
    v11->__assetsByIdentifier = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    assetIdentifiers = v11->__assetIdentifiers;
    v11->__assetIdentifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v11->__reviewAssetCollection, a5);
    BOOL v16 = v11;
  }

  return v11;
}

@end