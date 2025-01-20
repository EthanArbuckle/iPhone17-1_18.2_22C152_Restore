@interface PXContentPrivacySettings
+ (PXContentPrivacySettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)contentPrivacyEnabled;
- (BOOL)shouldAlwaysShowUnlockButtonInContentUnavailableViews;
- (id)parentSettings;
- (int64_t)authenticationBehaviorUponAppearing;
- (int64_t)simulatedAuthenticationType;
- (int64_t)simulationMode;
- (void)setAuthenticationBehaviorUponAppearing:(int64_t)a3;
- (void)setDefaultValues;
- (void)setShouldAlwaysShowUnlockButtonInContentUnavailableViews:(BOOL)a3;
- (void)setSimulatedAuthenticationType:(int64_t)a3;
- (void)setSimulationMode:(int64_t)a3;
@end

@implementation PXContentPrivacySettings

+ (PXContentPrivacySettings)sharedInstance
{
  if (sharedInstance_onceToken_193679 != -1) {
    dispatch_once(&sharedInstance_onceToken_193679, &__block_literal_global_193680);
  }
  v2 = (void *)sharedInstance_sharedInstance_193681;
  return (PXContentPrivacySettings *)v2;
}

- (int64_t)simulationMode
{
  return self->_simulationMode;
}

- (int64_t)authenticationBehaviorUponAppearing
{
  return self->_authenticationBehaviorUponAppearing;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXContentPrivacySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXContentPrivacySettings *)self setSimulationMode:0];
  [(PXContentPrivacySettings *)self setSimulatedAuthenticationType:0];
  [(PXContentPrivacySettings *)self setShouldAlwaysShowUnlockButtonInContentUnavailableViews:0];
  [(PXContentPrivacySettings *)self setAuthenticationBehaviorUponAppearing:0];
}

- (void)setSimulationMode:(int64_t)a3
{
  self->_simulationMode = a3;
}

- (void)setSimulatedAuthenticationType:(int64_t)a3
{
  self->_simulatedAuthenticationType = a3;
}

- (void)setShouldAlwaysShowUnlockButtonInContentUnavailableViews:(BOOL)a3
{
  self->_shouldAlwaysShowUnlockButtonInContentUnavailableViews = a3;
}

- (void)setAuthenticationBehaviorUponAppearing:(int64_t)a3
{
  self->_authenticationBehaviorUponAppearing = a3;
}

void __42__PXContentPrivacySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 contentPrivacySettings];
  v1 = (void *)sharedInstance_sharedInstance_193681;
  sharedInstance_sharedInstance_193681 = v0;
}

- (BOOL)shouldAlwaysShowUnlockButtonInContentUnavailableViews
{
  return self->_shouldAlwaysShowUnlockButtonInContentUnavailableViews;
}

- (int64_t)simulatedAuthenticationType
{
  return self->_simulatedAuthenticationType;
}

- (BOOL)contentPrivacyEnabled
{
  if ([(PXContentPrivacySettings *)self simulationMode]) {
    return [(PXContentPrivacySettings *)self simulationMode] == 1;
  }
  return PLIsContentPrivacyEnabled();
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v26 = (void *)MEMORY[0x1E4F941A8];
  id v2 = (void *)MEMORY[0x1E4F941A0];
  v29 = NSStringFromSelector(sel_simulationMode);
  v28 = [v2 rowWithTitle:@"Enablement Simulation" valueKeyPath:v29];
  objc_super v3 = [v28 possibleValues:&unk_1F02D5698 titles:&unk_1F02D56B0];
  v32[0] = v3;
  v4 = (void *)MEMORY[0x1E4F941A0];
  v5 = NSStringFromSelector(sel_simulatedAuthenticationType);
  v6 = [v4 rowWithTitle:@"Auth Type Simulation" valueKeyPath:v5];
  v7 = [v6 possibleValues:&unk_1F02D56C8 titles:&unk_1F02D56E0];
  v32[1] = v7;
  v8 = (void *)MEMORY[0x1E4F941A0];
  v9 = NSStringFromSelector(sel_authenticationBehaviorUponAppearing);
  v10 = [v8 rowWithTitle:@"Authentication on Appearance" valueKeyPath:v9];
  v11 = [v10 possibleValues:&unk_1F02D56F8 titles:&unk_1F02D5710];
  v32[2] = v11;
  v12 = (void *)MEMORY[0x1E4F941C0];
  v13 = NSStringFromSelector(sel_shouldAlwaysShowUnlockButtonInContentUnavailableViews);
  v14 = [v12 rowWithTitle:@"Always show Unlock Button" valueKeyPath:v13];
  v32[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v27 = [v26 sectionWithRows:v15 title:@"General"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = (void *)MEMORY[0x1E4F940F8];
  v18 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v19 = [v17 rowWithTitle:@"Restore Defaults" action:v18];
  v31 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v21 = [v16 sectionWithRows:v20];

  v22 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v27;
  v30[1] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v24 = [v22 moduleWithTitle:@"Content Privacy" contents:v23];

  return v24;
}

@end