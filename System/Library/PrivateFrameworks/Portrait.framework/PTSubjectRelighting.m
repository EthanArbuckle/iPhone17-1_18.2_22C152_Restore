@interface PTSubjectRelighting
- (PTSubjectRelighting)initWithMetalContext:(id)a3 effectUtil:(id)a4 prewarmOnly:(BOOL)a5;
- (id)samplePosDebug;
- (id)srlV2CoeffsBuffer;
- (int)runSRLForLivePhotosWithInputBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 skinMaskTexture:(id)a6 personMaskTexture:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 transform:(CGAffineTransform *)a12;
@end

@implementation PTSubjectRelighting

- (PTSubjectRelighting)initWithMetalContext:(id)a3 effectUtil:(id)a4 prewarmOnly:(BOOL)a5
{
  id v7 = a3;
  v82.receiver = self;
  v82.super_class = (Class)PTSubjectRelighting;
  v8 = [(PTSubjectRelighting *)&v82 init];
  if (!v8) {
    goto LABEL_30;
  }
  uint64_t v9 = [v7 computePipelineStateFor:@"srlV2GlobalSparseHistogramLivePhotos" withConstants:0];
  srlV2GlobalHistogramLivePhotos = v8->_srlV2GlobalHistogramLivePhotos;
  v8->_srlV2GlobalHistogramLivePhotos = (MTLComputePipelineState *)v9;

  if (!v8->_srlV2GlobalHistogramLivePhotos)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:](v28, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_29;
  }
  uint64_t v11 = [v7 computePipelineStateFor:@"srlV2FaceSparseHistogramLivePhotos" withConstants:0];
  srlV2FaceHistogramLivePhotos = v8->_srlV2FaceHistogramLivePhotos;
  v8->_srlV2FaceHistogramLivePhotos = (MTLComputePipelineState *)v11;

  if (!v8->_srlV2FaceHistogramLivePhotos)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:](v28, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_29;
  }
  uint64_t v13 = [v7 computePipelineStateFor:@"srlV2CalcCoefficientsLivePhotos" withConstants:0];
  srlV2CalcCoefficientsLivePhotos = v8->_srlV2CalcCoefficientsLivePhotos;
  v8->_srlV2CalcCoefficientsLivePhotos = (MTLComputePipelineState *)v13;

  if (!v8->_srlV2CalcCoefficientsLivePhotos)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:](v28, v52, v53, v54, v55, v56, v57, v58);
    }
    goto LABEL_29;
  }
  v15 = [v7 device];
  uint64_t v16 = [v15 newBufferWithLength:8460 options:0];
  srlV2GlobalStatsBuffer = v8->_srlV2GlobalStatsBuffer;
  v8->_srlV2GlobalStatsBuffer = (MTLBuffer *)v16;

  if (!v8->_srlV2GlobalStatsBuffer)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.4(v28, v59, v60, v61, v62, v63, v64, v65);
    }
    goto LABEL_29;
  }
  v18 = [v7 device];
  uint64_t v19 = [v18 newBufferWithLength:271680 options:0];
  srlV2FaceStatsBuffer = v8->_srlV2FaceStatsBuffer;
  v8->_srlV2FaceStatsBuffer = (MTLBuffer *)v19;

  if (!v8->_srlV2FaceStatsBuffer)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.5(v28, v66, v67, v68, v69, v70, v71, v72);
    }
    goto LABEL_29;
  }
  v21 = [v7 device];
  uint64_t v22 = [v21 newBufferWithLength:100 options:0];
  srlV2CoeffsBuffer = v8->_srlV2CoeffsBuffer;
  v8->_srlV2CoeffsBuffer = (MTLBuffer *)v22;

  v24 = v8->_srlV2CoeffsBuffer;
  if (!v24)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.6(v28, v73, v74, v75, v76, v77, v78, v79);
    }
    goto LABEL_29;
  }
  if (!v8->_srlV2GlobalStatsBuffer || !v8->_srlV2FaceStatsBuffer)
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.7(v28);
    }
    goto LABEL_29;
  }
  *(_DWORD *)([(MTLBuffer *)v24 contents] + 96) = 1056964608;
  uint64_t v25 = objc_opt_new();
  srlV2Plist = v8->_srlV2Plist;
  v8->_srlV2Plist = (SRLv2Plist *)v25;

  if (a5)
  {
LABEL_33:
    v80 = v8;
    goto LABEL_31;
  }
  v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v28 = [v27 pathForResource:@"BackWide-IQTuning" ofType:@"plist" inDirectory:&stru_1F269F3B0];

  v29 = (void *)MEMORY[0x1E4F1C9E8];
  v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28];
  v31 = [v29 dictionaryWithContentsOfURL:v30 error:0];

  v32 = [v31 objectForKeyedSubscript:@"DeepFusionParameters"];
  v33 = [v32 objectForKeyedSubscript:@"ToneMapping"];
  v34 = [v33 objectForKeyedSubscript:@"DefaultParameters"];
  uint64_t v35 = [v34 objectForKeyedSubscript:@"SRLv2"];
  plistSRL = v8->_plistSRL;
  v8->_plistSRL = (NSDictionary *)v35;

  if (![(SRLv2Plist *)v8->_srlV2Plist readPlist:v8->_plistSRL])
  {

    goto LABEL_33;
  }
  v37 = _PTLogSystem();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.8(v37);
  }

