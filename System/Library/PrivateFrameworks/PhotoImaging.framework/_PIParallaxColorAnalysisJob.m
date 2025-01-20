@interface _PIParallaxColorAnalysisJob
- ($FD18CD26FAB5729647810B74E671536E)imageRect;
- (BOOL)_computeAllHistograms:(id *)a3;
- (BOOL)_waitForRenderResources:(id *)a3;
- (BOOL)complete:(id *)a3;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CIImage)hueChromaImage;
- (NSArray)dominantColors;
- (NSArray)dominantGrays;
- (NSArray)dominantHues;
- (_PIParallaxColorAnalysisJob)initWithParallaxColorAnalysisRequest:(id)a3;
- (_PIParallaxColorAnalysisJob)initWithRequest:(id)a3;
- (double)medianLuminance;
- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetGray:(double)a4 grayRange:(double)a5 chromaMax:(double)a6 error:(id *)a7;
- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetHue:(double)a4 hueRange:(double)a5 chromaMin:(double)a6 error:(id *)a7;
- (id)_beginRenderingImage:(id)a3 colorSpace:(id)a4 format:(id)a5 error:(id *)a6;
- (id)result;
- (id)scalePolicy;
- (int64_t)alphaCount;
- (void)_purgeRenderResources;
- (void)setAlphaCount:(int64_t)a3;
- (void)setDominantColors:(id)a3;
- (void)setDominantGrays:(id)a3;
- (void)setDominantHues:(id)a3;
- (void)setHueChromaImage:(id)a3;
- (void)setImageRect:(id *)a3;
- (void)setMedianLuminance:(double)a3;
@end

@implementation _PIParallaxColorAnalysisJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColors, 0);
  objc_storeStrong((id *)&self->_dominantGrays, 0);
  objc_storeStrong((id *)&self->_dominantHues, 0);
  objc_storeStrong((id *)&self->_hueChromaImage, 0);
  objc_storeStrong((id *)&self->_renderResources, 0);
  objc_storeStrong((id *)&self->_storagePool, 0);
}

- (void)setDominantColors:(id)a3
{
}

- (NSArray)dominantColors
{
  return self->_dominantColors;
}

- (void)setDominantGrays:(id)a3
{
}

- (NSArray)dominantGrays
{
  return self->_dominantGrays;
}

- (void)setDominantHues:(id)a3
{
}

- (NSArray)dominantHues
{
  return self->_dominantHues;
}

- (void)setMedianLuminance:(double)a3
{
  self->_medianLuminance = a3;
}

- (double)medianLuminance
{
  return self->_medianLuminance;
}

- (void)setAlphaCount:(int64_t)a3
{
  self->_alphaCount = a3;
}

- (int64_t)alphaCount
{
  return self->_alphaCount;
}

- (void)setHueChromaImage:(id)a3
{
}

- (CIImage)hueChromaImage
{
  return self->_hueChromaImage;
}

- (void)setImageRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_imageRect.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_imageRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($FD18CD26FAB5729647810B74E671536E)imageRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var0.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v3;
  return self;
}

- (void)_purgeRenderResources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = self->_renderResources;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "destination", (void)v12);

        if (v9)
        {
          storagePool = self->_storagePool;
          v11 = [v8 destination];
          [(NUPurgeableStoragePool *)storagePool returnStorage:v11];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_renderResources removeAllObjects];
}

