@interface SBHCrossfadeAppTransitionSettings
+ (id)settingsControllerModule;
- (SBFAnimationSettings)appSnapshotCornerRadiusSettings;
- (void)setAppSnapshotCornerRadiusSettings:(id)a3;
- (void)setDefaultValues;
@end

@implementation SBHCrossfadeAppTransitionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHCrossfadeAppTransitionSettings;
  [(SBHCrossfadeZoomSettings *)&v3 setDefaultValues];
  [(SBHScaleZoomSettings *)self setCrossfadeWithZoom:0];
  [(SBHIconZoomSettings *)self setLabelAlphaWithZoom:0];
}

+ (id)settingsControllerModule
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___SBHCrossfadeAppTransitionSettings;
  objc_super v3 = objc_msgSendSuper2(&v18, sel_settingsControllerModule);
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Snapshot Corner Radius" delay:1 frameRate:0];
  v7 = [v5 submoduleWithModule:v6 childSettingsKeyPath:@"appSnapshotCornerRadiusSettings"];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] action];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];
  v20[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v13 = [v8 sectionWithRows:v12];

  v14 = (void *)MEMORY[0x1E4F94160];
  v19[0] = v4;
  v19[1] = v7;
  v19[2] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v16 = [v14 moduleWithTitle:0 contents:v15];

  return v16;
}

- (SBFAnimationSettings)appSnapshotCornerRadiusSettings
{
  return self->super._morphSettings;
}

- (void)setAppSnapshotCornerRadiusSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end