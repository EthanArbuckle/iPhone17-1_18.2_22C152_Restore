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
- (int)registerImagesWithReferenceImg:(id)a3 nonRefImage:(id)a4 refTexlvl1:(id)a5 nonRefTexlvl1:(id)a6 shiftMap:(id)a7 confidenceMap:(id)a8;
- (int)selectionWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10;
- (int)setupPyramidScalersUsingCalib;
- (int)smoothShiftMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 input:(id)a5 output:(id)a6;
- (void)scaleHomographyUsingCalib:(id *)a3 to:(id *)a4;
@end

@implementation RegPyrFusion

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

- (RegPyrFusion)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)RegPyrFusion;
  v6 = [(RegPyrFusion *)&v65 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_metal, a3), v7->_metal))
  {
    v8 = objc_opt_new();
    v11 = v8;
    if (v8)
    {
      objc_msgSend_setStorageMode_(v8, v9, 0, v10);
      objc_msgSend_setHazardTrackingMode_(v11, v12, 2, v13);
      objc_msgSend_setSize_(v11, v14, 20480, v15);
      v19 = objc_msgSend_device(v7->_metal, v16, v17, v18);
      uint64_t v22 = objc_msgSend_newHeapWithDescriptor_(v19, v20, (uint64_t)v11, v21);
      uniformsHeap = v7->_uniformsHeap;
      v7->_uniformsHeap = (MTLHeap *)v22;

      if (v7->_uniformsHeap)
      {
        pyrHomographyTeleIsRef = v7->_pyrHomographyTeleIsRef;
        pyrHomographyWideIsRef = v7->_pyrHomographyWideIsRef;
        LODWORD(v29) = 21;
        while (1)
        {
          uint64_t v29 = (v29 - 1);
          v30 = v7->_uniformsHeap;
          uint64_t v31 = objc_msgSend_resourceOptions(v30, v24, v25, v26);
          uint64_t v33 = objc_msgSend_newBufferWithLength_options_(v30, v32, 48, v31);
          v34 = pyrHomographyTeleIsRef[v29];
          pyrHomographyTeleIsRef[v29] = (MTLBuffer *)v33;

          if (!pyrHomographyTeleIsRef[v29]) {
            break;
          }
          v38 = v7->_uniformsHeap;
          uint64_t v39 = objc_msgSend_resourceOptions(v38, v35, v36, v37);
          uint64_t v41 = objc_msgSend_newBufferWithLength_options_(v38, v40, 48, v39);
          v42 = pyrHomographyWideIsRef[v29];
          pyrHomographyWideIsRef[v29] = (MTLBuffer *)v41;

          if (!pyrHomographyWideIsRef[v29]) {
            break;
          }
          if (v29 < 2)
          {

            v46 = objc_msgSend_sharedInstance(RegPyrFusionShared, v43, v44, v45);
            uint64_t v49 = objc_msgSend_getShaders_(v46, v47, (uint64_t)v7->_metal, v48);
            shaders = v7->_shaders;
            v7->_shaders = (RegPyrFusionShaders *)v49;

            if (v7->_shaders)
            {
              uint64_t v51 = objc_opt_new();
              refPyr = v7->_refPyr;
              v7->_refPyr = (PyramidStorage_NRF *)v51;

              v53 = v7->_refPyr;
              if (v53)
              {
                v53->levels = 11;
                uint64_t v54 = objc_opt_new();
                nonRefPyr = v7->_nonRefPyr;
                v7->_nonRefPyr = (PyramidStorage_NRF *)v54;

                v58 = v7->_nonRefPyr;
                if (v58)
                {
                  v58->levels = 11;
                  objc_msgSend_prewarmRenderers_(RegPyrFusion, v56, (uint64_t)v7->_metal, v57);
                  LODWORD(v59) = 1068149419;
                  objc_msgSend_calculatePyramidDimensions_pyrWidths_pyrHeights_topLevelIndex_maxDim_minDim_(RegPyrFusion, v60, (uint64_t)&v7->_pyrWidths[1], (uint64_t)&v7->_pyrHeights[1], 10, 1024, 32, v59);
                  goto LABEL_13;
                }
              }
            }
            goto LABEL_21;
          }
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v64 = FigSignalErrorAt();

    if (v64) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_21:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (FigSignalErrorAt())
    {
LABEL_16:
      v61 = 0;
      goto LABEL_14;
    }
  }
LABEL_13:
  v61 = v7;
LABEL_14:
  v62 = v61;

  return v62;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [RegPyrFusionShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v10 = 0;
  }
  else {
    int v10 = -12786;
  }
  objc_msgSend_prewarmRenderers_(RegPyrFusion, v8, (uint64_t)v3, v9);

  return v10;
}

+ (void)prewarmRenderers:(id)a3
{
  objc_msgSend_prewarmInternalMetalShadersForFormatsList_(a3, a2, (uint64_t)&unk_270E50970, v3);
}

- (void)scaleHomographyUsingCalib:(id *)a3 to:(id *)a4
{
  float v7 = truncf((float)(a3[2].var1.var1.var0 - a3[2].var1.var0.var0) + 1.0);
  float v8 = truncf((float)(a3[2].var1.var1.var1 - a3[2].var1.var0.var1) + 1.0);
  *(float *)&long long v4 = (float)self->_pyrWidths[1];
  float v9 = (float)self->_pyrHeights[1];
  *(float *)&unsigned int v62 = truncf((float)(a3[1].var2.var1.var0 - a3[1].var2.var0.var0) + 1.0) / *(float *)&v4;
  float v65 = truncf((float)(a3[1].var2.var1.var1 - a3[1].var2.var0.var1) + 1.0) / v9;
  float v58 = v9;
  long long v59 = v4;
  long long v69 = 0u;
  long long v70 = 0u;
  float v10 = v7 / *(float *)&v4;
  float32x4_t v68 = 0u;
  $B1B40AE7B40192423BFE885F22139C9A var2 = a3->var2;
  $B1B40AE7B40192423BFE885F22139C9A var1 = a3[1].var1;
  float32x4_t v77 = (float32x4_t)a3->var1;
  $B1B40AE7B40192423BFE885F22139C9A v78 = var2;
  long long v79 = (__int128)var1;
  long long v74 = xmmword_263117C70;
  long long v75 = xmmword_263117C80;
  long long v76 = xmmword_263117C90;
  long long v71 = xmmword_263117CA0;
  long long v72 = xmmword_263117CB0;
  long long v73 = xmmword_263117C90;
  float v13 = v8 / v9;
  double v14 = sub_262F8FE24((uint64_t)&v74, &v77, (float32x4_t *)&v71);
  v68.i32[2] = v15;
  DWORD2(v69) = v16;
  *(double *)v68.i64 = v14;
  *(void *)&long long v69 = v17;
  DWORD2(v70) = v18;
  *(void *)&long long v70 = v19;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = 1.0 / v13;
  float32x4_t v77 = (float32x4_t)COERCE_UNSIGNED_INT(1.0 / v10);
  $B1B40AE7B40192423BFE885F22139C9A v78 = ($B1B40AE7B40192423BFE885F22139C9A)v19;
  long long v79 = xmmword_263117C90;
  LODWORD(v17) = 0;
  *((float *)&v17 + 1) = v65;
  long long v74 = v62;
  long long v75 = v17;
  long long v76 = xmmword_263117C90;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  double v20 = sub_262F8FE24((uint64_t)&v77, &v68, (float32x4_t *)&v74);
  DWORD2(v71) = v21;
  DWORD2(v72) = v22;
  *(double *)&long long v71 = v20;
  *(void *)&long long v72 = v23.i64[0];
  DWORD2(v73) = v24;
  v23.i32[1] = 0;
  v23.i32[3] = 0;
  v23.f32[0] = 1.0 / *(float *)&v59;
  *(void *)&long long v73 = v25;
  v23.f32[2] = -0.5 / *(float *)&v59;
  LODWORD(v25) = 0;
  *((float *)&v25 + 1) = 1.0 / v58;
  $B1B40AE7B40192423BFE885F22139C9A v56 = ($B1B40AE7B40192423BFE885F22139C9A)v25;
  long long v26 = v25;
  *((float *)&v26 + 2) = -0.5 / v58;
  long long v27 = v59;
  DWORD1(v27) = 0;
  DWORD2(v27) = 0.5;
  float32x4_t v77 = v23;
  $B1B40AE7B40192423BFE885F22139C9A v78 = ($B1B40AE7B40192423BFE885F22139C9A)v26;
  LODWORD(v26) = 0;
  *((float *)&v26 + 1) = v58;
  long long v57 = (unint64_t)v26;
  LODWORD(v26) = 0;
  long long v79 = xmmword_263117C90;
  *((void *)&v26 + 1) = COERCE_UNSIGNED_INT(0.5);
  long long v74 = v27;
  long long v75 = v26;
  long long v76 = xmmword_263117C90;
  *(double *)&long long v28 = sub_262F8FE24((uint64_t)&v77, (float32x4_t *)&v71, (float32x4_t *)&v74);
  long long v60 = v28;
  long long v63 = v29;
  long long v66 = v30;
  id v31 = a4[1];
  uint64_t v35 = objc_msgSend_contents(v31, v32, v33, v34);
  uint64_t v36 = 0;
  *(void *)uint64_t v35 = v60;
  *(_DWORD *)(v35 + 8) = DWORD2(v60);
  *(_DWORD *)(v35 + 24) = DWORD2(v63);
  *(void *)(v35 + 16) = v63;
  *(void *)(v35 + 32) = v66;
  *(_DWORD *)(v35 + 40) = DWORD2(v66);
  uint64_t v37 = a4 + 2;
  do
  {
    v38 = (unsigned int *)((char *)self + 4 * v36);
    float v39 = (float)v38[86];
    float v40 = (float)v38[106];
    float v41 = *(float *)&v59 / v39;
    float v42 = v58 / v40;
    float32x4_t v43 = (float32x4_t)COERCE_UNSIGNED_INT(1.0 / *(float *)&v59);
    v43.f32[2] = -0.5 / v39;
    float v44 = -0.5 / v40;
    $B1B40AE7B40192423BFE885F22139C9A v45 = v56;
    v45.var1.var0 = v44;
    float32x4_t v77 = v43;
    $B1B40AE7B40192423BFE885F22139C9A v78 = v45;
    long long v79 = xmmword_263117C90;
    float32x4_t v46 = (float32x4_t)v59;
    v46.f32[2] = v41 * 0.5;
    long long v47 = v57;
    *((float *)&v47 + 2) = v42 * 0.5;
    long long v74 = (__int128)v46;
    long long v75 = v47;
    long long v76 = xmmword_263117C90;
    *(double *)&long long v48 = sub_262F8FE24((uint64_t)&v77, (float32x4_t *)&v71, (float32x4_t *)&v74);
    long long v61 = v48;
    long long v64 = v49;
    long long v67 = v50;
    id v51 = v37[v36];
    uint64_t v55 = objc_msgSend_contents(v51, v52, v53, v54);
    *(void *)uint64_t v55 = v61;
    *(_DWORD *)(v55 + 8) = DWORD2(v61);
    *(void *)(v55 + 16) = v64;
    *(_DWORD *)(v55 + 24) = DWORD2(v64);
    *(void *)(v55 + 32) = v67;
    *(_DWORD *)(v55 + 40) = DWORD2(v67);
    ++v36;
  }
  while (v36 != 9);
}

- (int)setupPyramidScalersUsingCalib
{
  id v5 = objc_msgSend_device(self->_metal, a2, v2, v3);
  float v7 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v5, v6, 16, 0);
  float v8 = self->_pyrScaleParamLevel0[1];
  self->_pyrScaleParamLevel0[1] = v7;

  if (!self->_pyrScaleParamLevel0[1]) {
    goto LABEL_11;
  }
  v12 = objc_msgSend_device(self->_metal, v9, v10, v11);
  double v14 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v12, v13, 16, 0);
  __int32 v15 = self->_pyrScaleParamLevel0[0];
  self->_pyrScaleParamLevel0[0] = v14;

  if (!self->_pyrScaleParamLevel0[0]) {
    goto LABEL_11;
  }
  unint64_t v19 = objc_msgSend_device(self->_metal, v16, v17, v18);
  __int32 v21 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v19, v20, 16, 0);
  int v22 = self->_pyrRoiScaleLevel0[1];
  self->_pyrRoiScaleLevel0[1] = v21;

  if (!self->_pyrRoiScaleLevel0[1]) {
    goto LABEL_11;
  }
  long long v26 = objc_msgSend_device(self->_metal, v23, v24, v25);
  long long v28 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v26, v27, 16, 0);
  long long v29 = self->_pyrRoiScaleLevel0[0];
  self->_pyrRoiScaleLevel0[0] = v28;

  if (!self->_pyrRoiScaleLevel0[0]) {
    goto LABEL_11;
  }
  unsigned int v30 = self->_pyrWidths[1];
  unsigned int v31 = self->_pyrHeights[1];
  v32 = self->_pyrScaleParamLevel0[1];
  uint64_t v36 = (_DWORD *)objc_msgSend_contents(v32, v33, v34, v35);
  if (!v36) {
    goto LABEL_11;
  }
  float v37 = (float)v30;
  float v38 = (float)v31;
  *(float *)&uint64_t v39 = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var0
                                 - self->_wideIsRefCalibData[1].var2.var0.var0)
                         + 1.0)
                 / v37;
  *uint64_t v36 = v39;
  *((float *)&v39 + 1) = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var1
                                       - self->_wideIsRefCalibData[1].var2.var0.var1)
                               + 1.0)
                       / (float)v31;
  *(void *)uint64_t v36 = v39;
  *(float *)&uint64_t v39 = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var0
                                 - self->_wideIsRefCalibData[2].var1.var0.var0)
                         + 1.0)
                 / v37;
  v36[2] = v39;
  *((float *)&v39 + 1) = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var1
                                       - self->_wideIsRefCalibData[2].var1.var0.var1)
                               + 1.0)
                       / (float)v31;
  *((void *)v36 + 1) = v39;
  float v40 = self->_pyrRoiScaleLevel0[1];
  float v44 = (_DWORD *)objc_msgSend_contents(v40, v41, v42, v43);
  if (!v44) {
    goto LABEL_11;
  }
  unsigned int var0 = self->_wideIsRefCalibData[1].var2.var0.var0;
  *float v44 = var0;
  LODWORD(v46) = var0;
  HIDWORD(v46) = self->_wideIsRefCalibData[1].var2.var0.var1;
  *(void *)float v44 = v46;
  unsigned int v47 = self->_wideIsRefCalibData[1].var2.var1.var0;
  v44[2] = v47;
  LODWORD(v46) = v47;
  HIDWORD(v46) = self->_wideIsRefCalibData[1].var2.var1.var1;
  *((void *)v44 + 1) = v46;
  long long v48 = self->_pyrScaleParamLevel0[0];
  v52 = (_DWORD *)objc_msgSend_contents(v48, v49, v50, v51);
  if (!v52)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  *(float *)&uint64_t v53 = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var0
                                 - self->_teleIsRefCalibData[1].var2.var0.var0)
                         + 1.0)
                 / v37;
  v52[2] = v53;
  *((float *)&v53 + 1) = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var1
                                       - self->_teleIsRefCalibData[1].var2.var0.var1)
                               + 1.0)
                       / v38;
  *((void *)v52 + 1) = v53;
  *(float *)&uint64_t v53 = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var0
                                 - self->_teleIsRefCalibData[2].var1.var0.var0)
                         + 1.0)
                 / v37;
  _DWORD *v52 = v53;
  *((float *)&v53 + 1) = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var1
                                       - self->_teleIsRefCalibData[2].var1.var0.var1)
                               + 1.0)
                       / v38;
  *(void *)v52 = v53;
  uint64_t v54 = self->_pyrRoiScaleLevel0[0];
  float v58 = (_DWORD *)objc_msgSend_contents(v54, v55, v56, v57);
  if (v58)
  {
    unsigned int v59 = self->_teleIsRefCalibData[2].var1.var0.var0;
    _DWORD *v58 = v59;
    LODWORD(v60) = v59;
    HIDWORD(v60) = self->_teleIsRefCalibData[2].var1.var0.var1;
    *(void *)float v58 = v60;
    unsigned int v61 = self->_teleIsRefCalibData[2].var1.var1.var0;
    v58[2] = v61;
    LODWORD(v60) = v61;
    HIDWORD(v60) = self->_teleIsRefCalibData[2].var1.var1.var1;
    *((void *)v58 + 1) = v60;
    return 0;
  }
  else
  {
LABEL_11:
    fig_log_get_emitter();
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
  id v129 = 0;
  uint64_t v17 = objc_msgSend_allocator(self->_metal, v14, v15, v16);
  double v20 = objc_msgSend_newTextureDescriptor_(v17, v18, 0, v19);

  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v125 = (uint64_t)v13;
  uint64_t v24 = objc_msgSend_width(v12, v21, v22, v23);
  long long v28 = objc_msgSend_desc(v20, v25, v26, v27);
  objc_msgSend_setWidth_(v28, v29, v24, v30);

  uint64_t v34 = objc_msgSend_height(v12, v31, v32, v33);
  float v38 = objc_msgSend_desc(v20, v35, v36, v37);
  objc_msgSend_setHeight_(v38, v39, v34, v40);

  float v44 = objc_msgSend_desc(v20, v41, v42, v43);
  objc_msgSend_setUsage_(v44, v45, 7, v46);

  uint64_t v50 = objc_msgSend_desc(v20, v47, v48, v49);
  objc_msgSend_setPixelFormat_(v50, v51, 65, v52);

  objc_msgSend_setLabel_(v20, v53, 0, v54);
  float v58 = objc_msgSend_allocator(self->_metal, v55, v56, v57);
  uint64_t v60 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v58, v59, (uint64_t)v20, 0);
  id v129 = v60;

  if (!v60)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
