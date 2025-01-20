@interface DenoiseFusePipeline
+ (int)prewarmShaders:(id)a3;
- (BOOL)allowModifyingInputBuffers;
- (BOOL)doGreenGhostMitigation;
- (BOOL)getSTFStillApplied;
- (BOOL)isHazeCorrectionEnabled:(id)a3;
- (BOOL)skipDenoising;
- (BOOL)srlEnabled;
- (BOOL)stfAllowed;
- (DenoiseFusePipeline)initWithContext:(id)a3 cameraInfo:(id)a4 nrfConfig:(id)a5 dasTuningOptions:(id)a6 toneMappingOptions:(id)a7 tuningParameters:(id)a8 deviceGeneration:(int)a9;
- (SidecarWriter)sidecarWriter;
- (id)_runInferenceProvider:(id)a3;
- (id)getSTFLTM_asNSData;
- (int)_freeInputBandPyramidForFrame:(int)a3;
- (int)_getPyramidLevel:(id)a3 withWidth:(unsigned int)a4 withHeight:(unsigned int)a5;
- (int)addFrame:(__CVBuffer *)a3 cfp:(id)a4 processingType:(unsigned int)a5 createPyramid:(BOOL)a6 batchCount:(int)a7;
- (int)addFrameWithInputLuma:(id)a3 inputChroma:(id)a4 inputYCbCr:(id)a5 cfp:(id)a6 processingType:(unsigned int)a7 createPyramid:(BOOL)a8 batchCount:(int)a9;
- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4 levels:(int)a5 frames:(int)a6;
- (int)allocateResourcesIfNeededForDesc:(id)a3 didAllocate:(BOOL *)a4;
- (int)baseLayer:(__CVBuffer *)a3;
- (int)blinkDetectionOnFrameIdx:(int)a3 imgMeta:(id)a4 plist:(id)a5 resultScore:(float *)a6 frameIdx:(int)a7;
- (int)createPyramidForFrame:(id)a3 cfp:(id)a4;
- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 input:(__CVBuffer *)a7 noiseMap:(__CVBuffer *)a8 cfp:(id)a9 nrfPlist:(id)a10 style:(id)a11 inferenceProvider:(id)a12 defringeEnabled:(BOOL)a13 colorCubeFixType:(int)a14 isLowLight:(BOOL)a15;
- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 inputFrameIndex:(unsigned int)a7 noiseMap:(__CVBuffer *)a8 cfp:(id)a9 nrfPlist:(id)a10 style:(id)a11 inferenceProvider:(id)a12 defringeEnabled:(BOOL)a13 colorCubeFixType:(int)a14 isLowLight:(BOOL)a15;
- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 inputYCbCr:(id)a9 noiseMap:(__CVBuffer *)a10 cfp:(id)a11 nrfPlist:(id)a12 style:(id)a13 inferenceProvider:(id)a14 defringeEnabled:(BOOL)a15 colorCubeFixType:(int)a16 isLowLight:(BOOL)a17;
- (int)doGainMap:(const FusionConfiguration *)a3 properties:(id *)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7 useFusedFrame:(BOOL)a8 processingType:(unsigned int)a9;
- (int)doGainMapOnSingleFrameLuma:(id)a3 chroma:(id)a4 properties:(id)a5 output:(id)a6 outputHeadroom:(float *)a7 nrfPlist:(id)a8;
- (int)doGainMapOnSingleFrameWithFrameIndex:(unsigned int)a3 properties:(id)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7;
- (int)doHazeEstimation:(const FusionConfiguration *)a3 properties:(id *)a4 darkFrameMetadata:(id)a5 ev0FrameMetadata:(id)a6 applyCCM:(BOOL)a7;
- (int)downsampleUpperBandFrame:(id)a3 sourceFrameIndex:(int)a4;
- (int)extractLinearBufferWithConfig:(const FusionConfiguration *)a3 referenceFrameProperties:(id)a4 output:(__CVBuffer *)a5;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(id)a4;
- (int)freeInputBandPyramids;
- (int)fuseFramesWithConfig:(const FusionConfiguration *)a3 properties:(id *)a4 nrfPlist:(id)a5 batchN:(int)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 isLowLight:(BOOL)a9;
- (int)fusionReferenceFrame;
- (int)getSTFStillCorrectionStrength:(BOOL)a3;
- (int)nrfFusionDenseRegister:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(id)a5 ev0Properties:(id)a6;
- (int)selectNRFFusionReferenceFrame:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(id)a5 ev0Properties:(id)a6 nrfPlist:(id)a7;
- (int)setFusionMode:(int)a3;
- (int)setupHazeCorrectionTuningParameters:(id)a3;
- (int)startSFDWithInputSampleBuffer:(opaqueCMSampleBuffer *)a3 inputMetadata:(id)a4 outputImage:(id)a5 tuning:(id)a6;
- (int)toneMapAndDenoiseFusedFramesWithConfig:(const FusionConfiguration *)a3 properties:(id *)a4 nrfPlist:(id)a5 style:(id)a6 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a7 linearOutputMIWBAppliedMetadata:(id)a8 output:(__CVBuffer *)a9 inferenceProvider:(id)a10 colorCubeFixType:(int)a11 isLowLight:(BOOL)a12 gainMap:(id)a13;
- (int)toneMapBandFrame:(id)a3 properties:(id *)a4 sourceFrameType:(int)a5 sourceFrameIndex:(int)a6 ltcFrameIndex:(int)a7 gtcFrameIndex:(int)a8 nrfPlist:(id)a9;
- (int)waitForSFDToFinishWithFrameIndex:(unsigned int)a3 frameProperties:(id)a4;
- (uint64_t)extractLinearBufferWithLumaInput:(double)a3 chromaInput:(double)a4 inputIsLinear:(double)a5 removeChromaBias:(uint64_t)a6 lumaPedestal:(uint64_t)a7 exposureParams:(uint64_t)a8 ccm:(uint64_t)a9 output:(uint64_t)a10;
- (unint64_t)getBackgroundMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4;
- (unsigned)getSRLStatus;
- (unsigned)getSTFStillAnalyticsVersion;
- (void)dealloc;
- (void)prepareGainMapMetadata:(id)a3 hasFaces:(BOOL)a4;
- (void)releaseAllBindings;
- (void)releaseInputBindings;
- (void)releaseResources;
- (void)reset;
- (void)resetFusion:(unsigned int)a3;
- (void)setAllowModifyingInputBuffers:(BOOL)a3;
- (void)setDoGreenGhostMitigation:(BOOL)a3;
- (void)setFusionReferenceFrame:(int)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setSkipDenoising:(BOOL)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)setStfAllowed:(BOOL)a3;
- (void)swapInputFrame:(int)a3 withFrame:(int)a4;
@end

@implementation DenoiseFusePipeline

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  int v4 = +[WarpStage prewarmShaders:v3];
  v5 = [[DenoiseFusePipelineShaders alloc] initWithMetal:v3];
  if (!v5) {
    int v4 = -12786;
  }

  +[GreenGhostLowLightStage prewarmShaders:v3];
  +[ColorCubeCorrectionStage prewarmShaders:v3];
  +[BlinkDetectionStage prewarmShaders:v3];
  v6 = [[CMIPost alloc] initWithMetalContext:v3];

  return v4;
}

- (DenoiseFusePipeline)initWithContext:(id)a3 cameraInfo:(id)a4 nrfConfig:(id)a5 dasTuningOptions:(id)a6 toneMappingOptions:(id)a7 tuningParameters:(id)a8 deviceGeneration:(int)a9
{
  v193[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v143 = a4;
  v16 = a5;
  id v145 = a7;
  id v144 = a8;
  v179.receiver = self;
  v179.super_class = (Class)DenoiseFusePipeline;
  v17 = [(DenoiseFusePipeline *)&v179 init];
  v18 = v17;
  v140 = v16;
  if (!v17) {
    goto LABEL_148;
  }
  if (v16[61]) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v16[63] != 0;
  }
  v17->_deepFusionEnabled = v19;
  if (v16[61]) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v16[65] != 0;
  }
  v17->_ubFusionEnabled = v20;
  v17->_stfAllowed = 1;
  objc_storeStrong((id *)&v17->_metal, a3);
  p_nrfConfig = &v18->_nrfConfig;
  objc_storeStrong((id *)&v18->_nrfConfig, a5);
  v18->_deviceGeneratiouint64_t n = a9;
  v21 = +[DenoiseFusePipelineShared sharedInstance];
  uint64_t v22 = [v21 getShaders:v18->_metal];
  shaders = v18->_shaders;
  v18->_shaders = (DenoiseFusePipelineShaders *)v22;

  if (!v18->_shaders) {
    goto LABEL_146;
  }
  v18->_backgroundAllocatorForceSize = 0;
  v24 = [PyramidStage alloc];
  v192[0] = @"PyrGen.UseHW";
  v192[1] = @"PyrGen.SupportFP16";
  v193[0] = &unk_270E987B8;
  v193[1] = &unk_270E987D0;
  v25 = [NSDictionary dictionaryWithObjects:v193 forKeys:v192 count:2];
  uint64_t v26 = [(PyramidStage *)v24 initWithOptions:v25 context:v15];
  pyramidStage = v18->_pyramidStage;
  v18->_pyramidStage = (PyramidStage *)v26;

  if (!v18->_pyramidStage) {
    goto LABEL_147;
  }
  v28 = [[TextureUtils alloc] initWithMetalContext:v15];
  textureUtils = v18->_textureUtils;
  v18->_textureUtils = v28;

  if (!v18->_textureUtils) {
    goto LABEL_147;
  }
  v30 = [[ColorConvertStage alloc] initWithMetalContext:v15];
  colorConvertStage = v18->_colorConvertStage;
  v18->_colorConvertStage = v30;

  if (!v18->_colorConvertStage) {
    goto LABEL_147;
  }
  v141 = v18;
  id v142 = v15;
  v18->_doGreenGhostMitigatiouint64_t n = 0;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  obuint64_t j = v145;
  uint64_t v32 = [obj countByEnumeratingWithState:&v175 objects:v191 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    BOOL v34 = 0;
    uint64_t v149 = *(void *)v176;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v176 != v149) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v175 + 1) + 8 * i);
        if ((*p_nrfConfig)->_isOnlySingleImage)
        {
          if ((*p_nrfConfig)->_quadraSupportEnabled)
          {
            v190[0] = @"SingleImageParameters";
            v190[1] = @"SingleImageParametersForLearnedNR";
            v190[2] = @"SingleImageParametersForQuadraLearnedNR";
            v190[3] = @"SWFRParameters";
            v190[4] = @"SWFRQuadraParameters";
            v190[5] = @"SingleImageParametersForStereoPhotoQuadraLearnedNR";
            v37 = (void *)MEMORY[0x263EFF8C0];
            v38 = v190;
            uint64_t v39 = 6;
          }
          else
          {
            v189[0] = @"SingleImageParameters";
            v189[1] = @"SingleImageParametersForLearnedNR";
            v189[2] = @"SWFRParameters";
            v189[3] = @"SingleImageParametersForStereoPhotoLearnedNR";
            v37 = (void *)MEMORY[0x263EFF8C0];
            v38 = v189;
            uint64_t v39 = 4;
          }
        }
        else if ((*p_nrfConfig)->_quadraSupportEnabled)
        {
          v188[0] = @"SingleImageParameters";
          v188[1] = @"SingleImageParametersForStereoPhotoQuadraLearnedNR";
          v188[2] = @"SingleImageQuadraParameters";
          v188[3] = @"DefaultUBModeParameters";
          v188[4] = @"DefaultUBModeQuadraParameters";
          v188[5] = @"ToneMappedUBParameters";
          v188[6] = @"ToneMappedUBQuadraParameters";
          v188[7] = @"SWFRParameters";
          v188[8] = @"SWFRQuadraParameters";
          v37 = (void *)MEMORY[0x263EFF8C0];
          v38 = v188;
          uint64_t v39 = 9;
        }
        else
        {
          v187[0] = @"SingleImageParameters";
          v187[1] = @"SingleImageParametersForStereoPhotoLearnedNR";
          v187[2] = @"DefaultUBModeParameters";
          v187[3] = @"ToneMappedUBParameters";
          v187[4] = @"SWFRParameters";
          v37 = (void *)MEMORY[0x263EFF8C0];
          v38 = v187;
          uint64_t v39 = 5;
        }
        v40 = [v37 arrayWithObjects:v38 count:v39];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v41 = v40;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v171 objects:v186 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v172;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v172 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = [v36 objectForKeyedSubscript:*(void *)(*((void *)&v171 + 1) + 8 * j)];
              if (v46) {
                BOOL v34 = (v46[72] | v34) != 0;
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v171 objects:v186 count:16];
          }
          while (v43);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v175 objects:v191 count:16];
    }
    while (v33);
  }
  else
  {
    BOOL v34 = 0;
  }

  v47 = objc_alloc_init(FusionInputBands);
  inputBands = v18->_inputBands;
  v18->_inputBands = v47;

  fusedBand = v18->_fusedBand;
  v18->_fusedBand = 0;

  accWeightPyramid = v18->_accWeightPyramid;
  v18->_accWeightPyramid = 0;

  v51 = [[OutliersRemovalStage alloc] initWithMetalContext:v18->_metal];
  outliersRemovalStage = v18->_outliersRemovalStage;
  v18->_outliersRemovalStage = v51;

  id v15 = v142;
  if (!v18->_nrfConfig->_isOnlySingleImage)
  {
    v53 = [[WarpStage alloc] initWarpStage:v18->_metal];
    warpStage = v18->_warpStage;
    v18->_warpStage = v53;

    if (!v18->_warpStage) {
      goto LABEL_144;
    }
    v55 = [[FusionRemixStage alloc] initBandFusion:v18->_metal nrfConfig:v18->_nrfConfig isPrewarm:0];
    fusionRemixStage = v18->_fusionRemixStage;
    v18->_fusionRemixStage = v55;

    if (!v18->_fusionRemixStage) {
      goto LABEL_144;
    }
    v57 = [[MotionDetection alloc] initWithMetalContext:v18->_metal];
    motionDetectiouint64_t n = v18->_motionDetection;
    v18->_motionDetectiouint64_t n = v57;

    if (!v18->_motionDetection) {
      goto LABEL_146;
    }
    v59 = [[GrayGhostDetection alloc] initWithMetalContext:v18->_metal];
    grayGhostDetectiouint64_t n = v18->_grayGhostDetection;
    v18->_grayGhostDetectiouint64_t n = v59;

    if (!v18->_grayGhostDetection) {
      goto LABEL_146;
    }
    v61 = [[BlinkDetectionStage alloc] init:v18->_metal];
    blinkDetectionStage = v18->_blinkDetectionStage;
    v18->_blinkDetectionStage = v61;

    if (!v18->_blinkDetectionStage)
    {
LABEL_144:
      FigDebugAssert3();
      goto LABEL_147;
    }
    if (v34 || (*p_nrfConfig)->_enableBilateralGridForHybridRegistration)
    {
      v63 = [[BilateralGrid alloc] initWithContext:v18->_metal];
      bilateralGrid = v18->_bilateralGrid;
      v18->_bilateralGrid = v63;

      if (!v18->_bilateralGrid) {
        goto LABEL_146;
      }
    }
    v65 = [[RegDense alloc] initWithMetalContext:v18->_metal];
    regDense = v18->_regDense;
    v18->_regDense = v65;

    if (!v18->_regDense) {
      goto LABEL_146;
    }
  }
  v67 = [[CMIPost alloc] initWithMetalContext:v18->_metal];
  post = v18->_post;
  v18->_post = v67;

  if (!v18->_post) {
    goto LABEL_108;
  }
  v69 = [SoftLTM alloc];
  v70 = [(FigMetalContext *)v18->_metal commandQueue];
  uint64_t v71 = [(SoftLTM *)v69 initWithCommandQueue:v70];
  softLTMStage = v18->_softLTMStage;
  v18->_softLTMStage = (SoftLTM *)v71;

  if (!v18->_softLTMStage)
  {
LABEL_108:
    unsigned int v170 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT);
    goto LABEL_138;
  }
  nrfConfig = *p_nrfConfig;
  if ((*p_nrfConfig)->_enableMIWB)
  {
    [(CMIPost *)v18->_post setupMIWB:v144];
    nrfConfig = v18->_nrfConfig;
  }
  if (!nrfConfig->_enableSTF) {
    goto LABEL_71;
  }
  v74 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v74)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_115:

