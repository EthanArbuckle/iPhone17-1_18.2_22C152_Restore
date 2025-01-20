@interface MIWB
- (BOOL)canRunMIWB:(id)a3;
- (BOOL)configured;
- (MIWB)initWithMetalContext:(id)a3;
- (double)c1c2Torgb:(uint64_t)a1;
- (float)c1ToMired:(float)a3;
- (float)interpolateLinear1D:(MIWB *)self samples:(SEL)a2 nSamples:(float)a3;
- (float)miredToC1:(float)a3;
- (float32x2_t)rgbToC1c2:(uint64_t)a1;
- (id)createTexture:(id)a3 label:(id)a4;
- (int)allocInternalResources;
- (int)configWithFrameMetaData:(id)a3 miwbInputHasCCMApplied:(BOOL)a4;
- (int)configureStyleEngine;
- (int)createShaders;
- (int)runWithInLinearLumaTex:(id)a3 inLinearChromaTex:(id)a4 inSkyMaskTex:(id)a5 inSkinMaskTex:(id)a6 inHazeCorrection:(id)a7 outLinearLumaTex:(id)a8 outLinearChromaTex:;
- (int)setupWithOptions:(id)a3;
- (void)deallocInternalResources;
- (void)setConfigured:(BOOL)a3;
@end

@implementation MIWB

- (MIWB)initWithMetalContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_8:

    self = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&self->_metalContext, a3);
  v9.receiver = self;
  v9.super_class = (Class)MIWB;
  v6 = [(MIWB *)&v9 init];
  if (!v6)
  {
    FigDebugAssert3();
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    self = (MIWB *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_8;
  }
  self = v6;
  *(_WORD *)&v6->_configured = 0;
  portTypeConfigured = v6->_portTypeConfigured;
  v6->_portTypeConfigured = 0;

  if ([(MIWB *)self createShaders])
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
LABEL_4:

  return self;
}

- (int)createShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"MIWB::generateInitialThumbnails" constants:0];
  v4 = self->_computePipelineStates[0];
  self->_computePipelineStates[0] = v3;

  if (self->_computePipelineStates[0])
  {
    id v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"MIWB::makeIlluminantMap" constants:0];
    v6 = self->_computePipelineStates[1];
    self->_computePipelineStates[1] = v5;

    if (self->_computePipelineStates[1])
    {
      v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"MIWB::generateThumTargetPlain" constants:0];
      v8 = self->_computePipelineStates[2];
      self->_computePipelineStates[2] = v7;

      if (self->_computePipelineStates[2])
      {
        objc_super v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"MIWB::transferStyle" constants:0];
        uint64_t v10 = self->_computePipelineStates[3];
        self->_computePipelineStates[3] = v9;

        if (self->_computePipelineStates[3]) {
          return 0;
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)deallocInternalResources
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
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (id)createTexture:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 desc];
    [v8 setCompressionMode:2];

    objc_super v9 = [v6 desc];
    [v9 setCompressionFootprint:0];

    [v6 setLabel:0];
    uint64_t v10 = [(FigMetalContext *)self->_metalContext allocator];
    v11 = (void *)[v10 newTextureWithDescriptor:v6];

    if (v11) {
      goto LABEL_3;
    }
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  v11 = 0;
LABEL_3:

  return v11;
}

