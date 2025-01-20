@interface _UIScreenEdgePanRecognizerCornerSettings
+ (id)keyPathsForValuesAffectingCornerAngleWindowDegreees;
+ (id)settingsControllerModule;
- (double)cornerAngleWindow;
- (double)cornerAngleWindowDegreees;
- (double)cornerSize;
- (void)setCornerAngleWindow:(double)a3;
- (void)setCornerAngleWindowDegreees:(double)a3;
- (void)setCornerSize:(double)a3;
- (void)setDefaultValues;
@end

@implementation _UIScreenEdgePanRecognizerCornerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIScreenEdgePanRecognizerCornerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIScreenEdgePanRecognizerCornerSettings *)self setCornerSize:50.0];
  [(_UIScreenEdgePanRecognizerCornerSettings *)self setCornerAngleWindow:1.30899694];
}

- (double)cornerAngleWindowDegreees
{
  [(_UIScreenEdgePanRecognizerCornerSettings *)self cornerAngleWindow];
  return v2 * 57.2957795;
}

- (void)setCornerAngleWindowDegreees:(double)a3
{
}

+ (id)keyPathsForValuesAffectingCornerAngleWindowDegreees
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cornerAngleWindow"];
}

+ (id)settingsControllerModule
{
  v19[2] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Corner Size" valueKeyPath:@"cornerSize"];
  objc_super v3 = [v2 precision:0];
  v19[0] = v3;
  v4 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Angle Window" valueKeyPath:@"cornerAngleWindowDegreees"];
  v5 = [v4 minValue:0.0 maxValue:90.0];
  v19[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  v7 = [MEMORY[0x1E4F94160] sectionWithRows:v6];
  v8 = (void *)MEMORY[0x1E4F940F8];
  v9 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v18 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

  v12 = [MEMORY[0x1E4F94160] sectionWithRows:v11];
  v13 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v7;
  v17[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v13 moduleWithTitle:@"Corner Swipe" contents:v14];

  return v15;
}

- (double)cornerSize
{
  return self->_cornerSize;
}

- (void)setCornerSize:(double)a3
{
  self->_cornerSize = a3;
}

- (double)cornerAngleWindow
{
  return self->_cornerAngleWindow;
}

- (void)setCornerAngleWindow:(double)a3
{
  self->_cornerAngleWindow = a3;
}

@end