@interface NRFProcessorV4
- (BOOL)doRedFaceFix;
- (BOOL)enableGreenGhostMitigation;
- (BOOL)learnedNREnabled;
- (BOOL)referenceFrameHasEVMinus;
- (BOOL)skipDenoising;
- (BOOL)srlEnabled;
- (BOOL)stfAllowed;
- (BOOL)supportsExternalMemoryResource;
- (CMIExternalMemoryResource)externalMemoryResource;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NRFOutput)output;
- (NRFProcessorDelegate)delegate;
- (NRFProcessorV4)init;
- (NRFProcessorV4)initWithCommandQueue:(id)a3;
- (NRFProcessorV4)initWithCommandQueue:(id)a3 subProcessorType:(int)a4;
- (NRFProgressiveBracketingParameters)progressiveBracketingParameters;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)defringingTuningByPortType;
- (NSMutableDictionary)tuningParams;
- (NSMutableDictionary)tuningParamsPlist;
- (NSString)description;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (id)initForSubProcessorType:(int)a3;
- (int)addFrame:(opaqueCMSampleBuffer *)a3;
- (int)addInputResource:(id)a3;
- (int)allocateResources:(id *)a3;
- (int)batchCount;
- (int)cntBracketSampleBuffers;
- (int)deepFusionProcessingMode;
- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5;
- (int)finishProcessing;
- (int)fusionMode;
- (int)getOptions:(id)a3;
- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prewarm;
- (int)process;
- (int)processingTypeToSubProcessorType:(unsigned int)a3;
- (int)progressiveBatchSize;
- (int)purgeResources;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)resetState;
- (int)setup;
- (int)setupWithOptions:(id)a3;
- (unsigned)processingType;
- (void)addToSidecar:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)finishScheduling;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDeepFusionProcessingMode:(int)a3;
- (void)setDefringingTuningByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoRedFaceFix:(BOOL)a3;
- (void)setEnableGreenGhostMitigation:(BOOL)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setFusionMode:(int)a3;
- (void)setLearnedNREnabled:(BOOL)a3;
- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingType:(unsigned int)a3;
- (void)setProgressiveBatchSize:(int)a3;
- (void)setProgressiveBracketingParameters:(id)a3;
- (void)setReferenceFrameCandidatesCount:(int)a3;
- (void)setReferenceFrameHasEVMinus:(BOOL)a3;
- (void)setReferenceFrameIndex:(int)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSkipDenoising:(BOOL)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)setStfAllowed:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setTuningParams:(id)a3;
- (void)setTuningParamsPlist:(id)a3;
@end

@implementation NRFProcessorV4

- (int)setupWithOptions:(id)a3
{
  uint64_t v217 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7C0]];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:self->_metalCommandQueue];
  metal = self->_metal;
  self->_metal = v7;

  if (!self->_metal)
  {
    v38 = 0;
    goto LABEL_105;
  }
  v9 = [[NRFConfig alloc] initWithDefaults:v4];
  nrfConfig = self->_nrfConfig;
  self->_nrfConfig = v9;

  if (!self->_nrfConfig)
  {
    FigDebugAssert3();
LABEL_147:
    int v37 = FigSignalErrorAt();
    goto LABEL_148;
  }
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7C8]];
  self->_nrfConfig->_quadraSupportEnabled = [v11 BOOLValue];

  long long v206 = 0u;
  long long v205 = 0u;
  long long v204 = 0u;
  long long v203 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v203 objects:v216 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v204;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v204 != v15) {
          objc_enumerationMutation(v12);
        }
        if ((isSingleFrameProcessing([*(id *)(*((void *)&v203 + 1) + 8 * i) intValue]) & 1) == 0) {
          self->_nrfConfig->_isOnlySingleImage = 0;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v203 objects:v216 count:16];
    }
    while (v14);
  }

  int supportedNRFSubProcessor = self->_supportedNRFSubProcessor;
  if (supportedNRFSubProcessor == 3 || !supportedNRFSubProcessor)
  {
    v18 = [RawDFProcessor alloc];
    v19 = [(FigMetalContext *)self->_metal commandQueue];
    v20 = [(RawDFProcessor *)v18 initWithCommandQueue:v19];
    v21 = self->_subProcessors[0];
    self->_subProcessors[0] = v20;

    if (!self->_subProcessors[0]) {
      goto LABEL_146;
    }
    int supportedNRFSubProcessor = self->_supportedNRFSubProcessor;
  }
  if ((supportedNRFSubProcessor | 2) == 3)
  {
    v22 = [UBProcessorV4 alloc];
    v23 = [(FigMetalContext *)self->_metal commandQueue];
    v24 = [(UBProcessorV4 *)v22 initWithCommandQueue:v23];
    v25 = self->_subProcessors[1];
    self->_subProcessors[1] = v24;

    if (self->_subProcessors[1])
    {
      int supportedNRFSubProcessor = self->_supportedNRFSubProcessor;
      goto LABEL_19;
    }
LABEL_146:
    FigDebugAssert3();
    goto LABEL_147;
  }
LABEL_19:
  if ((supportedNRFSubProcessor & 0xFFFFFFFE) == 2)
  {
    v26 = [RawNightModeProcessor alloc];
    v27 = [(FigMetalContext *)self->_metal commandQueue];
    v28 = [(RawNightModeProcessor *)v26 initWithCommandQueue:v27];
    v29 = self->_subProcessors[2];
    self->_subProcessors[2] = v28;

    if (!self->_subProcessors[2]) {
      goto LABEL_146;
    }
  }
  v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  tuningParams = self->_tuningParams;
  self->_tuningParams = v30;

  v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  tuningParamsPlist = self->_tuningParamsPlist;
  self->_tuningParamsPlist = v32;

  v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  defringingTuningByPortType = self->_defringingTuningByPortType;
  self->_defringingTuningByPortType = v34;

  v36 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F1F8]];
  int v37 = [(NRFProcessorV4 *)self getOptions:v36];

  if (v37)
  {
    FigDebugAssert3();
LABEL_148:
    v38 = 0;
    goto LABEL_135;
  }
  v38 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F1E8]];
  if (v38)
  {
    objc_storeStrong((id *)&self->_cameraInfoByPortType, v38);
    v39 = [[LSCGainsPlist alloc] initWithDictionary:self->_cameraInfoByPortType metal:self->_metal];
    lscGainsPlist = self->_lscGainsPlist;
    self->_lscGainsPlist = v39;

    if (self->_lscGainsPlist)
    {
      v41 = [[GlobalDistortionCorrectionByPortType alloc] initWithDictionary:self->_cameraInfoByPortType];
      globalDistortionCorrectionByPortType = self->_globalDistortionCorrectionByPortType;
      self->_globalDistortionCorrectionByPortType = v41;

      if (!self->_globalDistortionCorrectionByPortType)
      {
        FigDebugAssert3();
        int v37 = FigSignalErrorAt();
        goto LABEL_135;
      }
      goto LABEL_25;
    }
    FigDebugAssert3();
LABEL_105:
    int v37 = 0;
    goto LABEL_135;
  }
