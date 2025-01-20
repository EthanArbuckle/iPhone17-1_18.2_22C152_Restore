@interface PUReviewAsset
+ (BOOL)_shouldShowConfidentialityWarningForAdjustments:(id)a3;
+ (BOOL)_shouldShowConfidentialityWarningForMetadata:(id)a3 creationDate:(id)a4;
+ (id)createUniqueMediaDirectoryForAssetWithIdentifier:(id)a3;
+ (id)fileURLForAdjustmentsInDirectory:(id)a3;
+ (id)fileURLForFullsizeImageInDirectory:(id)a3 extension:(id)a4;
+ (id)fileURLForFullsizeRenderImageInDirectory:(id)a3 extension:(id)a4;
+ (id)fileURLForFullsizeRenderVideoComplementInDirectory:(id)a3;
+ (id)fileURLForFullsizeRenderVideoInDirectory:(id)a3;
+ (id)fileURLForFullsizeVideoComplementInDirectory:(id)a3;
+ (id)fileURLForFullsizeVideoInDirectory:(id)a3 extension:(id)a4;
+ (unint64_t)_confidentialityWarningsVersionForAdjustments:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoSynchronizedDisplayTime;
- (AVAsset)providedAVAsset;
- (AVAudioMix)providedAudioMix;
- (BOOL)_linkFileAtURL:(id)a3 toURL:(id)a4;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)isAdjusted;
- (BOOL)isAnimatedImage;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isContentAdjustmentAllowed;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHDR;
- (BOOL)isHidden;
- (BOOL)isHighFramerateVideo;
- (BOOL)isInPlaceVideoTrimAllowed;
- (BOOL)isLivePhoto;
- (BOOL)isLivePhotoPlaceholder;
- (BOOL)isLivePhotoVisibilityAdjustmentAllowed;
- (BOOL)isOriginalRaw;
- (BOOL)isResourceDownloadPossible;
- (BOOL)isSpatialMedia;
- (BOOL)isTemporaryPlaceholder;
- (BOOL)isTrimmableType;
- (BOOL)needsDeferredProcessing;
- (BOOL)representsBurst;
- (BOOL)requiresConfidentiality;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSDate)modificationDate;
- (NSDictionary)providedImageMetadata;
- (NSString)accessibilityDescription;
- (NSString)burstIdentifier;
- (NSString)identifier;
- (NSString)localizedGeoDescription;
- (NSString)pathForOriginalImageFile;
- (NSString)pathForOriginalVideoFile;
- (NSString)pathForTrimmedVideoFile;
- (NSString)uniformTypeIdentifier;
- (NSURL)providedFullsizeImageURL;
- (NSURL)providedFullsizeRenderImageURL;
- (NSURL)providedFullsizeRenderVideoURL;
- (NSURL)providedVideoURL;
- (PFAssetAdjustments)assetAdjustments;
- (PFVideoAVObjectBuilder)videoObjectBuilder;
- (PHLivePhoto)providedLivePhoto;
- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 adjustments:(id)a11 identifier:(id)a12;
- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 unadjustedVideoURL:(id)a11 adjustments:(id)a12 identifier:(id)a13;
- (PUReviewAsset)initWithConformingAsset:(id)a3;
- (PUReviewAsset)initWithLivePhoto:(id)a3 fullsizeUnadjustedImageURL:(id)a4 fullsizeUnadjustedVideoURL:(id)a5 assetAdjustments:(id)a6 width:(unint64_t)a7 height:(unint64_t)a8 captureDate:(id)a9 metadata:(id)a10 duration:(double)a11 previewImage:(id)a12 identifier:(id)a13;
- (PUReviewAsset)initWithPhoto:(id)a3 mediaSubtypes:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 metadata:(id)a8 burstIdentifier:(id)a9 representedCount:(unint64_t)a10 fullsizeImageURL:(id)a11 fullsizeUnadjustedImageURL:(id)a12 assetAdjustments:(id)a13 identifier:(id)a14;
- (PUReviewAsset)initWithReviewAsset:(id)a3;
- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 pixelWidth:(unint64_t)a8 pixelHeight:(unint64_t)a9 assetAdjustments:(id)a10 duration:(double)a11;
- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 previewImage:(id)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 assetAdjustments:(id)a11 duration:(double)a12;
- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4;
- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4 canPlayPhotoIris:(BOOL)a5;
- (PUReviewAsset)initWithReviewAsset:(id)a3 primaryResourceURL:(id)a4;
- (PUReviewAsset)reviewAssetWithAdjustmentOutput:(id)a3 adjustmentData:(id)a4 formatIdentifier:(id)a5 version:(id)a6;
- (UIImage)providedPreviewImage;
- (double)aspectRatio;
- (double)duration;
- (id)_ensureLinkDestinationDirectoryFromBaseDirectory:(id)a3;
- (id)_uniqueDestinationURLForFileURL:(id)a3 inDirectory:(id)a4;
- (id)adjustmentOutputForInputBaseVersion:(int64_t)a3 withLivePhotoSupport:(BOOL)a4;
- (id)inputForAdjustmentWithMediaProvider:(id)a3 canHandleAdjustments:(id)a4;
- (id)primaryRenderedMediaURL;
- (id)providedImageURLForImageVersion:(int64_t)a3;
- (id)providedVideoURLForImageVersion:(int64_t)a3;
- (id)providedVideoURLForVideoVersion:(int64_t)a3;
- (id)reviewAssetRevertingAdjustments;
- (int)exifOrientationForImageVersion:(int64_t)a3;
- (int)originalEXIFOrientation;
- (int64_t)playbackStyle;
- (unint64_t)isContentEqualTo:(id)a3;
- (unint64_t)livePhotoVisibilityState;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
- (unint64_t)originalFilesize;
- (unint64_t)originalResourceChoice;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)requestContentEditingInputWithOptions:(id)a3 completionHandler:(id)a4;
- (unsigned)deferredProcessingNeeded;
- (unsigned)playbackVariation;
- (void)_removeFileAtURL:(id)a3;
- (void)removeAllFilesAtReferencedURLs;
@end

@implementation PUReviewAsset

- (id)primaryRenderedMediaURL
{
  unint64_t v3 = [(PUReviewAsset *)self mediaType];
  if (v3 == 2)
  {
    v4 = [(PUReviewAsset *)self providedFullsizeRenderVideoURL];
  }
  else if (v3 == 1)
  {
    v4 = [(PUReviewAsset *)self providedFullsizeRenderImageURL];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)reviewAssetRevertingAdjustments
{
  unint64_t v3 = [(PUReviewAsset *)self adjustmentOutputForInputBaseVersion:0 withLivePhotoSupport:1];
  v4 = [v3 _baseVideoURL];
  v5 = [v3 _baseImageURL];
  v6 = [PUReviewAsset alloc];
  unint64_t v7 = [(PUReviewAsset *)self pixelWidth];
  unint64_t v8 = [(PUReviewAsset *)self pixelHeight];
  [(PUReviewAsset *)self duration];
  v9 = -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:](v6, "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:", self, v5, 0, v4, 0, v7, v8, 0);

  return v9;
}