- (id)result
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = objc_alloc_init(_PIParallaxColorAnalysisResult);
  [(_PIParallaxColorAnalysisJob *)self medianLuminance];
  -[_PIParallaxColorAnalysisResult setMedianLuminance:](v3, "setMedianLuminance:");
  uint64_t v4 = [(_PIParallaxColorAnalysisJob *)self dominantColors];
  [(_PIParallaxColorAnalysisResult *)v3 setDominantColors:v4];

  return v3;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v21 = NUAssertLogger_4658();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_4658();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        __int16 v44 = 2114;
        v45 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v5 = -[_PIParallaxColorAnalysisJob _waitForRenderResources:](self, "_waitForRenderResources:");
  if (v5)
  {
    BOOL v5 = [(_PIParallaxColorAnalysisJob *)self _computeAllHistograms:a3];
    if (v5)
    {
      uint64_t v6 = [(_PIParallaxColorAnalysisJob *)self colorAnalysisRequest];
      [(NSMutableArray *)self->_renderResources sortUsingComparator:&__block_literal_global_4667];
      uint64_t v7 = [v6 maxDominantColors];
      uint64_t v8 = [(_PIParallaxColorAnalysisJob *)self alphaCount];
      v35 = v6;
      [v6 dominanceThreshold];
      double v10 = v9;
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obj = self->_renderResources;
      uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = (uint64_t)(v10 * (double)v8);
        uint64_t v15 = *(void *)v38;
LABEL_6:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
          v18 = [v17 imageHistogram];
          uint64_t v19 = [v18 sampleCount];

          if (v19 < v14) {
            break;
          }
          v20 = [v17 medianColor];
          [v11 addObject:v20];

          if ([v11 count] == v7) {
            break;
          }
          if (v13 == ++v16)
          {
            uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v13) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      [(_PIParallaxColorAnalysisJob *)self setDominantColors:v11];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_computeAllHistograms:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__4677;
  long long v40 = __Block_byref_object_dispose__4678;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4677;
  v34 = __Block_byref_object_dispose__4678;
  id v35 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_renderResources;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F7A378]);
        [v7 luminanceWeights];
        objc_msgSend(v8, "setLuminanceWeights:");
        [v7 luminanceThresholds];
        objc_msgSend(v8, "setLuminanceThresholds:");
        double v9 = [v7 destination];
        uint64_t v10 = [v9 size];
        uint64_t v12 = v11;

        uint64_t v13 = [v7 destination];
        v25[0] = 0;
        v25[1] = 0;
        v25[2] = v10;
        v25[3] = v12;
        uint64_t v14 = [MEMORY[0x1E4F7A5F8] regionWithRect:v25];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __53___PIParallaxColorAnalysisJob__computeAllHistograms___block_invoke;
        v21[3] = &unk_1E5D801F0;
        v23 = &v30;
        id v15 = v8;
        id v22 = v15;
        v24 = &v36;
        [v13 readBufferInRegion:v14 block:v21];

        if (!v31[5])
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F7A438];
          v18 = [v7 identifier];
          *a3 = [v17 errorWithCode:1 reason:@"Failed to compute histogram" object:v18 underlyingError:v37[5]];

          BOOL v16 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "setImageHistogram:");
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v42 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v16;
}

