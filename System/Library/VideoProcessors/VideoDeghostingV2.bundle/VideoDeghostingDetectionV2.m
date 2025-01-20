@interface VideoDeghostingDetectionV2
- ($49C9A23661AC5E3031C2E8EF93B1D168)params;
- ($E04785D6C22F149E9B1B648872290F90)configuration;
- (BOOL)_mergeBboxesWithTrackingForMitigation:(id)a3 prevFrameGhostList:(id)a4;
- (BOOL)_shouldRunGGDetectionClippedPixelBased:(float)a3;
- (BOOL)_shouldRunGGDetectionLSBased:(int)a3;
- (BOOL)_shouldRunGGDetectionLuxLevelBased:(int)a3;
- (BOOL)estOpticalCenterIsAvailable;
- (BOOL)prevShouldRunGGDetectionClippedPixelBased;
- (BOOL)prevShouldRunGGDetectionLSBased;
- (BOOL)prevShouldRunGGDetectionLuxLevelBased;
- (NSMutableArray)GGROIs;
- (NSMutableArray)LSROIs;
- (NSMutableArray)prevFrameMergedGhosts;
- (NSMutableArray)rawDesGenKeyPoints;
- (NSMutableArray)rawLSList;
- (NSMutableArray)reflectedLSROIs;
- (ROI)matchPrevLS:(double)a3 prevToCurrentHomography:(double)a4 againstCurrentLSList:(float)a5 avoidList:(uint64_t)a6 searchRadius:(void *)a7;
- (VideoDeghostingDetectionV2)initWithMetalToolBox:(id)a3 config:(id *)a4 tuningParamDict:(id)a5 imageDimensions:(id)a6;
- (double)estOpticalCenter;
- (double)estOpticalCenterOffset;
- (double)prevDefaultOpticalCenter;
- (id)_ghostCandidateGenerationViaKeypointBuffer:(__CVBuffer *)a3 opticalCenterFromMetaData:(_simParamsStruct *)a4 mappingInfo:(id *)a5 GGList:(id *)a6 LSList:(int)a7 kpCntHardGatingTh:(int)a8 kpCntSoftGatingTh:;
- (id)deepCopyROIList:(id)a3 copyReferencedROI:(BOOL)a4;
- (id)extractLightSourceBBoxFromBuffer:(VideoDeghostingDetectionV2 *)self BoxCount:(SEL)a2;
- (id)predictPastROIsInCurrentFrame:(id)a3 currentGGList:(id)a4;
- (id)predictPastReflectedLSInCurrentFrame:(id)a3 currentFrameLSList:(id)a4;
- (id)process:(__CVBuffer *)a3 metaData:(id)a4 ispTimeStamp:(id *)a5 keypoints:(__CVBuffer *)a6 lightSourceMask:(__CVBuffer *)a7 futureFrames:(id *)a8;
- (id)temporalDetectionPixelFeatureMatchROI:(id)a3 againstROIList:(id)a4 ggList:(id)a5 avoidList:(id)a6 searchRadius:(float)a7 colorContrastDiffThreshold:(float)a8 lumaDiffThreshold:(float)a9 localMotionDiffThreshold:(float)a10 costThreshold:(float)a11 bestCostTolerance:(float)a12;
- (int)LSTrackID;
- (int)estOpticalCenterConsecutiveValidFrameCnt;
- (int)trackID;
- (int)trackIDAfterMerge;
- (int64_t)_allocateMetalBuffers;
- (int64_t)_detectionInit:(__CVBuffer *)a3 metaData:(id)a4 futureFrames:(id *)a5;
- (unint64_t)LSMaskLSCnt;
- (unint64_t)prevFrameAllLSCnt;
- (unint64_t)prevFrameMatchedLSCnt;
- (unsigned)runningAverageLSNumberCount;
- (unsigned)runningAverageLSNumberCumSum;
- (void)_allocateLightSourceBuffers:(int64_t)a3;
- (void)_findGhostsAndGenerateDescriptors:(VideoDeghostingDetectionV2 *)self LSList:(SEL)a2 LSDilation:(id *)a3 LSReflectCenter:(id)a4 desGenKeypointBuf:(float)a5 desGenMappingInfo:(__CVBuffer *)a6;
- (void)_ghostDetectionWithInputPixelBuffer:(__CVBuffer *)a3 reflectedLSMaskOri:(__CVBuffer *)a4 lowLight:(BOOL)a5 opticalCenterFromMetaData:(__CVBuffer *)a6 simKeyPoint:(__CVBuffer *)a7 simLightSourceMask:(id)a8 metaData:(id *)a9 futureFrames:;
- (void)_initParamsWithTuningParamsDict:(id)a3 isLowLight:(BOOL)a4;
- (void)_pruneUsingMatchedLSInfo:(id *)a3 dilation:(int)a4;
- (void)_resetDetectionResults;
- (void)_resetIntermediateVariables;
- (void)_setLightSourceMotionForKeypoints:(id *)a3;
- (void)_temporalDetectionCurrentGGList:(id *)a3 rawKeyPointList:(id *)a4 LSList:(id)a5;
- (void)_trackCurrentLSList:(id *)a3;
- (void)_trackGhosts:(id *)a3 ghostCandidates:(id *)a4 LSList:(id)a5;
- (void)_trackLightSources:(id *)a3;
- (void)_updateEstOpticalCenterUsingPrevDetectedGhosts:(id)a3 currentDefaultOpticalCenter:;
- (void)dealloc;
- (void)getDilationCoefsAndReflectedDilatedLsList:(id)a3;
- (void)pruneUsingLSRisk:(id)a3;
- (void)reset;
- (void)setConfiguration:(id *)a3;
- (void)setEstOpticalCenter:(VideoDeghostingDetectionV2 *)self;
- (void)setEstOpticalCenterConsecutiveValidFrameCnt:(int)a3;
- (void)setEstOpticalCenterIsAvailable:(BOOL)a3;
- (void)setEstOpticalCenterOffset:(VideoDeghostingDetectionV2 *)self;
- (void)setGGROIs:(id)a3;
- (void)setLSMaskLSCnt:(unint64_t)a3;
- (void)setLSROIs:(id)a3;
- (void)setLSTrackID:(int)a3;
- (void)setParams:(id *)a3;
- (void)setPrevDefaultOpticalCenter:(VideoDeghostingDetectionV2 *)self;
- (void)setPrevFrameAllLSCnt:(unint64_t)a3;
- (void)setPrevFrameMatchedLSCnt:(unint64_t)a3;
- (void)setPrevFrameMergedGhosts:(id)a3;
- (void)setPrevShouldRunGGDetectionClippedPixelBased:(BOOL)a3;
- (void)setPrevShouldRunGGDetectionLSBased:(BOOL)a3;
- (void)setPrevShouldRunGGDetectionLuxLevelBased:(BOOL)a3;
- (void)setRawDesGenKeyPoints:(id)a3;
- (void)setRawLSList:(id)a3;
- (void)setReflectedLSROIs:(id)a3;
- (void)setRunningAverageLSNumberCount:(unsigned int)a3;
- (void)setRunningAverageLSNumberCumSum:(unsigned int)a3;
- (void)setTrackID:(int)a3;
- (void)setTrackIDAfterMerge:(int)a3;
- (void)temporalDetectionCoreCurrentGGList:(id *)a3 ghostCandidates:(id *)a4 LSList:(id)a5;
@end

@implementation VideoDeghostingDetectionV2

