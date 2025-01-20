@interface PIParallaxLegacyPosterStyle
+ (id)_localLightDataForImage:(id)a3;
+ (id)applyInactiveStyleToImage:(id)a3 error:(id *)a4;
+ (void)initialize;
@end

@implementation PIParallaxLegacyPosterStyle

+ (id)_localLightDataForImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F7A5D0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithTargetPixelCount:0x40000];
  [v4 extent];
  uint64_t v6 = NUPixelSizeFromCGSize();
  objc_msgSend(v5, "scaleForImageSize:", v6, v7);
  NUScaleToDouble();
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v8, v8);
  CGAffineTransform v12 = v13;
  v9 = [v4 imageByApplyingTransform:&v12];

  v10 = [v9 localLightStatisticsNoProxy];

  return v10;
}

+ (id)applyInactiveStyleToImage:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_9423();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_9423();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        __int16 v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  CGFloat v8 = +[PIParallaxStyle defaultOriginalStyle];
  v9 = [v8 inactiveFilter];
  if (v9)
  {
    v10 = (id)s_log;
    v11 = v10;
    os_signpost_id_t v12 = s_signpost;
    if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PIParallaxLegacyPosterStyle.localLight", "", buf, 2u);
    }

    CGAffineTransform v13 = [a1 _localLightDataForImage:v7];
    v14 = (id)s_log;
    v15 = v14;
    os_signpost_id_t v16 = s_signpost;
    if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PIParallaxLegacyPosterStyle.localLight", "", buf, 2u);
    }

    [v7 extent];
    objc_msgSend(v9, "setVisibleFrame:");
    [v9 setRenderScale:1.0];
    [v9 setLocalLightData:v13];
    [v9 setInputGuideImage:v7];
    [v9 setInputBackgroundImage:v7];
    uint64_t v17 = [v9 outputBackgroundImage];
    v18 = (void *)v17;
    if (a4 && !v17)
    {
      *a4 = [MEMORY[0x1E4F7A438] failureError:@"Failed to produce background image with filter" object:v9];
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F7A438] resourceUnavailableError:@"Inactive filter is not available" object:0];
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PIParallaxLegacyPosterStyle_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

os_signpost_id_t __41__PIParallaxLegacyPosterStyle_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.photos.PhotoImaging", "legacyPosterStyle");
  v3 = (void *)s_log;
  s_log = (uint64_t)v2;

  os_signpost_id_t result = os_signpost_id_make_with_pointer((os_log_t)s_log, *(const void **)(a1 + 32));
  s_signpost = result;
  return result;
}

@end