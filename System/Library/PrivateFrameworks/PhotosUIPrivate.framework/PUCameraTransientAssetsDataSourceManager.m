@interface PUCameraTransientAssetsDataSourceManager
- (PUCameraTransientAssetsDataSourceManager)init;
- (PUCameraTransientAssetsDataSourceManager)initWithTransientDataSource:(id)a3;
- (PUDisplayAssetCollection)_containingAssetCollection;
- (PUTransientDataSource)_transientDataSource;
- (void)_updateWithTransientDataSource:(id)a3;
@end

@implementation PUCameraTransientAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containingAssetCollection, 0);
  objc_storeStrong((id *)&self->__transientDataSource, 0);
}

- (PUDisplayAssetCollection)_containingAssetCollection
{
  return self->__containingAssetCollection;
}

- (PUTransientDataSource)_transientDataSource
{
  return self->__transientDataSource;
}

- (void)_updateWithTransientDataSource:(id)a3
{
  id v4 = a3;
  id v9 = [(PUCameraTransientAssetsDataSourceManager *)self _containingAssetCollection];
  v5 = [v4 uuids];
  v6 = [v4 transientAssetMapping];
  v7 = [v4 transientBurstMapping];

  v8 = [[PUCameraTransientAssetsDataSource alloc] initWithUUIDs:v5 mapping:v6 representativeMapping:v7 inAssetCollection:v9];
  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v8];
}

- (PUCameraTransientAssetsDataSourceManager)initWithTransientDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCameraTransientAssetsDataSourceManager;
  v6 = [(PUCameraTransientAssetsDataSourceManager *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0];
    containingAssetCollection = v6->__containingAssetCollection;
    v6->__containingAssetCollection = (PUDisplayAssetCollection *)v7;

    objc_storeStrong((id *)&v6->__transientDataSource, a3);
    [v5 registerChangeObserver:v6];
    [(PUCameraTransientAssetsDataSourceManager *)v6 _updateWithTransientDataSource:v5];
    id v9 = v6;
  }

  return v6;
}

- (PUCameraTransientAssetsDataSourceManager)init
{
  return [(PUCameraTransientAssetsDataSourceManager *)self initWithTransientDataSource:0];
}

@end