LABEL_13:
    id v13 = (id)v125;
    goto LABEL_8;
  }
  long long v64 = objc_msgSend_colorAttachments(v11, v61, v62, v63);
  long long v67 = objc_msgSend_objectAtIndexedSubscript_(v64, v65, 0, v66);
  objc_msgSend_setTexture_(v67, v68, (uint64_t)v60, v69);

  uint64_t v72 = objc_msgSend_renderCommandEncoderWithDescriptor_(v10, v70, (uint64_t)v11, v71);
  if (!v72)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();

    goto LABEL_13;
  }
  long long v76 = (void *)v72;
  float32x4_t v77 = objc_msgSend_fullRangeVertexBuf(self->_metal, v73, v74, v75);
  objc_msgSend_setVertexBuffer_offset_atIndex_(v76, v78, (uint64_t)v77, 0, 0);

  objc_msgSend_setFragmentTexture_atIndex_(v76, v79, (uint64_t)v12, 0);
  objc_msgSend_setRenderPipelineState_(v76, v80, (uint64_t)self->_shaders->_derivSobelPipelineState, v81);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v76, v82, 4, 0, 4);
  objc_msgSend_endEncoding(v76, v83, v84, v85);
  uint64_t v89 = objc_msgSend_width(v12, v86, v87, v88);
  uint64_t v93 = objc_msgSend_height(v12, v90, v91, v92);
  uint64_t v97 = objc_msgSend_computeCommandEncoder(v10, v94, v95, v96);
  if (!v97)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();

    goto LABEL_13;
  }
  v101 = (void *)v97;
  id v123 = v10;
  id v124 = v11;
  unint64_t v102 = (unint64_t)(v89 + 31) >> 5;
  unint64_t v103 = (unint64_t)(v93 + 31) >> 5;
  v104 = objc_msgSend_allocator(self->_metal, v98, v99, v100);
  int v108 = objc_msgSend_allocatorType(v104, v105, v106, v107);

  if (v108 == 2) {
    objc_msgSend_insertCompressedTextureReinterpretationFlush(v101, v109, v110, v111);
  }
  objc_msgSend_setImageblockWidth_height_(v101, v109, 32, 32);
  objc_msgSend_setComputePipelineState_(v101, v112, (uint64_t)self->_shaders->_derivPipelineState, v113);
  objc_msgSend_setTexture_atIndex_(v101, v114, (uint64_t)v12, 0);
  objc_msgSend_setTexture_atIndex_(v101, v115, (uint64_t)v60, 1);
  id v13 = (id)v125;
  objc_msgSend_setTexture_atIndex_(v101, v116, v125, 2);
  v128[0] = v102;
  v128[1] = v103;
  v128[2] = 1;
  int64x2_t v126 = vdupq_n_s64(0x10uLL);
  uint64_t v127 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v101, v117, (uint64_t)v128, (uint64_t)&v126);
  objc_msgSend_endEncoding(v101, v118, v119, v120);
  FigMetalDecRef();

  int v121 = 0;
  id v10 = v123;
  id v11 = v124;
