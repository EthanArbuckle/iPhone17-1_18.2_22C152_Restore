@interface SBSwitcherSystemApertureSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)zoomFromJindoBlurAnimationSettings;
- (SBFFluidBehaviorSettings)zoomFromJindoCornerRadiusSettings;
- (SBFFluidBehaviorSettings)zoomFromJindoLayoutSettings;
- (SBFFluidBehaviorSettings)zoomFromJindoPositionSettings;
- (SBFFluidBehaviorSettings)zoomFromJindoScaleAndRotateSettings;
- (SBFFluidBehaviorSettings)zoomToAndFromJindoMeshSettings;
- (SBFFluidBehaviorSettings)zoomToJindoBlurAnimationSettings;
- (SBFFluidBehaviorSettings)zoomToJindoCornerRadiusSettings;
- (SBFFluidBehaviorSettings)zoomToJindoLayoutAlternateSettings;
- (SBFFluidBehaviorSettings)zoomToJindoLayoutSettings;
- (SBFFluidBehaviorSettings)zoomToJindoPositionAlternateSettings;
- (SBFFluidBehaviorSettings)zoomToJindoPositionSettings;
- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateAlternateSettings;
- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateSettings;
- (SBFFluidBehaviorSettings)zoomToJindoTopClippingSettings;
- (double)xDeltaToRotationMappingFactor;
- (double)zoomFromJindoBeginUnblurringProgressThreshold;
- (double)zoomFromJindoUnmaskThreshold;
- (double)zoomToFromJindoMaxBlurRadius;
- (double)zoomToFromJindoMaxCornerRadius;
- (double)zoomToJindoArcSwipeScale;
- (double)zoomToJindoBeginShowingShadowThreshold;
- (double)zoomToJindoBounceThreshold;
- (double)zoomToJindoEndShowingShadowThreshold;
- (double)zoomToJindoStraightSwipeAlternateScale;
- (double)zoomToJindoStraightSwipeScale;
- (double)zoomToJindoTargetXDisplacement;
- (double)zoomToJindoTargetYDisplacement;
- (double)zoomToJindoTuckInThreshold;
- (double)zoomToJindoYFromScreenTopToUseAlternateSettings;
- (void)setDefaultValues;
- (void)setXDeltaToRotationMappingFactor:(double)a3;
- (void)setZoomFromJindoBeginUnblurringProgressThreshold:(double)a3;
- (void)setZoomFromJindoBlurAnimationSettings:(id)a3;
- (void)setZoomFromJindoCornerRadiusSettings:(id)a3;
- (void)setZoomFromJindoLayoutSettings:(id)a3;
- (void)setZoomFromJindoPositionSettings:(id)a3;
- (void)setZoomFromJindoScaleAndRotateSettings:(id)a3;
- (void)setZoomFromJindoUnmaskThreshold:(double)a3;
- (void)setZoomToAndFromJindoMeshSettings:(id)a3;
- (void)setZoomToFromJindoMaxBlurRadius:(double)a3;
- (void)setZoomToFromJindoMaxCornerRadius:(double)a3;
- (void)setZoomToJindoArcSwipeScale:(double)a3;
- (void)setZoomToJindoBeginShowingShadowThreshold:(double)a3;
- (void)setZoomToJindoBlurAnimationSettings:(id)a3;
- (void)setZoomToJindoBounceThreshold:(double)a3;
- (void)setZoomToJindoCornerRadiusSettings:(id)a3;
- (void)setZoomToJindoEndShowingShadowThreshold:(double)a3;
- (void)setZoomToJindoLayoutAlternateSettings:(id)a3;
- (void)setZoomToJindoLayoutSettings:(id)a3;
- (void)setZoomToJindoPositionAlternateSettings:(id)a3;
- (void)setZoomToJindoPositionSettings:(id)a3;
- (void)setZoomToJindoScaleAndRotateAlternateSettings:(id)a3;
- (void)setZoomToJindoScaleAndRotateSettings:(id)a3;
- (void)setZoomToJindoStraightSwipeAlternateScale:(double)a3;
- (void)setZoomToJindoStraightSwipeScale:(double)a3;
- (void)setZoomToJindoTargetXDisplacement:(double)a3;
- (void)setZoomToJindoTargetYDisplacement:(double)a3;
- (void)setZoomToJindoTopClippingSettings:(id)a3;
- (void)setZoomToJindoTuckInThreshold:(double)a3;
- (void)setZoomToJindoYFromScreenTopToUseAlternateSettings:(double)a3;
@end

