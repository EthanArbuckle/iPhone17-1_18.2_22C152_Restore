@interface SUIAShockwavePrototypeSettings
+ (id)settingsControllerModule;
- (BOOL)aberrationUseColorBrightness;
- (BOOL)aberrationUseColorMatrixMultiply;
- (BOOL)aberrationUseColorSaturate;
- (BOOL)aberrationUseEDR;
- (BOOL)captureChromaticAberrationEnabled;
- (BOOL)captureMeshEnabled;
- (BOOL)shouldBehaveLikeLargeScreen:(CGSize)a3;
- (BOOL)siriButtonChromaticAberrationEnabled;
- (BOOL)siriButtonEdgeLightEnabled;
- (BOOL)siriButtonFillLightEnabled;
- (BOOL)siriButtonMeshEnabled;
- (BOOL)siriButtonMeshEnabledLargeScreen;
- (BOOL)siriEdgeChromaticAberrationEnabled;
- (BOOL)siriEdgeEdgeLightEnabled;
- (BOOL)siriEdgeFillLightEnabled;
- (BOOL)siriEdgeMeshEnabled;
- (BOOL)siriEdgeMeshEnabledLargeScreen;
- (BOOL)useSiriMeshForCapture;
- (BOOL)visualizeEffectMasks;
- (SUIAFluidBehaviorSettings)abberationCancelledFadeOutAnimationSettings;
- (SUIAFluidBehaviorSettings)abberationFadeOutAnimationSettings;
- (SUIAFluidBehaviorSettings)captureHintAnimationSettings;
- (SUIAFluidBehaviorSettings)donutMaskPositionAnimationSettings;
- (SUIAFluidBehaviorSettings)lightIntensityAnimationSettings;
- (SUIAFluidBehaviorSettings)lightIntensityCancelledAnimationSettings;
- (SUIAFluidBehaviorSettings)meshPointsAnimationSettings;
- (SUIAFluidBehaviorSettings)meshPointsCancelledAnimationSettings;
- (SUIAFluidBehaviorSettings)meshPositionAnimationSettings;
- (SUIAFluidBehaviorSettings)visionIntelligenceHintAnimationSettings;
- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskLargeScreen;
- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskSmallScreen;
- (SUIAShockwaveRadialMaskSettings)chromaticAberrationInitialDonutMask;
- (SUIAShockwaveRadialMaskSettings)colorFillFinalCircleMask;
- (SUIAShockwaveRadialMaskSettings)colorFillHintCircleMask;
- (SUIAShockwaveRadialMaskSettings)colorFillInitialCircleMask;
- (SUIAShockwaveRadialMaskSettings)edgeLightFinalCircleMask;
- (SUIAShockwaveRadialMaskSettings)edgeLightHintCircleMask;
- (SUIAShockwaveRadialMaskSettings)edgeLightInitialCircleMask;
- (double)aberrationBlurRadius;
- (double)aberrationColorBrightness;
- (double)aberrationColorMatrixMultiplyFactor;
- (double)aberrationColorSaturateAmount;
- (double)aberrationEDRGain;
- (double)aberrationFadeOutDelay;
- (double)aberrationFadeOutDelayIPad;
- (double)aberrationMagnitudeX;
- (double)aberrationMagnitudeY;
- (double)captureFillWhiteValue;
- (double)captureHintInterpolationProgress;
- (double)captureHintMeshOffset;
- (double)captureHintRetargetImpulse;
- (double)donutMaskEndTransitionDelay;
- (double)donutMaskInitialEdgeOutsetProportion;
- (double)edgeLightHintTransitionDelay;
- (double)fillLightCaptureInitialIntensity;
- (double)fillLightColorBrightnessAmount;
- (double)fillLightColorContrastAmount;
- (double)fillLightColorSaturateAmount;
- (double)fillLightFinalIntensity;
- (double)fillLightInitialIntensity;
- (double)fillLightIntensityFinalStateDelay;
- (double)finalFitVsDiameterRatioLongEdgeBigScreen;
- (double)finalFitVsDiameterRatioLongEdgeForShockwaveSize:(CGSize)a3;
- (double)finalFitVsDiameterRatioLongEdgeSmallScreen;
- (double)finalFitVsDiameterRatioShortEdgeBigScreen;
- (double)finalFitVsDiameterRatioShortEdgeForShockwaveSize:(CGSize)a3;
- (double)finalFitVsDiameterRatioShortEdgeSmallScreen;
- (double)maximumHintDuration;
- (double)meshFinalProportionAcrossScreenLongEdge;
- (double)meshFinalProportionAcrossScreenShortEdge;
- (double)meshFinalProportionTowardsCenterOnLargeDisplays;
- (double)meshPointsEndTransitionDelay;
- (double)meshRectangularFinalLongDimensionRatio;
- (double)meshRectangularFinalShortDimensionRatio;
- (double)meshSquareFinalSizeDiagonalRatio;
- (double)totalDuration;
- (double)visionIntelligenceHintFillLightInitialIntensity;
- (double)visionIntelligenceHintInterpolationProgress;
- (double)visionIntelligenceHintRetargetImpulse;
- (id)chromaticAberrationFinalDonutMaskForShockwaveSize:(CGSize)a3;
- (int64_t)captureFillLightType;
- (void)setAbberationCancelledFadeOutAnimationSettings:(id)a3;
- (void)setAbberationFadeOutAnimationSettings:(id)a3;
- (void)setAberrationBlurRadius:(double)a3;
- (void)setAberrationColorBrightness:(double)a3;
- (void)setAberrationColorMatrixMultiplyFactor:(double)a3;
- (void)setAberrationColorSaturateAmount:(double)a3;
- (void)setAberrationEDRGain:(double)a3;
- (void)setAberrationFadeOutDelay:(double)a3;
- (void)setAberrationFadeOutDelayIPad:(double)a3;
- (void)setAberrationMagnitudeX:(double)a3;
- (void)setAberrationMagnitudeY:(double)a3;
- (void)setAberrationUseColorBrightness:(BOOL)a3;
- (void)setAberrationUseColorMatrixMultiply:(BOOL)a3;
- (void)setAberrationUseColorSaturate:(BOOL)a3;
- (void)setAberrationUseEDR:(BOOL)a3;
- (void)setCaptureChromaticAberrationEnabled:(BOOL)a3;
- (void)setCaptureFillLightType:(int64_t)a3;
- (void)setCaptureFillWhiteValue:(double)a3;
- (void)setCaptureHintAnimationSettings:(id)a3;
- (void)setCaptureHintInterpolationProgress:(double)a3;
- (void)setCaptureHintMeshOffset:(double)a3;
- (void)setCaptureHintRetargetImpulse:(double)a3;
- (void)setCaptureMeshEnabled:(BOOL)a3;
- (void)setChromaticAberrationFinalDonutMaskLargeScreen:(id)a3;
- (void)setChromaticAberrationFinalDonutMaskSmallScreen:(id)a3;
- (void)setChromaticAberrationInitialDonutMask:(id)a3;
- (void)setColorFillFinalCircleMask:(id)a3;
- (void)setColorFillHintCircleMask:(id)a3;
- (void)setColorFillInitialCircleMask:(id)a3;
- (void)setDefaultValues;
- (void)setDonutMaskEndTransitionDelay:(double)a3;
- (void)setDonutMaskInitialEdgeOutsetProportion:(double)a3;
- (void)setDonutMaskPositionAnimationSettings:(id)a3;
- (void)setEdgeLightFinalCircleMask:(id)a3;
- (void)setEdgeLightHintCircleMask:(id)a3;
- (void)setEdgeLightHintTransitionDelay:(double)a3;
- (void)setEdgeLightInitialCircleMask:(id)a3;
- (void)setFillLightCaptureInitialIntensity:(double)a3;
- (void)setFillLightColorBrightnessAmount:(double)a3;
- (void)setFillLightColorContrastAmount:(double)a3;
- (void)setFillLightColorSaturateAmount:(double)a3;
- (void)setFillLightFinalIntensity:(double)a3;
- (void)setFillLightInitialIntensity:(double)a3;
- (void)setFillLightIntensityFinalStateDelay:(double)a3;
- (void)setFinalFitVsDiameterRatioLongEdgeBigScreen:(double)a3;
- (void)setFinalFitVsDiameterRatioLongEdgeSmallScreen:(double)a3;
- (void)setFinalFitVsDiameterRatioShortEdgeBigScreen:(double)a3;
- (void)setFinalFitVsDiameterRatioShortEdgeSmallScreen:(double)a3;
- (void)setLightIntensityAnimationSettings:(id)a3;
- (void)setLightIntensityCancelledAnimationSettings:(id)a3;
- (void)setMaximumHintDuration:(double)a3;
- (void)setMeshFinalProportionAcrossScreenLongEdge:(double)a3;
- (void)setMeshFinalProportionAcrossScreenShortEdge:(double)a3;
- (void)setMeshFinalProportionTowardsCenterOnLargeDisplays:(double)a3;
- (void)setMeshPointsAnimationSettings:(id)a3;
- (void)setMeshPointsCancelledAnimationSettings:(id)a3;
- (void)setMeshPointsEndTransitionDelay:(double)a3;
- (void)setMeshPositionAnimationSettings:(id)a3;
- (void)setMeshRectangularFinalLongDimensionRatio:(double)a3;
- (void)setMeshRectangularFinalShortDimensionRatio:(double)a3;
- (void)setMeshSquareFinalSizeDiagonalRatio:(double)a3;
- (void)setSiriButtonChromaticAberrationEnabled:(BOOL)a3;
- (void)setSiriButtonEdgeLightEnabled:(BOOL)a3;
- (void)setSiriButtonFillLightEnabled:(BOOL)a3;
- (void)setSiriButtonMeshEnabled:(BOOL)a3;
- (void)setSiriButtonMeshEnabledLargeScreen:(BOOL)a3;
- (void)setSiriEdgeChromaticAberrationEnabled:(BOOL)a3;
- (void)setSiriEdgeEdgeLightEnabled:(BOOL)a3;
- (void)setSiriEdgeFillLightEnabled:(BOOL)a3;
- (void)setSiriEdgeMeshEnabled:(BOOL)a3;
- (void)setSiriEdgeMeshEnabledLargeScreen:(BOOL)a3;
- (void)setTotalDuration:(double)a3;
- (void)setUseSiriMeshForCapture:(BOOL)a3;
- (void)setVisionIntelligenceHintAnimationSettings:(id)a3;
- (void)setVisionIntelligenceHintFillLightInitialIntensity:(double)a3;
- (void)setVisionIntelligenceHintInterpolationProgress:(double)a3;
- (void)setVisionIntelligenceHintRetargetImpulse:(double)a3;
- (void)setVisualizeEffectMasks:(BOOL)a3;
- (void)updateValuesForUserInterfaceIdiom:(int64_t)a3;
@end

