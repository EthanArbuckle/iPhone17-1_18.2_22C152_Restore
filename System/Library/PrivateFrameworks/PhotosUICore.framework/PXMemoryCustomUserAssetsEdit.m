@interface PXMemoryCustomUserAssetsEdit
- (PXDisplayAssetFetchResult)assets;
- (PXMemoryCustomUserAssetsEdit)initWithAssets:(id)a3;
@end

@implementation PXMemoryCustomUserAssetsEdit

- (void).cxx_destruct
{
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (PXMemoryCustomUserAssetsEdit)initWithAssets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoryCustomUserAssetsEdit;
  v6 = [(PXMemoryCustomUserAssetsEdit *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assets, a3);
  }

  return v7;
}

@end