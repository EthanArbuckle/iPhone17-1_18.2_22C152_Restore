@interface PXStoryAssetsConfiguration
- (BOOL)isEqual:(id)a3;
- (PXDisplayAssetFetchResult)allAssets;
- (PXDisplayAssetFetchResult)curatedAssets;
- (PXDisplayAssetFetchResult)keyAsset;
- (PXStoryAssetsConfiguration)init;
- (PXStoryAssetsConfiguration)initWithKeyAsset:(id)a3 curatedAssets:(id)a4 allAssets:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXStoryAssetsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PXDisplayAssetFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXStoryAssetsConfiguration *)self keyAsset];
  v6 = [v5 firstObject];
  v7 = [(PXStoryAssetsConfiguration *)self curatedAssets];
  uint64_t v8 = [v7 count];
  v9 = [(PXStoryAssetsConfiguration *)self allAssets];
  v10 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; key: %@; curated count: %ld; all count: %ld>",
                  v4,
                  self,
                  v6,
                  v8,
                  [v9 count]);

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(PXStoryAssetsConfiguration *)self keyAsset];
  uint64_t v4 = [v3 hash];
  v5 = [(PXStoryAssetsConfiguration *)self curatedAssets];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(PXStoryAssetsConfiguration *)self allAssets];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXStoryAssetsConfiguration *)self keyAsset];
    id v7 = [v5 keyAsset];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqual:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    id v10 = [(PXStoryAssetsConfiguration *)self curatedAssets];
    id v11 = [v5 curatedAssets];
    if (v10 == v11)
    {
    }
    else
    {
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        char v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v13 = [(PXStoryAssetsConfiguration *)self allAssets];
    v14 = [v5 allAssets];
    if (v13 == v14) {
      char v9 = 1;
    }
    else {
      char v9 = [v13 isEqual:v14];
    }

    goto LABEL_15;
  }
  char v9 = 0;
LABEL_17:

  return v9;
}

- (PXStoryAssetsConfiguration)init
{
  return [(PXStoryAssetsConfiguration *)self initWithKeyAsset:0 curatedAssets:0 allAssets:0];
}

- (PXStoryAssetsConfiguration)initWithKeyAsset:(id)a3 curatedAssets:(id)a4 allAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryAssetsConfiguration;
  int v12 = [(PXStoryAssetsConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyAsset, a3);
    objc_storeStrong((id *)&v13->_curatedAssets, a4);
    objc_storeStrong((id *)&v13->_allAssets, a5);
  }

  return v13;
}

@end