@implementation SUIAShockwavePrototypeSettings

- (double)maximumHintDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setMaximumHintDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)totalDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTotalDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)visualizeEffectMasks
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks;
  swift_beginAccess();
  return *v2;
}

- (void)setVisualizeEffectMasks:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)donutMaskInitialEdgeOutsetProportion
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion);
  swift_beginAccess();
  return *v2;
}

- (void)setDonutMaskInitialEdgeOutsetProportion:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)finalFitVsDiameterRatioShortEdgeSmallScreen
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioShortEdgeSmallScreen:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)finalFitVsDiameterRatioLongEdgeSmallScreen
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioLongEdgeSmallScreen:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)finalFitVsDiameterRatioShortEdgeBigScreen
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioShortEdgeBigScreen:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)finalFitVsDiameterRatioLongEdgeBigScreen
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioLongEdgeBigScreen:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)edgeLightHintTransitionDelay
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeLightHintTransitionDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)donutMaskEndTransitionDelay
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setDonutMaskEndTransitionDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay);
  swift_beginAccess();
  double *v4 = a3;
}

- (SUIAFluidBehaviorSettings)donutMaskPositionAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setDonutMaskPositionAnimationSettings:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationInitialDonutMask
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationInitialDonutMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskSmallScreen
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationFinalDonutMaskSmallScreen:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskLargeScreen
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationFinalDonutMaskLargeScreen:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)colorFillInitialCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillInitialCircleMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)colorFillHintCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillHintCircleMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)colorFillFinalCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillFinalCircleMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)edgeLightInitialCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightInitialCircleMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)edgeLightHintCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightHintCircleMask:(id)a3
{
}