- (PUReviewAsset)reviewAssetWithAdjustmentOutput:(id)a3 adjustmentData:(id)a4 formatIdentifier:(id)a5 version:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 _baseVideoURL];
  v15 = [v13 _baseImageURL];
  v16 = [v13 renderedImageFileURL];
  v17 = [v13 renderedVideoFileURL];
  uint64_t v18 = [v13 _adjustmentInputBaseVersion];

  if (v18 == 1)
  {
    v19 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Attempted to write adjustments with Penultimate base version", buf, 2u);
    }
  }
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v11 formatVersion:v10 data:v12 baseVersion:0 editorBundleID:0 renderTypes:0];

  v21 = [PUReviewAsset alloc];
  unint64_t v22 = [(PUReviewAsset *)self pixelWidth];
  unint64_t v23 = [(PUReviewAsset *)self pixelHeight];
  [(PUReviewAsset *)self duration];
  v24 = -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:](v21, "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:", self, v15, v16, v14, v17, v22, v23, v20);

  return v24;
}

- (id)adjustmentOutputForInputBaseVersion:(int64_t)a3 withLivePhotoSupport:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PUReviewAsset *)self identifier];
  uint64_t v8 = +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:v7];
  v9 = [(PUReviewAsset *)self providedImageURLForImageVersion:a3 != 2];
  id v10 = [(PUReviewAsset *)self providedVideoURLForImageVersion:a3 != 2];
  int64_t v30 = a3;
  v31 = (void *)v7;
  v33 = v9;
  BOOL v29 = a4;
  if ([(PUReviewAsset *)self mediaType] == 1 && v9)
  {
    id v11 = [v9 pathExtension];
    id v12 = +[PUReviewAsset fileURLForFullsizeImageInDirectory:v8 extension:v11];
    v32 = +[PUReviewAsset fileURLForFullsizeRenderImageInDirectory:v8 extension:v11];
    id v13 = 0;
    if ([(PUReviewAsset *)self isLivePhoto] && v10)
    {
      v14 = +[PUReviewAsset fileURLForFullsizeVideoComplementInDirectory:v8];
      id v13 = +[PUReviewAsset fileURLForFullsizeRenderVideoComplementInDirectory:v8];
    }
    else
    {
      v14 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  id v13 = 0;
  if ([(PUReviewAsset *)self mediaType] == 2)
  {
    v32 = 0;
    v14 = 0;
    id v12 = 0;
    if (!v10) {
      goto LABEL_11;
    }
    id v11 = [v10 pathExtension];
    v14 = +[PUReviewAsset fileURLForFullsizeVideoInDirectory:v8 extension:v11];
    id v13 = +[PUReviewAsset fileURLForFullsizeRenderVideoInDirectory:v8];
    v32 = 0;
    id v12 = 0;
    goto LABEL_10;
  }
  v32 = 0;
  v14 = 0;
  id v12 = 0;
LABEL_11:
  v15 = (void *)v8;
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  v17 = v16;
  if (v12)
  {
    id v36 = 0;
    char v18 = [v16 copyItemAtURL:v33 toURL:v12 error:&v36];
    id v19 = v36;
    if ((v18 & 1) == 0)
    {
      v20 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v38 = v33;
        __int16 v39 = 2114;
        v40 = v12;
        __int16 v41 = 2114;
        id v42 = v19;
        _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }
    }
    if (v14)
    {
LABEL_17:
      id v35 = v19;
      char v21 = [v17 copyItemAtURL:v10 toURL:v14 error:&v35];
      id v22 = v35;

      if ((v21 & 1) == 0)
      {
        unint64_t v23 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v38 = v10;
          __int16 v39 = 2114;
          v40 = v14;
          __int16 v41 = 2114;
          id v42 = v22;
          _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        }
      }
      if (!v13) {
        goto LABEL_31;
      }
      goto LABEL_25;
    }
  }
  else
  {
    id v19 = 0;
    if (v14) {
      goto LABEL_17;
    }
  }
  id v22 = v19;
  if (!v13)
  {
LABEL_31:
    id v25 = v22;
    goto LABEL_32;
  }
LABEL_25:
  if (![(PUReviewAsset *)self isLivePhoto] || v29) {
    goto LABEL_31;
  }
  id v34 = v22;
  char v24 = [v17 copyItemAtURL:v10 toURL:v13 error:&v34];
  id v25 = v34;

  if ((v24 & 1) == 0)
  {
    v26 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v38 = v10;
      __int16 v39 = 2114;
      v40 = v13;
      __int16 v41 = 2114;
      id v42 = v25;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }
  }
LABEL_32:
  v27 = objc_alloc_init(PUReviewAdjustmentOutput);
  [(PUReviewAdjustmentOutput *)v27 _setAdjustmentInputBaseVersion:v30];
  [(PUReviewAdjustmentOutput *)v27 _setRenderedImageFileURL:v32];
  [(PUReviewAdjustmentOutput *)v27 _setRenderedVideoFileURL:v13];
  [(PUReviewAdjustmentOutput *)v27 _setBaseImageURL:v12];
  [(PUReviewAdjustmentOutput *)v27 _setBaseVideoURL:v14];

  return v27;
}

