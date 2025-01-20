@interface SBHScaleZoomSettings
+ (id)settingsControllerModule;
- (BOOL)crossfadeWithZoom;
- (BOOL)fadesIconGrid;
- (SBFAnimationSettings)crossfadeSettings;
- (SBFAnimationSettings)iconGridFadeSettings;
- (SBFAnimationSettings)outerFolderFadeSettings;
- (id)effectiveCrossfadeAnimationSettings;
- (void)setCrossfadeSettings:(id)a3;
- (void)setCrossfadeWithZoom:(BOOL)a3;
- (void)setDefaultValues;
- (void)setFadesIconGrid:(BOOL)a3;
- (void)setIconGridFadeSettings:(id)a3;
- (void)setOuterFolderFadeSettings:(id)a3;
@end

@implementation SBHScaleZoomSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHScaleZoomSettings;
  [(SBHIconZoomSettings *)&v3 setDefaultValues];
  [(SBHScaleZoomSettings *)self setCrossfadeWithZoom:0];
  [(SBHScaleZoomSettings *)self setFadesIconGrid:0];
}

+ (id)settingsControllerModule
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___SBHScaleZoomSettings;
  objc_super v3 = objc_msgSendSuper2(&v26, sel_settingsControllerModule);
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Crossfade on zoom spring" valueKeyPath:@"crossfadeWithZoom"];
  v29[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v8 = [v5 sectionWithRows:v7];

  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Crossfade Animation" delay:1 frameRate:0];
  v11 = [v9 submoduleWithModule:v10 childSettingsKeyPath:@"crossfadeSettings"];

  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Outer Folder Fade" delay:1 frameRate:0];
  v14 = [v12 submoduleWithModule:v13 childSettingsKeyPath:@"outerFolderFadeSettings"];

  v15 = (void *)MEMORY[0x1E4F94160];
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fade Icon Grid" valueKeyPath:@"fadesIconGrid"];
  v28 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v18 = [v15 sectionWithRows:v17];

  v19 = (void *)MEMORY[0x1E4F94160];
  v20 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Icon Grid Fade Animation" delay:1 frameRate:0];
  v21 = [v19 submoduleWithModule:v20 childSettingsKeyPath:@"iconGridFadeSettings"];

  v22 = (void *)MEMORY[0x1E4F94160];
  v27[0] = v4;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v14;
  v27[4] = v18;
  v27[5] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];
  v24 = [v22 moduleWithTitle:@"Crossfade Zoom" contents:v23];

  return v24;
}

- (id)effectiveCrossfadeAnimationSettings
{
  if ([(SBHScaleZoomSettings *)self crossfadeWithZoom]) {
    [(SBHIconAnimationSettings *)self centralAnimationSettings];
  }
  else {
  objc_super v3 = [(SBHScaleZoomSettings *)self crossfadeSettings];
  }
  return v3;
}

- (SBFAnimationSettings)outerFolderFadeSettings
{
  return *(SBFAnimationSettings **)&self->_crossfadeWithZoom;
}

- (void)setOuterFolderFadeSettings:(id)a3
{
}

- (BOOL)crossfadeWithZoom
{
  return *(&self->super._labelAlphaWithZoom + 1);
}

- (void)setCrossfadeWithZoom:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 1) = a3;
}

- (SBFAnimationSettings)crossfadeSettings
{
  return self->_outerFolderFadeSettings;
}

- (void)setCrossfadeSettings:(id)a3
{
}

- (BOOL)fadesIconGrid
{
  return *(&self->super._labelAlphaWithZoom + 2);
}

- (void)setFadesIconGrid:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 2) = a3;
}

- (SBFAnimationSettings)iconGridFadeSettings
{
  return self->_crossfadeSettings;
}

- (void)setIconGridFadeSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeSettings, 0);
  objc_storeStrong((id *)&self->_outerFolderFadeSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeWithZoom, 0);
}

@end