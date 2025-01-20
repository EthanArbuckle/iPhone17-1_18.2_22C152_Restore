@interface RepairWeightsGenerator
- ($E04785D6C22F149E9B1B648872290F90)configuration;
- (RepairWeightsGenerator)initWithConfiguration:(id *)a3 withToolBox:(id)a4 homographyHandle:(id)a5 imageDimensions:(id)a6;
- (int64_t)process:(__CVBuffer *)a3 info:(id)a4 metaContainerBuffer:(id)a5 computeBlendingWeights:(BOOL)a6 futureFrames:(id *)a7;
- (int64_t)updateQueuesWithInputFrame:(__CVBuffer *)a3 info:(id)a4 meta:(id)a5 index:(signed __int16)a6;
- (int64_t)updateQueuesWithTwoFutureFrames:(id *)a3 atBaseIndex:(signed __int16)a4;
- (signed)getFrameIndexInQueue;
- (signed)roiClusterCnt;
- (void)_computeBlendingWeightsYUVInput:(id)a3 frRefTPlusOrMinus1:(id)a4 frRefTPlusOrMinus2:(id)a5 trRefTPlusOrMinus1:(id)a6 trRefTPlusOrMinus2:(id)a7 meta:(id)a8 metaTPlusOrMinus1:(id)a9 metaTPlusOrMinus2:(id)a10 info:(id)a11 infoTPlusOrMinus1:(id)a12 infoTPlusOrMinus2:(id)a13 config:(id *)a14 trInput:(id)a15 usePastAsRef:(BOOL)a16;
- (void)cleanTwoFutureFramesInQueuesAtBaseIndex:(signed __int16)a3;
- (void)computeBlendingWeights;
- (void)computeBlendingWeightsWithFuture;
- (void)dealloc;
- (void)reset;
- (void)setConfiguration:(id *)a3;
- (void)setRoiClusterCnt:(signed __int16)a3;
@end

@implementation RepairWeightsGenerator

- (RepairWeightsGenerator)initWithConfiguration:(id *)a3 withToolBox:(id)a4 homographyHandle:(id)a5 imageDimensions:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)RepairWeightsGenerator;
  v11 = [(RepairWeightsGenerator *)&v37 init];
  v12 = v11;
  if (v11)
  {
    long long v13 = *(_OWORD *)&a3->var0.var0;
    long long v14 = *(_OWORD *)&a3->var0.var7;
    long long v15 = *(_OWORD *)&a3->var1.var4;
    *(_OWORD *)(v11 + 296) = *(_OWORD *)&a3->var1.var0;
    *(_OWORD *)(v11 + 312) = v15;
    *(_OWORD *)(v11 + 264) = v13;
    *(_OWORD *)(v11 + 280) = v14;
    if (v9) {
      v16 = (GGMMetalToolBox *)v9;
    }
    else {
      v16 = objc_alloc_init(GGMMetalToolBox);
    }
    v17 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v16;

    if (v10) {
      v18 = (CalcHomography *)v10;
    }
    else {
      v18 = [[CalcHomography alloc] initWithMetalToolBox:*((void *)v12 + 1)];
    }
    v19 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v18;

    [v12 reset];
    uint64_t v20 = 0;
    while (1)
    {
      uint64_t PixelBuffer = CreatePixelBuffer();
      v22 = &v12[v20];
      *(void *)&v12[v20 + 152] = PixelBuffer;
      if (!PixelBuffer) {
        break;
      }
      v23 = (__CVBuffer *)PixelBuffer;
      v24 = [*((id *)v12 + 1) metalContext];
      uint64_t v25 = sub_10550(v23, v24, 0, 0);
      v26 = (void *)*((void *)v22 + 23);
      *((void *)v22 + 23) = v25;

      if (!*((void *)v22 + 23)) {
        break;
      }
      v20 += 8;
      if (v20 == 32)
      {
        v27 = [*((id *)v12 + 1) getDevice];
        id v28 = [v27 newBufferWithLength:9544 options:0];
        v29 = (void *)*((void *)v12 + 29);
        *((void *)v12 + 29) = v28;

        if (*((void *)v12 + 29))
        {
          uint64_t v30 = CreatePixelBuffer();
          *((void *)v12 + 30) = v30;
          if (v30)
          {
            v31 = (__CVBuffer *)v30;
            v32 = [*((id *)v12 + 1) metalContext];
            uint64_t v33 = sub_10550(v31, v32, 0, 0);
            v34 = (void *)*((void *)v12 + 31);
            *((void *)v12 + 31) = v33;

            if (*((void *)v12 + 31))
            {
              v12[256] = 0;
              v35 = v12;
              goto LABEL_16;
            }
          }
        }
        break;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v35 = 0;
LABEL_16:

  return v35;
}

- (void)reset
{
  self->_roiClusterCnt = 0;
  self->_frameIndexInVideo = 0;
  self->_consecutiveTemporalRepairFrameCnt = 0;
}

- (void)dealloc
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    CVPixelBufferRelease(self->_trRefQueue[i]);
    v4 = self->_inputFrameQueue[i];
    if (v4)
    {
      CFRelease(v4);
      self->_inputFrameQueue[i] = 0;
    }
  }
  CVPixelBufferRelease(self->_temporalMitigated);
  v5.receiver = self;
  v5.super_class = (Class)RepairWeightsGenerator;
  [(RepairWeightsGenerator *)&v5 dealloc];
}

