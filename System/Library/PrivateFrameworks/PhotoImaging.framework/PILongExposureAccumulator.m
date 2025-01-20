@interface PILongExposureAccumulator
- (BOOL)_accumulate:(id)a3 error:(id *)a4;
- (BOOL)_exportOutputImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 toURL:(id)a6 uti:(id)a7 error:(id *)a8;
- (BOOL)_initializeAccumulation:(id *)a3;
- (BOOL)_initializeStorage:(id)a3 image:(id)a4 error:(id *)a5;
- (BOOL)_isReadyForMoreData;
- (BOOL)accumulate:(id)a3 error:(id *)a4;
- (BOOL)isReadyForMoreData;
- (BOOL)start:(id *)a3;
- (BOOL)writeLongExposureImage:(id)a3 UTI:(id)a4 colorSpace:(id)a5 error:(id *)a6;
- (BOOL)writeMaskImage:(id)a3 UTI:(id)a4 error:(id *)a5;
- (NSError)_accumError;
- (PILongExposureAccumulator)initWithSize:(id)a3 renderer:(id)a4 jobNumber:(unint64_t)a5;
- (id)_dynamismMapWithMinImage:(id)a3 maxImage:(id)a4 extent:(id *)a5;
- (id)_nextInputFrame;
- (id)nextInputFrame;
- (id)workingColorSpace;
- (void)_accumulate:(id)a3;
- (void)_appendInputFrame:(id)a3;
- (void)_initializeAccumulation;
- (void)_markAsFinished;
- (void)_start;
- (void)cancel;
- (void)dealloc;
- (void)markAsFinished;
- (void)set_accumError:(id)a3;
- (void)waitUntilDone;
@end

@implementation PILongExposureAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accumError, 0);
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_inputFrames, 0);
  objc_storeStrong((id *)&self->_doneGroup, 0);
  objc_storeStrong((id *)&self->_readySemaphore, 0);
  objc_storeStrong((id *)&self->_accumSemaphore, 0);
  objc_storeStrong((id *)&self->_accumQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_maximumAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_minimumAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_averageAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_temporaryDestinationStorage, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)set_accumError:(id)a3
{
}

