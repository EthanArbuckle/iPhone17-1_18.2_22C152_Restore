@interface CMIRawNightModeRegistrationStage
+ (int)prewarmShaders:(id)a3;
- (CMIRawNightModeConstrainedRegistrationTuningParams)constrainedRegistrationParams;
- (CMIRawNightModeRegistrationStage)initWithMetalContext:(id)a3;
- (FigRegWarpPPGPUTuningParams)regwarpTuningParams;
- (MTLTexture)referenceShiftMap;
- (__n128)referenceHomography;
- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 depth:(unint64_t)a6 pixelFormat:(unint64_t)a7;
- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6 compressed:(BOOL)a7;
- (int)_compileShaders;
- (int)_downsampleLuma:(id)a3 outputLuma:(id)a4;
- (int)_fuseConfidenceMap:(id)a3 toBlendingWeight:(id)a4;
- (int)_getDraftDemosaicParamsForInputFrame:(id)a3 draftDemosaicParams:(CMIDraftDemosaicParams *)a4;
- (int)_getWarpConfigForInputFrame:(id)a3 warpConfig:(CMIWarpConfig *)a4;
- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 registrationType:(int)a5 gdcMode:(int)a6 cameraInfoByPortType:(id)a7;
- (int)processConstrainedNonReference:(id)a3 reference:(id)a4 nonRefLumaTex:(id)a5 shiftMap:(id)a6 blendingWeight:(id)a7;
- (int)processNonReference:(id)a3 reference:(id)a4 shiftMap:(id)a5 blendingWeight:(id)a6;
- (int)processReference:(id)a3;
- (int)processRegWarpRegDenseNonReference:(id)a3 reference:(id)a4 nonRefLumaTex:(id)a5 shiftMap:(id)a6 blendingWeight:(id)a7;
- (int)registrationType;
- (void)dealloc;
- (void)reset;
- (void)setConstrainedRegistrationParams:(id)a3;
- (void)setRegwarpTuningParams:(id)a3;
@end

@implementation CMIRawNightModeRegistrationStage

- (CMIRawNightModeRegistrationStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CMIRawNightModeRegistrationStage;
  v6 = [(CMIRawNightModeRegistrationStage *)&v28 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  if (!v7->_metal)
  {
    FigDebugAssert3();
    goto LABEL_20;
  }
  v8 = [[CMIDraftDemosaicStage alloc] initWithMetalContext:v7->_metal];
  draftDemosaic = v7->_draftDemosaic;
  v7->_draftDemosaic = v8;

  if (!v7->_draftDemosaic) {
    goto LABEL_19;
  }
  v10 = [[RegDense alloc] initWithMetalContext:v7->_metal];
  regDense = v7->_regDense;
  v7->_regDense = v10;

  if (!v7->_regDense) {
    goto LABEL_19;
  }
  v12 = [[BilateralGrid alloc] initWithContext:v7->_metal];
  bilateralGrid = v7->_bilateralGrid;
  v7->_bilateralGrid = v12;

  if (!v7->_bilateralGrid) {
    goto LABEL_19;
  }
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    long long v27 = 0u;
    memset(v26, 0, sizeof(v26));
    [MEMORY[0x263F2EE70] getDefaults:v26];
    WORD6(v27) = 257;
    DWORD1(v27) = 10;
    id v14 = objc_alloc(MEMORY[0x263F2EE50]);
    v15 = [(FigMetalContext *)v7->_metal commandQueue];
    uint64_t v16 = [v14 initWithOptionalCommandQueue:v15 config:v26];
    regwarp = v7->_regwarp;
    v7->_regwarp = (FigRegWarpPPGPU *)v16;

    if (!v7->_regwarp) {
      goto LABEL_19;
    }
    id v18 = objc_alloc(MEMORY[0x263F2EE00]);
    v19 = [(FigMetalContext *)v7->_metal commandQueue];
    v20 = [(FigMetalContext *)v7->_metal allocator];
    uint64_t v21 = [v18 initWithOptionalCommandQueue:v19 allocator:v20];
    warpStage = v7->_warpStage;
    v7->_warpStage = (CMIWarpStage *)v21;

    if (!v7->_warpStage)
    {
LABEL_19:
      FigDebugAssert3();
LABEL_20:
      if (!FigSignalErrorAt()) {
        goto LABEL_11;
      }
LABEL_21:
      v23 = 0;
      goto LABEL_12;
    }
  }
  if ([(CMIRawNightModeRegistrationStage *)v7 _compileShaders])
  {
    FigDebugAssert3();
    goto LABEL_21;
  }
  v7->_frameIdx = 0;
LABEL_11:
  v23 = v7;
LABEL_12:
  v24 = v23;

  return v24;
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMIDownscale4x" constants:0];
  downsamplePipeline = self->_downsamplePipeline;
  self->_downsamplePipeline = v3;

  if (self->_downsamplePipeline)
  {
    id v5 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMIFuseConfidenceMapIntoBlendingWeight" constants:0];
    fuseBlendingWeightPipeline = self->_fuseBlendingWeightPipeline;
    self->_fuseBlendingWeightPipeline = v5;

    if (self->_fuseBlendingWeightPipeline)
    {
      v7 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegDownsample2D" constants:0];
      constrainedRegDownsample2D = self->_constrainedRegDownsample2D;
      self->_constrainedRegDownsample2D = v7;

      v9 = self->_constrainedRegDownsample2D;
      if (v9)
      {
        if ((unint64_t)[(MTLComputePipelineState *)v9 maxTotalThreadsPerThreadgroup] > 0x3FF)
        {
          v10 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegWarpDownsample2D" constants:0];
          constrainedRegWarpDownsample2D = self->_constrainedRegWarpDownsample2D;
          self->_constrainedRegWarpDownsample2D = v10;

          v12 = self->_constrainedRegWarpDownsample2D;
          if (v12)
          {
            if ((unint64_t)[(MTLComputePipelineState *)v12 maxTotalThreadsPerThreadgroup] > 0x3FF)
            {
              v13 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegWindowAverage" constants:0];
              constrainedRegWindowAverage = self->_constrainedRegWindowAverage;
              self->_constrainedRegWindowAverage = v13;

              if (self->_constrainedRegWindowAverage)
              {
                v15 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegClear" constants:0];
                constrainedRegClear = self->_constrainedRegClear;
                self->_constrainedRegClear = v15;

                if (self->_constrainedRegClear)
                {
                  v17 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegCalcCosts" constants:0];
                  constrainedRegCalcCosts = self->_constrainedRegCalcCosts;
                  self->_constrainedRegCalcCosts = v17;

                  if (self->_constrainedRegCalcCosts)
                  {
                    v19 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegDownsample3D" constants:0];
                    constrainedRegDownsample3D = self->_constrainedRegDownsample3D;
                    self->_constrainedRegDownsample3D = v19;

                    if (self->_constrainedRegDownsample3D)
                    {
                      uint64_t v21 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegUpsampleMix3D" constants:0];
                      constrainedRegUpsampleMix3D = self->_constrainedRegUpsampleMix3D;
                      self->_constrainedRegUpsampleMix3D = v21;

                      if (self->_constrainedRegUpsampleMix3D)
                      {
                        v23 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegUpdateShifts" constants:0];
                        constrainedRegUpdateShifts = self->_constrainedRegUpdateShifts;
                        self->_constrainedRegUpdateShifts = v23;

                        if (self->_constrainedRegUpdateShifts)
                        {
                          v25 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegGenHists" constants:0];
                          constrainedRegGenHists = self->_constrainedRegGenHists;
                          self->_constrainedRegGenHists = v25;

                          if (self->_constrainedRegGenHists)
                          {
                            long long v27 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegGenGrid" constants:0];
                            constrainedRegGenGrid = self->_constrainedRegGenGrid;
                            self->_constrainedRegGenGrid = v27;

                            if (self->_constrainedRegGenGrid)
                            {
                              v29 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegApplyGrid" constants:0];
                              constrainedRegApplyGrid = self->_constrainedRegApplyGrid;
                              self->_constrainedRegApplyGrid = v29;

                              v31 = self->_constrainedRegApplyGrid;
                              if (v31)
                              {
                                if ((unint64_t)[(MTLComputePipelineState *)v31 maxTotalThreadsPerThreadgroup] > 0x3FF)
                                {
                                  v32 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegCreatePriorShifts" constants:0];
                                  constrainedRegCreatePriorShifts = self->_constrainedRegCreatePriorShifts;
                                  self->_constrainedRegCreatePriorShifts = v32;

                                  v34 = self->_constrainedRegCreatePriorShifts;
                                  if (v34)
                                  {
                                    if ((unint64_t)[(MTLComputePipelineState *)v34 maxTotalThreadsPerThreadgroup] > 0x3F)
                                    {
                                      v35 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"constrainedRegCalcWarpedMismatch2D" constants:0];
                                      constrainedRegCalcWarpedMismatch2D = self->_constrainedRegCalcWarpedMismatch2D;
                                      self->_constrainedRegCalcWarpedMismatch2D = v35;

                                      v37 = self->_constrainedRegCalcWarpedMismatch2D;
                                      if (v37)
                                      {
                                        if ((unint64_t)[(MTLComputePipelineState *)v37 maxTotalThreadsPerThreadgroup] > 0x3FF)return 0; {
                                      }
                                        }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3
    && (v4 = [[CMIRawNightModeRegistrationStage alloc] initWithMetalContext:v3]) != 0)
  {
    int v5 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 registrationType:(int)a5 gdcMode:(int)a6 cameraInfoByPortType:(id)a7
{
  id v13 = a7;
  self->_registrationType = a5;
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a7);
  self->_gdcMode = a6;
  id v14 = [(FigMetalContext *)self->_metal allocator];

  if (!v14)
  {
    FigDebugAssert3();
LABEL_18:
    int v24 = FigSignalErrorAt();
    goto LABEL_11;
  }
  if ((a5 - 3) < 2)
  {
    v15 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"previousShifts" width:a3 >> 7 height:a4 >> 7 pixelFormat:65 compressed:0];
    previousShifts = self->_previousShifts;
    self->_previousShifts = v15;

    if (!self->_previousShifts)
    {
LABEL_17:
      FigDebugAssert3();
      goto LABEL_18;
    }
    goto LABEL_7;
  }
  v17 = [(FigMetalContext *)self->_metal allocator];
  [(FigRegWarpPPGPU *)self->_regwarp setAllocator:v17];

  [(FigRegWarpPPGPU *)self->_regwarp setApplyGDC:self->_gdcMode == 1];
  int v18 = [(FigRegWarpPPGPU *)self->_regwarp allocateResources:a3 imageHeight:a4 imageFormat:1278226536 externalMemory:0 externalMemorySize:0];
  if (v18)
  {
    int v24 = v18;
LABEL_16:
    FigDebugAssert3();
    goto LABEL_11;
  }
  uint64_t v27 = 0;
  long long v26 = xmmword_263480A80;
  int v19 = [(BilateralGrid *)self->_bilateralGrid setupWithConfig:&v26 width:a3 >> 3 height:a4 >> 3];
  if (v19)
  {
    int v24 = v19;
    goto LABEL_16;
  }
LABEL_7:
  v20 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"referenceLumaTex" width:a3 >> 1 height:a4 >> 1 pixelFormat:25 compressed:1];
  referenceLumaTex = self->_referenceLumaTex;
  self->_referenceLumaTex = v20;

  if (!self->_referenceLumaTex) {
    goto LABEL_17;
  }
  self->_imageWidth = a3;
  self->_imageHeight = a4;
  if (!self->_toneMappingCurves)
  {
    v22 = [[ToneMappingCurves alloc] initWithWithContext:self->_metal];
    toneMappingCurves = self->_toneMappingCurves;
    self->_toneMappingCurves = v22;

    if (!self->_toneMappingCurves) {
      goto LABEL_17;
    }
  }
  int v24 = 0;
  self->_frameIdx = 0;
LABEL_11:

  return v24;
}

- (void)reset
{
  [(FigRegWarpPPGPU *)self->_regwarp releaseResources];
  [(RegDense *)self->_regDense reset];
  [(BilateralGrid *)self->_bilateralGrid releaseTextures];
  toneMappingCurves = self->_toneMappingCurves;
  self->_toneMappingCurves = 0;

  FigMetalDecRef();
  FigMetalDecRef();
  self->_frameIdx = 0;
}

- (void)dealloc
{
  [(CMIRawNightModeRegistrationStage *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)CMIRawNightModeRegistrationStage;
  [(CMIRawNightModeRegistrationStage *)&v3 dealloc];
}

- (int)processReference:(id)a3
{
  id v5 = a3;
  v6 = v5;
  int v57 = 0;
  id v56 = 0;
  v54[0] = 0;
  v54[1] = 0;
  int v55 = 0;
  v7 = (int *)MEMORY[0x263F00E10];
  if (!v5)
  {
    uint64_t v49 = v3;
    LODWORD(v48) = 0;
    FigDebugAssert3();
LABEL_33:
    int v23 = FigSignalErrorAt();
    goto LABEL_21;
  }
  if (!self->_referenceLumaTex)
  {
    uint64_t v49 = v3;
    LODWORD(v48) = 0;
LABEL_32:
    FigDebugAssert3();
    goto LABEL_33;
  }
  -[RawNightModeInputFrame lscGainsTex]((uint64_t)v5);
  v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  referenceLSCGainsTex = self->_referenceLSCGainsTex;
  self->_referenceLSCGainsTex = v8;

  if (!self->_referenceLSCGainsTex)
  {
    uint64_t v49 = v3;
    LODWORD(v48) = 0;
    goto LABEL_32;
  }
  int v10 = [(CMIRawNightModeRegistrationStage *)self _getDraftDemosaicParamsForInputFrame:v6 draftDemosaicParams:&self->_draftDemosaicParams.firstPix];
  if (v10)
  {
    int v23 = v10;
    uint64_t v49 = v3;
    LODWORD(v48) = v10;
    goto LABEL_38;
  }
  int v11 = *v7;
  if (*v7 == 1)
  {
    kdebug_trace();
    int v11 = *v7;
  }
  if (v11)
  {
    v12 = [(FigMetalContext *)self->_metal commandQueue];
    id v13 = [v12 commandBuffer];

    [v13 setLabel:@"KTRACE_START_MTL"];
    [v13 addCompletedHandler:&__block_literal_global_14];
    [v13 commit];
  }
  id v14 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  v15 = [v14 meta];
  int v16 = *(_DWORD *)([v15 exposureParams] + 48);

  draftDemosaic = self->_draftDemosaic;
  int v18 = -[RawNightModeInputFrame textures]((uint64_t)v6);
  int v19 = [v18 objectAtIndexedSubscript:0];
  referenceLumaTex = self->_referenceLumaTex;
  uint64_t v21 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v6);
  LODWORD(v22) = v16;
  int v23 = [(CMIDraftDemosaicStage *)draftDemosaic runWithInputTex:v19 outputTex:referenceLumaTex cfaLayout:v21 gain:v22];

  if (v23)
  {
    uint64_t v49 = v3;
    LODWORD(v48) = v23;
    goto LABEL_38;
  }
  int v24 = (_OWORD *)-[RawNightModeInputFrame gdcParams]((uint64_t)v6);
  long long v26 = v24[1];
  long long v25 = v24[2];
  *(_OWORD *)&self->_anon_e0[4] = *v24;
  *(_OWORD *)&self->_anon_e0[20] = v26;
  *(_OWORD *)&self->_anon_e0[36] = v25;
  long long v27 = v24[6];
  long long v29 = v24[3];
  long long v28 = v24[4];
  *(_OWORD *)&self->_anon_e0[84] = v24[5];
  *(_OWORD *)&self->_anon_e0[100] = v27;
  *(_OWORD *)&self->_anon_e0[52] = v29;
  *(_OWORD *)&self->_anon_e0[68] = v28;
  if ((self->_registrationType - 3) >= 2)
  {
    [(FigRegWarpPPGPU *)self->_regwarp setTuningParams:self->_regwarpTuningParams];
    if (self->_gdcMode == 2)
    {
      id v56 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"regwarpInputRefTex" width:(unint64_t)self->_imageWidth >> 1 height:(unint64_t)self->_imageHeight >> 1 pixelFormat:25 compressed:1];
      if (!v56)
      {
        uint64_t v49 = v3;
        LODWORD(v48) = 0;
        goto LABEL_32;
      }
      int v35 = [(CMIRawNightModeRegistrationStage *)self _getWarpConfigForInputFrame:v6 warpConfig:v54];
      if (v35)
      {
        int v23 = v35;
        uint64_t v49 = v3;
        LODWORD(v48) = v35;
      }
      else
      {
        int v36 = [(CMIWarpStage *)self->_warpStage runGDC:self->_referenceLumaTex outputTex:v56 warpConfig:v54 gdcParams:&self->_anon_e0[4] inverseGDC:0];
        if (v36)
        {
          int v23 = v36;
          uint64_t v49 = v3;
          LODWORD(v48) = v36;
        }
        else
        {
          int v37 = [(FigRegWarpPPGPU *)self->_regwarp processReferenceTexture:v56 gdcParams:0 regionOfInterest:0 numKeypoints:&v57];
          if (!v37)
          {
            FigMetalDecRef();
            goto LABEL_20;
          }
          int v23 = v37;
          uint64_t v49 = v3;
          LODWORD(v48) = v37;
        }
      }
    }
    else
    {
      int v38 = [(FigRegWarpPPGPU *)self->_regwarp processReferenceTexture:self->_referenceLumaTex gdcParams:&self->_anon_e0[4] regionOfInterest:0 numKeypoints:&v57];
      if (!v38) {
        goto LABEL_20;
      }
      int v23 = v38;
      uint64_t v49 = v3;
      LODWORD(v48) = v38;
    }
LABEL_38:
    FigDebugAssert3();
    goto LABEL_21;
  }
  v30 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v30)
  {
    uint64_t v49 = v3;
    LODWORD(v48) = 0;
    goto LABEL_32;
  }
  v31 = v30;
  v32 = [v30 computeCommandEncoder];
  [v32 setTexture:self->_previousShifts atIndex:0];
  [v32 setComputePipelineState:self->_constrainedRegClear];
  uint64_t v33 = [(MTLTexture *)self->_previousShifts width];
  uint64_t v34 = [(MTLTexture *)self->_previousShifts height];
  v53[0] = v33;
  v53[1] = v34;
  v53[2] = 1;
  int64x2_t v51 = vdupq_n_s64(0x10uLL);
  uint64_t v52 = 1;
  [v32 dispatchThreads:v53 threadsPerThreadgroup:&v51];
  [v32 endEncoding];

LABEL_20:
  v39 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  v40 = (_OWORD *)[v39 regHomography];
  uint64_t v41 = MEMORY[0x263EF89A0];
  long long v42 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  _OWORD *v40 = *MEMORY[0x263EF89A0];
  v40[1] = v42;
  v40[2] = *(_OWORD *)(v41 + 32);

  v43 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  [v43 setRegistrationComplete:1];

  v44 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  [v44 setHasValidRegistration:1];

  int v23 = 0;
LABEL_21:
  if (*v7)
  {
    v45 = [(FigMetalContext *)self->_metal commandQueue];
    v46 = [v45 commandBuffer];

    [v46 setLabel:@"KTRACE_END_MTL"];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __53__CMIRawNightModeRegistrationStage_processReference___block_invoke_2;
    v50[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v50[4], 0, 24);
    [v46 addCompletedHandler:v50];
    [v46 commit];

    if (*v7 == 1) {
      kdebug_trace();
    }
  }
  objc_msgSend(0, "endEncoding", v48, v49);
  FigMetalDecRef();

  return v23;
}

void __53__CMIRawNightModeRegistrationStage_processReference___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __53__CMIRawNightModeRegistrationStage_processReference___block_invoke_2(uint64_t a1, void *a2)
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

- (int)processRegWarpRegDenseNonReference:(id)a3 reference:(id)a4 nonRefLumaTex:(id)a5 shiftMap:(id)a6 blendingWeight:(id)a7
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v93 = a5;
  id v92 = a6;
  id v91 = a7;
  id v115 = 0;
  id v116 = 0;
  id v113 = 0;
  id v114 = 0;
  id v112 = 0;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v107 = 0u;
  int v106 = 0;
  memset(v105, 0, sizeof(v105));
  v103[0] = 0;
  v103[1] = 0;
  int v104 = 0;
  long long v14 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v100 = *MEMORY[0x263EF89A0];
  long long v15 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  long long v101 = v14;
  long long v102 = v15;
  v94 = v13;
  v95 = v12;
  if (!v12 || !v13 || !self->_referenceLSCGainsTex)
  {
    FigDebugAssert3();
LABEL_62:
    int v21 = FigSignalErrorAt();
    goto LABEL_49;
  }
  int v16 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v16 = *MEMORY[0x263F00E10];
  }
  if (v16)
  {
    v17 = [(FigMetalContext *)self->_metal commandQueue];
    int v18 = [v17 commandBuffer];

    [v18 setLabel:@"KTRACE_START_MTL"];
    [v18 addCompletedHandler:&__block_literal_global_225];
    [v18 commit];
  }
  if (self->_gdcMode == 2)
  {
    int v19 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"regwarpInputNonRefTex" width:(unint64_t)self->_imageWidth >> 1 height:(unint64_t)self->_imageHeight >> 1 pixelFormat:25 compressed:1];
    id v20 = v116;
    id v116 = v19;

    if (!v19)
    {
LABEL_61:
      FigDebugAssert3();
      goto LABEL_62;
    }
    int v21 = [(CMIRawNightModeRegistrationStage *)self _getWarpConfigForInputFrame:v12 warpConfig:v103];
    if (v21
      || (int v21 = -[CMIWarpStage runGDC:outputTex:warpConfig:gdcParams:inverseGDC:](self->_warpStage, "runGDC:outputTex:warpConfig:gdcParams:inverseGDC:", v93, v116, v103, -[RawNightModeInputFrame gdcParams]((uint64_t)v12), 0)) != 0|| (int v21 = [(FigRegWarpPPGPU *)self->_regwarp processNonReferenceTexture:v116 gdcParams:0 outputTransform:v105]) != 0)
    {
      FigDebugAssert3();
      goto LABEL_49;
    }
    FigMetalDecRef();
  }
  else
  {
    int v21 = -[FigRegWarpPPGPU processNonReferenceTexture:gdcParams:outputTransform:](self->_regwarp, "processNonReferenceTexture:gdcParams:outputTransform:", v93, -[RawNightModeInputFrame gdcParams]((uint64_t)v12), v105);
    if (v21)
    {
      FigDebugAssert3();
      goto LABEL_49;
    }
  }
  if (*MEMORY[0x263F00E10])
  {
    int v23 = [(FigMetalContext *)self->_metal commandQueue];
    int v24 = [v23 commandBuffer];

    [v24 setLabel:@"KTRACE_END_MTL"];
    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_2;
    v99[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v99[4], 0, 24);
    [v24 addCompletedHandler:v99];
    [v24 commit];

    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
  }
  long long v100 = v105[0];
  *(void *)&long long v22 = *((void *)&v105[1] + 1);
  DWORD2(v22) = v106;
  long long v101 = *(_OWORD *)((char *)v105 + 12);
  long long v102 = v22;
  long long v25 = -[RawNightModeInputFrame properties]((uint64_t)v12);
  long long v26 = (_OWORD *)[v25 regHomography];
  long long v27 = v100;
  long long v28 = v102;
  v26[1] = v101;
  _OWORD v26[2] = v28;
  *long long v26 = v27;

  long long v29 = -[RawNightModeInputFrame properties]((uint64_t)v12);
  [v29 setRegistrationComplete:1];

  v30 = -[RawNightModeInputFrame properties]((uint64_t)v12);
  BOOL v31 = sanityCheckHomography((float32x4_t *)[v30 regHomography]);
  v32 = -[RawNightModeInputFrame properties]((uint64_t)v12);
  [v32 setHasValidRegistration:v31];

  if (dword_26B430EA8)
  {
    int v98 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    uint64_t v33 = (id)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v34 = -[RawNightModeInputFrame properties]((uint64_t)v12);
  int v35 = [v34 hasValidRegistration];

  if (!v35)
  {
    int v21 = 0;
    goto LABEL_49;
  }
  int v36 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v36 = *MEMORY[0x263F00E10];
  }
  if (v36)
  {
    int v37 = [(FigMetalContext *)self->_metal commandQueue];
    int v38 = [v37 commandBuffer];

    [v38 setLabel:@"KTRACE_START_MTL"];
    [v38 addCompletedHandler:&__block_literal_global_231];
    [v38 commit];
  }
  v39 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"reflvl3Tex", (unint64_t)self->_imageWidth >> 3, (unint64_t)self->_imageHeight >> 3, 25, 1, v87, v88 width height pixelFormat compressed];
  id v40 = v115;
  id v115 = v39;

  if (!v115) {
    goto LABEL_61;
  }
  uint64_t v41 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"nonReflvl3Tex" width:(unint64_t)self->_imageWidth >> 3 height:(unint64_t)self->_imageHeight >> 3 pixelFormat:25 compressed:1];
  id v42 = v114;
  id v114 = v41;

  if (!v114) {
    goto LABEL_61;
  }
  int v21 = [(CMIRawNightModeRegistrationStage *)self _downsampleLuma:self->_referenceLumaTex outputLuma:v115];
  if (v21) {
    goto LABEL_63;
  }
  int v21 = [(CMIRawNightModeRegistrationStage *)self _downsampleLuma:v93 outputLuma:v114];
  if (v21) {
    goto LABEL_63;
  }
  v43 = -[CMIRawNightModeRegistrationStage createMetalTexture:width:height:pixelFormat:compressed:](self, "createMetalTexture:width:height:pixelFormat:compressed:", @"confidenceMap", [v92 width], objc_msgSend(v92, "height"), 25, 1);
  id v44 = v112;
  id v112 = v43;

  if (!v112) {
    goto LABEL_61;
  }
  v45 = -[RawNightModeInputFrame properties]((uint64_t)v13);
  v46 = [v45 meta];
  uint64_t v47 = [v46 exposureParams];
  uint64_t v48 = -[RawNightModeInputFrame properties]((uint64_t)v95);
  uint64_t v49 = [v48 meta];
  uint64_t v50 = [v49 exposureParams];
  int64x2_t v51 = -[RawNightModeInputFrame properties]((uint64_t)v95);
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v47, v50, v51);

  DWORD2(v108) = 2;
  *(void *)&long long v109 = self->_bilateralGrid;
  toneMappingCurves = self->_toneMappingCurves;
  v90 = -[RawNightModeInputFrame properties]((uint64_t)v94);
  v53 = [v90 meta];
  uint64_t v54 = [v53 ltmCurves];
  int v55 = -[RawNightModeInputFrame properties]((uint64_t)v94);
  id v56 = [v55 meta];
  uint64_t v57 = [v56 ltmCurves];
  v58 = -[RawNightModeInputFrame properties]((uint64_t)v94);
  v59 = [v58 meta];
  uint64_t v60 = [v59 ltmCurves];
  v61 = -[RawNightModeInputFrame properties]((uint64_t)v94);
  v62 = (double *)[v61 colorSpaceConversionParameters];
  int v21 = -[ToneMappingCurves setToneCurvesWithLTC:GTC:backgroundCurves:colorCorrectionMatrix:enableUTM:dump:](toneMappingCurves, "setToneCurvesWithLTC:GTC:backgroundCurves:colorCorrectionMatrix:enableUTM:dump:", v54, v57, v60, 0, 0, v62[12], v62[14], v62[16]);

  if (v21)
  {
LABEL_63:
    FigDebugAssert3();
    goto LABEL_49;
  }
  v63 = objc_alloc_init(ToneMappingBuffers);
  objc_storeStrong((id *)&v63->curves, self->_toneMappingCurves);
  v64 = v63;
  *((void *)&v109 + 1) = v64;
  LOBYTE(v111) = 1;
  v65 = -[RawNightModeInputFrame properties]((uint64_t)v94);
  v66 = [v65 meta];
  v67 = (_WORD *)[v66 ltmCurves];

  int LTM_tileWidth = getLTM_tileWidth(v67);
  int v69 = LTM_tileWidth;
  if (LTM_tileWidth >= 0) {
    int v70 = LTM_tileWidth;
  }
  else {
    int v70 = LTM_tileWidth + 7;
  }
  int LTM_tileHeight = getLTM_tileHeight(v67);
  int v72 = LTM_tileHeight;
  if (LTM_tileHeight >= 0) {
    int v73 = LTM_tileHeight;
  }
  else {
    int v73 = LTM_tileHeight + 7;
  }
  int LTM_validWidth = getLTM_validWidth(v67);
  int LTM_validHeight = getLTM_validHeight(v67);
  int v76 = [v115 width];
  int v77 = [v115 height];
  int v78 = (v70 >> 3) * LTM_validWidth;
  int v79 = (v73 >> 3) * LTM_validHeight;
  int v80 = v76 - v78;
  if (v76 < v78) {
    ++v80;
  }
  int v81 = (v80 >> 1) + v69 / 16;
  int v82 = v77 - v79;
  if (v77 < v79) {
    ++v82;
  }
  LODWORD(v83) = v81;
  DWORD1(v83) = (v82 >> 1) + v72 / 16;
  DWORD2(v83) = v78 - (v70 >> 3);
  HIDWORD(v83) = v79 - (v73 >> 3);
  long long v110 = v83;
  *(float *)&long long v83 = RelativeBrightnessForProperties;
  int v21 = [(RegDense *)self->_regDense runWithReferenceTex:self->_referenceLumaTex nonReferenceTex:v93 relativeBrightness:&v100 homography:&v107 regDenseParams:v115 refWeightsLevel:v114 nonRefWeightsLevel:*(double *)&v83 outputShiftMap:v92 outputConfidenceMap:v112 outputBlendingWeight:v91];
  if (v21
    || (int v21 = [(CMIRawNightModeRegistrationStage *)self _fuseConfidenceMap:v112 toBlendingWeight:v91]) != 0)
  {
    FigDebugAssert3();
  }
  else
  {
    if (*MEMORY[0x263F00E10])
    {
      v84 = [(FigMetalContext *)self->_metal commandQueue];
      v85 = [v84 commandBuffer];

      [v85 setLabel:@"KTRACE_END_MTL"];
      v96[0] = MEMORY[0x263EF8330];
      v96[1] = 3221225472;
      v96[2] = __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_2_245;
      v96[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
      memset(&v96[4], 0, 24);
      [v85 addCompletedHandler:v96];
      [v85 commit];

      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
    }
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    int v21 = 0;
  }

LABEL_49:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v21;
}

void __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_2(uint64_t a1, void *a2)
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

void __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_229(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __119__CMIRawNightModeRegistrationStage_processRegWarpRegDenseNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_2_245(uint64_t a1, void *a2)
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

- (int)processConstrainedNonReference:(id)a3 reference:(id)a4 nonRefLumaTex:(id)a5 shiftMap:(id)a6 blendingWeight:(id)a7
{
  uint64_t v238 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v156 = a5;
  id v15 = a6;
  id v157 = a7;
  uint64_t v152 = [(MTLTexture *)self->_referenceLumaTex width];
  uint64_t v151 = [(MTLTexture *)self->_referenceLumaTex height];
  id v237 = 0;
  id v236 = 0;
  id v235 = 0;
  id v234 = 0;
  id v233 = 0;
  id v232 = 0;
  id v231 = 0;
  id v230 = 0;
  id v229 = 0;
  id v228 = 0;
  long long v227 = 0u;
  long long v226 = 0u;
  long long v225 = 0u;
  int v16 = (int *)MEMORY[0x263F00E10];
  v154 = v14;
  v155 = v13;
  if (!v13) {
    goto LABEL_66;
  }
  if (!v14)
  {
    uint64_t v146 = v7;
    LODWORD(v145) = 0;
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
    v59 = 0;
    v153 = 0;
    v61 = 0;
LABEL_69:
    uint64_t v60 = 0;
    goto LABEL_48;
  }
  constrainedRegistrationParams = self->_constrainedRegistrationParams;
  if (!constrainedRegistrationParams) {
    goto LABEL_66;
  }
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)constrainedRegistrationParams imageDownsampleGamma];
  DWORD2(v225) = v18;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams sadGamma];
  HIDWORD(v225) = v19;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams localMotionRejectionSigma];
  LODWORD(v226) = v20;
  DWORD1(v226) = [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams regularizationSharpness];
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams regularizationLumaSigma];
  DWORD2(v226) = v21;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams hybridBlendingMaskLumaMismatchGamma];
  HIDWORD(v226) = v22;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams hybridBlendingMaskLumaMismatchSigma];
  LODWORD(v227) = v23;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams minimumPreviousShiftDistance];
  DWORD2(v227) = v24;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams minimumPreviousShiftUpdateDistance];
  HIDWORD(v227) = v25;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams imageDownsampleGamma];
  int v224 = v26;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams costLumaDownsampleGamma];
  int v223 = v27;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams localMotionRejectionWeightDownsampleGamma];
  int v222 = v28;
  [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams hybridBlendingMaskDownsampleGamma];
  int v221 = v29;
  v158 = v15;
  if (self->_registrationType == 4)
  {
    v30 = -[RawNightModeInputFrame textures]((uint64_t)v13);
    BOOL v31 = [v30 objectAtIndexedSubscript:0];
    uint64_t v32 = [v31 width];
    -[RawNightModeInputFrame textures]((uint64_t)v13);
    v34 = uint64_t v33 = (uint64_t)v13;
    int v35 = [v34 objectAtIndexedSubscript:0];
    uint64_t v36 = [v35 height];
    v37.i64[0] = v32;
    v37.i64[1] = v36;
    float32x2_t v38 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v37, v37)));

    v39 = -[RawNightModeInputFrame properties](v33);
    id v40 = [v39 meta];
    [v40 opticalCenter];
    float32x2_t v42 = v41;
    v43 = -[RawNightModeInputFrame properties]((uint64_t)v14);
    id v44 = [v43 meta];
    [v44 opticalCenter];
    float32x2_t v46 = vsub_f32(v42, v45);

    id v13 = (id)v33;
    id v15 = v158;

    float32x2_t v159 = vdiv_f32(v46, v38);
    *(float32x2_t *)&long long v225 = v46;
    uint64_t v47 = -[RawNightModeInputFrame properties](v33);
    uint64_t v48 = [v47 regHomography];
    __asm { FMOV            V0.4S, #1.0 }
    *(_DWORD *)(v48 + 8) = v159.i32[0];
    *(void *)uint64_t v48 = _Q0;
    *(void *)(v48 + 16) = 0x3F80000000000000;
    *(_DWORD *)(v48 + 24) = v159.i32[1];
    *(_DWORD *)(v48 + 40) = 1065353216;
    *(void *)(v48 + 32) = 0;
  }
  int v54 = *v16;
  if (*v16 == 1)
  {
    kdebug_trace();
    int v54 = *v16;
  }
  if (v54)
  {
    int v55 = [(FigMetalContext *)self->_metal commandQueue];
    id v56 = [v55 commandBuffer];

    [v56 setLabel:@"KTRACE_START_MTL"];
    [v56 addCompletedHandler:&__block_literal_global_248];
    [v56 commit];
  }
  uint64_t v57 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v57)
  {
LABEL_66:
    uint64_t v146 = v7;
    LODWORD(v145) = 0;
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
    v59 = 0;
    v153 = 0;
LABEL_68:
    v61 = 0;
    id v14 = 0;
    goto LABEL_69;
  }
  v58 = v57;
  v59 = [v57 computeCommandEncoder];
  v153 = v58;
  if (!v59)
  {
    uint64_t v146 = v7;
    LODWORD(v145) = 0;
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
    goto LABEL_68;
  }
  if ([(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationParams enabled])
  {
    uint64_t v60 = objc_opt_new();
    if (!v60)
    {
      uint64_t v146 = v7;
      LODWORD(v145) = 0;
      FigDebugAssert3();
      int v134 = FigSignalErrorAt();
      v61 = 0;
      id v14 = 0;
      goto LABEL_48;
    }
    id v14 = (id)objc_opt_new();
    if (!v14)
    {
      uint64_t v146 = v7;
      LODWORD(v145) = 0;
      FigDebugAssert3();
      int v134 = FigSignalErrorAt();
      v61 = 0;
      goto LABEL_48;
    }
    v61 = objc_opt_new();
    if (v61)
    {
      unint64_t v62 = v152 + 1;
      unint64_t v147 = (unint64_t)(v151 + 1) >> 1;
      unint64_t v148 = (unint64_t)(v152 + 1) >> 1;
      v63 = -[CMIRawNightModeRegistrationStage createMetalTexture:width:height:pixelFormat:compressed:](self, "createMetalTexture:width:height:pixelFormat:compressed:", @"luma4xRef");
      id v232 = v63;
      if (v63)
      {
        v64 = v63;
        unint64_t v65 = (unint64_t)(v151 + 1) >> 6;
        [v59 setTexture:self->_referenceLumaTex atIndex:3];
        [v59 setTexture:v64 atIndex:4];
        [v59 setBytes:&v225 length:48 atIndex:0];
        [v59 setBytes:&v224 length:4 atIndex:1];
        [v59 setComputePipelineState:self->_constrainedRegDownsample2D];
        [v59 setImageblockWidth:32 height:32];
        v220[0] = [v232 width];
        v220[1] = [v232 height];
        v220[2] = 1;
        int64x2_t v218 = vdupq_n_s64(0x20uLL);
        uint64_t v219 = 1;
        [v59 dispatchThreads:v220 threadsPerThreadgroup:&v218];
        v66 = objc_msgSend(NSString, "stringWithFormat:", @"lumaWinAvg_level%d", objc_msgSend(v14, "count"));
        v67 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:v66 width:v62 >> 6 height:v65 pixelFormat:25 compressed:0];
        id v68 = v237;
        id v237 = v67;

        if (v237)
        {
          unint64_t v149 = v62 >> 6;
          unint64_t v150 = (unint64_t)(v151 + 1) >> 6;
          objc_msgSend(v14, "addObject:");
          [v59 setTexture:v232 atIndex:3];
          [v59 setTexture:v237 atIndex:4];
          [v59 setBytes:&v225 length:48 atIndex:0];
          [v59 setComputePipelineState:self->_constrainedRegWindowAverage];
          v217[0] = [v237 width];
          v217[1] = [v237 height];
          v217[2] = 1;
          int64x2_t v215 = vdupq_n_s64(0x20uLL);
          uint64_t v216 = 1;
          [v59 dispatchThreadgroups:v217 threadsPerThreadgroup:&v215];
          if ((unint64_t)[v237 width] >= 2)
          {
            int64x2_t v160 = vdupq_n_s64(8uLL);
            while ((unint64_t)[v237 height] >= 2)
            {
              int v69 = objc_msgSend(NSString, "stringWithFormat:", @"lumaWinAvg_level%d", objc_msgSend(v14, "count"));
              unint64_t v70 = (unint64_t)([v237 width] + 1) >> 1;
              v71 = -[CMIRawNightModeRegistrationStage createMetalTexture:width:height:pixelFormat:compressed:](self, "createMetalTexture:width:height:pixelFormat:compressed:", v69, v70, (unint64_t)([v237 height] + 1) >> 1, 25, 0);
              id v72 = v237;
              id v237 = v71;

              if (!v237)
              {
                uint64_t v146 = v7;
                LODWORD(v145) = 0;
                goto LABEL_63;
              }
              int v73 = [v14 lastObject];
              [v59 setTexture:v73 atIndex:3];

              [v59 setTexture:v237 atIndex:4];
              [v59 setBytes:&v225 length:48 atIndex:0];
              [v59 setBytes:&v223 length:4 atIndex:1];
              [v59 setComputePipelineState:self->_constrainedRegDownsample2D];
              [v59 setImageblockWidth:8 height:8];
              uint64_t v74 = [v237 width];
              uint64_t v75 = [v237 height];
              v214[0] = v74;
              v214[1] = v75;
              v214[2] = 1;
              int64x2_t v212 = v160;
              uint64_t v213 = 1;
              [v59 dispatchThreads:v214 threadsPerThreadgroup:&v212];
              [v14 addObject:v237];
              if ((unint64_t)[v237 width] <= 1) {
                break;
              }
            }
          }
          int v76 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"lumaHists" width:256 height:v149 depth:v65 pixelFormat:13];
          id v77 = v231;
          id v231 = v76;

          if (v231)
          {
            [v59 setTexture:v232 atIndex:3];
            [v59 setTexture:v231 atIndex:9];
            [v59 setComputePipelineState:self->_constrainedRegGenHists];
            v211[0] = [v231 height];
            v211[1] = [v231 depth];
            v211[2] = 1;
            int64x2_t v209 = vdupq_n_s64(0x20uLL);
            uint64_t v210 = 1;
            [v59 dispatchThreadgroups:v211 threadsPerThreadgroup:&v209];
            int v78 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"luma4xNonRef" width:v148 height:v147 pixelFormat:25 compressed:1];
            id v79 = v233;
            id v233 = v78;

            id v15 = v158;
            if (v233)
            {
              [v59 setTexture:v156 atIndex:3];
              [v59 setTexture:v233 atIndex:4];
              [v59 setTexture:self->_previousShifts atIndex:0];
              [v59 setBytes:&v225 length:48 atIndex:0];
              [v59 setComputePipelineState:self->_constrainedRegWarpDownsample2D];
              [v59 setImageblockWidth:32 height:32];
              v208[0] = [v233 width];
              v208[1] = [v233 height];
              v208[2] = 1;
              int64x2_t v206 = vdupq_n_s64(0x20uLL);
              uint64_t v207 = 1;
              [v59 dispatchThreads:v208 threadsPerThreadgroup:&v206];
              int v80 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"shiftCosts_level0" width:25 height:v149 depth:v65 pixelFormat:53];
              id v81 = v236;
              id v236 = v80;

              if (v236)
              {
                objc_msgSend(v60, "addObject:");
                int v82 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"costWeights_level0" width:v149 height:v65 pixelFormat:10 compressed:0];
                id v83 = v235;
                id v235 = v82;

                if (v235)
                {
                  objc_msgSend(v61, "addObject:");
                  [v59 setTexture:v232 atIndex:2];
                  [v59 setTexture:v233 atIndex:3];
                  [v59 setTexture:v236 atIndex:5];
                  [v59 setTexture:v235 atIndex:7];
                  [v59 setBytes:&v225 length:48 atIndex:0];
                  [v59 setComputePipelineState:self->_constrainedRegCalcCosts];
                  v205[0] = v149;
                  v205[1] = (unint64_t)(v151 + 1) >> 6;
                  v205[2] = 1;
                  int64x2_t v203 = vdupq_n_s64(0x20uLL);
                  uint64_t v204 = 1;
                  [v59 dispatchThreadgroups:v205 threadsPerThreadgroup:&v203];
                  FigMetalDecRef();
                  if ((unint64_t)[v235 width] >= 2)
                  {
                    int64x2_t v161 = vdupq_n_s64(8uLL);
                    while ((unint64_t)[v235 height] >= 2)
                    {
                      v84 = objc_msgSend(NSString, "stringWithFormat:", @"costWeights_level%d", objc_msgSend(v61, "count"));
                      unint64_t v85 = (unint64_t)([v235 width] + 1) >> 1;
                      v86 = -[CMIRawNightModeRegistrationStage createMetalTexture:width:height:pixelFormat:compressed:](self, "createMetalTexture:width:height:pixelFormat:compressed:", v84, v85, (unint64_t)([v235 height] + 1) >> 1, 10, 0);
                      id v87 = v235;
                      id v235 = v86;

                      if (!v235)
                      {
                        uint64_t v146 = v7;
                        LODWORD(v145) = 0;
                        goto LABEL_63;
                      }
                      uint64_t v88 = [v61 lastObject];
                      [v59 setTexture:v88 atIndex:3];

                      [v59 setTexture:v235 atIndex:4];
                      [v59 setBytes:&v225 length:48 atIndex:0];
                      [v59 setBytes:&v222 length:4 atIndex:1];
                      [v59 setComputePipelineState:self->_constrainedRegDownsample2D];
                      [v59 setImageblockWidth:8 height:8];
                      uint64_t v89 = [v235 width];
                      uint64_t v90 = [v235 height];
                      v202[0] = v89;
                      v202[1] = v90;
                      v202[2] = 1;
                      int64x2_t v200 = v161;
                      uint64_t v201 = 1;
                      [v59 dispatchThreads:v202 threadsPerThreadgroup:&v200];
                      [v61 addObject:v235];
                      if ((unint64_t)[v235 width] <= 1) {
                        break;
                      }
                    }
                  }
                  if ((unint64_t)[v236 height] >= 2)
                  {
                    while ((unint64_t)[v236 depth] >= 2)
                    {
                      id v91 = objc_msgSend(NSString, "stringWithFormat:", @"shiftCosts_level%d", objc_msgSend(v60, "count"));
                      uint64_t v92 = [v236 width];
                      unint64_t v93 = (unint64_t)([v236 height] + 1) >> 1;
                      v94 = -[CMIRawNightModeRegistrationStage createMetalTexture:width:height:depth:pixelFormat:](self, "createMetalTexture:width:height:depth:pixelFormat:", v91, v92, v93, (unint64_t)([v236 depth] + 1) >> 1, 53);
                      id v95 = v236;
                      id v236 = v94;

                      if (!v236)
                      {
                        uint64_t v146 = v7;
                        LODWORD(v145) = 0;
                        goto LABEL_63;
                      }
                      v96 = [v60 lastObject];
                      [v59 setTexture:v96 atIndex:5];

                      v97 = objc_msgSend(v61, "objectAtIndexedSubscript:", objc_msgSend(v60, "count") - 1);
                      [v59 setTexture:v97 atIndex:7];

                      [v59 setTexture:v236 atIndex:6];
                      [v59 setComputePipelineState:self->_constrainedRegDownsample3D];
                      uint64_t v98 = [v236 width];
                      uint64_t v99 = [v236 height];
                      uint64_t v100 = [v236 depth];
                      v199[0] = v98;
                      v199[1] = v99;
                      v199[2] = v100;
                      uint64_t v197 = [v236 width];
                      long long v198 = xmmword_263380150;
                      [v59 dispatchThreads:v199 threadsPerThreadgroup:&v197];
                      [v60 addObject:v236];
                      if ((unint64_t)[v236 height] <= 1) {
                        break;
                      }
                    }
                  }
                  id v15 = v158;
                  if ((unint64_t)[v60 count] >= 2)
                  {
                    do
                    {
                      long long v101 = [v60 lastObject];
                      id v102 = v236;
                      id v236 = v101;

                      [v60 removeLastObject];
                      v103 = [v14 lastObject];
                      id v104 = v237;
                      id v237 = v103;

                      [v14 removeLastObject];
                      v105 = [v61 lastObject];
                      id v106 = v235;
                      id v235 = v105;

                      [v61 removeLastObject];
                      long long v107 = [v60 lastObject];
                      [v59 setTexture:v107 atIndex:5];

                      [v59 setTexture:v236 atIndex:6];
                      long long v108 = [v14 lastObject];
                      [v59 setTexture:v108 atIndex:3];

                      [v59 setTexture:v237 atIndex:4];
                      long long v109 = [v61 lastObject];
                      [v59 setTexture:v109 atIndex:7];

                      [v59 setTexture:v235 atIndex:8];
                      [v59 setBytes:&v225 length:48 atIndex:0];
                      [v59 setComputePipelineState:self->_constrainedRegUpsampleMix3D];
                      uint64_t v110 = [v236 width];
                      uint64_t v111 = [v236 height] + 1;
                      uint64_t v112 = [v236 depth];
                      v196[0] = v110;
                      v196[1] = v111;
                      v196[2] = v112 + 1;
                      uint64_t v194 = [v236 width];
                      long long v195 = xmmword_263380150;
                      [v59 dispatchThreads:v196 threadsPerThreadgroup:&v194];
                      FigMetalDecRef();
                      FigMetalDecRef();
                      FigMetalDecRef();
                    }
                    while ((unint64_t)[v60 count] > 1);
                  }
                  id v113 = [v14 lastObject];
                  id v114 = v237;
                  id v237 = v113;

                  [v14 removeLastObject];
                  FigMetalDecRef();
                  id v115 = [v61 lastObject];
                  id v116 = v235;
                  id v235 = v115;

                  [v61 removeLastObject];
                  FigMetalDecRef();
                  uint64_t v117 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"currentShifts" width:v149 height:v150 pixelFormat:65 compressed:0];
                  id v118 = v234;
                  id v234 = v117;

                  if (v234)
                  {
                    v119 = [v60 lastObject];
                    id v120 = v236;
                    id v236 = v119;

                    [v60 removeLastObject];
                    [v59 setTexture:v236 atIndex:5];
                    [v59 setTexture:self->_previousShifts atIndex:0];
                    [v59 setTexture:v234 atIndex:1];
                    [v59 setComputePipelineState:self->_constrainedRegUpdateShifts];
                    v193[0] = [v234 width];
                    v193[1] = [v234 height];
                    v193[2] = 1;
                    int64x2_t v191 = vdupq_n_s64(0x10uLL);
                    uint64_t v192 = 1;
                    [v59 dispatchThreads:v193 threadsPerThreadgroup:&v191];
                    FigMetalDecRef();
                    v121 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"crossBilateralGrid" width:256 height:v149 depth:v150 pixelFormat:65];
                    id v122 = v230;
                    id v230 = v121;

                    id v13 = v155;
                    if (v230)
                    {
                      [v59 setTexture:v231 atIndex:9];
                      [v59 setTexture:v234 atIndex:0];
                      [v59 setTexture:v230 atIndex:10];
                      [v59 setComputePipelineState:self->_constrainedRegGenGrid];
                      v190[0] = 64;
                      v190[1] = [v230 height];
                      v190[2] = [v230 depth];
                      long long v188 = xmmword_263480A70;
                      uint64_t v189 = 4;
                      [v59 dispatchThreads:v190 threadsPerThreadgroup:&v188];
                      FigMetalDecRef();
                      [v59 setTexture:v230 atIndex:10];
                      [v59 setTexture:v232 atIndex:3];
                      [v59 setTexture:v158 atIndex:0];
                      [v59 setBytes:&v225 length:48 atIndex:0];
                      [v59 setComputePipelineState:self->_constrainedRegApplyGrid];
                      [v59 setImageblockWidth:32 height:32];
                      v187[0] = [v158 width];
                      v187[1] = [v158 height];
                      v187[2] = 1;
                      int64x2_t v185 = vdupq_n_s64(0x20uLL);
                      uint64_t v186 = 1;
                      [v59 dispatchThreads:v187 threadsPerThreadgroup:&v185];
                      FigMetalDecRef();
                      FigMetalDecRef();
                      [v59 setTexture:v234 atIndex:0];
                      [v59 setTexture:self->_previousShifts atIndex:1];
                      [v59 setBytes:&v225 length:48 atIndex:0];
                      [v59 setComputePipelineState:self->_constrainedRegCreatePriorShifts];
                      [v59 setImageblockWidth:8 height:8];
                      uint64_t v123 = [(MTLTexture *)self->_previousShifts width];
                      uint64_t v124 = [(MTLTexture *)self->_previousShifts height];
                      v184[0] = v123;
                      v184[1] = v124;
                      v184[2] = 1;
                      int64x2_t v182 = vdupq_n_s64(8uLL);
                      uint64_t v183 = 1;
                      [v59 dispatchThreads:v184 threadsPerThreadgroup:&v182];
                      FigMetalDecRef();
                      v125 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"mismatch2xTex" width:v152 height:v151 pixelFormat:10 compressed:1];
                      id v126 = v229;
                      id v229 = v125;

                      if (v229)
                      {
                        [v59 setTexture:v158 atIndex:0];
                        [v59 setTexture:v156 atIndex:3];
                        [v59 setTexture:self->_referenceLumaTex atIndex:2];
                        [v59 setTexture:v229 atIndex:12];
                        [v59 setBytes:&v225 length:48 atIndex:0];
                        [v59 setComputePipelineState:self->_constrainedRegCalcWarpedMismatch2D];
                        [v59 setImageblockWidth:32 height:32];
                        v181[0] = [v229 width];
                        v181[1] = [v229 height];
                        v181[2] = 1;
                        int64x2_t v179 = vdupq_n_s64(0x20uLL);
                        uint64_t v180 = 1;
                        [v59 dispatchThreads:v181 threadsPerThreadgroup:&v179];
                        v127 = [(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"mismatch4xTex" width:v148 height:v147 pixelFormat:10 compressed:1];
                        id v128 = v228;
                        id v228 = v127;

                        if (v228)
                        {
                          [v59 setTexture:v229 atIndex:3];
                          [v59 setTexture:v228 atIndex:4];
                          [v59 setBytes:&v225 length:48 atIndex:0];
                          [v59 setBytes:&v221 length:4 atIndex:1];
                          [v59 setComputePipelineState:self->_constrainedRegDownsample2D];
                          [v59 setImageblockWidth:32 height:32];
                          v178[0] = [v228 width];
                          v178[1] = [v228 height];
                          v178[2] = 1;
                          int64x2_t v162 = vdupq_n_s64(0x20uLL);
                          int64x2_t v176 = v162;
                          uint64_t v177 = 1;
                          [v59 dispatchThreads:v178 threadsPerThreadgroup:&v176];
                          FigMetalDecRef();
                          [v59 setTexture:v228 atIndex:3];
                          [v59 setTexture:v157 atIndex:4];
                          [v59 setBytes:&v225 length:48 atIndex:0];
                          [v59 setBytes:&v221 length:4 atIndex:1];
                          [v59 setComputePipelineState:self->_constrainedRegDownsample2D];
                          [v59 setImageblockWidth:32 height:32];
                          v175[0] = [v157 width];
                          v175[1] = [v157 height];
                          v175[2] = 1;
                          int64x2_t v173 = v162;
                          uint64_t v174 = 1;
                          [v59 dispatchThreads:v175 threadsPerThreadgroup:&v173];
                          FigMetalDecRef();
                          goto LABEL_44;
                        }
                        uint64_t v146 = v7;
                        LODWORD(v145) = 0;
                      }
                      else
                      {
                        uint64_t v146 = v7;
                        LODWORD(v145) = 0;
                      }
                    }
                    else
                    {
                      uint64_t v146 = v7;
                      LODWORD(v145) = 0;
                    }
                  }
                  else
                  {
                    uint64_t v146 = v7;
                    LODWORD(v145) = 0;
                  }
                }
                else
                {
                  uint64_t v146 = v7;
                  LODWORD(v145) = 0;
                }
              }
              else
              {
                uint64_t v146 = v7;
                LODWORD(v145) = 0;
              }
            }
            else
            {
              uint64_t v146 = v7;
              LODWORD(v145) = 0;
            }
