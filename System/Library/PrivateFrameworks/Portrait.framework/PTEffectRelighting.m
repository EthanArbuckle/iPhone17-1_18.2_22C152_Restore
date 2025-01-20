@interface PTEffectRelighting
- (PTEffectRelighting)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 availableEffectTypes:(unint64_t)a5 effectUtil:(id)a6 util:(id)a7 prewarmOnly:(BOOL)a8 colorSize:(id *)a9 msrColorPyramid:(id)a10 studiolightFromSegmentation:(BOOL)a11 sharedResources:(id)a12;
- (SmoothFaceRectData)smoothFaceRects;
- (id)approximateDiffuseFromSegmentation:(id)a3;
- (id)brightSceneDetector;
- (id)colorCube;
- (id)gainMap;
- (id)syntheticLight;
- (int)filterLightGainApplyInRGB:(id)a3;
- (void)computeSmoothFaceRect:(id)a3 transform:(CGAffineTransform *)a4;
- (void)estimateLightIntensity:(id)a3 inFaceRects:numberOfFaceRects:humanDetections:effectRenderRequest:asyncWork:;
- (void)fgBgDebugWithDisparity:(id)a3 inDiffuse:(id)a4 inFocusDisparityModifier:(id)a5 outMask:(id)a6 debugType:(int64_t)a7;
- (void)initRelightingParam;
- (void)lightMaskDebugWithMSRPyramid:(id)a3 outFaceMask:(id)a4;
- (void)reset;
- (void)studioLightInYUV:(id)a3 inDiffuse:(id)a4 inDisparity:(id)a5 inFocusDisparityModifier:(id)a6 outYUV:(id)a7 relightStrength:(float)a8 studioLightFromSegmentationBlend:(float)a9 studioLightEffectModifier:(id)a10;
- (void)updateColorCube;
- (void)updateParamters:(id)a3 relightStrength:(float)a4;
@end

@implementation PTEffectRelighting