- (BOOL)_waitForRenderResources:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v17 = NUAssertLogger_4658();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v37 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_4658();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        long long v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        long long v28 = [v26 callStackSymbols];
        long long v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v37 = v25;
        __int16 v38 = 2114;
        long long v39 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v37 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = self->_renderResources;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v10 = [v9 task];
        id v30 = 0;
        uint64_t v11 = [v10 waitUntilCompletedAndReturnError:&v30];
        id v12 = v30;

        if (!v11)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F7A438];
          id v15 = [v9 identifier];
          *a3 = [v14 errorWithCode:1 reason:@"Failed to render image" object:v15 underlyingError:v12];

          BOOL v13 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetGray:(double)a4 grayRange:(double)a5 chromaMax:(double)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    v25 = NUAssertLogger_4658();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "hueChromaImage != nil");
      long long v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v29 = NUAssertLogger_4658();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        __int16 v38 = dispatch_get_specific(*v27);
        long long v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        id v27 = [v39 callStackSymbols];
        id v41 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v38;
        __int16 v51 = 2114;
        v52 = v41;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      long long v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v27;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v35 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a7)
  {
    long long v32 = NUAssertLogger_4658();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      long long v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v27 = (const void **)MEMORY[0x1E4F7A308];
    long long v34 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v29 = NUAssertLogger_4658();
    int v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v35)
    {
      v42 = dispatch_get_specific(*v27);
      uint64_t v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      v45 = [v43 callStackSymbols];
      uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v42;
      __int16 v51 = 2114;
      v52 = v46;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  BOOL v13 = v12;
  v47[0] = @"inputLumaTarget";
  uint64_t v14 = [NSNumber numberWithDouble:a4];
  v48[0] = v14;
  v47[1] = @"inputLumaRange";
  id v15 = [NSNumber numberWithDouble:a5];
  v48[1] = v15;
  v47[2] = @"inputChromaMax";
  BOOL v16 = [NSNumber numberWithDouble:a6];
  v48[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  v18 = [v13 imageByApplyingFilter:@"PIIPTHueChromaGrayFilter" withInputParameters:v17];

  if (v18)
  {
    uint64_t v19 = +[PIIPTHueChromaFilter denormalizeHueChromaImage:v18];

    v20 = +[PIIPTHueChromaFilter convertHueChromaImageToRGB:v19];
    v21 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
    BOOL v22 = [MEMORY[0x1E4F7A5D8] BGRA8];
    v23 = [(_PIParallaxColorAnalysisJob *)self _beginRenderingImage:v20 colorSpace:v21 format:v22 error:a7];
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to produce filtered Hue/Chroma image" object:0];
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetHue:(double)a4 hueRange:(double)a5 chromaMin:(double)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    v25 = NUAssertLogger_4658();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "hueChromaImage != nil");
      long long v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v29 = NUAssertLogger_4658();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        __int16 v38 = dispatch_get_specific(*v27);
        long long v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        id v27 = [v39 callStackSymbols];
        id v41 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v38;
        __int16 v51 = 2114;
        v52 = v41;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      long long v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v27;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v35 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a7)
  {
    long long v32 = NUAssertLogger_4658();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      long long v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v27 = (const void **)MEMORY[0x1E4F7A308];
    long long v34 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v29 = NUAssertLogger_4658();
    int v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v35)
    {
      v42 = dispatch_get_specific(*v27);
      uint64_t v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      v45 = [v43 callStackSymbols];
      uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v42;
      __int16 v51 = 2114;
      v52 = v46;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  BOOL v13 = v12;
  v47[0] = @"inputHueTarget";
  uint64_t v14 = [NSNumber numberWithDouble:a4];
  v48[0] = v14;
  v47[1] = @"inputHueRange";
  id v15 = [NSNumber numberWithDouble:a5];
  v48[1] = v15;
  v47[2] = @"inputChromaMin";
  BOOL v16 = [NSNumber numberWithDouble:a6];
  void v47[3] = @"inputHueIsNormalized";
  v48[2] = v16;
  void v48[3] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];
  v18 = [v13 imageByApplyingFilter:@"PIIPTHueChromaColorFilter" withInputParameters:v17];

  if (v18)
  {
    uint64_t v19 = +[PIIPTHueChromaFilter denormalizeHueChromaImage:v18];

    v20 = +[PIIPTHueChromaFilter convertHueChromaImageToRGB:v19];
    v21 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
    BOOL v22 = [MEMORY[0x1E4F7A5D8] BGRA8];
    v23 = [(_PIParallaxColorAnalysisJob *)self _beginRenderingImage:v20 colorSpace:v21 format:v22 error:a7];
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to produce filtered Hue/Chroma image" object:0];
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)_beginRenderingImage:(id)a3 colorSpace:(id)a4 format:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v24 = NUAssertLogger_4658();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v28 = NUAssertLogger_4658();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        long long v37 = dispatch_get_specific(*v26);
        __int16 v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        long long v26 = [v38 callStackSymbols];
        id v40 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      BOOL v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v26 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v34 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  BOOL v13 = v12;
  memset(buf, 0, 32);
  [(_PIParallaxColorAnalysisJob *)self imageRect];
  v46[1] = 0;
  v46[2] = 0;
  v46[3] = [(NURenderJob *)self imageSize];
  v46[4] = v14;
  NUPixelRectFlipYOrigin();
  uint64_t v15 = [(NUPurgeableStoragePool *)self->_storagePool newStorageWithSize:(unsigned __int128)0 format:v13];
  if (!v15)
  {
    long long v31 = NUAssertLogger_4658();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      long long v32 = [NSString stringWithFormat:@"No storage allocated"];
      *(_DWORD *)v47 = 138543362;
      *(void *)&void v47[4] = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v47, 0xCu);
    }
    long long v26 = (const void **)MEMORY[0x1E4F7A308];
    long long v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v28 = NUAssertLogger_4658();
    int v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        int v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)v47 = 138543362;
        *(void *)&void v47[4] = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v47, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v34)
    {
      id v41 = dispatch_get_specific(*v26);
      v42 = (void *)MEMORY[0x1E4F29060];
      id v43 = v41;
      id v44 = [v42 callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)v47 = 138543618;
      *(void *)&void v47[4] = v41;
      *(_WORD *)&v47[12] = 2114;
      *(void *)&v47[14] = v45;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v47, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  BOOL v16 = (void *)v15;
  uint64_t v17 = [v10 imageByPremultiplyingAlpha];
  v46[0] = 2;
  *(_OWORD *)v47 = *(_OWORD *)buf;
  *(_OWORD *)&v47[16] = *(_OWORD *)&buf[16];
  v18 = [MEMORY[0x1E4F7A5F8] regionWithRect:v47];
  uint64_t v19 = [(NURenderJob *)self imageSize];
  v21 = -[NURenderJob renderImage:into:colorSpace:roi:imageSize:alpha:error:](self, "renderImage:into:colorSpace:roi:imageSize:alpha:error:", v17, v16, v11, v18, v19, v20, v46, a6);

  if (v21)
  {
    BOOL v22 = objc_alloc_init(_PIParallaxRenderResource);
    [(_PIParallaxRenderResource *)v22 setDestination:v16];
    [(_PIParallaxRenderResource *)v22 setTask:v21];
    [(_PIParallaxRenderResource *)v22 setImage:v10];
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)render:(id *)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v102 = NUAssertLogger_4658();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      double v103 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v117 = v103;
      _os_log_error_impl(&dword_1A9680000, v102, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    *(double *)&uint64_t v13 = MEMORY[0x1E4F7A308];
    double v23 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]));
    BOOL v22 = NUAssertLogger_4658();
    BOOL v104 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v23 == 0.0)
    {
      if (v104)
      {
        double v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(double *)&uint64_t v13 = [*(id *)&v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v117 = *(double *)&v13;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }
    else if (v104)
    {
      double v23 = COERCE_DOUBLE(dispatch_get_specific(*(const void **)v13));
      v108 = (void *)MEMORY[0x1E4F29060];
      $0AC6E346AE4835514AAA8AC86D8F4844 v3 = (id *)*(id *)&v23;
      *(double *)&uint64_t v13 = [v108 callStackSymbols];
      uint64_t v4 = [(id)v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v117 = v23;
      __int16 v118 = 2114;
      uint64_t v119 = v4;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    v110 = "error != NULL";
    int v107 = _NUAssertFailHandler();
    goto LABEL_55;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  uint64_t v4 = (uint64_t)self;
  uint64_t v5 = [(_PIParallaxColorAnalysisJob *)self colorAnalysisRequest];
  id v8 = [MEMORY[0x1E4F7A5D8] BGRA8];
  uint64_t v7 = [MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
  double v9 = [MEMORY[0x1E4F7A448] sharedFactory];
  uint64_t v10 = [v9 surfaceStoragePool];
  id v11 = *(void **)(v4 + 232);
  *(void *)(v4 + 232) = v10;

  if (!*(void *)(v4 + 232))
  {
    v105 = NUAssertLogger_4658();
    $0AC6E346AE4835514AAA8AC86D8F4844 v3 = (id *)&unk_1A980A000;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      double v106 = [NSString stringWithFormat:@"No storage pool"];
      *(_DWORD *)buf = 138543362;
      double v117 = v106;
      _os_log_error_impl(&dword_1A9680000, v105, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    *(double *)&uint64_t v13 = MEMORY[0x1E4F7A308];
    double v23 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]));
    BOOL v22 = NUAssertLogger_4658();
    int v107 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v23 == 0.0)
    {
      if (v107)
      {
        double v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(double *)&uint64_t v13 = [*(id *)&v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v117 = *(double *)&v13;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_57:

      _NUAssertFailHandler();
LABEL_58:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_320);
LABEL_7:
      v115 = v7;
      v24 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        [(id)v4 medianLuminance];
        *(_DWORD *)buf = 134217984;
        double v117 = v26;
        _os_log_impl(&dword_1A9680000, v25, OS_LOG_TYPE_DEFAULT, "Median luminance: %f", buf, 0xCu);
      }
      uint64_t v27 = objc_msgSend(v5, "maxDominantColors", v110);
      long long v28 = [v6 imageHistogram];
      BOOL v29 = [v28 blue];

      v112 = v29;
      objc_msgSend(v29, "threshold:");
      double v31 = v30;
      if (**(void **)&v23 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_320);
      }
      long long v32 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v117 = v31 * 100.0;
        __int16 v118 = 2048;
        uint64_t v119 = v27;
        _os_log_impl(&dword_1A9680000, v32, OS_LOG_TYPE_DEFAULT, "Percent above chroma min: %0.0f%%, max hues: %ld", buf, 0x16u);
      }
      v114 = v5;
      if (v31 >= 0.25 && v27 >= 1)
      {
        long long v33 = [v6 imageHistogram];
        int v34 = [v33 luminance];
        int v35 = (void *)[v34 mutableCopy];

        [v35 smoothWithFunction:1 windowSize:11 sampleMode:3];
        uint64_t v36 = [v35 modalityAnalysisWithLimit:v27 sampleMode:3];
        [(id)v4 setDominantHues:v36];

        if (**(void **)&v23 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_320);
        }
        long long v37 = (void *)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = v37;
          v111 = [(id)v4 dominantHues];
          *(double *)&uint64_t v39 = COERCE_DOUBLE([v111 count]);
          id v40 = [(id)v4 dominantHues];
          *(_DWORD *)buf = 134218242;
          double v117 = *(double *)&v39;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v40;
          id v41 = v38;
          double v23 = MEMORY[0x1E4F7A750];
          _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_DEFAULT, "Found %ld dominant hues: %@", buf, 0x16u);
        }
      }
      if (v31 <= 0.75 && v27 >= 1)
      {
        id v42 = [v22 mutableCopy];
        [v42 smoothWithFunction:1 windowSize:13 sampleMode:1];
        id v43 = [v42 modalityAnalysisWithLimit:v27 sampleMode:1];
        [(id)v4 setDominantGrays:v43];

        if (**(void **)&v23 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_320);
        }
        id v44 = (void *)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          uint64_t v46 = [(id)v4 dominantGrays];
          *(double *)&uint64_t v47 = COERCE_DOUBLE([v46 count]);
          v48 = [(id)v4 dominantGrays];
          *(_DWORD *)buf = 134218242;
          double v117 = *(double *)&v47;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v48;
          _os_log_impl(&dword_1A9680000, v45, OS_LOG_TYPE_DEFAULT, "Found %ld dominant grays: %@", buf, 0x16u);
        }
      }
      [(id)v4 _purgeRenderResources];
      uint64_t v49 = [(id)v4 dominantHues];
      uint64_t v50 = [v49 count];

      if (v50)
      {
        unint64_t v51 = 0;
        int v52 = *MEMORY[0x1E4F7A348];
        int v53 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 4);
        int v54 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 8);
        int v55 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 12);
        int v56 = *MEMORY[0x1E4F7A368];
        int v57 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 4);
        int v59 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 8);
        int v58 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 12);
        while (1)
        {
          v60 = [(id)v4 dominantHues];
          v61 = [v60 objectAtIndexedSubscript:v51];

          v62 = [(id)v4 hueChromaImage];
          [v61 doubleValue];
          v63 = objc_msgSend((id)v4, "_beginRenderNormalizedHueChromaImage:targetHue:hueRange:chromaMin:error:", v62, v3);

          if (!v63) {
            break;
          }
          v64 = objc_msgSend(NSString, "stringWithFormat:", @"hue-%ld", ++v51);
          [v63 setIdentifier:v64];

          LODWORD(v65) = v52;
          LODWORD(v66) = v53;
          LODWORD(v67) = v54;
          LODWORD(v68) = v55;
          objc_msgSend(v63, "setLuminanceWeights:", v65, v66, v67, v68);
          LODWORD(v69) = v56;
          LODWORD(v70) = v57;
          LODWORD(v71) = v59;
          LODWORD(v72) = v58;
          objc_msgSend(v63, "setLuminanceThresholds:", v69, v70, v71, v72);
          [*(id *)(v4 + v13) addObject:v63];

          v73 = [(id)v4 dominantHues];
          unint64_t v74 = [v73 count];

          uint64_t v6 = v63;
          if (v51 >= v74) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        v63 = v6;
LABEL_35:
        v77 = [(id)v4 dominantGrays];
        uint64_t v78 = [v77 count];

        if (!v78)
        {
LABEL_39:
          BOOL v75 = 1;
LABEL_41:
          id v8 = v113;
          uint64_t v5 = v114;

          uint64_t v6 = v63;
          uint64_t v7 = v115;
          goto LABEL_33;
        }
        unint64_t v79 = 0;
        int v80 = *MEMORY[0x1E4F7A348];
        int v81 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 4);
        int v82 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 8);
        int v83 = *(_DWORD *)(MEMORY[0x1E4F7A348] + 12);
        int v84 = *MEMORY[0x1E4F7A368];
        int v85 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 4);
        int v86 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 8);
        int v87 = *(_DWORD *)(MEMORY[0x1E4F7A368] + 12);
        while (1)
        {
          v88 = v63;
          v89 = [(id)v4 dominantGrays];
          v61 = [v89 objectAtIndexedSubscript:v79];

          v90 = [(id)v4 hueChromaImage];
          [v61 doubleValue];
          v63 = objc_msgSend((id)v4, "_beginRenderNormalizedHueChromaImage:targetGray:grayRange:chromaMax:error:", v90, v3);

          if (!v63) {
            break;
          }
          v91 = objc_msgSend(NSString, "stringWithFormat:", @"gray-%ld", ++v79);
          [v63 setIdentifier:v91];

          LODWORD(v92) = v80;
          LODWORD(v93) = v81;
          LODWORD(v94) = v82;
          LODWORD(v95) = v83;
          objc_msgSend(v63, "setLuminanceWeights:", v92, v93, v94, v95);
          LODWORD(v96) = v84;
          LODWORD(v97) = v85;
          LODWORD(v98) = v86;
          LODWORD(v99) = v87;
          objc_msgSend(v63, "setLuminanceThresholds:", v96, v97, v98, v99);
          [*(id *)(v4 + v13) addObject:v63];

          v100 = [(id)v4 dominantGrays];
          unint64_t v101 = [v100 count];

          if (v79 >= v101) {
            goto LABEL_39;
          }
        }
      }

      v63 = 0;
      BOOL v75 = 0;
      goto LABEL_41;
    }
