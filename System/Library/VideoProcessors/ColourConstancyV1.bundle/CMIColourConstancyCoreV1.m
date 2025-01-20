@interface CMIColourConstancyCoreV1
- (CMIColourConstancyCoreV1)initWithMetalContext:(id)a3;
- (id)applyWithAmbientLumaTexture:(double)a3 ambientChromaTexture:(float)a4 flashLumaTexture:(float)a5 flashChromaTexture:(double)a6 ambientYUVOffsets:(double)a7 flashYUVOffsets:(double)a8 ambientLSCGainsTexture:(float)a9 flashLSCGainsTexture:(uint64_t)a10 ambientLSCMaxGain:(void *)a11 flashLSCMaxGain:(void *)a12 ambientWhitePoint:(void *)a13 flashWhitePoint:(void *)a14 strobeWhitePoint:(void *)a15 ambientIntegrationTime:(void *)a16 flashIntegrationTime:(float)a17 cropRect:(uint64_t)a18 LSCCropRect:(CMIColourConstancyLSCCropRect *)a19 fullSizeDimensions:(_DWORD *)a20 strobeCCM:(id)a21 outputColourAccuracyConfidenceTexture:(uint64_t)a22 outputLumaTexture:(double)a23 outputChromaTexture:(uint64_t)a24;
- (int)finishProcessing;
- (int)getCenterWeightedColourAccuracyConfidenceLevel:(float *)a3;
- (int)prepareToProcessWithConfig:(id)a3 processingType:(unsigned int)a4;
- (int)purgeResources;
- (void)setExternalMemoryResource:(id)a3;
@end

@implementation CMIColourConstancyCoreV1

- (void)setExternalMemoryResource:(id)a3
{
}