LABEL_8:

  return v121;
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
  uint64_t v26 = objc_msgSend_colorAttachments(v21, v23, v24, v25);
  long long v29 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  objc_msgSend_setTexture_(v29, v30, (uint64_t)v20, v31);

  uint64_t v34 = objc_msgSend_renderCommandEncoderWithDescriptor_(v22, v32, (uint64_t)v21, v33);

  if (v34)
  {
    float v38 = objc_msgSend_fullRangeVertexBuf(self->_metal, v35, v36, v37);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v34, v39, (uint64_t)v38, 0, 0);

    objc_msgSend_setFragmentTexture_atIndex_(v34, v40, (uint64_t)v16, 0);
    objc_msgSend_setFragmentTexture_atIndex_(v34, v41, (uint64_t)v17, 1);
    objc_msgSend_setFragmentTexture_atIndex_(v34, v42, (uint64_t)v18, 2);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v34, v43, (uint64_t)v19, 0, 0);
    objc_msgSend_setRenderPipelineState_(v34, v44, (uint64_t)self->_shaders->_basicSearchLumaPipelineState, v45);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v34, v46, 4, 0, 4);
    objc_msgSend_endEncoding(v34, v47, v48, v49);
    int v50 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
  }

  return v50;
}

- (int)smoothShiftMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 input:(id)a5 output:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v17 = objc_msgSend_colorAttachments(v12, v14, v15, v16);
  id v20 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, 0, v19);
  objc_msgSend_setTexture_(v20, v21, (uint64_t)v11, v22);

  uint64_t v25 = objc_msgSend_renderCommandEncoderWithDescriptor_(v13, v23, (uint64_t)v12, v24);

  if (v25)
  {
    long long v29 = objc_msgSend_fullRangeVertexBuf(self->_metal, v26, v27, v28);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v25, v30, (uint64_t)v29, 0, 0);

    objc_msgSend_setFragmentTexture_atIndex_(v25, v31, (uint64_t)v10, 0);
    objc_msgSend_setRenderPipelineState_(v25, v32, (uint64_t)self->_shaders->_smoothPipelineState, v33);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v25, v34, 4, 0, 4);
    objc_msgSend_endEncoding(v25, v35, v36, v37);
    int v38 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
  }

  return v38;
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
  uint64_t v26 = objc_msgSend_colorAttachments(v21, v23, v24, v25);
  long long v29 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  objc_msgSend_setTexture_(v29, v30, (uint64_t)v20, v31);

  uint64_t v35 = objc_msgSend_width(v16, v32, v33, v34);
  uint64_t v39 = objc_msgSend_height(v16, v36, v37, v38);
  uint64_t v42 = objc_msgSend_renderCommandEncoderWithDescriptor_(v22, v40, (uint64_t)v21, v41);

  if (v42)
  {
    float v46 = 2.0 / (float)(1024.0 / sqrtf((float)(unint64_t)(v39 * v35)));
    unsigned int v47 = objc_msgSend_fullRangeVertexBuf(self->_metal, v43, v44, v45);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v42, v48, (uint64_t)v47, 0, 0);

    objc_msgSend_setFragmentTexture_atIndex_(v42, v49, (uint64_t)v16, 0);
    objc_msgSend_setFragmentTexture_atIndex_(v42, v50, (uint64_t)v17, 1);
    objc_msgSend_setFragmentTexture_atIndex_(v42, v51, (uint64_t)v18, 2);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v42, v52, (uint64_t)v19, 0, 0);
    float v62 = v46;
    objc_msgSend_setFragmentBytes_length_atIndex_(v42, v53, (uint64_t)&v62, 4, 1);
    objc_msgSend_setRenderPipelineState_(v42, v54, (uint64_t)self->_shaders->_selectionLumaPipelineState, v55);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v42, v56, 4, 0, 4);
    objc_msgSend_endEncoding(v42, v57, v58, v59);
    int v60 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
  }

  return v60;
}