LABEL_83:
            FigDebugAssert3();
            int v134 = FigSignalErrorAt();
            goto LABEL_48;
          }
          uint64_t v146 = v7;
          LODWORD(v145) = 0;
        }
        else
        {
          uint64_t v146 = v7;
          LODWORD(v145) = 0;
        }
      }
      else
      {
        uint64_t v146 = v7;
        LODWORD(v145) = 0;
      }
LABEL_63:
      FigDebugAssert3();
      int v134 = FigSignalErrorAt();
      goto LABEL_47;
    }
    uint64_t v146 = v7;
    LODWORD(v145) = 0;
    goto LABEL_83;
  }
  [v59 setTexture:v15 atIndex:0];
  [v59 setComputePipelineState:self->_constrainedRegClear];
  v172[0] = [v15 width];
  v172[1] = [v15 height];
  v172[2] = 1;
  int64x2_t v163 = vdupq_n_s64(0x10uLL);
  int64x2_t v170 = v163;
  uint64_t v171 = 1;
  [v59 dispatchThreads:v172 threadsPerThreadgroup:&v170];
  [v59 setTexture:v157 atIndex:0];
  [v59 setComputePipelineState:self->_constrainedRegClear];
  v169[0] = [v157 width];
  v169[1] = [v157 height];
  v169[2] = 1;
  int64x2_t v167 = v163;
  uint64_t v168 = 1;
  [v59 dispatchThreads:v169 threadsPerThreadgroup:&v167];
  v61 = 0;
  id v14 = 0;
  uint64_t v60 = 0;