- (id)inputForAdjustmentWithMediaProvider:(id)a3 canHandleAdjustments:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void *))a4;
  BOOL v8 = [(PUReviewAsset *)self isAdjusted];
  v9 = [(PUReviewAsset *)self assetAdjustments];
  id v25 = v7;
  if (v8)
  {
    if (v7[2](v7, v9))
    {
      uint64_t v10 = objc_msgSend(v9, "adjustmentBaseVersion", v7);
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      uint64_t v10 = 2;
    }
  }
  else
  {
    int v11 = 0;
    uint64_t v10 = 0;
  }
  id v12 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v25);
  [v12 scale];
  [v12 _referenceBounds];
  [(PUReviewAsset *)self pixelWidth];
  [(PUReviewAsset *)self pixelHeight];
  PLScaledSizeToFitSize();
  double v14 = rint(v13 * 0.5);
  double v16 = rint(v15 * 0.5);
  id v17 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v17 setVersion:0];
  [v17 setSynchronous:1];
  [v17 setDeliveryMode:1];
  [v17 setNetworkAccessAllowed:0];
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__75306;
  v32 = __Block_byref_object_dispose__75307;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__PUReviewAsset_AdjustmentInput__inputForAdjustmentWithMediaProvider_canHandleAdjustments___block_invoke;
  v27[3] = &unk_1E5F2B328;
  v27[4] = &v28;
  char v18 = v6;
  objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", self, 0, v17, v27, v14, v16);
  BOOL v19 = v10 != 2;
  v20 = objc_alloc_init(PUReviewAdjustmentInput);
  if (v11)
  {
    char v21 = [v9 adjustmentData];
  }
  else
  {
    char v21 = 0;
  }
  [(PUReviewAdjustmentInput *)v20 _setKnownAdjustmentData:v21];
  if (v11) {

  }
  [(PUReviewAdjustmentInput *)v20 _setBaseImageVersion:v10];
  [(PUReviewAdjustmentInput *)v20 _setCurrentPreviewImage:v29[5]];
  id v22 = [(PUReviewAsset *)self providedImageURLForImageVersion:v10 != 2];
  [(PUReviewAdjustmentInput *)v20 _setBaseImageFileURL:v22];

  unint64_t v23 = [(PUReviewAsset *)self providedVideoURLForImageVersion:v19];
  [(PUReviewAdjustmentInput *)v20 _setBaseVideoFileURL:v23];

  _Block_object_dispose(&v28, 8);
  return v20;
}

void __91__PUReviewAsset_AdjustmentInput__inputForAdjustmentWithMediaProvider_canHandleAdjustments___block_invoke(uint64_t a1, void *a2)
{
}

- (id)providedVideoURLForVideoVersion:(int64_t)a3
{
  v5 = [(PUReviewAsset *)self providedVideoURL];
  uint64_t v6 = [(PUReviewAsset *)self providedFullsizeRenderVideoURL];
  uint64_t v7 = (void *)v6;
  BOOL v8 = v5;
  if (a3 != 1)
  {
    if (a3)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    if (v6) {
      BOOL v8 = (void *)v6;
    }
    else {
      BOOL v8 = v5;
    }
  }
  id v9 = v8;
LABEL_8:
  id v10 = v9;

  return v10;
}

- (id)providedVideoURLForImageVersion:(int64_t)a3
{
  v5 = [(PUReviewAsset *)self providedVideoURL];
  uint64_t v6 = [(PUReviewAsset *)self providedFullsizeRenderVideoURL];
  uint64_t v7 = (void *)v6;
  BOOL v8 = v5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    if (v6) {
      BOOL v8 = (void *)v6;
    }
    else {
      BOOL v8 = v5;
    }
  }
  id v9 = v8;
LABEL_8:
  id v10 = v9;

  return v10;
}

- (int)exifOrientationForImageVersion:(int64_t)a3
{
  uint64_t v5 = [(PUReviewAsset *)self providedFullsizeRenderImageURL];
  uint64_t v6 = (void *)v5;
  if ((unint64_t)(a3 - 1) >= 2 && (a3 || v5)) {
    int v7 = 1;
  }
  else {
    int v7 = [(PUReviewAsset *)self originalEXIFOrientation];
  }

  return v7;
}

- (id)providedImageURLForImageVersion:(int64_t)a3
{
  uint64_t v5 = [(PUReviewAsset *)self providedFullsizeImageURL];
  uint64_t v6 = [(PUReviewAsset *)self providedFullsizeRenderImageURL];
  int v7 = (void *)v6;
  BOOL v8 = v5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    if (v6) {
      BOOL v8 = (void *)v6;
    }
    else {
      BOOL v8 = v5;
    }
  }
  id v9 = v8;
LABEL_8:
  id v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAdjustments, 0);
  objc_storeStrong((id *)&self->_providedFullsizeRenderVideoURL, 0);
  objc_storeStrong((id *)&self->_providedVideoURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeRenderImageURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeImageURL, 0);
  objc_storeStrong((id *)&self->_providedImageMetadata, 0);
  objc_storeStrong((id *)&self->_providedPreviewImage, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->providedLivePhoto, 0);
  objc_storeStrong((id *)&self->providedAudioMix, 0);
  objc_storeStrong((id *)&self->providedAVAsset, 0);
}

- (PFAssetAdjustments)assetAdjustments
{
  return self->_assetAdjustments;
}

- (NSURL)providedFullsizeRenderVideoURL
{
  return self->_providedFullsizeRenderVideoURL;
}

- (NSURL)providedVideoURL
{
  return self->_providedVideoURL;
}

- (NSURL)providedFullsizeRenderImageURL
{
  return self->_providedFullsizeRenderImageURL;
}

- (NSURL)providedFullsizeImageURL
{
  return self->_providedFullsizeImageURL;
}

- (NSDictionary)providedImageMetadata
{
  return self->_providedImageMetadata;
}

- (UIImage)providedPreviewImage
{
  return self->_providedPreviewImage;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_numberOfRepresentedAssets;
}

- (BOOL)representsBurst
{
  return self->_representsBurst;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoSynchronizedDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (BOOL)canPlayPhotoIris
{
  return self->_canPlayPhotoIris;
}

- (BOOL)isLivePhotoPlaceholder
{
  return self->_livePhotoPlaceholder;
}

- (BOOL)isLivePhoto
{
  return self->_livePhoto;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isHDR
{
  return self->_HDR;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)localCreationDate
{
  return self->_localCreationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)requiresConfidentiality
{
  return self->_requiresConfidentiality;
}

- (PHLivePhoto)providedLivePhoto
{
  return self->providedLivePhoto;
}

- (AVAudioMix)providedAudioMix
{
  return self->providedAudioMix;
}

- (AVAsset)providedAVAsset
{
  return self->providedAVAsset;
}

- (void)_removeFileAtURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v3 path];
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      int v7 = +[PUReviewFileManager defaultManager];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __34__PUReviewAsset__removeFileAtURL___block_invoke;
      v8[3] = &unk_1E5F2E3B8;
      id v9 = v3;
      [v7 removeItemAtURL:v9 completion:v8];
    }
  }
}

void __34__PUReviewAsset__removeFileAtURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)removeAllFilesAtReferencedURLs
{
  id v3 = [(PUReviewAsset *)self providedFullsizeImageURL];
  [(PUReviewAsset *)self _removeFileAtURL:v3];

  v4 = [(PUReviewAsset *)self providedFullsizeRenderImageURL];
  [(PUReviewAsset *)self _removeFileAtURL:v4];

  id v5 = [(PUReviewAsset *)self providedVideoURL];
  [(PUReviewAsset *)self _removeFileAtURL:v5];

  id v6 = [(PUReviewAsset *)self providedFullsizeRenderVideoURL];
  [(PUReviewAsset *)self _removeFileAtURL:v6];
}

