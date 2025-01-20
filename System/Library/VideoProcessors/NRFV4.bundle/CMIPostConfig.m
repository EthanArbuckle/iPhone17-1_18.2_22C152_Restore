@interface CMIPostConfig
- (BOOL)allowColorCube;
- (BOOL)allowDefringing;
- (BOOL)allowDenoiseAndSharpening;
- (BOOL)allowGreenGhostMitigation;
- (BOOL)allowOutlierCorrection;
- (BOOL)allowSemanticStyles;
- (BOOL)allowTonemapping;
- (BOOL)ambnrInputPyramidGenerationEnabled;
- (BOOL)ambnrUpsampleOffsetEnabled;
- (BOOL)autoAllocateLocalGainMap;
- (BOOL)colorCubeUseSkyMask;
- (BOOL)disableChromaBand3GainMap;
- (BOOL)disableTextureCompression;
- (BOOL)enableMIWB;
- (BOOL)enableSTF;
- (BOOL)forceEnableBandZeroDenoising;
- (BOOL)hazeAppliedInMIWB;
- (BOOL)isLowLight;
- (BOOL)requestLinearMIWBAppliedOutput;
- (BOOL)semStylesUseGainMap;
- (BOOL)tmApplyColorCorrectionMatrix;
- (BOOL)toneMappingInputIsLinear;
- (CMIPostConfig)initWithMetalContext:(id)a3;
- (CMIPostInputFrameMetadata)darkestFrameMetadata;
- (CMIPostInputFrameMetadata)ev0FrameMetadata;
- (DenoiseAndSharpeningPlist)denoiseAndSharpeningPlist;
- (GreenGhostBrightLightTuningParams)greenGhostBrightLightTuning;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLTexture)gainMap;
- (MTLTexture)inputChroma;
- (MTLTexture)inputDenoiseLocalGainMap;
- (MTLTexture)inputLuma;
- (MTLTexture)inputNoiseChroma;
- (MTLTexture)inputNoiseLuma;
- (MTLTexture)miwbOutputChromaTexture;
- (MTLTexture)miwbOutputLumaTexture;
- (MTLTexture)outputChroma;
- (MTLTexture)outputLuma;
- (MTLTexture)personMask;
- (MTLTexture)skinMask;
- (MTLTexture)skyMask;
- (NSArray)faceLandmarks;
- (NSArray)instanceMasks;
- (NSArray)lowResPersonInstanceConfidences;
- (NSArray)skinToneClassificationsForFaces;
- (NSString)smartCameraSceneType;
- (NoiseModelPlist)noiseModelPlist;
- (SemanticStylesPlist)semanticStylesPlist;
- (SidecarWriter)sidecarWriter;
- (ToneMappingCurves)toneMappingCurves;
- (ToneMappingPlist)toneMappingPlist;
- (VideoDefringingTuningParameters)defringingTuningParameters;
- (double)ltmGridScaling;
- (float)tonemappingScaleInput;
- (int)checkIfValid;
- (int)regularizeLocalToneCurves:(const ltmCurves *)a3 mask:(__CVBuffer *)a4 tcrParams:(id)a5 imageDims:;
- (int)regularizeLocalToneCurvesWithSkyMask:(__CVBuffer *)a3 withSkinMask:(__CVBuffer *)a4;
- (int)tmQuality;
- (void)disableAllAllow;
- (void)releaseReferences;
- (void)setAllowColorCube:(BOOL)a3;
- (void)setAllowDefringing:(BOOL)a3;
- (void)setAllowDenoiseAndSharpening:(BOOL)a3;
- (void)setAllowGreenGhostMitigation:(BOOL)a3;
- (void)setAllowOutlierCorrection:(BOOL)a3;
- (void)setAllowSemanticStyles:(BOOL)a3;
- (void)setAllowTonemapping:(BOOL)a3;
- (void)setAmbnrInputPyramidGenerationEnabled:(BOOL)a3;
- (void)setAmbnrUpsampleOffsetEnabled:(BOOL)a3;
- (void)setAutoAllocateLocalGainMap:(BOOL)a3;
- (void)setColorCubeUseSkyMask:(BOOL)a3;
- (void)setDarkestFrameMetadata:(id)a3;
- (void)setDefaults;
- (void)setDefringingTuningParameters:(id)a3;
- (void)setDenoiseAndSharpeningPlist:(id)a3;
- (void)setDisableChromaBand3GainMap:(BOOL)a3;
- (void)setDisableTextureCompression:(BOOL)a3;
- (void)setEnableMIWB:(BOOL)a3;
- (void)setEnableSTF:(BOOL)a3;
- (void)setEv0FrameMetadata:(id)a3;
- (void)setFaceLandmarks:(id)a3;
- (void)setForceEnableBandZeroDenoising:(BOOL)a3;
- (void)setGainMap:(id)a3;
- (void)setGreenGhostBrightLightTuning:(id)a3;
- (void)setHazeAppliedInMIWB:(BOOL)a3;
- (void)setInputChroma:(id)a3;
- (void)setInputDenoiseLocalGainMap:(id)a3;
- (void)setInputLuma:(id)a3;
- (void)setInputNoiseChroma:(id)a3;
- (void)setInputNoiseLuma:(id)a3;
- (void)setInstanceMasks:(id)a3;
- (void)setIsLowLight:(BOOL)a3;
- (void)setLowResPersonInstanceConfidences:(id)a3;
- (void)setLtmGridScaling:(CMIPostConfig *)self;
- (void)setMiwbOutputChromaTexture:(id)a3;
- (void)setMiwbOutputLumaTexture:(id)a3;
- (void)setNoiseModelPlist:(id)a3;
- (void)setOutputChroma:(id)a3;
- (void)setOutputLuma:(id)a3;
- (void)setPersonMask:(id)a3;
- (void)setRequestLinearMIWBAppliedOutput:(BOOL)a3;
- (void)setSemStylesUseGainMap:(BOOL)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSemanticStylesPlist:(id)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setSkinMask:(id)a3;
- (void)setSkinToneClassificationsForFaces:(id)a3;
- (void)setSkyMask:(id)a3;
- (void)setSmartCameraSceneType:(id)a3;
- (void)setTmApplyColorCorrectionMatrix:(BOOL)a3;
- (void)setTmQuality:(int)a3;
- (void)setToneMappingCurves:(id)a3;
- (void)setToneMappingInputIsLinear:(BOOL)a3;
- (void)setToneMappingPlist:(id)a3;
- (void)setTonemappingScaleInput:(float)a3;
@end