LABEL_25:
  v121 = v38;
  id v122 = v12;
  v124 = v6;
  v125 = v5;
  self->_nrfConfig->_enableChromaticAberrationCorrectiouint64_t n = 0;
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  v43 = self->_defringingTuningByPortType;
  uint64_t v44 = [(NSMutableDictionary *)v43 countByEnumeratingWithState:&v199 objects:v215 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v200;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v200 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = [(NSMutableDictionary *)self->_defringingTuningByPortType objectForKeyedSubscript:*(void *)(*((void *)&v199 + 1) + 8 * j)];
        self->_nrfConfig->_enableChromaticAberrationCorrection |= [v48 defringingEnabled];
      }
      uint64_t v45 = [(NSMutableDictionary *)v43 countByEnumeratingWithState:&v199 objects:v215 count:16];
    }
    while (v45);
  }
  id v123 = v4;

  self->_nrfConfig->_enableBilateralGridForHybridRegistratiouint64_t n = 0;
  self->_nrfConfig->_denseForAll = 0;
  self->_nrfConfig->_enableGainMap = 0;
  self->_nrfConfig->_enableSemanticStyles = 0;
  self->_nrfConfig->_localGainMapEnabled = 0;
  [(NRFProcessorV4 *)self applyOverrides];
  id v131 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v130 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  obuint64_t j = self->_tuningParams;
  v136 = self;
  uint64_t v132 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v195 objects:v214 count:16];
  if (v132)
  {
    uint64_t v128 = *(void *)v196;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v196 != v128) {
          objc_enumerationMutation(obj);
        }
        uint64_t v134 = v49;
        v50 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:*(void *)(*((void *)&v195 + 1) + 8 * v49)];
        id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v191 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        v52 = [v50 objectForKeyedSubscript:@"DenoiseAndSharpening"];
        uint64_t v53 = [v52 countByEnumeratingWithState:&v191 objects:v213 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v192;
          do
          {
            for (uint64_t k = 0; k != v54; ++k)
            {
              if (*(void *)v192 != v55) {
                objc_enumerationMutation(v52);
              }
              uint64_t v57 = *(void *)(*((void *)&v191 + 1) + 8 * k);
              v58 = [v50 objectForKeyedSubscript:@"DenoiseAndSharpening"];
              v59 = [v58 objectForKeyedSubscript:v57];
              [v51 setObject:v59 forKeyedSubscript:v57];
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v191 objects:v213 count:16];
          }
          while (v54);
        }

        [v131 addObject:v51];
        id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);

        long long v189 = 0u;
        long long v190 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        v61 = [v50 objectForKeyedSubscript:@"ToneMapping"];
        uint64_t v62 = [v61 countByEnumeratingWithState:&v187 objects:v212 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v188;
          do
          {
            for (uint64_t m = 0; m != v63; ++m)
            {
              if (*(void *)v188 != v64) {
                objc_enumerationMutation(v61);
              }
              uint64_t v66 = *(void *)(*((void *)&v187 + 1) + 8 * m);
              v67 = [v50 objectForKeyedSubscript:@"ToneMapping"];
              v68 = [v67 objectForKeyedSubscript:v66];

              [v60 setObject:v68 forKeyedSubscript:v66];
              if (v68[95]) {
                v136->_nrfConfig->_enableSTF = 1;
              }
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v187 objects:v212 count:16];
          }
          while (v63);
        }

        [v130 addObject:v60];
        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        v69 = [v50 objectForKeyedSubscript:@"Fusion"];
        uint64_t v70 = [v69 countByEnumeratingWithState:&v183 objects:v211 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v184;
          do
          {
            for (uint64_t n = 0; n != v71; ++n)
            {
              if (*(void *)v184 != v72) {
                objc_enumerationMutation(v69);
              }
              uint64_t v74 = *(void *)(*((void *)&v183 + 1) + 8 * n);
              v75 = [v50 objectForKeyedSubscript:@"Fusion"];
              v76 = [v75 objectForKeyedSubscript:v74];

              if (v76)
              {
                v77 = [v50 objectForKeyedSubscript:@"Fusion"];
                v78 = [v77 objectForKeyedSubscript:v74];

                if (v78[24] == 2)
                {
                  v136->_nrfConfig->_enableBilateralGridForHybridRegistratiouint64_t n = 1;
                  v136->_nrfConfig->_denseForAll = 1;
                }
              }
            }
            uint64_t v71 = [v69 countByEnumeratingWithState:&v183 objects:v211 count:16];
          }
          while (v71);
        }

        v79 = [v50 objectForKeyedSubscript:@"GainMap"];

        self = v136;
        if (v79) {
          v136->_nrfConfig->_enableGainMap = 1;
        }
        v80 = [v50 objectForKeyedSubscript:@"SemanticStyles"];

        if (v80) {
          v136->_nrfConfig->_enableSemanticStyles = 1;
        }

        uint64_t v49 = v134 + 1;
      }
      while (v134 + 1 != v132);
      uint64_t v132 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v195 objects:v214 count:16];
    }
    while (v132);
  }

  id v4 = v123;
  v6 = v124;
  v5 = v125;
  v81 = v122;
  if (self->_nrfConfig->_greenGhostMitigationType == 4)
  {
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    v82 = self->_tuningParams;
    uint64_t v133 = [(NSMutableDictionary *)v82 countByEnumeratingWithState:&v179 objects:v210 count:16];
    if (v133)
    {
      BOOL v138 = 0;
      BOOL v137 = 0;
      v127 = v82;
      uint64_t v129 = *(void *)v180;
      do
      {
        uint64_t v83 = 0;
        do
        {
          if (*(void *)v180 != v129) {
            objc_enumerationMutation(v127);
          }
          uint64_t v135 = v83;
          v84 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:*(void *)(*((void *)&v179 + 1) + 8 * v83)];
          long long v175 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          v85 = [v84 objectForKeyedSubscript:@"BrightLightGreenGhost"];
          uint64_t v86 = [v85 countByEnumeratingWithState:&v175 objects:v209 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v176;
            do
            {
              for (iuint64_t i = 0; ii != v87; ++ii)
              {
                if (*(void *)v176 != v88) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v90 = *(void *)(*((void *)&v175 + 1) + 8 * ii);
                v91 = [v84 objectForKeyedSubscript:@"BrightLightGreenGhost"];
                v92 = [v91 objectForKeyedSubscript:v90];

                if (v92)
                {
                  v93 = [v84 objectForKeyedSubscript:@"BrightLightGreenGhost"];
                  v94 = [v93 objectForKeyedSubscript:v90];

                  if (v94)
                  {
                    [v94 tuningParams];
                    int v95 = v164;
                  }
                  else
                  {
                    int v95 = 0;
                    uint64_t v174 = 0;
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
                  }
                  BOOL v137 = (v95 | v137) != 0;
                }
              }
              uint64_t v87 = [v85 countByEnumeratingWithState:&v175 objects:v209 count:16];
            }
            while (v87);
          }

          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          v96 = [v84 objectForKeyedSubscript:@"LowLightGreenGhost"];
          uint64_t v97 = [v96 countByEnumeratingWithState:&v160 objects:v208 count:16];
          if (v97)
          {
            uint64_t v98 = v97;
            uint64_t v99 = *(void *)v161;
            do
            {
              for (juint64_t j = 0; jj != v98; ++jj)
              {
                if (*(void *)v161 != v99) {
                  objc_enumerationMutation(v96);
                }
                uint64_t v101 = *(void *)(*((void *)&v160 + 1) + 8 * jj);
                v102 = [v84 objectForKeyedSubscript:@"LowLightGreenGhost"];
                v103 = [v102 objectForKeyedSubscript:v101];

                if (v103)
                {
                  v104 = [v84 objectForKeyedSubscript:@"LowLightGreenGhost"];
                  v105 = [v104 objectForKeyedSubscript:v101];

                  if (v105)
                  {
                    [v105 tuningParams];
                    int v106 = v143;
                  }
                  else
                  {
                    int v106 = 0;
                    uint64_t v159 = 0;
                    long long v157 = 0u;
                    long long v158 = 0u;
                    long long v155 = 0u;
                    long long v156 = 0u;
                    long long v153 = 0u;
                    long long v154 = 0u;
                    long long v151 = 0u;
                    long long v152 = 0u;
                    long long v149 = 0u;
                    long long v150 = 0u;
                    long long v147 = 0u;
                    long long v148 = 0u;
                    long long v145 = 0u;
                    long long v146 = 0u;
                    long long v143 = 0u;
                    long long v144 = 0u;
                  }
                  BOOL v138 = (v106 | v138) != 0;
                }
              }
              uint64_t v98 = [v96 countByEnumeratingWithState:&v160 objects:v208 count:16];
            }
            while (v98);
          }

          uint64_t v83 = v135 + 1;
          self = v136;
        }
        while (v135 + 1 != v133);
        uint64_t v133 = [(NSMutableDictionary *)v127 countByEnumeratingWithState:&v179 objects:v210 count:16];
      }
      while (v133);

      if (v137) {
        v136->_nrfConfig->_greenGhostMitigationType |= 1u;
      }
      id v4 = v123;
      v6 = v124;
      v5 = v125;
      v81 = v122;
      if (v138) {
        v136->_nrfConfig->_greenGhostMitigationType |= 2u;
      }
    }
    else
    {
    }
  }

  *(_WORD *)&self->_allocatorSetupComplete = 0;
  for (kuint64_t k = 16; kk != 40; kk += 8)
  {
    v108 = *(Class *)((char *)&self->super.isa + kk);
    if (v108 && (kk == 24 || !self->_nrfConfig->_isOnlySingleImage))
    {
      [v108 setTuningParams:self->_tuningParams];
      [*(id *)((char *)&self->super.isa + kk) setTuningParamsPlist:self->_tuningParamsPlist];
      [*(id *)((char *)&self->super.isa + kk) setCameraInfoByPortType:self->_cameraInfoByPortType];
      [*(id *)((char *)&self->super.isa + kk) setDefringingTuningByPortType:self->_defringingTuningByPortType];
      int v109 = [*(id *)((char *)&self->super.isa + kk) setupWithOptions:v4 nrfConfig:self->_nrfConfig];
      if (v109)
      {
        int v37 = v109;
LABEL_137:
        FigDebugAssert3();
        goto LABEL_134;
      }
    }
  }
  if (![v81 count]) {
    goto LABEL_129;
  }
  self->_nrfConfig->_learnedNRWithSingleImageProcessingTypeEnabled = self->_learnedNREnabled;
  int v110 = [(NRFProcessorV4 *)self determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:v81 nrfConfig:self->_nrfConfig memoryAllocationInfo:&self->_memoryRequirements];
  if (v110)
  {
    int v37 = v110;
    goto LABEL_137;
  }
  if (!self->_memoryRequirements.sharedMetalBufferSizeRequested)
  {
    FigDebugAssert3();
    int v37 = -73342;
    goto LABEL_134;
  }
  if (!self->_nrfConfig->_allocateOnSetup)
  {
LABEL_129:
    int v37 = 0;
    goto LABEL_134;
  }
  if ([(NRFProcessorV4 *)self allocateResources:&self->_memoryRequirements])
  {
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
  }
  else
  {
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v111 = v81;
    uint64_t v112 = [v111 countByEnumeratingWithState:&v139 objects:v207 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v140;
      while (2)
      {
        for (muint64_t m = 0; mm != v113; ++mm)
        {
          if (*(void *)v140 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v139 + 1) + 8 * mm);
          uint64_t v117 = [v116 intValue];
          v118 = [v111 objectForKeyedSubscript:v116];
          int v119 = [(NRFProcessorV4 *)v136 prepareToProcess:v117 prepareDescriptor:v118];
          if (v119)
          {
            int v37 = v119;
            FigDebugAssert3();

            goto LABEL_132;
          }
        }
        uint64_t v113 = [v111 countByEnumeratingWithState:&v139 objects:v207 count:16];
        if (v113) {
          continue;
        }
        break;
      }
      int v37 = 0;
LABEL_132:
      v6 = v124;
      v5 = v125;
    }
    else
    {
      int v37 = 0;
    }
  }