LABEL_148:
    v129 = 0;
    goto LABEL_149;
  }
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v147 = obj;
  uint64_t v151 = [v147 countByEnumeratingWithState:&v165 objects:v183 count:16];
  if (v151)
  {
    uint64_t v75 = 0;
    uint64_t v148 = *(void *)v166;
    v150 = v74;
    do
    {
      for (uint64_t k = 0; k != v151; ++k)
      {
        if (*(void *)v166 != v148) {
          objc_enumerationMutation(v147);
        }
        v77 = *(void **)(*((void *)&v165 + 1) + 8 * k);
        v78 = [MEMORY[0x263EFF9A0] dictionary];
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        id v79 = v77;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v161 objects:v182 count:16];
        if (v80)
        {
          uint64_t v81 = v80;
          uint64_t v82 = *(void *)v162;
          do
          {
            for (uint64_t m = 0; m != v81; ++m)
            {
              if (*(void *)v162 != v82) {
                objc_enumerationMutation(v79);
              }
              uint64_t v84 = *(void *)(*((void *)&v161 + 1) + 8 * m);
              v85 = [v79 objectForKeyedSubscript:v84];
              uint64_t v86 = v85[15];
              if (v86) {
                [v78 setObject:v86 forKey:v84];
              }
            }
            uint64_t v81 = [v79 countByEnumeratingWithState:&v161 objects:v182 count:16];
          }
          while (v81);
        }

        v87 = [NSNumber numberWithInt:v75];
        v74 = v150;
        [v150 setObject:v78 forKey:v87];

        uint64_t v75 = (v75 + 1);
      }
      uint64_t v151 = [v147 countByEnumeratingWithState:&v165 objects:v183 count:16];
    }
    while (v151);
  }

  v18 = v141;
  id v15 = v142;
  if ([(CMIPost *)v141->_post setupSTFProcessor:v74]) {
    goto LABEL_115;
  }

LABEL_71:
  v88 = [[ColorCubeCorrectionStage alloc] init:v15];
  ColorCubeCorrectionStage = v18->_ColorCubeCorrectionStage;
  v18->_ColorCubeCorrectionStage = v88;

  if (!v18->_ColorCubeCorrectionStage) {
    goto LABEL_139;
  }
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v90 = obj;
  uint64_t v91 = [v90 countByEnumeratingWithState:&v157 objects:v181 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = 0;
    uint64_t v94 = *(void *)v158;
    do
    {
      for (uint64_t n = 0; n != v92; ++n)
      {
        if (*(void *)v158 != v94) {
          objc_enumerationMutation(v90);
        }
        v96 = *(void **)(*((void *)&v157 + 1) + 8 * n);
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        id v97 = v96;
        uint64_t v98 = [v97 countByEnumeratingWithState:&v153 objects:v180 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          uint64_t v100 = *(void *)v154;
          while (2)
          {
            for (iuint64_t i = 0; ii != v99; ++ii)
            {
              if (*(void *)v154 != v100) {
                objc_enumerationMutation(v97);
              }
              v102 = [v97 objectForKeyedSubscript:*(void *)(*((void *)&v153 + 1) + 8 * ii)];
              if (v102)
              {
                uint64_t v93 = v102[41];

                goto LABEL_87;
              }
            }
            uint64_t v99 = [v97 countByEnumeratingWithState:&v153 objects:v180 count:16];
            if (v99) {
              continue;
            }
            break;
          }
        }
LABEL_87:
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v157 objects:v181 count:16];
    }
    while (v92);
  }
  else
  {
    uint64_t v93 = 0;
  }

  v18 = v141;
  if ([v141->_ColorCubeCorrectionStage setMaskedSkyCubeVersion:v93])
  {
    FigDebugAssert3();
    v129 = 0;
    id v15 = v142;
    goto LABEL_149;
  }
  v103 = *p_nrfConfig;
  id v15 = v142;
  if ((*p_nrfConfig)->_enableGainMap)
  {
    v104 = [[GainMapStage alloc] initWithMetalContext:v142];
    gainMapStage = v141->_gainMapStage;
    v141->_gainMapStage = v104;

    if (!v141->_gainMapStage) {
      goto LABEL_139;
    }
    v103 = *p_nrfConfig;
  }
  if ((v103->_greenGhostMitigationType & 2) == 0) {
    goto LABEL_99;
  }
  v106 = [[GreenGhostLowLightStage alloc] initWithMetalContext:v142];
  greenGhostLowLightStage = v141->_greenGhostLowLightStage;
  v141->_greenGhostLowLightStage = v106;

  if (!v141->_greenGhostLowLightStage
    || (uint64_t v108 = objc_opt_new(),
        greenGhostBuffers = v141->_greenGhostBuffers,
        v141->_greenGhostBuffers = (GreenGhostBuffers *)v108,
        greenGhostBuffers,
        !v141->_greenGhostBuffers))
  {
LABEL_139:
    FigDebugAssert3();
    goto LABEL_148;
  }
  v103 = *p_nrfConfig;
LABEL_99:
  if (v103->_learnedNRProcessingTypeEnabled)
  {
    id v110 = objc_alloc(MEMORY[0x263F2EE30]);
    metal = v141->_metal;
    v112 = [(FigMetalContext *)metal device];
    v113 = (void *)[v112 newCommandQueue];
    uint64_t v114 = [v110 initWithFigMetalContext:metal andOptionalCommandQueue:v113];
    backgroundMetal = v141->_backgroundMetal;
    v141->_backgroundMetal = (FigMetalContext *)v114;

    v116 = v141->_backgroundMetal;
    if (v116)
    {
      [(FigMetalContext *)v116 setAllocator:0];
      v117 = [[NRFConcurrentProcessing alloc] initWithContext:v141->_metal backgroundContext:v141->_backgroundMetal doConcurrent:1];
      concurrentProcessing = v141->_concurrentProcessing;
      v141->_concurrentProcessing = v117;

      if (v141->_concurrentProcessing)
      {
        v119 = [[NRFBackgroundLearnedNR alloc] initWithContext:v141->_backgroundMetal cameraInfo:v143 isQuadra:0 deviceGeneration:v141->_deviceGeneration];
        backgroundLearnedNR = v141->_backgroundLearnedNR;
        v141->_backgroundLearnedNR = v119;

        if (v141->_backgroundLearnedNR)
        {
          id v121 = objc_alloc(MEMORY[0x263F2EE10]);
          v122 = [(FigMetalContext *)v141->_backgroundMetal device];
          v123 = (void *)[v121 initWithDevice:v122 allocatorType:2];
          [(FigMetalContext *)v141->_backgroundMetal setAllocator:v123];

          v124 = [(FigMetalContext *)v141->_backgroundMetal allocator];

          if (v124) {
            goto LABEL_104;
          }
          unsigned int v170 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v137 = v170;
          if (os_log_type_enabled(v130, type)) {
            unsigned int v138 = v137;
          }
          else {
            unsigned int v138 = v137 & 0xFFFFFFFE;
          }
          if (!v138) {
            goto LABEL_138;
          }
          int v184 = 136315138;
          v185 = "-[DenoiseFusePipeline initWithContext:cameraInfo:nrfConfig:dasTuningOptions:toneMappingOptions:tuningPa"
                 "rameters:deviceGeneration:]";
        }
        else
        {
          unsigned int v170 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v135 = v170;
          if (os_log_type_enabled(v130, type)) {
            unsigned int v136 = v135;
          }
          else {
            unsigned int v136 = v135 & 0xFFFFFFFE;
          }
          if (!v136) {
            goto LABEL_138;
          }
          int v184 = 136315138;
          v185 = "-[DenoiseFusePipeline initWithContext:cameraInfo:nrfConfig:dasTuningOptions:toneMappingOptions:tuningPa"
                 "rameters:deviceGeneration:]";
        }
      }
      else
      {
        unsigned int v170 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v133 = v170;
        if (os_log_type_enabled(v130, type)) {
          unsigned int v134 = v133;
        }
        else {
          unsigned int v134 = v133 & 0xFFFFFFFE;
        }
        if (!v134) {
          goto LABEL_138;
        }
        int v184 = 136315138;
        v185 = "-[DenoiseFusePipeline initWithContext:cameraInfo:nrfConfig:dasTuningOptions:toneMappingOptions:tuningPara"
               "meters:deviceGeneration:]";
      }
    }
    else
    {
      unsigned int v170 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v131 = v170;
      if (os_log_type_enabled(v130, type)) {
        unsigned int v132 = v131;
      }
      else {
        unsigned int v132 = v131 & 0xFFFFFFFE;
      }
      if (!v132) {
        goto LABEL_138;
      }
      int v184 = 136315138;
      v185 = "-[DenoiseFusePipeline initWithContext:cameraInfo:nrfConfig:dasTuningOptions:toneMappingOptions:tuningParame"
             "ters:deviceGeneration:]";
    }
    _os_log_send_and_compose_impl();
LABEL_138:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_148;
  }
LABEL_104:
  v125 = objc_alloc_init(FusionBuffers);
  fusionBuffers = v141->_fusionBuffers;
  v141->_fusionBuffers = v125;

  if (!v141->_fusionBuffers
    || (v141->_currentFrame = 0,
        v141->_isStaticScene = 0,
        v141->_fusionReferenceFrame = 0,
        uint64_t v127 = objc_opt_new(),
        v128 = v141->_fusedBand,
        v141->_fusedBand = (PyramidStorage *)v127,
        v128,
        !v141->_fusedBand))
  {
LABEL_146:
    FigDebugAssert3();
LABEL_147:
    FigSignalErrorAt();
    goto LABEL_148;
  }
  v129 = v141;
LABEL_149:

  return v129;
}

- (void)dealloc
{
  [(DenoiseFusePipeline *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)DenoiseFusePipeline;
  [(DenoiseFusePipeline *)&v3 dealloc];
}

- (void)reset
{
  if (!self->_nrfConfig->_isOnlySingleImage) {
    [(RegDense *)self->_regDense reset];
  }
  self->_isStaticScene = 0;
  self->_currentFrame = 0;
}

- (void)releaseResources
{
  [(FigMetalContext *)self->_metal waitForIdle];
  [(DenoiseFusePipeline *)self releaseAllBindings];
  [(BilateralGrid *)self->_bilateralGrid releaseTextures];
  accWeightPyramid = self->_accWeightPyramid;
  self->_accWeightPyramid = 0;
}

- (void)releaseAllBindings
{
  [(DenoiseFusePipeline *)self reset];
  [(GreenGhostLowLightStage *)self->_greenGhostLowLightStage reset];
  +[PyramidStorage makePyramidAliasable:self->_fusedBand metal:self->_metal];
  +[PyramidStorage makePyramidAliasable:self->_accWeightPyramid metal:self->_metal];
  if (self->_fusionBuffers)
  {
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    if (self->_fusionBuffers) {
      FigMetalDecRef();
    }
  }
  if (self->_greenGhostBuffers)
  {
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
  }
  [(MotionDetection *)self->_motionDetection releaseResources];
  uint64_t v3 = 0;
  inputChroma = self->_inputChroma;
  do
  {
    inputBands = self->_inputBands;
    if (inputBands)
    {
      +[PyramidStorage makePyramidAliasable:inputBands->bands[v3] metal:self->_metal releaseBand0:1];
      [(PyramidStorage *)self->_inputBands->bands[v3] releaseBuffers];
    }
    v6 = &inputChroma[v3];
    v7 = inputChroma[v3 - 5];
    inputChroma[v3 - 5] = 0;

    v8 = inputChroma[v3];
    CMIPost *v6 = 0;

    v9 = inputChroma[v3 + 5];
    v6[5] = 0;

    ++v3;
  }
  while (v3 != 5);
}

- (void)releaseInputBindings
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    inputBands = self->_inputBands;
    if (inputBands) {
      [(PyramidStorage *)inputBands->bands[i] clearLevel:0];
    }
    v5 = (char *)self + i * 8;
    v6 = self->_inputLuma[i];
    self->_inputLuma[i] = 0;

    v7 = self->_inputChroma[i];
    *((void *)v5 + 8) = 0;

    v8 = self->_inputYCbCr[i];
    *((void *)v5 + 13) = 0;
  }
}

- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return [(DenoiseFusePipeline *)self allocateCoallesedFusionInputPyramidsForWidth:a3 height:a4 levels:4 frames:4];
}

- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4 levels:(int)a5 frames:(int)a6
{
  if (a6 >= 1)
  {
    for (uint64_t i = 0; i != a6; ++i)
      self->_inputBands->bands[i]->levels = a5;
  }
  v10 = [(FigMetalContext *)self->_metal allocator];
  v11 = (void *)[v10 newTextureDescriptor];

  if (!v11)
  {
LABEL_18:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_19;
  }
  v12 = [v11 desc];
  [v12 setUsage:7];

  if (a5 >= 2)
  {
    uint64_t v13 = 8 * a6;
    uint64_t v14 = 1;
    while ((a3 & 2) == 0 && (a4 & 2) == 0)
    {
      unint64_t v34 = a3;
      if (a6 >= 1)
      {
        unint64_t v15 = 0;
        while (1)
        {
          [v11 setLabel:0];
          v16 = [v11 desc];
          [v16 setWidth:(v34 >> 1)];

          v17 = [v11 desc];
          [v17 setHeight:(a4 >> 1)];

          v18 = [v11 desc];
          [v18 setPixelFormat:25];

          BOOL v19 = [(FigMetalContext *)self->_metal allocator];
          uint64_t v20 = [v19 newTextureWithDescriptor:v11];
          textureY = self->_inputBands->bands[v15 / 8]->textureY;
          uint64_t v22 = textureY[v14];
          textureY[v14] = (MTLTexture *)v20;

          if (!self->_inputBands->bands[v15 / 8]->textureY[v14]) {
            goto LABEL_18;
          }
          v15 += 8;
          if (v13 == v15)
          {
            unint64_t v23 = 0;
            while (1)
            {
              [v11 setLabel:0];
              v24 = [v11 desc];
              [v24 setWidth:(v34 >> 2) & 0x7FFFFFFF];

              v25 = [v11 desc];
              [v25 setHeight:(a4 >> 2) & 0x7FFFFFFF];

              uint64_t v26 = [v11 desc];
              [v26 setPixelFormat:65];

              v27 = [(FigMetalContext *)self->_metal allocator];
              uint64_t v28 = [v27 newTextureWithDescriptor:v11];
              textureUV = self->_inputBands->bands[v23 / 8]->textureUV;
              v30 = textureUV[v14];
              textureUV[v14] = (MTLTexture *)v28;

              v31 = self->_inputBands->bands[v23 / 8];
              if (!v31->textureUV[v14]) {
                goto LABEL_18;
              }
              v31->isFP16[v14] = 1;
              v23 += 8;
              if (v13 == v23) {
                goto LABEL_16;
              }
            }
          }
        }
      }
LABEL_16:
      a4 >>= 1;
      a3 = v34 >> 1;
      if (++v14 == a5) {
        goto LABEL_19;
      }
    }
    goto LABEL_18;
  }
LABEL_19:

  return 0;
}

- (unint64_t)getBackgroundMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4
{
  unint64_t result = self->_backgroundAllocatorForceSize;
  if (!result) {
    return (unint64_t)(float)(ceilf((float)(a4 * a3) / 12773000.0) * 10.0) << 20;
  }
  return result;
}