- (signed)getFrameIndexInQueue
{
  return self->_frameIndexInVideo & 3;
}

- (void)_computeBlendingWeightsYUVInput:(id)a3 frRefTPlusOrMinus1:(id)a4 frRefTPlusOrMinus2:(id)a5 trRefTPlusOrMinus1:(id)a6 trRefTPlusOrMinus2:(id)a7 meta:(id)a8 metaTPlusOrMinus1:(id)a9 metaTPlusOrMinus2:(id)a10 info:(id)a11 infoTPlusOrMinus1:(id)a12 infoTPlusOrMinus2:(id)a13 config:(id *)a14 trInput:(id)a15 usePastAsRef:(BOOL)a16
{
  id v22 = a3;
  id v23 = a4;
  id v69 = a5;
  id v72 = a6;
  id v71 = a7;
  id v24 = a8;
  id v66 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v70 = a15;
  v64 = v27;
  v65 = v26;
  v63 = v28;
  if (a14->var1.var1)
  {
    simd_float3 v74 = matrix_identity_float3x3.columns[1];
    simd_float3 v75 = matrix_identity_float3x3.columns[0];
    double v76 = *(double *)v74.i64;
    simd_float3 v77 = matrix_identity_float3x3.columns[0];
    simd_float3 v73 = matrix_identity_float3x3.columns[2];
    double v78 = *(double *)v73.i64;
    v29 = v69;
    goto LABEL_20;
  }
  calcTransform = self->_calcTransform;
  if (a16)
  {
    v29 = v69;
    if (calcTransform)
    {
      [(CalcHomography *)calcTransform ispHomographyFromMetaInfo:v26];
      v31 = self->_calcTransform;
      long long v32 = v91;
      long long v33 = v92;
      long long v34 = v93;
      if (v31)
      {
        [(CalcHomography *)v31 ispHomographyFromMetaInfo:v27];
        long long v33 = v92;
        long long v32 = v91;
        long long v34 = v93;
        float32x4_t v36 = v87;
        float32x4_t v35 = v88;
        float32x4_t v37 = v89;
        goto LABEL_12;
      }
    }
    else
    {
      long long v34 = 0uLL;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v33 = 0uLL;
      long long v32 = 0uLL;
    }
    float32x4_t v37 = 0uLL;
    float32x4_t v89 = 0u;
    long long v90 = 0u;
    float32x4_t v87 = 0u;
    float32x4_t v88 = 0u;
    float32x4_t v35 = 0uLL;
    float32x4_t v36 = 0uLL;
LABEL_12:
    uint64_t v43 = 0;
    double v76 = *(double *)&v33;
    v77.i64[0] = v32;
    long long v95 = v32;
    long long v96 = v33;
    double v78 = *(double *)&v34;
    long long v97 = v34;
    simd_float3 v98 = 0u;
    simd_float3 v99 = 0u;
    simd_float3 v100 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v98 + v43) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(long long *)((char *)&v95 + v43))), v35, *(float32x2_t *)((char *)&v95 + v43), 1), v37, *(float32x4_t *)((char *)&v95 + v43), 2);
      v43 += 16;
    }
    while (v43 != 48);
    v74.i64[0] = v99.i64[0];
    v75.i64[0] = v98.i64[0];
    v73.i64[0] = v100.i64[0];
    goto LABEL_20;
  }
  v29 = v69;
  if (calcTransform)
  {
    [(CalcHomography *)calcTransform ispHomographyFromMetaInfo:v27];
    v38 = self->_calcTransform;
    simd_float3x3 v39 = v85;
    if (v38)
    {
      [(CalcHomography *)v38 ispHomographyFromMetaInfo:v28];
      simd_float3x3 v39 = v85;
      long long v40 = v81;
      long long v41 = v82;
      long long v42 = v83;
      goto LABEL_17;
    }
  }
  else
  {
    v39.columns[2] = 0uLL;
    long long v86 = 0u;
    memset(&v85, 0, sizeof(v85));
    v39.columns[1] = 0uLL;
    v39.columns[0] = 0uLL;
  }
  long long v42 = 0uLL;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v41 = 0uLL;
  long long v40 = 0uLL;
