@interface DenoiseFusePipeline
+ (int)prewarmShaders:(id)a3;
+ (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 metal:(id)a5;
- (BOOL)doGreenGhostMitigation;
- (BOOL)getSTFStillApplied;
- (BOOL)srlEnabled;
- (DenoiseFusePipeline)initWithContext:(id)a3 nrfConfig:(id)a4 dasTuningOptions:(id)a5 toneMappingOptions:(id)a6;
- (SidecarWriter)sidecarWriter;
- (id)_runInferenceProvider:(id)a3;
- (id)getAMBNRStage:(const DenoiseRemixStageOptions *)a3;
- (id)getSTFLTM_asNSData;
- (int)_ensureInputBandPyramidIsAllocatedForFrame:(int)a3;
- (int)_freeInputBandPyramidForFrame:(int)a3;
- (int)addFrame:(__CVBuffer *)a3 cfp:(const frameProperties_t *)a4 processingType:(unsigned int)a5 batchCount:(int)a6;
- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4 levels:(int)a5 frames:(int)a6;
- (int)allocateResourcesIfNeededForDesc:(id)a3 didAllocate:(BOOL *)a4;
- (int)applyGlobalDistortionCorrectionInplaceWithPixelBuffer:(__CVBuffer *)a3 amount:(float)a4 gdcPlist:(id)a5 cscParams:(const ColorSpaceConversionParameters *)a6;
- (int)baseLayer:(__CVBuffer *)a3;
- (int)blinkDetectionOnFrameIdx:(int)a3 imgMeta:(const frameMetadata *)a4 plist:(id)a5 resultScore:(float *)a6 frameIdx:(int)a7;
- (int)collectSyntheticReferenceDetectorsResultsSync:(float *)a3 srMode:(int *)a4 nrfPlist:(id)a5;
- (int)computeMotionScore:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 motionScore:(float *)a7 nrfPlist:(id)a8;
- (int)computeRansacColorMatchingCoefficients:(const FusionConfiguration *)a3 scaleEv0brightness:(float)a4 applyToPyramid:(BOOL)a5 andStoreTransform:(id *)a6;
- (int)createPyramidForFrame:(id)a3 cfp:(const frameProperties_t *)a4;
- (int)denoiseFrameWithOutput:(id)a3 input:(id)a4 localGainMap:(id)a5 skinMask:(id)a6 skyMask:(id)a7 maskExtent:(CGRect)a8 exposure:(const exposureParameters *)a9 staticScene:(BOOL)a10 nrfPlist:(id)a11 defringeEnabled:(BOOL)a12 isLowLight:(BOOL)a13 greenGhostEnabled:(BOOL)a14 faceLandMarks:(id)a15 ev0FrameMetadata:(const frameMetadata *)a16 evmFrameMetadata:(const frameMetadata *)a17 gainMap:(id)a18;
- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 input:(__CVBuffer *)a5 cfp:(frameProperties_t *)a6 nrfPlist:(id)a7 style:(id)a8 inferenceProvider:(id)a9 defringeEnabled:(BOOL)a10 colorCubeFixType:(int)a11;
- (int)doDeepFusionProxyAsset:(id)a3 syntheticReference:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 inferenceResults:(id)a7 style:(id)a8 nrfPlist:(id)a9;
- (int)doDeepFusionPyramidGeneration:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 syntheticReferenceFramesOnly:(BOOL)a5 pyramidHasBeenBuiltArray:(BOOL *)a6;
- (int)doGainMap:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7 useFusedFrame:(BOOL)a8;
- (int)doSyntheticLong:(id)a3 noiseDivisorTex:(id)a4 realLongNoiseDivisorTex:(id)a5 lscGainsTex:(id)a6 config:(const FusionConfiguration *)a7 properties:(const frameProperties_t *)a8 motionScore:(float)a9 nrfPlist:(id)a10 intermediateMetadata:(id)a11;
- (int)downsampleBand0Frame:(id)a3 sourceFrameIndex:(int)a4;
- (int)extractLinearBufferWithConfig:(const FusionConfiguration *)a3 referenceFrameProperties:(const frameProperties_t *)a4 output:(__CVBuffer *)a5;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(frameProperties_t *)a4;
- (int)freeInputBandPyramids;
- (int)fuseFramesWithConfig:(const FusionConfiguration *)a3 properties:(frameProperties_t *)a4 nrfPlist:(id)a5 batchN:(int)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 isLowLight:(BOOL)a9;
- (int)fusionReferenceFrame;
- (int)getSTFStillCorrectionStrength:(BOOL)a3;
- (int)greenGhostMitigationWithRefIndex:(int)a3 bracketIndex:(int)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 tuningParams:(id)a7;
- (int)lowLightHybridRegister:(int)a3 refFrameIdx:(int)a4 nonRefFrameProps:(frameProperties_t *)a5 refFrameProps:(const frameProperties_t *)a6 canCopyBack:(BOOL)a7 nrfPlist:(id)a8;
- (int)nrfFusionDenseRegister:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(frameProperties_t *)a6;
- (int)runMotionDetectionLL:(BOOL)a3 imgIndex:(int)a4 imgProperties:(frameProperties_t *)a5 refProperties:(frameProperties_t *)a6;
- (int)sanityCheckRansacColorModel:(RansacModel *)a3;
- (int)selectNRFFusionReferenceFrame:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(frameProperties_t *)a6 nrfPlist:(id)a7;
- (int)setFusionMode:(int)a3;
- (int)startSyntheticReferenceDetectors:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 nrfPlist:(id)a5;
- (int)toneMapAndDenoiseFusedFramesWithConfig:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 nrfPlist:(id)a5 style:(id)a6 output:(__CVBuffer *)a7 inferenceProvider:(id)a8 colorCubeFixType:(int)a9 isLowLight:(BOOL)a10 gainMap:(id)a11;
- (int)toneMapBand1Frame:(id)a3 properties:(const frameProperties_t *)a4 sourceFrameType:(int)a5 sourceFrameIndex:(int)a6 ltcFrameIndex:(int)a7 gtcFrameIndex:(int)a8 nrfPlist:(id)a9;
- (uint64_t)deepFusionBuildNoiseMap:(double)a3 lscGainsTex:(uint64_t)a4 config:(void *)a5 evmProperties:(void *)a6 evmGreenTintAdjustment:(uint64_t)a7 ev0Properties:(uint64_t)a8 nrfPlist:(uint64_t)a9;
- (uint64_t)doSyntheticReference:(double)a3 noiseDivisorOutputTex:(uint64_t)a4 lscGainsTex:(void *)a5 config:(void *)a6 evmProperties:(void *)a7 evmGreenTintAdjustment:(uint64_t)a8 ev0Properties:(uint64_t)a9 nrfPlist:(uint64_t)a10 intermediateMetadata:(id)a11;
- (uint64_t)extractLinearBufferWithLumaInput:(uint64_t)a3 chromaInput:(uint64_t)a4 inputIsLinear:removeChromaBias:lumaPedestal:exposureParams:ccm:output:;
- (unsigned)filterOutlierPairsInPlace:(float *)a3 and:(float *)a4 withMinX:(float)a5 maxX:(float)a6 inputSize:(int)a7;
- (unsigned)getSRLStatus;
- (unsigned)getSTFStillAnalyticsVersion;
- (void)dealloc;
- (void)releaseAllBindings;
- (void)releaseInputBindings;
- (void)releaseResources;
- (void)reset;
- (void)resetFusion:(unsigned int)a3;
- (void)setDoGreenGhostMitigation:(BOOL)a3;
- (void)setFusionReferenceFrame:(int)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)swapInputFrame:(int)a3 withFrame:(int)a4;
@end

@implementation DenoiseFusePipeline

- (id)getAMBNRStage:(const DenoiseRemixStageOptions *)a3
{
  uint64_t count = self->_ambnrStageCache.count;
  if (count)
  {
    uint64_t v5 = 0;
    p_enableGdFlatness = &self->_ambnrStageCache.entries[0].options.enableGdFlatness;
    while (a3->lgaAlgorithm != *(_DWORD *)(p_enableGdFlatness - 9)
         || a3->enableBandZeroDenoising != *(p_enableGdFlatness - 5)
         || a3->enableBilateralRegression != *(p_enableGdFlatness - 4)
         || a3->enableLoGOffset != *(p_enableGdFlatness - 3)
         || a3->enableLowVarSharpening != *(p_enableGdFlatness - 2)
         || a3->enableNoiseMap != *(p_enableGdFlatness - 1)
         || a3->enableGdFlatness != *p_enableGdFlatness)
    {
      p_enableGdFlatness += 16;
      if (count == ++v5) {
        goto LABEL_11;
      }
    }
    v7 = objc_msgSend_objectAtIndexedSubscript_(self->_ambnrStages, a2, v5, v3);
  }
  else
  {
LABEL_11:
    v7 = 0;
  }

  return v7;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  int v6 = objc_msgSend_prewarmShaders_(WarpStage, v4, (uint64_t)v3, v5);
  v7 = [DenoiseFusePipelineShaders alloc];
  v10 = objc_msgSend_initWithMetal_(v7, v8, (uint64_t)v3, v9);
  if (!v10) {
    int v6 = -12786;
  }

  objc_msgSend_prewarmShaders_(ColorCubeCorrectionStage, v11, (uint64_t)v3, v12);
  objc_msgSend_prewarmShaders_(BlinkDetectionStage, v13, (uint64_t)v3, v14);

  return v6;
}

- (DenoiseFusePipeline)initWithContext:(id)a3 nrfConfig:(id)a4 dasTuningOptions:(id)a5 toneMappingOptions:(id)a6
{
  v358[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  uint64_t v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v336.receiver = self;
  v336.super_class = (Class)DenoiseFusePipeline;
  v15 = [(DenoiseFusePipeline *)&v336 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_138;
  }
  if (v12[61]) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v12[66] != 0;
  }
  v15->_progressiveFusionEnabled = v17;
  if (v12[61]) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v12[63] != 0;
  }
  v15->_deepFusionEnabled = v18;
  if (v12[61]) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v12[65] != 0;
  }
  v15->_ubFusionEnabled = v19;
  p_metal = (uint64_t *)&v15->_metal;
  objc_storeStrong((id *)&v15->_metal, a3);
  p_nrfConfig = &v16->_nrfConfig;
  objc_storeStrong((id *)&v16->_nrfConfig, a4);
  v23 = objc_msgSend_sharedInstance(DenoiseFusePipelineShared, v20, v21, v22);
  uint64_t v26 = objc_msgSend_getShaders_(v23, v24, (uint64_t)v16->_metal, v25);
  shaders = v16->_shaders;
  v16->_shaders = (DenoiseFusePipelineShaders *)v26;

  if (!v16->_shaders) {
    goto LABEL_136;
  }
  v28 = [PyramidStage_NRF alloc];
  v357[0] = @"PyrGen.UseHW";
  v357[1] = @"PyrGen.SupportFP16";
  v358[0] = &unk_270E50580;
  v358[1] = &unk_270E50598;
  v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v358, (uint64_t)v357, 2);
  uint64_t v32 = objc_msgSend_initWithOptions_context_(v28, v31, (uint64_t)v30, (uint64_t)v11);
  pyramidStage = v16->_pyramidStage;
  v16->_pyramidStage = (PyramidStage_NRF *)v32;

  if (!v16->_pyramidStage) {
    goto LABEL_137;
  }
  v34 = [TextureUtils alloc];
  uint64_t v37 = objc_msgSend_initWithMetalContext_(v34, v35, (uint64_t)v11, v36);
  textureUtils = v16->_textureUtils;
  v16->_textureUtils = (TextureUtils *)v37;

  if (!v16->_textureUtils) {
    goto LABEL_137;
  }
  v39 = [ColorConvertStage alloc];
  uint64_t v42 = objc_msgSend_initWithMetalContext_(v39, v40, (uint64_t)v11, v41);
  colorConvertStage = v16->_colorConvertStage;
  v16->_colorConvertStage = (ColorConvertStage *)v42;

  if (!v16->_colorConvertStage) {
    goto LABEL_137;
  }
  v44 = [GlobalDistortionCorrectionStage alloc];
  uint64_t v47 = objc_msgSend_initWithMetalContext_(v44, v45, (uint64_t)v11, v46);
  globalDistortionCorrectionStage = v16->_globalDistortionCorrectionStage;
  v16->_globalDistortionCorrectionStage = (GlobalDistortionCorrectionStage *)v47;

  if (!v16->_globalDistortionCorrectionStage)
  {
    FigDebugAssert3();
    goto LABEL_137;
  }
  v287 = v14;
  v16->_ambnrStageCache.uint64_t count = 0;
  v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  ambnrStages = v16->_ambnrStages;
  v16->_ambnrStages = v49;

  v16->_doGreenGhostMitigatiouint64_t n = 0;
  v301 = v16;
  uint64_t v51 = MEMORY[0x263EFFA88];
  uint64_t v349 = MEMORY[0x263EFFA88];
  v348[0] = @"SingleImageParameters";
  v348[1] = @"DefaultUBModeParameters";
  uint64_t v350 = objc_msgSend_numberWithInt_(NSNumber, v52, v12[61] == 0, v53);
  uint64_t v286 = (uint64_t)v11;
  v54 = (void *)v350;
  v348[2] = @"ToneMappedUBParameters";
  v285 = v12;
  v57 = objc_msgSend_numberWithInt_(NSNumber, v55, v12[61] == 0, v56);
  v351 = v57;
  v348[3] = @"LowLightUBParameters";
  v60 = objc_msgSend_numberWithBool_(NSNumber, v58, v301->_progressiveFusionEnabled, v59);
  v352 = v60;
  v348[4] = @"LowLightUBParameters_max";
  v63 = objc_msgSend_numberWithBool_(NSNumber, v61, v301->_progressiveFusionEnabled, v62);
  v353 = v63;
  v348[5] = @"ProxyAssetEV0RefParameters";
  v66 = objc_msgSend_numberWithBool_(NSNumber, v64, v301->_deepFusionEnabled, v65);
  v354 = v66;
  v348[6] = @"ProxyAssetEVMRefParameters";
  v69 = objc_msgSend_numberWithBool_(NSNumber, v67, v301->_deepFusionEnabled, v68);
  v348[7] = @"SingleImageParametersForLearnedNR";
  v355 = v69;
  uint64_t v356 = v51;
  v16 = v301;
  v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v70, (uint64_t)&v349, (uint64_t)v348, 8);

  long long v334 = 0u;
  long long v335 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  id v284 = v13;
  obuint64_t j = v13;
  uint64_t v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v72, (uint64_t)&v332, (uint64_t)v347, 16);
  if (v289)
  {
    id v290 = *(id *)v333;
    do
    {
      uint64_t v73 = 0;
      do
      {
        if (*(id *)v333 != v290) {
          objc_enumerationMutation(obj);
        }
        uint64_t v292 = v73;
        v74 = *(void **)(*((void *)&v332 + 1) + 8 * v73);
        long long v328 = 0u;
        long long v329 = 0u;
        long long v330 = 0u;
        long long v331 = 0u;
        id v75 = v74;
        uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v328, (uint64_t)v346, 16);
        if (v77)
        {
          uint64_t v81 = v77;
          uint64_t v82 = *(void *)v329;
          while (2)
          {
            for (uint64_t i = 0; i != v81; ++i)
            {
              if (*(void *)v329 != v82) {
                objc_enumerationMutation(v75);
              }
              uint64_t v84 = *(void *)(*((void *)&v328 + 1) + 8 * i);
              v85 = objc_msgSend_getSharedInstance(DenoiseRemixStageConfig, v78, v79, v80);
              v88 = objc_msgSend_objectForKeyedSubscript_(v85, v86, v84, v87);

              objc_msgSend_objectForKeyedSubscript_(v75, v89, v84, v90);
              v91 = (unsigned char *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend_objectForKeyedSubscript_(v71, v92, v84, v93);

              if (v94) {
                BOOL v98 = v88 == 0;
              }
              else {
                BOOL v98 = 1;
              }
              if (!v98 && v91 != 0)
              {
                int v327 = 0;
                uint64_t v326 = 0;
                LODWORD(v326) = objc_msgSend_lgaAlgorithm(v88, v95, v96, v97);
                BYTE4(v326) = objc_msgSend_enableBandZeroDenoising(v88, v100, v101, v102);
                BYTE5(v326) = v91[18];
                BYTE6(v326) = v91[40];
                BYTE1(v327) = v91[20];
                HIBYTE(v326) = v91[19];
                LOBYTE(v327) = objc_msgSend_enableNoiseMap(v88, v103, v104, v105);
                nrfConfig = v301->_nrfConfig;
                BYTE2(v327) = nrfConfig->_enableChromaticAberrationCorrection;
                HIBYTE(v327) = nrfConfig->_greenGhostMitigationType & 1;
                v109 = objc_msgSend_getAMBNRStage_(v301, v107, (uint64_t)&v326, v108);

                if (!v109)
                {
                  v110 = [AMBNRStage alloc];
                  v114 = objc_msgSend_initWithContext_denoisingOptions_(v110, v111, *p_metal, (uint64_t)&v326);
                  if (!v114 || (uint64_t count = v301->_ambnrStageCache.count, count >= 0xA))
                  {
                    FigDebugAssert3();
                    FigSignalErrorAt();

                    goto LABEL_114;
                  }
                  v301->_ambnrStageCache.uint64_t count = count + 1;
                  uint64_t v116 = (uint64_t)&v301->_ambnrStageCache.entries[count];
                  int v117 = v327;
                  *(void *)(v116 + 4) = v326;
                  *(_DWORD *)(v116 + 12) = v117;
                  objc_msgSend_addObject_(v301->_ambnrStages, v112, (uint64_t)v114, v113);
                }
              }
            }
            uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v328, (uint64_t)v346, 16);
            if (v81) {
              continue;
            }
            break;
          }
        }

        uint64_t v73 = v292 + 1;
      }
      while (v292 + 1 != v289);
      uint64_t v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v118, (uint64_t)&v332, (uint64_t)v347, 16);
    }
    while (v289);
  }

  long long v324 = 0u;
  long long v325 = 0u;
  long long v322 = 0u;
  long long v323 = 0u;
  id v291 = v287;
  uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(v291, v119, (uint64_t)&v322, (uint64_t)v345, 16);
  BOOL v121 = 0;
  if (v296)
  {
    uint64_t v293 = *(void *)v323;
    do
    {
      uint64_t v122 = 0;
      do
      {
        if (*(void *)v323 != v293) {
          objc_enumerationMutation(v291);
        }
        uint64_t v299 = v122;
        v123 = *(void **)(*((void *)&v322 + 1) + 8 * v122);
        if ((*p_nrfConfig)->_isOnlySingleImage)
        {
          v344[0] = @"SingleImageParameters";
          v344[1] = @"SingleImageParametersForLearnedNR";
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v120, (uint64_t)v344, 2);
        }
        else if (v16->_progressiveFusionEnabled)
        {
          v343[0] = @"SingleImageParameters";
          v343[1] = @"DefaultUBModeParameters";
          v343[2] = @"ToneMappedUBParameters";
          v343[3] = @"LowLightUBParameters";
          v343[4] = @"LowLightUBParameters_max";
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v120, (uint64_t)v343, 5);
        }
        else
        {
          v342[0] = @"SingleImageParameters";
          v342[1] = @"DefaultUBModeParameters";
          v342[2] = @"ToneMappedUBParameters";
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v120, (uint64_t)v342, 3);
        v124 = };
        long long v320 = 0u;
        long long v321 = 0u;
        long long v318 = 0u;
        long long v319 = 0u;
        id v125 = v124;
        uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v318, (uint64_t)v341, 16);
        if (v127)
        {
          uint64_t v130 = v127;
          uint64_t v131 = *(void *)v319;
          do
          {
            for (uint64_t j = 0; j != v130; ++j)
            {
              if (*(void *)v319 != v131) {
                objc_enumerationMutation(v125);
              }
              v133 = *(void **)(*((void *)&v318 + 1) + 8 * j);
              uint64_t v134 = objc_msgSend_objectForKeyedSubscript_(v123, v128, (uint64_t)v133, v129);
              v137 = (_DWORD *)v134;
              if (v134)
              {
                BOOL v121 = (*(unsigned __int8 *)(v134 + 56) | v121) != 0;
                if (objc_msgSend_isEqual_(v133, v135, @"DefaultUBModeParameters", v136)) {
                  v301->_srlVersiouint64_t n = v137[18];
                }
              }
            }
            uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v128, (uint64_t)&v318, (uint64_t)v341, 16);
          }
          while (v130);
        }

        uint64_t v122 = v299 + 1;
        v16 = v301;
      }
      while (v299 + 1 != v296);
      uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(v291, v120, (uint64_t)&v322, (uint64_t)v345, 16);
    }
    while (v296);
  }

  v138 = objc_alloc_init(FusionInputBands);
  inputBands = v16->_inputBands;
  v16->_inputBands = v138;

  v140 = objc_alloc_init(AMBNRBuffers);
  ambnrBuffers = v16->_ambnrBuffers;
  v16->_ambnrBuffers = v140;

  fusedBand = v16->_fusedBand;
  v16->_fusedBand = 0;

  accWeightPyramid = v16->_accWeightPyramid;
  v16->_accWeightPyramid = 0;

  v144 = [OutliersRemovalStage alloc];
  uint64_t v147 = objc_msgSend_initWithMetalContext_(v144, v145, (uint64_t)v16->_metal, v146);
  outliersRemovalStage = v16->_outliersRemovalStage;
  v16->_outliersRemovalStage = (OutliersRemovalStage *)v147;

  if (!v16->_nrfConfig->_isOnlySingleImage)
  {
    v149 = [WarpStage alloc];
    uint64_t inited = objc_msgSend_initWarpStage_(v149, v150, (uint64_t)v16->_metal, v151);
    warpStage = v16->_warpStage;
    v16->_warpStage = (WarpStage *)inited;

    if (!v16->_warpStage) {
      goto LABEL_141;
    }
    v154 = [FusionRemixStage alloc];
    uint64_t isPrewarm = objc_msgSend_initBandFusion_nrfConfig_isPrewarm_(v154, v155, (uint64_t)v16->_metal, (uint64_t)v16->_nrfConfig, 0);
    fusionRemixStage = v16->_fusionRemixStage;
    v16->_fusionRemixStage = (FusionRemixStage *)isPrewarm;

    if (!v16->_fusionRemixStage) {
      goto LABEL_141;
    }
    v158 = [MotionDetection alloc];
    uint64_t v161 = objc_msgSend_initWithMetalContext_(v158, v159, (uint64_t)v16->_metal, v160);
    motionDetectiouint64_t n = v16->_motionDetection;
    v16->_motionDetectiouint64_t n = (MotionDetection *)v161;

    if (!v16->_motionDetection) {
      goto LABEL_141;
    }
    v163 = [GrayGhostDetection alloc];
    uint64_t v166 = objc_msgSend_initWithMetalContext_(v163, v164, (uint64_t)v16->_metal, v165);
    grayGhostDetectiouint64_t n = v16->_grayGhostDetection;
    v16->_grayGhostDetectiouint64_t n = (GrayGhostDetection *)v166;

    if (!v16->_grayGhostDetection) {
      goto LABEL_141;
    }
    v168 = [BlinkDetectionStage alloc];
    uint64_t v171 = objc_msgSend_init_(v168, v169, (uint64_t)v16->_metal, v170);
    blinkDetectionStage = v16->_blinkDetectionStage;
    v16->_blinkDetectionStage = (BlinkDetectionStage *)v171;

    if (!v16->_blinkDetectionStage) {
      goto LABEL_141;
    }
    if (v121 || (*p_nrfConfig)->_enableBilateralGridForHybridRegistration)
    {
      v173 = [BilateralGrid alloc];
      uint64_t v176 = objc_msgSend_initWithContext_(v173, v174, (uint64_t)v16->_metal, v175);
      bilateralGrid = v16->_bilateralGrid;
      v16->_bilateralGrid = (BilateralGrid *)v176;

      if (!v16->_bilateralGrid) {
        goto LABEL_141;
      }
    }
    v178 = [RegDense alloc];
    uint64_t v181 = objc_msgSend_initWithMetalContext_(v178, v179, (uint64_t)v16->_metal, v180);
    regDense = v16->_regDense;
    v16->_regDense = (RegDense *)v181;

    if (!v16->_regDense) {
      goto LABEL_141;
    }
    if ((*p_nrfConfig)->_enableDeepFusion)
    {
      v183 = [SyntheticReferenceStage alloc];
      uint64_t v186 = objc_msgSend_initWithMetalContext_(v183, v184, (uint64_t)v16->_metal, v185);
      syntheticReferenceStage = v16->_syntheticReferenceStage;
      v16->_syntheticReferenceStage = (SyntheticReferenceStage *)v186;

      if (!v16->_syntheticReferenceStage) {
        goto LABEL_141;
      }
      v188 = [SyntheticLongStage alloc];
      uint64_t v191 = objc_msgSend_initWithMetalContext_(v188, v189, (uint64_t)v16->_metal, v190);
      syntheticLongStage = v16->_syntheticLongStage;
      v16->_syntheticLongStage = (SyntheticLongStage *)v191;

      if (!v16->_syntheticLongStage) {
        goto LABEL_141;
      }
    }
  }
  v193 = [ToneMappingStage alloc];
  uint64_t v195 = objc_msgSend_initWithContext_mtlSuballocatorID_(v193, v194, (uint64_t)v16->_metal, 255);
  toneMappingStage = v16->_toneMappingStage;
  v16->_toneMappingStage = (ToneMappingStage *)v195;

  v199 = v16->_toneMappingStage;
  if (v199)
  {
    objc_msgSend_setEnableSTF_(v199, v197, v16->_nrfConfig->_enableSTF, v198);
    v203 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v200, v201, v202);
    objc_msgSend_setStfTuningParameters_(v16->_toneMappingStage, v204, (uint64_t)v203, v205);

    long long v316 = 0u;
    long long v317 = 0u;
    long long v314 = 0u;
    long long v315 = 0u;
    id v206 = v291;
    uint64_t v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v207, (uint64_t)&v314, (uint64_t)v340, 16);
    if (v300)
    {
      uint64_t v211 = 0;
      uint64_t v297 = *(void *)v315;
      id v294 = v206;
      do
      {
        for (uint64_t k = 0; k != v300; ++k)
        {
          if (*(void *)v315 != v297) {
            objc_enumerationMutation(v294);
          }
          v213 = *(void **)(*((void *)&v314 + 1) + 8 * k);
          v214 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v208, v209, v210);
          long long v310 = 0u;
          long long v311 = 0u;
          long long v312 = 0u;
          long long v313 = 0u;
          id v215 = v213;
          uint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v216, (uint64_t)&v310, (uint64_t)v339, 16);
          if (v217)
          {
            uint64_t v220 = v217;
            uint64_t v221 = *(void *)v311;
            do
            {
              for (uint64_t m = 0; m != v220; ++m)
              {
                if (*(void *)v311 != v221) {
                  objc_enumerationMutation(v215);
                }
                uint64_t v223 = *(void *)(*((void *)&v310 + 1) + 8 * m);
                v225 = objc_msgSend_objectForKeyedSubscript_(v215, v218, v223, v219);
                uint64_t v226 = v225[10];
                if (v226) {
                  objc_msgSend_setObject_forKey_(v214, v224, v226, v223);
                }
              }
              uint64_t v220 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v218, (uint64_t)&v310, (uint64_t)v339, 16);
            }
            while (v220);
          }

          v16 = v301;
          v230 = objc_msgSend_stfTuningParameters(v301->_toneMappingStage, v227, v228, v229);
          v233 = objc_msgSend_numberWithInt_(NSNumber, v231, v211, v232);
          objc_msgSend_setObject_forKey_(v230, v234, (uint64_t)v214, (uint64_t)v233);

          uint64_t v211 = (v211 + 1);
        }
        id v206 = v294;
        uint64_t v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(v294, v208, (uint64_t)&v314, (uint64_t)v340, 16);
      }
      while (v300);
    }

    v235 = [ColorCubeCorrectionStage alloc];
    id v11 = (id)v286;
    uint64_t v238 = objc_msgSend_init_(v235, v236, v286, v237);
    ColorCubeCorrectionStage = v16->_ColorCubeCorrectionStage;
    v16->_ColorCubeCorrectionStage = (ColorCubeCorrectionStage *)v238;

    if (!v16->_ColorCubeCorrectionStage)
    {
      FigDebugAssert3();
      v258 = 0;
      goto LABEL_115;
    }
    long long v308 = 0u;
    long long v309 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    id v240 = v206;
    uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v240, v241, (uint64_t)&v306, (uint64_t)v338, 16);
    if (v242)
    {
      uint64_t v243 = v242;
      uint64_t v244 = 0;
      uint64_t v245 = *(void *)v307;
      do
      {
        for (uint64_t n = 0; n != v243; ++n)
        {
          if (*(void *)v307 != v245) {
            objc_enumerationMutation(v240);
          }
          v247 = *(void **)(*((void *)&v306 + 1) + 8 * n);
          long long v302 = 0u;
          long long v303 = 0u;
          long long v304 = 0u;
          long long v305 = 0u;
          id v248 = v247;
          uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v249, (uint64_t)&v302, (uint64_t)v337, 16);
          if (v250)
          {
            uint64_t v253 = v250;
            uint64_t v254 = *(void *)v303;
            while (2)
            {
              for (iuint64_t i = 0; ii != v253; ++ii)
              {
                if (*(void *)v303 != v254) {
                  objc_enumerationMutation(v248);
                }
                objc_msgSend_objectForKeyedSubscript_(v248, v251, *(void *)(*((void *)&v302 + 1) + 8 * ii), v252);
                v256 = (unsigned int *)objc_claimAutoreleasedReturnValue();
                if (v256)
                {
                  uint64_t v244 = v256[31];

                  goto LABEL_109;
                }
              }
              uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v251, (uint64_t)&v302, (uint64_t)v337, 16);
              if (v253) {
                continue;
              }
              break;
            }
LABEL_109:
            v16 = v301;
          }
        }
        uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v240, v257, (uint64_t)&v306, (uint64_t)v338, 16);
      }
      while (v243);
    }
    else
    {
      uint64_t v244 = 0;
    }

    if (!objc_msgSend_setMaskedSkyCubeVersion_(v16->_ColorCubeCorrectionStage, v259, v244, v260))
    {
      v261 = *p_nrfConfig;
      uint64_t v12 = v285;
      id v11 = (id)v286;
      id v13 = v284;
      id v14 = v287;
      if ((*p_nrfConfig)->_enableGainMap)
      {
        v262 = [GainMapStage alloc];
        uint64_t v265 = objc_msgSend_initWithMetalContext_(v262, v263, v286, v264);
        gainMapStage = v16->_gainMapStage;
        v16->_gainMapStage = (GainMapStage *)v265;

        if (!v16->_gainMapStage) {
          goto LABEL_140;
        }
        v261 = *p_nrfConfig;
      }
      if (v261->_enableSemanticStyles)
      {
        v267 = [SemanticStylesStage alloc];
        uint64_t v270 = objc_msgSend_initWithMetalContext_(v267, v268, v286, v269);
        styleStage = v16->_styleStage;
        v16->_styleStage = (SemanticStylesStage *)v270;

        if (!v16->_styleStage) {
          goto LABEL_140;
        }
        v261 = *p_nrfConfig;
      }
      if ((v261->_greenGhostMitigationType & 2) == 0) {
        goto LABEL_127;
      }
      v272 = [GreenGhostLowLightStage alloc];
      uint64_t v275 = objc_msgSend_initWithMetalContext_(v272, v273, v286, v274);
      greenGhostLowLightStage = v16->_greenGhostLowLightStage;
      v16->_greenGhostLowLightStage = (GreenGhostLowLightStage *)v275;

      if (v16->_greenGhostLowLightStage)
      {
        uint64_t v277 = objc_opt_new();
        greenGhostBuffers = v16->_greenGhostBuffers;
        v16->_greenGhostBuffers = (GreenGhostBuffers *)v277;

        if (v16->_greenGhostBuffers)
        {
LABEL_127:
          v279 = objc_alloc_init(FusionBuffers);
          fusionBuffers = v16->_fusionBuffers;
          v16->_fusionBuffers = v279;

          if (v16->_fusionBuffers)
          {
            v16->_currentFrame = 0;
            v16->_isStaticScene = 0;
            v16->_fusionReferenceFrame = 0;
            uint64_t v281 = objc_opt_new();
            v282 = v16->_fusedBand;
            v16->_fusedBand = (PyramidStorage_NRF *)v281;

            if (v16->_fusedBand)
            {
              v258 = v16;
              goto LABEL_139;
            }
          }
LABEL_136:
          FigDebugAssert3();
LABEL_137:
          FigSignalErrorAt();
LABEL_138:
          v258 = 0;
          goto LABEL_139;
        }
      }
LABEL_140:
      FigDebugAssert3();
      goto LABEL_138;
    }
    FigDebugAssert3();
  }
  else
  {
LABEL_141:
    FigDebugAssert3();
    FigSignalErrorAt();
  }