- (NSError)_accumError
{
  return (NSError *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)_exportOutputImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 toURL:(id)a6 uti:(id)a7 error:(id *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  CFURLRef v15 = (const __CFURL *)a6;
  v16 = (__CFString *)a7;
  if (!v14)
  {
    v26 = NUAssertLogger_14610();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_14610();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v44 = dispatch_get_specific(*v28);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v28 = [v45 callStackSymbols];
        v47 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v44;
        __int16 v61 = 2114;
        v62 = v47;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v36 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!v15)
  {
    v33 = NUAssertLogger_14610();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destinationURL != nil");
      v34 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    v35 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_14610();
    int v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v35)
    {
      if (v36)
      {
        v37 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v28;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_33:

      int v41 = _NUAssertFailHandler();
      goto LABEL_34;
    }
LABEL_31:
    if (v36)
    {
      v48 = dispatch_get_specific(*v28);
      v49 = (void *)MEMORY[0x1E4F29060];
      id v50 = v48;
      v28 = [v49 callStackSymbols];
      v51 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v48;
      __int16 v61 = 2114;
      v62 = v51;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  if (!a8)
  {
    v38 = NUAssertLogger_14610();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v39 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v39;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    v40 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_14610();
    int v41 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v40)
    {
      if (v41)
      {
        v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v43;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_36;
    }
LABEL_34:
    if (v41)
    {
      v52 = dispatch_get_specific(*v28);
      v53 = (void *)MEMORY[0x1E4F29060];
      id v54 = v52;
      v55 = [v53 callStackSymbols];
      v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v52;
      __int16 v61 = 2114;
      v62 = v56;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_36:

    _NUAssertFailHandler();
  }
  v17 = v16;
  v18 = [(NURenderer *)self->_renderer context];
  [v14 extent];
  uint64_t v19 = objc_msgSend(v18, "createCGImage:fromRect:format:colorSpace:deferred:", v14, v12, a5, 0);
  if (v19)
  {
    v20 = (CGImage *)v19;
    CGImageDestinationRef v21 = CGImageDestinationCreateWithURL(v15, v17, 1uLL, 0);
    if (v21)
    {
      v22 = v21;
      uint64_t v57 = *MEMORY[0x1E4F2F430];
      v58 = &unk_1F000A518;
      CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      CGImageDestinationAddImage(v22, v20, v23);
      BOOL v24 = CGImageDestinationFinalize(v22);
      if (!v24)
      {
        *a8 = [MEMORY[0x1E4F7A438] failureError:@"Failed to finalize image destination" object:self];
      }
      CFRelease(v22);
    }
    else
    {
      [MEMORY[0x1E4F7A438] failureError:@"Failed to create CGImageDestinationRef" object:self];
      BOOL v24 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v20);
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to create CGImageRef" object:self];
    BOOL v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)_dynamismMapWithMinImage:(id)a3 maxImage:(id)a4 extent:(id *)a5
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = +[PIAutoLoopKernels dynamismMapKernel];
  v10 = [v8 imageByClampingToExtent];

  v11 = [v7 imageByClampingToExtent];

  $FD18CD26FAB5729647810B74E671536E v23 = *a5;
  NUPixelRectToCGRect();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v24[0] = v11;
  v24[1] = v10;
  v24[2] = &unk_1F000F0B8;
  v24[3] = &unk_1F000F0C8;
  v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 4, *(_OWORD *)&v23.var0, *(_OWORD *)&v23.var1);
  CGImageDestinationRef v21 = objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_14650, v20, v13, v15, v17, v19);

  return v21;
}

double __70__PILongExposureAccumulator__dynamismMapWithMinImage_maxImage_extent___block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (BOOL)writeMaskImage:(id)a3 UTI:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    double v17 = NUAssertLogger_14610();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      double v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    CGImageDestinationRef v21 = NUAssertLogger_14610();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      $FD18CD26FAB5729647810B74E671536E v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v10 = v9;
  [(PILongExposureAccumulator *)self waitUntilDone];
  v11 = [(PILongExposureAccumulator *)self _accumError];

  if (v11)
  {
    [(PILongExposureAccumulator *)self _accumError];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__14656;
    v44 = __Block_byref_object_dispose__14657;
    id v45 = 0;
    minimumAccumulationStorage = self->_minimumAccumulationStorage;
    imageOptions = self->_imageOptions;
    renderer = self->_renderer;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke;
    v30[3] = &unk_1E5D80378;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    v30[4] = self;
    $5BB7312FFE32F1AB3F1F5957C99A58B3 pixelSize = self->_pixelSize;
    id v31 = v8;
    v33 = &v38;
    id v32 = v10;
    v34 = buf;
    [(NUSurfaceStorage *)minimumAccumulationStorage useAsCIImageWithOptions:imageOptions renderer:renderer block:v30];
    if (*((unsigned char *)v39 + 24))
    {
      BOOL v12 = 1;
    }
    else
    {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
      BOOL v12 = *((unsigned char *)v39 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v38, 8);
  }

  return v12;
}

void __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v4[7];
  uint64_t v6 = v4[17];
  uint64_t v7 = v4[3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke_2;
  v12[3] = &unk_1E5D80350;
  v12[4] = v4;
  id v13 = v3;
  long long v8 = *(_OWORD *)(a1 + 88);
  long long v17 = *(_OWORD *)(a1 + 72);
  long long v18 = v8;
  id v14 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v11;
  long long v15 = v11;
  uint64_t v16 = *(void *)(a1 + 64);
  id v10 = v3;
  [v5 useAsCIImageWithOptions:v6 renderer:v7 block:v12];
}

void __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 80);
  long long v18 = v5;
  uint64_t v6 = [v3 _dynamismMapWithMinImage:v4 maxImage:a2 extent:buf];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
  }
  uint64_t v7 = *MEMORY[0x1E4F7A760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_debug_impl(&dword_1A9680000, v7, OS_LOG_TYPE_DEBUG, "Writing long-exposure motion mask to %{public}@", buf, 0xCu);
  }
  long long v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *MEMORY[0x1E4F1E298];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = (id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id obj = 0;
  char v14 = [v9 _exportOutputImage:v6 format:v10 colorSpace:v8 toURL:v11 uti:v12 error:&obj];
  objc_storeStrong(v13, obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;
  CGColorSpaceRelease(v8);
}

- (BOOL)writeLongExposureImage:(id)a3 UTI:(id)a4 colorSpace:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v20 = NUAssertLogger_14610();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CGImageDestinationRef v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v24 = NUAssertLogger_14610();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        id v31 = [v29 callStackSymbols];
        id v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v13 = v12;
  [(PILongExposureAccumulator *)self waitUntilDone];
  char v14 = [(PILongExposureAccumulator *)self _accumError];

  if (v14)
  {
    [(PILongExposureAccumulator *)self _accumError];
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v40 = 0;
    char v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v45 = __Block_byref_object_copy__14656;
    uint64_t v46 = __Block_byref_object_dispose__14657;
    id v47 = 0;
    averageAccumulationStorage = self->_averageAccumulationStorage;
    imageOptions = self->_imageOptions;
    renderer = self->_renderer;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__PILongExposureAccumulator_writeLongExposureImage_UTI_colorSpace_error___block_invoke;
    v33[3] = &unk_1E5D80328;
    uint64_t v38 = &v40;
    id v34 = v10;
    uint64_t v35 = self;
    id v36 = v13;
    id v37 = v11;
    v39 = buf;
    [(NUSurfaceStorage *)averageAccumulationStorage useAsCIImageWithOptions:imageOptions renderer:renderer block:v33];
    if (*((unsigned char *)v41 + 24))
    {
      BOOL v15 = 1;
    }
    else
    {
      *a6 = *(id *)(*(void *)&buf[8] + 40);
      BOOL v15 = *((unsigned char *)v41 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v40, 8);
  }

  return v15;
}

void __73__PILongExposureAccumulator_writeLongExposureImage_UTI_colorSpace_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
  }
  uint64_t v4 = *MEMORY[0x1E4F7A760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v11;
    _os_log_debug_impl(&dword_1A9680000, v4, OS_LOG_TYPE_DEBUG, "Writing long-exposure image to %{public}@", buf, 0xCu);
  }
  uint64_t v5 = *MEMORY[0x1E4F1E2F0];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 48) CGColorSpace];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = (id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id obj = 0;
  LOBYTE(v5) = [v6 _exportOutputImage:v3 format:v5 colorSpace:v7 toURL:v8 uti:v9 error:&obj];
  objc_storeStrong(v10, obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v5;
}

- (BOOL)_accumulate:(id)a3 error:(id *)a4
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v65 = a4;
  if (!a4)
  {
    v44 = NUAssertLogger_14610();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v46 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v48 = NUAssertLogger_14610();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        v52 = dispatch_get_specific(*v46);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v49)
    {
      id v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v51;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1E050];
  v58 = v6;
  uint64_t v8 = [v6 CVPixelBuffer];
  uint64_t v104 = *MEMORY[0x1E4F1E378];
  v105[0] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
  id v10 = [v7 imageWithCVPixelBuffer:v8 options:v9];

  uint64_t v11 = [(PILongExposureAccumulator *)self workingColorSpace];
  int64_t height = self->_pixelSize.height;
  int64_t width = self->_pixelSize.width;
  id v12 = +[PIAutoLoopKernels alphaCompositingKernel];
  v59 = [MEMORY[0x1E4F1E000] componentMax];
  __int16 v61 = [MEMORY[0x1E4F1E000] componentMin];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v103 = 0;
  int64_t v13 = self->_frameCount + 1;
  self->_frameCount = v13;
  float v14 = 1.0 / (float)v13;
  averageAccumulationStorage = self->_averageAccumulationStorage;
  imageOptions = self->_imageOptions;
  renderer = self->_renderer;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke;
  v90[3] = &unk_1E5D802D8;
  id v57 = v12;
  id v91 = v57;
  id v18 = v10;
  float v101 = v14;
  id v92 = v18;
  v93 = self;
  id v19 = v11;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  int64_t v98 = width;
  int64_t v99 = height;
  v100 = v65;
  id v94 = v19;
  v95 = buf;
  [(NUSurfaceStorage *)averageAccumulationStorage useAsCIImageWithOptions:imageOptions renderer:renderer block:v90];
  v20 = self->_averageAccumulationStorage;
  objc_storeStrong((id *)&self->_averageAccumulationStorage, self->_temporaryDestinationStorage);
  temporaryDestinationStorage = self->_temporaryDestinationStorage;
  self->_temporaryDestinationStorage = v20;

  BOOL v22 = [v18 imageByClampingToExtent];
  $FD18CD26FAB5729647810B74E671536E v23 = [v22 imageByApplyingFilter:@"CIBoxBlur" withInputParameters:&unk_1F000AF30];

  minimumAccumulationStorage = self->_minimumAccumulationStorage;
  BOOL v25 = self->_imageOptions;
  v26 = self->_renderer;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_50;
  v78[3] = &unk_1E5D80300;
  id v62 = v61;
  id v79 = v62;
  id v27 = v18;
  id v80 = v27;
  id v28 = v23;
  id v81 = v28;
  v82 = self;
  id v29 = v19;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  int64_t v87 = width;
  int64_t v88 = height;
  v89 = v65;
  id v83 = v29;
  v84 = buf;
  [(NUSurfaceStorage *)minimumAccumulationStorage useAsCIImageWithOptions:v25 renderer:v26 block:v78];
  id v30 = self->_minimumAccumulationStorage;
  objc_storeStrong((id *)&self->_minimumAccumulationStorage, self->_temporaryDestinationStorage);
  id v31 = self->_temporaryDestinationStorage;
  self->_temporaryDestinationStorage = v30;

  p_maximumAccumulationStorage = &self->_maximumAccumulationStorage;
  maximumAccumulationStorage = self->_maximumAccumulationStorage;
  id v34 = self->_imageOptions;
  uint64_t v35 = self->_renderer;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_3;
  v66[3] = &unk_1E5D80300;
  id v36 = v59;
  id v67 = v36;
  id v60 = v27;
  id v68 = v60;
  id v37 = v28;
  id v69 = v37;
  v70 = self;
  id v38 = v29;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  int64_t v75 = width;
  int64_t v76 = height;
  v77 = v65;
  id v71 = v38;
  v72 = buf;
  [(NUSurfaceStorage *)maximumAccumulationStorage useAsCIImageWithOptions:v34 renderer:v35 block:v66];
  v39 = self->_maximumAccumulationStorage;
  char v41 = self->_temporaryDestinationStorage;
  p_temporaryDestinationStorage = &self->_temporaryDestinationStorage;
  objc_storeStrong((id *)p_maximumAccumulationStorage, v41);
  uint64_t v42 = *p_temporaryDestinationStorage;
  *p_temporaryDestinationStorage = v39;

  LOBYTE(p_temporaryDestinationStorage) = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;
  _Block_object_dispose(buf, 8);

  return (char)p_temporaryDestinationStorage;
}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke(uint64_t a1, void *a2)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v33[0] = *(void *)(a1 + 40);
  v33[1] = v5;
  LODWORD(v6) = *(_DWORD *)(a1 + 112);
  float v14 = [NSNumber numberWithFloat:v6];
  v33[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  uint64_t v16 = objc_msgSend(v3, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(v17 + 24);
  id v18 = *(void **)(v17 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_2;
  v25[3] = &unk_1E5D802B0;
  id v20 = *(id *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 48);
  id v26 = v20;
  uint64_t v27 = v21;
  long long v22 = *(_OWORD *)(a1 + 88);
  long long v30 = *(_OWORD *)(a1 + 72);
  long long v31 = v22;
  uint64_t v32 = *(void *)(a1 + 104);
  uint64_t v23 = *(void *)(a1 + 64);
  id v28 = v16;
  uint64_t v29 = v23;
  id v24 = v16;
  [v18 useAsCIRenderDestinationWithRenderer:v19 block:v25];
}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke_50(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v32[0] = *(void *)(a1 + 48);
  v32[1] = v5;
  float v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v15 = objc_msgSend(v3, "applyWithExtent:arguments:", v14, v7, v9, v11, v13);

  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(v16 + 24);
  uint64_t v17 = *(void **)(v16 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_2_51;
  v24[3] = &unk_1E5D802B0;
  id v19 = *(id *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 56);
  id v25 = v19;
  uint64_t v26 = v20;
  long long v21 = *(_OWORD *)(a1 + 96);
  long long v29 = *(_OWORD *)(a1 + 80);
  long long v30 = v21;
  uint64_t v31 = *(void *)(a1 + 112);
  uint64_t v22 = *(void *)(a1 + 72);
  id v27 = v15;
  uint64_t v28 = v22;
  id v23 = v15;
  [v17 useAsCIRenderDestinationWithRenderer:v18 block:v24];
}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke_3(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v32[0] = *(void *)(a1 + 48);
  v32[1] = v5;
  float v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v15 = objc_msgSend(v3, "applyWithExtent:arguments:", v14, v7, v9, v11, v13);

  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(v16 + 24);
  uint64_t v17 = *(void **)(v16 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_4;
  v24[3] = &unk_1E5D802B0;
  id v19 = *(id *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 56);
  id v25 = v19;
  uint64_t v26 = v20;
  long long v21 = *(_OWORD *)(a1 + 96);
  long long v29 = *(_OWORD *)(a1 + 80);
  long long v30 = v21;
  uint64_t v31 = *(void *)(a1 + 112);
  uint64_t v22 = *(void *)(a1 + 72);
  id v27 = v15;
  uint64_t v28 = v22;
  id v23 = v15;
  [v17 useAsCIRenderDestinationWithRenderer:v18 block:v24];
}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureAccumulator-maximum-j%lld", *(void *)(*(void *)(a1 + 40) + 72));
  [v4 setLabel:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  double v10 = objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), v8);

  if (!v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    **(void **)(a1 + 96) = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"failed to render maximum image" object:*(void *)(a1 + 40) underlyingError:**(void **)(a1 + 96)];
  }
  return v10 != 0;
}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_2_51(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureAccumulator-minimum-j%lld", *(void *)(*(void *)(a1 + 40) + 72));
  [v4 setLabel:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  double v10 = objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), v8);

  if (!v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    **(void **)(a1 + 96) = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"failed to render minimum image" object:*(void *)(a1 + 40) underlyingError:**(void **)(a1 + 96)];
  }
  return v10 != 0;
}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureAccumulator-average-j%lld", *(void *)(*(void *)(a1 + 40) + 72));
  [v4 setLabel:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  double v10 = objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), v8);

  if (!v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    **(void **)(a1 + 96) = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"failed to render average image" object:*(void *)(a1 + 40) underlyingError:**(void **)(a1 + 96)];
  }
  return v10 != 0;
}