- (VideoDeghostingDetectionV2)initWithMetalToolBox:(id)a3 config:(id *)a4 tuningParamDict:(id)a5 imageDimensions:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)VideoDeghostingDetectionV2;
  v12 = [(VideoDeghostingDetectionV2 *)&v42 init];
  if (v12)
  {
    id v13 = v10 ? v10 : objc_alloc_init(GGMMetalToolBox);
    v14 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v13;

    long long v15 = *(_OWORD *)&a4->var0.var0;
    long long v16 = *(_OWORD *)&a4->var0.var7;
    long long v17 = *(_OWORD *)&a4->var1.var0;
    *((_OWORD *)v12 + 159) = *(_OWORD *)&a4->var1.var4;
    *((_OWORD *)v12 + 158) = v17;
    *((_OWORD *)v12 + 157) = v16;
    *((_OWORD *)v12 + 156) = v15;
    v18 = [[CalcHomography alloc] initWithMetalToolBox:*((void *)v12 + 2)];
    v19 = (void *)*((void *)v12 + 4);
    *((void *)v12 + 4) = v18;

    [v12 _initParamsWithTuningParamsDict:v11 isLowLight:a4->var1.var0 == 1];
    *(($2825F4736939C4A6D3AD43837233062D *)v12 + 64) = a6;
    *(void *)(v12 + 2388) = 0x100000001;
    v12[2368] = 0;
    *((void *)v12 + 301) = 0;
    *(_OWORD *)(v12 + 2372) = xmmword_2D500;
    v20 = [[MaskToRoi alloc] initWithMetalToolBox:*((void *)v12 + 2)];
    v21 = (void *)*((void *)v12 + 5);
    *((void *)v12 + 5) = v20;

    v22 = [[VDGDetectionUtilsV2 alloc] initWithMetalToolBox:*((void *)v12 + 2) configuration:a4 tuningParams:v12 + 2560];
    v23 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v22;

    uint64_t v24 = +[NSMutableArray array];
    v25 = (void *)*((void *)v12 + 58);
    *((void *)v12 + 58) = v24;

    [v12 _resetIntermediateVariables];
    [v12 _allocateLightSourceBuffers:256];
    v26 = malloc_type_malloc(0x4000uLL, 0x1000040451B5BE8uLL);
    *((void *)v12 + 272) = v26;
    if (v26)
    {
      v27 = [[RepairWeightsGenerator alloc] initWithConfiguration:a4 withToolBox:*((void *)v12 + 2) homographyHandle:*((void *)v12 + 4) imageDimensions:a6];
      v28 = (void *)*((void *)v12 + 295);
      *((void *)v12 + 295) = v27;

      int v29 = *((_DWORD *)v12 + 642);
      if (v29 >= 1024) {
        int v29 = 1024;
      }
      if (v29 <= 25) {
        int v29 = 25;
      }
      if (*((int *)v12 + 643) >= 1024) {
        int v30 = 1024;
      }
      else {
        int v30 = *((_DWORD *)v12 + 643);
      }
      if (v30 <= 25) {
        int v30 = 25;
      }
      int v31 = v30 + v29;
      *((_DWORD *)v12 + 548) = v31;
      *((_DWORD *)v12 + 547) = 36 * v31;
      *((_DWORD *)v12 + 546) = 73 * v31 + 10240;
      if ([v12 _allocateMetalBuffers]) {
        goto LABEL_24;
      }
      *(_WORD *)(v12 + 2369) = 257;
      v12[2371] = 1;
      uint64_t v32 = 520;
      while (1)
      {
        uint64_t v33 = +[NSMutableData dataWithLength:9544];
        v34 = *(void **)&v12[v32 + 800];
        *(void *)&v12[v32 + 800] = v33;

        if (!*(void *)&v12[v32 + 800]) {
          break;
        }
        v35 = [*((id *)v12 + 2) getDevice];
        id v36 = objc_msgSend(v35, "newBufferWithBytesNoCopy:length:options:deallocator:", objc_msgSend(*(id *)&v12[v32 + 800], "mutableBytes"), 9544, 0, 0);
        v37 = *(void **)&v12[v32];
        *(void *)&v12[v32] = v36;

        if (!*(void *)&v12[v32]) {
          break;
        }
        v32 += 8;
        if (v32 == 1320)
        {
          *((void *)v12 + 265) = 0;
          uint64_t v38 = *((int *)v12 + 654) + (uint64_t)*((int *)v12 + 652);
          *((void *)v12 + 294) = v38;
          v39 = malloc_type_malloc(4 * v38 * v38, 0x80887F96uLL);
          *((void *)v12 + 293) = v39;
          if (!v39) {
            break;
          }
          v40 = v12;
          goto LABEL_22;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_24:
  v40 = 0;
LABEL_22:

  return v40;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_frameT);
  CVPixelBufferRelease(self->_frameTMinus1);
  CVPixelBufferRelease(self->_frameTMinus2);
  free(*(void **)&self->_arrayOfLightSourceBBox[4]);
  free(*(void **)&self->_reflectedDilatedLsForTracking[4]);
  free(*(void **)&self->_reflectedDilatedLs[4]);
  free(*(void **)&self->_tinyKeypointLocationCountMax);
  free(self->_repairWeightsGenerator);
  v3.receiver = self;
  v3.super_class = (Class)VideoDeghostingDetectionV2;
  [(VideoDeghostingDetectionV2 *)&v3 dealloc];
}

- (void)reset
{
  unint64_t v3 = +[NSMutableArray array];
  prevFrameMatchedLSCnt = (void *)self->_prevFrameMatchedLSCnt;
  self->_prevFrameMatchedLSCnt = v3;

  self->_LSROIs = 0;
  *(_OWORD *)&self->_LSMaskLSCnt = 0u;
  v5 = +[NSMutableArray array];
  reflectedLSROIs = self->_reflectedLSROIs;
  self->_reflectedLSROIs = v5;

  v7 = +[NSMutableArray array];
  rawDesGenKeyPoints = self->_rawDesGenKeyPoints;
  self->_rawDesGenKeyPoints = v7;

  v9 = +[NSMutableArray array];
  rawLSList = self->_rawLSList;
  self->_rawLSList = v9;

  uint64_t v11 = +[NSMutableArray array];
  v12 = *(void **)&self->_configuration.internalCfg.clipThreshold;
  *(void *)&self->_configuration.internalCfg.clipThreshold = v11;

  uint64_t v13 = +[NSMutableArray array];
  v14 = *(void **)&self->_configuration.internalCfg.antiFlareSize;
  *(void *)&self->_configuration.internalCfg.antiFlareSize = v13;

  long long v15 = +[NSMutableArray array];
  prevLSLists = self->_prevLSLists;
  self->_prevLSLists = v15;

  self->_isPrevLSFeaturesAvailable = 0;
  *(void *)&self->_optiCenterOffsetPrev[6] = 0;
  *(void *)&self->_optiCenterOffsetPrevPrev[6] = 0;
  LODWORD(self->_estimatedOpticalCenter.x) = 0;
  frameTMinus1Texture = self->_frameTMinus1Texture;
  self->_frameTMinus1Texture = 0;

  frameTMinus2Texture = self->_frameTMinus2Texture;
  self->_frameTMinus2Texture = 0;

  frameTPlus1Texture = self->_frameTPlus1Texture;
  self->_frameTPlus1Texture = 0;

  imageDimensions = (void *)self->_imageDimensions;
  self->_imageDimensions = 0;

  localMotionReferenceTexture = self->_localMotionReferenceTexture;
  self->_localMotionReferenceTexture = 0;

  *(void *)&self->_lsDilation = 0;
  *(_DWORD *)&self->_reflectedDilatedLsForPreprocessing[4] = 0;
  frameT = self->_frameT;
  if (frameT)
  {
    CFRelease(frameT);
    self->_frameT = 0;
  }
  frameTMinus1 = self->_frameTMinus1;
  if (frameTMinus1)
  {
    CFRelease(frameTMinus1);
    self->_frameTMinus1 = 0;
  }
  frameTMinus2 = self->_frameTMinus2;
  if (frameTMinus2)
  {
    CFRelease(frameTMinus2);
    self->_frameTMinus2 = 0;
  }
  [*(id *)&self->_runningAverageLSNumberCount reset];

  [(VideoDeghostingDetectionV2 *)self _resetIntermediateVariables];
}

- (void)_resetIntermediateVariables
{
  *(void *)self->_estOpticalCenterOffset = 0x100000001;
  *(_OWORD *)&self->_trackIDAfterMerge = xmmword_2D500;
  *(void *)&self->_prevDefaultOpticalCenter[4] = 0;
  self->_prevFrameAllLSCnt = 0;
  self->_prevFrameMergedGhosts = 0;
  self->_trackID = 16843008;
  simd_float3 v3 = matrix_identity_float3x3.columns[0];
  simd_float3 v4 = matrix_identity_float3x3.columns[1];
  *(simd_float3 *)&self->_hmgrphyTMinus1ToT.confidence = matrix_identity_float3x3.columns[0];
  *(simd_float3 *)&self->_anon_64[12] = v4;
  simd_float3 v5 = matrix_identity_float3x3.columns[2];
  *(simd_float3 *)&self->_anon_64[28] = v5;
  *(void *)&self->_anon_64[44] = 0;
  *(void *)&self->_anon_64[52] = 0;
  *(simd_float3 *)&self->_anon_a4[12] = v4;
  *(simd_float3 *)&self->_anon_a4[28] = v5;
  *(simd_float3 *)&self->_hmgrphyTMinus2ToTMinus1.confidence = v3;
  *(void *)&self->_anon_a4[44] = 0;
  *(void *)&self->_anon_a4[52] = 0;
  *(simd_float3 *)&self->_hmgrphyTMinus2ToT.confidence = v3;
  *(simd_float3 *)&self->_anon_e4[12] = v4;
  *(simd_float3 *)&self->_anon_e4[28] = v5;
  *(void *)&self->_anon_e4[44] = 0;
  *(void *)&self->_anon_e4[52] = 0;
  *(simd_float3 *)&self->_localMotionRefHomography.confidence = v3;
  *(simd_float3 *)&self->_anon_124[12] = v4;
  *(simd_float3 *)&self->_anon_124[28] = v5;
  *(void *)&self->_anon_124[44] = 0;
  *(void *)&self->_anon_124[52] = 0;
  self->_inputTexture = +[NSMutableArray array];

  _objc_release_x1();
}

- (void)_resetDetectionResults
{
  simd_float3 v3 = +[NSMutableArray array];
  reflectedLSROIs = self->_reflectedLSROIs;
  self->_reflectedLSROIs = v3;

  simd_float3 v5 = +[NSMutableArray array];
  rawDesGenKeyPoints = self->_rawDesGenKeyPoints;
  self->_rawDesGenKeyPoints = v5;

  v7 = +[NSMutableArray array];
  rawLSList = self->_rawLSList;
  self->_rawLSList = v7;

  uint64_t v9 = +[NSMutableArray array];
  id v10 = *(void **)&self->_configuration.internalCfg.antiFlareSize;
  *(void *)&self->_configuration.internalCfg.antiFlareSize = v9;

  *(void *)&self->_configuration.internalCfg.clipThreshold = +[NSMutableArray array];

  _objc_release_x1();
}

- (void)_initParamsWithTuningParamsDict:(id)a3 isLowLight:(BOOL)a4
{
  BOOL v4 = a4;
  p_colorContrastDiffThreshold = &self->_params.tempDetect.colorContrastDiffThreshold;
  id v37 = a3;
  v7 = [v37 objectForKeyedSubscript:@"DetectionAndTracking"];
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = [v37 objectForKeyedSubscript:@"DetectionAndTracking"];
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v37 objectForKeyedSubscript:@"LuxLevelThresholdON"];
  if (!v10) {
    goto LABEL_18;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [v7 objectForKeyedSubscript:@"LSGatingThresholdON"];
  if (!v12)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = [v7 objectForKeyedSubscript:@"LSGatingThresholdOFF"];
  if (!v14)
  {
LABEL_16:

    goto LABEL_17;
  }
  long long v15 = (void *)v14;
  uint64_t v16 = [v7 objectForKeyedSubscript:@"LSBboxSizeThreshold"];
  if (!v16)
  {
LABEL_15:

    goto LABEL_16;
  }
  long long v17 = (void *)v16;
  uint64_t v18 = [v7 objectForKeyedSubscript:@"b4MergeGhostCntSoftGatingTh"];
  if (!v18)
  {
LABEL_14:

    goto LABEL_15;
  }
  v19 = (void *)v18;
  uint64_t v20 = [v7 objectForKeyedSubscript:@"b4MergeGhostCntHardGatingTh"];
  if (!v20)
  {
LABEL_13:

    goto LABEL_14;
  }
  id v36 = (void *)v20;
  uint64_t v21 = [v7 objectForKeyedSubscript:@"kpCntSoftGatingTh"];
  if (!v21)
  {

    goto LABEL_13;
  }
  v34 = (void *)v21;
  v35 = [v7 objectForKeyedSubscript:@"kpCntHardGatingTh"];

  if (v35)
  {
    v22 = [v37 objectForKeyedSubscript:@"LuxLevelThresholdON"];
    LODWORD(self->_params.searchRangeBaseForPreprocessing) = [v22 intValue];

    v23 = [v37 objectForKeyedSubscript:@"LuxLevelThresholdOFF"];
    self->_params.maxAllowedSizeBBox = [v23 intValue];

    uint64_t v24 = [v7 objectForKeyedSubscript:@"LSGatingThresholdON"];
    self->_params.luxLevelGatingThresholdON = [v24 intValue];

    v25 = [v7 objectForKeyedSubscript:@"LSGatingThresholdOFF"];
    self->_params.luxLevelGatingThresholdOFF = [v25 intValue];

    v26 = [v7 objectForKeyedSubscript:@"LSBboxSizeThreshold"];
    *(float *)&self->_params.maxAllowedOpticalCenterOffset = (float)(int)[v26 intValue];

    v27 = [v7 objectForKeyedSubscript:@"LSSelectionCntLimitNew"];
    LODWORD(self->_params.lightSourceBoxSizeThreshold) = [v27 intValue];

    v28 = [v7 objectForKeyedSubscript:@"LSSelectionCntLimitAll"];
    LODWORD(self->_params.searchRangeBase) = [v28 intValue];

    int v29 = [v7 objectForKeyedSubscript:@"b4MergeGhostCntSoftGatingTh"];
    LODWORD(self->_params.colorScore.hueLowerRange) = [v29 intValue];

    int v30 = [v7 objectForKeyedSubscript:@"b4MergeGhostCntHardGatingTh"];
    LODWORD(self->_params.colorScore.hueUpperRange) = [v30 intValue];

    int v31 = [v7 objectForKeyedSubscript:@"kpCntSoftGatingTh"];
    LODWORD(self->_params.colorScore.hueThreshold) = [v31 intValue];

    uint64_t v32 = [v7 objectForKeyedSubscript:@"kpCntHardGatingTh"];
    LODWORD(self->_params.colorScore.saturationLowerThreshold) = [v32 intValue];

    goto LABEL_20;
  }
LABEL_19:
  *(void *)&self->_params.searchRangeBaseForPreprocessing = 0x3E800000320;
  self->_params.maxAllowedOpticalCenterOffset = 1090519040;
  *(_OWORD *)&self->_params.luxLevelGatingThresholdON = xmmword_2D510;
  *(_OWORD *)&self->_params.colorScore.hueLowerRange = xmmword_2D520;
LABEL_20:
  [(GGMMetalToolBox *)self->_metalToolBox setRepairTuningParams:&self[1] withDict:v37];
  *(void *)&self->_params.costRescaleWhenOpticalCenterIsAvailable = 0x4234000042340000;
  *(void *)&self->_params.tempDetect.minVote = 1036831949;
  self->_params.tempDetect.searchRadiusMin = 1.0;
  *(_OWORD *)&self->_params.colorScore.saturationUpperThreshold = xmmword_2D530;
  if (v4) {
    int v33 = 128;
  }
  else {
    int v33 = 36;
  }
  self->_params.b4MergeGhostCntHardGatingTh = v33;
  *(_OWORD *)p_colorContrastDiffThreshold = xmmword_2D540;
  *((_OWORD *)p_colorContrastDiffThreshold + 1) = xmmword_2D550;
  *((_OWORD *)p_colorContrastDiffThreshold + 2) = xmmword_2D560;
  *(void *)&self->_params.repairParams.repairTargetGhostCntHi = 0x3D4CCCCD3ECCCCCDLL;
  *(void *)&self->_params.tempDetect.lumaDiffThreshold = 0x100000001;
  *(void *)&self->_params.kpCntSoftGatingTh = 0x3E19999A00000014;
}

- (int64_t)_allocateMetalBuffers
{
  int v3 = 16 * LODWORD(self->_metalBuffers.desGenMappingInfoBuf);
  BOOL v4 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  simd_float3 v5 = [v4 device];
  v6 = (MTLBuffer *)[v5 newBufferWithLength:v3 options:0];
  desGenGhostIdxBuf = self->_metalBuffers.desGenGhostIdxBuf;
  self->_metalBuffers.desGenGhostIdxBuf = v6;

  if (!self->_metalBuffers.desGenGhostIdxBuf)
  {
    fig_log_get_emitter();
LABEL_27:
    FigDebugAssert3();
    return (int)FigSignalErrorAt();
  }
  self->_metalBuffers.DoGAndLumaInputBoxesBufLen = (int)self->_metalBuffers.desGenMappingInfoBuf;
  v72[0] = 0;
  v72[1] = 0;
  int v71 = 0;
  uint64_t v8 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  uint64_t v9 = [v8 device];
  uint64_t v10 = (MTLBuffer *)[v9 newBufferWithBytes:v72 length:16 options:0];
  desGenGhostsBuf = self->_metalBuffers.desGenGhostsBuf;
  self->_metalBuffers.desGenGhostsBuf = v10;

  if (!self->_metalBuffers.desGenGhostsBuf)
  {
    fig_log_get_emitter();
    goto LABEL_27;
  }
  uint64_t v12 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  uint64_t v13 = [v12 device];
  uint64_t v14 = (MTLBuffer *)[v13 newBufferWithBytes:&v71 length:4 options:0];
  tinyGhostIdxBuf = self->_metalBuffers.tinyGhostIdxBuf;
  self->_metalBuffers.tinyGhostIdxBuf = v14;

  if (!self->_metalBuffers.tinyGhostIdxBuf) {
    goto LABEL_18;
  }
  uint64_t v16 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  long long v17 = [v16 device];
  uint64_t v18 = (MTLBuffer *)[v17 newBufferWithLength:901120 options:0];
  tinyGhostInputLocationsBuf = self->_metalBuffers.tinyGhostInputLocationsBuf;
  self->_metalBuffers.tinyGhostInputLocationsBuf = v18;

  if (!self->_metalBuffers.tinyGhostInputLocationsBuf)
  {
LABEL_18:
    fig_log_get_emitter();
    goto LABEL_27;
  }
  self->_metalBuffers.DoGAndLumaInputBoxesBufLenForPrevLS = 5120;
  int v69 = 0;
  int v70 = 0;
  uint64_t v20 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  uint64_t v21 = [v20 device];
  v22 = (MTLBuffer *)[v21 newBufferWithBytes:&v70 length:4 options:0];
  tinyGhostsBuf = self->_metalBuffers.tinyGhostsBuf;
  self->_metalBuffers.tinyGhostsBuf = v22;

  if (!self->_metalBuffers.tinyGhostsBuf)
  {
    fig_log_get_emitter();
    goto LABEL_27;
  }
  uint64_t v24 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v25 = [v24 device];
  v26 = (MTLBuffer *)[v25 newBufferWithBytes:&v69 length:4 options:0];
  DoGAndLumaInputBoxesBufForPrevLS = self->_metalBuffers.DoGAndLumaInputBoxesBufForPrevLS;
  self->_metalBuffers.DoGAndLumaInputBoxesBufForPrevLS = v26;

  if (!self->_metalBuffers.DoGAndLumaInputBoxesBufForPrevLS) {
    goto LABEL_21;
  }
  int v28 = 8 * HIDWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  int v29 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  int v30 = [v29 device];
  int v31 = (MTLBuffer *)[v30 newBufferWithLength:v28 options:0];
  tinyGhostInputLocationsSize = self->_metalBuffers.tinyGhostInputLocationsSize;
  self->_metalBuffers.tinyGhostInputLocationsSize = v31;

  if (!self->_metalBuffers.tinyGhostInputLocationsSize) {
    goto LABEL_21;
  }
  int reflectedLsBboxListBuf_high = HIDWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  self->_metalBuffers.DoGAndLumaFeaturesBufLen = reflectedLsBboxListBuf_high;
  int v34 = 176 * reflectedLsBboxListBuf_high;
  v35 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  id v36 = [v35 device];
  id v37 = (MTLBuffer *)[v36 newBufferWithLength:v34 options:0];
  DoGAndLumaInputBoxesBuf = self->_metalBuffers.DoGAndLumaInputBoxesBuf;
  self->_metalBuffers.DoGAndLumaInputBoxesBuf = v37;

  if (!self->_metalBuffers.DoGAndLumaInputBoxesBuf) {
    goto LABEL_21;
  }
  self->_metalBuffers.DoGAndLumaFeaturesBufLenForPrevLS = HIDWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  int v68 = 0;
  int v39 = 16 * LODWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  v40 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v41 = [v40 device];
  objc_super v42 = (MTLBuffer *)[v41 newBufferWithLength:v39 options:0];
  DoGAndLumaFeaturesBuf = self->_metalBuffers.DoGAndLumaFeaturesBuf;
  self->_metalBuffers.DoGAndLumaFeaturesBuf = v42;

  if (!self->_metalBuffers.DoGAndLumaFeaturesBuf) {
    goto LABEL_21;
  }
  LODWORD(self->_prevGhostTrackIDs) = self->_metalBuffers.reflectedLsBboxListBuf;
  int v44 = 16 * LODWORD(self->_metalBuffers.desGenMappingInfoBuf);
  v45 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v46 = [v45 device];
  v47 = (MTLBuffer *)[v46 newBufferWithLength:v44 options:0];
  DoGAndLumaFeaturesBufForPrevLS = self->_metalBuffers.DoGAndLumaFeaturesBufForPrevLS;
  self->_metalBuffers.DoGAndLumaFeaturesBufForPrevLS = v47;

  if (!self->_metalBuffers.DoGAndLumaFeaturesBufForPrevLS) {
    goto LABEL_21;
  }
  HIDWORD(self->_prevGhostTrackIDs) = self->_metalBuffers.desGenMappingInfoBuf;
  int v49 = 136 * LODWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  v50 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v51 = [v50 device];
  v52 = (MTLBuffer *)[v51 newBufferWithLength:v49 options:0];
  DoGAndLumaTotalBoxes = self->_metalBuffers.DoGAndLumaTotalBoxes;
  self->_metalBuffers.DoGAndLumaTotalBoxes = v52;

  if (!self->_metalBuffers.DoGAndLumaTotalBoxes) {
    goto LABEL_21;
  }
  LODWORD(self->_prevGhostTrackIDCnt) = self->_metalBuffers.reflectedLsBboxListBuf;
  int v54 = 136 * LODWORD(self->_metalBuffers.desGenMappingInfoBuf);
  v55 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v56 = [v55 device];
  v57 = (MTLBuffer *)[v56 newBufferWithLength:v54 options:0];
  DoGAndLumaTotalBoxesForPrevLS = self->_metalBuffers.DoGAndLumaTotalBoxesForPrevLS;
  self->_metalBuffers.DoGAndLumaTotalBoxesForPrevLS = v57;

  if (!self->_metalBuffers.DoGAndLumaTotalBoxesForPrevLS)
  {
LABEL_21:
    fig_log_get_emitter();
    goto LABEL_27;
  }
  HIDWORD(self->_prevGhostTrackIDCnt) = self->_metalBuffers.desGenMappingInfoBuf;
  v59 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v60 = [v59 device];
  id v61 = [v60 newBufferWithBytes:&v68 length:4 options:0];
  v62 = *(void **)&self->_metalBuffers.reflectedLsBboxListBufLen;
  *(void *)&self->_metalBuffers.reflectedLsBboxListBufLen = v61;

  if (!*(void *)&self->_metalBuffers.reflectedLsBboxListBufLen) {
    goto LABEL_26;
  }
  v63 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  v64 = [v63 device];
  id v65 = [v64 newBufferWithBytes:&v68 length:4 options:0];
  v66 = *(void **)&self->_metalBuffers.tinyGhostInputLocationsBufLen;
  *(void *)&self->_metalBuffers.tinyGhostInputLocationsBufLen = v65;

  int64_t result = 0;
  if (!*(void *)&self->_metalBuffers.tinyGhostInputLocationsBufLen)
  {
LABEL_26:
    fig_log_get_emitter();
    goto LABEL_27;
  }
  return result;
}

- (id)process:(__CVBuffer *)a3 metaData:(id)a4 ispTimeStamp:(id *)a5 keypoints:(__CVBuffer *)a6 lightSourceMask:(__CVBuffer *)a7 futureFrames:(id *)a8
{
  id v14 = a4;
  kdebug_trace();
  uint64_t v15 = sub_17640(self->_configuration.externalCfg.frameDelay, v14);
  [(VDGDetectionUtilsV2 *)self->_detectionUtils calcOpticalCenterFromMetaData:v14];
  CGFloat v42 = v17;
  CGFloat v43 = v16.f64[0];
  v16.f64[1] = v17;
  [(VideoDeghostingDetectionV2 *)self _ghostDetectionWithInputPixelBuffer:a3 reflectedLSMaskOri:0 lowLight:v15 opticalCenterFromMetaData:a6 simKeyPoint:a7 simLightSourceMask:v14 metaData:COERCE_DOUBLE(vcvt_f32_f64(v16)) futureFrames:a8];
  if (sub_17EE4(self->_reflectedLSROIs, (int)*(float *)&self[1]._detectionUtils, *(float *)&self[1].super.isa))
  {
    [(NSMutableArray *)self->_reflectedLSROIs removeAllObjects];
    uint64_t v18 = [(MTLTexture *)self->_inputTexture lastObject];
    [v18 removeAllObjects];

    v19 = [(NSMutableArray *)self->_prevLSLists lastObject];
    [v19 removeAllObjects];
  }
  kdebug_trace();
  uint64_t v20 = [(VDGDetectionUtilsV2 *)self->_detectionUtils generateDetectionRoiList:self->_reflectedLSROIs];
  unint64_t currLsArrayLen = self->_currLsArrayLen;
  self->_unint64_t currLsArrayLen = currLsArrayLen + 1;
  v22 = (id *)(&self->super.isa + currLsArrayLen % 0x64);
  id v23 = v22[165];
  id v24 = v22[65];
  id v25 = v23;
  bzero([v25 mutableBytes], 0x2548uLL);
  [(GGMMetalToolBox *)self->_metalToolBox updateMetaContainerBuffer:v24 WithDetectedROI:v20 isLowLight:v15];
  objc_msgSend(*(id *)&self->_runningAverageLSNumberCount, "process:info:metaContainerBuffer:computeBlendingWeights:futureFrames:", a3, v14, v24, objc_msgSend(v20, "count") != 0, a8);
  [*(id *)&self->_runningAverageLSNumberCount roiClusterCnt];
  kdebug_trace();
  uint64_t v26 = *(void *)&self->_configuration.internalCfg.antiFlareSize;
  rawLSList = self->_rawLSList;
  uint64_t v28 = *(void *)&self->_configuration.internalCfg.clipThreshold;
  BOOL v29 = LOBYTE(self->_params.lightSourceGatingThresholdOFF) != 0;
  BOOL v30 = HIBYTE(self->_params.lightSourceGatingThresholdOFF) != 0;
  char v31 = BYTE1(self->_trackID);
  BOOL v32 = LOBYTE(self->_params.lightSourceSelectionCntLimitNew) != 0;
  char v33 = BYTE2(self->_trackID);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44 = *a5;
  BYTE3(v41) = v33;
  BYTE2(v41) = v32;
  BYTE1(v41) = v31;
  LOBYTE(v41) = v30;
  int v34 = sub_17718(v25, v20, v43, v42, v26, (uint64_t)rawLSList, v28, v29, v14, (CMTime *)&v44);
  unsigned int v35 = *(_DWORD *)self->_estOpticalCenter
      + objc_msgSend(*(id *)&self->_configuration.internalCfg.antiFlareSize, "count", v41);
  *(_DWORD *)self->_estOpticalCenter = v35;
  int LSTrackID = self->_LSTrackID;
  BOOL v38 = __CFADD__(LSTrackID, 1);
  unsigned int v39 = LSTrackID + 1;
  self->_int LSTrackID = v39;
  if (!v38)
  {
    double v36 = (double)v35 / (double)v39;
    *(float *)&double v36 = v36;
  }
  objc_msgSend(*(id *)&self->_configuration.internalCfg.antiFlareSize, "count", v36);
  [(NSMutableArray *)self->_reflectedLSROIs count];
  kdebug_trace();

  return v34;
}

- (void)_ghostDetectionWithInputPixelBuffer:(__CVBuffer *)a3 reflectedLSMaskOri:(__CVBuffer *)a4 lowLight:(BOOL)a5 opticalCenterFromMetaData:(__CVBuffer *)a6 simKeyPoint:(__CVBuffer *)a7 simLightSourceMask:(id)a8 metaData:(id *)a9 futureFrames:
{
  double v11 = v9;
  id v14 = a8;
  id v181 = 0;
  id v180 = 0;
  uint64_t v15 = +[NSMutableArray array];
  id v179 = +[NSMutableArray array];
  id v178 = +[NSMutableArray array];
  id v177 = 0;
  long long v176 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  memset(v155, 0, sizeof(v155));
  if ([(VideoDeghostingDetectionV2 *)self _detectionInit:a3 metaData:v14 futureFrames:a9])
  {
    goto LABEL_104;
  }
  float64x2_t v16 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  float64_t v17 = [v16 commandQueue];
  uint64_t v18 = [v17 commandBuffer];

  v120 = (void *)v18;
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_104:
    v101 = 0;
    goto LABEL_101;
  }
  int v19 = BYTE1(self->_trackID);
  int trackID_high = HIBYTE(self->_trackID);
  uint64_t v21 = [v14 objectForKeyedSubscript:kFigCaptureStreamMetadata_LuxLevel];
  id v22 = [v21 intValue];

  unsigned int v23 = [(VideoDeghostingDetectionV2 *)self _shouldRunGGDetectionLuxLevelBased:v22];
  char v24 = v23;
  BOOL v25 = trackID_high != 0;
  BOOL v26 = v19 != 0;
  if (a6 && a7 && v23)
  {
    v27 = [v14 objectForKeyedSubscript:@"IspScalerInfo"];
    uint64_t v28 = v27;
    if (v27 && [v27 length] == &stru_1F8.reserved2)
    {
      [v28 getBytes:v155 length:576];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v152 = 0u;
      [(VDGDetectionUtilsV2 *)self->_detectionUtils setSimParams:&v152 withMetaData:v14];
      *(float *)&double v29 = (float)(*(float *)&v152 * (float)HIDWORD(v156)) * *((float *)&v152 + 1);
      if ([(VideoDeghostingDetectionV2 *)self _shouldRunGGDetectionClippedPixelBased:v29])
      {
        char v116 = v24;
        if (BYTE1(self->_trackID)
          && HIBYTE(self->_trackID)
          && BYTE2(self->_trackID)
          && self->_isPrevLSFeaturesAvailable
          || ![(NSMutableArray *)self->_prevLSLists count])
        {
          goto LABEL_21;
        }
        detectionUtils = self->_detectionUtils;
        id v31 = [(NSMutableArray *)self->_prevLSLists count];
        if (v31)
        {
          BOOL v32 = [(NSMutableArray *)self->_prevLSLists lastObject];
        }
        else
        {
          BOOL v32 = &__NSArray0__struct;
        }
        simd_float3x3 v210 = __invert_f3(*(simd_float3x3 *)&self->_hmgrphyTMinus1ToT.confidence);
        -[VDGDetectionUtilsV2 generateBoxesForDoGAndLumaAndForPrevLSROIs:homography:metalBuffers:maxBufferLength:](detectionUtils, "generateBoxesForDoGAndLumaAndForPrevLSROIs:homography:metalBuffers:maxBufferLength:", v32, &self->_metalBuffers.desGenGhostIdxBuf, LODWORD(self->_metalBuffers.reflectedLsBboxListBuf), *(double *)v210.columns[0].i64, *(double *)v210.columns[1].i64, *(double *)v210.columns[2].i64);
        if (v31) {

        }
        if (!*(_DWORD *)[*(id *)&self->_metalBuffers.tinyGhostInputLocationsBufLen contents])
        {
LABEL_21:
          int v117 = 0;
        }
        else
        {
          -[GGMMetalToolBox computeDoGAndLumaForBoxesViaInput:inputLocationsSize:metalBuffers:commandBuffer:](self->_metalToolBox, "computeDoGAndLumaForBoxesViaInput:inputLocationsSize:metalBuffers:commandBuffer:", self->_frameTMinus1Texture, *(unsigned int *)[*(id *)&self->_metalBuffers.tinyGhostInputLocationsBufLen contents], &self->_metalBuffers.desGenGhostIdxBuf, v120);
          int v117 = 1;
        }
        LODWORD(self->_estimatedOpticalCenter.x) = 1058642330;
        [(MTLTexture *)self->_inputTexture lastObject];
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v33 = [obj countByEnumeratingWithState:&v148 objects:v209 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v149;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v149 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v37 = *(void *)(*((void *)&v148 + 1) + 8 * i);
              if ([(VDGDetectionUtilsV2 *)self->_detectionUtils ghostIsHighConfidence:v37]) {
                [v15 addObject:v37];
              }
            }
            id v34 = [obj countByEnumeratingWithState:&v148 objects:v209 count:16];
          }
          while (v34);
        }

        [(VideoDeghostingDetectionV2 *)self _updateEstOpticalCenterUsingPrevDetectedGhosts:v15 currentDefaultOpticalCenter:v11];
        if ([(VideoDeghostingDetectionV2 *)self estOpticalCenterConsecutiveValidFrameCnt] >= 3)[(VideoDeghostingDetectionV2 *)self setEstOpticalCenterIsAvailable:1]; {
        [(VideoDeghostingDetectionV2 *)self setPrevDefaultOpticalCenter:v11];
        }
        kdebug_trace();
        LODWORD(v38) = self->_params.maxAllowedOpticalCenterOffset;
        unsigned int v39 = [(MaskToRoi *)self->_maskToRoi extractRoiByGraphTraversalInput:a7 bboxSizeThreshold:&v152 scaleFactorInv:DWORD2(v154) validWidth:HIDWORD(v154) validHeight:*(void *)&self->_tinyKeypointLocationCountMax lightSourceBBox:v38];
        self->_LSROIs = v39;
        kdebug_trace();
        unsigned int v40 = [(VideoDeghostingDetectionV2 *)self _shouldRunGGDetectionLSBased:v39];
        if ((v40 & 1) == 0 && ((v117 ^ 1) & 1) == 0) {
          [v120 waitUntilCompleted];
        }
        if (v40)
        {
          v113 = v28;
          v114 = v15;
          id v115 = v14;
          uint64_t v41 = [(VideoDeghostingDetectionV2 *)self extractLightSourceBBoxFromBuffer:*(void *)&self->_tinyKeypointLocationCountMax BoxCount:v39];
          id v42 = v178;
          id v178 = v41;

          long long v208 = 0u;
          long long v207 = 0u;
          long long v206 = 0u;
          long long v205 = 0u;
          long long v204 = 0u;
          long long v203 = 0u;
          long long v202 = 0u;
          long long v201 = 0u;
          long long v200 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          id v43 = v178;
          id v44 = [v43 countByEnumeratingWithState:&v144 objects:v199 count:16];
          if (v44)
          {
            id v45 = v44;
            uint64_t v46 = *(void *)v145;
            int32x2_t v47 = vdup_n_s32(0x7F800000u);
            do
            {
              for (j = 0; j != v45; j = (char *)j + 1)
              {
                if (*(void *)v145 != v46) {
                  objc_enumerationMutation(v43);
                }
                int v49 = *(void **)(*((void *)&v144 + 1) + 8 * (void)j);
                [v49 setDoneKPToBBoxViaGraphTraversal:1];
                [v49 bbox];
                float32x4_t v123 = vaddq_f32(v50, (float32x4_t)xmmword_2D570);
                objc_msgSend(v49, "setBbox:");
                float32x4_t v51 = vmulq_laneq_f32(v123, v123, 3);
                v51.i32[0] = v51.i32[2];
                [v49 setArea:*(double *)v51.i64];
                [v49 generateLocationFromBBox];
                if (v49)
                {
                  [v49 descriptor];
                }
                else
                {
                  long long v198 = 0u;
                  long long v197 = 0u;
                  long long v196 = 0u;
                  long long v195 = 0u;
                  long long v194 = 0u;
                  long long v193 = 0u;
                  long long v192 = 0u;
                  long long v191 = 0u;
                  long long v190 = 0u;
                  long long v189 = 0u;
                }
                long long v206 = v195;
                long long v207 = v196;
                long long v208 = v197;
                long long v202 = v191;
                long long v203 = v192;
                long long v205 = v194;
                long long v204 = v193;
                long long v201 = v190;
                long long v200 = v189;
                v186[6] = v195;
                v186[7] = v196;
                v186[8] = v197;
                v186[2] = v191;
                v186[3] = v192;
                v186[5] = v194;
                v186[4] = v193;
                v186[1] = v190;
                v186[0] = v189;
                int32x2_t v187 = v47;
                int32x2_t v188 = v47;
                [v49 setDescriptor:v186];
                [v49 setTrackFail:0];
                [v49 setDefaultOpticalCenter:v11];
                [v49 bbox];
                float32x2_t v124 = v52;
                [v49 bbox];
                float32x2_t v125 = vmla_f32(v124, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL));
                *(float32x2_t *)v53.i8 = vsub_f32(*(float32x2_t *)&self->_prevDefaultOpticalCenter[4], v125);
                *(float32x2_t *)v53.i8 = vmul_f32(*(float32x2_t *)v53.i8, *(float32x2_t *)v53.i8);
                *(float *)v53.i32 = sqrtf(vaddv_f32(*(float32x2_t *)v53.i8));
                [v49 setDist2opticalCenter:*(double *)v53.i64];
                LODWORD(v54) = 2139095040;
                [v49 setDist2ghost:v54];
                long long v142 = 0u;
                long long v143 = 0u;
                long long v140 = 0u;
                long long v141 = 0u;
                v55 = [(MTLTexture *)self->_inputTexture lastObject];
                id v56 = [v55 countByEnumeratingWithState:&v140 objects:v185 count:16];
                if (v56)
                {
                  id v57 = v56;
                  uint64_t v58 = *(void *)v141;
                  do
                  {
                    for (k = 0; k != v57; k = (char *)k + 1)
                    {
                      if (*(void *)v141 != v58) {
                        objc_enumerationMutation(v55);
                      }
                      [*(id *)(*((void *)&v140 + 1) + 8 * (void)k) getReflectedBboxCenterAroundCenter:*(double *)&self->_prevDefaultOpticalCenter[4]];
                      float32x2_t v61 = v60;
                      [v49 dist2ghost];
                      float v63 = v62;
                      float32x2_t v64 = vsub_f32(v125, v61);
                      if (v63 < sqrtf(vaddv_f32(vmul_f32(v64, v64)))) {
                        [v49 dist2ghost];
                      }
                      objc_msgSend(v49, "setDist2ghost:");
                    }
                    id v57 = [v55 countByEnumeratingWithState:&v140 objects:v185 count:16];
                  }
                  while (v57);
                }
              }
              id v45 = [v43 countByEnumeratingWithState:&v144 objects:v199 count:16];
            }
            while (v45);
          }

          [(VDGDetectionUtilsV2 *)self->_detectionUtils getTopLSInList:v178 k:SLOWORD(self->_params.lightSourceBoxSizeThreshold) dist2ghostTol:5.62950094e14];
          if (v117) {
            [v120 waitUntilCompleted];
          }
          self->_isPrevLSFeaturesAvailable = [(VDGDetectionUtilsV2 *)self->_detectionUtils updatePrevLSDoGAndLumaFeaturesWithMetalBuffers:&self->_metalBuffers.desGenGhostIdxBuf];
          kdebug_trace();
          [(VideoDeghostingDetectionV2 *)self _trackLightSources:&v178];
          uint64_t v65 = [(VideoDeghostingDetectionV2 *)self deepCopyROIList:v178 copyReferencedROI:0];
          v66 = *(void **)&self->_configuration.internalCfg.antiFlareSize;
          *(void *)&self->_configuration.internalCfg.antiFlareSize = v65;

          -[VideoDeghostingDetectionV2 setPrevFrameAllLSCnt:](self, "setPrevFrameAllLSCnt:", [v178 count]);
          [(VideoDeghostingDetectionV2 *)self getDilationCoefsAndReflectedDilatedLsList:v178];
          kdebug_trace();
          if (self->_localMotionReferenceTexture)
          {
            v67 = self->_detectionUtils;
            id v68 = [(NSMutableArray *)self->_prevLSLists count];
            if (v68)
            {
              int v69 = [(NSMutableArray *)self->_prevLSLists lastObject];
            }
            else
            {
              int v69 = &__NSArray0__struct;
            }
            simd_float3x3 v211 = __invert_f3(*(simd_float3x3 *)&self->_hmgrphyTToTPlus1.confidence);
            -[VDGDetectionUtilsV2 generateBoxesForDoGAndLumaAndForPrevLSROIs:homography:metalBuffers:maxBufferLength:](v67, "generateBoxesForDoGAndLumaAndForPrevLSROIs:homography:metalBuffers:maxBufferLength:", v69, &self->_metalBuffers.desGenGhostIdxBuf, LODWORD(self->_metalBuffers.desGenMappingInfoBuf), *(double *)v211.columns[0].i64, *(double *)v211.columns[1].i64, *(double *)v211.columns[2].i64);
            if (v68) {
          }
            }
          int v70 = self->_detectionUtils;
          id v71 = v178;
          id v72 = [(MTLTexture *)self->_inputTexture count];
          if (v72)
          {
            v73 = [(MTLTexture *)self->_inputTexture lastObject];
          }
          else
          {
            v73 = &__NSArray0__struct;
          }
          [(VDGDetectionUtilsV2 *)v70 generateBoxesForDoGAndLumaAndForLSROIs:v71 prevGGROIs:v73 inputTexture:self->_frameTMinus1Texture opticalCenter:&self->_metalBuffers.desGenGhostIdxBuf metalBuffers:LODWORD(self->_metalBuffers.reflectedLsBboxListBuf) maxBufferLength:*(double *)&self->_prevDefaultOpticalCenter[4]];
          if (v72) {

          }
          uint64_t saturationLowerThreshold_low = LODWORD(self->_params.colorScore.saturationLowerThreshold);
          uint64_t hueThreshold_low = LODWORD(self->_params.colorScore.hueThreshold);
          long long v189 = v152;
          long long v190 = v153;
          long long v191 = v154;
          v76 = [(VideoDeghostingDetectionV2 *)self _ghostCandidateGenerationViaKeypointBuffer:a6 opticalCenterFromMetaData:&v189 mappingInfo:&v179 GGList:&v178 LSList:saturationLowerThreshold_low kpCntHardGatingTh:hueThreshold_low kpCntSoftGatingTh:v11];
          id v77 = v177;
          id v177 = v76;

          [(VDGDetectionUtilsV2 *)self->_detectionUtils updateDoGAndLumaFeaturesWithMetalBuffers:&self->_metalBuffers.desGenGhostIdxBuf];
          [(VideoDeghostingDetectionV2 *)self _trackGhosts:&v179 ghostCandidates:&v177 LSList:v178];
          [(VDGDetectionUtilsV2 *)self->_detectionUtils getTopGhostsInList:v179 k:SLOWORD(self->_params.colorScore.hueLowerRange) opticalCenter:LODWORD(self->_params.colorScore.hueUpperRange) ghostCntGatingTh:*(double *)&self->_prevDefaultOpticalCenter[4]];
          [v179 count];
          [(VDGDetectionUtilsV2 *)self->_detectionUtils clearReferencedROIsForROIList:v178];
          [(VDGDetectionUtilsV2 *)self->_detectionUtils clearReferencedROIsForROIList:v179];
          kdebug_trace();
          v78 = [(VideoDeghostingDetectionV2 *)self deepCopyROIList:v179 copyReferencedROI:0];
          v79 = [(VideoDeghostingDetectionV2 *)self prevFrameMergedGhosts];
          unsigned __int8 v80 = [(VideoDeghostingDetectionV2 *)self _mergeBboxesWithTrackingForMitigation:v78 prevFrameGhostList:v79];

          if ((v80 & 1) == 0)
          {
            [v78 removeAllObjects];
            [v179 removeAllObjects];
            v81 = [(VideoDeghostingDetectionV2 *)self prevFrameMergedGhosts];
            [v81 removeAllObjects];
          }
          if (self->_isLocalMotionCueEnabled)
          {
            [(VideoDeghostingDetectionV2 *)self setPrevFrameMergedGhosts:v78];
            if (*(_DWORD *)self->_estOpticalCenterOffset == 1) {
              *(_DWORD *)self->_estOpticalCenterOffset = *(_DWORD *)&self->_estOpticalCenter[4];
            }
          }
          id v119 = v78;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          id v122 = v178;
          id v82 = [v122 countByEnumeratingWithState:&v136 objects:v184 count:16];
          if (v82)
          {
            id v83 = v82;
            uint64_t v84 = *(void *)v137;
            do
            {
              for (m = 0; m != v83; m = (char *)m + 1)
              {
                if (*(void *)v137 != v84) {
                  objc_enumerationMutation(v122);
                }
                v86 = *(void **)(*((void *)&v136 + 1) + 8 * (void)m);
                [v86 bbox];
                float32x2_t v126 = v87;
                [v86 bbox];
                float32x2_t v127 = vmla_f32(v126, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v88, v88, 8uLL));
                *(float32x2_t *)v88.i8 = vsub_f32(*(float32x2_t *)&self->_prevDefaultOpticalCenter[4], v127);
                *(float32x2_t *)v88.i8 = vmul_f32(*(float32x2_t *)v88.i8, *(float32x2_t *)v88.i8);
                *(float *)v88.i32 = sqrtf(vaddv_f32(*(float32x2_t *)v88.i8));
                [v86 setDist2opticalCenter:*(double *)v88.i64];
                LODWORD(v89) = 2139095040;
                [v86 setDist2ghost:v89];
                long long v134 = 0u;
                long long v135 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                id v90 = v179;
                id v91 = [v90 countByEnumeratingWithState:&v132 objects:v183 count:16];
                if (v91)
                {
                  id v92 = v91;
                  uint64_t v93 = *(void *)v133;
                  do
                  {
                    for (n = 0; n != v92; n = (char *)n + 1)
                    {
                      if (*(void *)v133 != v93) {
                        objc_enumerationMutation(v90);
                      }
                      [*(id *)(*((void *)&v132 + 1) + 8 * (void)n) getReflectedBboxCenterAroundCenter:*(double *)&self->_prevDefaultOpticalCenter[4]];
                      float32x2_t v96 = v95;
                      [v86 dist2ghost];
                      float v98 = v97;
                      float32x2_t v99 = vsub_f32(v127, v96);
                      if (v98 < sqrtf(vaddv_f32(vmul_f32(v99, v99)))) {
                        [v86 dist2ghost];
                      }
                      objc_msgSend(v86, "setDist2ghost:");
                    }
                    id v92 = [v90 countByEnumeratingWithState:&v132 objects:v183 count:16];
                  }
                  while (v92);
                }
              }
              id v83 = [v122 countByEnumeratingWithState:&v136 objects:v184 count:16];
            }
            while (v83);
          }

          LODWORD(v100) = 16.0;
          [(VDGDetectionUtilsV2 *)self->_detectionUtils getTopLSInList:v178 k:SLOWORD(self->_params.searchRangeBase) dist2ghostTol:v100];
          v101 = v119;
          objc_storeStrong((id *)&self->_reflectedLSROIs, v119);
          objc_storeStrong((id *)&self->_rawDesGenKeyPoints, v178);
          id v102 = [v178 mutableCopy];
          id v103 = v181;
          id v181 = v102;

          id v104 = [v179 mutableCopy];
          id v105 = v180;
          id v180 = v104;

          v106 = +[NSMutableArray array];
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v107 = v104;
          id v108 = [v107 countByEnumeratingWithState:&v128 objects:v182 count:16];
          uint64_t v15 = v114;
          id v14 = v115;
          if (v108)
          {
            id v109 = v108;
            uint64_t v110 = *(void *)v129;
            do
            {
              for (ii = 0; ii != v109; ii = (char *)ii + 1)
              {
                if (*(void *)v129 != v110) {
                  objc_enumerationMutation(v107);
                }
                v112 = *(void **)(*((void *)&v128 + 1) + 8 * (void)ii);
                if ([v112 isReflectedLS]) {
                  [v106 addObject:v112];
                }
              }
              id v109 = [v107 countByEnumeratingWithState:&v128 objects:v182 count:16];
            }
            while (v109);
          }

          [v107 removeObjectsInArray:v106];
          BOOL v25 = 1;
          [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneGGList:&v180 LSBBoxList:&v181 reflectedLSBBoxList:*(void *)&self->_reflectedDilatedLsForTracking[4] getMatchedLS:0 pruneLS:1 pruneGG:0];
          -[VideoDeghostingDetectionV2 setPrevFrameMatchedLSCnt:](self, "setPrevFrameMatchedLSCnt:", [v181 count]);
          [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneLSBasedOnDist2Ghost:v178];
          BOOL v26 = 1;
          char v24 = v116;
          uint64_t v28 = v113;
        }
        else
        {
          BOOL v26 = 0;
          v106 = 0;
          v101 = 0;
          BOOL v25 = 1;
          char v24 = v116;
        }
        goto LABEL_100;
      }
      BOOL v25 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    id obj = 0;
    v106 = 0;
    v101 = 0;
  }
  else
  {
    uint64_t v28 = 0;
    id obj = 0;
    v106 = 0;
    v101 = 0;
  }
