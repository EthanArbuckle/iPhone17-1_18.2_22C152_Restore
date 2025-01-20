@interface RegPyrFusion
+ (int)prewarmShaders:(id)a3;
+ (void)calculatePyramidDimensions:(float)a3 pyrWidths:(int *)a4 pyrHeights:(int *)a5 topLevelIndex:(int)a6 maxDim:(int)a7 minDim:(int)a8;
+ (void)prewarmRenderers:(id)a3;
- (MTLTexture)confidenceMap;
- (MTLTexture)shiftMap;
- (RegPyrFusion)fusionWithCommandBuffer:(id)a3 refTex:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10;
- (RegPyrFusion)initWithMetalContext:(id)a3;
- (int)basicSearchWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10;
- (int)bilinearScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTexIn:(id)a5 refTexOut:(id)a6 nonRefTexIn:(id)a7 nonRefTexOut:(id)a8 pyrLevel:(int)a9;
- (int)confidenceMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 shiftMap:(id)a5 confidenceOut:(id)a6;
- (int)generateDerivativesWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 inputTex:(id)a5 outputTex:(id)a6;
- (int)initialDownScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTex:(id)a5 nonRefTex:(id)a6 refTexOut:(id)a7 nonRefTexOut:(id)a8 refCamType:(int)a9;
- (int)registerImagesWithReference:(id)a3 nonRef:(id)a4 refTexlvl1:(id)a5 nonRefTexlvl1:(id)a6 shiftMap:(id)a7 confidenceMap:(id)a8;
- (int)selectionWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10;
- (int)setupPyramidScalersUsingCalib;
- (int)smoothShiftMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 input:(id)a5 output:(id)a6;
- (void)reset;
- (void)scaleHomographyUsingCalib:(id *)a3 to:(id *)a4;
@end

@implementation RegPyrFusion

- (RegPyrFusion)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)RegPyrFusion;
  v6 = [(RegPyrFusion *)&v34 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_metal, a3), v7->_metal))
  {
    v8 = objc_opt_new();
    v9 = v8;
    if (v8)
    {
      [v8 setStorageMode:0];
      [v9 setHazardTrackingMode:2];
      [v9 setSize:20480];
      v10 = [(FigMetalContext *)v7->_metal device];
      uint64_t v11 = [v10 newHeapWithDescriptor:v9];
      uniformsHeap = v7->_uniformsHeap;
      v7->_uniformsHeap = (MTLHeap *)v11;

      if (v7->_uniformsHeap)
      {
        pyrHomographyTeleIsRef = v7->_pyrHomographyTeleIsRef;
        pyrHomographyWideIsRef = v7->_pyrHomographyWideIsRef;
        LODWORD(v15) = 21;
        while (1)
        {
          uint64_t v15 = (v15 - 1);
          uint64_t v16 = [(MTLHeap *)v7->_uniformsHeap newBufferWithLength:48 options:[(MTLHeap *)v7->_uniformsHeap resourceOptions]];
          v17 = pyrHomographyTeleIsRef[v15];
          pyrHomographyTeleIsRef[v15] = (MTLBuffer *)v16;

          if (!pyrHomographyTeleIsRef[v15]) {
            break;
          }
          uint64_t v18 = [(MTLHeap *)v7->_uniformsHeap newBufferWithLength:48 options:[(MTLHeap *)v7->_uniformsHeap resourceOptions]];
          v19 = pyrHomographyWideIsRef[v15];
          pyrHomographyWideIsRef[v15] = (MTLBuffer *)v18;

          if (!pyrHomographyWideIsRef[v15]) {
            break;
          }
          if (v15 < 2)
          {

            v20 = +[RegPyrFusionShared sharedInstance];
            uint64_t v21 = [v20 getShaders:v7->_metal];
            shaders = v7->_shaders;
            v7->_shaders = (RegPyrFusionShaders *)v21;

            if (v7->_shaders)
            {
              uint64_t v23 = objc_opt_new();
              refPyr = v7->_refPyr;
              v7->_refPyr = (PyramidStorage *)v23;

              v25 = v7->_refPyr;
              if (v25)
              {
                v25->levels = 11;
                uint64_t v26 = objc_opt_new();
                nonRefPyr = v7->_nonRefPyr;
                v7->_nonRefPyr = (PyramidStorage *)v26;

                v28 = v7->_nonRefPyr;
                if (v28)
                {
                  v28->levels = 11;
                  +[RegPyrFusion prewarmRenderers:v7->_metal];
                  LODWORD(v29) = 1068149419;
                  +[RegPyrFusion calculatePyramidDimensions:&v7->_pyrWidths[1] pyrWidths:&v7->_pyrHeights[1] pyrHeights:10 topLevelIndex:1024 maxDim:32 minDim:v29];
                  goto LABEL_13;
                }
              }
            }
            goto LABEL_21;
          }
        }
      }
    }
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();

    if (v33) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_21:
    FigDebugAssert3();
    if (FigSignalErrorAt())
    {
LABEL_16:
      v30 = 0;
      goto LABEL_14;
    }
  }
LABEL_13:
  v30 = v7;
LABEL_14:
  v31 = v30;

  return v31;
}

+ (void)prewarmRenderers:(id)a3
{
}

+ (void)calculatePyramidDimensions:(float)a3 pyrWidths:(int *)a4 pyrHeights:(int *)a5 topLevelIndex:(int)a6 maxDim:(int)a7 minDim:(int)a8
{
  float v13 = log2f((float)a7);
  if (a6 < 2)
  {
    float v14 = 0.0;
    if (a6 != 1) {
      return;
    }
  }
  else
  {
    float v14 = (float)(v13 - log2f((float)a8)) / (float)(a6 - 1);
  }
  uint64_t v15 = 0;
  float v16 = sqrtf(1.0 / a3);
  do
  {
    int v17 = (int)(float)(ceilf((float)(v16 * exp2f(v13 - (float)((float)(int)v15 * v14))) / 6.0) * 6.0);
    a4[v15] = (int)(float)((float)v17 * a3);
    a5[v15++] = v17;
  }
  while (a6 != v15);
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RegPyrFusionShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }
  +[RegPyrFusion prewarmRenderers:v3];

  return v5;
}

