@interface VISISPMeshGeneratorV2
- (NSData)ISPMeshParams;
- (VISISPMeshGeneratorV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4;
- (__n128)gridSize;
- (__n128)inputSize;
- (__n128)outputSize;
- (int)generateMeshWithTransforms:(float *)(a3 transforms3x3:validBufferRect:ltmLUT:;
- (int)setup;
- (void)dealloc;
- (void)setGridSize:(VISISPMeshGeneratorV2 *)self;
- (void)setInputSize:(VISISPMeshGeneratorV2 *)self;
- (void)setOutputSize:(VISISPMeshGeneratorV2 *)self;
@end

@implementation VISISPMeshGeneratorV2

- (VISISPMeshGeneratorV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VISISPMeshGeneratorV2;
  v9 = [(VISISPMeshGeneratorV2 *)&v23 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_metalContext, a3);
  metalContext = v10->_metalContext;
  if (!metalContext)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v12 andOptionalCommandQueue:v8];
    v14 = v10->_metalContext;
    v10->_metalContext = v13;

    metalContext = v10->_metalContext;
    if (!metalContext) {
      goto LABEL_10;
    }
  }
  if (v8)
  {
    [(FigMetalContext *)metalContext setCommandQueue:v8];
    metalContext = v10->_metalContext;
  }
  v15 = [(FigMetalContext *)metalContext device];
  v16 = (MTLBuffer *)[v15 newBufferWithLength:648652 options:0];
  meshParamsBuffer = v10->_meshParamsBuffer;
  v10->_meshParamsBuffer = v16;

  v18 = v10->_meshParamsBuffer;
  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v19 = +[NSData dataWithBytesNoCopy:[(MTLBuffer *)v18 contents] length:648652 freeWhenDone:0];
  ISPMeshParams = v10->_ISPMeshParams;
  v10->_ISPMeshParams = (NSData *)v19;

  if (v10->_ISPMeshParams) {
    v21 = v10;
  }
  else {
LABEL_10:
  }
    v21 = 0;

  return v21;
}

- (void)dealloc
{
  free(*(void **)self->_inputPoints);
  v3.receiver = self;
  v3.super_class = (Class)VISISPMeshGeneratorV2;
  [(VISISPMeshGeneratorV2 *)&v3 dealloc];
}

- (int)setup
{
  return 0;
}

