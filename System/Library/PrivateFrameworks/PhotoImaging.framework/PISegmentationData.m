@interface PISegmentationData
- (NSDictionary)scores;
- (PFParallaxAssetRegions)regions;
- (PFPosterLayout)originalLayout;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PIParallaxColorAnalysis)colorAnalysis;
- (PISegmentationData)init;
- (PISegmentationData)initWithSegmentationItem:(id)a3;
- (PISegmentationItem)item;
- (__CVBuffer)segmentationBuffer;
- (unint64_t)classification;
@end

@implementation PISegmentationData

- (void).cxx_destruct
{
}

- (PISegmentationItem)item
{
  return self->_item;
}

- (PIParallaxColorAnalysis)colorAnalysis
{
  v2 = [(PISegmentationData *)self item];
  v3 = [v2 colorAnalysis];

  return (PIParallaxColorAnalysis *)v3;
}

- (NSDictionary)scores
{
  v2 = [(PISegmentationData *)self item];
  v3 = [v2 scores];

  return (NSDictionary *)v3;
}

- (PFParallaxAssetRegions)regions
{
  v2 = [(PISegmentationData *)self item];
  v3 = [v2 regions];

  return (PFParallaxAssetRegions *)v3;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  v2 = [(PISegmentationData *)self item];
  v3 = [v2 layoutConfiguration];

  return (PFWallpaperCompoundDeviceConfiguration *)v3;
}

- (unint64_t)classification
{
  v2 = [(PISegmentationData *)self item];
  unint64_t v3 = [v2 classification];

  return v3;
}

- (PFPosterLayout)originalLayout
{
  v2 = [(PISegmentationData *)self item];
  unint64_t v3 = [v2 originalLayout];

  return (PFPosterLayout *)v3;
}

- (__CVBuffer)segmentationBuffer
{
  v2 = [(PISegmentationData *)self item];
  unint64_t v3 = [v2 segmentationMatte];
  v4 = (__CVBuffer *)[v3 CVPixelBuffer];

  return v4;
}

- (PISegmentationData)initWithSegmentationItem:(id)a3
{
  v4 = (PISegmentationItem *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PISegmentationData;
  v5 = [(PISegmentationData *)&v8 init];
  item = v5->_item;
  v5->_item = v4;

  return v5;
}

- (PISegmentationData)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      objc_super v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = NSStringFromSelector(a2);
      v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25157);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25157);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25157);
  }
}

@end