- (void)scaleHomographyUsingCalib:(id *)a3 to:(id *)a4
{
  float v7 = truncf((float)(a3[2].var1.var1.var0 - a3[2].var1.var0.var0) + 1.0);
  float v8 = truncf((float)(a3[2].var1.var1.var1 - a3[2].var1.var0.var1) + 1.0);
  *(float *)&long long v4 = (float)self->_pyrWidths[1];
  float v9 = (float)self->_pyrHeights[1];
  *(float *)&unsigned int v54 = truncf((float)(a3[1].var2.var1.var0 - a3[1].var2.var0.var0) + 1.0) / *(float *)&v4;
  float v57 = truncf((float)(a3[1].var2.var1.var1 - a3[1].var2.var0.var1) + 1.0) / v9;
  float v50 = v9;
  long long v51 = v4;
  long long v61 = 0u;
  long long v62 = 0u;
  float v10 = v7 / *(float *)&v4;
  float32x4_t v60 = 0u;
  $2E74481F85386E1F5426A8C22E405656 var2 = a3->var2;
  $2E74481F85386E1F5426A8C22E405656 var1 = a3[1].var1;
  float32x4_t v69 = (float32x4_t)a3->var1;
  $2E74481F85386E1F5426A8C22E405656 v70 = var2;
  long long v71 = (__int128)var1;
  long long v66 = xmmword_26337FF30;
  long long v67 = xmmword_26337FF40;
  long long v68 = xmmword_26337FF50;
  long long v63 = xmmword_26337FF60;
  long long v64 = xmmword_26337FF70;
  long long v65 = xmmword_26337FF50;
  float v13 = v8 / v9;
  double v14 = Mul3x3by3x3by3x3((uint64_t)&v66, &v69, (float32x4_t *)&v63);
  v60.i32[2] = v15;
  DWORD2(v61) = v16;
  *(double *)v60.i64 = v14;
  *(void *)&long long v61 = v17;
  DWORD2(v62) = v18;
  *(void *)&long long v62 = v19;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = 1.0 / v13;
  float32x4_t v69 = (float32x4_t)COERCE_UNSIGNED_INT(1.0 / v10);
  $2E74481F85386E1F5426A8C22E405656 v70 = ($2E74481F85386E1F5426A8C22E405656)v19;
  long long v71 = xmmword_26337FF50;
  LODWORD(v17) = 0;
  *((float *)&v17 + 1) = v57;
  long long v66 = v54;
  long long v67 = v17;
  long long v68 = xmmword_26337FF50;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  double v20 = Mul3x3by3x3by3x3((uint64_t)&v69, &v60, (float32x4_t *)&v66);
  DWORD2(v63) = v21;
  DWORD2(v64) = v22;
  *(double *)&long long v63 = v20;
  *(void *)&long long v64 = v23.i64[0];
  DWORD2(v65) = v24;
  v23.i32[1] = 0;
  v23.i32[3] = 0;
  v23.f32[0] = 1.0 / *(float *)&v51;
  *(void *)&long long v65 = v25;
  v23.f32[2] = -0.5 / *(float *)&v51;
  LODWORD(v25) = 0;
  *((float *)&v25 + 1) = 1.0 / v50;
  $2E74481F85386E1F5426A8C22E405656 v48 = ($2E74481F85386E1F5426A8C22E405656)v25;
  long long v26 = v25;
  *((float *)&v26 + 2) = -0.5 / v50;
  long long v27 = v51;
  DWORD1(v27) = 0;
  DWORD2(v27) = 0.5;
  float32x4_t v69 = v23;
  $2E74481F85386E1F5426A8C22E405656 v70 = ($2E74481F85386E1F5426A8C22E405656)v26;
  LODWORD(v26) = 0;
  *((float *)&v26 + 1) = v50;
  long long v49 = (unint64_t)v26;
  LODWORD(v26) = 0;
  long long v71 = xmmword_26337FF50;
  *((void *)&v26 + 1) = COERCE_UNSIGNED_INT(0.5);
  long long v66 = v27;
  long long v67 = v26;
  long long v68 = xmmword_26337FF50;
  *(double *)&long long v28 = Mul3x3by3x3by3x3((uint64_t)&v69, (float32x4_t *)&v63, (float32x4_t *)&v66);
  long long v52 = v28;
  long long v55 = v29;
  long long v58 = v30;
  uint64_t v31 = [a4[1] contents];
  uint64_t v32 = 0;
  *(void *)uint64_t v31 = v52;
  *(_DWORD *)(v31 + 8) = DWORD2(v52);
  *(_DWORD *)(v31 + 24) = DWORD2(v55);
  *(void *)(v31 + 16) = v55;
  *(void *)(v31 + 32) = v58;
  *(_DWORD *)(v31 + 40) = DWORD2(v58);
  int v33 = a4 + 2;
  do
  {
    objc_super v34 = (unsigned int *)((char *)self + 4 * v32);
    float v35 = (float)v34[86];
    float v36 = (float)v34[106];
    float v37 = *(float *)&v51 / v35;
    float v38 = v50 / v36;
    float32x4_t v39 = (float32x4_t)COERCE_UNSIGNED_INT(1.0 / *(float *)&v51);
    v39.f32[2] = -0.5 / v35;
    float v40 = -0.5 / v36;
    $2E74481F85386E1F5426A8C22E405656 v41 = v48;
    v41.var1.var0 = v40;
    float32x4_t v69 = v39;
    $2E74481F85386E1F5426A8C22E405656 v70 = v41;
    long long v71 = xmmword_26337FF50;
    float32x4_t v42 = (float32x4_t)v51;
    v42.f32[2] = v37 * 0.5;
    long long v43 = v49;
    *((float *)&v43 + 2) = v38 * 0.5;
    long long v66 = (__int128)v42;
    long long v67 = v43;
    long long v68 = xmmword_26337FF50;
    *(double *)&long long v44 = Mul3x3by3x3by3x3((uint64_t)&v69, (float32x4_t *)&v63, (float32x4_t *)&v66);
    long long v53 = v44;
    long long v56 = v45;
    long long v59 = v46;
    uint64_t v47 = [v33[v32] contents];
    *(void *)uint64_t v47 = v53;
    *(_DWORD *)(v47 + 8) = DWORD2(v53);
    *(void *)(v47 + 16) = v56;
    *(_DWORD *)(v47 + 24) = DWORD2(v56);
    *(void *)(v47 + 32) = v59;
    *(_DWORD *)(v47 + 40) = DWORD2(v59);
    ++v32;
  }
  while (v32 != 9);
}

