@interface SubjectRelightingStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)mitigationNeeded;
- (SubjectRelightingStage)initWithMetalContext:(id)a3;
- (float)curveParameter;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5;
- (int)_runSubjectRelighting:(int)a3 luma:(id)a4 chroma:(id)a5 skinMask:(id)a6 personMask:(id)a7 instanceMasks:(id)a8 instanceMaskConfidences:(id)a9 skinToneClassification:(id)a10 validROI:(CGRect)a11 expBias:(float)a12 faceExpRatio:(float)a13 exifOrientation:(int)a14 srlV2Plist:(id *)a15 toneMap:(id)a16 ltmChroma:(id)a17 gammaCurve:(id)a18 numFacesISPDetected:(unint64_t)a19 faceBoundingBoxesFromISP:(id)a20[10] isChromaGainAdjusted:(BOOL)a21 inputIsLinear:(BOOL)a22 chromaBias:(float)a23 mstmParams:(id)a24 mstmSRLParams:(id)a25 blackPoint:(id)a26 playBackCurve:(id)a27;
- (int)runSRLForLivePhotosWithInputBuffer:(__CVBuffer *)a3 skinMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5 instanceMasks:(id)a6 instanceMaskConfidences:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 exifOrientation:(int)a12 srlV2Plist:(id)a13;
- (int)runSubjectRelightingVersion:(id)a3 toneMap:(id)a4 luma:(id)a5 chroma:(id)a6 ltmChroma:(id)a7 skinMask:(id)a8 personMask:(id)a9 instanceMask0:(id)a10 instanceMask1:(id)a11 instanceMask2:(id)a12 instanceMask3:(id)a13 gammaCurve:(id)a14 instanceMaskConfidences:(id)a15 skinToneClassification:(id)a16 validROI:(CGRect)a17 expBias:(float)a18 faceExpRatio:(float)a19 exifOrientation:(int)a20 numFacesISPDetected:(unint64_t)a21 faceBoundingBoxesFromISP:(id)a22[10] isChromaGainAdjusted:(BOOL)a23 inputIsLinear:(BOOL)a24 chromaBias:(float)a25 srlV2Plist:(id *)a26 mstmParams:(id)a27 mstmSRLParams:(id)a28 blackPoint:(id)a29 playBackCurve:(id)a30;
- (unsigned)getSRLStatus;
- (void)reset;
@end

@implementation SubjectRelightingStage

