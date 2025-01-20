@interface PSPointerSettings
+ (id)settingsControllerModule;
- (double)materialAlphaDot;
- (double)materialAlphaIBeam;
- (double)materialAlphaSmallItemDark;
- (double)materialAlphaSmallItemDarkHighContrast;
- (double)materialAlphaSmallItemLight;
- (void)setDefaultValues;
- (void)setMaterialAlphaDot:(double)a3;
- (void)setMaterialAlphaIBeam:(double)a3;
- (void)setMaterialAlphaSmallItemDark:(double)a3;
- (void)setMaterialAlphaSmallItemDarkHighContrast:(double)a3;
- (void)setMaterialAlphaSmallItemLight:(double)a3;
@end

@implementation PSPointerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PSPointerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PSPointerSettings *)self setMaterialAlphaDot:0.85];
  [(PSPointerSettings *)self setMaterialAlphaIBeam:1.0];
  [(PSPointerSettings *)self setMaterialAlphaSmallItemLight:0.25];
  [(PSPointerSettings *)self setMaterialAlphaSmallItemDark:0.3];
  [(PSPointerSettings *)self setMaterialAlphaSmallItemDarkHighContrast:0.3];
}

+ (id)settingsControllerModule
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dot" valueKeyPath:@"materialAlphaDot"];
  v23 = [v2 between:0.0 and:1.0];

  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"I-Beam" valueKeyPath:@"materialAlphaIBeam"];
  v22 = [v3 between:0.0 and:1.0];

  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Small Item Light" valueKeyPath:@"materialAlphaSmallItemLight"];
  v5 = [v4 between:0.0 and:1.0];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Small Item Dark" valueKeyPath:@"materialAlphaSmallItemDark"];
  v7 = [v6 between:0.0 and:1.0];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Small Item Dark High Contrast" valueKeyPath:@"materialAlphaSmallItemDarkHighContrast"];
  v9 = [v8 between:0.0 and:1.0];

  v10 = (void *)MEMORY[0x1E4F94160];
  v26[0] = v23;
  v26[1] = v22;
  v26[2] = v5;
  v26[3] = v7;
  v26[4] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
  v12 = [v10 sectionWithRows:v11 title:@"Material Alpha"];

  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];

  v16 = (void *)MEMORY[0x1E4F94160];
  v25 = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v18 = [v16 sectionWithRows:v17];

  v24[0] = v18;
  v24[1] = v12;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v20 = [MEMORY[0x1E4F94160] moduleWithTitle:0 contents:v19];

  return v20;
}

- (double)materialAlphaDot
{
  return self->_materialAlphaDot;
}

- (void)setMaterialAlphaDot:(double)a3
{
  self->_materialAlphaDot = a3;
}

- (double)materialAlphaIBeam
{
  return self->_materialAlphaIBeam;
}

- (void)setMaterialAlphaIBeam:(double)a3
{
  self->_materialAlphaIBeam = a3;
}

- (double)materialAlphaSmallItemLight
{
  return self->_materialAlphaSmallItemLight;
}

- (void)setMaterialAlphaSmallItemLight:(double)a3
{
  self->_materialAlphaSmallItemLight = a3;
}

- (double)materialAlphaSmallItemDark
{
  return self->_materialAlphaSmallItemDark;
}

- (void)setMaterialAlphaSmallItemDark:(double)a3
{
  self->_materialAlphaSmallItemDark = a3;
}

- (double)materialAlphaSmallItemDarkHighContrast
{
  return self->_materialAlphaSmallItemDarkHighContrast;
}

- (void)setMaterialAlphaSmallItemDarkHighContrast:(double)a3
{
  self->_materialAlphaSmallItemDarkHighContrast = a3;
}

@end