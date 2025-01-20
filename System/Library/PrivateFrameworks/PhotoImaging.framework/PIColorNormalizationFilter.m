@interface PIColorNormalizationFilter
+ (BOOL)isAnalysisAvailable;
+ (id)colorCubeForNormalization:(id)a3 dimension:(int64_t)a4 targetColorSpace:(CGColorSpace *)a5;
+ (id)logger;
- (BOOL)isEqual:(id)a3;
- (CIImage)inputImage;
- (PFStoryRecipeDisplayAssetNormalization)inputNormalization;
- (PFStoryRecipeDisplayAssetNormalization)outputNormalization;
- (id)outputImage;
- (unint64_t)hash;
- (void)setInputImage:(id)a3;
- (void)setInputNormalization:(id)a3;
@end

@implementation PIColorNormalizationFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputNormalization, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputNormalization:(id)a3
{
}

- (PFStoryRecipeDisplayAssetNormalization)inputNormalization
{
  return self->inputNormalization;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (PFStoryRecipeDisplayAssetNormalization)outputNormalization
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    v3 = +[PIColorNormalizationFilter logger];
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    v5 = v3;
    v6 = v5;
    unint64_t v7 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PIColorNormalizationAnalysis", "", buf, 2u);
    }

    v8 = [MEMORY[0x1E4F7A448] sharedFactory];
    v9 = [v8 visionSession];

    id v10 = objc_alloc(MEMORY[0x1E4F45890]);
    v11 = (void *)[v10 initWithCIImage:self->inputImage options:MEMORY[0x1E4F1CC08] session:v9];
    id v12 = objc_alloc_init(MEMORY[0x1E4F45690]);
    [v12 setRevision:1];
    v43[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    id v40 = 0;
    int v14 = [v11 performRequests:v13 error:&v40];
    id v15 = v40;

    v16 = 0;
    if (v14)
    {
      v17 = [v12 results];
      v18 = [v17 firstObject];

      if (v18)
      {
        id v31 = v15;
        v32 = v11;
        unint64_t v33 = v4 - 1;
        v34 = v9;
        os_signpost_id_t v35 = v4;
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v20 = [v18 adjustmentKeys];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v26 = [v18 adjustmentValuesForKey:v25];
              [v19 setObject:v26 forKeyedSubscript:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
          }
          while (v22);
        }

        v27 = PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision();
        if (v27) {
          v16 = (void *)[objc_alloc(MEMORY[0x1E4F8CDC8]) initWithAnalysisData:v27];
        }
        else {
          v16 = 0;
        }
        v9 = v34;
        os_signpost_id_t v4 = v35;
        id v15 = v31;
        v11 = v32;

        unint64_t v7 = v33;
      }
      else
      {
        v16 = 0;
      }
    }
    v28 = v6;
    v29 = v28;
    if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v29, OS_SIGNPOST_INTERVAL_END, v4, "PIColorNormalizationAnalysis", "", buf, 2u);
    }
  }
  else
  {
    v16 = 0;
  }
  return (PFStoryRecipeDisplayAssetNormalization *)v16;
}

- (id)outputImage
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (self->inputImage && (inputNormalization = self->inputNormalization) != 0)
  {
    os_signpost_id_t v4 = inputNormalization;
    v5 = [(PIColorNormalizationFilter *)self inputImage];
    v19[0] = @"temperature";
    v6 = [(PFStoryRecipeDisplayAssetNormalization *)v4 tempTintProperties];
    unint64_t v7 = [v6 objectForKeyedSubscript:@"inputTemperature"];
    v19[1] = @"tint";
    v20[0] = v7;
    v8 = [(PFStoryRecipeDisplayAssetNormalization *)v4 tempTintProperties];
    v9 = [v8 objectForKeyedSubscript:@"inputTint"];
    v20[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v11 = [v5 imageByApplyingFilter:@"PITempTintFilter" withInputParameters:v10];

    id v12 = [(PFStoryRecipeDisplayAssetNormalization *)v4 highKeyProperties];
    v13 = [v11 imageByApplyingFilter:@"PIHighKey" withInputParameters:v12];

    int v14 = [(PFStoryRecipeDisplayAssetNormalization *)v4 smartToneProperties];
    id v15 = [v13 imageByApplyingFilter:@"CISmartToneFilter" withInputParameters:v14];

    v16 = [(PFStoryRecipeDisplayAssetNormalization *)v4 smartColorProperties];

    v17 = [v15 imageByApplyingFilter:@"CISmartColorFilter" withInputParameters:v16];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  os_signpost_id_t v4 = (PIColorNormalizationFilter *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PIColorNormalizationFilter *)self inputNormalization];
      unint64_t v7 = [(PIColorNormalizationFilter *)v5 inputNormalization];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PIColorNormalizationFilter *)self inputNormalization];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)colorCubeForNormalization:(id)a3 dimension:(int64_t)a4 targetColorSpace:(CGColorSpace *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v21 = NUAssertLogger_433();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "normalization != nil");
      uint64_t v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v25 = NUAssertLogger_433();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v34 = dispatch_get_specific(*v23);
        os_signpost_id_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v23 = [v35 callStackSymbols];
        long long v37 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v34;
        __int16 v48 = 2114;
        v49 = v37;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v31 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  if (!a5)
  {
    v28 = NUAssertLogger_433();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != NULL");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = (const void **)MEMORY[0x1E4F7A308];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v25 = NUAssertLogger_433();
    int v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        unint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v47 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v31)
    {
      long long v38 = dispatch_get_specific(*v23);
      long long v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      v41 = [v39 callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v38;
      __int16 v48 = 2114;
      v49 = v42;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  char v8 = v7;
  v9 = objc_alloc_init(PIColorNormalizationFilter);
  [(PIColorNormalizationFilter *)v9 setInputNormalization:v8];
  id v10 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v11 = *MEMORY[0x1E4F1E208];
  v45[0] = @"PIColorNormalization";
  uint64_t v12 = *MEMORY[0x1E4F1E240];
  v44[0] = v11;
  v44[1] = v12;
  CGColorSpaceRef v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  uint64_t v14 = *MEMORY[0x1E4F1E1E0];
  v45[1] = v13;
  v45[2] = MEMORY[0x1E4F1CC28];
  uint64_t v15 = *MEMORY[0x1E4F1E1D8];
  v44[2] = v14;
  v44[3] = v15;
  v45[3] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];
  v17 = [v10 contextWithOptions:v16];

  v43 = v9;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  id v19 = objc_msgSend(v17, "pi_createColorCubeDataForFilters:dimension:colorSpace:", v18, a4, a5);

  return v19;
}

+ (BOOL)isAnalysisAvailable
{
  return 1;
}

+ (id)logger
{
  if (logger_s_once != -1) {
    dispatch_once(&logger_s_once, &__block_literal_global_443);
  }
  v2 = (void *)logger_s_logger;
  return v2;
}

uint64_t __36__PIColorNormalizationFilter_logger__block_invoke()
{
  logger_s_logger = (uint64_t)os_log_create("PhotoImaging", "PIColorNormalizationFilter");
  return MEMORY[0x1F41817F8]();
}

@end