- (void)_accumulate:(id)a3
{
  id v4 = a3;
  id v5 = [(PILongExposureAccumulator *)self _accumError];
  if (v5)
  {

    id v6 = 0;
  }
  else
  {
    id v8 = 0;
    BOOL v7 = [(PILongExposureAccumulator *)self _accumulate:v4 error:&v8];
    id v6 = v8;
    if (!v7) {
      [(PILongExposureAccumulator *)self set_accumError:v6];
    }
  }
}

- (BOOL)_initializeAccumulation:(id *)a3
{
  id v5 = [(PILongExposureAccumulator *)self workingColorSpace];
  id v6 = (void *)MEMORY[0x1E4F1E050];
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:colorSpace:", objc_msgSend(v5, "CGColorSpace"), 0.0, 0.0, 0.0);
  id v8 = [v6 imageWithColor:v7];

  long long v9 = (void *)MEMORY[0x1E4F1E050];
  double v10 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:colorSpace:", objc_msgSend(v5, "CGColorSpace"), 1.0, 1.0, 1.0);
  double v11 = [v9 imageWithColor:v10];

  BOOL v12 = [(PILongExposureAccumulator *)self _initializeStorage:self->_averageAccumulationStorage image:v8 error:a3]&& [(PILongExposureAccumulator *)self _initializeStorage:self->_minimumAccumulationStorage image:v11 error:a3]&& [(PILongExposureAccumulator *)self _initializeStorage:self->_maximumAccumulationStorage image:v8 error:a3];
  return v12;
}