@implementation CMIPostConfig

- (CMIPostConfig)initWithMetalContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMIPostConfig;
  v5 = [(CMIPostConfig *)&v13 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (!v5->_toneMappingCurves)
  {
    v7 = [[ToneMappingCurves alloc] initWithWithContext:v4];
    toneMappingCurves = v6->_toneMappingCurves;
    v6->_toneMappingCurves = v7;

    if (!v6->_toneMappingCurves)
    {
      FigDebugAssert3();
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_6:
      v9 = 0;
      goto LABEL_7;
    }
  }
  [(CMIPostConfig *)v6 setDefaults];
  [(ToneMappingCurves *)v6->_toneMappingCurves setEnableSTF:v6->_enableSTF];
  v9 = v6;
LABEL_7:
  v11 = v9;

  return v11;
}

- (void)setEnableSTF:(BOOL)a3
{
  self->_enableSTF = a3;
  -[ToneMappingCurves setEnableSTF:](self->_toneMappingCurves, "setEnableSTF:");
}

- (void)setDefaults
{
  *(void *)&self->_disableTextureCompression = 0x101010101010101;
  *(_DWORD *)&self->_allowGreenGhostMitigation = 16843009;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)self->_ltmGridScaling = _D0;
  *(void *)&self->_tmQuality = 0x3F80000000000000;
  *(void *)&self->_enableSTF = 0x10000010100;
  self->_hazeAppliedInMIWB = 0;
}

- (void)disableAllAllow
{
  *(_DWORD *)&self->_allowGreenGhostMitigation = 0;
  *(_DWORD *)&self->_allowTonemapping = 0;
}

