@interface PISliderNetBaseJob
- (BOOL)complete:(id *)a3;
- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (id)scalePolicy;
@end

@implementation PISliderNetBaseJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
}

- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)complete:(id *)a3
{
  renderTask = self->_renderTask;
  id v24 = 0;
  v6 = [(CIRenderTask *)renderTask waitUntilCompletedAndReturnError:&v24];
  id v7 = v24;
  if (v6)
  {
    v8 = self->_renderTask;
    self->_renderTask = 0;

    v9 = [(NURenderJob *)self request];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    storage = self->_storage;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __31__PISliderNetBaseJob_complete___block_invoke;
    v15[3] = &unk_1E5D7F9E8;
    id v11 = v9;
    id v16 = v11;
    v17 = self;
    v18 = &v20;
    v19 = a3;
    [(NUPurgeableStorage *)storage useAsCVPixelBufferWithBlock:v15];
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F7A438];
    id v11 = [(NURenderJob *)self request];
    [v13 errorWithCode:1 reason:@"Failed to render thumbnail" object:v11 underlyingError:v7];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __31__PISliderNetBaseJob_complete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 CVPixelBuffer];
  v4 = [*(id *)(a1 + 32) colorSpace];
  [v4 CGColorSpace];
  CVImageBufferSetColorSpace();

  uint64_t result = [*(id *)(a1 + 40) networkProcessingWithResultingPixelBuffer:v3 error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)render:(id *)a3
{
  v5 = [(NURenderJob *)self renderNode];
  v6 = [v5 outputImage:a3];

  id v7 = [MEMORY[0x1E4F7A5D8] BGRA8];
  v8 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  v9 = [MEMORY[0x1E4F7A448] sharedFactory];
  v10 = [v9 surfaceStoragePool];

  uint64_t v11 = [(NURenderJob *)self imageSize];
  v13 = (NUPurgeableStorage *)objc_msgSend(v10, "newStorageWithSize:format:", v11, v12, v7);
  storage = self->_storage;
  self->_storage = v13;

  v28[0] = 0;
  v28[1] = 0;
  v28[2] = [(NURenderJob *)self imageSize];
  v28[3] = v15;
  id v16 = [MEMORY[0x1E4F7A5F8] regionWithRect:v28];
  v17 = self->_storage;
  uint64_t v18 = [(NURenderJob *)self imageSize];
  id v27 = 0;
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v6, v17, v8, v16, v18, v19, &v27);
  uint64_t v20 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  id v21 = v27;
  renderTask = self->_renderTask;
  self->_renderTask = v20;

  char v23 = self->_renderTask;
  if (!v23)
  {
    id v24 = (void *)MEMORY[0x1E4F7A438];
    v25 = [(NURenderJob *)self request];
    *a3 = [v24 errorWithCode:1 reason:@"Failed to create CIRenderTask for thumbnail render" object:v25 underlyingError:*a3];
  }
  return v23 != 0;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NURenderJob *)self request];
  uint64_t v3 = [v2 scalePolicy];

  return v3;
}

@end