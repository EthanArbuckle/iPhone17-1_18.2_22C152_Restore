@interface CMISoftwareFlashRenderingCoreV2
- (CMISoftwareFlashRenderingCoreV2)initWithMetalContext:(id)a3 externalMemoryResource:(id)a4;
- (MTLTexture)spatialWhitePointsRBTexture;
- (int)applyWithAmbientLumaTexture:(id)a3 ambientChromaTexture:(id)a4 flashLumaTexture:(id)a5 flashChromaTexture:(id)a6 ambientYUVOffsets:(id)a7 flashYUVOffsets:(id)a8 ambientLSCGainsTexture:(float)a9 flashLSCGainsTexture:(float)a10 ambientLSCMaxGain:(id)a11 flashLSCMaxGain:(id)a12 skinMaskTexture:(float)a13 personMaskTexture:(float)a14 ambientWhitePoint:(CMISoftwareFlashRenderingCropRect)a15 flashWhitePoint:(CMISoftwareFlashRenderingLSCCropRect *)a16 strobeWhitePoint:(id)a17 ambientWhitePointTuned:(id)a18 strobeWhitePointTuned:ambientIntegrationTime:flashIntegrationTime:cropRect:LSCCropRect:fullSizeDimensions:outputLumaTexture:outputChromaTexture:;
- (int)finishProcessing;
- (int)prepareToProcessWithConfig:(id)a3 processingType:(unsigned int)a4;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingCoreV2

- (CMISoftwareFlashRenderingCoreV2)initWithMetalContext:(id)a3 externalMemoryResource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CMISoftwareFlashRenderingCoreV2;
  v9 = [(CMISoftwareFlashRenderingCoreV2 *)&v31 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_14;
  }
  if (!v7) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v9->_metalContext, a3);
  uint64_t v11 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  thumbnailerComponent = v10->_thumbnailerComponent;
  v10->_thumbnailerComponent = (CMISoftwareFlashRenderingThumbnailerV2 *)v11;

  if (!v10->_thumbnailerComponent) {
    goto LABEL_14;
  }
  uint64_t v13 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  registrationComponent = v10->_registrationComponent;
  v10->_registrationComponent = (CMISoftwareFlashRenderingRegistrationV2 *)v13;

  if (!v10->_registrationComponent) {
    goto LABEL_14;
  }
  uint64_t v15 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  sensorSpaceConversionComponent = v10->_sensorSpaceConversionComponent;
  v10->_sensorSpaceConversionComponent = (CMISoftwareFlashRenderingSensorSpaceConversionV2 *)v15;

  if (!v10->_sensorSpaceConversionComponent) {
    goto LABEL_14;
  }
  uint64_t v17 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  strobeDecompositionComponent = v10->_strobeDecompositionComponent;
  v10->_strobeDecompositionComponent = (CMISoftwareFlashRenderingStrobeDecompositionV2 *)v17;

  if (!v10->_strobeDecompositionComponent) {
    goto LABEL_14;
  }
  uint64_t v19 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  strobeCorrectionComponent = v10->_strobeCorrectionComponent;
  v10->_strobeCorrectionComponent = (CMISoftwareFlashRenderingStrobeCorrectionV2 *)v19;

  if (!v10->_strobeCorrectionComponent) {
    goto LABEL_14;
  }
  uint64_t v21 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  whiteBalanceAmbientComponent = v10->_whiteBalanceAmbientComponent;
  v10->_whiteBalanceAmbientComponent = (CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)v21;

  if (!v10->_whiteBalanceAmbientComponent) {
    goto LABEL_14;
  }
  uint64_t v23 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  whiteBalanceStrobeComponent = v10->_whiteBalanceStrobeComponent;
  v10->_whiteBalanceStrobeComponent = (CMISoftwareFlashRenderingWhiteBalanceStrobeV2 *)v23;

  if (!v10->_whiteBalanceStrobeComponent) {
    goto LABEL_14;
  }
  uint64_t v25 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext];
  combineBalancedComponentsComponent = v10->_combineBalancedComponentsComponent;
  v10->_combineBalancedComponentsComponent = (CMISoftwareFlashRenderingCombineBalancedComponentsV2 *)v25;

  if (!v10->_combineBalancedComponentsComponent) {
    goto LABEL_14;
  }
  uint64_t v27 = [(id)objc_opt_new() initWithMetalContext:v10->_metalContext externalMemoryResource:v8];
  styleTransferComponent = v10->_styleTransferComponent;
  v10->_styleTransferComponent = (CMISoftwareFlashRenderingStyleTransferV2 *)v27;

  if (v10->_styleTransferComponent)
  {
    v29 = v10;
  }
  else
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    v29 = 0;
  }

  return v29;
}

