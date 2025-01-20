@interface ISRootSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (ISPerformanceDiagnosticsSettings)performanceDiagnosticsSettings;
- (ISPlayerSettings)playerSettings;
- (ISVitalitySettings)vitalitySettings;
- (void)save;
- (void)setDefaultValues;
- (void)setPerformanceDiagnosticsSettings:(id)a3;
- (void)setPlayerSettings:(id)a3;
- (void)setVitalitySettings:(id)a3;
@end

@implementation ISRootSettings

- (ISVitalitySettings)vitalitySettings
{
  return self->_vitalitySettings;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ISRootSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2587 != -1) {
    dispatch_once(&sharedInstance_onceToken_2587, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_vitalitySettings, 0);

  objc_storeStrong((id *)&self->_playerSettings, 0);
}

- (void)setPerformanceDiagnosticsSettings:(id)a3
{
}

- (ISPerformanceDiagnosticsSettings)performanceDiagnosticsSettings
{
  return self->_performanceDiagnosticsSettings;
}

- (void)setVitalitySettings:(id)a3
{
}

- (void)setPlayerSettings:(id)a3
{
}

- (ISPlayerSettings)playerSettings
{
  return self->_playerSettings;
}

- (void)save
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"SettingsVersionKey";
  v3 = [NSNumber numberWithInteger:12];
  v8[1] = @"SettingsArchiveKey";
  v9[0] = v3;
  v4 = [(PTSettings *)self archiveDictionary];
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [(id)objc_opt_class() _defaultsKey];
  [v6 setObject:v5 forKey:v7];
}

- (void)setDefaultValues
{
  v6.receiver = self;
  v6.super_class = (Class)ISRootSettings;
  [(PTSettings *)&v6 setDefaultValues];
  v3 = [(ISRootSettings *)self playerSettings];
  [v3 setDefaultValues];

  v4 = [(ISRootSettings *)self vitalitySettings];
  [v4 setDefaultValues];

  v5 = [(ISRootSettings *)self performanceDiagnosticsSettings];
  [v5 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Player" childSettingsKeyPath:@"playerSettings"];
  v20[0] = v3;
  v4 = [MEMORY[0x1E4F94130] rowWithTitle:@"Vitality" childSettingsKeyPath:@"vitalitySettings"];
  v20[1] = v4;
  v5 = [MEMORY[0x1E4F94130] rowWithTitle:@"Performance Diagnostics" childSettingsKeyPath:@"performanceDiagnosticsSettings"];
  v20[2] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v7 = [v2 sectionWithRows:v6];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v11 = [v9 rowWithTitle:@"Restore All Defaults" action:v10];
  v19 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v13 = [v8 sectionWithRows:v12];

  v14 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v7;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"PhotosPlayer" contents:v15];

  return v16;
}

void __32__ISRootSettings_sharedInstance__block_invoke(uint64_t a1)
{
  if (PFOSVariantHasInternalUI())
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = [*(id *)(a1 + 32) _defaultsKey];
    v4 = [v2 objectForKey:v3];

    v5 = [v4 objectForKeyedSubscript:@"SettingsVersionKey"];
    if ([v5 integerValue] == 12)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"SettingsArchiveKey"];
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = [*(id *)(a1 + 32) settingsFromArchiveDictionary:v6];
        v9 = (void *)sharedInstance_sharedInstance;
        sharedInstance_sharedInstance = v8;
      }
    }
  }
  if (!sharedInstance_sharedInstance)
  {
    v10 = [(PTSettings *)[ISRootSettings alloc] initWithDefaultValues];
    uint64_t v11 = sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v10;
    MEMORY[0x1F41817F8](v10, v11);
  }
}

@end