LABEL_44:
  [v59 endEncoding];

  [(FigMetalContext *)self->_metal forceCommit];
  v129 = -[RawNightModeInputFrame properties]((uint64_t)v13);
  [v129 setRegistrationComplete:1];

  v130 = -[RawNightModeInputFrame properties]((uint64_t)v13);
  BOOL v131 = sanityCheckHomography((float32x4_t *)[v130 regHomography]);
  v132 = -[RawNightModeInputFrame properties]((uint64_t)v13);
  [v132 setHasValidRegistration:v131];

  if (dword_26B430EA8)
  {
    int v166 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v59 = 0;
    int v134 = 0;
LABEL_47:
    id v15 = v158;
    goto LABEL_48;
  }
  v59 = 0;
  int v134 = 0;
LABEL_48:
  v135 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    v136 = [(FigMetalContext *)self->_metal commandQueue];
    v137 = [v136 commandBuffer];

    [v137 setLabel:@"KTRACE_END_MTL"];
    v164[0] = MEMORY[0x263EF8330];
    v164[1] = 3221225472;
    v164[2] = __115__CMIRawNightModeRegistrationStage_processConstrainedNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_301;
    v164[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v164[4], 0, 24);
    [v137 addCompletedHandler:v164];
    [v137 commit];

    if (*v135 == 1) {
      kdebug_trace();
    }
  }
  ++self->_frameIdx;
  objc_msgSend(v59, "endEncoding", v145, v146);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  while (1)
  {
    FigMetalDecRef();
    if (![v60 count]) {
      break;
    }
    v138 = [v60 lastObject];
    id v139 = v236;
    id v236 = v138;

    [v60 removeLastObject];
  }
  while ([v14 count])
  {
    v140 = [v14 lastObject];
    id v141 = v237;
    id v237 = v140;

    [v14 removeLastObject];
    FigMetalDecRef();
  }
  while ([v61 count])
  {
    v142 = [v61 lastObject];
    id v143 = v235;
    id v235 = v142;

    [v61 removeLastObject];
    FigMetalDecRef();
  }

  return v134;
}

