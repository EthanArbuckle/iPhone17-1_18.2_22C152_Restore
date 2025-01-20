@interface PUImageRequester
- (BOOL)_needsUpdate;
- (BOOL)highPriorityRequest;
- (BOOL)imageIsFullQuality;
- (BOOL)imageIsPlaceholder;
- (BOOL)includeGainMap;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)requestHDR;
- (BOOL)requiresFullQualityImage;
- (BOOL)useLowMemoryMode;
- (CGImage)gainMapImage;
- (CGSize)_lastRequestedImageSize;
- (CGSize)imageTargetSize;
- (CGSize)targetSize;
- (NSArray)requestFullSizeImageDataUTTypes;
- (NSData)fullSizeImageData;
- (NSDate)currentRequestStartDate;
- (NSError)error;
- (NSHashTable)observers;
- (NSURL)fullSizeImageURL;
- (PUDisplayAsset)asset;
- (PUDisplayAsset)imageAsset;
- (PUImageRequester)init;
- (PUImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4 requiresFullQualityImage:(BOOL)a5;
- (PUImageRequesterResult)result;
- (PUMediaProvider)mediaProvider;
- (PXEventCoalescer)fullSizeDataRepeatRequestCoalescer;
- (UIImage)image;
- (double)targetHDRHeadroom;
- (float)gainMapValue;
- (id)imageByAddingWallpaperCropRectDiagnosticsForAsset:(id)a3 sourceImage:(id)a4;
- (int)_currentImageRequestID;
- (int)currentFullSizeImageDataRequestID;
- (int64_t)_changeCount;
- (void)_assertInsideChangesBlock;
- (void)_didChange;
- (void)_handleResultOfFullSizeImageDataRequestWithID:(int)a3 imageData:(id)a4 imageURL:(id)a5 dataUTI:(id)a6 orientation:(int64_t)a7 info:(id)a8;
- (void)_handleResultOfImageRequestWithID:(int)a3 asset:(id)a4 targetSize:(CGSize)a5 image:(id)a6 info:(id)a7;
- (void)_invalidateImageRequest;
- (void)_invalidateResult;
- (void)_produceDebugImage;
- (void)_setChangeCount:(int64_t)a3;
- (void)_setCurrentImageRequestID:(int)a3;
- (void)_setLastRequestedImageSize:(CGSize)a3;
- (void)_setNeedsUpdate:(BOOL)a3;
- (void)_setObserver:(id)a3;
- (void)_update;
- (void)_updateResult;
- (void)_willChange;
- (void)cancelAllImageRequests;
- (void)dealloc;
- (void)handlePreloadedImage:(id)a3;
- (void)performChanges:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentFullSizeImageDataRequestID:(int)a3;
- (void)setCurrentRequestStartDate:(id)a3;
- (void)setError:(id)a3;
- (void)setFullSizeDataRepeatRequestCoalescer:(id)a3;
- (void)setFullSizeImageData:(id)a3;
- (void)setFullSizeImageURL:(id)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setHighPriorityRequest:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageAsset:(id)a3;
- (void)setImageIsFullQuality:(BOOL)a3;
- (void)setImageIsPlaceholder:(BOOL)a3;
- (void)setImageTargetSize:(CGSize)a3;
- (void)setIncludeGainMap:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setRequestFullSizeImageDataUTTypes:(id)a3;
- (void)setRequestHDR:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setTargetHDRHeadroom:(double)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateIfNeeded;
@end

@implementation PUImageRequester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullSizeDataRepeatRequestCoalescer, 0);
  objc_storeStrong((id *)&self->_currentRequestStartDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_fullSizeImageData, 0);
  objc_storeStrong((id *)&self->_requestFullSizeImageDataUTTypes, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (void)setFullSizeDataRepeatRequestCoalescer:(id)a3
{
}

- (PXEventCoalescer)fullSizeDataRepeatRequestCoalescer
{
  return self->_fullSizeDataRepeatRequestCoalescer;
}

- (void)setCurrentRequestStartDate:(id)a3
{
}

- (NSDate)currentRequestStartDate
{
  return self->_currentRequestStartDate;
}

- (void)_setCurrentImageRequestID:(int)a3
{
  self->__currentImageRequestID = a3;
}

- (int)_currentImageRequestID
{
  return self->__currentImageRequestID;
}

- (void)_setLastRequestedImageSize:(CGSize)a3
{
  self->__lastRequestedImageSize = a3;
}

- (CGSize)_lastRequestedImageSize
{
  double width = self->__lastRequestedImageSize.width;
  double height = self->__lastRequestedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentFullSizeImageDataRequestID:(int)a3
{
  self->_currentFullSizeImageDataRequestID = a3;
}

- (int)currentFullSizeImageDataRequestID
{
  return self->_currentFullSizeImageDataRequestID;
}

- (void)_setNeedsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (void)_setChangeCount:(int64_t)a3
{
  self->__changeCount = a3;
}

- (int64_t)_changeCount
{
  return self->__changeCount;
}

- (void)_setObserver:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)imageIsFullQuality
{
  return self->_imageIsFullQuality;
}

- (void)setImageIsPlaceholder:(BOOL)a3
{
  self->_imageIsPlaceholder = a3;
}

- (BOOL)imageIsPlaceholder
{
  return self->_imageIsPlaceholder;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (void)setImageTargetSize:(CGSize)a3
{
  self->_imageTargetSize = a3;
}

- (CGSize)imageTargetSize
{
  double width = self->_imageTargetSize.width;
  double height = self->_imageTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageAsset:(id)a3
{
}

- (PUDisplayAsset)imageAsset
{
  return self->_imageAsset;
}

- (UIImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (PUImageRequesterResult)result
{
  return self->_result;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)requestHDR
{
  return self->_requestHDR;
}

- (BOOL)includeGainMap
{
  return self->_includeGainMap;
}

- (void)setHighPriorityRequest:(BOOL)a3
{
  self->_highPriorityRequest = a3;
}

- (BOOL)highPriorityRequest
{
  return self->_highPriorityRequest;
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (NSData)fullSizeImageData
{
  return self->_fullSizeImageData;
}

- (BOOL)requiresFullQualityImage
{
  return self->_requiresFullQualityImage;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (NSArray)requestFullSizeImageDataUTTypes
{
  return self->_requestFullSizeImageDataUTTypes;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)_produceDebugImage
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  v3 = +[PUOneUpSettings sharedInstance];
  if (![(PUImageRequester *)self imageIsFullQuality]
    || ([v3 showSaliencyRects] & 1) == 0
    && ([v3 showFacesRect] & 1) == 0
    && ([v3 showFacesTorsosRects] & 1) == 0
    && ([v3 showWallpaperCropRect] & 1) == 0
    && ![v3 showGazeRects])
  {
    goto LABEL_60;
  }
  v4 = [(PUImageRequester *)self asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_60;
  }
  v6 = [(PUImageRequester *)self asset];
  v7 = [(PUImageRequester *)self image];
  [v7 size];
  CGFloat v9 = v8;
  [v7 size];
  CGFloat v11 = v10;
  id v12 = v7;
  v13 = v12;
  if ([v3 showSaliencyRects])
  {
    [v6 preferredCropRect];
    v13 = v12;
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v14, v15, v16, v17))
    {
      PXRectFlippedVertically();
      PXRectDenormalize();
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      v26 = [MEMORY[0x1E4FB1618] redColor];
      v13 = objc_msgSend(v12, "px_debugImageWithStrokeRect:color:text:", v26, @"Preferred", v19, v21, v23, v25);
    }
    [v6 acceptableCropRect];
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v27, v28, v29, v30))
    {
      PXRectFlippedVertically();
      PXRectDenormalize();
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v39 = [MEMORY[0x1E4FB1618] orangeColor];
      uint64_t v40 = objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v39, @"Acceptable", v32, v34, v36, v38);

      v13 = (void *)v40;
    }
  }
  if ([v3 showFacesRect])
  {
    [v6 normalizedFaceAreaRect];
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v41, v42, v43, v44))
    {
      PXRectDenormalize();
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      v53 = [MEMORY[0x1E4FB1618] blueColor];
      v54 = objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v53, @"Faces Area", v46, v48, v50, v52);

      v55 = +[PUOneUpSettings sharedInstance];
      int v56 = [v55 showPaddedFacesRect];

      if (v56)
      {
        PXRectScaleFromCenter();
        v120.origin.double x = 0.0;
        v120.origin.double y = 0.0;
        v120.size.double width = v9;
        v120.size.double height = v11;
        CGRect v118 = CGRectIntersection(v117, v120);
        double x = v118.origin.x;
        double y = v118.origin.y;
        double width = v118.size.width;
        double height = v118.size.height;
        v61 = [MEMORY[0x1E4FB1618] cyanColor];
        v13 = objc_msgSend(v54, "px_debugImageWithStrokeRect:color:text:", v61, @"Scaled Faces Area", x, y, width, height);
      }
      else
      {
        v13 = v54;
      }
    }
  }
  if ([v3 showBestSquareRect])
  {
    [v6 bestCropRectForAspectRatio:0 verticalContentMode:2 cropMode:1.0];
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v62, v63, v64, v65))
    {
      PXRectDenormalize();
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      v74 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v75 = objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v74, @"Best Square Crop Rect", v67, v69, v71, v73);

      v13 = (void *)v75;
    }
  }
  if (([v3 showFacesTorsosRects] & 1) == 0 && !objc_msgSend(v3, "showGazeRects")) {
    goto LABEL_57;
  }
  v76 = [v6 photoLibrary];
  v77 = [v76 librarySpecificFetchOptions];

  [v77 setWantsIncrementalChangeDetails:0];
  [v77 setIncludeTorsoAndFaceDetectionData:1];
  v78 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v77 setIncludedDetectionTypes:v78];

  v79 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v6 options:v77];
  if (![v79 count]) {
    goto LABEL_56;
  }
  v103 = v77;
  id v104 = v12;
  v105 = v6;
  v106 = self;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v102 = v79;
  id obj = v79;
  uint64_t v80 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  if (!v80) {
    goto LABEL_55;
  }
  uint64_t v81 = v80;
  uint64_t v110 = 0;
  uint64_t v82 = *(void *)v112;
  v108 = v3;
  do
  {
    for (uint64_t i = 0; i != v81; ++i)
    {
      if (*(void *)v112 != v82) {
        objc_enumerationMutation(obj);
      }
      v84 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      if ([v3 showFacesTorsosRects])
      {
        [v84 centerX];
        if (v85 <= 0.0)
        {
          [v84 bodyCenterX];
          if (v94 > 0.0)
          {
            [v84 bodyCenterY];
            goto LABEL_44;
          }
        }
        else
        {
          [v84 centerY];
          double v87 = v86;
          [v84 bodyCenterX];
          if (v88 <= 0.0)
          {
            if (v87 > 0.0)
            {
              BOOL v90 = 0;
              goto LABEL_41;
            }
          }
          else
          {
            [v84 bodyCenterY];
            BOOL v90 = v89 > 0.0;
            if (v87 > 0.0 && v89 > 0.0)
            {
              v91 = objc_msgSend(NSString, "stringWithFormat:", @"FT%d", v110 + i);
              v92 = [MEMORY[0x1E4FB1618] greenColor];
              v93 = [MEMORY[0x1E4FB1618] cyanColor];
              BOOL v90 = 1;
              goto LABEL_42;
            }
            if (v87 > 0.0)
            {
LABEL_41:
              v91 = objc_msgSend(NSString, "stringWithFormat:", @"F%d", v110 + i);
              v92 = [MEMORY[0x1E4FB1618] magentaColor];
              v93 = 0;
LABEL_42:
              [v84 size];
              [v84 centerX];
              [v84 centerX];
              [v84 centerY];
              [v84 centerY];
              PXRectWithEdges();
              PXRectDenormalize();
              uint64_t v95 = objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v92, v91);

              v13 = (void *)v95;
              if (!v90)
              {
LABEL_49:

                v13 = (void *)v95;
                v3 = v108;
                goto LABEL_50;
              }
LABEL_46:
              [v84 bodyHeight];
              [v84 bodyWidth];
              [v84 bodyCenterX];
              [v84 bodyCenterX];
              [v84 bodyCenterY];
              [v84 bodyCenterY];
              PXRectWithEdges();
              PXRectDenormalize();
              objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v93, v91);
              v13 = v96 = v13;
LABEL_48:

              uint64_t v95 = (uint64_t)v13;
              goto LABEL_49;
            }
LABEL_44:
            if (v89 > 0.0)
            {
              v91 = objc_msgSend(NSString, "stringWithFormat:", @"T%d", v110 + i);
              v93 = [MEMORY[0x1E4FB1618] orangeColor];
              v92 = 0;
              goto LABEL_46;
            }
          }
        }
        v96 = [MEMORY[0x1E4F28B00] currentHandler];
        v97 = [v84 localIdentifier];
        [v96 handleFailureInMethod:a2, v106, @"PUImageRequester.m", 637, @"Face %@ is missing face and torso", v97 object file lineNumber description];

        v91 = 0;
        v92 = 0;
        v93 = 0;
        goto LABEL_48;
      }