- (SUIAShockwaveRadialMaskSettings)edgeLightFinalCircleMask
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightFinalCircleMask:(id)a3
{
}

- (double)aberrationMagnitudeX
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationMagnitudeX:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)aberrationMagnitudeY
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationMagnitudeY:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)aberrationBlurRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationBlurRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)aberrationUseColorSaturate
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorSaturate:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)aberrationColorSaturateAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorSaturateAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)aberrationUseEDR
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseEDR:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)aberrationEDRGain
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationEDRGain:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)aberrationUseColorBrightness
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorBrightness:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)aberrationColorBrightness
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorBrightness:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)aberrationUseColorMatrixMultiply
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorMatrixMultiply:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)aberrationColorMatrixMultiplyFactor
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorMatrixMultiplyFactor:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)aberrationFadeOutDelay
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationFadeOutDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)aberrationFadeOutDelayIPad
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationFadeOutDelayIPad:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad);
  swift_beginAccess();
  double *v4 = a3;
}

- (SUIAFluidBehaviorSettings)abberationFadeOutAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setAbberationFadeOutAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)abberationCancelledFadeOutAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setAbberationCancelledFadeOutAnimationSettings:(id)a3
{
}

- (double)meshSquareFinalSizeDiagonalRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshSquareFinalSizeDiagonalRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshRectangularFinalShortDimensionRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshRectangularFinalShortDimensionRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshRectangularFinalLongDimensionRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshRectangularFinalLongDimensionRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshFinalProportionAcrossScreenLongEdge
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionAcrossScreenLongEdge:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshFinalProportionAcrossScreenShortEdge
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionAcrossScreenShortEdge:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshFinalProportionTowardsCenterOnLargeDisplays
{
  v2 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionTowardsCenterOnLargeDisplays:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)meshPointsEndTransitionDelay
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshPointsEndTransitionDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)useSiriMeshForCapture
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture;
  swift_beginAccess();
  return *v2;
}