- (int)allocateResourcesIfNeededForDesc:(id)a3 didAllocate:(BOOL *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = [v7 width];
  int v9 = [v7 height];
  v10 = (_DWORD *)MEMORY[0x263F00E10];
  if (((v8 | v9) & 0xF) != 0)
  {
    uint64_t v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_32;
  }
  unint64_t v11 = v9;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if ([v7 processingType] == 7)
  {
    unint64_t v12 = [(DenoiseFusePipeline *)self getBackgroundMetalHeapSizeWithOutputWidth:v8 withOutputHeight:v11];
    backgroundMetal = self->_backgroundMetal;
    if (!backgroundMetal)
    {
      v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v19 = -73380;
      goto LABEL_38;
    }
    uint64_t v14 = [(FigMetalContext *)backgroundMetal allocator];
    unint64_t v15 = [v14 memSize];

    if (v15 < v12)
    {
      v16 = objc_opt_new();
      v17 = v16;
      if (v16)
      {
        [v16 setMemSize:v12];
        [v17 setWireMemory:1];
        [v17 setLabel:@"NRFLearnedNRBackground"];
        v18 = [(FigMetalContext *)self->_backgroundMetal allocator];
        int v19 = [v18 setupWithDescriptor:v17];

        if (!v19)
        {

          goto LABEL_10;
        }
        uint64_t v32 = v4;
        LODWORD(v31) = v19;
        FigDebugAssert3();
        FigSignalErrorAt();
      }
      else
      {
        v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        int v19 = -73380;
      }

      goto LABEL_38;
    }
  }
LABEL_10:
  if (self->_lastWidth == v8 && self->_lastHeight == v11)
  {
    unsigned int lastPixelFormat = self->_lastPixelFormat;
    if (lastPixelFormat == [v7 pixelFormat])
    {
      BOOL v21 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v22 = objc_opt_new();
  unint64_t v23 = v22;
  if (!v22)
  {
    uint64_t v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_31;
  }
  [v22 setUsage:7];
  [(DenoiseFusePipeline *)self releaseResources];
  nrfConfig = self->_nrfConfig;
  if (!nrfConfig->_isOnlySingleImage)
  {
    bilateralGrid = self->_bilateralGrid;
    if (bilateralGrid)
    {
      if (nrfConfig->_enableBilateralGridForHybridRegistration)
      {
        uint64_t v34 = 0;
        long long v33 = xmmword_263480C90;
        int v27 = [(BilateralGrid *)bilateralGrid setupWithConfig:&v33 width:(unint64_t)v8 >> 3 height:v11 >> 3];
        if (v27)
        {
          int v19 = v27;
          uint64_t v32 = v4;
          LODWORD(v31) = v27;
LABEL_28:
          FigDebugAssert3();
LABEL_31:

LABEL_32:
          if (!v19) {
            goto LABEL_19;
          }
LABEL_38:
          [(DenoiseFusePipeline *)self releaseResources];
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v34 = 0;
        long long v33 = xmmword_263480CA8;
        int v28 = [(BilateralGrid *)bilateralGrid setupWithConfig:&v33 width:v8 height:v11];
        if (v28)
        {
          int v19 = v28;
          uint64_t v32 = v4;
          LODWORD(v31) = v28;
          goto LABEL_28;
        }
      }
    }
  }
  self->_lastWidth = v8;
  self->_lastHeight = v11;
  self->_unsigned int lastPixelFormat = [v7 pixelFormat];

  BOOL v21 = 1;
LABEL_17:
  int v19 = 0;
  if (a4) {
    *a4 = v21;
  }
LABEL_19:
  if (*v10 == 1) {
    kdebug_trace();
  }

  return v19;
}

- (int)setFusionMode:(int)a3
{
  self->_fusionAlgo = a3;
  return 0;
}

- (void)setSidecarWriter:(id)a3
{
  id v4 = a3;
  obuint64_t j = v4;
  if (!self->_nrfConfig->_isOnlySingleImage)
  {
    [(FusionRemixStage *)self->_fusionRemixStage setSidecarWriter:v4];
    id v4 = obj;
  }
  [(GreenGhostLowLightStage *)self->_greenGhostLowLightStage setSidecarWriter:v4];
  objc_storeWeak((id *)&self->_sidecarWriter, obj);
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(id)a4
{
  id v6 = a4;
  if ([v6 contentExtended])
  {
    int v7 = 0;
  }
  else
  {
    unsigned __int8 v13 = 0;
    double v12 = 0.0;
    textureUtils = self->_textureUtils;
    int v9 = [v6 meta];
    int v7 = -[TextureUtils fillPaddedAreaInFrame:roi:contentExtended:extendedDimensions:](textureUtils, "fillPaddedAreaInFrame:roi:contentExtended:extendedDimensions:", a3, [v9 ROI], &v13, &v12);

    if (!v7)
    {
      [v6 setContentExtended:v13];
      if (v13) {
        double v10 = v12;
      }
      else {
        [v6 extendedDimensions];
      }
      [v6 setExtendedDimensions:v10];
    }
  }

  return v7;
}

- (int)waitForSFDToFinishWithFrameIndex:(unsigned int)a3 frameProperties:(id)a4
{
  id v6 = a4;
  concurrentProcessing = self->_concurrentProcessing;
  if (concurrentProcessing)
  {
    int v8 = [(NRFConcurrentProcessing *)concurrentProcessing waitForBackgroundTaskToComplete:self->_backgroundLearnedNR];
    if (v8)
    {
      int v9 = v8;
    }
    else
    {
      int v9 = [(DenoiseFusePipeline *)self createPyramidForFrame:self->_inputBands->bands[a3] cfp:v6];
      if (v9)
      {
        double v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  else
  {
    unint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v9 = -73372;
  }

  return v9;
}

- (int)startSFDWithInputSampleBuffer:(opaqueCMSampleBuffer *)a3 inputMetadata:(id)a4 outputImage:(id)a5 tuning:(id)a6
{
  id v10 = a4;
  unint64_t v11 = a5;
  id v12 = a6;
  unsigned __int8 v13 = v12;
  if (!a3 || !v10) {
    goto LABEL_15;
  }
  if (!v11)
  {
    unint64_t v23 = 0;
    unint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
LABEL_16:
    int v27 = -73375;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_10;
  }
  if (!v12
    || !self->_concurrentProcessing
    || ([(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:CMSampleBufferGetImageBuffer(a3) pixelFormat:25 usage:7 plane:0 widthAlignmentFactor:1 heightAlignmentFactor:1], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_15:
    unint64_t v23 = v11;
    unint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    goto LABEL_16;
  }
  unint64_t v15 = v14;
  v29 = v13;
  v16 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF60], 0);
  v17 = CMGetAttachment(v16, (CFStringRef)*MEMORY[0x263F2EF68], 0);
  if (!v17)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    unsigned __int8 v13 = v29;
LABEL_19:

    goto LABEL_11;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  int v19 = (void *)CVBufferCopyAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x263F04238], 0);
  uint64_t v20 = v11[2];
  id v21 = v10;
  backgroundLearnedNR = self->_backgroundLearnedNR;
  unint64_t v23 = v11;
  uint64_t v24 = v11[3];
  CVImageBufferRef v25 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v16);
  unsigned __int8 v13 = v29;
  uint64_t v26 = backgroundLearnedNR;
  id v10 = v21;
  int v27 = [(NRFBackgroundLearnedNR *)v26 setupLearnedNRTaskWithInpuFrameBaseTex:v15 outLumaTex:v20 outChromaTex:v24 metadata:v21 bayerPattern:v19 lscGainMapBuffer:v25 lscGainMapParameters:v17 tuning:v29];

  if (v27)
  {
    unint64_t v11 = v23;
    goto LABEL_19;
  }

  int v27 = [(NRFConcurrentProcessing *)self->_concurrentProcessing startBackgroundTask:self->_backgroundLearnedNR];
LABEL_10:

  unint64_t v11 = v23;
LABEL_11:

  return v27;
}

- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 input:(__CVBuffer *)a7 noiseMap:(__CVBuffer *)a8 cfp:(id)a9 nrfPlist:(id)a10 style:(id)a11 inferenceProvider:(id)a12 defringeEnabled:(BOOL)a13 colorCubeFixType:(int)a14 isLowLight:(BOOL)a15
{
  id v42 = a6;
  id v41 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v43 = 0;
  unint64_t v22 = +[LumaChromaImage getMetalLumaFormat:a7];
  unint64_t v23 = +[LumaChromaImage getMetalChromaFormat:a7];
  unint64_t v24 = +[LumaChromaImage getMetalYCbCrFormat:a7];
  if (v24)
  {
    int v25 = +[LumaChromaImage bindYCbCrMetalTextureWithMetalContext:self->_metal pixelBuffer:a7 pixelFormat:v24 textureToBind:&v43 alignmentFactor:16];
    if (v25) {
      goto LABEL_8;
    }
  }
  uint64_t v26 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a7 pixelFormat:v22 usage:1 plane:0 alignmentFactor:16];
  if (!v26)
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
LABEL_8:
    int v34 = v25;
LABEL_10:
    uint64_t v31 = v19;
    uint64_t v32 = v41;
    long long v33 = v42;
    goto LABEL_6;
  }
  int v27 = (void *)v26;
  uint64_t v28 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a7 pixelFormat:v23 usage:1 plane:1 alignmentFactor:8];
  if (!v28)
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();

    goto LABEL_10;
  }
  v29 = (void *)v28;
  LOBYTE(v38) = a15;
  HIDWORD(v37) = a14;
  LOBYTE(v37) = a13;
  id v36 = v19;
  v30 = a5;
  uint64_t v31 = v19;
  uint64_t v32 = v41;
  long long v33 = v42;
  int v34 = -[DenoiseFusePipeline denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputLuma:inputChroma:inputYCbCr:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:](self, "denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputLuma:inputChroma:inputYCbCr:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:", a3, a4, v30, v42, v27, v28, v43, a8, v41, v36, v20, v21, v37, v38);

LABEL_6:
  return v34;
}

- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 inputFrameIndex:(unsigned int)a7 noiseMap:(__CVBuffer *)a8 cfp:(id)a9 nrfPlist:(id)a10 style:(id)a11 inferenceProvider:(id)a12 defringeEnabled:(BOOL)a13 colorCubeFixType:(int)a14 isLowLight:(BOOL)a15
{
  id v19 = self->_inputBands->bands[a7];
  LOBYTE(v24) = a15;
  HIDWORD(v23) = a14;
  LOBYTE(v23) = a13;
  int v20 = -[DenoiseFusePipeline denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputLuma:inputChroma:inputYCbCr:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:](self, "denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputLuma:inputChroma:inputYCbCr:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:", a3, a4, a5, a6, v19->textureY[0], v19->textureUV[0], v19->textureYCbCrBand0, a8, a9, a10, a11, a12, v23, v24);
  if (v20)
  {
    unint64_t v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v20;
}

- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a5 linearOutputMIWBAppliedMetadata:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 inputYCbCr:(id)a9 noiseMap:(__CVBuffer *)a10 cfp:(id)a11 nrfPlist:(id)a12 style:(id)a13 inferenceProvider:(id)a14 defringeEnabled:(BOOL)a15 colorCubeFixType:(int)a16 isLowLight:(BOOL)a17
{
  v144[16] = *(id *)MEMORY[0x263EF8340];
  id v133 = a6;
  id v141 = a7;
  id v140 = a8;
  id v132 = a9;
  id v22 = a11;
  uint64_t v23 = a12;
  id v135 = a13;
  id v24 = a14;
  unint64_t v25 = +[LumaChromaImage getMetalLumaFormat:a3];
  unint64_t v26 = +[LumaChromaImage getMetalChromaFormat:a3];
  int v27 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v25 usage:7 plane:0 alignmentFactor:16];
  v130 = v24;
  unsigned int v131 = v22;
  if (!v27
    || ([(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v26 usage:7 plane:1 alignmentFactor:8], (uint64_t v134 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    id v41 = 0;
    id v24 = 0;
    uint64_t v39 = 0;
    id v40 = 0;
    unsigned int v136 = 0;
    unsigned int v137 = 0;
    uint64_t v37 = 0;
    uint64_t v28 = v141;
    goto LABEL_63;
  }
  uint64_t v28 = v141;
  if (([v141 width] & 0xF) != 0
    || ([v141 height] & 0xF) != 0
    || ([v27 width] & 0xF) != 0
    || ([v27 height] & 0xF) != 0)
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    id v41 = 0;
    id v24 = 0;
    uint64_t v39 = 0;
    id v40 = 0;
    unsigned int v136 = 0;
    unsigned int v137 = 0;
LABEL_71:
    uint64_t v37 = (void *)v134;
    goto LABEL_63;
  }
  unsigned int v138 = v23;
  if (!a10)
  {
    unsigned int v136 = 0;
    unsigned int v137 = 0;
    if (!v24) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v29 = v27;
  unint64_t v30 = +[LumaChromaImage getMetalLumaFormat:a10];
  unint64_t v31 = +[LumaChromaImage getMetalChromaFormat:a10];
  unsigned int v137 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a10 pixelFormat:v30 usage:1 plane:0 alignmentFactor:16];
  if (!v137)
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    id v41 = 0;
    id v24 = 0;
    uint64_t v39 = 0;
    id v40 = 0;
    unsigned int v136 = 0;
    unsigned int v137 = 0;
    int v27 = v29;
LABEL_68:
    uint64_t v37 = (void *)v134;
    uint64_t v28 = v141;
    goto LABEL_63;
  }
  [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a10 pixelFormat:v31 usage:1 plane:1 alignmentFactor:8];
  unsigned int v136 = v27 = v29;
  if (!v136)
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    id v41 = 0;
    id v24 = 0;
    uint64_t v39 = 0;
    id v40 = 0;
    unsigned int v136 = 0;
    goto LABEL_68;
  }
  uint64_t v28 = v141;
  if (!v24) {
    goto LABEL_14;
  }
LABEL_13:
  id v24 = [(DenoiseFusePipeline *)self _runInferenceProvider:v24];
  if (!v24)
  {
    FigDebugAssert3();
LABEL_70:
    int v38 = FigSignalErrorAt();
    id v41 = 0;
    uint64_t v39 = 0;
    id v40 = 0;
    goto LABEL_71;
  }
LABEL_14:
  int v32 = [v22 inputColorSpace];
  if (a4 && v32 != 2) {
    goto LABEL_70;
  }
  v139 = [v22 meta];
  int v33 = [v22 inputColorSpace];
  int v34 = v33;
  BOOL skipDenoising = self->_skipDenoising;
  if (v33 == 2 || !self->_skipDenoising)
  {
    if (v33 != 2)
    {
      id v127 = 0;
      id v128 = 0;
      goto LABEL_34;
    }
    id v42 = [(FigMetalContext *)self->_metal allocator];
    id v43 = (void *)[v42 newTextureDescriptor];

    if (v43)
    {
      v126 = a4;
      uint64_t v44 = [v43 desc];
      [v44 setUsage:7];

      uint64_t v45 = [v141 width];
      v46 = [v43 desc];
      [v46 setWidth:v45];

      uint64_t v47 = [v141 height];
      v48 = [v43 desc];
      [v48 setHeight:v47];

      v49 = [v43 desc];
      [v49 setPixelFormat:25];

      [v43 setLabel:0];
      v50 = [(FigMetalContext *)self->_metal allocator];
      id v40 = (id)[v50 newTextureWithDescriptor:v43];

      if (v40)
      {
        v51 = [v43 desc];
        objc_msgSend(v51, "setWidth:", (unint64_t)objc_msgSend(v51, "width") >> 1);

        v52 = [v43 desc];
        objc_msgSend(v52, "setHeight:", (unint64_t)objc_msgSend(v52, "height") >> 1);

        v53 = [v43 desc];
        [v53 setPixelFormat:65];

        [v43 setLabel:0];
        v54 = [(FigMetalContext *)self->_metal allocator];
        v55 = (void *)[v54 newTextureWithDescriptor:v43];

        if (v55)
        {
          int v56 = *(unsigned __int8 *)([v22 colorSpaceConversionParameters] + 199);
          v57 = v22;
          colorConvertStage = self->_colorConvertStage;
          uint64_t v59 = [v57 colorSpaceConversionParameters];
          if (v56) {
            int v60 = [(ColorConvertStage *)colorConvertStage convertColor:v59 hazeCorrection:v132 inputYCbCr:v40 outputLuma:v55 outputChroma:0.0];
          }
          else {
            int v60 = [(ColorConvertStage *)colorConvertStage convertColor:v59 hazeCorrection:v141 inputLuma:v140 inputChroma:v40 outputLuma:v55 outputChroma:0.0];
          }
          int v38 = v60;
          uint64_t v23 = v138;
          if (v60)
          {
            id v128 = v55;
            uint64_t v28 = v141;
          }
          else
          {
            id v40 = v40;

            id v61 = v55;
            id v128 = v61;
            if (!v126
              || (v62 = self->_colorConvertStage,
                  long long v142 = *(_OWORD *)([v139 ltmCurves] + 223056),
                  uint64_t v63 = [v139 exposureParams],
                  [v139 colorCorrectionMatrix],
                  uint64_t v124 = v63,
                  uint64_t v23 = v138,
                  (int v67 = -[ColorConvertStage extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:](v62, "extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:", v40, v61, 16, 8, 1, 0, 0.0, *(double *)&v142, v64, v65, v66, v124, v126)) == 0))
            {

              id v140 = v61;
              id v141 = v40;
              id v127 = v40;
LABEL_34:
              int8x16_t v125 = *(int8x16_t *)([v139 ltmCurves] + 223056);
              v68 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
              v69 = v68;
              if (v68)
              {
                [(CMIPostConfig *)v68 setEnableSTF:self->_stfAllowed];
                [(CMIPostConfig *)v69 setDarkestFrameMetadata:v139];
                [(CMIPostConfig *)v69 setEv0FrameMetadata:v139];
                [(CMIPostConfig *)v69 setAllowTonemapping:v34 == 2];
                BOOL v70 = !skipDenoising && self->_nrfConfig->_enableSemanticStyles;
                uint64_t v28 = v141;
                [(CMIPostConfig *)v69 setAllowSemanticStyles:v70];
                [(CMIPostConfig *)v69 setAllowDenoiseAndSharpening:!skipDenoising];
                [(CMIPostConfig *)v69 setAllowGreenGhostMitigation:0];
                [(CMIPostConfig *)v69 setAllowDefringing:a15];
                [(CMIPostConfig *)v69 setAllowColorCube:!skipDenoising];
                [(CMIPostConfig *)v69 setAllowOutlierCorrection:0];
                [(CMIPostConfig *)v69 setDisableTextureCompression:0];
                [(CMIPostConfig *)v69 setAutoAllocateLocalGainMap:self->_nrfConfig->_localGainMapEnabled];
                [(CMIPostConfig *)v69 setTmApplyColorCorrectionMatrix:0];
                [(CMIPostConfig *)v69 setSemStylesUseGainMap:0];
                [(CMIPostConfig *)v69 setColorCubeUseSkyMask:0];
                [(CMIPostConfig *)v69 setToneMappingInputIsLinear:1];
                [(CMIPostConfig *)v69 setIsLowLight:a17];
                [(CMIPostConfig *)v69 setSemanticStyleProperties:v135];
                uint64_t v71 = [v24 skinMask];
                [(CMIPostConfig *)v69 setSkinMask:v71];

                v72 = [v24 skyMask];
                [(CMIPostConfig *)v69 setSkyMask:v72];

                v73 = [v24 personMask];
                [(CMIPostConfig *)v69 setPersonMask:v73];

                v74 = [v24 instanceMasks];
                [(CMIPostConfig *)v69 setInstanceMasks:v74];

                uint64_t v75 = [v24 faceLandmarks];
                [(CMIPostConfig *)v69 setFaceLandmarks:v75];

                v76 = [v24 skinToneClassification];
                [(CMIPostConfig *)v69 setSkinToneClassificationsForFaces:v76];

                v77 = [v24 maskConfidences];
                [(CMIPostConfig *)v69 setLowResPersonInstanceConfidences:v77];

                v78 = [v24 sceneType];
                [(CMIPostConfig *)v69 setSmartCameraSceneType:v78];

                uint64_t v23 = v138;
                [(CMIPostConfig *)v69 setToneMappingPlist:v138[6]];
                [(CMIPostConfig *)v69 setSemanticStylesPlist:v138[13]];
                [(CMIPostConfig *)v69 setDenoiseAndSharpeningPlist:v138[3]];
                [(CMIPostConfig *)v69 setNoiseModelPlist:v138[5]];
                [(CMIPostConfig *)v69 setDefringingTuningParameters:v138[12]];
                [(CMIPostConfig *)v69 setGreenGhostBrightLightTuning:v138[14]];
                [(CMIPostConfig *)v69 setInputLuma:v141];
                [(CMIPostConfig *)v69 setInputChroma:v140];
                [(CMIPostConfig *)v69 setInputNoiseLuma:v137];
                [(CMIPostConfig *)v69 setInputNoiseChroma:v136];
                [(CMIPostConfig *)v69 setOutputLuma:v27];
                [(CMIPostConfig *)v69 setOutputChroma:v134];
                id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
                [(CMIPostConfig *)v69 setSidecarWriter:WeakRetained];

                [(CMIPostConfig *)v69 setRequestLinearMIWBAppliedOutput:a5 != 0];
                [(CMIPostConfig *)v69 setEnableMIWB:self->_nrfConfig->_enableMIWB];
                if ([(CMIPostConfig *)v69 enableMIWB])
                {
                  softLTMStage = self->_softLTMStage;
                  id v41 = v139;
                  uint64_t v81 = [v139 portType];
                  [(CMIPostConfig *)v69 setHazeAppliedInMIWB:[(SoftLTM *)softLTMStage isHazeCorrectionEnabledForPortType:v81]];
                }
                else
                {
                  [(CMIPostConfig *)v69 setHazeAppliedInMIWB:0];
                  id v41 = v139;
                }
                int v82 = [(CMIPost *)self->_post runPostWithConfig:v69];
                if (!v82)
                {
                  if (a5)
                  {
                    BOOL v83 = [(CMIPostConfig *)v69 enableMIWB];
                    LOBYTE(v144[0]) = 0;
                    uint64_t v84 = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                    uint64_t v85 = [v84 width];
                    uint64_t v86 = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                    double v87 = minimumDenormalizedRectToProcess(v41, v85, [v86 height], (BOOL *)v144);
                    double v89 = v88;
                    double v91 = v90;
                    double v93 = v92;

                    uint64_t v94 = self->_colorConvertStage;
                    v95 = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                    v96 = [(CMIPostConfig *)v69 miwbOutputChromaTexture];
                    if ([(CMIPostConfig *)v69 tmApplyColorCorrectionMatrix])
                    {
                      [v41 colorCorrectionMatrix];
                      *(void *)&long long v98 = v97;
                      *(void *)&long long v100 = v99;
                      *(void *)&long long v102 = v101;
                    }
                    else
                    {
                      long long v98 = *MEMORY[0x263EF89A0];
                      long long v100 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
                      long long v102 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
                    }
                    if (v83) {
                      unsigned int v103 = -1;
                    }
                    else {
                      unsigned int v103 = 0;
                    }
                    int v38 = -[ColorConvertStage extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:](v94, "extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:", v95, v96, 1, 0, a5, v87, v89, v91, v93, *(double *)vbicq_s8(v125, (int8x16_t)vdupq_n_s32(v103)).i64, *(double *)&v98, *(double *)&v100, *(double *)&v102);

                    if (v38)
                    {
                      uint64_t v23 = v138;
                      uint64_t v28 = v141;
                      goto LABEL_61;
                    }
                    v104 = [v41 zoomRelatedMetadata];
                    FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();

                    v105 = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                    [v105 width];
                    v106 = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                    [v106 height];

                    CVPixelBufferGetWidth(a5);
                    CVPixelBufferGetHeight(a5);
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();
                    if (LOBYTE(v144[0])) {
                      FigCaptureMetadataUtilitiesPreventFurtherCropping();
                    }
                    uint64_t v23 = v138;
                    uint64_t v28 = v141;
                    if (v133)
                    {
                      uint64_t v107 = v138[6];
                      if (v107
                        && *(unsigned char *)(v107 + 95)
                        && [(DenoiseFusePipeline *)self getSTFStillApplied])
                      {
                        uint64_t v108 = [(DenoiseFusePipeline *)self getSTFLTM_asNSData];
                      }
                      else
                      {
                        uint64_t v108 = getLTM_asNSData((unsigned __int16 *)[v139 ltmCurves]);
                      }
                      v109 = (void *)v108;
                      [v133 setObject:v108 forKeyedSubscript:*MEMORY[0x263F2F530]];

                      id v110 = getLUT_asNSData((unsigned __int16 *)([v139 ltmCurves] + 221232));
                      [v133 setObject:v110 forKeyedSubscript:*MEMORY[0x263F2F4D8]];

                      v111 = getLUT_asNSData((unsigned __int16 *)([v139 ltmCurves] + 221748));
                      [v133 setObject:v111 forKeyedSubscript:*MEMORY[0x263F2F4E8]];

                      int v112 = *(_DWORD *)([v139 exposureParams] + 24);
                      int v113 = *(_DWORD *)([v139 exposureParams] + 36);
                      LODWORD(v114) = v112;
                      v115 = [NSNumber numberWithFloat:v114];
                      [v133 setObject:v115 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

                      LODWORD(v116) = v113;
                      v117 = [NSNumber numberWithFloat:v116];
                      [v133 setObject:v117 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

                      [v133 setObject:&unk_270E992F8 forKeyedSubscript:*MEMORY[0x263F2F0F0]];
                      LODWORD(v118) = llroundf(*(float *)([v139 exposureParams] + 48) * 4096.0);
                      v119 = [NSNumber numberWithUnsignedShort:v118];
                      [v133 setObject:v119 forKeyedSubscript:*MEMORY[0x263F2F4F8]];
                    }
                    id v41 = v139;
                  }
                  v144[0] = [(CMIPostConfig *)v69 miwbOutputLumaTexture];
                  id v143 = [(CMIPostConfig *)v69 miwbOutputChromaTexture];
                  FigMetalDecRef();
                  FigMetalDecRef();

                  int v38 = 0;
LABEL_61:
                  uint64_t v37 = (void *)v134;
LABEL_62:

                  id v40 = v127;
                  uint64_t v39 = v128;
                  goto LABEL_63;
                }
                int v38 = v82;
                v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
                uint64_t v28 = v141;
                uint64_t v37 = (void *)v134;
              }
              else
              {
                v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
                uint64_t v28 = v141;
                uint64_t v37 = (void *)v134;
                int v38 = -73379;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              uint64_t v23 = v138;
              id v41 = v139;
              goto LABEL_62;
            }
            int v38 = v67;
            id v140 = v61;
            uint64_t v28 = v40;
          }
          uint64_t v37 = (void *)v134;
          id v41 = v139;
LABEL_83:

          uint64_t v39 = v128;
          goto LABEL_63;
        }
      }
      FigDebugAssert3();
      uint64_t v23 = v138;
    }
    else
    {
      FigDebugAssert3();
      id v40 = 0;
    }
    int v38 = FigSignalErrorAt();
    id v128 = 0;
    uint64_t v28 = v141;
    uint64_t v37 = (void *)v134;
    id v41 = v139;
    goto LABEL_83;
  }
  uint64_t v28 = v141;
  int v36 = [(TextureUtils *)self->_textureUtils copyTexture:v141 outTex:v27];
  if (v36)
  {
    int v38 = v36;
    id v121 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT);
    uint64_t v37 = (void *)v134;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v39 = 0;
    id v40 = 0;
    id v41 = v139;
    uint64_t v28 = v141;
  }
  else
  {
    uint64_t v37 = (void *)v134;
    int v38 = [(TextureUtils *)self->_textureUtils copyTexture:v140 outTex:v134];
    if (v38)
    {
      v122 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT);
      uint64_t v28 = v141;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v39 = 0;
    id v40 = 0;
    id v41 = v139;
  }
LABEL_63:

  return v38;
}

- (int)baseLayer:(__CVBuffer *)a3
{
  id v4 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:+[LumaChromaImage getMetalLumaFormat:](LumaChromaImage, "getMetalLumaFormat:") usage:1 plane:0 alignmentFactor:16];
  if (!v4 || [(BilateralGrid *)self->_bilateralGrid filter:v4 output:0])
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)createPyramidForFrame:(id)a3 cfp:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  pyramidStage = self->_pyramidStage;
  id v8 = a4;
  uint64_t v9 = [v8 inputColorSpace];
  uint64_t v10 = [v8 colorSpaceConversionParameters];

  [(PyramidStage *)pyramidStage setColorSpace:v9 withParams:v10];
  v13[0] = xmmword_263480CC0;
  v13[1] = unk_263480CD0;
  int v14 = 1084227584;
  if (self->_fusionAlgo != 2
    && [(PyramidStage *)self->_pyramidStage runGPUWithFilters:v13 doShift:1 pyramid:v6])
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (int)addFrameWithInputLuma:(id)a3 inputChroma:(id)a4 inputYCbCr:(id)a5 cfp:(id)a6 processingType:(unsigned int)a7 createPyramid:(BOOL)a8 batchCount:(int)a9
{
  BOOL v9 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  int fusionAlgo = self->_fusionAlgo;
  if (fusionAlgo != 1)
  {
    if (fusionAlgo == 2)
    {
      objc_storeStrong((id *)&self->_inputLuma[self->_currentFrame], a3);
      objc_storeStrong((id *)&self->_inputChroma[self->_currentFrame], a4);
      objc_storeStrong((id *)&self->_inputYCbCr[self->_currentFrame], a5);
      goto LABEL_20;
    }
LABEL_5:
    if (isSingleFrameProcessing(a7)
      && -[DenoiseFusePipeline allocateCoallesedFusionInputPyramidsForWidth:height:levels:frames:](self, "allocateCoallesedFusionInputPyramidsForWidth:height:levels:frames:", [v16 width], objc_msgSend(v16, "height"), 3, 1))
    {
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  if (self->_currentFrame) {
    goto LABEL_5;
  }
  if (a7 == 2 && !a9)
  {
    unint64_t v21 = [v16 width];
    unint64_t v22 = [v16 height];
    uint64_t v23 = (PyramidStorage *)objc_opt_new();
    accWeightPyramid = self->_accWeightPyramid;
    self->_accWeightPyramid = v23;

    unint64_t v25 = self->_accWeightPyramid;
    if (!v25) {
      goto LABEL_23;
    }
    v25->levels = 4;
    BYTE2(v29) = 0;
    LOWORD(v29) = 1;
    +[PyramidStorage allocatePyramidWithMetalContext:label:width:height:isFP16:createLuma:createChroma:startingLevel:testSize:pyramid:](PyramidStorage, "allocatePyramidWithMetalContext:label:width:height:isFP16:createLuma:createChroma:startingLevel:testSize:pyramid:", self->_metal, @"_accWeightPyramid", (unsigned __int16)(v21 >> 2), (unsigned __int16)(v22 >> 2), 1, 1, v29, self->_accWeightPyramid);
  }
  if (-[DenoiseFusePipeline allocateCoallesedFusionInputPyramidsForWidth:height:](self, "allocateCoallesedFusionInputPyramidsForWidth:height:", [v16 width], objc_msgSend(v16, "height")))
  {
LABEL_24:
    FigDebugAssert3();
    int v27 = 0;
    goto LABEL_21;
  }
LABEL_13:
  int v26 = [(PyramidStorage *)self->_inputBands->bands[self->_currentFrame] setLumaTexture:v16 chromaTexture:v17 level:0 metal:self->_metal];
  if (v26)
  {
    int v27 = v26;
    FigDebugAssert3();
    goto LABEL_21;
  }
  if (v18) {
    [(PyramidStorage *)self->_inputBands->bands[self->_currentFrame] setYCbCrBand0Texture:v18];
  }
  if (v9
    && -[DenoiseFusePipeline createPyramidForFrame:cfp:](self, "createPyramidForFrame:cfp:", self->_inputBands->bands[self->_currentFrame], v19)|| [v19 inputColorSpace] == 1&& -[FusionRemixStage correctGTC:](self->_fusionRemixStage, "correctGTC:", self->_inputBands->bands[self->_currentFrame]))
  {
LABEL_23:
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_21;
  }
LABEL_20:
  int v27 = 0;
  ++self->_currentFrame;
LABEL_21:

  return v27;
}

- (int)addFrame:(__CVBuffer *)a3 cfp:(id)a4 processingType:(unsigned int)a5 createPyramid:(BOOL)a6 batchCount:(int)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  unsigned __int8 v13 = v12;
  int v27 = 0;
  if (!a3 || self->_currentFrame >= 5)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    unint64_t v22 = 0;
    id v19 = 0;
    int v20 = 0;
    goto LABEL_16;
  }
  int v26 = v12;
  int v14 = a7;
  if (*(unsigned char *)([v12 colorSpaceConversionParameters] + 199)) {
    unint64_t v15 = +[LumaChromaImage getMetalYCbCrFormat:a3];
  }
  else {
    unint64_t v15 = 0;
  }
  unint64_t v16 = +[LumaChromaImage getMetalLumaFormat:a3];
  unint64_t v17 = +[LumaChromaImage getMetalChromaFormat:a3];
  if (self->_allowModifyingInputBuffers) {
    uint64_t v18 = 7;
  }
  else {
    uint64_t v18 = 1;
  }
  id v19 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v16 usage:v18 plane:0 alignmentFactor:16];
  if (!v19)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    unint64_t v22 = 0;
    int v20 = 0;
LABEL_20:
    unsigned __int8 v13 = v26;
    goto LABEL_16;
  }
  int v20 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v17 usage:v18 plane:1 alignmentFactor:8];
  if (!v20)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    unint64_t v22 = 0;
    goto LABEL_20;
  }
  unsigned __int8 v13 = v26;
  if (!*(unsigned char *)([v26 colorSpaceConversionParameters] + 199))
  {
    unint64_t v22 = 0;
    goto LABEL_15;
  }
  int v21 = +[LumaChromaImage bindYCbCrMetalTextureWithMetalContext:self->_metal pixelBuffer:a3 pixelFormat:v15 textureToBind:&v27 alignmentFactor:16];
  unint64_t v22 = v27;
  if (!v21)
  {
LABEL_15:
    LODWORD(v25) = v14;
    int v23 = [(DenoiseFusePipeline *)self addFrameWithInputLuma:v19 inputChroma:v20 inputYCbCr:v22 cfp:v26 processingType:v9 createPyramid:v8 batchCount:v25];
    unint64_t v22 = v27;
    goto LABEL_16;
  }
  int v23 = v21;
LABEL_16:

  return v23;
}

- (void)swapInputFrame:(int)a3 withFrame:(int)a4
{
}

