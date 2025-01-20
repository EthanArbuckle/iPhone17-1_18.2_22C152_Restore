@interface CALogger
+ (void)postCAEventFor:(id)a3 eventInput:(id)a4;
@end

@implementation CALogger

+ (void)postCAEventFor:(id)a3 eventInput:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  AnalyticsSendEventLazy();
}

id __38__CALogger_postCAEventFor_eventInput___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_263826000, v2, OS_LOG_TYPE_DEBUG, "Posting for %@ = %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = *(void **)(a1 + 40);

  return v5;
}

@end