LABEL_100:
  BYTE1(self->_trackID) = v26;
  BYTE2(self->_trackID) = v24;
  HIBYTE(self->_trackID) = v25;
  kdebug_trace();

LABEL_101:
}

- (id)_ghostCandidateGenerationViaKeypointBuffer:(__CVBuffer *)a3 opticalCenterFromMetaData:(_simParamsStruct *)a4 mappingInfo:(id *)a5 GGList:(id *)a6 LSList:(int)a7 kpCntHardGatingTh:(int)a8 kpCntSoftGatingTh:
{
  double v13 = v8;
  kdebug_trace();
  kdebug_trace();
  detectionUtils = self->_detectionUtils;
  id v17 = *a6;
  frameTMinus1Texture = self->_frameTMinus1Texture;
  float lsDilation = self->_lsDilation;
  [(VideoDeghostingDetectionV2 *)self estOpticalCenter];
  double v21 = v20;
  LODWORD(v22) = 4.0;
  *(float *)&double v20 = lsDilation;
  [(VDGDetectionUtilsV2 *)detectionUtils findTinyKeypointLocationsFromLS:v17 inputTexture:frameTMinus1Texture dilation:&self->_metalBuffers.desGenGhostIdxBuf estimatedOpticalCenter:HIDWORD(self->_metalBuffers.reflectedLsBboxListBuf) metalBuffers:v20 maxBufferLength:v21 keypointSampleStepCount:v22];
  kdebug_trace();
  kdebug_trace();
  id v42 = +[NSMutableArray array];
  id v23 = *a6;
  float v24 = self->_lsDilation;
  [(VideoDeghostingDetectionV2 *)self estOpticalCenter];
  double v26 = v25;
  *(float *)&double v25 = v24;
  [(VideoDeghostingDetectionV2 *)self _findGhostsAndGenerateDescriptors:&v42 LSList:v23 LSDilation:a3 LSReflectCenter:v25 desGenKeypointBuf:v26 desGenMappingInfo:*(double *)a4->var1];
  [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneGGList:&v42 LSBBoxList:a6 reflectedLSBBoxList:*(void *)&self->_reflectedDilatedLsForTracking[4] getMatchedLS:1 pruneLS:0 pruneGG:1];
  [(VideoDeghostingDetectionV2 *)self _setLightSourceMotionForKeypoints:&v42];
  if ((unint64_t)[v42 count] > a7) {
    [v42 removeAllObjects];
  }
  v27 = self->_detectionUtils;
  id v28 = v42;
  [(VideoDeghostingDetectionV2 *)self estOpticalCenter];
  -[VDGDetectionUtilsV2 sortKPs:opticalCenter:](v27, "sortKPs:opticalCenter:", v28);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v29 = v42;
  id v30 = [v29 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) setDoneKPToBBoxViaGraphTraversal:1];
      }
      id v31 = [v29 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v31);
  }

  [(VideoDeghostingDetectionV2 *)self _pruneUsingMatchedLSInfo:&v42 dilation:(int)self->_lsDilation];
  id v34 = (char *)[v42 count];
  if ((uint64_t)v34 > a8) {
    objc_msgSend(v42, "removeObjectsInRange:", a8, &v34[-a8]);
  }
  [(VDGDetectionUtilsV2 *)self->_detectionUtils removeDuplicateRois:v42];
  [(VDGDetectionUtilsV2 *)self->_detectionUtils setDefaultOpticalCenterForList:v42 opticalCenter:v13];
  kdebug_trace();
  [(VDGDetectionUtilsV2 *)self->_detectionUtils getGGCandidatesFromROIList:v42 GGList:a5];
  kdebug_trace();
  id v35 = v42;

  return v35;
}

- (void)_updateEstOpticalCenterUsingPrevDetectedGhosts:(id)a3 currentDefaultOpticalCenter:
{
  float32x2_t v5 = v3;
  id v7 = a3;
  unint64_t prevFrameAllLSCnt = self->_prevFrameAllLSCnt;
  if ([v7 count])
  {
    uint64_t v9 = 0;
    unsigned __int32 v10 = 0;
    v4.i32[0] = 1;
    do
    {
      double v11 = [v7 objectAtIndexedSubscript:v9];
      unint64_t v12 = self->_prevFrameAllLSCnt;
      [v11 bbox];
      float32x2_t v39 = v13;
      [v11 bbox];
      int8x16_t v38 = v14;
      [v11 isTrajectoryPruningPassed];
      uint64_t v15 = [v11 matchedLS];
      id v16 = [v15 count];

      if (v16)
      {
        uint64_t v17 = 0;
        float32x2_t v18 = vadd_f32(v39, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL), (float32x2_t)0x3F0000003F000000));
        unsigned int v19 = 1;
        do
        {
          double v20 = [v11 matchedLS];
          double v21 = [v20 objectAtIndexedSubscript:v17];

          [v21 bbox];
          float32x2_t v40 = v22;
          [v21 bbox];
          unint64_t v12 = (unint64_t)vadd_f32(vmul_f32(vadd_f32(v18, vadd_f32(v40, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL), (float32x2_t)0x3F0000003F000000))), (float32x2_t)0x3F0000003F000000), (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32((int32x2_t)__PAIR64__(v40.u32[1], v19), v4), 0), (int8x8_t)0x8000000080000000, (int8x8_t)v12));

          uint64_t v17 = v19;
          float v24 = [v11 matchedLS];
          id v25 = [v24 count];
        }
        while ((unint64_t)v25 > v19++);
      }
      v27 = [v11 matchedLS];
      id v28 = [v27 count];

      if (v28)
      {
        id v31 = [v11 matchedLS];
        *(float *)v32.i32 = (float)(unint64_t)[v31 count];
        unint64_t v12 = (unint64_t)vdiv_f32((float32x2_t)v12, (float32x2_t)vdup_lane_s32(v32, 0));
      }
      v29.i32[0] = 0;
      v30.i32[0] = v10;
      unint64_t prevFrameAllLSCnt = (unint64_t)vadd_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v30, v29), 0), (int8x8_t)0x8000000080000000, (int8x8_t)prevFrameAllLSCnt), (float32x2_t)v12);

      uint64_t v9 = ++v10;
    }
    while ((unint64_t)[v7 count] > v10);
  }
  if ([(VideoDeghostingDetectionV2 *)self prevFrameAllLSCnt])
  {
    float v33 = (float)[(VideoDeghostingDetectionV2 *)self prevFrameMatchedLSCnt];
    if ((float)(v33 / (float)[(VideoDeghostingDetectionV2 *)self prevFrameAllLSCnt]) < 0.05)
    {
      LOBYTE(self->_trackID) = 0;
      self->_trackIDAfterMerge = 0;
      if (![(VideoDeghostingDetectionV2 *)self prevFrameMatchedLSCnt]) {
        unint64_t prevFrameAllLSCnt = (unint64_t)vmul_n_f32((float32x2_t)self->_prevFrameAllLSCnt, (float)(unint64_t)[v7 count]);
      }
    }
  }
  if ([v7 count])
  {
    *(float *)v34.i32 = (float)(unint64_t)[v7 count];
    float32x2_t v35 = vdiv_f32((float32x2_t)prevFrameAllLSCnt, (float32x2_t)vdup_lane_s32(v34, 0));
    float32x2_t v36 = vsub_f32(v35, v5);
    float v37 = sqrtf(vaddv_f32(vmul_f32(v36, v36)));
    [(VideoDeghostingDetectionV2 *)self params];
    if (v37 <= (float)v41)
    {
      self->_prevFrameMergedGhosts = (NSMutableArray *)vmla_f32(vmul_f32(vsub_f32(v35, (float32x2_t)self->_prevFrameAllLSCnt), (float32x2_t)vdup_n_s32(0x3E4CCCCDu)), (float32x2_t)vdup_n_s32(0x3F4CCCCDu), (float32x2_t)self->_prevFrameMergedGhosts);
      if (!LOBYTE(self->_trackID)) {
        ++self->_trackIDAfterMerge;
      }
    }
  }
  *(float32x2_t *)&self->_prevDefaultOpticalCenter[4] = vadd_f32((float32x2_t)self->_prevFrameMergedGhosts, v5);
}

