@interface HKCVGaussianBlur
- ($0EE4DB4080C7F8AC2CA5DE15946CA571)planInfo;
- ($F1BC40A862ED60063F4F8EDA86EB086B)clipRect;
- (HKCVGaussianBlur)initWithSigma:(float)a3 clipRect:(id *)a4 kernelCache:(id)a5 archive:(id)a6 library:(id)a7;
- (HKCVKernelCache)kernelCache;
- (MTLBinaryArchive)archive;
- (MTLLibrary)library;
- (NSMutableDictionary)cache;
- (float)sigma;
- (id)cachedTextureForDevice:(id)a3 pixelInfo:(WMPSPixelInfo)a4 identifier:(unint64_t)a5 textureSize:(id *)a6 protectionOptions:(unint64_t)a7;
- (uint64_t)encodeCommandBuffer:(void *)a3 inPlaceTexture:;
- (void)dealloc;
- (void)prepareRAndPlanStepsROIs;
@end

@implementation HKCVGaussianBlur

- (HKCVGaussianBlur)initWithSigma:(float)a3 clipRect:(id *)a4 kernelCache:(id)a5 archive:(id)a6 library:(id)a7
{
  v17.receiver = self;
  v17.super_class = (Class)HKCVGaussianBlur;
  v12 = [(HKCVGaussianBlur *)&v17 init];
  v13 = (HKCVGaussianBlur *)v12;
  if (v12)
  {
    *((float *)v12 + 140) = a3;
    long long v14 = *(_OWORD *)&a4->var0.var0;
    long long v15 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)(v12 + 616) = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)(v12 + 632) = v15;
    *(_OWORD *)(v12 + 600) = v14;
    *((void *)v12 + 71) = a5;
    v13->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v13->_library = (MTLLibrary *)a7;
    v13->_archive = (MTLBinaryArchive *)a6;
    initFilterInfo((uint64_t)&v13->_planInfo, v13->_sigma);
    [(HKCVGaussianBlur *)v13 prepareRAndPlanStepsROIs];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)HKCVGaussianBlur;
  [(HKCVGaussianBlur *)&v3 dealloc];
}

- (id)cachedTextureForDevice:(id)a3 pixelInfo:(WMPSPixelInfo)a4 identifier:(unint64_t)a5 textureSize:(id *)a6 protectionOptions:(unint64_t)a7
{
  WMPSPixelInfo v19 = a4;
  if (a7) {
    return (id)WMPSConvolutionGetIntermediateTexture(a3, &v19, a6, a7);
  }
  v12 = [HKCVGaussianBlurKey alloc];
  long long v17 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  v13 = [(HKCVGaussianBlurKey *)v12 initWithIdentifier:a5 textureSize:&v17];
  long long v14 = (void *)[(NSMutableDictionary *)self->_cache objectForKey:v13];
  if (v14)
  {
    IntermediateTexture = v14;
    id v15 = v14;
  }
  else
  {
    IntermediateTexture = (void *)WMPSConvolutionGetIntermediateTexture(a3, &v19, a6, 0);
    [(NSMutableDictionary *)self->_cache setObject:IntermediateTexture forKey:v13];
  }

  return IntermediateTexture;
}