@implementation SBSwitcherSystemApertureSettings

- (void)setDefaultValues
{
  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherSystemApertureSettings;
  [(PTSettings *)&v18 setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutSettings setDampingRatio:0.912];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutSettings setResponse:0.574];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutSettings setRetargetImpulse:0.02];
  zoomToJindoLayoutSettings = self->_zoomToJindoLayoutSettings;
  CAFrameRateRange v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutAlternateSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutAlternateSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutAlternateSettings setDampingRatio:0.912];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutAlternateSettings setResponse:0.574];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoLayoutAlternateSettings setRetargetImpulse:0.02];
  zoomToJindoLayoutAlternateSettings = self->_zoomToJindoLayoutAlternateSettings;
  CAFrameRateRange v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoLayoutAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionSettings setDampingRatio:0.912];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionSettings setResponse:0.574];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionSettings setRetargetImpulse:0.02];
  zoomToJindoPositionSettings = self->_zoomToJindoPositionSettings;
  CAFrameRateRange v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionAlternateSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionAlternateSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionAlternateSettings setDampingRatio:0.912];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionAlternateSettings setResponse:0.62];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoPositionAlternateSettings setRetargetImpulse:0.02];
  zoomToJindoPositionAlternateSettings = self->_zoomToJindoPositionAlternateSettings;
  CAFrameRateRange v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoPositionAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoCornerRadiusSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoCornerRadiusSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoCornerRadiusSettings setDampingRatio:0.745];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoCornerRadiusSettings setResponse:0.468];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoCornerRadiusSettings setRetargetImpulse:0.018];
  zoomToJindoCornerRadiusSettings = self->_zoomToJindoCornerRadiusSettings;
  CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateSettings setDampingRatio:0.745];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateSettings setResponse:0.468];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateSettings setRetargetImpulse:0.018];
  zoomToJindoScaleAndRotateSettings = self->_zoomToJindoScaleAndRotateSettings;
  CAFrameRateRange v24 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoScaleAndRotateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateAlternateSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateAlternateSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateAlternateSettings setDampingRatio:0.745];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateAlternateSettings setResponse:0.3];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoScaleAndRotateAlternateSettings setRetargetImpulse:0.018];
  zoomToJindoScaleAndRotateAlternateSettings = self->_zoomToJindoScaleAndRotateAlternateSettings;
  CAFrameRateRange v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoScaleAndRotateAlternateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoBlurAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoBlurAnimationSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoBlurAnimationSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoBlurAnimationSettings setResponse:0.25];
  zoomToJindoBlurAnimationSettings = self->_zoomToJindoBlurAnimationSettings;
  CAFrameRateRange v26 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoBlurAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v26.minimum, *(double *)&v26.maximum, *(double *)&v26.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoTopClippingSettings setDefaultCriticallyDampedValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoTopClippingSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoTopClippingSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_zoomToJindoTopClippingSettings setResponse:0.2];
  zoomToJindoTopClippingSettings = self->_zoomToJindoTopClippingSettings;
  CAFrameRateRange v27 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToJindoTopClippingSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v27.minimum, *(double *)&v27.maximum, *(double *)&v27.preferred);
  self->_zoomToJindoTargetYDisplacement = 0.68;
  self->_zoomToJindoTargetXDisplacement = 0.5;
  self->_zoomToJindoStraightSwipeScale = 0.27;
  self->_zoomToJindoStraightSwipeAlternateScale = 0.27;
  self->_zoomToJindoArcSwipeScale = 0.24;
  self->_zoomToJindoTuckInThreshold = 0.4;
  self->_zoomToJindoBounceThreshold = 0.4;
  self->_xDeltaToRotationMappingFactor = 0.7;
  self->_zoomToJindoYFromScreenTopToUseAlternateSettings = 48.0;
  [(SBFFluidBehaviorSettings *)self->_zoomToAndFromJindoMeshSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomToAndFromJindoMeshSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomToAndFromJindoMeshSettings setDampingRatio:0.912];
  [(SBFFluidBehaviorSettings *)self->_zoomToAndFromJindoMeshSettings setResponse:0.574];
  [(SBFFluidBehaviorSettings *)self->_zoomToAndFromJindoMeshSettings setRetargetImpulse:0.02];
  zoomToAndFromJindoMeshSettings = self->_zoomToAndFromJindoMeshSettings;
  CAFrameRateRange v28 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomToAndFromJindoMeshSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v28.minimum, *(double *)&v28.maximum, *(double *)&v28.preferred);
  self->_zoomToJindoBeginShowingShadowThreshold = 0.0;
  self->_zoomToJindoEndShowingShadowThreshold = 0.85;
  self->_zoomToFromJindoMaxBlurRadius = 6.0;
  self->_zoomToFromJindoMaxCornerRadius = 160.0;
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoLayoutSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoLayoutSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoLayoutSettings setDampingRatio:0.919];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoLayoutSettings setResponse:0.444];
  zoomFromJindoLayoutSettings = self->_zoomFromJindoLayoutSettings;
  CAFrameRateRange v29 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoPositionSettings setDefaultCriticallyDampedValues];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoPositionSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoPositionSettings setResponse:0.3];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoPositionSettings setBehaviorType:1];
  zoomFromJindoPositionSettings = self->_zoomFromJindoPositionSettings;
  CAFrameRateRange v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoCornerRadiusSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoCornerRadiusSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoCornerRadiusSettings setDampingRatio:0.9];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoCornerRadiusSettings setResponse:0.55];
  zoomFromJindoCornerRadiusSettings = self->_zoomFromJindoCornerRadiusSettings;
  CAFrameRateRange v31 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoScaleAndRotateSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoScaleAndRotateSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoScaleAndRotateSettings setDampingRatio:0.82];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoScaleAndRotateSettings setResponse:0.65];
  zoomFromJindoScaleAndRotateSettings = self->_zoomFromJindoScaleAndRotateSettings;
  CAFrameRateRange v32 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoScaleAndRotateSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoBlurAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoBlurAnimationSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoBlurAnimationSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_zoomFromJindoBlurAnimationSettings setResponse:0.45];
  zoomFromJindoBlurAnimationSettings = self->_zoomFromJindoBlurAnimationSettings;
  CAFrameRateRange v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](zoomFromJindoBlurAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
  self->_zoomFromJindoBeginUnblurringProgressThreshold = 0.2;
  self->_zoomFromJindoUnmaskThreshold = 0.3;
}