void __115__CMIRawNightModeRegistrationStage_processConstrainedNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __115__CMIRawNightModeRegistrationStage_processConstrainedNonReference_reference_nonRefLumaTex_shiftMap_blendingWeight___block_invoke_301(uint64_t a1, void *a2)
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

- (int)processNonReference:(id)a3 reference:(id)a4 shiftMap:(id)a5 blendingWeight:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v26 = 0;
  if (!v10
    || !self->_referenceLSCGainsTex
    || ([(CMIRawNightModeRegistrationStage *)self createMetalTexture:@"nonReferenceLumaTex" width:(unint64_t)self->_imageWidth >> 1 height:(unint64_t)self->_imageHeight >> 1 pixelFormat:25 compressed:1], uint64_t v14 = objc_claimAutoreleasedReturnValue(), (v26 = (void *)v14) == 0))
  {
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v15 = v14;
  int v16 = -[RawNightModeInputFrame properties]((uint64_t)v10);
  v17 = [v16 meta];
  int v18 = *(_DWORD *)([v17 exposureParams] + 48);

  draftDemosaic = self->_draftDemosaic;
  int v20 = -[RawNightModeInputFrame textures]((uint64_t)v10);
  int v21 = [v20 objectAtIndexedSubscript:0];
  uint64_t v22 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v10);
  LODWORD(v23) = v18;
  int v24 = [(CMIDraftDemosaicStage *)draftDemosaic runWithInputTex:v21 outputTex:v15 cfaLayout:v22 gain:v23];

  if (v24) {
    goto LABEL_11;
  }
  if ((self->_registrationType - 3) >= 2)
  {
    int v24 = [(CMIRawNightModeRegistrationStage *)self processRegWarpRegDenseNonReference:v10 reference:v11 nonRefLumaTex:v15 shiftMap:v12 blendingWeight:v13];
    if (!v24) {
      goto LABEL_9;
    }
LABEL_11:
    FigDebugAssert3();
    goto LABEL_9;
  }
  int v24 = [(CMIRawNightModeRegistrationStage *)self processConstrainedNonReference:v10 reference:v11 nonRefLumaTex:v15 shiftMap:v12 blendingWeight:v13];
  if (v24) {
    goto LABEL_11;
  }
