@interface PUAssetExplorerReviewScreenAssetsDataSource
- (NSCache)_assetReferenceByIndexPathCache;
- (NSDictionary)_substitutedAssetsByUUID;
- (PUAssetExplorerReviewScreenAssetsDataSource)initWithDataSource:(id)a3 substitutedAssets:(id)a4;
- (PUAssetsDataSource)_originalDataSource;
- (id)assetCollectionAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)identifier;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetReferenceByIndexPathCache, 0);
  objc_storeStrong((id *)&self->__substitutedAssetsByUUID, 0);
  objc_storeStrong((id *)&self->__originalDataSource, 0);
}

- (NSCache)_assetReferenceByIndexPathCache
{
  return self->__assetReferenceByIndexPathCache;
}

- (NSDictionary)_substitutedAssetsByUUID
{
  return self->__substitutedAssetsByUUID;
}

- (PUAssetsDataSource)_originalDataSource
{
  return self->__originalDataSource;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
  v6 = [v5 badgeInfoPromiseForAssetAtIndexPath:v4];

  return v6;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
  v6 = [v5 indexPathForAssetCollection:v4];

  return v6;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
  v6 = [v5 assetCollectionAtIndexPath:v4];

  return v6;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 dataSourceIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(PUAssetExplorerReviewScreenAssetsDataSource *)self identifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        v6,
        !v8))
  {
    v10 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v5 originalAssetReference];
      v9 = [v10 indexPathForAssetReference:v11];
    }
    else
    {
      v9 = [v10 indexPathForAssetReference:v5];
    }
  }
  else
  {
    v9 = [v5 indexPath];
  }

  return v9;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _assetReferenceByIndexPathCache];
  v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    v17 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
    v7 = [v17 assetReferenceAtIndexPath:v4];
    int v8 = [v7 asset];
    v9 = [v8 uuid];
    v10 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _substitutedAssetsByUUID];
    uint64_t v11 = [v10 objectForKeyedSubscript:v9];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v8;
    }
    id v14 = v13;
    v15 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self identifier];
    v6 = [[PUAssetExplorerReviewScreenAssetsDataSourceAssetReference alloc] initWithOriginalAssetReference:v7 asset:v14 dataSourceIdentifier:v15];

    [v5 setObject:v6 forKey:v4];
  }

  return v6;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetExplorerReviewScreenAssetsDataSource *)self _originalDataSource];
  int64_t v6 = [v5 numberOfSubItemsAtIndexPath:v4];

  return v6;
}

- (id)identifier
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSource;
  v2 = [(PUTilingDataSource *)&v4 identifier];
  return v2;
}

- (PUAssetExplorerReviewScreenAssetsDataSource)initWithDataSource:(id)a3 substitutedAssets:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSource;
  v9 = [(PUTilingDataSource *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__originalDataSource, a3);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "uuid", (void)v25);
          [v11 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [v11 copy];
    substitutedAssetsByUUID = v10->__substitutedAssetsByUUID;
    v10->__substitutedAssetsByUUID = (NSDictionary *)v19;

    v21 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    assetReferenceByIndexPathCache = v10->__assetReferenceByIndexPathCache;
    v10->__assetReferenceByIndexPathCache = v21;

    v23 = v10;
  }

  return v10;
}

@end