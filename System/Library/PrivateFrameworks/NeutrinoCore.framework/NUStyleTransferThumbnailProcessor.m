@interface NUStyleTransferThumbnailProcessor
@end

@implementation NUStyleTransferThumbnailProcessor

BOOL __79___NUStyleTransferThumbnailProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 metalTexture];
  v6 = [*(id *)(a1 + 40) metalTexture];
  int v7 = [v4 downScaleInputTexture:v5 toOutputTexture:v6];

  if (v7)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "*** Failed to rescale StyleEngine: %d", (uint8_t *)v10, 8u);
    }
  }
  return v7 == 0;
}

@end