- (int)allocInternalResources
{
  v3 = [(FigMetalContext *)self->_metalContext allocator];
  v4 = (void *)[v3 newTextureDescriptor];

  id v5 = [(FigMetalContext *)self->_metalContext allocator];
  id v6 = (void *)[v5 newBufferDescriptor];

  if (!v4) {
    goto LABEL_20;
  }
  if (!v6) {
    goto LABEL_20;
  }
  id v7 = [v4 desc];
  [v7 setTextureType:2];

  uint64_t v8 = *(void *)self->_anon_30;
  objc_super v9 = [v4 desc];
  [v9 setWidth:v8];

  uint64_t v10 = *(unsigned int *)&self->_anon_30[4];
  v11 = [v4 desc];
  [v11 setHeight:v10];

  v12 = [v4 desc];
  [v12 setDepth:1];

  v13 = [v4 desc];
  [v13 setUsage:7];

  v14 = [v4 desc];
  [v14 setPixelFormat:125];

  v15 = [(MIWB *)self createTexture:v4 label:@"miwb_stfThumbnailTex"];
  stfThumbnailTex = self->_stfThumbnailTex;
  self->_stfThumbnailTex = v15;

  if (!self->_stfThumbnailTex) {
    goto LABEL_20;
  }
  v17 = [(MIWB *)self createTexture:v4 label:@"miwb_sensThumbnailTex"];
  sensThumbnailTex = self->_sensThumbnailTex;
  self->_sensThumbnailTex = v17;

  if (!self->_sensThumbnailTex) {
    goto LABEL_20;
  }
  v19 = [(MIWB *)self createTexture:v4 label:@"miwb_clusterTex"];
  clusterTex = self->_clusterTex;
  self->_clusterTex = v19;

  if (!self->_clusterTex) {
    goto LABEL_20;
  }
  v21 = [(MIWB *)self createTexture:v4 label:@"miwb_clusterFullTex"];
  clusterFullTex = self->_clusterFullTex;
  self->_clusterFullTex = v21;

  if (!self->_clusterFullTex) {
    goto LABEL_20;
  }
  v23 = [(MIWB *)self createTexture:v4 label:@"miwb_localIllMapTex"];
  localIllMapTex = self->_localIllMapTex;
  self->_localIllMapTex = v23;

  if (!self->_localIllMapTex) {
    goto LABEL_20;
  }
  v25 = [(MIWB *)self createTexture:v4 label:@"miwb_finalTargetTex"];
  finalTargetTex = self->_finalTargetTex;
  self->_finalTargetTex = v25;

  if (!self->_finalTargetTex) {
    goto LABEL_20;
  }
  v27 = [v4 desc];
  [v27 setPixelFormat:105];

  v28 = [(MIWB *)self createTexture:v4 label:@"miwb_c1c2Tex"];
  c1c2Tex = self->_c1c2Tex;
  self->_c1c2Tex = v28;

  if (!self->_c1c2Tex) {
    goto LABEL_20;
  }
  v30 = [v4 desc];
  [v30 setPixelFormat:55];

  v31 = [(MIWB *)self createTexture:v4 label:@"miwb_skyMaskTex"];
  skyMaskTex = self->_skyMaskTex;
  self->_skyMaskTex = v31;

  if (!self->_skyMaskTex) {
    goto LABEL_20;
  }
  v33 = [(MIWB *)self createTexture:v4 label:@"miwb_ignoreMapTex"];
  ignoreMapTex = self->_ignoreMapTex;
  self->_ignoreMapTex = v33;

  if (!self->_ignoreMapTex) {
    goto LABEL_20;
  }
  v35 = [(MIWB *)self createTexture:v4 label:@"miwb_skinMaskTex"];
  skinMaskTex = self->_skinMaskTex;
  self->_skinMaskTex = v35;

  if (!self->_skinMaskTex) {
    goto LABEL_20;
  }
  v37 = [(MIWB *)self createTexture:v4 label:@"miwb_skyMaskBlurredTex"];
  skyMaskBlurredTex = self->_skyMaskBlurredTex;
  self->_skyMaskBlurredTex = v37;

  if (!self->_skyMaskBlurredTex) {
    goto LABEL_20;
  }
  v39 = [(MIWB *)self createTexture:v4 label:@"miwb_skinMaskBlurredTex"];
  skinMaskBlurredTex = self->_skinMaskBlurredTex;
  self->_skinMaskBlurredTex = v39;

  if (!self->_skinMaskBlurredTex) {
    goto LABEL_20;
  }
  v41 = [v4 desc];
  [v41 setTextureType:3];

  v42 = [v4 desc];
  [v42 setPixelFormat:55];

  uint64_t v43 = *(void *)self->_anon_30;
  v44 = [v4 desc];
  [v44 setWidth:v43];

  uint64_t v45 = *(unsigned int *)&self->_anon_30[4];
  v46 = [v4 desc];
  [v46 setHeight:v45];

  v47 = [v4 desc];
  [v47 setDepth:1];

  v48 = [v4 desc];
  [v48 setArrayLength:4];

  v49 = [v4 desc];
  [v49 setUsage:7];

  v50 = [(MIWB *)self createTexture:v4 label:@"miwb_weightPlanesArrayTex"];
  weightPlanesArrayTex = self->_weightPlanesArrayTex;
  self->_weightPlanesArrayTex = v50;

  if (!self->_weightPlanesArrayTex) {
    goto LABEL_20;
  }
  [v6 setLength:32];
  [v6 setLabel:0];
  v52 = [(FigMetalContext *)self->_metalContext allocator];
  v53 = (MTLBuffer *)[v52 newBufferWithDescriptor:v6];
  wpStatsBuffer = self->_wpStatsBuffer;
  self->_wpStatsBuffer = v53;

  if (!self->_wpStatsBuffer) {
    goto LABEL_20;
  }
  [v6 setLength:8];
  [v6 setLabel:0];
  v55 = [(FigMetalContext *)self->_metalContext allocator];
  v56 = (MTLBuffer *)[v55 newBufferWithDescriptor:v6];
  blueMapPdfStatsBuffer = self->_blueMapPdfStatsBuffer;
  self->_blueMapPdfStatsBuffer = v56;

  if (self->_blueMapPdfStatsBuffer)
  {
    int v58 = 0;
  }
  else
  {
LABEL_20:
    FigDebugAssert3();
    int v58 = FigSignalErrorAt();
  }

  return v58;
}

- (int)configureStyleEngine
{
  v3 = objc_opt_new();
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setConfiguration:v3];

  v4 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v4 setLinearSystemType:1];

  id v5 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v5 setLinearSystemOrder:1];

  id v6 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v6 setLinearSystemSolver:0];

  id v7 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v7 setWeightPlaneCount:4];

  uint64_t v8 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v8 setSpotlightCount:COERCE_DOUBLE(0x100000001)];

  objc_super v9 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v9 setInputIsLinear:1];

  uint64_t v10 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v10 setInputThumbnailIsLinear:1];

  v11 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  [v11 setTargetThumbnailIsLinear:1];

  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:&unk_270E98E18];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setLabel:@"MIWB"];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setUseLiveMetalAllocations:1];
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor supportsExternalMemoryResource])
  {
    uint64_t v12 = objc_opt_new();
    if (!v12)
    {
      FigDebugAssert3();
      return -12786;
    }
    v13 = (void *)v12;
    v14 = [(FigMetalContext *)self->_metalContext allocator];
    v15 = [v14 backendAllocator];
    [v13 setAllocatorBackend:v15];

    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setExternalMemoryResource:v13];
  }
  int v16 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setup];
  if (v16)
  {
    int v21 = v16;
    goto LABEL_8;
  }
  uint64_t v17 = *(void *)self->_anon_30;
  double v18 = (double)v17;
  double v19 = (double)HIDWORD(v17);
  v20 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  objc_msgSend(v20, "setThumbnailSize:", v18, v19);

  int v21 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor prepareToProcess:3];
  if (v21) {
LABEL_8:
  }
    FigDebugAssert3();
  return v21;
}

- (int)setupWithOptions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  self->_hasBeenSetup = 0;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"DefaultSensorIDs"];
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    miwbModuleConfigPlistDictByPortType = self->_miwbModuleConfigPlistDictByPortType;
    self->_miwbModuleConfigPlistDictByPortType = v7;

    if (!self->_miwbModuleConfigPlistDictByPortType)
    {
LABEL_20:
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
      goto LABEL_18;
    }
    if (v6)
    {
      v27 = self;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = v6;
      uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v28 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v28) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v13 = objc_opt_new();
            uint64_t v14 = [v6 objectForKeyedSubscript:v12];
            if (!v14)
            {
              FigDebugAssert3();
              int v25 = FigSignalErrorAt();

              goto LABEL_18;
            }
            v15 = (void *)v14;
            int v16 = v6;
            uint64_t v17 = v5;
            double v18 = [v5 objectForKeyedSubscript:v12];
            double v19 = [v18 objectForKeyedSubscript:v15];
            v20 = [v19 objectForKeyedSubscript:@"ModuleConfig"];

            if (v20)
            {
              [v13 readModuleConfigPlist:v20];
              [(NSMutableDictionary *)v27->_miwbModuleConfigPlistDictByPortType setObject:v13 forKeyedSubscript:v12];
            }

            id v5 = v17;
            id v6 = v16;
          }
          uint64_t v10 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      self = v27;
    }
  }
  else
  {
    id v6 = 0;
  }
  *(void *)self->_anon_30 = 0x1800000020;
  id v21 = objc_alloc(MEMORY[0x263F2EDD8]);
  v22 = [(FigMetalContext *)self->_metalContext commandQueue];
  v23 = (CMIStyleEngineProcessor *)[v21 initWithOptionalMetalCommandQueue:v22];
  styleEngineProcessor = self->_styleEngineProcessor;
  self->_styleEngineProcessor = v23;

  if (!self->_styleEngineProcessor) {
    goto LABEL_20;
  }
  int v25 = 0;
  self->_hasBeenSetup = 1;