+ (id)settingsControllerModule
{
  v70[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v65 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v70[0] = v65;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  v64 = [v4 sectionWithRows:v5];

  v62 = (void *)MEMORY[0x1E4F94168];
  v59 = [MEMORY[0x1E4F94138] rowWithTitle:@"Layout Settings" childSettingsKeyPath:@"zoomToJindoLayoutSettings"];
  v69[0] = v59;
  v57 = [MEMORY[0x1E4F94138] rowWithTitle:@"Layout (Alt.) Settings" childSettingsKeyPath:@"zoomToJindoLayoutAlternateSettings"];
  v69[1] = v57;
  v56 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position Settings" childSettingsKeyPath:@"zoomToJindoPositionSettings"];
  v69[2] = v56;
  v55 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position (Alt.) Settings" childSettingsKeyPath:@"zoomToJindoPositionAlternateSettings"];
  v69[3] = v55;
  v54 = [MEMORY[0x1E4F94138] rowWithTitle:@"Corner Radius Settings" childSettingsKeyPath:@"zoomToJindoCornerRadiusSettings"];
  v69[4] = v54;
  v53 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scale Settings" childSettingsKeyPath:@"zoomToJindoScaleAndRotateSettings"];
  v69[5] = v53;
  v52 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scale (Alt.) Settings" childSettingsKeyPath:@"zoomToJindoScaleAndRotateAlternateSettings"];
  v69[6] = v52;
  v51 = [MEMORY[0x1E4F94138] rowWithTitle:@"Blur Settings" childSettingsKeyPath:@"zoomToJindoBlurAnimationSettings"];
  v69[7] = v51;
  v50 = [MEMORY[0x1E4F94138] rowWithTitle:@"Top Clipping Settings" childSettingsKeyPath:@"zoomToJindoTopClippingSettings"];
  v69[8] = v50;
  v49 = [MEMORY[0x1E4F94140] rowWithTitle:@"Target Y Displacement" valueKeyPath:@"zoomToJindoTargetYDisplacement"];
  v48 = [v49 between:0.0 and:10.0];
  v69[9] = v48;
  v47 = [MEMORY[0x1E4F94140] rowWithTitle:@"Target X Displacement" valueKeyPath:@"zoomToJindoTargetXDisplacement"];
  v46 = [v47 between:0.0 and:10.0];
  v69[10] = v46;
  v45 = [MEMORY[0x1E4F94140] rowWithTitle:@"Straight Swipe Scale" valueKeyPath:@"zoomToJindoStraightSwipeScale"];
  v44 = [v45 between:0.0 and:10000.0];
  v69[11] = v44;
  v43 = [MEMORY[0x1E4F94140] rowWithTitle:@"Straight Swipe (Alt.) Scale" valueKeyPath:@"zoomToJindoStraightSwipeAlternateScale"];
  v42 = [v43 between:0.0 and:10000.0];
  v69[12] = v42;
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Arc Swipe Scale" valueKeyPath:@"zoomToJindoArcSwipeScale"];
  v6 = [v41 between:0.0 and:10000.0];
  v69[13] = v6;
  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"Tuck In Threshold" valueKeyPath:@"zoomToJindoTuckInThreshold"];
  v8 = [v7 between:0.0 and:1.0];
  v69[14] = v8;
  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"Bounce Threshold" valueKeyPath:@"zoomToJindoBounceThreshold"];
  v10 = [v9 between:0.0 and:1.0];
  v69[15] = v10;
  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"xDel to Rotation Map Factor" valueKeyPath:@"xDeltaToRotationMappingFactor"];
  v12 = [v11 between:-3.14159265 and:3.14159265];
  v69[16] = v12;
  v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Screen Top Padding -> Alt Set." valueKeyPath:@"zoomToJindoYFromScreenTopToUseAlternateSettings"];
  v14 = [v13 between:-100.0 and:500.0];
  v69[17] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:18];
  v63 = [v62 sectionWithRows:v15 title:@"Zoom To Jindo"];

  v60 = (void *)MEMORY[0x1E4F94168];
  v16 = [MEMORY[0x1E4F94138] rowWithTitle:@"Mesh Settings" childSettingsKeyPath:@"zoomToAndFromJindoMeshSettings"];
  v68[0] = v16;
  v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Show Shadow Threshold" valueKeyPath:@"zoomToJindoBeginShowingShadowThreshold"];
  objc_super v18 = [v17 between:0.0 and:1.0];
  v68[1] = v18;
  CAFrameRateRange v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Hide Shadow Threshold" valueKeyPath:@"zoomToJindoEndShowingShadowThreshold"];
  CAFrameRateRange v20 = [v19 between:0.0 and:1.0];
  v68[2] = v20;
  CAFrameRateRange v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Blur Radius" valueKeyPath:@"zoomToFromJindoMaxBlurRadius"];
  CAFrameRateRange v22 = [v21 between:0.0 and:300.0];
  v68[3] = v22;
  CAFrameRateRange v23 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Corner Radius" valueKeyPath:@"zoomToFromJindoMaxCornerRadius"];
  CAFrameRateRange v24 = [v23 between:0.0 and:1000.0];
  v68[4] = v24;
  CAFrameRateRange v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
  v61 = [v60 sectionWithRows:v25 title:@"Zoom To/From Jindo"];

  CAFrameRateRange v26 = (void *)MEMORY[0x1E4F94168];
  v58 = [MEMORY[0x1E4F94138] rowWithTitle:@"Layout Settings" childSettingsKeyPath:@"zoomFromJindoLayoutSettings"];
  v67[0] = v58;
  CAFrameRateRange v27 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position Settings" childSettingsKeyPath:@"zoomFromJindoPositionSettings"];
  v67[1] = v27;
  CAFrameRateRange v28 = [MEMORY[0x1E4F94138] rowWithTitle:@"Corner Radius Settings" childSettingsKeyPath:@"zoomFromJindoCornerRadiusSettings"];
  v67[2] = v28;
  CAFrameRateRange v29 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scale Settings" childSettingsKeyPath:@"zoomFromJindoScaleAndRotateSettings"];
  v67[3] = v29;
  CAFrameRateRange v30 = [MEMORY[0x1E4F94138] rowWithTitle:@"Blur Settings" childSettingsKeyPath:@"zoomFromJindoBlurAnimationSettings"];
  v67[4] = v30;
  CAFrameRateRange v31 = [MEMORY[0x1E4F94140] rowWithTitle:@"Begin Unblurring Threshold" valueKeyPath:@"_zoomFromJindoBeginUnblurringProgressThreshold"];
  CAFrameRateRange v32 = [v31 between:0.0 and:1.0];
  v67[5] = v32;
  CAFrameRateRange v33 = [MEMORY[0x1E4F94140] rowWithTitle:@"Unmask Card Threshold" valueKeyPath:@"zoomFromJindoUnmaskThreshold"];
  v34 = [v33 between:0.0 and:1.0];
  v67[6] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:7];
  v36 = [v26 sectionWithRows:v35 title:@"Zoom From Jindo"];

  v37 = (void *)MEMORY[0x1E4F94168];
  v66[0] = v64;
  v66[1] = v63;
  v66[2] = v61;
  v66[3] = v36;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
  v39 = [v37 moduleWithTitle:@"System Aperture Switcher Behaviors" contents:v38];

  return v39;
}

