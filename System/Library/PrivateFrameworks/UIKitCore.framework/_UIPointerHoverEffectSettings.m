@interface _UIPointerHoverEffectSettings
+ (id)settingsControllerModule;
- (void)setDefaultValues;
@end

@implementation _UIPointerHoverEffectSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerHoverEffectSettings;
  [(_UIPointerEffectSettings *)&v3 setDefaultValues];
  [(_UIPointerEffectSettings *)self setSlipFactorX:1.0];
  [(_UIPointerEffectSettings *)self setSlipFactorY:1.0];
  [(_UIPointerEffectSettings *)self setScaleUpPoints:6.0];
}

+ (id)settingsControllerModule
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Default Corner Radius" valueKeyPath:@"defaultPointerCornerRadius"];
  v4 = [v3 between:0.0 and:2.0];
  v5 = [v4 precision:1];
  v33[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v29 = [v2 sectionWithRows:v6 title:@"Effect Appearance"];

  v7 = (void *)MEMORY[0x1E4F94160];
  v28 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Up Points" valueKeyPath:@"scaleUpPoints"];
  v8 = [v28 between:0.0 and:20.0];
  v9 = [v8 precision:1];
  v32[0] = v9;
  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Animation Response" valueKeyPath:@"scaleUpAnimationResponse"];
  v11 = [v10 between:0.0 and:1.0];
  v12 = [v11 precision:2];
  v32[1] = v12;
  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Animation Damping Ratio" valueKeyPath:@"scaleUpAnimationDampingRatio"];
  v14 = [v13 between:0.0 and:1.0];
  v15 = [v14 precision:2];
  v32[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v17 = [v7 sectionWithRows:v16 title:@"Effect Scale Up Animation"];

  v18 = (void *)MEMORY[0x1E4F940F8];
  v19 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v20 = [v18 rowWithTitle:@"Restore Defaults" action:v19];

  v21 = (void *)MEMORY[0x1E4F94160];
  v31 = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v23 = [v21 sectionWithRows:v22];

  v24 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v29;
  v30[1] = v17;
  v30[2] = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v26 = [v24 moduleWithTitle:0 contents:v25];

  return v26;
}

@end