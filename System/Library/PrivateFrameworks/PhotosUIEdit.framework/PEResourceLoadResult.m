@interface PEResourceLoadResult
+ (id)_resultWithContentEditingInput:(id)a3 asset:(id)a4 assetLoadingAsRaw:(BOOL)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementOriginalStillImageTime;
- (BOOL)assetLoadingAsRaw;
- (NSString)adjustmentIdentifierAndVersion;
- (NSURL)imageURL;
- (NSURL)videoComplementURL;
- (NUComposition)originalComposition;
- (PEAsset)asset;
- (PHContentEditingInput)contentEditingInput;
- (PICompositionController)adjustedSourceCompositionController;
- (PICompositionController)compositionController;
- (PLEditSource)editSource;
- (int64_t)penultimateAvailability;
- (int64_t)retrievedVersion;
- (void)_setAdjustmentIdentifierAndVersion:(id)a3;
- (void)_setAsset:(id)a3;
- (void)_setAssetLoadingAsRaw:(BOOL)a3;
- (void)_setCompositionController:(id)a3;
- (void)_setContentEditingInput:(id)a3;
- (void)_setEditSource:(id)a3;
- (void)_setImageURL:(id)a3;
- (void)_setOriginalComposition:(id)a3;
- (void)_setPenultimateAvailability:(int64_t)a3;
- (void)_setRetrievedVersion:(int64_t)a3;
- (void)_setVideoComplementURL:(id)a3;
- (void)setAdjustedSourceCompositionController:(id)a3;
- (void)setVideoComplementOriginalStillImageTime:(id *)a3;
@end

@implementation PEResourceLoadResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_contentEditingInput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_originalComposition, 0);
  objc_storeStrong((id *)&self->_adjustedSourceCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

- (void)_setAdjustmentIdentifierAndVersion:(id)a3
{
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)_setContentEditingInput:(id)a3
{
}

- (PHContentEditingInput)contentEditingInput
{
  return self->_contentEditingInput;
}

- (void)_setAssetLoadingAsRaw:(BOOL)a3
{
  self->_assetLoadingAsRaw = a3;
}

- (BOOL)assetLoadingAsRaw
{
  return self->_assetLoadingAsRaw;
}

- (void)_setAsset:(id)a3
{
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)_setPenultimateAvailability:(int64_t)a3
{
  self->_penultimateAvailability = a3;
}

- (int64_t)penultimateAvailability
{
  return self->_penultimateAvailability;
}

- (void)_setRetrievedVersion:(int64_t)a3
{
  self->_retrievedVersion = a3;
}

- (int64_t)retrievedVersion
{
  return self->_retrievedVersion;
}

- (void)setVideoComplementOriginalStillImageTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_videoComplementOriginalStillImageTime.epoch = a3->var3;
  *(_OWORD *)&self->_videoComplementOriginalStillImageTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementOriginalStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (void)_setVideoComplementURL:(id)a3
{
}

- (NSURL)videoComplementURL
{
  return self->_videoComplementURL;
}

- (void)_setImageURL:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)_setOriginalComposition:(id)a3
{
}

- (NUComposition)originalComposition
{
  return self->_originalComposition;
}

- (void)setAdjustedSourceCompositionController:(id)a3
{
}

- (PICompositionController)adjustedSourceCompositionController
{
  return self->_adjustedSourceCompositionController;
}

- (void)_setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)_setEditSource:(id)a3
{
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

+ (id)_resultWithContentEditingInput:(id)a3 asset:(id)a4 assetLoadingAsRaw:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(PEResourceLoadResult);
  [(PEResourceLoadResult *)v9 _setContentEditingInput:v7];
  v10 = [v7 fullSizeImageURL];
  [(PEResourceLoadResult *)v9 _setImageURL:v10];

  [(PEResourceLoadResult *)v9 _setAssetLoadingAsRaw:v5];
  uint64_t v24 = 0;
  v11 = +[PESerializationUtility editSourceForContentEditingInput:v7 useEmbeddedPreview:v5 ^ 1 error:&v24];
  [(PEResourceLoadResult *)v9 _setEditSource:v11];
  [(PEResourceLoadResult *)v9 _setAsset:v8];

  v12 = [v7 videoURL];
  v13 = [v7 livePhoto];

  if (v13)
  {
    v14 = [v7 livePhoto];
    v15 = [v14 videoComplement];
    v16 = [v15 videoPath];

    if (v16)
    {
      v17 = NSURL;
      v18 = [v7 livePhoto];
      v19 = [v18 videoComplement];
      v20 = [v19 videoPath];
      uint64_t v21 = [v17 fileURLWithPath:v20];

      v12 = (void *)v21;
    }
  }
  [(PEResourceLoadResult *)v9 _setVideoComplementURL:v12];
  if ([v7 baseVersion] == 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  [(PEResourceLoadResult *)v9 _setPenultimateAvailability:v22];

  return v9;
}

@end