- (int)generateMeshWithTransforms:(float *)(a3 transforms3x3:validBufferRect:ltmLUT:
{
  double v6 = v5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a5;
  v13 = [(NSData *)self->_ISPMeshParams bytes];
  if (*(unsigned __int16 *)self->_inputSize >= *(unsigned __int16 *)self->_outputSize
    && *(unsigned __int16 *)&self->_inputSize[2] >= *(unsigned __int16 *)&self->_outputSize[2])
  {
    v17 = v13;
    _DWORD *v13 = 1;
    *((_WORD *)v13 + 2) = y;
    *((_WORD *)v13 + 3) = width;
    *((_WORD *)v13 + 4) = height;
    *((_WORD *)v13 + 5) = v6;
    v13[3] = 0;
    *((_WORD *)v13 + 8) = *(_WORD *)self->_outputSize;
    *((_WORD *)v13 + 9) = *(_WORD *)&self->_outputSize[2];
    *((unsigned char *)v13 + 20) = 1;
    v13[6] = 0;
    unsigned __int16 v18 = *(_WORD *)self->_gridSize;
    v75 = v12;
    if (v18)
    {
      uint32x2_t v19 = *(uint32x2_t *)&x;
      int v20 = HIDWORD(x);
    }
    else
    {
      int v20 = 0;
      unsigned __int16 v18 = *(_WORD *)self->_outputSize;
      uint32x2_t v19 = *(uint32x2_t *)&x;
    }
    int32x2_t v21 = (int32x2_t)vmax_u32(v19, (uint32x2_t)0x200000002);
    int v22 = *(unsigned __int16 *)&self->_outputSize[2];
    if (*(_WORD *)&self->_gridSize[2]) {
      unsigned __int16 v23 = *(_WORD *)&self->_gridSize[2];
    }
    else {
      unsigned __int16 v23 = *(_WORD *)&self->_outputSize[2];
    }
    int v24 = *(unsigned __int16 *)self->_inputSize;
    int v25 = *(unsigned __int16 *)self->_outputSize;
    int v26 = *(unsigned __int16 *)&self->_inputSize[2];
    v27 = *(void **)self->_inputPoints;
    int32x2_t v77 = v21;
    if (v27)
    {
      if (*(void *)&v21 == __PAIR64__(*(unsigned __int16 *)&self->_inputPointsCount[2], *(unsigned __int16 *)self->_inputPointsCount))goto LABEL_16; {
      *(void *)self->_inputPoints = 0;
      }
      free(v27);
      int32x2_t v21 = v77;
    }
    *(_WORD *)&self->_inputPointsCount[2] = v21.i16[2];
    *(_WORD *)self->_inputPointsCount = v21.i16[0];
    v28 = malloc_type_malloc(16 * vmul_lane_s32(v21, v21, 1).u32[0], 0x1000040451B5BE8uLL);
    int32x2_t v21 = v77;
    *(void *)self->_inputPoints = v28;
    if (!v28)
    {
      v73 = 0;
      int v74 = 0;
      id v12 = v75;
      goto LABEL_32;
    }
LABEL_16:
    unsigned int v29 = 0;
    int v30 = 0;
    int v31 = v24 - v25;
    v32 = v17 + 23787;
    __asm { FMOV            V0.4S, #1.0 }
    _Q0.f32[0] = (float)v31 * 0.5;
    _Q0.f32[1] = (float)(v26 - v22) * 0.5;
    uint64_t v37 = v21.u32[0];
    __int32 v38 = v21.i32[1];
    id v12 = v75;
    do
    {
      unsigned int v39 = 0;
      uint64_t v40 = v37;
      int v41 = v30;
      unsigned int v42 = v29;
      do
      {
        v43 = &(*a3)[9 * v41];
        v44.i64[0] = *(void *)v43;
        v14.f32[0] = v43[2];
        *(float *)&unint64_t v45 = (float)v39;
        v15.i64[0] = *((void *)v43 + 3);
        int32x2_t v46 = vzip1_s32(*(int32x2_t *)v43, *(int32x2_t *)v15.i8);
        *((float *)&v45 + 1) = (float)(v30 * v23);
        *(int32x2_t *)v47.f32 = vzip1_s32(v46, *(int32x2_t *)(v43 + 3));
        *(int32x2_t *)&v47.u32[2] = vdup_lane_s32(v46, 1);
        float32x4_t v48 = vaddq_f32(_Q0, (float32x4_t)v45);
        v44.i64[1] = *(void *)(v43 + 3);
        v14.f32[1] = v43[5];
        v14.f32[2] = v43[8];
        *(float32x4_t *)(*(void *)self->_inputPoints + 16 * v42++) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, v48.f32[0]), (float32x4_t)vuzp2q_s32(v44, v15), *(float32x2_t *)v48.f32, 1), v14, v48, 2);
        v41 += v20;
        v39 += v18;
        --v40;
      }
      while (v40);
      ++v30;
      v29 += v37;
    }
    while (v30 != v38);
    unsigned int v49 = 0;
    int v50 = 0;
    unsigned int v52 = (*(unsigned __int16 *)&self->_outputSize[2] + 31) >> 5;
    unsigned int v53 = ((*(unsigned __int16 *)self->_outputSize + 31) >> 5) + 1;
    do
    {
      unsigned int v54 = 0;
      int v55 = 4 * v50;
      do
      {
        v56.f32[0] = (float)v54 * 32.0;
        v56.f32[1] = (float)v49 * 32.0;
        v57.i32[0] = *(unsigned __int16 *)self->_inputPointsCount;
        v57.i32[1] = *(unsigned __int16 *)&self->_inputPointsCount[2];
        v51.f32[1] = (float)v23;
        v51.f32[0] = (float)v18;
        float32x2_t v58 = vdiv_f32(v56, v51);
        float32x2_t v59 = vrndm_f32(v58);
        float32x2_t v60 = vcvt_f32_s32(vadd_s32(v57, (int32x2_t)0x100000001));
        uint32x2_t v61 = (uint32x2_t)vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v60, v59), (int8x8_t)v59, (int8x8_t)v60));
        float32x2_t v62 = vsub_f32(v58, vcvt_f32_u32(v61));
        uint64_t v63 = *(void *)self->_inputPoints;
        float32x4_t v64 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)(v63+ 16* (v37 * v61.i32[1] + (unsigned __int16)(v61.i16[0] + 1))), (float)(1.0 - v62.f32[1]) * v62.f32[0]), *(float32x4_t *)(v63 + 16 * (v37 * v61.i32[1] + v61.i32[0])), (float)(1.0 - v62.f32[0]) * (float)(1.0 - v62.f32[1])), *(float32x4_t *)(v63 + 16 * (v37 * (unsigned __int16)(v61.i16[2] + 1) + v61.i32[0])), vmuls_lane_f32(1.0 - v62.f32[0], v62, 1)), *(float32x4_t *)(v63+ 16* (v37 * (unsigned __int16)(v61.i16[2] + 1)+ (unsigned __int16)(v61.i16[0] + 1))), vmuls_lane_f32(v62.f32[0], v62, 1));
        int v65 = v50 + 1;
        v17[v50 + 7] = (float)((float)(256.0 * v64.f32[0]) / v64.f32[2]);
        v50 += 2;
        v17[v65 + 7] = (float)(vmuls_lane_f32(256.0, *(float32x2_t *)v64.f32, 1) / v64.f32[2]);
        ++v54;
        v55 += 8;
      }
      while (v53 != v54);
    }
    while (v49++ != v52);
    v17[6] = v55;
    _DWORD *v32 = 1;
    *((unsigned char *)v17 + 95174) = 0;
    if (v75)
    {
      unint64_t v66 = (unint64_t)[v75 width] / 0x41;
      unsigned int v67 = [v75 height];
      v17[23788] = 0;
      v17[23789] = 0;
      v17[23790] = (v66 + *(unsigned __int16 *)self->_inputSize - 1) / v66;
      v17[23791] = (v67 + *(unsigned __int16 *)&self->_inputSize[2] - 1) / v67;
      *((_WORD *)v17 + 47584) = v66;
      *((_WORD *)v17 + 47585) = v67;
      unsigned __int16 v68 = (unsigned __int16)[v75 width];
      *((_WORD *)v17 + 47586) = 2 * v68;
      v17[23794] = (unsigned __int16)(2 * v68) * [v75 height];
      if ((v17[23793] & 0x3F) != 0)
      {
        v73 = 0;
      }
      else
      {
        v69 = [(FigMetalContext *)self->_metalContext commandQueue];
        v73 = [v69 commandBuffer];

        if (v73)
        {
          uint64_t v70 = [v73 blitCommandEncoder];
          if (v70)
          {
            v71 = (void *)v70;
            memset(v79, 0, sizeof(v79));
            v78[0] = [v75 width];
            v78[1] = [v75 height];
            v78[2] = 1;
            [v71 copyFromTexture:v75 sourceSlice:0 sourceLevel:0 sourceOrigin:v79 sourceSize:v78 toBuffer:self->_meshParamsBuffer destinationOffset:95180 destinationBytesPerRow:*((unsigned __int16 *)v32 + 12) destinationBytesPerImage:0];
            [v71 endEncoding];
            [v73 commit];
            [v73 waitUntilCompleted];
            *((unsigned char *)v32 + 26) = 1;

LABEL_31:
            int v74 = 0;
            goto LABEL_32;
          }
        }
      }
      int v74 = -12782;
      goto LABEL_32;
    }
    v73 = 0;
    goto LABEL_31;
  }
  v73 = 0;
  int v74 = -12780;
LABEL_32:

  return v74;
}

- (__n128)inputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 40);
  WORD2(v1) = *(_WORD *)(a1 + 42);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setInputSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_inputSize = v2;
}

- (__n128)outputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 44);
  WORD2(v1) = *(_WORD *)(a1 + 46);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setOutputSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_outputSize = v2;
}

- (__n128)gridSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 48);
  WORD2(v1) = *(_WORD *)(a1 + 50);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setGridSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_gridSize = v2;
}

- (NSData)ISPMeshParams
{
  return self->_ISPMeshParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISPMeshParams, 0);
  objc_storeStrong((id *)&self->_meshParamsBuffer, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end