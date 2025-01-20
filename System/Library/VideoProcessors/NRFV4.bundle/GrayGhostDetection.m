@interface GrayGhostDetection
+ (int)prewarmShaders:(id)a3;
- (GrayGhostDetection)initWithMetalContext:(id)a3;
- (float)getGrayGhostResultSync;
- (int)runGrayGhostDetection:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 hasChromaBias:(BOOL)a7 atBand:(int)a8 params:(const GrayGhostParams *)a9;
- (int)runGrayGhostDetectionWithRGBEvmTexture:(id)a3 withRGBEv0Texture:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 params:(const GrayGhostParams *)a7;
@end

@implementation GrayGhostDetection

- (GrayGhostDetection)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GrayGhostDetection;
  v6 = [(GrayGhostDetection *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[GrayGhostDetectionShared sharedInstance];
    uint64_t v9 = [v8 getShaders:v7->_metal];
    shaders = v7->_shaders;
    v7->_shaders = (GrayGhostDetectionShaders *)v9;

    if (!v7->_shaders) {
      goto LABEL_7;
    }
    v11 = [(FigMetalContext *)v7->_metal device];
    uint64_t v12 = [v11 newBufferWithLength:4 options:0];
    grayGhostCountBuffer = v7->_grayGhostCountBuffer;
    v7->_grayGhostCountBuffer = (MTLBuffer *)v12;

    v14 = v7->_grayGhostCountBuffer;
    if (v14)
    {
      *(_DWORD *)[(MTLBuffer *)v14 contents] = 0;
    }
    else
    {
LABEL_7:
      FigDebugAssert3();
      int v18 = FigSignalErrorAt();
      v15 = 0;
      if (v18) {
        goto LABEL_6;
      }
    }
  }
  v15 = v7;
LABEL_6:
  v16 = v15;

  return v16;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[GrayGhostDetectionShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)runGrayGhostDetection:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 hasChromaBias:(BOOL)a7 atBand:(int)a8 params:(const GrayGhostParams *)a9
{
  v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (self->_pendingResultCommandBuffer
    || (*(_DWORD *)[(MTLBuffer *)self->_grayGhostCountBuffer contents] = 0, !a9)
    || ([(FigMetalContext *)self->_metal commandQueue],
        objc_super v19 = objc_claimAutoreleasedReturnValue(),
        [v19 commandBuffer],
        v20 = objc_claimAutoreleasedReturnValue(),
        v19,
        !v20))
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
    goto LABEL_9;
  }
  v21 = [v20 computeCommandEncoder];
  if (!v21)
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
LABEL_14:

    goto LABEL_9;
  }
  v22 = v21;
  BOOL v60 = a7;
  id v61 = v16;
  [v21 setComputePipelineState:self->_shaders->_computeGrayGhostCount];
  v23 = [v17 meta];
  char v24 = [v23 isEVMFrame];

  if ((v24 & 1) == 0
    || ([v18 meta],
        v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v25 isEVMFrame],
        v25,
        v26))
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();

    id v16 = v61;
    goto LABEL_9;
  }
  id v16 = v61;
  if (!a8)
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();

    goto LABEL_14;
  }
  v59 = v20;
  v27 = v17;
  v28 = (void *)v15[a8 + 42];
  v29 = (void *)v15[a8 + 62];
  v62 = v18;
  v30 = (void *)*((void *)v61 + a8 + 42);
  id v31 = *((id *)v61 + a8 + 62);
  id v32 = v30;
  id v58 = v29;
  id v33 = v28;
  [v22 setTexture:v33 atIndex:0];
  [v22 setTexture:v58 atIndex:1];
  [v22 setTexture:v32 atIndex:2];
  [v22 setTexture:v31 atIndex:3];
  [v27 meta];
  v35 = v34 = v15;
  uint64_t v36 = [v35 exposureParams];
  v37 = [v62 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v36, [v37 exposureParams], v27);

  uint64_t v39 = [v31 width];
  uint64_t v40 = [v31 width];
  uint64_t v41 = [v31 height];
  uint64_t v42 = [v31 height];
  v43.i64[0] = v41;
  v15 = v34;
  v43.i64[1] = v42;
  v44.i64[0] = v39;
  v44.i64[1] = v40;
  long long v67 = 0u;
  uint32x4_t v68 = 0u;
  uint32x4_t v57 = vcvtq_u32_f32(vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v44)), vcvtq_f64_u64(v43)), (float32x4_t)xmmword_263480470));
  long long v69 = 0u;
  long long v70 = 0u;
  v45 = (_OWORD *)[v27 regHomography];
  long long v47 = v45[1];
  long long v46 = v45[2];
  v66[0] = *v45;
  v66[1] = v47;
  v66[2] = v46;
  v48 = (_OWORD *)[v62 regHomography];
  long long v50 = v48[1];
  long long v49 = v48[2];
  v66[3] = *v48;
  v66[4] = v50;
  v66[5] = v49;
  *(float *)&long long v67 = RelativeBrightnessForProperties;
  uint32x4_t v68 = v57;
  long long v69 = xmmword_2634805C0;
  LOBYTE(v70) = v60;
  *(GrayGhostParams *)((char *)&v70 + 4) = *a9;
  [v22 setBytes:v66 length:160 atIndex:0];
  [v22 setBuffer:self->_grayGhostCountBuffer offset:0 atIndex:1];
  v65[0] = [v31 width];
  v65[1] = [v31 height];
  v65[2] = 1;
  int64x2_t v63 = vdupq_n_s64(8uLL);
  uint64_t v64 = 1;
  [v22 dispatchThreads:v65 threadsPerThreadgroup:&v63];
  [v22 endEncoding];
  [v59 commit];
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  self->_pendingResultCommandBuffer = (MTLCommandBuffer *)v59;
  id v52 = v59;

  uint64_t v53 = [v32 width];
  unint64_t v54 = [v32 height] * v53;
  id v18 = v62;
  self->_totalPixels = v54;

  id v16 = v61;
  id v17 = v27;
  int v55 = 0;