- (BOOL)_linkFileAtURL:(id)a3 toURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqual:v6])
  {
    char v7 = 1;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v6 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      id v11 = +[PUReviewFileManager defaultManager];
      id v19 = 0;
      char v12 = [v11 removeItemAtURL:v6 error:&v19];
      id v13 = v19;

      if ((v12 & 1) == 0)
      {
        double v14 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v6;
          __int16 v22 = 2114;
          id v23 = v13;
          _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Failed to remove existing file at %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
    id v18 = 0;
    char v7 = [v8 copyItemAtURL:v5 toURL:v6 error:&v18];
    id v15 = v18;
    if ((v7 & 1) == 0)
    {
      double v16 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v21 = v5;
        __int16 v22 = 2114;
        id v23 = v6;
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }

  return v7;
}

- (id)_uniqueDestinationURLForFileURL:(id)a3 inDirectory:(id)a4
{
  id v5 = a4;
  id v6 = [a3 pathExtension];
  char v7 = [MEMORY[0x1E4F8BA08] UUIDString];
  int v8 = [v7 stringByAppendingPathExtension:v6];

  uint64_t v9 = [v5 stringByAppendingPathComponent:v8];

  int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];

  return v10;
}

- (id)_ensureLinkDestinationDirectoryFromBaseDirectory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUReviewAsset *)self identifier];
  id v6 = [v4 stringByAppendingPathComponent:@"ReviewLinkedFiles"];

  char v7 = [v6 stringByAppendingPathComponent:v5];

  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v9 = v12;

  if (v9)
  {
    int v10 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      double v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v7;
}

- (NSString)accessibilityDescription
{
  return 0;
}

- (BOOL)isOriginalRaw
{
  return 0;
}

- (NSString)pathForTrimmedVideoFile
{
  v2 = [(PUReviewAsset *)self pathForOriginalVideoFile];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 stringByDeletingPathExtension];
    id v5 = [v4 stringByAppendingPathExtension:@"TRIM.MOV"];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)pathForOriginalVideoFile
{
  v2 = [(PUReviewAsset *)self providedVideoURL];
  id v3 = [v2 path];

  return (NSString *)v3;
}

- (NSString)pathForOriginalImageFile
{
  v2 = [(PUReviewAsset *)self providedFullsizeImageURL];
  id v3 = [v2 path];

  return (NSString *)v3;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return 0;
}

- (BOOL)isResourceDownloadPossible
{
  return 0;
}

- (int)originalEXIFOrientation
{
  v2 = [(PUReviewAsset *)self providedImageMetadata];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 1;
  }

  return v5;
}

- (unint64_t)requestContentEditingInputWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    char v7 = (void (**)(id, void *, void))a4;
    int v8 = [(PUReviewAsset *)self assetAdjustments];
    id v9 = [v8 phAdjustmentData];

    id v10 = objc_alloc(MEMORY[0x1E4F39020]);
    id v11 = [(PUReviewAsset *)self providedFullsizeImageURL];
    if (v11)
    {
      id v12 = (void *)[v10 initWithAppropriateURL:v11];
    }
    else
    {
      id v13 = [(PUReviewAsset *)self providedVideoURL];
      id v12 = (void *)[v10 initWithAppropriateURL:v13];
    }
    objc_msgSend(v12, "setMediaType:", -[PUReviewAsset mediaType](self, "mediaType"));
    objc_msgSend(v12, "setMediaSubtypes:", -[PUReviewAsset mediaSubtypes](self, "mediaSubtypes"));
    objc_msgSend(v12, "setPlaybackStyle:", -[PUReviewAsset playbackStyle](self, "playbackStyle"));
    double v14 = [(PUReviewAsset *)self creationDate];
    [v12 setCreationDate:v14];

    __int16 v15 = [(PUReviewAsset *)self location];
    [v12 setLocation:v15];

    if (![(PUReviewAsset *)self isAdjusted]) {
      goto LABEL_8;
    }
    uint64_t v16 = [v6 canHandleAdjustmentData];
    if (!v16) {
      goto LABEL_9;
    }
    uint64_t v17 = (void *)v16;
    id v18 = [v6 canHandleAdjustmentData];
    int v19 = ((uint64_t (**)(void, void *))v18)[2](v18, v9);

    if (v19)
    {
LABEL_8:
      [v12 setBaseVersion:0];
      [v12 setAdjustmentData:v9];
      v20 = [(PUReviewAsset *)self providedFullsizeImageURL];
      [v12 setFullSizeImageURL:v20];

      id v21 = [(PUReviewAsset *)self providedVideoURL];
      [v12 setVideoURL:v21];

      uint64_t v22 = [(PUReviewAsset *)self originalEXIFOrientation];
    }
    else
    {
LABEL_9:
      [v12 setBaseVersion:2];
      [v12 setAdjustmentData:v9];
      id v23 = [(PUReviewAsset *)self providedFullsizeRenderImageURL];
      [v12 setFullSizeImageURL:v23];

      __int16 v24 = [(PUReviewAsset *)self providedFullsizeRenderVideoURL];
      [v12 setVideoURL:v24];

      uint64_t v22 = 1;
    }
    [v12 setFullSizeImageOrientation:v22];
    v7[2](v7, v12, 0);
  }
  return 0;
}

- (PFVideoAVObjectBuilder)videoObjectBuilder
{
  id v3 = (void *)MEMORY[0x1E4F166C8];
  id v4 = [(PUReviewAsset *)self providedVideoURL];
  int v5 = [v3 assetWithURL:v4];

  if ([(PUReviewAsset *)self isHighFramerateVideo])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(PUReviewAsset *)self assetAdjustments];
  }
  char v7 = [MEMORY[0x1E4F8CE18] videoAdjustmentsFromAssetAdjustmentsIfRecognized:v6];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v5 videoAdjustments:v7];

  return (PFVideoAVObjectBuilder *)v8;
}

