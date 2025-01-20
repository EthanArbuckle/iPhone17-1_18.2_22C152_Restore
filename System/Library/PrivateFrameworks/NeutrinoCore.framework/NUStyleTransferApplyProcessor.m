@interface NUStyleTransferApplyProcessor
@end

@implementation NUStyleTransferApplyProcessor

uint64_t __75___NUStyleTransferApplyProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 configuration];
  +[_NUStyleEngineConfiguration coefficientTextureSizeForStyleEngineConfiguration:v4];
  double v6 = v5;
  double v8 = v7;

  if (*(double *)(a1 + 104) != v6 || *(double *)(a1 + 112) != v8)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v10 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    uint64_t v11 = *(void *)(a1 + 104);
    uint64_t v12 = *(void *)(a1 + 112);
    int v51 = 134218752;
    uint64_t v52 = v11;
    __int16 v53 = 2048;
    uint64_t v54 = v12;
    __int16 v55 = 2048;
    double v56 = v6;
    __int16 v57 = 2048;
    double v58 = v8;
    v13 = "*** Unexpected style buffer size: %0.0fx%0.0f, expected: %0.0fx%0.0f";
    v14 = v10;
    uint32_t v15 = 42;
    goto LABEL_34;
  }
  if (*(double *)(a1 + 88) != *MEMORY[0x1E4F1DAD8] || *(double *)(a1 + 96) != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v17 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    uint64_t v18 = *(void *)(a1 + 88);
    uint64_t v19 = *(void *)(a1 + 96);
    int v51 = 134218240;
    uint64_t v52 = v18;
    __int16 v53 = 2048;
    uint64_t v54 = v19;
    v13 = "*** Unexpected style buffer origin: %0.0fx%0.0f, expected: 0x0";
    v14 = v17;
    uint32_t v15 = 22;
    goto LABEL_34;
  }
  objc_msgSend(v3, "setImageSize:", *(double *)(a1 + 136), *(double *)(a1 + 144));
  objc_msgSend(v3, "setRegionToRender:", NURectFlipYOrigin(*(CGFloat *)(a1 + 152), *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  v20 = [*(id *)(a1 + 32) metalTexture];
  [v3 setInputTexture:v20];

  [*(id *)(a1 + 32) region];
  objc_msgSend(v3, "setInputImageRect:", NURectFlipYOrigin(v21, v22, v23, v24, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  v25 = [*(id *)(a1 + 40) metalTexture];
  [v3 setInputLinearSystemCoefficientsTexture:v25];

  v26 = *(void **)(a1 + 48);
  if (v26)
  {
    v27 = [v26 metalTexture];
    [v3 setInputThumbnailTexture:v27];
  }
  v28 = *(void **)(a1 + 56);
  if (v28)
  {
    v29 = [v28 metalTexture];
    [v3 setInputDeltaMapTexture:v29];

    [*(id *)(a1 + 56) region];
    objc_msgSend(v3, "setInputDeltaMapImageRect:", NURectFlipYOrigin(v30, v31, v32, v33, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  }
  v34 = *(void **)(a1 + 64);
  if (v34)
  {
    v35 = [v34 metalTexture];
    [v3 setTargetThumbnailTexture:v35];
  }
  v36 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"noiseModel"];
  [v3 setInputNoiseModel:v36];

  v37 = [*(id *)(a1 + 80) metalTexture];
  [v3 setOutputTexture:v37];

  [*(id *)(a1 + 80) region];
  objc_msgSend(v3, "setOutputImageRect:", NURectFlipYOrigin(v38, v39, v40, v41, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  int v42 = [v3 prepareToProcess:6];
  if (v42)
  {
    int v43 = v42;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v44 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    uint64_t v45 = *(void *)(a1 + 184);
    int v51 = 138412546;
    uint64_t v52 = v45;
    __int16 v53 = 1024;
    LODWORD(v54) = v43;
    v13 = "*** Failed to prepare %@: %d";
    goto LABEL_33;
  }
  int v46 = [v3 process];
  if (!v46)
  {
    uint64_t v49 = 1;
    goto LABEL_36;
  }
  int v47 = v46;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  uint64_t v44 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v48 = *(void *)(a1 + 184);
    int v51 = 138412546;
    uint64_t v52 = v48;
    __int16 v53 = 1024;
    LODWORD(v54) = v47;
    v13 = "*** Failed to process %@: %d";
LABEL_33:
    v14 = v44;
    uint32_t v15 = 18;
LABEL_34:
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v51, v15);
  }
LABEL_35:
  uint64_t v49 = 0;
LABEL_36:

  return v49;
}

@end