- (void)_initializeAccumulation
{
  id v6 = 0;
  BOOL v3 = [(PILongExposureAccumulator *)self _initializeAccumulation:&v6];
  id v4 = v6;
  if (!v3)
  {
    id v5 = [(PILongExposureAccumulator *)self _accumError];

    if (!v5) {
      [(PILongExposureAccumulator *)self set_accumError:v4];
    }
  }
}

- (void)_start
{
  [(PILongExposureAccumulator *)self _initializeAccumulation];
  while (1)
  {
    intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_accumSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = (void *)MEMORY[0x1AD0F8D70](v3);
    uint64_t v5 = [(PILongExposureAccumulator *)self nextInputFrame];
    if (!v5) {
      break;
    }
    id v6 = (void *)v5;
    [(PILongExposureAccumulator *)self _accumulate:v5];
  }
}

- (id)_nextInputFrame
{
  if (self->_finished && ![(NSMutableArray *)self->_inputFrames count])
  {
    intptr_t v3 = 0;
  }
  else
  {
    intptr_t v3 = [(NSMutableArray *)self->_inputFrames objectAtIndex:0];
    [(NSMutableArray *)self->_inputFrames removeObjectAtIndex:0];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_readySemaphore);
  }
  return v3;
}

- (id)nextInputFrame
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__14656;
  double v10 = __Block_byref_object_dispose__14657;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PILongExposureAccumulator_nextInputFrame__block_invoke;
  v5[3] = &unk_1E5D80410;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__PILongExposureAccumulator_nextInputFrame__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _nextInputFrame];
  return MEMORY[0x1F41817F8]();
}

