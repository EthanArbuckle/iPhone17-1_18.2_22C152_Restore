@interface SBEntityRemovalMedusaSlideOutAnimationSettings
+ (id)settingsControllerModule;
- (SBEntityRemovalMedusaDefaultAnimationSettings)defaultAnimationSettings;
- (SBFFluidBehaviorSettings)toBeMadeFullscreenPushInScaleAnimationSettings;
- (SBFFluidBehaviorSettings)toBeMadeFullscreenScaleResetAnimationSettings;
- (SBFFluidBehaviorSettings)toBeRemovedSlideOutAnimationSettings;
- (double)toBeMadeFullScreenPushInScale;
- (double)toBeMadeFullScreenScaleResetAnimationDelay;
- (double)toBeRemovedSlideOutAnimationDelay;
- (double)toBeRemovedSlideOutHeightOffsetMultiplier;
- (void)setDefaultAnimationSettings:(id)a3;
- (void)setDefaultValues;
- (void)setToBeMadeFullScreenPushInScale:(double)a3;
- (void)setToBeMadeFullScreenScaleResetAnimationDelay:(double)a3;
- (void)setToBeMadeFullscreenPushInScaleAnimationSettings:(id)a3;
- (void)setToBeMadeFullscreenScaleResetAnimationSettings:(id)a3;
- (void)setToBeRemovedSlideOutAnimationDelay:(double)a3;
- (void)setToBeRemovedSlideOutAnimationSettings:(id)a3;
- (void)setToBeRemovedSlideOutHeightOffsetMultiplier:(double)a3;
@end

@implementation SBEntityRemovalMedusaSlideOutAnimationSettings

- (void)setDefaultValues
{
  v19.receiver = self;
  v19.super_class = (Class)SBEntityRemovalMedusaSlideOutAnimationSettings;
  [(PTSettings *)&v19 setDefaultValues];
  v3 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  v4 = [v3 toBeRemovedScaleAnimationSettings];
  [v4 setDampingRatio:0.879999995];

  v5 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  v6 = [v5 toBeRemovedScaleAnimationSettings];
  [v6 setResponse:0.699999988];

  v7 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  v8 = [v7 toBeRemovedAlphaAnimationSettings];
  [v8 setDampingRatio:0.879999995];

  v9 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  v10 = [v9 toBeRemovedAlphaAnimationSettings];
  [v10 setResponse:0.699999988];

  v11 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  [v11 setToBeRemovedFinalScale:0.910000026];

  v12 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  [v12 setToBeRemovedFinalAlpha:1.0];

  v13 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  [v13 setToBeRemovedFinalBlurRadius:0.0];

  v14 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self defaultAnimationSettings];
  [v14 setToBeMadeFullscreenFrameAnimationDelay:0.400000006];

  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeMadeFullScreenPushInScale:0.980000019];
  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeMadeFullScreenScaleResetAnimationDelay:0.0];
  v15 = SBEntityRemovalDefaultFluidAnimationSettings();
  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeMadeFullscreenPushInScaleAnimationSettings:v15];

  v16 = SBEntityRemovalDefaultFluidAnimationSettings();
  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeMadeFullscreenScaleResetAnimationSettings:v16];

  v17 = SBEntityRemovalDefaultFluidAnimationSettings();
  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeRemovedSlideOutAnimationSettings:v17];

  v18 = [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self toBeRemovedSlideOutAnimationSettings];
  [v18 setResponse:0.600000024];

  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeRemovedSlideOutAnimationDelay:0.275000006];
  [(SBEntityRemovalMedusaSlideOutAnimationSettings *)self setToBeRemovedSlideOutHeightOffsetMultiplier:1.20000005];
}

