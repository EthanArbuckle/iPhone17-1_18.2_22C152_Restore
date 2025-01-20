@interface SBPIPStashVisualSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (SBPIPStashMaterialSettings)darkModeMaterialSettings;
- (SBPIPStashMaterialSettings)lightModeMaterialSettings;
- (double)completeBlurTransition;
- (double)startBlurTransition;
- (id)materialSettingsForUserInterfaceStyle:(int64_t)a3;
- (int64_t)userInterfaceStyle;
- (void)setCompleteBlurTransition:(double)a3;
- (void)setDarkModeMaterialSettings:(id)a3;
- (void)setDefaultValues;
- (void)setLightModeMaterialSettings:(id)a3;
- (void)setStartBlurTransition:(double)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation SBPIPStashVisualSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPStashVisualSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBPIPStashVisualSettings *)self setUserInterfaceStyle:2];
  [(SBPIPStashVisualSettings *)self setStartBlurTransition:0.9];
  [(SBPIPStashVisualSettings *)self setCompleteBlurTransition:1.0];
}

+ (id)settingsControllerModule
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94110] rowWithTitle:@"Override Interface Style" valueKeyPath:@"userInterfaceStyle"];
  objc_super v3 = [v2 possibleValues:&unk_1F3348888 titles:&unk_1F33488A0];

  v4 = [MEMORY[0x1E4F94138] rowWithTitle:@"Light Mode Material" childSettingsKeyPath:@"lightModeMaterialSettings"];
  v5 = [MEMORY[0x1E4F94138] rowWithTitle:@"Dark Mode Material" childSettingsKeyPath:@"darkModeMaterialSettings"];
  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Start Blur Transition" valueKeyPath:@"startBlurTransition"];
  v7 = [v6 valueStringFormatter:&__block_literal_global_386];
  v8 = [v7 valueValidator:&__block_literal_global_267];

  v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Complete Blur Transition" valueKeyPath:@"completeBlurTransition"];
  v10 = [v9 valueStringFormatter:&__block_literal_global_386];
  v11 = [v10 valueValidator:&__block_literal_global_276_0];

  v12 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v3;
  v18[1] = v4;
  v18[2] = v5;
  v18[3] = v8;
  v18[4] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  v14 = [v12 sectionWithRows:v13];
  v19[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16 = [v12 moduleWithTitle:@"Stash Visual Settings" contents:v15];

  return v16;
}

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu%% through stashing", (unint64_t)(v2 * 100.0));
}

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 completeBlurTransition];
  double v8 = v7;

  v9 = NSNumber;
  double v10 = v8 + -0.01;
  if (v6 < v8 + -0.01) {
    double v10 = v6;
  }
  return [v9 numberWithDouble:v10];
}

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 startBlurTransition];
  double v8 = v7;

  v9 = NSNumber;
  double v10 = v8 + 0.01;
  if (v6 >= v8 + 0.01) {
    double v10 = v6;
  }
  return [v9 numberWithDouble:v10];
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"darkTintColor"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"lightTintColor"];
  }

  return v4;
}

- (id)materialSettingsForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.super.isa + *off_1E6B0D820[a3]);
  }
  return (id)(id)a2;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (double)startBlurTransition
{
  return self->_startBlurTransition;
}

- (void)setStartBlurTransition:(double)a3
{
  self->_startBlurTransition = a3;
}

- (double)completeBlurTransition
{
  return self->_completeBlurTransition;
}

- (void)setCompleteBlurTransition:(double)a3
{
  self->_completeBlurTransition = a3;
}

- (SBPIPStashMaterialSettings)lightModeMaterialSettings
{
  return self->_lightModeMaterialSettings;
}

- (void)setLightModeMaterialSettings:(id)a3
{
}

- (SBPIPStashMaterialSettings)darkModeMaterialSettings
{
  return self->_darkModeMaterialSettings;
}

- (void)setDarkModeMaterialSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeMaterialSettings, 0);
  objc_storeStrong((id *)&self->_lightModeMaterialSettings, 0);
}

@end