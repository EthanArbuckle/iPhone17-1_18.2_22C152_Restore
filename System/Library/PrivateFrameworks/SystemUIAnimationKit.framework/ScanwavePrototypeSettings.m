@interface ScanwavePrototypeSettings
+ (id)settingsControllerModule;
- (SUIAFluidBehaviorSettings)circleMaskIntensityAnimationSettings;
- (SUIAFluidBehaviorSettings)circleMaskPositionAnimationSettings;
- (SUIAFluidBehaviorSettings)circleMaskScaleAnimationSettings;
- (SUIAFluidBehaviorSettings)depthDistanceFieldOffsetAnimationSettings;
- (SUIAFluidBehaviorSettings)inverseBlurRadiusIntroAnimationSettings;
- (SUIAFluidBehaviorSettings)inverseBlurRadiusOutroAnimationSettings;
- (SUIAFluidBehaviorSettings)meshTransformMeshIntroAnimationSettings;
- (SUIAFluidBehaviorSettings)meshTransformMeshOutroAnimationSettings;
- (SUIAFluidBehaviorSettings)meshTransformPositionAnimationSettings;
- (SUIAFluidBehaviorSettings)sourceImageColorBrightnessIntroAnimationSettings;
- (SUIAFluidBehaviorSettings)sourceImageColorBrightnessOutroAnimationSettings;
- (SUIAFluidBehaviorSettings)sourceImageScaleIntroAnimationSettings;
- (SUIAFluidBehaviorSettings)sourceImageScaleOutroAnimationSettings;
- (SUIAShockwaveRadialMaskSettings)circleMaskFinalRadialMask;
- (SUIAShockwaveRadialMaskSettings)circleMaskInitialRadialMask;
- (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings)initWithDefaultValues;
- (double)chromaticAberrationColorSaturateAmount;
- (double)chromaticAberrationMagnitudeX;
- (double)chromaticAberrationMagnitudeY;
- (double)circleMaskFinalIntensity;
- (double)circleMaskInitialIntensity;
- (double)circleMaskPositionYNormalizedDistance;
- (double)circleMaskScaleFactor;
- (double)completionTimeout;
- (double)depthDistanceFieldFinalOffset;
- (double)depthDistanceFieldInitialOffset;
- (double)depthDistanceFieldLineWidth;
- (double)depthDistanceFieldSharpness;
- (double)depthImageColorBrightnessAmount;
- (double)depthImageColorContrastAmount;
- (double)fillLightColorBrightnessAmount;
- (double)fillLightColorSaturateAmount;
- (double)inverseBlurOutroDelay;
- (double)inverseBlurRadius;
- (double)outroDelay;
- (double)sourceImageColorBrightnessAmount;
- (double)sourceImageScaleFactor;
- (void)setChromaticAberrationColorSaturateAmount:(double)a3;
- (void)setChromaticAberrationMagnitudeX:(double)a3;
- (void)setChromaticAberrationMagnitudeY:(double)a3;
- (void)setCircleMaskFinalIntensity:(double)a3;
- (void)setCircleMaskFinalRadialMask:(id)a3;
- (void)setCircleMaskInitialIntensity:(double)a3;
- (void)setCircleMaskInitialRadialMask:(id)a3;
- (void)setCircleMaskIntensityAnimationSettings:(id)a3;
- (void)setCircleMaskPositionAnimationSettings:(id)a3;
- (void)setCircleMaskPositionYNormalizedDistance:(double)a3;
- (void)setCircleMaskScaleAnimationSettings:(id)a3;
- (void)setCircleMaskScaleFactor:(double)a3;
- (void)setCompletionTimeout:(double)a3;
- (void)setDefaultValues;
- (void)setDepthDistanceFieldFinalOffset:(double)a3;
- (void)setDepthDistanceFieldInitialOffset:(double)a3;
- (void)setDepthDistanceFieldLineWidth:(double)a3;
- (void)setDepthDistanceFieldOffsetAnimationSettings:(id)a3;
- (void)setDepthDistanceFieldSharpness:(double)a3;
- (void)setDepthImageColorBrightnessAmount:(double)a3;
- (void)setDepthImageColorContrastAmount:(double)a3;
- (void)setFillLightColorBrightnessAmount:(double)a3;
- (void)setFillLightColorSaturateAmount:(double)a3;
- (void)setInverseBlurOutroDelay:(double)a3;
- (void)setInverseBlurRadius:(double)a3;
- (void)setInverseBlurRadiusIntroAnimationSettings:(id)a3;
- (void)setInverseBlurRadiusOutroAnimationSettings:(id)a3;
- (void)setMeshTransformMeshIntroAnimationSettings:(id)a3;
- (void)setMeshTransformMeshOutroAnimationSettings:(id)a3;
- (void)setMeshTransformPositionAnimationSettings:(id)a3;
- (void)setOutroDelay:(double)a3;
- (void)setSourceImageColorBrightnessAmount:(double)a3;
- (void)setSourceImageColorBrightnessIntroAnimationSettings:(id)a3;
- (void)setSourceImageColorBrightnessOutroAnimationSettings:(id)a3;
- (void)setSourceImageScaleFactor:(double)a3;
- (void)setSourceImageScaleIntroAnimationSettings:(id)a3;
- (void)setSourceImageScaleOutroAnimationSettings:(id)a3;
@end

