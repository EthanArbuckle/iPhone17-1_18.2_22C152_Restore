@interface SBPIPStashMaterialSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (NSString)chevronCompositingFilter;
- (UIColor)chevronTintColor;
- (UIColor)darkTintColor;
- (UIColor)lightTintColor;
- (double)darkTintAlpha;
- (double)lightTintAlpha;
- (void)setChevronCompositingFilter:(id)a3;
- (void)setChevronTintColor:(id)a3;
- (void)setDarkTintAlpha:(double)a3;
- (void)setDefaultValues;
- (void)setLightTintAlpha:(double)a3;
@end

@implementation SBPIPStashMaterialSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBPIPStashMaterialSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(SBPIPStashMaterialSettings *)self setChevronCompositingFilter:*MEMORY[0x1E4F3A2E8]];
  v3 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(SBPIPStashMaterialSettings *)self setChevronTintColor:v3];

  [(SBPIPStashMaterialSettings *)self setDarkTintAlpha:0.55];
  [(SBPIPStashMaterialSettings *)self setLightTintAlpha:0.15];
}

+ (id)settingsControllerModule
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94110] rowWithTitle:@"Interface Style" valueKeyPath:@"userInterfaceStyle"];
  v29 = [v2 possibleValues:&unk_1F33488B8 titles:&unk_1F33488D0];

  v3 = [MEMORY[0x1E4F94110] rowWithTitle:@"Chevron Filter" valueKeyPath:@"chevronCompositingFilter"];
  objc_super v4 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v5 = *MEMORY[0x1E4F3A2E8];
  v33[0] = v4;
  v33[1] = v5;
  v33[2] = *MEMORY[0x1E4F3A2E0];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v28 = [v3 possibleValues:v6 titles:&unk_1F33488E8];

  v7 = [MEMORY[0x1E4F94110] rowWithTitle:@"Chevron Tint" valueKeyPath:@"chevronTintColor"];
  v8 = [MEMORY[0x1E4F428B8] labelColor];
  v32[0] = v8;
  v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v32[1] = v9;
  v10 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  v32[2] = v10;
  v11 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
  v32[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v27 = [v7 possibleValues:v12 titles:&unk_1F3348900];

  v26 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Dark Tint Alpha" valueKeyPath:@"darkTintAlpha"];
  v13 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Light Tint Alpha" valueKeyPath:@"lightTintAlpha"];
  v14 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Start Blur Transition" valueKeyPath:@"startBlurTransition"];
  v15 = [v14 valueStringFormatter:&__block_literal_global_386];
  v16 = [v15 valueValidator:&__block_literal_global_388_0];

  v17 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Complete Blur Transition" valueKeyPath:@"completeBlurTransition"];
  v18 = [v17 valueStringFormatter:&__block_literal_global_386];
  v19 = [v18 valueValidator:&__block_literal_global_390];

  v20 = (void *)MEMORY[0x1E4F94168];
  v30[0] = v29;
  v30[1] = v28;
  v30[2] = v27;
  v30[3] = v26;
  v30[4] = v13;
  v30[5] = v16;
  v30[6] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:7];
  v22 = [v20 sectionWithRows:v21];
  v31 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v24 = [v20 moduleWithTitle:@"Stash Visual Settings" contents:v23];

  return v24;
}

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu%% through stashing", (unint64_t)(v2 * 100.0));
}

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (UIColor)darkTintColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:self->_darkTintAlpha];
}

- (UIColor)lightTintColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:self->_lightTintAlpha];
}

- (NSString)chevronCompositingFilter
{
  return self->_chevronCompositingFilter;
}

- (void)setChevronCompositingFilter:(id)a3
{
}

- (UIColor)chevronTintColor
{
  return self->_chevronTintColor;
}

- (void)setChevronTintColor:(id)a3
{
}

- (double)darkTintAlpha
{
  return self->_darkTintAlpha;
}

- (void)setDarkTintAlpha:(double)a3
{
  self->_darkTintAlpha = a3;
}

- (double)lightTintAlpha
{
  return self->_lightTintAlpha;
}

- (void)setLightTintAlpha:(double)a3
{
  self->_lightTintAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronTintColor, 0);
  objc_storeStrong((id *)&self->_chevronCompositingFilter, 0);
}

@end