LABEL_114:
  v258 = 0;
  id v11 = (id)v286;
LABEL_115:
  id v13 = v284;
  uint64_t v12 = v285;
  id v14 = v287;
LABEL_139:

  return v258;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)DenoiseFusePipeline;
  [(DenoiseFusePipeline *)&v5 dealloc];
}

- (void)reset
{
  objc_msgSend_releaseInputBindings(self, a2, v2, v3);
  objc_msgSend_reset(self->_toneMappingStage, v5, v6, v7);
  objc_msgSend_releasePyramidsBottom(self->_ambnrBuffers, v8, v9, v10);
  if (!self->_nrfConfig->_isOnlySingleImage) {
    objc_msgSend_reset(self->_regDense, v11, v12, v13);
  }
  self->_isStaticScene = 0;
  self->_currentFrame = 0;
}

- (void)releaseResources
{
  objc_msgSend_waitForIdle(self->_metal, a2, v2, v3);
  objc_msgSend_releaseAllBindings(self, v5, v6, v7);
  objc_msgSend_releaseTextures(self->_bilateralGrid, v8, v9, v10);
  toneMappingCurvesUBFusiouint64_t n = self->_toneMappingCurvesUBFusion;
  self->_toneMappingCurvesUBFusiouint64_t n = 0;

  toneMappingCurvesSkinMapInput = self->_toneMappingCurvesSkinMapInput;
  self->_toneMappingCurvesSkinMapInput = 0;

  accWeightPyramid = self->_accWeightPyramid;
  self->_accWeightPyramid = 0;
}

- (void)releaseAllBindings
{
  objc_msgSend_reset(self, a2, v2, v3);
  objc_msgSend_reset(self->_greenGhostLowLightStage, v5, v6, v7);
  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v8, (uint64_t)self->_fusedBand, (uint64_t)self->_metal);
  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v9, (uint64_t)self->_accWeightPyramid, (uint64_t)self->_metal);
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
  objc_msgSend_releaseBuffers(self->_ambnrBuffers, v10, v11, v12);
  objc_msgSend_releaseResources(self->_motionDetection, v13, v14, v15);
  uint64_t v17 = 0;
  inputChroma = self->_inputChroma;
  do
  {
    inputBands = self->_inputBands;
    if (inputBands)
    {
      objc_msgSend_makePyramidAliasable_metal_releaseBand0_(PyramidStorage_NRF, v16, (uint64_t)inputBands->bands[v17], (uint64_t)self->_metal, 1);
      objc_msgSend_releaseBuffers(self->_inputBands->bands[v17], v20, v21, v22);
    }
    v23 = &inputChroma[v17];
    v24 = inputChroma[v17 - 5];
    inputChroma[v17 - 5] = 0;

    uint64_t v25 = inputChroma[v17];
    void *v23 = 0;

    uint64_t v26 = inputChroma[v17 + 5];
    v23[5] = 0;

    ++v17;
  }
  while (v17 != 5);
}

- (void)releaseInputBindings
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    inputBands = self->_inputBands;
    if (inputBands) {
      objc_msgSend_clearLevel_(inputBands->bands[i], a2, 0, v2);
    }
    uint64_t v6 = (char *)self + i * 8;
    uint64_t v7 = self->_inputLuma[i];
    self->_inputLuma[i] = 0;

    v8 = self->_inputChroma[i];
    *((void *)v6 + 8) = 0;

    uint64_t v9 = self->_inputYCbCr[i];
    *((void *)v6 + 13) = 0;
  }
}

+ (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 metal:(id)a5
{
  uint64_t v6 = a4;
  int v7 = *((unsigned __int8 *)v6 + 61);
  int v8 = v6[5];
  int v9 = v6[7];
  int v10 = v6[24];
  id v11 = a3;
  int v15 = objc_msgSend_width(v11, v12, v13, v14);
  int v19 = objc_msgSend_height(v11, v16, v17, v18);

  if (v6[5] == 1 && (v6[7] & 0x80000000) == 0)
  {
LABEL_19:
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v21 = 0;
    goto LABEL_14;
  }
  if (v7)
  {
    float v20 = 100.0;
    if ((float)((float)v15 / (float)v19) > 1.5) {
      float v20 = 85.0;
    }
    unint64_t v21 = (unint64_t)v20;
    if (!(unint64_t)v20) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v22 = 173;
    if (v8 == 2) {
      uint64_t v22 = 183;
    }
    if (*((unsigned char *)v6 + 76))
    {
      unint64_t v21 = v22 + ((4 * v10) & 8);
    }
    else
    {
      unint64_t v21 = 320;
      if (!*((unsigned char *)v6 + 77)) {
        unint64_t v21 = 250;
      }
    }
  }
LABEL_14:
  float v23 = 0.78;
  if (v9 <= 0) {
    float v23 = 1.0;
  }
  if (!v9) {
    float v23 = 1.03;
  }
  unint64_t v24 = vcvts_n_u32_f32(v23 * (float)v21, 0x14uLL);

  return v24;
}

- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return objc_msgSend_allocateCoallesedFusionInputPyramidsForWidth_height_levels_frames_(self, a2, a3, a4, 4, 4);
}

- (int)allocateCoallesedFusionInputPyramidsForWidth:(unint64_t)a3 height:(unint64_t)a4 levels:(int)a5 frames:(int)a6
{
  unint64_t v85 = a4;
  unint64_t v7 = a3;
  if (a6 >= 1)
  {
    for (uint64_t i = 0; i != a6; ++i)
      self->_inputBands->bands[i]->levels = a5;
  }
  int v10 = objc_msgSend_allocator(self->_metal, a2, a3, a4);
  uint64_t v14 = objc_msgSend_newTextureDescriptor(v10, v11, v12, v13);

  if (!v14)
  {
LABEL_18:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_19;
  }
  uint64_t v18 = objc_msgSend_desc(v14, v15, v16, v17);
  objc_msgSend_setUsage_(v18, v19, 7, v20);

  if (a5 >= 2)
  {
    uint64_t v23 = 8 * a6;
    uint64_t v24 = 1;
    while ((v7 & 2) == 0 && (v85 & 2) == 0)
    {
      unint64_t v84 = v7;
      if (a6 >= 1)
      {
        unint64_t v25 = 0;
        while (1)
        {
          objc_msgSend_setLabel_(v14, v21, 0, v22);
          v29 = objc_msgSend_desc(v14, v26, v27, v28);
          objc_msgSend_setWidth_(v29, v30, (v84 >> 1), v31);

          v35 = objc_msgSend_desc(v14, v32, v33, v34);
          objc_msgSend_setHeight_(v35, v36, (v85 >> 1), v37);

          uint64_t v41 = objc_msgSend_desc(v14, v38, v39, v40);
          objc_msgSend_setPixelFormat_(v41, v42, 25, v43);

          uint64_t v47 = objc_msgSend_allocator(self->_metal, v44, v45, v46);
          uint64_t v50 = objc_msgSend_newTextureWithDescriptor_(v47, v48, (uint64_t)v14, v49);
          textureY = self->_inputBands->bands[v25 / 8]->textureY;
          v52 = textureY[v24];
          textureY[v24] = (MTLTexture *)v50;

          if (!self->_inputBands->bands[v25 / 8]->textureY[v24]) {
            goto LABEL_18;
          }
          v25 += 8;
          if (v23 == v25)
          {
            unint64_t v53 = 0;
            while (1)
            {
              objc_msgSend_setLabel_(v14, v21, 0, v22);
              v57 = objc_msgSend_desc(v14, v54, v55, v56);
              objc_msgSend_setWidth_(v57, v58, (v84 >> 2) & 0x7FFFFFFF, v59);

              v63 = objc_msgSend_desc(v14, v60, v61, v62);
              objc_msgSend_setHeight_(v63, v64, (v85 >> 2) & 0x7FFFFFFF, v65);

              v69 = objc_msgSend_desc(v14, v66, v67, v68);
              objc_msgSend_setPixelFormat_(v69, v70, 65, v71);

              id v75 = objc_msgSend_allocator(self->_metal, v72, v73, v74);
              uint64_t v78 = objc_msgSend_newTextureWithDescriptor_(v75, v76, (uint64_t)v14, v77);
              textureUV = self->_inputBands->bands[v53 / 8]->textureUV;
              uint64_t v80 = textureUV[v24];
              textureUV[v24] = (MTLTexture *)v78;

              uint64_t v81 = self->_inputBands->bands[v53 / 8];
              if (!v81->textureUV[v24]) {
                goto LABEL_18;
              }
              v81->isFP16[v24] = 1;
              v53 += 8;
              if (v23 == v53) {
                goto LABEL_16;
              }
            }
          }
        }
      }
LABEL_16:
      v85 >>= 1;
      unint64_t v7 = v84 >> 1;
      if (++v24 == a5) {
        goto LABEL_19;
      }
    }
    goto LABEL_18;
  }
LABEL_19:

  return 0;
}

- (int)allocateResourcesIfNeededForDesc:(id)a3 didAllocate:(BOOL *)a4
{
  id v7 = a3;
  int v11 = objc_msgSend_width(v7, v8, v9, v10);
  int v15 = objc_msgSend_height(v7, v12, v13, v14);
  int v19 = (_DWORD *)MEMORY[0x263F00E10];
  if (((v11 | v15) & 0xF) != 0)
  {
    uint64_t v61 = v4;
    int v60 = 0;
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
    goto LABEL_33;
  }
  unint64_t v20 = v11;
  unint64_t v21 = v15;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (self->_lastWidth == v11 && self->_lastHeight == v21)
  {
    unsigned int lastPixelFormat = self->_lastPixelFormat;
    if (lastPixelFormat == objc_msgSend_pixelFormat(v7, v16, v17, v18))
    {
      BOOL v23 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v24 = objc_opt_new();
  uint64_t v27 = v24;
  if (!v24)
  {
    uint64_t v61 = v4;
    int v60 = 0;
LABEL_31:
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
    goto LABEL_32;
  }
  objc_msgSend_setUsage_(v24, v25, 7, v26);
  objc_msgSend_releaseResources(self, v28, v29, v30);
  ResourcesForWidth_height_srlVersiouint64_t n = objc_msgSend_allocateResourcesForWidth_height_srlVersion_(self->_toneMappingStage, v31, v20, v21, self->_srlVersion);
  if (ResourcesForWidth_height_srlVersion)
  {
    int v52 = ResourcesForWidth_height_srlVersion;
    uint64_t v61 = v4;
    int v60 = ResourcesForWidth_height_srlVersion;
    goto LABEL_28;
  }
  nrfConfig = self->_nrfConfig;
  if (nrfConfig->_isOnlySingleImage) {
    goto LABEL_11;
  }
  bilateralGrid = self->_bilateralGrid;
  if (!bilateralGrid) {
    goto LABEL_11;
  }
  if (!nrfConfig->_enableBilateralGridForHybridRegistration)
  {
    uint64_t v63 = 0;
    long long v62 = xmmword_263017A38;
    int v56 = objc_msgSend_setupWithConfig_width_height_(bilateralGrid, v33, (uint64_t)&v62, v20, v21);
    if (v56)
    {
      int v52 = v56;
      uint64_t v61 = v4;
      int v60 = v56;
      goto LABEL_28;
    }
    goto LABEL_11;
  }
  uint64_t v63 = 0;
  long long v62 = xmmword_263017A20;
  int v55 = objc_msgSend_setupWithConfig_width_height_(bilateralGrid, v33, (uint64_t)&v62, v20 >> 3, v21 >> 3);
  if (!v55)
  {
LABEL_11:
    v35 = [ToneMappingCurves alloc];
    v38 = (ToneMappingCurves *)objc_msgSend_initWithWithContext_(v35, v36, (uint64_t)self->_metal, v37);
    toneMappingCurvesUBFusiouint64_t n = self->_toneMappingCurvesUBFusion;
    self->_toneMappingCurvesUBFusiouint64_t n = v38;

    if (self->_toneMappingCurvesUBFusion)
    {
      uint64_t v40 = [ToneMappingCurves alloc];
      uint64_t v43 = (ToneMappingCurves *)objc_msgSend_initWithWithContext_(v40, v41, (uint64_t)self->_metal, v42);
      toneMappingCurvesSkinMapInput = self->_toneMappingCurvesSkinMapInput;
      self->_toneMappingCurvesSkinMapInput = v43;

      if (self->_toneMappingCurvesSkinMapInput)
      {
        objc_msgSend_setEnableSTF_(self->_toneMappingCurvesUBFusion, v45, self->_nrfConfig->_enableSTF, v46);
        objc_msgSend_setEnableSTF_(self->_toneMappingCurvesSkinMapInput, v47, self->_nrfConfig->_enableSTF, v48);
        self->_lastWidth = v20;
        self->_lastHeight = v21;
        self->_unsigned int lastPixelFormat = objc_msgSend_pixelFormat(v7, v49, v50, v51);

        BOOL v23 = 1;
LABEL_14:
        int v52 = 0;
        if (a4) {
          *a4 = v23;
        }
        goto LABEL_16;
      }
      uint64_t v61 = v4;
      int v60 = 0;
    }
    else
    {
      uint64_t v61 = v4;
      int v60 = 0;
    }
    goto LABEL_31;
  }
  int v52 = v55;
  uint64_t v61 = v4;
  int v60 = v55;
LABEL_28:
  FigDebugAssert3();
LABEL_32:

LABEL_33:
  if (v52) {
    objc_msgSend_releaseResources(self, v57, v58, v59, v60, v61);
  }
LABEL_16:
  if (*v19 == 1) {
    kdebug_trace();
  }

  return v52;
}

- (int)setFusionMode:(int)a3
{
  self->_fusionAlgo = a3;
  return 0;
}

- (void)setSidecarWriter:(id)a3
{
  uint64_t v4 = (const char *)a3;
  obuint64_t j = (char *)v4;
  if (!self->_nrfConfig->_isOnlySingleImage)
  {
    objc_msgSend_setSidecarWriter_(self->_fusionRemixStage, v4, (uint64_t)v4, v5);
    objc_msgSend_setSidecarWriter_(self->_toneMappingStage, v6, (uint64_t)obj, v7);
    objc_msgSend_setSidecarWriter_(self->_syntheticReferenceStage, v8, (uint64_t)obj, v9);
    objc_msgSend_setSidecarWriter_(self->_syntheticLongStage, v10, (uint64_t)obj, v11);
    uint64_t v4 = obj;
  }
  objc_msgSend_setSidecarWriter_(self->_greenGhostLowLightStage, v4, (uint64_t)v4, v5);
  objc_storeWeak((id *)&self->_sidecarWriter, obj);
}

- (int)denoiseFrameWithOutput:(id)a3 input:(id)a4 localGainMap:(id)a5 skinMask:(id)a6 skyMask:(id)a7 maskExtent:(CGRect)a8 exposure:(const exposureParameters *)a9 staticScene:(BOOL)a10 nrfPlist:(id)a11 defringeEnabled:(BOOL)a12 isLowLight:(BOOL)a13 greenGhostEnabled:(BOOL)a14 faceLandMarks:(id)a15 ev0FrameMetadata:(const frameMetadata *)a16 evmFrameMetadata:(const frameMetadata *)a17 gainMap:(id)a18
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v170 = a3;
  uint64_t v28 = (id *)a4;
  id v29 = a5;
  id v169 = a6;
  id v168 = a7;
  uint64_t v30 = a11;
  id v167 = a15;
  id v166 = a18;
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v34 = objc_msgSend_commandQueue(self->_metal, v31, v32, v33);
    v38 = objc_msgSend_commandBuffer(v34, v35, v36, v37);

    objc_msgSend_setLabel_(v38, v39, @"KTRACE_START_MTL", v40);
    objc_msgSend_addCompletedHandler_(v38, v41, (uint64_t)&unk_270E33DC8, v42);
    objc_msgSend_commit(v38, v43, v44, v45);
  }
  id v46 = v28[2];
  id v171 = v28[3];
  uint64_t v50 = objc_msgSend_allocator(self->_metal, v47, v48, v49);
  v54 = objc_msgSend_newTextureDescriptor(v50, v51, v52, v53);

  if (!v54)
  {
    FigDebugAssert3();
LABEL_30:
    int v149 = FigSignalErrorAt();
    goto LABEL_25;
  }
  uint64_t v58 = objc_msgSend_desc(v54, v55, v56, v57);
  objc_msgSend_setUsage_(v58, v59, 7, v60);

  int v178 = 0;
  BOOL v173 = v29 != 0;
  int fusionAlgo = self->_fusionAlgo;
  if (fusionAlgo) {
    BOOL learnedNREnabled = 1;
  }
  else {
    BOOL learnedNREnabled = self->_nrfConfig->_learnedNREnabled;
  }
  BOOL v174 = learnedNREnabled;
  uint64_t v65 = (unsigned char *)v30[2];
  char v175 = v65[18];
  char v176 = v65[40];
  unsigned __int8 v177 = v65[19];
  LOBYTE(v178) = fusionAlgo != 0;
  BYTE1(v178) = v65[20];
  uint64_t v66 = objc_msgSend_getAMBNRStage_(self, v61, (uint64_t)&v173, v62);
  if (!v66)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  uint64_t v67 = (void *)v66;
  v164 = a9;
  uint64_t v165 = v30;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  objc_msgSend_setSidecarWriter_(v67, v69, (uint64_t)WeakRetained, v70);

  self->_ambnrBuffers->pyramid->levels = 4;
  metal = self->_metal;
  uint64_t v75 = objc_msgSend_width(v46, v72, v73, v74);
  uint64_t v79 = objc_msgSend_height(v46, v76, v77, v78);
  int isFP16_pyramid = objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_pyramid_(PyramidStorage_NRF, v80, (uint64_t)metal, @"_ambnrBuffers->pyramid", v75, v79, 1, self->_ambnrBuffers->pyramid);
  if (isFP16_pyramid)
  {
    int v149 = isFP16_pyramid;
    FigDebugAssert3();

    uint64_t v30 = v165;
    goto LABEL_25;
  }
  uint64_t v30 = v165;
  if (objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_ambnrBuffers->pyramid, v82, (uint64_t)v46, (uint64_t)v171, 0, self->_metal)|| (_BYTE)v178&& objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_ambnrBuffers->noiseMapPyramid, v83, (uint64_t)self->_fusionBuffers->noiseMapLumaTex, (uint64_t)self->_fusionBuffers->noiseMapChromaTex, 0, self->_metal))
  {
    goto LABEL_32;
  }
  if (!(v177 | BYTE2(v178)))
  {
LABEL_16:
    ambnrBuffers = self->_ambnrBuffers;
    uint64_t pyramid = (uint64_t)ambnrBuffers->pyramid;
    if ((_BYTE)v178) {
      noiseMapPyramid = ambnrBuffers->noiseMapPyramid;
    }
    else {
      noiseMapPyramid = 0;
    }
    if (v177 | BYTE2(v178)) {
      int v141 = objc_msgSend_setResourcesWithOutput_inputPyramid_noiseMapPyramid_sharpeningPyramid_localGainMapTex_(v67, v83, (uint64_t)v170, pyramid, noiseMapPyramid, ambnrBuffers->sharpeningPyramid, v29);
    }
    else {
      int v141 = objc_msgSend_setResourcesWithOutput_inputPyramid_noiseMapPyramid_sharpeningPyramid_localGainMapTex_(v67, v83, (uint64_t)v170, pyramid, noiseMapPyramid, 0, v29);
    }
    if (!v141)
    {
      LOBYTE(v163) = a14;
      if (!objc_msgSend_runWithExposure_staticScene_dasPlist_nmPlist_defringingTuning_greenGhostBrightLightTuning_greenGhostEnabled_skinMask_skyMask_maskExtent_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_defringeEnabled_isLowLight_gainMap_(v67, v142, (uint64_t)v164, a10, v30[2], v30[4], v30[12], v30[14], x, y, width, height, v163, v169, v168, v167, a16, a17, __PAIR16__(a13, a12),
                            v166))
      {
        FigMetalDecRef();
        FigMetalDecRef();
        objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v143, (uint64_t)self->_ambnrBuffers->noiseMapPyramid, (uint64_t)self->_metal);
        FigMetalDecRef();
        objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v144, (uint64_t)self->_ambnrBuffers->sharpeningPyramid, (uint64_t)self->_metal);
        objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v145, (uint64_t)self->_ambnrBuffers->pyramid, (uint64_t)self->_metal);

        int v149 = 0;
        goto LABEL_25;
      }
    }
LABEL_32:
    FigDebugAssert3();
    int v149 = FigSignalErrorAt();

    goto LABEL_25;
  }
  self->_ambnrBuffers->sharpeningPyramid->levels = 4;
  v86 = self->_metal;
  uint64_t v87 = objc_msgSend_width(v46, v83, v84, v85);
  uint64_t v91 = objc_msgSend_height(v46, v88, v89, v90);
  int Chroma_pyramid = objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_pyramid_(PyramidStorage_NRF, v92, (uint64_t)v86, @"_ambnrBuffers->sharpeningPyramid", v87, v91, 1, 0, 1, self->_ambnrBuffers->sharpeningPyramid);
  if (Chroma_pyramid)
  {
    int v149 = Chroma_pyramid;
    FigDebugAssert3();
  }
  else
  {
    uint64_t v97 = objc_msgSend_width(v171, v94, v95, v96);
    uint64_t v101 = objc_msgSend_desc(v54, v98, v99, v100);
    objc_msgSend_setWidth_(v101, v102, v97, v103);

    uint64_t v107 = objc_msgSend_height(v171, v104, v105, v106);
    v111 = objc_msgSend_desc(v54, v108, v109, v110);
    objc_msgSend_setHeight_(v111, v112, v107, v113);

    int v117 = objc_msgSend_desc(v54, v114, v115, v116);
    objc_msgSend_setPixelFormat_(v117, v118, 65, v119);

    objc_msgSend_setLabel_(v54, v120, 0, v121);
    id v125 = objc_msgSend_allocator(self->_metal, v122, v123, v124);
    uint64_t v128 = objc_msgSend_newTextureWithDescriptor_(v125, v126, (uint64_t)v54, v127);
    sharpeningPyramid = self->_ambnrBuffers->sharpeningPyramid;
    uint64_t v130 = sharpeningPyramid->textureUV[0];
    sharpeningPyramid->textureUV[0] = (MTLTexture *)v128;

    if (self->_ambnrBuffers->sharpeningPyramid->textureUV[0])
    {
      uint64_t v134 = objc_msgSend_desc(v54, v131, v132, v133);
      self->_ambnrBuffers->sharpeningPyramid->isFP16[0] = objc_msgSend_pixelFormat(v134, v135, v136, v137) == 65;

      uint64_t v30 = v165;
      goto LABEL_16;
    }
    FigDebugAssert3();
    int v149 = FigSignalErrorAt();
  }

  uint64_t v30 = v165;