- (PTEffectRelighting)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 availableEffectTypes:(unint64_t)a5 effectUtil:(id)a6 util:(id)a7 prewarmOnly:(BOOL)a8 colorSize:(id *)a9 msrColorPyramid:(id)a10 studiolightFromSegmentation:(BOOL)a11 sharedResources:(id)a12
{
  BOOL v12 = a8;
  char v179 = a5;
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v181 = a6;
  id v20 = a7;
  id v180 = a10;
  id v21 = a12;
  v187.receiver = self;
  v187.super_class = (Class)PTEffectRelighting;
  v22 = [(PTEffectRelighting *)&v187 init];
  v23 = v22;
  if (v22)
  {
    LODWORD(v22->_boxFilter) = -1;
    objc_storeStrong((id *)&v22->_metalContext, a3);
    v23->_frameIndex = 0;
    LODWORD(v23->_colorCube) = 0;
    objc_storeStrong((id *)&v23->_util, a7);
    objc_storeStrong((id *)&v23->_quarterSizeRGBA, a10);
    v23->_smoothFaceRects.aspect = (float)a9->var0 / (float)a9->var1;
    [(PTEffectRelighting *)v23 updateColorCube];
    v24 = [PTBrightSceneDetector alloc];
    LODWORD(v25) = 1045220557;
    LODWORD(v26) = 3.0;
    uint64_t v27 = [(PTBrightSceneDetector *)v24 initWithLuxLevelThreshold:2.1857382e27 emaFilterCoefficient:v25 transitionTime:v26];
    v28 = *(void **)&v23->_lastFrameTimeSeconds;
    *(void *)&v23->_lastFrameTimeSeconds = v27;

    if (*(void *)&v23->_lastFrameTimeSeconds)
    {
      id v178 = v19;
      float v29 = 0.0;
      uint64_t v30 = -1;
      v31 = v188;
      do
      {
        uint64_t v32 = 0;
        int v33 = -1;
        do
        {
          float v34 = pow(2.71828183, (float)((float)((float)((float)v33 * (float)v33) + (float)((float)(int)v30 * (float)(int)v30)) * -0.5))* 0.159154943;
          float v29 = v29 + v34;
          *(float *)&v31[v32] = v34;
          v32 += 3;
          ++v33;
        }
        while (v32 != 9);
        ++v30;
        ++v31;
      }
      while (v30 != 2);
      for (uint64_t i = 0; i != 9; ++i)
        *(float *)&v188[i] = *(float *)&v188[i] / v29;
      LODWORD(v23->_lightGainMapLowRes) = 1056964608;
      v36 = _PTLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:]1((float *)&v23->_lightGainMapLowRes, v36);
      }

      _S0 = v188[0];
      _S1 = v188[1];
      __asm { FCVT            H0, S0 }
      v186[0] = _S0;
      __asm { FCVT            H0, S1 }
      v186[1] = _S0;
      _S0 = v188[2];
      _S1 = v188[3];
      __asm { FCVT            H0, S0 }
      v186[2] = _S0;
      __asm { FCVT            H0, S1 }
      v185[0] = _S0;
      _S0 = v188[4];
      _S1 = v188[5];
      __asm { FCVT            H0, S0 }
      v185[1] = _S0;
      __asm { FCVT            H0, S1 }
      v185[2] = _S0;
      uint64_t v47 = objc_opt_new();
      Class isa = v23[1].super.isa;
      v23[1].super.Class isa = (Class)v47;

      [(objc_class *)v23[1].super.isa setConstantHalf3:v186 withName:@"kWeights2DRow0_half3"];
      [(objc_class *)v23[1].super.isa setConstantHalf3:v185 withName:@"kWeights2DRow1_half3"];
      LODWORD(v49) = 1.5;
      if (*(float *)&v23->_lightGainMapLowRes > 0.25) {
        *(float *)&double v49 = 2.0;
      }
      int v184 = 3;
      [(objc_class *)v23[1].super.isa setConstantFloat:@"kDisparityFilterStepWidth_float" withName:v49];
      [(objc_class *)v23[1].super.isa setConstantValue:&v184 type:29 withName:@"kDisparityFilterType"];
      uint64_t v50 = [v18 computePipelineStateFor:@"studioLight" withConstants:v23[1].super.isa];
      studioLight = v23->_studioLight;
      v23->_studioLight = (MTLComputePipelineState *)v50;

      id v19 = v178;
      if (v23->_studioLight)
      {
        uint64_t v52 = [v18 computePipelineStateFor:@"createLightMask" withConstants:v23[1].super.isa];
        createLightMask = v23->_createLightMask;
        v23->_createLightMask = (MTLComputePipelineState *)v52;

        if (v23->_createLightMask)
        {
          uint64_t v54 = [v18 computePipelineStateFor:@"relightFullsizeInput" withConstants:0];
          relightFullsizeInput = v23->_relightFullsizeInput;
          v23->_relightFullsizeInput = (MTLComputePipelineState *)v54;

          if (v23->_relightFullsizeInput)
          {
            v56 = objc_opt_new();
            [v56 setConstantHalf3:v186 withName:@"kWeights2DRow0_half3"];
            [v56 setConstantHalf3:v185 withName:@"kWeights2DRow1_half3"];
            uint64_t v57 = [v18 computePipelineStateFor:@"filterLightGainApplyToRGB" withConstants:v56];
            filterLightGainApplyToRGB = v23->_filterLightGainApplyToRGB;
            v23->_filterLightGainApplyToRGB = (MTLComputePipelineState *)v57;

            if (v23->_filterLightGainApplyToRGB)
            {
              v59 = [PTSyntheticLight alloc];
              quarterSizeRGBA = v23->_quarterSizeRGBA;
              $F99D9A4FB75BC57F3386B8DC8EE08D7A v183 = *a9;
              uint64_t v61 = [(PTSyntheticLight *)v59 initWithMetalContext:v18 faceAttributesNetwork:v178 effectUtil:v181 msrColorPyramid:quarterSizeRGBA colorSize:&v183 prewarmOnly:v12 sharedResources:v21];
              syntheticLight = v23->_syntheticLight;
              v23->_syntheticLight = (PTSyntheticLight *)v61;

              if (v23->_syntheticLight)
              {
                [(PTEffectRelighting *)v23 initRelightingParam];
                float v63 = *(float *)&v23->_lightGainMapLowRes;
                int v64 = (int)(float)((float)(v63 * (float)a9->var0) * 0.5);
                int v65 = (int)(float)((float)(v63 * (float)a9->var1) * 0.5);
                v66 = [v18 textureUtil];
                uint64_t v67 = v65;
                uint64_t v68 = [v66 createWithWidth:v64 height:v65 pixelFormat:115];
                lightGainMapLowResFiltered = v23->_lightGainMapLowResFiltered;
                v23->_lightGainMapLowResFiltered = (MTLTexture *)v68;

                if (!v23->_lightGainMapLowResFiltered)
                {
                  v148 = _PTLogSystem();
                  if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
                    -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.7(v148, v149, v150, v151, v152, v153, v154, v155);
                  }

                  v102 = 0;
                  id v19 = v178;
                  goto LABEL_61;
                }
                v70 = [v18 textureUtil];
                uint64_t v71 = [v70 createWithWidth:a9->var0 >> 2 height:a9->var1 >> 2 pixelFormat:115];
                lightGainMapFiltered = v23->_lightGainMapFiltered;
                v23->_lightGainMapFiltered = (MTLTexture *)v71;

                if (v23->_lightGainMapFiltered)
                {
                  uint64_t v73 = v64;
                  v74 = [v18 textureUtil];
                  uint64_t v75 = [v74 createWithWidth:a9->var0 >> 1 height:a9->var1 >> 1 pixelFormat:115];
                  brightSceneDetector = v23->_brightSceneDetector;
                  v23->_brightSceneDetector = (PTBrightSceneDetector *)v75;

                  id v19 = v178;
                  if (v23->_brightSceneDetector)
                  {
                    v77 = [v18 textureUtil];
                    uint64_t v78 = [v77 createWithWidth:v73 height:v67 pixelFormat:30];
                    v79 = *(void **)v23->_bgVignetteLightIntensity;
                    *(void *)v23->_bgVignetteLightIntensity = v78;

                    if (*(void *)v23->_bgVignetteLightIntensity)
                    {
                      if ((v179 & 0x40) != 0 && a11)
                      {
                        v80 = [[PTBoxFilter alloc] initWithMetalContext:v23->_metalContext options:8];
                        approximatedDiffuseIntermediate = v23->_approximatedDiffuseIntermediate;
                        v23->_approximatedDiffuseIntermediate = (MTLTexture *)v80;

                        unint64_t v82 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a9->var0, (double)a9->var1);
                        uint64_t v83 = 288;
                        if (v82 == 1) {
                          uint64_t v83 = 320;
                        }
                        uint64_t v84 = 216;
                        if (v82 == 1) {
                          uint64_t v84 = 176;
                        }
                        unint64_t var1 = a9->var1;
                        if (a9->var0 >= var1) {
                          uint64_t v86 = v83;
                        }
                        else {
                          uint64_t v86 = v84;
                        }
                        if (a9->var0 >= var1) {
                          uint64_t v87 = v84;
                        }
                        else {
                          uint64_t v87 = v83;
                        }
                        v88 = [(PTMetalContext *)v23->_metalContext textureUtil];
                        uint64_t v89 = [v88 createWithWidth:v86 height:v87 pixelFormat:10];
                        approximatedDiffuse = v23->_approximatedDiffuse;
                        v23->_approximatedDiffuse = (MTLTexture *)v89;

                        v91 = [(PTMetalContext *)v23->_metalContext textureUtil];
                        uint64_t v92 = [v91 createWithWidth:v86 height:v87 pixelFormat:10];
                        functionConstants = v23->_functionConstants;
                        v23->_functionConstants = (MTLFunctionConstantValues *)v92;
                      }
                      v94 = [(MTLTexture *)v23->_quarterSizeRGBA pyramidRGBA];
                      uint64_t v95 = [v94 firstObject];
                      relightSizeRGBA = v23->_relightSizeRGBA;
                      v23->_relightSizeRGBA = (MTLTexture *)v95;

                      v97 = [(MTLTexture *)v23->_quarterSizeRGBA pyramidRGBA];
                      uint64_t v98 = [(MTLTexture *)v23->_lightGainMapLowResFiltered width];
                      uint64_t v99 = [(MTLTexture *)v23->_lightGainMapLowResFiltered height];
                      v182[0] = v98;
                      v182[1] = v99;
                      v182[2] = 1;
                      uint64_t v100 = +[PTUtil findMipmapLevel:v97 largerThan:v182];
                      v101 = *(void **)&v23->_colorCubeType;
                      *(void *)&v23->_colorCubeType = v100;

                      v102 = v23;
                      goto LABEL_61;
                    }
                    v133 = _PTLogSystem();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:]0(v133, v170, v171, v172, v173, v174, v175, v176);
                    }
                  }
                  else
                  {
                    v133 = _PTLogSystem();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.9(v133, v163, v164, v165, v166, v167, v168, v169);
                    }
                  }
                }
                else
                {
                  v133 = _PTLogSystem();
                  id v19 = v178;
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                    -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.8(v133, v156, v157, v158, v159, v160, v161, v162);
                  }
                }
              }
              else
              {
                v133 = _PTLogSystem();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                  -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.6(v133, v141, v142, v143, v144, v145, v146, v147);
                }
              }
            }
            else
            {
              v133 = _PTLogSystem();
              if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.5(v133, v134, v135, v136, v137, v138, v139, v140);
              }
            }
          }
          else
          {
            v56 = _PTLogSystem();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.4(v56, v126, v127, v128, v129, v130, v131, v132);
            }
          }
        }
        else
        {
          v56 = _PTLogSystem();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:](v56, v119, v120, v121, v122, v123, v124, v125);
          }
        }
      }
      else
      {
        v56 = _PTLogSystem();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:](v56, v112, v113, v114, v115, v116, v117, v118);
        }
      }
      v102 = 0;
