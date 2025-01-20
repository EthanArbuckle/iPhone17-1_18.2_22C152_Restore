@interface SBHUDSettings
+ (id)settingsControllerModule;
- (float)defaultHUDPresentationAnimationDuration;
- (void)setDefaultHUDPresentationAnimationDuration:(float)a3;
- (void)setDefaultValues;
@end

@implementation SBHUDSettings

- (void)setDefaultValues
{
  LODWORD(v2) = 1045220557;
  [(SBHUDSettings *)self setDefaultHUDPresentationAnimationDuration:v2];
}

+ (id)settingsControllerModule
{
  double v2 = objc_opt_new();
  v3 = (void *)MEMORY[0x1E4F94168];
  v4 = __41__SBHUDSettings_settingsControllerModule__block_invoke();
  v5 = [v3 sectionWithRows:v4 title:@"HUD"];

  [v2 addObject:v5];
  v6 = (void *)MEMORY[0x1E4F94168];
  v7 = __41__SBHUDSettings_settingsControllerModule__block_invoke_2();
  v8 = [v6 sectionWithRows:v7];

  [v2 addObject:v8];
  v9 = [MEMORY[0x1E4F94168] moduleWithTitle:@"HUD Settings" contents:v2];

  return v9;
}

id __41__SBHUDSettings_settingsControllerModule__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F941E0] rowWithTitle:@"HUD Present Duration" valueKeyPath:@"defaultHUDPresentationAnimationDuration"];
  [v0 setMaxValue:5.0];
  [v0 setMinValue:0.1];
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

id __41__SBHUDSettings_settingsControllerModule__block_invoke_2()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F94100];
  v1 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  double v2 = [v0 rowWithTitle:@"Restore Defaults" action:v1];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (float)defaultHUDPresentationAnimationDuration
{
  return *(float *)(&self->super.__isObservingChildren + 2);
}

- (void)setDefaultHUDPresentationAnimationDuration:(float)a3
{
  *(float *)(&self->super.__isObservingChildren + 2) = a3;
}

@end