LABEL_25:
  if (*MEMORY[0x263F00E10])
  {
    v150 = objc_msgSend_commandQueue(self->_metal, v146, v147, v148);
    v154 = objc_msgSend_commandBuffer(v150, v151, v152, v153);

    objc_msgSend_setLabel_(v154, v155, @"KTRACE_END_MTL", v156);
    v172[0] = MEMORY[0x263EF8330];
    v172[1] = 3221225472;
    v172[2] = sub_262F6B144;
    v172[3] = &unk_2655C32E8;
    memset(&v172[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v154, v157, (uint64_t)v172, v158);
    objc_msgSend_commit(v154, v159, v160, v161);
  }
  return v149;
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(frameProperties_t *)a4
{
  return MEMORY[0x270F9A6D0](self->_textureUtils, sel_fillPaddedAreaInFrame_cfp_useSeparateCommandQueue_, a3, a4);
}

- (int)applyGlobalDistortionCorrectionInplaceWithPixelBuffer:(__CVBuffer *)a3 amount:(float)a4 gdcPlist:(id)a5 cscParams:(const ColorSpaceConversionParameters *)a6
{
  if (a5)
  {
    float v10 = *((float *)a5 + 20) / 1000.0;
    uint64_t v11 = (char *)a5;
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    *(float *)int v19 = a4;
    *(float *)&v19[1] = v10 * v10;
    *(float *)&uint64_t v14 = (float)((float)WidthOfPlane * 0.5) + *((float *)v11 + 18);
    *((float *)&v14 + 1) = (float)((float)HeightOfPlane * 0.5) + *((float *)v11 + 19);
    uint64_t v20 = v14;
    long long v15 = *(_OWORD *)(v11 + 56);
    long long v21 = *(_OWORD *)(v11 + 40);
    long long v22 = v15;
    LODWORD(a6) = objc_msgSend_applyInplace_gdcParams_cscParams_(self->_globalDistortionCorrectionStage, v16, (uint64_t)a3, (uint64_t)v19, a6);

    return (int)a6;
  }
  else
  {
    id v18 = 0;
    FigDebugAssert3();

    return FigSignalErrorAt();
  }
}

- (int)denoiseSingleImage:(__CVBuffer *)a3 linearOutput:(__CVBuffer *)a4 input:(__CVBuffer *)a5 cfp:(frameProperties_t *)a6 nrfPlist:(id)a7 style:(id)a8 inferenceProvider:(id)a9 defringeEnabled:(BOOL)a10 colorCubeFixType:(int)a11
{
  uint64_t v326 = *MEMORY[0x263EF8340];
  long long v320 = a7;
  id v314 = a8;
  id v15 = a9;
  id v325 = 0;
  uint64_t v307 = objc_opt_new();
  if (!v307 || (uint64_t v317 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    long long v316 = 0;
    long long v318 = 0;
    long long v319 = 0;
    id v313 = 0;
    id v306 = 0;
    id v41 = 0;
    long long v309 = 0;
    uint64_t v45 = 0;
    uint64_t v300 = 0;
    uint64_t v253 = (void *)v307;
    goto LABEL_69;
  }
  uint64_t v311 = (uint64_t)v15;
  uint64_t MetalLumaFormat = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, v16, (uint64_t)a5, v17);
  uint64_t MetalChromaFormat = objc_msgSend_getMetalChromaFormat_(LumaChromaImage, v19, (uint64_t)a5, v20);
  uint64_t MetalYCbCrFormat = objc_msgSend_getMetalYCbCrFormat_(LumaChromaImage, v22, (uint64_t)a5, v23);
  uint64_t v27 = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, v25, (uint64_t)a3, v26);
  uint64_t v30 = objc_msgSend_getMetalChromaFormat_(LumaChromaImage, v28, (uint64_t)a3, v29);
  objc_msgSend_reset(self, v31, v32, v33);
  objc_msgSend_setFusionMode_(self, v34, 0, v35);
  uint64_t v37 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v36, (uint64_t)a5, MetalLumaFormat, 1, 0, 16);
  if (!v37)
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    long long v316 = 0;
    long long v319 = 0;
    id v313 = 0;
    id v306 = 0;
    id v41 = 0;
    long long v309 = 0;
    goto LABEL_73;
  }
  uint64_t v39 = (void *)v37;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v38, (uint64_t)a5, MetalChromaFormat, 1, 1, 8);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    long long v309 = v39;
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    long long v316 = 0;
    long long v319 = 0;
    id v313 = 0;
    id v306 = 0;
    goto LABEL_73;
  }
  if (MetalYCbCrFormat)
  {
    metal = self->_metal;
    id v324 = 0;
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = objc_msgSend_bindYCbCrMetalTextureWithMetalContext_pixelBuffer_pixelFormat_textureToBind_alignmentFactor_(LumaChromaImage, v40, (uint64_t)metal, (uint64_t)a5, MetalYCbCrFormat, &v324, 16);
    id v306 = v324;
    if (isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap)
    {
      long long v309 = v39;
      long long v316 = 0;
      long long v319 = 0;
      id v313 = 0;
LABEL_73:
      long long v318 = 0;
      uint64_t v45 = 0;
      id v15 = (id)v311;
LABEL_85:
      uint64_t v253 = (void *)v307;
      goto LABEL_68;
    }
  }
  else
  {
    id v306 = 0;
  }
  id v15 = (id)v311;
  uint64_t v45 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v40, (uint64_t)a3, v27, 7, 0, 16);
  id v46 = a6;
  if (!v45)
  {
    long long v309 = v39;
LABEL_76:
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    long long v316 = 0;
    long long v318 = 0;
    long long v319 = 0;
LABEL_82:
    id v313 = 0;
    goto LABEL_85;
  }
  long long v318 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v44, (uint64_t)a3, v30, 6, 1, 8);
  if (!v318)
  {
    long long v309 = v39;
    goto LABEL_76;
  }
  if ((objc_msgSend_width(v39, v47, v48, v49) & 0xF) != 0)
  {
    long long v309 = v39;
LABEL_81:
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    long long v316 = 0;
    long long v319 = 0;
    goto LABEL_82;
  }
  if ((objc_msgSend_height(v39, v50, v51, v52) & 0xF) != 0)
  {
    long long v309 = v39;
    goto LABEL_81;
  }
  if ((objc_msgSend_width(v45, v53, v54, v55) & 0xF) != 0)
  {
    long long v309 = v39;
    goto LABEL_81;
  }
  if ((objc_msgSend_height(v45, v56, v57, v58) & 0xF) != 0)
  {
    long long v309 = v39;
    goto LABEL_81;
  }
  id v59 = v39;
  id v41 = v41;
  long long v309 = v59;
  if (v311)
  {
    long long v319 = objc_msgSend__runInferenceProvider_(self, v60, v311, v62);
    if (!v319)
    {
      FigDebugAssert3();
      int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
      long long v319 = 0;
LABEL_84:
      long long v316 = v41;
      id v313 = v59;
      goto LABEL_85;
    }
  }
  else
  {
    long long v319 = 0;
  }
  int y_low = LODWORD(a6[1].meta.ROI.origin.y);
  if (a4 && y_low != 2)
  {
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    goto LABEL_84;
  }
  long long v310 = v41;
  if (y_low == 2)
  {
    uint64_t v68 = objc_opt_new();
    if (!v68)
    {
      FigDebugAssert3();
      uint64_t v73 = 0;
LABEL_97:
      int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
LABEL_98:
      uint64_t v253 = (void *)v307;

      id v41 = v310;
      long long v316 = v310;
      id v313 = v309;
      goto LABEL_68;
    }
    v69 = objc_msgSend_allocator(self->_metal, v65, v66, v67);
    uint64_t v73 = objc_msgSend_newTextureDescriptor(v69, v70, v71, v72);

    if (!v73)
    {
LABEL_89:
      FigDebugAssert3();
      goto LABEL_97;
    }
    uint64_t v77 = objc_msgSend_desc(v73, v74, v75, v76);
    objc_msgSend_setUsage_(v77, v78, 7, v79);

    if (self->_nrfConfig->_learnedNREnabled)
    {
      uint64_t v83 = objc_msgSend_width(v310, v80, v81, v82);
      uint64_t v87 = objc_msgSend_desc(v73, v84, v85, v86);
      objc_msgSend_setWidth_(v87, v88, v83, v89);

      uint64_t v93 = objc_msgSend_height(v310, v90, v91, v92);
      uint64_t v97 = objc_msgSend_desc(v73, v94, v95, v96);
      objc_msgSend_setHeight_(v97, v98, v93, v99);

      uint64_t v103 = objc_msgSend_desc(v73, v100, v101, v102);
      objc_msgSend_setPixelFormat_(v103, v104, 25, v105);

      objc_msgSend_setLabel_(v73, v106, 0, v107);
      v111 = objc_msgSend_allocator(self->_metal, v108, v109, v110);
      v114 = objc_msgSend_newTextureWithDescriptor_(v111, v112, (uint64_t)v73, v113);
      id v325 = v114;

      obuint64_t j = v114;
      if (!v114) {
        goto LABEL_89;
      }
    }
    else
    {
      obuint64_t j = 0;
    }
    uint64_t v115 = objc_msgSend_width(v59, v80, v81, v82);
    uint64_t v119 = objc_msgSend_desc(v73, v116, v117, v118);
    objc_msgSend_setWidth_(v119, v120, v115, v121);

    uint64_t v125 = objc_msgSend_height(v59, v122, v123, v124);
    uint64_t v129 = objc_msgSend_desc(v73, v126, v127, v128);
    objc_msgSend_setHeight_(v129, v130, v125, v131);

    v135 = objc_msgSend_desc(v73, v132, v133, v134);
    objc_msgSend_setPixelFormat_(v135, v136, 25, v137);

    objc_msgSend_setLabel_(v73, v138, 0, v139);
    v143 = objc_msgSend_allocator(self->_metal, v140, v141, v142);
    uint64_t v146 = objc_msgSend_newTextureWithDescriptor_(v143, v144, (uint64_t)v73, v145);
    uint64_t v147 = *(void **)(v68 + 8);
    *(void *)(v68 + 8) = v146;

    if (!*(void *)(v68 + 8)) {
      goto LABEL_89;
    }
    objc_msgSend_setLabel_(v73, v148, 0, v149);
    uint64_t v153 = objc_msgSend_allocator(self->_metal, v150, v151, v152);
    uint64_t v156 = objc_msgSend_newTextureWithDescriptor_(v153, v154, (uint64_t)v73, v155);
    v157 = *(void **)(v68 + 32);
    *(void *)(v68 + 32) = v156;

    if (!*(void *)(v68 + 32)) {
      goto LABEL_89;
    }
    uint64_t v161 = objc_msgSend_desc(v73, v158, v159, v160);
    unint64_t v165 = objc_msgSend_width(v161, v162, v163, v164);
    objc_msgSend_setWidth_(v161, v166, v165 >> 1, v167);

    id v171 = objc_msgSend_desc(v73, v168, v169, v170);
    unint64_t v175 = objc_msgSend_height(v171, v172, v173, v174);
    objc_msgSend_setHeight_(v171, v176, v175 >> 1, v177);

    uint64_t v181 = objc_msgSend_desc(v73, v178, v179, v180);
    objc_msgSend_setPixelFormat_(v181, v182, 65, v183);

    objc_msgSend_setLabel_(v73, v184, 0, v185);
    v189 = objc_msgSend_allocator(self->_metal, v186, v187, v188);
    uint64_t v192 = objc_msgSend_newTextureWithDescriptor_(v189, v190, (uint64_t)v73, v191);
    v193 = *(void **)(v68 + 16);
    *(void *)(v68 + 16) = v192;

    if (*(void *)(v68 + 16))
    {
      objc_msgSend_setLabel_(v73, v194, 0, v195);
      v199 = objc_msgSend_allocator(self->_metal, v196, v197, v198);
      uint64_t v202 = objc_msgSend_newTextureWithDescriptor_(v199, v200, (uint64_t)v73, v201);
      v203 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = v202;

      if (*(void *)(v68 + 40))
      {
        if (dword_26B429788)
        {
          int v323 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v205 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (!self->_toneMappingStage || !self->_toneMappingCurvesUBFusion || !a6->meta.metadataHasLtmCurves || !v320[5]) {
          goto LABEL_96;
        }
        p_double height = (char *)&a6[1].meta.ROI.size.height;
        if (!a6[1].meta.ltmCurves.ltmLut.bytes[179])
        {
          objc_msgSend_convertColor_inputLuma_inputChroma_outputLuma_outputChroma_(self->_colorConvertStage, v204, (uint64_t)p_height, (uint64_t)v59, v310, *(void *)(v68 + 8), *(void *)(v68 + 16));
LABEL_43:
          if (a4)
          {
            int v208 = objc_msgSend_extractLinearBufferWithLumaInput_chromaInput_inputIsLinear_removeChromaBias_lumaPedestal_exposureParams_ccm_output_(self->_colorConvertStage, v207, *(void *)(v68 + 8), *(void *)(v68 + 16), 1, 0, &a6->meta.exposureParams, 0.0, a6->meta.faces[0].rect.origin.x, a6->meta.faces[0].rect.size.width, *(double *)&a6->meta.faces[0].confidence);
            if (v208)
            {
              int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = v208;
              id v15 = (id)v311;
              goto LABEL_98;
            }
          }
          if (!objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurvesUBFusion, v207, (uint64_t)&a6->meta.ltmCurves, (uint64_t)&a6->meta.ltmCurves, 0, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights))
          {
            objc_storeStrong((id *)(v68 + 24), obj);
            objc_storeStrong((id *)(v68 + 128), self->_toneMappingCurvesUBFusion);
            uint64_t v212 = objc_msgSend_skinMask(v319, v209, v210, v211);
            v213 = *(void **)(v68 + 48);
            *(void *)(v68 + 48) = v212;

            uint64_t v217 = objc_msgSend_personMask(v319, v214, v215, v216);
            v218 = *(void **)(v68 + 56);
            *(void *)(v68 + 56) = v217;

            uint64_t v222 = objc_msgSend_skyMask(v319, v219, v220, v221);
            uint64_t v223 = *(void **)(v68 + 64);
            *(void *)(v68 + 64) = v222;

            uint64_t v227 = objc_msgSend_faceLandmarks(v319, v224, v225, v226);
            uint64_t v228 = *(void **)(v68 + 120);
            *(void *)(v68 + 120) = v227;

            for (uint64_t i = 0; i != 32; i += 8)
            {
              v230 = *(void **)(v68 + 72 + i);
              *(void *)(v68 + 72 + i) = 0;
            }
            v231 = *(void **)(v68 + 104);
            *(void *)(v68 + 104) = 0;

            uint64_t v232 = *(void **)(v68 + 112);
            *(void *)(v68 + 112) = 0;

            BYTE4(v303) = 1;
            LODWORD(v303) = 0;
            LODWORD(v233) = 1.0;
            id v46 = a6;
            if (!objc_msgSend_runToneMapping_bilateralGrid_bilateralGridHomography_tmPlist_darkestFrameMetadata_ev0FrameMetadata_scaleInput_colorCorrection_hasChromaBias_quality_inputIsLinear_(self->_toneMappingStage, v234, v68, 0, v320[5], a6, a6, 0, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v233, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v303))
            {
              FigMetalDecRef();
              FigMetalDecRef();
              id v313 = *(id *)(v68 + 32);

              id v64 = *(id *)(v68 + 40);
              goto LABEL_50;
            }
          }
          FigDebugAssert3();
          goto LABEL_96;
        }
        if (v306)
        {
          objc_msgSend_convertColor_inputYCbCr_outputLuma_outputChroma_(self->_colorConvertStage, v204, (uint64_t)p_height, (uint64_t)v306, *(void *)(v68 + 8), *(void *)(v68 + 16));
          goto LABEL_43;
        }
      }
    }
    FigDebugAssert3();
LABEL_96:
    id v15 = (id)v311;
    goto LABEL_97;
  }
  obuint64_t j = 0;
  id v64 = v41;
  id v313 = v59;
LABEL_50:
  long long v316 = v64;
  if (v314)
  {
    styleStage = self->_styleStage;
    if (styleStage)
    {
      uint64_t v236 = v320[13];
      if (v236)
      {
        uint64_t v237 = objc_msgSend_sceneType(v319, v60, v61, v62);
        objc_msgSend_personMask(v319, v238, v239, v240);
        uint64_t v242 = v241 = v45;
        v246 = objc_msgSend_skinMask(v319, v243, v244, v245);
        uint64_t v250 = objc_msgSend_skyMask(v319, v247, v248, v249);
        int isLowLight = objc_msgSend_runWithStyle_tuningParams_refFrameMetadata_sceneType_lumaTex_chromaTex_gainMapTex_outputGainMapTex_personMaskTex_skinMaskTex_skyMaskTex_isLowLight_(styleStage, v251, (uint64_t)v314, v236, v46, v237, v313, v316, 0, 0, v242, v246, v250, 0);

        id v64 = v316;
        uint64_t v45 = v241;

        if (isLowLight)
        {
          int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
          id v41 = v310;
          id v15 = (id)v311;
          goto LABEL_85;
        }
      }
    }
  }
  uint64_t v253 = (void *)v307;
  objc_storeStrong((id *)(v307 + 16), v313);
  objc_storeStrong((id *)(v307 + 24), v64);
  long long v305 = v45;
  objc_storeStrong((id *)(v317 + 16), v45);
  if (a11 == -1) {
    uint64_t v254 = v318;
  }
  else {
    uint64_t v254 = 0;
  }
  objc_storeStrong((id *)(v317 + 24), v254);
  v258 = objc_msgSend_skinMask(v319, v255, v256, v257);
  v262 = objc_msgSend_skyMask(v319, v259, v260, v261);
  v266 = objc_msgSend_faceLandmarks(v319, v263, v264, v265);
  *(_WORD *)((char *)&v304 + 1) = 0;
  LOBYTE(v304) = a10;
  LOBYTE(v302) = 0;
  int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = objc_msgSend_denoiseFrameWithOutput_input_localGainMap_skinMask_skyMask_maskExtent_exposure_staticScene_nrfPlist_defringeEnabled_isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap_(self, v267, v317, v307, obj, v258, v262, &v46->meta.exposureParams, v46->meta.ROI.origin.x, v46->meta.ROI.origin.y, v46->meta.ROI.size.width, v46->meta.ROI.size.height, v302, v320, v304, v266, 0, 0, 0);

  if (isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap)
  {
    FigDebugAssert3();
    id v41 = v310;
    id v15 = (id)v311;
    uint64_t v300 = (void *)v317;
    uint64_t v45 = v305;
    goto LABEL_69;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  if (self->_nrfConfig->_learnedNREnabled) {
    FigMetalDecRef();
  }
  id v41 = v310;
  id v15 = (id)v311;
  uint64_t v45 = v305;
  if (a11 == -1)
  {
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = 0;
LABEL_68:
    uint64_t v300 = (void *)v317;
    goto LABEL_69;
  }
  v271 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    v272 = objc_msgSend_commandQueue(self->_metal, v268, v269, v270);
    v276 = objc_msgSend_commandBuffer(v272, v273, v274, v275);

    uint64_t v253 = (void *)v307;
    objc_msgSend_setLabel_(v276, v277, @"KTRACE_START_MTL", v278);
    objc_msgSend_addCompletedHandler_(v276, v279, (uint64_t)&unk_270E33DE8, v280);
    objc_msgSend_commit(v276, v281, v282, v283);
  }
  int fixed = objc_msgSend_runOnLuma_andChroma_outChroma_colorCubeFixType_(self->_ColorCubeCorrectionStage, v268, *(void *)(v317 + 16), *(void *)(v317 + 24), v318, a11);
  if (fixed)
  {
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = fixed;
    FigDebugAssert3();
    goto LABEL_68;
  }
  if (*v271)
  {
    v288 = objc_msgSend_commandQueue(self->_metal, v285, v286, v287);
    uint64_t v292 = objc_msgSend_commandBuffer(v288, v289, v290, v291);

    objc_msgSend_setLabel_(v292, v293, @"KTRACE_END_MTL", v294);
    v321[0] = MEMORY[0x263EF8330];
    v321[1] = 3221225472;
    v321[2] = sub_262F6CBC4;
    v321[3] = &unk_2655C32E8;
    memset(&v321[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v292, v295, (uint64_t)v321, v296);
    objc_msgSend_commit(v292, v297, v298, v299);
  }
  uint64_t v300 = (void *)v317;
  FigMetalDecRef();
  int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = 0;
LABEL_69:

  return isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap;
}

- (int)baseLayer:(__CVBuffer *)a3
{
  uint64_t MetalLumaFormat = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v7, (uint64_t)a3, MetalLumaFormat, 1, 0, 16);
  if (!v9 || objc_msgSend_filter_output_(self->_bilateralGrid, v8, (uint64_t)v9, 0))
  {
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (int)createPyramidForFrame:(id)a3 cfp:(const frameProperties_t *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (objc_msgSend_setResourcesWithPyramid_(self->_pyramidStage, a2, (uint64_t)a3, (uint64_t)a4))
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    objc_msgSend_setColorSpace_withParams_(self->_pyramidStage, v6, LODWORD(a4[1].meta.ROI.origin.y), (uint64_t)&a4[1].meta.ROI.size.height);
    int v10 = 1084227584;
    v9[0] = xmmword_263017A50;
    v9[1] = unk_263017A60;
    if (self->_fusionAlgo == 2)
    {
      return 0;
    }
    else
    {
      int result = objc_msgSend_runGPUWithFilters_doShift_(self->_pyramidStage, v7, (uint64_t)v9, 1);
      if (result)
      {
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
  }
  return result;
}

- (int)addFrame:(__CVBuffer *)a3 cfp:(const frameProperties_t *)a4 processingType:(unsigned int)a5 batchCount:(int)a6
{
  uint64_t v6 = a3;
  if (!a3)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    uint64_t v20 = 0;
    uint64_t v24 = 0;
    goto LABEL_34;
  }
  if (self->_currentFrame >= 5)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    uint64_t v20 = 0;
LABEL_38:
    uint64_t v24 = 0;
LABEL_40:
    uint64_t v6 = 0;
    goto LABEL_34;
  }
  p_double y = (char *)&a4[1].meta.ROI.origin.y;
  if (a4[1].meta.ltmCurves.ltmLut.bytes[179]) {
    uint64_t MetalYCbCrFormat = objc_msgSend_getMetalYCbCrFormat_(LumaChromaImage, a2, (uint64_t)a3, (uint64_t)a4);
  }
  else {
    uint64_t MetalYCbCrFormat = 0;
  }
  uint64_t MetalLumaFormat = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, a2, (uint64_t)v6, (uint64_t)a4);
  uint64_t MetalChromaFormat = objc_msgSend_getMetalChromaFormat_(LumaChromaImage, v13, (uint64_t)v6, v14);
  metal = self->_metal;
  if (self->_nrfConfig->_allowModifyingInputBuffers)
  {
    uint64_t v18 = 7;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(metal, v15, (uint64_t)v6, MetalLumaFormat, 7, 0, 16);
  }
  else
  {
    uint64_t v18 = 1;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(metal, v15, (uint64_t)v6, MetalLumaFormat, 1, 0, 16);
  uint64_t v20 = };
  if (!v20)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    goto LABEL_38;
  }
  uint64_t v24 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v19, (uint64_t)v6, MetalChromaFormat, v18, 1, 8);
  if (!v24)
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    goto LABEL_40;
  }
  if (p_y[211])
  {
    unint64_t v25 = self->_metal;
    id v56 = 0;
    int v26 = objc_msgSend_bindYCbCrMetalTextureWithMetalContext_pixelBuffer_pixelFormat_textureToBind_alignmentFactor_(LumaChromaImage, v21, (uint64_t)v25, (uint64_t)v6, MetalYCbCrFormat, &v56, 16);
    uint64_t v6 = (__CVBuffer *)v56;
    if (v26) {
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  int fusionAlgo = self->_fusionAlgo;
  if (fusionAlgo == 1)
  {
    if (!self->_currentFrame)
    {
      if (a5 == 2 && !a6)
      {
        unint64_t v34 = objc_msgSend_width(v20, v21, v22, v23);
        unint64_t v38 = objc_msgSend_height(v20, v35, v36, v37);
        uint64_t v39 = (PyramidStorage_NRF *)objc_opt_new();
        accWeightPyramid = self->_accWeightPyramid;
        self->_accWeightPyramid = v39;

        uint64_t v42 = self->_accWeightPyramid;
        if (!v42) {
          goto LABEL_41;
        }
        v42->levels = 4;
        BYTE2(v54) = 0;
        LOWORD(v54) = 1;
        objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_startingLevel_testSize_pyramid_(PyramidStorage_NRF, v41, (uint64_t)self->_metal, @"_accWeightPyramid", (unsigned __int16)(v34 >> 2), (unsigned __int16)(v38 >> 2), 1, 1, v54, self->_accWeightPyramid);
      }
      uint64_t v43 = objc_msgSend_width(v20, v21, v22, v23);
      uint64_t v47 = objc_msgSend_height(v20, v44, v45, v46);
      if (objc_msgSend_allocateCoallesedFusionInputPyramidsForWidth_height_(self, v48, v43, v47))
      {
LABEL_42:
        FigDebugAssert3();
        int v26 = 0;
        goto LABEL_34;
      }
LABEL_28:
      objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_inputBands->bands[self->_currentFrame], v21, (uint64_t)v20, (uint64_t)v24, 0, self->_metal);
      if (v6) {
        objc_msgSend_setYCbCrBand0Texture_(self->_inputBands->bands[self->_currentFrame], v49, (uint64_t)v6, v50);
      }
      if (!objc_msgSend_createPyramidForFrame_cfp_(self, v49, (uint64_t)self->_inputBands->bands[self->_currentFrame], (uint64_t)a4)&& (*(_DWORD *)p_y != 1|| !objc_msgSend_correctGTC_(self->_fusionRemixStage, v51, (uint64_t)self->_inputBands->bands[self->_currentFrame], v52)))
      {
        goto LABEL_33;
      }
LABEL_41:
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      goto LABEL_34;
    }
LABEL_19:
    if (a5 == 7 || !a5)
    {
      uint64_t v28 = objc_msgSend_width(v20, v21, v22, v23);
      uint64_t v32 = objc_msgSend_height(v20, v29, v30, v31);
      if (objc_msgSend_allocateCoallesedFusionInputPyramidsForWidth_height_levels_frames_(self, v33, v28, v32, 2, 1))goto LABEL_42; {
    }
      }
    goto LABEL_28;
  }
  if (fusionAlgo != 2) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_inputLuma[self->_currentFrame], v20);
  objc_storeStrong((id *)&self->_inputChroma[self->_currentFrame], v24);
  objc_storeStrong((id *)&self->_inputYCbCr[self->_currentFrame], v6);
LABEL_33:
  int v26 = 0;
  ++self->_currentFrame;
LABEL_34:

  return v26;
}

- (void)swapInputFrame:(int)a3 withFrame:(int)a4
{
}