- (RegPyrFusion)fusionWithCommandBuffer:(id)a3 refTex:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v142 = a3;
  id v16 = a4;
  id v144 = a5;
  id v17 = a6;
  id v18 = a7;
  id v143 = a8;
  id v19 = a9;
  id v147 = 0;
  uint64_t v23 = objc_msgSend_allocator(self->_metal, v20, v21, v22);
  uint64_t v27 = objc_msgSend_newTextureDescriptor(v23, v24, v25, v26);

  if (!v27) {
    goto LABEL_8;
  }
  uint64_t v31 = objc_msgSend_width(v18, v28, v29, v30);
  uint64_t v35 = objc_msgSend_desc(v27, v32, v33, v34);
  objc_msgSend_setWidth_(v35, v36, v31, v37);

  uint64_t v41 = objc_msgSend_height(v18, v38, v39, v40);
  uint64_t v45 = objc_msgSend_desc(v27, v42, v43, v44);
  objc_msgSend_setHeight_(v45, v46, v41, v47);

  uint64_t v51 = objc_msgSend_desc(v27, v48, v49, v50);
  objc_msgSend_setPixelFormat_(v51, v52, 115, v53);

  objc_msgSend_setLabel_(v27, v54, 0, v55);
  uint64_t v59 = objc_msgSend_allocator(self->_metal, v56, v57, v58);
  float v62 = objc_msgSend_newTextureWithDescriptor_(v59, v60, (uint64_t)v27, v61);
  id v147 = v62;

  if (!v62)
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v138 = (RegPyrFusion *)FigSignalErrorAt();
    v139 = v144;
    id v123 = v142;
    goto LABEL_7;
  }
  v141 = v27;
  uint64_t v66 = (uint64_t)v16;
  long long v67 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v63, v64, v65);
  if (!v67)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v138 = (RegPyrFusion *)FigSignalErrorAt();
    v139 = v144;
    uint64_t v27 = v141;
    id v123 = v142;
    goto LABEL_7;
  }
  uint64_t v71 = v67;
  uint64_t v72 = objc_msgSend_colorAttachments(v67, v68, v69, v70);
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(v72, v73, 0, v74);
  objc_msgSend_setTexture_(v75, v76, (uint64_t)v62, v77);

  uint64_t v81 = objc_msgSend_width(v144, v78, v79, v80);
  uint64_t v85 = objc_msgSend_height(v144, v82, v83, v84);
  uint64_t v88 = objc_msgSend_renderCommandEncoderWithDescriptor_(v142, v86, (uint64_t)v71, v87);
  if (!v88)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v138 = (RegPyrFusion *)FigSignalErrorAt();

    id v123 = v142;
