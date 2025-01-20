@interface _UIBarSettings
+ (id)settingsControllerModule;
- (BOOL)colorByBarType;
- (BOOL)retainShadow;
- (_UITabBarSettings)tabBarSettings;
- (int64_t)backgroundMode;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setColorByBarType:(BOOL)a3;
- (void)setDefaultValues;
- (void)setRetainShadow:(BOOL)a3;
- (void)setTabBarSettings:(id)a3;
@end

@implementation _UIBarSettings

- (_UITabBarSettings)tabBarSettings
{
  return self->_tabBarSettings;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setTabBarSettings:(id)a3
{
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBarSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIBarSettings *)self setBackgroundMode:0];
  [(_UIBarSettings *)self setRetainShadow:0];
  [(_UIBarSettings *)self setColorByBarType:0];
}

- (void)setRetainShadow:(BOOL)a3
{
  self->_retainShadow = a3;
}

- (void)setColorByBarType:(BOOL)a3
{
  self->_colorByBarType = a3;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
}

+ (id)settingsControllerModule
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94108] rowWithTitle:@"Background Override" valueKeyPath:@"backgroundMode"];
  v22 = [v2 possibleValues:&unk_1ED3F1798 titles:&unk_1ED3F17B0];

  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF.backgroundMode != %d", 0);
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Keep Shadow" valueKeyPath:@"retainShadow"];
  v21 = [v4 condition:v3];

  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Color bars by type" valueKeyPath:@"colorByBarType"];
  v6 = [v5 condition:v3];

  v7 = (void *)MEMORY[0x1E4F940F8];
  v8 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v9 = [v7 rowWithTitle:@"Restore Defaults" action:v8];
  v10 = [v9 condition:v3];

  v11 = (void *)MEMORY[0x1E4F94160];
  v24[0] = v22;
  v24[1] = v21;
  v24[2] = v6;
  v24[3] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  v13 = [v11 sectionWithRows:v12 title:@"Bar Background Overrides"];
  v25[0] = v13;
  v14 = (void *)MEMORY[0x1E4F94160];
  v15 = [MEMORY[0x1E4F94130] rowWithTitle:@"Tab Bar Settings" childSettingsKeyPath:@"tabBarSettings"];
  v23 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v17 = [v14 sectionWithRows:v16 title:@"Bar Specific Settings"];
  v25[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v19 = [v11 moduleWithTitle:0 contents:v18];

  return v19;
}

- (BOOL)retainShadow
{
  return self->_retainShadow;
}

- (BOOL)colorByBarType
{
  return self->_colorByBarType;
}

- (void).cxx_destruct
{
}

@end