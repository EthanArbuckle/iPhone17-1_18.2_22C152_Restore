@interface PIPortraitVideoRenderer
+ (void)prewarmRendererForDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8;
+ (void)renderOnDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8 usingBlock:(id)a9;
- ($0AC6E346AE4835514AAA8AC86D8F4844)colorSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)disparitySize;
- (BOOL)isInUse;
- (MTLDevice)device;
- (NSDate)lastUseTime;
- (PIPortraitVideoRenderer)initWithDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7;
- (id)description;
- (int)quality;
- (int64_t)debugMode;
- (void)prepareToRenderWithMetadata:(id)a3;
- (void)setInUse:(BOOL)a3;
- (void)setLastUseTime:(id)a3;
@end

@implementation PIPortraitVideoRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUseTime, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
}

- (void)setLastUseTime:(id)a3
{
}

- (NSDate)lastUseTime
{
  return self->_lastUseTime;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (BOOL)isInUse
{
  return self->_inUse;
}

- (int64_t)debugMode
{
  return self->_debugMode;
}

- (int)quality
{
  return self->_quality;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)disparitySize
{
  int64_t height = self->_disparitySize.height;
  int64_t width = self->_disparitySize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)colorSize
{
  int64_t height = self->_colorSize.height;
  int64_t width = self->_colorSize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)prepareToRenderWithMetadata:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  renderPipeline = self->_renderPipeline;
  renderState = self->_renderState;
  if ((renderPipeline == 0) != (renderState == 0))
  {
    v24 = NUAssertLogger_10758();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [NSString stringWithFormat:@"Expected _renderPipeline and _renderState to be allocated at the same time"];
      int v33 = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v33, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    self = (PIPortraitVideoRenderer *)dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v7 = NUAssertLogger_10758();
    BOOL v27 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (self)
    {
      if (v27)
      {
        self = (PIPortraitVideoRenderer *)dispatch_get_specific(*v26);
        v29 = (void *)MEMORY[0x1E4F29060];
        v30 = self;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        int v33 = 138543618;
        v34 = self;
        __int16 v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v33, 0x16u);
      }
    }
    else if (v27)
    {
      self = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [(PIPortraitVideoRenderer *)self componentsJoinedByString:@"\n"];
      int v33 = 138543362;
      v34 = v28;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v33, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_27;
  }
  v7 = v4;
  if (!renderPipeline)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F92248]);
    v9 = [(PIPortraitVideoRenderer *)self device];
    [(PIPortraitVideoRenderer *)self colorSize];
    NUPixelSizeToCGSize();
    double v11 = v10;
    double v13 = v12;
    [(PIPortraitVideoRenderer *)self disparitySize];
    NUPixelSizeToCGSize();
    v16 = objc_msgSend(v8, "initWithDevice:version:colorSize:disparitySize:", v9, 1, v11, v13, v14, v15);

    objc_msgSend(v16, "setDebugRendering:", -[PIPortraitVideoRenderer debugMode](self, "debugMode"));
    [v16 setUseRGBA:1];
    v17 = (PTRenderPipeline *)[objc_alloc(MEMORY[0x1E4F92230]) initWithDescriptor:v16];
    v18 = self->_renderPipeline;
    self->_renderPipeline = v17;

    renderState = self->_renderState;
  }
  if (v7 && renderState)
  {
    if ((-[NSObject matchesRenderState:](v7, "matchesRenderState:") & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_90);
      }
      v19 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_INFO, "CINE: need new render state due to global metadata mismatch", (uint8_t *)&v33, 2u);
      }
      v20 = self->_renderState;
      self->_renderState = 0;
    }
    renderState = self->_renderState;
  }
  if (!renderState)
  {
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_15:
      v21 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        int v33 = 134217984;
        v34 = (PIPortraitVideoRenderer *)v7;
        _os_log_impl(&dword_1A9680000, v21, OS_LOG_TYPE_INFO, "CINE: allocating new renderState with metadata: %p", (uint8_t *)&v33, 0xCu);
      }
      v22 = [(PTRenderPipeline *)self->_renderPipeline createRenderStateWithQuality:[(PIPortraitVideoRenderer *)self quality]];
      v23 = self->_renderState;
      self->_renderState = v22;

      [v7 applyToRenderState:self->_renderState];
      goto LABEL_18;
    }