LABEL_18:

  return v25;
}

- (int)configWithFrameMetaData:(id)a3 miwbInputHasCCMApplied:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v8 = v6;
  if (self->_configured)
  {
    portTypeConfigured = self->_portTypeConfigured;
    uint64_t v10 = [v6 portType];
    LOBYTE(portTypeConfigured) = [(NSString *)portTypeConfigured isEqualToString:v10];

    if (portTypeConfigured)
    {
      int v11 = 0;
      goto LABEL_33;
    }
    if (self->_configured)
    {
      uint64_t v12 = self->_portTypeConfigured;
      v13 = [v8 portType];
      [(NSString *)v12 isEqualToString:v13];
    }
  }
  float v14 = *(float *)&self->_anon_30[372];
  v7.i32[0] = *(_DWORD *)&self->_anon_1b0[308];
  int32x2_t v119 = v7;
  self->_configured = 0;
  v15 = self->_portTypeConfigured;
  self->_portTypeConfigured = 0;

  miwbModuleConfigPlistDictByPortType = self->_miwbModuleConfigPlistDictByPortType;
  uint64_t v17 = [v8 portType];
  uint64_t v18 = [(NSMutableDictionary *)miwbModuleConfigPlistDictByPortType objectForKeyedSubscript:v17];

  if (v18)
  {
    float v19 = *(float *)(v18 + 56);
    float v20 = *(float *)(v18 + 64);
    float v21 = *(float *)(v18 + 68);
    float v22 = *(float *)(v18 + 76);
    float v23 = (float)(v20 * v20) + (float)(v19 * v19);
    if (v23 == 0.0) {
      float v23 = 1.0;
    }
    *(float *)&uint64_t v24 = v19 / v23;
    *(float *)&uint64_t v25 = v20 / v23;
    float v26 = (float)(v22 * v22) + (float)(v21 * v21);
    if (v26 == 0.0) {
      float v26 = 1.0;
    }
    *((float *)&v24 + 1) = v21 / v26;
    *((float *)&v25 + 1) = v22 / v26;
    *(void *)&self->_anon_1b0[336] = v24;
    *(void *)&self->_anon_1b0[344] = v25;
    *(_DWORD *)&self->_anon_1b0[152] = *(_DWORD *)(v18 + 256);
    *(_DWORD *)&self->_anon_1b0[156] = *(_DWORD *)(v18 + 284);
    *(_DWORD *)&self->_anon_1b0[160] = *(_DWORD *)(v18 + 192);
    *(_DWORD *)&self->_anon_1b0[164] = *(_DWORD *)(v18 + 220);
    [v8 exposureParams];
    *(_DWORD *)&self->_anon_1b0[308] = v119.i32[0];
    *(float32x2_t *)&self->_anon_1b0[312] = vadd_f32((float32x2_t)vdup_lane_s32(v119, 0), (float32x2_t)0xC2A00000C3340000);
    uint64_t v27 = 600;
    uint64_t v28 = (_DWORD *)v18;
    do
    {
      LODWORD(v29) = v28[48];
      HIDWORD(v29) = v28[56];
      long long v30 = (Class *)((char *)&self->super.isa + v27);
      void *v30 = v29;
      LODWORD(v29) = v28[64];
      HIDWORD(v29) = v28[72];
      v30[8] = v29;
      ++v28;
      v27 += 8;
    }
    while (v27 != 664);
    [v8 awbGains];
    unsigned int v120 = v31;
    [v8 awbGains];
    *(float32x2_t *)&long long v33 = vdiv_f32((float32x2_t)vdup_n_s32(0x45800000u), vcvt_f32_u32((uint32x2_t)__PAIR64__(v32, v120)));
    long long v121 = v33;
    [v8 awbGains];
    long long v35 = v121;
    *((float *)&v35 + 2) = 4096.0 / (float)v34;
    *(_OWORD *)&self->_anon_30[304] = v35;
    if (v4)
    {
      uint64_t v36 = MEMORY[0x263EF89A0];
      long long v37 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)&self->_anon_30[16] = *MEMORY[0x263EF89A0];
      *(_OWORD *)&self->_anon_30[32] = v37;
      *(_OWORD *)&self->_anon_30[48] = *(_OWORD *)(v36 + 32);
    }
    else
    {
      [v8 colorCorrectionMatrix];
      *(_DWORD *)&self->_anon_30[24] = v38;
      *(_DWORD *)&self->_anon_30[40] = v39;
      *(void *)&self->_anon_30[16] = v40;
      *(void *)&self->_anon_30[32] = v41;
      *(_DWORD *)&self->_anon_30[56] = v42;
      *(void *)&self->_anon_30[48] = v43;
    }
    simd_float3x3 v134 = __invert_f3(*(simd_float3x3 *)&self->_anon_30[16]);
    *(_DWORD *)&self->_anon_30[72] = v134.columns[0].i32[2];
    *(_DWORD *)&self->_anon_30[88] = v134.columns[1].i32[2];
    *(void *)&self->_anon_30[64] = v134.columns[0].i64[0];
    *(void *)&self->_anon_30[80] = v134.columns[1].i64[0];
    *(_DWORD *)&self->_anon_30[104] = v134.columns[2].i32[2];
    *(void *)&self->_anon_30[96] = v134.columns[2].i64[0];
    if (v4)
    {
      [v8 colorCorrectionMatrix];
      *(_DWORD *)&self->_anon_30[168] = v44;
      *(_DWORD *)&self->_anon_30[184] = v45;
      *(void *)&self->_anon_30[160] = v46;
      *(void *)&self->_anon_30[176] = v47;
      *(_DWORD *)&self->_anon_30[200] = v48;
      *(void *)&self->_anon_30[192] = v49;
    }
    else
    {
      uint64_t v50 = MEMORY[0x263EF89A0];
      long long v51 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)&self->_anon_30[160] = *MEMORY[0x263EF89A0];
      *(_OWORD *)&self->_anon_30[176] = v51;
      *(_OWORD *)&self->_anon_30[192] = *(_OWORD *)(v50 + 32);
    }
    simd_float3x3 v135 = __invert_f3(*(simd_float3x3 *)&self->_anon_30[160]);
    *(_DWORD *)&self->_anon_30[120] = v135.columns[0].i32[2];
    *(_DWORD *)&self->_anon_30[136] = v135.columns[1].i32[2];
    *(void *)&self->_anon_30[112] = v135.columns[0].i64[0];
    *(void *)&self->_anon_30[128] = v135.columns[1].i64[0];
    *(_DWORD *)&self->_anon_30[152] = v135.columns[2].i32[2];
    *(void *)&self->_anon_30[144] = v135.columns[2].i64[0];
    [v8 awbSkinGains];
    unsigned int v122 = v52;
    [v8 awbSkinGains];
    float32x2_t v54 = (float32x2_t)vdup_n_s32(0x45800000u);
    *(float32x2_t *)&long long v55 = vdiv_f32(v54, vcvt_f32_u32((uint32x2_t)__PAIR64__(v53, v122)));
    long long v123 = v55;
    [v8 awbSkinGains];
    long long v57 = v123;
    *((float *)&v57 + 2) = 4096.0 / (float)v56;
    *(_OWORD *)&self->_anon_30[336] = v57;
    [v8 awbSkyGains];
    LODWORD(v123) = v58;
    [v8 awbSkyGains];
    *(float32x2_t *)v60.f32 = vdiv_f32(v54, vcvt_f32_u32((uint32x2_t)__PAIR64__(v59, v123)));
    simd_float3 v124 = v60;
    [v8 awbSkyGains];
    v136.columns[1] = v124;
    v136.columns[1].f32[2] = 4096.0 / (float)v61;
    *(simd_float3 *)&self->_anon_30[320] = v136.columns[1];
    *(_DWORD *)&self->_anon_1b0[8] = 1031798784;
    *(void *)self->_anon_1b0 = 0x3E0000003D800000;
    *(_DWORD *)&self->_anon_1b0[24] = 1040187392;
    *(void *)&self->_anon_1b0[16] = 0x3E8000003E000000;
    *(_DWORD *)&self->_anon_1b0[40] = 1031798784;
    *(void *)&self->_anon_1b0[32] = 0x3E0000003D800000;
    v136.columns[1].f32[0] = (float)*(int *)(v18 + 184);
    *(float *)&uint64_t v62 = (float)*(int *)(v18 + 176) - (float)(1048600.0 / v136.columns[1].f32[0]);
    float v63 = (float)*(int *)(v18 + 188);
    *((float *)&v62 + 1) = (float)*(int *)(v18 + 180) - (float)(1048600.0 / v63);
    *(void *)&self->_anon_1b0[128] = v62;
    v136.columns[1].f32[0] = v136.columns[1].f32[0] * 0.000015259;
    v136.columns[1].f32[1] = v63 * 0.000015259;
    *(void *)&self->_anon_1b0[136] = v136.columns[1].i64[0];
    __asm { FMOV            V0.2S, #1.0 }
    *(float32x2_t *)&self->_anon_1b0[144] = vdiv_f32(_D0, *(float32x2_t *)v136.columns[1].f32);
    v136.columns[0].i64[0] = *(void *)(v18 + 20);
    v136.columns[0].i32[2] = *(_DWORD *)(v18 + 28);
    *(simd_float3 *)&self->_anon_1b0[48] = v136.columns[0];
    v136.columns[0].i32[0] = *(_DWORD *)(v18 + 8);
    v136.columns[1].i32[0] = *(_DWORD *)(v18 + 12);
    v136.columns[2].i32[0] = *(_DWORD *)(v18 + 16);
    v136.columns[0].i32[1] = *(_DWORD *)(v18 + 20);
    v136.columns[0].i32[2] = *(_DWORD *)(v18 + 32);
    v136.columns[1].i32[1] = *(_DWORD *)(v18 + 24);
    v136.columns[1].i32[2] = *(_DWORD *)(v18 + 36);
    v136.columns[2].i32[1] = *(_DWORD *)(v18 + 28);
    v136.columns[2].i32[2] = *(_DWORD *)(v18 + 40);
    simd_float3x3 v137 = __invert_f3(v136);
    v137.columns[0] = (simd_float3)vtrn2q_s32((int32x4_t)v137.columns[0], (int32x4_t)v137.columns[1]);
    v137.columns[0].i32[2] = v137.columns[2].i32[1];
    *(simd_float3 *)&self->_anon_1b0[64] = v137.columns[0];
    v137.columns[0].i64[0] = *(void *)&self->_anon_1b0[336];
    v137.columns[1].i64[0] = *(void *)&self->_anon_1b0[344];
    float32x4_t v69 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_263480970, v137.columns[0].f32[0]), (float32x4_t)xmmword_263480980, v137.columns[1].f32[0]);
    v137.columns[0] = (simd_float3)vmlaq_lane_f32(vmulq_lane_f32((float32x4_t)xmmword_263480970, *(float32x2_t *)v137.columns[0].f32, 1), (float32x4_t)xmmword_263480980, *(float32x2_t *)v137.columns[1].f32, 1);
    *(_DWORD *)&self->_anon_1b0[88] = v69.i32[2];
    *(void *)&self->_anon_1b0[80] = v69.i64[0];
    *(_DWORD *)&self->_anon_1b0[104] = v137.columns[0].i32[2];
    *(void *)&self->_anon_1b0[96] = v137.columns[0].i64[0];
    *(_DWORD *)&self->_anon_1b0[120] = 1065353216;
    *(void *)&self->_anon_1b0[112] = 0;
    [(MIWB *)self rgbToC1c2:*(double *)&self->_anon_30[304]];
    LODWORD(v70) = 0;
    *(void *)&self->_anon_1b0[296] = v70;
    *(_DWORD *)&self->_anon_1b0[304] = 1036831949;
    *(void *)&self->_anon_1b0[320] = 0x42A0000040800000;
    *(_DWORD *)&self->_anon_1b0[328] = 1109393408;
    *(float *)&self->_anon_30[372] = v14;
    *(float *)&self->_anon_30[352] = v14 * 0.5;
    *(_OWORD *)&self->_anon_30[356] = xmmword_263480990;
    [(MIWB *)self rgbToC1c2:*(double *)&self->_anon_30[304]];
    float v126 = v71;
    -[MIWB c1ToMired:](self, "c1ToMired:");
    float v72 = *(float *)&v73 + *(float *)&self->_anon_30[368];
    LODWORD(v73) = *(_DWORD *)&self->_anon_1b0[156];
    if (v72 <= *(float *)&v73)
    {
      LODWORD(v73) = *(_DWORD *)&self->_anon_1b0[152];
      if (v72 >= *(float *)&v73) {
        *(float *)&double v73 = v72;
      }
    }
    [(MIWB *)self miredToC1:v73];
    *((float *)&v74 + 1) = v126 + 1.0;
    [(MIWB *)self c1c2Torgb:v74];
    uint64_t v75 = 0;
    *(float *)&unsigned int v77 = *(float *)&self->_anon_30[304] / *(float *)&v76;
    LODWORD(v78) = 0;
    *((float *)&v78 + 1) = *(float *)&self->_anon_30[308] / *((float *)&v76 + 1);
    *(void *)&long long v79 = 0;
    HIDWORD(v79) = 0;
    *((float *)&v79 + 2) = *(float *)&self->_anon_30[312] / *((float *)&v76 + 2);
    *(_OWORD *)&self->_anon_30[320] = v76;
    float32x4_t v80 = *(float32x4_t *)&self->_anon_30[160];
    float32x4_t v81 = *(float32x4_t *)&self->_anon_30[176];
    float32x4_t v82 = *(float32x4_t *)&self->_anon_30[192];
    long long v130 = v77;
    long long v131 = v78;
    long long v132 = v79;
    float32x4_t v127 = 0u;
    float32x4_t v128 = 0u;
    float32x4_t v129 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v127 + v75) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(long long *)((char *)&v130 + v75))), v81, *(float32x2_t *)((char *)&v130 + v75), 1), v82, *(float32x4_t *)((char *)&v130 + v75), 2);
      v75 += 16;
    }
    while (v75 != 48);
    uint64_t v83 = 0;
    float32x4_t v84 = v127;
    float32x4_t v85 = v128;
    float32x4_t v86 = v129;
    long long v87 = *(_OWORD *)&self->_anon_30[128];
    long long v88 = *(_OWORD *)&self->_anon_30[144];
    long long v130 = *(_OWORD *)&self->_anon_30[112];
    long long v131 = v87;
    long long v132 = v88;
    float32x4_t v127 = 0u;
    float32x4_t v128 = 0u;
    float32x4_t v129 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v127 + v83) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, COERCE_FLOAT(*(long long *)((char *)&v130 + v83))), v85, *(float32x2_t *)((char *)&v130 + v83), 1), v86, *(float32x4_t *)((char *)&v130 + v83), 2);
      v83 += 16;
    }
    while (v83 != 48);
    uint64_t v89 = v127.i64[0];
    float32x4_t v90 = v128;
    float32x4_t v91 = v129;
    *(_DWORD *)&self->_anon_30[216] = v127.i32[2];
    *(void *)&self->_anon_30[208] = v89;
    *(_DWORD *)&self->_anon_30[220] = 0;
    *(_DWORD *)&self->_anon_30[232] = v90.i32[2];
    *(void *)&self->_anon_30[224] = v90.i64[0];
    *(_DWORD *)&self->_anon_30[236] = 0;
    *(_DWORD *)&self->_anon_30[248] = v91.i32[2];
    *(void *)&self->_anon_30[240] = v91.i64[0];
    *(_DWORD *)&self->_anon_30[252] = 0;
    float32x4_t v125 = *(float32x4_t *)&self->_anon_30[336];
    [v8 fdAWBChistMixFactor];
    float v93 = v92;
    [v8 skinWBWeightForMIWB];
    uint64_t v94 = 0;
    float32x4_t v96 = *(float32x4_t *)&self->_anon_30[304];
    float32x4_t v97 = vmlaq_n_f32(v125, vsubq_f32(v96, v125), 1.0 - (float)(v93 * v95));
    *(float32x4_t *)&self->_anon_30[336] = v97;
    v97.f32[0] = v96.f32[0] / v97.f32[0];
    LODWORD(v98) = 0;
    *((float *)&v98 + 1) = v96.f32[1] / v97.f32[1];
    *(void *)&long long v99 = 0;
    *((void *)&v99 + 1) = COERCE_UNSIGNED_INT(v96.f32[2] / v97.f32[2]);
    float32x4_t v100 = *(float32x4_t *)&self->_anon_30[160];
    float32x4_t v101 = *(float32x4_t *)&self->_anon_30[176];
    float32x4_t v102 = *(float32x4_t *)&self->_anon_30[192];
    long long v130 = v97.u32[0];
    long long v131 = v98;
    long long v132 = v99;
    float32x4_t v127 = 0u;
    float32x4_t v128 = 0u;
    float32x4_t v129 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v127 + v94) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, COERCE_FLOAT(*(long long *)((char *)&v130 + v94))), v101, *(float32x2_t *)((char *)&v130 + v94), 1), v102, *(float32x4_t *)((char *)&v130 + v94), 2);
      v94 += 16;
    }
    while (v94 != 48);
    uint64_t v103 = 0;
    float32x4_t v104 = v127;
    float32x4_t v105 = v128;
    float32x4_t v106 = v129;
    long long v107 = *(_OWORD *)&self->_anon_30[128];
    long long v108 = *(_OWORD *)&self->_anon_30[144];
    long long v130 = *(_OWORD *)&self->_anon_30[112];
    long long v131 = v107;
    long long v132 = v108;
    float32x4_t v127 = 0u;
    float32x4_t v128 = 0u;
    float32x4_t v129 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v127 + v103) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v104, COERCE_FLOAT(*(long long *)((char *)&v130 + v103))), v105, *(float32x2_t *)((char *)&v130 + v103), 1), v106, *(float32x4_t *)((char *)&v130 + v103), 2);
      v103 += 16;
    }
    while (v103 != 48);
    uint64_t v109 = v127.i64[0];
    float32x4_t v110 = v128;
    float32x4_t v111 = v129;
    *(_DWORD *)&self->_anon_30[264] = v127.i32[2];
    *(void *)&self->_anon_30[256] = v109;
    *(_DWORD *)&self->_anon_30[268] = 0;
    *(_DWORD *)&self->_anon_30[280] = v110.i32[2];
    *(void *)&self->_anon_30[272] = v110.i64[0];
    *(_DWORD *)&self->_anon_30[284] = 0;
    *(_DWORD *)&self->_anon_30[296] = v111.i32[2];
    *(void *)&self->_anon_30[288] = v111.i64[0];
    *(_DWORD *)&self->_anon_30[300] = 0;
    int v112 = [(MIWB *)self configureStyleEngine];
    if (v112)
    {
      int v11 = v112;
      FigDebugAssert3();
    }
    else
    {
      self->_configured = 1;
      v113 = NSString;
      v114 = [v8 portType];
      v115 = [v113 stringWithString:v114];
      v116 = self->_portTypeConfigured;
      self->_portTypeConfigured = v115;

      int v11 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v118 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v11 = -73354;
  }