LABEL_61:
      v111 = v180;

      goto LABEL_62;
    }
    v103 = _PTLogSystem();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:](v103, v104, v105, v106, v107, v108, v109, v110);
    }
  }
  v102 = 0;
  v111 = v180;
LABEL_62:

  return v102;
}

- (void)updateColorCube
{
  if (LODWORD(self->_boxFilter) != 1)
  {
    LODWORD(self->_boxFilter) = 1;
    v3 = [SingleColorCubeCorrectionStage alloc];
    id v6 = [(PTMetalContext *)self->_metalContext device];
    v4 = [(SingleColorCubeCorrectionStage *)v3 init:v6 cubeSize:32 data:&yellowSatFixCubeData];
    msrColorPyramid = self->_msrColorPyramid;
    self->_msrColorPyramid = v4;
  }
}

- (void)initRelightingParam
{
  int v2 = 0;
  *(_DWORD *)&self->_anon_60[8] = 1064011039;
  *(void *)self->_anon_60 = vdupq_n_s32(0x3F5EB852u).u64[0];
  *(_OWORD *)&self->_bgVignetteLightIntensity[8] = xmmword_1D0820520;
  long long v3 = *(_OWORD *)&self->_anon_60[16];
  do
  {
    long long v5 = xmmword_1D0820520;
    int v4 = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    long long v6 = v3;
    *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v4;
    long long v3 = v6;
    ++v2;
  }
  while (v2 != 3);
  *(_DWORD *)&self->_anon_60[24] = DWORD2(v6);
  *(void *)&self->_anon_60[16] = v3;
  *(void *)&self->_anon_60[32] = 0x3F8666663F000000;
  *(_DWORD *)&self->_anon_60[40] = 1063675494;
  *(_DWORD *)&self->_anon_60[72] = 1061158912;
  *(void *)&self->_anon_60[64] = 0x3F6666663F800000;
  *(_DWORD *)&self->_anon_60[88] = 1065353216;
  *(void *)&self->_anon_60[80] = vdupq_n_s32(0x3F83F571u).u64[0];
  *(_DWORD *)&self->_anon_60[48] = 1056964608;
  *(void *)&self->_weightHeadEye[4] = 0x3E19999A3E800000;
  LODWORD(self->_lightMasks) = 1075838976;
}