- (int)setupPyramidScalersUsingCalib
{
  id v3 = [(FigMetalContext *)self->_metal device];
  long long v4 = (MTLBuffer *)[v3 newBufferWithLength:16 options:0];
  int v5 = self->_pyrScaleParamLevel0[1];
  self->_pyrScaleParamLevel0[1] = v4;

  if (!self->_pyrScaleParamLevel0[1]) {
    goto LABEL_11;
  }
  v6 = [(FigMetalContext *)self->_metal device];
  float v7 = (MTLBuffer *)[v6 newBufferWithLength:16 options:0];
  float v8 = self->_pyrScaleParamLevel0[0];
  self->_pyrScaleParamLevel0[0] = v7;

  if (!self->_pyrScaleParamLevel0[0]) {
    goto LABEL_11;
  }
  float v9 = [(FigMetalContext *)self->_metal device];
  float v10 = (MTLBuffer *)[v9 newBufferWithLength:16 options:0];
  uint64_t v11 = self->_pyrRoiScaleLevel0[1];
  self->_pyrRoiScaleLevel0[1] = v10;

  if (!self->_pyrRoiScaleLevel0[1]) {
    goto LABEL_11;
  }
  v12 = [(FigMetalContext *)self->_metal device];
  float v13 = (MTLBuffer *)[v12 newBufferWithLength:16 options:0];
  double v14 = self->_pyrRoiScaleLevel0[0];
  self->_pyrRoiScaleLevel0[0] = v13;

  if (!self->_pyrRoiScaleLevel0[0]) {
    goto LABEL_11;
  }
  unsigned int v15 = self->_pyrWidths[1];
  unsigned int v16 = self->_pyrHeights[1];
  unint64_t v17 = (_DWORD *)[(MTLBuffer *)self->_pyrScaleParamLevel0[1] contents];
  if (!v17) {
    goto LABEL_11;
  }
  float v18 = (float)v15;
  float v19 = (float)v16;
  *(float *)&uint64_t v20 = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var0
                                 - self->_wideIsRefCalibData[1].var2.var0.var0)
                         + 1.0)
                 / v18;
  _DWORD *v17 = v20;
  *((float *)&v20 + 1) = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var1
                                       - self->_wideIsRefCalibData[1].var2.var0.var1)
                               + 1.0)
                       / (float)v16;
  *(void *)unint64_t v17 = v20;
  *(float *)&uint64_t v20 = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var0
                                 - self->_wideIsRefCalibData[2].var1.var0.var0)
                         + 1.0)
                 / v18;
  v17[2] = v20;
  *((float *)&v20 + 1) = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var1
                                       - self->_wideIsRefCalibData[2].var1.var0.var1)
                               + 1.0)
                       / (float)v16;
  *((void *)v17 + 1) = v20;
  __int32 v21 = (unsigned int *)[(MTLBuffer *)self->_pyrRoiScaleLevel0[1] contents];
  if (!v21) {
    goto LABEL_11;
  }
  unsigned int var0 = self->_wideIsRefCalibData[1].var2.var0.var0;
  *__int32 v21 = var0;
  LODWORD(v23) = var0;
  HIDWORD(v23) = self->_wideIsRefCalibData[1].var2.var0.var1;
  *(void *)__int32 v21 = v23;
  unsigned int v24 = self->_wideIsRefCalibData[1].var2.var1.var0;
  v21[2] = v24;
  LODWORD(v23) = v24;
  HIDWORD(v23) = self->_wideIsRefCalibData[1].var2.var1.var1;
  *((void *)v21 + 1) = v23;
  unint64_t v25 = (_DWORD *)[(MTLBuffer *)self->_pyrScaleParamLevel0[0] contents];
  if (!v25) {
    FigDebugAssert3();
  }
  *(float *)&uint64_t v26 = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var0
                                 - self->_teleIsRefCalibData[1].var2.var0.var0)
                         + 1.0)
                 / v18;
  v25[2] = v26;
  *((float *)&v26 + 1) = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var1
                                       - self->_teleIsRefCalibData[1].var2.var0.var1)
                               + 1.0)
                       / v19;
  *((void *)v25 + 1) = v26;
  *(float *)&uint64_t v26 = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var0
                                 - self->_teleIsRefCalibData[2].var1.var0.var0)
                         + 1.0)
                 / v18;
  _DWORD *v25 = v26;
  *((float *)&v26 + 1) = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var1
                                       - self->_teleIsRefCalibData[2].var1.var0.var1)
                               + 1.0)
                       / v19;
  *(void *)unint64_t v25 = v26;
  long long v27 = (unsigned int *)[(MTLBuffer *)self->_pyrRoiScaleLevel0[0] contents];
  if (v27)
  {
    unsigned int v28 = self->_teleIsRefCalibData[2].var1.var0.var0;
    *long long v27 = v28;
    LODWORD(v29) = v28;
    HIDWORD(v29) = self->_teleIsRefCalibData[2].var1.var0.var1;
    *(void *)long long v27 = v29;
    unsigned int v30 = self->_teleIsRefCalibData[2].var1.var1.var0;
    v27[2] = v30;
    LODWORD(v29) = v30;
    HIDWORD(v29) = self->_teleIsRefCalibData[2].var1.var1.var1;
    *((void *)v27 + 1) = v29;
    return 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)generateDerivativesWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 inputTex:(id)a5 outputTex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v47 = 0;
  double v14 = [(FigMetalContext *)self->_metal allocator];
  unsigned int v15 = (void *)[v14 newTextureDescriptor];

  if (!v15)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_8;
  }
  id v43 = v13;
  uint64_t v16 = [v12 width];
  unint64_t v17 = [v15 desc];
  [v17 setWidth:v16];

  uint64_t v18 = [v12 height];
  float v19 = [v15 desc];
  [v19 setHeight:v18];

  uint64_t v20 = [v15 desc];
  [v20 setUsage:7];

  __int32 v21 = [v15 desc];
  [v21 setPixelFormat:65];

  [v15 setLabel:0];
  int v22 = [v15 desc];
  [v22 setCompressionMode:2];

  uint64_t v23 = [v15 desc];
  [v23 setCompressionFootprint:0];

  unsigned int v24 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v25 = (void *)[v24 newTextureWithDescriptor:v15];
  id v47 = v25;

  if (!v25)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