- (int)purgeResources
{
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
    int v58 = 11;
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_config, a3);
  id v7 = [(FigMetalContext *)self->_metalContext allocator];
  id v8 = (void *)[v7 newTextureDescriptor];

  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v58 = 7;
    goto LABEL_21;
  }
  v9 = [v8 desc];
  [v9 setTextureType:2];

  uint64_t v10 = [(CMISoftwareFlashRenderingCoreV2Configuration *)self->_config spatialWhitePointsWidth];
  uint64_t v11 = [v8 desc];
  [v11 setWidth:v10];

  uint64_t v12 = [(CMISoftwareFlashRenderingCoreV2Configuration *)self->_config spatialWhitePointsHeight];
  uint64_t v13 = [v8 desc];
  [v13 setHeight:v12];

  v14 = [v8 desc];
  [v14 setPixelFormat:65];

  [v8 setLabel:0];
  uint64_t v15 = [(FigMetalContext *)self->_metalContext allocator];
  v16 = (MTLTexture *)[v15 newTextureWithDescriptor:v8];
  spatialWhitePointsRBTexture = self->_spatialWhitePointsRBTexture;
  self->_spatialWhitePointsRBTexture = v16;

  if (!self->_spatialWhitePointsRBTexture) {
    goto LABEL_24;
  }
  uint64_t v18 = [(CMISoftwareFlashRenderingCoreV2Configuration *)self->_config thumbnailWidth];
  uint64_t v19 = [v8 desc];
  [v19 setWidth:v18];

  uint64_t v20 = [(CMISoftwareFlashRenderingCoreV2Configuration *)self->_config thumbnailHeight];
  uint64_t v21 = [v8 desc];
  [v21 setHeight:v20];

  v22 = [v8 desc];
  [v22 setPixelFormat:115];

  [v8 setLabel:0];
  uint64_t v23 = [(FigMetalContext *)self->_metalContext allocator];
  v24 = (MTLTexture *)[v23 newTextureWithDescriptor:v8];
  ambientThumbnailRGBTexture = self->_ambientThumbnailRGBTexture;
  self->_ambientThumbnailRGBTexture = v24;

  if (!self->_ambientThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v26 = [(FigMetalContext *)self->_metalContext allocator];
  uint64_t v27 = (MTLTexture *)[v26 newTextureWithDescriptor:v8];
  flashThumbnailRGBTexture = self->_flashThumbnailRGBTexture;
  self->_flashThumbnailRGBTexture = v27;

  if (!self->_flashThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v29 = [(FigMetalContext *)self->_metalContext allocator];
  v30 = (MTLTexture *)[v29 newTextureWithDescriptor:v8];
  ambientSensorThumbnailRGBATexture = self->_ambientSensorThumbnailRGBATexture;
  self->_ambientSensorThumbnailRGBATexture = v30;

  if (!self->_ambientSensorThumbnailRGBATexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v32 = [(FigMetalContext *)self->_metalContext allocator];
  v33 = (MTLTexture *)[v32 newTextureWithDescriptor:v8];
  flashSensorThumbnailRGBATexture = self->_flashSensorThumbnailRGBATexture;
  self->_flashSensorThumbnailRGBATexture = v33;

  if (!self->_flashSensorThumbnailRGBATexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v35 = [(FigMetalContext *)self->_metalContext allocator];
  v36 = (MTLTexture *)[v35 newTextureWithDescriptor:v8];
  ambientSensorRegisteredThumbnailRGBATexture = self->_ambientSensorRegisteredThumbnailRGBATexture;
  self->_ambientSensorRegisteredThumbnailRGBATexture = v36;

  if (!self->_ambientSensorRegisteredThumbnailRGBATexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v38 = [(FigMetalContext *)self->_metalContext allocator];
  v39 = (MTLTexture *)[v38 newTextureWithDescriptor:v8];
  strobeComponentThumbnailRGBATexture = self->_strobeComponentThumbnailRGBATexture;
  self->_strobeComponentThumbnailRGBATexture = v39;

  if (!self->_strobeComponentThumbnailRGBATexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v41 = [(FigMetalContext *)self->_metalContext allocator];
  v42 = (MTLTexture *)[v41 newTextureWithDescriptor:v8];
  ambientBalancedThumbnailRGBTexture = self->_ambientBalancedThumbnailRGBTexture;
  self->_ambientBalancedThumbnailRGBTexture = v42;

  if (!self->_ambientBalancedThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v44 = [(FigMetalContext *)self->_metalContext allocator];
  v45 = (MTLTexture *)[v44 newTextureWithDescriptor:v8];
  flashBalancedThumbnailRGBTexture = self->_flashBalancedThumbnailRGBTexture;
  self->_flashBalancedThumbnailRGBTexture = v45;

  if (!self->_flashBalancedThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v47 = [(FigMetalContext *)self->_metalContext allocator];
  v48 = (MTLTexture *)[v47 newTextureWithDescriptor:v8];
  ambientCorrectedThumbnailRGBTexture = self->_ambientCorrectedThumbnailRGBTexture;
  self->_ambientCorrectedThumbnailRGBTexture = v48;

  if (!self->_ambientCorrectedThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v50 = [(FigMetalContext *)self->_metalContext allocator];
  v51 = (MTLTexture *)[v50 newTextureWithDescriptor:v8];
  strobeCorrectedThumbnailRGBTexture = self->_strobeCorrectedThumbnailRGBTexture;
  self->_strobeCorrectedThumbnailRGBTexture = v51;

  if (!self->_strobeCorrectedThumbnailRGBTexture) {
    goto LABEL_24;
  }
  [v8 setLabel:0];
  v53 = [(FigMetalContext *)self->_metalContext allocator];
  v54 = (MTLTexture *)[v53 newTextureWithDescriptor:v8];
  strobeBalancedThumbnailRGBTexture = self->_strobeBalancedThumbnailRGBTexture;
  self->_strobeBalancedThumbnailRGBTexture = v54;

  if (!self->_strobeBalancedThumbnailRGBTexture)
  {
LABEL_24:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v58 = 6;
    goto LABEL_21;
  }
  sensorSpaceConversionComponent = self->_sensorSpaceConversionComponent;
  v57 = [v6 sensorSpaceConversionConfig];
  int v58 = [(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)sensorSpaceConversionComponent prepareToProcessWithConfig:v57];

  if (v58) {
    goto LABEL_27;
  }
  int v59 = [(CMISoftwareFlashRenderingRegistrationV2 *)self->_registrationComponent prepareToProcess:0];
  if (v59)
  {
    int v58 = v59;
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_21;
  }
  strobeCorrectionComponent = self->_strobeCorrectionComponent;
  v61 = [v6 strobeCorrectionConfig];
  int v58 = [(CMISoftwareFlashRenderingStrobeCorrectionV2 *)strobeCorrectionComponent prepareToProcessWithConfig:v61];

  if (v58) {
    goto LABEL_27;
  }
  whiteBalanceAmbientComponent = self->_whiteBalanceAmbientComponent;
  v63 = [v6 whiteBalanceAmbientConfig];
  int v58 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)whiteBalanceAmbientComponent prepareToProcessWithConfig:v63];

  if (v58) {
    goto LABEL_27;
  }
  combineBalancedComponentsComponent = self->_combineBalancedComponentsComponent;
  v65 = [v6 combineBalancedComponentsConfig];
  int v58 = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2 *)combineBalancedComponentsComponent prepareToProcessWithConfig:v65];

  if (v58
    || (styleTransferComponent = self->_styleTransferComponent,
        [v6 styleTransferConfig],
        v67 = objc_claimAutoreleasedReturnValue(),
        int v58 = [(CMISoftwareFlashRenderingStyleTransferV2 *)styleTransferComponent prepareToProcessWithConfig:v67], v67, v58))
  {
LABEL_27:
    fig_log_get_emitter();
    goto LABEL_28;
  }
LABEL_21:

  return v58;
}

- (int)finishProcessing
{
  [(FigMetalContext *)self->_metalContext waitForIdle];
  int v3 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self->_styleTransferComponent finishProcessing];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (int)applyWithAmbientLumaTexture:(id)a3 ambientChromaTexture:(id)a4 flashLumaTexture:(id)a5 flashChromaTexture:(id)a6 ambientYUVOffsets:(id)a7 flashYUVOffsets:(id)a8 ambientLSCGainsTexture:(float)a9 flashLSCGainsTexture:(float)a10 ambientLSCMaxGain:(id)a11 flashLSCMaxGain:(id)a12 skinMaskTexture:(float)a13 personMaskTexture:(float)a14 ambientWhitePoint:(CMISoftwareFlashRenderingCropRect)a15 flashWhitePoint:(CMISoftwareFlashRenderingLSCCropRect *)a16 strobeWhitePoint:(id)a17 ambientWhitePointTuned:(id)a18 strobeWhitePointTuned:ambientIntegrationTime:flashIntegrationTime:cropRect:LSCCropRect:fullSizeDimensions:outputLumaTexture:outputChromaTexture:
{
  double v61 = v20;
  double v62 = v21;
  double v67 = v19;
  double v70 = v18;
  double v68 = *(double *)&a10;
  double v63 = *(double *)&a9;
  id v66 = a3;
  id v30 = a4;
  id v31 = a5;
  id v32 = a6;
  id v72 = a7;
  id v71 = a8;
  id v33 = a11;
  id v65 = a12;
  id v64 = v77;
  id v69 = v78;
  v34 = [(FigMetalContext *)self->_metalContext commandBuffer];
  if (!v34)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v59 = FigSignalErrorAt();
    v35 = v66;
LABEL_23:
    v57 = v64;
    int v58 = v65;
    goto LABEL_17;
  }
  v35 = v66;
  int v36 = -[CMISoftwareFlashRenderingThumbnailerV2 encodeYUVToLinearRGBThumbnailConvert:inputLumaTexture:inputChromaTexture:yuvOffsets:thumbnailWidth:thumbnailHeight:cropRect:outputThumbnailRGBTexture:](self->_thumbnailerComponent, "encodeYUVToLinearRGBThumbnailConvert:inputLumaTexture:inputChromaTexture:yuvOffsets:thumbnailWidth:thumbnailHeight:cropRect:outputThumbnailRGBTexture:", v34, v66, v30, [(MTLTexture *)self->_ambientThumbnailRGBTexture width], [(MTLTexture *)self->_ambientThumbnailRGBTexture height], v63, a17, a18, self->_ambientThumbnailRGBTexture);
  if (v36
    || (int v36 = -[CMISoftwareFlashRenderingThumbnailerV2 encodeYUVToLinearRGBThumbnailConvert:inputLumaTexture:inputChromaTexture:yuvOffsets:thumbnailWidth:thumbnailHeight:cropRect:outputThumbnailRGBTexture:](self->_thumbnailerComponent, "encodeYUVToLinearRGBThumbnailConvert:inputLumaTexture:inputChromaTexture:yuvOffsets:thumbnailWidth:thumbnailHeight:cropRect:outputThumbnailRGBTexture:", v34, v31, v32, -[MTLTexture width](self->_flashThumbnailRGBTexture, "width"), -[MTLTexture height](self->_flashThumbnailRGBTexture, "height"), v68, a17, a18, self->_flashThumbnailRGBTexture)) != 0|| (*(float *)&v37 = *((float *)&a16 + 1) / fmaxf(*(float *)&a16, 0.00000011921), (int v36 = -[CMISoftwareFlashRenderingSensorSpaceConversionV2 convertRGBtoNormSensorSpace:inputRGBTexture:appliedWhitePoint:integrationTimeScale:outputSensorRGBATexture:](self->_sensorSpaceConversionComponent, "convertRGBtoNormSensorSpace:inputRGBTexture:appliedWhitePoint:integrationTimeScale:outputSensorRGBATexture:", v34, self->_ambientThumbnailRGBTexture, self->_ambientSensorThumbnailRGBATexture,
                 v70,
                 v37)) != 0))
  {
    int v59 = v36;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_23;
  }
  sensorSpaceConversionComponent = self->_sensorSpaceConversionComponent;
  flashThumbnailRGBTexture = self->_flashThumbnailRGBTexture;
  flashSensorThumbnailRGBATexture = self->_flashSensorThumbnailRGBATexture;
  long long v73 = *v75;
  int v74 = *((_DWORD *)v75 + 4);
  LODWORD(v38) = 1.0;
  *(float *)&double v39 = a14;
  *(float *)&double v40 = a13;
  int v44 = [(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)sensorSpaceConversionComponent convertRGBtoNormSensorSpaceWithLSCGainAdjustment:v34 inputRGBTexture:flashThumbnailRGBTexture appliedWhitePoint:v71 integrationTimeScale:v72 appliedLSCGainsTexture:&v73 appliedLSCMaxGain:flashSensorThumbnailRGBATexture baseLSCGainsTexture:v67 baseLSCMaxGain:v38 LSCCropRect:v39 fullSizeDimensions:v40 outputSensorRGBATexture:v76];
  if (v44
    || ([(FigMetalContext *)self->_metalContext commit],
        (int v44 = [(CMISoftwareFlashRenderingRegistrationV2 *)self->_registrationComponent registerImage:v66 referenceLumaTexture:v31]) != 0)|| (int v44 = [(CMISoftwareFlashRenderingRegistrationV2 *)self->_registrationComponent warpImage:self->_ambientSensorThumbnailRGBATexture outputWarpedTexture:self->_ambientSensorRegisteredThumbnailRGBATexture]) != 0)
  {
    int v59 = v44;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_23;
  }
  uint64_t v45 = [(FigMetalContext *)self->_metalContext commandBuffer];

  if (!v45)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v59 = FigSignalErrorAt();
    v34 = 0;
    goto LABEL_23;
  }
  int v46 = [(CMISoftwareFlashRenderingStrobeDecompositionV2 *)self->_strobeDecompositionComponent encodeStrobeComponentCalculate:v45 flashSensorRGBATexture:self->_flashSensorThumbnailRGBATexture ambientSensorRGBATexture:self->_ambientSensorRegisteredThumbnailRGBATexture outputStrobeComponentRGBATexture:self->_strobeComponentThumbnailRGBATexture];
  if (v46) {
    goto LABEL_22;
  }
  int v46 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self->_whiteBalanceAmbientComponent encodeWhiteBalanceAmbientApply:v45 ambientSensorRGBATexture:self->_ambientSensorRegisteredThumbnailRGBATexture strobeSensorRGBATexture:self->_strobeComponentThumbnailRGBATexture ambientWhitePoint:self->_ambientBalancedThumbnailRGBTexture strobeWhitePoint:v70 ambientWhitePointTuned:v61 outputAmbientBalancedRGBTexture:v62];
  if (v46) {
    goto LABEL_22;
  }
  int v46 = [(CMISoftwareFlashRenderingWhiteBalanceStrobeV2 *)self->_whiteBalanceStrobeComponent encodeWhiteBalanceStrobeApply:v45 strobeSensorRGBTexture:self->_strobeComponentThumbnailRGBATexture strobeWhitePoint:self->_strobeBalancedThumbnailRGBTexture outputStrobeBalancedRGBTexture:*(double *)&a15.var0];
  if (v46) {
    goto LABEL_22;
  }
  strobeCorrectionComponent = self->_strobeCorrectionComponent;
  ambientBalancedThumbnailRGBTexture = self->_ambientBalancedThumbnailRGBTexture;
  strobeCorrectedThumbnailRGBTexture = self->_strobeCorrectedThumbnailRGBTexture;
  strobeBalancedThumbnailRGBTexture = self->_strobeBalancedThumbnailRGBTexture;
  ambientCorrectedThumbnailRGBTexture = self->_ambientCorrectedThumbnailRGBTexture;
  long long v73 = *v75;
  int v74 = *((_DWORD *)v75 + 4);
  *(float *)&double v47 = a14;
  int v46 = [(CMISoftwareFlashRenderingStrobeCorrectionV2 *)strobeCorrectionComponent applyStrobeCorrection:v45 ambientComponentRGBTexture:ambientBalancedThumbnailRGBTexture strobeComponentRGBTexture:strobeBalancedThumbnailRGBTexture ambientLSCGainsTexture:v72 flashLSCGainsTexture:v71 ambientLSCMaxGain:&v73 flashLSCMaxGain:COERCE_DOUBLE(__PAIR64__(DWORD1(v73), LODWORD(a13))) lscCropRect:v47 fullSizeDimensions:v76 outputAmbientCorrectedRGBTexture:ambientCorrectedThumbnailRGBTexture outputStrobeCorrectedRGBTexture:strobeCorrectedThumbnailRGBTexture];
  if (v46
    || (int v46 = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2 *)self->_combineBalancedComponentsComponent applyBalancedComponentsCombine:v45 ambientBalancedRGBTexture:self->_ambientCorrectedThumbnailRGBTexture strobeBalancedRGBTexture:self->_strobeCorrectedThumbnailRGBTexture flashOriginalRGBTexture:self->_flashThumbnailRGBTexture outputFlashBalancedRGBTexture:self->_flashBalancedThumbnailRGBTexture]) != 0)
  {
LABEL_22:
    int v59 = v46;
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = (void *)v45;
    goto LABEL_23;
  }
  [(FigMetalContext *)self->_metalContext commit];
  styleTransferComponent = self->_styleTransferComponent;
  v54 = self->_flashThumbnailRGBTexture;
  flashBalancedThumbnailRGBTexture = self->_flashBalancedThumbnailRGBTexture;
  spatialWhitePointsRBTexture = self->_spatialWhitePointsRBTexture;
  v57 = v64;
  int v58 = v65;
  int v59 = -[CMISoftwareFlashRenderingStyleTransferV2 applyStyleTransferWithBufferClearing:inputChromaTexture:sourceRGBTexture:targetRGBTexture:skinMaskTexture:personMaskTexture:inputYUVOffsets:cropRect:appliedWhitePoint:outputSpatialWhitePointsRBTexture:outputLumaTexture:outputChromaTexture:](styleTransferComponent, "applyStyleTransferWithBufferClearing:inputChromaTexture:sourceRGBTexture:targetRGBTexture:skinMaskTexture:personMaskTexture:inputYUVOffsets:cropRect:appliedWhitePoint:outputSpatialWhitePointsRBTexture:outputLumaTexture:outputChromaTexture:", v31, v32, v54, flashBalancedThumbnailRGBTexture, v33, v65, v68, v67, a17, a18, spatialWhitePointsRBTexture, v64, v69);
  if (v59)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v34 = (void *)v45;
LABEL_17:

  return v59;
}

- (MTLTexture)spatialWhitePointsRBTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialWhitePointsRBTexture, 0);
  objc_storeStrong((id *)&self->_strobeBalancedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeCorrectedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_ambientCorrectedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_flashBalancedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_ambientBalancedThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_strobeComponentThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_ambientSensorRegisteredThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_flashSensorThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_ambientSensorThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_flashThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_ambientThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_styleTransferComponent, 0);
  objc_storeStrong((id *)&self->_combineBalancedComponentsComponent, 0);
  objc_storeStrong((id *)&self->_whiteBalanceStrobeComponent, 0);
  objc_storeStrong((id *)&self->_whiteBalanceAmbientComponent, 0);
  objc_storeStrong((id *)&self->_strobeCorrectionComponent, 0);
  objc_storeStrong((id *)&self->_strobeDecompositionComponent, 0);
  objc_storeStrong((id *)&self->_sensorSpaceConversionComponent, 0);
  objc_storeStrong((id *)&self->_registrationComponent, 0);
  objc_storeStrong((id *)&self->_thumbnailerComponent, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end