- (void)prepareRAndPlanStepsROIs
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  anon_210 = (float32x2_t *)self->_anon_210;
  unint64_t numSteps = self->_planInfo._numSteps;
  float scale = self->_planInfo._scale;
  *(float32x2_t *)v2.f32 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_clipRect.size.width));
  float32x4_t v132 = v2;
  *(_OWORD *)self->_anon_210 = xmmword_256179AD0;
  *(float32x4_t *)&self->_anon_210[16] = v2;
  if (numSteps)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    planSteps = self->_planInfo._planSteps;
    v10 = v145;
    v11 = self->_planInfo._planSteps;
    int v131 = numSteps;
    do
    {
      signed int v13 = *v11++;
      int v12 = v13;
      uint64_t GaussianBlurKernelBorderScaleData = getGaussianBlurKernelBorderScaleData(v13);
      if (v13 < 24)
      {
        float32x4_t v25 = *(float32x4_t *)anon_210->f32;
        float32x4_t v26 = *(float32x4_t *)anon_210[2].f32;
        if (v12 < 16)
        {
          LODWORD(v42) = 0;
          *((float *)&v42 + 1) = 1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1);
          float32x4_t v43 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), v25.f32[0]), (float32x4_t)v42, *(float32x2_t *)v25.f32, 1), (float32x4_t)xmmword_256179AD0, v25, 2);
          float32x4_t v44 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), v26.f32[0]), (float32x4_t)v42, *(float32x2_t *)v26.f32, 1), (float32x4_t)xmmword_256179AD0, v26, 2);
          LODWORD(v45) = 0;
          *((float *)&v45 + 1) = (float)-(int)GaussianBlurKernelBorderScaleData;
          float32x4_t v46 = vaddq_f32((float32x4_t)v45, v43);
          v47.i64[0] = 0xC0000000C0000000;
          v47.i64[1] = 0xC0000000C0000000;
          float32x4_t v48 = vmlaq_f32(v44, v47, (float32x4_t)v45);
          v46.i32[3] = v136;
          v48.i32[3] = v134;
          float32x4_t v49 = vaddq_f32(v46, v48);
          v46.i32[3] = 0;
          float32x4_t v50 = vrndmq_f32(v46);
          v49.i32[3] = 0;
          float32x4_t v51 = vsubq_f32(vrndpq_f32(v49), v50);
          anon_210[1].i32[0] = v50.i32[2];
          float32x2_t *anon_210 = *(float32x2_t *)v50.f32;
          anon_210[3].i32[0] = v51.i32[2];
          anon_210[2] = *(float32x2_t *)v51.f32;
          long long v52 = *(_OWORD *)anon_210[2].f32;
          _OWORD *v10 = *(_OWORD *)anon_210->f32;
          v10[1] = v52;
          *(float *)&unsigned int v53 = (float)-(int)GaussianBlurKernelBorderScaleData;
          float32x4_t v54 = vaddq_f32((float32x4_t)v53, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1)), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)xmmword_256179AC0, *anon_210, 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210->f32, 2));
          float32x4_t v55 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1)), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)xmmword_256179AC0, anon_210[2], 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210[2].f32, 2), v47, (float32x4_t)v53);
          v54.i32[3] = v138;
          v55.i32[3] = v137;
          float32x4_t v56 = vaddq_f32(v54, v55);
          v54.i32[3] = 0;
          v56.i32[3] = 0;
          float32x4_t v57 = vrndmq_f32(v54);
          float32x4_t v58 = vsubq_f32(vrndpq_f32(v56), v57);
          anon_210[1].i32[0] = v57.i32[2];
          float32x2_t *anon_210 = *(float32x2_t *)v57.f32;
          anon_210[3].i32[0] = v58.i32[2];
          anon_210[2] = *(float32x2_t *)v58.f32;
          uint64_t v24 = v7;
        }
        else
        {
          float32x4_t v27 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)HIDWORD(GaussianBlurKernelBorderScaleData), v25.f32[0]), (float32x4_t)xmmword_256179AC0, *(float32x2_t *)v25.f32, 1), (float32x4_t)xmmword_256179AD0, v25, 2);
          float32x4_t v28 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)HIDWORD(GaussianBlurKernelBorderScaleData), v26.f32[0]), (float32x4_t)xmmword_256179AC0, *(float32x2_t *)v26.f32, 1), (float32x4_t)xmmword_256179AD0, v26, 2);
          *(float *)&unsigned int v29 = (float)-(int)GaussianBlurKernelBorderScaleData;
          float32x4_t v30 = vaddq_f32((float32x4_t)v29, v27);
          v31.i64[0] = 0xC0000000C0000000;
          v31.i64[1] = 0xC0000000C0000000;
          float32x4_t v32 = vmlaq_f32(v28, v31, (float32x4_t)v29);
          v30.i32[3] = v135;
          v32.i32[3] = v133;
          float32x4_t v33 = vaddq_f32(v30, v32);
          v30.i32[3] = 0;
          v33.i32[3] = 0;
          float32x4_t v34 = vrndmq_f32(v30);
          float32x4_t v35 = vsubq_f32(vrndpq_f32(v33), v34);
          anon_210[1].i32[0] = v34.i32[2];
          float32x2_t *anon_210 = *(float32x2_t *)v34.f32;
          anon_210[3].i32[0] = v35.i32[2];
          anon_210[2] = *(float32x2_t *)v35.f32;
          uint64_t v24 = 2 * v8;
          long long v36 = *(_OWORD *)anon_210[2].f32;
          _OWORD *v10 = *(_OWORD *)anon_210->f32;
          v10[1] = v36;
          LODWORD(v36) = 0;
          DWORD1(v36) = HIDWORD(GaussianBlurKernelBorderScaleData);
          v34.i32[0] = 0;
          v34.f32[1] = (float)-(int)GaussianBlurKernelBorderScaleData;
          float32x4_t v37 = vaddq_f32((float32x4_t)v34.u64[0], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)(unint64_t)v36, *anon_210, 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210->f32, 2));
          float32x4_t v38 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)(unint64_t)v36, anon_210[2], 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210[2].f32, 2), v31, (float32x4_t)v34.u64[0]);
          v37.i32[3] = v140;
          v38.i32[3] = v139;
          float32x4_t v39 = vaddq_f32(v37, v38);
          v37.i32[3] = 0;
          float32x4_t v40 = vrndmq_f32(v37);
          v39.i32[3] = 0;
          anon_210[1].i32[0] = v40.i32[2];
          float32x2_t *anon_210 = *(float32x2_t *)v40.f32;
          float32x4_t v41 = vsubq_f32(vrndpq_f32(v39), v40);
          anon_210[3].i32[0] = v41.i32[2];
          anon_210[2] = *(float32x2_t *)v41.f32;
        }
      }
      else
      {
        if (v12 == 24) {
          float v15 = scale;
        }
        else {
          float v15 = 1.0 / scale;
        }
        LODWORD(v16) = 0;
        *((float *)&v16 + 1) = v15;
        float32x4_t v17 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v15), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)v16, *anon_210, 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210->f32, 2);
        float32x4_t v18 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v15), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)v16, anon_210[2], 1), (float32x4_t)xmmword_256179AD0, *(float32x4_t *)anon_210[2].f32, 2);
        float32x4_t v19 = vaddq_f32(v17, (float32x4_t)0);
        v19.i32[3] = v143;
        v18.i32[3] = v141;
        float32x4_t v20 = vaddq_f32(v19, v18);
        v19.i32[3] = 0;
        float32x4_t v21 = vrndmq_f32(v19);
        v20.i32[3] = 0;
        anon_210[1].i32[0] = v21.i32[2];
        float32x4_t v22 = vsubq_f32(vrndpq_f32(v20), v21);
        float32x2_t *anon_210 = *(float32x2_t *)v21.f32;
        anon_210[3].i32[0] = v22.i32[2];
        anon_210[2] = *(float32x2_t *)v22.f32;
        long long v23 = *(_OWORD *)anon_210[2].f32;
        uint64_t v24 = 2 * v8;
        _OWORD *v10 = *(_OWORD *)anon_210->f32;
        v10[1] = v23;
      }
      v59 = &v145[(32 * v24) | 0x20];
      long long v60 = *(_OWORD *)anon_210[2].f32;
      _OWORD *v59 = *(_OWORD *)anon_210->f32;
      v59[1] = v60;
      ++v8;
      v7 += 2;
      v10 += 4;
      --numSteps;
    }
    while (numSteps);
    float32x2_t v61 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_clipRect.size.width));
    anon_210[1].i32[0] = 1065353216;
    float32x2_t *anon_210 = 0;
    anon_210[3].i32[0] = 0;
    anon_210[2] = v61;
    if (v131 >= 1)
    {
      anon_10 = self->_anon_10;
      unint64_t v63 = v131 + 1;
      unsigned int v64 = 2 * v131 - 2;
      do
      {
        int v65 = planSteps[(v63 - 2)];
        if (v65 <= 25) {
          v66 = (char *)&kPlanKernelInfo + 56 * v65;
        }
        else {
          v66 = 0;
        }
        uint64_t v67 = getGaussianBlurKernelBorderScaleData(planSteps[(v63 - 2)]);
        uint64_t v68 = v64 + 1;
        v69 = (float32x4_t *)&v145[32 * v68];
        float32x4_t v70 = *v69;
        float32x4_t v71 = *(float32x4_t *)anon_210->f32;
        __n128 v73 = (__n128)vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
        float32x4_t v72 = vaddq_f32(*v69, v69[1]);
        v71.i32[3] = 0;
        v70.i32[3] = 0;
        v73.n128_u32[3] = 0;
        float32x4_t v74 = vmaxnmq_f32(v71, v70);
        v72.i32[3] = 0;
        float32x4_t v75 = vsubq_f32(vminnmq_f32((float32x4_t)v73, v72), v74);
        anon_210[1].i32[0] = v74.i32[2];
        float32x2_t *anon_210 = *(float32x2_t *)v74.f32;
        anon_210[3].i32[0] = v75.i32[2];
        anon_210[2] = *(float32x2_t *)v75.f32;
        float32x4_t v76 = *(float32x4_t *)anon_210->f32;
        float32x4_t v77 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
        v76.i32[3] = 0;
        float32x4_t v78 = vrndmq_f32(v76);
        v77.i32[3] = 0;
        anon_210[1].i32[0] = v78.i32[2];
        float32x4_t v79 = vsubq_f32(vrndpq_f32(v77), v78);
        float32x2_t *anon_210 = *(float32x2_t *)v78.f32;
        anon_210[3].i32[0] = v79.i32[2];
        anon_210[2] = *(float32x2_t *)v79.f32;
        v80 = &anon_10[32 * v68];
        long long v81 = *(_OWORD *)anon_210[2].f32;
        *(_OWORD *)v80 = *(_OWORD *)anon_210->f32;
        *((_OWORD *)v80 + 1) = v81;
        if (v65 < 23)
        {
          float v89 = *((float *)&v67 + 1);
          v90 = (float32x4_t *)&v145[32 * v64];
          float32x4_t v91 = *v90;
          __n128 v92 = *(__n128 *)anon_210->f32;
          __n128 v93 = *(__n128 *)anon_210[2].f32;
          float v94 = (float)(int)v67;
          float32x4_t v95 = vaddq_f32(*v90, v90[1]);
          v91.i32[3] = 0;
          v95.i32[3] = 0;
          float32x4_t v142 = v91;
          float32x4_t v144 = v95;
          if (v65 < 16)
          {
            __n128 v109 = ((__n128 (*)(uint64_t, __n128, __n128, float, float))*((void *)v66 + 2))(1, v92, v93, v94, *((float *)&v67 + 1));
            anon_210[1].i32[0] = v109.n128_i32[2];
            float32x2_t *anon_210 = (float32x2_t)v109.n128_u64[0];
            anon_210[3].i32[0] = v110;
            anon_210[2] = v111;
            float32x4_t v112 = *(float32x4_t *)anon_210->f32;
            float32x4_t v113 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
            v112.i32[3] = 0;
            float32x4_t v114 = vmaxnmq_f32(v112, v142);
            v113.i32[3] = 0;
            float32x4_t v115 = vsubq_f32(vminnmq_f32(v113, v144), v114);
            v114.i32[3] = v139;
            v115.i32[3] = v141;
            float32x4_t v116 = vaddq_f32(v114, v115);
            float32x4_t v117 = v114;
            v117.i32[3] = 0;
            float32x4_t v118 = vrndmq_f32(v117);
            v116.i32[3] = 0;
            float32x4_t v119 = vsubq_f32(vrndpq_f32(v116), v118);
            anon_210[1].i32[0] = v118.i32[2];
            float32x2_t *anon_210 = *(float32x2_t *)v118.f32;
            anon_210[3].i32[0] = v119.i32[2];
            anon_210[2] = *(float32x2_t *)v119.f32;
            v120 = &anon_10[32 * v64];
            long long v121 = *(_OWORD *)anon_210[2].f32;
            *(_OWORD *)v120 = *(_OWORD *)anon_210->f32;
            *((_OWORD *)v120 + 1) = v121;
            (*((void (**)(uint64_t, __n128, __n128, float, float))v66 + 5))(1, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, v94, v89);
          }
          else
          {
            __n128 v96 = ((__n128 (*)(void, __n128, __n128, float, float))*((void *)v66 + 5))(0, v92, v93, v94, *((float *)&v67 + 1));
            anon_210[1].i32[0] = v96.n128_i32[2];
            float32x2_t *anon_210 = (float32x2_t)v96.n128_u64[0];
            anon_210[3].i32[0] = v97;
            anon_210[2] = v98;
            float32x4_t v99 = *(float32x4_t *)anon_210->f32;
            float32x4_t v100 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
            v99.i32[3] = 0;
            float32x4_t v101 = vmaxnmq_f32(v99, v142);
            v100.i32[3] = 0;
            float32x4_t v102 = vsubq_f32(vminnmq_f32(v100, v144), v101);
            v101.i32[3] = v138;
            v102.i32[3] = v140;
            float32x4_t v103 = vaddq_f32(v101, v102);
            float32x4_t v104 = v101;
            v104.i32[3] = 0;
            float32x4_t v105 = vrndmq_f32(v104);
            v103.i32[3] = 0;
            float32x4_t v106 = vsubq_f32(vrndpq_f32(v103), v105);
            anon_210[1].i32[0] = v105.i32[2];
            float32x2_t *anon_210 = *(float32x2_t *)v105.f32;
            anon_210[3].i32[0] = v106.i32[2];
            anon_210[2] = *(float32x2_t *)v106.f32;
            v107 = &anon_10[32 * v64];
            long long v108 = *(_OWORD *)anon_210[2].f32;
            *(_OWORD *)v107 = *(_OWORD *)anon_210->f32;
            *((_OWORD *)v107 + 1) = v108;
            (*((void (**)(void, __n128, __n128, float, float))v66 + 2))(0, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, v94, v89);
          }
        }
        else
        {
          v82 = &anon_10[32 * v64];
          long long v83 = *(_OWORD *)anon_210[2].f32;
          *(_OWORD *)v82 = *(_OWORD *)anon_210->f32;
          *((_OWORD *)v82 + 1) = v83;
          uint64_t v84 = 40;
          if (v65 == 24)
          {
            uint64_t v84 = 16;
            v73.n128_f32[0] = 1.0 / scale;
          }
          else
          {
            v73.n128_f32[0] = scale;
          }
          (*(void (**)(uint64_t, __n128, __n128, double, __n128))&v66[v84])(1, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, 0.0, v73);
        }
        anon_210[1].i32[0] = v86;
        float32x2_t *anon_210 = v85;
        anon_210[3].i32[0] = v88;
        anon_210[2] = v87;
        --v63;
        v64 -= 2;
      }
      while (v63 > 1);
    }
  }
  else
  {
    *(_DWORD *)&self->_anon_210[8] = 1065353216;
    float32x2_t *anon_210 = 0;
    *(_DWORD *)&self->_anon_210[24] = 0;
    *(void *)&self->_anon_210[16] = v2.i64[0];
  }
  float32x4_t v122 = *(float32x4_t *)anon_210->f32;
  float32x4_t v123 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
  float32x4_t v124 = vaddq_f32(v132, (float32x4_t)xmmword_256179AD0);
  v122.i32[3] = 0;
  v123.i32[3] = 0;
  v124.i32[3] = 0;
  float32x4_t v125 = vmaxnmq_f32(v122, (float32x4_t)xmmword_256179AD0);
  float32x4_t v126 = vsubq_f32(vminnmq_f32(v123, v124), v125);
  anon_210[1].i32[0] = v125.i32[2];
  float32x2_t *anon_210 = *(float32x2_t *)v125.f32;
  anon_210[3].i32[0] = v126.i32[2];
  anon_210[2] = *(float32x2_t *)v126.f32;
  float32x4_t v127 = *(float32x4_t *)anon_210->f32;
  float32x4_t v128 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
  v127.i32[3] = 0;
  v128.i32[3] = 0;
  float32x4_t v129 = vrndmq_f32(v127);
  float32x4_t v130 = vsubq_f32(vrndpq_f32(v128), v129);
  anon_210[1].i32[0] = v129.i32[2];
  float32x2_t *anon_210 = *(float32x2_t *)v129.f32;
  anon_210[3].i32[0] = v130.i32[2];
  anon_210[2] = *(float32x2_t *)v130.f32;
}

