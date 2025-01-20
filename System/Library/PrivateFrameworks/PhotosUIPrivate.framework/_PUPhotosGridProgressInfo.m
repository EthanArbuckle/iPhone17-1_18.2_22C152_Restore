@interface _PUPhotosGridProgressInfo
- (NSIndexPath)cachedIndexPath;
- (NSString)identifier;
- (PHAsset)asset;
- (PHAssetCollection)collection;
- (double)progress;
- (void)setAsset:(id)a3;
- (void)setCachedIndexPath:(id)a3;
- (void)setCollection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation _PUPhotosGridProgressInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIndexPath, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setCachedIndexPath:(id)a3
{
}

- (NSIndexPath)cachedIndexPath
{
  return self->_cachedIndexPath;
}

- (void)setCollection:(id)a3
{
}

- (PHAssetCollection)collection
{
  return self->_collection;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end