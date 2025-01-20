@interface SVXRemoteExpressionParsingService
@end

@implementation SVXRemoteExpressionParsingService

void __74___SVXRemoteExpressionParsingService_parseExpressions_targetDevice_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [v3 parsedExpressions];
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);
  }
  else
  {
    v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[_SVXRemoteExpressionParsingService parseExpressions:targetDevice:reply:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Got an unknown response %@ when attempting to parse expressions. Bailing", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
  }
}

@end