- (void)_appendInputFrame:(id)a3
{
  [(NSMutableArray *)self->_inputFrames addObject:a3];
  accumSemaphore = self->_accumSemaphore;
  dispatch_semaphore_signal(accumSemaphore);
}

- (BOOL)accumulate:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  if (!v8)
  {
    uint64_t v16 = NUAssertLogger_14610();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "frame != nil");
      double v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v31 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    *(double *)&self = MEMORY[0x1E4F7A308];
    double v10 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]));
    long long v9 = NUAssertLogger_14610();
    BOOL v18 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10 == 0.0)
    {
      if (v18)
      {
        double v10 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(double *)&self = [*(id *)&v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v31 = *(double *)&self;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }
    else if (v18)
    {
      double v10 = COERCE_DOUBLE(dispatch_get_specific(self->super.isa));
      uint64_t v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = *(id *)&v10;
      *(double *)&self = [v22 callStackSymbols];
      id v24 = [(PILongExposureAccumulator *)self componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v31 = v10;
      __int16 v32 = 2114;
      v33 = v24;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    int v21 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!a4)
  {
    id v19 = NUAssertLogger_14610();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      double v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v31 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    *(double *)&self = MEMORY[0x1E4F7A308];
    double v10 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]));
    long long v9 = NUAssertLogger_14610();
    int v21 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10 == 0.0)
    {
      if (v21)
      {
        double v10 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(double *)&self = [*(id *)&v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v31 = *(double *)&self;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_25:

      _NUAssertFailHandler();
LABEL_26:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
      goto LABEL_6;
    }
LABEL_23:
    if (v21)
    {
      double v10 = COERCE_DOUBLE(dispatch_get_specific(self->super.isa));
      id v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = *(id *)&v10;
      *(double *)&self = [v25 callStackSymbols];
      id v27 = [(PILongExposureAccumulator *)self componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v31 = v10;
      __int16 v32 = 2114;
      v33 = v27;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  long long v9 = v8;
  double v10 = [(PILongExposureAccumulator *)self _accumError];

  if (v10 != 0.0)
  {
    *a4 = [(PILongExposureAccumulator *)self _accumError];
    goto LABEL_9;
  }
  NUAbsoluteTime();
  double v4 = v11;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_readySemaphore, 0xFFFFFFFFFFFFFFFFLL);
  NUAbsoluteTime();
  double v5 = v12;
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_26;
  }
LABEL_6:
  double v13 = *MEMORY[0x1E4F7A760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v31 = (v5 - v4) * 1000.0;
    _os_log_debug_impl(&dword_1A9680000, v13, OS_LOG_TYPE_DEBUG, "waitUntilReadyForMoreData: waited for %0.1fms", buf, 0xCu);
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PILongExposureAccumulator_accumulate_error___block_invoke;
  block[3] = &unk_1E5D80DD8;
  block[4] = self;
  long long v29 = v9;
  dispatch_sync(stateQueue, block);

LABEL_9:
  return *(void *)&v10 == 0;
}

uint64_t __46__PILongExposureAccumulator_accumulate_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendInputFrame:*(void *)(a1 + 40)];
}

