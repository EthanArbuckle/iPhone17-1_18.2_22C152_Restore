@interface WFExternalDisplayTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFExternalDisplayTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v9 = [v8 starting];
    if (v9 == [a1 onConnect])
    {
      uint64_t v11 = 1;
    }
    else
    {
      int v10 = [v8 starting];
      uint64_t v11 = v10 ^ [a1 onDisconnect];
    }
    v7[2](v7, v11);
  }
  else
  {

    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[WFExternalDisplayTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s No display event received for trigger; not firing.",
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
  v5 = [v4 SpringBoard];
  v6 = [v5 ExternalDisplay];
  v7 = [v6 DisplayConnected];

  v8 = [v7 DSLPublisher];
  int v9 = [v8 subscribeOn:v3];

  return v9;
}

@end