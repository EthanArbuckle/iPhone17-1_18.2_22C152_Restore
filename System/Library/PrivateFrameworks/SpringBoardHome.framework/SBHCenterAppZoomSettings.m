@interface SBHCenterAppZoomSettings
+ (id)settingsControllerModule;
- (SBFAnimationSettings)appFadeSettings;
- (SBFAnimationSettings)appZoomSettings;
- (double)appHeadStart;
- (void)setAppFadeSettings:(id)a3;
- (void)setAppHeadStart:(double)a3;
- (void)setAppZoomSettings:(id)a3;
- (void)setDefaultValues;
@end

@implementation SBHCenterAppZoomSettings

+ (id)settingsControllerModule
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v25.receiver = a1;
  v25.super_class = (Class)&OBJC_METACLASS___SBHCenterAppZoomSettings;
  v3 = objc_msgSendSuper2(&v25, sel_settingsControllerModule);
  v24 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"App head-start (seconds)" valueKeyPath:@"appHeadStart"];
  v5 = [v4 between:-1.0 and:1.0];
  v28[0] = v5;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

  v6 = [MEMORY[0x1E4F94160] sectionWithRows:v23 title:@"App Zoom Animation"];
  v7 = (void *)MEMORY[0x1E4F94160];
  v8 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:0 delay:0 frameRate:1];
  v9 = [v7 submoduleWithModule:v8 childSettingsKeyPath:@"appZoomSettings"];

  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"App Fade" delay:1 frameRate:0];
  v12 = [v10 submoduleWithModule:v11 childSettingsKeyPath:@"appFadeSettings"];

  v13 = (void *)MEMORY[0x1E4F94160];
  v14 = (void *)MEMORY[0x1E4F940F8];
  v15 = [MEMORY[0x1E4F94170] action];
  v16 = [v14 rowWithTitle:@"Restore Defaults" action:v15];
  v27 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v18 = [v13 sectionWithRows:v17];

  v19 = (void *)MEMORY[0x1E4F94160];
  v26[0] = v24;
  v26[1] = v6;
  v26[2] = v9;
  v26[3] = v12;
  v26[4] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
  v21 = [v19 moduleWithTitle:@"Center Zoom" contents:v20];

  return v21;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHCenterAppZoomSettings;
  [(SBHCenterZoomSettings *)&v3 setDefaultValues];
  [(SBHCenterZoomSettings *)self setZoomViewBelowIcons:0];
}

- (double)appHeadStart
{
  return self->super._dockMass;
}

- (void)setAppHeadStart:(double)a3
{
  self->super._dockMass = a3;
}

- (SBFAnimationSettings)appZoomSettings
{
  return *(SBFAnimationSettings **)&self->_appHeadStart;
}

- (void)setAppZoomSettings:(id)a3
{
}

- (SBFAnimationSettings)appFadeSettings
{
  return self->_appZoomSettings;
}

- (void)setAppFadeSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appZoomSettings, 0);
  objc_storeStrong((id *)&self->_appHeadStart, 0);
}

@end