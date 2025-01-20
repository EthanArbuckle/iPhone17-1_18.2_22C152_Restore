@interface WFSystemActionConfigurationPrototypeSettings
+ (id)settingsControllerModule;
+ (id)sharedSettings;
- (double)sidebarSpringDamping;
- (double)sidebarSpringRepsonse;
- (void)setDefaultValues;
- (void)setSidebarSpringDamping:(double)a3;
- (void)setSidebarSpringRepsonse:(double)a3;
@end

@implementation WFSystemActionConfigurationPrototypeSettings

- (void)setSidebarSpringRepsonse:(double)a3
{
  self->_sidebarSpringRepsonse = a3;
}

- (double)sidebarSpringRepsonse
{
  return self->_sidebarSpringRepsonse;
}

- (void)setSidebarSpringDamping:(double)a3
{
  self->_sidebarSpringDamping = a3;
}

- (double)sidebarSpringDamping
{
  return self->_sidebarSpringDamping;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)WFSystemActionConfigurationPrototypeSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(WFSystemActionConfigurationPrototypeSettings *)self setSidebarSpringDamping:0.9];
  [(WFSystemActionConfigurationPrototypeSettings *)self setSidebarSpringRepsonse:0.15];
}

+ (id)settingsControllerModule
{
  v16[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F622D8];
  objc_super v3 = [MEMORY[0x263F622C0] rowWithTitle:@"Damping" valueKeyPath:@"sidebarSpringDamping"];
  v4 = [v3 between:0.0 and:1.0];
  v5 = [v4 precision:2];
  v16[0] = v5;
  v6 = [MEMORY[0x263F622C0] rowWithTitle:@"Response" valueKeyPath:@"sidebarSpringRepsonse"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:2];
  v16[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v10 = [v2 sectionWithRows:v9 title:@"Sidebar Settings"];

  v11 = (void *)MEMORY[0x263F622D8];
  v15 = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v13 = [v11 moduleWithTitle:@"Pencil Settings" contents:v12];

  return v13;
}

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_1620);
  }
  v2 = (void *)sharedSettings_sharedInstance;
  return v2;
}

uint64_t __62__WFSystemActionConfigurationPrototypeSettings_sharedSettings__block_invoke()
{
  sharedSettings_sharedInstance = +[WFSystemActionConfigurationPrototypeSettingsDomain rootSettings];
  return MEMORY[0x270F9A758]();
}

@end