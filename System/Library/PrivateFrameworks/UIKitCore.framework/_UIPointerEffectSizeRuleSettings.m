@interface _UIPointerEffectSizeRuleSettings
+ (id)settingsControllerModule;
- (double)explicitRequestMultiplier;
- (double)genericSizeRuleThreshold;
- (double)narrowAspectRuleMajorDimensionThreshold;
- (double)narrowAspectRuleMinorDimensionThreshold;
- (double)pointerSizeRuleMajorDimensionThreshold;
- (double)pointerSizeRuleMinorDimensionThreshold;
- (void)setDefaultValues;
- (void)setExplicitRequestMultiplier:(double)a3;
- (void)setGenericSizeRuleThreshold:(double)a3;
- (void)setNarrowAspectRuleMajorDimensionThreshold:(double)a3;
- (void)setNarrowAspectRuleMinorDimensionThreshold:(double)a3;
- (void)setPointerSizeRuleMajorDimensionThreshold:(double)a3;
- (void)setPointerSizeRuleMinorDimensionThreshold:(double)a3;
@end

@implementation _UIPointerEffectSizeRuleSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerEffectSizeRuleSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIPointerEffectSizeRuleSettings *)self setExplicitRequestMultiplier:1.4];
  [(_UIPointerEffectSizeRuleSettings *)self setGenericSizeRuleThreshold:125.0];
  [(_UIPointerEffectSizeRuleSettings *)self setNarrowAspectRuleMinorDimensionThreshold:50.0];
  [(_UIPointerEffectSizeRuleSettings *)self setNarrowAspectRuleMajorDimensionThreshold:180.0];
  [(_UIPointerEffectSizeRuleSettings *)self setPointerSizeRuleMinorDimensionThreshold:19.0];
  [(_UIPointerEffectSizeRuleSettings *)self setPointerSizeRuleMajorDimensionThreshold:320.0];
}

+ (id)settingsControllerModule
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Explicit Request Multiplier" valueKeyPath:@"explicitRequestMultiplier"];
  v4 = [v3 between:1.0 and:5.0];
  v37[0] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Generic Size Rule Threshold" valueKeyPath:@"genericSizeRuleThreshold"];
  v6 = [v5 between:0.0 and:300.0];
  v37[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v32 = [v2 sectionWithRows:v7 title:@"General"];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minor Dimension" valueKeyPath:@"narrowAspectRuleMinorDimensionThreshold"];
  v10 = [v9 between:0.0 and:100.0];
  v36[0] = v10;
  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Major Dimension" valueKeyPath:@"narrowAspectRuleMajorDimensionThreshold"];
  v12 = [v11 between:0.0 and:500.0];
  v36[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v14 = [v8 sectionWithRows:v13 title:@"Narrow Aspect Rule"];

  v15 = (void *)MEMORY[0x1E4F94160];
  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minor Dimension" valueKeyPath:@"pointerSizeRuleMinorDimensionThreshold"];
  v17 = [v16 between:0.0 and:100.0];
  v35[0] = v17;
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Major Dimension" valueKeyPath:@"pointerSizeRuleMajorDimensionThreshold"];
  v19 = [v18 between:0.0 and:1000.0];
  v35[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v21 = [v15 sectionWithRows:v20 title:@"Narrow Aspect Rule"];

  v22 = (void *)MEMORY[0x1E4F940F8];
  v23 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v24 = [v22 rowWithTitle:@"Restore Defaults" action:v23];

  v25 = (void *)MEMORY[0x1E4F94160];
  v34 = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v27 = [v25 sectionWithRows:v26];

  v28 = (void *)MEMORY[0x1E4F94160];
  v33[0] = v32;
  v33[1] = v14;
  v33[2] = v21;
  v33[3] = v27;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  v30 = [v28 moduleWithTitle:0 contents:v29];

  return v30;
}

- (double)explicitRequestMultiplier
{
  return self->_explicitRequestMultiplier;
}

- (void)setExplicitRequestMultiplier:(double)a3
{
  self->_explicitRequestMultiplier = a3;
}

- (double)genericSizeRuleThreshold
{
  return self->_genericSizeRuleThreshold;
}

- (void)setGenericSizeRuleThreshold:(double)a3
{
  self->_genericSizeRuleThreshold = a3;
}

- (double)narrowAspectRuleMinorDimensionThreshold
{
  return self->_narrowAspectRuleMinorDimensionThreshold;
}

- (void)setNarrowAspectRuleMinorDimensionThreshold:(double)a3
{
  self->_narrowAspectRuleMinorDimensionThreshold = a3;
}

- (double)narrowAspectRuleMajorDimensionThreshold
{
  return self->_narrowAspectRuleMajorDimensionThreshold;
}

- (void)setNarrowAspectRuleMajorDimensionThreshold:(double)a3
{
  self->_narrowAspectRuleMajorDimensionThreshold = a3;
}

- (double)pointerSizeRuleMinorDimensionThreshold
{
  return self->_pointerSizeRuleMinorDimensionThreshold;
}

- (void)setPointerSizeRuleMinorDimensionThreshold:(double)a3
{
  self->_pointerSizeRuleMinorDimensionThreshold = a3;
}

- (double)pointerSizeRuleMajorDimensionThreshold
{
  return self->_pointerSizeRuleMajorDimensionThreshold;
}

- (void)setPointerSizeRuleMajorDimensionThreshold:(double)a3
{
  self->_pointerSizeRuleMajorDimensionThreshold = a3;
}

@end