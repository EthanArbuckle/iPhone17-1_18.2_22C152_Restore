@interface SBHLibraryPodZoomSettings
+ (double)_defaultInnerFolderZoomDelay;
+ (id)_defaultCentralAnimationSettings;
+ (id)_defaultCrossfadeSettings;
+ (id)_defaultInnerFolderZoomAnimationSettings;
+ (id)settingsControllerModule;
- (SBFAnimationSettings)innerFolderCenterZoomSettings;
- (SBFAnimationSettings)innerFolderEdgeZoomSettings;
- (void)setDefaultValues;
- (void)setInnerFolderCenterZoomSettings:(id)a3;
- (void)setInnerFolderEdgeZoomSettings:(id)a3;
@end

@implementation SBHLibraryPodZoomSettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodZoomSettings;
  [(SBHFolderZoomSettings *)&v2 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v16[3] = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1E4F94160];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___SBHLibraryPodZoomSettings;
  v3 = objc_msgSendSuper2(&v15, sel_settingsControllerModule);
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Inner Folder Edge Zoom" delay:1 frameRate:1];
  v7 = [v5 submoduleWithModule:v6 childSettingsKeyPath:@"innerFolderEdgeZoomSettings"];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Inner Folder Center Zoom" delay:1 frameRate:1];
  v10 = [v8 submoduleWithModule:v9 childSettingsKeyPath:@"innerFolderCenterZoomSettings"];

  v11 = (void *)MEMORY[0x1E4F94160];
  v16[0] = v7;
  v16[1] = v10;
  v16[2] = v4;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v13 = [v11 moduleWithTitle:0 contents:v12];

  return v13;
}

+ (id)_defaultCentralAnimationSettings
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5E80]) initWithDefaultValues];
  [v2 setAnimationType:1];
  [v2 setMass:1.0];
  [v2 setStiffness:157.91];
  [v2 setDamping:25.13];
  [v2 setCurve:196608];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  return v2;
}

+ (id)_defaultCrossfadeSettings
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5E80]) initWithDefaultValues];
  [v2 setAnimationType:0];
  [v2 setDuration:0.2];
  [v2 setCurve:0x10000];
  return v2;
}

+ (id)_defaultInnerFolderZoomAnimationSettings
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5E80]) initWithDefaultValues];
  [v2 setAnimationType:1];
  [v2 setMass:1.0];
  [v2 setStiffness:246.74];
  [v2 setDamping:31.42];
  [v2 setCurve:196608];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  return v2;
}

+ (double)_defaultInnerFolderZoomDelay
{
  return 0.05;
}

- (SBFAnimationSettings)innerFolderEdgeZoomSettings
{
  return self->super._innerFolderFadeSettings;
}

- (void)setInnerFolderEdgeZoomSettings:(id)a3
{
}

- (SBFAnimationSettings)innerFolderCenterZoomSettings
{
  return self->_innerFolderEdgeZoomSettings;
}

- (void)setInnerFolderCenterZoomSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerFolderEdgeZoomSettings, 0);
  objc_storeStrong((id *)&self->super._innerFolderFadeSettings, 0);
}

@end