- (SubjectRelightingStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)SubjectRelightingStage;
  v6 = [(SubjectRelightingStage *)&v19 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = [(SubjectRelightingStage *)self newBufferWithLength:8464 options:0 label:@"srlV2_Global_Stats"];
  srlV2GlobalStatsBuffer = self->_srlV2GlobalStatsBuffer;
  self->_srlV2GlobalStatsBuffer = v7;

  if (!self->_srlV2GlobalStatsBuffer) {
    goto LABEL_11;
  }
  v9 = [(SubjectRelightingStage *)self newBufferWithLength:271680 options:0 label:@"srlV2_Face_Stats"];
  srlV2FaceStatsBuffer = self->_srlV2FaceStatsBuffer;
  self->_srlV2FaceStatsBuffer = v9;

  if (!self->_srlV2FaceStatsBuffer) {
    goto LABEL_11;
  }
  v11 = [(SubjectRelightingStage *)self newBufferWithLength:2136 options:0 label:@"srlV2_Rendering_Params"];
  srlV2CoeffsBuffer = self->_srlV2CoeffsBuffer;
  self->_srlV2CoeffsBuffer = v11;

  if (!self->_srlV2CoeffsBuffer) {
    goto LABEL_11;
  }
  v13 = +[SubjectRelightingShared sharedInstance];
  v14 = [v13 getShaders:self->_metalContext];
  shaders = self->_shaders;
  self->_shaders = v14;

  if (!self->_shaders)
  {
LABEL_11:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
    goto LABEL_8;
  }
  v16 = objc_alloc_init(SRLv2Plist);
  srlV2Plist = self->_srlV2Plist;
  self->_srlV2Plist = v16;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
  *(_WORD *)&self->_srlInLivePhotos = 1;
LABEL_8:

  return self;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  v7 = [(FigMetalContext *)self->_metalContext device];
  v8 = (void *)[v7 newBufferWithLength:a3 options:a4];

  [v8 setLabel:0];
  return v8;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [[SubjectRelightingShaders alloc] initWithMetalContext:v3];
    if (v4)
    {
      int v5 = 0;
    }
    else
    {
      FigDebugAssert3();
      v4 = 0;
      int v5 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (void)reset
{
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
}

- (unsigned)getSRLStatus
{
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  if (lastSRLCommandBuffer)
  {
    [(MTLCommandBuffer *)lastSRLCommandBuffer waitUntilCompleted];
    float curveParameter = *(float *)([(MTLBuffer *)self->_srlV2CoeffsBuffer contents] + 80);
    self->_float curveParameter = curveParameter;
  }
  else
  {
    float curveParameter = self->_curveParameter;
  }
  unsigned int v5 = vcvts_n_u32_f32(curveParameter, 8uLL);
  BOOL v6 = curveParameter >= 0.5 || curveParameter <= 0.25;
  unsigned int v7 = v5;
  if (!v6)
  {
    unsigned int v7 = v5 | 0x80000000;
    self->_mitigationNeeded = 1;
  }
  if (self->_srlInLivePhotos) {
    unsigned int v8 = v5;
  }
  else {
    unsigned int v8 = v7;
  }
  v9 = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  return v8;
}

- (BOOL)mitigationNeeded
{
  return self->_forceSrlOnInLivePhotos || self->_mitigationNeeded;
}

- (float)curveParameter
{
  return self->_curveParameter;
}

- (int)_runSubjectRelighting:(int)a3 luma:(id)a4 chroma:(id)a5 skinMask:(id)a6 personMask:(id)a7 instanceMasks:(id)a8 instanceMaskConfidences:(id)a9 skinToneClassification:(id)a10 validROI:(CGRect)a11 expBias:(float)a12 faceExpRatio:(float)a13 exifOrientation:(int)a14 srlV2Plist:(id *)a15 toneMap:(id)a16 ltmChroma:(id)a17 gammaCurve:(id)a18 numFacesISPDetected:(unint64_t)a19 faceBoundingBoxesFromISP:(id)a20[10] isChromaGainAdjusted:(BOOL)a21 inputIsLinear:(BOOL)a22 chromaBias:(float)a23 mstmParams:(id)a24 mstmSRLParams:(id)a25 blackPoint:(id)a26 playBackCurve:(id)a27
{
  CGFloat height = a11.size.height;
  CGFloat width = a11.size.width;
  CGFloat y = a11.origin.y;
  CGFloat x = a11.origin.x;
  id v153 = a4;
  id v39 = a5;
  id v149 = a6;
  id v148 = a7;
  id v40 = a8;
  int v41 = a3;
  id v147 = v40;
  id v42 = a9;
  id v156 = a10;
  float v197 = a13;
  v198[0] = a12;
  id v150 = a16;
  id v43 = a17;
  id v146 = a18;
  id v44 = a24;
  id v152 = a25;
  id v136 = a26;
  id v144 = a27;
  id v145 = v39;
  if (a3 == 2)
  {
    v49 = self;
    v151 = self->_shaders->_srlV2GlobalHistogram;
    v154 = self->_shaders->_srlV2FaceHistogram;
    v143 = self->_shaders->_srlV2CalcCoefficients;
    srlV2ApplCGFloat y = self->_shaders->_srlV2Apply;
LABEL_7:
    v51 = srlV2Apply;
    srlV3CalcPostSRLStats = v49->_shaders->_srlV3CalcPostSRLStats;
    v138 = srlV3CalcPostSRLStats;
    v139 = v51;
    v48 = v153;
    unint64_t v45 = a19;
    int v46 = a14;
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    v49 = self;
    v151 = self->_shaders->_srlV2GlobalHistogram;
    v154 = self->_shaders->_srlV2FaceHistogram;
    v143 = self->_shaders->_srlV3CalcCoefficients;
    srlV2ApplCGFloat y = self->_shaders->_srlV3Apply;
    goto LABEL_7;
  }
  unint64_t v45 = a19;
  int v46 = a14;
  if (a3 == 100)
  {
    v151 = self->_shaders->_srlV2GlobalHistogramLivePhotos;
    v154 = self->_shaders->_srlV2FaceHistogramLivePhotos;
    v138 = 0;
    v139 = 0;
    srlV3CalcPostSRLStats = self->_shaders->_srlV2CalcCoefficientsLivePhotos;
    v143 = srlV3CalcPostSRLStats;
    v48 = v153;
LABEL_8:
    v52 = srlV3CalcPostSRLStats;
    goto LABEL_10;
  }
  v138 = 0;
  v139 = 0;
  v143 = 0;
  v154 = 0;
  v151 = 0;
  v48 = v153;
LABEL_10:
  memset(&v196, 0, sizeof(v196));
  uint64_t v53 = objc_msgSend(v156, "count", getAffineTransformFromExifOrientation(v46, (uint64_t)&v196));
  size_t v54 = v53;
  if (v45) {
    BOOL v55 = v53 == 0;
  }
  else {
    BOOL v55 = 0;
  }
  char v56 = v55;
  v137 = v42;
  if (v55)
  {
    size_t v54 = v45;
    if (!a20)
    {
      FigDebugAssert3();
      v159 = 0;
      v119 = 0;
      v118 = 0;
      int v132 = -12780;
      goto LABEL_94;
    }
  }
  if (!(v54 | v45) || v45 >= 0x11 && v54 > 0x10)
  {
    v159 = 0;
LABEL_88:
    v119 = 0;
    v118 = 0;
    int v132 = 0;
LABEL_94:
    v120 = v145;
    goto LABEL_95;
  }
  id v140 = v43;
  int v135 = v41;
  float v157 = (float)(unint64_t)[v48 width];
  unint64_t v57 = [v48 height];
  v58.f32[0] = v157;
  v58.f32[1] = (float)v57;
  float32x2_t v158 = v58;
  v181[0] = v54;
  v181[1] = 6;
  v181[2] = a22;
  *(float *)&v181[3] = a23;
  uint64_t v182 = 1065353216;
  v59.f64[0] = x;
  float32x2_t v183 = vdiv_f32(COERCE_FLOAT32X2_T(vector2FromCGPoint(v59, y)), v58);
  v60.f64[0] = width;
  double v61 = vector2FromCGPoint(v60, height);
  uint64_t v62 = 0;
  v191[1] = 0;
  v191[0] = 0;
  BOOL var9 = a15->var9;
  if (v44) {
    BOOL v63 = v152 == 0;
  }
  else {
    BOOL v63 = 1;
  }
  char v64 = v63;
  char v193 = v64;
  float32x2_t v184 = vdiv_f32(*(float32x2_t *)&v61, v158);
  float var0 = a15->var0;
  long long v186 = *(_OWORD *)&a15->var10;
  long long v187 = *(_OWORD *)&a15->var14;
  long long v188 = *(_OWORD *)&a15->var18;
  long long v189 = *(_OWORD *)&a15->var1;
  long long v190 = *(_OWORD *)&a15->var5;
  BOOL var22 = a15->var22;
  char v194 = v56;
  do
  {
    v65 = [v42 objectAtIndexedSubscript:v62];
    [v65 floatValue];
    if (v66 <= 0.95) {
      float v67 = 0.0;
    }
    else {
      float v67 = 1.0;
    }
    *((float *)v191 + v62) = v67;

    ++v62;
  }
  while (v62 != 4);
  v159 = (char *)malloc_type_calloc(v54, 0x30uLL, 0x1000040EED21634uLL);
  if (!v159)
  {
    FigDebugAssert3();
    v119 = 0;
    v118 = 0;
    int v132 = -12786;
    v120 = v145;
    v129 = v136;
    free(0);
    goto LABEL_86;
  }
  if (v56)
  {
    if (v54)
    {
      p_size = &a20->var0.size;
      float v70 = 0.0;
      size_t v71 = v54;
      v72 = (float64_t *)v159;
      do
      {
        memset_pattern16(v72 + 2, &unk_26337FE50, 0x18uLL);
        v73.f64[0] = p_size[-1].width;
        float64_t v74 = p_size[-1].height;
        float64_t v75 = p_size->width;
        float64_t v76 = p_size->height;
        p_size = (CGSize *)((char *)p_size + 40);
        float64_t *v72 = vector2FromCGPoint(v73, v74);
        v77.f64[0] = v75;
        float64_t v78 = vector2FromCGPoint(v77, v76);
        v72[1] = v78;
        if (*(float *)&v78 <= *((float *)&v78 + 1)) {
          *(float *)&float64_t v78 = *((float *)&v78 + 1);
        }
        if (v70 < *(float *)&v78) {
          float v70 = *(float *)&v78;
        }
        *((_DWORD *)v72 + 10) = 1077936128;
        v72 += 6;
        --v71;
      }
      while (v71);
      double v68 = v70;
      if (v70 >= 0.35) {
        goto LABEL_88;
      }
    }
  }
  else
  {
    if (v54)
    {
      id v134 = v44;
      uint64_t v79 = 0;
      v80 = v159 + 16;
      float v81 = 1.0;
      do
      {
        v82 = [v156 objectAtIndexedSubscript:v79];
        v83 = [v82 faceAttributes];
        [v82 boundingBox];
        CGFloat v85 = v84;
        v86 = [v83 facemaskCategory];
        v87 = [v86 label];
        v88 = [v87 identifier];
        int v89 = [v88 isEqualToString:@"UNKNOWN_17_unknown0"];

        [v82 boundingBox];
        double v91 = v90;
        float v92 = 1.0;
        if (v89)
        {
          [v82 boundingBox];
          float v95 = v94;
          float v93 = v91;
          float v96 = (float)(v95 / 2.5) + v93;
          float v97 = 1.0;
          if (v96 < 1.0)
          {
            [v82 boundingBox];
            float v99 = v98;
            [v82 boundingBox];
            float v101 = v100;
            float v97 = (float)(v101 / 2.5) + v99;
          }
          double v91 = v97;
          float v92 = 0.8;
        }
        [v82 boundingBox];
        CGFloat v103 = v102;
        [v82 boundingBox];
        CGAffineTransform v180 = v196;
        v199.origin.CGFloat x = v85;
        v199.origin.CGFloat y = v91;
        v199.size.CGFloat height = v103;
        CGRect v200 = CGRectApplyAffineTransform(v199, &v180);
        CGFloat v104 = v200.size.width;
        CGFloat v105 = v200.size.height;
        v106 = (float *)&v159[48 * v79];
        *(float64_t *)v106 = vector2FromCGPoint((float64x2_t)v200.origin, v200.origin.y);
        v106[11] = v92;
        v107.f64[0] = v104;
        float64_t v108 = vector2FromCGPoint(v107, v105);
        *((float64_t *)v106 + 1) = v108;
        if (*(float *)&v108 >= *((float *)&v108 + 1)) {
          *(float *)&float64_t v108 = *((float *)&v108 + 1);
        }
        if (*(float *)&v108 < v81) {
          float v81 = *(float *)&v108;
        }
        v109 = [v82 yaw];
        [v109 floatValue];
        v106[10] = (float)(v110 * 3.0) / 1.5708;

        v111 = [v83 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
        v112 = [v111 allLabelsWithConfidences];

        if ([v112 count])
        {
          unint64_t v113 = 0;
          do
          {
            v114 = [v112 objectAtIndexedSubscript:v113];
            [v114 confidence];
            *(_DWORD *)&v80[4 * v113] = v115;

            ++v113;
          }
          while (v113 < [v112 count]);
        }

        ++v79;
        v80 += 48;
      }
      while (v79 != v54);
      double v68 = v81;
      BOOL v116 = v81 < 0.07;
      id v43 = v140;
      id v44 = v134;
    }
    else
    {
      BOOL v116 = 0;
    }
    if (var9) {
      BOOL v116 = 1;
    }
    BOOL var9 = v116;
  }
  v117 = [(FigMetalContext *)self->_metalContext commandQueue];
  v118 = [v117 commandBuffer];

  if (!v118)
  {
    FigDebugAssert3();
    int v132 = FigSignalErrorAt();
    v119 = 0;
    goto LABEL_94;
  }
  v119 = [v118 computeCommandEncoder];
  v120 = v145;
  if (v119)
  {
    unint64_t v121 = [(MTLComputePipelineState *)v151 maxTotalThreadsPerThreadgroup];
    if (v121 >= [(MTLComputePipelineState *)v154 maxTotalThreadsPerThreadgroup]) {
      v122 = v154;
    }
    else {
      v122 = v151;
    }
    float v123 = log2f((float)((unint64_t)[(MTLComputePipelineState *)v122 maxTotalThreadsPerThreadgroup] >> 6));
    float v124 = exp2f(floorf(v123));
    if ((unint64_t)v124 >= 0x40) {
      unint64_t v125 = 64;
    }
    else {
      unint64_t v125 = (unint64_t)v124;
    }
    [v119 setTexture:v150 atIndex:0];
    [v119 setTexture:v153 atIndex:1];
    [v119 setTexture:v145 atIndex:2];
    if (a21) {
      uint64_t v126 = 4;
    }
    else {
      uint64_t v126 = 3;
    }
    [v119 setTexture:v43 atIndex:v126];
    [v119 setTexture:v149 atIndex:5];
    [v119 setTexture:v148 atIndex:6];
    for (uint64_t i = 0; i != 4; ++i)
    {
      v128 = [v147 objectAtIndexedSubscript:i];
      [v119 setTexture:v128 atIndex:i + 7];
    }
    [v119 setTexture:v146 atIndex:11];
    [v119 setBytes:v181 length:144 atIndex:0];
    [v119 setBytes:v159 length:48 * v54 atIndex:1];
    [v119 setBytes:v198 length:4 atIndex:7];
    [v119 setBytes:&v197 length:4 atIndex:8];
    if ((unint64_t)[(MTLBuffer *)self->_srlV2GlobalStatsBuffer length] >> 4 < 0x211
      || ([v119 setBuffer:self->_srlV2GlobalStatsBuffer offset:0 atIndex:2],
          [(MTLBuffer *)self->_srlV2FaceStatsBuffer length] < 16980 * v54)
      || ([v119 setBuffer:self->_srlV2FaceStatsBuffer offset:0 atIndex:3],
          (unint64_t)[(MTLBuffer *)self->_srlV2CoeffsBuffer length] <= 0x857))
    {
      FigDebugAssert3();
      int v132 = -12780;
      v129 = v136;
    }
    else
    {
      [v119 setBuffer:self->_srlV2CoeffsBuffer offset:0 atIndex:4];
      [v119 setBuffer:v44 offset:0 atIndex:5];
      [v119 setBuffer:v152 offset:0 atIndex:6];
      v129 = v136;
      [v119 setBuffer:v136 offset:0 atIndex:9];
      [v119 setBuffer:v144 offset:0 atIndex:10];
      [v119 setComputePipelineState:v151];
      int64x2_t v141 = vdupq_n_s64(1uLL);
      int64x2_t v178 = v141;
      uint64_t v179 = 1;
      v177[0] = 64;
      v177[1] = v125;
      v177[2] = 1;
      [v119 dispatchThreadgroups:&v178 threadsPerThreadgroup:v177];
      [v119 setComputePipelineState:v154];
      v174[2] = 1;
      size_t v175 = v54;
      int64x2_t v176 = v141;
      v174[0] = 64;
      v174[1] = v125;
      [v119 dispatchThreadgroups:&v175 threadsPerThreadgroup:v174];
      [v119 setComputePipelineState:v143];
      int64x2_t v172 = v141;
      uint64_t v173 = 1;
      int64x2_t v170 = v141;
      uint64_t v171 = 1;
      [v119 dispatchThreadgroups:&v172 threadsPerThreadgroup:&v170];
      if (v135 != 100)
      {
        [v119 setComputePipelineState:v139];
        [v119 setImageblockWidth:32 height:32];
        v169[0] = (unint64_t)[v150 width] >> 1;
        v169[1] = (unint64_t)[v150 height] >> 1;
        v169[2] = 1;
        int64x2_t v167 = vdupq_n_s64(0x10uLL);
        uint64_t v168 = 1;
        [v119 dispatchThreads:v169 threadsPerThreadgroup:&v167];
        [v119 setComputePipelineState:v154];
        int64x2_t v142 = vdupq_n_s64(1uLL);
        v164[2] = 1;
        size_t v165 = v54;
        int64x2_t v166 = v142;
        v164[0] = 64;
        v164[1] = v125;
        [v119 dispatchThreadgroups:&v165 threadsPerThreadgroup:v164];
        [v119 setComputePipelineState:v138];
        int64x2_t v162 = v142;
        uint64_t v163 = 1;
        int64x2_t v160 = v142;
        uint64_t v161 = 1;
        [v119 dispatchThreadgroups:&v162 threadsPerThreadgroup:&v160];
      }
      [v119 endEncoding];
      if (*MEMORY[0x263F00E10])
      {
        v130 = [v118 commandQueue];
        v131 = [v130 commandBuffer];

        [v131 setLabel:@"KTRACE_MTLCMDBUF"];
        [v131 addCompletedHandler:&__block_literal_global];
        [v131 commit];
        [v118 addCompletedHandler:&__block_literal_global_112];
      }
      [v118 commit];
      objc_storeStrong((id *)&self->_lastSRLCommandBuffer, v118);
      int v132 = 0;
    }
    v120 = v145;
    goto LABEL_85;
  }
  FigDebugAssert3();
  int v132 = FigSignalErrorAt();
LABEL_95:
  v129 = v136;
LABEL_85:
  free(v159);
LABEL_86:

  return v132;
}

uint64_t __368__SubjectRelightingStage__runSubjectRelighting_luma_chroma_skinMask_personMask_instanceMasks_instanceMaskConfidences_skinToneClassification_validROI_expBias_faceExpRatio_exifOrientation_srlV2Plist_toneMap_ltmChroma_gammaCurve_numFacesISPDetected_faceBoundingBoxesFromISP_isChromaGainAdjusted_inputIsLinear_chromaBias_mstmParams_mstmSRLParams_blackPoint_playBackCurve___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __368__SubjectRelightingStage__runSubjectRelighting_luma_chroma_skinMask_personMask_instanceMasks_instanceMaskConfidences_skinToneClassification_validROI_expBias_faceExpRatio_exifOrientation_srlV2Plist_toneMap_ltmChroma_gammaCurve_numFacesISPDetected_faceBoundingBoxesFromISP_isChromaGainAdjusted_inputIsLinear_chromaBias_mstmParams_mstmSRLParams_blackPoint_playBackCurve___block_invoke_2(uint64_t a1, void *a2)
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

- (int)runSRLForLivePhotosWithInputBuffer:(__CVBuffer *)a3 skinMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5 instanceMasks:(id)a6 instanceMaskConfidences:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 exifOrientation:(int)a12 srlV2Plist:(id)a13
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a13;
  v29 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:10 usage:17 plane:0];
  if (!v29)
  {
    FigDebugAssert3();
    int v48 = 0;
    goto LABEL_17;
  }
  id v55 = v27;
  uint64_t v30 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:30 usage:17 plane:1];
  if (!v30)
  {
    FigDebugAssert3();
LABEL_23:
    int v48 = 0;
    goto LABEL_17;
  }
  v31 = (void *)v30;
  uint64_t v32 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a4 pixelFormat:10 usage:17 plane:0];
  if (!v32)
  {
    FigDebugAssert3();
LABEL_22:

    goto LABEL_23;
  }
  v33 = (void *)v32;
  uint64_t v34 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a5 pixelFormat:25 usage:17 plane:0];
  if (!v34)
  {
    FigDebugAssert3();

    goto LABEL_22;
  }
  v35 = (void *)v34;
  v52 = v29;
  id v53 = v26;
  id v36 = v28;
  long long v64 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  id v54 = v25;
  id v37 = v25;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:*(void *)(*((void *)&v61 + 1) + 8 * i) pixelFormat:25 usage:17 plane:0];
        if (!v42)
        {
          FigDebugAssert3();

          int v48 = 0;
          id v26 = v53;
          id v25 = v54;
          id v27 = v55;
          id v28 = v36;
          goto LABEL_16;
        }
        id v43 = (void *)v42;
        [0 addObject:v42];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }

  id v28 = v36;
  if ([(SRLv2Plist *)self->_srlV2Plist readPlist:v36])
  {
    FigDebugAssert3();

    int v48 = -12780;
    id v26 = v53;
    id v25 = v54;
    id v27 = v55;
LABEL_16:
    v29 = v52;
  }
  else
  {
    uint64_t v60 = 0;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    srlV2Plist = self->_srlV2Plist;
    v56[0] = LODWORD(srlV2Plist->maskThreshold);
    v56[1] = LODWORD(srlV2Plist->minFaceSize);
    v56[2] = LODWORD(srlV2Plist->maxCurveBoost);
    v56[3] = LODWORD(srlV2Plist->minCurveBoost);
    v56[4] = LODWORD(srlV2Plist->maxTargetRatioDarkening);
    v56[5] = LODWORD(srlV2Plist->maxTargetRatioLimit);
    v56[6] = LODWORD(srlV2Plist->biasFactorSRLv2);
    v56[7] = LODWORD(srlV2Plist->toneSimilaritySigma);
    v56[8] = LODWORD(srlV2Plist->faceExpDifThreshold);
    LOBYTE(v57) = srlV2Plist->relightOnlyPersonMask;
    *(void *)((char *)&v57 + 4) = *(void *)&srlV2Plist->targetMedian_I;
    HIDWORD(v57) = LODWORD(srlV2Plist->targetMedian_III);
    long long v58 = *(_OWORD *)&srlV2Plist->targetMedian_IV;
    long long v59 = *(_OWORD *)&srlV2Plist->maxBoost_II;
    *(float *)&uint64_t v60 = srlV2Plist->maxBoost_VI;
    BYTE4(v60) = srlV2Plist->matchPreview;
    LODWORD(v46) = 0.5;
    LOWORD(v51) = 0;
    LODWORD(v50) = a12;
    id v27 = v55;
    v29 = v52;
    id v26 = v53;
    *(float *)&double v44 = a10;
    *(float *)&double v45 = a11;
    int v48 = -[SubjectRelightingStage _runSubjectRelighting:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:faceBoundingBoxesFromISP:isChromaGainAdjusted:inputIsLinear:chromaBias:mstmParams:mstmSRLParams:blackPoint:playBackCurve:](self, "_runSubjectRelighting:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:faceBoundingBoxesFromISP:isChromaGainAdjusted:inputIsLinear:chromaBias:mstmParams:mstmSRLParams:blackPoint:playBackCurve:", 100, v52, v31, v33, v35, 0, x, y, width, height, v44, v45, v46, v53,
            v55,
            v50,
            v56,
            0,
            0,
            0,
            0,
            0,
            v51,
            0,
            0,
            0,
            0);

    id v25 = v54;
  }