- (unint64_t)livePhotoVisibilityState
{
  if (![(PUReviewAsset *)self isLivePhoto]) {
    return 0;
  }
  BOOL v3 = [(PUReviewAsset *)self isAdjusted];
  BOOL v4 = [(PUReviewAsset *)self canPlayPhotoIris];
  uint64_t v5 = 4;
  if (v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 8;
  if (!v4 || !v3) {
    uint64_t v7 = 0;
  }
  return v6 | v5 | !v4 | v7;
}

- (BOOL)isTrimmableType
{
  return 0;
}

- (unint64_t)originalResourceChoice
{
  return 0;
}

- (BOOL)isInPlaceVideoTrimAllowed
{
  return 0;
}

- (BOOL)isLivePhotoVisibilityAdjustmentAllowed
{
  return 0;
}

- (BOOL)isContentAdjustmentAllowed
{
  return 1;
}

- (BOOL)isAdjusted
{
  v2 = [(PUReviewAsset *)self assetAdjustments];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isHighFramerateVideo
{
  return ([(PUReviewAsset *)self mediaSubtypes] >> 17) & 1;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (unsigned)deferredProcessingNeeded
{
  return 0;
}

- (BOOL)needsDeferredProcessing
{
  return 0;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return 2 * (self == a3);
}

- (BOOL)isAnimatedImage
{
  v2 = [(PUReviewAsset *)self uniformTypeIdentifier];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v2];
    char v4 = [v3 conformsToType:*MEMORY[0x1E4F443D0]];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canPlayLoopingVideo
{
  return [(PUReviewAsset *)self playbackStyle] == 5;
}

- (BOOL)isHidden
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PUReviewAsset *)self providedFullsizeImageURL];
  char v4 = [v3 pathExtension];
  uint64_t v5 = [v2 typeWithFilenameExtension:v4];
  uint64_t v6 = [v5 identifier];

  return (NSString *)v6;
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (BOOL)isSpatialMedia
{
  return ([(PUReviewAsset *)self mediaSubtypes] >> 10) & 1;
}

- (double)aspectRatio
{
  if (![(PUReviewAsset *)self pixelHeight]) {
    return 1.0;
  }
  double v3 = (double)[(PUReviewAsset *)self pixelWidth];
  return v3 / (double)[(PUReviewAsset *)self pixelHeight];
}

- (BOOL)isFavorite
{
  return 0;
}

- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 unadjustedVideoURL:(id)a11 adjustments:(id)a12 identifier:(id)a13
{
  id v38 = a7;
  id v37 = a9;
  id v36 = a10;
  id v18 = a11;
  id v19 = a12;
  id v20 = a13;
  v39.receiver = self;
  v39.super_class = (Class)PUReviewAsset;
  id v21 = [(PUReviewAsset *)&v39 init];
  if (v21)
  {
    uint64_t v22 = [v20 copy];
    id v23 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v22;

    *((void *)v21 + 6) = 2;
    *((_WORD *)v21 + 7) = 0;
    *((void *)v21 + 8) = 4;
    *((void *)v21 + 9) = a5;
    *((void *)v21 + 10) = a6;
    *((double *)v21 + 15) = a8;
    objc_storeStrong((id *)v21 + 12, a7);
    objc_storeStrong((id *)v21 + 14, a7);
    *((_WORD *)v21 + 5) = 0;
    uint64_t v24 = MEMORY[0x1E4F1F9F8];
    long long v25 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v21 + 200) = *MEMORY[0x1E4F1F9F8];
    uint64_t v26 = *(void *)(v24 + 16);
    *((void *)v21 + 27) = v26;
    *((_OWORD *)v21 + 14) = v25;
    *((void *)v21 + 30) = v26;
    v21[13] = 0;
    v27 = (void *)*((void *)v21 + 16);
    *((void *)v21 + 16) = 0;

    *((void *)v21 + 17) = 0;
    objc_storeStrong((id *)v21 + 18, a9);
    uint64_t v28 = (id *)(v21 + 176);
    id v29 = v18;
    if (v18)
    {
      objc_storeStrong(v28, a11);
      uint64_t v28 = (id *)(v21 + 184);
    }
    objc_storeStrong(v28, a10);
    objc_storeStrong((id *)v21 + 24, a12);
    v21[8] = [(id)objc_opt_class() _shouldShowConfidentialityWarningForAdjustments:*((void *)v21 + 24)];
    if (v19)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F8CE18];
      v31 = [v19 adjustmentFormatIdentifier];
      v32 = [v19 adjustmentFormatVersion];
      LODWORD(v30) = [v30 isRecognizedSlowMotionFormatWithIdentifier:v31 version:v32];

      if (v30) {
        *((void *)v21 + 7) = 0x20000;
      }
    }
    id v33 = v21;
    id v18 = v29;
  }

  return (PUReviewAsset *)v21;
}

- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 adjustments:(id)a11 identifier:(id)a12
{
  return [(PUReviewAsset *)self initWithAVAsset:a3 audioMix:a4 width:a5 height:a6 captureDate:a7 duration:a9 previewImage:a8 videoURL:a10 unadjustedVideoURL:0 adjustments:a11 identifier:a12];
}