LABEL_13:
    id v13 = v43;
    goto LABEL_8;
  }
  uint64_t v26 = [v11 colorAttachments];
  long long v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setTexture:v25];

  uint64_t v28 = [v10 renderCommandEncoderWithDescriptor:v11];
  if (!v28)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();

    goto LABEL_13;
  }
  uint64_t v29 = (void *)v28;
  unsigned int v30 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
  [v29 setVertexBuffer:v30 offset:0 atIndex:0];

  [v29 setFragmentTexture:v12 atIndex:0];
  [v29 setRenderPipelineState:self->_shaders->_derivSobelPipelineState];
  [v29 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v29 endEncoding];
  uint64_t v31 = [v12 width];
  uint64_t v32 = [v12 height];
  uint64_t v33 = [v10 computeCommandEncoder];
  if (!v33)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();

    goto LABEL_13;
  }
  objc_super v34 = (void *)v33;
  id v41 = v10;
  id v42 = v11;
  unint64_t v35 = (unint64_t)(v31 + 31) >> 5;
  unint64_t v36 = (unint64_t)(v32 + 31) >> 5;
  float v37 = [(FigMetalContext *)self->_metal allocator];
  int v38 = [v37 allocatorType];

  if (v38 == 2) {
    [v34 insertCompressedTextureReinterpretationFlush];
  }
  [v34 setImageblockWidth:32 height:32];
  [v34 setComputePipelineState:self->_shaders->_derivPipelineState];
  [v34 setTexture:v12 atIndex:0];
  [v34 setTexture:v25 atIndex:1];
  id v13 = v43;
  [v34 setTexture:v43 atIndex:2];
  v46[0] = v35;
  v46[1] = v36;
  v46[2] = 1;
  int64x2_t v44 = vdupq_n_s64(0x10uLL);
  uint64_t v45 = 1;
  [v34 dispatchThreadgroups:v46 threadsPerThreadgroup:&v44];
  [v34 endEncoding];
  FigMetalDecRef();

  int v39 = 0;
  id v10 = v41;
  id v11 = v42;
LABEL_8:

  return v39;
}

- (int)basicSearchWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a8;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = [v21 colorAttachments];
  unsigned int v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setTexture:v20];

  unint64_t v25 = [v22 renderCommandEncoderWithDescriptor:v21];

  if (v25)
  {
    uint64_t v26 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v25 setVertexBuffer:v26 offset:0 atIndex:0];

    [v25 setFragmentTexture:v16 atIndex:0];
    [v25 setFragmentTexture:v17 atIndex:1];
    [v25 setFragmentTexture:v18 atIndex:2];
    [v25 setFragmentBuffer:v19 offset:0 atIndex:0];
    [v25 setRenderPipelineState:self->_shaders->_basicSearchLumaPipelineState];
    [v25 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v25 endEncoding];
    int v27 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
  }

  return v27;
}

- (int)smoothShiftMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 input:(id)a5 output:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v12 colorAttachments];
  unsigned int v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setTexture:v11];

  id v16 = [v13 renderCommandEncoderWithDescriptor:v12];

  if (v16)
  {
    id v17 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v16 setVertexBuffer:v17 offset:0 atIndex:0];

    [v16 setFragmentTexture:v10 atIndex:0];
    [v16 setRenderPipelineState:self->_shaders->_smoothPipelineState];
    [v16 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v16 endEncoding];
    int v18 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)selectionWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a8;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = [v21 colorAttachments];
  unsigned int v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setTexture:v20];

  uint64_t v25 = [v16 width];
  uint64_t v26 = [v16 height];
  int v27 = [v22 renderCommandEncoderWithDescriptor:v21];

  if (v27)
  {
    float v28 = 2.0 / (float)(1024.0 / sqrtf((float)(unint64_t)(v26 * v25)));
    uint64_t v29 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v27 setVertexBuffer:v29 offset:0 atIndex:0];

    [v27 setFragmentTexture:v16 atIndex:0];
    [v27 setFragmentTexture:v17 atIndex:1];
    [v27 setFragmentTexture:v18 atIndex:2];
    [v27 setFragmentBuffer:v19 offset:0 atIndex:0];
    float v32 = v28;
    [v27 setFragmentBytes:&v32 length:4 atIndex:1];
    [v27 setRenderPipelineState:self->_shaders->_selectionLumaPipelineState];
    [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v27 endEncoding];
    int v30 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
  }

  return v30;
}

