@interface SBHReducedMotionFadeSettings
+ (id)settingsControllerModule;
- (void)setDefaultValues;
@end

@implementation SBHReducedMotionFadeSettings

+ (id)settingsControllerModule
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Reduced Motion Crossfade" delay:0 frameRate:0];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:@"centralAnimationSettings"];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = (void *)MEMORY[0x1E4F940F8];
  v7 = [MEMORY[0x1E4F94170] action];
  v8 = [v6 rowWithTitle:@"Restore Defaults" action:v7];
  v16[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v10 = [v5 sectionWithRows:v9];

  v11 = (void *)MEMORY[0x1E4F94160];
  v15[0] = v4;
  v15[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v13 = [v11 moduleWithTitle:0 contents:v12];

  return v13;
}

- (void)setDefaultValues
{
  v8.receiver = self;
  v8.super_class = (Class)SBHReducedMotionFadeSettings;
  [(SBHIconAnimationSettings *)&v8 setDefaultValues];
  v3 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v3 setAnimationType:1];

  v4 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v4 setMass:8.0];

  v5 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v5 setStiffness:1560.0];

  v6 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v6 setDamping:600.0];

  v7 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v7 setCurve:0x10000];
}

@end