LABEL_50:
      if ([v3 showGazeRects])
      {
        [v84 gazeRect];
        v121.origin.double x = -1.0;
        v121.origin.double y = -1.0;
        v121.size.double width = -1.0;
        v121.size.double height = -1.0;
        if (!CGRectEqualToRect(v119, v121))
        {
          v98 = objc_msgSend(NSString, "stringWithFormat:", @"G%d", v110 + i);
          v99 = [MEMORY[0x1E4FB1618] brownColor];
          [v84 gazeRect];
          PXRectFlippedVertically();
          PXRectDenormalize();
          uint64_t v100 = objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v99, v98);

          v13 = (void *)v100;
        }
      }
    }
    v110 += i;
    uint64_t v81 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  }
  while (v81);
LABEL_55:

  self = v106;
  id v12 = v104;
  v6 = v105;
  v79 = v102;
  v77 = v103;
LABEL_56:

LABEL_57:
  if ([v3 showWallpaperCropRect])
  {
    uint64_t v101 = [(PUImageRequester *)self imageByAddingWallpaperCropRectDiagnosticsForAsset:v6 sourceImage:v13];

    v13 = (void *)v101;
  }
  [(PUImageRequester *)self setImage:v13];

LABEL_60:
}

BOOL __38__PUImageRequester__produceDebugImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsNull(*(CGRect *)&a1)) {
    return 0;
  }
  v9.origin.double x = a1;
  v9.origin.double y = a2;
  v9.size.double width = a3;
  v9.size.double height = a4;
  if (CGRectIsInfinite(v9)) {
    return 0;
  }
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  return !CGRectIsEmpty(v10);
}