- (PUReviewAsset)initWithLivePhoto:(id)a3 fullsizeUnadjustedImageURL:(id)a4 fullsizeUnadjustedVideoURL:(id)a5 assetAdjustments:(id)a6 width:(unint64_t)a7 height:(unint64_t)a8 captureDate:(id)a9 metadata:(id)a10 duration:(double)a11 previewImage:(id)a12 identifier:(id)a13
{
  id v19 = a3;
  id obj = a4;
  id v20 = a4;
  id v21 = a5;
  id v41 = a6;
  id v43 = a9;
  id v42 = a10;
  id v40 = a12;
  id v22 = a13;
  v45.receiver = self;
  v45.super_class = (Class)PUReviewAsset;
  id v23 = v21;
  uint64_t v24 = [(PUReviewAsset *)&v45 init];
  if (v24)
  {
    uint64_t v25 = [v22 copy];
    uint64_t v26 = (void *)*((void *)v24 + 5);
    *((void *)v24 + 5) = v25;

    *((_OWORD *)v24 + 3) = xmmword_1AEFF7D40;
    *((_WORD *)v24 + 7) = 0;
    *((void *)v24 + 8) = 3;
    *((void *)v24 + 9) = a7;
    *((void *)v24 + 10) = a8;
    objc_storeStrong((id *)v24 + 12, a9);
    objc_storeStrong((id *)v24 + 14, a9);
    v24[10] = v19 != 0;
    v24[12] = v19 != 0;
    v24[11] = v19 == 0;
    if (v19) {
      objc_msgSend(v19, "photoTime", obj);
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    *(CMTime *)(v24 + 200) = v44;
    CMTimeMakeWithSeconds(&v44, a11, 600);
    *(CMTime *)(v24 + 224) = v44;
    v24[13] = 0;
    v27 = (void *)*((void *)v24 + 16);
    *((void *)v24 + 16) = 0;

    *((void *)v24 + 17) = 0;
    objc_storeStrong((id *)v24 + 18, a12);
    uint64_t v28 = [v19 imageURL];
    if (v20 && v23)
    {
      id v29 = (void *)*((void *)v24 + 21);
      *((void *)v24 + 21) = v28;

      uint64_t v30 = [v19 videoURL];
      v31 = (void *)*((void *)v24 + 23);
      *((void *)v24 + 23) = v30;

      objc_storeStrong((id *)v24 + 20, obj);
      id v32 = v23;
    }
    else
    {
      id v33 = (void *)*((void *)v24 + 20);
      *((void *)v24 + 20) = v28;

      id v32 = [v19 videoURL];
    }
    id v34 = (void *)*((void *)v24 + 22);
    *((void *)v24 + 22) = v32;

    objc_storeStrong((id *)v24 + 19, a10);
    objc_storeStrong((id *)v24 + 24, a6);
    if ([(id)objc_opt_class() _shouldShowConfidentialityWarningForAdjustments:*((void *)v24 + 24)]) {
      char v35 = 1;
    }
    else {
      char v35 = [(id)objc_opt_class() _shouldShowConfidentialityWarningForMetadata:v42 creationDate:v43];
    }
    v24[8] = v35;
    id v36 = v24;
  }

  return (PUReviewAsset *)v24;
}

- (PUReviewAsset)initWithPhoto:(id)a3 mediaSubtypes:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 metadata:(id)a8 burstIdentifier:(id)a9 representedCount:(unint64_t)a10 fullsizeImageURL:(id)a11 fullsizeUnadjustedImageURL:(id)a12 assetAdjustments:(id)a13 identifier:(id)a14
{
  id v40 = a3;
  id v42 = a7;
  id v41 = a8;
  id v18 = a9;
  id v19 = a11;
  id v20 = a12;
  id v39 = a13;
  id v21 = a14;
  v43.receiver = self;
  v43.super_class = (Class)PUReviewAsset;
  id v22 = [(PUReviewAsset *)&v43 init];
  if (v22)
  {
    uint64_t v23 = [v21 copy];
    uint64_t v24 = (void *)*((void *)v22 + 5);
    *((void *)v22 + 5) = v23;

    *((void *)v22 + 6) = 1;
    *((void *)v22 + 7) = a4;
    *((_WORD *)v22 + 7) = 0;
    *((void *)v22 + 8) = 1;
    *((void *)v22 + 9) = a5;
    *((void *)v22 + 10) = a6;
    objc_storeStrong((id *)v22 + 12, a7);
    objc_storeStrong((id *)v22 + 13, a7);
    objc_storeStrong((id *)v22 + 14, a7);
    *((_WORD *)v22 + 5) = 0;
    uint64_t v25 = MEMORY[0x1E4F1F9F8];
    long long v26 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v22 + 200) = *MEMORY[0x1E4F1F9F8];
    uint64_t v27 = *(void *)(v25 + 16);
    *((void *)v22 + 27) = v27;
    *((_OWORD *)v22 + 14) = v26;
    *((void *)v22 + 30) = v27;
    v22[13] = v18 != 0;
    uint64_t v28 = [v18 copy];
    id v29 = (void *)*((void *)v22 + 16);
    *((void *)v22 + 16) = v28;

    *((void *)v22 + 17) = a10;
    objc_storeStrong((id *)v22 + 18, a3);
    objc_storeStrong((id *)v22 + 19, a8);
    id v30 = v19;
    if (v20)
    {
      v31 = (void *)*((void *)v22 + 21);
      *((void *)v22 + 21) = v30;

      id v30 = v20;
    }
    id v32 = (void *)*((void *)v22 + 20);
    *((void *)v22 + 20) = v30;

    objc_storeStrong((id *)v22 + 24, a13);
    if ([(id)objc_opt_class() _shouldShowConfidentialityWarningForAdjustments:*((void *)v22 + 24)]) {
      char v33 = 1;
    }
    else {
      char v33 = [(id)objc_opt_class() _shouldShowConfidentialityWarningForMetadata:v41 creationDate:v42];
    }
    v22[8] = v33;
    id v34 = v22;
  }

  return (PUReviewAsset *)v22;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 previewImage:(id)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 assetAdjustments:(id)a11 duration:(double)a12
{
  id v19 = a3;
  id obj = a4;
  id v54 = a4;
  id v50 = a5;
  id v53 = a5;
  id v51 = a6;
  id v20 = a6;
  id v52 = a7;
  id v21 = a7;
  id v22 = (UIImage *)a8;
  id v23 = a11;
  uint64_t v24 = [(PUReviewAsset *)self initWithReviewAsset:v19];
  uint64_t v25 = v24;
  if (!v24) {
    goto LABEL_12;
  }
  v24->_pixelWidth = a9;
  v24->_pixelHeight = a10;
  v24->_duration = a12;
  if (v23)
  {
    BOOL v26 = [v23 adjustmentBaseVersion] != 0;
    id v27 = objc_alloc(MEMORY[0x1E4F8CBB8]);
    [v23 adjustmentFormatIdentifier];
    uint64_t v28 = v47 = v22;
    [v23 adjustmentFormatVersion];
    id v29 = v48 = v20;
    [v23 adjustmentData];
    v31 = id v30 = v21;
    id v32 = [v23 editorBundleID];
    char v33 = (void *)[v27 initWithFormatIdentifier:v28 formatVersion:v29 data:v31 baseVersion:0 editorBundleID:v32 renderTypes:0];

    id v21 = v30;
    id v20 = v48;

    id v22 = v47;
  }
  else
  {
    BOOL v26 = 0;
    char v33 = 0;
  }
  objc_storeStrong((id *)&v25->_assetAdjustments, v33);
  char v34 = [(id)objc_opt_class() _shouldShowConfidentialityWarningForAdjustments:v25->_assetAdjustments];
  v25->_requiresConfidentiality = v34 | [v19 requiresConfidentiality];
  if (v22)
  {
    if (!v26) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v26) {
    providedPreviewImage = 0;
  }
  else {
    providedPreviewImage = v25->_providedPreviewImage;
  }
  id v22 = providedPreviewImage;
  if (v26)
  {
LABEL_7:
    char v35 = [(PUReviewAsset *)v25 providedImageMetadata];
    id v36 = v33;
    id v37 = v22;
    id v38 = (void *)[v35 mutableCopy];

    [v38 setObject:&unk_1F078CB48 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    uint64_t v39 = [v38 copy];
    providedImageMetadata = v25->_providedImageMetadata;
    v25->_providedImageMetadata = (NSDictionary *)v39;

    id v22 = v37;
    char v33 = v36;
  }
LABEL_8:
  objc_storeStrong((id *)&v25->_providedFullsizeImageURL, obj);
  objc_storeStrong((id *)&v25->_providedFullsizeRenderImageURL, v50);
  objc_storeStrong((id *)&v25->_providedVideoURL, v51);
  objc_storeStrong((id *)&v25->_providedFullsizeRenderVideoURL, v52);
  objc_storeStrong((id *)&v25->_providedPreviewImage, v22);
  if ([(PUReviewAsset *)v25 isLivePhoto] && !v25->_providedVideoURL)
  {
    v25->_mediaSubtypes = [(PUReviewAsset *)v25 mediaSubtypes] & 0xFFFFFFFFFFFFFFF7;
    *(_WORD *)&v25->_livePhoto = 0;
    v25->_canPlayPhotoIris = 0;
    uint64_t v41 = MEMORY[0x1E4F1F9F8];
    long long v42 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v25->_livePhotoSynchronizedDisplayTime.value = *MEMORY[0x1E4F1F9F8];
    int64_t v43 = *(void *)(v41 + 16);
    v25->_livePhotoSynchronizedDisplayTime.epoch = v43;
    *(_OWORD *)&v25->_livePhotoDuration.value = v42;
    v25->_livePhotoDuration.epoch = v43;
  }
  CMTime v44 = v25;

LABEL_12:
  return v25;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 pixelWidth:(unint64_t)a8 pixelHeight:(unint64_t)a9 assetAdjustments:(id)a10 duration:(double)a11
{
  return [(PUReviewAsset *)self initWithReviewAsset:a3 baseImageURL:a4 renderedImageURL:a5 baseVideoURL:a6 renderedVideoURL:a7 previewImage:0 pixelWidth:a11 pixelHeight:a8 assetAdjustments:a9 duration:a10];
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 primaryResourceURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PUReviewAsset *)self initWithReviewAsset:v6];
  if (v8)
  {
    uint64_t v9 = [v6 mediaType];
    if (v9 == 2)
    {
      uint64_t v12 = [v7 copy];
      providedVideoURL = v8->_providedVideoURL;
      v8->_providedVideoURL = (NSURL *)v12;
    }
    else
    {
      if (v9 != 1)
      {
LABEL_7:
        id v13 = v8;
        goto LABEL_8;
      }
      uint64_t v10 = [v7 copy];
      providedVideoURL = v8->_providedFullsizeImageURL;
      v8->_providedFullsizeImageURL = (NSURL *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4 canPlayPhotoIris:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PUReviewAsset *)self initWithConformingAsset:v8];
  id v11 = v10;
  if (v10)
  {
    v10->_canPlayPhotoIris = v5;
    if (v5) {
      v10->_playbackStyle = 3;
    }
    uint64_t v12 = [(PUReviewAsset *)v10 _ensureLinkDestinationDirectoryFromBaseDirectory:v9];
    id v13 = [v8 providedFullsizeImageURL];
    if (v13)
    {
      uint64_t v14 = [(PUReviewAsset *)v11 _uniqueDestinationURLForFileURL:v13 inDirectory:v12];
      providedFullsizeImageURL = v11->_providedFullsizeImageURL;
      v11->_providedFullsizeImageURL = (NSURL *)v14;

      int v16 = [(PUReviewAsset *)v11 _linkFileAtURL:v13 toURL:v11->_providedFullsizeImageURL];
    }
    else
    {
      int v16 = 1;
    }
    id v18 = [v8 providedFullsizeRenderImageURL];
    if (v18)
    {
      uint64_t v19 = [(PUReviewAsset *)v11 _uniqueDestinationURLForFileURL:v18 inDirectory:v12];
      providedFullsizeRenderImageURL = v11->_providedFullsizeRenderImageURL;
      v11->_providedFullsizeRenderImageURL = (NSURL *)v19;

      if (v16) {
        int v16 = [(PUReviewAsset *)v11 _linkFileAtURL:v18 toURL:v11->_providedFullsizeRenderImageURL];
      }
    }
    id v21 = [v8 providedVideoURL];
    if (v21)
    {
      uint64_t v22 = [(PUReviewAsset *)v11 _uniqueDestinationURLForFileURL:v21 inDirectory:v12];
      providedVideoURL = v11->_providedVideoURL;
      v11->_providedVideoURL = (NSURL *)v22;

      if (v16) {
        int v16 = [(PUReviewAsset *)v11 _linkFileAtURL:v21 toURL:v11->_providedVideoURL];
      }
    }
    uint64_t v24 = [v8 providedFullsizeRenderVideoURL];
    if (v24)
    {
      uint64_t v25 = [(PUReviewAsset *)v11 _uniqueDestinationURLForFileURL:v24 inDirectory:v12];
      providedFullsizeRenderVideoURL = v11->_providedFullsizeRenderVideoURL;
      v11->_providedFullsizeRenderVideoURL = (NSURL *)v25;

      if (v16)
      {
        BOOL v27 = [(PUReviewAsset *)v11 _linkFileAtURL:v24 toURL:v11->_providedFullsizeRenderVideoURL];
        uint64_t v28 = v11;
        if (v27) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      uint64_t v28 = v11;
      if (v16) {
        goto LABEL_18;
      }
    }
    [(PUReviewAsset *)v11 removeAllFilesAtReferencedURLs];
    uint64_t v28 = 0;
LABEL_18:
    uint64_t v17 = v28;

    goto LABEL_19;
  }
  uint64_t v17 = 0;
LABEL_19:

  return v17;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PUReviewAsset initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:](self, "initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:", v7, v6, [v7 canPlayPhotoIris]);

  return v8;
}

- (PUReviewAsset)initWithConformingAsset:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PUReviewAsset;
  BOOL v5 = [(PUReviewAsset *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    id v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    *((void *)v5 + 6) = [v4 mediaType];
    *((void *)v5 + 7) = [v4 mediaSubtypes];
    *((void *)v5 + 8) = [v4 playbackStyle];
    *((_WORD *)v5 + 7) = [v4 playbackVariation];
    *((void *)v5 + 9) = [v4 pixelWidth];
    *((void *)v5 + 10) = [v4 pixelHeight];
    uint64_t v8 = [v4 location];
    id v9 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v8;

    uint64_t v10 = [v4 creationDate];
    id v11 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v10;

    uint64_t v12 = [v4 modificationDate];
    id v13 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v12;

    v5[9] = [v4 isHDR];
    [v4 duration];
    *((void *)v5 + 15) = v14;
    v5[10] = [v4 isLivePhoto];
    v5[12] = [v4 canPlayPhotoIris];
    v5[11] = [v4 isLivePhotoPlaceholder];
    __int16 v15 = v5 + 200;
    if (v4)
    {
      [v4 livePhotoSynchronizedDisplayTime];
      _OWORD *v15 = v37;
      *((void *)v5 + 27) = v38;
      [v4 livePhotoDuration];
    }
    else
    {
      *(void *)__int16 v15 = 0;
      *((void *)v5 + 26) = 0;
      *((void *)v5 + 27) = 0;
      long long v37 = 0uLL;
      uint64_t v38 = 0;
    }
    *((_OWORD *)v5 + 14) = v37;
    *((void *)v5 + 30) = v38;
    v5[13] = [v4 representsBurst];
    uint64_t v16 = [v4 burstIdentifier];
    uint64_t v17 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v16;

    *((void *)v5 + 17) = [v4 numberOfRepresentedAssets];
    uint64_t v18 = [v4 providedPreviewImage];
    uint64_t v19 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v18;

    uint64_t v20 = [v4 providedImageMetadata];
    id v21 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v20;

    uint64_t v22 = [v4 assetAdjustments];
    id v23 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v22;

    if ([(id)objc_opt_class() _shouldShowConfidentialityWarningForAdjustments:*((void *)v5 + 24)])
    {
      v5[8] = 1;
    }
    else
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = [v5 providedImageMetadata];
      BOOL v26 = [v5 creationDate];
      v5[8] = [v24 _shouldShowConfidentialityWarningForMetadata:v25 creationDate:v26];
    }
    uint64_t v27 = [v4 providedFullsizeImageURL];
    uint64_t v28 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v27;

    uint64_t v29 = [v4 providedFullsizeRenderImageURL];
    id v30 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v29;

    uint64_t v31 = [v4 providedVideoURL];
    id v32 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v31;

    uint64_t v33 = [v4 providedFullsizeRenderVideoURL];
    char v34 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v33;

    char v35 = v5;
  }

  return (PUReviewAsset *)v5;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PUReviewAsset;
  BOOL v5 = [(PUReviewAsset *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    id v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    *((void *)v5 + 6) = [v4 mediaType];
    *((void *)v5 + 7) = [v4 mediaSubtypes];
    *((void *)v5 + 8) = [v4 playbackStyle];
    *((_WORD *)v5 + 7) = [v4 playbackVariation];
    *((void *)v5 + 9) = [v4 pixelWidth];
    *((void *)v5 + 10) = [v4 pixelHeight];
    uint64_t v8 = [v4 location];
    id v9 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v8;

    uint64_t v10 = [v4 creationDate];
    id v11 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v10;

    uint64_t v12 = [v4 modificationDate];
    id v13 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v12;

    v5[9] = [v4 isHDR];
    [v4 duration];
    *((void *)v5 + 15) = v14;
    v5[10] = [v4 isLivePhoto];
    v5[12] = [v4 canPlayPhotoIris];
    v5[11] = [v4 isLivePhotoPlaceholder];
    __int16 v15 = v5 + 200;
    if (v4)
    {
      [v4 livePhotoSynchronizedDisplayTime];
      _OWORD *v15 = v34;
      *((void *)v5 + 27) = v35;
      [v4 livePhotoDuration];
    }
    else
    {
      *(void *)__int16 v15 = 0;
      *((void *)v5 + 26) = 0;
      *((void *)v5 + 27) = 0;
      long long v34 = 0uLL;
      uint64_t v35 = 0;
    }
    *((_OWORD *)v5 + 14) = v34;
    *((void *)v5 + 30) = v35;
    v5[13] = [v4 representsBurst];
    uint64_t v16 = [v4 burstIdentifier];
    uint64_t v17 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v16;

    *((void *)v5 + 17) = [v4 numberOfRepresentedAssets];
    uint64_t v18 = [v4 providedPreviewImage];
    uint64_t v19 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v18;

    uint64_t v20 = [v4 providedImageMetadata];
    id v21 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v20;

    uint64_t v22 = [v4 assetAdjustments];
    id v23 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v22;

    uint64_t v24 = [v4 providedFullsizeImageURL];
    uint64_t v25 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v24;

    uint64_t v26 = [v4 providedFullsizeRenderImageURL];
    uint64_t v27 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v26;

    uint64_t v28 = [v4 providedVideoURL];
    uint64_t v29 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v28;

    uint64_t v30 = [v4 providedFullsizeRenderVideoURL];
    uint64_t v31 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v30;

    v5[8] = [v4 requiresConfidentiality];
    id v32 = v5;
  }

  return (PUReviewAsset *)v5;
}

+ (id)fileURLForAdjustmentsInDirectory:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Adjustments.plist"];
}

+ (id)fileURLForFullsizeRenderVideoComplementInDirectory:(id)a3
{
  return (id)[a1 fileURLForFullsizeRenderImageInDirectory:a3 extension:@"mov"];
}

+ (id)fileURLForFullsizeVideoComplementInDirectory:(id)a3
{
  return (id)[a1 fileURLForFullsizeImageInDirectory:a3 extension:@"mov"];
}

+ (id)fileURLForFullsizeRenderVideoInDirectory:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"RenderedVideo.mov"];
}