LABEL_33:
  return v11;
}

- (BOOL)canRunMIWB:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  id v6 = [v4 portType];

  if (!v6) {
    goto LABEL_8;
  }
  if (!self->_hasBeenSetup) {
    goto LABEL_8;
  }
  [v5 awbGains];
  uint32x4_t v8 = (uint32x4_t)vceqzq_s32(v7);
  v8.i32[3] = v8.i32[2];
  if ((vmaxvq_u32(v8) & 0x80000000) != 0
    || (v9.i64[0] = 0x100000001000,
        v9.i64[1] = 0x100000001000,
        uint32x4_t v10 = (uint32x4_t)vceqq_s32(v7, v9),
        v10.i32[3] = v10.i32[2],
        (vminvq_u32(v10) & 0x80000000) != 0)
    || ([v5 awbSkinGains],
        uint32x4_t v12 = (uint32x4_t)vceqzq_s32(v11),
        v12.i32[3] = v12.i32[2],
        (vmaxvq_u32(v12) & 0x80000000) != 0))
  {
LABEL_8:
    BOOL v15 = 0;
  }
  else
  {
    v13.i64[0] = 0x100000001000;
    v13.i64[1] = 0x100000001000;
    uint32x4_t v14 = (uint32x4_t)vceqq_s32(v11, v13);
    v14.i32[3] = v14.i32[2];
    BOOL v15 = (vminvq_u32(v14) & 0x80000000) == 0;
  }

  return v15;
}

