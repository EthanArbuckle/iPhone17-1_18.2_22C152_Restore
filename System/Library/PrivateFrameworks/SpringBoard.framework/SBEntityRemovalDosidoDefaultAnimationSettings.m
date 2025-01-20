@interface SBEntityRemovalDosidoDefaultAnimationSettings
+ (id)_settingsModule;
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)fromViewAlphaAnimationSettings;
- (SBFFluidBehaviorSettings)fromViewScaleAnimationSettings;
- (SBFFluidBehaviorSettings)toViewDimmingViewAlphaAnimationSettings;
- (SBFFluidBehaviorSettings)toViewScaleAndAlphaResetAnimationSettings;
- (SBFFluidBehaviorSettings)toViewWallpaperScaleAnimationSettings;
- (double)fromViewAlphaAnimationDelay;
- (double)fromViewFinalAlpha;
- (double)fromViewFinalBlurRadius;
- (double)fromViewFinalScale;
- (double)toViewDimmingViewFadeOutDelay;
- (double)toViewInitialBlurProgress;
- (double)toViewInitialDimmingAlpha;
- (double)toViewInitialPushInScale;
- (double)toViewScaleAndAlphaResetAnimationDelay;
- (double)toViewScreenInitialAlpha;
- (void)setDefaultValues;
- (void)setFromViewAlphaAnimationDelay:(double)a3;
- (void)setFromViewAlphaAnimationSettings:(id)a3;
- (void)setFromViewFinalAlpha:(double)a3;
- (void)setFromViewFinalBlurRadius:(double)a3;
- (void)setFromViewFinalScale:(double)a3;
- (void)setFromViewScaleAnimationSettings:(id)a3;
- (void)setToViewDimmingViewAlphaAnimationSettings:(id)a3;
- (void)setToViewDimmingViewFadeOutDelay:(double)a3;
- (void)setToViewInitialBlurProgress:(double)a3;
- (void)setToViewInitialDimmingAlpha:(double)a3;
- (void)setToViewInitialPushInScale:(double)a3;
- (void)setToViewScaleAndAlphaResetAnimationDelay:(double)a3;
- (void)setToViewScaleAndAlphaResetAnimationSettings:(id)a3;
- (void)setToViewScreenInitialAlpha:(double)a3;
- (void)setToViewWallpaperScaleAnimationSettings:(id)a3;
@end

@implementation SBEntityRemovalDosidoDefaultAnimationSettings

- (void)setDefaultValues
{
  v11.receiver = self;
  v11.super_class = (Class)SBEntityRemovalDosidoDefaultAnimationSettings;
  [(PTSettings *)&v11 setDefaultValues];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v3 setBehaviorType:1];
  [v3 setDampingRatio:1.0];
  [v3 setResponse:0.550000012];
  [v3 setRetargetImpulse:0.0280000009];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewAlphaAnimationSettings:v3];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewAlphaAnimationDelay:0.140000001];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewFinalScale:1.10000002];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewFinalAlpha:0.0];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewFinalBlurRadius:6.0];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewInitialPushInScale:0.899999976];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewScreenInitialAlpha:0.5];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewInitialDimmingAlpha:0.569999993];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewInitialBlurProgress:1.0];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewScaleAndAlphaResetAnimationDelay:0.119999997];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewDimmingViewFadeOutDelay:0.0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v4 setBehaviorType:2];
  [v4 setDampingRatio:0.879999995];
  [v4 setResponse:0.699999988];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setFromViewScaleAnimationSettings:v4];
  v5 = SBEntityRemovalDefaultFluidAnimationSettings();
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewScaleAndAlphaResetAnimationSettings:v5];

  v6 = [(SBEntityRemovalDosidoDefaultAnimationSettings *)self toViewScaleAndAlphaResetAnimationSettings];
  [v6 setDampingRatio:1.29999995];

  v7 = [(SBEntityRemovalDosidoDefaultAnimationSettings *)self toViewScaleAndAlphaResetAnimationSettings];
  [v7 setResponse:0.75];

  v8 = [(SBEntityRemovalDosidoDefaultAnimationSettings *)self toViewScaleAndAlphaResetAnimationSettings];
  [v8 setRetargetImpulse:0.0280000009];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v9 setBehaviorType:1];
  [v9 setDampingRatio:1.29999995];
  [v9 setResponse:0.75];
  [v9 setRetargetImpulse:0.028];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewWallpaperScaleAnimationSettings:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v10 setBehaviorType:1];
  [v10 setDampingRatio:1.0];
  [v10 setResponse:0.31400001];
  [(SBEntityRemovalDosidoDefaultAnimationSettings *)self setToViewDimmingViewAlphaAnimationSettings:v10];
}