LABEL_12:
    id v16 = (id)v66;
    uint64_t v27 = v141;
    v139 = v144;
    goto LABEL_7;
  }
  uint64_t v92 = (void *)v88;
  float v93 = 1.3 / (float)(1024.0 / sqrtf((float)(unint64_t)(v85 * v81)));
  v94 = objc_msgSend_fullRangeVertexBuf(self->_metal, v89, v90, v91);
  objc_msgSend_setVertexBuffer_offset_atIndex_(v92, v95, (uint64_t)v94, 0, 0);

  objc_msgSend_setFragmentTexture_atIndex_(v92, v96, v66, 0);
  objc_msgSend_setFragmentTexture_atIndex_(v92, v97, (uint64_t)v144, 1);
  objc_msgSend_setFragmentTexture_atIndex_(v92, v98, (uint64_t)v17, 2);
  objc_msgSend_setFragmentTexture_atIndex_(v92, v99, (uint64_t)v18, 3);
  objc_msgSend_setFragmentBuffer_offset_atIndex_(v92, v100, (uint64_t)v19, 0, 0);
  float v146 = v93;
  objc_msgSend_setFragmentBytes_length_atIndex_(v92, v101, (uint64_t)&v146, 4, 1);
  objc_msgSend_setRenderPipelineState_(v92, v102, (uint64_t)self->_shaders->_fusionXLumaPipelineState, v103);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v92, v104, 4, 0, 4);
  objc_msgSend_endEncoding(v92, v105, v106, v107);
  uint64_t v111 = objc_msgSend_colorAttachments(v71, v108, v109, v110);
  v114 = objc_msgSend_objectAtIndexedSubscript_(v111, v112, 0, v113);
  objc_msgSend_setTexture_(v114, v115, (uint64_t)v143, v116);

  uint64_t v119 = objc_msgSend_renderCommandEncoderWithDescriptor_(v142, v117, (uint64_t)v71, v118);

  id v123 = v142;
  if (!v119)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v138 = (RegPyrFusion *)FigSignalErrorAt();

    goto LABEL_12;
  }
  id v124 = objc_msgSend_fullRangeVertexBuf(self->_metal, v120, v121, v122);
  objc_msgSend_setVertexBuffer_offset_atIndex_(v119, v125, (uint64_t)v124, 0, 0);

  objc_msgSend_setFragmentTexture_atIndex_(v119, v126, v66, 0);
  objc_msgSend_setFragmentTexture_atIndex_(v119, v127, (uint64_t)v144, 1);
  objc_msgSend_setFragmentTexture_atIndex_(v119, v128, (uint64_t)v17, 2);
  objc_msgSend_setFragmentTexture_atIndex_(v119, v129, (uint64_t)v62, 3);
  objc_msgSend_setFragmentBuffer_offset_atIndex_(v119, v130, (uint64_t)v19, 0, 0);
  float v145 = v93;
  objc_msgSend_setFragmentBytes_length_atIndex_(v119, v131, (uint64_t)&v145, 4, 1);
  objc_msgSend_setRenderPipelineState_(v119, v132, (uint64_t)self->_shaders->_fusionYLumaPipelineState, v133);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v119, v134, 4, 0, 4);
  objc_msgSend_endEncoding(v119, v135, v136, v137);
  FigMetalDecRef();

  v138 = 0;
  id v16 = (id)v66;
  uint64_t v27 = v141;
  v139 = v144;
  id v123 = v142;
LABEL_7:

  return v138;
}

- (int)confidenceMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 shiftMap:(id)a5 confidenceOut:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v17 = objc_msgSend_allocator(self->_metal, v14, v15, v16);
  uint64_t v21 = objc_msgSend_newTextureDescriptor(v17, v18, v19, v20);

  if (!v21) {
    goto LABEL_8;
  }
  uint64_t v25 = objc_msgSend_colorAttachments(v11, v22, v23, v24);
  uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, 0, v27);
  objc_msgSend_setTexture_(v28, v29, (uint64_t)v13, v30);

  uint64_t v33 = objc_msgSend_renderCommandEncoderWithDescriptor_(v10, v31, (uint64_t)v11, v32);
  if (v33)
  {
    uint64_t v37 = (void *)v33;
    uint64_t v38 = objc_msgSend_fullRangeVertexBuf(self->_metal, v34, v35, v36);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v37, v39, (uint64_t)v38, 0, 0);

    objc_msgSend_setFragmentTexture_atIndex_(v37, v40, (uint64_t)v12, 0);
    objc_msgSend_setRenderPipelineState_(v37, v41, (uint64_t)self->_shaders->_confidenceStageOne, v42);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v37, v43, 4, 0, 4);
    objc_msgSend_endEncoding(v37, v44, v45, v46);
    uint64_t v50 = objc_msgSend_width(v12, v47, v48, v49);
    uint64_t v54 = objc_msgSend_desc(v21, v51, v52, v53);
    objc_msgSend_setWidth_(v54, v55, v50, v56);

    uint64_t v60 = objc_msgSend_height(v12, v57, v58, v59);
    uint64_t v64 = objc_msgSend_desc(v21, v61, v62, v63);
    objc_msgSend_setHeight_(v64, v65, v60, v66);

    uint64_t v70 = objc_msgSend_desc(v21, v67, v68, v69);
    objc_msgSend_setPixelFormat_(v70, v71, 25, v72);

    objc_msgSend_setLabel_(v21, v73, 0, v74);
    $B1B40AE7B40192423BFE885F22139C9A v78 = objc_msgSend_allocator(self->_metal, v75, v76, v77);
    uint64_t v81 = objc_msgSend_newTextureWithDescriptor_(v78, v79, (uint64_t)v21, v80);

    if (v81)
    {
      uint64_t v85 = objc_msgSend_colorAttachments(v11, v82, v83, v84);
      uint64_t v88 = objc_msgSend_objectAtIndexedSubscript_(v85, v86, 0, v87);
      objc_msgSend_setTexture_(v88, v89, (uint64_t)v81, v90);

      float v93 = objc_msgSend_renderCommandEncoderWithDescriptor_(v10, v91, (uint64_t)v11, v92);

      if (!v93) {
        goto LABEL_10;
      }
      uint64_t v97 = objc_msgSend_fullRangeVertexBuf(self->_metal, v94, v95, v96);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v93, v98, (uint64_t)v97, 0, 0);

      objc_msgSend_setFragmentTexture_atIndex_(v93, v99, (uint64_t)v13, 0);
      objc_msgSend_setRenderPipelineState_(v93, v100, (uint64_t)self->_shaders->_confidenceErode, v101);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v93, v102, 4, 0, 4);
      objc_msgSend_endEncoding(v93, v103, v104, v105);
      uint64_t v109 = objc_msgSend_colorAttachments(v11, v106, v107, v108);
      v112 = objc_msgSend_objectAtIndexedSubscript_(v109, v110, 0, v111);
      objc_msgSend_setTexture_(v112, v113, (uint64_t)v13, v114);

      v117 = objc_msgSend_renderCommandEncoderWithDescriptor_(v10, v115, (uint64_t)v11, v116);

      if (v117)
      {
        uint64_t v121 = objc_msgSend_fullRangeVertexBuf(self->_metal, v118, v119, v120);
        objc_msgSend_setVertexBuffer_offset_atIndex_(v117, v122, (uint64_t)v121, 0, 0);

        objc_msgSend_setFragmentTexture_atIndex_(v117, v123, (uint64_t)v81, 0);
        objc_msgSend_setRenderPipelineState_(v117, v124, (uint64_t)self->_shaders->_confidenceDilate, v125);
        objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v117, v126, 4, 0, 4);
        objc_msgSend_endEncoding(v117, v127, v128, v129);
        FigMetalDecRef();

        int v130 = 0;
      }
      else
      {
LABEL_10:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v130 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v130 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v130 = FigSignalErrorAt();
  }

  return v130;
}

