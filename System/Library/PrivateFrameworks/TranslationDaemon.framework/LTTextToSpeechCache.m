@interface LTTextToSpeechCache
@end

@implementation LTTextToSpeechCache

void __46___LTTextToSpeechCache_cacheAudioData_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

uint64_t __40___LTTextToSpeechCache_audioDataForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

void __29___LTTextToSpeechCache_clear__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[2] count];
    if (v3 >= 1)
    {
      uint64_t v4 = v3;
      v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 134217984;
        uint64_t v7 = v4;
        _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Purging %ld items from TTS cache", (uint8_t *)&v6, 0xCu);
      }
      [v2[2] removeAllObjects];
    }
  }
}

@end