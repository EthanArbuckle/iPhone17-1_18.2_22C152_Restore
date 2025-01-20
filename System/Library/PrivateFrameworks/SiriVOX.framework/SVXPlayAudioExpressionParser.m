@interface SVXPlayAudioExpressionParser
@end

@implementation SVXPlayAudioExpressionParser

void __54___SVXPlayAudioExpressionParser_parsePlayAudio_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = [v5 firstObject];
    v8 = (os_log_t *)MEMORY[0x263F28348];
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      v16 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Service successfully parsed expression: %@", (uint8_t *)&v15, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = *(void *)(a1 + 40);
      v11 = [v7 attachment];
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 1, v11);
    }
    else
    {
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        v16 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]_block_invoke";
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Parsed expression has no data: %@", (uint8_t *)&v15, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 32);
      int v15 = 136315394;
      v16 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s Service failed to parse expression: %@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end