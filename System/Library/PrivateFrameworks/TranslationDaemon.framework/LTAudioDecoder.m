@interface LTAudioDecoder
@end

@implementation LTAudioDecoder

uint64_t __33___LTAudioDecoder_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(_LTAudioDecoder);
  return MEMORY[0x270F9A758]();
}

uint64_t __40___LTAudioDecoder_decodeChunk_outError___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  unint64_t v8 = *a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= v8)
  {
    if (v8 == 1)
    {
      int v11 = [*(id *)(a1 + 32) length];
      id v12 = *(id *)(a1 + 32);
      *(void *)(a3 + 16) = [v12 bytes];
      *(_DWORD *)(a3 + 12) = v11;
      if (a4)
      {
        uint64_t v13 = *(void *)(a1 + 56);
        *(void *)uint64_t v13 = 0;
        *(_DWORD *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 12) = v11;
        *a4 = v13;
      }
      --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      uint64_t v9 = 1752524863;
      v14 = _LTOSLogTTS();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __40___LTAudioDecoder_decodeChunk_outError___block_invoke_cold_1(a2, v14);
      }
    }
  }
  else
  {
    uint64_t v9 = 1836086393;
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v10 = *(void **)(a1 + 56);
      void *v10 = 0;
      v10[1] = 0;
      *a4 = v10;
    }
  }
  return v9;
}

void __40___LTAudioDecoder_decodeChunk_outError___block_invoke_cold_1(unsigned int *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Only expecting to get 1 packet at a time, not %lu", (uint8_t *)&v3, 0xCu);
}

@end