- (int)bilinearScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTexIn:(id)a5 refTexOut:(id)a6 nonRefTexIn:(id)a7 nonRefTexOut:(id)a8 pyrLevel:(int)a9
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  uint64_t v24 = objc_msgSend_colorAttachments(v19, v21, v22, v23);
  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26);
  objc_msgSend_setTexture_(v27, v28, (uint64_t)v18, v29);

  uint64_t v33 = objc_msgSend_colorAttachments(v19, v30, v31, v32);
  uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v33, v34, 1, v35);
  objc_msgSend_setTexture_(v36, v37, (uint64_t)v17, v38);

  uint64_t v41 = objc_msgSend_renderCommandEncoderWithDescriptor_(v20, v39, (uint64_t)v19, v40);

  if (v41)
  {
    uint64_t v45 = objc_msgSend_fullRangeVertexBuf(self->_metal, v42, v43, v44);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v41, v46, (uint64_t)v45, 0, 0);

    objc_msgSend_setFragmentTexture_atIndex_(v41, v47, (uint64_t)v15, 0);
    objc_msgSend_setFragmentTexture_atIndex_(v41, v48, (uint64_t)v16, 1);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v41, v49, (uint64_t)self->_pyrScaleParams[a9], 0, 0);
    objc_msgSend_setRenderPipelineState_(v41, v50, (uint64_t)self->_shaders->_bilinearScalePipelineState, v51);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v41, v52, 4, 0, 4);
    objc_msgSend_endEncoding(v41, v53, v54, v55);
    int v56 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v56 = FigSignalErrorAt();
  }

  return v56;
}

- (int)initialDownScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTex:(id)a5 nonRefTex:(id)a6 refTexOut:(id)a7 nonRefTexOut:(id)a8 refCamType:(int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v24 = objc_msgSend_colorAttachments(v16, v21, v22, v23);
  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26);
  uint64_t v30 = v27;
  if (a9 == 1)
  {
    objc_msgSend_setTexture_(v27, v28, (uint64_t)v19, v29);

    uint64_t v34 = objc_msgSend_colorAttachments(v16, v31, v32, v33);
    uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v34, v35, 1, v36);
    objc_msgSend_setTexture_(v37, v38, (uint64_t)v20, v39);
  }
  else
  {
    objc_msgSend_setTexture_(v27, v28, (uint64_t)v20, v29);

    uint64_t v34 = objc_msgSend_colorAttachments(v16, v40, v41, v42);
    uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v34, v43, 1, v44);
    objc_msgSend_setTexture_(v37, v45, (uint64_t)v19, v46);
  }

  uint64_t v47 = v15;
  uint64_t v53 = objc_msgSend_renderCommandEncoderWithDescriptor_(v15, v48, (uint64_t)v16, v49);
  if (v53)
  {
    uint64_t v54 = objc_msgSend_fullRangeVertexBuf(self->_metal, v50, v51, v52);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v53, v55, (uint64_t)v54, 0, 0);

    if (a9 == 1) {
      uint64_t v57 = (uint64_t)v17;
    }
    else {
      uint64_t v57 = (uint64_t)v18;
    }
    if (a9 == 1) {
      uint64_t v58 = (uint64_t)v18;
    }
    else {
      uint64_t v58 = (uint64_t)v17;
    }
    objc_msgSend_setFragmentTexture_atIndex_(v53, v56, v57, 0);
    objc_msgSend_setFragmentTexture_atIndex_(v53, v59, v58, 1);
    uint64_t v60 = &self->super.isa + a9;
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v53, v61, (uint64_t)v60[68], 0, 0);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v53, v62, (uint64_t)v60[66], 0, 1);
    objc_msgSend_setRenderPipelineState_(v53, v63, (uint64_t)self->_shaders->_initialDownScalePipelineState, v64);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v53, v65, 4, 0, 4);
    objc_msgSend_endEncoding(v53, v66, v67, v68);
    int v69 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
  }

  return v69;
}

