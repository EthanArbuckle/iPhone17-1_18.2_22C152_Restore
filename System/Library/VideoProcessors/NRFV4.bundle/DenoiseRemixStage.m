@interface DenoiseRemixStage
+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4 plistEntryName:(id)a5;
+ (void)prewarmOneShader:(id)a3;
+ (void)prewarmRenderers:(id)a3;
- (BOOL)ditheringEnabled;
- (DenoiseRemixStage)initWithContext:(id)a3 numPyrLevels:(int)a4;
- (int)run:(id)a3 skinMask:(id)a4 skyMask:(id)a5 maskExtent:(CGRect)a6 disableChromaBand3GainMap:(BOOL)a7;
- (int)runShader:(const void *)a3 shader:(id)a4 desc:(id)a5 lumaConfig:(id)a6 chromaConfig:(id)a7 maskTransform:(id)a8;
- (int)setResourcesWithOutputPyramid:(id)a3 noiseMapPyramid:(id)a4 sharpeningPyramid:(id)a5 localGainMapTex:(id)a6 denoisingOptions:(const DenoiseRemixStageOptions *)a7;
- (int)setUniforms:(AmbnrConfiguration *)a3;
- (void)releaseResources;
- (void)setDitheringEnabled:(BOOL)a3;
@end

@implementation DenoiseRemixStage

- (DenoiseRemixStage)initWithContext:(id)a3 numPyrLevels:(int)a4
{
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DenoiseRemixStage;
  v8 = [(DenoiseRemixStage *)&v29 init];
  v9 = v8;
  if (a4 > 0)
  {
    objc_storeStrong((id *)&v8->_metal, a3);
    v10 = [v7 library];
    uint64_t v11 = [v10 newFunctionWithName:@"RemixDenoise_vert"];
    vertFunc = v9->_vertFunc;
    v9->_vertFunc = (MTLFunction *)v11;

    uint64_t v13 = 0;
    char v14 = 1;
LABEL_3:
    uint64_t v15 = 0;
    char v28 = v14;
    if (v14) {
      uint64_t v16 = 10;
    }
    else {
      uint64_t v16 = 25;
    }
    char v17 = 1;
    while (1)
    {
      char v18 = v17;
      v19 = [DenoiseRemixShaders alloc];
      uint64_t v20 = (v18 & 1) != 0 ? 30 : 65;
      uint64_t v21 = [(DenoiseRemixShaders *)v19 initWithMetal:v7 vertFunc:v9->_vertFunc pixelFormatLuma:v16 pixelFormatChroma:v20];
      if (!v21) {
        break;
      }
      uint64_t v22 = (uint64_t)v9->_shaders[v13];
      v23 = *(void **)(v22 + 8 * v15);
      *(void *)(v22 + 8 * v15) = v21;

      char v17 = 0;
      uint64_t v15 = 1;
      if ((v18 & 1) == 0)
      {
        char v14 = 0;
        uint64_t v13 = 1;
        if (v28) {
          goto LABEL_3;
        }
        +[DenoiseRemixStage prewarmRenderers:v9->_metal];
        goto LABEL_14;
      }
    }
  }
  FigDebugAssert3();
  int v25 = FigSignalErrorAt();
  v24 = 0;
  if (!v25) {
LABEL_14:
  }
    v24 = v9;
  v26 = v24;

  return v26;
}

+ (void)prewarmRenderers:(id)a3
{
}

+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4 plistEntryName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x263E64AA0]();
  +[DenoiseRemixStage prewarmOneShader:v7];
  +[DenoiseRemixStage prewarmRenderers:v7];

  return 0;
}