LABEL_134:
  v38 = v121;
LABEL_135:

  return v37;
}

- (int)setup
{
  return 0;
}

- (int)processingTypeToSubProcessorType:(unsigned int)a3
{
  if (a3 > 8) {
    return -1;
  }
  else {
    return dword_2634803F0[a3];
  }
}

- (void)setOutput:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_output, a3);
  uint64_t v5 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    v7 = subProcessors[v5];
    if (v7) {
      [(NRFSubProcessor *)v7 setOutput:0];
    }
    ++v5;
  }
  while (v5 != 3);
  if (v11)
  {
    if (objc_opt_class(), (objc_opt_isKindOfClass()) && (v8 = self->_subProcessors[1]) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v8 = *subProcessors) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v8 = self->_subProcessors[2]) != 0)
    {
      [(NRFSubProcessor *)v8 setOutput:v11];
    }
  }
  v9 = [v11 completionStatus];
  v10 = [v9 metalExecutionStatus];
  [(FigMetalContext *)self->_metal setExecutionStatus:v10];
}

- (int)process
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor)
  {
    int v3 = [(NRFSubProcessor *)currentProcessor process];
    if (dword_26B430EE8)
    {
      id v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -73343;
  }
  return v3;
}

- (int)addInputResource:(id)a3
{
  return [(NRFSubProcessor *)self->_currentProcessor addInputResource:a3];
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3
{
  return [(NRFSubProcessor *)self->_currentProcessor addFrame:a3];
}

- (void)finishScheduling
{
}

- (int)finishProcessing
{
  return [(NRFSubProcessor *)self->_currentProcessor finishProcessing];
}

- (NRFProcessorV4)init
{
  return [(NRFProcessorV4 *)self initWithCommandQueue:0 subProcessorType:3];
}

- (void)dealloc
{
  [(NRFProcessorV4 *)self resetState];
  [(NRFProcessorV4 *)self purgeResources];
  int v3 = +[NRFMonitor sharedInstance];
  [v3 removeInstance];

  v4.receiver = self;
  v4.super_class = (Class)NRFProcessorV4;
  [(NRFProcessorV4 *)&v4 dealloc];
}

- (NSString)description
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor)
  {
    int v3 = [(NRFSubProcessor *)currentProcessor description];
  }
  else
  {
    int v3 = @"NRFProcessorV4";
  }

  return (NSString *)v3;
}