- (id)gainMap
{
  return self->_brightSceneDetector;
}

- (id)colorCube
{
  return (id)[(PTMSRResize *)self->_msrColorPyramid cubeTexture];
}

- (SmoothFaceRectData)smoothFaceRects
{
  return &self->_smoothFaceRects;
}

- (void)updateParamters:(id)a3 relightStrength:(float)a4
{
  uint64_t v6 = objc_msgSend(*(id *)&self->_lastFrameTimeSeconds, "brightScene", a3);
  float v26 = v7;
  PTDefaultsFlush(v6);
  [(PTEffectRelighting *)self updateColorCube];
  int v8 = 0;
  *(void *)&self->_anon_60[96] = 0x3FC000003F000000;
  *(void *)&self->_anon_60[104] = 0x400000003F000000;
  long long v9 = *(_OWORD *)&self->_bgVignetteLightIntensity[8];
  long long v11 = *(_OWORD *)self->_anon_60;
  long long v10 = *(_OWORD *)&self->_anon_60[16];
  do
  {
    long long v28 = xmmword_1D0820540;
    float v12 = (float)(*(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 1.25)
        + (float)(a4
                * (float)((float)(*(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 0.85)
                        - (float)(*(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 1.25)));
    if (v12 > 1.0) {
      float v12 = 1.0;
    }
    long long v30 = v11;
    *(float *)((unint64_t)&v30 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) = v12;
    long long v11 = v30;
    long long v27 = v9;
    float v13 = *(float *)((unint64_t)&v27 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3)));
    float v14 = (float)(v13 * 1.25) + (float)(a4 * (float)((float)(v13 * 0.85) - (float)(v13 * 1.25)));
    if (v14 > 1.0) {
      float v14 = 1.0;
    }
    long long v29 = v10;
    *(float *)((unint64_t)&v29 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) = v14;
    long long v10 = v29;
    ++v8;
  }
  while (v8 != 3);
  *(_DWORD *)&self->_anon_60[8] = DWORD2(v11);
  *(void *)self->_anon_60 = v11;
  *(_DWORD *)&self->_anon_60[24] = DWORD2(v10);
  *(void *)&self->_anon_60[16] = v10;
  float32x4_t v15 = *(float32x4_t *)&self->_anon_60[80];
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v21 = vmlaq_n_f32(*(float32x4_t *)&self->_anon_60[16], vsubq_f32(_Q0, *(float32x4_t *)&self->_anon_60[16]), v26);
  *(float32x4_t *)self->_anon_60 = vmlaq_n_f32(*(float32x4_t *)self->_anon_60, vsubq_f32(_Q0, *(float32x4_t *)self->_anon_60), v26);
  *(float32x4_t *)&self->_anon_60[16] = v21;
  float32x4_t v22 = vmlaq_n_f32(v15, vsubq_f32(_Q0, v15), v26);
  uint32x4_t v23 = (uint32x4_t)vceqq_f32(v15, v22);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) == 0) {
    *(float32x4_t *)&self->_anon_60[80] = vdivq_f32(_Q0, v22);
  }
  if (*(float *)&self->_anon_60[36] <= *(float *)&self->_anon_60[40])
  {
    v24 = _PTLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRelighting updateParamters:relightStrength:](v24);
    }

    float v25 = *(float *)&self->_anon_60[40] + 0.05;
    *(float *)&self->_anon_60[36] = v25;
  }
}