+ (void)prewarmOneShader:(id)a3
{
  id v4 = a3;
  int v5 = 0;
  id v14 = v4;
  do
  {
    v6 = objc_msgSend(v4, "library", v12, v13);
    id v7 = (void *)[v6 newFunctionWithName:@"RemixDenoise_vert"];

    if (!v7) {
      goto LABEL_11;
    }
    id v8 = [DenoiseRemixShaders alloc];
    if (v5) {
      uint64_t v9 = 25;
    }
    else {
      uint64_t v9 = 10;
    }
    if ((v5 & 2) != 0) {
      uint64_t v10 = 65;
    }
    else {
      uint64_t v10 = 30;
    }
    uint64_t v11 = [(DenoiseRemixShaders *)v8 initWithMetal:v14 vertFunc:v7 pixelFormatLuma:v9 pixelFormatChroma:v10];
    if (!v11)
    {
      uint64_t v13 = v3;
      LODWORD(v12) = 0;
      FigDebugAssert3();
LABEL_11:
      uint64_t v11 = 0;
    }

    ++v5;
    id v4 = v14;
  }
  while (v5 != 4);
}

- (int)setResourcesWithOutputPyramid:(id)a3 noiseMapPyramid:(id)a4 sharpeningPyramid:(id)a5 localGainMapTex:(id)a6 denoisingOptions:(const DenoiseRemixStageOptions *)a7
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7
    && ((self->_options = *a7, v13) || !self->_options.enableNoiseMap)
    && (v14 || !self->_options.enableLowVarSharpening))
  {
    objc_storeStrong((id *)&self->_pyr, a3);
    objc_storeStrong((id *)&self->_noiseMapPyramid, a4);
    objc_storeStrong((id *)&self->_sharpeningPyramid, a5);
    objc_storeStrong((id *)&self->_localGainMapTex, a6);
    int v16 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

- (void)releaseResources
{
  pyr = self->_pyr;
  if (pyr && pyr->levels >= 1)
  {
    uint64_t v4 = 0;
    uniforms = self->_uniforms;
    do
    {
      v6 = uniforms[v4];
      uniforms[v4] = 0;

      ++v4;
    }
    while (v4 < self->_pyr->levels);
  }
  roiTxUniform = self->_roiTxUniform;
  self->_roiTxUniform = 0;

  id v8 = self->_pyr;
  self->_pyr = 0;

  noiseMapPyramid = self->_noiseMapPyramid;
  self->_noiseMapPyramid = 0;

  sharpeningPyramid = self->_sharpeningPyramid;
  self->_sharpeningPyramid = 0;

  localGainMapTex = self->_localGainMapTex;
  self->_localGainMapTex = 0;
}

- (int)setUniforms:(AmbnrConfiguration *)a3
{
  pyr = self->_pyr;
  if (pyr)
  {
    if (pyr->levels < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v6 = 0;
      uniforms = self->_uniforms;
      while (1)
      {
        id v8 = [(FigMetalContext *)self->_metal device];
        uint64_t v9 = [v8 newBufferWithBytes:a3 length:376 options:0];
        uint64_t v10 = uniforms[v6];
        uniforms[v6] = (MTLBuffer *)v9;

        if (!uniforms[v6]) {
          break;
        }
        ++v6;
        a3 = (AmbnrConfiguration *)((char *)a3 + 376);
        if (v6 >= self->_pyr->levels) {
          return 0;
        }
      }
      FigDebugAssert3();
      uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return -73371;
    }
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)runShader:(const void *)a3 shader:(id)a4 desc:(id)a5 lumaConfig:(id)a6 chromaConfig:(id)a7 maskTransform:(id)a8
{
  id v42 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  char v17 = [v13 colorAttachments];
  id v18 = [v17 objectAtIndexedSubscript:0];
  v19 = [v18 texture];

  uint64_t v20 = [v13 colorAttachments];
  uint64_t v21 = [v20 objectAtIndexedSubscript:1];
  uint64_t v22 = [v21 texture];

  v23 = [v13 colorAttachments];
  v24 = [v23 objectAtIndexedSubscript:0];
  int v25 = [v24 texture];
  [v25 width];

  v26 = [v13 colorAttachments];
  v27 = [v26 objectAtIndexedSubscript:0];
  char v28 = [v27 texture];
  [v28 height];

  if (!v19)
  {
    BOOL v29 = 0;
LABEL_5:
    if (v22) {
      BOOL v30 = [v22 pixelFormat] == 30;
    }
    else {
      BOOL v30 = 0;
    }
    goto LABEL_8;
  }
  BOOL v29 = [v19 pixelFormat] == 10;
  if ([v19 pixelFormat] != 30) {
    goto LABEL_5;
  }
  BOOL v30 = 1;
LABEL_8:
  BOOL v45 = v30;
  BOOL v31 = !self->_ditheringEnabled;
  BOOL v32 = self->_ditheringEnabled && v29;
  BOOL v44 = v32;
  if (v31) {
    BOOL v30 = 0;
  }
  BOOL v43 = v30;
  v33 = [(FigMetalContext *)self->_metal commandQueue];
  v34 = [v33 commandBuffer];

  if (v34
    && ([v34 renderCommandEncoderWithDescriptor:v13], (uint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = (void *)v35;
    v37 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v36 setVertexBuffer:v37 offset:0 atIndex:0];

    objc_msgSend(v36, "setFragmentTextures:withRange:", a3, 0, 15);
    if (v14) {
      [v36 setFragmentBuffer:v14 offset:0 atIndex:0];
    }
    v38 = v42;
    if (v15) {
      [v36 setFragmentBuffer:v15 offset:0 atIndex:1];
    }
    if (v16) {
      [v36 setFragmentBuffer:v16 offset:0 atIndex:2];
    }
    [v36 setFragmentBytes:&v45 length:1 atIndex:3];
    [v36 setFragmentBytes:&v44 length:1 atIndex:4];
    [v36 setFragmentBytes:&v43 length:1 atIndex:5];
    [v36 setRenderPipelineState:*((void *)v42 + 1)];
    [v36 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v36 endEncoding];
    [v34 commit];

    int v39 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    v38 = v42;
  }

  return v39;
}

- (int)run:(id)a3 skinMask:(id)a4 skyMask:(id)a5 maskExtent:(CGRect)a6 disableChromaBand3GainMap:(BOOL)a7
{
  v157[1] = *(id *)MEMORY[0x263EF8340];
  v133 = (char *)a3;
  id obj = a4;
  id v11 = a4;
  id v132 = a5;
  id v12 = a5;
  v157[0] = 0;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v152 = 0u;
  memset(location, 0, sizeof(location));
  uint64_t levels = self->_pyr->levels;
  id v13 = [(FigMetalContext *)self->_metal allocator];
  id v14 = (void *)[v13 newTextureDescriptor];

  if (!v14) {
    goto LABEL_109;
  }
  id v15 = [v14 desc];
  [v15 setUsage:7];

  id v16 = [(FigMetalContext *)self->_metal allocator];
  char v17 = (void *)[v16 newTextureDescriptor];

  if (!v17)
  {
LABEL_109:
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v121 = 0;
    v128 = 0;
    goto LABEL_96;
  }
  id v18 = [v17 desc];
  [v18 setUsage:7];

  v19 = [v17 desc];
  [v19 setPixelFormat:30];

  pyr = self->_pyr;
  v128 = v17;
  if (*((_DWORD *)v133 + 2) != pyr->levels) {
    goto LABEL_114;
  }
  if (v11 && v12)
  {
    uint64_t v21 = [v11 width];
    if (v21 != [v12 width]) {
      goto LABEL_114;
    }
    uint64_t v22 = [v11 height];
    if (v22 != [v12 height]) {
      goto LABEL_114;
    }
    pyr = self->_pyr;
  }
  if (!pyr->textureY[0])
  {
LABEL_114:
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v121 = 0;
    goto LABEL_96;
  }
  v23 = [(FigMetalContext *)self->_metal device];
  v24 = (MTLBuffer *)[v23 newBufferWithLength:16 options:0];
  roiTxUniform = self->_roiTxUniform;
  self->_roiTxUniform = v24;

  v26 = self->_roiTxUniform;
  if (!v26)
  {
    FigDebugAssert3();
    int v147 = 0;
    v124 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v121 = 0;
    int v120 = -73371;
    goto LABEL_96;
  }
  v127 = v14;
  id v125 = v12;
  id v126 = v11;
  uint64_t v27 = (int)levels - 1;
  *(_OWORD *)[(MTLBuffer *)v26 contents] = xmmword_2634805A0;
  BOOL v28 = self->_pyr->isFP16[v27];
  shaders = self->_shaders;
  BOOL v29 = self->_shaders[v28][v28];
  BOOL v30 = [MEMORY[0x263F129A0] renderPassDescriptor];
  if (!v30)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();

    v121 = 0;
    id v14 = v127;
    goto LABEL_96;
  }
  BOOL v31 = v30;
  BOOL v32 = self->_pyr->textureUV[v27];
  v33 = [v30 colorAttachments];
  v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setTexture:v32];

  uint64_t v35 = [v31 colorAttachments];
  v36 = [v35 objectAtIndexedSubscript:0];
  [v36 setLoadAction:0];

  objc_storeStrong(location, *(id *)&v133[8 * v27 + 336]);
  id v37 = location[2];
  *(_OWORD *)&location[1] = 0u;

  objc_storeStrong(&location[3], *(id *)&v133[8 * v27 + 496]);
  v38 = (void *)*((void *)&v152 + 1);
  long long v152 = 0u;

  int v39 = (void *)v153;
  *(void *)&long long v153 = 0;

  localGainMapTex = 0;
  if (!a7) {
    localGainMapTex = self->_localGainMapTex;
  }
  objc_storeStrong((id *)&v154, localGainMapTex);
  objc_storeStrong((id *)&v154 + 1, obj);
  objc_storeStrong(v157, v132);
  if (self->_options.enableNoiseMap) {
    v41 = self->_noiseMapPyramid->textureY[v27];
  }
  else {
    v41 = 0;
  }
  objc_storeStrong((id *)&v155, v41);
  if (self->_options.enableNoiseMap) {
    id v42 = self->_noiseMapPyramid->textureUV[v27];
  }
  else {
    id v42 = 0;
  }
  objc_storeStrong((id *)&v155 + 1, v42);
  BOOL v43 = (void *)v156;
  *(void *)&long long v156 = 0;

  v139 = v29->_denoiseChroma;
  -[DenoiseRemixStage runShader:shader:desc:lumaConfig:chromaConfig:maskTransform:](self, "runShader:shader:desc:lumaConfig:chromaConfig:maskTransform:", location);

  uint64_t v44 = levels;
  if ((int)levels < 1)
  {
LABEL_94:
    int v120 = 0;
    goto LABEL_95;
  }
  uint64_t v45 = 0;
  uint64_t v140 = (int)levels - 2;
  uint64_t v46 = -8;
  int64x2_t v129 = vdupq_n_s64(0x12uLL);
  v145 = v133;
  uint64_t v138 = levels;
  v134 = &v133[8 * levels];
  p_localGainMapTex = &self->_localGainMapTex;
  v130 = &self->_localGainMapTex + levels;
  uint64_t v144 = levels;
  while (1)
  {
    uint64_t v47 = v44 + v45;
    v48 = self->_pyr;
    uint64_t v49 = v48->levels;
    if (v44 + v45 > v49) {
      -[DenoiseRemixStage run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:]();
    }
    uint64_t v142 = v46;
    uint64_t v50 = v140 + v45;
    uint64_t v51 = v47 - 1;
    if (v47 != 1 && v50 < 0) {
      -[DenoiseRemixStage run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:]();
    }
    uint64_t v52 = self->_options.enableLowVarSharpening ? 1 : *((unsigned __int8 *)&v48->textureUV[20] + v44 + v45 + 7);
    uint64_t v137 = v44 + v45;
    uint64_t v53 = v47 == 1 || v48->isFP16[v140 + v45];
    p_isa = shaders[v52][v53];
    v146 = [MEMORY[0x263F129A0] renderPassDescriptor];
    if (!v146) {
      break;
    }
    if (v50 || (FigMetalIsValid() & 1) != 0) {
      goto LABEL_40;
    }
    uint64_t v54 = [*((id *)v133 + 43) width];
    v55 = [v128 desc];
    [v55 setWidth:v54];

    uint64_t v56 = [*((id *)v133 + 43) height];
    v57 = [v128 desc];
    [v57 setHeight:v56];

    [v128 setLabel:0];
    LODWORD(v57) = self->_pyr->isFP16[0];
    v58 = [v128 desc];
    v59 = v58;
    if (v57)
    {
      [v58 setPixelFormat:65];
    }
    else
    {
      [v58 setPixelFormat:30];

      v60 = [(FigMetalContext *)self->_metal allocator];
      int v61 = [v60 compressionLevel];

      if (v61 != 2) {
        goto LABEL_39;
      }
      v59 = [v127 desc];
      [v59 setCompressionFootprint:1];
    }

LABEL_39:
    v62 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v63 = [v62 newTextureWithDescriptor:v128];
    v64 = self->_pyr;
    v65 = v64->textureUV[0];
    v64->textureUV[0] = (MTLTexture *)v63;

    if (!self->_pyr->textureUV[0]) {
      break;
    }
LABEL_40:
    if (self->_options.enableLowVarSharpening && (FigMetalIsValid() & 1) == 0)
    {
      uint64_t v66 = [*(id *)&v134[8 * v45 + 328] width];
      v67 = [v127 desc];
      [v67 setWidth:v66];

      uint64_t v68 = [*(id *)&v134[8 * v45 + 328] height];
      v69 = [v127 desc];
      [v69 setHeight:v68];

      v70 = [v127 desc];
      [v70 setPixelFormat:25];

      [v127 setLabel:0];
      v71 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v72 = [v71 newTextureWithDescriptor:v127];
      v73 = &self->_sharpeningPyramid->textureY[v144] + v45;
      v74 = *(v73 - 1);
      *(v73 - 1) = (MTLTexture *)v72;

      if (!*((void *)&self->_sharpeningPyramid->pixelBuffer2[v45 + 19] + v144)) {
        break;
      }
    }
    uint64_t v75 = 24;
    if (!self->_options.enableLowVarSharpening) {
      uint64_t v75 = 8;
    }
    v76 = (uint64_t *)(*(char **)((char *)&self->super.isa + v75) + 336);
    if (v51)
    {
      uint64_t v77 = v76[v144 - 1 + v45];
      v78 = [v146 colorAttachments];
      v79 = [v78 objectAtIndexedSubscript:0];
      [v79 setTexture:v77];

      v80 = [v146 colorAttachments];
      v81 = [v80 objectAtIndexedSubscript:0];
      [v81 setLoadAction:0];

      uint64_t v82 = *((void *)&self->_pyr->textureY[(int)levels + 18] + v45);
      v83 = [v146 colorAttachments];
      v84 = [v83 objectAtIndexedSubscript:1];
      [v84 setTexture:v82];

      v85 = [v146 colorAttachments];
      v86 = v85;
      uint64_t v87 = 1;
    }
    else
    {
      uint64_t v88 = *v76;
      v89 = [v146 colorAttachments];
      v90 = [v89 objectAtIndexedSubscript:0];
      [v90 setTexture:v88];

      v85 = [v146 colorAttachments];
      v86 = v85;
      uint64_t v87 = 0;
    }
    v91 = [v85 objectAtIndexedSubscript:v87];
    uint64_t v92 = (v49 - 1);
    [v91 setLoadAction:0];

    objc_storeStrong(location, *(id *)&v134[8 * v45 + 328]);
    if (v51 == v92)
    {
      id v93 = location[1];
      location[1] = 0;

      v94 = 0;
      uint64_t v95 = (int)levels - 2;
      uint64_t v96 = levels;
    }
    else
    {
      uint64_t v96 = levels;
      objc_storeStrong(&location[1], *((id *)&self->_pyr->textureY[v144] + v45));
      v94 = *(void **)&v134[8 * v45 + 336];
      uint64_t v95 = (int)levels - 2;
    }
    objc_storeStrong(&location[2], v94);
    v97 = (id *)&v145[v95 * 8];
    if (!v51) {
      v97 = (id *)v133;
    }
    objc_storeStrong(&location[3], v97[62]);
    if (v51)
    {
      objc_storeStrong((id *)&v152, *((id *)&self->_pyr->textureUV[v45 + 1] + v95));
      v98 = *(void **)&v133[8 * (int)levels + 488 + 8 * v45];
    }
    else
    {
      v99 = (void *)v152;
      *(void *)&long long v152 = 0;

      v98 = 0;
    }
    objc_storeStrong((id *)&v152 + 1, v98);
    v100 = (void *)v153;
    *(void *)&long long v153 = 0;

    objc_storeStrong((id *)&v154, self->_localGainMapTex);
    objc_storeStrong((id *)&v154 + 1, obj);
    objc_storeStrong(v157, v132);
    if (self->_options.enableNoiseMap) {
      v101 = (void *)*((void *)&self->_noiseMapPyramid->pixelBuffer2[v45 + 19] + v96);
    }
    else {
      v101 = 0;
    }
    objc_storeStrong((id *)&v155, v101);
    v102 = 0;
    if (v51 && self->_options.enableNoiseMap) {
      v102 = (void *)*((void *)&self->_noiseMapPyramid->textureUV[v95] + v45);
    }
    objc_storeStrong((id *)&v155 + 1, v102);
    uint64_t v103 = 24;
    if (!self->_options.enableLowVarSharpening) {
      uint64_t v103 = 8;
    }
    objc_storeStrong((id *)&v156, *(id *)(*(char **)((char *)&self->super.isa + v103) + 8 * v45 + v96 * 8 + 328));
    v104 = self->_options.enableLowVarSharpening ? (void *)*((void *)&self->_pyr->pixelBuffer2[v45 + 19] + v96) : 0;
    objc_storeStrong((id *)&v156 + 1, v104);
    if (location[0] == (id)v156) {
      break;
    }
    uint64_t v105 = --v138;
    if (v51 == v92)
    {
      v106 = (DenoiseRemixFragmentShader *)p_isa[2];

      v107 = v130[v45];
      if (v51)
      {
        uniforms = &self->_uniforms[v105];
LABEL_73:
        uint64_t v109 = *((void *)&self->_sharpeningPyramid + (int)levels + v45);
        goto LABEL_78;
      }
      uint64_t v109 = 0;
      uniforms = &p_localGainMapTex[v96];
    }
    else
    {
      if (v51)
      {
        v106 = (DenoiseRemixFragmentShader *)p_isa[3];

        uniforms = &p_localGainMapTex[v96];
        v107 = v130[v45];
        goto LABEL_73;
      }
      uint64_t v110 = 4;
      if (self->_options.enableBandZeroDenoising) {
        uint64_t v110 = 5;
      }
      v106 = (DenoiseRemixFragmentShader *)p_isa[v110];

      uint64_t v109 = 0;
      v107 = self->_uniforms[0];
      uniforms = self->_uniforms;
    }
LABEL_78:
    v139 = v106;
    [(DenoiseRemixStage *)self runShader:location shader:v106 desc:v146 lumaConfig:v107 chromaConfig:v109 maskTransform:self->_roiTxUniform];
    if (self->_options.enableLowVarSharpening)
    {
      id v111 = *((id *)&v156 + 1);
      unsigned int v112 = [v111 width];
      unsigned int v113 = [v111 height];
      if ((void)v156 == *((void *)&v156 + 1))
      {
        FigDebugAssert3();
        int v120 = FigSignalErrorAt();

        goto LABEL_108;
      }
      unsigned int v114 = v113;
      v115 = shaders[*((unsigned __int8 *)&self->_pyr->textureUV[20] + levels + v45 + 7)][1];

      v116 = [(FigMetalContext *)self->_metal commandQueue];
      v117 = [v116 commandBuffer];

      if (!v117)
      {
        FigDebugAssert3();
        int v120 = FigSignalErrorAt();
LABEL_104:

        p_isa = (id *)&v115->super.isa;
        goto LABEL_108;
      }
      v118 = [v117 computeCommandEncoder];
      if (!v118)
      {
        FigDebugAssert3();
        int v120 = FigSignalErrorAt();

        goto LABEL_104;
      }
      LOBYTE(v147) = 0;
      BOOL ditheringEnabled = self->_ditheringEnabled;
      if (ditheringEnabled) {
        BOOL ditheringEnabled = [v111 pixelFormat] == 10;
      }
      LOBYTE(v147) = ditheringEnabled;
      [v118 setComputePipelineState:v115->_varianceSharpening];
      objc_msgSend(v118, "setTextures:withRange:", location, 0, 15);
      [v118 setBuffer:*uniforms offset:0 atIndex:0];
      [v118 setBuffer:self->_roiTxUniform offset:0 atIndex:2];
      [v118 setBytes:&v147 length:1 atIndex:4];
      [v118 setImageblockWidth:32 height:32];
      v150[0] = ((v112 >> 1) + 15) >> 4;
      v150[1] = ((v114 >> 1) + 15) >> 4;
      v150[2] = 1;
      int64x2_t v148 = v129;
      uint64_t v149 = 1;
      [v118 dispatchThreadgroups:v150 threadsPerThreadgroup:&v148];
      [v118 endEncoding];
      [v117 commit];
      FigMetalDecRef();
    }
    else
    {
      v115 = (DenoiseRemixShaders *)p_isa;
    }
    if (v137 < self->_pyr->levels) {
      FigMetalDecRef();
    }
    if (v51 && v140 + v45 + 1 < self->_pyr->levels) {
      FigMetalDecRef();
    }
    if (self->_options.enableNoiseMap)
    {
      FigMetalDecRef();
      FigMetalDecRef();
    }

    --v45;
    uint64_t v46 = v142 - 8;
    v145 -= 8;
    uint64_t v44 = levels;
    --p_localGainMapTex;
    if ((unint64_t)(levels + v45 + 1) <= 1) {
      goto LABEL_94;
    }
  }
  FigDebugAssert3();
  int v120 = FigSignalErrorAt();
LABEL_108:

LABEL_95:
  id v12 = v125;
  id v11 = v126;
  id v14 = v127;
  v121 = v139;
LABEL_96:

  for (uint64_t i = 14; i != -1; --i)
  return v120;
}

- (BOOL)ditheringEnabled
{
  return self->_ditheringEnabled;
}

- (void)setDitheringEnabled:(BOOL)a3
{
  self->_BOOL ditheringEnabled = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  uint64_t v4 = &self->_shaders[1][1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -4);
  objc_storeStrong((id *)&self->_vertFunc, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_roiTxUniform, 0);
  for (uint64_t i = 192; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_localGainMapTex, 0);
  objc_storeStrong((id *)&self->_sharpeningPyramid, 0);
  objc_storeStrong((id *)&self->_noiseMapPyramid, 0);

  objc_storeStrong((id *)&self->_pyr, 0);
}

- (void)run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:.cold.1()
{
}

- (void)run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:.cold.2()
{
  __assert_rtn("-[DenoiseRemixStage run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:]", "DenoiseRemixStageV4.m", 540, "chroma_level >= 0");
}

@end