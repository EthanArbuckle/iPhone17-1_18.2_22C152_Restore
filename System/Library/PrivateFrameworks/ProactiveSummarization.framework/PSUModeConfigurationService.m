@interface PSUModeConfigurationService
- (BOOL)doesModeHaveIntelligentBreakthroughEnabled:(id)a3;
- (PSUModeConfigurationService)init;
- (void)_updateModesWithIntelligentBreakthroughEnabled;
@end

@implementation PSUModeConfigurationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_modesWithIntelligentBreakthroughEnabled, 0);
}

- (void)_updateModesWithIntelligentBreakthroughEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  modeService = v2->_modeService;
  id v7 = 0;
  v4 = [(DNDModeConfigurationService *)modeService modeConfigurationsReturningError:&v7];
  id v5 = v7;
  if (v4)
  {
    [(NSMutableSet *)v2->_modesWithIntelligentBreakthroughEnabled removeAllObjects];
    v2->_didCompleteOneSuccessfulModeConfigurationFetch = 1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __77__PSUModeConfigurationService__updateModesWithIntelligentBreakthroughEnabled__block_invoke;
    v6[3] = &unk_26547FA30;
    v6[4] = v2;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_25A8BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not fetch mode configurations: %@", buf, 0xCu);
  }

  objc_sync_exit(v2);
}

void __77__PSUModeConfigurationService__updateModesWithIntelligentBreakthroughEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  v4 = [v10 configuration];
  uint64_t v5 = [v4 allowIntelligentManagement];

  if (v5 == 2)
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    id v7 = [v10 mode];
    v8 = [v7 identifier];
    id v9 = [v8 UUIDString];
    [v6 addObject:v9];
  }
}

- (BOOL)doesModeHaveIntelligentBreakthroughEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!v5->_didCompleteOneSuccessfulModeConfigurationFetch) {
    [(PSUModeConfigurationService *)v5 _updateModesWithIntelligentBreakthroughEnabled];
  }
  char v6 = [(NSMutableSet *)v5->_modesWithIntelligentBreakthroughEnabled containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (PSUModeConfigurationService)init
{
  v10.receiver = self;
  v10.super_class = (Class)PSUModeConfigurationService;
  v2 = [(PSUModeConfigurationService *)&v10 init];
  if (v2)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)getDNDModeConfigurationServiceClass_softClass;
    uint64_t v15 = getDNDModeConfigurationServiceClass_softClass;
    if (!getDNDModeConfigurationServiceClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getDNDModeConfigurationServiceClass_block_invoke;
      v11[3] = &unk_26547FA58;
      v11[4] = &v12;
      __getDNDModeConfigurationServiceClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v12, 8);
    uint64_t v5 = [v4 serviceForClientIdentifier:@"com.apple.proactive.summarization"];
    modeService = v2->_modeService;
    v2->_modeService = (DNDModeConfigurationService *)v5;

    uint64_t v7 = objc_opt_new();
    modesWithIntelligentBreakthroughEnabled = v2->_modesWithIntelligentBreakthroughEnabled;
    v2->_modesWithIntelligentBreakthroughEnabled = (NSMutableSet *)v7;

    [(PSUModeConfigurationService *)v2 _updateModesWithIntelligentBreakthroughEnabled];
    [(DNDModeConfigurationService *)v2->_modeService addListener:v2 withCompletionHandler:&__block_literal_global_90];
  }
  return v2;
}

void __35__PSUModeConfigurationService_init__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_25A8BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not add mode configuration listener: %@", (uint8_t *)&v5, 0xCu);
  }
}

@end