- (int)selectNRFFusionReferenceFrame:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(frameProperties_t *)a6 nrfPlist:(id)a7
{
  id v12 = a7;
  uint64_t v13 = self->_inputBands->bands[a3];
  id v15 = self->_inputBands->bands[a4];
  if (!self->_fusionReferenceFrame)
  {
    uint64_t v16 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    int v17 = objc_msgSend_selectNRFFusionReferenceFrame_ev0Bands_evmProperties_ev0Properties_nrfPlist_outputFusionMode_staticScene_motionDetection_grayGhostDetection_(self->_fusionRemixStage, v14, (uint64_t)v13, (uint64_t)v15, a5, a6, v12, &self->_fusionReferenceFrame, &self->_isStaticScene, self->_motionDetection, self->_grayGhostDetection);
    if (v17)
    {
      int v19 = v17;
      FigDebugAssert3();
      goto LABEL_10;
    }
    if (*v16 == 1) {
      kdebug_trace();
    }
  }
  if (dword_26B429788)
  {
    uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v19 = 0;
LABEL_10:

  return v19;
}

- (int)nrfFusionDenseRegister:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(frameProperties_t *)a6
{
  uint64_t v11 = objc_msgSend_allocator(self->_metal, a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
  id v15 = objc_msgSend_newTextureDescriptor(v11, v12, v13, v14);

  if (!v15)
  {
    FigDebugAssert3();
    int v86 = FigSignalErrorAt();
    goto LABEL_21;
  }
  int v19 = objc_msgSend_desc(v15, v16, v17, v18);
  objc_msgSend_setUsage_(v19, v20, 7, v21);

  if (self->_fusionReferenceFrame == 2)
  {
    uint64_t v22 = self->_inputBands->bands[a3];
    uint64_t v23 = self->_inputBands->bands[a4];
    uint64_t v24 = (uint64_t *)objc_opt_new();
    uint64_t v89 = (uint64_t *)v23;
    if (!v24)
    {
      FigDebugAssert3();
      int v86 = FigSignalErrorAt();
      goto LABEL_20;
    }
    long long v91 = 0u;
    long long v92 = 0u;
    long long v90 = 0u;
    simd_float3x3 v93 = __invert_f3(*(simd_float3x3 *)&a5[1].meta.exposureParams.conversion_gain);
    DWORD2(v90) = v93.columns[0].i32[2];
    DWORD2(v91) = v93.columns[1].i32[2];
    *(void *)&long long v90 = v93.columns[0].i64[0];
    *(void *)&long long v91 = v93.columns[1].i64[0];
    DWORD2(v92) = v93.columns[2].i32[2];
    *(void *)&long long v92 = v93.columns[2].i64[0];
    float v25 = sub_262F98A00((uint64_t)&a5->meta.exposureParams, (uint64_t)&a6->meta.exposureParams, (uint64_t)a6);
    uint64_t v26 = objc_opt_new();
    uint64_t v27 = (void **)v26;
    if (!v26)
    {
      FigDebugAssert3();
      int v86 = FigSignalErrorAt();
      goto LABEL_19;
    }
    v88 = a6;
    objc_storeStrong((id *)(v26 + 16), v22->textureY[0]);
    objc_storeStrong(v27 + 3, v22->textureUV[0]);
    uint64_t v28 = objc_opt_new();
    uint64_t v29 = (id *)v28;
    if (!v28)
    {
      FigDebugAssert3();
      int v86 = FigSignalErrorAt();
      goto LABEL_18;
    }
    objc_storeStrong((id *)(v28 + 16), v23->textureY[0]);
    objc_storeStrong(v29 + 3, v23->textureUV[0]);
    regDense = self->_regDense;
    uint64_t v34 = objc_msgSend_width(v27[2], v31, v32, v33);
    uint64_t v38 = objc_msgSend_height(v27[2], v35, v36, v37);
    int v40 = objc_msgSend_prepareWithImageWidth_imageHeight_(regDense, v39, v34, v38);
    if (v40)
    {
      int v86 = v40;
      FigDebugAssert3();
      goto LABEL_18;
    }
    uint64_t v44 = objc_msgSend_width(v27[3], v41, v42, v43);
    uint64_t v48 = objc_msgSend_desc(v15, v45, v46, v47);
    objc_msgSend_setWidth_(v48, v49, v44, v50);

    uint64_t v54 = objc_msgSend_height(v27[3], v51, v52, v53);
    uint64_t v58 = objc_msgSend_desc(v15, v55, v56, v57);
    objc_msgSend_setHeight_(v58, v59, v54, v60);

    id v64 = objc_msgSend_desc(v15, v61, v62, v63);
    objc_msgSend_setPixelFormat_(v64, v65, 65, v66);

    objc_msgSend_setLabel_(v15, v67, 0, v68);
    uint64_t v72 = objc_msgSend_allocator(self->_metal, v69, v70, v71);
    uint64_t v75 = objc_msgSend_newTextureWithDescriptor_(v72, v73, (uint64_t)v15, v74);
    uint64_t v76 = (void *)v24[3];
    v24[3] = v75;

    if (v24[3])
    {
      *(float *)&double v78 = v25;
      int v79 = objc_msgSend_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_(self->_regDense, v77, (uint64_t)v27, (uint64_t)v29, v24, &v90, v78);
      if (v79)
      {
        int v86 = v79;
        FigDebugAssert3();
        goto LABEL_18;
      }
      objc_msgSend_resetIncludingConfidence_(self->_regDense, v80, 0, v81);
      v88[1].meta.ltmCurves.ltmLut.bytes[244] = 1;
      if (!v88[1].meta.ltmCurves.ltmLut.bytes[179] || !self->_nrfConfig->_allowModifyingInputBuffers)
      {
        uint64_t v83 = (uint64_t)v89;
        if (objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v89, v82, v24[2], v24[3], 0, self->_metal))goto LABEL_29; {
        goto LABEL_16;
        }
      }
      uint64_t v83 = (uint64_t)v89;
      if (!objc_msgSend_copyTexture_outTex_(self->_textureUtils, v82, v24[2], v89[42]))
      {
        if (objc_msgSend_copyTexture_outTex_(self->_textureUtils, v84, v24[3], v89[62])) {
          goto LABEL_29;
        }
        FigMetalDecRef();
        FigMetalDecRef();
LABEL_16:
        if (!objc_msgSend_createPyramidForFrame_cfp_(self, v85, v83, (uint64_t)v88))
        {
          int v86 = 0;
LABEL_18:

LABEL_19:
LABEL_20:

          goto LABEL_21;
        }
LABEL_29:
        FigDebugAssert3();
        int v86 = FigSignalErrorAt();
        goto LABEL_18;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
    }
    int v86 = FigSignalErrorAt();
    goto LABEL_18;
  }
  int v86 = 0;
LABEL_21:

  return v86;
}

- (int)lowLightHybridRegister:(int)a3 refFrameIdx:(int)a4 nonRefFrameProps:(frameProperties_t *)a5 refFrameProps:(const frameProperties_t *)a6 canCopyBack:(BOOL)a7 nrfPlist:(id)a8
{
  BOOL v152 = a7;
  p_normalized_snr = (char *)&a5[1].meta.exposureParams.normalized_snr;
  id v13 = a8;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  uint64_t v14 = self->_inputBands->bands[a4];
  uint64_t v156 = self->_inputBands->bands[a3];
  uint64_t v18 = objc_msgSend_allocator(self->_metal, v15, v16, v17);
  uint64_t v22 = objc_msgSend_newTextureDescriptor(v18, v19, v20, v21);

  uint64_t v151 = v22;
  if (v22
    && (objc_msgSend_desc(v22, v23, v24, v25),
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_setUsage_(v26, v27, 7, v28),
        v26,
        (v154 = (uint64_t *)objc_opt_new()) != 0))
  {
    int v149 = a3;
    if (v152) {
      goto LABEL_7;
    }
    uint64_t v32 = objc_msgSend_width(v14->textureUV[0], v29, v30, v31);
    uint64_t v36 = objc_msgSend_desc(v22, v33, v34, v35);
    objc_msgSend_setWidth_(v36, v37, v32, v38);

    uint64_t v42 = objc_msgSend_height(v14->textureUV[0], v39, v40, v41);
    uint64_t v46 = objc_msgSend_desc(v22, v43, v44, v45);
    objc_msgSend_setHeight_(v46, v47, v42, v48);

    uint64_t v52 = objc_msgSend_desc(v22, v49, v50, v51);
    objc_msgSend_setPixelFormat_(v52, v53, 65, v54);

    objc_msgSend_setLabel_(v22, v55, 0, v56);
    uint64_t v60 = objc_msgSend_allocator(self->_metal, v57, v58, v59);
    uint64_t v63 = objc_msgSend_newTextureWithDescriptor_(v60, v61, (uint64_t)v22, v62);
    id v64 = (void *)v154[3];
    v154[3] = v63;

    if (v154[3])
    {
LABEL_7:
      uint64_t v153 = v14;
      float v65 = sub_262F98A00((uint64_t)&a6->meta.exposureParams, (uint64_t)&a5->meta.exposureParams, (uint64_t)a5);
      float v66 = sub_262FCDA18(*(void *)(*((void *)v13 + 3) + 104), a6->meta.exposureParams.AETargetGain);
      float v67 = sub_262FCDA18(*(void *)(*((void *)v13 + 3) + 112), a6->meta.exposureParams.AETargetGain);
      uint64_t v68 = *((void *)v13 + 3);
      uint64_t v69 = *(void *)(v68 + 88);
      if (v69)
      {
        *(float *)(*((void *)v13 + 3) + 80) = sub_262FCDA18(v69, a6->meta.exposureParams.AETargetGain);
        uint64_t v68 = *((void *)v13 + 3);
      }
      int v70 = *(_DWORD *)(v68 + 80);
      memset(v166, 0, 24);
      sub_262F857EC(v166, *((void **)v13 + 4), (uint64_t)&a6->meta.exposureParams, 3);
      uint64_t v71 = objc_opt_new();
      objc_storeStrong((id *)(v71 + 16), v14->textureY[0]);
      uint64_t v147 = (void **)v71;
      objc_storeStrong((id *)(v71 + 24), v14->textureUV[0]);
      uint64_t v72 = (id *)objc_opt_new();
      objc_storeStrong(v72 + 2, v156->textureY[0]);
      objc_storeStrong(v72 + 3, v156->textureUV[0]);
      id v162 = 0;
      id v163 = 0;
      int v160 = *(_DWORD *)(*((void *)v13 + 3) + 96);
      uint64_t v159 = v166;
      *(float *)uint64_t v158 = v66;
      *(float *)&v158[1] = v67;
      v158[2] = v70;
      objc_storeStrong(&v162, self->_bilateralGrid);
      int v161 = v149;
      p_ltmCurves = &a6->meta.ltmCurves;
      uint64_t v75 = v154;
      if (objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurvesUBFusion, v74, (uint64_t)&a6->meta.ltmCurves, (uint64_t)&a6->meta.ltmCurves, 0, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights))
      {
        FigDebugAssert3();
        int v119 = FigSignalErrorAt();

        goto LABEL_37;
      }
      uint64_t v76 = objc_alloc_init(ToneMappingBuffers);
      objc_storeStrong((id *)&v76->curves, self->_toneMappingCurvesUBFusion);
      objc_storeStrong(&v163, v76);
      int v77 = sub_262FBAD5C(p_ltmCurves);
      int v78 = v77;
      uint64_t v148 = v76;
      if (v77 >= 0) {
        int v79 = v77;
      }
      else {
        int v79 = v77 + 1;
      }
      int v80 = sub_262FBADB4(p_ltmCurves);
      int v81 = v80;
      if (v80 >= 0) {
        int v82 = v80;
      }
      else {
        int v82 = v80 + 1;
      }
      int v83 = sub_262FBABDC(p_ltmCurves);
      v150 = v72;
      int v84 = sub_262FBAC44(p_ltmCurves);
      int v88 = objc_msgSend_width(v147[3], v85, v86, v87);
      int v92 = objc_msgSend_height(v147[3], v89, v90, v91);
      int v96 = v79 >> 1;
      int v97 = v82 >> 1;
      int v98 = (v79 >> 1) * v83;
      int v99 = (v82 >> 1) * v84;
      int v100 = 2 * v88 - v98;
      if (2 * v88 < v98) {
        ++v100;
      }
      int v101 = (v100 >> 1) + v78 / 4;
      int v102 = 2 * v92 - v99;
      if (2 * v92 < v99) {
        ++v102;
      }
      int v103 = v101 / 2;
      int v104 = ((v102 >> 1) + v81 / 4) / 2;
      BOOL v105 = __OFSUB__(v98, v96);
      int v106 = v98 - v96;
      if (v106 < 0 != v105) {
        ++v106;
      }
      int v107 = v106 >> 1;
      BOOL v105 = __OFSUB__(v99, v97);
      int v108 = v99 - v97;
      if (v108 < 0 != v105) {
        ++v108;
      }
      *(void *)&long long v109 = __PAIR64__(v104, v103);
      DWORD2(v109) = v107;
      HIDWORD(v109) = v108 >> 1;
      long long v164 = v109;
      if (self->_nrfConfig->_compressionLevel <= 0) {
        uint64_t v110 = 0;
      }
      else {
        uint64_t v110 = 255;
      }
      regDense = self->_regDense;
      uint64_t v14 = v153;
      uint64_t v75 = v154;
      uint64_t v112 = objc_msgSend_width(v147[2], v93, v94, v95);
      uint64_t v116 = objc_msgSend_height(v147[2], v113, v114, v115);
      int v119 = objc_msgSend_prepareWithRegDenseParams_subAllocatorID_imageWidth_imageHeight_(regDense, v117, (uint64_t)v158, v110, v112, v116);
      if (v119)
      {
        FigDebugAssert3();
        goto LABEL_36;
      }
      char v165 = p_normalized_snr[1];
      *(float *)&double v120 = v65;
      if (!objc_msgSend_runLowLightWithReferenceImage_nonReferenceImage_warpedImage_refWeightsLuma_nonRefWeightsLuma_relativeBrightness_homography_regDenseParams_(self->_regDense, v118, (uint64_t)v147, (uint64_t)v150, v154, v153->textureY[3], v156->textureY[3], &a5[1].meta.exposureParams.conversion_gain, v120, v158))
      {
        objc_msgSend_resetIncludingConfidence_(self->_regDense, v121, v160 == 2, v122);
        p_normalized_snr[340] = 1;
        if (v152)
        {
          uint64_t v124 = v156->textureY[0];
          uint64_t v125 = v156->textureUV[0];
          int v119 = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v126, v154[2], (uint64_t)v124);
          if (v119 || (int v119 = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v127, v154[3], (uint64_t)v125)) != 0)
          {
            FigDebugAssert3();
            FigSignalErrorAt();

            goto LABEL_36;
          }
          FigMetalDecRef();
          FigMetalDecRef();
        }
        else if (objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v156, v123, v154[2], v154[3], 0, self->_metal))
        {
          goto LABEL_50;
        }
        uint64_t v129 = MEMORY[0x263EF89A0];
        long long v130 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
        *(_OWORD *)&a5[1].meta.exposureParams.conversion_gaiuint64_t n = *MEMORY[0x263EF89A0];
        *(_OWORD *)&a5[1].meta.exposureParams.luxLevel = v130;
        *(_OWORD *)&a5[1].meta.exposureParams.CCT = *(_OWORD *)(v129 + 32);
        if (!objc_msgSend_createPyramidForFrame_cfp_(self, v128, (uint64_t)v156, (uint64_t)a5))
        {
          int v119 = 0;
LABEL_36:

LABEL_37:
          goto LABEL_38;
        }
      }
LABEL_50:
      FigDebugAssert3();
      int v119 = FigSignalErrorAt();
      goto LABEL_36;
    }
    FigDebugAssert3();
    int v119 = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    int v119 = FigSignalErrorAt();
  }
LABEL_38:
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v134 = objc_msgSend_commandQueue(self->_metal, v131, v132, v133);
    v138 = objc_msgSend_commandBuffer(v134, v135, v136, v137);

    objc_msgSend_setLabel_(v138, v139, @"KTRACE_END_MTL", v140);
    v157[0] = MEMORY[0x263EF8330];
    v157[1] = 3221225472;
    v157[2] = sub_262F6F030;
    v157[3] = &unk_2655C32E8;
    memset(&v157[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v138, v141, (uint64_t)v157, v142);
    objc_msgSend_commit(v138, v143, v144, v145);
  }
  if (v119) {
    *(_WORD *)p_normalized_snr = 1;
  }

  return v119;
}

- (int)toneMapBand1Frame:(id)a3 properties:(const frameProperties_t *)a4 sourceFrameType:(int)a5 sourceFrameIndex:(int)a6 ltcFrameIndex:(int)a7 gtcFrameIndex:(int)a8 nrfPlist:(id)a9
{
  id v15 = (id *)a3;
  uint64_t v16 = a9;
  uint64_t v17 = objc_alloc_init(ToneMappingBuffers);
  if (a6 >= 5 || a7 >= 5 || a8 >= 5) {
    goto LABEL_14;
  }
  int v18 = a7;
  int v19 = (char *)a4 + 224224 * a7;
  float v20 = sub_262F98A00((uint64_t)(v19 + 16), (uint64_t)&a4->meta.exposureParams + 224224 * a6, (uint64_t)a4);
  if (a5 == 2)
  {
    p_fusedBand = &self->_fusedBand;
    objc_storeStrong((id *)&v17->inLumaTex, self->_fusedBand->textureY[1]);
  }
  else
  {
    objc_storeStrong((id *)&v17->inLumaTex, self->_inputBands->bands[a6]->textureY[1]);
    p_fusedBand = &self->_inputBands->bands[a6];
  }
  uint64_t v22 = (*p_fusedBand)->textureUV[1];
  inChromaTedouble x = v17->inChromaTex;
  v17->inChromaTedouble x = v22;

  localGainMapTedouble x = v17->localGainMapTex;
  v17->localGainMapTedouble x = 0;

  objc_storeStrong((id *)&v17->outLumaTex, v15[2]);
  objc_storeStrong((id *)&v17->outChromaTex, v15[3]);
  objc_storeStrong((id *)&v17->curves, self->_toneMappingCurvesSkinMapInput);
  skinMasuint64_t k = v17->skinMask;
  v17->skinMasuint64_t k = 0;

  personMasuint64_t k = v17->personMask;
  v17->personMasuint64_t k = 0;

  skyMasuint64_t k = v17->skyMask;
  v17->skyMasuint64_t k = 0;

  faceLandmarks = v17->faceLandmarks;
  v17->faceLandmarks = 0;

  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v30 = v17->instanceMasks[i];
    v17->instanceMasks[i] = 0;
  }
  skinToneClassificatiouint64_t n = v17->skinToneClassification;
  v17->skinToneClassificatiouint64_t n = 0;

  maskConfidences = v17->maskConfidences;
  v17->maskConfidences = 0;

  uint64_t v33 = (char *)a4 + 224224 * a8;
  objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurvesSkinMapInput, v34, (uint64_t)(v19 + 168), (uint64_t)(v33 + 168), 0, *((double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid + 28028 * a6), *((double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows + 28028 * a6), *((double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights + 28028 * a6));
  uint64_t v37 = a4[1].meta.ltmCurves.ltmLut.bytes[224224 * a6 + 178]
      ? (double *)MEMORY[0x263EF89A0]
      : (double *)(&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid + 112112 * a6);
  BYTE4(v41) = a4[1].meta.ltmCurves.ltmLut.bytes[224224 * v18 + 176];
  LODWORD(v41) = 3;
  *(float *)&double v36 = v20;
  int IsLinear = objc_msgSend_runToneMapping_bilateralGrid_bilateralGridHomography_tmPlist_darkestFrameMetadata_ev0FrameMetadata_scaleInput_colorCorrection_hasChromaBias_quality_inputIsLinear_(self->_toneMappingStage, v35, (uint64_t)v17, 0, v16[5], v19, v33, 0, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v36, *v37, v37[2], v37[4], v41);
  int v39 = 0;
  if (IsLinear)
  {
LABEL_14:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
  }

  return v39;
}

- (int)downsampleBand0Frame:(id)a3 sourceFrameIndex:(int)a4
{
  uint64_t v6 = (uint64_t *)a3;
  if (a4 >= 5)
  {
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
  }
  else
  {
    uint64_t v7 = self->_inputBands->bands[a4]->textureY[0];
    int v8 = self->_inputBands->bands[a4]->textureUV[0];
    id v12 = objc_msgSend_commandBuffer(self->_metal, v9, v10, v11);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = objc_msgSend_computeCommandEncoder(v12, v13, v14, v15);
      if (v17)
      {
        float v20 = v17;
        objc_msgSend_setComputePipelineState_(v17, v18, (uint64_t)self->_shaders->_downsampleInference, v19);
        objc_msgSend_setTexture_atIndex_(v20, v21, (uint64_t)v7, 21);
        objc_msgSend_setTexture_atIndex_(v20, v22, (uint64_t)v8, 22);
        objc_msgSend_setTexture_atIndex_(v20, v23, v6[2], 29);
        objc_msgSend_setTexture_atIndex_(v20, v24, v6[3], 30);
        uint64_t v28 = objc_msgSend_width((void *)v6[3], v25, v26, v27);
        uint64_t v32 = objc_msgSend_height((void *)v6[3], v29, v30, v31);
        v44[0] = v28;
        v44[1] = v32;
        v44[2] = 1;
        int64x2_t v42 = vdupq_n_s64(0x10uLL);
        uint64_t v43 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v33, (uint64_t)v44, (uint64_t)&v42);
        objc_msgSend_endEncoding(v20, v34, v35, v36);
        objc_msgSend_commit(self->_metal, v37, v38, v39);

        int v40 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v40 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v40 = FigSignalErrorAt();
    }
  }

  return v40;
}

- (int)fuseFramesWithConfig:(const FusionConfiguration *)a3 properties:(frameProperties_t *)a4 nrfPlist:(id)a5 batchN:(int)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 isLowLight:(BOOL)a9
{
  BOOL v279 = a7;
  uint64_t v11 = a5;
  uint64_t v15 = objc_msgSend_allocator(self->_metal, v12, v13, v14);
  uint64_t v19 = objc_msgSend_newTextureDescriptor(v15, v16, v17, v18);

  if (!v19)
  {
    FigDebugAssert3();
    int v272 = FigSignalErrorAt();
    goto LABEL_54;
  }
  BOOL v278 = a8;
  uint64_t v23 = objc_msgSend_desc(v19, v20, v21, v22);
  objc_msgSend_setUsage_(v23, v24, 7, v25);

  unint64_t v290 = objc_msgSend_width(self->_inputBands->bands[0]->textureY[0], v26, v27, v28);
  unint64_t v35 = objc_msgSend_height(self->_inputBands->bands[0]->textureY[0], v29, v30, v31);
  uint64_t v36 = v11[3];
  unint64_t v277 = v35;
  if (*(unsigned char *)(v36 + 24) && *(_DWORD *)(v36 + 96) != 2)
  {
    id v293 = 0;
    uint64_t v37 = objc_msgSend_desc(v19, v32, v33, v34);
    objc_msgSend_setWidth_(v37, v38, v290, v39);

    uint64_t v43 = objc_msgSend_desc(v19, v40, v41, v42);
    objc_msgSend_setHeight_(v43, v44, v35, v45);

    uint64_t v49 = objc_msgSend_desc(v19, v46, v47, v48);
    objc_msgSend_setPixelFormat_(v49, v50, 25, v51);

    objc_msgSend_setLabel_(v19, v52, 0, v53);
    uint64_t v57 = objc_msgSend_allocator(self->_metal, v54, v55, v56);
    id v294 = (id)objc_msgSend_newTextureWithDescriptor_(v57, v58, (uint64_t)v19, v59);

    if (v294)
    {
      uint64_t v275 = v19;
      v276 = v11;
      uint64_t v63 = objc_msgSend_allocator(self->_metal, v60, v61, v62);
      float v66 = objc_msgSend_newTextureDescriptor_(v63, v64, 0, v65);

      uint64_t v70 = objc_msgSend_width(self->_inputBands->bands[0]->textureUV[0], v67, v68, v69);
      uint64_t v74 = objc_msgSend_desc(v66, v71, v72, v73);
      objc_msgSend_setWidth_(v74, v75, v70, v76);

      uint64_t v80 = objc_msgSend_height(self->_inputBands->bands[0]->textureUV[0], v77, v78, v79);
      int v84 = objc_msgSend_desc(v66, v81, v82, v83);
      objc_msgSend_setHeight_(v84, v85, v80, v86);

      uint64_t v90 = objc_msgSend_desc(v66, v87, v88, v89);
      objc_msgSend_setPixelFormat_(v90, v91, 65, v92);

      objc_msgSend_setLabel_(v66, v93, 0, v94);
      int v98 = objc_msgSend_allocator(self->_metal, v95, v96, v97);
      int v100 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v98, v99, (uint64_t)v66, 0);
      id v293 = v100;

      if (v100)
      {

        float finalScaleFwd = a3[4].colorSpaceConversionParameters[1].finalScaleFwd;
        if (SLODWORD(finalScaleFwd) >= 1)
        {
          uint64_t v102 = 0;
          float32x4_t v284 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
          float32x4_t v285 = *(float32x4_t *)MEMORY[0x263EF89A0];
          p_nonLinearScale = (float32x4_t *)&a3->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale;
          float32x4_t v282 = (float32x4_t)vdupq_n_s32(0x358637BDu);
          float32x4_t v283 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
          int v104 = a4;
          do
          {
            uint32x4_t v105 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v282, vabdq_f32(p_nonLinearScale[-1], v284)), (int8x16_t)vcgeq_f32(v282, vabdq_f32(p_nonLinearScale[-2], v285))), (int8x16_t)vcgeq_f32(v282, vabdq_f32(*p_nonLinearScale, v283)));
            v105.i32[3] = v105.i32[2];
            if ((vminvq_u32(v105) & 0x80000000) == 0)
            {
              int v106 = self->_inputBands->bands[v102];
              int v107 = v106->textureY[0];
              int v108 = v106->textureUV[0];
              warpStage = self->_warpStage;
              float32x4_t v286 = p_nonLinearScale[-2];
              double v287 = *(double *)p_nonLinearScale[-1].i64;
              double v288 = *(double *)p_nonLinearScale->i64;
              uint64_t v110 = v106->textureYCbCrBand0;
              v111 = v108;
              uint64_t v112 = v107;
              objc_msgSend_runWarpUsingTransform_inputLumaTex_inputChromaTex_outputLumaTex_outputChromaTex_(warpStage, v113, (uint64_t)v112, (uint64_t)v111, v294, v100, *(double *)v286.i64, v287, v288);
              objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_inputBands->bands[v102], v114, (uint64_t)v294, (uint64_t)v100, 0, self->_metal);
              objc_msgSend_createPyramidForFrame_cfp_(self, v115, (uint64_t)self->_inputBands->bands[v102], (uint64_t)v104);
              objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_inputBands->bands[v102], v116, (uint64_t)v112, (uint64_t)v111, 0, self->_metal);
              objc_msgSend_setYCbCrBand0Texture_(self->_inputBands->bands[v102], v117, (uint64_t)v110, v118);

              float finalScaleFwd = a3[4].colorSpaceConversionParameters[1].finalScaleFwd;
            }
            ++v102;
            int v104 = (frameProperties_t *)((char *)v104 + 224224);
            p_nonLinearScale += 3;
          }
          while (v102 < SLODWORD(finalScaleFwd));
        }
        FigMetalDecRef();
        FigMetalDecRef();

        uint64_t v19 = v275;
        uint64_t v11 = v276;
        unint64_t v35 = v277;
        goto LABEL_12;
      }
      FigDebugAssert3();
      int v272 = FigSignalErrorAt();

      uint64_t v19 = v275;
    }
    else
    {
      FigDebugAssert3();
      int v272 = FigSignalErrorAt();
    }

    goto LABEL_54;
  }
LABEL_12:
  uint64_t finalScaleFwd_low = LODWORD(a3[4].colorSpaceConversionParameters[1].finalScaleFwd);
  if ((int)finalScaleFwd_low >= 1)
  {
    double v120 = &a4[1].meta.ltmCurves.ltmLut.bytes[244];
    while (!*v120 || !self->_regDense->_pyrConfidence->textureY[0])
    {
      v120 += 224224;
      if (!--finalScaleFwd_low) {
        goto LABEL_17;
      }
    }
    FigMetalIncRef();
    objc_storeStrong((id *)&self->_regDense->_pyrConfidence->textureY[1], self->_regDense->_pyrConfidence->textureY[0]);
    uint64_t v125 = 0;
    while (1)
    {
      v126 = objc_msgSend_desc(v19, v122, v123, v124);
      objc_msgSend_setWidth_(v126, v127, (v290 >> (v125 + 2)), v128);

      uint64_t v132 = objc_msgSend_desc(v19, v129, v130, v131);
      objc_msgSend_setHeight_(v132, v133, (v35 >> (v125 + 2)), v134);

      v138 = objc_msgSend_desc(v19, v135, v136, v137);
      objc_msgSend_setPixelFormat_(v138, v139, 25, v140);

      objc_msgSend_setLabel_(v19, v141, 0, v142);
      uint64_t v146 = objc_msgSend_allocator(self->_metal, v143, v144, v145);
      uint64_t v149 = objc_msgSend_newTextureWithDescriptor_(v146, v147, (uint64_t)v19, v148);
      v150 = &self->_regDense->_pyrConfidence->textureY[v125];
      uint64_t v151 = v150[2];
      v150[2] = (MTLTexture *)v149;

      regDense = self->_regDense;
      uint64_t v153 = (uint64_t)&regDense->_pyrConfidence->textureY[v125];
      if (objc_msgSend_pyramidConfidence_input_(regDense, v154, *(void *)(v153 + 16), *(void *)(v153 + 8)))break; {
      if (++v125 == 2)
      }
      {
        uint64_t v121 = self->_regDense->_pyrConfidence;
        goto LABEL_22;
      }
    }
    FigDebugAssert3();
    goto LABEL_53;
  }
