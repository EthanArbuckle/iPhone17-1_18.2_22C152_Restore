@interface RBLogAddStateCaptureBlockWithTitle
@end

@implementation RBLogAddStateCaptureBlockWithTitle

_DWORD *___RBLogAddStateCaptureBlockWithTitle_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v17 = 0;
  v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:&v17];
  id v5 = v17;
  if (v4 && (unint64_t)([v4 length] + 200) <= 0x8000)
  {
    size_t v6 = [v4 length];
    v7 = malloc_type_calloc(1uLL, v6 + 200, 0xAA855B6FuLL);
    _DWORD *v7 = 1;
    v7[1] = v6;
    [*(id *)(a1 + 32) UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v4 bytes], v6);
  }
  else
  {
    v8 = rbs_state_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9) {
        ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(a1, v5, v8);
      }
    }
    else if (v9)
    {
      ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1(a1, v8, v10, v11, v12, v13, v14, v15);
    }

    v7 = 0;
  }

  return v7;
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "Error: RBLogAddStateCaptureBlockWithTitle(%@) state data format error: %@", (uint8_t *)&v6, 0x16u);
}

@end