@interface WFWifiTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFWifiTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = [v8 eventBody];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315394;
      v30 = "-[WFWifiTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s Received WiFi connection event %@ for trigger with setting", (uint8_t *)&v29, 0x16u);
    }

    int v13 = [v11 starting];
    if (v13 != [a1 onConnect])
    {
      int v14 = [v11 starting];
      if (v14 == [a1 onDisconnect]) {
        goto LABEL_15;
      }
    }
    if ([a1 selection] == 1
      && ([a1 selectedNetworks],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v11 SSID],
          v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v15 containsObject:v16],
          v16,
          v15,
          (v17 & 1) == 0))
    {
LABEL_15:
      v10[2](v10, 0);
    }
    else
    {
      if ([a1 onConnect] && (objc_msgSend(a1, "runAfterConnectionInterruption") & 1) == 0)
      {
        v20 = [MEMORY[0x1E4FB71A8] defaultDatabase];
        v21 = [v20 sortedRunEventsForTriggerID:v9];
        v22 = [v21 descriptors];
        v23 = [v22 firstObject];

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E4F1C9C8];
          [v8 timestamp];
          v25 = objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
          v26 = [v23 date];
          [v25 timeIntervalSinceDate:v26];
          double v28 = v27;

          BOOL v18 = v28 > 180.0;
        }
        else
        {
          BOOL v18 = 1;
        }
      }
      else
      {
        BOOL v18 = 1;
      }
      v10[2](v10, v18);
    }
  }
  else
  {

    v19 = getWFTriggersLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315138;
      v30 = "-[WFWifiTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s No WiFi event received for trigger; not firing.",
        (uint8_t *)&v29,
        0xCu);
    }

    v10[2](v10, 0);
  }
}

- (id)publisherWithScheduler:()BiomeContext
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 Device];
  v6 = [v5 Wireless];
  v7 = [v6 WiFi];

  id v8 = [v7 DSLPublisher];
  id v9 = [v8 subscribeOn:v3];

  return v9;
}

@end