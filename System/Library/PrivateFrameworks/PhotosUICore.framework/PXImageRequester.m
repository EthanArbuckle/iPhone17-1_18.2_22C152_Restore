@interface PXImageRequester
+ (id)defaultOptions;
- (BOOL)_needsUpdate;
- (BOOL)hasFullQuality;
- (BOOL)isInCloud;
- (BOOL)preferHDR;
- (CGRect)contentsRect;
- (CGRect)cropRect;
- (CGRect)desiredContentsRect;
- (CGSize)_targetSize;
- (CGSize)contentSize;
- (CGSize)maximumRequestSize;
- (CGSize)viewportSize;
- (NSError)loadingError;
- (NSString)description;
- (PXDisplayAsset)_currentImageSourceAsset;
- (PXDisplayAsset)asset;
- (PXImageRequest)_currentRequest;
- (PXImageRequester)init;
- (PXImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4;
- (PXUIImageProvider)mediaProvider;
- (UIImage)image;
- (UIImage)opportunisticImage;
- (double)loadingProgress;
- (double)scale;
- (double)targetHDRHeadroom;
- (int64_t)downloadIntent;
- (void)_cancelRequests;
- (void)_handleProgressForImageRequest:(id)a3 progress:(double)a4;
- (void)_handleResultOfImageRequest:(id)a3 image:(id)a4 info:(id)a5;
- (void)_invalidateImageRequest;
- (void)_invalidateIsInCloud;
- (void)_invalidateTargetSize;
- (void)_setCurrentImageSourceAsset:(id)a3;
- (void)_setCurrentRequest:(id)a3;
- (void)_setHasFullQuality:(BOOL)a3;
- (void)_setImage:(id)a3;
- (void)_setIsInCloud:(BOOL)a3;
- (void)_setLoadingProgress:(double)a3;
- (void)_setOpportunisticImage:(id)a3;
- (void)_setTargetSize:(CGSize)a3;
- (void)_updateIfNeeded;
- (void)_updateImageRequestIfNeeded;
- (void)_updateIsInCloudIfNeeded;
- (void)_updateTargetSizeIfNeeded;
- (void)dealloc;
- (void)didPerformChanges;
- (void)handlePreloadedImage:(id)a3;
- (void)handlePreloadedImageRequester:(id)a3;
- (void)performChanges:(id)a3;
- (void)setAsset:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDesiredContentsRect:(CGRect)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setLoadingError:(id)a3;
- (void)setMaximumRequestSize:(CGSize)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPreferHDR:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setTargetHDRHeadroom:(double)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation PXImageRequester

uint64_t __60__PXImageRequester__handleProgressForImageRequest_progress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLoadingProgress:*(double *)(a1 + 40)];
}

- (void)_setLoadingProgress:(double)a3
{
  if (self->_loadingProgress != a3)
  {
    self->_loadingProgress = a3;
    [(PXImageRequester *)self signalChange:4096];
  }
}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleResultOfImageRequest:v9 image:v8 info:v7];
}

- (void)_handleResultOfImageRequest:(id)a3 image:(id)a4 info:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PXImageRequester *)self asset];
  v10 = [v7 asset];
  id v11 = v9;
  id v12 = v10;
  if (v11 == v12)
  {

LABEL_9:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PXImageRequester__handleResultOfImageRequest_image_info___block_invoke;
    v15[3] = &unk_1E5DD11E8;
    id v16 = v7;
    v17 = self;
    id v18 = v8;
    [(PXImageRequester *)self performChanges:v15];

    goto LABEL_11;
  }
  v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_11;
  }
  uint64_t v14 = [v11 isContentEqualTo:v12];
  if (!v14) {
    uint64_t v14 = [v13 isContentEqualTo:v11];
  }

  if (v14 == 2) {
    goto LABEL_9;
  }
LABEL_11:
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  [(PXImageRequester *)&v3 performChanges:a3];
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleProgressForImageRequest:v2 progress:*(double *)(a1 + 48)];
}