- (void)waitUntilDone
{
  [(PILongExposureAccumulator *)self markAsFinished];
  doneGroup = self->_doneGroup;
  dispatch_group_wait(doneGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_markAsFinished
{
  if (!self->_finished)
  {
    self->_finished = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_accumSemaphore);
  }
}

- (void)markAsFinished
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PILongExposureAccumulator_markAsFinished__block_invoke;
  block[3] = &unk_1E5D812E0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __43__PILongExposureAccumulator_markAsFinished__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _markAsFinished];
}

- (BOOL)_isReadyForMoreData
{
  return (unint64_t)[(NSMutableArray *)self->_inputFrames count] < 3;
}

- (BOOL)isReadyForMoreData
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PILongExposureAccumulator_isReadyForMoreData__block_invoke;
  v5[3] = &unk_1E5D80410;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__PILongExposureAccumulator_isReadyForMoreData__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isReadyForMoreData];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_initializeStorage:(id)a3 image:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  double v10 = [(PILongExposureAccumulator *)self workingColorSpace];
  renderer = self->_renderer;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__PILongExposureAccumulator__initializeStorage_image_error___block_invoke;
  v16[3] = &unk_1E5D802B0;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 pixelSize = self->_pixelSize;
  id v12 = v10;
  id v17 = v12;
  BOOL v18 = self;
  id v13 = v9;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v23 = pixelSize;
  id v24 = a5;
  id v19 = v13;
  double v20 = &v25;
  [v8 useAsCIRenderDestinationWithRenderer:renderer block:v16];
  LOBYTE(a5) = *((unsigned char *)v26 + 24) == 0;

  _Block_object_dispose(&v25, 8);
  return (char)a5;
}

