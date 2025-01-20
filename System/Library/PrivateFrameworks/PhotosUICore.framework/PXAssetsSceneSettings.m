@interface PXAssetsSceneSettings
+ (PXAssetsSceneSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowAnimatedImagePlayback;
- (BOOL)allowLivePhotoPlayback;
- (BOOL)allowLoopingVideoPlayback;
- (BOOL)allowVideoPlayback;
- (BOOL)animateContentByDefault;
- (BOOL)enableImagePreheating;
- (BOOL)playLivePhotosAsLoops;
- (BOOL)showBordersOnAnimatedContent;
- (double)transitionDuration;
- (id)parentSettings;
- (void)setAllowAnimatedImagePlayback:(BOOL)a3;
- (void)setAllowLivePhotoPlayback:(BOOL)a3;
- (void)setAllowLoopingVideoPlayback:(BOOL)a3;
- (void)setAllowVideoPlayback:(BOOL)a3;
- (void)setAnimateContentByDefault:(BOOL)a3;
- (void)setDefaultValues;
- (void)setEnableImagePreheating:(BOOL)a3;
- (void)setPlayLivePhotosAsLoops:(BOOL)a3;
- (void)setShowBordersOnAnimatedContent:(BOOL)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation PXAssetsSceneSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSceneSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXAssetsSceneSettings *)self setTransitionDuration:0.3];
  [(PXAssetsSceneSettings *)self setEnableImagePreheating:1];
  [(PXAssetsSceneSettings *)self setShowBordersOnAnimatedContent:0];
  [(PXAssetsSceneSettings *)self setAnimateContentByDefault:0];
  [(PXAssetsSceneSettings *)self setAllowLivePhotoPlayback:1];
  [(PXAssetsSceneSettings *)self setPlayLivePhotosAsLoops:1];
  [(PXAssetsSceneSettings *)self setAllowAnimatedImagePlayback:1];
  [(PXAssetsSceneSettings *)self setAllowVideoPlayback:1];
  [(PXAssetsSceneSettings *)self setAllowLoopingVideoPlayback:1];
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setShowBordersOnAnimatedContent:(BOOL)a3
{
  self->_showBordersOnAnimatedContent = a3;
}

- (void)setPlayLivePhotosAsLoops:(BOOL)a3
{
  self->_playLivePhotosAsLoops = a3;
}

- (void)setEnableImagePreheating:(BOOL)a3
{
  self->_enableImagePreheating = a3;
}

- (void)setAnimateContentByDefault:(BOOL)a3
{
  self->_animateContentByDefault = a3;
}

- (void)setAllowVideoPlayback:(BOOL)a3
{
  self->_allowVideoPlayback = a3;
}

- (void)setAllowLoopingVideoPlayback:(BOOL)a3
{
  self->_allowLoopingVideoPlayback = a3;
}

- (void)setAllowLivePhotoPlayback:(BOOL)a3
{
  self->_allowLivePhotoPlayback = a3;
}

- (void)setAllowAnimatedImagePlayback:(BOOL)a3
{
  self->_allowAnimatedImagePlayback = a3;
}

- (BOOL)allowAnimatedImagePlayback
{
  return self->_allowAnimatedImagePlayback;
}

- (BOOL)allowVideoPlayback
{
  return self->_allowVideoPlayback;
}

- (BOOL)allowLoopingVideoPlayback
{
  return self->_allowLoopingVideoPlayback;
}

- (BOOL)playLivePhotosAsLoops
{
  return self->_playLivePhotosAsLoops;
}

- (BOOL)allowLivePhotoPlayback
{
  return self->_allowLivePhotoPlayback;
}

- (BOOL)animateContentByDefault
{
  return self->_animateContentByDefault;
}

- (BOOL)showBordersOnAnimatedContent
{
  return self->_showBordersOnAnimatedContent;
}

- (BOOL)enableImagePreheating
{
  return self->_enableImagePreheating;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXAssetsSceneSettings)sharedInstance
{
  if (sharedInstance_onceToken_166525 != -1) {
    dispatch_once(&sharedInstance_onceToken_166525, &__block_literal_global_166526);
  }
  v2 = (void *)sharedInstance_sharedInstance_166527;
  return (PXAssetsSceneSettings *)v2;
}

void __39__PXAssetsSceneSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 assetsScene];
  v1 = (void *)sharedInstance_sharedInstance_166527;
  sharedInstance_sharedInstance_166527 = v0;
}

+ (id)settingsControllerModule
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Transition Duration" valueKeyPath:@"transitionDuration"];
  v4 = [v3 minValue:0.0 maxValue:10.0];
  v27[0] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Image Preheating" valueKeyPath:@"enableImagePreheating"];
  v27[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v24 = [v2 sectionWithRows:v6 title:@"Settings"];

  v7 = (void *)MEMORY[0x1E4F94160];
  v23 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animate by Default" valueKeyPath:@"animateContentByDefault"];
  v26[0] = v23;
  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Live Photos" valueKeyPath:@"allowLivePhotoPlayback"];
  v26[1] = v22;
  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Loop Live Photos" valueKeyPath:@"playLivePhotosAsLoops"];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"allowLivePhotoPlayback == YES"];
  v10 = [v8 condition:v9];
  v26[2] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Looping Videos" valueKeyPath:@"allowLoopingVideoPlayback"];
  v26[3] = v11;
  v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Videos" valueKeyPath:@"allowVideoPlayback"];
  v26[4] = v12;
  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Animated Images" valueKeyPath:@"allowAnimatedImagePlayback"];
  v26[5] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Borders On Animated Content" valueKeyPath:@"showBordersOnAnimatedContent"];
  v26[6] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];
  v16 = [v7 sectionWithRows:v15 title:@"Animated Content"];

  v17 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v18 = (void *)MEMORY[0x1E4F94160];
  v25[0] = v24;
  v25[1] = v16;
  v25[2] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v20 = [v18 moduleWithTitle:@"Assets Scene" contents:v19];

  return v20;
}

@end