- (SBFFluidBehaviorSettings)zoomToJindoLayoutSettings
{
  return self->_zoomToJindoLayoutSettings;
}

- (void)setZoomToJindoLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoLayoutAlternateSettings
{
  return self->_zoomToJindoLayoutAlternateSettings;
}

- (void)setZoomToJindoLayoutAlternateSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoPositionSettings
{
  return self->_zoomToJindoPositionSettings;
}

- (void)setZoomToJindoPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoPositionAlternateSettings
{
  return self->_zoomToJindoPositionAlternateSettings;
}

- (void)setZoomToJindoPositionAlternateSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoCornerRadiusSettings
{
  return self->_zoomToJindoCornerRadiusSettings;
}

- (void)setZoomToJindoCornerRadiusSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateSettings
{
  return self->_zoomToJindoScaleAndRotateSettings;
}

- (void)setZoomToJindoScaleAndRotateSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoScaleAndRotateAlternateSettings
{
  return self->_zoomToJindoScaleAndRotateAlternateSettings;
}

- (void)setZoomToJindoScaleAndRotateAlternateSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoBlurAnimationSettings
{
  return self->_zoomToJindoBlurAnimationSettings;
}

- (void)setZoomToJindoBlurAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomToJindoTopClippingSettings
{
  return self->_zoomToJindoTopClippingSettings;
}

