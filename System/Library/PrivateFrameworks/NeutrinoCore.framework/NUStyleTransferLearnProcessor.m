@interface NUStyleTransferLearnProcessor
@end

@implementation NUStyleTransferLearnProcessor

uint64_t __75___NUStyleTransferLearnProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) region];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v3 configuration];
  +[_NUStyleEngineConfiguration coefficientTextureSizeForStyleEngineConfiguration:v12];
  double v14 = v13;
  double v16 = v15;

  if (v9 != v14 || v11 != v16)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v18 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v36 = 134218752;
    double v37 = v9;
    __int16 v38 = 2048;
    double v39 = v11;
    __int16 v40 = 2048;
    double v41 = v14;
    __int16 v42 = 2048;
    double v43 = v16;
    v19 = "*** Unexpected style buffer size: %0.0fx%0.0f, expected: %0.0fx%0.0f";
    v20 = v18;
    uint32_t v21 = 42;
    goto LABEL_28;
  }
  if (v5 != *MEMORY[0x1E4F1DAD8] || v7 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v23 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v36 = 134218240;
    double v37 = v5;
    __int16 v38 = 2048;
    double v39 = v7;
    v19 = "*** Unexpected style buffer origin: %0.0fx%0.0f, expected: 0x0";
    v20 = v23;
    uint32_t v21 = 22;
    goto LABEL_28;
  }
  v24 = [*(id *)(a1 + 32) metalTexture];
  [v3 setOutputLinearSystemCoefficientsTexture:v24];

  v25 = [*(id *)(a1 + 40) metalTexture];
  [v3 setInputThumbnailTexture:v25];

  v26 = [*(id *)(a1 + 48) metalTexture];
  [v3 setTargetThumbnailTexture:v26];

  int v27 = [v3 prepareToProcess:1];
  if (v27)
  {
    int v28 = v27;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    uint64_t v29 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    double v30 = *(double *)(a1 + 56);
    int v36 = 138412546;
    double v37 = v30;
    __int16 v38 = 1024;
    LODWORD(v39) = v28;
    v19 = "*** Failed to prepare %@: %d";
    goto LABEL_27;
  }
  int v31 = [v3 process];
  if (!v31)
  {
    uint64_t v34 = 1;
    goto LABEL_30;
  }
  int v32 = v31;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  uint64_t v29 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    double v33 = *(double *)(a1 + 56);
    int v36 = 138412546;
    double v37 = v33;
    __int16 v38 = 1024;
    LODWORD(v39) = v32;
    v19 = "*** Failed to process %@: %d";
LABEL_27:
    v20 = v29;
    uint32_t v21 = 18;
LABEL_28:
    _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v36, v21);
  }
LABEL_29:
  uint64_t v34 = 0;
LABEL_30:

  return v34;
}

@end