- (RegPyrFusion)fusionWithCommandBuffer:(id)a3 refTex:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v49 = a3;
  id v16 = a4;
  id v51 = a5;
  id v17 = a6;
  id v18 = a7;
  id v50 = a8;
  id v19 = a9;
  id v54 = 0;
  id v20 = [(FigMetalContext *)self->_metal allocator];
  id v21 = (void *)[v20 newTextureDescriptor];

  if (!v21) {
    goto LABEL_8;
  }
  uint64_t v22 = [v18 width];
  uint64_t v23 = [v21 desc];
  [v23 setWidth:v22];

  uint64_t v24 = [v18 height];
  uint64_t v25 = [v21 desc];
  [v25 setHeight:v24];

  uint64_t v26 = [v21 desc];
  [v26 setPixelFormat:115];

  [v21 setLabel:0];
  int v27 = [(FigMetalContext *)self->_metal allocator];
  float v28 = (void *)[v27 newTextureWithDescriptor:v21];
  id v54 = v28;

  if (!v28)
  {
LABEL_8:
    FigDebugAssert3();
    uint64_t v45 = (RegPyrFusion *)FigSignalErrorAt();
    long long v46 = v51;
    id v43 = v49;
    goto LABEL_7;
  }
  $2E74481F85386E1F5426A8C22E405656 v48 = v21;
  id v29 = v16;
  int v30 = [MEMORY[0x263F129A0] renderPassDescriptor];
  if (!v30)
  {
    FigDebugAssert3();
    uint64_t v45 = (RegPyrFusion *)FigSignalErrorAt();
    long long v46 = v51;
    id v21 = v48;
    id v43 = v49;
    goto LABEL_7;
  }
  uint64_t v31 = v30;
  float v32 = [v30 colorAttachments];
  uint64_t v33 = [v32 objectAtIndexedSubscript:0];
  [v33 setTexture:v28];

  uint64_t v34 = [v51 width];
  uint64_t v35 = [v51 height];
  uint64_t v36 = [v49 renderCommandEncoderWithDescriptor:v31];
  if (!v36)
  {
    FigDebugAssert3();
    uint64_t v45 = (RegPyrFusion *)FigSignalErrorAt();

    id v43 = v49;
LABEL_12:
    id v16 = v29;
    id v21 = v48;
    long long v46 = v51;
    goto LABEL_7;
  }
  float v37 = (void *)v36;
  float v38 = 1.3 / (float)(1024.0 / sqrtf((float)(unint64_t)(v35 * v34)));
  int v39 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
  [v37 setVertexBuffer:v39 offset:0 atIndex:0];

  [v37 setFragmentTexture:v29 atIndex:0];
  [v37 setFragmentTexture:v51 atIndex:1];
  [v37 setFragmentTexture:v17 atIndex:2];
  [v37 setFragmentTexture:v18 atIndex:3];
  [v37 setFragmentBuffer:v19 offset:0 atIndex:0];
  float v53 = v38;
  [v37 setFragmentBytes:&v53 length:4 atIndex:1];
  [v37 setRenderPipelineState:self->_shaders->_fusionXLumaPipelineState];
  [v37 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v37 endEncoding];
  float v40 = [v31 colorAttachments];
  id v41 = [v40 objectAtIndexedSubscript:0];
  [v41 setTexture:v50];

  id v42 = [v49 renderCommandEncoderWithDescriptor:v31];

  id v43 = v49;
  if (!v42)
  {
    FigDebugAssert3();
    uint64_t v45 = (RegPyrFusion *)FigSignalErrorAt();

    goto LABEL_12;
  }
  int64x2_t v44 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
  [v42 setVertexBuffer:v44 offset:0 atIndex:0];

  [v42 setFragmentTexture:v29 atIndex:0];
  [v42 setFragmentTexture:v51 atIndex:1];
  [v42 setFragmentTexture:v17 atIndex:2];
  [v42 setFragmentTexture:v28 atIndex:3];
  [v42 setFragmentBuffer:v19 offset:0 atIndex:0];
  float v52 = v38;
  [v42 setFragmentBytes:&v52 length:4 atIndex:1];
  [v42 setRenderPipelineState:self->_shaders->_fusionYLumaPipelineState];
  [v42 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v42 endEncoding];
  FigMetalDecRef();

  uint64_t v45 = 0;
  id v16 = v29;
  id v21 = v48;
  long long v46 = v51;
  id v43 = v49;
LABEL_7:

  return v45;
}

- (int)confidenceMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 shiftMap:(id)a5 confidenceOut:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [(FigMetalContext *)self->_metal allocator];
  unsigned int v15 = (void *)[v14 newTextureDescriptor];

  if (!v15) {
    goto LABEL_8;
  }
  id v16 = [v11 colorAttachments];
  id v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setTexture:v13];

  uint64_t v18 = [v10 renderCommandEncoderWithDescriptor:v11];
  if (v18)
  {
    id v19 = (void *)v18;
    id v20 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v19 setVertexBuffer:v20 offset:0 atIndex:0];

    [v19 setFragmentTexture:v12 atIndex:0];
    [v19 setRenderPipelineState:self->_shaders->_confidenceStageOne];
    [v19 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v19 endEncoding];
    uint64_t v21 = [v12 width];
    uint64_t v22 = [v15 desc];
    [v22 setWidth:v21];

    uint64_t v23 = [v12 height];
    uint64_t v24 = [v15 desc];
    [v24 setHeight:v23];

    uint64_t v25 = [v15 desc];
    [v25 setPixelFormat:25];

    [v15 setLabel:0];
    uint64_t v26 = [(FigMetalContext *)self->_metal allocator];
    int v27 = (void *)[v26 newTextureWithDescriptor:v15];

    if (v27)
    {
      float v28 = [v11 colorAttachments];
      id v29 = [v28 objectAtIndexedSubscript:0];
      [v29 setTexture:v27];

      int v30 = [v10 renderCommandEncoderWithDescriptor:v11];

      if (!v30) {
        goto LABEL_10;
      }
      uint64_t v31 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
      [v30 setVertexBuffer:v31 offset:0 atIndex:0];

      [v30 setFragmentTexture:v13 atIndex:0];
      [v30 setRenderPipelineState:self->_shaders->_confidenceErode];
      [v30 drawPrimitives:4 vertexStart:0 vertexCount:4];
      [v30 endEncoding];
      float v32 = [v11 colorAttachments];
      uint64_t v33 = [v32 objectAtIndexedSubscript:0];
      [v33 setTexture:v13];

      uint64_t v34 = [v10 renderCommandEncoderWithDescriptor:v11];

      if (v34)
      {
        uint64_t v35 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
        [v34 setVertexBuffer:v35 offset:0 atIndex:0];

        [v34 setFragmentTexture:v27 atIndex:0];
        [v34 setRenderPipelineState:self->_shaders->_confidenceDilate];
        [v34 drawPrimitives:4 vertexStart:0 vertexCount:4];
        [v34 endEncoding];
        FigMetalDecRef();

        int v36 = 0;
      }
      else
      {
LABEL_10:
        FigDebugAssert3();
        int v36 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v36 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
  }

  return v36;
}