- (void)_pruneUsingMatchedLSInfo:(id *)a3 dilation:(int)a4
{
  int8x16_t v53 = +[NSMutableArray array];
  double v54 = self;
  float32x2_t v7 = *(float32x2_t *)&self->_prevDefaultOpticalCenter[4];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  float32x4_t v51 = a3;
  id obj = *a3;
  id v56 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v61;
    *(float *)v8.i32 = (float)a4;
    float32x2_t v9 = (float32x2_t)vdup_lane_s32(v8, 0);
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        [v11 bbox];
        float32x2_t v58 = *(float32x2_t *)v12.i8;
        float32x2_t v57 = (float32x2_t)vextq_s8(v12, v12, 8uLL).u64[0];
        float32x2_t v13 = [v11 matchedLS];
        int v14 = [v13 count];
        int v15 = v14;
        if (v14 < 1)
        {
          char v18 = 0;
          int v17 = 0;
          *(void *)&long long v59 = 0;
          double v22 = 0.0;
          float v23 = INFINITY;
        }
        else
        {
          uint64_t v16 = 0;
          int v17 = 0;
          char v18 = 0;
          float32x2_t v19 = vadd_f32(v58, vmul_f32(v57, (float32x2_t)0x3F0000003F000000));
          float32x2_t v20 = vadd_f32(v58, v57);
          long long v59 = 0u;
          uint64_t v21 = v14;
          double v22 = 0.0;
          float v23 = INFINITY;
          do
          {
            float v24 = [v13 objectAtIndexedSubscript:v16];
            [v24 bbox];
            float32x2_t v26 = (float32x2_t)vextq_s8((int8x16_t)v25, (int8x16_t)v25, 8uLL).u64[0];
            float32x2_t v27 = vadd_f32(*(float32x2_t *)v25.f32, v26);
            float32x2_t v28 = vadd_f32(*(float32x2_t *)v25.f32, vmul_f32(v26, (float32x2_t)0x3F0000003F000000));
            float32x2_t v29 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v20), (int8x8_t)v20, (int8x8_t)v27), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v58, *(float32x2_t *)v25.f32), (int8x8_t)v58, *(int8x8_t *)v25.f32));
            uint32x2_t v30 = (uint32x2_t)vcgtz_f32(v29);
            int v31 = vpmin_u32(v30, v30).u32[0];
            float v32 = vmul_lane_f32(v29, v29, 1).f32[0] / COERCE_FLOAT(vmulq_laneq_f32(v25, v25, 3).i32[2]);
            if (v32 >= v23) {
              float v32 = v23;
            }
            int32x2_t v33 = vcvt_s32_f32(v26);
            float32x2_t v34 = vadd_f32(v7, vsub_f32(v7, v27));
            int32x2_t v35 = vcvt_s32_f32(vsub_f32(v34, v9));
            float32x2_t v36 = vadd_f32(v26, v34);
            if (v31 < 0) {
              char v18 = 1;
            }
            int32x2_t v37 = vcvt_s32_f32(vadd_f32(v9, v36));
            float32x2_t v38 = vsub_f32(vcvt_f32_s32(v35), v58);
            if (v31 < 0) {
              float v23 = v32;
            }
            float v39 = fmaxf(v38.f32[0], v38.f32[1]);
            if (v39 < 0.0) {
              float v39 = 0.0;
            }
            float v40 = (float)(int)v39;
            float32x2_t v41 = vsub_f32(v20, vcvt_f32_s32(v37));
            float v42 = fmaxf(v41.f32[0], v41.f32[1]);
            if (v42 >= v40) {
              float v40 = v42;
            }
            *((void *)&v43 + 1) = *((void *)&v59 + 1);
            *(int32x2_t *)&long long v43 = vmax_s32(*(int32x2_t *)&v59, v33);
            long long v59 = v43;
            int v44 = (int)v40;
            float32x2_t v45 = (float32x2_t)vbsl_s8((int8x8_t)vceqd_s64(v16, 0), (int8x8_t)0x8000000080000000, *(int8x8_t *)&v22);
            if (v17 >= v44) {
              int v46 = v44;
            }
            else {
              int v46 = v17;
            }
            double v22 = COERCE_DOUBLE(vadd_f32(vmul_f32(vadd_f32(v19, v28), (float32x2_t)0x3F0000003F000000), v45));
            if (v16) {
              int v17 = v46;
            }
            else {
              int v17 = v44;
            }

            ++v16;
          }
          while (v21 != v16);
        }
        uint32x2_t v47 = (uint32x2_t)vcgt_f32(v57, vmul_f32(vcvt_f32_s32(*(int32x2_t *)&v59), (float32x2_t)vdup_n_s32(0x3FD9999Au)));
        int32x2_t v48 = (int32x2_t)vpmax_u32(v47, v47);
        if (v48.i32[0] < 0 || (v18 & (v23 > 0.7)) != 0 || v17 > 30) {
          goto LABEL_34;
        }
        *(float *)v48.i32 = (float)v15;
        double v49 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)&v22, (float32x2_t)vdup_lane_s32(v48, 0)));
        if (v15 < 1) {
          double v49 = v22;
        }
        if (!LOBYTE(v54->_trackID))
        {
          float32x2_t v50 = vsub_f32(*(float32x2_t *)&v49, v7);
          if ((double)v54->_params.kpCntSoftGatingTh + (double)v54->_params.kpCntSoftGatingTh < sqrtf(vaddv_f32(vmul_f32(v50, v50)))) {
LABEL_34:
          }
            [v53 addObject:v11];
        }
      }
      id v56 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v56);
  }

  [*v51 removeObjectsInArray:v53];
}

- (BOOL)_mergeBboxesWithTrackingForMitigation:(id)a3 prevFrameGhostList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_17B78(v6);
  if (!v7)
  {
LABEL_62:
    BOOL v10 = 1;
    goto LABEL_63;
  }
  id v8 = [v7 count];
  id v9 = [v6 count];
  BOOL v10 = 0;
  unint64_t v11 = *(void *)&self->_estOpticalCenterIsAvailable;
  if ((unint64_t)v8 > v11 || (unint64_t)v9 > v11) {
    goto LABEL_63;
  }
  id v64 = v9;
  id v74 = v8;
  if (!v8)
  {
LABEL_11:
    if (v64)
    {
      uint64_t v19 = 0;
      uint64_t v20 = (v8 + 1);
      uint64_t v70 = (int)v8;
      uint64_t v68 = v8;
      uint64_t v61 = (4 * v20 + 15) & 0x7FFFFFFF0;
      size_t v62 = 4 * (int)v20;
      id v63 = v6;
      v73 = self;
      uint64_t v60 = v20;
      do
      {
        uint64_t v21 = v7;
        uint64_t v67 = v19;
        double v22 = [v6 objectAtIndexedSubscript:v60];
        float v23 = v22;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        if (v22) {
          [v22 descriptor];
        }
        [v23 bbox];
        long long v72 = v24;
        [v23 bbox];
        *(float32x2_t *)&long long v76 = vadd_f32(*(float32x2_t *)&v72, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL), (float32x2_t)0x3F0000003F000000));
        *(void *)&long long v85 = 0;
        v75[6] = v82;
        v75[7] = v83;
        v75[2] = v78;
        v75[3] = v79;
        v75[4] = v80;
        v75[5] = v81;
        v75[8] = v84;
        v75[9] = v85;
        v75[0] = v76;
        v75[1] = v77;
        [v23 setDescriptor:v75];
        [v23 setIsPredictedFromPast:0];
        [v23 setIsTrajectoryPruningPassed:1];
        [v23 setLowSaliencyCnt:0];
        [v23 setTrackedCnt:0];
        uint64_t v65 = &v60;
        *(void *)&long long v72 = (char *)&v60 - v61;
        bzero((char *)&v60 - v61, v62);
        id v66 = v23;
        id v71 = [v23 trackIDsAfterMerge];
        int v26 = [v71 count];
        if (v26 >= 1)
        {
          uint64_t v27 = 0;
          uint64_t v69 = v26;
          do
          {
            float32x2_t v28 = [v71 objectAtIndexedSubscript:v27];
            unsigned int v29 = [v28 intValue];

            if (v8)
            {
              uint32x2_t v30 = 0;
              char v31 = 0;
              while (2)
              {
                uint64_t v32 = 4 * (void)v30;
                while (1)
                {
                  int32x2_t v33 = [v21 objectAtIndexedSubscript:v30];
                  float32x2_t v34 = [v33 trackIDsAfterMerge];
                  int32x2_t v35 = (char *)[v34 count];

                  if (v35) {
                    break;
                  }
LABEL_24:

                  uint32x2_t v30 = (char *)v30 + 1;
                  v32 += 4;
                  id v8 = v74;
                  if (v30 == v74)
                  {
                    if (v31) {
                      goto LABEL_30;
                    }
                    goto LABEL_29;
                  }
                }
                float32x2_t v36 = (int *)((char *)v73->_repairWeightsGenerator + *(void *)&v73->_estOpticalCenterIsAvailable * v32);
                while (1)
                {
                  int v37 = *v36++;
                  if (v37 == v29) {
                    break;
                  }
                  if (!--v35) {
                    goto LABEL_24;
                  }
                }
                ++*(_DWORD *)(v72 + 4 * (void)v30);

                uint32x2_t v30 = (char *)v30 + 1;
                char v31 = 1;
                id v8 = v74;
                if (v30 != v74) {
                  continue;
                }
                break;
              }
            }
            else
            {
LABEL_29:
              ++*(_DWORD *)(v72 + 4 * v70);
            }
LABEL_30:
            ++v27;
          }
          while (v27 != v69);
        }
        if ((int)v8 < 1)
        {
          int v38 = 0;
          id v6 = v63;
          id v7 = v21;
        }
        else
        {
          int v38 = 0;
          int v39 = *(_DWORD *)v72;
          uint64_t v40 = 1;
          id v6 = v63;
          id v7 = v21;
          uint64_t v41 = v60;
          do
          {
            int v42 = *(_DWORD *)(v72 + 4 * v40);
            if (v42 <= v39)
            {
              if (v40 < v70 && v42 == v39)
              {
                long long v43 = [v7 objectAtIndexedSubscript:v38];
                int v44 = [v7 objectAtIndexedSubscript:v40];
                int v45 = [v44 trackID];
                if (v45 < (int)[v43 trackID])
                {
                  int v39 = *(_DWORD *)(v72 + 4 * v40);
                  int v38 = v40;
                }
              }
            }
            else
            {
              int v39 = *(_DWORD *)(v72 + 4 * v40);
              int v38 = v40;
            }
            ++v40;
          }
          while (v41 != v40);
        }
        id v8 = v74;
        if (v38 == v74)
        {
          int v46 = *(_DWORD *)v72;
          if ((int)v74 < 2)
          {
            int v47 = 0;
          }
          else
          {
            int v47 = 0;
            uint64_t v48 = 1;
            do
            {
              int v49 = *(_DWORD *)(v72 + 4 * v48);
              if (v49 <= v46)
              {
                if (v49 == v46)
                {
                  float32x2_t v50 = [v7 objectAtIndexedSubscript:v47];
                  float32x4_t v51 = [v7 objectAtIndexedSubscript:v48];
                  int v52 = [v51 trackID];
                  if (v52 < (int)[v50 trackID])
                  {
                    int v46 = *(_DWORD *)(v72 + 4 * v48);
                    int v47 = v48;
                  }
                }
              }
              else
              {
                int v46 = *(_DWORD *)(v72 + 4 * v48);
                int v47 = v48;
              }
              ++v48;
            }
            while (v68 != v48);
          }
          if (v74 && v46)
          {
            id v56 = [v7 objectAtIndexedSubscript:v47];
            id v57 = [v56 trackID];
            id v55 = v66;
            [v66 setTrackID:v57];
            objc_msgSend(v55, "setTrackedCnt:", objc_msgSend(v56, "trackedCnt") + 1);
          }
          else
          {
            float32x2_t v58 = v73;
            id v55 = v66;
            [v66 setTrackID:*(unsigned int *)v73->_estOpticalCenterOffset];
            [v55 setTrackedCnt:0];
            ++*(_DWORD *)v58->_estOpticalCenterOffset;
          }
          id v8 = v74;
        }
        else
        {
          int8x16_t v53 = [v7 objectAtIndexedSubscript:v38];
          id v54 = [v53 trackID];
          id v55 = v66;
          [v66 setTrackID:v54];
          objc_msgSend(v55, "setTrackedCnt:", objc_msgSend(v53, "trackedCnt") + 1);
        }
        uint64_t v19 = v67 + 1;
      }
      while ((id)(v67 + 1) != v64);
    }
    goto LABEL_62;
  }
  int8x16_t v12 = 0;
  while (1)
  {
    float32x2_t v13 = [v7 objectAtIndexedSubscript:v12];
    int v14 = [v13 trackIDsAfterMerge];
    int v15 = (char *)[v14 count];

    if ((unint64_t)v15 > *(void *)&self->_estOpticalCenterIsAvailable) {
      break;
    }
    if (v15)
    {
      for (i = 0; i != v15; ++i)
      {
        int v17 = [v13 trackIDsAfterMerge];
        char v18 = [v17 objectAtIndex:i];
        *((_DWORD *)&self->_repairWeightsGenerator->super.isa
        + (void)&i[(void)v12 * *(void *)&self->_estOpticalCenterIsAvailable]) = [v18 intValue];
      }
    }

    int8x16_t v12 = (char *)v12 + 1;
    id v8 = v74;
    if (v12 == v74) {
      goto LABEL_11;
    }
  }

  BOOL v10 = 0;
LABEL_63:

  return v10;
}

- (void)_findGhostsAndGenerateDescriptors:(VideoDeghostingDetectionV2 *)self LSList:(SEL)a2 LSDilation:(id *)a3 LSReflectCenter:(id)a4 desGenKeypointBuf:(float)a5 desGenMappingInfo:(__CVBuffer *)a6
{
  long long v30 = v7;
  double v9 = v6;
  id v13 = a4;
  *(_OWORD *)[(MTLBuffer *)self->_metalBuffers.desGenGhostsBuf contents] = v30;
  *(_DWORD *)[(MTLBuffer *)self->_metalBuffers.tinyGhostIdxBuf contents] = 0;
  metalToolBox = self->_metalToolBox;
  frameTMinus1Texture = self->_frameTMinus1Texture;
  localMotionReferenceTexture = self->_localMotionReferenceTexture;
  $470D365275581EF16070F5A11344F73E imageDimensions = self->_imageDimensions;
  [(VideoDeghostingDetectionV2 *)self params];
  v37[0] = v35;
  v37[1] = v36;
  HIDWORD(v29) = HIDWORD(self->_metalBuffers.reflectedLsBboxListBuf);
  HIDWORD(v28) = self->_metalBuffers.desGenMappingInfoBuf;
  LODWORD(v29) = 5120;
  LOBYTE(v28) = self->_isLocalMotionCueEnabled;
  *(float *)&double v18 = a5;
  uint64_t v19 = [(GGMMetalToolBox *)metalToolBox findGhostCandidatesFromDesGenAndTinyKeypointsFromInputTexture:frameTMinus1Texture ref4LocalMotionTexture:imageDimensions inputTPlus1Texture:localMotionReferenceTexture LSList:v13 desGenKeypoints:a6 homography:v37 colorParams:*(double *)&self->_localMotionRefHomography.confidence computeLocalMotion:*(double *)&self->_anon_124[12] LSDilation:*(double *)&self->_anon_124[28] LSReflectCenter:v18 maxLightSourceCount:v9 maxDesGenKeypoints:v28 maxTinyKeypoints:v29 metalBuffers:&self->_metalBuffers.desGenGhostIdxBuf isPrevLSFeaturesAvailable:&self->_isPrevLSFeaturesAvailable];
  id v20 = *a3;
  *a3 = v19;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = *a3;
  id v22 = [v21 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v32;
    int32x2_t v25 = vdup_n_s32(0x7F800000u);
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v27 generateLocationFromBBox];
        if (v27)
        {
          [v27 descriptor];
        }
        else
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
        }
        long long v58 = v47;
        long long v59 = v48;
        long long v60 = v49;
        long long v54 = v43;
        long long v55 = v44;
        long long v56 = v45;
        long long v57 = v46;
        long long v52 = v41;
        long long v53 = v42;
        v38[6] = v47;
        v38[7] = v48;
        v38[8] = v49;
        v38[2] = v43;
        v38[3] = v44;
        v38[4] = v45;
        v38[5] = v46;
        v38[0] = v41;
        v38[1] = v42;
        int32x2_t v39 = v25;
        int32x2_t v40 = v25;
        [v27 setDescriptor:v38];
        [v27 setTrackFail:0];
      }
      id v23 = [v21 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v23);
  }
}

- (void)_setLightSourceMotionForKeypoints:(id *)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *a3;
  id v3 = [obj countByEnumeratingWithState:&v27 objects:v55 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v22 = *(void *)v28;
    int32x2_t v5 = vdup_n_s32(0x7F800000u);
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v7 generateLocationFromBBox];
        if (v7)
        {
          [v7 descriptor];
          float32x2_t v8 = (float32x2_t)v53[16];
          long long v9 = 0uLL;
        }
        else
        {
          long long v9 = 0uLL;
          long long v54 = 0u;
          float32x2_t v8 = 0;
          memset(&v53[16], 0, 144);
        }
        long long v60 = *(_OWORD *)&v53[25];
        long long v61 = *(_OWORD *)&v53[27];
        long long v62 = *(_OWORD *)&v53[29];
        long long v63 = *(_OWORD *)&v53[31];
        long long v56 = *(_OWORD *)&v53[17];
        long long v57 = *(_OWORD *)&v53[19];
        long long v58 = *(_OWORD *)&v53[21];
        long long v59 = *(_OWORD *)&v53[23];
        long long v25 = v9;
        long long v26 = v9;
        long long v23 = v9;
        long long v24 = v9;
        BOOL v10 = [v7 matchedLS];
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v53 count:16];
        if (v11)
        {
          id v12 = v11;
          int v13 = 0;
          uint64_t v14 = *(void *)v24;
          float32x2_t v15 = 0;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v10);
              }
              int v17 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              if (v17)
              {
                [v17 descriptor];
                float32x2_t v18 = (float32x2_t)v43;
              }
              else
              {
                long long v51 = 0u;
                long long v52 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                float32x2_t v18 = 0;
                long long v43 = 0u;
                long long v44 = 0u;
              }
              float32x2_t v15 = vadd_f32(v15, vsub_f32(v8, v18));
            }
            v13 += (int)v12;
            id v12 = [v10 countByEnumeratingWithState:&v23 objects:v53 count:16];
          }
          while (v12);

          *(float *)v19.i32 = (float)v13;
          float32x2_t v20 = vdiv_f32(v15, (float32x2_t)vdup_lane_s32(v19, 0));
        }
        else
        {

          float32x2_t v20 = (float32x2_t)v5;
        }
        long long v36 = v60;
        long long v37 = v61;
        long long v38 = v62;
        long long v39 = v63;
        long long v32 = v56;
        long long v33 = v57;
        long long v34 = v58;
        long long v35 = v59;
        float32x2_t v31 = v8;
        float32x2_t v40 = v20;
        int32x2_t v41 = v5;
        int32x2_t v42 = v5;
        [v7 setDescriptor:&v31];
        [v7 setTrackFail:0];
      }
      id v4 = [obj countByEnumeratingWithState:&v27 objects:v55 count:16];
    }
    while (v4);
  }
}

- (id)deepCopyROIList:(id)a3 copyReferencedROI:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v13 = [ROI alloc];
        [v12 bbox];
        if (v12)
        {
          double v20 = v14;
          [v12 descriptor];
          double v14 = v20;
        }
        else
        {
          memset(v36, 0, sizeof(v36));
        }
        float32x2_t v15 = [(ROI *)v13 initWithBbox:v36 descriptor:v14];
        -[ROI setTrackID:](v15, "setTrackID:", [v12 trackID]);
        uint64_t v16 = [v12 LSTrackID];
        [(ROI *)v15 setLSTrackID:v16];

        -[ROI setIsTracked:](v15, "setIsTracked:", [v12 isTracked]);
        -[ROI setLSIsHighRisk:](v15, "setLSIsHighRisk:", [v12 LSIsHighRisk]);
        [v12 defaultOpticalCenter];
        -[ROI setDefaultOpticalCenter:](v15, "setDefaultOpticalCenter:");
        if (v12)
        {
          [v12 descriptor];
        }
        else
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
        }
        v25[6] = v32;
        v25[7] = v33;
        v25[8] = v34;
        v25[9] = v35;
        v25[2] = v28;
        v25[3] = v29;
        v25[4] = v30;
        v25[5] = v31;
        v25[0] = v26;
        v25[1] = v27;
        [(ROI *)v15 setDescriptor:v25];
        -[ROI setIsReflectedLS:](v15, "setIsReflectedLS:", [v12 isReflectedLS]);
        if (v4)
        {
          int v17 = [v12 LSTrackingMatched];
          [(ROI *)v15 setLSTrackingMatched:v17];

          float32x2_t v18 = [v12 temporalDetectionMatched];
          [(ROI *)v15 setTemporalDetectionMatched:v18];
        }
        [v6 addObject:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v37 count:16];
    }
    while (v9);
  }

  return v6;
}

