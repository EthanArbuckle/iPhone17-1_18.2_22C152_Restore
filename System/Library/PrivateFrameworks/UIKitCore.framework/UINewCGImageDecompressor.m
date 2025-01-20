@interface UINewCGImageDecompressor
@end

@implementation UINewCGImageDecompressor

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, CGImage *a6)
{
  if (a6)
  {
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a4 userInfo:0];
  }
  [*(id *)(a1 + 32) _finishDecompressingWithImage:a6 error:v9];
  CGImageRetain(a6);
  v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_2;
  v13[3] = &unk_1E52F2EC0;
  v16 = a6;
  int v17 = a4;
  id v11 = *(id *)(a1 + 40);
  id v14 = v9;
  id v15 = v11;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 44);
  v4 = *(void **)(v2 + 16);
  if ((v3 & 4) != 0) {
    v5 = 0;
  }
  else {
    v5 = v4;
  }
  if ((v3 & 4) == 0) {
    v4 = 0;
  }
  id v6 = v4;
  v7 = UIDecompressorLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v6 domain];
    int v9 = 134218498;
    v10 = v5;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = [v6 code];
    _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "Deferred async reply with image=%p error.domain=%@ error.code=%ld", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = UIDecompressorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = *(_DWORD *)(a1 + 56);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Async reply with image=%p error=(OSStatus) %d", (uint8_t *)&v5, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 48));
}

void __56___UINewCGImageDecompressor__sharedDecompressionSession__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v0 = CMPhotoDecompressionSessionCreate();
  if (v0)
  {
    int v1 = v0;
    uint64_t v2 = UIDecompressorLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 134349056;
      uint64_t v4 = v1;
      _os_log_fault_impl(&dword_1853B0000, v2, OS_LOG_TYPE_FAULT, "Could not create decompression session (%{public}ld)", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t __45___UINewCGImageDecompressor_decompressAsync___block_invoke_21(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = UIDecompressorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = *(_DWORD *)(a1 + 48);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Replying to failed async with error=(OSStatus) %d", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

intptr_t __44___UINewCGImageDecompressor_waitForImageRef__block_invoke(uint64_t a1)
{
  uint64_t v2 = UIDecompressorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Async decode finished; unblocking semaphore", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
}

@end