- (id)initForSubProcessorType:(int)a3
{
  return [(NRFProcessorV4 *)self initWithCommandQueue:0 subProcessorType:*(void *)&a3];
}

- (NRFProcessorV4)initWithCommandQueue:(id)a3
{
  return [(NRFProcessorV4 *)self initWithCommandQueue:a3 subProcessorType:3];
}

- (NRFProcessorV4)initWithCommandQueue:(id)a3 subProcessorType:(int)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v20.receiver = self;
  v20.super_class = (Class)NRFProcessorV4;
  v8 = [(NRFProcessorV4 *)&v20 init];
  v9 = v8;
  if (v8)
  {
    v8->_int supportedNRFSubProcessor = a4;
    v21[0] = 0;
    if (!VisionLibraryCore_frameworkLibrary_1)
    {
      v21[1] = (void *)MEMORY[0x263EF8330];
      v21[2] = (void *)3221225472;
      v21[3] = __VisionLibraryCore_block_invoke_1;
      v21[4] = &__block_descriptor_40_e5_v8__0l;
      v21[5] = v21;
      long long v22 = xmmword_2655C8008;
      uint64_t v23 = 0;
      VisionLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    }
    if (!VisionLibraryCore_frameworkLibrary_1) {
      -[NRFProcessorV4 initWithCommandQueue:subProcessorType:](v21);
    }
    if (v21[0])
    {
      free(v21[0]);
      if (!v7)
      {
LABEL_8:
        [(NRFProcessorV4 *)v9 resetState];
        v9->_saveInputFramesToDisuint64_t k = 0;
        v9->_regwarpHasBeenSetup = 0;
        sharedRegWarpBuffer = v9->_sharedRegWarpBuffer;
        v9->_sharedRegWarpBuffer = 0;

        v9->_usingExternalSharedRegWarpBuffer = 0;
        uint64_t v11 = objc_opt_new();
        nrfPlist = v9->_nrfPlist;
        v9->_nrfPlist = (NRFPlist *)v11;

        uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        sidecar = v9->_sidecar;
        v9->_sidecar = v13;

        v9->_enableGreenGhostMitigatiouint64_t n = 0;
        [(NRFProcessorV4 *)v9 setProgressiveBatchSize:4];
        [MEMORY[0x263F2EE70] getDefaults:&v9->_registrationPipelineRWPPConfig];
        uint64_t v15 = +[NRFMonitor sharedInstance];
        [v15 addInstance];

        for (uint64_t i = 16; i != 40; i += 8)
        {
          v17 = *(Class *)((char *)&v9->super.isa + i);
          *(Class *)((char *)&v9->super.isa + i) = 0;
        }
        v18 = v9;
        goto LABEL_11;
      }
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v9->_metalCommandQueue, a3);
    goto LABEL_8;
  }
LABEL_11:

  return v9;
}

- (int)prewarm
{
  if (!self->_metalCommandQueue)
  {
    int v14 = -73242;
LABEL_13:
    FigDebugAssert3();
    return v14;
  }
  metal = self->_metal;
  if (metal)
  {
    objc_super v4 = [(FigMetalContext *)metal commandQueue];

    if (!v4) {
      [(FigMetalContext *)self->_metal setCommandQueue:self->_metalCommandQueue];
    }
    goto LABEL_6;
  }
  id v5 = objc_alloc(MEMORY[0x263F2EE30]);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (FigMetalContext *)[v5 initWithbundle:v6 andOptionalCommandQueue:self->_metalCommandQueue];
  v8 = self->_metal;
  self->_metal = v7;

  if (!self->_metal)
  {
    int v14 = -73242;
    goto LABEL_13;
  }
LABEL_6:
  v9 = [[RawDFProcessor alloc] initWithCommandQueue:self->_metalCommandQueue];
  int v10 = [(RawDFProcessor *)v9 prewarmWithTuningParameters:self->_tuningParameters];

  uint64_t v11 = [[UBProcessorV4 alloc] initWithCommandQueue:self->_metalCommandQueue];
  int v12 = [(UBProcessorV4 *)v11 prewarmWithTuningParameters:self->_tuningParameters];

  if (v12) {
    int v10 = v12;
  }
  uint64_t v13 = [[RawNightModeProcessor alloc] initWithCommandQueue:self->_metalCommandQueue];
  int v14 = [(RawNightModeProcessor *)v13 prewarmWithTuningParameters:self->_tuningParameters];

  if (!v14) {
    return v10;
  }
  return v14;
}

