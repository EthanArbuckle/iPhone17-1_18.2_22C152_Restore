@interface NUAuxiliaryImageCacheNode
- (BOOL)sourceSupportsAuxiliaryImage;
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (NUAuxiliaryImageCacheNode)initWithInput:(id)a3 auxiliaryImageType:(int64_t)a4;
- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)persistentURL;
- (int64_t)auxiliaryImageType;
- (int64_t)subsampleFactorForScale:(id)a3;
- (void)resolveSourceWithPixelBuffer:(__CVBuffer *)a3;
@end

@implementation NUAuxiliaryImageCacheNode

- (void)resolveSourceWithPixelBuffer:(__CVBuffer *)a3
{
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:a3];
  v4 = [(NUAuxiliaryImageCacheNode *)self persistentURL];
  v5 = [v4 absoluteString];

  v6 = [[NUCISourceNode alloc] initWithImage:v7 identifier:v5 orientation:1];
  [(NUCacheNode *)self resolveWithSourceNode:v6 error:0];
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(NUAuxiliaryImageCacheNode *)self auxiliaryImageType];
  if ([(NUAuxiliaryImageCacheNode *)self sourceSupportsAuxiliaryImage])
  {
    id v7 = [(NURenderRequest *)[NUAuxiliaryImageRenderRequest alloc] initWithRequest:v5];
    [(NUAuxiliaryImageRenderRequest *)v7 setAuxiliaryImageType:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v13[3] = &unk_1E5D95DF0;
    v13[4] = self;
    v8 = v13;
  }
  else
  {
    if ((unint64_t)(v6 - 3) >= 2)
    {
      if (v6 != 9)
      {
        id v7 = [(NURenderRequest *)[NUAuxiliaryImageRenderRequest alloc] initWithRequest:v5];
        [(NUAuxiliaryImageRenderRequest *)v7 setAuxiliaryImageType:v6];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_3;
        v11[3] = &unk_1E5D95DF0;
        v11[4] = self;
        v8 = v11;
        goto LABEL_9;
      }
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 1;
    }
    id v7 = [(NURenderRequest *)[NUVisionSegmentationRequest alloc] initWithRequest:v5];
    [(NUAuxiliaryImageRenderRequest *)v7 setSegmentationType:v9];
    [(NUAuxiliaryImageRenderRequest *)v7 setProduceConfidenceMap:0];
    [(NUAuxiliaryImageRenderRequest *)v7 setVisionSegmentationPolicy:3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2;
    v12[3] = &unk_1E5D95DF0;
    v12[4] = self;
    v8 = v12;
  }
LABEL_9:
  [(NURenderRequest *)v7 setCompletionBlock:v8];

  return v7;
}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = 0;
  v3 = [a2 result:&v7];
  id v4 = v7;
  id v5 = *(void **)(a1 + 32);
  if (v3)
  {
    int64_t v6 = [v3 auxiliaryImage];
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "cvPixelBufferRef"));
  }
  else
  {
    [v5 resolveWithSourceNode:0 error:v4];
  }
}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = 0;
  v3 = [a2 result:&v7];
  id v4 = v7;
  id v5 = *(void **)(a1 + 32);
  if (v3)
  {
    int64_t v6 = [v3 matteImageBuffer];
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  }
  else
  {
    [v5 resolveWithSourceNode:0 error:v4];
  }
}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = 0;
  v3 = [a2 result:&v7];
  id v4 = v7;
  id v5 = *(void **)(a1 + 32);
  if (v3)
  {
    int64_t v6 = [v3 auxiliaryImage];
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "cvPixelBufferRef"));
  }
  else
  {
    [v5 resolveWithSourceNode:0 error:v4];
  }
}

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)[a3 mutableCopy];
  uint64_t v9 = [v7 auxiliaryImageType];

  if (v9 == [(NUAuxiliaryImageCacheNode *)self auxiliaryImageType]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"sourceSupportsAuxiliaryImage"];
  }

  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[NUGlobalSettings disableAuxiliaryImageCacheFromSource])
  {
    goto LABEL_3;
  }
  v10 = (void *)[v9 copy];
  objc_msgSend(v10, "setAuxiliaryImageType:", -[NUAuxiliaryImageCacheNode auxiliaryImageType](self, "auxiliaryImageType"));
  v11 = [(NUCacheNode *)self inputNode];
  uint64_t v15 = 0;
  v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:&v15];

  if (!v12)
  {
LABEL_3:
    v14.receiver = self;
    v14.super_class = (Class)NUAuxiliaryImageCacheNode;
    v12 = [(NUCacheNode *)&v14 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v12;
}

- (BOOL)sourceSupportsAuxiliaryImage
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"sourceSupportsAuxiliaryImage"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)auxiliaryImageType
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"auxiliaryImageType"];

  if (!v3)
  {
    int64_t v6 = NUAssertLogger_28860();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Require a auxImageTypeValue setting"];
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_28860();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_super v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageCacheNode auxiliaryImageType]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUAuxiliaryImageCacheNode.m", 61, @"Require a auxImageTypeValue setting", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)persistentURL
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB10]);
  int64_t v4 = NSString;
  id v5 = [(NUCacheNode *)self cacheIdentifier];
  int64_t v6 = [v4 stringWithFormat:@"x-auxiliary-image-cache-node://%@", v5];
  id v7 = (void *)[v3 initWithString:v6];

  return v7;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 2;
}

- (NUAuxiliaryImageCacheNode)initWithInput:(id)a3 auxiliaryImageType:(int64_t)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"auxiliaryImageType";
  int64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)NUAuxiliaryImageCacheNode;
  BOOL v10 = [(NUCacheNode *)&v12 initWithInput:v7 settings:v9];

  return v10;
}

@end