BOOL __60__PILongExposureAccumulator__initializeStorage_image_error___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  double v5 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureAccumulator-main-j%lld", *(void *)(*(void *)(a1 + 40) + 72));
  [v4 setLabel:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  BOOL v7 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  double v10 = objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), v8);

  if (!v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    **(void **)(a1 + 96) = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"failed to init accumulator" object:*(void *)(a1 + 40) underlyingError:**(void **)(a1 + 96)];
  }
  return v10 != 0;
}

- (BOOL)start:(id *)a3
{
  doneGroup = self->_doneGroup;
  accumQueue = self->_accumQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PILongExposureAccumulator_start___block_invoke;
  block[3] = &unk_1E5D812E0;
  block[4] = self;
  dispatch_group_async(doneGroup, accumQueue, block);
  return 1;
}

uint64_t __35__PILongExposureAccumulator_start___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)cancel
{
  id v3 = [MEMORY[0x1E4F7A438] canceledError:@"Accumulation was cancelled" object:0];
  [(PILongExposureAccumulator *)self set_accumError:v3];
}

- (id)workingColorSpace
{
  return (id)[MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F7A448] sharedFactory];
  id v4 = [v3 surfaceStoragePool];

  [v4 returnStorage:self->_temporaryDestinationStorage];
  [v4 returnStorage:self->_averageAccumulationStorage];
  [v4 returnStorage:self->_minimumAccumulationStorage];
  [v4 returnStorage:self->_maximumAccumulationStorage];
  accumSemaphore = self->_accumSemaphore;
  self->_accumSemaphore = 0;

  readySemaphore = self->_readySemaphore;
  self->_readySemaphore = 0;

  v7.receiver = self;
  v7.super_class = (Class)PILongExposureAccumulator;
  [(PILongExposureAccumulator *)&v7 dealloc];
}