- (void)_handleProgressForImageRequest:(id)a3 progress:(double)a4
{
  id v6 = a3;
  id v7 = [(PXImageRequester *)self _currentRequest];

  if (v7 == v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PXImageRequester__handleProgressForImageRequest_progress___block_invoke;
    v8[3] = &unk_1E5DCBDA8;
    v8[4] = self;
    *(double *)&v8[5] = a4;
    [(PXImageRequester *)self performChanges:v8];
  }
}

void __59__PXImageRequester__handleResultOfImageRequest_image_info___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) gotFullQualityImage]) {
    goto LABEL_13;
  }
  uint64_t v2 = [*(id *)(a1 + 40) opportunisticImage];
  if (!v2)
  {
LABEL_12:
    [*(id *)(a1 + 40) _setOpportunisticImage:*(void *)(a1 + 48)];
    goto LABEL_13;
  }
  objc_super v3 = (void *)v2;
  v4 = [*(id *)(a1 + 32) asset];
  v5 = [*(id *)(a1 + 40) _currentImageSourceAsset];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_13;
  }
  id v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_12;
  }
  uint64_t v9 = [v6 isContentEqualTo:v7];
  if (!v9) {
    uint64_t v9 = [v8 isContentEqualTo:v6];
  }

  if (v9 != 2) {
    goto LABEL_12;
  }
LABEL_13:
  v10 = *(void **)(a1 + 48);
  if (!v10) {
    goto LABEL_31;
  }
  id v11 = [*(id *)(a1 + 40) image];
  if (objc_msgSend(v10, "px_isLargerThan:", v11)) {
    goto LABEL_28;
  }
  id v12 = [*(id *)(a1 + 32) asset];
  v13 = [*(id *)(a1 + 40) _currentImageSourceAsset];
  id v14 = v12;
  id v15 = v13;
  id v16 = v15;
  if (v14 == v15)
  {
  }
  else
  {
    if (!v14 || !v15)
    {

LABEL_27:
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v17 = [v14 isContentEqualTo:v15];
    if (!v17) {
      uint64_t v17 = [v16 isContentEqualTo:v14];
    }

    if (v17 != 2) {
      goto LABEL_27;
    }
  }
  if (([*(id *)(a1 + 32) gotFullQualityImage] & 1) == 0)
  {

    goto LABEL_30;
  }
  char v18 = [*(id *)(a1 + 40) hasFullQuality];

  if ((v18 & 1) == 0)
  {
LABEL_29:
    [*(id *)(a1 + 40) _setImage:*(void *)(a1 + 48)];
    v19 = *(void **)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) asset];
    [v19 _setCurrentImageSourceAsset:v11];
LABEL_30:
  }
LABEL_31:
  v20 = *(void **)(a1 + 32);
  v21 = [*(id *)(a1 + 40) _currentRequest];

  if (v20 == v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setHasFullQuality:", objc_msgSend(*(id *)(a1 + 32), "gotFullQualityImage"));
    v22 = [*(id *)(a1 + 32) error];
    [*(id *)(a1 + 40) setLoadingError:v22];

    v23 = *(void **)(a1 + 40);
    [v23 _invalidateIsInCloud];
  }
}

- (PXImageRequest)_currentRequest
{
  return self->__currentRequest;
}

- (void)setLoadingError:(id)a3
{
  id v7 = (NSError *)a3;
  v5 = self->_loadingError;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSError *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_loadingError, a3);
      [(PXImageRequester *)self signalChange:0x2000];
    }
  }
}

- (UIImage)opportunisticImage
{
  return self->_opportunisticImage;
}

- (void)_setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(PXImageRequester *)self signalChange:4];
    [(PXImageRequester *)self _invalidateIsInCloud];
    v5 = v6;
  }
}

- (void)_invalidateIsInCloud
{
  self->_needsUpdateFlags.isInCloud = 1;
}

- (void)_setHasFullQuality:(BOOL)a3
{
  if (self->_hasFullQuality != a3)
  {
    self->_hasFullQuality = a3;
    if (a3)
    {
      v4 = +[PXPhotosDetailsSettings sharedInstance];
      int v5 = [v4 showFacesAreaRect];

      if (v5)
      {
        char v6 = [(PXImageRequester *)self asset];
        id v7 = [(PXImageRequester *)self image];
        id v8 = PXDebugImageWithFaceRect(v6, v7);

        [(PXImageRequester *)self _setImage:v8];
      }
    }
    [(PXImageRequester *)self signalChange:8];
  }
}