LABEL_27:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_90);
    goto LABEL_15;
  }
LABEL_18:
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MTLDevice *)self->_device name];
  v6 = [v3 stringWithFormat:@"<%@:%p device:%@ color=%ldx%ld disparity=%ldx%ld quality=%d debug=%ld>", v4, self, v5, self->_colorSize.width, self->_colorSize.height, self->_disparitySize.width, self->_disparitySize.height, self->_quality, self->_debugMode];

  return v6;
}

- (PIPortraitVideoRenderer)initWithDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v10 = a4.var1;
  int64_t v11 = a4.var0;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  double v13 = (MTLDevice *)a3;
  if (!v13)
  {
    v18 = NUAssertLogger_10758();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device != nil");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_10758();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v41 = dispatch_get_specific(*v20);
        v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        v20 = [v42 callStackSymbols];
        v44 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v41;
        __int16 v61 = 2114;
        v62 = v44;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v20;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v28 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  double v14 = v13;
  if (NUPixelSizeIsEmpty())
  {
    v25 = NUAssertLogger_10758();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(colorSize)");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_10758();
    int v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v20;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_31:

      int v33 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v28)
    {
      v45 = dispatch_get_specific(*v20);
      v46 = (void *)MEMORY[0x1E4F29060];
      id v47 = v45;
      v20 = [v46 callStackSymbols];
      v48 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v45;
      __int16 v61 = 2114;
      v62 = v48;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (NUPixelSizeIsEmpty())
  {
    v30 = NUAssertLogger_10758();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(disparitySize)");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_10758();
    int v33 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v20;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_34:

      int v38 = _NUAssertFailHandler();
      goto LABEL_35;
    }
LABEL_32:
    if (v33)
    {
      v49 = dispatch_get_specific(*v20);
      v50 = (void *)MEMORY[0x1E4F29060];
      id v51 = v49;
      v20 = [v50 callStackSymbols];
      v52 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v49;
      __int16 v61 = 2114;
      v62 = v52;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  if (a6 >= 0x65)
  {
    __int16 v35 = NUAssertLogger_10758();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "quality >= PTQualityPreviewLow && quality <= PTQualityExportProfessional");
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v37 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_10758();
    int v38 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v37)
    {
      if (v38)
      {
        v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v40;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_37;
    }
LABEL_35:
    if (v38)
    {
      v53 = dispatch_get_specific(*v20);
      v54 = (void *)MEMORY[0x1E4F29060];
      id v55 = v53;
      v56 = [v54 callStackSymbols];
      v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v53;
      __int16 v61 = 2114;
      v62 = v57;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_37:

    _NUAssertFailHandler();
  }
  v58.receiver = self;
  v58.super_class = (Class)PIPortraitVideoRenderer;
  double v15 = [(PIPortraitVideoRenderer *)&v58 init];
  device = v15->_device;
  v15->_device = v14;

  v15->_colorSize.int64_t width = v11;
  v15->_colorSize.int64_t height = v10;
  v15->_disparitySize.int64_t width = var0;
  v15->_disparitySize.int64_t height = var1;
  v15->_quality = a6;
  v15->_debugMode = a7;
  return v15;
}

+ (void)prewarmRendererForDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8
{
}

+ (void)renderOnDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8 usingBlock:(id)a9
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v10 = a4.var1;
  int64_t v11 = a4.var0;
  id v12 = a3;
  id v13 = a8;
  id v14 = a9;
  if (renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__onceToken != -1) {
    dispatch_once(&renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__onceToken, &__block_literal_global_16_10813);
  }
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__10814;
  v50 = __Block_byref_object_dispose__10815;
  id v51 = 0;
  double v15 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_19;
  block[3] = &unk_1E5D7FC10;
  id v16 = v12;
  int64_t v39 = v11;
  int64_t v40 = v10;
  int64_t v41 = var0;
  int64_t v42 = var1;
  int v44 = a6;
  int64_t v43 = a7;
  BOOL v45 = v14 == &__block_literal_global_10810;
  id v37 = v16;
  int v38 = &v46;
  dispatch_sync(v15, block);
  v17 = v13;
  if (v47[5])
  {
    v18 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_22;
    v33[3] = &unk_1E5D80410;
    __int16 v35 = &v46;
    id v34 = v17;
    dispatch_sync(v18, v33);
    (*((void (**)(id, void, void))v14 + 2))(v14, *(void *)(v47[5] + 8), *(void *)(v47[5] + 16));
    v19 = [MEMORY[0x1E4F1C9C8] now];
    v20 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2_24;
    v30[3] = &unk_1E5D80410;
    v32 = &v46;
    id v21 = v19;
    id v31 = v21;
    dispatch_sync(v20, v30);
    dispatch_time_t v22 = dispatch_time(0, 3000000000);
    BOOL v23 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_3;
    v27[3] = &unk_1E5D80410;
    id v28 = v21;
    v29 = &v46;
    id v24 = v21;
    dispatch_after(v22, v23, v27);
  }
  _Block_object_dispose(&v46, 8);
}

void __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_19(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2;
  v17 = &unk_1E5D7FBE8;
  id v18 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 48);
  long long v20 = v3;
  int v22 = *(_DWORD *)(a1 + 88);
  uint64_t v21 = *(void *)(a1 + 80);
  char v23 = *(unsigned char *)(a1 + 92);
  uint64_t v4 = [v2 indexOfObjectPassingTest:&v14];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [PIPortraitVideoRenderer alloc];
    uint64_t v6 = -[PIPortraitVideoRenderer initWithDevice:colorSize:disparitySize:quality:debugMode:](v5, "initWithDevice:colorSize:disparitySize:quality:debugMode:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned int *)(a1 + 88), *(void *)(a1 + 80), v14, v15, v16, v17);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_90);
    }
    v9 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_INFO, "CINE: allocating new PT renderer: %@", buf, 0xCu);
    }
    [(id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else if (!*(unsigned char *)(a1 + 92))
  {
    uint64_t v11 = [(id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool objectAtIndex:v4];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInUse:1];
}

uint64_t __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_22(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prepareToRenderWithMetadata:*(void *)(a1 + 32)];
}

uint64_t __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2_24(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInUse:0];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v3 setLastUseTime:v2];
}