- (void)setUseSiriMeshForCapture:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (SUIAFluidBehaviorSettings)meshPointsAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPointsAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)meshPositionAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPositionAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)meshPointsCancelledAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPointsCancelledAnimationSettings:(id)a3
{
}

- (double)fillLightInitialIntensity
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightInitialIntensity:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)fillLightCaptureInitialIntensity
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightCaptureInitialIntensity:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)captureFillWhiteValue
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureFillWhiteValue:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)fillLightFinalIntensity
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightFinalIntensity:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity);
  swift_beginAccess();
  double *v4 = a3;
}

- (SUIAFluidBehaviorSettings)lightIntensityAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setLightIntensityAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)lightIntensityCancelledAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setLightIntensityCancelledAnimationSettings:(id)a3
{
}

- (double)fillLightIntensityFinalStateDelay
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightIntensityFinalStateDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)fillLightColorSaturateAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorSaturateAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)fillLightColorBrightnessAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorBrightnessAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)fillLightColorContrastAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorContrastAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (SUIAFluidBehaviorSettings)captureHintAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setCaptureHintAnimationSettings:(id)a3
{
}

- (double)captureHintRetargetImpulse
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintRetargetImpulse:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)captureHintInterpolationProgress
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintInterpolationProgress:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)captureHintMeshOffset
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintMeshOffset:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)visionIntelligenceHintRetargetImpulse
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setVisionIntelligenceHintRetargetImpulse:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintRetargetImpulse);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)visionIntelligenceHintInterpolationProgress
{
  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintInterpolationProgress);
  swift_beginAccess();
  return *v2;
}

