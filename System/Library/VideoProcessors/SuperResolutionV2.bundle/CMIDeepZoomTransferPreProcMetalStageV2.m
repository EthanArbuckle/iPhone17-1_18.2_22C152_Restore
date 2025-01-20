@interface CMIDeepZoomTransferPreProcMetalStageV2
- (CMIDeepZoomTransferPreProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4;
- (int)computeLocalHomographies:(CMIDeepZoomTransferPreProcMetalStageV2 *)self referencePixelBuffer:(SEL)a2 referenceMetadata:(id)a3 nonReferencePixelBuffer:(__CVBuffer *)a4 nonReferenceMetadata:(id)a5 referenceNormalizedCropRectangle:(__CVBuffer *)a6 nonReferenceNormalizedCropRectangle:(id)a7 computeLocalHomographiesConfig:(CGRect *)a8 tileCount:(CGRect *)a9 tileIndex:(id)a10;
- (void)dealloc;
@end

@implementation CMIDeepZoomTransferPreProcMetalStageV2

- (CMIDeepZoomTransferPreProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4
{
  id v7 = a3;
  if (a4)
  {
    if (*(_WORD *)a4) {
      BOOL v8 = *((unsigned __int16 *)a4 + 1) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      v19.receiver = self;
      v19.super_class = (Class)CMIDeepZoomTransferPreProcMetalStageV2;
      v9 = [(CMIDeepZoomTransferPreProcMetalStageV2 *)&v19 init];
      self = v9;
      if (!v9)
      {
LABEL_14:
        self = self;
        a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self;
        goto LABEL_15;
      }
      objc_storeStrong((id *)&v9->_metalContext, a3);
      if (self->_metalContext
        || (+[NSBundle bundleForClass:objc_opt_class()],
            v10 = objc_claimAutoreleasedReturnValue(),
            v11 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v10 andOptionalCommandQueue:0], metalContext = self->_metalContext, self->_metalContext = v11, metalContext, v10, self->_metalContext))
      {
        if (!sub_D0C8((uint64_t)self) && !sub_D184((uint64_t)self))
        {
          CFStringRef v20 = kCVMetalTextureCacheMaximumTextureAgeKey;
          v21 = &off_190E0;
          CFDictionaryRef v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          v14 = [(FigMetalContext *)self->_metalContext device];
          CVReturn v15 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v13, v14, 0, &self->_cvMetalTextureCacheRef);

          if (!v15)
          {
            v16 = (RegWarpPP *)[objc_alloc((Class)RegWarpPP) initWithConfig:0];
            regwarpCPU = self->_regwarpCPU;
            self->_regwarpCPU = v16;

            if (self->_regwarpCPU)
            {
              *(void *)self->_anon_30 = *(void *)a4;

              goto LABEL_14;
            }
          }
        }
      }
    }
    a4 = 0;
  }
LABEL_15:

  return (CMIDeepZoomTransferPreProcMetalStageV2 *)a4;
}

- (int)computeLocalHomographies:(CMIDeepZoomTransferPreProcMetalStageV2 *)self referencePixelBuffer:(SEL)a2 referenceMetadata:(id)a3 nonReferencePixelBuffer:(__CVBuffer *)a4 nonReferenceMetadata:(id)a5 referenceNormalizedCropRectangle:(__CVBuffer *)a6 nonReferenceNormalizedCropRectangle:(id)a7 computeLocalHomographiesConfig:(CGRect *)a8 tileCount:(CGRect *)a9 tileIndex:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a10;
  objc_super v19 = v18;
  CFStringRef v20 = 0;
  float64x2_t origin = 0u;
  CGSize v218 = (CGSize)0;
  float64x2_t v215 = 0u;
  CGSize v216 = (CGSize)0;
  int v21 = -12780;
  v183 = v15;
  v155 = v16;
  if (!v15)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v22 = self;
    goto LABEL_109;
  }
  v22 = self;
  if (!a4 || !v16 || !a6) {
    goto LABEL_114;
  }
  CVPixelBufferRef pixelBuffer = a4;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  if (!v17) {
    goto LABEL_109;
  }
  CFStringRef v20 = 0;
  if (!(_WORD)v224) {
    goto LABEL_114;
  }
  uint16x4_t v26 = (uint16x4_t)v224;
  unint64_t v27 = vmovl_u16((uint16x4_t)v224).u64[0];
  v23 = 0;
  v24 = 0;
  v25 = 0;
  if (!WORD2(v27)) {
    goto LABEL_109;
  }
  __int32 v28 = v225 << 16;
  v26.i32[0] = v225;
  uint32x4_t v29 = vmovl_u16(v26);
  if (v225 << 16 != -65536 && v29.i16[2] != -1)
  {
    CFStringRef v20 = 0;
    if ((__int16)v225 < (int)(unsigned __int16)v224)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      if (v29.i16[2] >= (int)WORD2(v27)) {
        goto LABEL_109;
      }
      goto LABEL_12;
    }
