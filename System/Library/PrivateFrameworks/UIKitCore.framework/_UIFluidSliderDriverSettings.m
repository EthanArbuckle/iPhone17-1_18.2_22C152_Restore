@interface _UIFluidSliderDriverSettings
+ (id)settingsControllerModule;
- (_UISpringAnimationPrototypeSettings)acceleratedUpdate;
- (_UISpringAnimationPrototypeSettings)update;
- (void)setAcceleratedUpdate:(id)a3;
- (void)setDefaultValues;
- (void)setUpdate:(id)a3;
@end

@implementation _UIFluidSliderDriverSettings

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDriverSettings;
  [(PTSettings *)&v7 setDefaultValues];
  v3 = [(_UIFluidSliderDriverSettings *)self update];
  [v3 setDampingRatio:1.0];

  v4 = [(_UIFluidSliderDriverSettings *)self update];
  [v4 setResponse:0.4];

  v5 = [(_UIFluidSliderDriverSettings *)self acceleratedUpdate];
  [v5 setDampingRatio:1.0];

  v6 = [(_UIFluidSliderDriverSettings *)self acceleratedUpdate];
  [v6 setResponse:0.3];
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Update" childSettingsKeyPath:@"update"];
  v4 = objc_msgSend(MEMORY[0x1E4F94130], "rowWithTitle:childSettingsKeyPath:", @"Accelerated Update", @"acceleratedUpdate", v3);
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = [v2 sectionWithRows:v5 title:@"Animations"];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v2 moduleWithTitle:&stru_1ED0E84C0 contents:v7];

  return v8;
}

- (_UISpringAnimationPrototypeSettings)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
}

- (_UISpringAnimationPrototypeSettings)acceleratedUpdate
{
  return self->_acceleratedUpdate;
}

- (void)setAcceleratedUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceleratedUpdate, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

@end