- (int)selectNRFFusionReferenceFrame:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(id)a5 ev0Properties:(id)a6 nrfPlist:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  unint64_t v15 = self->_inputBands->bands[a3];
  unint64_t v16 = self->_inputBands->bands[a4];
  if (!self->_fusionReferenceFrame)
  {
    unint64_t v17 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    int v18 = [(FusionRemixStage *)self->_fusionRemixStage selectNRFFusionReferenceFrame:v15 ev0Bands:v16 evmProperties:v12 ev0Properties:v13 nrfPlist:v14 outputFusionMode:&self->_fusionReferenceFrame staticScene:&self->_isStaticScene motionDetection:self->_motionDetection grayGhostDetection:self->_grayGhostDetection];
    if (v18)
    {
      int v20 = v18;
      FigDebugAssert3();
      goto LABEL_10;
    }
    if (*v17 == 1) {
      kdebug_trace();
    }
  }
  if (dword_26B430EE8)
  {
    id v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v20 = 0;
LABEL_10:

  return v20;
}

- (int)nrfFusionDenseRegister:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(id)a5 ev0Properties:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(FigMetalContext *)self->_metal allocator];
  id v13 = (void *)[v12 newTextureDescriptor];

  if (!v13)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    goto LABEL_20;
  }
  id v14 = [v13 desc];
  [v14 setUsage:7];

  if (self->_fusionReferenceFrame == 2)
  {
    id v40 = self->_inputBands->bands[a3];
    uint64_t v39 = self->_inputBands->bands[a4];
    unint64_t v15 = objc_opt_new();
    if (!v15)
    {
      FigDebugAssert3();
      int v36 = FigSignalErrorAt();
      uint64_t v35 = v39;
      goto LABEL_19;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    simd_float3x3 v44 = __invert_f3(*(simd_float3x3 *)[v10 regHomography]);
    DWORD2(v41) = v44.columns[0].i32[2];
    DWORD2(v42) = v44.columns[1].i32[2];
    *(void *)&long long v41 = v44.columns[0].i64[0];
    *(void *)&long long v42 = v44.columns[1].i64[0];
    DWORD2(v43) = v44.columns[2].i32[2];
    *(void *)&long long v43 = v44.columns[2].i64[0];
    id v38 = v10;
    unint64_t v16 = [v10 meta];
    uint64_t v17 = [v16 exposureParams];
    int v18 = [v11 meta];
    float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v17, [v18 exposureParams], v11);

    uint64_t v20 = objc_opt_new();
    int v21 = (id *)v20;
    if (!v20)
    {
      FigDebugAssert3();
      int v36 = FigSignalErrorAt();
      uint64_t v35 = v39;
      goto LABEL_18;
    }
    objc_storeStrong((id *)(v20 + 16), v40->textureY[0]);
    objc_storeStrong(v21 + 3, v40->textureUV[0]);
    uint64_t v22 = objc_opt_new();
    int v23 = (id *)v22;
    if (v22)
    {
      objc_storeStrong((id *)(v22 + 16), v39->textureY[0]);
      objc_storeStrong(v23 + 3, v39->textureUV[0]);
      int v24 = -[RegDense prepareWithImageWidth:imageHeight:](self->_regDense, "prepareWithImageWidth:imageHeight:", [v21[2] width], objc_msgSend(v21[2], "height"));
      if (!v24)
      {
        uint64_t v25 = [v21[3] width];
        int v26 = [v13 desc];
        [v26 setWidth:v25];

        uint64_t v27 = [v21[3] height];
        uint64_t v28 = [v13 desc];
        [v28 setHeight:v27];

        uint64_t v29 = [v13 desc];
        [v29 setPixelFormat:65];

        [v13 setLabel:0];
        unint64_t v30 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v31 = [v30 newTextureWithDescriptor:v13];
        int v32 = (void *)v15[3];
        v15[3] = v31;

        if (!v15[3])
        {
          FigDebugAssert3();
          int v36 = FigSignalErrorAt();
          uint64_t v35 = v39;
          goto LABEL_17;
        }
        *(float *)&double v33 = RelativeBrightnessForProperties;
        int v34 = [(RegDense *)self->_regDense runWithReferenceImage:v21 nonReferenceImage:v23 warpedImage:v15 relativeBrightness:&v41 homography:v33];
        uint64_t v35 = v39;
        if (v34)
        {
          int v36 = v34;
          FigDebugAssert3();
          goto LABEL_17;
        }
        [(RegDense *)self->_regDense resetIncludingConfidence:0];
        [v11 setDenseRegistered:1];
        if (*(unsigned char *)([v11 colorSpaceConversionParameters] + 199) && self->_allowModifyingInputBuffers)
        {
          if ([(TextureUtils *)self->_textureUtils copyTexture:v15[2] outTex:v39->textureY[0]]
            || [(TextureUtils *)self->_textureUtils copyTexture:v15[3] outTex:v39->textureUV[0]])
          {
            goto LABEL_29;
          }
          FigMetalDecRef();
          FigMetalDecRef();
        }
        else if ([(PyramidStorage *)v39 setLumaTexture:v15[2] chromaTexture:v15[3] level:0 metal:self->_metal])
        {
          goto LABEL_29;
        }
        int v36 = [(DenoiseFusePipeline *)self createPyramidForFrame:v39 cfp:v11];
        if (!v36)
        {
LABEL_17:

LABEL_18:
          id v10 = v38;
LABEL_19:

          goto LABEL_20;
        }
LABEL_29:
        FigDebugAssert3();
        int v36 = FigSignalErrorAt();
        goto LABEL_17;
      }
      int v36 = v24;
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      int v36 = FigSignalErrorAt();
    }
    uint64_t v35 = v39;
    goto LABEL_17;
  }
  int v36 = 0;
LABEL_20:

  return v36;
}

- (int)toneMapBandFrame:(id)a3 properties:(id *)a4 sourceFrameType:(int)a5 sourceFrameIndex:(int)a6 ltcFrameIndex:(int)a7 gtcFrameIndex:(int)a8 nrfPlist:(id)a9
{
  unint64_t v16 = a3;
  uint64_t v17 = a9;
  if (a6 >= 5 || a7 >= 5 || a8 >= 5)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    id v19 = 0;
    goto LABEL_14;
  }
  int v18 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
  if (!v18)
  {
    id v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    int v36 = -73373;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v19 = 0;
    goto LABEL_14;
  }
  id v19 = v18;
  int v66 = a8;
  int v67 = v17;
  uint64_t v71 = v16;
  uint64_t v20 = [a4[a7] meta];
  uint64_t v21 = [v20 exposureParams];
  uint64_t v22 = [a4[a6] meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v21, [v22 exposureParams], a4[a6]);

  int v68 = *(unsigned __int8 *)([a4[a7] colorSpaceConversionParameters] + 196);
  if (a5 == 2)
  {
    unint64_t v16 = v71;
    int v24 = -[DenoiseFusePipeline _getPyramidLevel:withWidth:withHeight:](self, "_getPyramidLevel:withWidth:withHeight:", self->_fusedBand, [(id)v71[2] width], objc_msgSend((id)v71[2], "height"));
    if ((v24 & 0x80000000) == 0)
    {
      int v25 = v24;
      [(CMIPostConfig *)v19 setInputLuma:self->_fusedBand->textureY[v24]];
      [(CMIPostConfig *)v19 setInputChroma:self->_fusedBand->textureUV[v25]];
LABEL_11:
      v26.i32[0] = 0.5;
      goto LABEL_12;
    }
    goto LABEL_28;
  }
  uint64_t v27 = a6;
  unint64_t v16 = v71;
  int v28 = -[DenoiseFusePipeline _getPyramidLevel:withWidth:withHeight:](self, "_getPyramidLevel:withWidth:withHeight:", self->_inputBands->bands[a6], [(id)v71[2] width], objc_msgSend((id)v71[2], "height"));
  if (v28 < 0)
  {
LABEL_28:
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    goto LABEL_24;
  }
  int v29 = v28;
  if (v28)
  {
    [(CMIPostConfig *)v19 setInputLuma:self->_inputBands->bands[v27]->textureY[v28]];
    [(CMIPostConfig *)v19 setInputChroma:self->_inputBands->bands[v27]->textureUV[v29]];
    unint64_t v30 = [(CMIPostConfig *)v19 inputLuma];
    FigMetalIncRef();

    uint64_t v31 = [(CMIPostConfig *)v19 inputChroma];
    FigMetalIncRef();

    goto LABEL_11;
  }
  id v65 = a4[v27];
  id v38 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v39 = (void *)[v38 newTextureDescriptor];

  if (!v39)
  {
    uint64_t v64 = v9;
    LODWORD(v63) = 0;
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    char v60 = 0;
    uint64_t v47 = 0;
LABEL_31:
    v52 = 0;
    goto LABEL_34;
  }
  id v40 = [v39 desc];
  [v40 setUsage:7];

  uint64_t v41 = [(id)v71[2] width];
  long long v42 = [v39 desc];
  [v42 setWidth:v41];

  uint64_t v43 = [(id)v71[2] height];
  simd_float3x3 v44 = [v39 desc];
  [v44 setHeight:v43];

  uint64_t v45 = [v39 desc];
  [v45 setPixelFormat:25];

  [v39 setLabel:0];
  v46 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v47 = (void *)[v46 newTextureWithDescriptor:v39];

  if (!v47)
  {
    uint64_t v64 = v9;
    LODWORD(v63) = 0;
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    char v60 = 0;
    goto LABEL_31;
  }
  v48 = [v39 desc];
  objc_msgSend(v48, "setWidth:", (unint64_t)objc_msgSend(v48, "width") >> 1);

  v49 = [v39 desc];
  objc_msgSend(v49, "setHeight:", (unint64_t)objc_msgSend(v49, "height") >> 1);

  v50 = [v39 desc];
  [v50 setPixelFormat:65];

  [v39 setLabel:0];
  v51 = [(FigMetalContext *)self->_metal allocator];
  v52 = (void *)[v51 newTextureWithDescriptor:v39];

  if (!v52)
  {
    uint64_t v64 = v9;
    LODWORD(v63) = 0;
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
    char v60 = 0;
    v62.i32[0] = 0.5;
    int32x2_t v70 = v62;
    unint64_t v16 = v71;
    goto LABEL_23;
  }
  int v53 = *(unsigned __int8 *)([v65 colorSpaceConversionParameters] + 199);
  colorConvertStage = self->_colorConvertStage;
  uint64_t v55 = [v65 colorSpaceConversionParameters];
  int v56 = self->_inputBands->bands[v27];
  if (v53) {
    int v57 = [(ColorConvertStage *)colorConvertStage convertColor:v55 hazeCorrection:v56->textureYCbCrBand0 inputYCbCr:v47 outputLuma:v52 outputChroma:0.0];
  }
  else {
    int v57 = [(ColorConvertStage *)colorConvertStage convertColor:v55 hazeCorrection:v56->textureY[0] inputLuma:v56->textureUV[0] inputChroma:v47 outputLuma:v52 outputChroma:0.0];
  }
  int v36 = v57;
  unint64_t v16 = v71;
  if (!v57)
  {
    [(CMIPostConfig *)v19 setInputLuma:v47];
    [(CMIPostConfig *)v19 setInputChroma:v52];
    int v68 = 1;
    v59.i32[0] = 1.0;
    int32x2_t v70 = v59;
    char v60 = 1;
    goto LABEL_23;
  }
  char v60 = 0;
LABEL_34:
  v58.i32[0] = 0.5;
  int32x2_t v70 = v58;
LABEL_23:

  int32x2_t v26 = v70;
  if ((v60 & 1) == 0)
  {
LABEL_24:
    uint64_t v17 = v67;
    goto LABEL_14;
  }
LABEL_12:
  int32x2_t v69 = v26;
  -[CMIPostConfig setEnableSTF:](v19, "setEnableSTF:", self->_nrfConfig->_enableSTF, v63, v64);
  [(CMIPostConfig *)v19 setOutputLuma:v16[2]];
  [(CMIPostConfig *)v19 setOutputChroma:v16[3]];
  int v32 = [a4[a7] meta];
  [(CMIPostConfig *)v19 setDarkestFrameMetadata:v32];

  double v33 = [a4[v66] meta];
  [(CMIPostConfig *)v19 setEv0FrameMetadata:v33];

  *(float *)&double v34 = RelativeBrightnessForProperties;
  [(CMIPostConfig *)v19 setTonemappingScaleInput:v34];
  [(CMIPostConfig *)v19 setTmQuality:1];
  uint64_t v17 = v67;
  [(CMIPostConfig *)v19 setToneMappingPlist:v67[6]];
  [(CMIPostConfig *)v19 setLtmGridScaling:COERCE_DOUBLE(vdup_lane_s32(v69, 0))];
  [(CMIPostConfig *)v19 setToneMappingInputIsLinear:v68 != 0];
  [(CMIPostConfig *)v19 setTmApplyColorCorrectionMatrix:0];
  [(CMIPostConfig *)v19 disableAllAllow];
  [(CMIPostConfig *)v19 setAllowTonemapping:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  [(CMIPostConfig *)v19 setSidecarWriter:WeakRetained];

  [(CMIPostConfig *)v19 setEnableMIWB:self->_nrfConfig->_enableMIWB];
  if ([(CMIPost *)self->_post runPostWithConfig:v19])
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
  }
  else
  {
    int v36 = 0;
  }
LABEL_14:

  return v36;
}

- (int)downsampleUpperBandFrame:(id)a3 sourceFrameIndex:(int)a4
{
  id v6 = (id *)a3;
  int v7 = v6;
  if (a4 >= 5
    || (int v8 = -[DenoiseFusePipeline _getPyramidLevel:withWidth:withHeight:](self, "_getPyramidLevel:withWidth:withHeight:", self->_inputBands->bands[a4], 2 * [v6[2] width], 2 * objc_msgSend(v6[2], "height")), v8 < 0))
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }
  else
  {
    int v9 = v8;
    uint64_t v10 = a4;
    id v11 = self->_inputBands->bands[a4]->textureY[v8];
    id v12 = self->_inputBands->bands[v10]->textureUV[v9];
    id v13 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v13)
    {
      id v14 = v13;
      unint64_t v15 = [v13 computeCommandEncoder];
      if (v15)
      {
        unint64_t v16 = v15;
        [v15 setComputePipelineState:self->_shaders->_downsampleInference];
        [v16 setTexture:v11 atIndex:21];
        [v16 setTexture:v12 atIndex:22];
        [v16 setTexture:v7[2] atIndex:29];
        [v16 setTexture:v7[3] atIndex:30];
        [v16 setImageblockWidth:32 height:32];
        uint64_t v17 = [v7[3] width];
        uint64_t v18 = [v7[3] height];
        v23[0] = v17;
        v23[1] = v18;
        v23[2] = 1;
        int64x2_t v21 = vdupq_n_s64(0x10uLL);
        uint64_t v22 = 1;
        [v16 dispatchThreads:v23 threadsPerThreadgroup:&v21];
        [v16 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v19 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v19 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
    }
  }

  return v19;
}