- (CMIColourConstancyCoreV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CMIColourConstancyCoreV1;
  v6 = [(CMIColourConstancyCoreV1 *)&v26 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  if (!v5) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v8 = (CMIColourConstancyRegistrationV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  registrationComponent = v7->_registrationComponent;
  v7->_registrationComponent = v8;

  if (!v7->_registrationComponent) {
    goto LABEL_13;
  }
  v10 = (CMIColourConstancySensorSpaceConversionV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  sensorSpaceConversionComponent = v7->_sensorSpaceConversionComponent;
  v7->_sensorSpaceConversionComponent = v10;

  if (!v7->_sensorSpaceConversionComponent) {
    goto LABEL_13;
  }
  v12 = (CMIColourConstancyStrobeDecompositionV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  strobeDecompositionComponent = v7->_strobeDecompositionComponent;
  v7->_strobeDecompositionComponent = v12;

  if (!v7->_strobeDecompositionComponent) {
    goto LABEL_13;
  }
  v14 = (CMIColourConstancyStrobeCorrectionV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  strobeCorrectionComponent = v7->_strobeCorrectionComponent;
  v7->_strobeCorrectionComponent = v14;

  if (!v7->_strobeCorrectionComponent) {
    goto LABEL_13;
  }
  v16 = (CMIColourConstancyWhiteBalanceStrobeV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  whiteBalanceStrobeComponent = v7->_whiteBalanceStrobeComponent;
  v7->_whiteBalanceStrobeComponent = v16;

  if (!v7->_whiteBalanceStrobeComponent) {
    goto LABEL_13;
  }
  v18 = (CMIColourConstancyConfidenceV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  colourAccuracyConfidenceComponent = v7->_colourAccuracyConfidenceComponent;
  v7->_colourAccuracyConfidenceComponent = v18;

  if (!v7->_colourAccuracyConfidenceComponent) {
    goto LABEL_13;
  }
  v20 = (CMIColourConstancyToneCompressionV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  toneCompressionComponent = v7->_toneCompressionComponent;
  v7->_toneCompressionComponent = v20;

  if (!v7->_toneCompressionComponent) {
    goto LABEL_13;
  }
  v22 = (CMIColourConstancyStyleTransferV1 *)[(id)objc_opt_new() initWithMetalContext:v7->_metalContext];
  styleTransferComponent = v7->_styleTransferComponent;
  v7->_styleTransferComponent = v22;

  if (v7->_styleTransferComponent)
  {
    v24 = v7;
  }
  else
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
  }

  return v24;
}

- (int)purgeResources
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  [(CMIColourConstancyRegistrationV1 *)self->_registrationComponent purgeResources];
  [(CMIColourConstancySensorSpaceConversionV1 *)self->_sensorSpaceConversionComponent purgeResources];
  [(CMIColourConstancyStrobeDecompositionV1 *)self->_strobeDecompositionComponent purgeResources];
  [(CMIColourConstancyStrobeCorrectionV1 *)self->_strobeCorrectionComponent purgeResources];
  [(CMIColourConstancyWhiteBalanceStrobeV1 *)self->_whiteBalanceStrobeComponent purgeResources];
  [(CMIColourConstancyToneCompressionV1 *)self->_toneCompressionComponent purgeResources];
  [(CMIColourConstancyConfidenceV1 *)self->_colourAccuracyConfidenceComponent purgeResources];
  [(CMIColourConstancyStyleTransferV1 *)self->_styleTransferComponent purgeResources];
  clippingRecoveryComponent = self->_clippingRecoveryComponent;
  if (clippingRecoveryComponent) {
    [(CMIColourConstancyClippingRecoveryV1 *)clippingRecoveryComponent purgeResources];
  }
  return 0;
}

- (int)prepareToProcessWithConfig:(id)a3 processingType:(unsigned int)a4
{
  id v6 = a3;
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v8 = 0;
    int v52 = 8;
    goto LABEL_34;
  }
  objc_storeStrong((id *)&self->_config, a3);
  v7 = [(FigMetalContext *)self->_metalContext allocator];
  id v8 = [v7 newTextureDescriptor];

  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v52 = 7;
    goto LABEL_34;
  }
  v9 = [v8 desc];
  [v9 setTextureType:2];

  uint64_t v10 = [(CMIColourConstancyCoreConfigurationV1 *)self->_config thumbnailWidth];
  v11 = [v8 desc];
  [v11 setWidth:v10];

  uint64_t v12 = [(CMIColourConstancyCoreConfigurationV1 *)self->_config thumbnailHeight];
  v13 = [v8 desc];
  [v13 setHeight:v12];

  v14 = [v8 desc];
  [v14 setPixelFormat:115];

  [v8 setLabel:0];
  v15 = [(FigMetalContext *)self->_metalContext allocator];
  v16 = (MTLTexture *)[v15 newTextureWithDescriptor:v8];
  flashThumbnailRGBTexture = self->_flashThumbnailRGBTexture;
  self->_flashThumbnailRGBTexture = v16;

  if (!self->_flashThumbnailRGBTexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v18 = [(FigMetalContext *)self->_metalContext allocator];
  v19 = (MTLTexture *)[v18 newTextureWithDescriptor:v8];
  ambientSensorRegisteredThumbnailRGBATexture = self->_ambientSensorRegisteredThumbnailRGBATexture;
  self->_ambientSensorRegisteredThumbnailRGBATexture = v19;

  if (!self->_ambientSensorRegisteredThumbnailRGBATexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v21 = [(FigMetalContext *)self->_metalContext allocator];
  v22 = (MTLTexture *)[v21 newTextureWithDescriptor:v8];
  flashSensorThumbnailRGBATexture = self->_flashSensorThumbnailRGBATexture;
  self->_flashSensorThumbnailRGBATexture = v22;

  if (!self->_flashSensorThumbnailRGBATexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v24 = [(FigMetalContext *)self->_metalContext allocator];
  v25 = (MTLTexture *)[v24 newTextureWithDescriptor:v8];
  ambientScaledLSCThumbnailRGBTexture = self->_ambientScaledLSCThumbnailRGBTexture;
  self->_ambientScaledLSCThumbnailRGBTexture = v25;

  if (!self->_ambientScaledLSCThumbnailRGBTexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v27 = [(FigMetalContext *)self->_metalContext allocator];
  v28 = (MTLTexture *)[v27 newTextureWithDescriptor:v8];
  flashScaledLSCThumbnailRGBTexture = self->_flashScaledLSCThumbnailRGBTexture;
  self->_flashScaledLSCThumbnailRGBTexture = v28;

  if (!self->_flashScaledLSCThumbnailRGBTexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v30 = [(FigMetalContext *)self->_metalContext allocator];
  v31 = (MTLTexture *)[v30 newTextureWithDescriptor:v8];
  strobeComponentThumbnailRGBATexture = self->_strobeComponentThumbnailRGBATexture;
  self->_strobeComponentThumbnailRGBATexture = v31;

  if (!self->_strobeComponentThumbnailRGBATexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v33 = [(FigMetalContext *)self->_metalContext allocator];
  v34 = (MTLTexture *)[v33 newTextureWithDescriptor:v8];
  strobeCorrectedThumbnailRGBTexture = self->_strobeCorrectedThumbnailRGBTexture;
  self->_strobeCorrectedThumbnailRGBTexture = v34;

  if (!self->_strobeCorrectedThumbnailRGBTexture) {
    goto LABEL_27;
  }
  v36 = [v8 desc];
  [v36 setPixelFormat:125];

  [v8 setLabel:0];
  v37 = [(FigMetalContext *)self->_metalContext allocator];
  v38 = (MTLTexture *)[v37 newTextureWithDescriptor:v8];
  strobeBalancedThumbnailRGBTexture = self->_strobeBalancedThumbnailRGBTexture;
  self->_strobeBalancedThumbnailRGBTexture = v38;

  if (!self->_strobeBalancedThumbnailRGBTexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v40 = [(FigMetalContext *)self->_metalContext allocator];
  v41 = (MTLTexture *)[v40 newTextureWithDescriptor:v8];
  strobeReconstructedBalancedThumbnailRGBTexture = self->_strobeReconstructedBalancedThumbnailRGBTexture;
  self->_strobeReconstructedBalancedThumbnailRGBTexture = v41;

  if (!self->_strobeReconstructedBalancedThumbnailRGBTexture) {
    goto LABEL_27;
  }
  v43 = [v8 desc];
  [v43 setPixelFormat:25];

  [v8 setLabel:0];
  v44 = [(FigMetalContext *)self->_metalContext allocator];
  v45 = (MTLTexture *)[v44 newTextureWithDescriptor:v8];
  strobeBeamProfileGainRTexture = self->_strobeBeamProfileGainRTexture;
  self->_strobeBeamProfileGainRTexture = v45;

  if (!self->_strobeBeamProfileGainRTexture) {
    goto LABEL_27;
  }
  [v8 setLabel:0];
  v47 = [(FigMetalContext *)self->_metalContext allocator];
  v48 = (MTLTexture *)[v47 newTextureWithDescriptor:v8];
  strobeIlluminationConfidenceRTexture = self->_strobeIlluminationConfidenceRTexture;
  self->_strobeIlluminationConfidenceRTexture = v48;

  if (!self->_strobeIlluminationConfidenceRTexture)
  {
LABEL_27:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v52 = 6;
    goto LABEL_34;
  }
  sensorSpaceConversionComponent = self->_sensorSpaceConversionComponent;
  v51 = [v6 sensorSpaceConversionConfig];
  int v52 = [(CMIColourConstancySensorSpaceConversionV1 *)sensorSpaceConversionComponent prepareToProcessWithConfig:v51];

  if (v52) {
    goto LABEL_30;
  }
  unsigned int v53 = [(CMIColourConstancyRegistrationV1 *)self->_registrationComponent prepareToProcess:0];
  if (v53)
  {
    int v52 = v53;
    fig_log_get_emitter();
LABEL_31:
    FigDebugAssert3();
    goto LABEL_34;
  }
  strobeCorrectionComponent = self->_strobeCorrectionComponent;
  v55 = [v6 strobeCorrectionConfig];
  int v52 = [(CMIColourConstancyStrobeCorrectionV1 *)strobeCorrectionComponent prepareToProcessWithConfig:v55];

  if (v52) {
    goto LABEL_30;
  }
  whiteBalanceStrobeComponent = self->_whiteBalanceStrobeComponent;
  v57 = [v6 whiteBalanceStrobeConfig];
  int v52 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)whiteBalanceStrobeComponent prepareToProcessWithConfig:v57];

  if (v52) {
    goto LABEL_30;
  }
  toneCompressionComponent = self->_toneCompressionComponent;
  v59 = [v6 toneCompressionConfig];
  int v52 = [(CMIColourConstancyToneCompressionV1 *)toneCompressionComponent prepareToProcessWithConfig:v59];

  if (v52) {
    goto LABEL_30;
  }
  colourAccuracyConfidenceComponent = self->_colourAccuracyConfidenceComponent;
  v61 = [v6 colourAccuracyConfidenceConfig];
  int v52 = [(CMIColourConstancyConfidenceV1 *)colourAccuracyConfidenceComponent prepareToProcessWithConfig:v61];

  if (v52
    || (styleTransferComponent = self->_styleTransferComponent,
        [v6 styleTransferConfig],
        v63 = objc_claimAutoreleasedReturnValue(),
        int v52 = [(CMIColourConstancyStyleTransferV1 *)styleTransferComponent prepareToProcessWithConfig:v63], v63, v52))
  {
LABEL_30:
    fig_log_get_emitter();
    goto LABEL_31;
  }
  if (![(CMIColourConstancyCoreConfigurationV1 *)self->_config clippingRecoveryEnabled])
  {
LABEL_33:
    int v52 = 0;
    goto LABEL_34;
  }
  v64 = (CMIColourConstancyClippingRecoveryV1 *)[(id)objc_opt_new() initWithMetalContext:self->_metalContext];
  clippingRecoveryComponent = self->_clippingRecoveryComponent;
  self->_clippingRecoveryComponent = v64;

  v66 = self->_clippingRecoveryComponent;
  if (!v66)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_33;
  }
  v67 = [v6 clippingRecoveryConfig];
  int v52 = [(CMIColourConstancyClippingRecoveryV1 *)v66 prepareToProcessWithConfig:v67];

  if (v52) {
    goto LABEL_30;
  }
LABEL_34:

  return v52;
}

- (int)finishProcessing
{
  [(FigMetalContext *)self->_metalContext waitForIdle];
  int v3 = [(CMIColourConstancyStyleTransferV1 *)self->_styleTransferComponent finishProcessing];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (id)applyWithAmbientLumaTexture:(double)a3 ambientChromaTexture:(float)a4 flashLumaTexture:(float)a5 flashChromaTexture:(double)a6 ambientYUVOffsets:(double)a7 flashYUVOffsets:(double)a8 ambientLSCGainsTexture:(float)a9 flashLSCGainsTexture:(uint64_t)a10 ambientLSCMaxGain:(void *)a11 flashLSCMaxGain:(void *)a12 ambientWhitePoint:(void *)a13 flashWhitePoint:(void *)a14 strobeWhitePoint:(void *)a15 ambientIntegrationTime:(void *)a16 flashIntegrationTime:(float)a17 cropRect:(uint64_t)a18 LSCCropRect:(CMIColourConstancyLSCCropRect *)a19 fullSizeDimensions:(_DWORD *)a20 strobeCCM:(id)a21 outputColourAccuracyConfidenceTexture:(uint64_t)a22 outputLumaTexture:(double)a23 outputChromaTexture:(uint64_t)a24
{
  id v40 = a11;
  id v76 = a12;
  id v41 = a13;
  id v77 = a14;
  id v75 = a15;
  id v74 = a16;
  id v68 = a29;
  id v73 = a30;
  id v72 = a31;
  uint64_t v42 = [*(id *)(a1 + 8) commandBuffer];
  if (!v42)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v62 = (id)FigSignalErrorAt();
    v46 = v41;
LABEL_30:
    v64 = v68;
    goto LABEL_17;
  }
  v43 = (void *)v42;
  id v44 = [*(id *)(a1 + 24) registerImage:v40 referenceLumaTexture:v41];
  v46 = v41;
  if (v44
    || (v47 = *(void **)(a1 + 32)) != 0
    && ([*(id *)(a1 + 24) homography],
        id v44 = objc_msgSend(v47, "applyClippedRegionRecovery:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:", v43, v40, v76, v41, v77), v44))
  {
    id v62 = v44;
    fig_log_get_emitter();
    goto LABEL_29;
  }
  v48 = *(void **)(a1 + 40);
  uint64_t v50 = *(void *)(a1 + 128);
  uint64_t v49 = *(void *)(a1 + 136);
  uint64_t v51 = *(void *)(a1 + 120);
  long long v78 = *(_OWORD *)a20;
  int v79 = a20[4];
  *(float *)&double v45 = a5;
  id v52 = objc_msgSend(v48, "calculateScaledLSCGainsAndStrobeBeamProfile:ambientLSCGainsTexture:flashLSCGainsTexture:cropRect:LSCCropRect:fullSizeDimensions:ambientLSCMaxGain:flashLSCMaxGain:outputAmbientScaledLSCGainsRGBTexture:outputFlashScaledLSCGainsRGBTexture:outputStrobeBeamProfileGainRTexture:", v43, v75, v74, a18, a19, &v78, *(double *)&a21, COERCE_DOUBLE(__PAIR64__(DWORD1(v78), LODWORD(a4))), v45, v51, v49, v50);
  if (v52) {
    goto LABEL_20;
  }
  unsigned int v53 = *(void **)(a1 + 40);
  uint64_t v54 = *(void *)(a1 + 120);
  [*(id *)(a1 + 24) homography];
  id v52 = objc_msgSend(v53, "convertYUVtoRegisteredNormSensorSpaceThumbnail:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:baseScaledLSCGainsRGBTexture:yuvOffsets:cropRect:registrationHomography:appliedWhitePoint:integrationTimeScale:outputWarpedSensorThumbnailRGBATexture:", v43, v40, v76, v54, v54, a2, v55, v56, v57, a6, COERCE_DOUBLE(__PAIR64__(HIDWORD(v57), a17 / fmaxf(a9, 0.00000011921))), a18, a19, *(void *)(a1 + 104));
  if (v52
    || (LODWORD(v58) = 1.0,
        id v52 = objc_msgSend(*(id *)(a1 + 40), "convertYUVtoNormSensorSpaceThumbnail:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:baseScaledLSCGainsRGBTexture:yuvOffsets:cropRect:appliedWhitePoint:integrationTimeScale:outputBalancedThumbnailRGBATexture:outputSensorThumbnailRGBATexture:", v43, v41, v77, *(void *)(a1 + 136), *(void *)(a1 + 120), a3, a7, v58, a18, a19, *(void *)(a1 + 96), *(void *)(a1 + 112)), v52)|| (id v52 = objc_msgSend(*(id *)(a1 + 48),
                "encodeStrobeComponentCalculate:flashSensorRGBATexture:ambientSensorRGBATexture:strobeWhitePoint:outputSt"
                "robeComponentRGBATexture:",
                v43,
                *(void *)(a1 + 112),
                *(void *)(a1 + 104),
                *(void *)(a1 + 144),
                a8),
        v52)
    || (id v52 = [*(id *)(a1 + 56) applyStrobeCorrection:v43 strobeComponentRGBTexture:*(void *)(a1 + 144) strobeBeamProfileGainRTexture:*(void *)(a1 + 128) outputStrobeCorrectedRGBTexture:*(void *)(a1 + 152)], v52)|| (id v52 = objc_msgSend(*(id *)(a1 + 80), "calculateStrobeIlluminationConfidence:strobeComponentRGBTexture:outputStrobeIlluminationConfidenceRTexture:", v43, *(void *)(a1 + 144), *(void *)(a1 + 168)), v52)|| (id v52 = objc_msgSend(*(id *)(a1 + 64), "applyWhiteBalanceAndFlashFusion:strobeSensorRGBTexture:flashBalancedRGBTexture:strobeIlluminationConfidenceRTexture:strobeWhitePoint:outputStrobeBalancedRGBTexture:", v43,
                *(void *)(a1 + 152),
                *(void *)(a1 + 96),
                *(void *)(a1 + 168),
                *(void *)(a1 + 160),
                a8),
        v52)
    || (id v52 = objc_msgSend(*(id *)(a1 + 72), "calculateToneCompressionCurve:strobeComponentRGBTexture:strobeCCM:", v43, *(void *)(a1 + 160)), v52))
  {
LABEL_20:
    id v62 = v52;
    fig_log_get_emitter();
LABEL_29:
    FigDebugAssert3();

    goto LABEL_30;
  }
  v59 = *(void **)(a1 + 88);
  v60 = [*(id *)(a1 + 72) toneCompressionCurveTexture];
  id v61 = v41;
  id v62 = objc_msgSend(v59, "applyStyleTransferWithBufferClearing:inputChromaTexture:appliedScaledLSCGainsRGBTexture:sourceRGBTexture:targetRGBTexture:toneCompressionCurveTexture:inputYUVOffsets:cropRect:appliedWhitePoint:strobeCCM:outputReconstructedTargetRGBTexture:outputLumaTexture:outputChromaTexture:", a3, a7, a23, a25, a27, a18, a19, *(void *)(a1 + 176), v73, v72);

  if (v62)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    v46 = v41;
    goto LABEL_30;
  }
  v63 = [*(id *)(a1 + 8) commandBuffer];

  v64 = v68;
  id v62 = [*(id *)(a1 + 80) calculateColourAccuracyConfidence:v63 strobeComponentRGBATexture:*(void *)(a1 + 144) strobeBalancedThumbnailRGBTexture:*(void *)(a1 + 160) strobeReconstructedBalancedThumbnailRGBTexture:*(void *)(a1 + 176) outputColourAccuracyConfidenceTexture:v68];
  if (v62)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    [*(id *)(a1 + 8) commit];
  }

  v46 = v61;
LABEL_17:

  return v62;
}

- (int)getCenterWeightedColourAccuracyConfidenceLevel:(float *)a3
{
  if (a3)
  {
    id v4 = [(CMIColourConstancyConfidenceV1 *)self->_colourAccuracyConfidenceComponent globalCenterWeightedConfidenceLevelBuffer];
    id v5 = (float *)[v4 contents];

    int result = 0;
    *a3 = *v5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 10;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strobeReconstructedBalancedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeIlluminationConfidenceRTexture, 0);
  objc_storeStrong((id *)&self->_strobeBalancedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeCorrectedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeComponentThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_flashScaledLSCThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeBeamProfileGainRTexture, 0);
  objc_storeStrong((id *)&self->_ambientScaledLSCThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_flashSensorThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_ambientSensorRegisteredThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_flashThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_styleTransferComponent, 0);
  objc_storeStrong((id *)&self->_colourAccuracyConfidenceComponent, 0);
  objc_storeStrong((id *)&self->_toneCompressionComponent, 0);
  objc_storeStrong((id *)&self->_whiteBalanceStrobeComponent, 0);
  objc_storeStrong((id *)&self->_strobeCorrectionComponent, 0);
  objc_storeStrong((id *)&self->_strobeDecompositionComponent, 0);
  objc_storeStrong((id *)&self->_sensorSpaceConversionComponent, 0);
  objc_storeStrong((id *)&self->_clippingRecoveryComponent, 0);
  objc_storeStrong((id *)&self->_registrationComponent, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end