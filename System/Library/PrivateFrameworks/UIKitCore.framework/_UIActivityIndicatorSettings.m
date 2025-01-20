@interface _UIActivityIndicatorSettings
+ (id)settingsControllerModule;
- (BOOL)customColor;
- (double)alphaValue;
- (double)blueValue;
- (double)fullLoopDuration;
- (double)greenValue;
- (double)redValue;
- (void)setAlphaValue:(double)a3;
- (void)setBlueValue:(double)a3;
- (void)setCustomColor:(BOOL)a3;
- (void)setDefaultValues;
- (void)setFullLoopDuration:(double)a3;
- (void)setGreenValue:(double)a3;
- (void)setRedValue:(double)a3;
@end

@implementation _UIActivityIndicatorSettings

- (double)fullLoopDuration
{
  return self->_fullLoopDuration;
}

- (BOOL)customColor
{
  return self->_customColor;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityIndicatorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIActivityIndicatorSettings *)self setFullLoopDuration:0.8];
  [(_UIActivityIndicatorSettings *)self setCustomColor:0];
  [(_UIActivityIndicatorSettings *)self setRedValue:60.0];
  [(_UIActivityIndicatorSettings *)self setGreenValue:60.0];
  [(_UIActivityIndicatorSettings *)self setBlueValue:67.0];
  [(_UIActivityIndicatorSettings *)self setAlphaValue:0.6];
}

- (void)setRedValue:(double)a3
{
  self->_redValue = a3;
}

- (void)setGreenValue:(double)a3
{
  self->_greenValue = a3;
}

- (void)setFullLoopDuration:(double)a3
{
  self->_fullLoopDuration = a3;
}

- (void)setCustomColor:(BOOL)a3
{
  self->_customColor = a3;
}

- (void)setBlueValue:(double)a3
{
  self->_blueValue = a3;
}

- (void)setAlphaValue:(double)a3
{
  self->_alphaValue = a3;
}

+ (id)settingsControllerModule
{
  v36[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v21 = (id)MEMORY[0x1E4F94160];
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Duration" valueKeyPath:@"fullLoopDuration"];
  v31 = [v32 between:0.0 and:5.0];
  v30 = [v31 precision:1];
  v35 = v30;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v28 = [v2 sectionWithRows:v29 title:@"Animation"];
  v36[0] = v28;
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Custom Color" valueKeyPath:@"customColor"];
  v34[0] = v27;
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Red" valueKeyPath:@"redValue"];
  v25 = [v26 between:0.0 and:255.0];
  v24 = [v25 precision:0];
  v34[1] = v24;
  v23 = [MEMORY[0x1E4F94148] rowWithTitle:@"Green" valueKeyPath:@"greenValue"];
  v20 = [v23 between:0.0 and:255.0];
  v19 = [v20 precision:0];
  v34[2] = v19;
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Blue" valueKeyPath:@"blueValue"];
  v17 = [v18 between:0.0 and:255.0];
  v4 = [v17 precision:0];
  v34[3] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Alpha" valueKeyPath:@"alphaValue"];
  v6 = [v5 between:0.0 and:1.0];
  v34[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  v8 = [v3 sectionWithRows:v7 title:@"Color"];
  v36[1] = v8;
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];
  v33 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v14 = [v9 sectionWithRows:v13];
  v36[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  id v22 = [v21 moduleWithTitle:0 contents:v15];

  return v22;
}

- (double)redValue
{
  return self->_redValue;
}

- (double)greenValue
{
  return self->_greenValue;
}

- (double)blueValue
{
  return self->_blueValue;
}

- (double)alphaValue
{
  return self->_alphaValue;
}

@end