@interface WFAirplaneModeTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFAirplaneModeTrigger(BiomeContext)

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
      v14 = "-[WFAirplaneModeTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received Airplane Mode connection event %@ for trigger with setting", (uint8_t *)&v13, 0x16u);
    }

    v10 = objc_opt_new();
    if ([a1 onEnable]) {
      [v10 addObject:MEMORY[0x1E4F1CC38]];
    }
    if ([a1 onDisable]) {
      [v10 addObject:MEMORY[0x1E4F1CC28]];
    }
    v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "starting"));
    v7[2](v7, [v10 containsObject:v11]);
  }
  else
  {

    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[WFAirplaneModeTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s No Airplane Mode event received for trigger; not firing.",
        (uint8_t *)&v13,
        0xCu);
    }

    v7[2](v7, 0);
  }
}

- (id)publisherWithScheduler:()BiomeContext
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 Device];
  v6 = [v5 Wireless];
  v7 = [v6 AirplaneMode];

  v8 = [v7 DSLPublisher];
  v9 = [v8 subscribeOn:v3];

  return v9;
}

@end