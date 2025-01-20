@interface WFNFCTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFNFCTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[WFNFCTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received NFC connection event %@ for trigger with setting", (uint8_t *)&v17, 0x16u);
    }

    v10 = [v8 tagID];
    v11 = [a1 tagIdentifier];
    id v12 = v10;
    id v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v15 = 0;
      if (v12 && v13) {
        uint64_t v15 = [v12 isEqualToString:v13];
      }
    }

    v7[2](v7, v15);
  }
  else
  {

    v16 = getWFTriggersLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[WFNFCTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEFAULT, "%s No NFC event received for trigger; not firing.",
        (uint8_t *)&v17,
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
  v7 = [v6 NFCTag];

  v8 = [v7 DSLPublisher];
  v9 = [v8 subscribeOn:v3];

  return v9;
}

@end