LABEL_17:
  uint64_t v121 = 0;
LABEL_22:
  self->_fusedBand->levels = 4;
  fusedBand = self->_fusedBand;
  if (a6) {
    goto LABEL_28;
  }
  if (!FigMetalIsValid())
  {
    uint64_t v159 = objc_msgSend_desc(v19, v156, v157, v158);
    objc_msgSend_setWidth_(v159, v160, (v290 >> 3), v161);

    char v165 = objc_msgSend_desc(v19, v162, v163, v164);
    objc_msgSend_setHeight_(v165, v166, (v277 >> 3), v167);

    id v171 = objc_msgSend_desc(v19, v168, v169, v170);
    objc_msgSend_setPixelFormat_(v171, v172, 25, v173);

    objc_msgSend_setLabel_(v19, v174, 0, v175);
    uint64_t v179 = objc_msgSend_allocator(self->_metal, v176, v177, v178);
    v182 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v179, v180, (uint64_t)v19, v181);
    uint64_t v183 = self->_fusedBand->textureY[3];
    self->_fusedBand->textureY[3] = v182;

    if (!self->_fusedBand->textureY[3]) {
      goto LABEL_62;
    }
  }
  if (!FigMetalIsValid())
  {
    uint64_t v186 = objc_msgSend_desc(v19, v32, v184, v185);
    objc_msgSend_setWidth_(v186, v187, (v290 >> 4) & 0x7FFFFFFF, v188);

    uint64_t v192 = objc_msgSend_desc(v19, v189, v190, v191);
    objc_msgSend_setHeight_(v192, v193, (v277 >> 4) & 0x7FFFFFFF, v194);

    uint64_t v198 = objc_msgSend_desc(v19, v195, v196, v197);
    objc_msgSend_setPixelFormat_(v198, v199, 65, v200);

    objc_msgSend_setLabel_(v19, v201, 0, v202);
    id v206 = objc_msgSend_allocator(self->_metal, v203, v204, v205);
    uint64_t v209 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v206, v207, (uint64_t)v19, v208);
    uint64_t v210 = self->_fusedBand->textureUV[3];
    self->_fusedBand->textureUV[3] = v209;

    fusedBand = self->_fusedBand;
    if (fusedBand->textureUV[3]) {
      goto LABEL_28;
    }
LABEL_62:
    FigDebugAssert3();
    goto LABEL_58;
  }
  fusedBand = self->_fusedBand;
LABEL_28:
  if (objc_msgSend_prepareForFusion_config_fusedPyramid_properties_nrfPlist_staticScene_isLowLight_(self->_fusionRemixStage, v32, (uint64_t)self->_inputBands, (uint64_t)a3, fusedBand, a4, v11, self->_isStaticScene, a9)|| self->_doGreenGhostMitigation&& v279&& a9&& objc_msgSend_mixFusedTexturesWithRefLuma_refChroma_refProperties_tuningParams_(self->_greenGhostLowLightStage, v211, (uint64_t)self->_inputBands->bands[0]->textureY[0], (uint64_t)self->_inputBands->bands[0]->textureUV[0], a4, v11[15]))
  {
    goto LABEL_57;
  }
  uint64_t v215 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v216 = objc_msgSend_commandQueue(self->_metal, v211, v212, v213);
    uint64_t v220 = objc_msgSend_commandBuffer(v216, v217, v218, v219);

    objc_msgSend_setLabel_(v220, v221, @"KTRACE_START_MTL", v222);
    objc_msgSend_addCompletedHandler_(v220, v223, (uint64_t)&unk_270E33E08, v224);
    objc_msgSend_commit(v220, v225, v226, v227);
  }
  LODWORD(v214) = 0.5;
  if (!LOBYTE(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias)) {
    *(float *)&double v214 = 0.0;
  }
  BYTE6(v274) = v278;
  BYTE5(v274) = a9;
  BYTE4(v274) = v279;
  LODWORD(v274) = a6;
  if (objc_msgSend_runImageFusion_config_fusedPyramid_accWeightPyramid_buffers_properties_nrfPlist_confidence_batchN_isLastBatch_isLowLight_usePatchBasedFusion_outputChromaBias_(self->_fusionRemixStage, v211, (uint64_t)self->_inputBands, (uint64_t)a3, self->_fusedBand, self->_accWeightPyramid, self->_fusionBuffers, a4, v214, v11, v121, v274))goto LABEL_57; {
  if (*v215)
  }
  {
    v231 = objc_msgSend_commandQueue(self->_metal, v228, v229, v230);
    v235 = objc_msgSend_commandBuffer(v231, v232, v233, v234);

    objc_msgSend_setLabel_(v235, v236, @"KTRACE_END_MTL", v237);
    v292[0] = MEMORY[0x263EF8330];
    v292[1] = 3221225472;
    v292[2] = sub_262F70924;
    v292[3] = &unk_2655C32E8;
    memset(&v292[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v235, v238, (uint64_t)v292, v239);
    objc_msgSend_commit(v235, v240, v241, v242);
  }
  if (!self->_doGreenGhostMitigation || !v279 || !a9) {
    goto LABEL_48;
  }
  if (*v215)
  {
    uint64_t v243 = objc_msgSend_commandQueue(self->_metal, v228, v229, v230);
    v247 = objc_msgSend_commandBuffer(v243, v244, v245, v246);

    objc_msgSend_setLabel_(v247, v248, @"KTRACE_START_MTL", v249);
    objc_msgSend_addCompletedHandler_(v247, v250, (uint64_t)&unk_270E33E28, v251);
    objc_msgSend_commit(v247, v252, v253, v254);
  }
  if (objc_msgSend_inpaintLuma_andChroma_tuningParams_(self->_greenGhostLowLightStage, v228, (uint64_t)self->_fusionBuffers->fusedLumaTex, (uint64_t)self->_fusionBuffers->fusedChromaTex, v11[15]))
  {
LABEL_57:
    FigDebugAssert3();
LABEL_58:
    int v272 = FigSignalErrorAt();

    goto LABEL_54;
  }
  if (*v215)
  {
    v258 = objc_msgSend_commandQueue(self->_metal, v255, v256, v257);
    v262 = objc_msgSend_commandBuffer(v258, v259, v260, v261);

    objc_msgSend_setLabel_(v262, v263, @"KTRACE_END_MTL", v264);
    v291[0] = MEMORY[0x263EF8330];
    v291[1] = 3221225472;
    v291[2] = sub_262F70A80;
    v291[3] = &unk_2655C32E8;
    memset(&v291[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v262, v265, (uint64_t)v291, v266);
    objc_msgSend_commit(v262, v267, v268, v269);
  }
LABEL_48:
  for (uint64_t i = 0; i != 5; ++i)
  {
    if (self->_inputBands->bands[i])
    {
      FigMetalDecRef();
      FigMetalDecRef();
      objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v271, (uint64_t)self->_inputBands->bands[i], (uint64_t)self->_metal);
    }
  }

LABEL_53:
  int v272 = 0;
LABEL_54:

  return v272;
}

- (int)toneMapAndDenoiseFusedFramesWithConfig:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 nrfPlist:(id)a5 style:(id)a6 output:(__CVBuffer *)a7 inferenceProvider:(id)a8 colorCubeFixType:(int)a9 isLowLight:(BOOL)a10 gainMap:(id)a11
{
  id v425 = a5;
  id v16 = a6;
  id v17 = a8;
  id v420 = a11;
  uint64_t v18 = objc_alloc_init(ToneMappingBuffers);
  uint64_t v422 = objc_opt_new();
  if (!v422 || (v424 = (id *)objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    int fixed = FigSignalErrorAt();
    uint64_t v26 = 0;
    v428 = 0;
    a7 = 0;
    obuint64_t j = 0;
    v424 = 0;
    goto LABEL_99;
  }
  uint64_t v22 = objc_msgSend_allocator(self->_metal, v19, v20, v21);
  uint64_t v26 = objc_msgSend_newTextureDescriptor(v22, v23, v24, v25);

  if (!v26) {
    goto LABEL_87;
  }
  uint64_t v30 = objc_msgSend_desc(v26, v27, v28, v29);
  objc_msgSend_setUsage_(v30, v31, 7, v32);

  if (!a7)
  {
    FigDebugAssert3();
    int fixed = FigSignalErrorAt();
    v428 = 0;
LABEL_88:
    obuint64_t j = 0;
    goto LABEL_99;
  }
  uint64_t v36 = objc_msgSend_allocator(self->_metal, v33, v34, v35);
  uint64_t v39 = objc_msgSend_usedSize_(v36, v37, 0, v38);

  if (v39)
  {
    v428 = 0;
    a7 = 0;
    obuint64_t j = 0;
    int fixed = 0;
    goto LABEL_99;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v40, (uint64_t)a7, 10, 7, 0, 16);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if (!obj)
  {
LABEL_87:
    FigDebugAssert3();
    int fixed = FigSignalErrorAt();
    v428 = 0;
    a7 = 0;
    goto LABEL_88;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v41, (uint64_t)a7, 30, 7, 1, 8);
  a7 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  if (!a7)
  {
    FigDebugAssert3();
    int fixed = FigSignalErrorAt();
    v428 = 0;
    goto LABEL_99;
  }
  uint64_t v427 = (uint64_t)v18;
  if (v17)
  {
    uint64_t v45 = objc_msgSend__runInferenceProvider_(self, v42, (uint64_t)v17, v44);
    uint64_t v46 = (void *)v422;
    if (!v45)
    {
      FigDebugAssert3();
      int fixed = FigSignalErrorAt();
      v428 = 0;
LABEL_91:
      uint64_t v18 = (ToneMappingBuffers *)v427;
      goto LABEL_80;
    }
  }
  else
  {
    uint64_t v45 = 0;
  }
  v428 = (void *)v45;
  if (*(unsigned char *)(*((void *)v425 + 2) + 41))
  {
    uint64_t v48 = objc_msgSend_width(self->_fusionBuffers->fusedLumaTex, v42, v43, v44);
    uint64_t v52 = objc_msgSend_desc(v26, v49, v50, v51);
    objc_msgSend_setWidth_(v52, v53, v48, v54);

    uint64_t v58 = objc_msgSend_height(self->_fusionBuffers->fusedLumaTex, v55, v56, v57);
    uint64_t v62 = objc_msgSend_desc(v26, v59, v60, v61);
    objc_msgSend_setHeight_(v62, v63, v58, v64);

    uint64_t v68 = objc_msgSend_desc(v26, v65, v66, v67);
    objc_msgSend_setPixelFormat_(v68, v69, 25, v70);

    objc_msgSend_setLabel_(v26, v71, 0, v72);
    uint64_t v76 = objc_msgSend_allocator(self->_metal, v73, v74, v75);
    uint64_t v79 = objc_msgSend_newTextureWithDescriptor_(v76, v77, (uint64_t)v26, v78);

    if (!v79) {
      goto LABEL_98;
    }
    LODWORD(v81) = *(_DWORD *)(*((void *)v425 + 2) + 44);
    objc_msgSend_runWithInput_output_gamma_(self->_outliersRemovalStage, v80, (uint64_t)self->_fusionBuffers->fusedLumaTex, v79, v81);
    FigMetalDecRef();
    fusionBuffers = self->_fusionBuffers;
    fusedLumaTedouble x = fusionBuffers->fusedLumaTex;
    fusionBuffers->fusedLumaTedouble x = (MTLTexture *)v79;
  }
  id v413 = v17;
  int v84 = self->_fusionBuffers;
  v417 = a7;
  v426 = self;
  int nonLinearBias_low = LOBYTE(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias);
  id v418 = v16;
  if (!LOBYTE(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias))
  {
    uint64_t v88 = objc_msgSend_width(v84->fusedChromaTex, v42, v43, v44);
    uint64_t v92 = objc_msgSend_desc(v26, v89, v90, v91);
    objc_msgSend_setWidth_(v92, v93, v88, v94);

    uint64_t v98 = objc_msgSend_height(self->_fusionBuffers->fusedChromaTex, v95, v96, v97);
    uint64_t v102 = objc_msgSend_desc(v26, v99, v100, v101);
    objc_msgSend_setHeight_(v102, v103, v98, v104);

    int v108 = objc_msgSend_desc(v26, v105, v106, v107);
    objc_msgSend_setPixelFormat_(v108, v109, 25, v110);

    objc_msgSend_setLabel_(v26, v111, 0, v112);
    uint64_t v116 = objc_msgSend_allocator(self->_metal, v113, v114, v115);
    uint64_t v119 = objc_msgSend_newTextureWithDescriptor_(v116, v117, (uint64_t)v26, v118);
    localGainMapTedouble x = v18->localGainMapTex;
    v18->localGainMapTedouble x = (MTLTexture *)v119;

    if (!v18->localGainMapTex) {
      goto LABEL_98;
    }
    objc_storeStrong((id *)&v18->inLumaTex, self->_fusionBuffers->fusedLumaTex);
    objc_storeStrong((id *)&v18->inChromaTex, self->_fusionBuffers->fusedChromaTex);
    uint64_t v124 = objc_msgSend_width(self->_fusionBuffers->fusedLumaTex, v121, v122, v123);
    uint64_t v128 = objc_msgSend_desc(v26, v125, v126, v127);
    objc_msgSend_setWidth_(v128, v129, v124, v130);

    uint64_t v134 = objc_msgSend_height(self->_fusionBuffers->fusedLumaTex, v131, v132, v133);
    v138 = objc_msgSend_desc(v26, v135, v136, v137);
    objc_msgSend_setHeight_(v138, v139, v134, v140);

    uint64_t v144 = objc_msgSend_desc(v26, v141, v142, v143);
    objc_msgSend_setPixelFormat_(v144, v145, 25, v146);

    objc_msgSend_setLabel_(v26, v147, 0, v148);
    BOOL v152 = objc_msgSend_allocator(self->_metal, v149, v150, v151);
    uint64_t v155 = objc_msgSend_newTextureWithDescriptor_(v152, v153, (uint64_t)v26, v154);
    outLumaTedouble x = v18->outLumaTex;
    v18->outLumaTedouble x = (MTLTexture *)v155;

    if (!v18->outLumaTex) {
      goto LABEL_81;
    }
    uint64_t v160 = objc_msgSend_width(self->_fusionBuffers->fusedChromaTex, v157, v158, v159);
    uint64_t v164 = objc_msgSend_desc(v26, v161, v162, v163);
    objc_msgSend_setWidth_(v164, v165, v160, v166);

    uint64_t v170 = objc_msgSend_height(self->_fusionBuffers->fusedChromaTex, v167, v168, v169);
    uint64_t v174 = objc_msgSend_desc(v26, v171, v172, v173);
    objc_msgSend_setHeight_(v174, v175, v170, v176);

    uint64_t v180 = objc_msgSend_desc(v26, v177, v178, v179);
    objc_msgSend_setPixelFormat_(v180, v181, 65, v182);

    objc_msgSend_setLabel_(v26, v183, 0, v184);
    uint64_t v188 = objc_msgSend_allocator(self->_metal, v185, v186, v187);
    uint64_t v191 = objc_msgSend_newTextureWithDescriptor_(v188, v189, (uint64_t)v26, v190);
    outChromaTedouble x = v18->outChromaTex;
    v18->outChromaTedouble x = (MTLTexture *)v191;

    if (!v18->outChromaTex)
    {
LABEL_81:
      FigDebugAssert3();
      int fixed = FigSignalErrorAt();
LABEL_82:
      a7 = v417;
LABEL_99:
      uint64_t v46 = (void *)v422;
      goto LABEL_80;
    }
    objc_storeStrong((id *)&v18->curves, self->_toneMappingCurvesUBFusion);
    uint64_t v196 = objc_msgSend_skinMask(v428, v193, v194, v195);
    skinMasuint64_t k = v18->skinMask;
    v18->skinMasuint64_t k = (MTLTexture *)v196;

    uint64_t v201 = objc_msgSend_personMask(v428, v198, v199, v200);
    personMasuint64_t k = v18->personMask;
    v18->personMasuint64_t k = (MTLTexture *)v201;

    uint64_t v206 = objc_msgSend_skyMask(v428, v203, v204, v205);
    skyMasuint64_t k = v18->skyMask;
    v18->skyMasuint64_t k = (MTLTexture *)v206;

    uint64_t v211 = objc_msgSend_faceLandmarks(v428, v208, v209, v210);
    faceLandmarks = v18->faceLandmarks;
    v18->faceLandmarks = (NSArray *)v211;

    uint64_t v216 = objc_msgSend_skinToneClassification(v428, v213, v214, v215);
    skinToneClassificatiouint64_t n = v18->skinToneClassification;
    v18->skinToneClassificatiouint64_t n = (NSArray *)v216;

    uint64_t v221 = objc_msgSend_maskConfidences(v428, v218, v219, v220);
    maskConfidences = v18->maskConfidences;
    v18->maskConfidences = (NSArray *)v221;

    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v224 = v18->instanceMasks[i];
      v18->instanceMasks[i] = 0;
    }
    uint64_t v228 = v428;
    uint64_t v229 = objc_msgSend_instanceMasks(v428, v225, v226, v227);
    uint64_t v233 = objc_msgSend_count(v229, v230, v231, v232);

    if (v233)
    {
      unint64_t v237 = 0;
      do
      {
        uint64_t v238 = objc_msgSend_instanceMasks(v228, v234, v235, v236);
        uint64_t v241 = objc_msgSend_objectAtIndexedSubscript_(v238, v239, v237, v240);

        if (v241)
        {
          uint64_t v243 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v242, (uint64_t)v241, 25, 1, 0);
          uint64_t v18 = (ToneMappingBuffers *)v427;
          uint64_t v244 = *(void **)(v427 + 72 + 8 * v237);
          *(void *)(v427 + 72 + 8 * v237) = v243;

          if (!*(void *)(v427 + 72 + 8 * v237)) {
            goto LABEL_81;
          }
        }
        else
        {
          uint64_t v248 = *(void **)(v427 + 72 + 8 * v237);
          *(void *)(v427 + 72 + 8 * v237) = 0;
        }
        ++v237;
        uint64_t v228 = v428;
        uint64_t v249 = objc_msgSend_instanceMasks(v428, v245, v246, v247);
        unint64_t v253 = objc_msgSend_count(v249, v250, v251, v252);
      }
      while (v253 > v237);
    }
    uint64_t v18 = (ToneMappingBuffers *)v427;
    if (*(unsigned char *)(*((void *)v425 + 5) + 78)
      && objc_msgSend_skyMaskPixelBuffer(v428, v234, v235, v236)
      && ((unsigned int v256 = objc_msgSend_width(*(void **)(v427 + 8), v234, v254, v255),
           double v415 = COERCE_DOUBLE(__PAIR64__(objc_msgSend_height(*(void **)(v427 + 8), v257, v258, v259), v256)),
           !*(_DWORD *)(*(void *)(*((void *)v425 + 5) + 24) + 36))
        ? (uint64_t v263 = objc_msgSend_skyMaskPixelBuffer(v428, v260, v261, v262))
        : (uint64_t v263 = objc_msgSend_skinMaskPixelBuffer(v428, v260, v261, v262)),
          (int v265 = objc_msgSend_regularizeLocalToneCurves_mask_tcrParams_imageDims_(self->_toneMappingCurvesUBFusion, v264, (uint64_t)&a4->meta.ltmCurves + 224224 * SLODWORD(a3[4].colorSpaceConversionParameters[1].finalScale), v263, *(void *)(*((void *)v425 + 5) + 24), v415)) != 0))
    {
      int fixed = v265;
    }
    else
    {
      uint64_t v266 = (double *)(&a4->meta.sensorID + 56056 * SLODWORD(a3[4].colorSpaceConversionParameters[1].finalScale));
      int v267 = objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurvesUBFusion, v234, (uint64_t)(v266 + 21), (uint64_t)&a4->meta.ltmCurves+ 224224 * SLODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale), 0, v266[27870], v266[27872], v266[27874]);
      if (!v267)
      {
        uint64_t v270 = *((void *)v425 + 5);
        if (*(unsigned char *)(v270 + 56))
        {
          v271 = a3;
          BOOL v272 = *(_DWORD *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr >= 0;
          a7 = v417;
        }
        else
        {
          BOOL v272 = 0;
          a7 = v417;
          v271 = a3;
        }
        float finalScale = v271[4].colorSpaceConversionParameters[1].finalScale;
        int v274 = a4[1].meta.ltmCurves.ltmLut.bytes[224224 * SLODWORD(finalScale) + 176];
        float linearScale = v271[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale;
        if (a4[1].meta.ltmCurves.ltmLut.bytes[224224 * SLODWORD(finalScale) + 176])
        {
          if (*(&a4->meta.exposureParams.hr_enabled + 224224 * SLODWORD(linearScale)))
          {
            uint64_t v276 = *(void *)(v270 + 8);
            if (*(&a4->meta.exposureParams.AETargetGain + 56056 * SLODWORD(linearScale)) < *(float *)(v276 + 192))
            {
              if (*(unsigned char *)(v276 + 180))
              {
                *(_DWORD *)(v276 + 116) = *(_DWORD *)(v276 + 184);
                *(_DWORD *)(*(void *)(*((void *)v425 + 5) + 8) + 120) = *(_DWORD *)(*(void *)(*((void *)v425 + 5) + 8)
                                                                                          + 188);
              }
            }
          }
        }
        if (v272)
        {
          bilateralGrid = self->_bilateralGrid;
          BOOL v278 = (double *)(&a3->preWarpEnabled
                          + 48 * *(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr);
        }
        else
        {
          bilateralGrid = 0;
          BOOL v278 = (double *)MEMORY[0x263EF89A0];
        }
        BYTE4(v405) = v274 != 0;
        LODWORD(v405) = !self->_srlEnabled;
        LODWORD(v269) = 1.0;
        if (!objc_msgSend_runToneMapping_bilateralGrid_bilateralGridHomography_tmPlist_darkestFrameMetadata_ev0FrameMetadata_scaleInput_colorCorrection_hasChromaBias_quality_inputIsLinear_(self->_toneMappingStage, v268, v427, (uint64_t)bilateralGrid, *((void *)v425 + 5), (char *)a4 + 224224 * SLODWORD(finalScale), (char *)a4 + 224224 * SLODWORD(linearScale), 0, *v278, v278[2], v278[4], v269, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v405))
        {
          FigMetalDecRef();
          FigMetalDecRef();
          goto LABEL_49;
        }
LABEL_98:
        FigDebugAssert3();
        int fixed = FigSignalErrorAt();
        goto LABEL_99;
      }
      int fixed = v267;
    }
    FigDebugAssert3();
    goto LABEL_82;
  }
  objc_storeStrong((id *)&v18->outLumaTex, v84->fusedLumaTex);
  objc_storeStrong((id *)&v18->outChromaTex, self->_fusionBuffers->fusedChromaTex);
LABEL_49:
  v414 = v26;
  if (!v16 || !self->_styleStage || !*((void *)v425 + 13)) {
    goto LABEL_55;
  }
  uint64_t v279 = objc_msgSend_width(v18->localGainMapTex, v85, v86, v87);
  float32x4_t v283 = objc_msgSend_desc(v26, v280, v281, v282);
  objc_msgSend_setWidth_(v283, v284, v279, v285);

  uint64_t v289 = objc_msgSend_height(v18->localGainMapTex, v286, v287, v288);
  id v293 = objc_msgSend_desc(v26, v290, v291, v292);
  objc_msgSend_setHeight_(v293, v294, v289, v295);

  uint64_t v299 = objc_msgSend_desc(v26, v296, v297, v298);
  objc_msgSend_setUsage_(v299, v300, 7, v301);

  uint64_t v305 = objc_msgSend_pixelFormat(v18->localGainMapTex, v302, v303, v304);
  long long v309 = objc_msgSend_desc(v26, v306, v307, v308);
  objc_msgSend_setPixelFormat_(v309, v310, v305, v311);

  objc_msgSend_setLabel_(v26, v312, 0, v313);
  uint64_t v317 = objc_msgSend_allocator(self->_metal, v314, v315, v316);
  long long v320 = objc_msgSend_newTextureWithDescriptor_(v317, v318, (uint64_t)v26, v319);

  if (!v320)
  {
    FigDebugAssert3();
LABEL_103:
    int fixed = FigSignalErrorAt();

    id v17 = v413;
    goto LABEL_82;
  }
  styleStage = self->_styleStage;
  v408 = a4;
  v409 = (char *)a4 + 224224 * SLODWORD(a3[4].colorSpaceConversionParameters[1].finalScale);
  uint64_t v411 = *((void *)v425 + 13);
  id v324 = objc_msgSend_sceneType(v428, v321, v322, v323);
  id v325 = v18->outLumaTex;
  uint64_t v326 = v18->outChromaTex;
  int v327 = v18->localGainMapTex;
  objc_msgSend_personMask(v428, v328, v329, v330);
  v332 = long long v331 = v320;
  objc_super v336 = objc_msgSend_skinMask(v428, v333, v334, v335);
  v340 = objc_msgSend_skyMask(v428, v337, v338, v339);
  LODWORD(v325) = objc_msgSend_runWithStyle_tuningParams_refFrameMetadata_sceneType_lumaTex_chromaTex_gainMapTex_outputGainMapTex_personMaskTex_skinMaskTex_skyMaskTex_isLowLight_(styleStage, v341, (uint64_t)v16, v411, v409, v324, v325, v326, v327, v331, v332, v336, v340, a10);

  if (v325)
  {
    long long v320 = v331;
    uint64_t v26 = v414;
    goto LABEL_103;
  }
  FigMetalDecRef();
  v342 = v18->localGainMapTex;
  v18->localGainMapTedouble x = (MTLTexture *)v331;

  uint64_t v26 = v414;
  a7 = v417;
  a4 = v408;
LABEL_55:
  uint64_t v46 = (void *)v422;
  objc_storeStrong((id *)(v422 + 16), v18->outLumaTex);
  objc_storeStrong((id *)(v422 + 24), v18->outChromaTex);
  objc_storeStrong(v424 + 2, obj);
  if (a9 == -1) {
    v343 = a7;
  }
  else {
    v343 = 0;
  }
  objc_storeStrong(v424 + 3, v343);
  v347 = 0;
  if (nonLinearBias_low || (v347 = v18->localGainMapTex) != 0)
  {
    v412 = v347;
    int v348 = *(_DWORD *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr;
    if (v348 < 0) {
      uint64_t v349 = 0;
    }
    else {
      uint64_t v349 = (char *)a4 + 224224 * v348;
    }
    v407 = v349;
    v410 = objc_msgSend_skinMask(v428, v344, v345, v346);
    v353 = objc_msgSend_skyMask(v428, v350, v351, v352);
    v354 = (double *)(&a4->meta.sensorID
                    + 56056 * SLODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale));
    BOOL isStaticScene = v426->_isStaticScene;
    char v362 = objc_msgSend_defringingEnabled(*((void **)v425 + 12), v356, v357, v358);
    BOOL v363 = v426->_doGreenGhostMitigation && !a10;
    v364 = objc_msgSend_faceLandmarks(v428, v359, v360, v361);
    BYTE2(v406) = v363;
    BYTE1(v406) = a10;
    LOBYTE(v406) = v362;
    uint64_t v46 = (void *)v422;
    LOBYTE(v405) = isStaticScene;
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = objc_msgSend_denoiseFrameWithOutput_input_localGainMap_skinMask_skyMask_maskExtent_exposure_staticScene_nrfPlist_defringeEnabled_isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap_(v426, v365, (uint64_t)v424, v422, v412, v410, v353, v354 + 2, v354[16], v354[17], v354[18], v354[19], v405, v425, v406, v364, (char *)a4+ 224224* SLODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale),
                                                                                             v407,
                                                                                             v420);

    if (isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap)
    {
      FigDebugAssert3();
      int fixed = FigSignalErrorAt();
      a7 = v417;
      id v16 = v418;
      id v17 = v413;
      uint64_t v26 = v414;
      goto LABEL_91;
    }
    FigMetalDecRef();
    FigMetalDecRef();
    uint64_t v18 = (ToneMappingBuffers *)v427;
    if (!nonLinearBias_low) {
      FigMetalDecRef();
    }
    FigMetalDecRef();
    FigMetalDecRef();
    int v370 = a9;
    a7 = v417;
    id v16 = v418;
    uint64_t v26 = v414;
    if (a9 != -1)
    {
      v371 = (_DWORD *)MEMORY[0x263F00E10];
      if (*MEMORY[0x263F00E10])
      {
        v372 = objc_msgSend_commandQueue(v426->_metal, v367, v368, v369);
        v376 = objc_msgSend_commandBuffer(v372, v373, v374, v375);

        objc_msgSend_setLabel_(v376, v377, @"KTRACE_START_MTL", v378);
        objc_msgSend_addCompletedHandler_(v376, v379, (uint64_t)&unk_270E33E48, v380);
        objc_msgSend_commit(v376, v381, v382, v383);

        int v370 = a9;
      }
      ColorCubeCorrectionStage = v426->_ColorCubeCorrectionStage;
      uint64_t v385 = (uint64_t)v424[2];
      uint64_t v386 = (uint64_t)v424[3];
      if (v370 == 3)
      {
        v387 = objc_msgSend_skyMask(v428, v367, v368, v369);
        int fixed = objc_msgSend_runOnLuma_andChroma_withMask_outChroma_colorCubeFixType_(ColorCubeCorrectionStage, v388, v385, v386, v387, v417, 3);

        uint64_t v18 = (ToneMappingBuffers *)v427;
      }
      else
      {
        int fixed = objc_msgSend_runOnLuma_andChroma_withMask_outChroma_colorCubeFixType_(v426->_ColorCubeCorrectionStage, v367, (uint64_t)v424[2], (uint64_t)v424[3], 0, v417);
      }
      uint64_t v46 = (void *)v422;
      if (fixed)
      {
        FigDebugAssert3();
        id v17 = v413;
        id v16 = v418;
        goto LABEL_80;
      }
      id v16 = v418;
      if (*v371)
      {
        v392 = objc_msgSend_commandQueue(v426->_metal, v389, v390, v391);
        v396 = objc_msgSend_commandBuffer(v392, v393, v394, v395);

        objc_msgSend_setLabel_(v396, v397, @"KTRACE_END_MTL", v398);
        v429[0] = MEMORY[0x263EF8330];
        v429[1] = 3221225472;
        v429[2] = sub_262F72564;
        v429[3] = &unk_2655C32E8;
        v429[5] = 0;
        v429[6] = 0;
        v429[4] = 1;
        objc_msgSend_addCompletedHandler_(v396, v399, (uint64_t)v429, v400);
        objc_msgSend_commit(v396, v401, v402, v403);

        id v16 = v418;
      }
      FigMetalDecRef();
    }
  }
  else
  {
    FigDebugAssert3();
  }
  int fixed = 0;
  id v17 = v413;
