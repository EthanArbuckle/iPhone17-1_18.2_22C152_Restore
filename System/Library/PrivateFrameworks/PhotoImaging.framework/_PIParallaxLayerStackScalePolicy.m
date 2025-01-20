@interface _PIParallaxLayerStackScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (PFPosterOrientedLayout)layout;
- (_PIParallaxLayerStackScalePolicy)initWithLayout:(id)a3;
@end

@implementation _PIParallaxLayerStackScalePolicy

- (void).cxx_destruct
{
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  [(PFPosterOrientedLayout *)self->_layout imageSize];
  [(PFPosterOrientedLayout *)self->_layout visibleFrame];
  [(PFPosterOrientedLayout *)self->_layout deviceResolution];
  double v12 = v5;
  double v13 = v4;
  NUPixelSizeToCGSize();
  NURectNormalize();
  uint64_t v6 = NURectDenormalize();
  v9.n128_f64[0] = fmax(v13 / v7, v12 / v8);
  int64_t v10 = MEMORY[0x1F4130B20](v6, v9);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (_PIParallaxLayerStackScalePolicy)initWithLayout:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v4 = (PFPosterOrientedLayout *)a3;
  if (!v4)
  {
    __n128 v9 = NUAssertLogger_19382();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "layout != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int64_t v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v13 = NUAssertLogger_19382();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        __int16 v25 = 2114;
        v26 = v21;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  v22.receiver = self;
  v22.super_class = (Class)_PIParallaxLayerStackScalePolicy;
  uint64_t v6 = [(_PIParallaxLayerStackScalePolicy *)&v22 init];
  layout = v6->_layout;
  v6->_layout = v5;

  return v6;
}

@end