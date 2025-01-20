@interface PIParallaxLayerStackRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)headroomBlurEnabled;
- (BOOL)isSettlingEffectEnabled;
- (BOOL)shouldUseVideoFrame;
- (NSCache)cache;
- (PFPosterOrientedLayout)layout;
- (PIParallaxLayerStackRequest)initWithComposition:(id)a3;
- (PIParallaxLayerStackRequest)initWithSegmentationItem:(id)a3;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)layerStackMode;
- (int64_t)mediaComponentType;
- (void)setCache:(id)a3;
- (void)setHeadroomBlurEnabled:(BOOL)a3;
- (void)setLayerStackMode:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setSettlingEffectEnabled:(BOOL)a3;
- (void)setStyle:(id)a3;
@end

@implementation PIParallaxLayerStackRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  self->_settlingEffectEnabled = a3;
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (void)setCache:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setHeadroomBlurEnabled:(BOOL)a3
{
  self->_headroomBlurEnabled = a3;
}

- (BOOL)headroomBlurEnabled
{
  return self->_headroomBlurEnabled;
}

- (void)setLayerStackMode:(int64_t)a3
{
  self->_layerStackMode = a3;
}

- (int64_t)layerStackMode
{
  return self->_layerStackMode;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (void)setStyle:(id)a3
{
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (BOOL)shouldUseVideoFrame
{
  if ([(PIParallaxLayerStackRequest *)self layerStackMode] != 3) {
    return 0;
  }
  return [(PIParallaxLayerStackRequest *)self isSettlingEffectEnabled];
}

- (int64_t)mediaComponentType
{
  if ([(PIParallaxLayerStackRequest *)self shouldUseVideoFrame]) {
    return 2;
  }
  else {
    return 1;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PIParallaxLayerStackRequest *)self shouldUseVideoFrame];
  if (result)
  {
    uint64_t v6 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1FA48];
    retstr->var3 = *(void *)(v6 + 16);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PIParallaxLayerStackRequest;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v7 time];
  }
  return result;
}

- (id)newRenderJob
{
  v3 = [_PIParallaxLayerStackJob alloc];
  return [(_PIParallaxLayerStackJob *)v3 initWithParallaxLayerStackRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PIParallaxLayerStackRequest;
  v4 = [(NURenderRequest *)&v14 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxLayerStackRequest *)self segmentationItem];
    uint64_t v6 = (void *)v4[20];
    v4[20] = v5;

    uint64_t v7 = [(PIParallaxLayerStackRequest *)self layout];
    v8 = (void *)v4[22];
    v4[22] = v7;

    uint64_t v9 = [(PIParallaxLayerStackRequest *)self style];
    v10 = (void *)v4[21];
    v4[21] = v9;

    v4[23] = [(PIParallaxLayerStackRequest *)self layerStackMode];
    uint64_t v11 = [(PIParallaxLayerStackRequest *)self cache];
    v12 = (void *)v4[24];
    v4[24] = v11;

    *((unsigned char *)v4 + 153) = [(PIParallaxLayerStackRequest *)self isSettlingEffectEnabled];
    *((unsigned char *)v4 + 152) = [(PIParallaxLayerStackRequest *)self headroomBlurEnabled];
  }
  return v4;
}

- (PIParallaxLayerStackRequest)initWithComposition:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSString;
      v8 = v6;
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      uint64_t v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          objc_super v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
  }
}

- (PIParallaxLayerStackRequest)initWithSegmentationItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (PISegmentationItem *)a3;
  if (!v4)
  {
    v10 = NUAssertLogger_19382();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "segmentationItem != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    objc_super v14 = NUAssertLogger_19382();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        os_log_t v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        id v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        __int16 v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(PISegmentationItem *)v4 composition];
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxLayerStackRequest;
  uint64_t v7 = [(NURenderRequest *)&v23 initWithComposition:v6];

  segmentationItem = v7->_segmentationItem;
  v7->_segmentationItem = v5;

  v7->_layerStackMode = 0;
  v7->_headroomBlurEnabled = 1;
  return v7;
}

@end