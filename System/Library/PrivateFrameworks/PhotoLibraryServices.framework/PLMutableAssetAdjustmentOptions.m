@interface PLMutableAssetAdjustmentOptions
+ (id)assetAdjustmentOptionsForFileSystemImport;
- (void)setAdjustmentSecondaryDataURL:(id)a3;
- (void)setDeferred:(BOOL)a3;
- (void)setFileIngestionType:(int64_t)a3;
- (void)setFullSizeRenderDuration:(double)a3;
- (void)setFullSizeRenderSize:(CGSize)a3;
- (void)setMainFileMetadata:(id)a3;
- (void)setPenultimateRenderedJPEGData:(id)a3;
- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3;
- (void)setPenultimateRenderedVideoContentURL:(id)a3;
- (void)setRenderedContentURL:(id)a3;
- (void)setRenderedVideoComplementContentURL:(id)a3;
- (void)setRenderedVideoPosterContentURL:(id)a3;
- (void)setShouldCheckForLegacyCameraAutoAdjustment:(BOOL)a3;
- (void)setShouldGenerateThumbnails:(BOOL)a3;
- (void)setShouldUpdateAttributes:(BOOL)a3;
- (void)setSkipCheckCameraAutoAdjustment:(BOOL)a3;
- (void)setSkipCheckSleetCastAdjustment:(BOOL)a3;
- (void)setSubstandardRender:(BOOL)a3;
@end

@implementation PLMutableAssetAdjustmentOptions

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
}

- (void)setRenderedVideoPosterContentURL:(id)a3
{
}

- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3
{
}

- (void)setRenderedVideoComplementContentURL:(id)a3
{
}

- (void)setPenultimateRenderedVideoContentURL:(id)a3
{
}

- (void)setPenultimateRenderedJPEGData:(id)a3
{
}

- (void)setRenderedContentURL:(id)a3
{
}

- (void)setMainFileMetadata:(id)a3
{
}

- (void)setFullSizeRenderDuration:(double)a3
{
  self->super._fullSizeRenderDuration = a3;
}

- (void)setFullSizeRenderSize:(CGSize)a3
{
  self->super._fullSizeRenderSize = a3;
}

- (void)setFileIngestionType:(int64_t)a3
{
  self->super._fileIngestionType = a3;
}

- (void)setSkipCheckSleetCastAdjustment:(BOOL)a3
{
  self->super._skipCheckSleetCastAdjustment = a3;
}

- (void)setSkipCheckCameraAutoAdjustment:(BOOL)a3
{
  self->super._skipCheckCameraAutoAdjustment = a3;
}

- (void)setShouldCheckForLegacyCameraAutoAdjustment:(BOOL)a3
{
  self->super._shouldCheckForLegacyCameraAutoAdjustment = a3;
}

- (void)setShouldGenerateThumbnails:(BOOL)a3
{
  self->super._shouldGenerateThumbnails = a3;
}

- (void)setShouldUpdateAttributes:(BOOL)a3
{
  self->super._shouldUpdateAttributes = a3;
}

- (void)setDeferred:(BOOL)a3
{
  self->super._deferred = a3;
}

- (void)setSubstandardRender:(BOOL)a3
{
  self->super._substandardRender = a3;
}

+ (id)assetAdjustmentOptionsForFileSystemImport
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setShouldUpdateAttributes:1];
  [v2 setShouldGenerateThumbnails:1];
  [v2 setFileIngestionType:0];
  return v2;
}

@end