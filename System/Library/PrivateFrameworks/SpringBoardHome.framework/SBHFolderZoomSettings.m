@interface SBHFolderZoomSettings
+ (id)settingsControllerModule;
- (SBFAnimationSettings)innerFolderFadeSettings;
- (void)setDefaultValues;
- (void)setInnerFolderFadeSettings:(id)a3;
@end

@implementation SBHFolderZoomSettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)SBHFolderZoomSettings;
  [(SBHScaleZoomSettings *)&v2 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v20[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1E4F94160];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___SBHFolderZoomSettings;
  v3 = objc_msgSendSuper2(&v18, sel_settingsControllerModule);
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Inner Folder Fade" delay:1 frameRate:0];
  v7 = [v5 submoduleWithModule:v6 childSettingsKeyPath:@"innerFolderFadeSettings"];

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

- (SBFAnimationSettings)innerFolderFadeSettings
{
  return self->super._iconGridFadeSettings;
}

- (void)setInnerFolderFadeSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end