@interface PLManagedAssetCMMMetadataCopyOptions
- (BOOL)shouldCopyLocationData;
- (BOOL)shouldCopySpatialOverCaptureResources;
- (BOOL)shouldCopyTitleDescriptionAndKeywords;
- (void)setShouldCopyLocationData:(BOOL)a3;
- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3;
- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3;
@end

@implementation PLManagedAssetCMMMetadataCopyOptions

- (void)setShouldCopyLocationData:(BOOL)a3
{
  self->_shouldCopyLocationData = a3;
}

- (BOOL)shouldCopyLocationData
{
  return self->_shouldCopyLocationData;
}

- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3
{
  self->_shouldCopySpatialOverCaptureResources = a3;
}

- (BOOL)shouldCopySpatialOverCaptureResources
{
  return self->_shouldCopySpatialOverCaptureResources;
}

- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3
{
  self->_shouldCopyTitleDescriptionAndKeywords = a3;
}

- (BOOL)shouldCopyTitleDescriptionAndKeywords
{
  return self->_shouldCopyTitleDescriptionAndKeywords;
}

@end