- (int64_t)_detectionInit:(__CVBuffer *)a3 metaData:(id)a4 futureFrames:(id *)a5
{
  id v8 = a4;
  kdebug_trace();
  int v70 = 0;
  uint64_t v69 = 0;
  [(VideoDeghostingDetectionV2 *)self _resetDetectionResults];
  CVPixelBufferRelease(self->_frameTMinus2);
  self->_frameTMinus2 = self->_frameTMinus1;
  p_frameTPlus1Texture = (id *)&self->_frameTPlus1Texture;
  objc_storeStrong((id *)&self->_frameTPlus1Texture, self->_frameTMinus2Texture);
  self->_frameTMinus1 = self->_frameT;
  objc_storeStrong((id *)&self->_frameTMinus2Texture, self->_frameTMinus1Texture);
  CVPixelBufferRetain(a3);
  self->_frameT = a3;
  uint64_t v10 = [(GGMMetalToolBox *)self->_metalToolBox cvMetalTextureCacheRef];
  id v11 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
  sub_108B0(a3, v10, v11, 0, 1);
  id v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  frameTMinus1Texture = self->_frameTMinus1Texture;
  self->_frameTMinus1Texture = v12;

  if (!self->_frameTMinus1Texture)
  {
    int64_t v58 = 5;
    goto LABEL_37;
  }
  float32x4_t v62 = (float32x4_t)matrix_identity_float3x3.columns[1];
  float32x4_t v63 = (float32x4_t)matrix_identity_float3x3.columns[0];
  float32x4_t v60 = (float32x4_t)matrix_identity_float3x3.columns[2];
  if (a5->var2 < 2)
  {
    localMotionReferenceTexture = self->_localMotionReferenceTexture;
    self->_localMotionReferenceTexture = 0;
  }
  else
  {
    double v14 = *(__CVBuffer **)a5->var0;
    id v15 = *((id *)a5->var0 + 1);
    self->_frameTPlus1Buf = v14;
    uint64_t v16 = [(GGMMetalToolBox *)self->_metalToolBox cvMetalTextureCacheRef];
    int v17 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
    sub_108B0(v14, v16, v17, 0, 1);
    float32x2_t v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    int32x2_t v19 = self->_localMotionReferenceTexture;
    self->_localMotionReferenceTexture = v18;

    id v20 = v15;
    if (*(_DWORD *)&self->_configuration.externalCfg.drawBoundingBox)
    {
      *(float32x4_t *)&self->_hmgrphyTToTPlus1.confidence = v63;
      *(float32x4_t *)&self->_anon_164[12] = v62;
      *(float32x4_t *)&self->_anon_164[28] = v60;
      *(void *)&self->_anon_164[44] = 0;
      *(void *)&self->_anon_164[52] = 0;
    }
    else
    {
      calcTransform = self->_calcTransform;
      if (calcTransform)
      {
        [(CalcHomography *)calcTransform ispHomographyFromMetaInfo:v20];
      }
      else
      {
        long long v65 = 0u;
        memset(&v64, 0, sizeof(v64));
      }
      simd_float3 v23 = v64.columns[1];
      *(simd_float3 *)&self->_hmgrphyTToTPlus1.confidence = v64.columns[0];
      *(simd_float3 *)&self->_anon_164[12] = v23;
      long long v24 = v65;
      *(simd_float3 *)&self->_anon_164[28] = v64.columns[2];
      *(_OWORD *)&self->_anon_164[44] = v24;
    }
  }
  if (self->_frameTMinus1)
  {
    long long v25 = *(_OWORD *)&self->_anon_64[12];
    *(_OWORD *)&self->_hmgrphyTMinus2ToTMinus1.confidence = *(_OWORD *)&self->_hmgrphyTMinus1ToT.confidence;
    *(_OWORD *)&self->_anon_a4[12] = v25;
    long long v26 = *(_OWORD *)&self->_anon_64[44];
    *(_OWORD *)&self->_anon_a4[28] = *(_OWORD *)&self->_anon_64[28];
    *(_OWORD *)&self->_anon_a4[44] = v26;
    if (*(_DWORD *)&self->_configuration.externalCfg.drawBoundingBox)
    {
      *(float32x4_t *)&self->_hmgrphyTMinus1ToT.confidence = v63;
      *(float32x4_t *)&self->_anon_64[12] = v62;
      *(float32x4_t *)&self->_anon_64[28] = v60;
      *(_DWORD *)&self->_anon_64[44] = 0;
      *(void *)&self->_anon_64[48] = v69;
      *(_DWORD *)&self->_anon_64[56] = v70;
    }
    else
    {
      long long v27 = self->_calcTransform;
      if (v27)
      {
        [(CalcHomography *)v27 ispHomographyFromMetaInfo:v8];
      }
      else
      {
        long long v65 = 0u;
        memset(&v64, 0, sizeof(v64));
      }
      simd_float3 v28 = v64.columns[1];
      *(simd_float3 *)&self->_hmgrphyTMinus1ToT.confidence = v64.columns[0];
      *(simd_float3 *)&self->_anon_64[12] = v28;
      long long v29 = v65;
      *(simd_float3 *)&self->_anon_64[28] = v64.columns[2];
      *(_OWORD *)&self->_anon_64[44] = v29;
    }
  }
  if (self->_frameTMinus2)
  {
    unint64_t v30 = 0;
    float32x4_t v31 = *(float32x4_t *)&self->_hmgrphyTMinus2ToTMinus1.confidence;
    float32x4_t v32 = *(float32x4_t *)&self->_anon_a4[12];
    float32x4_t v33 = *(float32x4_t *)&self->_anon_a4[28];
    simd_float3 v34 = *(simd_float3 *)&self->_anon_64[12];
    simd_float3 v35 = *(simd_float3 *)&self->_anon_64[28];
    simd_float3 v66 = *(simd_float3 *)&self->_hmgrphyTMinus1ToT.confidence;
    simd_float3 v67 = v34;
    simd_float3 v68 = v35;
    memset(&v64, 0, sizeof(v64));
    do
    {
      v64.columns[v30 / 4] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)((char *)&v66 + v30 * 4))), v32, *(float32x2_t *)&v66.f32[v30], 1), v33, *(float32x4_t *)((char *)&v66 + v30 * 4), 2);
      v30 += 4;
    }
    while (v30 != 12);
    uint64_t v36 = v64.columns[0].i64[0];
    simd_float3 v37 = v64.columns[1];
    simd_float3 v38 = v64.columns[2];
    *(_DWORD *)&self->_anon_e4[4] = v64.columns[0].i32[2];
    *(void *)&self->_hmgrphyTMinus2ToT.confidence = v36;
    *(_DWORD *)&self->_anon_e4[20] = v37.i32[2];
    *(_DWORD *)&self->_anon_e4[36] = v38.i32[2];
    *(void *)&self->_anon_e4[12] = v37.i64[0];
    *(void *)&self->_anon_e4[28] = v38.i64[0];
    *(float *)&self->_anon_e4[44] = fminf(*(float *)&self->_anon_a4[44], *(float *)&self->_anon_64[44]);
  }
  if (!*p_frameTPlus1Texture)
  {
    if (a5->var2 < 2)
    {
      objc_storeStrong((id *)&self->_imageDimensions, self->_frameTMinus1Texture);
      *(float32x4_t *)&self->_localMotionRefHomography.confidence = v63;
      *(float32x4_t *)&self->_anon_124[12] = v62;
      *(float32x4_t *)&self->_anon_124[28] = v60;
      *(_DWORD *)&self->_anon_124[44] = 0;
      *(_DWORD *)&self->_anon_124[56] = v70;
      *(void *)&self->_anon_124[48] = v69;
      self->_isLocalMotionCueEnabled = 0;
      goto LABEL_36;
    }
    id v41 = *((id *)a5->var0 + 1);
    int32x2_t v42 = (__CVBuffer *)*((void *)a5->var0 + 2);
    id v43 = *((id *)a5->var0 + 3);
    self->_frameTPlus2Buf = v42;
    id v44 = v41;
    id v45 = v43;
    float v46 = 0.0;
    float v47 = 0.0;
    simd_float3 v48 = (simd_float3)v60;
    simd_float3 v49 = (simd_float3)v62;
    simd_float3 v50 = (simd_float3)v63;
    if (!*(_DWORD *)&self->_configuration.externalCfg.drawBoundingBox)
    {
      long long v51 = self->_calcTransform;
      if (v51)
      {
        -[CalcHomography ispHomographyFromMetaInfo:](v51, "ispHomographyFromMetaInfo:", v44, *(double *)v60.i64, *(double *)v62.i64, *(double *)v63.i64);
        float32x4_t v62 = (float32x4_t)v64.columns[1];
        float32x4_t v63 = (float32x4_t)v64.columns[0];
        float32x4_t v60 = (float32x4_t)v64.columns[2];
        float v46 = *(float *)&v65;
        long long v52 = self->_calcTransform;
        if (v52)
        {
          [(CalcHomography *)v52 ispHomographyFromMetaInfo:v45];
          simd_float3 v50 = v64.columns[0];
          simd_float3 v49 = v64.columns[1];
          simd_float3 v48 = v64.columns[2];
          float v47 = *(float *)&v65;
          goto LABEL_33;
        }
        simd_float3 v48 = 0uLL;
      }
      else
      {
        simd_float3 v48 = 0uLL;
        float32x4_t v62 = 0u;
        float32x4_t v63 = 0u;
        float32x4_t v60 = 0u;
      }
      simd_float3 v49 = 0uLL;
      simd_float3 v50 = 0uLL;
    }
LABEL_33:
    unint64_t v53 = 0;
    simd_float3 v66 = v50;
    simd_float3 v67 = v49;
    simd_float3 v68 = v48;
    memset(&v64, 0, sizeof(v64));
    do
    {
      v64.columns[v53 / 4] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)((char *)&v66 + v53 * 4))), v62, *(float32x2_t *)&v66.f32[v53], 1), v60, *(float32x4_t *)((char *)&v66 + v53 * 4), 2);
      v53 += 4;
    }
    while (v53 != 12);
    simd_float3x3 v61 = __invert_f3(v64);
    frameTPlus2Buf = self->_frameTPlus2Buf;
    long long v55 = [(GGMMetalToolBox *)self->_metalToolBox metalContext];
    uint64_t v56 = sub_10550(frameTPlus2Buf, v55, 0, 1);
    $470D365275581EF16070F5A11344F73E imageDimensions = (void *)self->_imageDimensions;
    self->_$470D365275581EF16070F5A11344F73E imageDimensions = ($470D365275581EF16070F5A11344F73E)v56;

    *(_DWORD *)&self->_anon_124[4] = v61.columns[0].i32[2];
    *(_DWORD *)&self->_anon_124[20] = v61.columns[1].i32[2];
    *(void *)&self->_localMotionRefHomography.confidence = v61.columns[0].i64[0];
    *(void *)&self->_anon_124[12] = v61.columns[1].i64[0];
    *(_DWORD *)&self->_anon_124[36] = v61.columns[2].i32[2];
    *(void *)&self->_anon_124[28] = v61.columns[2].i64[0];
    *(float *)&self->_anon_124[44] = fminf(v46, v47);
    *(_DWORD *)&self->_anon_124[56] = 0;
    *(void *)&self->_anon_124[48] = 0;
    self->_isLocalMotionCueEnabled = 1;

    goto LABEL_36;
  }
  objc_storeStrong((id *)&self->_imageDimensions, *p_frameTPlus1Texture);
  long long v39 = *(_OWORD *)&self->_anon_e4[12];
  *(_OWORD *)&self->_localMotionRefHomography.confidence = *(_OWORD *)&self->_hmgrphyTMinus2ToT.confidence;
  *(_OWORD *)&self->_anon_124[12] = v39;
  long long v40 = *(_OWORD *)&self->_anon_e4[44];
  *(_OWORD *)&self->_anon_124[28] = *(_OWORD *)&self->_anon_e4[28];
  *(_OWORD *)&self->_anon_124[44] = v40;
  self->_isLocalMotionCueEnabled = 1;
LABEL_36:
  kdebug_trace();
  int64_t v58 = 0;
LABEL_37:

  return v58;
}

- (BOOL)_shouldRunGGDetectionLSBased:(int)a3
{
  if (!HIBYTE(self->_params.lightSourceGatingThresholdOFF)) {
    return 1;
  }
  if (BYTE1(self->_trackID)) {
    BOOL v3 = self->_params.luxLevelGatingThresholdOFF < a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    return 0;
  }
  if (BYTE1(self->_trackID)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = self->_params.luxLevelGatingThresholdON <= a3;
  }
  return !v4;
}

- (BOOL)_shouldRunGGDetectionLuxLevelBased:(int)a3
{
  if (!LOBYTE(self->_params.lightSourceSelectionCntLimitNew)) {
    return 1;
  }
  if (BYTE2(self->_trackID)) {
    BOOL v3 = self->_params.maxAllowedSizeBBox < a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    return 0;
  }
  if (BYTE2(self->_trackID)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = SLODWORD(self->_params.searchRangeBaseForPreprocessing) <= a3;
  }
  return !v4;
}

- (BOOL)_shouldRunGGDetectionClippedPixelBased:(float)a3
{
  if (!BYTE1(self->_params.lightSourceSelectionCntLimitNew)) {
    return 1;
  }
  int trackID_high = HIBYTE(self->_trackID);
  int maxAllowedOpticalCenterOffset = self->_params.maxAllowedOpticalCenterOffset;
  if (HIBYTE(self->_trackID))
  {
    BOOL v5 = *(float *)&maxAllowedOpticalCenterOffset == a3;
    BOOL v6 = *(float *)&maxAllowedOpticalCenterOffset < a3;
  }
  else
  {
    BOOL v5 = 1;
    BOOL v6 = 0;
  }
  if (v6 || v5)
  {
    if ((float)(*(float *)&maxAllowedOpticalCenterOffset + 4.0) < a3) {
      int trackID_high = 1;
    }
  }
  else
  {
    int trackID_high = 0;
  }
  return trackID_high != 0;
}

- (id)predictPastReflectedLSInCurrentFrame:(id)a3 currentFrameLSList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 LSTrackID];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v43 objects:v79 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v44;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
      id v15 = [v14 LSTrackID];

      if (v15 == v8) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v43 objects:v79 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v17 = v14;

    if (!v17)
    {
      uint64_t v16 = 0;
      goto LABEL_38;
    }
    if ((int)[v6 lowSaliencyCnt] > 9)
    {
      [v17 setLsHasBeenUsedForTrackingGhost:0];
      long long v29 = [v17 LSTrackingMatched];
      [v29 setLsHasBeenUsedForTrackingGhost:0];

      uint64_t v16 = 0;
      goto LABEL_37;
    }
    float32x2_t v18 = [ROI alloc];
    [v17 getReflectedBboxAroundCenter:*(double *)&self->_prevDefaultOpticalCenter[4]];
    uint64_t v16 = -[ROI initWithBbox:](v18, "initWithBbox:");
    [(ROI *)v16 setDoneKPToBBoxViaGraphTraversal:1];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    if (v16) {
      [(ROI *)v16 descriptor];
    }
    [v17 lumaFeatureVectorReflection];
    long long v75 = v41;
    long long v76 = v42;
    long long v73 = v39;
    long long v74 = v40;
    LODWORD(v77) = 32;
    v68[2] = v71;
    v68[3] = v72;
    v68[0] = v69;
    v68[1] = v70;
    v68[8] = v77;
    v68[9] = v78;
    v68[6] = v41;
    v68[7] = v42;
    v68[4] = v39;
    v68[5] = v40;
    [(ROI *)v16 setDescriptor:v68];
    [v6 getPixelFeatureMatchCostWith:v16];
    float v20 = v19;
    [v17 differenceOfGaussianAndLumaFeatureReflection];
    BOOL v22 = 0;
    if (v20 < 0.04 && *(float *)&v21 >= 0.001) {
      BOOL v22 = *((float *)&v21 + 1) >= 0.1;
    }
    [(ROI *)v16 bbox];
    float32x4_t v36 = v23;
    [(ROI *)v16 bbox];
    __int8 v25 = vmovn_s32(vcgtq_f32((float32x4_t)vdupq_laneq_s32(v24, 3), v36)).i8[4];
    [(ROI *)v16 bbox];
    BOOL v27 = 0;
    char v28 = 2;
    if ((v25 & 1) == 0) {
      char v28 = 3;
    }
    long long v38 = v26;
    *(float *)&long long v26 = (float)(1.0
                           - fminf(fmaxf((float)(*(float *)((unint64_t)&v38 & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3)))+ -20.0)/ 5.0, 0.0), 1.0))* 0.1;
    if (v20 < *(float *)&v26)
    {
      *(void *)&long long v26 = v35;
      if (*(float *)&v35 >= 0.04)
      {
        LODWORD(v26) = HIDWORD(v35);
        BOOL v27 = *((float *)&v35 + 1) >= 0.5;
      }
    }
    if (v22 || v27)
    {
      -[ROI setLowSaliencyCnt:](v16, "setLowSaliencyCnt:", 0, *(double *)&v26);
      if (v20 < 0.04)
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        if (v6) {
          [v6 descriptor];
        }
        if (v16)
        {
          [(ROI *)v16 descriptor];
        }
        else
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
        }
        long long v75 = v54;
        long long v76 = v55;
        long long v77 = v56;
        long long v78 = v57;
        long long v71 = v50;
        long long v72 = v51;
        long long v73 = v52;
        long long v74 = v53;
        long long v69 = v48;
        long long v70 = v49;
        [(VDGDetectionUtilsV2 *)self->_detectionUtils updateNewRoiPixFea:&v73 withRefPixFea:&v62];
        if (!v16) {
          goto LABEL_35;
        }
        goto LABEL_32;
      }
    }
    else
    {
      -[ROI setLowSaliencyCnt:](v16, "setLowSaliencyCnt:", objc_msgSend(v6, "lowSaliencyCnt", *(double *)&v26) + 1);
    }
    if (!v16)
    {
LABEL_35:
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      goto LABEL_36;
    }
LABEL_32:
    [(ROI *)v16 descriptor];
LABEL_36:
    long long v75 = v64;
    long long v76 = v65;
    long long v77 = v66;
    long long v78 = v67;
    long long v71 = v60;
    long long v72 = v61;
    long long v73 = v62;
    long long v74 = v63;
    long long v69 = v58;
    long long v70 = v59;
    [(ROI *)v16 bbox];
    float32x2_t v37 = v30;
    [(ROI *)v16 bbox];
    *(float32x2_t *)&long long v69 = vadd_f32(v37, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL), (float32x2_t)0x3F0000003F000000));
    v47[6] = v75;
    v47[7] = v76;
    v47[8] = v77;
    v47[9] = v78;
    v47[2] = v71;
    v47[3] = v72;
    v47[4] = v73;
    v47[5] = v74;
    v47[0] = v69;
    v47[1] = v70;
    [(ROI *)v16 setDescriptor:v47];
    [(ROI *)v16 setIsReflectedLS:1];
    [(ROI *)v16 setIsTracked:1];
    -[ROI setTrackedCnt:](v16, "setTrackedCnt:", [v6 trackedCnt] + 1);
    -[ROI setTrackID:](v16, "setTrackID:", [v6 trackID]);
    [(ROI *)v16 setTemporalDetectionMatched:v6];
    [(ROI *)v16 setIsPredictedFromPast:1];
    -[ROI setPredictedFromPastCnt:](v16, "setPredictedFromPastCnt:", [v6 predictedFromPastCnt] + 1);
    -[ROI setIsTrajectoryPruningPassed:](v16, "setIsTrajectoryPruningPassed:", [v6 isTrajectoryPruningPassed]);
    float32x4_t v32 = [v6 LSTrackID];
    [(ROI *)v16 setLSTrackID:v32];

    [(ROI *)v16 setLsHasBeenUsedForTrackingGhost:1];
    [v17 setLsHasBeenUsedForTrackingGhost:1];
    float32x4_t v33 = [v17 LSTrackingMatched];
    [v33 setLsHasBeenUsedForTrackingGhost:1];

    goto LABEL_37;
  }
LABEL_9:
  uint64_t v16 = 0;
  id v17 = v9;
LABEL_37:

LABEL_38:

  return v16;
}