- (int)fuseFramesWithConfig:(const FusionConfiguration *)a3 properties:(id *)a4 nrfPlist:(id)a5 batchN:(int)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 isLowLight:(BOOL)a9
{
  BOOL v90 = a7;
  id v12 = a5;
  id v13 = [(FigMetalContext *)self->_metal allocator];
  id v14 = (void *)[v13 newTextureDescriptor];

  if (!v14)
  {
    FigDebugAssert3();
    int v81 = FigSignalErrorAt();
    goto LABEL_54;
  }
  BOOL v87 = a8;
  unint64_t v15 = [v14 desc];
  [v15 setUsage:7];

  unint64_t v100 = [(MTLTexture *)self->_inputBands->bands[0]->textureY[0] width];
  unint64_t v16 = [(MTLTexture *)self->_inputBands->bands[0]->textureY[0] height];
  uint64_t v17 = v12[4];
  double v88 = v14;
  double v91 = a3;
  if (*(unsigned char *)(v17 + 24) && *(_DWORD *)(v17 + 96) != 2)
  {
    id v103 = 0;
    uint64_t v18 = [v14 desc];
    [v18 setWidth:v100];

    int v19 = [v14 desc];
    unint64_t v86 = v16;
    [v19 setHeight:v16];

    uint64_t v20 = [v14 desc];
    [v20 setPixelFormat:25];

    [v14 setLabel:0];
    int64x2_t v21 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v22 = (void *)[v21 newTextureWithDescriptor:v14];
    id v104 = v22;

    if (v22)
    {
      int v23 = [(FigMetalContext *)self->_metal allocator];
      int v24 = (void *)[v23 newTextureDescriptor:0];

      uint64_t v25 = [(MTLTexture *)self->_inputBands->bands[0]->textureUV[0] width];
      int32x2_t v26 = [v24 desc];
      [v26 setWidth:v25];

      uint64_t v27 = [(MTLTexture *)self->_inputBands->bands[0]->textureUV[0] height];
      int v28 = [v24 desc];
      [v28 setHeight:v27];

      int v29 = [v24 desc];
      [v29 setPixelFormat:65];

      [v24 setLabel:0];
      unint64_t v30 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v31 = (void *)[v30 newTextureWithDescriptor:v24 subAllocatorID:0];
      id v103 = v31;

      if (v31)
      {
        uint64_t v85 = v12;

        a3 = v91;
        int nonLinearBias_low = LODWORD(v91[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
        if (nonLinearBias_low >= 1)
        {
          uint64_t v33 = 0;
          float32x4_t v94 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
          float32x4_t v95 = *(float32x4_t *)MEMORY[0x263EF89A0];
          p_nonLinearScale = (float32x4_t *)&v91->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale;
          float32x4_t v92 = (float32x4_t)vdupq_n_s32(0x358637BDu);
          float32x4_t v93 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
          do
          {
            uint32x4_t v35 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v92, vabdq_f32(p_nonLinearScale[-1], v94)), (int8x16_t)vcgeq_f32(v92, vabdq_f32(p_nonLinearScale[-2], v95))), (int8x16_t)vcgeq_f32(v92, vabdq_f32(*p_nonLinearScale, v93)));
            v35.i32[3] = v35.i32[2];
            if ((vminvq_u32(v35) & 0x80000000) == 0)
            {
              int v36 = self->_inputBands->bands[v33];
              uint64_t v37 = v36->textureY[0];
              id v38 = v36->textureUV[0];
              warpStage = self->_warpStage;
              float32x4_t v97 = p_nonLinearScale[-2];
              double v98 = *(double *)p_nonLinearScale[-1].i64;
              double v99 = *(double *)p_nonLinearScale->i64;
              id v40 = v36->textureYCbCrBand0;
              uint64_t v41 = v38;
              long long v42 = v37;
              -[WarpStage runWarpUsingTransform:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:](warpStage, "runWarpUsingTransform:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:", v42, v41, v22, v31, *(double *)v97.i64, v98, v99);
              [(PyramidStorage *)self->_inputBands->bands[v33] setLumaTexture:v22 chromaTexture:v31 level:0 metal:self->_metal];
              [(DenoiseFusePipeline *)self createPyramidForFrame:self->_inputBands->bands[v33] cfp:a4[v33]];
              [(PyramidStorage *)self->_inputBands->bands[v33] setLumaTexture:v42 chromaTexture:v41 level:0 metal:self->_metal];
              [(PyramidStorage *)self->_inputBands->bands[v33] setYCbCrBand0Texture:v40];

              a3 = v91;
              int nonLinearBias_low = LODWORD(v91[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
            }
            ++v33;
            p_nonLinearScale += 3;
          }
          while (v33 < nonLinearBias_low);
        }
        FigMetalDecRef();
        FigMetalDecRef();

        id v12 = v85;
        unint64_t v16 = v86;
        id v14 = v88;
        goto LABEL_12;
      }
      FigDebugAssert3();
      int v81 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v81 = FigSignalErrorAt();
    }

    goto LABEL_54;
  }
LABEL_12:
  uint64_t v43 = a4;
  if (SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias) < 1)
  {
LABEL_17:
    uint64_t v45 = 0;
LABEL_22:
    self->_fusedBand->levels = 4;
    fusedBand = self->_fusedBand;
    if (!a6)
    {
      if (!FigMetalIsValid())
      {
        int v57 = [v88 desc];
        [v57 setWidth:(v100 >> 3)];

        int32x2_t v58 = [v88 desc];
        [v58 setHeight:(v16 >> 3)];

        int32x2_t v59 = [v88 desc];
        [v59 setPixelFormat:25];

        [v88 setLabel:0];
        char v60 = [(FigMetalContext *)self->_metal allocator];
        id v61 = (MTLTexture *)[v60 newTextureWithDescriptor:v88];
        int32x2_t v62 = self->_fusedBand->textureY[3];
        self->_fusedBand->textureY[3] = v61;

        if (!self->_fusedBand->textureY[3]) {
          goto LABEL_62;
        }
      }
      if (FigMetalIsValid())
      {
        fusedBand = self->_fusedBand;
        a3 = v91;
        uint64_t v43 = a4;
      }
      else
      {
        uint64_t v63 = [v88 desc];
        [v63 setWidth:(v100 >> 4) & 0x7FFFFFFF];

        uint64_t v64 = [v88 desc];
        [v64 setHeight:(v16 >> 4) & 0x7FFFFFFF];

        id v65 = [v88 desc];
        [v65 setPixelFormat:65];

        [v88 setLabel:0];
        int v66 = [(FigMetalContext *)self->_metal allocator];
        int v67 = (MTLTexture *)[v66 newTextureWithDescriptor:v88];
        int v68 = self->_fusedBand->textureUV[3];
        self->_fusedBand->textureUV[3] = v67;

        fusedBand = self->_fusedBand;
        a3 = v91;
        uint64_t v43 = a4;
        if (!fusedBand->textureUV[3]) {
          goto LABEL_62;
        }
      }
    }
    LOBYTE(v83) = a9;
    if (![(FusionRemixStage *)self->_fusionRemixStage prepareForFusion:self->_inputBands config:a3 fusedPyramid:fusedBand properties:v43 nrfPlist:v12 staticScene:self->_isStaticScene isLowLight:v83])
    {
      int32x2_t v70 = v45;
      if (!self->_doGreenGhostMitigation
        || !v90
        || !a9
        || ![(GreenGhostLowLightStage *)self->_greenGhostLowLightStage mixFusedTexturesWithRefLuma:self->_inputBands->bands[0]->textureY[0] refChroma:self->_inputBands->bands[0]->textureUV[0] refProperties:*v43 tuningParams:v12[15]])
      {
        uint64_t v71 = (_DWORD *)MEMORY[0x263F00E10];
        if (*MEMORY[0x263F00E10])
        {
          v72 = [(FigMetalContext *)self->_metal commandQueue];
          v73 = [v72 commandBuffer];

          [v73 setLabel:@"KTRACE_START_MTL"];
          [v73 addCompletedHandler:&__block_literal_global_17];
          [v73 commit];

          a3 = v91;
        }
        LODWORD(v69) = 0.5;
        if (!LOBYTE(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower)) {
          *(float *)&double v69 = 0.0;
        }
        BYTE6(v84) = v87;
        BYTE5(v84) = a9;
        BYTE4(v84) = v90;
        LODWORD(v84) = a6;
        if (!-[FusionRemixStage runImageFusion:config:fusedPyramid:accWeightPyramid:buffers:nrfPlist:confidence:batchN:isLastBatch:isLowLight:usePatchBasedFusion:outputChromaBias:](self->_fusionRemixStage, "runImageFusion:config:fusedPyramid:accWeightPyramid:buffers:nrfPlist:confidence:batchN:isLastBatch:isLowLight:usePatchBasedFusion:outputChromaBias:", self->_inputBands, a3, self->_fusedBand, self->_accWeightPyramid, self->_fusionBuffers, v12, v69, v70, v84))
        {
          if (*v71)
          {
            v74 = [(FigMetalContext *)self->_metal commandQueue];
            uint64_t v75 = [v74 commandBuffer];

            [v75 setLabel:@"KTRACE_END_MTL"];
            v102[0] = MEMORY[0x263EF8330];
            v102[1] = 3221225472;
            v102[2] = __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke_2;
            v102[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
            memset(&v102[4], 0, 24);
            [v75 addCompletedHandler:v102];
            [v75 commit];
          }
          if (!self->_doGreenGhostMitigation || !v90 || !a9) {
            goto LABEL_48;
          }
          if (*v71)
          {
            v76 = [(FigMetalContext *)self->_metal commandQueue];
            v77 = [v76 commandBuffer];

            [v77 setLabel:@"KTRACE_START_MTL"];
            [v77 addCompletedHandler:&__block_literal_global_249];
            [v77 commit];
          }
          if (![(GreenGhostLowLightStage *)self->_greenGhostLowLightStage inpaintLuma:self->_fusionBuffers->fusedLumaTex andChroma:self->_fusionBuffers->fusedChromaTex tuningParams:v12[15]])
          {
            if (*v71)
            {
              v78 = [(FigMetalContext *)self->_metal commandQueue];
              id v79 = [v78 commandBuffer];

              [v79 setLabel:@"KTRACE_END_MTL"];
              v101[0] = MEMORY[0x263EF8330];
              v101[1] = 3221225472;
              v101[2] = __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke_4;
              v101[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
              memset(&v101[4], 0, 24);
              [v79 addCompletedHandler:v101];
              [v79 commit];
            }
LABEL_48:
            for (uint64_t i = 0; i != 5; ++i)
            {
              if (self->_inputBands->bands[i])
              {
                FigMetalDecRef();
                FigMetalDecRef();
                +[PyramidStorage makePyramidAliasable:self->_inputBands->bands[i] metal:self->_metal];
              }
            }

            int v81 = 0;
            goto LABEL_53;
          }
        }
      }
      FigDebugAssert3();
      int v81 = FigSignalErrorAt();

LABEL_53:
      id v14 = v88;
      goto LABEL_54;
    }
LABEL_62:
    FigDebugAssert3();
    int v81 = FigSignalErrorAt();

    goto LABEL_53;
  }
  uint64_t v44 = 0;
  while (![a4[v44] denseRegistered] || !self->_regDense->_pyrConfidence->textureY[0])
  {
    if (++v44 >= SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias)) {
      goto LABEL_17;
    }
  }
  FigMetalIncRef();
  objc_storeStrong((id *)&self->_regDense->_pyrConfidence->textureY[1], self->_regDense->_pyrConfidence->textureY[0]);
  uint64_t v46 = 0;
  while (1)
  {
    uint64_t v47 = [v14 desc];
    [v47 setWidth:(v100 >> (v46 + 2))];

    v48 = [v14 desc];
    [v48 setHeight:(v16 >> (v46 + 2))];

    v49 = [v14 desc];
    [v49 setPixelFormat:25];

    [v14 setLabel:0];
    v50 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v51 = [v50 newTextureWithDescriptor:v14];
    v52 = &self->_regDense->_pyrConfidence->textureY[v46];
    int v53 = v52[2];
    v52[2] = (MTLTexture *)v51;

    regDense = self->_regDense;
    uint64_t v55 = (uint64_t)&regDense->_pyrConfidence->textureY[v46];
    if ([(RegDense *)regDense pyramidConfidence:*(void *)(v55 + 16) input:*(void *)(v55 + 8)])
    {
      break;
    }
    if (++v46 == 2)
    {
      uint64_t v45 = self->_regDense->_pyrConfidence;
      a3 = v91;
      uint64_t v43 = a4;
      goto LABEL_22;
    }
  }
  FigDebugAssert3();
  int v81 = 0;
LABEL_54:

  return v81;
}

void __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __114__DenoiseFusePipeline_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)setupHazeCorrectionTuningParameters:(id)a3
{
  return [(SoftLTM *)self->_softLTMStage setupIBPTuningParameters:a3 with:1];
}

- (BOOL)isHazeCorrectionEnabled:(id)a3
{
  return [(SoftLTM *)self->_softLTMStage isHazeCorrectionEnabled:a3];
}

- (int)doHazeEstimation:(const FusionConfiguration *)a3 properties:(id *)a4 darkFrameMetadata:(id)a5 ev0FrameMetadata:(id)a6 applyCCM:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    uint64_t v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    int v19 = -73378;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_28;
  }
  if ([(SoftLTM *)self->_softLTMStage isHazeCorrectionEnabled:v13])
  {
    id v44 = v12;
    float linearScale = a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale;
    if (linearScale == NAN)
    {
      float RelativeBrightness = 1.0;
    }
    else
    {
      unint64_t v15 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
      uint64_t v16 = [v15 exposureParams];
      uint64_t v17 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)] meta];
      float RelativeBrightness = getRelativeBrightness(v16, [v17 exposureParams], 2);
    }
    uint64_t v20 = self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)]->textureY[0];
    int64x2_t v21 = self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)]->textureUV[0];
    uint64_t v22 = v21;
    uint64_t v46 = v20;
    if (v20) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23)
    {
      id v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      uint64_t v37 = v20;
      int v19 = -73378;
    }
    else
    {
      id v45 = v13;
      softLTMStage = self->_softLTMStage;
      uint64_t v25 = [(FigMetalContext *)self->_metal allocator];
      int v19 = [(SoftLTM *)softLTMStage prepareToProcess:v25];

      if (!v19)
      {
        *(float *)&double v26 = RelativeBrightness;
        uint64_t v27 = [NSNumber numberWithFloat:v26];
        [(SoftLTM *)self->_softLTMStage setEvmExpRatio:v27];

        id v13 = v45;
        int v28 = [(SoftLTM *)self->_softLTMStage computeLTMFromLuma:v46 chroma:v22 metadata:v45 applyCCM:v7];
        if (v28)
        {
          int v29 = self->_softLTMStage;
          unint64_t v30 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
          int v19 = [(SoftLTM *)v29 processLTMMetadata:v28 toDarkestFrame:0 toEV0Frame:v30];

          if (v19)
          {
            FigDebugAssert3();
          }
          else
          {
            if (linearScale != NAN)
            {
              uint64_t v31 = [v28 objectForKeyedSubscript:*MEMORY[0x263F2F0C0]];
              if (v31) {
                [(SoftLTM *)self->_softLTMStage setHazeEstimation:v31];
              }
              int v32 = self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)]->textureY[0];

              uint64_t v33 = self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)]->textureUV[0];
              if (v32 && v33)
              {
                double v34 = [(SoftLTM *)self->_softLTMStage computeLTMFromLuma:v32 chroma:v33 metadata:v44 applyCCM:v7];
                if (v34)
                {
                  uint32x4_t v35 = self->_softLTMStage;
                  int v36 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)] meta];
                  int v19 = [(SoftLTM *)v35 processLTMMetadata:v34 toDarkestFrame:v36 toEV0Frame:0];

                  if (v19) {
                    FigDebugAssert3();
                  }
                }
                else
                {
                  uint64_t v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
                  int v19 = -73378;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
              else
              {
                long long v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
                int v19 = -73378;
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              uint64_t v22 = v33;
              uint64_t v37 = v32;
              id v13 = v45;
              goto LABEL_26;
            }
            int v19 = 0;
          }
          id v13 = v45;
          uint64_t v37 = v46;
        }
        else
        {
          uint64_t v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
          uint64_t v37 = v46;
          int v19 = -73378;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
LABEL_26:

LABEL_27:
        id v12 = v44;
        goto LABEL_28;
      }
      id v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      id v13 = v45;
      uint64_t v37 = v46;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_27;
  }
  int v19 = 0;
LABEL_28:

  return v19;
}