+ (id)_settingsModule
{
  v52[10] = *MEMORY[0x1E4F143B8];
  v43 = (void *)MEMORY[0x1E4F94168];
  v48 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App(s) Final Scale" valueKeyPath:@"fromViewFinalScale"];
  v46 = [v48 minValue:0.0 maxValue:2.0];
  v52[0] = v46;
  v45 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App(s) Final Alpha" valueKeyPath:@"fromViewFinalAlpha"];
  v42 = [v45 minValue:0.0 maxValue:1.0];
  v52[1] = v42;
  v41 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App(s) Final Blur Radius" valueKeyPath:@"fromViewFinalBlurRadius"];
  v40 = [v41 minValue:0.0 maxValue:10.0];
  v52[2] = v40;
  v39 = [MEMORY[0x1E4F941E0] rowWithTitle:@"App(s) Alpha Animation Delay" valueKeyPath:@"fromViewAlphaAnimationDelay"];
  v38 = [v39 minValue:0.0 maxValue:1.0];
  v52[3] = v38;
  v37 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Initial Push-In Scale" valueKeyPath:@"toViewInitialPushInScale"];
  v36 = [v37 minValue:0.0 maxValue:1.0];
  v52[4] = v36;
  v35 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Initial Alpha" valueKeyPath:@"toViewScreenInitialAlpha"];
  v2 = [v35 minValue:0.0 maxValue:1.0];
  v52[5] = v2;
  v3 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Initial Dimming Alpha" valueKeyPath:@"toViewInitialDimmingAlpha"];
  v4 = [v3 minValue:0.0 maxValue:1.0];
  v52[6] = v4;
  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Initial Blur Progress" valueKeyPath:@"toViewInitialBlurProgress"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v52[7] = v6;
  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Scale and Alpha Reset Animation Delay" valueKeyPath:@"toViewScaleAndAlphaResetAnimationDelay"];
  v8 = [v7 minValue:0.0 maxValue:1.0];
  v52[8] = v8;
  v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Screen Dimming View Fade-Out Animation Delay" valueKeyPath:@"toViewDimmingViewFadeOutDelay"];
  v10 = [v9 minValue:0.0 maxValue:1.0];
  v52[9] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:10];
  v44 = [v43 sectionWithRows:v11 title:@"Scale and Alpha Settings"];

  CAFrameRateRange v12 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v13 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"App(s) Scale Animation"];
  v49 = [v12 submoduleWithModule:v13 childSettingsKeyPath:@"fromViewScaleAnimationSettings"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v15 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"App(s) Alpha Animation"];
  v47 = [v14 submoduleWithModule:v15 childSettingsKeyPath:@"fromViewAlphaAnimationSettings"];

  v16 = (void *)MEMORY[0x1E4F94168];
  v17 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Home Screen Scale and Alpha Reset Animation"];
  v18 = [v16 submoduleWithModule:v17 childSettingsKeyPath:@"toViewScaleAndAlphaResetAnimationSettings"];

  v19 = (void *)MEMORY[0x1E4F94168];
  v20 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Home Screen Wallpaper Scale Reset Animation"];
  v21 = [v19 submoduleWithModule:v20 childSettingsKeyPath:@"toViewWallpaperScaleAnimationSettings"];

  v22 = (void *)MEMORY[0x1E4F94168];
  v23 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Home Screen Dimming View Fade-Out Animation"];
  v24 = [v22 submoduleWithModule:v23 childSettingsKeyPath:@"toViewDimmingViewAlphaAnimationSettings"];

  v25 = (void *)MEMORY[0x1E4F94168];
  v26 = (void *)MEMORY[0x1E4F94100];
  v27 = [MEMORY[0x1E4F94178] action];
  v28 = [v26 rowWithTitle:@"Restore Dosido Default Animation Settings" action:v27];
  v51 = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v30 = [v25 sectionWithRows:v29];

  v31 = (void *)MEMORY[0x1E4F94168];
  v50[0] = v44;
  v50[1] = v49;
  v50[2] = v47;
  v50[3] = v18;
  v50[4] = v21;
  v50[5] = v24;
  v50[6] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:7];
  v33 = [v31 moduleWithTitle:@"Dosido to HomeScreen Default Animation Settings" contents:v32];

  return v33;
}