- (float)interpolateLinear1D:(MIWB *)self samples:(SEL)a2 nSamples:(float)a3
{
  float v5 = 0.0;
  if (v4 >= 2)
  {
    uint64_t v6 = *v3;
    if (COERCE_FLOAT(*v3) >= a3)
    {
      return *((float *)&v6 + 1);
    }
    else
    {
      uint64_t v7 = (v4 - 1);
      if (COERCE_FLOAT(v3[v7]) <= a3)
      {
        LODWORD(v5) = HIDWORD(v3[v7]);
      }
      else
      {
        uint64_t v8 = 0;
        while (v7 != v8)
        {
          if (*(float *)&v6 == a3) {
            return *((float *)&v6 + 1);
          }
          uint64_t v9 = v8 + 1;
          uint64_t v6 = v3[++v8];
          if (*(float *)&v6 > a3)
          {
            uint64_t v7 = v9 - 1;
            int v4 = v9;
            break;
          }
        }
        float32x2_t v10 = (float32x2_t)v3[v4];
        _D2 = (float32x2_t)v3[v7];
        float32x2_t v12 = vsub_f32(v10, _D2);
        if (v12.f32[0] == 0.0)
        {
          return vmuls_lane_f32(0.5, vadd_f32(v10, _D2), 1);
        }
        else
        {
          LODWORD(_S3) = vdiv_f32((float32x2_t)vdup_lane_s32((int32x2_t)v12, 1), v12).u32[0];
          __asm { FMLS            S1, S3, V2.S[0] }
          return vmlas_n_f32(_S1, a3, _S3);
        }
      }
    }
  }
  return v5;
}

