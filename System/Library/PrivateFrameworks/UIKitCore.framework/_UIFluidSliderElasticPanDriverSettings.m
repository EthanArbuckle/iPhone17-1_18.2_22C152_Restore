@interface _UIFluidSliderElasticPanDriverSettings
+ (id)settingsControllerModule;
- (double)projectionThreshold;
- (void)setDefaultValues;
- (void)setProjectionThreshold:(double)a3;
@end

@implementation _UIFluidSliderElasticPanDriverSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFluidSliderElasticPanDriverSettings;
  [(_UIFluidSliderDriverSettings *)&v5 setDefaultValues];
  v3 = [(_UIFluidSliderDriverSettings *)self update];
  [v3 setDampingRatio:1.0];

  v4 = [(_UIFluidSliderDriverSettings *)self update];
  [v4 setResponse:0.4];

  [(_UIFluidSliderElasticPanDriverSettings *)self setProjectionThreshold:10.0];
}

+ (id)settingsControllerModule
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____UIFluidSliderElasticPanDriverSettings;
  v18 = objc_msgSendSuper2(&v19, sel_settingsControllerModule);
  v22[0] = v18;
  v3 = (void *)MEMORY[0x1E4F94160];
  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"Projection Deceleration Threshold (in pts)" valueKeyPath:@"projectionThreshold"];
  v4 = [v17 between:0.0 and:10.0];
  objc_super v5 = [v4 precision:2];
  v21 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v7 = [v3 sectionWithRows:v6 title:@"Behaviors"];
  v22[1] = v7;
  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] action];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];
  v20 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v13 = [v8 sectionWithRows:v12];
  v22[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v15 = [v2 moduleWithTitle:@"Elastic Pan" contents:v14];

  return v15;
}

- (double)projectionThreshold
{
  return self->_projectionThreshold;
}

- (void)setProjectionThreshold:(double)a3
{
  self->_projectionThreshold = a3;
}

@end