- (int)getOptions:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v4 = -73346;
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    if (self->_tuningParams && self->_tuningParamsPlist)
    {
      id v7 = objc_msgSend(v5, "cmi_dictionary");

      if (v7)
      {
        uint64_t v8 = objc_opt_new();
        nrfPlist = self->_nrfPlist;
        commouint64_t n = nrfPlist->common;
        nrfPlist->commouint64_t n = (CommonPlist *)v8;

        uint64_t v11 = self->_nrfPlist->common;
        int v12 = [v7 objectForKeyedSubscript:@"Common"];
        uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:");
        LODWORD(v11) = [(CommonPlist *)v11 readPlist:v13];

        if (v11)
        {
          FigDebugAssert3();
        }
        else
        {
          int v14 = [v7 objectForKeyedSubscript:@"DefaultSensorIDs"];
          if (v14)
          {
            uint64_t v15 = v14;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v31 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v31)
            {
              uint64_t v30 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v36 != v30) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                  v18 = [v7 objectForKeyedSubscript:v17];
                  v19 = [v15 objectForKeyedSubscript:v17];
                  objc_super v20 = [v18 allKeys];
                  uint64_t v33 = v17;
                  if (([v20 containsObject:v19] & 1) == 0)
                  {
                    uint64_t v21 = [v20 firstObject];

                    v19 = (void *)v21;
                  }
                  long long v22 = [v18 objectForKeyedSubscript:v19];
                  v34 = [v22 objectForKeyedSubscript:@"NRFParameters"];
                  uint64_t v23 = [v34 objectForKeyedSubscript:@"NRFParameters"];
                  if (v23) {
                    getNRFTuningForSensor(v19, v23, self->_tuningParams, self->_tuningParamsPlist, self->_nrfConfig->_isDepthEnabled);
                  }
                  uint64_t v24 = [v22 objectForKeyedSubscript:@"ChromaticDefringing"];
                  if (v24)
                  {
                    v32 = v20;
                    v25 = v18;
                    v26 = v15;
                    v27 = v7;
                    v28 = [[VideoDefringingTuningParameters alloc] initWithTuningParameters:v24];
                    [(VideoDefringingTuningParameters *)v28 selectParametersForTuningMode:0];
                    [(NSMutableDictionary *)self->_defringingTuningByPortType setObject:v28 forKeyedSubscript:v33];

                    id v7 = v27;
                    uint64_t v15 = v26;
                    v18 = v25;
                    objc_super v20 = v32;
                  }
                }
                uint64_t v31 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
              }
              while (v31);
            }

            int v4 = 0;
          }
        }
      }
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v4;
}

- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v24 = a4;
  if (!v24 || !a5)
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_25;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v8)
  {
    int8x16_t v27 = 0u;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    int v20 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = v8;
  id v23 = v7;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = *(void *)v30;
  int8x16_t v27 = 0u;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(obj);
      }
      int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      memset(v28, 0, 56);
      uint64_t v15 = [v14 intValue];
      v16 = [obj objectForKeyedSubscript:v14];
      if (!v16)
      {
        FigDebugAssert3();
        int v20 = -73347;
LABEL_24:

        id v7 = v23;
        goto LABEL_25;
      }
      uint64_t v17 = self->_subProcessors[[(NRFProcessorV4 *)self processingTypeToSubProcessorType:v15]];
      if (!v17) {
        goto LABEL_23;
      }
      v18 = [NSNumber numberWithUnsignedInt:v15];
      uint64_t v33 = v18;
      v34 = v16;
      v19 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      int v20 = [(NRFSubProcessor *)v17 determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:v19 nrfConfig:v24 memoryAllocationInfo:v28];

      if (!v28[0].i64[0])
      {
LABEL_23:
        FigDebugAssert3();
        int v20 = -4;
        goto LABEL_24;
      }
      if (v10 <= v28[0].i64[0]) {
        unint64_t v10 = v28[0].i64[0];
      }
      if (v11 <= v28[0].i64[1]) {
        unint64_t v11 = v28[0].u64[1];
      }
      int8x16_t v27 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v27, *(uint64x2_t *)((char *)&v28[2] + 8)), v27, *(int8x16_t *)((char *)&v28[2] + 8));
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  id v7 = v23;
LABEL_19:

  unint64_t allocatorForceSize = self->_nrfConfig->_allocatorForceSize;
  if (!allocatorForceSize) {
    unint64_t allocatorForceSize = v10;
  }
  a5->var0 = allocatorForceSize;
  a5->var1 = v11;
  *(int8x16_t *)&a5->var5 = v27;
LABEL_25:

  return v20;
}