- (void)setZoomToJindoTopClippingSettings:(id)a3
{
}

- (double)zoomToJindoTargetYDisplacement
{
  return self->_zoomToJindoTargetYDisplacement;
}

- (void)setZoomToJindoTargetYDisplacement:(double)a3
{
  self->_zoomToJindoTargetYDisplacement = a3;
}

- (double)zoomToJindoTargetXDisplacement
{
  return self->_zoomToJindoTargetXDisplacement;
}

- (void)setZoomToJindoTargetXDisplacement:(double)a3
{
  self->_zoomToJindoTargetXDisplacement = a3;
}

- (double)zoomToJindoStraightSwipeScale
{
  return self->_zoomToJindoStraightSwipeScale;
}

- (void)setZoomToJindoStraightSwipeScale:(double)a3
{
  self->_zoomToJindoStraightSwipeScale = a3;
}

- (double)zoomToJindoStraightSwipeAlternateScale
{
  return self->_zoomToJindoStraightSwipeAlternateScale;
}

- (void)setZoomToJindoStraightSwipeAlternateScale:(double)a3
{
  self->_zoomToJindoStraightSwipeAlternateScale = a3;
}

- (double)zoomToJindoArcSwipeScale
{
  return self->_zoomToJindoArcSwipeScale;
}

- (void)setZoomToJindoArcSwipeScale:(double)a3
{
  self->_zoomToJindoArcSwipeScale = a3;
}

- (double)zoomToJindoTuckInThreshold
{
  return self->_zoomToJindoTuckInThreshold;
}