- (void)_allocateLightSourceBuffers:(int64_t)a3
{
  if (*(void *)&self->_lsDilation4Preprocessing < a3)
  {
    *(void *)&self->_lsDilation4Preprocessing = a3;
    free(*(void **)&self->_arrayOfLightSourceBBox[4]);
    free(*(void **)&self->_reflectedDilatedLsForTracking[4]);
    free(*(void **)&self->_reflectedDilatedLs[4]);
    size_t v5 = 16 * a3;
    id v6 = malloc_type_malloc(v5, 0x1000040451B5BE8uLL);
    *(void *)&self->_arrayOfLightSourceBBox[4] = v6;
    if (!v6
      || (id v7 = malloc_type_malloc(v5, 0x1000040451B5BE8uLL),
          (*(void *)&self->_reflectedDilatedLsForTracking[4] = v7) == 0)
      || (id v8 = malloc_type_malloc(v5, 0x1000040451B5BE8uLL), (*(void *)&self->_reflectedDilatedLs[4] = v8) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)getDilationCoefsAndReflectedDilatedLsList:(id)a3
{
  id v4 = a3;
  [(VideoDeghostingDetectionV2 *)self params];
  float v5 = v26 * *(float *)&self->_estimatedOpticalCenter.x;
  unsigned int v6 = [(VideoDeghostingDetectionV2 *)self estOpticalCenterIsAvailable];
  float v7 = 1.0;
  LODWORD(v8) = 1.0;
  if (v6)
  {
    [(VideoDeghostingDetectionV2 *)self params];
    LODWORD(v8) = v25;
  }
  float v9 = v5 * *(float *)&v8;
  self->_float lsDilation = v9;
  *(float *)self->_reflectedDilatedLsForPreprocessing = v9 * 3.0;
  [(VideoDeghostingDetectionV2 *)self params];
  float v10 = v24 * *(float *)&self->_estimatedOpticalCenter.x;
  if ([(VideoDeghostingDetectionV2 *)self estOpticalCenterIsAvailable])
  {
    [(VideoDeghostingDetectionV2 *)self params];
    float v7 = v23;
  }
  *(float *)&self->_reflectedDilatedLsForPreprocessing[4] = v10 * v7;
  -[VideoDeghostingDetectionV2 _allocateLightSourceBuffers:](self, "_allocateLightSourceBuffers:", (int)[v4 count]);
  if ([v4 count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      uint64_t v13 = [v4 objectAtIndexedSubscript:v11];
      [v13 getReflectedBboxAroundCenter:*(double *)&self->_prevDefaultOpticalCenter[4]];
      float32x2_t v15 = vadd_f32(*(float32x2_t *)v14.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
      uint64_t v16 = (const float *)&self->_reflectedDilatedLsForPreprocessing[4];
      float32x2_t v17 = vld1_dup_f32(v16);
      *(float32x2_t *)v18.f32 = vsub_f32(*(float32x2_t *)v14.i8, v17);
      *(float32x2_t *)&v18.u32[2] = vadd_f32(v15, v17);
      *(int32x4_t *)(*(void *)&self->_arrayOfLightSourceBBox[4] + 16 * v11) = vcvtq_s32_f32(v18);
      p_float lsDilation = &self->_lsDilation;
      float32x2_t v20 = vld1_dup_f32(p_lsDilation);
      *(float32x2_t *)v18.f32 = vsub_f32(*(float32x2_t *)v14.i8, v20);
      *(float32x2_t *)&v18.u32[2] = vadd_f32(v15, v20);
      *(int32x4_t *)(*(void *)&self->_reflectedDilatedLsForTracking[4] + 16 * v11) = vcvtq_s32_f32(v18);
      int32x2_t v21 = vdup_n_s32((int)*(float *)self->_reflectedDilatedLsForPreprocessing);
      *(int32x2_t *)v14.i8 = vsub_s32(vcvt_s32_f32(*(float32x2_t *)v14.i8), v21);
      v14.u64[1] = (unint64_t)vadd_s32(v21, vcvt_s32_f32(v15));
      *(int8x16_t *)(*(void *)&self->_reflectedDilatedLs[4] + 16 * v11) = v14;

      uint64_t v11 = v12;
    }
    while ((unint64_t)[v4 count] > v12++);
  }
}

- (void)pruneUsingLSRisk:(id)a3
{
  id v4 = a3;
  float v5 = +[NSMutableArray array];
  if ([v4 count])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    do
    {
      double v8 = [v4 objectAtIndexedSubscript:v6];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      float v9 = objc_msgSend(v8, "matchedLS", 0);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v54 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v20 + 1) + 8 * i) LSIsHighRisk])
            {

              if (v8)
              {
                [v8 descriptor];
                LODWORD(v14) = HIDWORD(v44);
                BOOL v15 = *((float *)&v44 + 3) >= self->_params.repairParams.repairTargetGhostCntLo;
                objc_msgSend(v8, "descriptor", v14);
                LODWORD(v16) = v36;
                if (*(float *)&v36 < self->_params.repairParams.repairTargetGhostCntHi) {
                  BOOL v15 = 0;
                }
                objc_msgSend(v8, "descriptor", v16);
                LODWORD(v17) = v27;
              }
              else
              {
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                BOOL v18 = self->_params.repairParams.repairTargetGhostCntLo <= 0.0;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                BOOL v15 = self->_params.repairParams.repairTargetGhostCntHi <= 0.0 && v18;
                long long v24 = 0uLL;
                long long v25 = 0uLL;
                long long v26 = 0uLL;
                long long v27 = 0uLL;
                long long v28 = 0uLL;
                long long v29 = 0uLL;
                long long v30 = 0uLL;
                long long v31 = 0uLL;
                double v17 = 0.0;
                long long v32 = 0uLL;
                long long v33 = 0uLL;
              }
              if (!v15 || *(float *)&v17 < *((float *)&self->_params + 43)) {
                objc_msgSend(v5, "addObject:", v8, v17);
              }
              goto LABEL_26;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v54 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

LABEL_26:
      uint64_t v6 = ++v7;
    }
    while ((unint64_t)[v4 count] > v7);
  }
  [v4 removeObjectsInArray:v5];
}

- (void)_trackLightSources:(id *)a3
{
  prevLSLists = self->_prevLSLists;
  if (!prevLSLists)
  {
    uint64_t v6 = +[NSMutableArray array];
    unsigned int v7 = self->_prevLSLists;
    self->_prevLSLists = v6;

    prevLSLists = self->_prevLSLists;
  }
  if ([(NSMutableArray *)prevLSLists count] == (char *)&dword_0 + 1)
  {
    [(VideoDeghostingDetectionV2 *)self _trackCurrentLSList:a3];
    [(NSMutableArray *)self->_prevLSLists removeObjectAtIndex:0];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *a3;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
          double v14 = +[NSString stringWithFormat:@"%d", *(unsigned int *)&self->_estOpticalCenterOffset[4]];
          [v13 setLSTrackID:v14];

          ++*(_DWORD *)&self->_estOpticalCenterOffset[4];
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  [(VDGDetectionUtilsV2 *)self->_detectionUtils generateTrajectoryForROIList:*a3 isGG:0];
  [(NSMutableArray *)self->_prevLSLists addObject:*a3];
  self->_isPrevLSFeaturesAvailable = 0;
}

- (ROI)matchPrevLS:(double)a3 prevToCurrentHomography:(double)a4 againstCurrentLSList:(float)a5 avoidList:(uint64_t)a6 searchRadius:(void *)a7
{
  id v13 = a7;
  id v14 = a8;
  id v15 = a9;
  objc_msgSend(*(id *)(a1 + 8), "predictPrevLSLocation:usingPrevToCurrentHomography:", v13, a2, a3, a4);
  float32x2_t v17 = v16;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v18 = v14;
  id v19 = [v18 countByEnumeratingWithState:&v71 objects:v107 count:16];
  if (!v19)
  {

LABEL_19:
    [v13 bbox];
    long long v48 = [[ROI alloc] initWithBbox:COERCE_DOUBLE(vadd_f32(v17, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL), (float32x2_t)0xBF000000BF000000)))];
    [(ROI *)v48 setDoneKPToBBoxViaGraphTraversal:1];
    long long v49 = 0uLL;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    if (v48)
    {
      [(ROI *)v48 descriptor];
      long long v49 = 0uLL;
    }
    if (v13)
    {
      [v13 lumaFeatureVectorPredictedLocation];
      long long v51 = v69;
      long long v50 = v70;
      long long v49 = v67;
      long long v52 = v68;
    }
    else
    {
      long long v52 = 0uLL;
      long long v51 = 0uLL;
      long long v50 = 0uLL;
    }
    long long v91 = v49;
    long long v92 = v52;
    long long v93 = v51;
    long long v94 = v50;
    LODWORD(v95) = 32;
    v86[2] = v89;
    v86[3] = v90;
    v86[0] = v87;
    v86[1] = v88;
    v86[8] = v95;
    v86[9] = v96;
    v86[4] = v49;
    v86[5] = v52;
    v86[6] = v51;
    v86[7] = v50;
    [(ROI *)v48 setDescriptor:v86];
    [v13 getPixelFeatureMatchCostWith:v48];
    if (v53 <= 0.01)
    {
      if (v48)
      {
        [(ROI *)v48 descriptor];
      }
      else
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
      }
      long long v93 = v82;
      long long v94 = v83;
      long long v95 = v84;
      long long v96 = v85;
      long long v89 = v78;
      long long v90 = v79;
      long long v91 = v80;
      long long v92 = v81;
      long long v87 = v76;
      long long v88 = v77;
      [(ROI *)v48 bbox];
      float32x2_t v66 = v54;
      [(ROI *)v48 bbox];
      *(float32x2_t *)&long long v87 = vadd_f32(v66, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v55, v55, 8uLL), (float32x2_t)0x3F0000003F000000));
      v75[6] = v93;
      v75[7] = v94;
      v75[8] = v95;
      v75[9] = v96;
      v75[2] = v89;
      v75[3] = v90;
      v75[4] = v91;
      v75[5] = v92;
      v75[0] = v87;
      v75[1] = v88;
      [(ROI *)v48 setDescriptor:v75];
      long long v56 = [v18 firstObject];
      [v56 defaultOpticalCenter];
      -[ROI setDefaultOpticalCenter:](v48, "setDefaultOpticalCenter:");

      long long v21 = v48;
    }
    else
    {
      long long v21 = 0;
    }

    goto LABEL_31;
  }
  id v20 = v19;
  long long v21 = 0;
  uint64_t v22 = *(void *)v72;
  float v23 = INFINITY;
  float32x2_t v24 = (float32x2_t)vdup_n_s32(0x3DCCCCCDu);
  __asm { FMOV            V11.2S, #10.0 }
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v72 != v22) {
        objc_enumerationMutation(v18);
      }
      long long v31 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      if (([v15 containsObject:v31] & 1) == 0)
      {
        if (v31)
        {
          [v31 descriptor];
          float32x2_t v32 = (float32x2_t)v97;
        }
        else
        {
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          float32x2_t v32 = 0;
          long long v97 = 0u;
          long long v98 = 0u;
        }
        float32x2_t v33 = vsub_f32(v17, v32);
        float v34 = sqrtf(vaddv_f32(vmul_f32(v33, v33)));
        [v31 bbox];
        int8x16_t v65 = v35;
        [v13 bbox];
        int8x16_t v63 = v36;
        [v31 bbox];
        float32x4_t v61 = v37;
        [v13 bbox];
        float32x4_t v59 = v38;
        [v31 bbox];
        int8x16_t v58 = v39;
        [v13 bbox];
        if (v34 <= a5)
        {
          float32x2_t v41 = vabd_f32((float32x2_t)*(_OWORD *)&vextq_s8(v65, v65, 8uLL), (float32x2_t)*(_OWORD *)&vextq_s8(v63, v63, 8uLL));
          int8x16_t v42 = (int8x16_t)vcgtq_f32(v59, v61);
          float32x2_t v43 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v58, v58, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)), v24);
          uint32x2_t v44 = (uint32x2_t)vcge_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D11, v43), (int8x8_t)_D11, (int8x8_t)v43), v41);
          if ((vpmin_u32(v44, v44).u32[0] & 0x80000000) != 0)
          {
            float v45 = fmaxf(v41.f32[0], v41.f32[1]);
            if (v45 < v23)
            {
              long long v46 = v31;

              long long v21 = v46;
              float v23 = v45;
            }
          }
        }
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v71 objects:v107 count:16];
  }
  while (v20);

  if (!v21) {
    goto LABEL_19;
  }
LABEL_31:

  return v21;
}

- (void)_trackCurrentLSList:(id *)a3
{
  long long v87 = +[NSMutableArray array];
  int v5 = [(NSMutableArray *)self->_prevLSLists count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    do
    {
      uint64_t v84 = v6;
      uint64_t v82 = v6 - 1;
      unsigned int v7 = [(NSMutableArray *)self->_prevLSLists objectAtIndex:(v6 - 1)];
      id v8 = +[NSMutableArray array];
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v117 objects:v124 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v118;
        do
        {
          id v13 = 0;
          __int32 v14 = *(_DWORD *)&obj[12];
          __int32 v15 = *(_DWORD *)&obj[28];
          __int32 v16 = *(_DWORD *)&obj[44];
          do
          {
            __int32 obj_12 = v16;
            __int32 v94 = v15;
            __int32 v99 = v14;
            if (*(void *)v118 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v17 = *(void *)(*((void *)&v117 + 1) + 8 * (void)v13);
            simd_float3x3 v125 = __invert_f3(*(simd_float3x3 *)&self->_hmgrphyTMinus1ToT.confidence);
            v125.columns[0].i32[3] = v99;
            v125.columns[1].i32[3] = v94;
            v125.columns[2].i32[3] = obj_12;
            *(simd_float3x3 *)id obj = v125;
            id v18 = -[VideoDeghostingDetectionV2 matchPrevLS:prevToCurrentHomography:againstCurrentLSList:avoidList:searchRadius:](self, "matchPrevLS:prevToCurrentHomography:againstCurrentLSList:avoidList:searchRadius:", v17, *a3, v8);
            id v19 = v18;
            if (v18)
            {
              objc_msgSend(v18, "setLSTrackingVote:", objc_msgSend(v18, "LSTrackingVote") + 1);
              [v8 addObject:v19];
              if (([*a3 containsObject:v19] & 1) == 0) {
                [v87 addObject:v19];
              }
              [v19 setLSTrackingMatched:v17];
            }

            id v13 = (char *)v13 + 1;
            __int32 v14 = *(_DWORD *)&obj[12];
            __int32 v15 = *(_DWORD *)&obj[28];
            __int32 v16 = *(_DWORD *)&obj[44];
          }
          while (v11 != v13);
          id v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v117, v124, 16, *(double *)obj, *(double *)&obj[16], *(double *)&obj[32]);
        }
        while (v11);
      }

      uint64_t v6 = v82;
    }
    while (v84 > 1);
  }
  [*a3 addObjectsFromArray:v87];
  long long v81 = +[NSMutableArray array];
  if ([*a3 count])
  {
    unint64_t v20 = 0;
    do
    {
      long long v21 = [*a3 objectAtIndexedSubscript:v20];
      signed int v22 = [v21 LSTrackingVote];
      [(VideoDeghostingDetectionV2 *)self params];
      if (v22 < v116)
      {
        [v21 bbox];
        float v95 = v23;
        [v21 bbox];
        float obj_4 = v24;
        [v21 bbox];
        float v86 = v25;
        long long v92 = v21;
        [v21 bbox];
        float32x4_t v83 = v26;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v27 = *a3;
        id v28 = [v27 countByEnumeratingWithState:&v112 objects:v123 count:16];
        if (v28)
        {
          id v29 = v28;
          double v30 = v95;
          uint64_t v31 = *(void *)v113;
          double v96 = vmuls_lane_f32(v86, v83, 3);
          float v32 = 0.0;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v113 != v31) {
                objc_enumerationMutation(v27);
              }
              float v34 = *(void **)(*((void *)&v112 + 1) + 8 * i);
              signed int v35 = [v34 LSTrackingVote];
              [(VideoDeghostingDetectionV2 *)self params];
              if (v35 >= v111)
              {
                [v34 bbox];
                CGFloat v37 = v36;
                [v34 bbox];
                CGFloat v39 = v38;
                [v34 bbox];
                CGFloat v41 = v40;
                [v34 bbox];
                v128.size.double height = v42;
                v126.origin.x = v30;
                v126.origin.y = obj_4;
                v126.size.double width = v86;
                v126.size.double height = v83.f32[3];
                v128.origin.x = v37;
                v128.origin.y = v39;
                v128.size.double width = v41;
                CGRect v127 = CGRectIntersection(v126, v128);
                double width = v127.size.width;
                double height = v127.size.height;
                if (!CGRectIsNull(v127))
                {
                  double v45 = width * height / v96;
                  if (v45 >= v32) {
                    float v32 = v45;
                  }
                }
              }
            }
            id v29 = [v27 countByEnumeratingWithState:&v112 objects:v123 count:16];
          }
          while (v29);
        }
        else
        {
          float v32 = 0.0;
        }

        long long v21 = v92;
        if (v32 >= 0.8) {
          objc_msgSend(v81, "addObject:", v92, v32);
        }
      }

      ++v20;
    }
    while ((unint64_t)[*a3 count] > v20);
  }
  long long v46 = +[NSMutableArray array];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v47 = *a3;
  id v48 = [v47 countByEnumeratingWithState:&v107 objects:v122 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v108;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v108 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = *(void **)(*((void *)&v107 + 1) + 8 * (void)j);
        signed int v53 = [v52 LSTrackingVote];
        [(VideoDeghostingDetectionV2 *)self params];
        if (v53 >= v106) {
          [v46 addObject:v52];
        }
      }
      id v49 = [v47 countByEnumeratingWithState:&v107 objects:v122 count:16];
    }
    while (v49);
  }

  [(VDGDetectionUtilsV2 *)self->_detectionUtils removeRedundantLS:v46];
  if ([*a3 count])
  {
    unint64_t v54 = 0;
    do
    {
      int8x16_t v55 = [*a3 objectAtIndexedSubscript:v54];
      signed int v56 = [v55 LSTrackingVote];
      [(VideoDeghostingDetectionV2 *)self params];
      if (v56 >= v105 && ([v46 containsObject:v55] & 1) == 0) {
        [v81 addObject:v55];
      }

      ++v54;
    }
    while ((unint64_t)[*a3 count] > v54);
  }
  long long v85 = v46;
  [*a3 removeObjectsInArray:v81];
  long long v57 = +[NSMutableArray array];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obja = *a3;
  id v58 = [obja countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v102;
    __asm { FMOV            V8.2S, #10.0 }
    float32x2_t v66 = (float32x2_t)vdup_n_s32(0x3F333333u);
    float32x2_t v67 = (float32x2_t)vdup_n_s32(0x3E99999Au);
    do
    {
      for (k = 0; k != v59; k = (char *)k + 1)
      {
        if (*(void *)v102 != v60) {
          objc_enumerationMutation(obja);
        }
        long long v69 = *(void **)(*((void *)&v101 + 1) + 8 * (void)k);
        signed int v70 = [v69 LSTrackingVote];
        [(VideoDeghostingDetectionV2 *)self params];
        if (v70 >= v100)
        {
          [v57 addObject:v69];
          long long v73 = [v69 LSTrackingMatched];
          if (v73)
          {
            [v69 setIsTracked:1];
            long long v74 = [v73 LSTrackID];
            [v69 setLSTrackID:v74];

            [v69 bbox];
            float32x2_t v97 = (float32x2_t)vextq_s8(v75, v75, 8uLL).u64[0];
            [v73 bbox];
            float32x2_t v98 = vmla_f32(vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v76, v76, 8uLL), v66), v67, v97);
            [v69 bbox];
            float32x2_t v93 = v77;
            [v69 bbox];
            objc_msgSend(v69, "setBbox:", COERCE_DOUBLE(vadd_f32(v93, vmul_f32(vsub_f32(v98, (float32x2_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL)), (float32x2_t)0xBF000000BF000000))));
          }
          else
          {
            [v69 setIsTracked:0];
            long long v79 = +[NSString stringWithFormat:@"%d", *(unsigned int *)&self->_estOpticalCenterOffset[4]];
            [v69 setLSTrackID:v79];

            ++*(_DWORD *)&self->_estOpticalCenterOffset[4];
          }
        }
        else
        {
          [v69 setIsTracked:0];
          [v69 bbox];
          *(int32x2_t *)v71.i8 = vcge_f32((float32x2_t)*(_OWORD *)&vextq_s8(v71, v71, 8uLL), _D8);
          if ((vpmin_u32(*(uint32x2_t *)v71.i8, *(uint32x2_t *)v71.i8).u32[0] & 0x80000000) != 0)
          {
            [v57 addObject:v69];
            long long v72 = +[NSString stringWithFormat:@"%d", *(unsigned int *)&self->_estOpticalCenterOffset[4]];
            [v69 setLSTrackID:v72];

            ++*(_DWORD *)&self->_estOpticalCenterOffset[4];
          }
        }
      }
      id v59 = [obja countByEnumeratingWithState:&v101 objects:v121 count:16];
    }
    while (v59);
  }

  id v80 = *a3;
  *a3 = v57;
}

- (void)_trackGhosts:(id *)a3 ghostCandidates:(id *)a4 LSList:(id)a5
{
  id v8 = a5;
  kdebug_trace();
  if ([(MTLTexture *)self->_inputTexture count] == (char *)&dword_0 + 1)
  {
    [(VideoDeghostingDetectionV2 *)self _temporalDetectionCurrentGGList:a3 rawKeyPointList:a4 LSList:v8];
    [(MTLTexture *)self->_inputTexture removeObjectAtIndex:0];
  }
  else
  {
    [(VideoDeghostingDetectionV2 *)self pruneUsingLSRisk:*a3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = *a3;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setTrackID:", (*(_DWORD *)&self->_estOpticalCenter[4])++, (void)v14);
        }
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  -[VDGDetectionUtilsV2 generateTrajectoryForROIList:isGG:](self->_detectionUtils, "generateTrajectoryForROIList:isGG:", *a3, 1, (void)v14);
  [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneUsingTrajectoryGGList:*a3];
  if (self->_isLocalMotionCueEnabled) {
    [(MTLTexture *)self->_inputTexture addObject:*a3];
  }
  kdebug_trace();
}

- (void)temporalDetectionCoreCurrentGGList:(id *)a3 ghostCandidates:(id *)a4 LSList:(id)a5
{
  id v141 = a5;
  long long v103 = +[NSMutableArray array];
  id v140 = +[NSMutableArray array];
  int v7 = [(MTLTexture *)self->_inputTexture count];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    do
    {
      uint64_t v104 = v8;
      uint64_t v9 = v8 - 1;
      id v10 = [(MTLTexture *)self->_inputTexture objectAtIndex:(v8 - 1)];
      uint64_t v100 = v9;
      LODWORD(v9) = [(MTLTexture *)self->_inputTexture count] - v9;
      double v11 = pow(1.1, (double)(int)v9);
      detectionUtils = self->_detectionUtils;
      [(VideoDeghostingDetectionV2 *)self params];
      int v13 = v139;
      [(VideoDeghostingDetectionV2 *)self params];
      LODWORD(v14) = v138;
      *(float *)&double v15 = (float)(int)v9;
      LODWORD(v16) = v13;
      [(VDGDetectionUtilsV2 *)detectionUtils getTemporalDetectionSearchRadiusForReferenceFrameIndex:v15 minSearchRadius:v16 slope:v14];
      int v18 = v17;
      id v19 = +[NSMutableArray array];
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v20 = v10;
      id v21 = [v20 countByEnumeratingWithState:&v134 objects:v147 count:16];
      if (!v21) {
        goto LABEL_26;
      }
      id v22 = v21;
      float v23 = v11;
      uint64_t v24 = *(void *)v135;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v135 != v24) {
            objc_enumerationMutation(v20);
          }
          float32x4_t v26 = *(void **)(*((void *)&v134 + 1) + 8 * i);
          if (![v26 isReflectedLS])
          {
            id v28 = *a4;
            id v29 = *a3;
            [(VideoDeghostingDetectionV2 *)self params];
            [(VideoDeghostingDetectionV2 *)self params];
            [(VideoDeghostingDetectionV2 *)self params];
            [(VideoDeghostingDetectionV2 *)self params];
            LODWORD(v30) = v130;
            LODWORD(v31) = v18;
            LODWORD(v32) = v133;
            LODWORD(v33) = v132;
            *(float *)&double v34 = v131 * v23;
            LODWORD(v35) = 1028443341;
            id v27 = [(VideoDeghostingDetectionV2 *)self temporalDetectionPixelFeatureMatchROI:v26 againstROIList:v28 ggList:v29 avoidList:v19 searchRadius:v31 colorContrastDiffThreshold:v32 lumaDiffThreshold:v33 localMotionDiffThreshold:v34 costThreshold:v30 bestCostTolerance:v35];
            float v36 = [(VDGDetectionUtilsV2 *)self->_detectionUtils getBestROIInROIList:v27 referenceROI:v26];
            if (v36 && ([v19 containsObject:v36] & 1) == 0)
            {
              objc_msgSend(v36, "setTemporalDetectionVote:", objc_msgSend(v36, "temporalDetectionVote") + 1);
              [v19 addObject:v36];
              [v36 setTemporalDetectionMatched:v26];
              if ([*a4 containsObject:v36])
              {
                [(VDGDetectionUtilsV2 *)self->_detectionUtils generateTrajectoryForROI:v36 isGG:1];
                [(VDGDetectionUtilsV2 *)self->_detectionUtils getTrajectoryMatchingCostGG:v36];
                float v40 = v39;
                if (v104 == [(MTLTexture *)self->_inputTexture count]
                  && [(VDGDetectionUtilsV2 *)self->_detectionUtils ghostIsHighConfidence:v26]
                  && v40 <= 0.3)
                {
                  [v103 addObject:v26];
                  objc_msgSend(v36, "setTemporalDetectionVote:", objc_msgSend(v36, "temporalDetectionVote") - 1);
                  [v19 removeObject:v36];
                  [v36 setTemporalDetectionMatched:0];
                }
              }
              else
              {
                id v37 = v140;
                float v38 = v36;
LABEL_22:
                [v37 addObject:v38];
              }
            }
            else if (v104 == [(MTLTexture *)self->_inputTexture count] {
                   && [(VDGDetectionUtilsV2 *)self->_detectionUtils ghostIsHighConfidence:v26])
            }
            {
              id v37 = v103;
              float v38 = v26;
              goto LABEL_22;
            }

            goto LABEL_24;
          }
          id v27 = [(VideoDeghostingDetectionV2 *)self predictPastReflectedLSInCurrentFrame:v26 currentFrameLSList:v141];
          if (v27) {
            [v140 addObject:v27];
          }
LABEL_24:
        }
        id v22 = [v20 countByEnumeratingWithState:&v134 objects:v147 count:16];
      }
      while (v22);