LABEL_29:
LABEL_30:
  v80 = 0;
LABEL_31:

  return v80;
}

- (int)runSRLForLivePhotosWithInputBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 skinMaskTexture:(id)a6 personMaskTexture:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 transform:(CGAffineTransform *)a12
{
  id v71 = a3;
  id v69 = a4;
  id v68 = a5;
  id v67 = a6;
  id v65 = a7;
  float v96 = a11;
  v97[0] = a10;
  id v74 = a8;
  unint64_t v20 = [v74 count];
  if (v20 >= 4) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = v20;
  }
  long long v87 = 0u;
  uint64_t v88 = 0;
  uint64_t v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v90 = 0u;
  v86[0] = v21;
  v86[1] = 6;
  *(void *)((char *)&v87 + 4) = 0x3F8000003F000000;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v89 = _D0;
  uint64_t v70 = self;
  srlV2Plist = self->_srlV2Plist;
  *(float *)&long long v90 = srlV2Plist->maskThreshold;
  *(void *)((char *)&v90 + 4) = *(void *)&srlV2Plist->targetMedian_I;
  HIDWORD(v90) = LODWORD(srlV2Plist->targetMedian_III);
  long long v91 = *(_OWORD *)&srlV2Plist->targetMedian_IV;
  long long v92 = *(_OWORD *)&srlV2Plist->maxBoost_II;
  *(float *)&long long v93 = srlV2Plist->maxBoost_VI;
  *(void *)((char *)&v93 + 4) = *(void *)&srlV2Plist->minFaceSize;
  HIDWORD(v93) = LODWORD(srlV2Plist->minCurveBoost);
  long long v94 = *(_OWORD *)&srlV2Plist->maxTargetRatioDarkening;
  *(float *)&uint64_t v95 = srlV2Plist->faceExpDifThreshold;
  BYTE4(v95) = srlV2Plist->relightOnlyPersonMask;
  BYTE5(v95) = 1;
  uint64_t v73 = v21;
  if (v21)
  {
    uint64_t v28 = 0;
    p_srlV2FaceHistogramLivePhotos = &self[1]._srlV2FaceHistogramLivePhotos;
    do
    {
      v30 = objc_msgSend(v74, "objectAtIndexedSubscript:", v28, v65);
      v31 = [v30 faceAttributes];
      [v30 boundingBox];
      double v33 = v32;
      v34 = [v31 facemaskCategory];
      uint64_t v35 = [v34 label];
      v36 = [v35 identifier];
      int v37 = [v36 isEqualToString:@"UNKNOWN_17_unknown0"];

      [v30 boundingBox];
      double v39 = v38;
      if (v37)
      {
        [v30 boundingBox];
        float v42 = v41;
        float v40 = v39;
        double v39 = fminf((float)(v42 / 2.5) + v40, 1.0);
      }
      [v30 boundingBox];
      [v30 boundingBox];
      long long v43 = *(_OWORD *)&a12->c;
      v85[0] = *(_OWORD *)&a12->a;
      v85[1] = v43;
      v85[2] = *(_OWORD *)&a12->tx;
      +[PTEffectUtil rotateNormalizedRect:transform:inverse:](PTEffectUtil, "rotateNormalizedRect:transform:inverse:", v85, 1, v33, v39);
      v45.f64[1] = v44;
      uint64_t v46 = (float32x2_t *)((char *)&v70[1] + 48 * v28);
      v48.f64[1] = v47;
      *uint64_t v46 = vcvt_f32_f64(v45);
      v46[1] = vcvt_f32_f64(v48);
      uint64_t v49 = [v30 yaw];
      [v49 floatValue];
      float32_t v51 = (float)(v50 * 3.0) / 1.57079633;
      v46[5].f32[0] = v51;

      uint64_t v52 = [v31 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
      uint64_t v53 = [v52 allLabelsWithConfidences];

      if ([v53 count])
      {
        unint64_t v54 = 0;
        do
        {
          uint64_t v55 = [v53 objectAtIndexedSubscript:v54];
          [v55 confidence];
          *((_DWORD *)p_srlV2FaceHistogramLivePhotos + v54) = v56;

          ++v54;
        }
        while (v54 < [v53 count]);
      }

      ++v28;
      p_srlV2FaceHistogramLivePhotos += 6;
    }
    while (v28 != v73);
  }
  uint64_t v57 = objc_msgSend(v71, "computeCommandEncoder", v65);
  unint64_t v58 = [(MTLComputePipelineState *)v70->_srlV2GlobalHistogramLivePhotos maxTotalThreadsPerThreadgroup];
  unint64_t v59 = [(MTLComputePipelineState *)v70->_srlV2FaceHistogramLivePhotos maxTotalThreadsPerThreadgroup];
  if (v58 >= v59) {
    unint64_t v60 = v59;
  }
  else {
    unint64_t v60 = v58;
  }
  float v61 = log2f((float)(v60 >> 6));
  float v62 = exp2f(floorf(v61));
  if ((unint64_t)v62 >= 0x40) {
    unint64_t v63 = 64;
  }
  else {
    unint64_t v63 = (unint64_t)v62;
  }
  [v57 setTexture:v69 atIndex:1];
  [v57 setTexture:v68 atIndex:2];
  [v57 setTexture:v67 atIndex:5];
  [v57 setTexture:v66 atIndex:6];
  [v57 setBytes:v86 length:128 atIndex:0];
  [v57 setBytes:&v70[1] length:48 * v73 atIndex:1];
  [v57 setBytes:v97 length:4 atIndex:7];
  [v57 setBytes:&v96 length:4 atIndex:8];
  [v57 setBuffer:v70->_srlV2GlobalStatsBuffer offset:0 atIndex:2];
  [v57 setBuffer:v70->_srlV2FaceStatsBuffer offset:0 atIndex:3];
  [v57 setBuffer:v70->_srlV2CoeffsBuffer offset:0 atIndex:4];
  [v57 setComputePipelineState:v70->_srlV2GlobalHistogramLivePhotos];
  int64x2_t v72 = vdupq_n_s64(1uLL);
  int64x2_t v83 = v72;
  uint64_t v84 = 1;
  v82[0] = 64;
  v82[1] = v63;
  v82[2] = 1;
  [v57 dispatchThreadgroups:&v83 threadsPerThreadgroup:v82];
  [v57 setComputePipelineState:v70->_srlV2FaceHistogramLivePhotos];
  v79[2] = 1;
  uint64_t v80 = v73;
  int64x2_t v81 = v72;
  v79[0] = 64;
  v79[1] = v63;
  [v57 dispatchThreadgroups:&v80 threadsPerThreadgroup:v79];
  [v57 setComputePipelineState:v70->_srlV2CalcCoefficientsLivePhotos];
  int64x2_t v77 = v72;
  uint64_t v78 = 1;
  uint64_t v75 = [(MTLComputePipelineState *)v70->_srlV2CalcCoefficientsLivePhotos threadExecutionWidth];
  int64x2_t v76 = v72;
  [v57 dispatchThreadgroups:&v77 threadsPerThreadgroup:&v75];
  [v57 endEncoding];

  return 0;
}

- (id)srlV2CoeffsBuffer
{
  return self->_srlV2CoeffsBuffer;
}

- (id)samplePosDebug
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistSRL, 0);
  objc_storeStrong((id *)&self->_srlV2Plist, 0);
  objc_storeStrong((id *)&self->_srlV2CoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2FaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficientsLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogramLivePhotos, 0);

  objc_storeStrong((id *)&self->_srlV2GlobalHistogramLivePhotos, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(os_log_t)log effectUtil:prewarmOnly:.cold.7(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "newBufferWithLength failed", v1, 2u);
}

- (void)initWithMetalContext:(os_log_t)log effectUtil:prewarmOnly:.cold.8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Cannot load plist", v1, 2u);
}

@end