- (void)setVisionIntelligenceHintInterpolationProgress:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintInterpolationProgress);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)visionIntelligenceHintFillLightInitialIntensity
{
  v2 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintFillLightInitialIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setVisionIntelligenceHintFillLightInitialIntensity:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintFillLightInitialIntensity);
  swift_beginAccess();
  double *v4 = a3;
}

- (SUIAFluidBehaviorSettings)visionIntelligenceHintAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setVisionIntelligenceHintAnimationSettings:(id)a3
{
}

- (BOOL)captureChromaticAberrationEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureChromaticAberrationEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)captureMeshEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureMeshEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)captureFillLightType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureFillLightType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)siriButtonChromaticAberrationEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonChromaticAberrationEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriButtonMeshEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonMeshEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriButtonMeshEnabledLargeScreen
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonMeshEnabledLargeScreen:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriButtonFillLightEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonFillLightEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriButtonEdgeLightEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonEdgeLightEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriEdgeChromaticAberrationEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeChromaticAberrationEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriEdgeMeshEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeMeshEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriEdgeMeshEnabledLargeScreen
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeMeshEnabledLargeScreen:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriEdgeFillLightEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeFillLightEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)siriEdgeEdgeLightEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeEdgeLightEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)setDefaultValues
{
  v2 = self;
  SUIAShockwavePrototypeSettings.setDefaultValues()();
}

- (void)updateValuesForUserInterfaceIdiom:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_currentUserInterfaceIdiom) = (Class)a3;
  [(SUIAShockwavePrototypeSettings *)self setDefaultValues];
}

- (BOOL)shouldBehaveLikeLargeScreen:(CGSize)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_currentUserInterfaceIdiom);
  if (v3 == 3) {
    return 0;
  }
  if (v3 == 1) {
    return 1;
  }
  if (a3.height < a3.width) {
    a3.width = a3.height;
  }
  return a3.width > 500.0;
}

- (double)finalFitVsDiameterRatioShortEdgeForShockwaveSize:(CGSize)a3
{
  return sub_25E723688(self, a3.width, a3.height, (uint64_t)a2, (SEL *)&selRef_finalFitVsDiameterRatioShortEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioShortEdgeSmallScreen);
}

- (double)finalFitVsDiameterRatioLongEdgeForShockwaveSize:(CGSize)a3
{
  return sub_25E723688(self, a3.width, a3.height, (uint64_t)a2, (SEL *)&selRef_finalFitVsDiameterRatioLongEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioLongEdgeSmallScreen);
}

- (id)chromaticAberrationFinalDonutMaskForShockwaveSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  unsigned int v6 = -[SUIAShockwavePrototypeSettings shouldBehaveLikeLargeScreen:](v5, sel_shouldBehaveLikeLargeScreen_, width, height);
  v7 = &selRef_chromaticAberrationFinalDonutMaskLargeScreen;
  if (!v6) {
    v7 = &selRef_chromaticAberrationFinalDonutMaskSmallScreen;
  }
  id v8 = [v5 *v7];

  return v8;
}

+ (id)settingsControllerModule
{
  _sSo30SUIAShockwavePrototypeSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_visionIntelligenceHintAnimationSettings);
}

@end