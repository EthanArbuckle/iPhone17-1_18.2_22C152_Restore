@interface SBHDisplaySettings
+ (id)settingsControllerModule;
- (double)additionalTopSafeAreaInset;
- (void)setAdditionalTopSafeAreaInset:(double)a3;
- (void)setDefaultValues;
@end

@implementation SBHDisplaySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHDisplaySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHDisplaySettings *)self setAdditionalTopSafeAreaInset:0.0];
}

+ (id)settingsControllerModule
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Additional Top Inset" valueKeyPath:@"additionalTopSafeAreaInset"];
  v4 = [v3 between:0.0 and:20.0];
  v5 = [v4 precision:0];

  v6 = (void *)MEMORY[0x1E4F94160];
  v14[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v8 = [v6 sectionWithRows:v7 title:@"Safe Areas"];

  [v2 addObject:v8];
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = __46__SBHDisplaySettings_settingsControllerModule__block_invoke();
  v11 = [v9 sectionWithRows:v10];

  [v2 addObject:v11];
  v12 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Display Settings" contents:v2];

  return v12;
}

id __46__SBHDisplaySettings_settingsControllerModule__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F940F8];
  v1 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v2 = [v0 rowWithTitle:@"Restore Defaults" action:v1];
  v5[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (double)additionalTopSafeAreaInset
{
  return self->_additionalTopSafeAreaInset;
}

- (void)setAdditionalTopSafeAreaInset:(double)a3
{
  self->_additionalTopSafeAreaInset = a3;
}

@end