LABEL_17:

  return v48;
}

- (int)runSubjectRelightingVersion:(id)a3 toneMap:(id)a4 luma:(id)a5 chroma:(id)a6 ltmChroma:(id)a7 skinMask:(id)a8 personMask:(id)a9 instanceMask0:(id)a10 instanceMask1:(id)a11 instanceMask2:(id)a12 instanceMask3:(id)a13 gammaCurve:(id)a14 instanceMaskConfidences:(id)a15 skinToneClassification:(id)a16 validROI:(CGRect)a17 expBias:(float)a18 faceExpRatio:(float)a19 exifOrientation:(int)a20 numFacesISPDetected:(unint64_t)a21 faceBoundingBoxesFromISP:(id)a22[10] isChromaGainAdjusted:(BOOL)a23 inputIsLinear:(BOOL)a24 chromaBias:(float)a25 srlV2Plist:(id *)a26 mstmParams:(id)a27 mstmSRLParams:(id)a28 blackPoint:(id)a29 playBackCurve:(id)a30
{
  double height = a17.size.height;
  double width = a17.size.width;
  double y = a17.origin.y;
  double x = a17.origin.x;
  v89[4] = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v84 = a4;
  id v88 = a5;
  id v87 = a6;
  id v43 = a7;
  double v44 = v42;
  id v86 = v43;
  id v85 = a8;
  id v81 = a9;
  id v45 = a10;
  id v82 = a11;
  id v83 = a12;
  id v46 = a13;
  id v47 = a14;
  id v48 = a15;
  id v49 = a16;
  id v50 = a27;
  id v51 = a28;
  id v78 = a29;
  id v52 = a30;
  id v53 = v44;
  id v79 = v51;
  id v80 = v49;
  float64_t v75 = v45;
  if ([v44 isEqualToString:@"v2"])
  {
    id v54 = v50;
    id v72 = v47;
    id v73 = v48;
    id v55 = v46;
    id v56 = v45;
    float64_t v74 = v44;
    int v57 = 2;
  }
  else
  {
    if (([v44 isEqualToString:@"v3"] & 1) == 0)
    {
      FigDebugAssert3();
      int v77 = -12780;
      id v54 = v50;
      long long v62 = v49;
      long long v63 = v81;
      long long v59 = v52;
      uint64_t v60 = v78;
      long long v61 = v79;
      goto LABEL_7;
    }
    id v54 = v50;
    id v72 = v47;
    id v73 = v48;
    id v55 = v46;
    id v56 = v45;
    float64_t v74 = v44;
    int v57 = 3;
  }
  unsigned int v76 = v57;
  v89[0] = v56;
  v89[1] = v82;
  v89[2] = v83;
  v89[3] = v55;
  id v46 = v55;
  long long v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:4];
  id v70 = v52;
  long long v59 = v52;
  uint64_t v60 = v78;
  long long v61 = v79;
  LOWORD(v69) = __PAIR16__(a24, a23);
  id v47 = v72;
  id v48 = v73;
  LODWORD(v68) = a20;
  long long v62 = v80;
  long long v63 = v81;
  *(float *)&double v64 = a18;
  *(float *)&double v65 = a19;
  *(float *)&double v66 = a25;
  int v77 = -[SubjectRelightingStage _runSubjectRelighting:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:faceBoundingBoxesFromISP:isChromaGainAdjusted:inputIsLinear:chromaBias:mstmParams:mstmSRLParams:blackPoint:playBackCurve:](self, "_runSubjectRelighting:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:faceBoundingBoxesFromISP:isChromaGainAdjusted:inputIsLinear:chromaBias:mstmParams:mstmSRLParams:blackPoint:playBackCurve:", v76, v88, v87, v85, v81, v58, x, y, width, height, v64, v65, v66, v73, v80,
          v68,
          a26,
          v84,
          v86,
          v72,
          a21,
          a22,
          v69,
          v54,
          v79,
          v78,
          v70);

  id v53 = v74;
LABEL_7:

  return v77;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSRLCommandBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2CoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2FaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2Plist, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end