- (int)allocateResources:(id *)a3
{
  if (a3)
  {
    regWarpInput = self->_regWarpInput;
    if (regWarpInput)
    {
      size_t Width = CVPixelBufferGetWidth(regWarpInput);
      regWarpInput = self->_regWarpInput;
      if (regWarpInput) {
        regWarpInput = (__CVBuffer *)CVPixelBufferGetHeight(regWarpInput);
      }
    }
    else
    {
      size_t Width = 0;
    }
    if (Width < a3->var5 || (unint64_t)regWarpInput < a3->var6)
    {
      CVPixelBufferRelease(self->_regWarpInput);
      PixelBufferWithWiringAssertiouint64_t n = (__CVBuffer *)CreatePixelBufferWithWiringAssertion();
      self->_regWarpInput = PixelBufferWithWiringAssertion;
      if (!PixelBufferWithWiringAssertion)
      {
LABEL_33:
        FigDebugAssert3();
        int v20 = FigSignalErrorAt();
        ReportMemoryException();
        return v20;
      }
      uint64_t v9 = 0;
      subProcessors = self->_subProcessors;
      do
      {
        if (subProcessors[v9]) {
          [(NRFSubProcessor *)subProcessors[v9] setRegwarpInputSurface:CVPixelBufferGetIOSurface(self->_regWarpInput)];
        }
        ++v9;
      }
      while (v9 != 3);
    }
    unint64_t v11 = [(FigWiredMemory *)self->_sharedRegWarpBuffer length];
    if (self->_usingExternalSharedRegWarpBuffer) {
      return 0;
    }
    unint64_t var1 = a3->var1;
    if (var1 <= v11) {
      return 0;
    }
    uint64_t v13 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    self->_regwarpHasBeenSetup = 0;
    sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
    self->_sharedRegWarpBuffer = 0;

    if (*v13 == 1)
    {
      kdebug_trace();
      if (*v13 == 1) {
        kdebug_trace();
      }
    }
    uint64_t v15 = (FigWiredMemory *)[objc_alloc(MEMORY[0x263F2BFF0]) initWithLength:var1];
    v16 = self->_sharedRegWarpBuffer;
    self->_sharedRegWarpBuffer = v15;

    if (self->_sharedRegWarpBuffer)
    {
      if (*v13 == 1) {
        kdebug_trace();
      }
      for (uint64_t i = 0; i != 3; ++i)
      {
        v18 = self->_subProcessors[i];
        if (v18) {
          [(NRFSubProcessor *)v18 setSharedRegWarpBuffer:self->_sharedRegWarpBuffer];
        }
      }
      return 0;
    }
    goto LABEL_33;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 processorSpecificOptions];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F7C0]];

  if (v6)
  {
    id v7 = [v4 processorSpecificOptions];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F7B8]];
    self->_nrfConfig->_learnedNRWithSingleImageProcessingTypeEnabled = [v8 BOOLValue];

    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    if (![(NRFProcessorV4 *)self determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:v6 nrfConfig:self->_nrfConfig memoryAllocationInfo:v12])
    {
      uint64_t v9 = objc_opt_new();
      unint64_t v10 = v9;
      if (!v9)
      {
        FigDebugAssert3();
        goto LABEL_6;
      }
      if (*(void *)&v12[0])
      {
        objc_msgSend(v9, "setMemSize:");
        [v10 setAllocatorType:self->_nrfConfig->_allocatorType];
        goto LABEL_6;
      }
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
  }
  unint64_t v10 = 0;
LABEL_6:

  return v10;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v28, 0, sizeof(v28));
  if (!v6)
  {
    int v9 = -73344;
LABEL_31:
    FigDebugAssert3();
    goto LABEL_27;
  }
  self->_nrfConfig->_learnedNRWithSingleImageProcessingTypeEnabled = self->_learnedNREnabled;
  id v7 = [NSNumber numberWithUnsignedInt:v4];
  long long v29 = v7;
  v30[0] = v6;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  int v9 = [(NRFProcessorV4 *)self determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:v8 nrfConfig:self->_nrfConfig memoryAllocationInfo:v28];

  if (v9) {
    goto LABEL_31;
  }
  uint64_t v10 = *(void *)v28;
  if (!*(void *)v28)
  {
    int v9 = -73344;
    goto LABEL_31;
  }
  if (self->_allocatorSetupComplete && *(void *)v28 <= self->_memoryRequirements.sharedMetalBufferSizeRequested)
  {
LABEL_20:
    if (!self->_regwarpSetupComplete || *(void *)&v28[8] > self->_memoryRequirements.sharedRegWarpBufferSizeRequested)
    {
      self->_memoryRequirements.sharedRegWarpBufferSizeRequested = *(void *)&v28[8];
      *(_OWORD *)&self->_memoryRequirements.regwarpInputsize_t Width = *(_OWORD *)&v28[40];
      int v24 = [(NRFProcessorV4 *)self allocateResources:&self->_memoryRequirements];
      if (v24)
      {
        int v9 = v24;
        FigSignalErrorAt();
        goto LABEL_27;
      }
      self->_regwarpSetupComplete = 1;
    }
    self->_processingType = v4;
    int v25 = [(NRFProcessorV4 *)self processingTypeToSubProcessorType:v4];
    if ((v25 & 0x80000000) == 0)
    {
      objc_storeStrong((id *)&self->_currentProcessor, self->_subProcessors[v25]);
      int v26 = [(NRFSubProcessor *)self->_currentProcessor prepareToProcess:v4 prepareDescriptor:v6];
LABEL_26:
      int v9 = v26;
      goto LABEL_27;
    }
    FigDebugAssert3();
LABEL_35:
    int v26 = FigSignalErrorAt();
    goto LABEL_26;
  }
  if (!self->_externalMemoryResource)
  {
LABEL_13:
    v15.i64[0] = v10;
    v15.i64[1] = *(void *)&v28[8];
    *(int8x16_t *)&self->_memoryRequirements.unint64_t sharedMetalBufferSizeRequested = vbslq_s8((int8x16_t)vcgtq_u64(v15, *(uint64x2_t *)&self->_memoryRequirements.sharedMetalBufferSizeRequested), (int8x16_t)v15, *(int8x16_t *)&self->_memoryRequirements.sharedMetalBufferSizeRequested);
    *(int8x16_t *)&self->_memoryRequirements.regwarpInputsize_t Width = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)&v28[40], *(uint64x2_t *)&self->_memoryRequirements.regwarpInputWidth), *(int8x16_t *)&v28[40], *(int8x16_t *)&self->_memoryRequirements.regwarpInputWidth);
    id v16 = objc_alloc(MEMORY[0x263F2EE18]);
    uint64_t v17 = [(FigMetalContext *)self->_metal device];
    v18 = (FigMetalAllocatorBackend *)[v16 initWithDevice:v17 allocatorType:self->_nrfConfig->_allocatorType];
    allocatorBackend = self->_allocatorBackend;
    self->_allocatorBackend = v18;

    if (!self->_allocatorBackend)
    {
      int v9 = -73344;
      goto LABEL_27;
    }
    unint64_t sharedMetalBufferSizeRequested = self->_memoryRequirements.sharedMetalBufferSizeRequested;
    uint64_t v21 = objc_opt_new();
    [v21 setMemSize:sharedMetalBufferSizeRequested];
    [v21 setWireMemory:self->_nrfConfig->_allocatorWireMemory];
    objc_msgSend(v21, "setMemoryPoolId:", objc_msgSend(v6, "memoryPoolId"));
    int v9 = [(FigMetalAllocatorBackend *)self->_allocatorBackend setupWithDescriptor:v21];

    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
  if (![(NRFProcessorV4 *)self supportsExternalMemoryResource])
  {
    uint64_t v10 = *(void *)v28;
    goto LABEL_13;
  }
  unint64_t v11 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
  uint64_t v12 = self->_allocatorBackend;
  self->_allocatorBackend = v11;

  uint64_t v13 = self->_allocatorBackend;
  if (!v13) {
    goto LABEL_35;
  }
  int v9 = -73344;
  unint64_t v14 = *(void *)v28;
  if (*(void *)v28 && [(FigMetalAllocatorBackend *)v13 memSize] >= v14)
  {
    self->_memoryRequirements.unint64_t sharedMetalBufferSizeRequested = [(FigMetalAllocatorBackend *)self->_allocatorBackend memSize];
LABEL_15:
    for (uint64_t i = 0; i != 3; ++i)
    {
      id v23 = self->_subProcessors[i];
      if (v23) {
        [(NRFSubProcessor *)v23 setAllocatorBackend:self->_allocatorBackend];
      }
    }
    self->_allocatorSetupComplete = 1;
    goto LABEL_20;
  }