- (void)computeSmoothFaceRect:(id)a3 transform:(CGAffineTransform *)a4
{
  id v21 = a3;
  uint64_t v6 = 0;
  self->_smoothFaceRects.lightMaskFaceOffsetY = 0.25;
  *(void *)&self->_anon_f4[4] = *(void *)&self->_weightHeadEye[4];
  float v7 = &self->_anon_f4[92];
  __asm { FMOV            V0.2S, #2.5 }
  long long v20 = _Q0;
  do
  {
    int8x16_t v13 = *(int8x16_t *)(objc_msgSend(v21, "detectionsFiltered", v20) + v6 + 16);
    *((float32x2_t *)v7 - 8) = vadd_f32(*(float32x2_t *)v13.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL), (float32x2_t)0x3F0000003F000000));
    v14.f32[0] = *(float *)&v13.i32[2] / self->_smoothFaceRects.aspect;
    v14.i32[1] = v13.i32[3];
    *(float32x2_t *)v13.i8 = vmul_f32(v14, (float32x2_t)0x3F0000003F000000);
    *((float *)v7 - 14) = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v13.i8, *(float32x2_t *)v13.i8))) * 0.91924;
    *(_DWORD *)float v7 = *(_DWORD *)([v21 detectionsFiltered] + v6 + 132);
    int8x16_t v15 = *(int8x16_t *)([v21 detectionsFiltered] + v6 + 96);
    *((float32x2_t *)v7 - 4) = vadd_f32(*(float32x2_t *)v15.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL), (float32x2_t)0x3F0000003F000000));
    v16.f32[0] = *(float *)&v15.i32[2] / self->_smoothFaceRects.aspect;
    v16.i32[1] = v15.i32[3];
    *(float32x2_t *)v15.i8 = vmul_f32(v16, (float32x2_t)0x3F0000003F000000);
    *((float *)v7 - 6) = *(float *)&self->_lightMasks
                       * sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8)));
    int8x16_t v17 = *(int8x16_t *)([v21 detectionsFiltered] + v6 + 112);
    *((float32x2_t *)v7 - 2) = vadd_f32(*(float32x2_t *)v17.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL), (float32x2_t)0x3F0000003F000000));
    v18.f32[0] = *(float *)&v17.i32[2] / self->_smoothFaceRects.aspect;
    v18.i32[1] = v17.i32[3];
    *(float32x2_t *)v17.i8 = vmul_f32(v18, (float32x2_t)0x3F0000003F000000);
    v18.i32[0] = (__int32)self->_lightMasks;
    v18.i32[1] = *((_DWORD *)v7 - 14);
    *((float32x2_t *)v7 - 1) = vmul_f32(v18, (float32x2_t)__PAIR64__(DWORD1(v20), COERCE_UNSIGNED_INT(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v17.i8, *(float32x2_t *)v17.i8))))));
    v7 += 72;
    v6 += 144;
  }
  while (v6 != 576);
  float32x2_t v19 = vcvt_f32_f64(*(float64x2_t *)&a4->c);
  *(float32x2_t *)&self->_anon_f4[12] = vcvt_f32_f64(*(float64x2_t *)&a4->a);
  *(float32x2_t *)&self->_anon_f4[20] = v19;
  self->_smoothFaceRects.lightMaskWidth = 0.9;
  *(void *)&self->_smoothFaceRects.lightMaskExponent = 0x404000003FC00000;
}

