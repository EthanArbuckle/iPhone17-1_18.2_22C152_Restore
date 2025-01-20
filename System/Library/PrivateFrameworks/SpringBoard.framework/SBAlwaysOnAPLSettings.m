@interface SBAlwaysOnAPLSettings
+ (id)settingsControllerModule;
- (double)overallAPLLimit;
- (void)setDefaultValues;
- (void)setOverallAPLLimit:(double)a3;
@end

@implementation SBAlwaysOnAPLSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnAPLSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_overallAPLLimit = 0.15;
}

+ (id)settingsControllerModule
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Overall" valueKeyPath:@"overallAPLLimit"];
  objc_super v3 = [v2 minValue:0.0 maxValue:1.0];

  v4 = (void *)MEMORY[0x1E4F94168];
  v12[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v6 = [v4 sectionWithRows:v5 title:@"APL Limits"];

  v7 = (void *)MEMORY[0x1E4F94168];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [v7 moduleWithTitle:@"Average Pixel Luminance Policies" contents:v8];

  return v9;
}

- (double)overallAPLLimit
{
  return self->_overallAPLLimit;
}

- (void)setOverallAPLLimit:(double)a3
{
  self->_overallAPLLimit = a3;
}

@end