+ (id)settingsControllerModule
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be made Fullscreen Push-In Scale" valueKeyPath:@"toBeMadeFullScreenPushInScale"];
  v4 = [v3 minValue:0.0 maxValue:1.0];
  v37[0] = v4;
  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be made Fullscreen Scale Reset Animation Dealy" valueKeyPath:@"toBeMadeFullScreenScaleResetAnimationDelay"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v37[1] = v6;
  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Removed Slide Out Animation Dealy" valueKeyPath:@"toBeRemovedSlideOutAnimationDelay"];
  v8 = [v7 minValue:0.0 maxValue:1.0];
  v37[2] = v8;
  v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Removed Slide Out Height Offset Multiplier" valueKeyPath:@"toBeRemovedSlideOutHeightOffsetMultiplier"];
  v10 = [v9 minValue:1.0 maxValue:2.0];
  v37[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  v34 = [v2 sectionWithRows:v11 title:@"Push-In Scale Settings"];

  v12 = (void *)MEMORY[0x1E4F94168];
  v13 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be made Fullscreen Scale-Reset Animation"];
  v33 = [v12 submoduleWithModule:v13 childSettingsKeyPath:@"toBeMadeFullscreenPushInScaleAnimationSettings"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v15 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be made Fullscreen Push-In Scale Animation"];
  v16 = [v14 submoduleWithModule:v15 childSettingsKeyPath:@"toBeMadeFullscreenScaleResetAnimationSettings"];

  v17 = (void *)MEMORY[0x1E4F94168];
  v18 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be Removed Slide-Out Animation"];
  objc_super v19 = [v17 submoduleWithModule:v18 childSettingsKeyPath:@"toBeRemovedSlideOutAnimationSettings"];

  v20 = (void *)MEMORY[0x1E4F94168];
  v21 = +[SBEntityRemovalMedusaDefaultAnimationSettings _settingsModule];
  v22 = [v20 submoduleWithModule:v21 childSettingsKeyPath:@"defaultAnimationSettings"];

  v23 = (void *)MEMORY[0x1E4F94168];
  v24 = (void *)MEMORY[0x1E4F94100];
  v25 = [MEMORY[0x1E4F94178] action];
  v26 = [v24 rowWithTitle:@"Restore Medusa SlideOut Animation Settings" action:v25];
  v36 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v28 = [v23 sectionWithRows:v27];

  v29 = (void *)MEMORY[0x1E4F94168];
  v35[0] = v34;
  v35[1] = v16;
  v35[2] = v33;
  v35[3] = v19;
  v35[4] = v22;
  v35[5] = v28;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:6];
  v31 = [v29 moduleWithTitle:@"Medusa Entity Removal SlideOut Animation Settings" contents:v30];

  return v31;
}

- (double)toBeMadeFullScreenPushInScale
{
  return self->_toBeMadeFullScreenPushInScale;
}

- (void)setToBeMadeFullScreenPushInScale:(double)a3
{
  self->_toBeMadeFullScreenPushInScale = a3;
}

- (double)toBeMadeFullScreenScaleResetAnimationDelay
{
  return self->_toBeMadeFullScreenScaleResetAnimationDelay;
}

- (void)setToBeMadeFullScreenScaleResetAnimationDelay:(double)a3
{
  self->_toBeMadeFullScreenScaleResetAnimationDelay = a3;
}

- (double)toBeRemovedSlideOutAnimationDelay
{
  return self->_toBeRemovedSlideOutAnimationDelay;
}

- (void)setToBeRemovedSlideOutAnimationDelay:(double)a3
{
  self->_toBeRemovedSlideOutAnimationDelay = a3;
}

- (double)toBeRemovedSlideOutHeightOffsetMultiplier
{
  return self->_toBeRemovedSlideOutHeightOffsetMultiplier;
}

- (void)setToBeRemovedSlideOutHeightOffsetMultiplier:(double)a3
{
  self->_toBeRemovedSlideOutHeightOffsetMultiplier = a3;
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenPushInScaleAnimationSettings
{
  return self->_toBeMadeFullscreenPushInScaleAnimationSettings;
}

- (void)setToBeMadeFullscreenPushInScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenScaleResetAnimationSettings
{
  return self->_toBeMadeFullscreenScaleResetAnimationSettings;
}

- (void)setToBeMadeFullscreenScaleResetAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toBeRemovedSlideOutAnimationSettings
{
  return self->_toBeRemovedSlideOutAnimationSettings;
}

- (void)setToBeRemovedSlideOutAnimationSettings:(id)a3
{
}

- (SBEntityRemovalMedusaDefaultAnimationSettings)defaultAnimationSettings
{
  return self->_defaultAnimationSettings;
}

- (void)setDefaultAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeRemovedSlideOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenScaleResetAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenPushInScaleAnimationSettings, 0);
}

@end