- (void)_handleResultOfFullSizeImageDataRequestWithID:(int)a3 imageData:(id)a4 imageURL:(id)a5 dataUTI:(id)a6 orientation:(int64_t)a7 info:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  id v14 = a6;
  if ([(PUImageRequester *)self currentFullSizeImageDataRequestID] == a3)
  {
    [(PUImageRequester *)self setCurrentFullSizeImageDataRequestID:0];
    if (v12 | v13)
    {
      id v28 = v14;
      if (v14)
      {
        CGFloat v15 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v14];
      }
      else
      {
        CGFloat v15 = 0;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      CGFloat v16 = [(PUImageRequester *)self requestFullSizeImageDataUTTypes];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
LABEL_8:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * v20)];
          char v22 = [v15 conformsToType:v21];

          if (v22) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v18) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }

        if (v12)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke;
          v31[3] = &unk_1E5F2ECC8;
          v31[4] = self;
          unint64_t v12 = (unint64_t)(id)v12;
          id v32 = (id)v12;
          [(PUImageRequester *)self performChanges:v31];

          unint64_t v13 = (unint64_t)v27;
          id v14 = v28;
          goto LABEL_24;
        }
        id v14 = v28;
        if (v27)
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke_2;
          v29[3] = &unk_1E5F2ECC8;
          v29[4] = self;
          unint64_t v13 = v27;
          id v30 = (id)v13;
          [(PUImageRequester *)self performChanges:v29];

          goto LABEL_23;
        }
      }
      else
      {
LABEL_14:

        int v23 = [v15 conformsToType:*MEMORY[0x1E4F44498]];
        double v24 = PLOneUpGetLog();
        id v14 = v28;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          double v25 = [(PUImageRequester *)self asset];
          *(_DWORD *)buf = 138412546;
          id v38 = v28;
          __int16 v39 = 2112;
          uint64_t v40 = v25;
          _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_ERROR, "got non-supported data %@ for %@", buf, 0x16u);
        }
        if (v23)
        {
          v26 = [(PUImageRequester *)self fullSizeDataRepeatRequestCoalescer];
          [v26 inputEvent];
        }
      }
    }
    unint64_t v13 = 0;