- (void)releaseReferences
{
  semanticStyleProperties = self->_semanticStyleProperties;
  self->_semanticStyleProperties = 0;

  skinMask = self->_skinMask;
  self->_skinMask = 0;

  skyMask = self->_skyMask;
  self->_skyMask = 0;

  personMask = self->_personMask;
  self->_personMask = 0;

  instanceMasks = self->_instanceMasks;
  self->_instanceMasks = 0;

  faceLandmarks = self->_faceLandmarks;
  self->_faceLandmarks = 0;

  skinToneClassificationsForFaces = self->_skinToneClassificationsForFaces;
  self->_skinToneClassificationsForFaces = 0;

  lowResPersonInstanceConfidences = self->_lowResPersonInstanceConfidences;
  self->_lowResPersonInstanceConfidences = 0;

  smartCameraSceneType = self->_smartCameraSceneType;
  self->_smartCameraSceneType = 0;

  toneMappingPlist = self->_toneMappingPlist;
  self->_toneMappingPlist = 0;

  semanticStylesPlist = self->_semanticStylesPlist;
  self->_semanticStylesPlist = 0;

  denoiseAndSharpeningPlist = self->_denoiseAndSharpeningPlist;
  self->_denoiseAndSharpeningPlist = 0;

  noiseModelPlist = self->_noiseModelPlist;
  self->_noiseModelPlist = 0;

  defringingTuningParameters = self->_defringingTuningParameters;
  self->_defringingTuningParameters = 0;

  greenGhostBrightLightTuning = self->_greenGhostBrightLightTuning;
  self->_greenGhostBrightLightTuning = 0;

  darkestFrameMetadata = self->_darkestFrameMetadata;
  self->_darkestFrameMetadata = 0;

  ev0FrameMetadata = self->_ev0FrameMetadata;
  self->_ev0FrameMetadata = 0;

  inputLuma = self->_inputLuma;
  self->_inputLuma = 0;

  inputChroma = self->_inputChroma;
  self->_inputChroma = 0;

  inputDenoiseLocalGainMap = self->_inputDenoiseLocalGainMap;
  self->_inputDenoiseLocalGainMap = 0;

  inputNoiseLuma = self->_inputNoiseLuma;
  self->_inputNoiseLuma = 0;

  inputNoiseChroma = self->_inputNoiseChroma;
  self->_inputNoiseChroma = 0;

  outputLuma = self->_outputLuma;
  self->_outputLuma = 0;

  outputChroma = self->_outputChroma;
  self->_outputChroma = 0;

  miwbOutputLumaTexture = self->_miwbOutputLumaTexture;
  self->_miwbOutputLumaTexture = 0;

  miwbOutputChromaTexture = self->_miwbOutputChromaTexture;
  self->_miwbOutputChromaTexture = 0;

  sidecarWriter = self->_sidecarWriter;
  self->_sidecarWriter = 0;
}

- (int)regularizeLocalToneCurves:(const ltmCurves *)a3 mask:(__CVBuffer *)a4 tcrParams:(id)a5 imageDims:
{
  return -[ToneMappingCurves regularizeLocalToneCurves:mask:tcrParams:imageDims:](self->_toneMappingCurves, "regularizeLocalToneCurves:mask:tcrParams:imageDims:", a3, a4, a5);
}

- (int)regularizeLocalToneCurvesWithSkyMask:(__CVBuffer *)a3 withSkinMask:(__CVBuffer *)a4
{
  toneMappingPlist = self->_toneMappingPlist;
  if (!toneMappingPlist) {
    goto LABEL_15;
  }
  if (!toneMappingPlist->enableTCR) {
    return 0;
  }
  if ((tcr = toneMappingPlist->tcr) == 0
    || (inputLuma = self->_inputLuma) == 0
    || !self->_darkestFrameMetadata
    || (tcr->maskType ? (v8 = a4) : (v8 = a3), !v8))
  {
LABEL_15:
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    int v15 = -73429;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v15;
  }
  unsigned int v9 = [(MTLTexture *)inputLuma width];
  unsigned int v10 = [(MTLTexture *)self->_inputLuma height];
  toneMappingCurves = self->_toneMappingCurves;
  uint64_t v12 = [(CMIPostInputFrameMetadata *)self->_darkestFrameMetadata ltmCurvesForBackground];
  objc_super v13 = self->_toneMappingPlist->tcr;

  return [(ToneMappingCurves *)toneMappingCurves regularizeLocalToneCurves:v12 mask:v8 tcrParams:v13 imageDims:COERCE_DOUBLE(__PAIR64__(v10, v9))];
}

