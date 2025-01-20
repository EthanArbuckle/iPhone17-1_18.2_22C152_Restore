@interface PXStoryImageAssetResourcePreloadingOperation
+ (id)_resultHandlingQueue;
- (BOOL)isInline;
- (CGSize)targetSize;
- (OS_dispatch_group)loadingGroup;
- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4;
- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 targetSize:(CGSize)a4 mediaProvider:(id)a5 isInline:(BOOL)a6;
- (double)fractionComplete;
- (id)diagnosticDescription;
- (int64_t)imageRequestID;
- (void)_handleImageLoadingResultWithImage:(CGImage *)a3 info:(id)a4;
- (void)cancel;
- (void)px_start;
- (void)setFractionComplete:(double)a3;
- (void)setImageRequestID:(int64_t)a3;
- (void)setLoadingGroup:(id)a3;
@end

@implementation PXStoryImageAssetResourcePreloadingOperation

- (void).cxx_destruct
{
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setFractionComplete:(double)a3
{
  self->_fractionComplete = a3;
}

- (double)fractionComplete
{
  return self->_fractionComplete;
}

- (void)setImageRequestID:(int64_t)a3
{
  self->_imageRequestID = a3;
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (void)setLoadingGroup:(id)a3
{
}

- (OS_dispatch_group)loadingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 312, 1);
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  [(PXAsyncOperation *)&v4 cancel];
  v3 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self mediaProvider];
  objc_msgSend(v3, "cancelImageRequest:", -[PXStoryImageAssetResourcePreloadingOperation imageRequestID](self, "imageRequestID"));
}

- (void)_handleImageLoadingResultWithImage:(CGImage *)a3 info:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F396C8];
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  unint64_t v9 = (unint64_t)a3 | v8;

  v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  int v11 = [v10 BOOLValue];

  v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v13 = [v12 BOOLValue];

  uint64_t v18 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];

  if (!v9)
  {
    v14 = (void *)v18;
    if (v18) {
      int v16 = 1;
    }
    else {
      int v16 = v13;
    }
    if (v16 != 1) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  v14 = (void *)v18;
  int v15 = v11 ^ 1;
  if (v18) {
    int v15 = 1;
  }
  if ((v15 | v13))
  {
LABEL_10:
    BOOL v17 = [(PXAsyncOperation *)self isExecuting];
    v14 = (void *)v18;
    if (v17)
    {
      if ((v13 & 1) == 0) {
        [(PXStoryDisplayAssetResourcePreloadingOperation *)self setError:v18];
      }
      [(PXStoryDisplayAssetResourcePreloadingOperation *)self px_finishIfPossible];
      v14 = (void *)v18;
    }
  }
LABEL_14:
}

- (void)px_start
{
  v23.receiver = self;
  v23.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  [(PXStoryDisplayAssetResourcePreloadingOperation *)&v23 px_start];
  id v3 = objc_alloc_init((Class)off_1E5DA6E70);
  [v3 setNetworkAccessAllowed:1];
  [v3 setAllowSecondaryDegradedImage:0];
  [v3 setLoadingMode:0x10000];
  [v3 setDeliveryMode:1];
  if ([(PXStoryImageAssetResourcePreloadingOperation *)self isInline]) {
    uint64_t v4 = 12;
  }
  else {
    uint64_t v4 = 5;
  }
  [v3 setDownloadIntent:v4];
  v5 = [(id)objc_opt_class() _resultHandlingQueue];
  [v3 setResultHandlerQueue:v5];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke;
  aBlock[3] = &unk_1E5DD1230;
  objc_copyWeak(&v21, &location);
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self progressHandler];
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_2;
    v17[3] = &unk_1E5DD1258;
    objc_copyWeak(&v19, &location);
    id v18 = v7;
    uint64_t v8 = _Block_copy(v17);

    objc_destroyWeak(&v19);
    uint64_t v6 = v8;
  }
  [v3 setProgressHandler:v6];
  unint64_t v9 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self mediaProvider];
  v10 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self displayAsset];
  [(PXStoryImageAssetResourcePreloadingOperation *)self targetSize];
  double v12 = v11;
  double v14 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_3;
  v15[3] = &unk_1E5DD1280;
  objc_copyWeak(&v16, &location);
  -[PXStoryImageAssetResourcePreloadingOperation setImageRequestID:](self, "setImageRequestID:", objc_msgSend(v9, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 1, v3, v15, v12, v14));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFractionComplete:a2];
}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setFractionComplete:a3];

  uint64_t v6 = v8;
  if (a3 != 0.0 || v8 != 0)
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
    uint64_t v6 = v8;
  }
}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleImageLoadingResultWithImage:a2 info:v6];
}

- (id)diagnosticDescription
{
}

- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryImageAssetResourcePreloadingOperation.m", 40, @"%s is not available as initializer", "-[PXStoryImageAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:]");

  abort();
}

- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 targetSize:(CGSize)a4 mediaProvider:(id)a5 isInline:(BOOL)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  CGSize result = [(PXStoryDisplayAssetResourcePreloadingOperation *)&v10 initWithDisplayAssetResource:a3 mediaProvider:a5];
  if (result)
  {
    result->_targetSize.CGFloat width = width;
    result->_targetSize.CGFloat height = height;
    result->_isInline = a6;
  }
  return result;
}

+ (id)_resultHandlingQueue
{
  if (_resultHandlingQueue_onceToken != -1) {
    dispatch_once(&_resultHandlingQueue_onceToken, &__block_literal_global_289291);
  }
  v2 = (void *)_resultHandlingQueue_resultHandlingQueue;
  return v2;
}

void __68__PXStoryImageAssetResourcePreloadingOperation__resultHandlingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("PXStoryImageAssetResourcePreloadingOperation.resultHandlingQueue", v2);
  v1 = (void *)_resultHandlingQueue_resultHandlingQueue;
  _resultHandlingQueue_resultHandlingQueue = (uint64_t)v0;
}

@end