@interface PLManagedAssetCMMAdjustmentBakeInOptions
- (BOOL)flattenLivePhotoToStillIfNeeded;
- (BOOL)shouldBakeInIfAdjustedByThirdParty;
- (BOOL)shouldBakeInIfContainsPenultimateResources;
- (BOOL)shouldBakeInIfCropped;
- (BOOL)shouldBakeInIfLivePhotoMuted;
- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled;
- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled;
- (BOOL)shouldBakeInIfTimelineTrimmed;
- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3;
- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3;
- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3;
- (void)setShouldBakeInIfCropped:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3;
- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3;
- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3;
@end

@implementation PLManagedAssetCMMAdjustmentBakeInOptions

- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3
{
  self->_flattenLivePhotoToStillIfNeeded = a3;
}

- (BOOL)flattenLivePhotoToStillIfNeeded
{
  return self->_flattenLivePhotoToStillIfNeeded;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

@end