LABEL_26:

      uint64_t v8 = v100;
    }
    while (v104 > 1);
  }
  id v129 = [(VideoDeghostingDetectionV2 *)self predictPastROIsInCurrentFrame:v103 currentGGList:*a3];
  [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneGGList:&v129 LSBBoxList:&v141 reflectedLSBBoxList:*(void *)&self->_reflectedDilatedLs[4] getMatchedLS:1 pruneLS:0 pruneGG:1];
  [(VDGDetectionUtilsV2 *)self->_detectionUtils pruneGGList:&v140 LSBBoxList:&v141 reflectedLSBBoxList:*(void *)&self->_reflectedDilatedLs[4] getMatchedLS:1 pruneLS:0 pruneGG:1];
  CGFloat v41 = +[NSMutableArray array];
  [v41 addObjectsFromArray:v140];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v42 = *a4;
  id v43 = [v42 countByEnumeratingWithState:&v125 objects:v146 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v126;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v126 != v45) {
          objc_enumerationMutation(v42);
        }
        id v47 = *(void **)(*((void *)&v125 + 1) + 8 * (void)j);
        signed int v48 = [v47 temporalDetectionVote];
        [(VideoDeghostingDetectionV2 *)self params];
        if (v48 >= v124)
        {
          [v41 addObject:v47];
          id v49 = [v47 temporalDetectionMatched];
          if (v49)
          {
            [v47 setIsTracked:1];
            objc_msgSend(v47, "setTrackID:", objc_msgSend(v49, "trackID"));
            objc_msgSend(v47, "setIsTrajectoryPruningPassed:", objc_msgSend(v49, "isTrajectoryPruningPassed"));
            objc_msgSend(v47, "setTrackedCnt:", objc_msgSend(v49, "trackedCnt") + 1);
          }
          else
          {
            [v47 setIsTracked:0];
            [v47 setTrackID:(*(_DWORD *)&self->_estOpticalCenter[4])++];
          }
        }
      }
      id v44 = [v42 countByEnumeratingWithState:&v125 objects:v146 count:16];
    }
    while (v44);
  }

  id v105 = v41;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = v129;
  id v50 = [obj countByEnumeratingWithState:&v120 objects:v145 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v121;
    double v96 = 0.999;
    do
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v121 != v52) {
          objc_enumerationMutation(obj);
        }
        unint64_t v54 = *(void **)(*((void *)&v120 + 1) + 8 * (void)k);
        if (objc_msgSend(v54, "isReflectedLS", *(void *)&v96)) {
          goto LABEL_45;
        }
        [v54 bbox];
        float32x4_t v101 = v56;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v57 = v105;
        id v58 = [v57 countByEnumeratingWithState:&v116 objects:v144 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v117;
          double v61 = vmuls_lane_f32(v101.f32[3], v101, 2);
          float v62 = 0.0;
          do
          {
            for (m = 0; m != v59; m = (char *)m + 1)
            {
              if (*(void *)v117 != v60) {
                objc_enumerationMutation(v57);
              }
              long long v64 = *(void **)(*((void *)&v116 + 1) + 8 * (void)m);
              if (([v64 isReflectedLS] & 1) == 0)
              {
                [v64 bbox];
                v152.origin.x = v65;
                v152.origin.y = v66;
                v152.size.double width = v67;
                v152.size.double height = v68;
                v148.origin.x = v101.f32[0];
                v148.origin.y = v101.f32[1];
                v148.size.double width = v101.f32[2];
                v148.size.double height = v101.f32[3];
                CGRect v149 = CGRectIntersection(v148, v152);
                double width = v149.size.width;
                double height = v149.size.height;
                if (!CGRectIsNull(v149))
                {
                  double v71 = width * height / v61;
                  if (v71 >= v62) {
                    float v62 = v71;
                  }
                }
              }
            }
            id v59 = [v57 countByEnumeratingWithState:&v116 objects:v144 count:16];
          }
          while (v59);
        }
        else
        {
          float v62 = 0.0;
        }

        double v55 = v62;
        if (v62 < v96 && (objc_msgSend(v57, "containsObject:", v54, v55) & 1) == 0) {
LABEL_45:
        }
          [v105 addObject:v54];
      }
      id v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v145, 16, v55);
    }
    while (v51);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obja = *a3;
  id v72 = [obja countByEnumeratingWithState:&v112 objects:v143 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v113;
    double v97 = 0.999;
    do
    {
      for (n = 0; n != v73; n = (char *)n + 1)
      {
        if (*(void *)v113 != v74) {
          objc_enumerationMutation(obja);
        }
        int8x16_t v76 = *(void **)(*((void *)&v112 + 1) + 8 * (void)n);
        signed int v77 = objc_msgSend(v76, "temporalDetectionVote", *(void *)&v97);
        [(VideoDeghostingDetectionV2 *)self params];
        if (v77 < v111)
        {
          [v76 bbox];
          float32x4_t v102 = v79;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v80 = v105;
          id v81 = [v80 countByEnumeratingWithState:&v107 objects:v142 count:16];
          if (v81)
          {
            id v82 = v81;
            uint64_t v83 = *(void *)v108;
            double v84 = vmuls_lane_f32(v102.f32[3], v102, 2);
            float v85 = 0.0;
            do
            {
              for (ii = 0; ii != v82; ii = (char *)ii + 1)
              {
                if (*(void *)v108 != v83) {
                  objc_enumerationMutation(v80);
                }
                long long v87 = *(void **)(*((void *)&v107 + 1) + 8 * (void)ii);
                if (([v87 isReflectedLS] & 1) == 0)
                {
                  [v87 bbox];
                  v153.origin.x = v88;
                  v153.origin.y = v89;
                  v153.size.double width = v90;
                  v153.size.double height = v91;
                  v150.origin.x = v102.f32[0];
                  v150.origin.y = v102.f32[1];
                  v150.size.double width = v102.f32[2];
                  v150.size.double height = v102.f32[3];
                  CGRect v151 = CGRectIntersection(v150, v153);
                  double v92 = v151.size.width;
                  double v93 = v151.size.height;
                  if (!CGRectIsNull(v151))
                  {
                    double v94 = v92 * v93 / v84;
                    if (v94 >= v85) {
                      float v85 = v94;
                    }
                  }
                }
              }
              id v82 = [v80 countByEnumeratingWithState:&v107 objects:v142 count:16];
            }
            while (v82);
          }
          else
          {
            float v85 = 0.0;
          }

          double v78 = v85;
          if (v85 < v97 && (objc_msgSend(v80, "containsObject:", v76, v78) & 1) == 0)
          {
            [v76 setIsTracked:0];
            [v76 setTrackID:(*(_DWORD *)&self->_estOpticalCenter[4])++];
            [v80 addObject:v76];
          }
        }
      }
      id v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v143, 16, v78);
    }
    while (v73);
  }

  [(VDGDetectionUtilsV2 *)self->_detectionUtils removeDuplicateRois:v105];
  id v95 = *a3;
  *a3 = v105;
}

- (void)_temporalDetectionCurrentGGList:(id *)a3 rawKeyPointList:(id *)a4 LSList:(id)a5
{
}

- (id)temporalDetectionPixelFeatureMatchROI:(id)a3 againstROIList:(id)a4 ggList:(id)a5 avoidList:(id)a6 searchRadius:(float)a7 colorContrastDiffThreshold:(float)a8 lumaDiffThreshold:(float)a9 localMotionDiffThreshold:(float)a10 costThreshold:(float)a11 bestCostTolerance:(float)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v122 = a6;
  id v20 = +[NSMutableArray array];
  [(VDGDetectionUtilsV2 *)self->_detectionUtils getSearchLocation:v17];
  float32x2_t v128 = v21;
  if (v21.f32[0] != INFINITY)
  {
    id v22 = v18;
    long long v112 = self;
    [v17 bbox];
    float32x4_t v118 = (float32x4_t)v23;
    long long v138 = 0u;
    long long v139 = 0u;
    v123.i64[0] = *(uint64_t *)&vadd_f32(v128, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL), (float32x2_t)0xBF000000BF000000));
    long long v140 = 0u;
    long long v141 = 0u;
    id v24 = v19;
    id v25 = [v24 countByEnumeratingWithState:&v138 objects:v166 count:16];
    if (v25)
    {
      id v26 = v25;
      float v115 = a12;
      id v27 = v20;
      id v109 = v19;
      id v28 = 0;
      float v29 = vmuls_lane_f32(v118.f32[2], v118, 3);
      uint64_t v30 = *(void *)v139;
      float v31 = 0.6;
      __asm { FMOV            V15.2S, #3.0 }
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v139 != v30) {
            objc_enumerationMutation(v24);
          }
          float v38 = *(void **)(*((void *)&v138 + 1) + 8 * i);
          if (v38)
          {
            [*(id *)(*((void *)&v138 + 1) + 8 * i) descriptor];
            float32x2_t v39 = (float32x2_t)v156;
          }
          else
          {
            long long v165 = 0u;
            long long v164 = 0u;
            long long v163 = 0u;
            long long v162 = 0u;
            long long v161 = 0u;
            long long v160 = 0u;
            long long v159 = 0u;
            long long v158 = 0u;
            float32x2_t v39 = 0;
            long long v157 = 0u;
            long long v156 = 0u;
          }
          uint32x2_t v40 = (uint32x2_t)vcgt_f32(vabd_f32(v128, v39), _D15);
          if ((vpmax_u32(v40, v40).u32[0] & 0x80000000) == 0)
          {
            [v38 bbox];
            v169.origin.x = v41.f32[0];
            v169.origin.y = v41.f32[1];
            v169.size.double width = v41.f32[2];
            v169.size.double height = v41.f32[3];
            float v42 = vmuls_lane_f32(v41.f32[2], v41, 3);
            *(double *)v41.i64 = v123.f32[0];
            double v43 = v123.f32[1];
            double v44 = v118.f32[2];
            double v45 = v118.f32[3];
            CGRect v168 = CGRectIntersection(*(CGRect *)v41.f32, v169);
            *(float *)&v168.origin.x = v168.size.width * v168.size.height;
            float v46 = *(float *)&v168.origin.x / v29;
            float v47 = *(float *)&v168.origin.x / v42;
            float v48 = v46 >= v47 ? v47 : v46;
            if (v48 > v31)
            {
              id v49 = v38;

              float v31 = v48;
              id v28 = v49;
            }
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v138 objects:v166 count:16];
      }
      while (v26);

      id v19 = v109;
      id v20 = v27;
      a12 = v115;
      if (v28)
      {
        uint64_t v50 = [(ROI *)v28 temporalDetectionMatched];
        if (v50)
        {
          id v51 = (void *)v50;
          uint64_t v52 = [(ROI *)v28 temporalDetectionMatched];
          signed int v53 = [v52 trackID];
          signed int v54 = [v17 trackID];

          if (v53 <= v54)
          {
            id v106 = +[NSMutableArray arrayWithObject:v28];

            id v19 = v109;
            id v18 = v22;
            goto LABEL_78;
          }
          id v19 = v109;
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    id v28 = [[ROI alloc] initWithBbox:*(double *)v123.i64];
    [(ROI *)v28 setDoneKPToBBoxViaGraphTraversal:1];
    long long v55 = 0uLL;
    long long v155 = 0u;
    long long v154 = 0u;
    long long v153 = 0u;
    long long v152 = 0u;
    long long v151 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v146 = 0u;
    if (v28)
    {
      [(ROI *)v28 descriptor];
      long long v55 = 0uLL;
    }
    if (v17)
    {
      [v17 lumaFeatureVectorPredictedLocation];
      long long v57 = v136;
      long long v56 = v137;
      long long v55 = v134;
      long long v58 = v135;
    }
    else
    {
      long long v58 = 0uLL;
      long long v57 = 0uLL;
      long long v56 = 0uLL;
    }
    long long v150 = v55;
    long long v151 = v58;
    long long v152 = v57;
    long long v153 = v56;
    LODWORD(v154) = 32;
    v145[2] = v148;
    v145[3] = v149;
    v145[0] = v146;
    v145[1] = v147;
    v145[8] = v154;
    v145[9] = v155;
    v145[4] = v55;
    v145[5] = v58;
    v145[6] = v57;
    v145[7] = v56;
    [(ROI *)v28 setDescriptor:v145];
    [v17 differenceOfGaussianAndLumaFeaturePredictedLocation];
    -[ROI setDifferenceOfGaussianAndLumaFeature:](v28, "setDifferenceOfGaussianAndLumaFeature:");
LABEL_29:
    [v17 getPixelFeatureMatchCostWith:v28];
    float v60 = v59;
    [(ROI *)v28 differenceOfGaussianAndLumaFeature];
    BOOL v62 = 0;
    if (v60 < 0.04 && *(float *)&v61 >= 0.02) {
      BOOL v62 = *((float *)&v61 + 1) >= 0.3;
    }
    uint64_t v119 = v61;
    [v17 bbox];
    float32x4_t v124 = v63;
    [v17 bbox];
    __int8 v65 = vmovn_s32(vcgtq_f32((float32x4_t)vdupq_laneq_s32(v64, 3), v124)).i8[4];
    [v17 bbox];
    BOOL v67 = 0;
    char v68 = 2;
    if ((v65 & 1) == 0) {
      char v68 = 3;
    }
    long long v129 = v66;
    if (v60 < (float)((float)(1.0
                             - fminf(fmaxf((float)((float)(*(float *)((unint64_t)&v129 & 0xFFFFFFFFFFFFFFF3 | (4 * (v68 & 3)))+ -10.0)+ -2.0)/ 3.0, 0.0), 1.0))* 0.1)&& *(float *)&v119 >= 0.04)
    {
      BOOL v67 = *((float *)&v119 + 1) >= 0.5;
    }
    if (v62 || v67)
    {
      long long v155 = 0u;
      long long v154 = 0u;
      long long v153 = 0u;
      long long v152 = 0u;
      long long v151 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      long long v146 = 0u;
      if (v28) {
        [(ROI *)v28 descriptor];
      }
      [(ROI *)v28 bbox];
      float32x2_t v125 = v69;
      [(ROI *)v28 bbox];
      *(float32x2_t *)&long long v146 = vadd_f32(v125, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v70, v70, 8uLL), (float32x2_t)0x3F0000003F000000));
      if (v60 < 0.04)
      {
        memset(v144, 0, sizeof(v144));
        memset(&v143[10], 0, 64);
        if (v17) {
          [v17 descriptor];
        }
        [(VDGDetectionUtilsV2 *)v112->_detectionUtils updateNewRoiPixFea:&v150 withRefPixFea:v144];
      }
      v143[6] = v152;
      v143[7] = v153;
      v143[8] = v154;
      v143[9] = v155;
      v143[2] = v148;
      v143[3] = v149;
      v143[4] = v150;
      v143[5] = v151;
      v143[0] = v146;
      v143[1] = v147;
      [(ROI *)v28 setDescriptor:v143];
      [(ROI *)v28 setIsTracked:1];
      -[ROI setTrackedCnt:](v28, "setTrackedCnt:", [v17 trackedCnt] + 1);
      -[ROI setTrackID:](v28, "setTrackID:", [v17 trackID]);
      [(ROI *)v28 setTemporalDetectionMatched:v17];
      [(ROI *)v28 setIsPredictedFromPast:1];
      -[ROI setIsTrajectoryPruningPassed:](v28, "setIsTrajectoryPruningPassed:", [v17 isTrajectoryPruningPassed]);
      [v20 addObject:v28];
    }

    id v18 = v22;
  }
  if ([v20 count]) {
    goto LABEL_77;
  }
  id v110 = v19;
  double v71 = +[NSMutableArray array];
  long long v113 = v17;
  [v17 bbox];
  int8x16_t v120 = v72;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v108 = v18;
  id v73 = v18;
  id v74 = [v73 countByEnumeratingWithState:&v130 objects:v142 count:16];
  if (!v74)
  {
    int8x16_t v76 = 0;
    signed int v111 = 0;
    goto LABEL_76;
  }
  id v75 = v74;
  int8x16_t v76 = 0;
  signed int v111 = 0;
  float32x2_t v126 = (float32x2_t)vextq_s8(v120, v120, 8uLL).u64[0];
  float32x2_t v77 = vadd_f32(*(float32x2_t *)v120.i8, vmul_f32(v126, (float32x2_t)0x3F0000003F000000));
  uint64_t v78 = *(void *)v131;
  float v79 = INFINITY;
  __asm { FMOV            V14.2S, #13.0 }
  id v116 = v73;
  do
  {
    for (j = 0; j != v75; j = (char *)j + 1)
    {
      if (*(void *)v131 != v78) {
        objc_enumerationMutation(v73);
      }
      id v82 = *(void **)(*((void *)&v130 + 1) + 8 * (void)j);
      objc_msgSend(v82, "bbox", v108);
      float32x2_t v84 = (float32x2_t)vextq_s8(v83, v83, 8uLL).u64[0];
      float32x2_t v85 = vadd_f32(*(float32x2_t *)v83.i8, vmul_f32(v84, (float32x2_t)0x3F0000003F000000));
      if (v128.f32[0] == INFINITY)
      {
        float32x2_t v86 = vsub_f32(v77, v85);
        if (sqrtf(vaddv_f32(vmul_f32(v86, v86))) > a7) {
          continue;
        }
      }
      else
      {
        float32x2_t v87 = vsub_f32(v128, v85);
        if (sqrtf(vaddv_f32(vmul_f32(v87, v87))) > 10.0) {
          continue;
        }
      }
      float32x2_t v88 = vabd_f32(v126, v84);
      float32x2_t v89 = vmul_f32(vminnm_f32(v126, v84), (float32x2_t)0x3F0000003F000000);
      uint32x2_t v90 = (uint32x2_t)vcge_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D14, v89), (int8x8_t)_D14, (int8x8_t)v89), v88);
      if ((vpmin_u32(v90, v90).u32[0] & 0x80000000) != 0
        && ([v122 containsObject:v82] & 1) == 0)
      {
        [v113 getPixelFeatureMatchCostWith:v82];
        float v92 = *(float *)&v91;
        if (*(float *)&v91 <= a11)
        {
          if (*(float *)&v91 < v79)
          {
            if ([v20 count])
            {
              long long v121 = +[NSMutableArray array];

              id v73 = v116;
              long long v117 = +[NSMutableArray array];

              if ([v20 count])
              {
                uint64_t v93 = 0;
                unsigned int v94 = 1;
                do
                {
                  id v95 = [v71 objectAtIndexedSubscript:v93];
                  [v95 floatValue];
                  if ((float)(v96 - v92) > a12)
                  {
                    [v20 objectAtIndexedSubscript:v93];
                    double v97 = v71;
                    v99 = float32x2_t v98 = v20;
                    [v121 addObject:v99];

                    id v20 = v98;
                    double v71 = v97;
                    id v73 = v116;
                    uint64_t v100 = [v71 objectAtIndexedSubscript:v93];
                    [v117 addObject:v100];
                  }
                  uint64_t v93 = v94;
                }
                while ((unint64_t)[v20 count] > v94++);
              }
              float32x4_t v102 = v121;
              [v20 removeObjectsInArray:v121];
              long long v103 = v117;
              [v71 removeObjectsInArray:v117];
            }
            else
            {
              float32x4_t v102 = v76;
              long long v103 = v111;
            }
            float v79 = v92;
LABEL_71:
            objc_msgSend(v20, "addObject:", v82, v91);
            *(float *)&double v104 = v92;
            id v105 = +[NSNumber numberWithFloat:v104];
            [v71 addObject:v105];

            int8x16_t v76 = v102;
            signed int v111 = v103;
            continue;
          }
          *(float *)&double v91 = *(float *)&v91 - v79;
          float32x4_t v102 = v76;
          long long v103 = v111;
          if ((float)(v92 - v79) <= a12) {
            goto LABEL_71;
          }
        }
      }
    }
    id v75 = [v73 countByEnumeratingWithState:&v130 objects:v142 count:16];
  }
  while (v75);