- (void)setZoomToJindoTuckInThreshold:(double)a3
{
  self->_zoomToJindoTuckInThreshold = a3;
}

- (double)zoomToJindoBounceThreshold
{
  return self->_zoomToJindoBounceThreshold;
}

- (void)setZoomToJindoBounceThreshold:(double)a3
{
  self->_zoomToJindoBounceThreshold = a3;
}

- (double)xDeltaToRotationMappingFactor
{
  return self->_xDeltaToRotationMappingFactor;
}

- (void)setXDeltaToRotationMappingFactor:(double)a3
{
  self->_xDeltaToRotationMappingFactor = a3;
}

- (double)zoomToJindoYFromScreenTopToUseAlternateSettings
{
  return self->_zoomToJindoYFromScreenTopToUseAlternateSettings;
}

- (void)setZoomToJindoYFromScreenTopToUseAlternateSettings:(double)a3
{
  self->_zoomToJindoYFromScreenTopToUseAlternateSettings = a3;
}

- (SBFFluidBehaviorSettings)zoomToAndFromJindoMeshSettings
{
  return self->_zoomToAndFromJindoMeshSettings;
}

- (void)setZoomToAndFromJindoMeshSettings:(id)a3
{
}

- (double)zoomToJindoBeginShowingShadowThreshold
{
  return self->_zoomToJindoBeginShowingShadowThreshold;
}

- (void)setZoomToJindoBeginShowingShadowThreshold:(double)a3
{
  self->_zoomToJindoBeginShowingShadowThreshold = a3;
}

- (double)zoomToJindoEndShowingShadowThreshold
{
  return self->_zoomToJindoEndShowingShadowThreshold;
}

- (void)setZoomToJindoEndShowingShadowThreshold:(double)a3
{
  self->_zoomToJindoEndShowingShadowThreshold = a3;
}

- (double)zoomToFromJindoMaxBlurRadius
{
  return self->_zoomToFromJindoMaxBlurRadius;
}

- (void)setZoomToFromJindoMaxBlurRadius:(double)a3
{
  self->_zoomToFromJindoMaxBlurRadius = a3;
}

- (double)zoomToFromJindoMaxCornerRadius
{
  return self->_zoomToFromJindoMaxCornerRadius;
}

- (void)setZoomToFromJindoMaxCornerRadius:(double)a3
{
  self->_zoomToFromJindoMaxCornerRadius = a3;
}

- (SBFFluidBehaviorSettings)zoomFromJindoLayoutSettings
{
  return self->_zoomFromJindoLayoutSettings;
}

- (void)setZoomFromJindoLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomFromJindoPositionSettings
{
  return self->_zoomFromJindoPositionSettings;
}

- (void)setZoomFromJindoPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomFromJindoCornerRadiusSettings
{
  return self->_zoomFromJindoCornerRadiusSettings;
}

- (void)setZoomFromJindoCornerRadiusSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomFromJindoScaleAndRotateSettings
{
  return self->_zoomFromJindoScaleAndRotateSettings;
}

- (void)setZoomFromJindoScaleAndRotateSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomFromJindoBlurAnimationSettings
{
  return self->_zoomFromJindoBlurAnimationSettings;
}

- (void)setZoomFromJindoBlurAnimationSettings:(id)a3
{
}

- (double)zoomFromJindoBeginUnblurringProgressThreshold
{
  return self->_zoomFromJindoBeginUnblurringProgressThreshold;
}

- (void)setZoomFromJindoBeginUnblurringProgressThreshold:(double)a3
{
  self->_zoomFromJindoBeginUnblurringProgressThreshold = a3;
}

- (double)zoomFromJindoUnmaskThreshold
{
  return self->_zoomFromJindoUnmaskThreshold;
}

- (void)setZoomFromJindoUnmaskThreshold:(double)a3
{
  self->_zoomFromJindoUnmaskThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomFromJindoBlurAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoScaleAndRotateSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomFromJindoLayoutSettings, 0);
  objc_storeStrong((id *)&self->_zoomToAndFromJindoMeshSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoTopClippingSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoBlurAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoScaleAndRotateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoPositionAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoLayoutAlternateSettings, 0);
  objc_storeStrong((id *)&self->_zoomToJindoLayoutSettings, 0);
}

@end