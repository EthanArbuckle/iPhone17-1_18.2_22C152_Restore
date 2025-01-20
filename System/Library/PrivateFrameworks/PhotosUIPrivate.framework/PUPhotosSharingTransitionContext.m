@interface PUPhotosSharingTransitionContext
- (NSIndexPath)keyAssetIndexPath;
- (PHAssetCollectionDataSource)assetCollectionsDataSource;
- (void)setAssetCollectionsDataSource:(id)a3;
- (void)setKeyAssetIndexPath:(id)a3;
@end

@implementation PUPhotosSharingTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetIndexPath, 0);
  objc_storeStrong((id *)&self->_assetCollectionsDataSource, 0);
}

- (void)setKeyAssetIndexPath:(id)a3
{
}

- (NSIndexPath)keyAssetIndexPath
{
  return self->_keyAssetIndexPath;
}

- (void)setAssetCollectionsDataSource:(id)a3
{
}

- (PHAssetCollectionDataSource)assetCollectionsDataSource
{
  return self->_assetCollectionsDataSource;
}

@end