+ (id)settingsControllerModule
{
  v2 = objc_opt_class();
  return (id)[v2 _settingsModule];
}

- (double)fromViewFinalScale
{
  return self->_fromViewFinalScale;
}

- (void)setFromViewFinalScale:(double)a3
{
  self->_fromViewFinalScale = a3;
}

- (double)fromViewFinalAlpha
{
  return self->_fromViewFinalAlpha;
}

- (void)setFromViewFinalAlpha:(double)a3
{
  self->_fromViewFinalAlpha = a3;
}

- (double)fromViewFinalBlurRadius
{
  return self->_fromViewFinalBlurRadius;
}

- (void)setFromViewFinalBlurRadius:(double)a3
{
  self->_fromViewFinalBlurRadius = a3;
}

- (double)fromViewAlphaAnimationDelay
{
  return self->_fromViewAlphaAnimationDelay;
}

- (void)setFromViewAlphaAnimationDelay:(double)a3
{
  self->_fromViewAlphaAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)fromViewScaleAnimationSettings
{
  return self->_fromViewScaleAnimationSettings;
}

- (void)setFromViewScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)fromViewAlphaAnimationSettings
{
  return self->_fromViewAlphaAnimationSettings;
}

- (void)setFromViewAlphaAnimationSettings:(id)a3
{
}

- (double)toViewInitialPushInScale
{
  return self->_toViewInitialPushInScale;
}

- (void)setToViewInitialPushInScale:(double)a3
{
  self->_toViewInitialPushInScale = a3;
}

- (double)toViewScreenInitialAlpha
{
  return self->_toViewScreenInitialAlpha;
}

- (void)setToViewScreenInitialAlpha:(double)a3
{
  self->_toViewScreenInitialAlpha = a3;
}

- (double)toViewInitialDimmingAlpha
{
  return self->_toViewInitialDimmingAlpha;
}

- (void)setToViewInitialDimmingAlpha:(double)a3
{
  self->_toViewInitialDimmingAlpha = a3;
}

- (double)toViewInitialBlurProgress
{
  return self->_toViewInitialBlurProgress;
}

- (void)setToViewInitialBlurProgress:(double)a3
{
  self->_toViewInitialBlurProgress = a3;
}

- (double)toViewScaleAndAlphaResetAnimationDelay
{
  return self->_toViewScaleAndAlphaResetAnimationDelay;
}

- (void)setToViewScaleAndAlphaResetAnimationDelay:(double)a3
{
  self->_toViewScaleAndAlphaResetAnimationDelay = a3;
}

- (double)toViewDimmingViewFadeOutDelay
{
  return self->_toViewDimmingViewFadeOutDelay;
}

- (void)setToViewDimmingViewFadeOutDelay:(double)a3
{
  self->_toViewDimmingViewFadeOutDelay = a3;
}

- (SBFFluidBehaviorSettings)toViewScaleAndAlphaResetAnimationSettings
{
  return self->_toViewScaleAndAlphaResetAnimationSettings;
}

- (void)setToViewScaleAndAlphaResetAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toViewWallpaperScaleAnimationSettings
{
  return self->_toViewWallpaperScaleAnimationSettings;
}

- (void)setToViewWallpaperScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toViewDimmingViewAlphaAnimationSettings
{
  return self->_toViewDimmingViewAlphaAnimationSettings;
}

- (void)setToViewDimmingViewAlphaAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewDimmingViewAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toViewWallpaperScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toViewScaleAndAlphaResetAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fromViewAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fromViewScaleAnimationSettings, 0);
}

@end