- (PILongExposureAccumulator)initWithSize:(id)a3 renderer:(id)a4 jobNumber:(unint64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v48[3] = *MEMORY[0x1E4F143B8];
  long long v9 = (NURenderer *)a4;
  v46.receiver = self;
  v46.super_class = (Class)PILongExposureAccumulator;
  double v10 = [(PILongExposureAccumulator *)&v46 init];
  v10->_pixelSize.int64_t width = var0;
  v10->_pixelSize.int64_t height = var1;
  renderer = v10->_renderer;
  v10->_renderer = v9;
  id v12 = v9;

  v10->_jobNumber = a5;
  id v13 = [MEMORY[0x1E4F7A448] sharedFactory];
  float v14 = [v13 surfaceStoragePool];

  uint64_t v15 = [MEMORY[0x1E4F7A5D8] RGBAh];
  uint64_t v16 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v15);
  temporaryDestinationStorage = v10->_temporaryDestinationStorage;
  v10->_temporaryDestinationStorage = (NUSurfaceStorage *)v16;

  BOOL v18 = [MEMORY[0x1E4F7A5D8] RGBAh];
  uint64_t v19 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v18);
  averageAccumulationStorage = v10->_averageAccumulationStorage;
  v10->_averageAccumulationStorage = (NUSurfaceStorage *)v19;

  uint64_t v21 = [MEMORY[0x1E4F7A5D8] RGBAh];
  uint64_t v22 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v21);
  minimumAccumulationStorage = v10->_minimumAccumulationStorage;
  v10->_minimumAccumulationStorage = (NUSurfaceStorage *)v22;

  id v24 = [MEMORY[0x1E4F7A5D8] RGBAh];
  uint64_t v25 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v24);
  maximumAccumulationStorage = v10->_maximumAccumulationStorage;
  v10->_maximumAccumulationStorage = (NUSurfaceStorage *)v25;

  uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  inputFrames = v10->_inputFrames;
  v10->_inputFrames = (NSMutableArray *)v27;

  dispatch_queue_t v29 = dispatch_queue_create("PILongExposureAccumulator.state", 0);
  stateQueue = v10->_stateQueue;
  v10->_stateQueue = (OS_dispatch_queue *)v29;

  dispatch_queue_t v31 = dispatch_queue_create("PILongExposureAccumulator.accum", 0);
  accumQueue = v10->_accumQueue;
  v10->_accumQueue = (OS_dispatch_queue *)v31;

  dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
  accumSemaphore = v10->_accumSemaphore;
  v10->_accumSemaphore = (OS_dispatch_semaphore *)v33;

  dispatch_semaphore_t v35 = dispatch_semaphore_create(3);
  readySemaphore = v10->_readySemaphore;
  v10->_readySemaphore = (OS_dispatch_semaphore *)v35;

  dispatch_group_t v37 = dispatch_group_create();
  doneGroup = v10->_doneGroup;
  v10->_doneGroup = (OS_dispatch_group *)v37;

  v39 = [(PILongExposureAccumulator *)v10 workingColorSpace];
  v47[0] = *MEMORY[0x1E4F1E390];
  uint64_t v40 = [v39 CGColorSpace];
  uint64_t v41 = *MEMORY[0x1E4F1E328];
  v48[0] = v40;
  v48[1] = MEMORY[0x1E4F1CC38];
  uint64_t v42 = *MEMORY[0x1E4F1E378];
  v47[1] = v41;
  v47[2] = v42;
  v48[2] = MEMORY[0x1E4F1CC38];
  uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  imageOptions = v10->_imageOptions;
  v10->_imageOptions = (NSDictionary *)v43;

  return v10;
}

@end