@interface LTDTranslationOperationScheduler
@end

@implementation LTDTranslationOperationScheduler

void __51___LTDTranslationOperationScheduler_initWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[1] operationCount];
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 134217984;
        uint64_t v7 = v4;
        _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Offline engine queue has pending operations: %zu", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

@end