LABEL_80:

  return fixed;
}

- (int)computeMotionScore:(int)a3 ev0FrameIndex:(int)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 motionScore:(float *)a7 nrfPlist:(id)a8
{
  *a7 = 0.0;
  int v8 = objc_msgSend_runMotionDetection_evm_ev0_evmProperties_ev0Properties_nrfPlist_(self->_motionDetection, a2, (uint64_t)a7, (uint64_t)self->_inputBands->bands[a3]->textureY[1], self->_inputBands->bands[a4]->textureY[1], a5, a6, a8);
  if (v8)
  {
    FigDebugAssert3();
  }
  else if (dword_26B429788)
  {
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v8;
}

- (int)startSyntheticReferenceDetectors:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 nrfPlist:(id)a5
{
  id v9 = a5;
  if (!self->_nrfConfig->_enableDeepFusion
    || (uint64_t linearScale_low = LODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale),
        (linearScale_low & 0x80000000) != 0)
    || (uint64_t v11 = *(unsigned int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr, (v11 & 0x80000000) != 0)
    || objc_msgSend_startDetectorsWithGrayGhost_motionDetection_evm_ev0_evmProperties_ev0Properties_nrfPlist_(self->_syntheticReferenceStage, v8, (uint64_t)self->_grayGhostDetection, (uint64_t)self->_motionDetection, self->_inputBands->bands[v11], self->_inputBands->bands[linearScale_low], (char *)a4 + 224224 * v11, (char *)a4 + 224224 * linearScale_low, v9))
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (int)collectSyntheticReferenceDetectorsResultsSync:(float *)a3 srMode:(int *)a4 nrfPlist:(id)a5
{
  id v9 = a5;
  if (!self->_nrfConfig->_enableDeepFusion
    || objc_msgSend_collectDetectorsResultsWithGrayGhost_motionDetection_nrfPlist_(self->_syntheticReferenceStage, v8, (uint64_t)self->_grayGhostDetection, (uint64_t)self->_motionDetection, v9))
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
  }
  else
  {
    if (a3)
    {
      objc_msgSend_getMotionDetectionResultSync(self->_motionDetection, v10, v11, v12);
      *(_DWORD *)a3 = v13;
    }
    if (a4)
    {
      int SyntheticReferenceMode = objc_msgSend_getSyntheticReferenceMode(self->_syntheticReferenceStage, v10, v11, v12);
      int v15 = 0;
      *a4 = SyntheticReferenceMode;
    }
    else
    {
      int v15 = 0;
    }
  }

  return v15;
}

- (uint64_t)doSyntheticReference:(double)a3 noiseDivisorOutputTex:(uint64_t)a4 lscGainsTex:(void *)a5 config:(void *)a6 evmProperties:(void *)a7 evmGreenTintAdjustment:(uint64_t)a8 ev0Properties:(uint64_t)a9 nrfPlist:(uint64_t)a10 intermediateMetadata:(id)a11
{
  id v17 = a5;
  id v18 = a6;
  id v176 = a7;
  id v19 = a11;
  id v20 = a12;
  uint64_t v21 = (void **)v17;
  uint64_t v25 = v21;
  if (!v21)
  {
    FigDebugAssert3();
    uint64_t v167 = FigSignalErrorAt();
    uint64_t v30 = 0;
    uint64_t v44 = 0;
    goto LABEL_30;
  }
  if (!v21[1] || !v21[2] || !v21[3])
  {
    FigDebugAssert3();
    uint64_t v167 = FigSignalErrorAt();
    uint64_t v30 = 0;
LABEL_34:
    uint64_t v44 = v25;
    goto LABEL_30;
  }
  uint64_t v26 = objc_msgSend_allocator(*(void **)(a1 + 144), v22, v23, v24);
  uint64_t v30 = objc_msgSend_newTextureDescriptor(v26, v27, v28, v29);

  if (!v30 || !*(unsigned char *)(*(void *)(a1 + 152) + 63))
  {
    FigDebugAssert3();
    uint64_t v167 = FigSignalErrorAt();
    goto LABEL_34;
  }
  if ((*(_DWORD *)(a8 + 1308) & 0x80000000) != 0)
  {
    FigDebugAssert3();
    uint64_t v167 = FigSignalErrorAt();
    uint64_t v44 = v25;
    goto LABEL_30;
  }
  uint64_t v170 = *(unsigned int *)(a8 + 1308);
  id v172 = v20;
  uint64_t v34 = *(unsigned int *)(a8 + 1304);
  BOOL v38 = objc_msgSend_pixelFormat(v25[2], v31, v32, v33) == 588 && objc_msgSend_pixelFormat(v25[3], v35, v36, v37) == 589;
  uint64_t v171 = a9;
  if (objc_msgSend_isCompressed(v25[2], v35, v36, v37)) {
    int v42 = objc_msgSend_isCompressed(v25[3], v39, v40, v41) ^ 1;
  }
  else {
    int v42 = 1;
  }
  int v43 = v38 & v42;
  uint64_t v44 = v25;
  if ((v38 & v42) == 1)
  {
    uint64_t v44 = (void **)objc_opt_new();

    if (!v44)
    {
      FigDebugAssert3();
      uint64_t v167 = FigSignalErrorAt();
      id v20 = v172;
      goto LABEL_30;
    }
    id v169 = v19;
    uint64_t v48 = objc_msgSend_width(v25[2], v45, v46, v47);
    uint64_t v52 = objc_msgSend_desc(v30, v49, v50, v51);
    objc_msgSend_setWidth_(v52, v53, v48, v54);

    uint64_t v58 = objc_msgSend_height(v25[2], v55, v56, v57);
    uint64_t v62 = objc_msgSend_desc(v30, v59, v60, v61);
    objc_msgSend_setHeight_(v62, v63, v58, v64);

    uint64_t v68 = objc_msgSend_desc(v30, v65, v66, v67);
    objc_msgSend_setUsage_(v68, v69, 3, v70);

    uint64_t v74 = objc_msgSend_desc(v30, v71, v72, v73);
    objc_msgSend_setPixelFormat_(v74, v75, 25, v76);

    uint64_t v80 = objc_msgSend_desc(v30, v77, v78, v79);
    objc_msgSend_setCompressionMode_(v80, v81, 2, v82);

    uint64_t v86 = objc_msgSend_desc(v30, v83, v84, v85);
    objc_msgSend_setCompressionFootprint_(v86, v87, 0, v88);

    objc_msgSend_setLabel_(v30, v89, 0, v90);
    uint64_t v94 = objc_msgSend_allocator(*(void **)(a1 + 144), v91, v92, v93);
    uint64_t v97 = objc_msgSend_newTextureWithDescriptor_(v94, v95, (uint64_t)v30, v96);
    uint64_t v98 = v44[2];
    v44[2] = (void *)v97;

    if (objc_msgSend_isCompressed(v44[2], v99, v100, v101)) {
      goto LABEL_38;
    }
    uint64_t v105 = objc_msgSend_width(v25[3], v102, v103, v104);
    long long v109 = objc_msgSend_desc(v30, v106, v107, v108);
    objc_msgSend_setWidth_(v109, v110, v105, v111);

    uint64_t v115 = objc_msgSend_height(v25[3], v112, v113, v114);
    uint64_t v119 = objc_msgSend_desc(v30, v116, v117, v118);
    objc_msgSend_setHeight_(v119, v120, v115, v121);

    uint64_t v125 = objc_msgSend_desc(v30, v122, v123, v124);
    objc_msgSend_setUsage_(v125, v126, 3, v127);

    uint64_t v131 = objc_msgSend_desc(v30, v128, v129, v130);
    objc_msgSend_setPixelFormat_(v131, v132, 65, v133);

    uint64_t v137 = objc_msgSend_desc(v30, v134, v135, v136);
    objc_msgSend_setCompressionMode_(v137, v138, 2, v139);

    uint64_t v143 = objc_msgSend_desc(v30, v140, v141, v142);
    objc_msgSend_setCompressionFootprint_(v143, v144, 0, v145);

    objc_msgSend_setLabel_(v30, v146, 0, v147);
    uint64_t v151 = objc_msgSend_allocator(*(void **)(a1 + 144), v148, v149, v150);
    uint64_t v154 = objc_msgSend_newTextureWithDescriptor_(v151, v152, (uint64_t)v30, v153);
    uint64_t v155 = v44[3];
    void v44[3] = (void *)v154;

    if (objc_msgSend_isCompressed(v44[3], v156, v157, v158))
    {
LABEL_38:
      FigDebugAssert3();
      uint64_t v167 = FigSignalErrorAt();
      id v20 = v172;
      id v19 = v169;
      goto LABEL_30;
    }
    id v19 = v169;
  }
  uint64_t v159 = *(void *)(a1 + 448) + 8;
  id v20 = v172;
  if ((v34 & 0x80000000) != 0)
  {
    uint64_t v160 = 0;
    uint64_t v161 = (double *)MEMORY[0x263EF89A0];
  }
  else
  {
    uint64_t v160 = *(void *)(v159 + 8 * v34);
    uint64_t v161 = (double *)(a8 + 48 * *(int *)(a8 + 1304));
  }
  uint64_t v162 = *(void *)(v159 + 8 * v170);
  uint64_t v163 = (double *)(a8 + 48 * *(int *)(a8 + 1308));
  if (objc_msgSend_doSyntheticReference_noiseDivisorOutputTex_lscGainsTex_evm_ev0_evmHomography_ev0Homography_evmProperties_evmGreenTintAdjustment_ev0Properties_nrfPlist_intermediateMetadata_(*(void **)(a1 + 496), v39, (uint64_t)v44, (uint64_t)v18, v176, v160, v162, v171, *v161, v161[2], v161[4], *v163, v163[2], v163[4], a2, a3, a10, v19, v172)) {
    goto LABEL_39;
  }
  if (v43)
  {
    if (!objc_msgSend_copyTexture_outTex_(*(void **)(a1 + 184), v164, (uint64_t)v44[2], (uint64_t)v25[2]))
    {
      FigMetalDecRef();
      if (!objc_msgSend_copyTexture_outTex_(*(void **)(a1 + 184), v166, (uint64_t)v44[3], (uint64_t)v25[3]))
      {
        FigMetalDecRef();
        goto LABEL_27;
      }
    }
LABEL_39:
    FigDebugAssert3();
    uint64_t v167 = FigSignalErrorAt();
    goto LABEL_30;
  }
LABEL_27:
  if ((v34 & 0x80000000) == 0) {
    objc_msgSend__freeInputBandPyramidForFrame_((void *)a1, v164, v34, v165);
  }
  uint64_t v167 = 0;
LABEL_30:

  return v167;
}

- (uint64_t)deepFusionBuildNoiseMap:(double)a3 lscGainsTex:(uint64_t)a4 config:(void *)a5 evmProperties:(void *)a6 evmGreenTintAdjustment:(uint64_t)a7 ev0Properties:(uint64_t)a8 nrfPlist:(uint64_t)a9
{
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(unsigned int *)(a7 + 1308);
  uint64_t v17 = *(unsigned int *)(a7 + 1304);
  uint64_t v21 = objc_msgSend_allocator(*(void **)(a1 + 144), v18, v19, v20);
  uint64_t v25 = objc_msgSend_newTextureDescriptor(v21, v22, v23, v24);

  if (v25 && (uint64_t v26 = *(void *)(a1 + 448)) != 0 && (v16 & 0x80000000) == 0)
  {
    uint64_t v30 = (void **)*(id *)(v26 + 8 + 8 * v16);
    uint64_t v31 = v30[42];
    if (v31)
    {
      uint64_t v120 = a8;
      id v32 = v15;
      id v123 = v14;
      uint64_t v33 = objc_msgSend_width(v31, v27, v28, v29);
      uint64_t v37 = objc_msgSend_height(v30[42], v34, v35, v36);
      uint64_t v41 = objc_msgSend_desc(v25, v38, v39, v40);
      objc_msgSend_setUsage_(v41, v42, 3, v43);

      uint64_t v47 = objc_msgSend_desc(v25, v44, v45, v46);
      objc_msgSend_setWidth_(v47, v48, v33, v49);

      uint64_t v53 = objc_msgSend_desc(v25, v50, v51, v52);
      objc_msgSend_setHeight_(v53, v54, v37, v55);

      uint64_t v59 = objc_msgSend_desc(v25, v56, v57, v58);
      objc_msgSend_setPixelFormat_(v59, v60, 25, v61);

      objc_msgSend_setLabel_(v25, v62, 0, v63);
      uint64_t v67 = objc_msgSend_allocator(*(void **)(a1 + 144), v64, v65, v66);
      uint64_t v70 = objc_msgSend_newTextureWithDescriptor_(v67, v68, (uint64_t)v25, v69);
      uint64_t v71 = *(void *)(a1 + 640);
      uint64_t v72 = *(void **)(v71 + 16);
      *(void *)(v71 + 16) = v70;

      if (!*(void *)(*(void *)(a1 + 640) + 16)) {
        goto LABEL_14;
      }
      uint64_t v76 = objc_msgSend_desc(v25, v73, v74, v75);
      unint64_t v80 = objc_msgSend_width(v76, v77, v78, v79);
      objc_msgSend_setWidth_(v76, v81, v80 >> 1, v82);

      uint64_t v86 = objc_msgSend_desc(v25, v83, v84, v85);
      unint64_t v90 = objc_msgSend_height(v86, v87, v88, v89);
      objc_msgSend_setHeight_(v86, v91, v90 >> 1, v92);

      uint64_t v96 = objc_msgSend_desc(v25, v93, v94, v95);
      objc_msgSend_setPixelFormat_(v96, v97, 65, v98);

      objc_msgSend_setLabel_(v25, v99, 0, v100);
      uint64_t v104 = objc_msgSend_allocator(*(void **)(a1 + 144), v101, v102, v103);
      uint64_t v107 = objc_msgSend_newTextureWithDescriptor_(v104, v105, (uint64_t)v25, v106);
      uint64_t v108 = *(void *)(a1 + 640);
      long long v109 = *(void **)(v108 + 24);
      *(void *)(v108 + 24) = v107;

      uint64_t v111 = *(void *)(a1 + 640);
      uint64_t v112 = *(void *)(v111 + 24);
      if (v112)
      {
        uint64_t v113 = *(void **)(a1 + 496);
        uint64_t v114 = *(void *)(v111 + 16);
        id v15 = v32;
        if ((v17 & 0x80000000) != 0)
        {
          uint64_t v118 = (double *)(a7 + 48 * *(int *)(a7 + 1308));
          uint64_t NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties = objc_msgSend_generateNoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties_(v113, v110, v114, v112, v32, v30, a9, *v118, v118[2], v118[4]);
          id v14 = v123;
          if (NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties) {
LABEL_15:
          }
            FigDebugAssert3();
        }
        else
        {
          uint64_t v115 = (double *)(a7 + 48 * *(int *)(a7 + 1304));
          uint64_t v116 = (double *)(a7 + 48 * *(int *)(a7 + 1308));
          id v14 = v123;
          uint64_t NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties = objc_msgSend_generateNoiseMap_outputNoiseMapChroma_noiseDivisorTex_lscGainsTex_evm_ev0_evmHomography_ev0Homography_evmProperties_evmGreenTintAdjustmentParams_ev0Properties_(v113, v110, v114, v112, v123, v32, *(void *)(*(void *)(a1 + 448)+ 8+ 8 * v17), v30, *v115, v115[2], v115[4], *v116, v116[2], v116[4], a2, a3, v120,
                                                                                        a9);
          if (NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties) {
            goto LABEL_15;
          }
        }
      }
      else
      {
LABEL_14:
        FigDebugAssert3();
        uint64_t NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties = FigSignalErrorAt();
        id v14 = v123;
        id v15 = v32;
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties = FigSignalErrorAt();
    uint64_t v30 = 0;
  }

  return NoiseMap_outputNoiseMapChroma_lscGainsTex_ev0_ev0Homography_ev0Properties;
}

- (int)sanityCheckRansacColorModel:(RansacModel *)a3
{
  if (fabsf(a3->var0) > 0.0078 || fabsf(a3->var0 + (float)(a3->var1 + -1.0)) > 0.0235) {
    *a3 = (RansacModel)0x3F80000000000000;
  }
  return 0;
}

- (unsigned)filterOutlierPairsInPlace:(float *)a3 and:(float *)a4 withMinX:(float)a5 maxX:(float)a6 inputSize:(int)a7
{
  unsigned int result = 0;
  if (a7)
  {
    int v8 = a4;
    id v9 = a3;
    uint64_t v10 = a7;
    do
    {
      float v11 = *v9;
      if (*v9 >= a5 && v11 <= a6)
      {
        a3[result] = v11;
        a4[result++] = *v8;
      }
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  return result;
}

- (int)computeRansacColorMatchingCoefficients:(const FusionConfiguration *)a3 scaleEv0brightness:(float)a4 applyToPyramid:(BOOL)a5 andStoreTransform:(id *)a6
{
  BOOL v7 = a5;
  float v11 = objc_msgSend_device(self->_metal, a2, (uint64_t)a3, a5);
  int v13 = objc_msgSend_newBufferWithLength_options_(v11, v12, 4096, 0);

  if (!v13)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v230 = 0;
    id v226 = 0;
    uint64_t v31 = 0;
    uint64_t v214 = 0;
    uint64_t v180 = 0;
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    uint64_t v19 = 0;
LABEL_33:
    uint64_t v66 = 0;
    uint64_t v25 = 0;
    goto LABEL_25;
  }
  uint64_t v17 = objc_msgSend_device(self->_metal, v14, v15, v16);
  uint64_t v19 = objc_msgSend_newBufferWithLength_options_(v17, v18, 4096, 0);

  if (!v19)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v230 = 0;
    id v226 = 0;
    uint64_t v31 = 0;
LABEL_32:
    uint64_t v214 = 0;
    uint64_t v180 = 0;
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    goto LABEL_33;
  }
  uint64_t v23 = objc_msgSend_device(self->_metal, v20, v21, v22);
  uint64_t v25 = objc_msgSend_newBufferWithLength_options_(v23, v24, 4096, 0);

  if (!v25)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v230 = 0;
    id v226 = 0;
    uint64_t v31 = 0;
    uint64_t v214 = 0;
    uint64_t v180 = 0;
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    uint64_t v66 = 0;
    goto LABEL_25;
  }
  uint64_t v29 = objc_msgSend_device(self->_metal, v26, v27, v28);
  uint64_t v31 = objc_msgSend_newBufferWithLength_options_(v29, v30, 4096, 0);

  id v230 = v25;
  if (!v31)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v226 = 0;
    goto LABEL_32;
  }
  id v226 = v31;
  uint64_t v35 = objc_msgSend_device(self->_metal, v32, v33, v34);
  uint64_t v31 = objc_msgSend_newBufferWithLength_options_(v35, v36, 4096, 0);

  if (!v31)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    goto LABEL_32;
  }
  uint64_t v228 = v19;
  uint64_t v40 = objc_msgSend_device(self->_metal, v37, v38, v39);
  uint64_t v42 = objc_msgSend_newBufferWithLength_options_(v40, v41, 4096, 0);

  if (!v42)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    uint64_t v214 = 0;
    uint64_t v180 = 0;
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    uint64_t v66 = 0;
    uint64_t v25 = 0;
LABEL_39:
    uint64_t v19 = v228;
    goto LABEL_25;
  }
  uint64_t v224 = (void *)v42;
  uint64_t v46 = objc_msgSend_device(self->_metal, v43, v44, v45);
  uint64_t v48 = objc_msgSend_newBufferWithLength_options_(v46, v47, 4, 0);

  if (!v48)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    uint64_t v180 = 0;
    id v233 = 0;
    uint64_t v215 = 0;
    uint64_t v66 = 0;
    uint64_t v25 = 0;
    uint64_t v214 = v224;
    goto LABEL_39;
  }
  uint64_t v221 = a6;
  id v223 = v48;
  *(float *)objc_msgSend_contents(v223, v49, v50, v51) = a4;
  uint64_t v55 = objc_msgSend_commandQueue(self->_metal, v52, v53, v54);
  uint64_t v59 = objc_msgSend_commandBuffer(v55, v56, v57, v58);

  if (!v59)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    uint64_t v66 = 0;
    uint64_t v25 = 0;
LABEL_38:
    uint64_t v180 = v223;
    uint64_t v214 = v224;
    goto LABEL_39;
  }
  uint64_t v63 = objc_msgSend_computeCommandEncoder(v59, v60, v61, v62);
  uint64_t v66 = v63;
  if (!v63)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v233 = 0;
    uint64_t v48 = 0;
    uint64_t v215 = 0;
    uint64_t v25 = v59;
    goto LABEL_38;
  }
  BOOL v218 = v7;
  uint64_t v231 = v59;
  uint64_t levels = self->_inputBands->bands[*(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr]->levels;
  objc_msgSend_setComputePipelineState_(v63, v64, (uint64_t)self->_shaders->_pickRandomSamples, v65);
  uint64_t v67 = self->_inputBands->bands[*(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr]->pixelBuffer2[(int)levels + 19];
  uint64_t v68 = self->_inputBands->bands[*(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr]->textureY[(int)levels + 19];
  objc_msgSend_setTexture_atIndex_(v66, v69, (uint64_t)self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale)]->pixelBuffer2[(int)levels + 19], 0);
  objc_msgSend_setTexture_atIndex_(v66, v70, (uint64_t)self->_inputBands->bands[SLODWORD(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale)]->textureY[(int)levels + 19], 1);
  uint64_t v220 = v67;
  objc_msgSend_setTexture_atIndex_(v66, v71, (uint64_t)v67, 2);
  uint64_t v219 = v68;
  objc_msgSend_setTexture_atIndex_(v66, v72, (uint64_t)v68, 3);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v73, (uint64_t)v13, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v74, (uint64_t)v228, 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v75, (uint64_t)v25, 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v76, (uint64_t)v226, 0, 3);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v77, (uint64_t)v31, 0, 4);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v78, (uint64_t)v224, 0, 5);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v79, (uint64_t)v223, 0, 6);
  long long v244 = xmmword_263017A00;
  uint64_t v245 = 1;
  long long v242 = xmmword_263017A10;
  uint64_t v243 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v66, v80, (uint64_t)&v244, (uint64_t)&v242);
  objc_msgSend_endEncoding(v66, v81, v82, v83);
  objc_msgSend_commit(v59, v84, v85, v86);
  objc_msgSend_waitForIdle(self->_metal, v87, v88, v89);
  id v90 = v226;
  uint64_t v94 = objc_msgSend_contents(v90, v91, v92, v93);
  uint64_t v222 = v13;
  id v95 = v13;
  uint64_t v99 = objc_msgSend_contents(v95, v96, v97, v98);
  float v100 = a4 * 0.99;
  LODWORD(v101) = -1.0;
  *(float *)&double v102 = v100;
  LODWORD(v94) = objc_msgSend_filterOutlierPairsInPlace_and_withMinX_maxX_inputSize_(self, v103, v94, v99, 1024, v101, v102);
  id v226 = v90;
  uint64_t v107 = (float *)objc_msgSend_contents(v226, v104, v105, v106);
  id v108 = v95;
  uint64_t v112 = (float *)objc_msgSend_contents(v108, v109, v110, v111);
  v241.i32[0] = sub_262F86BCC(v107, v112, v94, 1);
  v241.i32[1] = v113;
  objc_msgSend_sanityCheckRansacColorModel_(self, v114, (uint64_t)&v241, v115);
  id v116 = v31;
  uint64_t v120 = objc_msgSend_contents(v116, v117, v118, v119);
  id v121 = v228;
  uint64_t v125 = objc_msgSend_contents(v121, v122, v123, v124);
  LODWORD(v126) = -1.0;
  *(float *)&double v127 = v100;
  LODWORD(v95) = objc_msgSend_filterOutlierPairsInPlace_and_withMinX_maxX_inputSize_(self, v128, v120, v125, 1024, v126, v127);
  id v227 = v116;
  uint64_t v132 = (float *)objc_msgSend_contents(v227, v129, v130, v131);
  id v229 = v121;
  uint64_t v136 = (float *)objc_msgSend_contents(v229, v133, v134, v135);
  float v239 = sub_262F86BCC(v132, v136, v95, 1);
  __int32 v240 = v137;
  objc_msgSend_sanityCheckRansacColorModel_(self, v138, (uint64_t)&v239, v139);
  id v140 = v224;
  uint64_t v144 = objc_msgSend_contents(v140, v141, v142, v143);
  id v145 = v230;
  uint64_t v149 = objc_msgSend_contents(v145, v146, v147, v148);
  LODWORD(v150) = -1.0;
  *(float *)&double v151 = v100;
  LODWORD(v95) = objc_msgSend_filterOutlierPairsInPlace_and_withMinX_maxX_inputSize_(self, v152, v144, v149, 1024, v150, v151);
  id v225 = v140;
  uint64_t v156 = (float *)objc_msgSend_contents(v225, v153, v154, v155);
  id v230 = v145;
  uint64_t v160 = (float *)objc_msgSend_contents(v230, v157, v158, v159);
  float v237 = sub_262F86BCC(v156, v160, v95, 1);
  __int32 v238 = v161;
  objc_msgSend_sanityCheckRansacColorModel_(self, v162, (uint64_t)&v237, v163);
  uint64_t v167 = objc_msgSend_device(self->_metal, v164, v165, v166);
  id v169 = objc_msgSend_newBufferWithLength_options_(v167, v168, 32, 0);

  if (!v169)
  {
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    id v233 = 0;
    uint64_t v25 = v231;
    uint64_t v19 = v229;
    int v13 = v222;
LABEL_23:
    uint64_t v31 = v227;
    uint64_t v180 = v223;
    uint64_t v214 = v225;
    goto LABEL_24;
  }
  id v233 = v169;
  uint64_t v173 = (_OWORD *)objc_msgSend_contents(v233, v170, v171, v172);
  *(void *)&long long v177 = __PAIR64__(LODWORD(v239), v241.u32[0]);
  int32x4_t v178 = vdupq_lane_s32(v241, 1);
  *((float *)&v177 + 2) = v237;
  v178.i32[1] = v240;
  v178.i32[2] = v238;
  _OWORD *v173 = v177;
  v173[1] = v178;
  long long v179 = v173[1];
  *(_OWORD *)uint64_t v221 = *v173;
  *((_OWORD *)v221 + 1) = v179;
  uint64_t v31 = v227;
  uint64_t v180 = v223;
  if (v218)
  {
    uint64_t v181 = objc_msgSend_commandQueue(self->_metal, v174, v175, v176);
    uint64_t v25 = objc_msgSend_commandBuffer(v181, v182, v183, v184);

    uint64_t v19 = v229;
    int v13 = v222;
    if (v25)
    {
      if ((int)levels < 2)
      {
        uint64_t v194 = v66;
LABEL_21:
        objc_msgSend_commit(v25, v185, v186, v187);
        int v213 = 0;
        uint64_t v66 = v194;
      }
      else
      {
        uint64_t v188 = 1;
        int64x2_t v232 = vdupq_n_s64(0x10uLL);
        while (1)
        {
          v189 = self->_inputBands->bands[*(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr]->textureY[v188];
          uint64_t v190 = self->_inputBands->bands[*(int *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr]->textureUV[v188];
          uint64_t v194 = objc_msgSend_computeCommandEncoder(v25, v191, v192, v193);

          if (!v194) {
            break;
          }
          objc_msgSend_setComputePipelineState_(v194, v195, (uint64_t)self->_shaders->_adjustEvmPyramidColor, v196);
          objc_msgSend_setImageblockWidth_height_(v194, v197, 32, 32);
          objc_msgSend_setTexture_atIndex_(v194, v198, (uint64_t)v189, 0);
          objc_msgSend_setTexture_atIndex_(v194, v199, (uint64_t)v190, 1);
          objc_msgSend_setBuffer_offset_atIndex_(v194, v200, (uint64_t)v233, 0, 0);
          uint64_t v204 = objc_msgSend_width(v190, v201, v202, v203);
          uint64_t v208 = objc_msgSend_height(v190, v205, v206, v207);
          v236[0] = v204;
          v236[1] = v208;
          v236[2] = 1;
          int64x2_t v234 = v232;
          uint64_t v235 = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v194, v209, (uint64_t)v236, (uint64_t)&v234);
          objc_msgSend_endEncoding(v194, v210, v211, v212);

          ++v188;
          uint64_t v66 = v194;
          if (levels == v188) {
            goto LABEL_21;
          }
        }
        FigDebugAssert3();
        int v213 = FigSignalErrorAt();

        uint64_t v66 = 0;
      }
      int v13 = v222;
      uint64_t v19 = v229;
      goto LABEL_23;
    }
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
  }
  else
  {
    int v213 = 0;
    uint64_t v25 = v231;
    uint64_t v19 = v229;
    int v13 = v222;
  }
  uint64_t v214 = v225;
LABEL_24:
  uint64_t v215 = v219;
  uint64_t v48 = v220;
LABEL_25:

  return v213;
}

