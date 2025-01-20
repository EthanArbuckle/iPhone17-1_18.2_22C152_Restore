@interface _PUWallpaperShuffleMediaProviderImageOperation
- (NSError)error;
- (PUWallpaperShuffleSegmentationLoadingOperation)segmentationLoadingOperation;
- (PXCGImage)resultImage;
- (PXImageRequestDescriptor)requestDescriptor;
- (_PUWallpaperShuffleMediaProviderImageOperation)initWithSegmentationOperation:(id)a3 requestDescriptor:(id)a4 resultHandler:(id)a5;
- (id)resultHandler;
- (void)_handleRenderResponse:(id)a3;
- (void)cancel;
- (void)px_start;
@end

@implementation _PUWallpaperShuffleMediaProviderImageOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resultImage, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingOperation, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_requestDescriptor, 0);
  objc_storeStrong((id *)&self->_renderRequest, 0);
}

- (NSError)error
{
  return self->_error;
}

- (PXCGImage)resultImage
{
  return self->_resultImage;
}

- (PUWallpaperShuffleSegmentationLoadingOperation)segmentationLoadingOperation
{
  return self->_segmentationLoadingOperation;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (PXImageRequestDescriptor)requestDescriptor
{
  return self->_requestDescriptor;
}

- (void)_handleRenderResponse:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v27 = 0;
  v4 = [a3 result:&v27];
  id v5 = v27;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F7A500];
    v8 = [v4 image];
    uint64_t v9 = [v7 newCGImageFromBufferImage:v8];

    if (v9)
    {
      v10 = 0;
    }
    else
    {
      uint64_t v28 = *MEMORY[0x1E4F39698];
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUWallpaperShuffleMediaProviderError" code:2 userInfo:0];
      v29 = v13;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    }
    v14 = (PXCGImage *)[objc_alloc(MEMORY[0x1E4F90020]) initWithCGImage:v9];
    resultImage = self->_resultImage;
    self->_resultImage = v14;
LABEL_10:

    uint64_t v16 = v9;
    goto LABEL_11;
  }
  uint64_t v32 = *MEMORY[0x1E4F39698];
  v11 = (void *)MEMORY[0x1E4F28C58];
  if (v5)
  {
    uint64_t v30 = *MEMORY[0x1E4F28A50];
    id v31 = v5;
    resultImage = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  }
  else
  {
    resultImage = 0;
  }
  v15 = [v11 errorWithDomain:@"PUWallpaperShuffleMediaProviderError" code:2 userInfo:resultImage];
  v33[0] = v15;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  uint64_t v9 = 0;
  uint64_t v16 = 0;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  v17 = [(_PUWallpaperShuffleMediaProviderImageOperation *)self requestDescriptor];
  v18 = [v17 options];
  v19 = [v18 resultHandlerQueue];
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    v21 = MEMORY[0x1E4F14428];
    id v22 = MEMORY[0x1E4F14428];
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___PUWallpaperShuffleMediaProviderImageOperation__handleRenderResponse___block_invoke;
  block[3] = &unk_1E5F2D2C8;
  id v25 = v10;
  uint64_t v26 = v16;
  block[4] = self;
  id v23 = v10;
  dispatch_async(v21, block);
}

- (void)px_start
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (![(_PUWallpaperShuffleMediaProviderImageOperation *)self isCancelled])
  {
    v4 = [(_PUWallpaperShuffleMediaProviderImageOperation *)self segmentationLoadingOperation];
    if (([v4 isFinished] & 1) == 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"PUWallpaperShuffleMediaProvider.m", 172, @"Invalid parameter not satisfying: %@", @"segmentationOperation.isFinished" object file lineNumber description];
    }
    id v5 = [v4 segmentationItem];
    v6 = v5;
    if (!v5)
    {
      uint64_t v13 = [v4 error];
      v7 = (void *)v13;
      v14 = (void *)MEMORY[0x1E4F28C58];
      if (v13)
      {
        uint64_t v25 = *MEMORY[0x1E4F28A50];
        v26[0] = v13;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      }
      else
      {
        v15 = 0;
      }
      v19 = [v14 errorWithDomain:@"PUWallpaperShuffleMediaProviderError" code:1 userInfo:v15];
      error = self->_error;
      self->_error = v19;

      if (v7) {
      [(PXAsyncOperation *)self px_finishIfPossible];
      }
      goto LABEL_20;
    }
    v7 = [v5 composition];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A3B8]) initWithComposition:v7];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
    [v8 setPriority:v9];

    objc_storeStrong((id *)&self->_renderRequest, v8);
    v10 = [(_PUWallpaperShuffleMediaProviderImageOperation *)self requestDescriptor];
    uint64_t v11 = [v10 contentMode];

    if (v11)
    {
      if (v11 != 1)
      {
LABEL_15:
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __58___PUWallpaperShuffleMediaProviderImageOperation_px_start__block_invoke;
        v22[3] = &unk_1E5F2B9A8;
        objc_copyWeak(&v23, &location);
        [v8 submit:v22];
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

LABEL_20:
        return;
      }
      v12 = (Class *)0x1E4F7A458;
    }
    else
    {
      v12 = (Class *)0x1E4F7A468;
    }
    id v16 = objc_alloc(*v12);
    v17 = [(_PUWallpaperShuffleMediaProviderImageOperation *)self requestDescriptor];
    [v17 targetSize];
    v18 = objc_msgSend(v16, "initWithTargetSize:");
    [v8 setScalePolicy:v18];

    goto LABEL_15;
  }
  [(PXAsyncOperation *)self px_finishIfPossible];
}

- (void)cancel
{
  v3 = [(NUBufferRenderRequest *)self->_renderRequest renderContext];
  [v3 cancelAllRequests];

  v4.receiver = self;
  v4.super_class = (Class)_PUWallpaperShuffleMediaProviderImageOperation;
  [(PXAsyncOperation *)&v4 cancel];
}

- (_PUWallpaperShuffleMediaProviderImageOperation)initWithSegmentationOperation:(id)a3 requestDescriptor:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PUWallpaperShuffleMediaProviderImageOperation;
  v12 = [(PXAsyncOperation *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestDescriptor, a4);
    uint64_t v14 = [v11 copy];
    id resultHandler = v13->_resultHandler;
    v13->_id resultHandler = (id)v14;

    objc_storeStrong((id *)&v13->_segmentationLoadingOperation, a3);
    [(_PUWallpaperShuffleMediaProviderImageOperation *)v13 addDependency:v13->_segmentationLoadingOperation];
  }

  return v13;
}

@end