LABEL_17:
  uint64_t v44 = 0;
  long long v95 = v40;
  long long v96 = v41;
  long long v97 = v42;
  simd_float3 v98 = 0u;
  simd_float3 v99 = 0u;
  simd_float3 v100 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v98 + v44) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v39.columns[0], COERCE_FLOAT(*(long long *)((char *)&v95 + v44))), (float32x4_t)v39.columns[1], *(float32x2_t *)((char *)&v95 + v44), 1), (float32x4_t)v39.columns[2], *(float32x4_t *)((char *)&v95 + v44), 2);
    v44 += 16;
  }
  while (v44 != 48);
  simd_float3 v45 = v98;
  simd_float3 v46 = v99;
  simd_float3 v47 = v100;
  v45.i32[3] = 0;
  v46.i32[3] = 0;
  simd_float3 v74 = v46;
  simd_float3 v75 = v45;
  v47.i32[3] = 0;
  simd_float3 v73 = v47;
  simd_float3x3 v101 = __invert_f3(v39);
  double v76 = *(double *)v101.columns[1].i64;
  v77.i64[0] = v101.columns[0].i64[0];
  double v78 = *(double *)v101.columns[2].i64;
  v101.columns[1] = v74;
  v101.columns[0] = v75;
  v101.columns[2] = v73;
  simd_float3x3 v102 = __invert_f3(v101);
  v74.i64[0] = v102.columns[1].i64[0];
  v75.i64[0] = v102.columns[0].i64[0];
  v73.i64[0] = v102.columns[2].i64[0];