- (int)checkIfValid
{
  if ((!self->_allowColorCube || self->_allowDenoiseAndSharpening)
    && (!self->_allowGreenGhostMitigation || self->_allowDenoiseAndSharpening)
    && (self->_allowTonemapping || self->_allowSemanticStyles || self->_allowDenoiseAndSharpening)
    && self->_inputLuma
    && self->_inputChroma
    && self->_outputLuma
    && self->_outputChroma
    && self->_darkestFrameMetadata
    && self->_ev0FrameMetadata
    && (!self->_allowTonemapping || self->_toneMappingPlist && self->_toneMappingCurves)
    && (!self->_allowDenoiseAndSharpening || self->_denoiseAndSharpeningPlist && self->_noiseModelPlist)
    && [(NSArray *)self->_instanceMasks count] < 5)
  {
    return 0;
  }
  id v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  int v2 = -73429;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return v2;
}

- (BOOL)disableTextureCompression
{
  return self->_disableTextureCompression;
}

- (void)setDisableTextureCompression:(BOOL)a3
{
  self->_disableTextureCompression = a3;
}

- (BOOL)autoAllocateLocalGainMap
{
  return self->_autoAllocateLocalGainMap;
}

- (void)setAutoAllocateLocalGainMap:(BOOL)a3
{
  self->_autoAllocateLocalGainMap = a3;
}

- (BOOL)tmApplyColorCorrectionMatrix
{
  return self->_tmApplyColorCorrectionMatrix;
}

- (void)setTmApplyColorCorrectionMatrix:(BOOL)a3
{
  self->_tmApplyColorCorrectionMatrix = a3;
}

- (BOOL)semStylesUseGainMap
{
  return self->_semStylesUseGainMap;
}

- (void)setSemStylesUseGainMap:(BOOL)a3
{
  self->_semStylesUseGainMap = a3;
}

- (BOOL)colorCubeUseSkyMask
{
  return self->_colorCubeUseSkyMask;
}

- (void)setColorCubeUseSkyMask:(BOOL)a3
{
  self->_colorCubeUseSkyMask = a3;
}

- (BOOL)allowTonemapping
{
  return self->_allowTonemapping;
}

- (void)setAllowTonemapping:(BOOL)a3
{
  self->_allowTonemapping = a3;
}

- (BOOL)allowSemanticStyles
{
  return self->_allowSemanticStyles;
}

- (void)setAllowSemanticStyles:(BOOL)a3
{
  self->_allowSemanticStyles = a3;
}

- (BOOL)allowDenoiseAndSharpening
{
  return self->_allowDenoiseAndSharpening;
}

- (void)setAllowDenoiseAndSharpening:(BOOL)a3
{
  self->_allowDenoiseAndSharpening = a3;
}

- (BOOL)allowGreenGhostMitigation
{
  return self->_allowGreenGhostMitigation;
}

- (void)setAllowGreenGhostMitigation:(BOOL)a3
{
  self->_allowGreenGhostMitigation = a3;
}

- (BOOL)allowDefringing
{
  return self->_allowDefringing;
}

- (void)setAllowDefringing:(BOOL)a3
{
  self->_allowDefringing = a3;
}

- (BOOL)allowColorCube
{
  return self->_allowColorCube;
}

- (void)setAllowColorCube:(BOOL)a3
{
  self->_allowColorCube = a3;
}

- (BOOL)allowOutlierCorrection
{
  return self->_allowOutlierCorrection;
}

- (void)setAllowOutlierCorrection:(BOOL)a3
{
  self->_allowOutlierCorrection = a3;
}

- (BOOL)enableSTF
{
  return self->_enableSTF;
}

- (int)tmQuality
{
  return self->_tmQuality;
}

- (void)setTmQuality:(int)a3
{
  self->_tmQuality = a3;
}

- (BOOL)ambnrUpsampleOffsetEnabled
{
  return self->_ambnrUpsampleOffsetEnabled;
}

- (void)setAmbnrUpsampleOffsetEnabled:(BOOL)a3
{
  self->_ambnrUpsampleOffsetEnabled = a3;
}

- (BOOL)ambnrInputPyramidGenerationEnabled
{
  return self->_ambnrInputPyramidGenerationEnabled;
}

- (void)setAmbnrInputPyramidGenerationEnabled:(BOOL)a3
{
  self->_ambnrInputPyramidGenerationEnabled = a3;
}