@implementation ScanwavePrototypeSettings

- (double)outroDelay
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_outroDelay);
}

- (void)setOutroDelay:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_outroDelay) = a3;
}

- (double)completionTimeout
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_completionTimeout);
}

- (void)setCompletionTimeout:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_completionTimeout) = a3;
}

- (SUIAShockwaveRadialMaskSettings)circleMaskInitialRadialMask
{
  return (SUIAShockwaveRadialMaskSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialRadialMask));
}

- (void)setCircleMaskInitialRadialMask:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialRadialMask);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialRadialMask) = (Class)a3;
  id v3 = a3;
}

- (SUIAShockwaveRadialMaskSettings)circleMaskFinalRadialMask
{
  return (SUIAShockwaveRadialMaskSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalRadialMask));
}

- (void)setCircleMaskFinalRadialMask:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalRadialMask);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalRadialMask) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)circleMaskPositionAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionAnimationSettings));
}

- (void)setCircleMaskPositionAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)circleMaskPositionYNormalizedDistance
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionYNormalizedDistance);
}

- (void)setCircleMaskPositionYNormalizedDistance:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionYNormalizedDistance) = a3;
}

- (SUIAFluidBehaviorSettings)circleMaskScaleAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleAnimationSettings));
}

- (void)setCircleMaskScaleAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)circleMaskScaleFactor
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleFactor);
}

- (void)setCircleMaskScaleFactor:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleFactor) = a3;
}

- (double)circleMaskInitialIntensity
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialIntensity);
}

- (void)setCircleMaskInitialIntensity:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialIntensity) = a3;
}

- (double)circleMaskFinalIntensity
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalIntensity);
}

- (void)setCircleMaskFinalIntensity:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalIntensity) = a3;
}

- (SUIAFluidBehaviorSettings)circleMaskIntensityAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskIntensityAnimationSettings));
}

- (void)setCircleMaskIntensityAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskIntensityAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskIntensityAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)sourceImageScaleIntroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleIntroAnimationSettings));
}

- (void)setSourceImageScaleIntroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleIntroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleIntroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)sourceImageScaleOutroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleOutroAnimationSettings));
}

- (void)setSourceImageScaleOutroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleOutroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleOutroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)sourceImageScaleFactor
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleFactor);
}

- (void)setSourceImageScaleFactor:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleFactor) = a3;
}

- (SUIAFluidBehaviorSettings)sourceImageColorBrightnessIntroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessIntroAnimationSettings));
}

- (void)setSourceImageColorBrightnessIntroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessIntroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessIntroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)sourceImageColorBrightnessOutroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessOutroAnimationSettings));
}

- (void)setSourceImageColorBrightnessOutroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessOutroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessOutroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)sourceImageColorBrightnessAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessAmount);
}

- (void)setSourceImageColorBrightnessAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessAmount) = a3;
}

- (double)depthImageColorBrightnessAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthImageColorBrightnessAmount);
}

- (void)setDepthImageColorBrightnessAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthImageColorBrightnessAmount) = a3;
}

- (double)depthImageColorContrastAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthImageColorContrastAmount);
}

- (void)setDepthImageColorContrastAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthImageColorContrastAmount) = a3;
}

- (double)depthDistanceFieldInitialOffset
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldInitialOffset);
}

- (void)setDepthDistanceFieldInitialOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldInitialOffset) = a3;
}

- (double)depthDistanceFieldFinalOffset
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldFinalOffset);
}

- (void)setDepthDistanceFieldFinalOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldFinalOffset) = a3;
}

- (SUIAFluidBehaviorSettings)depthDistanceFieldOffsetAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldOffsetAnimationSettings));
}

- (void)setDepthDistanceFieldOffsetAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldOffsetAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldOffsetAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)depthDistanceFieldSharpness
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldSharpness);
}

- (void)setDepthDistanceFieldSharpness:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldSharpness) = a3;
}

- (double)depthDistanceFieldLineWidth
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldLineWidth);
}

- (void)setDepthDistanceFieldLineWidth:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldLineWidth) = a3;
}

- (double)fillLightColorSaturateAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_fillLightColorSaturateAmount);
}

- (void)setFillLightColorSaturateAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_fillLightColorSaturateAmount) = a3;
}

- (double)fillLightColorBrightnessAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_fillLightColorBrightnessAmount);
}

- (void)setFillLightColorBrightnessAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_fillLightColorBrightnessAmount) = a3;
}

- (double)inverseBlurRadius
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadius);
}

- (void)setInverseBlurRadius:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadius) = a3;
}

- (SUIAFluidBehaviorSettings)inverseBlurRadiusIntroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusIntroAnimationSettings));
}

- (void)setInverseBlurRadiusIntroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusIntroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusIntroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)inverseBlurRadiusOutroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusOutroAnimationSettings));
}

- (void)setInverseBlurRadiusOutroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusOutroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusOutroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (double)inverseBlurOutroDelay
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurOutroDelay);
}

- (void)setInverseBlurOutroDelay:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurOutroDelay) = a3;
}

- (double)chromaticAberrationMagnitudeX
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationMagnitudeX);
}

- (void)setChromaticAberrationMagnitudeX:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationMagnitudeX) = a3;
}

- (double)chromaticAberrationMagnitudeY
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationMagnitudeY);
}

- (void)setChromaticAberrationMagnitudeY:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationMagnitudeY) = a3;
}

- (double)chromaticAberrationColorSaturateAmount
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationColorSaturateAmount);
}

- (void)setChromaticAberrationColorSaturateAmount:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_chromaticAberrationColorSaturateAmount) = a3;
}

- (SUIAFluidBehaviorSettings)meshTransformMeshIntroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshIntroAnimationSettings));
}

- (void)setMeshTransformMeshIntroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshIntroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshIntroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)meshTransformMeshOutroAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshOutroAnimationSettings));
}

- (void)setMeshTransformMeshOutroAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshOutroAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshOutroAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (SUIAFluidBehaviorSettings)meshTransformPositionAnimationSettings
{
  return (SUIAFluidBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                              + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformPositionAnimationSettings));
}

- (void)setMeshTransformPositionAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformPositionAnimationSettings);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformPositionAnimationSettings) = (Class)a3;
  id v3 = a3;
}

- (void)setDefaultValues
{
  v2 = self;
  sub_25E72D68C();
}

+ (id)settingsControllerModule
{
  sub_25E72F508();
  return v2;
}

- (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings)initWithDefaultValues
{
  return (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings *)sub_25E72F064();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskInitialRadialMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskFinalRadialMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskPositionAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskScaleAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_circleMaskIntensityAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleIntroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageScaleOutroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessIntroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_sourceImageColorBrightnessOutroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_depthDistanceFieldOffsetAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusIntroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_inverseBlurRadiusOutroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshIntroAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformMeshOutroAnimationSettings));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit25ScanwavePrototypeSettings_meshTransformPositionAnimationSettings);
}

@end