LABEL_20:
  metalToolbox = self->_metalToolbox;
  double v49 = (float)(unint64_t)[v22 width];
  v67 = v22;
  id v50 = [v22 height];
  v51 = v24;
  v52 = -[GGMMetalToolBox generateMetaContainerArrayBufFromMetaContainerBuf:imageRect:](metalToolbox, "generateMetaContainerArrayBufFromMetaContainerBuf:imageRect:", v24, 0.0, 0.0, v49, (float)(unint64_t)v50);
  self->_roiClusterCnt = v52->var1;
  v53 = [(GGMMetalToolBox *)self->_metalToolbox metalContext];
  v54 = [v53 commandQueue];
  v55 = [v54 commandBuffer];

  if (v55)
  {
    if (v52->var1 >= 1)
    {
      uint64_t v56 = 0;
      v68 = v55;
      do
      {
        v57 = [v55 computeCommandEncoder];
        id v58 = v23;
        v59 = self->_metalToolbox;
        id v60 = v52->var0[v56];
        v61 = v59;
        id v23 = v58;
        [(GGMMetalToolBox *)v61 getGhostMaxLumaYUVInput:v67 metaBuf:v60 commandEncoder:v57];
        -[GGMMetalToolBox getRefTypeYUVInput:ref0:ref1:metaBuf:meta0Buf:meta1Buf:hmgrphy0:hmgrphy1:commandEncoder:](self->_metalToolbox, "getRefTypeYUVInput:ref0:ref1:metaBuf:meta0Buf:meta1Buf:hmgrphy0:hmgrphy1:commandEncoder:", v67, v58, v69, v60, v66, v25, *(double *)v77.i64, v76, v78, *(double *)v75.i64, *(double *)v74.i64, *(double *)v73.i64, v57);
        v29 = v69;
        -[GGMMetalToolBox strongTemporalRepairYUVInput:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:metaBuf:ref0MetaBuf:ref1MetaBuf:strongTemporalOutput:temporalOutput:commandEncoder:](self->_metalToolbox, "strongTemporalRepairYUVInput:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:metaBuf:ref0MetaBuf:ref1MetaBuf:strongTemporalOutput:temporalOutput:commandEncoder:", v67, v23, v69, v72, v71, v60, *(double *)v77.i64, v76, v78, *(double *)v75.i64, *(double *)v74.i64, *(double *)v73.i64, v66, v25, v70, self->_temporalMitigatedTexture,
          v57);
        [(GGMMetalToolBox *)self->_metalToolbox computeBlendingWeightsYUVInput:v67 temporalRepaired:self->_temporalMitigatedTexture metadataBuf:v60 commandEncoder:v57];
        [(GGMMetalToolBox *)self->_metalToolbox encodeCollectClusterStats:v57 clusterMetaBuf:v60 metaBuf:v51];

        [v57 endEncoding];
        v55 = v68;
        ++v56;
      }
      while (v56 < v52->var1);
    }
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_20DA8;
    v79[3] = &unk_3C6B0;
    id v80 = v51;
    v62 = objc_retainBlock(v79);
    [v55 addCompletedHandler:v62];

    [(GGMMetalToolBox *)self->_metalToolbox commitCmdBuffer:v55 waitForComplete:self->_forceWaitForComputeWeights];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (int64_t)updateQueuesWithInputFrame:(__CVBuffer *)a3 info:(id)a4 meta:(id)a5 index:(signed __int16)a6
{
  int v6 = a6;
  id v11 = a4;
  id v12 = a5;
  long long v13 = v12;
  int64_t v14 = 5;
  if (a3 && v11 && v12)
  {
    long long v15 = &self->super.isa + v6;
    Class v16 = v15[3];
    v15[3] = a3;
    CFRetain(a3);
    if (v16) {
      CFRelease(v16);
    }
    v17 = [(GGMMetalToolBox *)self->_metalToolbox cvMetalTextureCacheRef];
    v18 = [(GGMMetalToolBox *)self->_metalToolbox metalContext];
    sub_108B0(a3, v17, v18, 0, 0);
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      uint64_t v20 = &self->super.isa + v6;
      Class v21 = v20[7];
      v20[7] = v19;
      id v22 = v19;

      objc_storeStrong((id *)v20 + 15, a4);
      objc_storeStrong((id *)v20 + 11, a5);

      int64_t v14 = 0;
    }
    else
    {
      int64_t v14 = 5;
    }
  }

  return v14;
}

