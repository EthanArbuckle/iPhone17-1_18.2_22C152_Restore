@interface SBHCrossfadeZoomSettings
+ (id)settingsControllerModule;
- (BOOL)morphWithZoom;
- (SBFAnimationSettings)morphSettings;
- (id)effectiveMorphAnimationSettings;
- (void)setDefaultValues;
- (void)setMorphSettings:(id)a3;
- (void)setMorphWithZoom:(BOOL)a3;
@end

@implementation SBHCrossfadeZoomSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHCrossfadeZoomSettings;
  [(SBHScaleZoomSettings *)&v3 setDefaultValues];
  [(SBHCrossfadeZoomSettings *)self setMorphWithZoom:1];
  [(SBHScaleZoomSettings *)self setFadesIconGrid:1];
}

+ (id)settingsControllerModule
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = +[SBHScaleZoomSettings settingsControllerModule];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Morph on zoom spring" valueKeyPath:@"morphWithZoom"];
  v18[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v8 = [v5 sectionWithRows:v7];

  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Morph Animation" delay:1 frameRate:1];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"morphWithZoom == NO"];
  v12 = [v9 submoduleWithModule:v10 childSettingsKeyPath:@"morphSettings" condition:v11];

  v13 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v4;
  v17[1] = v8;
  v17[2] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v15 = [v13 moduleWithTitle:@"Crossfade Zoom" contents:v14];

  return v15;
}

- (id)effectiveMorphAnimationSettings
{
  if ([(SBHCrossfadeZoomSettings *)self morphWithZoom]) {
    [(SBHIconAnimationSettings *)self centralAnimationSettings];
  }
  else {
  objc_super v3 = [(SBHCrossfadeZoomSettings *)self morphSettings];
  }
  return v3;
}

- (BOOL)morphWithZoom
{
  return (BOOL)self->super._iconGridFadeSettings;
}

- (void)setMorphWithZoom:(BOOL)a3
{
  LOBYTE(self->super._iconGridFadeSettings) = a3;
}

- (SBFAnimationSettings)morphSettings
{
  return *(SBFAnimationSettings **)&self->_morphWithZoom;
}

- (void)setMorphSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end