- (uint64_t)encodeCommandBuffer:(void *)a3 inPlaceTexture:
{
  if (result)
  {
    objc_super v3 = (char *)result;
    if (*(float *)(result + 560) >= 1.0)
    {
      v5 = *a3;
      uint64_t v86 = *(void *)(result + 608);
      uint64_t v87 = *(void *)(result + 600);
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "commandQueue"), "device");
      float32x4_t v104 = a2;
      float32x4_t v103 = (void *)[a2 computeCommandEncoder];
      uint64_t v85 = *((void *)v3 + 81);
      uint64_t v7 = *((void *)v3 + 82);
      float v8 = *((float *)v3 + 166);
      float32x4_t v105 = (void *)v6;
      uint64_t PixelInfo = GetPixelInfo();
      uint64_t v89 = [v5 protectionOptions];
      uint64_t v91 = v7;
      if (v7)
      {
        uint64_t v9 = 0;
        int v10 = 0;
        __int32 v88 = v3 + 668;
        float32x4_t v101 = v3 + 16;
        uint64_t v84 = v7 - 1;
        LODWORD(v11) = 0;
        float32x2_t v98 = 0;
        HIDWORD(v11) = 1.0;
        long long v83 = v11;
        float32x4_t v100 = v5;
        float32x4_t v102 = v5;
        __int32 v97 = v3;
        while (1)
        {
          int v12 = *(_DWORD *)&v88[4 * v9];
          int GaussianBlurKernelSize = getGaussianBlurKernelSize(v12);
          signed int v13 = v12 <= 25 ? (char *)&kPlanKernelInfo + 56 * v12 : 0;
          unsigned int v15 = *((_DWORD *)v13 + 2);
          long long v14 = v13 + 8;
          result = -[HKCVKernelCache kernelWithIdentifier:fromLibrary:archive:](*((void *)v3 + 71), (uint64_t)*(&CommonKernels + 3 * v15), *((void **)v3 + 73), *((void *)v3 + 74));
          float32x4_t v106 = (void *)result;
          if (!result) {
            break;
          }
          result = -[HKCVKernelCache kernelWithIdentifier:fromLibrary:archive:](*((void *)v3 + 71), (uint64_t)*(&CommonKernels + 3 * *((unsigned int *)v14 + 6)), *((void **)v3 + 73), *((void *)v3 + 74));
          if (!result) {
            break;
          }
          unsigned int v16 = GaussianBlurKernelSize - 1;
          float32x4_t v17 = (float64x2_t *)(v85 + 8 * (v10 + 3));
          if (v12 >= 16) {
            float32x4_t v18 = v14;
          }
          else {
            float32x4_t v18 = v14 + 24;
          }
          float32x4_t v19 = (float32x4_t *)&v101[64 * v9];
          float32x4_t v21 = *v19;
          float32x4_t v20 = v19[1];
          int32x2_t v22 = vcvt_s32_f32(*(float32x2_t *)v20.f32);
          if (v12 >= 16) {
            long long v23 = v14 + 24;
          }
          else {
            long long v23 = v14;
          }
          HIDWORD(v24.f64[0]) = 0;
          v24.f64[1] = 0.0;
          LOWORD(v24.f64[0]) = v22.i16[0];
          WORD1(v24.f64[0]) = v22.i16[2];
          float32x4_t v25 = v106;
          if (v12 >= 16) {
            float32x4_t v26 = v106;
          }
          else {
            float32x4_t v26 = (void *)result;
          }
          if (v12 >= 16) {
            float32x4_t v25 = (void *)result;
          }
          __n128 v93 = v23;
          float v94 = v25;
          v128[0] = *(void *)&v24.f64[0];
          v128[1] = v21.i64[0];
          uint64_t v92 = v21.i64[0];
          if (GaussianBlurKernelSize < 5)
          {
            unsigned int v27 = 0;
          }
          else
          {
            unsigned int v27 = v16 >> 2;
            uint64_t v28 = v16 >> 2;
            unsigned int v29 = (float64x2_t *)v131;
            do
            {
              float64x2_t v31 = *v17;
              float64x2_t v30 = v17[1];
              v17 += 2;
              float64x2_t v24 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v30);
              *v29++ = v24;
              --v28;
            }
            while (v28);
          }
          int v32 = v16 & 3;
          if ((v16 & 3) != 0)
          {
            float32x4_t v33 = (float32x4_t *)&v128[2 * v27];
            v33[3].i32[0] = 0;
            float32x4_t v34 = v33 + 3;
            v34->i64[1] = 0;
            v34->i32[1] = 0;
            if (v32 == 2)
            {
              float32x4_t v36 = *(float32x4_t *)v17;
              *(float32x2_t *)v36.f32 = vcvt_f32_f64(*v17);
            }
            else if (v32 == 1)
            {
              *(float *)&unsigned int v35 = v17->f64[0];
              float32x4_t v36 = (float32x4_t)v35;
            }
            else
            {
              v24.f64[0] = v17[1].f64[0];
              float32x4_t v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v17), v24);
              v36.i32[3] = 0;
            }
            *float32x4_t v34 = v36;
          }
          float32x4_t v95 = (void *)result;
          int v96 = v10;
          float32x4_t v38 = (float32x4_t)xmmword_256179AC0;
          long long v37 = xmmword_256179B20;
          HIDWORD(v37) = v98.i32[1];
          v38.i32[3] = v98.i32[0];
          long long v129 = v37;
          float32x4_t v130 = v38;
          float v132 = 1.0 / v8;
          v38.i64[0] = 0x4F0000004F000000;
          v38.i64[1] = 0x4F0000004F000000;
          int8x16_t v39 = (int8x16_t)vcgtq_f32(v20, v38);
          int32x2_t v40 = vadd_s32((int32x2_t)vand_s8(*(int8x8_t *)v39.i8, (int8x8_t)0x8000000080000000), (int32x2_t)*(_OWORD *)&vcvtq_s32_f32(vsubq_f32(v20, (float32x4_t)vandq_s8(v39, (int8x16_t)v38))));
          *(void *)&long long v41 = v40.u32[0];
          *((void *)&v41 + 1) = v40.u32[1];
          long long v126 = v41;
          uint64_t v127 = 1;
          unint64_t v42 = (void *)[v97 cachedTextureForDevice:v105 pixelInfo:PixelInfo identifier:v9 textureSize:&v126 protectionOptions:v89];
          if (v9) {
            BOOL v43 = v12 < 16;
          }
          else {
            BOOL v43 = 1;
          }
          uint64_t v44 = v43;
          id Sampler = GetSampler(v105, 0, v44, 0);
          unsigned __int16 v46 = v128[0];
          unsigned __int16 v47 = WORD1(v128[0]);
          uint64_t v48 = [v26 maxTotalThreadsPerThreadgroup];
          unint64_t v49 = [v26 threadExecutionWidth];
          unint64_t v50 = (v48 & (unint64_t)-(uint64_t)v49) / v49;
          if (v50 <= v49) {
            unint64_t v51 = v49;
          }
          else {
            unint64_t v51 = (v48 & (unint64_t)-(uint64_t)v49) / v49;
          }
          if (v50 >= v49) {
            unint64_t v50 = v49;
          }
          uint64_t v52 = *((void *)v18 + 2);
          if (v52) {
            unint64_t v53 = v51;
          }
          else {
            unint64_t v53 = v50;
          }
          if (v52) {
            unint64_t v54 = v50;
          }
          else {
            unint64_t v54 = v51;
          }
          [v103 setComputePipelineState:v26];
          [v103 setTexture:v42 atIndex:0];
          [v103 setTexture:v100 atIndex:1];
          [v103 setSamplerState:Sampler atIndex:0];
          [v103 setBytes:v128 length:128 atIndex:0];
          v125[0] = (v53 + v46 - 1) / v53;
          v125[1] = (v54 + v47 - 1) / v54;
          v125[2] = 1;
          v124[0] = v53;
          v124[1] = v54;
          v124[2] = 1;
          [v103 dispatchThreadgroups:v125 threadsPerThreadgroup:v124];
          char v55 = [v104 retainedReferences];
          uint64_t v56 = (uint64_t)v102;
          if (v100 == v102)
          {
            objc_super v3 = v97;
            if ((v55 & 1) == 0)
            {
              id v58 = v102;
              v122[0] = MEMORY[0x263EF8330];
              v122[1] = 3221225472;
              v122[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_2;
              v122[3] = &unk_2653F34B0;
              v122[4] = v102;
              [v104 addCompletedHandler:v122];
            }
          }
          else
          {
            if ((v55 & 1) == 0)
            {
              id v57 = v100;
              v123[0] = MEMORY[0x263EF8330];
              v123[1] = 3221225472;
              v123[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke;
              v123[3] = &unk_2653F34B0;
              v123[4] = v100;
              [v104 addCompletedHandler:v123];
            }

            objc_super v3 = v97;
          }
          v59 = (float32x4_t *)&v101[(v9 << 6) | 0x20];
          float32x4_t v61 = *v59;
          float32x4_t v60 = v59[1];
          long long v117 = v131[0];
          long long v118 = v131[1];
          long long v119 = v131[2];
          long long v120 = v131[3];
          long long v62 = COERCE_UNSIGNED_INT(1.0);
          *((float *)&v62 + 3) = -*(float *)&v92;
          long long v63 = v83;
          *((float *)&v63 + 3) = -*((float *)&v92 + 1);
          int32x2_t v64 = vcvt_s32_f32(*(float32x2_t *)v60.f32);
          long long v115 = v62;
          long long v116 = v63;
          float v121 = v8;
          if (v9 == v84) {
            __int16 v65 = v87;
          }
          else {
            __int16 v65 = 0;
          }
          v64.i16[1] = v64.i16[2];
          if (v9 == v84) {
            __int16 v66 = v86;
          }
          else {
            __int16 v66 = 0;
          }
          v64.i16[2] = v65;
          v64.i16[3] = v66;
          v114[0] = v64;
          v114[1] = v61.i64[0];
          int32x2_t v99 = *(int32x2_t *)v61.f32;
          if (v9 != v84)
          {
            v67.i64[0] = 0x4F0000004F000000;
            v67.i64[1] = 0x4F0000004F000000;
            int8x16_t v68 = (int8x16_t)vcgtq_f32(v60, v67);
            int32x2_t v69 = vadd_s32((int32x2_t)vand_s8(*(int8x8_t *)v68.i8, (int8x8_t)0x8000000080000000), (int32x2_t)*(_OWORD *)&vcvtq_s32_f32(vsubq_f32(v60, (float32x4_t)vandq_s8(v68, (int8x16_t)v67))));
            *(void *)&long long v70 = v69.u32[0];
            *((void *)&v70 + 1) = v69.u32[1];
            long long v112 = v70;
            uint64_t v113 = 1;
            uint64_t v56 = [v3 cachedTextureForDevice:v105 pixelInfo:PixelInfo identifier:v9 + v91 textureSize:&v112 protectionOptions:v89];
          }
          id v71 = GetSampler(v105, 0, v12 < 16, 0);
          unsigned __int16 v72 = v114[0];
          unsigned __int16 v73 = WORD1(v114[0]);
          uint64_t v74 = [v94 maxTotalThreadsPerThreadgroup];
          unint64_t v75 = [v94 threadExecutionWidth];
          unint64_t v76 = (v74 & (unint64_t)-(uint64_t)v75) / v75;
          if (v76 <= v75) {
            unint64_t v77 = v75;
          }
          else {
            unint64_t v77 = (v74 & (unint64_t)-(uint64_t)v75) / v75;
          }
          if (v76 >= v75) {
            unint64_t v76 = v75;
          }
          uint64_t v78 = *((void *)v93 + 2);
          if (v78) {
            unint64_t v79 = v77;
          }
          else {
            unint64_t v79 = v76;
          }
          if (v78) {
            unint64_t v80 = v76;
          }
          else {
            unint64_t v80 = v77;
          }
          [v103 setComputePipelineState:v94];
          float32x4_t v100 = (void *)v56;
          [v103 setTexture:v56 atIndex:0];
          [v103 setTexture:v42 atIndex:1];
          [v103 setSamplerState:v71 atIndex:0];
          [v103 setBytes:v114 length:128 atIndex:0];
          v111[0] = (v79 + v72 - 1) / v79;
          v111[1] = (v80 + v73 - 1) / v80;
          v111[2] = 1;
          v110[0] = v79;
          v110[1] = v80;
          v110[2] = 1;
          [v103 dispatchThreadgroups:v111 threadsPerThreadgroup:v110];
          if (([v104 retainedReferences] & 1) == 0)
          {
            id v81 = v42;
            v109[0] = MEMORY[0x263EF8330];
            v109[1] = 3221225472;
            v109[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_3;
            v109[3] = &unk_2653F34B0;
            v109[4] = v42;
            [v104 addCompletedHandler:v109];
          }
          float32x2_t v98 = vneg_f32((float32x2_t)vrev64_s32(v99));

          int v10 = GaussianBlurKernelSize + v96;
          ++v9;
          v5 = v102;
          if (v9 == v91) {
            goto LABEL_79;
          }
        }
      }
      else
      {
LABEL_79:
        if (([v104 retainedReferences] & 1) == 0)
        {
          id v82 = v5;
          v108[0] = MEMORY[0x263EF8330];
          v108[1] = 3221225472;
          v108[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_4;
          v108[3] = &unk_2653F34B0;
          v108[4] = v5;
          [v104 addCompletedHandler:v108];
        }
        [v103 endEncoding];
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke(uint64_t a1)
{
}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_2(uint64_t a1)
{
}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_3(uint64_t a1)
{
}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_4(uint64_t a1)
{
}

- (float)sigma
{
  return self->_sigma;
}

- ($F1BC40A862ED60063F4F8EDA86EB086B)clipRect
{
  long long v3 = *(_OWORD *)&self[12].var1.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[12].var1.var0;
  *(_OWORD *)&retstr->var0.unint64_t var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[13].var0.var1;
  return self;
}

- ($0EE4DB4080C7F8AC2CA5DE15946CA571)planInfo
{
  *(void *)&retstr->var3[7] = *(void *)&self[12].var3[1];
  long long v3 = *(_OWORD *)&self[11].var3[7];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[11].var3[3];
  *(_OWORD *)&retstr->unint64_t var2 = v3;
  *(_OWORD *)&retstr->var3[3] = *(_OWORD *)&self[12].var1;
  return self;
}

- (HKCVKernelCache)kernelCache
{
  return self->_kernelCache;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLBinaryArchive)archive
{
  return self->_archive;
}

@end