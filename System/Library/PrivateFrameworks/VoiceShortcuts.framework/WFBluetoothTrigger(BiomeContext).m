@interface WFBluetoothTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFBluetoothTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[WFBluetoothTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received Bluetooth connection event %@ for trigger with setting", (uint8_t *)&v15, 0x16u);
    }

    int v10 = [v8 starting];
    if (v10 != [a1 onConnect]
      && (int v11 = [v8 starting], v11 == objc_msgSend(a1, "onDisconnect")))
    {
      v7[2](v7, 0);
    }
    else if ([a1 selection] == 1)
    {
      v12 = [a1 selectedDevices];
      v13 = [v8 name];
      v7[2](v7, [v12 containsObject:v13]);
    }
    else
    {
      v7[2](v7, 1);
    }
  }
  else
  {

    v14 = getWFTriggersLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      v16 = "-[WFBluetoothTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s No Bluetooth event received for trigger; not firing.",
        (uint8_t *)&v15,
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
  v7 = [v6 Bluetooth];

  v8 = [v7 DSLPublisher];
  v9 = [v8 subscribeOn:v3];

  return v9;
}

@end