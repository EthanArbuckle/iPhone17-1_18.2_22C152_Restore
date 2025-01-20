@interface SBSystemNotesAppearanceSettings
+ (id)settingsControllerModule;
- (double)platterTintAlpha;
- (double)platterTintBlue;
- (double)platterTintGreen;
- (double)platterTintRed;
- (void)setDefaultValues;
- (void)setPlatterTintAlpha:(double)a3;
- (void)setPlatterTintBlue:(double)a3;
- (void)setPlatterTintGreen:(double)a3;
- (void)setPlatterTintRed:(double)a3;
@end

@implementation SBSystemNotesAppearanceSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesAppearanceSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemNotesAppearanceSettings *)self setPlatterTintRed:1.0];
  [(SBSystemNotesAppearanceSettings *)self setPlatterTintGreen:1.0];
  [(SBSystemNotesAppearanceSettings *)self setPlatterTintBlue:1.0];
  [(SBSystemNotesAppearanceSettings *)self setPlatterTintAlpha:0.05];
}

+ (id)settingsControllerModule
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  objc_super v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v4 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"red" valueKeyPath:@"platterTintRed"];
  v6 = [v5 between:0.0 and:1.0];

  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"green" valueKeyPath:@"platterTintGreen"];
  v8 = [v7 between:0.0 and:1.0];

  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"blue" valueKeyPath:@"platterTintBlue"];
  v10 = [v9 between:0.0 and:1.0];

  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"alpha" valueKeyPath:@"platterTintAlpha"];
  v12 = [v11 between:0.0 and:1.0];

  v13 = (void *)MEMORY[0x1E4F94168];
  v21[0] = v4;
  v21[1] = v6;
  v21[2] = v8;
  v21[3] = v10;
  v21[4] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  v15 = [v13 sectionWithRows:v14 title:@"Platter Tint"];

  v16 = (void *)MEMORY[0x1E4F94168];
  v20 = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v18 = [v16 moduleWithTitle:0 contents:v17];

  return v18;
}

- (double)platterTintRed
{
  return self->_platterTintRed;
}

- (void)setPlatterTintRed:(double)a3
{
  self->_platterTintRed = a3;
}

- (double)platterTintGreen
{
  return self->_platterTintGreen;
}

- (void)setPlatterTintGreen:(double)a3
{
  self->_platterTintGreen = a3;
}

- (double)platterTintBlue
{
  return self->_platterTintBlue;
}

- (void)setPlatterTintBlue:(double)a3
{
  self->_platterTintBlue = a3;
}

- (double)platterTintAlpha
{
  return self->_platterTintAlpha;
}

- (void)setPlatterTintAlpha:(double)a3
{
  self->_platterTintAlpha = a3;
}

@end