LABEL_55:
    if (v107)
    {
      double v23 = COERCE_DOUBLE(dispatch_get_specific(*(const void **)v13));
      v109 = (void *)MEMORY[0x1E4F29060];
      $0AC6E346AE4835514AAA8AC86D8F4844 v3 = (id *)*(id *)&v23;
      *(double *)&uint64_t v13 = [v109 callStackSymbols];
      uint64_t v4 = [(id)v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v117 = v23;
      __int16 v118 = 2114;
      uint64_t v119 = v4;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_57;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = 240;
  uint64_t v14 = *(void **)(v4 + 240);
  *(void *)(v4 + 240) = v12;

  [v5 chromaThreshold];
  double v16 = v15;
  uint64_t v17 = [(id)v4 hueChromaImage];
  uint64_t v6 = [(id)v4 _beginRenderingImage:v17 colorSpace:v7 format:v8 error:v3];

  if (v6)
  {
    float v19 = v16;
    LODWORD(v18) = 1.0;
    objc_msgSend(v6, "setLuminanceWeights:", 0.0, v18, 0.0, 0.0);
    *(float *)&double v20 = v19;
    objc_msgSend(v6, "setLuminanceThresholds:", 0.0, 0.0, v20, 0.0);
    [*(id *)(v4 + 240) addObject:v6];
    if ([(id)v4 _waitForRenderResources:v3])
    {
      if ([(id)v4 _computeAllHistograms:v3])
      {
        v113 = v8;
        v21 = [v6 imageHistogram];
        BOOL v22 = [v21 red];

        objc_msgSend((id)v4, "setAlphaCount:", -[NSObject sampleCount](v22, "sampleCount"));
        [v22 median];
        objc_msgSend((id)v4, "setMedianLuminance:");
        double v23 = MEMORY[0x1E4F7A750];
        if (*MEMORY[0x1E4F7A750] == -1) {
          goto LABEL_7;
        }
        goto LABEL_58;
      }
    }
  }
  BOOL v75 = 0;
LABEL_33:

  return v75;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v21 = NUAssertLogger_4658();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_4658();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        BOOL v29 = dispatch_get_specific(*v23);
        double v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        long long v32 = [v30 callStackSymbols];
        long long v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v35.receiver = self;
  v35.super_class = (Class)_PIParallaxColorAnalysisJob;
  if (!-[NURenderJob prepare:](&v35, sel_prepare_)) {
    return 0;
  }
  uint64_t v5 = [(NURenderJob *)self outputImage];
  uint64_t v6 = [(_PIParallaxColorAnalysisJob *)self colorAnalysisRequest];
  uint64_t v7 = [v6 segmentationMatte];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1E050] imageWithNUImageBuffer:v7];
    if ([v6 analyzeBackground]) {
      +[PISegmentationHelper backgroundForImage:v5 matte:v8];
    }
    else {
    uint64_t v10 = +[PISegmentationHelper foregroundForImage:v5 matte:v8];
    }

    uint64_t v5 = (void *)v10;
  }
  uint64_t v11 = [(NURenderJob *)self imageSize];
  uint64_t v13 = v12;
  [v6 normalizedClipRect];
  if (CGRectIsEmpty(v39))
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    [v5 extent];
    NURectDenormalize();
    NUPixelRectFromCGRect();
    uint64_t v14 = *(void *)buf;
    uint64_t v15 = *(void *)&buf[8];
    uint64_t v11 = *(void *)&buf[16];
    uint64_t v13 = v37;
    NUPixelRectToCGRect();
    uint64_t v16 = objc_msgSend(v5, "imageByCroppingToRect:");

    uint64_t v5 = (void *)v16;
  }
  v34[0] = v14;
  v34[1] = v15;
  v34[2] = v11;
  v34[3] = v13;
  [(_PIParallaxColorAnalysisJob *)self setImageRect:v34];
  uint64_t v17 = [v5 imageByUnpremultiplyingAlpha];
  double v18 = +[PIIPTHueChromaFilter convertRGBImageToHueChroma:v17];

  BOOL v9 = v18 != 0;
  if (v18)
  {
    float v19 = +[PIIPTHueChromaFilter normalizeHueChromaImage:v18];
    [(_PIParallaxColorAnalysisJob *)self setHueChromaImage:v19];
  }
  else
  {
    *a3 = [MEMORY[0x1E4F7A438] failureError:@"Hue/chroma conversion failed" object:v5];
  }

  return v9;
}

- (id)scalePolicy
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x80000];
  return v2;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (_PIParallaxColorAnalysisJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v8 = NSString;
      BOOL v9 = v7;
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      uint64_t v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      long long v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_318);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F29060];
          uint64_t v17 = v15;
          double v18 = [v16 callStackSymbols];
          float v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          long long v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_318);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      BOOL v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      uint64_t v17 = v20;
      v24 = [v22 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      long long v28 = specific;
      __int16 v29 = 2114;
      double v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    BOOL v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_318);
  }
}

- (_PIParallaxColorAnalysisJob)initWithParallaxColorAnalysisRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PIParallaxColorAnalysisJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end