- (int)doSyntheticLong:(id)a3 noiseDivisorTex:(id)a4 realLongNoiseDivisorTex:(id)a5 lscGainsTex:(id)a6 config:(const FusionConfiguration *)a7 properties:(const frameProperties_t *)a8 motionScore:(float)a9 nrfPlist:(id)a10 intermediateMetadata:(id)a11
{
  uint64_t v17 = (id *)a3;
  id v18 = a4;
  id v212 = a5;
  id v211 = a6;
  uint64_t v19 = (void **)a10;
  id v210 = a11;
  obuint64_t j = v17[2];
  BOOL v218 = obj;
  id v213 = v17[3];
  uint64_t v217 = v213;
  uint64_t v216 = objc_opt_new();
  if (a7[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearThreshold < 0.0) {
    objc_msgSend_objectForKeyedSubscript_(v19[6], v20, @"4EV0", v21);
  }
  else {
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v19[6], v20, @"3EV0_LONG", v21);
  }
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"StaticSceneMotionThreshold", v24);
  objc_msgSend_floatValue(v25, v26, v27, v28);
  float v30 = v29;

  uint64_t v31 = @"StaticParameters";
  if (v30 < a9) {
    uint64_t v31 = @"DefaultParameters";
  }
  id v32 = v31;
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v19[6], v33, @"4EV0", v34);
  objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v32, v37);
  uint64_t v38 = (id *)objc_claimAutoreleasedReturnValue();

  uint64_t v207 = v19;
  uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v19[6], v39, @"3EV0_LONG", v40);
  uint64_t v206 = v32;
  uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)v32, v43);

  uint64_t v209 = v38;
  if (!v38) {
    goto LABEL_47;
  }
  if (!v44)
  {
    FigDebugAssert3();
    int v201 = FigSignalErrorAt();
    goto LABEL_51;
  }
  BOOL v51 = objc_msgSend_pixelFormat(v17[2], v45, v46, v47) == 588 && objc_msgSend_pixelFormat(v17[3], v48, v49, v50) == 589;
  if (objc_msgSend_isCompressed(v17[2], v48, v49, v50)) {
    int v55 = objc_msgSend_isCompressed(v17[3], v52, v53, v54) ^ 1;
  }
  else {
    int v55 = 1;
  }
  int v203 = v51 & v55;
  if ((v51 & v55) == 1)
  {
    uint64_t v56 = objc_msgSend_allocator(self->_metal, v52, v53, v54);
    uint64_t v60 = objc_msgSend_newTextureDescriptor(v56, v57, v58, v59);

    if (v60)
    {
      uint64_t v64 = objc_msgSend_width(v17[2], v61, v62, v63);
      uint64_t v68 = objc_msgSend_desc(v60, v65, v66, v67);
      objc_msgSend_setWidth_(v68, v69, v64, v70);

      uint64_t v74 = objc_msgSend_height(v17[2], v71, v72, v73);
      uint64_t v78 = objc_msgSend_desc(v60, v75, v76, v77);
      objc_msgSend_setHeight_(v78, v79, v74, v80);

      uint64_t v84 = objc_msgSend_desc(v60, v81, v82, v83);
      objc_msgSend_setUsage_(v84, v85, 3, v86);

      id v90 = objc_msgSend_desc(v60, v87, v88, v89);
      objc_msgSend_setPixelFormat_(v90, v91, 25, v92);

      uint64_t v96 = objc_msgSend_desc(v60, v93, v94, v95);
      objc_msgSend_setCompressionMode_(v96, v97, 2, v98);

      double v102 = objc_msgSend_desc(v60, v99, v100, v101);
      objc_msgSend_setCompressionFootprint_(v102, v103, 0, v104);

      objc_msgSend_setLabel_(v60, v105, 0, v106);
      uint64_t v110 = objc_msgSend_allocator(self->_metal, v107, v108, v109);
      __int32 v113 = objc_msgSend_newTextureWithDescriptor_(v110, v111, (uint64_t)v60, v112);
      BOOL v218 = v113;

      if (!objc_msgSend_isCompressed(v113, v114, v115, v116))
      {
        uint64_t v120 = objc_msgSend_width(v17[3], v117, v118, v119);
        uint64_t v124 = objc_msgSend_desc(v60, v121, v122, v123);
        objc_msgSend_setWidth_(v124, v125, v120, v126);

        uint64_t v130 = objc_msgSend_height(v17[3], v127, v128, v129);
        uint64_t v134 = objc_msgSend_desc(v60, v131, v132, v133);
        objc_msgSend_setHeight_(v134, v135, v130, v136);

        id v140 = objc_msgSend_desc(v60, v137, v138, v139);
        objc_msgSend_setUsage_(v140, v141, 3, v142);

        uint64_t v146 = objc_msgSend_desc(v60, v143, v144, v145);
        objc_msgSend_setPixelFormat_(v146, v147, 65, v148);

        BOOL v152 = objc_msgSend_desc(v60, v149, v150, v151);
        objc_msgSend_setCompressionMode_(v152, v153, 2, v154);

        uint64_t v158 = objc_msgSend_desc(v60, v155, v156, v157);
        objc_msgSend_setCompressionFootprint_(v158, v159, 0, v160);

        objc_msgSend_setLabel_(v60, v161, 0, v162);
        uint64_t v166 = objc_msgSend_allocator(self->_metal, v163, v164, v165);
        id v169 = objc_msgSend_newTextureWithDescriptor_(v166, v167, (uint64_t)v60, v168);
        uint64_t v217 = v169;

        if (!objc_msgSend_isCompressed(v169, v170, v171, v172))
        {

          id v213 = v169;
          obuint64_t j = v113;
          goto LABEL_19;
        }
      }
    }
    FigDebugAssert3();
    int v201 = FigSignalErrorAt();

LABEL_51:
    long long v177 = 0;
    uint64_t v38 = 0;
    goto LABEL_43;
  }
LABEL_19:
  uint64_t v173 = objc_opt_new();
  uint64_t v38 = (id *)v173;
  if (!v173)
  {
LABEL_47:
    FigDebugAssert3();
    int v201 = FigSignalErrorAt();
    long long v177 = 0;
    goto LABEL_43;
  }
  objc_storeStrong((id *)(v173 + 16), obj);
  objc_storeStrong(v38 + 3, v213);
  uint64_t v174 = (int *)malloc_type_calloc(1uLL, 0xDAE10uLL, 0x1020040BB5A49F1uLL);
  long long v177 = v174;
  if (!v174)
  {
    FigDebugAssert3();
    int v201 = -12786;
    goto LABEL_43;
  }
  id v204 = v18;
  uint64_t v208 = v44;
  uint64_t v205 = v17;
  *(void *)uint64_t v174 = 0xFFFFFFFF00000000;
  v174[2] = -1;
  float finalScaleFwd = a7[4].colorSpaceConversionParameters[1].finalScaleFwd;
  if (SLODWORD(finalScaleFwd) >= 1)
  {
    uint64_t v179 = 0;
    int v180 = 0;
    p_float finalScale = &a7->colorSpaceConversionParameters[4].finalScale;
    p_exposureParams = &a8->meta.exposureParams;
    uint64_t v183 = a7;
    while (1)
    {
      if (v179 != *(_DWORD *)&a7[4].colorSpaceConversionParameters[1].outputToLinearYCbCr)
      {
        objc_msgSend_addObject_(v216, v175, (uint64_t)self->_inputBands->bands[v179], v176);
        float v184 = sub_262F98950((uint64_t)&a8->meta.exposureParams+ 224224 * SLODWORD(a7[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale), (uint64_t)p_exposureParams, 2);
        if (v180 > 3)
        {
          FigDebugAssert3();
          int v201 = FigSignalErrorAt();
          id v18 = v204;
          uint64_t v17 = v205;
          uint64_t v44 = v208;
          goto LABEL_43;
        }
        uint64_t v185 = &v177[56032 * v180];
        *((_OWORD *)v185 + 1) = *(_OWORD *)p_finalScale;
        long long v186 = *((_OWORD *)p_finalScale + 1);
        long long v187 = *((_OWORD *)p_finalScale + 2);
        long long v188 = *((_OWORD *)p_finalScale + 4);
        *((_OWORD *)v185 + 4) = *((_OWORD *)p_finalScale + 3);
        *((_OWORD *)v185 + 5) = v188;
        *((_OWORD *)v185 + 2) = v186;
        *((_OWORD *)v185 + 3) = v187;
        long long v189 = *((_OWORD *)p_finalScale + 5);
        long long v190 = *((_OWORD *)p_finalScale + 6);
        long long v191 = *((_OWORD *)p_finalScale + 8);
        *((_OWORD *)v185 + 8) = *((_OWORD *)p_finalScale + 7);
        *((_OWORD *)v185 + 9) = v191;
        *((_OWORD *)v185 + 6) = v189;
        *((_OWORD *)v185 + 7) = v190;
        long long v192 = *((_OWORD *)p_finalScale + 9);
        long long v193 = *((_OWORD *)p_finalScale + 10);
        long long v194 = *((_OWORD *)p_finalScale + 12);
        *((_OWORD *)v185 + 12) = *((_OWORD *)p_finalScale + 11);
        *((_OWORD *)v185 + 13) = v194;
        *((_OWORD *)v185 + 10) = v192;
        *((_OWORD *)v185 + 11) = v193;
        *((float *)v185 + 56) = v184;
        long long v195 = *(_OWORD *)&v183->preWarpEnabled;
        long long v196 = *(_OWORD *)&v183->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale;
        *((_OWORD *)v185 + 16) = *(_OWORD *)&v183->colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias;
        *((_OWORD *)v185 + 17) = v196;
        *((_OWORD *)v185 + 15) = v195;
        memcpy(v185 + 72, &p_exposureParams[-1].ltm_locked, 0x36A70uLL);
        if (v179 == LODWORD(a7[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale)) {
          v177[1] = v180;
        }
        if (v179 == LODWORD(a7[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearThreshold)) {
          v177[2] = v180;
        }
        ++v180;
        float finalScaleFwd = a7[4].colorSpaceConversionParameters[1].finalScaleFwd;
      }
      ++v179;
      p_finalScale += 52;
      p_exposureParams = (exposureParameters *)((char *)p_exposureParams + 224224);
      uint64_t v183 = (const FusionConfiguration *)((char *)v183 + 48);
      if (v179 >= SLODWORD(finalScaleFwd)) {
        goto LABEL_33;
      }
    }
  }
  int v180 = 0;
LABEL_33:
  *long long v177 = v180;
  uint64_t v44 = v208;
  id v18 = v204;
  if (objc_msgSend_doSyntheticLongWithBands_slFuseEv0Plist_slFuseLongPlist_slParameters_slOutput_noiseDivisorTex_realLongNoiseDivisorTex_lscGainsTex_intermediateMetadata_(self->_syntheticLongStage, v175, (uint64_t)v216, (uint64_t)v209, v208, v177, v38, v204, v212, v211, v210))
  {
    FigDebugAssert3();
    int v201 = FigSignalErrorAt();
    uint64_t v17 = v205;
  }
  else
  {
    uint64_t v17 = v205;
    if (v203)
    {
      if (objc_msgSend_copyTexture_outTex_(self->_textureUtils, v197, (uint64_t)obj, (uint64_t)v205[2])
        || (FigMetalDecRef(),
            objc_msgSend_copyTexture_outTex_(self->_textureUtils, v198, (uint64_t)v213, (uint64_t)v205[3])))
      {
        FigDebugAssert3();
        int v201 = FigSignalErrorAt();
        goto LABEL_43;
      }
      FigMetalDecRef();
    }
    for (uint64_t i = 0; i != 5; ++i)
    {
      if (self->_inputBands->bands[i])
      {
        FigMetalDecRef();
        FigMetalDecRef();
        objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v200, (uint64_t)self->_inputBands->bands[i], (uint64_t)self->_metal);
      }
    }
    int v201 = 0;
    uint64_t v44 = v208;
  }
LABEL_43:
  free(v177);

  return v201;
}

- (int)runMotionDetectionLL:(BOOL)a3 imgIndex:(int)a4 imgProperties:(frameProperties_t *)a5 refProperties:(frameProperties_t *)a6
{
  int v6 = objc_msgSend_runMotionDetectionLL_image_imgProperties_refProperties_(self->_motionDetection, a2, a3, (uint64_t)self->_inputBands->bands[a4]->textureY[3], a5, a6);
  if (v6) {
    FigDebugAssert3();
  }
  return v6;
}

- (int)doDeepFusionProxyAsset:(id)a3 syntheticReference:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 inferenceResults:(id)a7 style:(id)a8 nrfPlist:(id)a9
{
  id v310 = a3;
  id v14 = (void **)a4;
  id v15 = a7;
  id v313 = a8;
  uint64_t v308 = (id *)a9;
  uint64_t v19 = objc_alloc_init(ToneMappingBuffers);
  uint64_t v20 = (int *)MEMORY[0x263F00E10];
  int v21 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v21 = *v20;
  }
  if (v21)
  {
    uint64_t v22 = objc_msgSend_commandQueue(self->_metal, v16, v17, v18);
    uint64_t v26 = objc_msgSend_commandBuffer(v22, v23, v24, v25);

    objc_msgSend_setLabel_(v26, v27, @"KTRACE_START_MTL", v28);
    objc_msgSend_addCompletedHandler_(v26, v29, (uint64_t)&unk_270E33E68, v30);
    objc_msgSend_commit(v26, v31, v32, v33);
  }
  uint64_t v305 = v15;
  if (!v19)
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    BOOL v51 = 0;
    uint64_t v311 = 0;
    uint64_t v38 = 0;
LABEL_41:
    obuint64_t j = 0;
    uint64_t v315 = 0;
    uint64_t v130 = v308;
    goto LABEL_34;
  }
  uint64_t v34 = objc_msgSend_allocator(self->_metal, v16, v17, v18);
  uint64_t v38 = objc_msgSend_newTextureDescriptor(v34, v35, v36, v37);

  if (!v38
    || (objc_msgSend_desc(v38, v39, v40, v41),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_setUsage_(v42, v43, 3, v44),
        v42,
        (uint64_t v45 = objc_opt_new()) == 0))
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    BOOL v51 = 0;
    uint64_t v311 = 0;
    goto LABEL_41;
  }
  uint64_t v311 = (id *)v45;
  if (v15)
  {
    uint64_t v49 = [BoundInferenceResults alloc];
    BOOL v51 = objc_msgSend_initWithResult_andMetal_(v49, v50, (uint64_t)v15, (uint64_t)self->_metal);
  }
  else
  {
    BOOL v51 = 0;
  }
  uint64_t v52 = objc_msgSend_width(v14[2], v46, v47, v48);
  uint64_t v56 = objc_msgSend_desc(v38, v53, v54, v55);
  objc_msgSend_setWidth_(v56, v57, v52, v58);

  uint64_t v62 = objc_msgSend_height(v14[2], v59, v60, v61);
  uint64_t v66 = objc_msgSend_desc(v38, v63, v64, v65);
  objc_msgSend_setHeight_(v66, v67, v62, v68);

  uint64_t v72 = objc_msgSend_desc(v38, v69, v70, v71);
  objc_msgSend_setPixelFormat_(v72, v73, 25, v74);

  objc_msgSend_setLabel_(v38, v75, 0, v76);
  uint64_t v80 = objc_msgSend_allocator(self->_metal, v77, v78, v79);
  uint64_t v83 = objc_msgSend_newTextureWithDescriptor_(v80, v81, (uint64_t)v38, v82);

  uint64_t v315 = (void *)v83;
  if (!v83)
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    obuint64_t j = 0;
    uint64_t v315 = 0;
LABEL_44:
    uint64_t v130 = v308;
LABEL_52:
    uint64_t v20 = (int *)MEMORY[0x263F00E10];
    goto LABEL_34;
  }
  uint64_t v87 = objc_msgSend_desc(v38, v84, v85, v86);
  unint64_t v91 = objc_msgSend_width(v87, v88, v89, v90);
  objc_msgSend_setWidth_(v87, v92, v91 >> 1, v93);

  uint64_t v97 = objc_msgSend_desc(v38, v94, v95, v96);
  unint64_t v101 = objc_msgSend_height(v97, v98, v99, v100);
  objc_msgSend_setHeight_(v97, v102, v101 >> 1, v103);

  uint64_t v107 = objc_msgSend_desc(v38, v104, v105, v106);
  objc_msgSend_setPixelFormat_(v107, v108, 65, v109);

  objc_msgSend_setLabel_(v38, v110, 0, v111);
  uint64_t v115 = objc_msgSend_allocator(self->_metal, v112, v113, v114);
  uint64_t v118 = objc_msgSend_newTextureWithDescriptor_(v115, v116, (uint64_t)v38, v117);

  obuint64_t j = (id)v118;
  if (!v118)
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    obuint64_t j = 0;
    goto LABEL_44;
  }
  uint64_t v122 = objc_msgSend_allocator(self->_metal, v119, v120, v121);
  uint64_t v126 = objc_msgSend_newTextureDescriptor(v122, v123, v124, v125);

  uint64_t v38 = v126;
  uint64_t v130 = v308;
  if (!v126) {
    goto LABEL_45;
  }
  unint64_t v131 = (unint64_t)objc_msgSend_width(v14[2], v127, v128, v129) >> 1;
  uint64_t v135 = objc_msgSend_desc(v126, v132, v133, v134);
  objc_msgSend_setWidth_(v135, v136, v131, v137);

  unint64_t v141 = (unint64_t)objc_msgSend_height(v14[2], v138, v139, v140) >> 1;
  uint64_t v145 = objc_msgSend_desc(v38, v142, v143, v144);
  objc_msgSend_setHeight_(v145, v146, v141, v147);

  uint64_t v151 = objc_msgSend_desc(v38, v148, v149, v150);
  objc_msgSend_setUsage_(v151, v152, 7, v153);

  uint64_t v157 = objc_msgSend_desc(v38, v154, v155, v156);
  objc_msgSend_setPixelFormat_(v157, v158, 25, v159);

  objc_msgSend_setLabel_(v38, v160, 0, v161);
  uint64_t v165 = objc_msgSend_allocator(self->_metal, v162, v163, v164);
  uint64_t v168 = objc_msgSend_newTextureWithDescriptor_(v165, v166, (uint64_t)v38, v167);
  localGainMapTedouble x = v19->localGainMapTex;
  v19->localGainMapTedouble x = (MTLTexture *)v168;

  if (!v19->localGainMapTex)
  {
LABEL_45:
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    goto LABEL_52;
  }
  long long v312 = v38;
  objc_storeStrong((id *)&v19->inLumaTex, v14[2]);
  uint64_t v304 = v14;
  objc_storeStrong((id *)&v19->inChromaTex, v14[3]);
  objc_storeStrong((id *)&v19->outLumaTex, v315);
  objc_storeStrong((id *)&v19->outChromaTex, obj);
  objc_storeStrong((id *)&v19->curves, self->_toneMappingCurvesSkinMapInput);
  uint64_t v173 = objc_msgSend_skinMask(v51, v170, v171, v172);
  skinMasuint64_t k = v19->skinMask;
  v19->skinMasuint64_t k = (MTLTexture *)v173;

  uint64_t v178 = objc_msgSend_personMask(v51, v175, v176, v177);
  personMasuint64_t k = v19->personMask;
  v19->personMasuint64_t k = (MTLTexture *)v178;

  uint64_t v183 = objc_msgSend_skyMask(v51, v180, v181, v182);
  skyMasuint64_t k = v19->skyMask;
  v19->skyMasuint64_t k = (MTLTexture *)v183;

  uint64_t v188 = objc_msgSend_faceLandmarks(v51, v185, v186, v187);
  faceLandmarks = v19->faceLandmarks;
  v19->faceLandmarks = (NSArray *)v188;

  for (uint64_t i = 0; i != 4; ++i)
  {
    long long v191 = v19->instanceMasks[i];
    v19->instanceMasks[i] = 0;
  }
  skinToneClassificatiouint64_t n = v19->skinToneClassification;
  v19->skinToneClassificatiouint64_t n = 0;

  maskConfidences = v19->maskConfidences;
  v19->maskConfidences = 0;

  long long v195 = a5;
  if (a5) {
    p_sensorID = (double *)&a5->meta.sensorID;
  }
  else {
    p_sensorID = (double *)&a6->meta.sensorID;
  }
  objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurvesSkinMapInput, v194, (uint64_t)(p_sensorID + 21), (uint64_t)&a6->meta.ltmCurves, 0, p_sensorID[27870], p_sensorID[27872], p_sensorID[27874]);
  objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v197, (uint64_t)&a6->meta.exposureParams, *((void *)v308[7] + 7));
  v19->inputLumaPedestal = v198;
  BYTE4(v299) = 0;
  LODWORD(v299) = 2;
  LODWORD(v199) = 1.0;
  if (objc_msgSend_runToneMapping_bilateralGrid_bilateralGridHomography_tmPlist_darkestFrameMetadata_ev0FrameMetadata_scaleInput_colorCorrection_hasChromaBias_quality_inputIsLinear_(self->_toneMappingStage, v200, (uint64_t)v19, 0, v308[5], p_sensorID, a6, 1, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v199, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows, *(double *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights, v299))
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v307 = 0;
    id v14 = v304;
    goto LABEL_52;
  }
  long long v309 = v51;
  if (!v313 || !self->_styleStage || !v308[13] || !v51) {
    goto LABEL_28;
  }
  uint64_t v204 = objc_msgSend_width(v19->localGainMapTex, v201, v202, v203);
  uint64_t v208 = objc_msgSend_desc(v38, v205, v206, v207);
  objc_msgSend_setWidth_(v208, v209, v204, v210);

  uint64_t v214 = objc_msgSend_height(v19->localGainMapTex, v211, v212, v213);
  BOOL v218 = objc_msgSend_desc(v38, v215, v216, v217);
  objc_msgSend_setHeight_(v218, v219, v214, v220);

  uint64_t v224 = objc_msgSend_desc(v38, v221, v222, v223);
  objc_msgSend_setUsage_(v224, v225, 7, v226);

  uint64_t v230 = objc_msgSend_pixelFormat(v19->localGainMapTex, v227, v228, v229);
  int64x2_t v234 = objc_msgSend_desc(v38, v231, v232, v233);
  objc_msgSend_setPixelFormat_(v234, v235, v230, v236);

  objc_msgSend_setLabel_(v38, v237, 0, v238);
  long long v242 = objc_msgSend_allocator(self->_metal, v239, v240, v241);
  uint64_t v245 = objc_msgSend_newTextureWithDescriptor_(v242, v243, (uint64_t)v38, v244);

  if (!v245)
  {
    FigDebugAssert3();
LABEL_51:
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();

    id v307 = 0;
    id v14 = v304;
    goto LABEL_52;
  }
  styleStage = self->_styleStage;
  uint64_t v302 = (uint64_t)v308[13];
  objc_msgSend_sceneType(v51, v246, v247, v248);
  uint64_t v249 = v51;
  v251 = uint64_t v250 = v245;
  uint64_t v252 = v19->localGainMapTex;
  unsigned int v256 = objc_msgSend_personMask(v249, v253, v254, v255);
  uint64_t v260 = objc_msgSend_skinMask(v249, v257, v258, v259);
  uint64_t v264 = objc_msgSend_skyMask(v249, v261, v262, v263);
  int isLowLight = objc_msgSend_runWithStyle_tuningParams_refFrameMetadata_sceneType_lumaTex_chromaTex_gainMapTex_outputGainMapTex_personMaskTex_skinMaskTex_skyMaskTex_isLowLight_(styleStage, v265, (uint64_t)v313, v302, p_sensorID, v251, v315, obj, v252, v250, v256, v260, v264, 0);

  if (isLowLight)
  {
    uint64_t v38 = v312;
    uint64_t v245 = v250;
    uint64_t v130 = v308;
    BOOL v51 = v309;
    goto LABEL_51;
  }
  FigMetalDecRef();
  int v267 = v19->localGainMapTex;
  v19->localGainMapTedouble x = (MTLTexture *)v250;

  long long v195 = a5;
  uint64_t v130 = v308;
  uint64_t v38 = v312;