- (BOOL)forceEnableBandZeroDenoising
{
  return self->_forceEnableBandZeroDenoising;
}

- (void)setForceEnableBandZeroDenoising:(BOOL)a3
{
  self->_forceEnableBandZeroDenoising = a3;
}

- (double)ltmGridScaling
{
  return *(double *)(a1 + 40);
}

- (void)setLtmGridScaling:(CMIPostConfig *)self
{
  *(void *)self->_ltmGridScaling = v2;
}

- (float)tonemappingScaleInput
{
  return self->_tonemappingScaleInput;
}

- (void)setTonemappingScaleInput:(float)a3
{
  self->_tonemappingScaleInput = a3;
}

- (BOOL)isLowLight
{
  return self->_isLowLight;
}

- (void)setIsLowLight:(BOOL)a3
{
  self->_isLowLight = a3;
}

- (BOOL)toneMappingInputIsLinear
{
  return self->_toneMappingInputIsLinear;
}

- (void)setToneMappingInputIsLinear:(BOOL)a3
{
  self->_toneMappingInputIsLinear = a3;
}

- (BOOL)requestLinearMIWBAppliedOutput
{
  return self->_requestLinearMIWBAppliedOutput;
}

- (void)setRequestLinearMIWBAppliedOutput:(BOOL)a3
{
  self->_requestLinearMIWBAppliedOutput = a3;
}

- (BOOL)enableMIWB
{
  return self->_enableMIWB;
}

- (void)setEnableMIWB:(BOOL)a3
{
  self->_enableMIWB = a3;
}

- (BOOL)hazeAppliedInMIWB
{
  return self->_hazeAppliedInMIWB;
}