LABEL_23:
    unint64_t v12 = 0;
  }
LABEL_24:
}

uint64_t __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFullSizeImageData:*(void *)(a1 + 40)];
}

uint64_t __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFullSizeImageURL:*(void *)(a1 + 40)];
}

- (void)_handleResultOfImageRequestWithID:(int)a3 asset:(id)a4 targetSize:(CGSize)a5 image:(id)a6 info:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([(PUImageRequester *)self _currentImageRequestID] == a3)
  {
    CGFloat v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    if ([v16 BOOLValue])
    {
      char v17 = 0;
    }
    else
    {
      uint64_t v18 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F39700]];
      char v17 = [v18 BOOLValue] ^ 1;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__PUImageRequester__handleResultOfImageRequestWithID_asset_targetSize_image_info___block_invoke;
    v19[3] = &unk_1E5F25A78;
    id v20 = v14;
    double v21 = self;
    char v26 = v17;
    id v22 = v15;
    id v23 = v13;
    CGFloat v24 = width;
    CGFloat v25 = height;
    [(PUImageRequester *)self performChanges:v19];
    [(PUImageRequester *)self _update];
  }
}

void __82__PUImageRequester__handleResultOfImageRequestWithID_asset_targetSize_image_info___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) image];
    if (v2)
    {
      v3 = (void *)v2;
      [*(id *)(a1 + 32) size];
      v4 = [*(id *)(a1 + 40) image];
      [v4 size];
      if (PFSizeLargerThanSize() & 1) != 0 || ([*(id *)(a1 + 40) imageIsPlaceholder])
      {
      }
      else
      {
        if (!*(unsigned char *)(a1 + 80))
        {

          goto LABEL_7;
        }
        char v8 = [*(id *)(a1 + 40) imageIsFullQuality];

        if (v8) {
          goto LABEL_8;
        }
      }
    }
    v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PHImageResultIsPlaceholderKey"];
    uint64_t v6 = [v5 BOOLValue];

    [*(id *)(a1 + 40) setImageIsPlaceholder:v6];
    [*(id *)(a1 + 40) setImage:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setImageAsset:*(void *)(a1 + 56)];
    objc_msgSend(*(id *)(a1 + 40), "setImageTargetSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F396A8]];
    [*(id *)(a1 + 40) setGainMapImage:v7];

    v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F396B0]];
    [v3 floatValue];
    objc_msgSend(*(id *)(a1 + 40), "setGainMapValue:");
