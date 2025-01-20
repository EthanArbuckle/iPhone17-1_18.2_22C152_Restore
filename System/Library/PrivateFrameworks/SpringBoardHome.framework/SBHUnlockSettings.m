@interface SBHUnlockSettings
+ (id)settingsControllerModule;
- (void)setDefaultValues;
@end

@implementation SBHUnlockSettings

+ (id)settingsControllerModule
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SBHUnlockSettings;
  v3 = objc_msgSendSuper2(&v9, sel_settingsControllerModule);
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [v5 moduleWithTitle:@"Unlock" contents:v6];

  return v7;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHUnlockSettings;
  [(SBHCenterAppSuspendSettings *)&v3 setDefaultValues];
  [(SBHCenterZoomSettings *)self setZoomViewBelowIcons:1];
}

@end