- (void)fgBgDebugWithDisparity:(id)a3 inDiffuse:(id)a4 inFocusDisparityModifier:(id)a5 outMask:(id)a6 debugType:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int64_t v32 = a7;
  if (!self->_fgBgForDebug)
  {
    float32x2_t v16 = [(PTMetalContext *)self->_metalContext computePipelineStateFor:@"fgBgForDebug" withConstants:self[1].super.isa];
    fgBgForDebug = self->_fgBgForDebug;
    self->_fgBgForDebug = v16;

    if (!self->_fgBgForDebug)
    {
      float32x2_t v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRelighting fgBgDebugWithDisparity:inDiffuse:inFocusDisparityModifier:outMask:debugType:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  float v26 = [(PTMetalContext *)self->_metalContext commandBuffer];
  long long v27 = [v26 computeCommandEncoder];

  [v27 setComputePipelineState:self->_fgBgForDebug];
  [v27 setTexture:v12 atIndex:0];
  [v27 setTexture:v13 atIndex:1];
  [v27 setTexture:v15 atIndex:2];
  [v27 setBuffer:v14 offset:24 atIndex:0];
  [v27 setBytes:self->_anon_60 length:128 atIndex:1];
  [v27 setBytes:&self->_smoothFaceRects length:336 atIndex:2];
  [v27 setBytes:&v32 length:8 atIndex:3];
  long long v28 = [(PTSyntheticLight *)self->_syntheticLight lightEstimation];
  [v27 setBuffer:v28 offset:0 atIndex:4];

  v31[0] = [v15 width];
  v31[1] = [v15 height];
  v31[2] = 1;
  long long v29 = xmmword_1D081F8F0;
  uint64_t v30 = 1;
  [v27 dispatchThreads:v31 threadsPerThreadgroup:&v29];
  [v27 endEncoding];
}

- (void)lightMaskDebugWithMSRPyramid:(id)a3 outFaceMask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_lightMaskForDebug)
  {
    int v8 = [(PTMetalContext *)self->_metalContext computePipelineStateFor:@"lightMaskForDebug" withConstants:0];
    lightMaskForDebug = self->_lightMaskForDebug;
    self->_lightMaskForDebug = v8;

    if (!self->_lightMaskForDebug)
    {
      long long v10 = _PTLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRelighting lightMaskDebugWithMSRPyramid:outFaceMask:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  float32x2_t v18 = [(PTMetalContext *)self->_metalContext commandBuffer];
  uint64_t v19 = [v18 computeCommandEncoder];

  [v19 setComputePipelineState:self->_lightMaskForDebug];
  uint64_t v20 = [v6 pyramidRGBA];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  [v19 setTexture:v21 atIndex:0];

  [v19 setTexture:v7 atIndex:1];
  [v19 setBytes:&self->_smoothFaceRects length:336 atIndex:0];
  v24[0] = [v7 width];
  v24[1] = [v7 height];
  v24[2] = 1;
  long long v22 = xmmword_1D081F8F0;
  uint64_t v23 = 1;
  [v19 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v19 endEncoding];
}

- (void)estimateLightIntensity:(id)a3 inFaceRects:numberOfFaceRects:humanDetections:effectRenderRequest:asyncWork:
{
  int v8 = v7;
  long long v9 = v5;
  uint64_t v10 = v4;
  uint64_t v11 = v3;
  id v14 = v6;
  id v15 = v8;
  id v16 = v9;
  id v17 = a3;
  [v14 frameTimeSeconds];
  [v14 frameTimeSeconds];
  *(float *)&double v18 = v18;
  LODWORD(self->_colorCube) = LODWORD(v18);
  uint64_t v19 = *(void **)&self->_lastFrameTimeSeconds;
  [v14 luxLevel];
  objc_msgSend(v19, "updateWithLuxLevel:deltaTime:");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  if (v14) {
    [v14 transform];
  }
  [v14 relightStrengthStudioLight];
  -[PTEffectRelighting updateParamters:relightStrength:](self, "updateParamters:relightStrength:", v14);
  long long v21 = v24;
  long long v22 = v25;
  long long v23 = v26;
  [(PTEffectRelighting *)self computeSmoothFaceRect:v16 transform:&v21];
  syntheticLight = self->_syntheticLight;
  long long v21 = v24;
  long long v22 = v25;
  long long v23 = v26;
  [(PTSyntheticLight *)syntheticLight estimateLightIntensityWithFaceRects:v11 inTex:v17 numberOfFaceRects:v10 transform:&v21 humanDetections:v16 asyncWork:v15];
}

- (void)studioLightInYUV:(id)a3 inDiffuse:(id)a4 inDisparity:(id)a5 inFocusDisparityModifier:(id)a6 outYUV:(id)a7 relightStrength:(float)a8 studioLightFromSegmentationBlend:(float)a9 studioLightEffectModifier:(id)a10
{
  id v18 = a3;
  id v19 = a7;
  id v20 = a10;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  long long v24 = [v18 texLuma];
  uint64_t v25 = [v19 texLuma];
  uint64_t v52 = v20;
  v53 = v19;
  if (v24 == (void *)v25)
  {
  }
  else
  {
    long long v26 = (void *)v25;
    long long v27 = [v18 texChroma];
    long long v28 = [v19 texChroma];

    if (v27 != v28) {
      goto LABEL_8;
    }
  }
  long long v29 = _PTLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[PTEffectRelighting studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:](v29);
  }

LABEL_8:
  uint64_t v30 = [v18 transferFunction];
  int v31 = +[PTColorConversion getTransferFunction:v30 toLinear:0];

  v62[0] = v31;
  *(float *)&self->_anon_60[112] = a9;
  *(float *)&double v32 = a8;
  [(PTSyntheticLight *)self->_syntheticLight interpolateLightIntensity:v32];
  memset(v61, 0, sizeof(v61));
  +[PTColorConversion getColorMatrix:v18 toRGB:0];
  memset(v60, 0, sizeof(v60));
  +[PTColorConversion getColorMatrix:v18 toRGB:1];
  int v33 = [(PTMetalContext *)self->_metalContext commandBuffer];
  float v34 = [v33 computeCommandEncoder];

  [v34 setComputePipelineState:self->_createLightMask];
  [v34 setTexture:*(void *)self->_bgVignetteLightIntensity atIndex:0];
  [v34 setBytes:&self->_smoothFaceRects length:336 atIndex:0];
  uint64_t v35 = [*(id *)self->_bgVignetteLightIntensity width];
  uint64_t v36 = [*(id *)self->_bgVignetteLightIntensity height];
  v59[0] = v35;
  v59[1] = v36;
  v59[2] = 1;
  long long v57 = xmmword_1D081F8F0;
  uint64_t v58 = 1;
  [v34 dispatchThreads:v59 threadsPerThreadgroup:&v57];
  [v34 endEncoding];
  v37 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v38 = [v37 computeCommandEncoder];

  [v38 setComputePipelineState:self->_studioLight];
  [v38 setTexture:*(void *)&self->_colorCubeType atIndex:0];
  [v38 setTexture:v23 atIndex:1];

  [v38 setTexture:v22 atIndex:2];
  [v38 setTexture:*(void *)self->_bgVignetteLightIntensity atIndex:3];
  [v38 setTexture:self->_lightGainMapLowResFiltered atIndex:4];
  [v38 setBytes:v61 length:24 atIndex:0];
  [v38 setBytes:v60 length:24 atIndex:1];
  [v38 setBytes:v62 length:4 atIndex:2];
  [v38 setBytes:self->_anon_60 length:128 atIndex:3];
  v39 = [(PTSyntheticLight *)self->_syntheticLight lightEstimation];
  [v38 setBuffer:v39 offset:0 atIndex:4];

  [v38 setBuffer:v21 offset:24 atIndex:5];
  [v38 setBytes:&self->_smoothFaceRects length:336 atIndex:6];
  [v38 setBuffer:v52 offset:0 atIndex:7];

  uint64_t v40 = [(MTLTexture *)self->_lightGainMapLowResFiltered width];
  uint64_t v41 = [(MTLTexture *)self->_lightGainMapLowResFiltered height];
  v56[0] = v40;
  v56[1] = v41;
  v56[2] = 1;
  long long v57 = xmmword_1D081F8F0;
  uint64_t v58 = 1;
  [v38 dispatchThreads:v56 threadsPerThreadgroup:&v57];
  [v38 endEncoding];
  util = self->_util;
  v43 = [(PTMetalContext *)self->_metalContext commandBuffer];
  [(PTUtil *)util gaussianFilter3x3:v43 inRGB:self->_lightGainMapLowResFiltered outRGB:self->_lightGainMapFiltered];

  [(PTEffectRelighting *)self filterLightGainApplyInRGB:self->_relightSizeRGBA];
  v44 = [[PTImageblockConfig alloc] initWithPTTexture:v53];
  v45 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v46 = [v45 computeCommandEncoder];

  [v46 setComputePipelineState:self->_relightFullsizeInput];
  objc_msgSend(v46, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v44, "imageblockSize"), -[PTImageblockConfig imageblockSize](v44, "imageblockSize"));
  [v46 setTexture:self->_brightSceneDetector atIndex:0];
  uint64_t v47 = [v18 texLuma];
  [v46 setTexture:v47 atIndex:1];

  v48 = [v18 texChroma];
  [v46 setTexture:v48 atIndex:2];

  double v49 = [(PTMSRResize *)self->_msrColorPyramid cubeTexture];
  [v46 setTexture:v49 atIndex:3];

  uint64_t v50 = [v53 texLuma];
  [v46 setTexture:v50 atIndex:4];

  v51 = [v53 texChroma];
  [v46 setTexture:v51 atIndex:5];

  [v46 setBytes:v61 length:24 atIndex:0];
  [v46 setBytes:v60 length:24 atIndex:1];
  [v46 setBytes:v62 length:4 atIndex:2];
  [v46 setBytes:self->_anon_60 length:128 atIndex:3];
  if (v44)
  {
    [(PTImageblockConfig *)v44 threads];
    [(PTImageblockConfig *)v44 threadsPerGroup];
  }
  else
  {
    memset(v55, 0, sizeof(v55));
    memset(v54, 0, sizeof(v54));
  }
  [v46 dispatchThreads:v55 threadsPerThreadgroup:v54];
  [v46 endEncoding];
  ++self->_frameIndex;
}