- (void)_setCurrentImageSourceAsset:(id)a3
{
}

- (PXDisplayAsset)_currentImageSourceAsset
{
  return self->__currentImageSourceAsset;
}

- (BOOL)hasFullQuality
{
  return self->_hasFullQuality;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  [(PXImageRequester *)&v3 didPerformChanges];
  [(PXImageRequester *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  if ([(PXImageRequester *)self _needsUpdate])
  {
    [(PXImageRequester *)self _updateTargetSizeIfNeeded];
    [(PXImageRequester *)self _updateImageRequestIfNeeded];
    [(PXImageRequester *)self _updateIsInCloudIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.targetSize || self->_needsUpdateFlags.imageRequest || self->_needsUpdateFlags.isInCloud;
}

- (void)_updateTargetSizeIfNeeded
{
  if (self->_needsUpdateFlags.targetSize)
  {
    self->_needsUpdateFlags.targetSize = 0;
    [(PXImageRequester *)self contentSize];
    [(PXImageRequester *)self scale];
    PXSizeScale();
  }
}

- (void)_updateIsInCloudIfNeeded
{
  if (self->_needsUpdateFlags.isInCloud)
  {
    self->_needsUpdateFlags.isInCloud = 0;
    objc_super v3 = [(PXImageRequester *)self image];

    BOOL v4 = 0;
    if (!v3)
    {
      int v5 = [(PXImageRequester *)self _currentRequest];
      uint64_t v6 = [v5 resultIsInCloud];

      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [(PXImageRequester *)self asset];
        BOOL v4 = PXDisplayAssetIsInCloud(v7);
      }
    }
    [(PXImageRequester *)self _setIsInCloud:v4];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)_updateImageRequestIfNeeded
{
  if (self->_needsUpdateFlags.imageRequest)
  {
    self->_needsUpdateFlags.imageRequest = 0;
    objc_super v3 = [(PXImageRequester *)self _currentRequest];
    [(PXImageRequester *)self _targetSize];
    double v5 = v4;
    double v7 = v6;
    id v8 = [(PXImageRequester *)self asset];
    v36 = [(PXImageRequester *)self mediaProvider];
    uint64_t v9 = [(PXImageRequester *)self image];
    uint64_t v10 = objc_msgSend(v9, "px_pixelSize");
    int v13 = MEMORY[0x1AD10BB40](v10, v5, v7, v11, v12);

    if (v3)
    {
      uint64_t v14 = [v3 targetSize];
      HIDWORD(v34) = MEMORY[0x1AD10BB40](v14, v5, v7, v15, v16);
      if ([v3 isCanceled])
      {
        LODWORD(v34) = 0;
      }
      else
      {
        uint64_t v17 = [v3 error];
        LODWORD(v34) = v17 == 0;
      }
      objc_msgSend(v3, "asset", v34);
    }
    else
    {
      objc_msgSend(0, "asset", 0x100000000);
    char v18 = };
    if (v18)
    {
      id v19 = v8;
      id v20 = v18;
      if (v19 == v20)
      {
        BOOL v22 = 1;
      }
      else if (v19)
      {
        uint64_t v21 = [v19 isContentEqualTo:v20];
        if (!v21) {
          uint64_t v21 = [v20 isContentEqualTo:v19];
        }
        BOOL v22 = v21 == 2;
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
    v23 = v8;
    if (v3)
    {
      v24 = [v3 options];
      [v24 normalizedCropRect];
      v37.origin.x = v25;
      v37.origin.y = v26;
      v37.size.width = v27;
      v37.size.height = v28;
      BOOL v29 = CGRectEqualToRect(self->_cropRect, v37);
    }
    else
    {
      BOOL v29 = 0;
    }
    int v30 = [(PXImageRequester *)self preferHDR];
    v31 = [v3 options];
    int v32 = [v31 preferHDR];

    if (v30 != v32) {
      goto LABEL_22;
    }
    int v33 = v22 && v29;
    if (v13)
    {
      if ((HIDWORD(v35) | v35 ^ 1) & 1) != 0 || ((v33 ^ 1))
      {
LABEL_22:
        [v3 cancel];
        if (v5 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
          PXSizeIsNull();
        }
      }
    }
    else if ((v33 & 1) == 0)
    {
      goto LABEL_22;
    }
  }
}

- (void)_setIsInCloud:(BOOL)a3
{
  if (self->_isInCloud != a3)
  {
    self->_isInCloud = a3;
    [(PXImageRequester *)self signalChange:16];
  }
}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentRequest, 0);
  objc_storeStrong((id *)&self->__currentImageSourceAsset, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_opportunisticImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (CGSize)_targetSize
{
  double width = self->__targetSize.width;
  double height = self->__targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setCurrentRequest:(id)a3
{
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)desiredContentsRect
{
  double x = self->_desiredContentsRect.origin.x;
  double y = self->_desiredContentsRect.origin.y;
  double width = self->_desiredContentsRect.size.width;
  double height = self->_desiredContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)maximumRequestSize
{
  double width = self->_maximumRequestSize.width;
  double height = self->_maximumRequestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)_cancelRequests
{
  id v2 = [(PXImageRequester *)self _currentRequest];
  [v2 cancel];
}

- (void)_setOpportunisticImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_opportunisticImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_opportunisticImage, a3);
    [(PXImageRequester *)self signalChange:2048];
    double v5 = v6;
  }
}

- (void)_setTargetSize:(CGSize)a3
{
  if (self->__targetSize.width != a3.width || self->__targetSize.height != a3.height)
  {
    self->__targetSize = a3;
    [(PXImageRequester *)self _invalidateImageRequest];
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)PXImageRequester;
  double v4 = [(PXImageRequester *)&v17 description];
  double v5 = [(PXImageRequester *)self asset];
  [(PXImageRequester *)self contentSize];
  double v6 = NSStringFromCGSize(v19);
  [(PXImageRequester *)self scale];
  uint64_t v8 = v7;
  [(PXImageRequester *)self maximumRequestSize];
  id v9 = NSStringFromCGSize(v20);
  id v10 = [(PXImageRequester *)self image];
  BOOL v11 = [(PXImageRequester *)self hasFullQuality];
  double v12 = @"NO";
  if (v11) {
    double v12 = @"YES";
  }
  int v13 = v12;
  uint64_t v14 = [(PXImageRequester *)self _currentRequest];
  double v15 = [v3 stringWithFormat:@"<%@ asset:%p contentSize:%@ scale:%f maxSize:%@ image:%@ hasFullQuality:%@ currentRequest:%@>", v4, v5, v6, v8, v9, v10, v13, v14];

  return (NSString *)v15;
}

- (void)handlePreloadedImageRequester:(id)a3
{
  double v4 = [a3 image];
  if (v4)
  {
    double v5 = v4;
    [(PXImageRequester *)self handlePreloadedImage:v4];
    double v4 = v5;
  }
}

- (void)handlePreloadedImage:(id)a3
{
  id v7 = a3;
  double v4 = [(PXImageRequester *)self image];
  int v5 = objc_msgSend(v7, "px_isLargerThan:", v4);

  if (v5)
  {
    [(PXImageRequester *)self _setImage:v7];
    double v6 = [(PXImageRequester *)self asset];
    [(PXImageRequester *)self _setCurrentImageSourceAsset:v6];
  }
}

- (void)setDownloadIntent:(int64_t)a3
{
  if (self->_downloadIntent != a3)
  {
    self->_downloadIntent = a3;
    [(PXImageRequester *)self _invalidateImageRequest];
    [(PXImageRequester *)self signalChange:0x4000];
  }
}

- (void)setViewportSize:(CGSize)a3
{
  if (self->_viewportSize.width != a3.width || self->_viewportSize.height != a3.height)
  {
    self->_viewportSize = a3;
    [(PXImageRequester *)self signalChange:1024];
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.CGFloat x = x;
    p_contentsRect->origin.CGFloat y = y;
    p_contentsRect->size.CGFloat width = width;
    p_contentsRect->size.CGFloat height = height;
    [(PXImageRequester *)self signalChange:128];
  }
}

- (void)setDesiredContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_desiredContentsRect = &self->_desiredContentsRect;
  if (!CGRectEqualToRect(self->_desiredContentsRect, a3))
  {
    p_desiredContentsRect->origin.double x = x;
    p_desiredContentsRect->origin.double y = y;
    p_desiredContentsRect->size.double width = width;
    p_desiredContentsRect->size.double height = height;
    -[PXImageRequester setContentsRect:](self, "setContentsRect:", x, y, width, height);
  }
}

- (void)setMaximumRequestSize:(CGSize)a3
{
  if (self->_maximumRequestSize.width != a3.width || self->_maximumRequestSize.height != a3.height)
  {
    self->_maximumRequestSize = a3;
    [(PXImageRequester *)self _invalidateTargetSize];
    [(PXImageRequester *)self signalChange:512];
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(PXImageRequester *)self _invalidateTargetSize];
    [(PXImageRequester *)self signalChange:64];
  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(self->_cropRect, a3))
  {
    p_cropRect->origin.CGFloat x = x;
    p_cropRect->origin.CGFloat y = y;
    p_cropRect->size.CGFloat width = width;
    p_cropRect->size.CGFloat height = height;
    [(PXImageRequester *)self _invalidateImageRequest];
    [(PXImageRequester *)self signalChange:256];
  }
}

- (void)setTargetHDRHeadroom:(double)a3
{
  if (self->_targetHDRHeadroom != a3)
  {
    self->_targetHDRHeadroom = a3;
    [(PXImageRequester *)self _invalidateImageRequest];
  }
}

- (void)setPreferHDR:(BOOL)a3
{
  if (self->_preferHDR != a3)
  {
    self->_preferHDR = a3;
    [(PXImageRequester *)self _invalidateImageRequest];
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    [(PXImageRequester *)self _invalidateTargetSize];
    [(PXImageRequester *)self signalChange:32];
  }
}

- (void)setAsset:(id)a3
{
  int v5 = (PXDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    double v12 = v5;
    id v7 = asset;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXImageRequester *)self signalChange:1];
    uint64_t v8 = v12;
    id v9 = v7;
    id v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = [(PXDisplayAsset *)v8 isContentEqualTo:v9];
      if (!v11) {
        uint64_t v11 = [(PXDisplayAsset *)v10 isContentEqualTo:v8];
      }

      if (v11 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [(PXImageRequester *)self _cancelRequests];
    [(PXImageRequester *)self _invalidateImageRequest];
LABEL_10:
    [(PXImageRequester *)self _invalidateIsInCloud];

    int v5 = v12;
  }
}

- (void)setMediaProvider:(id)a3
{
  int v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXImageRequester *)self _invalidateImageRequest];
    int v5 = v6;
  }
}