LABEL_76:

  id v18 = v108;
  id v19 = v110;
  id v17 = v113;
LABEL_77:
  id v106 = v20;
LABEL_78:

  return v106;
}

- (id)predictPastROIsInCurrentFrame:(id)a3 currentGGList:(id)a4
{
  id v5 = a3;
  id v87 = a4;
  id v95 = +[NSMutableArray array];
  uint64_t v6 = +[NSMutableArray array];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v5;
  id v91 = [obj countByEnumeratingWithState:&v119 objects:v149 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v120;
    __asm { FMOV            V0.2S, #3.0 }
    float32x2_t v97 = _D0;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v120 != v90) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v119 + 1) + 8 * (void)v12);
        if ((int)[v13 lowSaliencyCnt] > 4) {
          goto LABEL_45;
        }
        [(VDGDetectionUtilsV2 *)self->_detectionUtils getSearchLocation:v13];
        if (v14.f32[0] >= INFINITY) {
          goto LABEL_45;
        }
        float32x2_t v98 = v14;
        [v13 bbox];
        float32x4_t v93 = (float32x4_t)v15;
        long long v115 = 0u;
        long long v116 = 0u;
        double v89 = COERCE_DOUBLE(vadd_f32(v98, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL), (float32x2_t)0xBF000000BF000000)));
        long long v117 = 0u;
        long long v118 = 0u;
        id v16 = v87;
        id v17 = [v16 countByEnumeratingWithState:&v115 objects:v148 count:16];
        if (!v17)
        {

LABEL_27:
          id v20 = [[ROI alloc] initWithBbox:v89];
          [(ROI *)v20 setDoneKPToBBoxViaGraphTraversal:1];
          [v13 differenceOfGaussianAndLumaFeaturePredictedLocation];
          -[ROI setDifferenceOfGaussianAndLumaFeature:](v20, "setDifferenceOfGaussianAndLumaFeature:");
          long long v137 = 0u;
          long long v136 = 0u;
          long long v135 = 0u;
          long long v134 = 0u;
          long long v133 = 0u;
          long long v132 = 0u;
          long long v131 = 0u;
          long long v130 = 0u;
          long long v129 = 0u;
          long long v128 = 0u;
          if (v20) {
            [(ROI *)v20 descriptor];
          }
          if (v13)
          {
            [v13 lumaFeatureVectorPredictedLocation];
            long long v44 = v113;
            long long v43 = v114;
            long long v45 = v111;
            long long v46 = v112;
          }
          else
          {
            long long v45 = 0uLL;
            long long v46 = 0uLL;
            long long v44 = 0uLL;
            long long v43 = 0uLL;
          }
          long long v132 = v45;
          long long v133 = v46;
          long long v134 = v44;
          long long v135 = v43;
          LODWORD(v136) = 32;
          v127[2] = v130;
          v127[3] = v131;
          v127[0] = v128;
          v127[1] = v129;
          v127[9] = v137;
          v127[8] = v136;
          v127[4] = v45;
          v127[5] = v46;
          v127[6] = v44;
          v127[7] = v43;
          [(ROI *)v20 setDescriptor:v127];
          goto LABEL_33;
        }
        id v18 = v17;
        id v19 = v12;
        id v20 = 0;
        v93.i32[0] = vmuls_lane_f32(v93.f32[2], v93, 3);
        uint64_t v21 = *(void *)v116;
        float v22 = 0.6;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v116 != v21) {
              objc_enumerationMutation(v16);
            }
            id v24 = *(void **)(*((void *)&v115 + 1) + 8 * i);
            if (v24)
            {
              [*(id *)(*((void *)&v115 + 1) + 8 * i) descriptor];
              float32x2_t v25 = (float32x2_t)v138;
            }
            else
            {
              long long v147 = 0u;
              long long v146 = 0u;
              long long v145 = 0u;
              long long v144 = 0u;
              long long v143 = 0u;
              long long v142 = 0u;
              long long v141 = 0u;
              long long v140 = 0u;
              float32x2_t v25 = 0;
              long long v139 = 0u;
              long long v138 = 0u;
            }
            uint32x2_t v26 = (uint32x2_t)vcgt_f32(vabd_f32(v98, v25), v97);
            if ((vpmax_u32(v26, v26).u32[0] & 0x80000000) == 0)
            {
              [v24 bbox];
              CGFloat v28 = v27;
              [v24 bbox];
              CGFloat v30 = v29;
              [v24 bbox];
              float v32 = v31;
              CGFloat v33 = v31;
              [v24 bbox];
              v152.size.double height = v34.f32[3];
              float v35 = vmuls_lane_f32(v32, v34, 3);
              *(double *)v34.i64 = *(float *)&v89;
              double v36 = *((float *)&v89 + 1);
              double v37 = v93.f32[2];
              double v38 = v93.f32[3];
              v152.origin.x = v28;
              v152.origin.y = v30;
              v152.size.double width = v33;
              CGRect v151 = CGRectIntersection(*(CGRect *)v34.f32, v152);
              *(float *)&v151.origin.x = v151.size.width * v151.size.height;
              float v39 = *(float *)&v151.origin.x / v93.f32[0];
              float v40 = *(float *)&v151.origin.x / v35;
              float v41 = v39 >= v40 ? v40 : v39;
              if (v41 > v22)
              {
                float v42 = v24;

                float v22 = v41;
                id v20 = v42;
              }
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v115 objects:v148 count:16];
        }
        while (v18);

        uint64_t v12 = v19;
        if (!v20) {
          goto LABEL_27;
        }
LABEL_33:
        [v13 getPixelFeatureMatchCostWith:v20];
        double v48 = v47;
        unsigned int v49 = [(VDGDetectionUtilsV2 *)self->_detectionUtils ghostIsHighConfidence:v13];
        double v50 = INFINITY;
        if (!v49) {
          double v50 = 0.5;
        }
        if (v50 > v48)
        {
          uint64_t v51 = [(ROI *)v20 temporalDetectionMatched];
          if (!v51
            || (uint64_t v52 = (void *)v51,
                [(ROI *)v20 temporalDetectionMatched],
                signed int v53 = objc_claimAutoreleasedReturnValue(),
                signed int v54 = [v53 trackID],
                signed int v55 = [v13 trackID],
                v53,
                v52,
                v54 > v55))
          {
            [(ROI *)v20 differenceOfGaussianAndLumaFeature];
            if (*(float *)&v56 < 0.04 || (LODWORD(v56) = HIDWORD(v56), *((float *)&v56 + 1) < 0.5)) {
              uint64_t v57 = objc_msgSend(v13, "lowSaliencyCnt", v56) + 1;
            }
            else {
              uint64_t v57 = 0;
            }
            -[ROI setLowSaliencyCnt:](v20, "setLowSaliencyCnt:", v57, v56);
            long long v137 = 0u;
            long long v136 = 0u;
            long long v135 = 0u;
            long long v134 = 0u;
            long long v133 = 0u;
            long long v132 = 0u;
            long long v131 = 0u;
            long long v130 = 0u;
            long long v129 = 0u;
            long long v128 = 0u;
            if (v20) {
              [(ROI *)v20 descriptor];
            }
            [(ROI *)v20 bbox];
            float32x2_t v102 = v83;
            [(ROI *)v20 bbox];
            *(float32x2_t *)&long long v128 = vadd_f32(v102, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v84, v84, 8uLL), (float32x2_t)0x3F0000003F000000));
            memset(v126, 0, sizeof(v126));
            memset(&v125[10], 0, 64);
            if (v13) {
              [v13 descriptor];
            }
            [(VDGDetectionUtilsV2 *)self->_detectionUtils updateNewRoiPixFea:&v132 withRefPixFea:v126];
            v125[6] = v134;
            v125[7] = v135;
            v125[8] = v136;
            v125[9] = v137;
            v125[2] = v130;
            v125[3] = v131;
            v125[4] = v132;
            v125[5] = v133;
            v125[0] = v128;
            v125[1] = v129;
            [(ROI *)v20 setDescriptor:v125];
            [(ROI *)v20 setIsTracked:1];
            -[ROI setTrackedCnt:](v20, "setTrackedCnt:", [v13 trackedCnt] + 1);
            -[ROI setTrackID:](v20, "setTrackID:", [v13 trackID]);
            [(ROI *)v20 setTemporalDetectionMatched:v13];
            [(ROI *)v20 setIsPredictedFromPast:1];
            -[ROI setPredictedFromPastCnt:](v20, "setPredictedFromPastCnt:", [v13 predictedFromPastCnt] + 1);
            -[ROI setIsTrajectoryPruningPassed:](v20, "setIsTrajectoryPruningPassed:", [v13 isTrajectoryPruningPassed]);
            [v95 addObject:v20];
            goto LABEL_61;
          }
        }
        uint64_t v58 = [(ROI *)v20 temporalDetectionMatched];
        if (!v58)
        {

LABEL_45:
          [v13 bbox];
          float32x4_t v99 = v63;
          [v13 bbox];
          float32x4_t v94 = v64;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v20 = [v13 matchedLS];
          id v65 = [(ROI *)v20 countByEnumeratingWithState:&v107 objects:v124 count:16];
          if (v65)
          {
            id v66 = v65;
            r1 = v12;
            uint64_t v67 = *(void *)v108;
            double v68 = COERCE_FLOAT(vmulq_laneq_f32(v99, v94, 3).i32[2]);
            do
            {
              for (j = 0; j != v66; j = (char *)j + 1)
              {
                if (*(void *)v108 != v67) {
                  objc_enumerationMutation(v20);
                }
                int8x16_t v70 = *(void **)(*((void *)&v107 + 1) + 8 * (void)j);
                if (([v70 lsHasBeenUsedForTrackingGhost] & 1) == 0)
                {
                  [v70 bbox];
                  float32x4_t v100 = v71;
                  [v70 bbox];
                  if (COERCE_FLOAT(vmulq_laneq_f32(v100, v72, 3).i32[2]) * 0.1 <= v68)
                  {
                    [v70 setLsHasBeenUsedForTrackingGhost:1];
                    id v73 = [ROI alloc];
                    [v70 getReflectedBboxAroundCenter:*(double *)&self->_prevDefaultOpticalCenter[4]];
                    id v74 = -[ROI initWithBbox:](v73, "initWithBbox:");
                    id v75 = v74;
                    long long v137 = 0u;
                    long long v136 = 0u;
                    long long v135 = 0u;
                    long long v134 = 0u;
                    long long v133 = 0u;
                    long long v132 = 0u;
                    long long v131 = 0u;
                    long long v130 = 0u;
                    long long v129 = 0u;
                    long long v128 = 0u;
                    if (v74) {
                      [(ROI *)v74 descriptor];
                    }
                    if (v70)
                    {
                      [v70 lumaFeatureVectorReflection];
                      long long v77 = v105;
                      long long v76 = v106;
                      long long v78 = v103;
                      long long v79 = v104;
                    }
                    else
                    {
                      long long v78 = 0uLL;
                      long long v79 = 0uLL;
                      long long v77 = 0uLL;
                      long long v76 = 0uLL;
                    }
                    long long v132 = v78;
                    long long v133 = v79;
                    long long v134 = v77;
                    long long v135 = v76;
                    LODWORD(v136) = 32;
                    [(ROI *)v75 bbox];
                    float32x2_t v101 = v80;
                    [(ROI *)v75 bbox];
                    *(float32x2_t *)&long long v128 = vadd_f32(v101, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v81, v81, 8uLL), (float32x2_t)0x3F0000003F000000));
                    v123[6] = v134;
                    v123[7] = v135;
                    v123[8] = v136;
                    v123[9] = v137;
                    v123[2] = v130;
                    v123[3] = v131;
                    v123[4] = v132;
                    v123[5] = v133;
                    v123[0] = v128;
                    v123[1] = v129;
                    [(ROI *)v75 setDescriptor:v123];
                    [(ROI *)v75 setIsReflectedLS:1];
                    [(ROI *)v75 setIsTracked:1];
                    -[ROI setTrackedCnt:](v75, "setTrackedCnt:", [v13 trackedCnt] + 1);
                    -[ROI setTrackID:](v75, "setTrackID:", [v13 trackID]);
                    [(ROI *)v75 setTemporalDetectionMatched:v13];
                    [(ROI *)v75 setIsPredictedFromPast:1];
                    -[ROI setPredictedFromPastCnt:](v75, "setPredictedFromPastCnt:", [v13 predictedFromPastCnt] + 1);
                    -[ROI setIsTrajectoryPruningPassed:](v75, "setIsTrajectoryPruningPassed:", [v13 isTrajectoryPruningPassed]);
                    id v82 = [v70 LSTrackID];
                    [(ROI *)v75 setLSTrackID:v82];

                    [(ROI *)v75 setLowSaliencyCnt:0];
                    [(ROI *)v75 setDoneKPToBBoxViaGraphTraversal:1];
                    [v6 addObject:v75];
                    [v95 addObject:v75];
                  }
                }
              }
              id v66 = [(ROI *)v20 countByEnumeratingWithState:&v107 objects:v124 count:16];
            }
            while (v66);
            uint64_t v12 = r1;
          }
LABEL_61:

          goto LABEL_62;
        }
        float v59 = (void *)v58;
        float v60 = [(ROI *)v20 temporalDetectionMatched];
        signed int v61 = [v60 trackID];
        signed int v62 = [v13 trackID];

        if (v61 > v62) {
          goto LABEL_45;
        }
LABEL_62:
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v12 != v91);
      id v85 = [obj countByEnumeratingWithState:&v119 objects:v149 count:16];
      id v91 = v85;
    }
    while (v85);
  }

  return v95;
}

- (id)extractLightSourceBBoxFromBuffer:(VideoDeghostingDetectionV2 *)self BoxCount:(SEL)a2
{
  uint64_t v4 = v3;
  id v5 = v2;
  uint64_t v6 = +[NSMutableArray array];
  if (v5)
  {
    if (v4 >= 1)
    {
      do
      {
        int v7 = [ROI alloc];
        long long v8 = *v5++;
        uint64_t v9 = [(ROI *)v7 initWithBbox:*(double *)&v8];
        [v6 addObject:v9];

        --v4;
      }
      while (v4);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v6;
}

- ($E04785D6C22F149E9B1B648872290F90)configuration
{
  long long v3 = *(_OWORD *)&self[39].var0.var7;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[39].var0.var0;
  *(_OWORD *)&retstr->var0.var7 = v3;
  long long v4 = *(_OWORD *)&self[39].var1.var4;
  *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&self[39].var1.var0;
  *(_OWORD *)&retstr->var1.var4 = v4;
  return self;
}

- (void)setConfiguration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var7;
  long long v5 = *(_OWORD *)&a3->var1.var0;
  *(_OWORD *)&self->_params.lightSourceGatingThresholdON = *(_OWORD *)&a3->var1.var4;
  *(_OWORD *)&self->_configuration.externalCfg.frameDelay = v5;
  *(_OWORD *)&self->_configuration.externalCfg.lightMode = v4;
  *(_OWORD *)&self->_configuration.internalCfg.enableColorMask = v3;
}

- (double)estOpticalCenter
{
  return *(double *)(a1 + 2400);
}

- (void)setEstOpticalCenter:(VideoDeghostingDetectionV2 *)self
{
  *(void *)&self->_prevDefaultOpticalCenter[4] = v2;
}

- (double)estOpticalCenterOffset
{
  return *(double *)(a1 + 2408);
}

- (void)setEstOpticalCenterOffset:(VideoDeghostingDetectionV2 *)self
{
  self->_prevFrameMergedGhosts = v2;
}

- (double)prevDefaultOpticalCenter
{
  return *(double *)(a1 + 2416);
}

- (void)setPrevDefaultOpticalCenter:(VideoDeghostingDetectionV2 *)self
{
  self->_unint64_t prevFrameAllLSCnt = v2;
}

- (int)estOpticalCenterConsecutiveValidFrameCnt
{
  return self->_trackIDAfterMerge;
}

- (void)setEstOpticalCenterConsecutiveValidFrameCnt:(int)a3
{
  self->_trackIDAfterMerge = a3;
}

- (unsigned)runningAverageLSNumberCount
{
  return self->_LSTrackID;
}

- (void)setRunningAverageLSNumberCount:(unsigned int)a3
{
  self->_int LSTrackID = a3;
}

- (unsigned)runningAverageLSNumberCumSum
{
  return *(_DWORD *)self->_estOpticalCenter;
}

- (void)setRunningAverageLSNumberCumSum:(unsigned int)a3
{
  *(_DWORD *)self->_estOpticalCenter = a3;
}

- (BOOL)estOpticalCenterIsAvailable
{
  return self->_trackID & 1;
}

- (void)setEstOpticalCenterIsAvailable:(BOOL)a3
{
  LOBYTE(self->_trackID) = a3;
}

- (BOOL)prevShouldRunGGDetectionLSBased
{
  return BYTE1(self->_trackID) & 1;
}

- (void)setPrevShouldRunGGDetectionLSBased:(BOOL)a3
{
  BYTE1(self->_trackID) = a3;
}

- (BOOL)prevShouldRunGGDetectionLuxLevelBased
{
  return BYTE2(self->_trackID) & 1;
}

- (void)setPrevShouldRunGGDetectionLuxLevelBased:(BOOL)a3
{
  BYTE2(self->_trackID) = a3;
}

- (BOOL)prevShouldRunGGDetectionClippedPixelBased
{
  return HIBYTE(self->_trackID) & 1;
}

- (void)setPrevShouldRunGGDetectionClippedPixelBased:(BOOL)a3
{
  HIBYTE(self->_trackID) = a3;
}

- ($49C9A23661AC5E3031C2E8EF93B1D168)params
{
  objc_copyStruct(retstr, &self->_params.luxLevelGatingThresholdON, 172, 1, 0);
  return result;
}

- (void)setParams:(id *)a3
{
}

- (int)trackID
{
  return *(_DWORD *)&self->_estOpticalCenter[4];
}

- (void)setTrackID:(int)a3
{
  *(_DWORD *)&self->_estOpticalCenter[4] = a3;
}

- (int)trackIDAfterMerge
{
  return *(_DWORD *)self->_estOpticalCenterOffset;
}

- (void)setTrackIDAfterMerge:(int)a3
{
  *(_DWORD *)self->_estOpticalCenterOffset = a3;
}

- (int)LSTrackID
{
  return *(_DWORD *)&self->_estOpticalCenterOffset[4];
}

- (void)setLSTrackID:(int)a3
{
  *(_DWORD *)&self->_estOpticalCenterOffset[4] = a3;
}

- (NSMutableArray)prevFrameMergedGhosts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 2424, 1);
}

- (void)setPrevFrameMergedGhosts:(id)a3
{
}

- (unint64_t)prevFrameAllLSCnt
{
  return self->_LSMaskLSCnt;
}

- (void)setPrevFrameAllLSCnt:(unint64_t)a3
{
  self->_LSMaskLSCnt = a3;
}

- (unint64_t)prevFrameMatchedLSCnt
{
  return (unint64_t)self->_GGROIs;
}

- (void)setPrevFrameMatchedLSCnt:(unint64_t)a3
{
  self->_GGROIs = (NSMutableArray *)a3;
}

- (unint64_t)LSMaskLSCnt
{
  return (unint64_t)self->_LSROIs;
}

- (void)setLSMaskLSCnt:(unint64_t)a3
{
  self->_LSROIs = (NSMutableArray *)a3;
}

- (NSMutableArray)GGROIs
{
  return self->_reflectedLSROIs;
}

- (void)setGGROIs:(id)a3
{
}

- (NSMutableArray)LSROIs
{
  return self->_rawDesGenKeyPoints;
}

- (void)setLSROIs:(id)a3
{
}

- (NSMutableArray)reflectedLSROIs
{
  return self->_rawLSList;
}

- (void)setReflectedLSROIs:(id)a3
{
}

- (NSMutableArray)rawDesGenKeyPoints
{
  return *(NSMutableArray **)&self->_configuration.internalCfg.clipThreshold;
}

- (void)setRawDesGenKeyPoints:(id)a3
{
}

- (NSMutableArray)rawLSList
{
  return *(NSMutableArray **)&self->_configuration.internalCfg.antiFlareSize;
}

- (void)setRawLSList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration.internalCfg.antiFlareSize, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_rawLSList, 0);
  objc_storeStrong((id *)&self->_rawDesGenKeyPoints, 0);
  objc_storeStrong((id *)&self->_reflectedLSROIs, 0);
  objc_storeStrong((id *)&self->_prevFrameMatchedLSCnt, 0);
  objc_storeStrong((id *)&self->_runningAverageLSNumberCount, 0);
  sub_EDE0((uint64_t)&self->_metalBuffers.desGenGhostIdxBuf);
  for (uint64_t i = 0; i != -100; --i)
    objc_storeStrong((id *)&self->_metaArray[i + 100], 0);
  for (uint64_t j = 1312; j != 512; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_imageDimensions, 0);
  objc_storeStrong((id *)&self->_localMotionReferenceTexture, 0);
  objc_storeStrong((id *)&self->_frameTPlus1Texture, 0);
  objc_storeStrong((id *)&self->_frameTMinus2Texture, 0);
  objc_storeStrong((id *)&self->_frameTMinus1Texture, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);
  objc_storeStrong((id *)&self->_maskToRoi, 0);
  objc_storeStrong((id *)&self->_calcTransform, 0);
  objc_storeStrong((id *)&self->_prevLSLists, 0);
  objc_storeStrong((id *)&self->_metalToolBox, 0);

  objc_storeStrong((id *)&self->_detectionUtils, 0);
}

@end