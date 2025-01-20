@interface STUIStatusBarSettings
+ (id)settingsControllerModule;
- (BOOL)alwaysAutomaticStyle;
- (STUIItemSettings)itemSettings;
- (STUIVisualProviderSettings)visualProviderSettings;
- (int64_t)forcedMode;
- (void)setAlwaysAutomaticStyle:(BOOL)a3;
- (void)setDefaultValues;
- (void)setForcedMode:(int64_t)a3;
- (void)setItemSettings:(id)a3;
- (void)setVisualProviderSettings:(id)a3;
@end

@implementation STUIStatusBarSettings

- (STUIVisualProviderSettings)visualProviderSettings
{
  return self->_visualProviderSettings;
}

- (STUIItemSettings)itemSettings
{
  return self->_itemSettings;
}

- (int64_t)forcedMode
{
  return self->_forcedMode;
}

- (BOOL)alwaysAutomaticStyle
{
  return self->_alwaysAutomaticStyle;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(STUIStatusBarSettings *)self setAlwaysAutomaticStyle:0];
  [(STUIStatusBarSettings *)self setForcedMode:-1];
}

+ (id)settingsControllerModule
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Automatic Style" valueKeyPath:@"alwaysAutomaticStyle"];
  v18[0] = v16;
  objc_super v3 = [MEMORY[0x1E4F94108] rowWithTitle:@"Forced Mode" valueKeyPath:@"forcedMode"];
  v4 = [v3 possibleValues:&unk_1F2F9C978 titles:&unk_1F2F9C990];
  v18[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v6 = [v2 sectionWithRows:v5 title:@"General"];
  v19[0] = v6;
  v7 = (void *)MEMORY[0x1E4F94160];
  v8 = (void *)MEMORY[0x1E4F940F8];
  v9 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v17 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v12 = [v7 sectionWithRows:v11];
  v19[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v14 = [v2 moduleWithTitle:0 contents:v13];

  return v14;
}

- (void)setAlwaysAutomaticStyle:(BOOL)a3
{
  self->_alwaysAutomaticStyle = a3;
}

- (void)setForcedMode:(int64_t)a3
{
  self->_forcedMode = a3;
}

- (void)setVisualProviderSettings:(id)a3
{
}

- (void)setItemSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSettings, 0);
  objc_storeStrong((id *)&self->_visualProviderSettings, 0);
}

@end