+ (id)fileURLForFullsizeVideoInDirectory:(id)a3 extension:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [@"Video" stringByAppendingPathExtension:a4];
  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (id)fileURLForFullsizeRenderImageInDirectory:(id)a3 extension:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [@"RenderedImage" stringByAppendingPathExtension:a4];
  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (id)fileURLForFullsizeImageInDirectory:(id)a3 extension:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [@"Image" stringByAppendingPathExtension:a4];
  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (id)createUniqueMediaDirectoryForAssetWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"ReviewData"];

  uint64_t v6 = [v5 stringByAppendingPathComponent:v3];

  id v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [v7 UUIDString];

  id v9 = [v6 stringByAppendingPathComponent:v8];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v11 = v15;

  if (v11)
  {
    uint64_t v12 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }
  }
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:1];

  return v13;
}

+ (BOOL)_shouldShowConfidentialityWarningForMetadata:(id)a3 creationDate:(id)a4
{
  id v5 = a3;
  if ([a1 _shouldCheckConfidentiality]) {
    [v5 count];
  }

  return 0;
}

+ (BOOL)_shouldShowConfidentialityWarningForAdjustments:(id)a3
{
  id v4 = a3;
  if ([a1 _shouldCheckConfidentiality])
  {
    unint64_t v5 = [a1 _confidentialityWarningsVersionForAdjustments:v4];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F906A0] sharedInstance];
      LOBYTE(v5) = v5 >= [v6 confidentialityWarningsVersion];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (unint64_t)_confidentialityWarningsVersionForAdjustments:(id)a3
{
  id v3 = [a3 adjustmentFormatIdentifier];
  id v4 = v3;
  if (v3 == @"com.apple.FunEffects"
    || [(__CFString *)v3 isEqualToString:@"com.apple.FunEffects"])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end