LABEL_27:

  return v9;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -73344;
}

- (int)cntBracketSampleBuffers
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    LODWORD(currentProcessor) = [(NRFSubProcessor *)currentProcessor cntBracketSampleBuffers];
  }
  return (int)currentProcessor;
}

- (int)purgeResources
{
  uint64_t v3 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    id v5 = subProcessors[v3];
    if (v5) {
      [(NRFSubProcessor *)v5 purgeResources];
    }
    ++v3;
  }
  while (v3 != 3);
  CVPixelBufferRelease(self->_regWarpInput);
  self->_regWarpInput = 0;
  nrfConfig = self->_nrfConfig;
  if (nrfConfig && nrfConfig->_regMethod == 2)
  {
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    self->_regwarpHasBeenSetup = 0;
  }
  sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
  self->_sharedRegWarpBuffer = 0;

  self->_usingExternalSharedRegWarpBuffer = 0;
  *(_WORD *)&self->_allocatorSetupComplete = 0;
  return 0;
}

- (int)resetState
{
  uint64_t v3 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    id v5 = subProcessors[v3];
    if (v5) {
      [(NRFSubProcessor *)v5 resetState];
    }
    ++v3;
  }
  while (v3 != 3);
  [(FigMetalContext *)self->_metal waitForSchedule];
  *(void *)&self->_referenceFrameIndex = -1;
  self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = -1;
  self->_enableGreenGhostMitigatiouint64_t n = 0;
  *(_WORD *)&self->_referenceFrameHasEVMinus = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
  progressiveBracketingParameters = self->_progressiveBracketingParameters;
  self->_progressiveBracketingParameters = 0;

  *(_WORD *)&self->_learnedNREnabled = 256;
  [(FigMetalContext *)self->_metal setExecutionStatus:0];
  return 0;
}

- (void)addToSidecar:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6];
    [v8 addEntriesFromDictionary:v9];
  }
  else
  {
    [(NSMutableDictionary *)self->_sidecar setObject:v9 forKeyedSubscript:v6];
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  uint64_t v5 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    if (subProcessors[v5])
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      [(NRFSubProcessor *)subProcessors[v5] setDelegate:WeakRetained];
    }
    ++v5;
  }
  while (v5 != 3);
}

- (void)setSrlEnabled:(BOOL)a3
{
  uint64_t v4 = 0;
  self->_srlEnabled = a3;
  subProcessors = self->_subProcessors;
  do
  {
    id v6 = subProcessors[v4];
    if (v6) {
      [(NRFSubProcessor *)v6 setSrlEnabled:self->_srlEnabled];
    }
    ++v4;
  }
  while (v4 != 3);
}

- (void)setSemanticStyleProperties:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_semanticStyleProperties, a3);
  uint64_t v5 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    id v7 = subProcessors[v5];
    if (v7) {
      [(NRFSubProcessor *)v7 setSemanticStyleProperties:v8];
    }
    ++v5;
  }
  while (v5 != 3);
}

- (void)setSkipDenoising:(BOOL)a3
{
  self->_skipDenoising = a3;
  uint64_t v3 = self->_subProcessors[1];
  if (v3) {
    -[NRFSubProcessor setSkipDenoising:](v3, "setSkipDenoising:");
  }
}

- (void)setLearnedNREnabled:(BOOL)a3
{
  self->_learnedNREnabled = a3;
  uint64_t v3 = self->_subProcessors[1];
  if (v3) {
    -[NRFSubProcessor setLearnedNREnabled:](v3, "setLearnedNREnabled:");
  }
}

- (void)setStfAllowed:(BOOL)a3
{
  self->_stfAllowed = a3;
  uint64_t v3 = self->_subProcessors[1];
  if (v3) {
    -[NRFSubProcessor setStfAllowed:](v3, "setStfAllowed:");
  }
}

- (void)setDeepFusionProcessingMode:(int)a3
{
  self->_deepFusionProcessingMode = a3;
  -[NRFSubProcessor setDeepFusionProcessingMode:](self->_subProcessors[0], "setDeepFusionProcessingMode:");
}

- (void)setDoRedFaceFix:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = 0;
  self->_doRedFaceFix = a3;
  subProcessors = self->_subProcessors;
  do
  {
    id v6 = subProcessors[v4];
    if (v6) {
      [(NRFSubProcessor *)v6 setDoRedFaceFix:v3];
    }
    ++v4;
  }
  while (v4 != 3);
}

- (void)setEnableGreenGhostMitigation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = 0;
  self->_enableGreenGhostMitigatiouint64_t n = a3;
  subProcessors = self->_subProcessors;
  do
  {
    id v6 = subProcessors[v4];
    if (v6) {
      [(NRFSubProcessor *)v6 setEnableGreenGhostMitigation:v3];
    }
    ++v4;
  }
  while (v4 != 3);
}