- (int)bilinearScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTexIn:(id)a5 refTexOut:(id)a6 nonRefTexIn:(id)a7 nonRefTexOut:(id)a8 pyrLevel:(int)a9
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [v19 colorAttachments];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setTexture:v18];

  uint64_t v23 = [v19 colorAttachments];
  uint64_t v24 = [v23 objectAtIndexedSubscript:1];
  [v24 setTexture:v17];

  uint64_t v25 = [v20 renderCommandEncoderWithDescriptor:v19];

  if (v25)
  {
    uint64_t v26 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v25 setVertexBuffer:v26 offset:0 atIndex:0];

    [v25 setFragmentTexture:v15 atIndex:0];
    [v25 setFragmentTexture:v16 atIndex:1];
    [v25 setFragmentBuffer:self->_pyrScaleParams[a9] offset:0 atIndex:0];
    [v25 setRenderPipelineState:self->_shaders->_bilinearScalePipelineState];
    [v25 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v25 endEncoding];
    int v27 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
  }

  return v27;
}

- (int)initialDownScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTex:(id)a5 nonRefTex:(id)a6 refTexOut:(id)a7 nonRefTexOut:(id)a8 refCamType:(int)a9
{
  id v40 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [v16 pixelFormat];
  if (v20 == [v17 pixelFormat])
  {
    uint64_t v21 = [v16 pixelFormat];
    uint64_t v22 = 8;
    if (v21 == 115) {
      uint64_t v22 = 16;
    }
    id v23 = *(id *)((char *)&self->_shaders->super.isa + v22);
    uint64_t v24 = [v15 colorAttachments];
    uint64_t v25 = [v24 objectAtIndexedSubscript:0];
    uint64_t v26 = v25;
    if (a9 == 1)
    {
      [v25 setTexture:v18];

      int v27 = [v15 colorAttachments];
      float v28 = [v27 objectAtIndexedSubscript:1];
      id v29 = v28;
      id v30 = v19;
    }
    else
    {
      [v25 setTexture:v19];

      int v27 = [v15 colorAttachments];
      float v28 = [v27 objectAtIndexedSubscript:1];
      id v29 = v28;
      id v30 = v18;
    }
    [v28 setTexture:v30];

    uint64_t v31 = [v40 renderCommandEncoderWithDescriptor:v15];
    if (v31)
    {
      float v32 = (void *)v31;
      uint64_t v33 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
      [v32 setVertexBuffer:v33 offset:0 atIndex:0];

      if (a9 == 1) {
        id v34 = v16;
      }
      else {
        id v34 = v17;
      }
      if (a9 == 1) {
        id v35 = v17;
      }
      else {
        id v35 = v16;
      }
      [v32 setFragmentTexture:v34 atIndex:0];
      [v32 setFragmentTexture:v35 atIndex:1];
      int v36 = &self->super.isa + a9;
      [v32 setFragmentBuffer:v36[68] offset:0 atIndex:0];
      [v32 setFragmentBuffer:v36[66] offset:0 atIndex:1];
      [v32 setRenderPipelineState:v23];
      [v32 drawPrimitives:4 vertexStart:0 vertexCount:4];
      [v32 endEncoding];

      int v37 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();
    }
  }
  else
  {
    int v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v37 = -73272;
  }

  return v37;
}

- (int)registerImagesWithReference:(id)a3 nonRef:(id)a4 refTexlvl1:(id)a5 nonRefTexlvl1:(id)a6 shiftMap:(id)a7 confidenceMap:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v112 = a7;
  id v18 = a8;
  id v153 = 0;
  id v154 = 0;
  id v110 = v16;
  v111 = v18;
  if (!v16
    || !v17
    || !v112
    || !v18
    || [(PyramidStorage *)self->_refPyr setLumaTexture:v14 level:0]
    || [(PyramidStorage *)self->_nonRefPyr setLumaTexture:v15 level:0])
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    v113 = 0;
    uint64_t v20 = 0;
