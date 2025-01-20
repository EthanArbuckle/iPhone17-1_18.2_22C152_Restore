@interface PUJoiningAssetsDataSource
- (NSArray)_containedDataSourceInfos;
- (NSArray)_dataSources;
- (NSDictionary)_containedDataSourceInfoByIdentifier;
- (PUJoiningAssetsDataSource)initWithDataSources:(id)a3;
- (id)_assetsDataSourceForExternalIndexPath:(id)a3 outDataSourceIndex:(int64_t *)a4 outLocalIndexPath:(id *)a5;
- (id)_externalIndexPathForLocalIndexPath:(id)a3 inAssetsDataSource:(id)a4;
- (id)assetAtIndexPath:(id)a3;
- (id)assetCollectionAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)containedAssetsDataSourceAtIndexPath:(id)a3;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (id)startingAssetReference;
- (int64_t)_totalNumberOfSections;
- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUJoiningAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containedDataSourceInfos, 0);
  objc_storeStrong((id *)&self->__containedDataSourceInfoByIdentifier, 0);
  objc_storeStrong((id *)&self->__dataSources, 0);
}

- (NSArray)_containedDataSourceInfos
{
  return self->__containedDataSourceInfos;
}

- (NSDictionary)_containedDataSourceInfoByIdentifier
{
  return self->__containedDataSourceInfoByIdentifier;
}

- (int64_t)_totalNumberOfSections
{
  return self->__totalNumberOfSections;
}

- (NSArray)_dataSources
{
  return self->__dataSources;
}

- (id)containedAssetsDataSourceAtIndexPath:(id)a3
{
  uint64_t v6 = 0;
  v3 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:a3 outDataSourceIndex:0 outLocalIndexPath:&v6];
  v4 = [v3 containedAssetsDataSourceAtIndexPath:v6];

  return v4;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(PUJoiningAssetsDataSource *)self _dataSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) numberOfAssetsWithMaximum:a3];
      v7 += v10;
      a3 -= v10;
      if (a3 < 1) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)startingAssetReference
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(PUJoiningAssetsDataSource *)self _dataSources];
  v4 = [v3 reverseObjectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 startingAssetReference];
        if (v10)
        {
          long long v13 = v10;
          long long v14 = [v10 indexPath];
          long long v12 = [(PUJoiningAssetsDataSource *)self _externalIndexPathForLocalIndexPath:v14 inAssetsDataSource:v9];

          if (v12)
          {
            v11 = [(PUJoiningAssetsDataSource *)self assetReferenceAtIndexPath:v12];
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v11 = 0;
  long long v12 = 0;
LABEL_13:

  return v11;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  uint64_t v6 = 0;
  v3 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:a3 outDataSourceIndex:0 outLocalIndexPath:&v6];
  v4 = [v3 badgeInfoPromiseForAssetAtIndexPath:v6];

  return v4;
}

- (id)assetAtIndexPath:(id)a3
{
  uint64_t v6 = 0;
  v3 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:a3 outDataSourceIndex:0 outLocalIndexPath:&v6];
  v4 = [v3 assetAtIndexPath:v6];

  return v4;
}

- (id)indexPathForAssetCollection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(PUJoiningAssetsDataSource *)self _dataSources];
  uint64_t v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 indexPathForAssetCollection:v4];
        if (v12)
        {
          long long v14 = (void *)v12;
          long long v13 = [(PUJoiningAssetsDataSource *)self _externalIndexPathForLocalIndexPath:v12 inAssetsDataSource:v11];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v13 = 0;
LABEL_11:

  return v13;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  uint64_t v6 = 0;
  v3 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:a3 outDataSourceIndex:0 outLocalIndexPath:&v6];
  id v4 = [v3 assetCollectionAtIndexPath:v6];

  return v4;
}

- (id)indexPathForAssetReference:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__40136;
  v47 = __Block_byref_object_dispose__40137;
  id v48 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 dataSourceIdentifier];
    uint64_t v7 = [(PUTilingDataSource *)self identifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      uint64_t v9 = [v5 indexPath];
      uint64_t v10 = (void *)v44[5];
      v44[5] = v9;
    }
    else
    {
      uint64_t v10 = [v5 containedAssetReference];
      unint64_t v18 = [v5 hintDataSourceIndex];
      long long v19 = [(PUJoiningAssetsDataSource *)self _dataSources];
      BOOL v20 = v18 < [v19 count];

      if (v20)
      {
        uint64_t v21 = [(PUJoiningAssetsDataSource *)self _dataSources];
        v22 = [v21 objectAtIndexedSubscript:v18];
      }
      else
      {
        v22 = 0;
      }
      v23 = [v22 identifier];
      v24 = [v10 dataSourceIdentifier];
      int v25 = [v23 isEqualToString:v24];

      if (v25)
      {
        v26 = [v10 indexPath];
        uint64_t v27 = [(PUJoiningAssetsDataSource *)self _externalIndexPathForLocalIndexPath:v26 inAssetsDataSource:v22];
        v28 = (void *)v44[5];
        v44[5] = v27;
      }
      else
      {
        unint64_t v29 = [v5 hintDataSourceIndex];
        v30 = [(PUJoiningAssetsDataSource *)self _dataSources];
        unint64_t v31 = [v30 count];

        v32 = [(PUJoiningAssetsDataSource *)self _dataSources];
        if (v29 >= v31) {
          unint64_t v29 = 0;
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __56__PUJoiningAssetsDataSource_indexPathForAssetReference___block_invoke;
        v39[3] = &unk_1E5F26C78;
        v41 = self;
        v42 = &v43;
        id v40 = v10;
        objc_msgSend(v32, "px_enumerateObjectsFromIndex:usingBlock:", v29, v39);

        v26 = v40;
      }
    }
LABEL_23:
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v11 = [(PUJoiningAssetsDataSource *)self _dataSources];
    id v5 = [v11 reverseObjectEnumerator];

    uint64_t v12 = [v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v5);
          }
          long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v10 = [v15 indexPathForAssetReference:v4];
          if (v10)
          {
            uint64_t v16 = [(PUJoiningAssetsDataSource *)self _externalIndexPathForLocalIndexPath:v10 inAssetsDataSource:v15];
            long long v17 = (void *)v44[5];
            v44[5] = v16;

            goto LABEL_23;
          }
        }
        uint64_t v12 = [v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }

  id v33 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  return v33;
}