- (void)setHazeAppliedInMIWB:(BOOL)a3
{
  self->_hazeAppliedInMIWB = a3;
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return self->_semanticStyleProperties;
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (MTLTexture)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(id)a3
{
}

- (MTLTexture)skyMask
{
  return self->_skyMask;
}

- (void)setSkyMask:(id)a3
{
}

- (MTLTexture)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(id)a3
{
}

- (NSArray)instanceMasks
{
  return self->_instanceMasks;
}

- (void)setInstanceMasks:(id)a3
{
}

- (NSArray)faceLandmarks
{
  return self->_faceLandmarks;
}

- (void)setFaceLandmarks:(id)a3
{
}

- (NSArray)skinToneClassificationsForFaces
{
  return self->_skinToneClassificationsForFaces;
}

- (void)setSkinToneClassificationsForFaces:(id)a3
{
}

- (NSArray)lowResPersonInstanceConfidences
{
  return self->_lowResPersonInstanceConfidences;
}

- (void)setLowResPersonInstanceConfidences:(id)a3
{
}

- (NSString)smartCameraSceneType
{
  return self->_smartCameraSceneType;
}

- (void)setSmartCameraSceneType:(id)a3
{
}

- (ToneMappingPlist)toneMappingPlist
{
  return self->_toneMappingPlist;
}

- (void)setToneMappingPlist:(id)a3
{
}

- (SemanticStylesPlist)semanticStylesPlist
{
  return self->_semanticStylesPlist;
}

- (void)setSemanticStylesPlist:(id)a3
{
}

- (DenoiseAndSharpeningPlist)denoiseAndSharpeningPlist
{
  return self->_denoiseAndSharpeningPlist;
}

- (void)setDenoiseAndSharpeningPlist:(id)a3
{
}

- (NoiseModelPlist)noiseModelPlist
{
  return self->_noiseModelPlist;
}

- (void)setNoiseModelPlist:(id)a3
{
}

- (VideoDefringingTuningParameters)defringingTuningParameters
{
  return self->_defringingTuningParameters;
}

- (void)setDefringingTuningParameters:(id)a3
{
}

- (GreenGhostBrightLightTuningParams)greenGhostBrightLightTuning
{
  return self->_greenGhostBrightLightTuning;
}

- (void)setGreenGhostBrightLightTuning:(id)a3
{
}

- (CMIPostInputFrameMetadata)darkestFrameMetadata
{
  return self->_darkestFrameMetadata;
}

- (void)setDarkestFrameMetadata:(id)a3
{
}

- (CMIPostInputFrameMetadata)ev0FrameMetadata
{
  return self->_ev0FrameMetadata;
}

- (void)setEv0FrameMetadata:(id)a3
{
}

- (MTLTexture)inputLuma
{
  return self->_inputLuma;
}

- (void)setInputLuma:(id)a3
{
}

- (MTLTexture)inputChroma
{
  return self->_inputChroma;
}

- (void)setInputChroma:(id)a3
{
}

- (MTLTexture)inputDenoiseLocalGainMap
{
  return self->_inputDenoiseLocalGainMap;
}

- (void)setInputDenoiseLocalGainMap:(id)a3
{
}

- (MTLTexture)inputNoiseLuma
{
  return self->_inputNoiseLuma;
}

- (void)setInputNoiseLuma:(id)a3
{
}

- (MTLTexture)inputNoiseChroma
{
  return self->_inputNoiseChroma;
}

- (void)setInputNoiseChroma:(id)a3
{
}

- (MTLTexture)gainMap
{
  return self->_gainMap;
}

- (void)setGainMap:(id)a3
{
}

- (BOOL)disableChromaBand3GainMap
{
  return self->_disableChromaBand3GainMap;
}

- (void)setDisableChromaBand3GainMap:(BOOL)a3
{
  self->_disableChromaBand3GainMap = a3;
}

- (MTLTexture)outputLuma
{
  return self->_outputLuma;
}

- (void)setOutputLuma:(id)a3
{
}

- (MTLTexture)outputChroma
{
  return self->_outputChroma;
}

- (void)setOutputChroma:(id)a3
{
}

- (MTLTexture)miwbOutputLumaTexture
{
  return self->_miwbOutputLumaTexture;
}

- (void)setMiwbOutputLumaTexture:(id)a3
{
}

- (MTLTexture)miwbOutputChromaTexture
{
  return self->_miwbOutputChromaTexture;
}

- (void)setMiwbOutputChromaTexture:(id)a3
{
}

- (SidecarWriter)sidecarWriter
{
  return self->_sidecarWriter;
}

- (void)setSidecarWriter:(id)a3
{
}

- (ToneMappingCurves)toneMappingCurves
{
  return self->_toneMappingCurves;
}

- (void)setToneMappingCurves:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneMappingCurves, 0);
  objc_storeStrong((id *)&self->_sidecarWriter, 0);
  objc_storeStrong((id *)&self->_miwbOutputChromaTexture, 0);
  objc_storeStrong((id *)&self->_miwbOutputLumaTexture, 0);
  objc_storeStrong((id *)&self->_outputChroma, 0);
  objc_storeStrong((id *)&self->_outputLuma, 0);
  objc_storeStrong((id *)&self->_gainMap, 0);
  objc_storeStrong((id *)&self->_inputNoiseChroma, 0);
  objc_storeStrong((id *)&self->_inputNoiseLuma, 0);
  objc_storeStrong((id *)&self->_inputDenoiseLocalGainMap, 0);
  objc_storeStrong((id *)&self->_inputChroma, 0);
  objc_storeStrong((id *)&self->_inputLuma, 0);
  objc_storeStrong((id *)&self->_ev0FrameMetadata, 0);
  objc_storeStrong((id *)&self->_darkestFrameMetadata, 0);
  objc_storeStrong((id *)&self->_greenGhostBrightLightTuning, 0);
  objc_storeStrong((id *)&self->_defringingTuningParameters, 0);
  objc_storeStrong((id *)&self->_noiseModelPlist, 0);
  objc_storeStrong((id *)&self->_denoiseAndSharpeningPlist, 0);
  objc_storeStrong((id *)&self->_semanticStylesPlist, 0);
  objc_storeStrong((id *)&self->_toneMappingPlist, 0);
  objc_storeStrong((id *)&self->_smartCameraSceneType, 0);
  objc_storeStrong((id *)&self->_lowResPersonInstanceConfidences, 0);
  objc_storeStrong((id *)&self->_skinToneClassificationsForFaces, 0);
  objc_storeStrong((id *)&self->_faceLandmarks, 0);
  objc_storeStrong((id *)&self->_instanceMasks, 0);
  objc_storeStrong((id *)&self->_personMask, 0);
  objc_storeStrong((id *)&self->_skyMask, 0);
  objc_storeStrong((id *)&self->_skinMask, 0);

  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
}

@end