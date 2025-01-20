@interface TVRUIIntentManager
+ (void)_donateInteractionforIntent:(id)a3 launchID:(id)a4;
+ (void)donateIntentsForDeviceWithID:(id)a3 name:(id)a4;
@end

@implementation TVRUIIntentManager

+ (void)donateIntentsForDeviceWithID:(id)a3 name:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _TVRUIIntentManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "+[TVRUIIntentManager donateIntentsForDeviceWithID:name:]";
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v9 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__TVRUIIntentManager_donateIntentsForDeviceWithID_name___block_invoke;
    block[3] = &unk_264800C50;
    v12 = v6;
    id v13 = v7;
    id v14 = a1;
    dispatch_async(v9, block);

    v10 = v12;
  }
  else
  {
    v10 = _TVRUIIntentManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[TVRUIIntentManager donateIntentsForDeviceWithID:name:]((uint64_t)v6, (uint64_t)v7, v10);
    }
  }
}

void __56__TVRUIIntentManager_donateIntentsForDeviceWithID_name___block_invoke(uint64_t a1)
{
  v5 = [[TVRDevice alloc] initWithIdentifier:*(void *)(a1 + 32) displayString:*(void *)(a1 + 40) pronunciationHint:*(void *)(a1 + 40)];
  v2 = objc_alloc_init(WakeAppleTVIntent);
  [(WakeAppleTVIntent *)v2 setDevice:v5];
  [*(id *)(a1 + 48) _donateInteractionforIntent:v2 launchID:@"com.apple.TVRemoteUIService"];
  v3 = objc_alloc_init(LaunchRemoteIntent);
  [(LaunchRemoteIntent *)v3 setDevice:v5];
  [*(id *)(a1 + 48) _donateInteractionforIntent:v3 launchID:@"com.apple.TVRemoteUIService"];
  v4 = objc_alloc_init(LaunchTVAppIntent);
  [(LaunchTVAppIntent *)v4 setDevice:v5];
  [*(id *)(a1 + 48) _donateInteractionforIntent:v4 launchID:@"com.apple.TVRemoteUIService"];
}

+ (void)_donateInteractionforIntent:(id)a3 launchID:(id)a4
{
  id v4 = a3;
  [v4 _setLaunchId:@"com.apple.TVRemoteUIService"];
  v5 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v4 response:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke;
  v8[3] = &unk_264800C78;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 donateInteractionWithCompletion:v8];
}

void __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _TVRUIIntentManagerLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Successfully donated intent=%{public}@, interaction=%{public}@, ", (uint8_t *)&v8, 0x16u);
  }
}

+ (void)donateIntentsForDeviceWithID:(os_log_t)log name:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Cannot donate intents due to deviceID or name being invalid. deviceID - %@. Name - %@", (uint8_t *)&v3, 0x16u);
}

void __59__TVRUIIntentManager__donateInteractionforIntent_launchID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Error donating intent=%{public}@, interaction=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end