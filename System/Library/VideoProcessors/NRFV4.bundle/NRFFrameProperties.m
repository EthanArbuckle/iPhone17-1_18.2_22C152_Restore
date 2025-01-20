@interface NRFFrameProperties
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)regHomography;
- (BOOL)blurryFrameWeightCalculationComplete;
- (BOOL)contentExtended;
- (BOOL)denseRegistered;
- (BOOL)greenGhostProcesssingDone;
- (BOOL)hasValidRegistration;
- (BOOL)hybridRegistrationDone;
- (BOOL)isMissingMetadata;
- (BOOL)motionScoreCalculationComplete;
- (BOOL)referenceFrameSelectionMetricsComputed;
- (BOOL)registrationComplete;
- (ColorSpaceConversionParameters)colorSpaceConversionParameters;
- (NRFFrameMetadata)meta;
- (NRFFrameProperties)init;
- (double)extendedDimensions;
- (double)focusScore;
- (float)blinkDetectionScore;
- (float)blurryFrameWeight;
- (float)cornerStrength;
- (float)gyroScore;
- (float)motionScore;
- (int)inputColorSpace;
- (int)toneCurve;
- (void)dealloc;
- (void)setBlinkDetectionScore:(float)a3;
- (void)setBlurryFrameWeight:(float)a3;
- (void)setBlurryFrameWeightCalculationComplete:(BOOL)a3;
- (void)setContentExtended:(BOOL)a3;
- (void)setCornerStrength:(float)a3;
- (void)setDenseRegistered:(BOOL)a3;
- (void)setExtendedDimensions:(NRFFrameProperties *)self;
- (void)setFocusScore:(double)a3;
- (void)setGreenGhostProcesssingDone:(BOOL)a3;
- (void)setGyroScore:(float)a3;
- (void)setHasValidRegistration:(BOOL)a3;
- (void)setHybridRegistrationDone:(BOOL)a3;
- (void)setInputColorSpace:(int)a3;
- (void)setIsMissingMetadata:(BOOL)a3;
- (void)setMeta:(id)a3;
- (void)setMotionScore:(float)a3;
- (void)setMotionScoreCalculationComplete:(BOOL)a3;
- (void)setReferenceFrameSelectionMetricsComputed:(BOOL)a3;
- (void)setRegistrationComplete:(BOOL)a3;
- (void)setToneCurve:(int)a3;
@end

@implementation NRFFrameProperties

- (NRFFrameProperties)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)NRFFrameProperties;
  v2 = [(NRFFrameProperties *)&v12 init];
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = objc_opt_new();
  meta = v2->_meta;
  v2->_meta = (NRFFrameMetadata *)v3;

  v5 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
  v2->_regHomography = v5;
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = MEMORY[0x263EF89A0];
  long long v7 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)v5 = *MEMORY[0x263EF89A0];
  *((_OWORD *)v5 + 1) = v7;
  *((_OWORD *)v5 + 2) = *(_OWORD *)(v6 + 32);
  v8 = (ColorSpaceConversionParameters *)malloc_type_calloc(1uLL, 0xD0uLL, 0x10000405399FAC0uLL);
  v2->_colorSpaceConversionParameters = v8;
  if (v8)
  {
LABEL_4:
    v9 = v2;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  free(self->_regHomography);
  free(self->_colorSpaceConversionParameters);
  v3.receiver = self;
  v3.super_class = (Class)NRFFrameProperties;
  [(NRFFrameProperties *)&v3 dealloc];
}

- (NRFFrameMetadata)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (BOOL)contentExtended
{
  return self->_contentExtended;
}

- (void)setContentExtended:(BOOL)a3
{
  self->_contentExtended = a3;
}

- (double)extendedDimensions
{
  return *(double *)(a1 + 56);
}

- (void)setExtendedDimensions:(NRFFrameProperties *)self
{
  *(void *)self->_extendedDimensions = v2;
}

- (BOOL)registrationComplete
{
  return self->_registrationComplete;
}

- (void)setRegistrationComplete:(BOOL)a3
{
  self->_registrationComplete = a3;
}

- (BOOL)hasValidRegistration
{
  return self->_hasValidRegistration;
}

- (void)setHasValidRegistration:(BOOL)a3
{
  self->_hasValidRegistration = a3;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)regHomography
{
  return self->_regHomography;
}

- (int)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputColorSpace:(int)a3
{
  self->_inputColorSpace = a3;
}

- (ColorSpaceConversionParameters)colorSpaceConversionParameters
{
  return self->_colorSpaceConversionParameters;
}

- (int)toneCurve
{
  return self->_toneCurve;
}

- (void)setToneCurve:(int)a3
{
  self->_toneCurve = a3;
}

- (BOOL)motionScoreCalculationComplete
{
  return self->_motionScoreCalculationComplete;
}

- (void)setMotionScoreCalculationComplete:(BOOL)a3
{
  self->_motionScoreCalculationComplete = a3;
}

- (float)motionScore
{
  return self->_motionScore;
}

- (void)setMotionScore:(float)a3
{
  self->_motionScore = a3;
}

- (double)focusScore
{
  return self->_focusScore;
}

- (void)setFocusScore:(double)a3
{
  self->_focusScore = a3;
}

- (float)gyroScore
{
  return self->_gyroScore;
}

- (void)setGyroScore:(float)a3
{
  self->_gyroScore = a3;
}

- (BOOL)isMissingMetadata
{
  return self->_isMissingMetadata;
}

- (void)setIsMissingMetadata:(BOOL)a3
{
  self->_isMissingMetadata = a3;
}

- (float)cornerStrength
{
  return self->_cornerStrength;
}

- (void)setCornerStrength:(float)a3
{
  self->_cornerStrength = a3;
}

- (BOOL)referenceFrameSelectionMetricsComputed
{
  return self->_referenceFrameSelectionMetricsComputed;
}

- (void)setReferenceFrameSelectionMetricsComputed:(BOOL)a3
{
  self->_referenceFrameSelectionMetricsComputed = a3;
}

- (float)blurryFrameWeight
{
  return self->_blurryFrameWeight;
}

- (void)setBlurryFrameWeight:(float)a3
{
  self->_blurryFrameWeight = a3;
}

- (BOOL)blurryFrameWeightCalculationComplete
{
  return self->_blurryFrameWeightCalculationComplete;
}

- (void)setBlurryFrameWeightCalculationComplete:(BOOL)a3
{
  self->_blurryFrameWeightCalculationComplete = a3;
}

- (float)blinkDetectionScore
{
  return self->_blinkDetectionScore;
}

- (void)setBlinkDetectionScore:(float)a3
{
  self->_blinkDetectionScore = a3;
}

- (BOOL)denseRegistered
{
  return self->_denseRegistered;
}

- (void)setDenseRegistered:(BOOL)a3
{
  self->_denseRegistered = a3;
}

- (BOOL)hybridRegistrationDone
{
  return self->_hybridRegistrationDone;
}

- (void)setHybridRegistrationDone:(BOOL)a3
{
  self->_hybridRegistrationDone = a3;
}

- (BOOL)greenGhostProcesssingDone
{
  return self->_greenGhostProcesssingDone;
}

- (void)setGreenGhostProcesssingDone:(BOOL)a3
{
  self->_greenGhostProcesssingDone = a3;
}

- (void).cxx_destruct
{
}

@end