LABEL_28:
  id v268 = v130[2];
  id v307 = v268;
  double v269 = &OBJC_IVAR___NRFPlist_proxyAssetEVMRefDenoising;
  if (!v195) {
    double v269 = &OBJC_IVAR___NRFPlist_proxyAssetEV0RefDenoising;
  }
  objc_storeStrong(v130 + 2, *(id *)((char *)v130 + *v269));
  objc_storeStrong(v311 + 2, v315);
  objc_storeStrong(v311 + 3, obj);
  v273 = v19->localGainMapTex;
  if (v273)
  {
    int v274 = objc_msgSend_skinMask(v309, v270, v271, v272);
    objc_msgSend_skyMask(v309, v275, v276, v277);
    v279 = BOOL v278 = v130;
    BYTE2(v301) = 0;
    LOWORD(v301) = 0;
    LOBYTE(v300) = 0;
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = objc_msgSend_denoiseFrameWithOutput_input_localGainMap_skinMask_skyMask_maskExtent_exposure_staticScene_nrfPlist_defringeEnabled_isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap_(self, v280, (uint64_t)v310, (uint64_t)v311, v273, v274, v279, &a6->meta.exposureParams, a6->meta.ROI.origin.x, a6->meta.ROI.origin.y, a6->meta.ROI.size.width, a6->meta.ROI.size.height, v300, v278, v301, 0, 0, 0, 0);

    if (isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap)
    {
      FigDebugAssert3();
    }
    else
    {
      objc_storeStrong(v278 + 2, v268);
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
    }
    id v14 = v304;
    uint64_t v130 = v278;
    uint64_t v20 = (int *)MEMORY[0x263F00E10];
    BOOL v51 = v309;
    uint64_t v38 = v312;
  }
  else
  {
    FigDebugAssert3();
    int isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap = FigSignalErrorAt();
    id v14 = v304;
    uint64_t v20 = (int *)MEMORY[0x263F00E10];
    BOOL v51 = v309;
  }
LABEL_34:
  int v285 = *v20;
  if (*v20 == 1)
  {
    kdebug_trace();
    int v285 = *v20;
  }
  if (v285)
  {
    float32x4_t v286 = objc_msgSend_commandQueue(self->_metal, v282, v283, v284);
    unint64_t v290 = objc_msgSend_commandBuffer(v286, v287, v288, v289);

    objc_msgSend_setLabel_(v290, v291, @"KTRACE_END_MTL", v292);
    v316[0] = MEMORY[0x263EF8330];
    v316[1] = 3221225472;
    v316[2] = sub_262F769EC;
    v316[3] = &unk_2655C32E8;
    memset(&v316[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v290, v293, (uint64_t)v316, v294);
    objc_msgSend_commit(v290, v295, v296, v297);
  }
  return isLowLight_greenGhostEnabled_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_gainMap;
}

- (id)_runInferenceProvider:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v6 = v4[2](v4);
  uint64_t v10 = v6;
  if (!v6 || objc_msgSend_status(v6, v7, v8, v9))
  {
    FigDebugAssert3();
    int v13 = 0;
  }
  else
  {
    float v11 = [BoundInferenceResults alloc];
    int v13 = objc_msgSend_initWithResult_andMetal_(v11, v12, (uint64_t)v10, (uint64_t)self->_metal);
    if (v13)
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

  return v13;
}

- (int)_ensureInputBandPyramidIsAllocatedForFrame:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = self->_inputBands->bands[a3];
  int v6 = v5;
  uint64_t levels = v5->levels;
  if ((int)levels >= 2)
  {
    p_uint64_t levels = &v5->levels;
    uint64_t v9 = levels - 1;
    while (FigMetalIsValid() && (FigMetalIsValid() & 1) != 0)
    {
      p_levels += 2;
      if (!--v9)
      {
        int isFP16_pyramid = 0;
        goto LABEL_10;
      }
    }
  }
  float v11 = (id *)(&self->super.isa + (int)v3);
  id v12 = v11[3];
  id v13 = v11[8];
  v6->uint64_t levels = 4;
  metal = self->_metal;
  id v15 = NSString;
  id v16 = v13;
  uint64_t v19 = objc_msgSend_stringWithFormat_(v15, v17, @"inputBands->bands[%d]", v18, v3);
  uint64_t v23 = objc_msgSend_width(v12, v20, v21, v22);
  uint64_t v27 = objc_msgSend_height(v12, v24, v25, v26);
  int isFP16_pyramid = objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_pyramid_(PyramidStorage_NRF, v28, (uint64_t)metal, (uint64_t)v19, v23, v27, 1, v6);

  if (isFP16_pyramid) {
    FigDebugAssert3();
  }
  else {
    objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v6, v29, (uint64_t)v12, (uint64_t)v16, 0, self->_metal);
  }

LABEL_10:
  return isFP16_pyramid;
}

- (int)_freeInputBandPyramidForFrame:(int)a3
{
  uint64_t v4 = self->_inputBands->bands[a3];
  if (v4->levels >= 1)
  {
    uint64_t v6 = a3;
    objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, a2, (uint64_t)v4, (uint64_t)self->_metal);
    self->_inputBands->bands[v6]->uint64_t levels = 0;
  }
  return 0;
}

- (int)doDeepFusionPyramidGeneration:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 syntheticReferenceFramesOnly:(BOOL)a5 pyramidHasBeenBuiltArray:(BOOL *)a6
{
  BOOL v154 = a5;
  id v169 = 0;
  id v170 = 0;
  BOOL v7 = (int *)MEMORY[0x263F00E10];
  if (!a3 || !a4) {
    goto LABEL_65;
  }
  uint64_t v10 = a3;
  int v11 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v11 = *v7;
  }
  if (v11)
  {
    id v12 = objc_msgSend_commandQueue(self->_metal, a2, (uint64_t)a3, (uint64_t)a4);
    id v16 = objc_msgSend_commandBuffer(v12, v13, v14, v15);

    objc_msgSend_setLabel_(v16, v17, @"KTRACE_START_MTL", v18);
    objc_msgSend_addCompletedHandler_(v16, v19, (uint64_t)&unk_270E33E88, v20);
    objc_msgSend_commit(v16, v21, v22, v23);
  }
  uint64_t v24 = objc_msgSend_allocator(self->_metal, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v28 = objc_msgSend_newTextureDescriptor(v24, v25, v26, v27);

  uint64_t v162 = v28;
  if (!v28)
  {
LABEL_65:
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
    uint64_t v162 = 0;
    goto LABEL_41;
  }
  uint64_t v32 = objc_msgSend_desc(v28, v29, v30, v31);
  objc_msgSend_setUsage_(v32, v33, 7, v34);

  int finalScaleFwd_low = LODWORD(v10[4].colorSpaceConversionParameters[1].finalScaleFwd);
  if (finalScaleFwd_low < 1)
  {
    int v152 = 0;
    goto LABEL_41;
  }
  uint64_t v39 = 0;
  float32x4_t v159 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
  float32x4_t v160 = *(float32x4_t *)MEMORY[0x263EF89A0];
  p_double height = (char *)&a4[1].meta.ROI.size.height;
  uint64_t v155 = v10;
  uint64_t v156 = &a4[1].meta.ltmCurves.ltmLut.bytes[179];
  float32x4_t v157 = (float32x4_t)vdupq_n_s32(0x358637BDu);
  float32x4_t v158 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
  p_nonLinearBias = (float32x4_t *)&v10->colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias;
  uint64_t v153 = (uint64_t)p_height;
  while (a6 && a6[v39]
       || v39 != LODWORD(v10[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale)
       && v154
       && v39 != *(_DWORD *)&v10[4].colorSpaceConversionParameters[1].outputToLinearYCbCr)
  {
LABEL_37:
    ++v39;
    p_height += 224224;
    p_nonLinearBias += 3;
    if (v39 >= finalScaleFwd_low)
    {
      int v152 = 0;
LABEL_39:
      BOOL v7 = (int *)MEMORY[0x263F00E10];
      goto LABEL_41;
    }
  }
  int IsAllocatedForFrame = objc_msgSend__ensureInputBandPyramidIsAllocatedForFrame_(self, v35, v39, v37);
  if (IsAllocatedForFrame)
  {
    int v152 = IsAllocatedForFrame;
    FigDebugAssert3();
    goto LABEL_39;
  }
  float32x4_t v163 = p_nonLinearBias[-1];
  float32x4_t v164 = *p_nonLinearBias;
  float32x4_t v165 = p_nonLinearBias[1];
  uint32x4_t v43 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v157, vabdq_f32(*p_nonLinearBias, v159)), (int8x16_t)vcgeq_f32(v157, vabdq_f32(v163, v160))), (int8x16_t)vcgeq_f32(v157, vabdq_f32(v165, v158)));
  v43.i32[3] = v43.i32[2];
  unsigned int v44 = vminvq_u32(v43);
  uint64_t v45 = (id *)(&self->super.isa + v39);
  id v46 = v45[3];
  id v47 = v45[8];
  id v48 = v45[13];
  uint64_t v166 = v48;
  uint64_t v167 = v46;
  if ((v44 & 0x80000000) != 0)
  {
    uint64_t v125 = v48;
    int v126 = objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_inputBands->bands[v39], v49, (uint64_t)v46, (uint64_t)v47, 0, self->_metal);
    if (v126)
    {
      int v152 = v126;
      uint64_t v161 = v47;
    }
    else
    {
      if (!*v156) {
        goto LABEL_27;
      }
      if (!v125)
      {
        uint64_t v161 = v47;
LABEL_57:
        FigDebugAssert3();
        int v152 = FigSignalErrorAt();
        goto LABEL_63;
      }
      int v129 = objc_msgSend_setYCbCrBand0Texture_(self->_inputBands->bands[v39], v127, (uint64_t)v125, v128);
      if (!v129)
      {
LABEL_27:
        BOOL v122 = 0;
        uint64_t v130 = self;
        goto LABEL_30;
      }
      int v152 = v129;
      uint64_t v161 = v47;
    }
    FigDebugAssert3();

LABEL_63:
    BOOL v7 = (int *)MEMORY[0x263F00E10];
    goto LABEL_64;
  }
  uint64_t v161 = v47;
  uint64_t v52 = objc_msgSend_width(v46, v49, v50, v51);
  uint64_t v56 = objc_msgSend_desc(v162, v53, v54, v55);
  objc_msgSend_setWidth_(v56, v57, v52, v58);

  uint64_t v62 = objc_msgSend_height(v46, v59, v60, v61);
  uint64_t v66 = objc_msgSend_desc(v162, v63, v64, v65);
  objc_msgSend_setHeight_(v66, v67, v62, v68);

  uint64_t v72 = objc_msgSend_desc(v162, v69, v70, v71);
  objc_msgSend_setPixelFormat_(v72, v73, 25, v74);

  objc_msgSend_setLabel_(v162, v75, 0, v76);
  uint64_t v80 = objc_msgSend_allocator(self->_metal, v77, v78, v79);
  uint64_t v83 = objc_msgSend_newTextureWithDescriptor_(v80, v81, (uint64_t)v162, v82);
  id v84 = v170;
  id v170 = v83;

  if (!v170) {
    goto LABEL_48;
  }
  uint64_t v88 = objc_msgSend_desc(v162, v85, v86, v87);
  unint64_t v92 = objc_msgSend_width(v88, v89, v90, v91);
  objc_msgSend_setWidth_(v88, v93, v92 >> 1, v94);

  uint64_t v98 = objc_msgSend_desc(v162, v95, v96, v97);
  unint64_t v102 = objc_msgSend_height(v98, v99, v100, v101);
  objc_msgSend_setHeight_(v98, v103, v102 >> 1, v104);

  uint64_t v108 = objc_msgSend_desc(v162, v105, v106, v107);
  objc_msgSend_setPixelFormat_(v108, v109, 65, v110);

  objc_msgSend_setLabel_(v162, v111, 0, v112);
  uint64_t v116 = objc_msgSend_allocator(self->_metal, v113, v114, v115);
  uint64_t v119 = objc_msgSend_newTextureWithDescriptor_(v116, v117, (uint64_t)v162, v118);
  id v120 = v169;
  id v169 = v119;

  if (!v169)
  {
LABEL_48:
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
    goto LABEL_62;
  }
  BOOL v122 = *v156 != 0;
  if (!*v156)
  {
    int v131 = objc_msgSend_runWarpUsingTransform_inputLumaTex_inputChromaTex_outputLumaTex_outputChromaTex_(self->_warpStage, v121, (uint64_t)v46, (uint64_t)v47, v170, *(double *)v163.i64, *(double *)v164.i64, *(double *)v165.i64);
    if (!v131) {
      goto LABEL_29;
    }
    int v152 = v131;
LABEL_61:
    FigDebugAssert3();
LABEL_62:

    goto LABEL_63;
  }
  if (!v166) {
    goto LABEL_57;
  }
  int v123 = objc_msgSend_runWarpUsingTransform_inputYCbCrTex_inputCscParams_outputLinearLumaTex_outputLinearChromaTex_(self->_warpStage, v121, (uint64_t)v166, v153, v170, *(double *)v163.i64, *(double *)v164.i64, *(double *)v165.i64);
  if (v123)
  {
    int v152 = v123;
    goto LABEL_61;
  }
LABEL_29:
  uint64_t v130 = self;
  int v132 = objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_inputBands->bands[v39], v124, (uint64_t)v170, (uint64_t)v169, 0, self->_metal);
  if (v132)
  {
    int v152 = v132;
    FigDebugAssert3();

LABEL_51:
    BOOL v7 = (int *)MEMORY[0x263F00E10];
    self = v130;
    goto LABEL_64;
  }
LABEL_30:
  if (objc_msgSend_pyramidDownscale_cscParams_band0IsLinearYCbCr_(v130->_syntheticLongStage, v127, (uint64_t)v130->_inputBands->bands[v39], (uint64_t)p_height, v122))
  {
    uint64_t v161 = v47;
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();

    goto LABEL_53;
  }
  if ((v44 & 0x80000000) != 0) {
    goto LABEL_34;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  int v134 = objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v130->_inputBands->bands[v39], v133, (uint64_t)v167, (uint64_t)v47, 0, v130->_metal);
  if (v134)
  {
    int v152 = v134;
    uint64_t v161 = v47;
    FigDebugAssert3();

    goto LABEL_51;
  }
  int v137 = objc_msgSend_setYCbCrBand0Texture_(v130->_inputBands->bands[v39], v135, (uint64_t)v166, v136);
  if (!v137)
  {
LABEL_34:
    self = v130;
    if (a6) {
      a6[v39] = 1;
    }

    uint64_t v10 = v155;
    int finalScaleFwd_low = LODWORD(v155[4].colorSpaceConversionParameters[1].finalScaleFwd);
    goto LABEL_37;
  }
  int v152 = v137;
  uint64_t v161 = v47;
  FigDebugAssert3();

LABEL_53:
  BOOL v7 = (int *)MEMORY[0x263F00E10];
  self = v130;
LABEL_64:

LABEL_41:
  int v138 = *v7;
  if (*v7 == 1)
  {
    kdebug_trace();
    int v138 = *v7;
  }
  if (v138)
  {
    uint64_t v139 = objc_msgSend_commandQueue(self->_metal, v35, v36, v37);
    uint64_t v143 = objc_msgSend_commandBuffer(v139, v140, v141, v142);

    objc_msgSend_setLabel_(v143, v144, @"KTRACE_END_MTL", v145);
    v168[0] = MEMORY[0x263EF8330];
    v168[1] = 3221225472;
    v168[2] = sub_262F77C48;
    v168[3] = &unk_2655C32E8;
    v168[5] = 0;
    v168[6] = 0;
    v168[4] = -1;
    objc_msgSend_addCompletedHandler_(v143, v146, (uint64_t)v168, v147);
    objc_msgSend_commit(v143, v148, v149, v150);
  }
  return v152;
}

- (int)doGainMap:(const FusionConfiguration *)a3 properties:(const frameProperties_t *)a4 output:(id)a5 outputHeadroom:(float *)a6 nrfPlist:(id)a7 useFusedFrame:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a5;
  id v15 = a7;
  uint64_t v19 = v15;
  if (!v15) {
    goto LABEL_46;
  }
  uint64_t v20 = *((void *)v15 + 11);
  if (!v20 || !a3 || !a4 || !v14) {
    goto LABEL_46;
  }
  float v21 = *(float *)(v20 + 8);
  float v22 = *(float *)(v20 + 12);
  float v23 = fabsf(v22);
  BOOL v24 = fabsf(v21) > 1.0 || v22 <= v21;
  if (v24 || v23 > 1.0) {
    goto LABEL_46;
  }
  unsigned int v61 = objc_msgSend_width(v14, v16, v17, v18);
  unsigned int v29 = objc_msgSend_height(v14, v26, v27, v28);
  unsigned int v33 = v29;
  if (v8)
  {
    uint64_t v34 = self->_fusedBand->textureY[1];
    float linearScale = a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale;
    goto LABEL_31;
  }
  float linearScale = *(float *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr;
  if (linearScale == NAN)
  {
    float linearScale = a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale;
    BOOL v36 = LODWORD(linearScale) != -1;
    if ((LODWORD(linearScale) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_46:
    FigDebugAssert3();
    uint64_t v34 = 0;
LABEL_48:
    int IsLinear_inputScaling = -12780;
    goto LABEL_41;
  }
  BOOL v36 = 0;
  if ((LODWORD(linearScale) & 0x80000000) != 0) {
    goto LABEL_46;
  }
LABEL_17:
  unsigned int v60 = v29;
  uint64_t v37 = self->_inputBands->bands[LODWORD(linearScale)];
  int levels = v37->levels;
  if (levels < 2)
  {
    uint64_t v34 = 0;
    goto LABEL_30;
  }
  BOOL v57 = v36;
  uint64_t v59 = v19;
  uint64_t v34 = 0;
  float v58 = linearScale;
  uint64_t v39 = LODWORD(linearScale);
  while (1)
  {
    uint64_t v40 = v34;
    uint64_t v34 = v37->textureY[levels - 1];

    if (v61 <= (unint64_t)objc_msgSend_width(v34, v41, v42, v43)) {
      break;
    }
    if (levels < 3) {
      goto LABEL_29;
    }
LABEL_27:
    uint64_t v37 = self->_inputBands->bands[v39];
    --levels;
  }
  if (v60 > (unint64_t)objc_msgSend_height(v34, v30, v31, v32) && levels > 2) {
    goto LABEL_27;
  }
LABEL_29:
  uint64_t v19 = v59;
  float linearScale = v58;
  BOOL v36 = v57;
LABEL_30:
  float v45 = 1.0;
  unsigned int v33 = v60;
  if (v36)
  {
LABEL_31:
    float v45 = 1.0;
    if (*(_DWORD *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr == -1) {
      float v45 = *(&a4->meta.exposureParams.ltm_soft_gain + 56056 * SLODWORD(linearScale)) * 0.25;
    }
  }
  if (!v34
    || (float v46 = linearScale, objc_msgSend_width(v34, v30, v31, v32) < (unint64_t)v61)
    || objc_msgSend_height(v34, v47, v48, v49) < (unint64_t)v33)
  {
    FigDebugAssert3();
    goto LABEL_48;
  }
  if (v8) {
    BOOL v54 = *(_DWORD *)&a3[4].colorSpaceConversionParameters[1].outputToLinearYCbCr == -1;
  }
  else {
    BOOL v54 = a4[1].meta.ltmCurves.ltmLut.bytes[224224 * SLODWORD(v46) + 176] != 0;
  }
  *(float *)&double v51 = v21;
  *(float *)&double v52 = v22;
  *(float *)&double v53 = v45;
  int IsLinear_inputScaling = objc_msgSend_runWithInput_output_minThreshold_maxThreshold_inputIsLinear_inputScaling_(self->_gainMapStage, v50, (uint64_t)v34, (uint64_t)v14, v54, v51, v52, v53);
  if (a6) {
    *a6 = v45 * 4.0;
  }
LABEL_41:

  return IsLinear_inputScaling;
}

- (int)extractLinearBufferWithConfig:(const FusionConfiguration *)a3 referenceFrameProperties:(const frameProperties_t *)a4 output:(__CVBuffer *)a5
{
  return objc_msgSend_extractLinearBufferWithLumaInput_chromaInput_inputIsLinear_removeChromaBias_lumaPedestal_exposureParams_ccm_output_(self, a2, (uint64_t)self->_fusionBuffers->fusedLumaTex, (uint64_t)self->_fusionBuffers->fusedChromaTex, a4[1].meta.ltmCurves.ltmLut.bytes[176], LOBYTE(a3[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias), &a4->meta.exposureParams, a5, 0.0, *(double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid, *(double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows, *(double *)&a4[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights);
}

- (uint64_t)extractLinearBufferWithLumaInput:(uint64_t)a3 chromaInput:(uint64_t)a4 inputIsLinear:removeChromaBias:lumaPedestal:exposureParams:ccm:output:
{
  return objc_msgSend_extractLinearBufferWithLumaInput_chromaInput_inputIsLinear_removeChromaBias_lumaPedestal_exposureParams_ccm_output_(*(void **)(a1 + 192), a2, a3, a4);
}

- (void)resetFusion:(unsigned int)a3
{
  if (a3 != 1)
  {
    if (a3 != 2) {
      return;
    }
    objc_msgSend_releaseResources(self->_motionDetection, a2, *(uint64_t *)&a3, v3);
  }
  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, a2, (uint64_t)self->_fusedBand, (uint64_t)self->_metal);
  objc_msgSend_makePyramidAliasable_metal_releaseBand0_(PyramidStorage_NRF, v5, (uint64_t)self->_accWeightPyramid, (uint64_t)self->_metal, 1);
  accWeightPyramid = self->_accWeightPyramid;
  self->_accWeightPyramid = 0;
}

- (int)blinkDetectionOnFrameIdx:(int)a3 imgMeta:(const frameMetadata *)a4 plist:(id)a5 resultScore:(float *)a6 frameIdx:(int)a7
{
  textureY = self->_inputBands->bands[a3]->textureY;
  return objc_msgSend_runOnLumaBand1_lumaBand2_lumaBand3_withFaces_facesCount_plist_resultScore_frameIdx_(self->_blinkDetectionStage, a2, (uint64_t)self->_inputBands->bands[a3]->textureY[1], (uint64_t)textureY[2], textureY[3], &a4->faces[1].rect.size, HIDWORD(a4->faces[1].rect.origin.y), a5, a6, a7);
}

- (unsigned)getSRLStatus
{
  return objc_msgSend_getSRLStatus(self->_toneMappingStage, a2, v2, v3);
}

- (int)greenGhostMitigationWithRefIndex:(int)a3 bracketIndex:(int)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 tuningParams:(id)a7
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v13 = a7;
  if (*MEMORY[0x263F00E10])
  {
    id v14 = objc_msgSend_commandQueue(self->_metal, v10, v11, v12);
    uint64_t v18 = objc_msgSend_commandBuffer(v14, v15, v16, v17);

    objc_msgSend_setLabel_(v18, v19, @"KTRACE_START_MTL", v20);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = sub_262F7883C;
    v64[3] = &unk_2655C3308;
    int v65 = a3;
    int v66 = a4;
    objc_msgSend_addCompletedHandler_(v18, v21, (uint64_t)v64, v22);
    objc_msgSend_commit(v18, v23, v24, v25);
  }
  uint64_t v26 = a3;
  uint64_t v27 = self->_inputBands->bands[a3];
  fusionRemixStage = self->_fusionRemixStage;
  fusionBuffers = self->_fusionBuffers;
  uint64_t v33 = objc_msgSend_width(v27->textureY[0], v30, v31, v32);
  uint64_t v37 = objc_msgSend_height(v27->textureY[0], v34, v35, v36);
  objc_msgSend_allocateFusionBuffersIfNeeded_width_height_(fusionRemixStage, v38, (uint64_t)fusionBuffers, v33, v37);
  objc_storeStrong((id *)&self->_greenGhostBuffers->_fusedLuma, self->_fusionBuffers->fusedLumaTex);
  objc_storeStrong((id *)&self->_greenGhostBuffers->_fusedChroma, self->_fusionBuffers->fusedChromaTex);
  if (dword_26B429788)
  {
    int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int isRefProcessing_refProperties_otherProperties_greenGhostBuffers_tuningParams = objc_msgSend_mitigationWithRefPyramid_otherPyramid_isRefProcessing_refProperties_otherProperties_greenGhostBuffers_tuningParams_(self->_greenGhostLowLightStage, v39, (uint64_t)self->_inputBands->bands[a3], (uint64_t)self->_inputBands->bands[a4], a3 == a4, a5, a6, self->_greenGhostBuffers, v13);
  objc_storeStrong((id *)&self->_fusionBuffers->ggMaxFusionWeights, self->_greenGhostBuffers->_ggMaxFusionWeights);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v45 = a4;
    float v46 = objc_msgSend_commandQueue(self->_metal, v42, v43, v44);
    uint64_t v50 = objc_msgSend_commandBuffer(v46, v47, v48, v49);

    objc_msgSend_setLabel_(v50, v51, @"KTRACE_END_MTL", v52);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_262F788DC;
    v61[3] = &unk_2655C32E8;
    v61[4] = v26;
    v61[5] = v45;
    v61[6] = 0;
    objc_msgSend_addCompletedHandler_(v50, v53, (uint64_t)v61, v54);
    objc_msgSend_commit(v50, v55, v56, v57);
  }
  return isRefProcessing_refProperties_otherProperties_greenGhostBuffers_tuningParams;
}

- (id)getSTFLTM_asNSData
{
  return (id)objc_msgSend_getSTFLTM_asNSData(self->_toneMappingStage, a2, v2, v3);
}

- (int)getSTFStillCorrectionStrength:(BOOL)a3
{
  return objc_msgSend_getSTFStillCorrectionStrength_(self->_toneMappingStage, a2, a3, v3);
}

- (BOOL)getSTFStillApplied
{
  return objc_msgSend_stfStillApplied(self->_toneMappingStage, a2, v2, v3);
}

- (unsigned)getSTFStillAnalyticsVersion
{
  return objc_msgSend_stfStillAnalyticsVersion(self->_toneMappingStage, a2, v2, v3);
}

- (int)freeInputBandPyramids
{
  if (self->_currentFrame < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    int v5 = objc_msgSend__freeInputBandPyramidForFrame_(self, a2, v4, v2);
    if (v5) {
      break;
    }
    uint64_t v4 = (v4 + 1);
    if ((int)v4 >= self->_currentFrame) {
      return 0;
    }
  }
  int v6 = v5;
  FigDebugAssert3();
  return v6;
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
  objc_storeStrong((id *)&self->_fusionBuffers, 0);
  objc_storeStrong((id *)&self->_greenGhostBuffers, 0);
  objc_storeStrong((id *)&self->_greenGhostLowLightStage, 0);
  objc_storeStrong((id *)&self->_grayGhostDetection, 0);
  objc_storeStrong((id *)&self->_motionDetection, 0);
  objc_storeStrong((id *)&self->_accWeightPyramid, 0);
  objc_storeStrong((id *)&self->_ColorCubeCorrectionStage, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_bilateralGrid, 0);
  objc_storeStrong((id *)&self->_syntheticLongStage, 0);
  objc_storeStrong((id *)&self->_syntheticReferenceStage, 0);
  objc_storeStrong((id *)&self->_toneMappingCurvesSkinMapInput, 0);
  objc_storeStrong((id *)&self->_toneMappingCurvesUBFusion, 0);
  objc_storeStrong((id *)&self->_toneMappingStage, 0);
  objc_storeStrong((id *)&self->_fusedBand, 0);
  objc_storeStrong((id *)&self->_inputBands, 0);
  objc_storeStrong((id *)&self->_blinkDetectionStage, 0);
  objc_storeStrong((id *)&self->_outliersRemovalStage, 0);
  objc_storeStrong((id *)&self->_fusionRemixStage, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_ambnrBuffers, 0);
  objc_storeStrong((id *)&self->_ambnrStages, 0);
  objc_storeStrong((id *)&self->_styleStage, 0);
  objc_storeStrong((id *)&self->_gainMapStage, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionStage, 0);
  objc_storeStrong((id *)&self->_colorConvertStage, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_pyramidStage, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
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