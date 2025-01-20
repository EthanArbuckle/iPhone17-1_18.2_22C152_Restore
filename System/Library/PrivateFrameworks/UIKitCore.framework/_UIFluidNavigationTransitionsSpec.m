@interface _UIFluidNavigationTransitionsSpec
+ (id)settingsControllerModule;
- (_UIFluidParallaxTransitionSettings)parallaxSettings;
@end

@implementation _UIFluidNavigationTransitionsSpec

+ (id)settingsControllerModule
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Parallax" childSettingsKeyPath:@"parallaxSettings"];
  v9 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v5 = [v2 sectionWithRows:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [v2 moduleWithTitle:@"Fluid Navigation Transitionins" contents:v6];

  return v7;
}

- (_UIFluidParallaxTransitionSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (void).cxx_destruct
{
}

@end