void __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) lastUseTime];
  int v3 = [v2 isEqualToDate:*(void *)(a1 + 32)];

  if (v3)
  {
    [(id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool removeObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_90);
    }
    uint64_t v4 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v6 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool;
      uint64_t v7 = v4;
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = [v6 count];
      _os_log_impl(&dword_1A9680000, v7, OS_LOG_TYPE_INFO, "CINE: recycling unused PT renderer: %@ (%lu remaining)", (uint8_t *)&v8, 0x16u);
    }
  }
}

BOOL __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 device];
  uint64_t v5 = *(void **)(a1 + 32);

  BOOL v6 = 0;
  if (v4 == v5)
  {
    [v3 colorSize];
    if (NUPixelSizeEqualToSize())
    {
      [v3 disparitySize];
      if (NUPixelSizeEqualToSize())
      {
        if ([v3 quality] == *(_DWORD *)(a1 + 80)
          && [v3 debugMode] == *(void *)(a1 + 72)
          && (![v3 isInUse] || *(unsigned char *)(a1 + 84)))
        {
          BOOL v6 = 1;
        }
      }
    }
  }

  return v6;
}

uint64_t __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("PIPortraitVideoRenderer.pool", v0);
  uint64_t v2 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
  renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue = (uint64_t)v1;

  renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

@end