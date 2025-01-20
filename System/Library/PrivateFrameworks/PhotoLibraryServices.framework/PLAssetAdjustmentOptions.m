@interface PLAssetAdjustmentOptions
+ (id)assetAdjustmentOptionsForApplyingResourcesFromCPL;
+ (id)assetAdjustmentOptionsForImageWriterWithEditedRenderURL:(id)a3 async:(BOOL)a4 fullSizeRenderSize:(CGSize)a5 mainFileMetadata:(id)a6;
+ (id)assetAdjustmentOptionsForPortraitImportWithMainFileMetadata:(id)a3;
+ (id)assetAdjustmentOptionsForRevertingToOriginal;
+ (id)assetAdjustmentOptionsForSLMAdjustmentsWithMainFileMetadata:(id)a3;
- (BOOL)isDeferred;
- (BOOL)isSubstandardRender;
- (BOOL)shouldCheckForLegacyCameraAutoAdjustment;
- (BOOL)shouldGenerateThumbnails;
- (BOOL)shouldOverwriteFullSizeRenderSize;
- (BOOL)shouldUpdateAttributes;
- (BOOL)skipCheckCameraAutoAdjustment;
- (BOOL)skipCheckSleetCastAdjustment;
- (CGSize)fullSizeRenderSize;
- (NSData)penultimateRenderedJPEGData;
- (NSURL)adjustmentSecondaryDataURL;
- (NSURL)penultimateRenderedVideoComplementContentURL;
- (NSURL)penultimateRenderedVideoContentURL;
- (NSURL)renderedContentURL;
- (NSURL)renderedVideoComplementContentURL;
- (NSURL)renderedVideoPosterContentURL;
- (PFMetadata)mainFileMetadata;
- (PLAssetAdjustmentOptions)init;
- (double)fullSizeRenderDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)fileIngestionType;
- (void)_setPropertiesOnCopy:(id)a3;
@end

@implementation PLAssetAdjustmentOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoPosterContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedJPEGData, 0);
  objc_storeStrong((id *)&self->_renderedContentURL, 0);
  objc_storeStrong((id *)&self->_mainFileMetadata, 0);
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (NSURL)renderedVideoPosterContentURL
{
  return self->_renderedVideoPosterContentURL;
}

- (NSURL)penultimateRenderedVideoComplementContentURL
{
  return self->_penultimateRenderedVideoComplementContentURL;
}

- (NSURL)renderedVideoComplementContentURL
{
  return self->_renderedVideoComplementContentURL;
}

- (NSURL)penultimateRenderedVideoContentURL
{
  return self->_penultimateRenderedVideoContentURL;
}

- (NSData)penultimateRenderedJPEGData
{
  return self->_penultimateRenderedJPEGData;
}

- (NSURL)renderedContentURL
{
  return self->_renderedContentURL;
}

- (PFMetadata)mainFileMetadata
{
  return self->_mainFileMetadata;
}

- (double)fullSizeRenderDuration
{
  return self->_fullSizeRenderDuration;
}

- (CGSize)fullSizeRenderSize
{
  double width = self->_fullSizeRenderSize.width;
  double height = self->_fullSizeRenderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)fileIngestionType
{
  return self->_fileIngestionType;
}

- (BOOL)skipCheckSleetCastAdjustment
{
  return self->_skipCheckSleetCastAdjustment;
}

- (BOOL)skipCheckCameraAutoAdjustment
{
  return self->_skipCheckCameraAutoAdjustment;
}

- (BOOL)shouldCheckForLegacyCameraAutoAdjustment
{
  return self->_shouldCheckForLegacyCameraAutoAdjustment;
}

- (BOOL)shouldGenerateThumbnails
{
  return self->_shouldGenerateThumbnails;
}

- (BOOL)shouldUpdateAttributes
{
  return self->_shouldUpdateAttributes;
}

- (BOOL)isDeferred
{
  return self->_deferred;
}

- (BOOL)isSubstandardRender
{
  return self->_substandardRender;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PLMutableAssetAdjustmentOptions);
  [(PLAssetAdjustmentOptions *)self _setPropertiesOnCopy:v4];
  return v4;
}

+ (id)assetAdjustmentOptionsForApplyingResourcesFromCPL
{
  v2 = (char *)objc_alloc_init((Class)a1);
  *(_WORD *)(v2 + 11) = 257;
  return v2;
}

+ (id)assetAdjustmentOptionsForPortraitImportWithMainFileMetadata:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v5[9] = 1;
  v6 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v4;

  v5[10] = 1;
  *((void *)v5 + 2) = 1;
  return v5;
}