LABEL_7:

LABEL_8:
    [*(id *)(a1 + 40) setImageIsFullQuality:*(unsigned __int8 *)(a1 + 80)];
  }
  id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  [*(id *)(a1 + 40) setError:v9];
}

- (void)cancelAllImageRequests
{
  uint64_t v3 = [(PUImageRequester *)self _currentImageRequestID];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = [(PUImageRequester *)self mediaProvider];
    [v5 cancelImageRequest:v4];

    [(PUImageRequester *)self _setCurrentImageRequestID:0];
  }
  uint64_t v6 = [(PUImageRequester *)self currentFullSizeImageDataRequestID];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = [(PUImageRequester *)self mediaProvider];
    [v8 cancelImageRequest:v7];

    [(PUImageRequester *)self setCurrentFullSizeImageDataRequestID:0];
  }
}

- (void)setResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (PUImageRequesterResult *)a3;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    uint64_t v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%@ produced result: %@", buf, 0x16u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(PUImageRequester *)self observers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) imageRequester:self didProduceResult:v5];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_updateResult
{
  uint64_t v9 = objc_alloc_init(_PUImageRequesterResult);
  uint64_t v3 = [(PUImageRequester *)self currentRequestStartDate];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    [(_PUImageRequesterResult *)v9 setTimeIntervalSinceRequest:v6];
  }
  [(PUImageRequester *)self imageTargetSize];
  -[_PUImageRequesterResult setTargetSize:](v9, "setTargetSize:");
  uint64_t v7 = [(PUImageRequester *)self image];
  [(_PUImageRequesterResult *)v9 setImage:v7];

  [(_PUImageRequesterResult *)v9 setImageIsFullQuality:[(PUImageRequester *)self imageIsFullQuality]];
  [(_PUImageRequesterResult *)v9 setGainMapImage:[(PUImageRequester *)self gainMapImage]];
  [(PUImageRequester *)self gainMapValue];
  -[_PUImageRequesterResult setGainMapValue:](v9, "setGainMapValue:");
  uint64_t v8 = [(PUImageRequester *)self imageAsset];
  [(_PUImageRequesterResult *)v9 setAsset:v8];

  [(PUImageRequester *)self setResult:v9];
}