- (int)registerImagesWithReferenceImg:(id)a3 nonRefImage:(id)a4 refTexlvl1:(id)a5 nonRefTexlvl1:(id)a6 shiftMap:(id)a7 confidenceMap:(id)a8
{
  double v14 = (uint64_t *)a3;
  id v15 = (uint64_t *)a4;
  id v16 = a5;
  id v17 = a6;
  id v280 = a7;
  id v18 = a8;
  id v321 = 0;
  id v322 = 0;
  id v277 = v16;
  v278 = v17;
  v279 = v18;
  if (!v16) {
    goto LABEL_59;
  }
  if (!v17)
  {
LABEL_60:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    v281 = 0;
    goto LABEL_48;
  }
  if (!v280
    || !v18
    || objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_refPyr, v19, v14[2], v14[3], 0, self->_metal)|| objc_msgSend_setLumaTexture_chromaTexture_level_metal_(self->_nonRefPyr, v20, v15[2], v15[3], 0, self->_metal))
  {
LABEL_59:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    v281 = 0;
    id v17 = 0;
LABEL_48:
    uint64_t v68 = 0;
    goto LABEL_44;
  }
  objc_storeStrong((id *)&self->_refPyr->textureY[1], a5);
  objc_storeStrong((id *)&self->_nonRefPyr->textureY[1], a6);
  uint64_t v24 = objc_msgSend_allocator(self->_metal, v21, v22, v23);
  id v17 = (id)objc_msgSend_newTextureDescriptor(v24, v25, v26, v27);

  if (!v17) {
    goto LABEL_60;
  }
  uint64_t v31 = objc_msgSend_allocator(self->_metal, v28, v29, v30);
  uint64_t v34 = objc_msgSend_newTextureDescriptor_(v31, v32, 0, v33);

  v281 = (void *)v34;
  if (!v34) {
    goto LABEL_60;
  }
  uint64_t v35 = self->_pyrScaleParams[0];
  self->_pyrScaleParams[0] = 0;

  uint64_t v39 = 0;
  uint64_t v40 = (__int32 *)&self->_pyrHeights[2];
  uint64_t v41 = &self->_pyrWidths[1];
  do
  {
    uint64_t v42 = objc_msgSend_device(self->_metal, v36, v37, v38);
    uint64_t v44 = objc_msgSend_newBufferWithLength_options_(v42, v43, 8, 0);
    uint64_t v45 = *(void **)&v41[v39 + 57];
    *(void *)&v41[v39 + 57] = v44;

    uint64_t v46 = *(void **)&v41[v39 + 57];
    if (!v46)
    {
      fig_log_get_emitter();
LABEL_47:
      FigDebugAssert3();
      int v69 = FigSignalErrorAt();
      goto LABEL_48;
    }
    v47.i32[0] = *(v40 - 21);
    v47.i32[1] = *(v40 - 1);
    v48.i32[0] = *(v40 - 20);
    v48.i32[1] = *v40++;
    float32x2_t v49 = vdiv_f32(vcvt_f32_u32(v47), vcvt_f32_u32(v48));
    id v50 = v46;
    *(float32x2_t *)objc_msgSend_contents(v50, v51, v52, v53) = v49;
    v39 += 2;
  }
  while (v39 != 18);
  uint64_t v54 = objc_msgSend_width((void *)v14[2], v36, v37, v38);
  uint64_t v58 = objc_msgSend_height((void *)v14[2], v55, v56, v57);
  long long v301 = 0u;
  long long v302 = 0u;
  long long v303 = 0u;
  long long v304 = 0u;
  long long v305 = 0u;
  long long v306 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  long long v309 = 0u;
  long long v310 = 0u;
  long long v311 = 0u;
  long long v312 = 0u;
  long long v313 = 0u;
  long long v314 = 0u;
  long long v315 = 0u;
  long long v316 = 0u;
  long long v317 = 0u;
  long long v318 = 0u;
  long long v319 = 0u;
  long long v320 = 0u;
  long long v59 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  v286[0] = *MEMORY[0x263EF89A0];
  v286[1] = v59;
  long long v287 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  uint64_t v291 = 0;
  float v292 = (float)(unint64_t)(v54 - 1);
  float v293 = (float)(unint64_t)(v58 - 1);
  uint64_t v288 = 0;
  float v289 = v292;
  float v290 = v293;
  v294[0] = v286[0];
  v294[1] = v59;
  v294[2] = v287;
  uint64_t v298 = 0;
  float v299 = v292;
  float v300 = v293;
  uint64_t v295 = 0;
  float v296 = v292;
  float v297 = v293;
  self->_teleIsRefCalibData = ($10AF8B010540F2321E3C7DA4D2F3BE8C *)v294;
  self->_wideIsRefCalibData = ($10AF8B010540F2321E3C7DA4D2F3BE8C *)v286;
  objc_msgSend_scaleHomographyUsingCalib_to_(self, v60, (uint64_t)v294, (uint64_t)self->_pyrHomographyTeleIsRef);
  objc_msgSend_scaleHomographyUsingCalib_to_(self, v61, (uint64_t)self->_wideIsRefCalibData, (uint64_t)self->_pyrHomographyWideIsRef);
  if (objc_msgSend_setupPyramidScalersUsingCalib(self, v62, v63, v64))
  {
    uint64_t v68 = 0;
    int v69 = 0;
    goto LABEL_44;
  }
  uint64_t v70 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v65, v66, v67);
  if (!v70)
  {
    fig_log_get_emitter();
    goto LABEL_47;
  }
  uint64_t v74 = (void *)v70;
  uint64_t v75 = objc_msgSend_desc(v17, v71, v72, v73);
  objc_msgSend_setPixelFormat_(v75, v76, 25, v77);

  uint64_t v81 = objc_msgSend_desc(v17, v78, v79, v80);
  objc_msgSend_setUsage_(v81, v82, 7, v83);

  uint64_t v87 = &self->_pyrWidths[2];
  for (uint64_t i = 2; i != 11; ++i)
  {
    uint64_t v89 = *v87;
    uint64_t v90 = objc_msgSend_desc(v17, v84, v85, v86);
    objc_msgSend_setWidth_(v90, v91, v89, v92);

    uint64_t v93 = v87[20];
    uint64_t v97 = objc_msgSend_desc(v17, v94, v95, v96);
    objc_msgSend_setHeight_(v97, v98, v93, v99);

    objc_msgSend_setLabel_(v17, v100, 0, v101);
    uint64_t v105 = objc_msgSend_allocator(self->_metal, v102, v103, v104);
    uint64_t v108 = objc_msgSend_newTextureWithDescriptor_(v105, v106, (uint64_t)v17, v107);
    textureY = self->_refPyr->textureY;
    uint64_t v110 = textureY[i];
    textureY[i] = (MTLTexture *)v108;

    if (!self->_refPyr->textureY[i]) {
      goto LABEL_49;
    }
    objc_msgSend_setLabel_(v17, v111, 0, v112);
    uint64_t v116 = objc_msgSend_allocator(self->_metal, v113, v114, v115);
    uint64_t v119 = objc_msgSend_newTextureWithDescriptor_(v116, v117, (uint64_t)v17, v118);
    uint64_t v120 = self->_nonRefPyr->textureY;
    uint64_t v121 = v120[i];
    v120[i] = (MTLTexture *)v119;

    if (!self->_nonRefPyr->textureY[i]) {
      goto LABEL_49;
    }
    ++v87;
  }
  uint64_t v122 = objc_msgSend_commandBuffer(self->_metal, v84, v85, v86);
  if (!v122)
  {
LABEL_49:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    uint64_t v68 = v74;
    goto LABEL_44;
  }
  id v124 = (void *)v122;
  objc_msgSend_initialDownScaleWithCommandBuffer_renderPassDesc_refTex_nonRefTex_refTexOut_nonRefTexOut_refCamType_(self, v123, v122, (uint64_t)v74, self->_refPyr->textureY[0], self->_nonRefPyr->textureY[0], self->_refPyr->textureY[1], self->_nonRefPyr->textureY[1], 1);
  uint64_t v126 = 0;
  do
  {
    uint64_t v127 = &self->_refPyr->textureY[v126];
    uint64_t v128 = v127[1];
    uint64_t v129 = v127[2];
    int v130 = &self->_nonRefPyr->textureY[v126++];
    LODWORD(v272) = v126;
    objc_msgSend_bilinearScaleWithCommandBuffer_renderPassDesc_refTexIn_refTexOut_nonRefTexIn_nonRefTexOut_pyrLevel_(self, v125, (uint64_t)v124, (uint64_t)v74, v128, v129, v130[1], v130[2], v272);
  }
  while (v126 != 9);
  objc_msgSend_commit(self->_metal, v125, v131, v132);
  uint64_t v136 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v133, v134, v135);

  v282 = (void *)v136;
  if (!v136)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();

    goto LABEL_48;
  }
  v140 = objc_msgSend_commandBuffer(self->_metal, v137, v138, v139);

  if (v140)
  {
    v276 = v14;
    uint64_t v144 = 0;
    v283 = &self->_pyrHomographyWideIsRef[10];
    float v145 = &self->_pyrWidths[10];
    uint64_t v146 = 80;
    while (1)
    {
      v284 = 0;
      uint64_t v147 = *v145;
      v148 = objc_msgSend_desc(v17, v141, v142, v143);
      objc_msgSend_setWidth_(v148, v149, v147, v150);

      uint64_t v151 = v145[20];
      v155 = objc_msgSend_desc(v17, v152, v153, v154);
      objc_msgSend_setHeight_(v155, v156, v151, v157);

      v161 = objc_msgSend_desc(v17, v158, v159, v160);
      objc_msgSend_setPixelFormat_(v161, v162, 70, v163);

      v167 = objc_msgSend_desc(v17, v164, v165, v166);
      objc_msgSend_setUsage_(v167, v168, 7, v169);

      objc_msgSend_setLabel_(v17, v170, 0, v171);
      v175 = objc_msgSend_allocator(self->_metal, v172, v173, v174);
      v285 = objc_msgSend_newTextureWithDescriptor_(v175, v176, (uint64_t)v17, v177);

      if (!v285)
      {
LABEL_53:
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v68 = (void *)v136;
        goto LABEL_55;
      }
      uint64_t v68 = (void *)v136;
      objc_msgSend_generateDerivativesWithCommandBuffer_renderPassDesc_inputTex_outputTex_(self, v178, (uint64_t)v140, v136, self->_refPyr->textureY[v144 + 10]);
      objc_msgSend_setLabel_(v17, v179, 0, v180);
      v184 = objc_msgSend_allocator(self->_metal, v181, v182, v183);
      v284 = objc_msgSend_newTextureWithDescriptor_(v184, v185, (uint64_t)v17, v186);

      if (!v284) {
        break;
      }
      objc_msgSend_generateDerivativesWithCommandBuffer_renderPassDesc_inputTex_outputTex_(self, v187, (uint64_t)v140, v136, self->_nonRefPyr->textureY[v144 + 10]);
      v191 = objc_msgSend_desc(v17, v188, v189, v190);
      objc_msgSend_setPixelFormat_(v191, v192, 65, v193);

      objc_msgSend_setLabel_(v17, v194, 0, v195);
      v199 = objc_msgSend_allocator(self->_metal, v196, v197, v198);
      v202 = objc_msgSend_newTextureWithDescriptor_(v199, v200, (uint64_t)v17, v201);
      id v203 = v321;
      id v321 = v202;

      if (!v321) {
        break;
      }
      if (v144) {
        id v205 = v322;
      }
      else {
        id v205 = 0;
      }
      LODWORD(v273) = v144 + 10;
      objc_msgSend_basicSearchWithCommandBuffer_renderPassDesc_refDerivTex_nonRefDerivTex_prevShiftMap_nextShiftMap_homography_pyrLevel_(self, v204, (uint64_t)v140, v136, v285, v284, v205, v283[v144], v273);
      if (v144) {
        FigMetalDecRef();
      }
      objc_msgSend_setLabel_(v281, v206, 0, v207);
      v211 = objc_msgSend_desc(v281, v208, v209, v210);
      objc_msgSend_setPixelFormat_(v211, v212, 65, v213);

      uint64_t v214 = *v145;
      v218 = objc_msgSend_desc(v281, v215, v216, v217);
      objc_msgSend_setWidth_(v218, v219, v214, v220);

      uint64_t v221 = v145[20];
      v225 = objc_msgSend_desc(v281, v222, v223, v224);
      objc_msgSend_setHeight_(v225, v226, v221, v227);

      v231 = objc_msgSend_desc(v281, v228, v229, v230);
      objc_msgSend_setUsage_(v231, v232, 7, v233);

      v237 = objc_msgSend_allocator(self->_metal, v234, v235, v236);
      v239 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v237, v238, (uint64_t)v281, 0);
      id v240 = v322;
      id v322 = v239;

      if (!v322) {
        goto LABEL_53;
      }
      uint64_t v68 = (void *)v136;
      objc_msgSend_smoothShiftMapWithCommandBuffer_renderPassDesc_input_output_(self, v241, (uint64_t)v140, v136, v321);
      FigMetalDecRef();
      objc_msgSend_setLabel_(v17, v242, 0, v243);
      v247 = objc_msgSend_allocator(self->_metal, v244, v245, v246);
      v250 = objc_msgSend_newTextureWithDescriptor_(v247, v248, (uint64_t)v17, v249);
      id v251 = v321;
      id v321 = v250;

      if (!v321) {
        break;
      }
      LODWORD(v274) = v144 + 10;
      int ShiftMap_nextShiftMap_homography_pyrLevel = objc_msgSend_selectionWithCommandBuffer_renderPassDesc_refDerivTex_nonRefDerivTex_prevShiftMap_nextShiftMap_homography_pyrLevel_(self, v252, (uint64_t)v140, v136, v285, v284, v322, v283[v144], v274);
      if (ShiftMap_nextShiftMap_homography_pyrLevel) {
        goto LABEL_56;
      }
      FigMetalDecRef();
      objc_msgSend_setLabel_(v17, v254, 0, v255);
      if (v144 == -9)
      {
        id v259 = v280;
        id v260 = v322;
        id v322 = v259;
      }
      else
      {
        objc_msgSend_allocator(self->_metal, v256, v257, v258);
        id v260 = (id)objc_claimAutoreleasedReturnValue();
        v263 = objc_msgSend_newTextureWithDescriptor_(v260, v261, (uint64_t)v17, v262);
        id v264 = v322;
        id v322 = v263;
      }
      LODWORD(v275) = v144 + 10;
      int ShiftMap_nextShiftMap_homography_pyrLevel = objc_msgSend_fusionWithCommandBuffer_refTex_refDerivTex_nonRefDerivTex_prevShiftMap_nextShiftMap_homography_pyrLevel_(self, v265, (uint64_t)v140, (uint64_t)self->_refPyr->textureY[v144 + 10], v285, v284, v321, v322, v283[v144], v275);
      if (ShiftMap_nextShiftMap_homography_pyrLevel) {
        goto LABEL_56;
      }
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      if ((unint64_t)(v144 + 10) >= 2)
      {
        FigMetalDecRef();
        FigMetalDecRef();
      }

      v146 -= 8;
      unint64_t v266 = v144 + 10;
      --v144;
      --v145;
      if (v266 <= 1)
      {
        objc_msgSend_confidenceMapWithCommandBuffer_renderPassDesc_shiftMap_confidenceOut_(self, v141, (uint64_t)v140, v136, v280, v279);
        objc_msgSend_commit(self->_metal, v267, v268, v269);

        int v69 = 0;
        double v14 = v276;
        goto LABEL_44;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_55:
    int ShiftMap_nextShiftMap_homography_pyrLevel = FigSignalErrorAt();
LABEL_56:
    int v69 = ShiftMap_nextShiftMap_homography_pyrLevel;
    double v14 = v276;

LABEL_44:
    v270 = v277;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    v270 = v277;
    uint64_t v68 = v282;
  }

  return v69;
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