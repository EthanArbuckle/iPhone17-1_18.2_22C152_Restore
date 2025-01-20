@interface NULivePhotoRenderRequest
- (NUColorSpace)colorSpace;
- (NULivePhotoRenderRequest)initWithComposition:(id)a3;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)livePhotoRenderResultFromPhotoResponse:(id)a3 videoResponse:(id)a4 propertiesResponse:(id)a5 error:(id *)a6;
- (void)setColorSpace:(id)a3;
- (void)setScalePolicy:(id)a3;
- (void)submit:(id)a3;
@end

@implementation NULivePhotoRenderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);

  objc_storeStrong((id *)&self->_stillBufferRenderContext, 0);
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (id)livePhotoRenderResultFromPhotoResponse:(id)a3 videoResponse:(id)a4 propertiesResponse:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!a6)
  {
    v20 = NUAssertLogger_29103();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_29103();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoRenderRequest livePhotoRenderResultFromPhotoResponse:videoResponse:propertiesResponse:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/LivePhoto/NULivePhotoRenderRequest.m", 156, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v12 = v11;
  v13 = [v9 result:a6];
  if (v13)
  {
    v14 = [v10 result:a6];
    if (v14)
    {
      v15 = [v12 result:a6];
      if (v15)
      {
        v16 = [v14 avAsset];
        v36 = [v14 videoComposition];
        memset(buf, 0, sizeof(buf));
        v17 = [v15 properties];
        v18 = v17;
        if (v17) {
          [v17 livePhotoKeyFrameTime];
        }
        else {
          memset(buf, 0, sizeof(buf));
        }

        *a6 = +[NUError errorWithCode:3 reason:@"Failed to extract time for live photo" object:v16];
      }
    }
  }

  return 0;
}

- (void)submit:(id)a3
{
  id v28 = a3;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("NULivePhotoRenderRequest", v4);

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__29192;
  v41[4] = __Block_byref_object_dispose__29193;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__29192;
  v39[4] = __Block_byref_object_dispose__29193;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__29192;
  v37[4] = __Block_byref_object_dispose__29193;
  id v38 = 0;
  +[NURenderTransaction begin];
  v6 = [(NURenderRequest *)[NUBufferRenderRequest alloc] initWithRequest:self];
  v7 = NSString;
  v8 = [(NURenderRequest *)self name];
  id v9 = [v7 stringWithFormat:@"%@-stillFrame", v8];
  [(NURenderRequest *)v6 setName:v9];

  [(NURenderRequest *)v6 setRenderContext:self->_stillBufferRenderContext];
  id v10 = [(NULivePhotoRenderRequest *)self scalePolicy];
  [(NUImageRenderRequest *)v6 setScalePolicy:v10];

  id v11 = [(NULivePhotoRenderRequest *)self colorSpace];
  [(NUImageRenderRequest *)v6 setColorSpace:v11];

  [(NURenderRequest *)v6 setResponseQueue:v5];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__NULivePhotoRenderRequest_submit___block_invoke;
  v36[3] = &unk_1E5D95F08;
  v36[4] = v39;
  [(NUBufferRenderRequest *)v6 submit:v36];
  v12 = [(NURenderRequest *)[NUVideoRenderRequest alloc] initWithRequest:self];
  v13 = NSString;
  v14 = [(NURenderRequest *)self name];
  v15 = [v13 stringWithFormat:@"%@-NUVideoRenderRequest", v14];
  [(NURenderRequest *)v12 setName:v15];

  v16 = [NUPriority alloc];
  v17 = [(NURenderRequest *)self priority];
  uint64_t v18 = [v17 level];
  v19 = [(NURenderRequest *)self priority];
  [v19 order];
  v21 = [(NUPriority *)v16 initWithLevel:v18 order:v20 + 0.00999999978];
  [(NURenderRequest *)v12 setPriority:v21];

  [(NURenderRequest *)v12 setResponseQueue:v5];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_2;
  v35[3] = &unk_1E5D95F08;
  v35[4] = v41;
  [(NUVideoRenderRequest *)v12 submit:v35];
  v22 = [(NURenderRequest *)[NUVideoPropertiesRequest alloc] initWithRequest:self];
  v23 = [(NURenderRequest *)v12 priority];
  [(NURenderRequest *)v22 setPriority:v23];

  [(NURenderRequest *)v22 setResponseQueue:v5];
  BOOL v24 = NSString;
  v25 = [(NURenderRequest *)self name];
  v26 = [v24 stringWithFormat:@"%@-videoProperties", v25];
  [(NURenderRequest *)v22 setName:v26];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_3;
  v34[3] = &unk_1E5D95F08;
  v34[4] = v37;
  [(NUVideoPropertiesRequest *)v22 submit:v34];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_4;
  v29[3] = &unk_1E5D95F58;
  uint64_t v32 = v41;
  uint64_t v33 = v37;
  v31 = v39;
  v29[4] = self;
  id v27 = v28;
  id v30 = v27;
  +[NURenderTransaction commitAndNotifyOnQueue:v5 withBlock:v29];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
}

void __35__NULivePhotoRenderRequest_submit___block_invoke(uint64_t a1, void *a2)
{
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_2(uint64_t a1, void *a2)
{
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_3(uint64_t a1, void *a2)
{
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    id v14 = 0;
    v3 = objc_msgSend(v2, "livePhotoRenderResultFromPhotoResponse:videoResponse:propertiesResponse:error:");
    id v4 = v14;
    if (v3)
    {
      dispatch_queue_t v5 = [[NUResponse alloc] initWithResult:v3];
    }
    else
    {
      v6 = (void *)[*(id *)(a1 + 32) copy];
      v7 = +[NUError errorWithCode:1 reason:@"Failed to render live photo" object:v6 underlyingError:v4];

      dispatch_queue_t v5 = [[NUResponse alloc] initWithError:v7];
    }
    v8 = [*(id *)(a1 + 32) responseQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_5;
    block[3] = &unk_1E5D95F30;
    id v9 = *(id *)(a1 + 40);
    v12 = v5;
    id v13 = v9;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __35__NULivePhotoRenderRequest_submit___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NULivePhotoRenderRequest;
  id v4 = [(NURenderRequest *)&v6 copyWithZone:a3];
  [v4 setColorSpace:self->_colorSpace];
  [v4 setScalePolicy:self->_scalePolicy];
  objc_storeStrong(v4 + 19, self->_stillBufferRenderContext);
  return v4;
}

- (NULivePhotoRenderRequest)initWithComposition:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NULivePhotoRenderRequest;
  v3 = [(NURenderRequest *)&v11 initWithComposition:a3];
  uint64_t v4 = +[NUColorSpace sRGBColorSpace];
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  uint64_t v6 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  v8 = [[NURenderContext alloc] initWithPurpose:1];
  stillBufferRenderContext = v3->_stillBufferRenderContext;
  v3->_stillBufferRenderContext = v8;

  return v3;
}

@end