- (void)_update
{
  double v5 = [(PUImageRequester *)self asset];
  [(PUImageRequester *)self targetSize];
  double v8 = v7;
  double v9 = v6;
  if (v7 == *MEMORY[0x1E4F1DB30] && v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(PUImageRequester *)self cancelAllImageRequests];
    goto LABEL_46;
  }
  CGFloat v11 = [(PUImageRequester *)self requestFullSizeImageDataUTTypes];
  if ([v11 count])
  {
    long long v12 = [(PUImageRequester *)self fullSizeImageData];
    if (v12)
    {
      BOOL v13 = 0;
    }
    else
    {
      long long v14 = [(PUImageRequester *)self fullSizeImageURL];
      BOOL v13 = v14 == 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  long long v15 = [(PUImageRequester *)self fullSizeImageData];

  int v16 = [(PUImageRequester *)self currentFullSizeImageDataRequestID];
  if (v16)
  {
    int v17 = 0;
  }
  else
  {
    uint64_t v2 = [(PUImageRequester *)self fullSizeImageData];
    if (v2)
    {
      int v17 = 0;
    }
    else
    {
      uint64_t v49 = [(PUImageRequester *)self fullSizeImageURL];
      if (!v49)
      {
        int v19 = 0;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v3 = (void *)v49;
      int v17 = 1;
    }
  }
  uint64_t v18 = [(PUImageRequester *)self image];
  int v19 = v18 != 0;

  if (v17) {
  if (!v16)
  }
    goto LABEL_19;
LABEL_20:
  BOOL v20 = v15 == 0;
  [(PUImageRequester *)self _lastRequestedImageSize];
  if (v8 > v22 || v9 > v21)
  {
    CGFloat v24 = [(PUImageRequester *)self image];
    [v24 size];
    double v26 = v25;
    double v28 = v27;
    [v24 scale];
    BOOL v30 = v9 > v28 * v29;
    if (v8 > v26 * v29) {
      BOOL v30 = 1;
    }
    if (v24) {
      int v31 = v30;
    }
    else {
      int v31 = 1;
    }
    if ([(PUImageRequester *)self includeGainMap]) {
      BOOL v32 = [(PUImageRequester *)self gainMapImage] == 0;
    }
    else {
      BOOL v32 = 0;
    }
    int v23 = v31 | v32;
  }
  else
  {
    int v23 = 0;
  }
  int v33 = v20 & ~v19;
  BOOL v34 = [(PUImageRequester *)self useLowMemoryMode];
  if (objc_opt_respondsToSelector()) {
    int v35 = [v5 needsDeferredProcessing];
  }
  else {
    int v35 = 1;
  }
  uint64_t v36 = [(PUImageRequester *)self includeGainMap] & v35;
  if ((v33 & v23) == 1)
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v37 setAllowPlaceholder:1];
    objc_msgSend(v37, "setNetworkAccessAllowed:", -[PUImageRequester isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    [v37 setAllowSecondaryDegradedImage:1];
    [v37 setUseLowMemoryMode:v34];
    objc_msgSend(v37, "setDeliveryMode:", -[PUImageRequester requiresFullQualityImage](self, "requiresFullQualityImage"));
    objc_msgSend(v37, "setIncludeHDRGainMap:", -[PUImageRequester includeGainMap](self, "includeGainMap"));
    [v37 setIncludeHDRGainMapInIntermediateImage:v36];
    objc_msgSend(v37, "setPreferHDR:", -[PUImageRequester requestHDR](self, "requestHDR"));
    [(PUImageRequester *)self targetHDRHeadroom];
    objc_msgSend(v37, "setTargetHDRHeadroom:");
    [v37 setDownloadIntent:3];
    objc_msgSend(v37, "setDownloadPriority:", -[PUImageRequester highPriorityRequest](self, "highPriorityRequest") ^ 1);
    uint64_t v63 = 0;
    CGFloat v64 = &v63;
    uint64_t v65 = 0x2020000000;
    int v66 = 0;
    uint64_t v38 = [(PUImageRequester *)self _currentImageRequestID];
    __int16 v39 = [(PUImageRequester *)self mediaProvider];
    [v39 cancelImageRequest:v38];

    [(PUImageRequester *)self _setCurrentImageRequestID:*((unsigned int *)v64 + 6)];
    -[PUImageRequester _setLastRequestedImageSize:](self, "_setLastRequestedImageSize:", v8, v9);
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
    [(PUImageRequester *)self setCurrentRequestStartDate:v40];

    objc_initWeak(&location, self);
    CGFloat v41 = [(PUImageRequester *)self mediaProvider];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __27__PUImageRequester__update__block_invoke;
    v58[3] = &unk_1E5F259B0;
    objc_copyWeak(v61, &location);
    v60 = &v63;
    id v59 = v5;
    v61[1] = *(id *)&v8;
    v61[2] = *(id *)&v9;
    int v42 = objc_msgSend(v41, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v59, 1, v37, v58, v8, v9);
    *((_DWORD *)v64 + 6) = v42;

    [(PUImageRequester *)self _setCurrentImageRequestID:*((unsigned int *)v64 + 6)];
    objc_destroyWeak(v61);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v63, 8);
  }
  if (v13)
  {
    id v43 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    objc_msgSend(v43, "setNetworkAccessAllowed:", -[PUImageRequester isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    [v43 setUseLowMemoryMode:v34];
    objc_msgSend(v43, "setIncludeHDRGainMap:", -[PUImageRequester includeGainMap](self, "includeGainMap"));
    [v43 setIncludeHDRGainMapInIntermediateImage:v36];
    [v43 setDownloadIntent:3];
    uint64_t v63 = 0;
    CGFloat v64 = &v63;
    uint64_t v65 = 0x2020000000;
    int v66 = 0;
    CGFloat v44 = +[PUOneUpSettings sharedInstance];
    int v45 = [v44 enableFigPhotoTiledLayer];
    if ([v44 forceURLWithFigPhotoTiledLayer])
    {
      if (v45)
      {
LABEL_40:
        objc_initWeak(&location, self);
        [v43 setDeliveryMode:1];
        double v46 = [(PUImageRequester *)self mediaProvider];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __27__PUImageRequester__update__block_invoke_3;
        v56[3] = &unk_1E5F25A00;
        double v47 = &v57;
        objc_copyWeak(&v57, &location);
        v56[4] = &v63;
        int v48 = [v46 requestImageURLForAsset:v5 options:v43 resultHandler:v56];
LABEL_45:
        *((_DWORD *)v64 + 6) = v48;

        objc_destroyWeak(v47);
        objc_destroyWeak(&location);
        [(PUImageRequester *)self setCurrentFullSizeImageDataRequestID:*((unsigned int *)v64 + 6)];

        _Block_object_dispose(&v63, 8);
        goto LABEL_46;
      }
    }
    else if (v45 {
           && [v44 useURLForLargePhotosWithFigPhotoTiledLayer]
    }
           && (unint64_t)[v5 originalFilesize] > 0x3200000)
    {
      goto LABEL_40;
    }
    objc_initWeak(&location, self);
    double v46 = [(PUImageRequester *)self mediaProvider];
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    double v52 = __27__PUImageRequester__update__block_invoke_5;
    v53 = &unk_1E5F25A50;
    double v47 = &v55;
    objc_copyWeak(&v55, &location);
    v54 = &v63;
    int v48 = [v46 requestImageDataForAsset:v5 options:v43 resultHandler:&v50];
    goto LABEL_45;
  }
LABEL_46:
  [(PUImageRequester *)self _updateResult];
}

void __27__PUImageRequester__update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __27__PUImageRequester__update__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__PUImageRequester__update__block_invoke_4;
  v10[3] = &unk_1E5F259D8;
  id v11 = v6;
  id v7 = v6;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __27__PUImageRequester__update__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __27__PUImageRequester__update__block_invoke_6;
  v16[3] = &unk_1E5F25A28;
  objc_copyWeak(v21, (id *)(a1 + 40));
  uint64_t v12 = *(void *)(a1 + 32);
  id v17 = v9;
  id v18 = v10;
  v21[1] = a4;
  id v19 = v11;
  uint64_t v20 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(v21);
}

void __27__PUImageRequester__update__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleResultOfFullSizeImageDataRequestWithID:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) imageData:*(void *)(a1 + 32) imageURL:0 dataUTI:*(void *)(a1 + 40) orientation:*(void *)(a1 + 72) info:*(void *)(a1 + 48)];
}

