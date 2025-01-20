@interface _UIHDRSettings
+ (id)settingsControllerModule;
- (BOOL)asymmetricAnimationDurations;
- (double)animationDurationDown;
- (double)animationDurationUp;
- (void)setAnimationDurationDown:(double)a3;
- (void)setAnimationDurationUp:(double)a3;
- (void)setAsymmetricAnimationDurations:(BOOL)a3;
- (void)setDefaultValues;
@end

@implementation _UIHDRSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIHDRSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIHDRSettings *)self setAnimationDurationUp:2.0];
  [(_UIHDRSettings *)self setAnimationDurationDown:2.0];
  [(_UIHDRSettings *)self setAsymmetricAnimationDurations:0];
}

+ (id)settingsControllerModule
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Animation Duration" valueKeyPath:@"animationDurationUp"];
  objc_super v3 = [v2 between:0.0 and:5.0];
  v4 = [v3 precision:2];

  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Animation Duration (Down)" valueKeyPath:@"animationDurationDown"];
  v6 = [v5 between:0.0 and:5.0];
  v7 = [v6 precision:2];
  v8 = [v7 conditionFormat:@"SELF.asymmetricAnimationDurations != NO"];

  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Asymmetric Animations" valueKeyPath:@"asymmetricAnimationDurations"];
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];

  v13 = (void *)MEMORY[0x1E4F94160];
  v19[0] = v4;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v15 = [v13 sectionWithRows:v14 title:@"HDR Animation Settings"];
  v20[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17 = [v13 moduleWithTitle:0 contents:v16];

  return v17;
}

- (double)animationDurationUp
{
  return self->_animationDurationUp;
}

- (void)setAnimationDurationUp:(double)a3
{
  self->_animationDurationUp = a3;
}

- (double)animationDurationDown
{
  return self->_animationDurationDown;
}

- (void)setAnimationDurationDown:(double)a3
{
  self->_animationDurationDown = a3;
}

- (BOOL)asymmetricAnimationDurations
{
  return self->_asymmetricAnimationDurations;
}

- (void)setAsymmetricAnimationDurations:(BOOL)a3
{
  self->_asymmetricAnimationDurations = a3;
}

@end