- (id)approximateDiffuseFromSegmentation:(id)a3
{
  approximatedDiffuseIntermediate = self->_approximatedDiffuseIntermediate;
  metalContext = self->_metalContext;
  id v6 = a3;
  id v7 = [(PTMetalContext *)metalContext commandBuffer];
  [(MTLTexture *)approximatedDiffuseIntermediate boxFilter1Channel:v7 inTex:v6 intermediate:self->_approximatedDiffuse outTex:self->_functionConstants kernelWidth:13 outputRemapping:0.00781250557];

  functionConstants = self->_functionConstants;

  return functionConstants;
}

- (int)filterLightGainApplyInRGB:(id)a3
{
  metalContext = self->_metalContext;
  id v5 = a3;
  id v6 = [(PTMetalContext *)metalContext commandBuffer];
  id v7 = [v6 computeCommandEncoder];

  [v7 setComputePipelineState:self->_filterLightGainApplyToRGB];
  [v7 setTexture:self->_lightGainMapFiltered atIndex:0];
  [v7 setTexture:self->_brightSceneDetector atIndex:1];
  [v7 setTexture:v5 atIndex:2];

  uint64_t v8 = [(PTBrightSceneDetector *)self->_brightSceneDetector width];
  uint64_t v9 = [(PTBrightSceneDetector *)self->_brightSceneDetector height];
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = 1;
  long long v11 = xmmword_1D081FE90;
  uint64_t v12 = 1;
  [v7 dispatchThreads:v13 threadsPerThreadgroup:&v11];
  [v7 endEncoding];

  return 0;
}

