@interface PXCMMAssetPreparationOptions
- (BOOL)publishAsOriginal;
- (BOOL)publishLivePhotoAsStill;
- (BOOL)removeLocationData;
- (PXCMMAssetPreparationOptions)init;
- (void)setPublishAsOriginal:(BOOL)a3;
- (void)setPublishLivePhotoAsStill:(BOOL)a3;
- (void)setRemoveLocationData:(BOOL)a3;
@end

@implementation PXCMMAssetPreparationOptions

- (void)setRemoveLocationData:(BOOL)a3
{
  self->_removeLocationData = a3;
}

- (BOOL)removeLocationData
{
  return self->_removeLocationData;
}

- (void)setPublishLivePhotoAsStill:(BOOL)a3
{
  self->_publishLivePhotoAsStill = a3;
}

- (BOOL)publishLivePhotoAsStill
{
  return self->_publishLivePhotoAsStill;
}

- (void)setPublishAsOriginal:(BOOL)a3
{
  self->_publishAsOriginal = a3;
}

- (BOOL)publishAsOriginal
{
  return self->_publishAsOriginal;
}

- (PXCMMAssetPreparationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMAssetPreparationOptions;
  result = [(PXCMMAssetPreparationOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_publishAsOriginal = 0;
    result->_removeLocationData = 0;
  }
  return result;
}

@end