- (float)miredToC1:(float)a3
{
  float v3 = a3;
  a3 = *(float *)&self->_anon_1b0[156];
  if (a3 >= v3)
  {
    a3 = *(float *)&self->_anon_1b0[152];
    if (a3 <= v3) {
      a3 = v3;
    }
  }
  [(MIWB *)self interpolateLinear1D:&self->_anon_1b0[232] samples:8 nSamples:*(double *)&a3];
  return result;
}

- (float)c1ToMired:(float)a3
{
  float v3 = a3;
  a3 = *(float *)&self->_anon_1b0[164];
  if (a3 >= v3)
  {
    a3 = *(float *)&self->_anon_1b0[160];
    if (a3 <= v3) {
      a3 = v3;
    }
  }
  [(MIWB *)self interpolateLinear1D:&self->_anon_1b0[168] samples:8 nSamples:*(double *)&a3];
  return result;
}

- (double)c1c2Torgb:(uint64_t)a1
{
  float32x2_t v2 = vmul_f32(vmla_f32(vneg_f32(*(float32x2_t *)(a1 + 560)), *(float32x2_t *)(a1 + 576), a2), (float32x2_t)vdup_n_s32(0x3C800000u));
  float v3 = (const float *)(a1 + 768);
  float32x2x2_t v17 = vld2_f32(v3);
  float32x4_t v16 = *(float32x4_t *)(a1 + 496);
  float32x2_t v4 = vmul_f32(vmla_lane_f32(vmul_n_f32(v17.val[0], v2.f32[0]), v17.val[1], v2, 1), (float32x2_t)0x3D0000003D000000);
  float v14 = v4.f32[0];
  float v15 = exp2f(v4.f32[1]);
  *(float *)v5.i32 = exp2f(v14);
  float32x2_t v6 = (float32x2_t)__PAIR64__(LODWORD(v15), v5.u32[0]);
  *(float *)&v5.i32[1] = v15;
  __asm { FMOV            V1.4S, #1.0 }
  int32x4_t v12 = (int32x4_t)vmulq_f32(v16, (float32x4_t)vextq_s8((int8x16_t)vzip1q_s32(_Q1, v5), (int8x16_t)_Q1, 4uLL));
  _Q1.i32[0] = vdiv_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))), 0)).u32[0];
  return *(double *)_Q1.i64;
}

