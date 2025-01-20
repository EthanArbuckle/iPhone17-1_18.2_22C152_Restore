@interface TSIDSSubscriptionSelector
+ (id)activeIMessageSlots;
+ (void)activeIMessageSlots;
+ (void)doRegistrationForIMessage:(id)a3;
+ (void)registerSlotsForIMessage:(id)a3;
@end

@implementation TSIDSSubscriptionSelector

+ (id)activeIMessageSlots
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  id v23 = 0;
  v3 = [v2 selectedSubscriptionsWithError:&v23];
  id v4 = v23;
  if (v4)
  {
    v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[TSIDSSubscriptionSelector activeIMessageSlots]();
    }
    v6 = 0;
    goto LABEL_24;
  }
  v18 = v2;
  v6 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v17 = v3;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v20;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "subscriptionSlot", v17);
      if (v12)
      {
        if (v12 == 2)
        {
          v13 = v6;
          v14 = &unk_26DC144E8;
        }
        else
        {
          if (v12 != 1) {
            goto LABEL_19;
          }
          v13 = v6;
          v14 = &unk_26DC144D0;
        }
        [v13 addObject:v14];
      }
      else
      {
        v15 = _TSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[TSIDSSubscriptionSelector activeIMessageSlots];
        }
      }
LABEL_19:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v26 count:16];
  }
  while (v9);
LABEL_21:

  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[TSIDSSubscriptionSelector activeIMessageSlots]();
  }
  v3 = v17;
  v2 = v18;
LABEL_24:

  return v6;
}

+ (void)registerSlotsForIMessage:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = dispatch_queue_create("iMessage Background", 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__TSIDSSubscriptionSelector_registerSlotsForIMessage___block_invoke;
    block[3] = &unk_2648279D0;
    id v7 = v3;
    dispatch_async(v4, block);

    v5 = v7;
  }
  else
  {
    v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "+[TSIDSSubscriptionSelector registerSlotsForIMessage:]";
      _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "Empty input @%s", buf, 0xCu);
    }
  }
}

uint64_t __54__TSIDSSubscriptionSelector_registerSlotsForIMessage___block_invoke(uint64_t a1)
{
  return +[TSIDSSubscriptionSelector doRegistrationForIMessage:*(void *)(a1 + 32)];
}

+ (void)doRegistrationForIMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v16 = objc_opt_new();
  id v4 = [v16 selectedSubscriptionsWithError:0];
  v5 = (void *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_opt_new();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) integerValue];
        if ((unint64_t)(v11 - 1) >= 2)
        {
          v13 = _TSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[TSIDSSubscriptionSelector doRegistrationForIMessage:v13];
          }
        }
        else
        {
          uint64_t v12 = v11;
          v13 = [MEMORY[0x263F4A078] phoneSubscriptionWithSubscriptionSlot:v11];
          if (v13)
          {
            [v5 addObject:v13];
          }
          else
          {
            v14 = _TSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v22 = v12;
              __int16 v23 = 2080;
              v24 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]";
              _os_log_error_impl(&dword_227A17000, v14, OS_LOG_TYPE_ERROR, "[E]Skipping slot %lu @%s", buf, 0x16u);
            }
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[TSIDSSubscriptionSelector doRegistrationForIMessage:]();
    }

    [v16 setSelectedSubscriptions:v5 withCompletion:&__block_literal_global_15];
  }
}

void __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);
  }
}

+ (void)activeIMessageSlots
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSIDSSubscriptionSelector activeIMessageSlots]";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]Error: %@ @%s", v1, 0x16u);
}

+ (void)doRegistrationForIMessage:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db]  %@ @%s", v1, 0x16u);
}

+ (void)doRegistrationForIMessage:(os_log_t)log .cold.2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Invalid slot - skipping @%s", buf, 0xCu);
}

void __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2080;
  uint64_t v8 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Selection %@, Error %@ @%s", (uint8_t *)&v3, 0x20u);
}

@end