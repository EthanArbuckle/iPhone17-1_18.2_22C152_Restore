@interface WFCarPlayConnectionTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFCarPlayConnectionTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      v14 = "-[WFCarPlayConnectionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay connection event %@ for trigger with setting", (uint8_t *)&v13, 0x16u);
    }

    v10 = objc_opt_new();
    if ([a1 onConnect]) {
      [v10 addObject:MEMORY[0x1E4F1CC38]];
    }
    if ([a1 onDisconnect]) {
      [v10 addObject:MEMORY[0x1E4F1CC28]];
    }
    v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isStart"));
    v7[2](v7, [v10 containsObject:v11]);
  }
  else
  {

    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[WFCarPlayConnectionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s No CarPlay event received for trigger; not firing.",
        (uint8_t *)&v13,
        0xCu);
    }

    v7[2](v7, 0);
  }
}

- (id)publisherWithScheduler:()BiomeContext
{
  v3 = (void *)MEMORY[0x1E4F504C8];
  id v4 = a3;
  v5 = [v3 carPlayStream];
  v6 = [v5 publisher];
  v7 = [v6 subscribeOn:v4];

  return v7;
}

@end