- (id)syntheticLight
{
  return self->_syntheticLight;
}

- (void)reset
{
  kdebug_trace();
  self->_frameIndex = 0;
  [(PTSyntheticLight *)self->_syntheticLight reset];
  [*(id *)&self->_lastFrameTimeSeconds reset];

  kdebug_trace();
}

- (id)brightSceneDetector
{
  return *(id *)&self->_lastFrameTimeSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_functionConstants, 0);
  objc_storeStrong((id *)&self->_approximatedDiffuse, 0);
  objc_storeStrong((id *)&self->_approximatedDiffuseIntermediate, 0);
  objc_storeStrong((id *)&self->_colorCubeType, 0);
  objc_storeStrong((id *)&self->_relightSizeRGBA, 0);
  objc_storeStrong((id *)&self->_quarterSizeRGBA, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_lastFrameTimeSeconds, 0);
  objc_storeStrong((id *)&self->_brightSceneDetector, 0);
  objc_storeStrong((id *)&self->_lightGainMapFiltered, 0);
  objc_storeStrong((id *)&self->_lightGainMapLowResFiltered, 0);
  objc_storeStrong((id *)self->_bgVignetteLightIntensity, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_syntheticLight, 0);
  objc_storeStrong((id *)&self->_filterLightGainApplyToRGB, 0);
  objc_storeStrong((id *)&self->_lightMaskOutline, 0);
  objc_storeStrong((id *)&self->_relightFullsizeInput, 0);
  objc_storeStrong((id *)&self->_lightMaskForDebug, 0);
  objc_storeStrong((id *)&self->_fgBgForDebug, 0);
  objc_storeStrong((id *)&self->_createLightMask, 0);

  objc_storeStrong((id *)&self->_studioLight, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (double)initWithMetalContext:(float *)a1 faceAttributesNetwork:(NSObject *)a2 availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.11(float *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "lightGainMapScale: %f", (uint8_t *)&v4, 0xCu);
  return result;
}

- (void)updateParamters:(os_log_t)log relightStrength:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Invalid fgOffsetFactorNear", v1, 2u);
}

- (void)fgBgDebugWithDisparity:(uint64_t)a3 inDiffuse:(uint64_t)a4 inFocusDisparityModifier:(uint64_t)a5 outMask:(uint64_t)a6 debugType:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lightMaskDebugWithMSRPyramid:(uint64_t)a3 outFaceMask:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)studioLightInYUV:(os_log_t)log inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Unexpected read write access to input/output texture", v1, 2u);
}

@end