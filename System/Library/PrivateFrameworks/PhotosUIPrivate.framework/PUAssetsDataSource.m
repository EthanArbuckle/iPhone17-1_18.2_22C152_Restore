@interface PUAssetsDataSource
+ (PUAssetsDataSource)emptyDataSource;
- (BOOL)containsMultipleAssets;
- (BOOL)couldAssetReferenceAppear:(id)a3;
- (BOOL)isEmpty;
- (NSIndexPath)firstItemIndexPath;
- (NSIndexPath)lastItemIndexPath;
- (PUAssetReference)startingAssetReference;
- (id)assetAtIndexPath:(id)a3;
- (id)assetCollectionAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)assetReferenceForAssetReference:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3;
@end

@implementation PUAssetsDataSource

+ (PUAssetsDataSource)emptyDataSource
{
  if (emptyDataSource_onceToken != -1) {
    dispatch_once(&emptyDataSource_onceToken, &__block_literal_global_12682);
  }
  v2 = (void *)emptyDataSource__sharedEmptyDataSource;
  return (PUAssetsDataSource *)v2;
}

void __37__PUAssetsDataSource_emptyDataSource__block_invoke()
{
  v0 = objc_alloc_init(_PUEmptyAssetsDataSource);
  v1 = (void *)emptyDataSource__sharedEmptyDataSource;
  emptyDataSource__sharedEmptyDataSource = (uint64_t)v0;
}

- (BOOL)couldAssetReferenceAppear:(id)a3
{
  return 1;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PUAssetsDataSource_numberOfAssetsWithMaximum___block_invoke;
  v8[3] = &unk_1E5F23AC8;
  v8[4] = &v9;
  v8[5] = a3;
  [(PUTilingDataSource *)self enumerateIndexPathsStartingAtIndexPath:v5 reverseDirection:0 usingBlock:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __48__PUAssetsDataSource_numberOfAssetsWithMaximum___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= *(void *)(result + 40)) {
    *a3 = 1;
  }
  return result;
}

- (NSIndexPath)lastItemIndexPath
{
  v3 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
  int64_t v4 = [(PUTilingDataSource *)self numberOfSubItemsAtIndexPath:v3];

  while (v4-- >= 1)
  {
    int64_t v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v4];
    uint64_t v7 = [(PUTilingDataSource *)self numberOfSubItemsAtIndexPath:v6];

    if (v7 >= 1)
    {
      v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 - 1 inSection:v4];
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  return (NSIndexPath *)v8;
}

- (NSIndexPath)firstItemIndexPath
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12721;
  uint64_t v11 = __Block_byref_object_dispose__12722;
  id v12 = 0;
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PUAssetsDataSource_firstItemIndexPath__block_invoke;
  v6[3] = &unk_1E5F27E00;
  v6[4] = &v7;
  [(PUTilingDataSource *)self enumerateIndexPathsStartingAtIndexPath:v3 reverseDirection:0 usingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSIndexPath *)v4;
}

void __40__PUAssetsDataSource_firstItemIndexPath__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)containsMultipleAssets
{
  return [(PUAssetsDataSource *)self numberOfAssetsWithMaximum:2] > 1;
}

- (BOOL)isEmpty
{
  return [(PUAssetsDataSource *)self numberOfAssetsWithMaximum:1] == 0;
}

- (PUAssetReference)startingAssetReference
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12721;
  uint64_t v11 = __Block_byref_object_dispose__12722;
  id v12 = 0;
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PUAssetsDataSource_startingAssetReference__block_invoke;
  v6[3] = &unk_1E5F27E00;
  v6[4] = &v7;
  [(PUTilingDataSource *)self enumerateIndexPathsStartingAtIndexPath:v3 reverseDirection:0 usingBlock:v6];

  if (v8[5])
  {
    id v4 = -[PUAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:");
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (PUAssetReference *)v4;
}

void __44__PUAssetsDataSource_startingAssetReference__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] == 1)
  {
    v8 = [v7 assetCollectionAtIndexPath:v6];
    if (v8)
    {
      uint64_t v9 = [(PUAssetsDataSource *)self indexPathForAssetCollection:v8];
LABEL_7:
      v10 = (void *)v9;
LABEL_9:

      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ([v6 length] == 2)
  {
    v8 = [v7 assetReferenceAtIndexPath:v6];
    if (v8)
    {
      uint64_t v9 = [(PUAssetsDataSource *)self indexPathForAssetReference:v8];
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)assetAtIndexPath:(id)a3
{
  v3 = [(PUAssetsDataSource *)self assetReferenceAtIndexPath:a3];
  id v4 = [v3 asset];

  return v4;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 dataSourceIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(PUTilingDataSource *)self identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        v6,
        !v8))
  {
    v10 = [(PUAssetsDataSource *)self indexPathForAssetReference:v5];
    if (v10)
    {
      id v9 = [(PUAssetsDataSource *)self assetReferenceAtIndexPath:v10];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathForAssetCollection:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PUAssetsDataSource.m", 58, @"Concrete subclass must implement %@", v6 object file lineNumber description];

  return 0;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PUAssetsDataSource.m", 53, @"Concrete subclass must implement %@", v6 object file lineNumber description];

  return 0;
}

- (id)indexPathForAssetReference:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PUAssetsDataSource.m", 48, @"Concrete subclass must implement %@", v6 object file lineNumber description];

  return 0;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PUAssetsDataSource.m", 43, @"Concrete subclass must implement %@", v6 object file lineNumber description];

  return 0;
}

@end