- (int64_t)updateQueuesWithTwoFutureFrames:(id *)a3 atBaseIndex:(signed __int16)a4
{
  int v4 = a4;
  uint64_t v7 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v9 = i;
    __int16 v10 = (int)v7 + v4 + 1 < 4 ? v7 + v4 + 1 : (unsigned __int16)v7 + (unsigned __int16)v4 - 3;
    id v11 = (id *)((char *)a3->var0 + 16 * v7);
    id v12 = *v11;
    id v13 = v11[1];
    int64_t v14 = [(RepairWeightsGenerator *)self updateQueuesWithInputFrame:v12 info:v13 meta:self->_dummyMetaBuf index:v10];
    if (v14) {
      break;
    }

    uint64_t v7 = 1;
    if ((v9 & 1) == 0) {
      return v14;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return v14;
}

- (void)cleanTwoFutureFramesInQueuesAtBaseIndex:(signed __int16)a3
{
  int v3 = a3;
  inputTextureQueue = self->_inputTextureQueue;
  inputInfoQueue = self->_inputInfoQueue;
  inputMetaQueue = self->_inputMetaQueue;
  inputFrameQueue = self->_inputFrameQueue;
  char v8 = 1;
  int v9 = 1;
  do
  {
    char v10 = v8;
    int v11 = v9 + v3;
    __int16 v12 = v9 + v3 - 4;
    if (v11 >= 4) {
      __int16 v13 = v12;
    }
    else {
      __int16 v13 = v11;
    }
    uint64_t v14 = v13;
    long long v15 = inputTextureQueue[v14];
    inputTextureQueue[v14] = 0;

    Class v16 = inputInfoQueue[v14];
    inputInfoQueue[v14] = 0;

    v17 = inputMetaQueue[v14];
    inputMetaQueue[v14] = 0;

    v18 = inputFrameQueue[v14];
    if (v18)
    {
      CFRelease(v18);
      inputFrameQueue[v13] = 0;
    }
    char v8 = 0;
    int v9 = 2;
  }
  while ((v10 & 1) != 0);
}

- (void)computeBlendingWeights
{
  int v3 = [(RepairWeightsGenerator *)self getFrameIndexInQueue];
  if (v3 > 0) {
    __int16 v4 = -1;
  }
  else {
    __int16 v4 = 3;
  }
  __int16 v5 = v4 + v3;
  if (v3 < 2) {
    __int16 v6 = 2;
  }
  else {
    __int16 v6 = -2;
  }
  uint64_t v7 = self->_inputTextureQueue[v3];
  uint64_t v8 = (__int16)(v6 + v3);
  int v9 = self->_inputMetaQueue[v5];
  char v10 = self->_inputMetaQueue[v8];
  int v11 = self->_inputInfoQueue[v3];
  __int16 v12 = self->_inputInfoQueue[v5];
  __int16 v13 = self->_inputInfoQueue[v8];
  uint64_t v14 = self->_trRefTexQueue[v3];
  long long v15 = *(_OWORD *)&self->_configuration.internalCfg.enableColorMask;
  v18[0] = *(_OWORD *)&self->_configuration.internalCfg.clipThreshold;
  v18[1] = v15;
  long long v16 = *(_OWORD *)&self->_configuration.externalCfg.frameDelay;
  v18[2] = *(_OWORD *)&self->_configuration.externalCfg.lightMode;
  v18[3] = v16;
  LOBYTE(v17) = 1;
  -[RepairWeightsGenerator _computeBlendingWeightsYUVInput:frRefTPlusOrMinus1:frRefTPlusOrMinus2:trRefTPlusOrMinus1:trRefTPlusOrMinus2:meta:metaTPlusOrMinus1:metaTPlusOrMinus2:info:infoTPlusOrMinus1:infoTPlusOrMinus2:config:trInput:usePastAsRef:](self, "_computeBlendingWeightsYUVInput:frRefTPlusOrMinus1:frRefTPlusOrMinus2:trRefTPlusOrMinus1:trRefTPlusOrMinus2:meta:metaTPlusOrMinus1:metaTPlusOrMinus2:info:infoTPlusOrMinus1:infoTPlusOrMinus2:config:trInput:usePastAsRef:", v7, v9, v10, v11, v12, v13, v18, v14, v17);
}

- (void)computeBlendingWeightsWithFuture
{
  int v3 = [(RepairWeightsGenerator *)self getFrameIndexInQueue];
  __int16 v4 = v3 - 3;
  if (v3 < 3) {
    __int16 v4 = v3 + 1;
  }
  __int16 v5 = self->_inputTextureQueue[v3];
  __int16 v6 = self->_inputTextureQueue[v4];
  if (v3 < 2) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = -2;
  }
  uint64_t v8 = (__int16)(v7 + v3);
  int v9 = self->_inputTextureQueue[v8];
  char v10 = self->_inputMetaQueue[v3];
  int v11 = self->_inputMetaQueue[v4];
  __int16 v12 = self->_inputMetaQueue[v8];
  __int16 v13 = self->_inputInfoQueue[v3];
  uint64_t v14 = self->_inputInfoQueue[v4];
  long long v15 = self->_inputInfoQueue[v8];
  long long v16 = self->_trRefTexQueue[v3];
  long long v17 = *(_OWORD *)&self->_configuration.internalCfg.enableColorMask;
  v20[0] = *(_OWORD *)&self->_configuration.internalCfg.clipThreshold;
  v20[1] = v17;
  long long v18 = *(_OWORD *)&self->_configuration.externalCfg.frameDelay;
  v20[2] = *(_OWORD *)&self->_configuration.externalCfg.lightMode;
  v20[3] = v18;
  LOBYTE(v19) = 0;
  [(RepairWeightsGenerator *)self _computeBlendingWeightsYUVInput:v5 frRefTPlusOrMinus1:v6 frRefTPlusOrMinus2:v9 trRefTPlusOrMinus1:v6 trRefTPlusOrMinus2:v9 meta:v10 metaTPlusOrMinus1:v11 metaTPlusOrMinus2:v12 info:v13 infoTPlusOrMinus1:v14 infoTPlusOrMinus2:v15 config:v20 trInput:v16 usePastAsRef:v19];
}