- (int)toneMapAndDenoiseFusedFramesWithConfig:(const FusionConfiguration *)a3 properties:(id *)a4 nrfPlist:(id)a5 style:(id)a6 linearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a7 linearOutputMIWBAppliedMetadata:(id)a8 output:(__CVBuffer *)a9 inferenceProvider:(id)a10 colorCubeFixType:(int)a11 isLowLight:(BOOL)a12 gainMap:(id)a13
{
  v129[16] = *(id *)MEMORY[0x263EF8340];
  uint64_t v18 = a5;
  id v125 = a6;
  id v121 = a8;
  id v19 = a10;
  id v124 = a13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  uint64_t v118 = objc_opt_new();
  if (!v118 || (uint64_t v117 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    v122 = 0;
    uint64_t v27 = 0;
    v126 = 0;
    id v127 = 0;
    uint64_t v108 = 0;
    v106 = v121;
    uint64_t v107 = (void *)v118;
    goto LABEL_45;
  }
  uint64_t v20 = [(FigMetalContext *)self->_metal allocator];
  int64x2_t v21 = (void *)[v20 newTextureDescriptor];

  if (!v21)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    v122 = 0;
LABEL_51:
    uint64_t v27 = 0;
    v126 = 0;
    id v127 = 0;
    goto LABEL_53;
  }
  v122 = v21;
  uint64_t v22 = [v21 desc];
  [v22 setUsage:7];

  if (!a9) {
    goto LABEL_50;
  }
  BOOL v23 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v24 = [v23 usedSize:0];

  if (v24)
  {
    uint64_t v27 = 0;
    v126 = 0;
    id v127 = 0;
    int v26 = 0;
    goto LABEL_53;
  }
  id v127 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a9 pixelFormat:10 usage:7 plane:0 alignmentFactor:16];
  if (!v127)
  {
LABEL_50:
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    goto LABEL_51;
  }
  v126 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a9 pixelFormat:30 usage:7 plane:1 alignmentFactor:8];
  if (!v126)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    uint64_t v27 = 0;
    v126 = 0;
    goto LABEL_53;
  }
  if (v19)
  {
    uint64_t v25 = [(DenoiseFusePipeline *)self _runInferenceProvider:v19];
    if (!v25)
    {
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      uint64_t v27 = 0;
LABEL_53:
      v106 = v121;
      uint64_t v108 = (void *)v117;
      uint64_t v107 = (void *)v118;
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  v119 = (void *)v25;
  if (*(unsigned char *)(v18[3] + 42))
  {
    uint64_t v28 = [(MTLTexture *)self->_fusionBuffers->fusedLumaTex width];
    int v29 = [v21 desc];
    [v29 setWidth:v28];

    uint64_t v30 = [(MTLTexture *)self->_fusionBuffers->fusedLumaTex height];
    uint64_t v31 = [v21 desc];
    [v31 setHeight:v30];

    int v32 = [v21 desc];
    [v32 setPixelFormat:25];

    [v21 setLabel:0];
    uint64_t v33 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v34 = [v33 newTextureWithDescriptor:v21];

    if (!v34)
    {
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      v106 = v121;
      uint64_t v108 = (void *)v117;
      uint64_t v107 = (void *)v118;
      uint64_t v27 = v119;
      goto LABEL_45;
    }
    LODWORD(v35) = *(_DWORD *)(v18[3] + 44);
    [(OutliersRemovalStage *)self->_outliersRemovalStage runWithInput:self->_fusionBuffers->fusedLumaTex output:v34 gamma:v35];
    FigMetalDecRef();
    fusionBuffers = self->_fusionBuffers;
    fusedLumaTex = fusionBuffers->fusedLumaTex;
    fusionBuffers->fusedLumaTex = (MTLTexture *)v34;
  }
  if (LOBYTE(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower))
  {
    id v110 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
    v106 = v121;
    uint64_t v108 = (void *)v117;
    uint64_t v107 = (void *)v118;
    uint64_t v27 = v119;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v26 = -73374;
    goto LABEL_45;
  }
  id v116 = v19;
  id v38 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower)] meta];
  int8x16_t v115 = *(int8x16_t *)([v38 ltmCurves] + 223056);

  uint64_t v39 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
  id v40 = v39;
  if (!v39)
  {
    v111 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
    v106 = v121;
    uint64_t v108 = (void *)v117;
    uint64_t v107 = (void *)v118;
    uint64_t v27 = v119;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v26 = -73374;
    goto LABEL_44;
  }
  [(CMIPostConfig *)v39 setEnableSTF:self->_nrfConfig->_enableSTF];
  uint64_t v41 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower)] meta];
  [(CMIPostConfig *)v40 setDarkestFrameMetadata:v41];

  long long v42 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
  [(CMIPostConfig *)v40 setEv0FrameMetadata:v42];

  [(CMIPostConfig *)v40 setAllowGreenGhostMitigation:1];
  [(CMIPostConfig *)v40 setAllowSemanticStyles:self->_nrfConfig->_enableSemanticStyles];
  [(CMIPostConfig *)v40 setAllowDenoiseAndSharpening:1];
  [(CMIPostConfig *)v40 setAllowColorCube:1];
  [(CMIPostConfig *)v40 setAllowOutlierCorrection:0];
  [(CMIPostConfig *)v40 setAllowDefringing:1];
  BOOL v43 = self->_doGreenGhostMitigation && !a12;
  [(CMIPostConfig *)v40 setAllowGreenGhostMitigation:v43];
  [(CMIPostConfig *)v40 setDisableTextureCompression:0];
  [(CMIPostConfig *)v40 setTmApplyColorCorrectionMatrix:0];
  -[CMIPostConfig setToneMappingInputIsLinear:](v40, "setToneMappingInputIsLinear:", *(unsigned __int8 *)([a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower)] colorSpaceConversionParameters]+ 196));
  [(CMIPostConfig *)v40 setIsLowLight:a12];
  [(CMIPostConfig *)v40 setSemanticStyleProperties:v125];
  id v44 = [v119 skinMask];
  [(CMIPostConfig *)v40 setSkinMask:v44];

  id v45 = [v119 skyMask];
  [(CMIPostConfig *)v40 setSkyMask:v45];

  uint64_t v46 = [v119 personMask];
  [(CMIPostConfig *)v40 setPersonMask:v46];

  uint64_t v47 = [v119 instanceMasks];
  [(CMIPostConfig *)v40 setInstanceMasks:v47];

  v48 = [v119 faceLandmarks];
  [(CMIPostConfig *)v40 setFaceLandmarks:v48];

  v49 = [v119 skinToneClassification];
  [(CMIPostConfig *)v40 setSkinToneClassificationsForFaces:v49];

  v50 = [v119 maskConfidences];
  [(CMIPostConfig *)v40 setLowResPersonInstanceConfidences:v50];

  uint64_t v51 = [v119 sceneType];
  [(CMIPostConfig *)v40 setSmartCameraSceneType:v51];

  [(CMIPostConfig *)v40 setToneMappingPlist:v18[6]];
  [(CMIPostConfig *)v40 setSemanticStylesPlist:v18[13]];
  [(CMIPostConfig *)v40 setDenoiseAndSharpeningPlist:v18[3]];
  [(CMIPostConfig *)v40 setNoiseModelPlist:v18[5]];
  [(CMIPostConfig *)v40 setDefringingTuningParameters:v18[12]];
  [(CMIPostConfig *)v40 setGreenGhostBrightLightTuning:v18[14]];
  uint64_t v27 = v119;
  [(CMIPostConfig *)v40 setInputLuma:self->_fusionBuffers->fusedLumaTex];
  [(CMIPostConfig *)v40 setInputChroma:self->_fusionBuffers->fusedChromaTex];
  [(CMIPostConfig *)v40 setInputNoiseLuma:self->_fusionBuffers->noiseMapLumaTex];
  [(CMIPostConfig *)v40 setInputNoiseChroma:self->_fusionBuffers->noiseMapChromaTex];
  [(CMIPostConfig *)v40 setGainMap:v124];
  [(CMIPostConfig *)v40 setOutputLuma:v127];
  [(CMIPostConfig *)v40 setOutputChroma:v126];
  [(CMIPostConfig *)v40 setSidecarWriter:WeakRetained];
  if ([v119 skyMaskPixelBuffer])
  {
    int v52 = -[CMIPostConfig regularizeLocalToneCurvesWithSkyMask:withSkinMask:](v40, "regularizeLocalToneCurvesWithSkyMask:withSkinMask:", [v119 skyMaskPixelBuffer], objc_msgSend(v119, "skinMaskPixelBuffer"));
    if (v52) {
      goto LABEL_56;
    }
  }
  [(CMIPostConfig *)v40 setRequestLinearMIWBAppliedOutput:a7 != 0];
  [(CMIPostConfig *)v40 setEnableMIWB:self->_nrfConfig->_enableMIWB];
  if ([(CMIPostConfig *)v40 enableMIWB])
  {
    softLTMStage = self->_softLTMStage;
    v54 = [a4[SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower)] meta];
    uint64_t v55 = [v54 portType];
    [(CMIPostConfig *)v40 setHazeAppliedInMIWB:[(SoftLTM *)softLTMStage isHazeCorrectionEnabledForPortType:v55]];
  }
  else
  {
    [(CMIPostConfig *)v40 setHazeAppliedInMIWB:0];
  }
  int v52 = [(CMIPost *)self->_post runPostWithConfig:v40];
  if (v52)
  {
LABEL_56:
    int v26 = v52;
    int v112 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
    v106 = v121;
    uint64_t v108 = (void *)v117;
    uint64_t v107 = (void *)v118;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_60;
  }
  if (a7)
  {
    uint64_t nonLinearPower_low = SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower);
    uint64_t linearThreshold_low = SLODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold);
    double v114 = v18;
    BOOL v57 = [(CMIPostConfig *)v40 enableMIWB];
    LOBYTE(v129[0]) = 0;
    int32x2_t v58 = [a4[nonLinearPower_low] meta];
    int32x2_t v59 = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
    uint64_t v60 = [v59 width];
    id v61 = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
    double v62 = minimumDenormalizedRectToProcess(v58, v60, [v61 height], (BOOL *)v129);
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;

    colorConvertStage = self->_colorConvertStage;
    int32x2_t v70 = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
    uint64_t v71 = [(CMIPostConfig *)v40 miwbOutputChromaTexture];
    int v72 = *(unsigned __int8 *)([a4[nonLinearPower_low] colorSpaceConversionParameters] + 196);
    int v73 = LOBYTE(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower);
    if ([(CMIPostConfig *)v40 tmApplyColorCorrectionMatrix])
    {
      uint64_t v74 = [a4[nonLinearPower_low] colorSpaceConversionParameters];
      uint64_t v75 = (double *)(v74 + 96);
      v76 = (double *)(v74 + 112);
      v77 = (double *)(v74 + 128);
    }
    else
    {
      uint64_t v75 = (double *)MEMORY[0x263EF89A0];
      v76 = (double *)(MEMORY[0x263EF89A0] + 16);
      v77 = (double *)(MEMORY[0x263EF89A0] + 32);
    }
    if (v57) {
      unsigned int v78 = -1;
    }
    else {
      unsigned int v78 = 0;
    }
    int v26 = -[ColorConvertStage extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:](colorConvertStage, "extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:", v70, v71, v72 != 0, v73 != 0, a7, v62, v64, v66, v68, *(double *)vbicq_s8(v115, (int8x16_t)vdupq_n_s32(v78)).i64, *v75, *v76, *v77);

    if (!v26)
    {
      id v79 = [a4[nonLinearPower_low] meta];
      uint64_t v80 = [v79 zoomRelatedMetadata];
      FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();

      int v81 = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
      [v81 width];
      int v82 = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
      [v82 height];

      CVPixelBufferGetWidth(a7);
      CVPixelBufferGetHeight(a7);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();
      uint64_t v18 = v114;
      if (LOBYTE(v129[0])) {
        FigCaptureMetadataUtilitiesPreventFurtherCropping();
      }
      uint64_t v27 = v119;
      if (v121)
      {
        uint64_t v83 = v114[6];
        if (v83 && *(unsigned char *)(v83 + 95) && [(DenoiseFusePipeline *)self getSTFStillApplied])
        {
          uint64_t v84 = [(DenoiseFusePipeline *)self getSTFLTM_asNSData];
          [v121 setObject:v84 forKeyedSubscript:*MEMORY[0x263F2F530]];
        }
        else
        {
          uint64_t v84 = [a4[nonLinearPower_low] meta];
          uint64_t v85 = getLTM_asNSData((unsigned __int16 *)[v84 ltmCurves]);
          [v121 setObject:v85 forKeyedSubscript:*MEMORY[0x263F2F530]];
        }
        unint64_t v86 = [a4[linearThreshold_low] meta];
        BOOL v87 = getLUT_asNSData((unsigned __int16 *)([v86 ltmCurves] + 221232));
        [v121 setObject:v87 forKeyedSubscript:*MEMORY[0x263F2F4D8]];

        double v88 = [a4[linearThreshold_low] meta];
        double v89 = getLUT_asNSData((unsigned __int16 *)([v88 ltmCurves] + 221748));
        [v121 setObject:v89 forKeyedSubscript:*MEMORY[0x263F2F4E8]];

        BOOL v90 = [a4[nonLinearPower_low] meta];
        int v91 = *(_DWORD *)([v90 exposureParams] + 24);

        float32x4_t v92 = [a4[nonLinearPower_low] meta];
        int v93 = *(_DWORD *)([v92 exposureParams] + 36);

        float32x4_t v94 = [a4[nonLinearPower_low] meta];
        uint64_t v95 = [v94 exposureParams];
        v96 = [a4[linearThreshold_low] meta];
        float RelativeBrightness = getRelativeBrightness(v95, [v96 exposureParams], 2);

        LODWORD(v98) = v91;
        double v99 = [NSNumber numberWithFloat:v98];
        [v121 setObject:v99 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

        LODWORD(v100) = v93;
        uint64_t v101 = [NSNumber numberWithFloat:v100];
        [v121 setObject:v101 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

        *(float *)&double v102 = RelativeBrightness;
        id v103 = [NSNumber numberWithFloat:v102];
        [v121 setObject:v103 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

        id v104 = [a4[linearThreshold_low] meta];
        LODWORD(v95) = llroundf(*(float *)([v104 exposureParams] + 48) * 4096.0);

        v105 = [NSNumber numberWithUnsignedShort:v95];
        [v121 setObject:v105 forKeyedSubscript:*MEMORY[0x263F2F4F8]];
      }
      goto LABEL_43;
    }
    uint64_t v18 = v114;
    v106 = v121;
    uint64_t v108 = (void *)v117;
    uint64_t v107 = (void *)v118;
LABEL_60:
    uint64_t v27 = v119;
    goto LABEL_44;
  }
LABEL_43:
  v129[0] = [(CMIPostConfig *)v40 miwbOutputLumaTexture];
  id v128 = [(CMIPostConfig *)v40 miwbOutputChromaTexture];
  FigMetalDecRef();
  FigMetalDecRef();

  int v26 = 0;
  v106 = v121;
  uint64_t v108 = (void *)v117;
  uint64_t v107 = (void *)v118;
LABEL_44:

  id v19 = v116;
LABEL_45:

  return v26;
}

- (id)_runInferenceProvider:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  id v6 = v4[2](v4);
  BOOL v7 = v6;
  if (!v6 || [v6 status])
  {
    FigDebugAssert3();
    int v8 = 0;
  }
  else
  {
    int v8 = [[BoundInferenceResults alloc] initWithResult:v7 andMetal:self->_metal];
    if (v8)
    {
      if (*v5 == 1) {
        kdebug_trace();
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }

  return v8;
}

- (int)_freeInputBandPyramidForFrame:(int)a3
{
  if (self->_inputBands->bands[a3]->levels >= 1)
  {
    uint64_t v4 = a3;
    +[PyramidStorage makePyramidAliasable:metal:releaseBand0:](PyramidStorage, "makePyramidAliasable:metal:releaseBand0:");
    self->_inputBands->bands[v4]->levels = 0;
  }
  return 0;
}

- (int)_getPyramidLevel:(id)a3 withWidth:(unsigned int)a4 withHeight:(unsigned int)a5
{
  BOOL v7 = (unsigned int *)a3;
  int v8 = v7;
  if (!v7 || !a4 || !a5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_14;
  }
  if (!v7[2])
  {
LABEL_14:
    LODWORD(v9) = -1;
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  unsigned int v10 = 16;
  while (([*(id *)&v8[2 * v9 + 84] width] != a4 || objc_msgSend(*(id *)&v8[2 * v9 + 84], "height") != a5)
       && ([*(id *)&v8[2 * v9 + 84] width] != (a4 - 1 + v10) / v10 * v10
        || [*(id *)&v8[2 * v9 + 84] height] != (a5 - 1 + v10) / v10 * v10))
  {
    if (v10 <= 1) {
      unsigned int v10 = 1;
    }
    else {
      v10 >>= 1;
    }
    if (++v9 >= (unint64_t)v8[2]) {
      goto LABEL_14;
    }
  }
LABEL_15:

  return v9;
}

- (int)doGainMap:(const FusionConfiguration *)a3 properties:(id *)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7 useFusedFrame:(BOOL)a8 processingType:(unsigned int)a9
{
  BOOL v9 = a8;
  id v15 = a5;
  uint64_t v16 = (float **)a7;
  uint64_t v17 = v16;
  if (!v16) {
    goto LABEL_99;
  }
  uint64_t v18 = v16[11];
  if (!v18 || !a3) {
    goto LABEL_99;
  }
  if (!a4)
  {
    FigDebugAssert3();
LABEL_100:
    uint64_t v30 = 0;
    int v55 = -12780;
    goto LABEL_92;
  }
  if (!v15) {
    goto LABEL_99;
  }
  float v19 = v18[114];
  float v20 = v18[115];
  float v21 = fabsf(v20);
  BOOL v22 = fabsf(v19) > 1.0 || v20 <= v19;
  if (v22 || v21 > 1.0) {
    goto LABEL_99;
  }
  v76 = a6;
  float v24 = v18[116];
  unsigned int v25 = [v15 width];
  unsigned int v26 = [v15 height];
  float linearScale = a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale;
  if (linearScale != NAN)
  {
    BOOL v28 = 0;
    if ((LODWORD(linearScale) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_99;
  }
  float linearScale = a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold;
  BOOL v28 = LODWORD(linearScale) != -1;
  if ((LODWORD(linearScale) & 0x80000000) != 0)
  {
LABEL_99:
    FigDebugAssert3();
    a4 = 0;
    goto LABEL_100;
  }
LABEL_15:
  BOOL v74 = v28;
  float v79 = linearScale;
  int v81 = v17;
  unsigned int v72 = v26;
  unsigned int v78 = a4;
  unsigned int v73 = v25;
  BOOL v77 = v9;
  if (v9)
  {
    a4 = self->_fusedBand->textureY[0];
    int v29 = self->_fusedBand->textureUV[0];
    uint64_t v30 = v29;
    if (a4) {
      BOOL v31 = v29 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    if (!v31) {
      goto LABEL_46;
    }
    int v32 = self->_fusedBand->textureY[1];

    textureUV = &self->_fusedBand->textureUV[1];
    a4 = (id *)v32;
    goto LABEL_45;
  }
  uint64_t v34 = LODWORD(linearScale);
  double v35 = self->_inputBands->bands[LODWORD(linearScale)];
  LODWORD(levels) = v35->levels;
  if ((int)levels < 1)
  {
    a4 = 0;
LABEL_43:
    uint64_t v30 = 0;
    if (levels) {
      goto LABEL_47;
    }
LABEL_44:
    textureUV = self->_inputBands->bands[v34]->textureUV;
LABEL_45:
    id v44 = *textureUV;

    uint64_t v30 = v44;
    goto LABEL_46;
  }
  id v70 = v15;
  uint64_t v37 = self;
  a4 = 0;
  unint64_t v38 = v26;
  unint64_t v39 = v25;
  while (1)
  {
    id v40 = a4;
    a4 = v35->textureY[(levels - 1)];

    if (v25 <= (unint64_t)[a4 width] >> 1) {
      break;
    }
    if (levels < 2) {
      goto LABEL_35;
    }
LABEL_32:
    double v35 = v37->_inputBands->bands[v34];
    LODWORD(levels) = levels - 1;
  }
  if (v38 > (unint64_t)[a4 height] >> 1 && levels > 1) {
    goto LABEL_32;
  }
LABEL_35:
  uint64_t levels = v37->_inputBands->bands[v34]->levels;
  if ((int)levels < 1)
  {
    id v15 = v70;
    self = v37;
    float linearScale = v79;
    goto LABEL_43;
  }
  uint64_t v30 = 0;
  uint64_t v42 = levels + 1;
  while (1)
  {
    BOOL v43 = v30;
    uint64_t v30 = v37->_inputBands->bands[v34]->textureUV[(v42 - 2)];

    if (v39 <= [(MTLTexture *)v30 width] && v38 <= [(MTLTexture *)v30 height]) {
      break;
    }
    if ((unint64_t)--v42 <= 1)
    {
      id v15 = v70;
      self = v37;
      goto LABEL_44;
    }
  }
  id v15 = v70;
  self = v37;
LABEL_46:
  float linearScale = v79;
LABEL_47:
  if (self->_nrfConfig->_isMeteorPlusPlusEnabled)
  {
    uint64_t v45 = SLODWORD(linearScale);
    memset(v82, 0, 240);
    BOOL v46 = v77 || *(unsigned char *)([v78[SLODWORD(linearScale)] colorSpaceConversionParameters] + 196) != 0;
    if (a9 == 1) {
      BOOL v46 = 0;
    }
    BOOL v80 = v46;
    gainMapStage = self->_gainMapStage;
    uint64_t v52 = (uint64_t)v81[11];
    int v53 = [v78[v45] meta];
    -[GainMapStage setGainMapConfig:tuning:frameMetadata:width:height:isLinear:](gainMapStage, "setGainMapConfig:tuning:frameMetadata:width:height:isLinear:", v82, v52, v53, [v15 width], objc_msgSend(v15, "height"), v80);

    int v54 = [(GainMapStage *)self->_gainMapStage computeGainMapWithInput:a4 secondInput:v30 output:v15 properties:v78[v45] mpconfig:v82];
    if (v54)
    {
      int v55 = v54;
      uint64_t v17 = v81;
      goto LABEL_92;
    }
    float v47 = 1.0;
    uint64_t v17 = v81;
    goto LABEL_86;
  }
  float v47 = 1.0;
  uint64_t v17 = v81;
  BOOL v48 = v74;
  if (!v74)
  {
    BOOL v49 = v77;
    if (!v77) {
      goto LABEL_61;
    }
LABEL_53:
    BOOL v50 = LODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale) == -1;
    goto LABEL_62;
  }
  BOOL v49 = v77;
  if (LODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale) == -1)
  {
    int32x2_t v58 = [*v78 meta];
    float v47 = fmaxf(v24 * estimateLTMSoftGainFromFrameProperties(v58, 0), 1.0) * 0.25;

    BOOL v48 = v74;
    float linearScale = v79;
    if (!v77) {
      goto LABEL_61;
    }
    goto LABEL_53;
  }
  if (v77) {
    goto LABEL_53;
  }
LABEL_61:
  uint64_t v56 = [v78[SLODWORD(linearScale)] colorSpaceConversionParameters];
  float linearScale = v79;
  BOOL v50 = *(unsigned char *)(v56 + 196) != 0;
LABEL_62:
  BOOL v75 = v50;
  if (v48 && (float v47 = 1.0, LODWORD(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale) == -1))
  {
    int32x2_t v59 = [*v78 meta];
    float v47 = fmaxf(v24 * estimateLTMSoftGainFromFrameProperties(v59, 0), 1.0) * 0.25;

    float linearScale = v79;
    if (v49) {
      goto LABEL_65;
    }
  }
  else if (v49)
  {
LABEL_65:
    BOOL v57 = self->_fusedBand->textureY[1];
    if (!v57) {
      goto LABEL_89;
    }
LABEL_82:
    if ([(MTLTexture *)v57 width] < (unint64_t)v73
      || [(MTLTexture *)v57 height] < (unint64_t)v72)
    {
      FigDebugAssert3();
      goto LABEL_90;
    }
    *(float *)&double v65 = v19;
    *(float *)&double v66 = v20;
    *(float *)&double v67 = v47;
    int v68 = [(GainMapStage *)self->_gainMapStage runWithInput:v57 output:v15 minThreshold:v75 maxThreshold:v65 inputIsLinear:v66 inputScaling:v67];
    if (v68)
    {
      int v55 = v68;
      goto LABEL_91;
    }

LABEL_86:
    int v55 = 0;
    if (v76) {
      float *v76 = v47 * 4.0;
    }
    goto LABEL_92;
  }
  uint64_t v60 = self->_inputBands->bands[SLODWORD(linearScale)];
  int v61 = v60->levels;
  if (v61 < 2) {
    goto LABEL_89;
  }
  id v71 = v15;
  BOOL v57 = 0;
  uint64_t v62 = SLODWORD(linearScale);
  while (2)
  {
    double v63 = v57;
    BOOL v57 = v60->textureY[v61 - 1];

    if (v73 > (unint64_t)[(MTLTexture *)v57 width])
    {
      if (v61 < 3) {
        break;
      }
      goto LABEL_80;
    }
    if (v72 > (unint64_t)[(MTLTexture *)v57 height] && v61 > 2)
    {
LABEL_80:
      uint64_t v60 = self->_inputBands->bands[v62];
      --v61;
      continue;
    }
    break;
  }
  id v15 = v71;
  uint64_t v17 = v81;
  if (v57) {
    goto LABEL_82;
  }
LABEL_89:
  FigDebugAssert3();
  BOOL v57 = 0;
LABEL_90:
  int v55 = -12780;
LABEL_91:

LABEL_92:
  return v55;
}

- (int)doGainMapOnSingleFrameWithFrameIndex:(unsigned int)a3 properties:(id)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7
{
  BOOL v7 = self->_inputBands->bands[a3];
  return [(DenoiseFusePipeline *)self doGainMapOnSingleFrameLuma:v7->textureY[0] chroma:v7->textureUV[0] properties:a4 output:a5 outputHeadroom:a6 nrfPlist:a7];
}

- (int)doGainMapOnSingleFrameLuma:(id)a3 chroma:(id)a4 properties:(id)a5 output:(id)a6 outputHeadroom:(float *)a7 nrfPlist:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = (float **)a8;
  float v19 = v18;
  if (!v14
    || !v15
    || !v17
    || !v16
    || !v18
    || (float v20 = v18[11]) == 0
    || ((v21 = v20[114], float v22 = v20[115], v23 = fabsf(v22), fabsf(v21) <= 1.0) ? (v24 = v22 <= v21) : (v24 = 1),
        !v24 ? (BOOL v25 = v23 > 1.0) : (BOOL v25 = 1),
        v25))
  {
    FigDebugAssert3();
    int v35 = -12780;
    goto LABEL_21;
  }
  if (self->_nrfConfig->_isMeteorPlusPlusEnabled)
  {
    id v44 = v18;
    memset(v45, 0, 240);
    gainMapStage = self->_gainMapStage;
    [v16 meta];
    id v27 = v14;
    v29 = id v28 = v15;
    uint64_t v30 = a7;
    id v31 = v16;
    uint64_t v32 = [v17 width];
    uint64_t v33 = [v17 height];
    uint64_t v34 = v32;
    id v16 = v31;
    a7 = v30;
    [(GainMapStage *)gainMapStage setGainMapConfig:v45 tuning:v20 frameMetadata:v29 width:v34 height:v33 isLinear:1];

    id v15 = v28;
    id v14 = v27;
    int v35 = [(GainMapStage *)self->_gainMapStage computeGainMapWithInput:v27 secondInput:v15 output:v17 properties:v16 mpconfig:v45];
    if (!v30)
    {
      float v19 = v44;
      goto LABEL_21;
    }
    float v36 = 1.0;
    float v19 = v44;
  }
  else
  {
    float v37 = v20[116];
    id v38 = v16;
    unint64_t v39 = [v16 meta];
    float v36 = fmaxf(v37 * estimateLTMSoftGainFromFrameProperties(v39, 0), 1.0) * 0.25;

    *(float *)&double v40 = v21;
    *(float *)&double v41 = v22;
    *(float *)&double v42 = v36;
    int v35 = [(GainMapStage *)self->_gainMapStage runWithInputDownsampled:v14 output:v17 minThreshold:1 maxThreshold:v40 inputIsLinear:v41 inputScaling:v42];
    id v16 = v38;
    if (!a7) {
      goto LABEL_21;
    }
  }
  if (!v35)
  {
    int v35 = 0;
    *a7 = v36 * 4.0;
  }
LABEL_21:

  return v35;
}

- (void)prepareGainMapMetadata:(id)a3 hasFaces:(BOOL)a4
{
}

- (int)extractLinearBufferWithConfig:(const FusionConfiguration *)a3 referenceFrameProperties:(id)a4 output:(__CVBuffer *)a5
{
  fusionBuffers = self->_fusionBuffers;
  fusedLumaTex = fusionBuffers->fusedLumaTex;
  fusedChromaTex = fusionBuffers->fusedChromaTex;
  id v11 = a4;
  uint64_t v12 = *(unsigned __int8 *)([v11 colorSpaceConversionParameters] + 196);
  uint64_t nonLinearPower_low = LOBYTE(a3[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower);
  id v14 = [v11 meta];
  uint64_t v15 = [v14 exposureParams];
  id v16 = (double *)[v11 colorSpaceConversionParameters];

  LODWORD(a5) = -[DenoiseFusePipeline extractLinearBufferWithLumaInput:chromaInput:inputIsLinear:removeChromaBias:lumaPedestal:exposureParams:ccm:output:](self, "extractLinearBufferWithLumaInput:chromaInput:inputIsLinear:removeChromaBias:lumaPedestal:exposureParams:ccm:output:", fusedLumaTex, fusedChromaTex, v12, nonLinearPower_low, v15, a5, 0.0, v16[12], v16[14], v16[16]);
  return (int)a5;
}

- (uint64_t)extractLinearBufferWithLumaInput:(double)a3 chromaInput:(double)a4 inputIsLinear:(double)a5 removeChromaBias:(uint64_t)a6 lumaPedestal:(uint64_t)a7 exposureParams:(uint64_t)a8 ccm:(uint64_t)a9 output:(uint64_t)a10
{
  return objc_msgSend(*(id *)(a1 + 208), "extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:", a7, a8, 16, 8, a9, a10, a2, 0.0, a3, a4, a5, a11, a12);
}

- (void)resetFusion:(unsigned int)a3
{
  if (a3 != 1)
  {
    if (a3 != 2) {
      return;
    }
    [(MotionDetection *)self->_motionDetection releaseResources];
  }
  +[PyramidStorage makePyramidAliasable:self->_fusedBand metal:self->_metal];
  +[PyramidStorage makePyramidAliasable:self->_accWeightPyramid metal:self->_metal releaseBand0:1];
  accWeightPyramid = self->_accWeightPyramid;
  self->_accWeightPyramid = 0;
}

- (int)blinkDetectionOnFrameIdx:(int)a3 imgMeta:(id)a4 plist:(id)a5 resultScore:(float *)a6 frameIdx:(int)a7
{
  blinkDetectionStage = self->_blinkDetectionStage;
  id v11 = self->_inputBands->bands[a3]->textureY[1];
  uint64_t v12 = self->_inputBands->bands[a3]->textureY[2];
  id v13 = self->_inputBands->bands[a3]->textureY[3];
  id v14 = a5;
  id v15 = a4;
  id v16 = [v15 faces];
  id v17 = [v15 faces];

  LODWORD(v20) = a7;
  int v18 = -[BlinkDetectionStage runOnLumaBand1:lumaBand2:lumaBand3:withFaces:facesCount:plist:resultScore:frameIdx:](blinkDetectionStage, "runOnLumaBand1:lumaBand2:lumaBand3:withFaces:facesCount:plist:resultScore:frameIdx:", v11, v12, v13, v16, [v17 count], v14, a6, v20);

  return v18;
}

- (unsigned)getSRLStatus
{
  return [(CMIPost *)self->_post getSRLStatus];
}

- (id)getSTFLTM_asNSData
{
  return [(CMIPost *)self->_post getSTFLTM_asNSData];
}

- (int)getSTFStillCorrectionStrength:(BOOL)a3
{
  return [(CMIPost *)self->_post getSTFStillCorrectionStrength:a3];
}

- (BOOL)getSTFStillApplied
{
  return [(CMIPost *)self->_post stfStillApplied];
}

- (unsigned)getSTFStillAnalyticsVersion
{
  return [(CMIPost *)self->_post stfStillAnalyticsVersion];
}

- (int)freeInputBandPyramids
{
  if (self->_currentFrame < 0) {
    return 0;
  }
  LODWORD(v3) = -1;
  while (1)
  {
    uint64_t v3 = (v3 + 1);
    int v4 = [(DenoiseFusePipeline *)self _freeInputBandPyramidForFrame:v3];
    if (v4) {
      break;
    }
    if ((int)v3 >= self->_currentFrame) {
      return 0;
    }
  }
  int v5 = v4;
  FigDebugAssert3();
  return v5;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (BOOL)srlEnabled
{
  return self->_srlEnabled;
}

- (void)setSrlEnabled:(BOOL)a3
{
  self->_srlEnabled = a3;
}

- (BOOL)stfAllowed
{
  return self->_stfAllowed;
}

- (void)setStfAllowed:(BOOL)a3
{
  self->_stfAllowed = a3;
}

- (BOOL)skipDenoising
{
  return self->_skipDenoising;
}

- (void)setSkipDenoising:(BOOL)a3
{
  self->_BOOL skipDenoising = a3;
}

- (BOOL)allowModifyingInputBuffers
{
  return self->_allowModifyingInputBuffers;
}

- (void)setAllowModifyingInputBuffers:(BOOL)a3
{
  self->_allowModifyingInputBuffers = a3;
}

- (BOOL)doGreenGhostMitigation
{
  return self->_doGreenGhostMitigation;
}

- (void)setDoGreenGhostMitigation:(BOOL)a3
{
  self->_doGreenGhostMitigatiouint64_t n = a3;
}

- (int)fusionReferenceFrame
{
  return self->_fusionReferenceFrame;
}

- (void)setFusionReferenceFrame:(int)a3
{
  self->_fusionReferenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_softLTMStage, 0);
  objc_storeStrong((id *)&self->_fusionBuffers, 0);
  objc_storeStrong((id *)&self->_greenGhostBuffers, 0);
  objc_storeStrong((id *)&self->_greenGhostLowLightStage, 0);
  objc_storeStrong((id *)&self->_grayGhostDetection, 0);
  objc_storeStrong((id *)&self->_motionDetection, 0);
  objc_storeStrong((id *)&self->_accWeightPyramid, 0);
  objc_storeStrong((id *)&self->_ColorCubeCorrectionStage, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_bilateralGrid, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_fusedBand, 0);
  objc_storeStrong((id *)&self->_inputBands, 0);
  objc_storeStrong((id *)&self->_blinkDetectionStage, 0);
  objc_storeStrong((id *)&self->_outliersRemovalStage, 0);
  objc_storeStrong((id *)&self->_fusionRemixStage, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_backgroundLearnedNR, 0);
  objc_storeStrong((id *)&self->_concurrentProcessing, 0);
  objc_storeStrong((id *)&self->_gainMapStage, 0);
  objc_storeStrong((id *)&self->_colorConvertStage, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_pyramidStage, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_backgroundMetal, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  for (uint64_t i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_inputYCbCr[i + 4], 0);
  for (uint64_t j = 96; j != 56; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
    j -= 8;
  }
  while (j != 16);

  objc_storeStrong((id *)&self->_options, 0);
}

@end