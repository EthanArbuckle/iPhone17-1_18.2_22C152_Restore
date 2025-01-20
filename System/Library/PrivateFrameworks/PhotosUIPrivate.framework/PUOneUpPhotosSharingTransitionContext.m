@interface PUOneUpPhotosSharingTransitionContext
- (PUAssetReference)currentAssetReference;
- (id)keyAssetIndexPath;
- (void)setCurrentAssetReference:(id)a3;
@end

@implementation PUOneUpPhotosSharingTransitionContext

- (void).cxx_destruct
{
}

- (void)setCurrentAssetReference:(id)a3
{
}

- (PUAssetReference)currentAssetReference
{
  return self->_currentAssetReference;
}

- (id)keyAssetIndexPath
{
  v2 = [(PUOneUpPhotosSharingTransitionContext *)self currentAssetReference];
  v3 = [v2 indexPath];

  return v3;
}

@end