+ (id)assetAdjustmentOptionsForImageWriterWithEditedRenderURL:(id)a3 async:(BOOL)a4 fullSizeRenderSize:(CGSize)a5 mainFileMetadata:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a6;
  v13 = (CGFloat *)objc_alloc_init((Class)a1);
  v14 = (void *)*((void *)v13 + 7);
  *((void *)v13 + 7) = v11;
  id v15 = v11;

  v13[3] = width;
  v13[4] = height;
  v16 = (void *)*((void *)v13 + 6);
  *((void *)v13 + 6) = v12;

  *((unsigned char *)v13 + 11) = 1;
  if (v9)
  {
    *((unsigned char *)v13 + 8) = 1;
    uint64_t v17 = 9;
  }
  else
  {
    uint64_t v17 = 10;
  }
  *((unsigned char *)v13 + v17) = 1;
  return v13;
}

+ (id)assetAdjustmentOptionsForSLMAdjustmentsWithMainFileMetadata:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v5[5] = 257;
  *((unsigned char *)v5 + 12) = 1;
  v6 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v4;

  return v5;
}

+ (id)assetAdjustmentOptionsForRevertingToOriginal
{
  v2 = objc_alloc_init((Class)a1);
  v2[5] = 257;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PLAssetAdjustmentOptions);
  [(PLAssetAdjustmentOptions *)self _setPropertiesOnCopy:v4];
  return v4;
}

- (void)_setPropertiesOnCopy:(id)a3
{
  id v4 = a3;
  v4[8] = [(PLAssetAdjustmentOptions *)self isSubstandardRender];
  v4[9] = [(PLAssetAdjustmentOptions *)self isDeferred];
  v4[10] = [(PLAssetAdjustmentOptions *)self shouldUpdateAttributes];
  v4[11] = [(PLAssetAdjustmentOptions *)self shouldGenerateThumbnails];
  v4[12] = [(PLAssetAdjustmentOptions *)self shouldCheckForLegacyCameraAutoAdjustment];
  v4[13] = [(PLAssetAdjustmentOptions *)self skipCheckCameraAutoAdjustment];
  v4[14] = [(PLAssetAdjustmentOptions *)self skipCheckCameraAutoAdjustment];
  *((void *)v4 + 2) = [(PLAssetAdjustmentOptions *)self fileIngestionType];
  [(PLAssetAdjustmentOptions *)self fullSizeRenderSize];
  *((void *)v4 + 3) = v5;
  *((void *)v4 + 4) = v6;
  [(PLAssetAdjustmentOptions *)self fullSizeRenderDuration];
  *((void *)v4 + 5) = v7;
  uint64_t v8 = [(PLAssetAdjustmentOptions *)self mainFileMetadata];
  BOOL v9 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v8;

  uint64_t v10 = [(PLAssetAdjustmentOptions *)self renderedContentURL];
  id v11 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v10;

  uint64_t v12 = [(PLAssetAdjustmentOptions *)self penultimateRenderedJPEGData];
  v13 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v12;

  uint64_t v14 = [(PLAssetAdjustmentOptions *)self penultimateRenderedVideoContentURL];
  id v15 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v14;

  uint64_t v16 = [(PLAssetAdjustmentOptions *)self renderedVideoComplementContentURL];
  uint64_t v17 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v16;

  uint64_t v18 = [(PLAssetAdjustmentOptions *)self penultimateRenderedVideoComplementContentURL];
  v19 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v18;

  uint64_t v20 = [(PLAssetAdjustmentOptions *)self renderedVideoPosterContentURL];
  v21 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v20;

  uint64_t v22 = [(PLAssetAdjustmentOptions *)self adjustmentSecondaryDataURL];
  id v23 = (id)*((void *)v4 + 13);
  *((void *)v4 + 13) = v22;
}

- (BOOL)shouldOverwriteFullSizeRenderSize
{
  if ([(PLAssetAdjustmentOptions *)self isSubstandardRender]
    || (BOOL v3 = [(PLAssetAdjustmentOptions *)self isDeferred]))
  {
    [(PLAssetAdjustmentOptions *)self fullSizeRenderSize];
    if (v4 <= 0.0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      [(PLAssetAdjustmentOptions *)self fullSizeRenderSize];
      LOBYTE(v3) = v5 > 0.0;
    }
  }
  return v3;
}

- (PLAssetAdjustmentOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLAssetAdjustmentOptions;
  CGSize result = [(PLAssetAdjustmentOptions *)&v3 init];
  if (result)
  {
    result->_fileIngestionType = 4;
    result->_fullSizeRenderSize = (CGSize)*MEMORY[0x1E4F1DB30];
    result->_fullSizeRenderDuration = 0.0;
  }
  return result;
}

@end