@interface NPTOSyncCollection
- (BOOL)assetsRequireExternalPowerSourceConnected;
- (BOOL)isPlaceholder;
- (NPTOSyncContentProvider)contentProvider;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)assets;
- (PHFetchResult)keyAssets;
- (id)description;
- (void)setAssetCollection:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAssetsRequireExternalPowerSourceConnected:(BOOL)a3;
- (void)setContentProvider:(id)a3;
- (void)setKeyAssets:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
@end

@implementation NPTOSyncCollection

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOSyncCollection;
  v3 = [(NPTOSyncCollection *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentProvider);
  v5 = [v3 stringByAppendingFormat:@" contentProvider: %@ assetCollection: %@ assets: %@ keyAssets: %@", WeakRetained, self->_assetCollection, self->_assets, self->_keyAssets];

  return v5;
}

- (NPTOSyncContentProvider)contentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentProvider);

  return (NPTOSyncContentProvider *)WeakRetained;
}

- (void)setContentProvider:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
}

- (PHFetchResult)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (PHFetchResult)keyAssets
{
  return self->_keyAssets;
}

- (void)setKeyAssets:(id)a3
{
}

- (BOOL)assetsRequireExternalPowerSourceConnected
{
  return self->_assetsRequireExternalPowerSourceConnected;
}

- (void)setAssetsRequireExternalPowerSourceConnected:(BOOL)a3
{
  self->_assetsRequireExternalPowerSourceConnected = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);

  objc_destroyWeak((id *)&self->_contentProvider);
}

@end