void __27__PUImageRequester__update__block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396D0]];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396B8]];
  uint64_t v3 = [v2 integerValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleResultOfFullSizeImageDataRequestWithID:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) imageData:0 imageURL:*(void *)(a1 + 40) dataUTI:v5 orientation:v3 info:*(void *)(a1 + 32)];
}

void __27__PUImageRequester__update__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleResultOfImageRequestWithID:asset:targetSize:image:info:", *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)_invalidateResult
{
}

- (void)setFullSizeImageURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (NSURL *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (self->_fullSizeImageURL != v5)
  {
    objc_storeStrong((id *)&self->_fullSizeImageURL, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(PUImageRequester *)self observers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) imageRequesterDidUpdateFullSizeImageData:self];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setFullSizeImageData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (NSData *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (self->_fullSizeImageData != v5)
  {
    objc_storeStrong((id *)&self->_fullSizeImageData, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(PUImageRequester *)self observers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) imageRequesterDidUpdateFullSizeImageData:self];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setImageIsFullQuality:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (self->_imageIsFullQuality != v3)
  {
    self->_imageIsFullQualitdouble y = v3;
    id v5 = [MEMORY[0x1E4F90618] sharedInstance];
    int v6 = [v5 canShowInternalUI];

    if (v6) {
      [(PUImageRequester *)self _produceDebugImage];
    }
    [(PUImageRequester *)self _invalidateResult];
  }
}

- (void)setGainMapValue:(float)a3
{
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    [(PUImageRequester *)self _invalidateResult];
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  [(PUImageRequester *)self _assertInsideChangesBlock];
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    [(PUImageRequester *)self _invalidateResult];
  }
}

- (void)setError:(id)a3
{
  uint64_t v8 = (NSError *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  id v5 = self->_error;
  if (v5 == v8)
  {
  }
  else
  {
    int v6 = v8;
    char v7 = [(NSError *)v6 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      [(PUImageRequester *)self _invalidateResult];
    }
  }
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(PUImageRequester *)self _invalidateResult];
  }
}

- (void)handlePreloadedImage:(id)a3
{
  id v6 = a3;
  [v6 size];
  uint64_t v4 = [(PUImageRequester *)self image];
  [v4 size];
  if ((PFSizeLargerThanSize() & 1) != 0 || [(PUImageRequester *)self imageIsPlaceholder])
  {
    BOOL v5 = [(PUImageRequester *)self imageIsFullQuality];

    if (!v5)
    {
      [(PUImageRequester *)self setImageIsPlaceholder:0];
      [(PUImageRequester *)self setImage:v6];
    }
  }
  else
  {
  }
}

- (void)setRequestHDR:(BOOL)a3
{
  if (self->_requestHDR != a3)
  {
    self->_requestHDR = a3;
    [(PUImageRequester *)self _invalidateImageRequest];
  }
}

- (void)setIncludeGainMap:(BOOL)a3
{
  if (self->_includeGainMap != a3)
  {
    self->_includeGainMap = a3;
    [(PUImageRequester *)self _invalidateImageRequest];
  }
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  if (self->_networkAccessAllowed != a3)
  {
    self->_networkAccessAllowed = a3;
    [(PUImageRequester *)self cancelAllImageRequests];
  }
}

- (void)setRequestFullSizeImageDataUTTypes:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  BOOL v5 = self->_requestFullSizeImageDataUTTypes;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_requestFullSizeImageDataUTTypes, a3);
      [(PUImageRequester *)self _invalidateImageRequest];
    }
  }
}

- (void)setTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (width != self->_targetSize.width || height != self->_targetSize.height)
  {
    self->_targetSize.double width = width;
    self->_targetSize.double height = height;
    [(PUImageRequester *)self _invalidateImageRequest];
  }
}

