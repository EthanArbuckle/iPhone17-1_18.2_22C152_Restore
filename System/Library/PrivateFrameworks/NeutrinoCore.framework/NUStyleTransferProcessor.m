@interface NUStyleTransferProcessor
@end

@implementation NUStyleTransferProcessor

uint64_t __70___NUStyleTransferProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) CGRectValue];
  double v5 = v4;
  double v7 = v6;
  v8 = [v3 configuration];
  [v8 thumbnailSize];
  double v10 = v9;
  double v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    v36 = NUAssertLogger_27648();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = [NSString stringWithFormat:@"Thumbnail size doesn't match the thumbnail extent"];
      *(_DWORD *)v53 = 138543362;
      *(void *)&v53[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v53, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_27648();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)v53 = 138543618;
        *(void *)&v53[4] = v44;
        __int16 v54 = 2114;
        v55 = v48;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v53, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)v53 = 138543362;
      *(void *)&v53[4] = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v53, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2051, @"Thumbnail size doesn't match the thumbnail extent", v49, v50, v51, v52, *(uint64_t *)v53);
  }
  v14 = [*(id *)(a1 + 40) metalTexture];
  [v3 setInputThumbnailTexture:v14];

  v15 = [*(id *)(a1 + 48) metalTexture];
  [v3 setTargetThumbnailTexture:v15];

  objc_msgSend(v3, "setImageSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(v3, "setRegionToRender:", NURectFlipYOrigin(*(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  v16 = [*(id *)(a1 + 56) metalTexture];
  [v3 setInputTexture:v16];

  [*(id *)(a1 + 56) region];
  objc_msgSend(v3, "setInputImageRect:", NURectFlipYOrigin(v17, v18, v19, v20, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  v21 = [*(id *)(a1 + 64) metalTexture];
  [v3 setOutputTexture:v21];

  [*(id *)(a1 + 64) region];
  objc_msgSend(v3, "setOutputImageRect:", NURectFlipYOrigin(v22, v23, v24, v25, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  int v26 = [v3 prepareToProcess:5];
  if (v26)
  {
    int v27 = v26;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v28 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v29 = *(void *)(a1 + 136);
    *(_DWORD *)v53 = 138412546;
    *(void *)&v53[4] = v29;
    __int16 v54 = 1024;
    LODWORD(v55) = v27;
    v30 = "*** Failed to prepare %@: %d";
    goto LABEL_19;
  }
  int v31 = [v3 process];
  if (!v31)
  {
    uint64_t v33 = 1;
    goto LABEL_16;
  }
  int v32 = v31;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  v28 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = *(void *)(a1 + 136);
    *(_DWORD *)v53 = 138412546;
    *(void *)&v53[4] = v35;
    __int16 v54 = 1024;
    LODWORD(v55) = v32;
    v30 = "*** Failed to process %@: %d";
LABEL_19:
    _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, v30, v53, 0x12u);
  }
LABEL_15:
  uint64_t v33 = 0;
LABEL_16:

  return v33;
}

@end