- (void)_invalidateImageRequest
{
  self->_needsUpdateFlags.imageRequest = 1;
}

- (void)_invalidateTargetSize
{
  self->_needsUpdateFlags.targetSize = 1;
}

- (void)dealloc
{
  [(PXImageRequester *)self _cancelRequests];
  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  [(PXImageRequester *)&v3 dealloc];
}

- (PXImageRequester)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PXImageRequester.m", 107, @"init is unavailable, use designated initializer" object file lineNumber description];

  abort();
}

- (PXImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXImageRequester;
  id v9 = [(PXImageRequester *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    v10->_scale = v12;

    CGSize v13 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
    v10->_contentsRect.origin = *(CGPoint *)off_1E5DAB010;
    v10->_contentsRect.size = v13;
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v10->_cropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v10->_cropRect.size = v14;
    v10->_viewportSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }

  return v10;
}

+ (id)defaultOptions
{
  if (defaultOptions_onceToken != -1) {
    dispatch_once(&defaultOptions_onceToken, &__block_literal_global_252952);
  }
  id v2 = (void *)defaultOptions_options;
  return v2;
}

uint64_t __34__PXImageRequester_defaultOptions__block_invoke()
{
  id v0 = objc_alloc_init((Class)off_1E5DA6E70);
  v1 = (void *)defaultOptions_options;
  defaultOptions_options = (uint64_t)v0;

  [(id)defaultOptions_options setNetworkAccessAllowed:1];
  id v2 = (void *)defaultOptions_options;
  return [v2 setAllowSecondaryDegradedImage:1];
}

@end