- (void)setFusionMode:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_fusionMode = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [&unk_270E97BE8 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(&unk_270E97BE8);
        }
        -[NRFSubProcessor setFusionMode:](self->_subProcessors[(int)[*(id *)(*((void *)&v8 + 1) + 8 * v7++) intValue]], "setFusionMode:", self->_fusionMode);
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_270E97BE8 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (int)batchCount
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    LODWORD(currentProcessor) = [(NRFSubProcessor *)currentProcessor batchCount];
  }
  return (int)currentProcessor;
}

- (void)setProgressiveBatchSize:(int)a3
{
  self->_progressiveBatchSize = a3;
  BOOL v3 = self->_subProcessors[1];
  if (v3) {
    -[NRFSubProcessor setProgressiveBatchSize:](v3, "setProgressiveBatchSize:");
  }
}

- (int)progressiveBatchSize
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    return [(NRFSubProcessor *)currentProcessor progressiveBatchSize];
  }
  else {
    return self->_progressiveBatchSize;
  }
}

- (void)setProgressiveBracketingParameters:(id)a3
{
  id v8 = a3;
  p_progressiveBracketingParameters = &self->_progressiveBracketingParameters;
  objc_storeStrong((id *)&self->_progressiveBracketingParameters, a3);
  uint64_t v6 = 0;
  subProcessors = self->_subProcessors;
  do
  {
    if (subProcessors[v6] && (objc_opt_respondsToSelector() & 1) != 0) {
      [(NRFSubProcessor *)subProcessors[v6] setProgressiveBracketingParameters:*p_progressiveBracketingParameters];
    }
    ++v6;
  }
  while (v6 != 3);
}

- (NRFProgressiveBracketingParameters)progressiveBracketingParameters
{
  if (self->_currentProcessor && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = [(NRFSubProcessor *)self->_currentProcessor progressiveBracketingParameters];
  }
  else
  {
    BOOL v3 = self->_progressiveBracketingParameters;
  }

  return v3;
}

- (void)setReferenceFrameHasEVMinus:(BOOL)a3
{
  uint64_t v4 = 0;
  self->_referenceFrameHasEVMinus = a3;
  subProcessors = self->_subProcessors;
  do
  {
    uint64_t v6 = subProcessors[v4];
    if (v6) {
      [(NRFSubProcessor *)v6 setReferenceFrameHasEVMinus:self->_referenceFrameHasEVMinus];
    }
    ++v4;
  }
  while (v4 != 3);
}

- (BOOL)referenceFrameHasEVMinus
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    LOBYTE(v4) = [(NRFSubProcessor *)currentProcessor referenceFrameHasEVMinus];
  }
  else {
    return self->_referenceFrameHasEVMinus;
  }
  return v4;
}

- (void)setReferenceFrameIndex:(int)a3
{
  uint64_t v4 = 0;
  self->_referenceFrameIndex = a3;
  subProcessors = self->_subProcessors;
  do
  {
    uint64_t v6 = subProcessors[v4];
    if (v6) {
      [(NRFSubProcessor *)v6 setReferenceFrameIndex:self->_referenceFrameIndex];
    }
    ++v4;
  }
  while (v4 != 3);
}

- (int)referenceFrameIndex
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    return [(NRFSubProcessor *)currentProcessor referenceFrameIndex];
  }
  else {
    return self->_referenceFrameIndex;
  }
}

- (void)setReferenceFrameCandidatesCount:(int)a3
{
  uint64_t v4 = 0;
  self->_referenceFrameCandidatesCount = a3;
  subProcessors = self->_subProcessors;
  do
  {
    if (subProcessors[v4])
    {
      if (objc_opt_respondsToSelector()) {
        [(NRFSubProcessor *)subProcessors[v4] setReferenceFrameCandidatesCount:self->_referenceFrameCandidatesCount];
      }
    }
    ++v4;
  }
  while (v4 != 3);
}

- (int)referenceFrameCandidatesCount
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    return [(NRFSubProcessor *)currentProcessor referenceFrameCandidatesCount];
  }
  else {
    return self->_referenceFrameCandidatesCount;
  }
}

- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3
{
  uint64_t v4 = 0;
  self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = a3;
  subProcessors = self->_subProcessors;
  do
  {
    if (subProcessors[v4])
    {
      if (objc_opt_respondsToSelector()) {
        [(NRFSubProcessor *)subProcessors[v4] setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing];
      }
    }
    ++v4;
  }
  while (v4 != 3);
}

- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing
{
  currentProcessor = self->_currentProcessor;
  if (currentProcessor) {
    return [(NRFSubProcessor *)currentProcessor maximumNumberOfReferenceFrameCandidatesToHoldForProcessing];
  }
  else {
    return self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
  }
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (NRFOutput)output
{
  return self->_output;
}

- (NRFProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRFProcessorDelegate *)WeakRetained;
}

- (BOOL)doRedFaceFix
{
  return self->_doRedFaceFix;
}

- (BOOL)enableGreenGhostMitigation
{
  return self->_enableGreenGhostMitigation;
}

- (BOOL)srlEnabled
{
  return self->_srlEnabled;
}

- (BOOL)skipDenoising
{
  return self->_skipDenoising;
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return self->_semanticStyleProperties;
}

- (BOOL)learnedNREnabled
{
  return self->_learnedNREnabled;
}

- (BOOL)stfAllowed
{
  return self->_stfAllowed;
}

- (int)deepFusionProcessingMode
{
  return self->_deepFusionProcessingMode;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSMutableDictionary)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (NSMutableDictionary)tuningParamsPlist
{
  return self->_tuningParamsPlist;
}

- (void)setTuningParamsPlist:(id)a3
{
}

- (NSMutableDictionary)defringingTuningByPortType
{
  return self->_defringingTuningByPortType;
}

- (void)setDefringingTuningByPortType:(id)a3
{
}

- (unsigned)processingType
{
  return self->_processingType;
}

- (void)setProcessingType:(unsigned int)a3
{
  self->_processingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defringingTuningByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_progressiveBracketingParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionPlist, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionByPortType, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRWPP, 0);
  objc_storeStrong((id *)&self->_nrfPlist, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_allocatorBackend, 0);
  objc_storeStrong((id *)&self->_currentProcessor, 0);
  for (uint64_t i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

- (void)initWithCommandQueue:(void *)a1 subProcessorType:.cold.1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VisionLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NRFProcessorV4.m", 647, @"%s", *a1);

  __break(1u);
}

@end