LABEL_114:
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_109;
  }
LABEL_12:
  unsigned __int16 v206 = v29.u16[2];
  int32x2_t v200 = (int32x2_t)v27;
  v202 = a6;
  unsigned __int16 v195 = WORD2(v27);
  id v184 = v18;
  v156 = v17;
  v30 = [v17 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_StillImageProcessingMetadata];
  v31 = [v30 objectForKeyedSubscript:kFigCaptureStillImageProcessingMetadataKey_RegistrationHomography];

  v154 = v31;
  if (v31)
  {
    v32 = v31;
    v191 = [v31 objectAtIndexedSubscript:0];
    [v191 floatValue];
    v187.i64[0] = v33;
    v34 = [v31 objectAtIndexedSubscript:3];
    [v34 floatValue];
    v189.i64[0] = v35;
    v36 = [v31 objectAtIndexedSubscript:6];
    [v36 floatValue];
    v185.i64[0] = v37;
    [v31 objectAtIndexedSubscript:1];
    v38 = v193 = a8;
    [v38 floatValue];
    __int32 v180 = v39;
    v40 = [v31 objectAtIndexedSubscript:4];
    [v40 floatValue];
    __int32 v182 = v41;
    v42 = [v32 objectAtIndexedSubscript:7];
    [v42 floatValue];
    __int32 v179 = v43;
    v44 = [v32 objectAtIndexedSubscript:2];
    [v44 floatValue];
    __int32 v176 = v45;
    v46 = [v32 objectAtIndexedSubscript:5];
    [v46 floatValue];
    __int32 v178 = v47;
    v48 = [v32 objectAtIndexedSubscript:8];
    [v48 floatValue];
    float32x4_t v49 = v187;
    v49.i32[1] = v180;
    v49.i32[2] = v176;
    float32x4_t v188 = v49;
    float32x4_t v50 = v185;
    v50.i32[1] = v179;
    v50.i32[2] = v51;
    float32x4_t v186 = v50;
    float32x4_t v52 = v189;
    v52.i32[1] = v182;
    v52.i32[2] = v178;
    float32x4_t v190 = v52;

    a8 = v193;
    if (v193)
    {
LABEL_14:
      CGSize size = a8->size;
      float64x2_t origin = (float64x2_t)a8->origin;
      CGSize v218 = size;
      goto LABEL_17;
    }
  }
  else
  {
    float32x4_t v188 = (float32x4_t)matrix_identity_float3x3.columns[0];
    float32x4_t v190 = (float32x4_t)matrix_identity_float3x3.columns[1];
    float32x4_t v186 = (float32x4_t)matrix_identity_float3x3.columns[2];
    if (a8) {
      goto LABEL_14;
    }
  }
  float64x2_t origin = 0uLL;
  __asm { FMOV            V0.2D, #1.0 }
  CGSize v218 = _Q0;
LABEL_17:
  id v17 = v156;
  v22 = self;
  objc_super v19 = v184;
  if (a9)
  {
    CGSize v58 = a9->size;
    float64x2_t v215 = (float64x2_t)a9->origin;
    CGSize v216 = v58;
  }
  else
  {
    float64x2_t v215 = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    CGSize v216 = _Q0;
  }
  unsigned __int16 v60 = v206;
  BOOL v62 = v28 == -65536 && v206 == 0xFFFF;
  if (!(v28 | v206) || v62)
  {
    int v63 = sub_E204((uint64_t)self, pixelBuffer, (uint64_t)v155, v202, v156, &origin, &v215, v224);
    if (v63)
    {
      int v21 = v63;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      goto LABEL_119;
    }
  }
  unsigned int Width = CVPixelBufferGetWidth(self->_opticalOutputFlowPixelBuffer);
  unsigned int Height = CVPixelBufferGetHeight(self->_opticalOutputFlowPixelBuffer);
  unsigned __int16 v66 = Height;
  int8x8_t v67 = vand_s8((int8x8_t)v200, (int8x8_t)0xFFFF0000FFFFLL);
  int8x8_t v68 = vand_s8((int8x8_t)vadd_s32(vadd_s32(v200, (int32x2_t)-1), (int32x2_t)__PAIR64__(Height, Width)), (int8x8_t)0xFFFF0000FFFFLL);
  v68.i32[0] /= (unsigned __int32)v67.i32[0];
  v68.i32[1] /= (unsigned __int32)v67.i32[1];
  unint64_t v203 = __PAIR64__(Height, Width);
  int8x8_t v205 = v68;
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(self->_opticalOutputFlowPixelBuffer);
  unsigned int v168 = v205.i32[0];
  v69 = (char *)malloc_type_malloc(16 * (v205.i32[0] * v205.i32[1]), 0x1000040451B5BE8uLL);
  if (!v69)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    int v21 = -12786;
    id v17 = v156;
LABEL_119:
    CFStringRef v20 = v154;
    goto LABEL_109;
  }
  v174 = v69;
  v173 = (char *)malloc_type_malloc(16 * (v205.i32[0] * v205.i32[1]), 0x1000040451B5BE8uLL);
  if (!v173)
  {
    v23 = 0;
    v24 = 0;
    int v21 = -12786;
    id v17 = v156;
    CFStringRef v20 = v154;
    goto LABEL_108;
  }
  if (CVPixelBufferLockBaseAddress(self->_opticalOutputFlowPixelBuffer, 1uLL)
    || (BaseAddress = CVPixelBufferGetBaseAddress(self->_opticalOutputFlowPixelBuffer)) == 0)
  {
    v23 = 0;
    int v21 = -12782;
    goto LABEL_105;
  }
  if (v28 == -65536) {
    unsigned int v70 = 0;
  }
  else {
    unsigned int v70 = (__int16)v225;
  }
  unsigned int v71 = (unsigned __int16)v224;
  if (v28 != -65536) {
    unsigned int v71 = (__int16)v225 + 1;
  }
  unsigned int v161 = v71;
  if (v70 >= v71)
  {
    v23 = 0;
    int v21 = 0;
LABEL_105:
    id v17 = v156;
    goto LABEL_106;
  }
  v23 = 0;
  v72.f32[0] = (float)(unsigned __int16)Width;
  if (v60 == 0xFFFF) {
    uint64_t v73 = v195;
  }
  else {
    uint64_t v73 = ((__int16)v60 + 1);
  }
  uint64_t v192 = v73;
  if (v60 == 0xFFFF) {
    uint64_t v74 = 0;
  }
  else {
    uint64_t v74 = (__int16)v60;
  }
  float v166 = (float)v66;
  float v167 = (float)(unsigned __int16)Width;
  v72.f32[1] = v166;
  float32x2_t v75 = vmul_f32(v72, (float32x2_t)0x3974C40139379301);
  uint16x4_t v82 = (uint16x4_t)vmul_f32(v72, (float32x2_t)0x3C2ED5263C031FDCLL);
  int v158 = (unsigned __int16)Width;
  float v164 = *(float *)v82.i32;
  float v165 = v75.f32[0];
  float v76 = *(float *)&v82.i32[1];
  float v77 = v75.f32[1];
  uint64_t v78 = 2 * (BytesPerRow >> 1);
  HIWORD(v211) = WORD2(v203);
  LOWORD(v211) = v203;
  int v181 = v66;
  unsigned __int32 v157 = v66 - v74 * v205.i32[1];
  uint64_t v79 = 16 * v205.u16[0];
  unsigned __int32 v80 = v205.i32[0] * v70;
  __int32 v81 = v205.i32[1] * (BytesPerRow >> 1) * v74 + 2 * v205.i32[0] * v70;
  __int32 v159 = 2 * v205.i32[0];
  v82.i32[1] = 1048679446;
  uint64_t v160 = v74;
  while (1)
  {
    __int32 v162 = v81;
    unsigned int v163 = v70;
    if (v74 < v192) {
      break;
    }
LABEL_102:
    unsigned int v70 = v163 + 1;
    v80 += v168;
    __int32 v81 = v162 + v159;
    uint64_t v74 = v160;
    if (v163 + 1 == v161)
    {
      int v21 = 0;
      id v17 = v156;
      v22 = self;
LABEL_106:
      CFStringRef v20 = v154;
      goto LABEL_107;
    }
  }
  unsigned int v83 = v158 - v70 * v168;
  if (v83 >= v168) {
    unint64_t v84 = v168;
  }
  else {
    unint64_t v84 = v83;
  }
  v82.i32[0] = v84;
  unsigned __int16 v177 = vmovl_u16(v82).u16[0];
  int v172 = 2 * v70 * v168;
  v205.i32[0] = v81;
  unsigned __int32 v85 = v157;
  v86 = v23;
  while (1)
  {
    v204 = v86;
    unsigned __int32 v194 = v85 - v205.i32[1];
    if (v85 >= v205.i32[1]) {
      __int32 v87 = v205.i32[1];
    }
    else {
      __int32 v87 = v85;
    }
    simd_float3 v88 = matrix_identity_float3x3.columns[1];
    float32x4_t v212 = (float32x4_t)matrix_identity_float3x3.columns[0];
    float32x4_t v213 = (float32x4_t)v88;
    float32x4_t v214 = (float32x4_t)matrix_identity_float3x3.columns[2];
    uint64_t v196 = v74;
    int v89 = v205.i32[1] * v74;
    if ((v181 - v205.i32[1] * v74) >= v205.i32[1]) {
      __int32 v90 = v205.i32[1];
    }
    else {
      __int32 v90 = v181 - v205.i32[1] * v74;
    }
    if ([v19 useFlowWeightedAverage])
    {
      unsigned __int16 WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
      CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
      HIWORD(v207) = v90;
      LOWORD(v207) = v177;
      int v91 = sub_E728((uint64_t)self, (uint64_t)&v212, v211, WidthOfPlane, v207, (uint64_t)BaseAddress + 2 * v172 + 2 * v89 * (BytesPerRow >> 1), BytesPerRow, v19);
      if (v91)
      {
        int v21 = v91;
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_112;
      }
LABEL_87:
      int v124 = 0;
      goto LABEL_88;
    }
    if (v90)
    {
      int v92 = 0;
      unsigned int v93 = 0;
      unsigned int v94 = 0;
      v96 = v173;
      v95 = v174;
      uint64_t v97 = (uint64_t)BaseAddress + 2 * v205.u32[0] + 2;
      do
      {
        if (v84)
        {
          uint64_t v98 = 0;
          unint64_t v99 = 0;
          float v100 = (float)(v92 + v89);
          v101 = (__int16 *)v97;
          do
          {
            _H2 = *(v101 - 1);
            __asm { FCVT            S3, H2 }
            _H2 = *v101;
            __asm { FCVT            S2, H2 }
            float v106 = (float)(v80 + v99);
            *(float *)&uint64_t v107 = v106 / v167;
            v108 = &v95[v98];
            *(float *)&uint64_t v109 = (float)(v106 / v167) + (float)(_S3 / v167);
            *((float *)&v107 + 1) = v100 / v166;
            *(void *)v108 = v107;
            *((_DWORD *)v108 + 2) = 0;
            v110 = &v96[v98];
            *(_DWORD *)v110 = v109;
            *((float *)&v109 + 1) = (float)(_S2 / v166) + *(float *)&v95[v98 + 4];
            *((_DWORD *)v110 + 2) = 0;
            *(void *)v110 = v109;
            float v111 = v106 + _S3;
            if (v111 >= 0.0 && v111 < v167 && (float)(v100 + _S2) >= 0.0 && (float)(v100 + _S2) < v166)
            {
              float v112 = fabsf(_S3);
              if (v112 >= v164 || (float v113 = fabsf(_S2), v113 >= v76))
              {
                ++v93;
                float v115 = 3.0;
                int v114 = 1;
              }
              else
              {
                int v114 = v112 >= v165;
                if (v113 >= v77) {
                  int v114 = 1;
                }
                if (v114) {
                  float v115 = 2.0;
                }
                else {
                  float v115 = 1.0;
                }
              }
              v94 += v114;
              *(float *)&v95[v98 + 8] = v115;
              *(float *)&v96[v98 + 8] = v115;
            }
            ++v99;
            v98 += 16;
            v101 += 2;
          }
          while (v99 < v84);
        }
        ++v92;
        v96 += v79;
        v95 += v79;
        v97 += v78;
      }
      while (v92 != v87);
    }
    else
    {
      unsigned int v94 = 0;
      unsigned int v93 = 0;
    }
    float v116 = (float)(v90 * v84);
    if ((float)((float)v93 / v116) <= 0.6)
    {
      if ((float)((float)v94 / v116) <= 0.6) {
        goto LABEL_87;
      }
      HIWORD(v210) = v90;
      LOWORD(v210) = v177;
      unsigned int v117 = v210;
      float v118 = 2.0;
      uint64_t v120 = (uint64_t)v174;
      v119 = self;
      uint64_t v121 = (uint64_t)v173;
      int v122 = v168;
    }
    else
    {
      HIWORD(v209) = v90;
      LOWORD(v209) = v177;
      unsigned int v117 = v209;
      float v118 = 3.0;
      uint64_t v120 = (uint64_t)v174;
      v119 = self;
      uint64_t v121 = (uint64_t)v173;
      int v122 = v168;
      unsigned int v94 = v93;
    }
    int v123 = sub_EAF0((uint64_t)v119, &v212, v120, v121, v117, v122, v94, v118);
    if (v123) {
      break;
    }
    int v124 = 1;
LABEL_88:
    uint64_t v125 = 0;
    v219[0] = v212;
    v219[1] = v213;
    v219[2] = v214;
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    do
    {
      *(long long *)((char *)&v220 + v125 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v188, COERCE_FLOAT(*(_OWORD *)&v219[v125])), v190, *(float32x2_t *)v219[v125].f32, 1), v186, v219[v125], 2);
      ++v125;
    }
    while (v125 != 3);
    v212.i32[2] = DWORD2(v220);
    v213.i32[2] = DWORD2(v221);
    v212.i64[0] = v220;
    v213.i64[0] = v221;
    v214.i32[2] = DWORD2(v222);
    v214.i64[0] = v222;
    float32x4_t v126 = vmulq_n_f32(v212, 1.0 / *((float *)&v222 + 2));
    float32x4_t v127 = vmulq_n_f32(v213, 1.0 / *((float *)&v222 + 2));
    v212.i32[2] = v126.i32[2];
    v213.i32[2] = v127.i32[2];
    v212.i64[0] = v126.i64[0];
    v213.i64[0] = v127.i64[0];
    float32x4_t v128 = vmulq_n_f32(v214, 1.0 / *((float *)&v222 + 2));
    v214.i32[2] = v128.i32[2];
    v214.i64[0] = v128.i64[0];
    if (v124)
    {
      v126.i64[0] = v212.i64[0];
      v129.i64[0] = v212.i64[0];
      v129.i64[1] = v213.i64[0];
      float32x4_t v130 = vdivq_f32(vaddq_f32(v129, (float32x4_t)xmmword_17DC0), (float32x4_t)xmmword_17DD0);
      float32x2_t v131 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)0xBE85280BBF1B6F91, v130.f32[0]), (float32x2_t)0x3F373FE7BE9B3608, *(float32x2_t *)v130.f32, 1), (float32x2_t)0xBF118277BEDC2CDDLL, v130, 2), (float32x2_t)0x3E9F5F45BF186D29, v130, 3);
      float v132 = v213.f32[1];
      if (fabsf(v131.f32[1]) > 2.0)
      {
        float v133 = vmuls_lane_f32(v131.f32[0], v131, 1);
        float v134 = fabsf(v131.f32[0]);
        if (v133 < 0.0 && v134 > 2.0)
        {
          float32x4_t v212 = v188;
          float32x4_t v213 = v190;
          v126.i64[0] = v188.i64[0];
          float v132 = v190.f32[1];
          float32x4_t v214 = v186;
        }
      }
      if (v126.f32[0] < -0.1 || v132 < -0.1)
      {
        float32x4_t v212 = v188;
        float32x4_t v213 = v190;
        v126.i64[0] = v188.i64[0];
        float32x4_t v214 = v186;
      }
    }
    v201 = +[NSNumber numberWithFloat:*(double *)v126.i64];
    v223[0] = v201;
    LODWORD(v136) = v212.i32[1];
    v199 = +[NSNumber numberWithFloat:v136];
    v223[1] = v199;
    LODWORD(v137) = v212.i32[2];
    v198 = +[NSNumber numberWithFloat:v137];
    v223[2] = v198;
    LODWORD(v138) = v213.i32[0];
    v197 = +[NSNumber numberWithFloat:v138];
    v223[3] = v197;
    LODWORD(v139) = v213.i32[1];
    v140 = +[NSNumber numberWithFloat:v139];
    v223[4] = v140;
    LODWORD(v141) = v213.i32[2];
    v142 = +[NSNumber numberWithFloat:v141];
    v223[5] = v142;
    LODWORD(v143) = v214.i32[0];
    v144 = +[NSNumber numberWithFloat:v143];
    v223[6] = v144;
    LODWORD(v145) = v214.i32[1];
    v146 = +[NSNumber numberWithFloat:v145];
    v223[7] = v146;
    LODWORD(v147) = v214.i32[2];
    v148 = +[NSNumber numberWithFloat:v147];
    v223[8] = v148;
    v149 = +[NSArray arrayWithObjects:v223 count:9];
    v23 = +[NSMutableArray arrayWithArray:v149];

    if (!v23)
    {
      int v21 = -12782;
      objc_super v19 = v184;
      CFStringRef v20 = v154;
      goto LABEL_113;
    }
    [v183 addObject:v23];
    uint64_t v74 = v196 + 1;
    v205.i32[0] += v205.i32[1] * (BytesPerRow >> 1);
    unsigned __int32 v85 = v194;
    v86 = v23;
    objc_super v19 = v184;
    uint64_t v78 = 2 * (BytesPerRow >> 1);
    if (v196 + 1 == v192) {
      goto LABEL_102;
    }
  }
  int v21 = v123;
LABEL_112:
  CFStringRef v20 = v154;
  v23 = v204;
LABEL_113:
  id v17 = v156;
  v22 = self;
LABEL_107:
  v24 = v173;
LABEL_108:
  v25 = v174;
LABEL_109:
  v150 = v20;
  opticalOutputFlowPixelBuffer = v22->_opticalOutputFlowPixelBuffer;
  v152 = v25;
  CVPixelBufferUnlockBaseAddress(opticalOutputFlowPixelBuffer, 1uLL);
  free(v152);
  free(v24);

  return v21;
}

- (void)dealloc
{
  sub_F2E8((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomTransferPreProcMetalStageV2;
  [(CMIDeepZoomTransferPreProcMetalStageV2 *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regwarpCPU, 0);
  objc_storeStrong((id *)&self->_regwarpGPU, 0);
  for (uint64_t i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end