- (float32x2_t)rgbToC1c2:(uint64_t)a1
{
  float32x4_t v3 = vmulq_f32(*(float32x4_t *)(a1 + 480), a2);
  a2.i32[1] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u32[0];
  __asm { FMOV            V1.4S, #0.25 }
  float32x4_t v9 = vmulq_f32(a2, _Q1);
  v9.i32[3] = 0;
  simd_float4 v10 = (simd_float4)vmaxnmq_f32(v9, (float32x4_t)xmmword_2634809A0);
  v10.i32[3] = 1.0;
  simd_float4 v11 = _simd_log2_f4(v10);
  v12.i64[0] = 0x4200000042000000;
  v12.i64[1] = 0x4200000042000000;
  float32x4_t v13 = vmulq_f32((float32x4_t)v11, v12);
  int32x4_t v14 = *(int32x4_t *)(a1 + 512);
  int32x4_t v15 = *(int32x4_t *)(a1 + 528);
  int32x4_t v16 = *(int32x4_t *)(a1 + 544);
  int32x4_t v17 = vzip2q_s32(v14, v16);
  float32x4_t v18 = (float32x4_t)vzip1q_s32(vzip1q_s32(v14, v16), v15);
  float32x4_t v19 = (float32x4_t)vtrn2q_s32(v14, v15);
  v19.i32[2] = HIDWORD(*(void *)(a1 + 544));
  return vmul_f32(*(float32x2_t *)(a1 + 568), vadd_f32(*(float32x2_t *)(a1 + 560), (float32x2_t)*(_OWORD *)&vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, v13.f32[0]), v19, *(float32x2_t *)v13.f32, 1), (float32x4_t)vzip1q_s32(v17, vdupq_laneq_s32(v15, 2)), v13, 2)));
}

- (int)runWithInLinearLumaTex:(id)a3 inLinearChromaTex:(id)a4 inSkyMaskTex:(id)a5 inSkinMaskTex:(id)a6 inHazeCorrection:(id)a7 outLinearLumaTex:(id)a8 outLinearChromaTex:
{
  long long v63 = v9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v65 = a6;
  v72[0] = v63;
  id v19 = a7;
  id v20 = a8;
  int v21 = [(MIWB *)self allocInternalResources];
  if (v21)
  {
    int v55 = v21;
    uint64_t v58 = v8;
    LODWORD(v57) = v21;
    FigDebugAssert3();
    goto LABEL_12;
  }
  if (!v16)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
LABEL_19:
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
    goto LABEL_12;
  }
  if (!v17)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    goto LABEL_19;
  }
  if (!v18)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    goto LABEL_19;
  }
  if (!v19)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    goto LABEL_19;
  }
  if (!v20)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    goto LABEL_19;
  }
  float v22 = [(FigMetalContext *)self->_metalContext commandBuffer];
  [v22 setLabel:@"MIWB::CreateTarget"];
  float v23 = [v22 blitCommandEncoder];
  if (!v23)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