- (int64_t)process:(__CVBuffer *)a3 info:(id)a4 metaContainerBuffer:(id)a5 computeBlendingWeights:(BOOL)a6 futureFrames:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  unint64_t frameIndexInVideo = self->_frameIndexInVideo;
  int var2 = a7->var2;
  BOOL v17 = frameIndexInVideo < 2 && var2 > 1;
  uint64_t v18 = [(RepairWeightsGenerator *)self getFrameIndexInQueue];
  if (v17
    && (int64_t v19 = [(RepairWeightsGenerator *)self updateQueuesWithTwoFutureFrames:a7 atBaseIndex:v18]) != 0|| (int64_t v19 = [(RepairWeightsGenerator *)self updateQueuesWithInputFrame:a3 info:v12 meta:v13 index:v18]) != 0)
  {
    int64_t v20 = v19;
    fig_log_get_emitter();
    FigDebugAssert3();
    self->_consecutiveTemporalRepairFrameCnt = 0;
    goto LABEL_22;
  }
  if (a6)
  {
    if (var2 > 1 || frameIndexInVideo >= 2)
    {
      if (frameIndexInVideo < 2) {
        [(RepairWeightsGenerator *)self computeBlendingWeightsWithFuture];
      }
      else {
        [(RepairWeightsGenerator *)self computeBlendingWeights];
      }
      ++self->_consecutiveTemporalRepairFrameCnt;
      if (!v17) {
        goto LABEL_21;
      }
    }
    else
    {
      [(GGMMetalToolBox *)self->_metalToolbox computeBlendingWeightsSpatialOnlyYUVInput:self->_inputTextureQueue[(int)v18] metadataBuf:v13];
      self->_consecutiveTemporalRepairFrameCnt = 0;
      if (!v17) {
        goto LABEL_21;
      }
    }
    [(RepairWeightsGenerator *)self cleanTwoFutureFramesInQueuesAtBaseIndex:v18];
LABEL_21:
    int64_t v20 = 0;
    goto LABEL_22;
  }
  self->_consecutiveTemporalRepairFrameCnt = 0;
  int64_t v20 = 0;
  *((unsigned char *)[v13 contents] + 9536) = 1;
LABEL_22:
  ++self->_frameIndexInVideo;

  return v20;
}

- ($E04785D6C22F149E9B1B648872290F90)configuration
{
  long long v3 = *(_OWORD *)&self[4].var0.var10;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var2;
  *(_OWORD *)&retstr->var0.var7 = v3;
  long long v4 = *(_OWORD *)&self[4].var1.var9;
  *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&self[4].var1.var2;
  *(_OWORD *)&retstr->var1.var4 = v4;
  return self;
}

- (void)setConfiguration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var7;
  long long v5 = *(_OWORD *)&a3->var1.var4;
  *(_OWORD *)&self->_configuration.externalCfg.lightMode = *(_OWORD *)&a3->var1.var0;
  *(_OWORD *)&self->_configuration.externalCfg.frameDelay = v5;
  *(_OWORD *)&self->_configuration.internalCfg.clipThreshold = v3;
  *(_OWORD *)&self->_configuration.internalCfg.enableColorMask = v4;
}

- (signed)roiClusterCnt
{
  return self->_roiClusterCnt;
}

- (void)setRoiClusterCnt:(signed __int16)a3
{
  self->_roiClusterCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalMitigatedTexture, 0);
  objc_storeStrong((id *)&self->_dummyMetaBuf, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_trRefTexQueue[i + 3], 0);
  for (uint64_t j = 0; j != -4; --j)
    objc_storeStrong((id *)&self->_inputInfoQueue[j + 3], 0);
  for (uint64_t k = 0; k != -4; --k)
    objc_storeStrong((id *)&self->_inputMetaQueue[k + 3], 0);
  for (uint64_t m = 80; m != 48; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  objc_storeStrong((id *)&self->_calcTransform, 0);

  objc_storeStrong((id *)&self->_metalToolbox, 0);
}

@end