void __56__PUJoiningAssetsDataSource_indexPathForAssetReference___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 indexPathForAssetReference:*(void *)(a1 + 32)];
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) _externalIndexPathForLocalIndexPath:v6 inAssetsDataSource:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v4 = a3;
  id v5 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:v4 outDataSourceIndex:&v13 outLocalIndexPath:&v12];
  uint64_t v6 = [v5 assetReferenceAtIndexPath:v12];
  uint64_t v7 = [PUJoiningAssetReference alloc];
  uint64_t v8 = v13;
  uint64_t v9 = [(PUTilingDataSource *)self identifier];
  id v10 = [(PUJoiningAssetReference *)v7 initWithContainedAssetReference:v6 hintDataSourceIndex:v8 indexPath:v4 dataSourceIdentifier:v9];

  return v10;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    int64_t v7 = [(PUJoiningAssetsDataSource *)self _totalNumberOfSections];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v8 = [(PUJoiningAssetsDataSource *)self _assetsDataSourceForExternalIndexPath:v4 outDataSourceIndex:0 outLocalIndexPath:&v10];
    int64_t v7 = [v8 numberOfSubItemsAtIndexPath:v10];
  }
  return v7;
}

- (id)_externalIndexPathForLocalIndexPath:(id)a3 inAssetsDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUJoiningAssetsDataSource *)self _containedDataSourceInfoByIdentifier];
  uint64_t v9 = [v6 identifier];

  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  v11 = objc_msgSend(v7, "pu_indexPathByChangingIndexAtPosition:toIndex:", 0, objc_msgSend(v10, "externalSections") + objc_msgSend(v7, "indexAtPosition:", 0));

  return v11;
}

- (id)_assetsDataSourceForExternalIndexPath:(id)a3 outDataSourceIndex:(int64_t *)a4 outLocalIndexPath:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = [v8 indexAtPosition:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [(PUJoiningAssetsDataSource *)self _containedDataSourceInfos];
  v11 = (char *)[v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    v22 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      long long v14 = 0;
      long long v15 = &v11[(void)v12];
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v14);
        unint64_t v17 = [v16 externalSections];
        if (v9 >= v17 && v9 - v17 < v18)
        {
          v11 = [v16 assetsDataSource];
          if (a5)
          {
            objc_msgSend(v8, "pu_indexPathByChangingIndexAtPosition:toIndex:", 0, v9 - objc_msgSend(v16, "externalSections"));
            id v20 = objc_claimAutoreleasedReturnValue();
            *a5 = v20;
          }
          if (v22) {
            int64_t *v22 = (int64_t)&v14[(void)v12];
          }
          goto LABEL_18;
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = (char *)[v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v12 = v15;
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v11;
}

- (PUJoiningAssetsDataSource)initWithDataSources:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PUJoiningAssetsDataSource;
  id v6 = [(PUTilingDataSource *)&v31 init];
  id v7 = v6;
  if (v6)
  {
    long long v24 = v6;
    objc_storeStrong((id *)&v6->__dataSources, a3);
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    unint64_t v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v25 = v5;
    id obj = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int64_t v12 = 0;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
          uint64_t v17 = [v15 numberOfSubItemsAtIndexPath:v16];

          unint64_t v18 = objc_alloc_init(PUContainedDataSourceInfo);
          [(PUContainedDataSourceInfo *)v18 setAssetsDataSource:v15];
          -[PUContainedDataSourceInfo setExternalSections:](v18, "setExternalSections:", v12, v17);
          long long v19 = [v15 identifier];
          [(NSDictionary *)v9 setObject:v18 forKeyedSubscript:v19];

          [(NSArray *)v8 addObject:v18];
          v12 += v17;
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }
    else
    {
      int64_t v12 = 0;
    }

    id v7 = v24;
    containedDataSourceInfos = v24->__containedDataSourceInfos;
    v24->__containedDataSourceInfos = v8;
    uint64_t v21 = v8;

    containedDataSourceInfoByIdentifier = v24->__containedDataSourceInfoByIdentifier;
    v24->__containedDataSourceInfoByIdentifier = v9;

    v24->__totalNumberOfSections = v12;
    id v5 = v25;
  }

  return v7;
}

@end