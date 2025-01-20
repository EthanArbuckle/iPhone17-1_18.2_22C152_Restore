@interface PUJoiningAssetReference
- (PUAssetReference)containedAssetReference;
- (PUJoiningAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6;
- (PUJoiningAssetReference)initWithContainedAssetReference:(id)a3 hintDataSourceIndex:(int64_t)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6;
- (id)description;
- (int64_t)hintDataSourceIndex;
@end

@implementation PUJoiningAssetReference

- (void).cxx_destruct
{
}

- (PUAssetReference)containedAssetReference
{
  return self->_containedAssetReference;
}

- (int64_t)hintDataSourceIndex
{
  return self->_hintDataSourceIndex;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PUJoiningAssetReference;
  v3 = [(PUAssetReference *)&v8 description];
  int64_t v4 = [(PUJoiningAssetReference *)self hintDataSourceIndex];
  v5 = [(PUJoiningAssetReference *)self containedAssetReference];
  v6 = [v3 stringByAppendingFormat:@" hintDataSourceIndex:%lu containedAssetReference:%@", v4, v5];

  return v6;
}

- (PUJoiningAssetReference)initWithContainedAssetReference:(id)a3 hintDataSourceIndex:(int64_t)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUJoiningAssetsDataSource.m", 269, @"Invalid parameter not satisfying: %@", @"containedAssetReference != nil" object file lineNumber description];
  }
  v15 = [v12 asset];
  v16 = [v12 assetCollection];
  v20.receiver = self;
  v20.super_class = (Class)PUJoiningAssetReference;
  v17 = [(PUAssetReference *)&v20 initWithAsset:v15 assetCollection:v16 indexPath:v13 dataSourceIdentifier:v14];

  if (v17)
  {
    v17->_hintDataSourceIndex = a4;
    objc_storeStrong((id *)&v17->_containedAssetReference, a3);
  }

  return v17;
}

- (PUJoiningAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  return [(PUJoiningAssetReference *)self initWithContainedAssetReference:0 hintDataSourceIndex:0 indexPath:a5 dataSourceIdentifier:a6];
}

@end