LABEL_9:

  return v55;
}

- (int)runGrayGhostDetectionWithRGBEvmTexture:(id)a3 withRGBEv0Texture:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 params:(const GrayGhostParams *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v50 = a6;
  if (self->_pendingResultCommandBuffer
    || (*(_DWORD *)[(MTLBuffer *)self->_grayGhostCountBuffer contents] = 0, !a7)
    || ([(FigMetalContext *)self->_metal commandQueue],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v15 commandBuffer],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v16))
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
LABEL_11:
    v22 = v50;
    goto LABEL_8;
  }
  id v17 = [v16 computeCommandEncoder];
  if (!v17)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();

    goto LABEL_11;
  }
  id v18 = v17;
  id v19 = v12;
  [v17 setComputePipelineState:self->_shaders->_computeGrayGhostCountRGB];
  long long v49 = v14;
  v20 = [v14 meta];
  char v21 = [v20 isEVMFrame];

  if (v21)
  {
    v22 = v50;
    v23 = [v50 meta];
    int v24 = [v23 isEVMFrame];

    if (v24)
    {
      FigDebugAssert3();
      int v45 = FigSignalErrorAt();

      id v12 = v19;
      id v14 = v49;
    }
    else
    {
      v48 = v19;
      [v18 setTexture:v19 atIndex:0];
      [v18 setTexture:v13 atIndex:1];
      v25 = [v49 meta];
      uint64_t v26 = [v25 exposureParams];
      v27 = [v50 meta];
      float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v26, [v27 exposureParams], v49);

      uint64_t v29 = [v13 width];
      uint64_t v30 = [v13 width];
      uint64_t v31 = [v13 height];
      uint64_t v32 = [v13 height];
      v33.i64[0] = v31;
      id v14 = v49;
      v33.i64[1] = v32;
      v34.i64[0] = v29;
      v34.i64[1] = v30;
      float32x4_t v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v34)), vcvtq_f64_u64(v33));
      v33.i64[0] = 0x3F0000003F000000;
      v33.i64[1] = 0x3F0000003F000000;
      long long v55 = 0u;
      uint32x4_t v56 = 0u;
      uint32x4_t v47 = vcvtq_u32_f32(vmulq_f32(vmulq_f32(v35, (float32x4_t)v33), (float32x4_t)xmmword_263480470));
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v36 = (_OWORD *)[v49 regHomography];
      long long v38 = v36[1];
      long long v37 = v36[2];
      v54[0] = *v36;
      v54[1] = v38;
      v54[2] = v37;
      uint64_t v39 = (_OWORD *)[v50 regHomography];
      long long v41 = v39[1];
      long long v40 = v39[2];
      v54[3] = *v39;
      v54[4] = v41;
      v54[5] = v40;
      *(float *)&long long v55 = RelativeBrightnessForProperties;
      uint32x4_t v56 = v47;
      long long v57 = xmmword_2634805C0;
      HIDWORD(v58) = LODWORD(a7->var2);
      *(void *)((char *)&v58 + 4) = *(void *)&a7->var0;
      [v18 setBytes:v54 length:160 atIndex:0];
      [v18 setBuffer:self->_grayGhostCountBuffer offset:0 atIndex:1];
      v53[0] = (unint64_t)[v13 width] >> 1;
      v53[1] = (unint64_t)[v13 height] >> 1;
      v53[2] = 1;
      int64x2_t v51 = vdupq_n_s64(8uLL);
      uint64_t v52 = 1;
      [v18 dispatchThreads:v53 threadsPerThreadgroup:&v51];
      [v18 endEncoding];
      [v16 commit];
      pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
      self->_pendingResultCommandBuffer = (MTLCommandBuffer *)v16;
      id v43 = v16;

      uint64_t v44 = [v13 width];
      self->_totalPixels = [v13 height] * v44;

      id v12 = v48;
      int v45 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();

    id v12 = v19;
    id v14 = v49;
    v22 = v50;
  }
LABEL_8:

  return v45;
}

- (float)getGrayGhostResultSync
{
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  if (pendingResultCommandBuffer)
  {
    [(MTLCommandBuffer *)pendingResultCommandBuffer waitUntilCompleted];
    v4 = self->_pendingResultCommandBuffer;
    self->_pendingResultCommandBuffer = 0;
  }
  return (float)*(unsigned int *)[(MTLBuffer *)self->_grayGhostCountBuffer contents]
       / (float)self->_totalPixels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayGhostCountBuffer, 0);
  objc_storeStrong((id *)&self->_pendingResultCommandBuffer, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end