LABEL_22:

    goto LABEL_12;
  }
  uint64_t v24 = v23;
  [v23 setLabel:@"MIWB::BlitBuffersToZero"];
  objc_msgSend(v24, "fillBuffer:range:value:", self->_blueMapPdfStatsBuffer, 0, -[MTLBuffer length](self->_blueMapPdfStatsBuffer, "length"), 0);
  objc_msgSend(v24, "fillBuffer:range:value:", self->_wpStatsBuffer, 0, -[MTLBuffer length](self->_wpStatsBuffer, "length"), 0);
  uint64_t v62 = v24;
  [v24 endEncoding];
  uint64_t v25 = [v22 computeCommandEncoder];
  if (!v25)
  {
    uint64_t v58 = v8;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();

    goto LABEL_22;
  }
  float v26 = v25;
  id v64 = v20;
  unsigned int v59 = v19;
  [v25 setComputePipelineState:self->_computePipelineStates[0]];
  id v61 = v16;
  [v26 setTexture:v16 atIndex:1];
  id v27 = v17;
  [v26 setTexture:v17 atIndex:2];
  [v26 setTexture:self->_stfThumbnailTex atIndex:5];
  [v26 setTexture:self->_sensThumbnailTex atIndex:6];
  id v60 = v18;
  [v26 setTexture:v18 atIndex:3];
  [v26 setTexture:v65 atIndex:4];
  [v26 setTexture:self->_skyMaskTex atIndex:7];
  [v26 setTexture:self->_skinMaskTex atIndex:8];
  [v26 setBytes:self->_anon_30 length:384 atIndex:0];
  [v26 setBytes:v72 length:16 atIndex:5];
  uint64_t v28 = *(void *)self->_anon_30;
  unint64_t v29 = v28;
  unint64_t v30 = HIDWORD(v28);
  uint64_t v31 = [(MTLComputePipelineState *)self->_computePipelineStates[0] threadExecutionWidth];
  unint64_t v32 = [(MTLComputePipelineState *)self->_computePipelineStates[0] maxTotalThreadsPerThreadgroup];
  unint64_t v33 = [(MTLComputePipelineState *)self->_computePipelineStates[0] threadExecutionWidth];
  unint64_t v69 = v29;
  unint64_t v70 = v30;
  uint64_t v71 = 1;
  uint64_t v66 = v31;
  unint64_t v67 = v32 / v33;
  uint64_t v68 = 1;
  [v26 dispatchThreads:&v69 threadsPerThreadgroup:&v66];
  [v26 setComputePipelineState:self->_computePipelineStates[1]];
  [v26 setTexture:self->_sensThumbnailTex atIndex:6];
  [v26 setTexture:self->_ignoreMapTex atIndex:11];
  [v26 setTexture:self->_c1c2Tex atIndex:12];
  [v26 setTexture:self->_clusterTex atIndex:13];
  [v26 setTexture:self->_clusterFullTex atIndex:14];
  [v26 setTexture:self->_skyMaskTex atIndex:7];
  [v26 setTexture:self->_localIllMapTex atIndex:15];
  [v26 setTexture:self->_skinMaskTex atIndex:8];
  [v26 setTexture:self->_skyMaskBlurredTex atIndex:9];
  [v26 setTexture:self->_skinMaskBlurredTex atIndex:10];
  [v26 setBytes:self->_anon_1b0 length:352 atIndex:1];
  [v26 setBuffer:self->_wpStatsBuffer offset:0 atIndex:2];
  uint64_t v34 = [(MTLTexture *)self->_sensThumbnailTex width];
  uint64_t v35 = [(MTLTexture *)self->_sensThumbnailTex height];
  uint64_t v36 = [(MTLComputePipelineState *)self->_computePipelineStates[1] threadExecutionWidth];
  unint64_t v37 = [(MTLComputePipelineState *)self->_computePipelineStates[1] maxTotalThreadsPerThreadgroup];
  unint64_t v38 = [(MTLComputePipelineState *)self->_computePipelineStates[1] threadExecutionWidth];
  unint64_t v69 = v34;
  unint64_t v70 = v35;
  uint64_t v71 = 1;
  uint64_t v66 = v36;
  unint64_t v67 = v37 / v38;
  uint64_t v68 = 1;
  [v26 dispatchThreads:&v69 threadsPerThreadgroup:&v66];
  [v26 setComputePipelineState:self->_computePipelineStates[2]];
  [v26 setTexture:self->_sensThumbnailTex atIndex:6];
  [v26 setTexture:self->_clusterFullTex atIndex:14];
  [v26 setTexture:self->_clusterTex atIndex:13];
  [v26 setTexture:self->_ignoreMapTex atIndex:11];
  [v26 setTexture:self->_skyMaskBlurredTex atIndex:9];
  [v26 setTexture:self->_skinMaskBlurredTex atIndex:10];
  [v26 setTexture:self->_finalTargetTex atIndex:23];
  [v26 setTexture:self->_stfThumbnailTex atIndex:5];
  [v26 setTexture:self->_weightPlanesArrayTex atIndex:27];
  [v26 setBytes:self->_anon_30 length:384 atIndex:0];
  [v26 setBuffer:self->_wpStatsBuffer offset:0 atIndex:2];
  [v26 setBuffer:self->_blueMapPdfStatsBuffer offset:0 atIndex:4];
  uint64_t v39 = [(MTLTexture *)self->_sensThumbnailTex width];
  uint64_t v40 = [(MTLTexture *)self->_sensThumbnailTex height];
  uint64_t v41 = [(MTLComputePipelineState *)self->_computePipelineStates[2] threadExecutionWidth];
  unint64_t v42 = [(MTLComputePipelineState *)self->_computePipelineStates[2] maxTotalThreadsPerThreadgroup];
  unint64_t v43 = [(MTLComputePipelineState *)self->_computePipelineStates[2] threadExecutionWidth];
  unint64_t v69 = v39;
  unint64_t v70 = v40;
  uint64_t v71 = 1;
  uint64_t v66 = v41;
  unint64_t v67 = v42 / v43;
  uint64_t v68 = 1;
  [v26 dispatchThreads:&v69 threadsPerThreadgroup:&v66];
  [v26 endEncoding];
  [(FigMetalContext *)self->_metalContext commit];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputThumbnailTexture:self->_stfThumbnailTex];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTargetThumbnailTexture:self->_finalTargetTex];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputWeightPlaneTexture:self->_weightPlanesArrayTex];
  int v44 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor process];
  if (v44)
  {
    int v55 = v44;
    uint64_t v58 = v8;
    LODWORD(v57) = v44;
    FigDebugAssert3();

    id v16 = v61;
    id v17 = v27;
    id v19 = v59;
  }
  else
  {
    int v45 = [(FigMetalContext *)self->_metalContext commandBuffer];

    [v45 setLabel:@"MIWB::ApplyStyle"];
    uint64_t v46 = [v45 computeCommandEncoder];

    if (v46)
    {
      [v46 setComputePipelineState:self->_computePipelineStates[3]];
      [v46 setTexture:v61 atIndex:1];
      uint64_t v47 = v27;
      [v46 setTexture:v27 atIndex:2];
      [v46 setTexture:self->_finalTargetTex atIndex:23];
      [v46 setTexture:self->_stfThumbnailTex atIndex:5];
      int v48 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor outputIntegratedCoefficients];
      [v46 setTexture:v48 atIndex:24];

      id v19 = v59;
      [v46 setTexture:v59 atIndex:25];
      [v46 setTexture:v20 atIndex:26];
      [v46 setBytes:self->_anon_30 length:384 atIndex:0];
      [v46 setBytes:v72 length:16 atIndex:5];
      unint64_t v49 = (unint64_t)[v59 width] >> 1;
      unint64_t v50 = (unint64_t)[v59 height] >> 1;
      uint64_t v51 = [(MTLComputePipelineState *)self->_computePipelineStates[3] threadExecutionWidth];
      unint64_t v52 = [(MTLComputePipelineState *)self->_computePipelineStates[3] maxTotalThreadsPerThreadgroup];
      unint64_t v53 = [(MTLComputePipelineState *)self->_computePipelineStates[3] threadExecutionWidth];
      unint64_t v69 = v49;
      unint64_t v70 = v50;
      id v20 = v64;
      uint64_t v71 = 1;
      unint64_t v54 = v52 / v53;
      id v17 = v47;
      uint64_t v66 = v51;
      unint64_t v67 = v54;
      id v16 = v61;
      uint64_t v68 = 1;
      [v46 dispatchThreads:&v69 threadsPerThreadgroup:&v66];
      [v46 endEncoding];
      [(FigMetalContext *)self->_metalContext commit];

      int v55 = 0;
      id v18 = v60;
    }
    else
    {
      uint64_t v58 = v8;
      LODWORD(v57) = 0;
      FigDebugAssert3();
      int v55 = FigSignalErrorAt();

      id v16 = v61;
      id v17 = v27;
      id v19 = v59;
    }
  }
LABEL_12:
  [(MIWB *)self deallocInternalResources];

  return v55;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miwbModuleConfigPlistDictByPortType, 0);
  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
  objc_storeStrong((id *)&self->_weightPlanesArrayTex, 0);
  objc_storeStrong((id *)&self->_portTypeConfigured, 0);
  objc_storeStrong((id *)&self->_ignoreMapTex, 0);
  objc_storeStrong((id *)&self->_skinMaskBlurredTex, 0);
  objc_storeStrong((id *)&self->_skyMaskBlurredTex, 0);
  objc_storeStrong((id *)&self->_skinMaskTex, 0);
  objc_storeStrong((id *)&self->_skyMaskTex, 0);
  objc_storeStrong((id *)&self->_finalTargetTex, 0);
  objc_storeStrong((id *)&self->_localIllMapTex, 0);
  objc_storeStrong((id *)&self->_clusterFullTex, 0);
  objc_storeStrong((id *)&self->_clusterTex, 0);
  objc_storeStrong((id *)&self->_c1c2Tex, 0);
  objc_storeStrong((id *)&self->_sensThumbnailTex, 0);
  objc_storeStrong((id *)&self->_stfThumbnailTex, 0);
  objc_storeStrong((id *)&self->_blueMapPdfStatsBuffer, 0);
  objc_storeStrong((id *)&self->_wpStatsBuffer, 0);
  for (uint64_t i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end