LABEL_9:
  FigMetalDecRef();

  return v24;
}

- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6 compressed:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = [(FigMetalContext *)self->_metal allocator];
  id v13 = (void *)[v12 newTextureDescriptor];

  if (!v13) {
    goto LABEL_11;
  }
  uint64_t v14 = [v13 desc];
  [v14 setTextureType:2];

  uint64_t v15 = [v13 desc];
  [v15 setWidth:a4];

  int v16 = [v13 desc];
  [v16 setHeight:a5];

  if (v7) {
    uint64_t v17 = 16391;
  }
  else {
    uint64_t v17 = 7;
  }
  int v18 = [v13 desc];
  [v18 setUsage:v17];

  int v19 = [v13 desc];
  [v19 setPixelFormat:a6];

  if (!v7)
  {
    int v20 = [v13 desc];
    [v20 setCompressionMode:2];

    int v21 = [v13 desc];
    [v21 setCompressionFootprint:0];
  }
  [v13 setLabel:0];
  uint64_t v22 = [(FigMetalContext *)self->_metal allocator];
  double v23 = (void *)[v22 newTextureWithDescriptor:v13];

  if (!v23)
  {
LABEL_11:
    FigDebugAssert3();
    FigSignalErrorAt();
    double v23 = 0;
  }

  return v23;
}

- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 depth:(unint64_t)a6 pixelFormat:(unint64_t)a7
{
  id v12 = [(FigMetalContext *)self->_metal allocator];
  id v13 = (void *)[v12 newTextureDescriptor];

  if (!v13) {
    goto LABEL_6;
  }
  uint64_t v14 = [v13 desc];
  [v14 setTextureType:7];

  uint64_t v15 = [v13 desc];
  [v15 setWidth:a4];

  int v16 = [v13 desc];
  [v16 setHeight:a5];

  uint64_t v17 = [v13 desc];
  [v17 setDepth:a6];

  int v18 = [v13 desc];
  [v18 setUsage:7];

  int v19 = [v13 desc];
  [v19 setPixelFormat:a7];

  int v20 = [v13 desc];
  [v20 setCompressionMode:2];

  int v21 = [v13 desc];
  [v21 setCompressionFootprint:0];

  [v13 setLabel:0];
  uint64_t v22 = [(FigMetalContext *)self->_metal allocator];
  double v23 = (void *)[v22 newTextureWithDescriptor:v13];

  if (!v23)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    double v23 = 0;
  }

  return v23;
}

- (int)_downsampleLuma:(id)a3 outputLuma:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && (unint64_t)[(MTLComputePipelineState *)self->_downsamplePipeline maxTotalThreadsPerThreadgroup] > 0x3FF&& ([(FigMetalContext *)self->_metal commandBuffer], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    id v11 = [v9 computeCommandEncoder];
    if (v11)
    {
      id v12 = v11;
      [v11 setComputePipelineState:self->_downsamplePipeline];
      [v12 setImageblockWidth:32 height:32];
      [v12 setTexture:v6 atIndex:0];
      [v12 setTexture:v8 atIndex:1];
      v17[0] = [v8 width];
      v17[1] = [v8 height];
      v17[2] = 1;
      int64x2_t v15 = vdupq_n_s64(0x20uLL);
      uint64_t v16 = 1;
      [v12 dispatchThreads:v17 threadsPerThreadgroup:&v15];
      [v12 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v13 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)_fuseConfidenceMap:(id)a3 toBlendingWeight:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && (unint64_t)[(MTLComputePipelineState *)self->_fuseBlendingWeightPipeline maxTotalThreadsPerThreadgroup] > 0x3FF&& ([(FigMetalContext *)self->_metal commandBuffer], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    id v11 = [v9 computeCommandEncoder];
    if (v11)
    {
      id v12 = v11;
      [v11 setComputePipelineState:self->_fuseBlendingWeightPipeline];
      [v12 setImageblockWidth:32 height:32];
      [v12 setTexture:v6 atIndex:0];
      [v12 setTexture:v8 atIndex:1];
      v17[0] = [v8 width];
      v17[1] = [v8 height];
      v17[2] = 1;
      int64x2_t v15 = vdupq_n_s64(0x20uLL);
      uint64_t v16 = 1;
      [v12 dispatchThreads:v17 threadsPerThreadgroup:&v15];
      [v12 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v13 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)_getWarpConfigForInputFrame:(id)a3 warpConfig:(CMIWarpConfig *)a4
{
  id v6 = a3;
  id v7 = v6;
  char v43 = 0;
  if (!v6
    || !a4
    || (-[RawNightModeInputFrame metadata]((uint64_t)v6), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v41 = FigSignalErrorAt();
    goto LABEL_11;
  }
  v9 = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (!v10)
  {
    FigDebugAssert3();
    int v41 = FigSignalErrorAt();
LABEL_15:

    goto LABEL_11;
  }
  id v11 = (void *)v10;
  uint64_t v12 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v10];
  if (!v12)
  {
    FigDebugAssert3();
    int v41 = FigSignalErrorAt();

    goto LABEL_15;
  }
  int v13 = (void *)v12;
  signed int v14 = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0);
  if (!v14) {
    goto LABEL_16;
  }
  signed int v15 = v14;
  double v16 = *MEMORY[0x263F001A0];
  double v17 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v18 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v19 = *(double *)(MEMORY[0x263F001A0] + 24);
  objc_msgSend(v9, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F680], &v43, *MEMORY[0x263F001A0], v17, v18, v19);
  if (!v43) {
    goto LABEL_16;
  }
  double v22 = v20;
  double v23 = v21;
  objc_msgSend(v9, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F660], &v43, v16, v17, v18, v19);
  if (v43)
  {
    int32x2_t v28 = vdup_n_s32(v15);
    v29.i32[0] = (int)v22;
    v29.i32[1] = (int)v23;
    v30.i32[0] = (int)v24;
    v30.i32[1] = (int)v25;
    unsigned int v31 = v26;
    int32x2_t v32 = (int32x2_t)vand_s8(v30, (int8x8_t)0xFFFF0000FFFFLL);
    int32x2_t v33 = vmla_s32((int32x2_t)v30, v29, v28);
    v33.i32[0] /= v15;
    v33.i32[1] /= v15;
    int8x8_t v34 = vand_s8((int8x8_t)v28, (int8x8_t)0xFFFF0000FFFFLL);
    v32.i32[0] /= (unsigned __int32)v34.i32[0];
    v32.i32[1] /= (unsigned __int32)v34.i32[1];
    int8x8_t v35 = (int8x8_t)vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vsub_s32(v33, v32), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a4 + 1) = v35.i16[2];
    *(_WORD *)a4 = v35.i16[0];
    v35.i32[0] = v31 / v15;
    v35.i32[1] = v27 / v15;
    uint32x2_t v36 = vshr_n_u32((uint32x2_t)vand_s8(v35, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a4 + 3) = v36.i16[2];
    *((_WORD *)a4 + 2) = v36.i16[0];
    *((void *)a4 + 1) = 0;
    int64x2_t v37 = -[RawNightModeInputFrame processingConfig]((uint64_t)v7);
    unsigned int v38 = [v37 maximumOutputDimensions];
    v39 = -[RawNightModeInputFrame processingConfig]((uint64_t)v7);
    uint32x2_t v40 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)__PAIR64__((unint64_t)[v39 maximumOutputDimensions] >> 32, v38), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a4 + 9) = v40.i16[2];
    *((_WORD *)a4 + 8) = v40.i16[0];
  }
  else
  {
LABEL_16:
    FigSignalErrorAt();
  }

  int v41 = 0;
