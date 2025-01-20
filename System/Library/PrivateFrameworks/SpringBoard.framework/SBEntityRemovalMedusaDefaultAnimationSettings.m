@interface SBEntityRemovalMedusaDefaultAnimationSettings
+ (id)_settingsModule;
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)toBeMadeFullscreenFrameAnimationSettings;
- (SBFFluidBehaviorSettings)toBeRemovedAlphaAnimationSettings;
- (SBFFluidBehaviorSettings)toBeRemovedScaleAnimationSettings;
- (double)toBeMadeFullscreenFrameAnimationDelay;
- (double)toBeRemovedFinalAlpha;
- (double)toBeRemovedFinalBlurRadius;
- (double)toBeRemovedFinalScale;
- (void)setDefaultValues;
- (void)setToBeMadeFullscreenFrameAnimationDelay:(double)a3;
- (void)setToBeMadeFullscreenFrameAnimationSettings:(id)a3;
- (void)setToBeRemovedAlphaAnimationSettings:(id)a3;
- (void)setToBeRemovedFinalAlpha:(double)a3;
- (void)setToBeRemovedFinalBlurRadius:(double)a3;
- (void)setToBeRemovedFinalScale:(double)a3;
- (void)setToBeRemovedScaleAnimationSettings:(id)a3;
@end

@implementation SBEntityRemovalMedusaDefaultAnimationSettings

- (void)setDefaultValues
{
  v9.receiver = self;
  v9.super_class = (Class)SBEntityRemovalMedusaDefaultAnimationSettings;
  [(PTSettings *)&v9 setDefaultValues];
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeRemovedFinalScale:0.899999976];
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeRemovedFinalAlpha:0.0];
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeRemovedFinalBlurRadius:6.0];
  BOOL v3 = SBReduceMotion();
  double v4 = 0.129999995;
  if (v3) {
    double v4 = 0.25;
  }
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeMadeFullscreenFrameAnimationDelay:v4];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v5 setBehaviorType:2];
  [v5 setDampingRatio:1.0];
  [v5 setResponse:0.550000012];
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeRemovedScaleAnimationSettings:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v6 setBehaviorType:2];
  [v6 setDampingRatio:1.0];
  [v6 setResponse:0.300000012];
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeRemovedAlphaAnimationSettings:v6];
  v7 = SBEntityRemovalDefaultFluidAnimationSettings();
  [(SBEntityRemovalMedusaDefaultAnimationSettings *)self setToBeMadeFullscreenFrameAnimationSettings:v7];

  v8 = [(SBEntityRemovalMedusaDefaultAnimationSettings *)self toBeMadeFullscreenFrameAnimationSettings];
  [v8 setResponse:0.430000007];
}

+ (id)_settingsModule
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  BOOL v3 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Removed Final Scale" valueKeyPath:@"toBeRemovedFinalScale"];
  double v4 = [v3 minValue:0.0 maxValue:2.0];
  v34[0] = v4;
  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Removed Final Alpha" valueKeyPath:@"toBeRemovedFinalAlpha"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v34[1] = v6;
  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Removed Final Blur Radius" valueKeyPath:@"toBeRemovedFinalBlurRadius"];
  v8 = [v7 minValue:0.0 maxValue:10.0];
  v34[2] = v8;
  objc_super v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"To be Made Fullscreen Animations Delay" valueKeyPath:@"toBeMadeFullscreenFrameAnimationDelay"];
  CAFrameRateRange v10 = [v9 minValue:0.0 maxValue:1.0];
  v34[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  v31 = [v2 sectionWithRows:v11, @"Scale, Alpha, and Delay Settings" title];

  v12 = (void *)MEMORY[0x1E4F94168];
  v13 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be Removed Scale Animation"];
  v14 = [v12 submoduleWithModule:v13 childSettingsKeyPath:@"toBeRemovedScaleAnimationSettings"];

  v15 = (void *)MEMORY[0x1E4F94168];
  v16 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be Removed Alpha Animation"];
  v17 = [v15 submoduleWithModule:v16 childSettingsKeyPath:@"toBeRemovedAlphaAnimationSettings"];

  v18 = (void *)MEMORY[0x1E4F94168];
  v19 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"To be Made Fullscreen Frame Animation"];
  v20 = [v18 submoduleWithModule:v19 childSettingsKeyPath:@"toBeMadeFullscreenFrameAnimationSettings"];

  v21 = (void *)MEMORY[0x1E4F94168];
  v22 = (void *)MEMORY[0x1E4F94100];
  v23 = [MEMORY[0x1E4F94178] action];
  v24 = [v22 rowWithTitle:@"Restore Medusa Default Animation Settings" action:v23];
  v33 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v26 = [v21 sectionWithRows:v25];

  v27 = (void *)MEMORY[0x1E4F94168];
  v32[0] = v31;
  v32[1] = v20;
  v32[2] = v14;
  v32[3] = v17;
  v32[4] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  v29 = [v27 moduleWithTitle:@"Medusa Entity Removal Default Animation Settings" contents:v28];

  return v29;
}

+ (id)settingsControllerModule
{
  v2 = objc_opt_class();
  return (id)[v2 _settingsModule];
}

- (double)toBeRemovedFinalScale
{
  return self->_toBeRemovedFinalScale;
}

- (void)setToBeRemovedFinalScale:(double)a3
{
  self->_toBeRemovedFinalScale = a3;
}

- (double)toBeRemovedFinalAlpha
{
  return self->_toBeRemovedFinalAlpha;
}

- (void)setToBeRemovedFinalAlpha:(double)a3
{
  self->_toBeRemovedFinalAlpha = a3;
}

- (double)toBeRemovedFinalBlurRadius
{
  return self->_toBeRemovedFinalBlurRadius;
}

- (void)setToBeRemovedFinalBlurRadius:(double)a3
{
  self->_toBeRemovedFinalBlurRadius = a3;
}

- (double)toBeMadeFullscreenFrameAnimationDelay
{
  return self->_toBeMadeFullscreenFrameAnimationDelay;
}

- (void)setToBeMadeFullscreenFrameAnimationDelay:(double)a3
{
  self->_toBeMadeFullscreenFrameAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)toBeMadeFullscreenFrameAnimationSettings
{
  return self->_toBeMadeFullscreenFrameAnimationSettings;
}

- (void)setToBeMadeFullscreenFrameAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toBeRemovedScaleAnimationSettings
{
  return self->_toBeRemovedScaleAnimationSettings;
}

- (void)setToBeRemovedScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)toBeRemovedAlphaAnimationSettings
{
  return self->_toBeRemovedAlphaAnimationSettings;
}

- (void)setToBeRemovedAlphaAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBeRemovedAlphaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeRemovedScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toBeMadeFullscreenFrameAnimationSettings, 0);
}

@end