LABEL_48:
    float v38 = 0;
    goto LABEL_45;
  }
  objc_storeStrong((id *)&self->_refPyr->textureY[1], a5);
  objc_storeStrong((id *)&self->_nonRefPyr->textureY[1], a6);
  id v19 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v20 = (void *)[v19 newTextureDescriptor];

  if (!v20) {
    goto LABEL_58;
  }
  uint64_t v21 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v22 = (void *)[v21 newTextureDescriptor];

  id v23 = [v22 desc];
  [v23 setCompressionMode:2];

  uint64_t v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  v113 = v22;
  if (!v22)
  {
LABEL_58:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    v113 = 0;
    goto LABEL_48;
  }
  uint64_t v25 = self->_pyrScaleParams[0];
  self->_pyrScaleParams[0] = 0;

  uint64_t v26 = 0;
  int v27 = (__int32 *)&self->_pyrHeights[2];
  float v28 = &self->_pyrWidths[1];
  do
  {
    id v29 = [(FigMetalContext *)self->_metal device];
    uint64_t v30 = [v29 newBufferWithLength:8 options:0];
    uint64_t v31 = *(void **)&v28[v26 + 57];
    *(void *)&v28[v26 + 57] = v30;

    float v32 = *(void **)&v28[v26 + 57];
    if (!v32) {
      goto LABEL_47;
    }
    v33.i32[0] = *(v27 - 21);
    v33.i32[1] = *(v27 - 1);
    v34.i32[0] = *(v27 - 20);
    v34.i32[1] = *v27++;
    *(float32x2_t *)[v32 contents] = vdiv_f32(vcvt_f32_u32(v33), vcvt_f32_u32(v34));
    v26 += 2;
  }
  while (v26 != 18);
  uint64_t v35 = [v14 width];
  uint64_t v36 = [v14 height];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v37 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  v118[0] = *MEMORY[0x263EF89A0];
  v118[1] = v37;
  long long v119 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  uint64_t v123 = 0;
  float v124 = (float)(unint64_t)(v35 - 1);
  float v125 = (float)(unint64_t)(v36 - 1);
  uint64_t v120 = 0;
  float v121 = v124;
  float v122 = v125;
  v126[0] = v118[0];
  v126[1] = v37;
  v126[2] = v119;
  uint64_t v130 = 0;
  float v131 = v124;
  float v132 = v125;
  uint64_t v127 = 0;
  float v128 = v124;
  float v129 = v125;
  self->_teleIsRefCalibData = ($9094219794FDD2A7DC1044AF4E80E4FB *)v126;
  self->_wideIsRefCalibData = ($9094219794FDD2A7DC1044AF4E80E4FB *)v118;
  -[RegPyrFusion scaleHomographyUsingCalib:to:](self, "scaleHomographyUsingCalib:to:");
  [(RegPyrFusion *)self scaleHomographyUsingCalib:self->_wideIsRefCalibData to:self->_pyrHomographyWideIsRef];
  if ([(RegPyrFusion *)self setupPyramidScalersUsingCalib])
  {
    float v38 = 0;
    int v39 = 0;
    goto LABEL_45;
  }
  uint64_t v40 = [MEMORY[0x263F129A0] renderPassDescriptor];
  if (!v40)
  {
LABEL_47:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_48;
  }
  id v41 = (void *)v40;
  id v109 = v15;
  id v42 = [v20 desc];
  [v42 setPixelFormat:25];

  id v43 = [v20 desc];
  [v43 setUsage:7];

  int64x2_t v44 = &self->_pyrWidths[2];
  for (uint64_t i = 2; i != 11; ++i)
  {
    uint64_t v46 = *v44;
    id v47 = [v20 desc];
    [v47 setWidth:v46];

    uint64_t v48 = v44[20];
    id v49 = [v20 desc];
    [v49 setHeight:v48];

    [v20 setLabel:0];
    id v50 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v51 = [v50 newTextureWithDescriptor:v20];
    textureY = self->_refPyr->textureY;
    float v53 = textureY[i];
    textureY[i] = (MTLTexture *)v51;

    if (!self->_refPyr->textureY[i]) {
      goto LABEL_49;
    }
    [v20 setLabel:0];
    id v54 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v55 = [v54 newTextureWithDescriptor:v20];
    long long v56 = self->_nonRefPyr->textureY;
    float v57 = v56[i];
    v56[i] = (MTLTexture *)v55;

    if (!self->_nonRefPyr->textureY[i])
    {
LABEL_49:
      FigDebugAssert3();
      int v39 = FigSignalErrorAt();
      float v38 = v41;
LABEL_44:
      id v15 = v109;
      goto LABEL_45;
    }
    ++v44;
  }
  uint64_t v58 = [(FigMetalContext *)self->_metal commandBuffer];
  id v15 = v109;
  if (!v58)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    float v38 = v41;
    goto LABEL_45;
  }
  long long v59 = (void *)v58;
  LODWORD(v103) = 1;
  [(RegPyrFusion *)self initialDownScaleWithCommandBuffer:v58 renderPassDesc:v41 refTex:self->_refPyr->textureY[0] nonRefTex:self->_nonRefPyr->textureY[0] refTexOut:self->_refPyr->textureY[1] nonRefTexOut:self->_nonRefPyr->textureY[1] refCamType:v103];
  uint64_t v60 = 0;
  do
  {
    long long v61 = &self->_refPyr->textureY[v60];
    long long v62 = v61[1];
    long long v63 = v61[2];
    long long v64 = &self->_nonRefPyr->textureY[v60++];
    LODWORD(v104) = v60;
    [(RegPyrFusion *)self bilinearScaleWithCommandBuffer:v59 renderPassDesc:v41 refTexIn:v62 refTexOut:v63 nonRefTexIn:v64[1] nonRefTexOut:v64[2] pyrLevel:v104];
  }
  while (v60 != 9);
  [(FigMetalContext *)self->_metal commit];
  uint64_t v65 = [MEMORY[0x263F129A0] renderPassDescriptor];

  v114 = (void *)v65;
  if (!v65)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();

    goto LABEL_48;
  }
  long long v66 = [(FigMetalContext *)self->_metal commandBuffer];

  if (!v66)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    v101 = v110;
    float v38 = v114;
    goto LABEL_46;
  }
  id v108 = v14;
  uint64_t v67 = 0;
  v115 = &self->_pyrHomographyWideIsRef[10];
  long long v68 = &self->_pyrWidths[10];
  uint64_t v69 = 80;
  while (1)
  {
    v116 = 0;
    uint64_t v70 = *v68;
    long long v71 = [v20 desc];
    [v71 setWidth:v70];

    uint64_t v72 = v68[20];
    v73 = [v20 desc];
    [v73 setHeight:v72];

    v74 = [v20 desc];
    [v74 setPixelFormat:70];

    v75 = [v20 desc];
    [v75 setUsage:7];

    [v20 setLabel:0];
    v76 = [(FigMetalContext *)self->_metal allocator];
    v117 = (void *)[v76 newTextureWithDescriptor:v20];

    if (!v117)
    {
LABEL_53:
      FigDebugAssert3();
      float v38 = (void *)v65;
      goto LABEL_55;
    }
    float v38 = (void *)v65;
    -[RegPyrFusion generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:outputTex:](self, "generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:outputTex:", v66, v65, self->_refPyr->textureY[v67 + 10]);
    [v20 setLabel:0];
    v77 = [(FigMetalContext *)self->_metal allocator];
    v116 = (void *)[v77 newTextureWithDescriptor:v20];

    if (!v116) {
      break;
    }
    -[RegPyrFusion generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:outputTex:](self, "generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:outputTex:", v66, v65, self->_nonRefPyr->textureY[v67 + 10]);
    v78 = [v20 desc];
    [v78 setPixelFormat:65];

    [v20 setLabel:0];
    v79 = [(FigMetalContext *)self->_metal allocator];
    v80 = (void *)[v79 newTextureWithDescriptor:v20];
    id v81 = v153;
    id v153 = v80;

    if (!v153) {
      break;
    }
    if (v67) {
      id v82 = v154;
    }
    else {
      id v82 = 0;
    }
    LODWORD(v105) = v67 + 10;
    -[RegPyrFusion basicSearchWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:](self, "basicSearchWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:", v66, v65, v117, v116, v82, v115[v67], v105);
    if (v67) {
      FigMetalDecRef();
    }
    [v113 setLabel:0];
    v83 = [v113 desc];
    [v83 setPixelFormat:65];

    uint64_t v84 = *v68;
    v85 = [v113 desc];
    [v85 setWidth:v84];

    uint64_t v86 = v68[20];
    v87 = [v113 desc];
    [v87 setHeight:v86];

    v88 = [v113 desc];
    [v88 setUsage:7];

    v89 = [(FigMetalContext *)self->_metal allocator];
    v90 = (void *)[v89 newTextureWithDescriptor:v113];
    id v91 = v154;
    id v154 = v90;

    if (!v154) {
      goto LABEL_53;
    }
    float v38 = (void *)v65;
    -[RegPyrFusion smoothShiftMapWithCommandBuffer:renderPassDesc:input:output:](self, "smoothShiftMapWithCommandBuffer:renderPassDesc:input:output:", v66, v65, v153);
    FigMetalDecRef();
    [v20 setLabel:0];
    v92 = [(FigMetalContext *)self->_metal allocator];
    v93 = (void *)[v92 newTextureWithDescriptor:v20];
    id v94 = v153;
    id v153 = v93;

    if (!v153) {
      break;
    }
    LODWORD(v106) = v67 + 10;
    int v95 = -[RegPyrFusion selectionWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:](self, "selectionWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:", v66, v65, v117, v116, v154, v115[v67], v106);
    if (v95) {
      goto LABEL_56;
    }
    FigMetalDecRef();
    [v20 setLabel:0];
    if (v67 == -9)
    {
      id v96 = v112;
      id v97 = v154;
      id v154 = v96;
    }
    else
    {
      id v97 = [(FigMetalContext *)self->_metal allocator];
      v98 = (void *)[v97 newTextureWithDescriptor:v20];
      id v99 = v154;
      id v154 = v98;
    }
    LODWORD(v107) = v67 + 10;
    int v95 = (int)[(RegPyrFusion *)self fusionWithCommandBuffer:v66 refTex:self->_refPyr->textureY[v67 + 10] refDerivTex:v117 nonRefDerivTex:v116 prevShiftMap:v153 nextShiftMap:v154 homography:v115[v67] pyrLevel:v107];
    if (v95) {
      goto LABEL_56;
    }
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    if ((unint64_t)(v67 + 10) >= 2)
    {
      FigMetalDecRef();
      FigMetalDecRef();
    }

    v69 -= 8;
    unint64_t v100 = v67 + 10;
    --v67;
    --v68;
    if (v100 <= 1)
    {
      [(RegPyrFusion *)self confidenceMapWithCommandBuffer:v66 renderPassDesc:v65 shiftMap:v112 confidenceOut:v111];
      [(FigMetalContext *)self->_metal commit];

      int v39 = 0;
      id v14 = v108;
      goto LABEL_44;
    }
  }
  FigDebugAssert3();
LABEL_55:
  int v95 = FigSignalErrorAt();
LABEL_56:
  int v39 = v95;
  id v14 = v108;
  id v15 = v109;

LABEL_45:
  v101 = v110;
LABEL_46:

  return v39;
}

- (void)reset
{
  [(PyramidStorage *)self->_refPyr releaseBuffers];
  nonRefPyr = self->_nonRefPyr;

  [(PyramidStorage *)nonRefPyr releaseBuffers];
}

- (MTLTexture)shiftMap
{
  return self->_shiftMap;
}

- (MTLTexture)confidenceMap
{
  return self->_confidenceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_shiftMap, 0);
  objc_storeStrong((id *)&self->_nonRefPyr, 0);
  objc_storeStrong((id *)&self->_refPyr, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_pyrScaleParams[i + 19], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_pyrRoiScaleLevel0[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_pyrScaleParamLevel0[k + 1], 0);
  objc_storeStrong((id *)&self->_uniformsHeap, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  for (uint64_t m = 328; m != 168; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
    m -= 8;
  }
  while (m != 8);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end