LABEL_11:

  return v41;
}

- (int)_getDraftDemosaicParamsForInputFrame:(id)a3 draftDemosaicParams:(CMIDraftDemosaicParams *)a4
{
  id v5 = a3;
  id v6 = v5;
  char v41 = 0;
  if (!v5 || !a4 || (-[RawNightModeInputFrame metadata]((uint64_t)v5), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v37 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v8 = (void *)v7;
  uint64_t v9 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v6);
  if (!v9)
  {
    int v37 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_12;
  }
  uint64_t v10 = (void *)v9;
  id v11 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  uint64_t v12 = [v11 meta];
  uint64_t v13 = [v12 exposureParams];
  __asm { FMOV            V0.4S, #1.0 }
  LODWORD(_Q0) = *(_DWORD *)(v13 + 12);
  long long v39 = _Q0;

  double v19 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  double v20 = [v19 meta];
  uint64_t v21 = [v20 exposureParams];
  long long v22 = v39;
  DWORD2(v22) = *(_DWORD *)(v21 + 16);
  long long v40 = v22;

  *(_OWORD *)&a4[2].applyAwb = v40;
  a4->applyAwb = 1;
  a4->firstPix = -[RawNightModeInputFrame firstPix]((uint64_t)v6);
  __int32 v23 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v6);
  unsigned int v24 = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F600], 0, &v41);
  if (!v41) {
    goto LABEL_15;
  }
  unsigned int v25 = v24;
  unsigned int v26 = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5F8], 0, &v41);
  if (!v41) {
    goto LABEL_15;
  }
  v27.i32[0] = 3;
  v28.i32[0] = v23;
  uint32x2_t v29 = vshl_u32((uint32x2_t)__PAIR64__(v26, v25), (uint32x2_t)vand_s8((int8x8_t)*(_OWORD *)&vmovl_u16((uint16x4_t)vceq_s32(v28, v27)), (int8x8_t)0x100000001));
  HIWORD(a4[4].firstPix) = v29.i16[2];
  LOWORD(a4[4].firstPix) = v29.i16[0];
  objc_msgSend(v8, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F660], &v41, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  if (!v41) {
    goto LABEL_15;
  }
  double v32 = v30;
  double v33 = v31;
  unsigned __int16 v34 = -[RawNightModeInputFrame quadraBinningFactor]((uint64_t)v6);
  *((_WORD *)&a4[4].applyAwb + 1) = (int)v33 / v34;
  *(_WORD *)&a4[4].applyAwb = (int)v32 / v34;
  int v35 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F808], 0, &v41);
  if (!v41
    || (LODWORD(v36) = 1.0, v35)
    && (objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F7E8], &v41, v36), !v41))
  {
LABEL_15:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();

    goto LABEL_16;
  }
  *(_DWORD *)&a4[5].applyAwb = LODWORD(v36);

  int v37 = 0;
LABEL_12:

  return v37;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (CMIRawNightModeConstrainedRegistrationTuningParams)constrainedRegistrationParams
{
  return (CMIRawNightModeConstrainedRegistrationTuningParams *)objc_getProperty(self, a2, 400, 1);
}

- (void)setConstrainedRegistrationParams:(id)a3
{
}

- (FigRegWarpPPGPUTuningParams)regwarpTuningParams
{
  return (FigRegWarpPPGPUTuningParams *)objc_getProperty(self, a2, 408, 1);
}

- (void)setRegwarpTuningParams:(id)a3
{
}

- (__n128)referenceHomography
{
  return a1[27];
}

- (MTLTexture)referenceShiftMap
{
  return self->_referenceShiftMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceShiftMap, 0);
  objc_storeStrong((id *)&self->_regwarpTuningParams, 0);
  objc_storeStrong((id *)&self->_constrainedRegistrationParams, 0);
  objc_storeStrong((id *)&self->_referenceLSCGainsTex, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_constrainedRegCalcWarpedMismatch2D, 0);
  objc_storeStrong((id *)&self->_constrainedRegCreatePriorShifts, 0);
  objc_storeStrong((id *)&self->_constrainedRegApplyGrid, 0);
  objc_storeStrong((id *)&self->_constrainedRegGenGrid, 0);
  objc_storeStrong((id *)&self->_constrainedRegGenHists, 0);
  objc_storeStrong((id *)&self->_constrainedRegUpdateShifts, 0);
  objc_storeStrong((id *)&self->_constrainedRegUpsampleMix3D, 0);
  objc_storeStrong((id *)&self->_constrainedRegDownsample3D, 0);
  objc_storeStrong((id *)&self->_constrainedRegCalcCosts, 0);
  objc_storeStrong((id *)&self->_constrainedRegClear, 0);
  objc_storeStrong((id *)&self->_constrainedRegWindowAverage, 0);
  objc_storeStrong((id *)&self->_constrainedRegWarpDownsample2D, 0);
  objc_storeStrong((id *)&self->_constrainedRegDownsample2D, 0);
  objc_storeStrong((id *)&self->_fuseBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_downsamplePipeline, 0);
  objc_storeStrong((id *)&self->_toneMappingCurves, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_bilateralGrid, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_regwarp, 0);
  objc_storeStrong((id *)&self->_draftDemosaic, 0);
  objc_storeStrong((id *)&self->_previousShifts, 0);
  objc_storeStrong((id *)&self->_referenceLumaTex, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end