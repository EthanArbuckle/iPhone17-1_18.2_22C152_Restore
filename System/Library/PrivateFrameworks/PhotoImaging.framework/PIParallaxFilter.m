@interface PIParallaxFilter
- (CGRect)visibleFrame;
- (CIImage)inputBackgroundImage;
- (CIImage)inputForegroundImage;
- (CIImage)inputGuideImage;
- (CIImage)inputMatteImage;
- (CIImage)outputBackgroundImage;
- (CIImage)outputForegroundImage;
- (CIImage)outputMatteImage;
- (NSDictionary)localLightData;
- (PIParallaxFilterCache)cache;
- (double)renderScale;
- (void)setCache:(id)a3;
- (void)setInputBackgroundImage:(id)a3;
- (void)setInputForegroundImage:(id)a3;
- (void)setInputGuideImage:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setLocalLightData:(id)a3;
- (void)setRenderScale:(double)a3;
- (void)setVisibleFrame:(CGRect)a3;
@end

@implementation PIParallaxFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputGuideImage, 0);
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputForegroundImage, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
}

- (void)setInputGuideImage:(id)a3
{
}

- (CIImage)inputGuideImage
{
  return self->_inputGuideImage;
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputBackgroundImage:(id)a3
{
}

- (CIImage)inputBackgroundImage
{
  return self->_inputBackgroundImage;
}

- (void)setInputForegroundImage:(id)a3
{
}

- (CIImage)inputForegroundImage
{
  return self->_inputForegroundImage;
}

- (void)setCache:(id)a3
{
}

- (PIParallaxFilterCache)cache
{
  return self->_cache;
}

- (void)setLocalLightData:(id)a3
{
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setVisibleFrame:(CGRect)a3
{
  self->_visibleFrame = a3;
}

- (CGRect)visibleFrame
{
  double x = self->_visibleFrame.origin.x;
  double y = self->_visibleFrame.origin.y;
  double width = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CIImage)outputMatteImage
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E4F29060];
          v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
  }
}

- (CIImage)outputBackgroundImage
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E4F29060];
          v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
  }
}

- (CIImage)outputForegroundImage
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E4F29060];
          v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3157);
  }
}

@end