- (void)setAsset:(id)a3
{
  BOOL v5 = (PUDisplayAsset *)a3;
  [(PUImageRequester *)self _assertInsideChangesBlock];
  if (self->_asset != v5)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    [(PUImageRequester *)self _invalidateImageRequest];
  }
}

- (void)_assertInsideChangesBlock
{
  if ([(PUImageRequester *)self _changeCount] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUImageRequester.m" lineNumber:162 description:@"not within a change block"];
  }
}

- (void)_didChange
{
  int64_t v3 = [(PUImageRequester *)self _changeCount] - 1;
  [(PUImageRequester *)self _setChangeCount:v3];
  if (!v3)
  {
    [(PUImageRequester *)self updateIfNeeded];
  }
}

- (void)_willChange
{
  int64_t v3 = [(PUImageRequester *)self _changeCount] + 1;
  [(PUImageRequester *)self _setChangeCount:v3];
}

- (void)updateIfNeeded
{
  if ([(PUImageRequester *)self _needsUpdate])
  {
    [(PUImageRequester *)self _setNeedsUpdate:0];
    [(PUImageRequester *)self _update];
  }
}

- (void)_invalidateImageRequest
{
}

- (void)performChanges:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (!v6)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUImageRequester.m", 125, @"Invalid parameter not satisfying: %@", @"changes != NULL" object file lineNumber description];
  }
  [(PUImageRequester *)self _willChange];
  v6[2]();
  [(PUImageRequester *)self _didChange];
}

- (void)unregisterObserver:(id)a3
{
  id v7 = a3;
  BOOL v5 = [(PUImageRequester *)self observers];
  if (([v5 containsObject:v7] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUImageRequester.m", 118, @"Attempting to remove unknown observer: ", v7);
  }
  [v5 removeObject:v7];
}

- (void)registerObserver:(id)a3
{
  id v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUImageRequester.m", 110, @"observer does not conform to PUImageRequesterObserver: %@", v7 object file lineNumber description];
  }
  BOOL v5 = [(PUImageRequester *)self observers];
  [v5 addObject:v7];
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PUImageRequester;
  [(PUImageRequester *)&v3 dealloc];
}

- (PUImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4 requiresFullQualityImage:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUImageRequester;
  long long v12 = [(PUImageRequester *)&v20 init];
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        observers = v12->_observers;
        v12->_observers = (NSHashTable *)v13;

        objc_storeStrong((id *)&v12->_mediaProvider, a3);
        objc_storeStrong((id *)&v12->_asset, a4);
        *(_WORD *)&v12->_useLowMemoryMode = 256;
        v12->_requiresFullQualityImage = a5;
        *(void *)&v12->_currentFullSizeImageDataRequestID = 0;
        uint64_t v15 = [MEMORY[0x1E4F91248] rateLimitingCoalescerWithRate:2.0];
        fullSizeDataRepeatRequestCoalescer = v12->_fullSizeDataRepeatRequestCoalescer;
        v12->_fullSizeDataRepeatRequestCoalescer = (PXEventCoalescer *)v15;

        [(PXEventCoalescer *)v12->_fullSizeDataRepeatRequestCoalescer registerObserver:v12];
        goto LABEL_5;
      }
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v12, @"PUImageRequester.m", 82, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, v12, @"PUImageRequester.m", 83, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (PUImageRequester)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUImageRequester.m", 76, @"%s is not available as initializer", "-[PUImageRequester init]");

  abort();
}

- (id)imageByAddingWallpaperCropRectDiagnosticsForAsset:(id)a3 sourceImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PFDeviceScreenSize();
  double v8 = v7;
  double v10 = v9;
  [v6 size];
  [v6 size];
  [v5 pixelWidth];
  [v5 pixelHeight];
  uint64_t v49 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized();
  double v46 = v10;
  double v47 = v8;
  objc_msgSend(v5, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v49, v8, v10, v11, v12, v13, v14);
  if (__38__PUImageRequester__produceDebugImage__block_invoke(v15, v16, v17, v18))
  {
    PXRectNormalize();
    PXRectDenormalize();
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v27 = objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper w/ FocusRegion %.3f", v49);
    double v28 = [MEMORY[0x1E4FB1618] systemYellowColor];
    uint64_t v29 = objc_msgSend(v6, "px_debugImageWithStrokeRect:color:text:", v28, v27, v20, v22, v24, v26);

    id v6 = (id)v29;
  }
  uint64_t v48 = 0;
  objc_msgSend(v5, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v48, v47, v46, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  if (__38__PUImageRequester__produceDebugImage__block_invoke(v30, v31, v32, v33))
  {
    PXRectNormalize();
    PXRectDenormalize();
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    int v42 = objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper %.3f", v48);
    id v43 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v44 = objc_msgSend(v6, "px_debugImageWithStrokeRect:color:text:", v43, v42, v35, v37, v39, v41);

    id v6 = (id)v44;
  }

  return v6;
}

@end