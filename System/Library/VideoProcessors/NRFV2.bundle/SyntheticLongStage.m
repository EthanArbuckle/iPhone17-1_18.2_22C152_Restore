@interface SyntheticLongStage
+ (int)_fillConstants:(SyntheticLongFuseBandsConsts *)a3 slPlist:(id)a4 ev0ExposureParams:(const exposureParameters *)a5;
+ (int)_fillConstantsForBand:(int)a3 consts:(SyntheticLongFuseBandsConsts *)a4 slPlist:(id)a5 ev0ExposureParams:(const exposureParameters *)a6;
+ (int)prewarmShaders:(id)a3;
- (SidecarWriter)sidecarWriter;
- (SyntheticLongStage)initWithMetalContext:(id)a3;
- (int)_doEv0sPlusRealLongWithBands:(id)a3 slFuseEv0Plist:(id)a4 slFuseLongPlist:(id)a5 slParameters:(const SyntheticLongParameters *)a6 slOutput:(id)a7 noiseDivisorTex:(id)a8 realLongNoiseDivisorTex:(id)a9 lscGainsTex:(id)a10 intermediateMetadata:(id)a11;
- (int)_fuseEv0s:(id)a3 slParameters:(const SyntheticLongParameters *)a4 slPlist:(id)a5 lscGainsTex:(id)a6 outputLuma:(id)a7 outputChroma:(id)a8 outputWeightsPyramid:(id)a9 noiseDivisorTex:(id)a10 intermediateMetadata:(id)a11;
- (int)_fuseInLong:(id)a3 slParameters:(const SyntheticLongParameters *)a4 slPlist:(id)a5 lscGainsTex:(id)a6 fusedEv0sPyramid:(id)a7 weightsPyramid:(id)a8 slOutput:(id)a9 noiseDivisorTex:(id)a10 realLongNoiseDivisorTex:(id)a11;
- (int)doSyntheticLongWithBands:(id)a3 slFuseEv0Plist:(id)a4 slFuseLongPlist:(id)a5 slParameters:(const SyntheticLongParameters *)a6 slOutput:(id)a7 noiseDivisorTex:(id)a8 realLongNoiseDivisorTex:(id)a9 lscGainsTex:(id)a10 intermediateMetadata:(id)a11;
- (int)pyramidDownscale:(id)a3;
- (int)pyramidDownscale:(id)a3 cscParams:(const ColorSpaceConversionParameters *)a4 band0IsLinearYCbCr:(BOOL)a5;
- (void)dealloc;
- (void)setSidecarWriter:(id)a3;
@end

@implementation SyntheticLongStage

- (SyntheticLongStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SyntheticLongStage;
  v6 = [(SyntheticLongStage *)&v19 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(SyntheticLongShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);
    v15 = (void *)v7[2];
    v7[2] = v14;

    v16 = v7;
    if (!v7[2])
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v16 = 0;
      }
      else {
        v16 = v7;
      }
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [SyntheticLongShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (void)dealloc
{
  objc_msgSend_purgeResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)SyntheticLongStage;
  [(SyntheticLongStage *)&v5 dealloc];
}

- (int)pyramidDownscale:(id)a3
{
  return objc_msgSend_pyramidDownscale_cscParams_band0IsLinearYCbCr_(self, a2, (uint64_t)a3, 0, 0);
}

- (int)pyramidDownscale:(id)a3 cscParams:(const ColorSpaceConversionParameters *)a4 band0IsLinearYCbCr:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v11 = (uint64_t *)v7;
  int v12 = *((_DWORD *)v7 + 2);
  BOOL v86 = a4 && HIBYTE(a4[3].transferFunctionInv.nonLinearPower) && *((void *)v7 + 82) != 0;
  if (v12 < 2)
  {
    int v82 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    v15 = 0;
    v16 = 0;
    uint64_t v85 = (v12 - 1);
    if (v86) {
      int v17 = 64;
    }
    else {
      int v17 = 0;
    }
    if (v5) {
      int v18 = 128;
    }
    else {
      int v18 = 0;
    }
    unsigned int v84 = v17 | v18;
    while (1)
    {
      objc_super v19 = v14;
      v20 = objc_msgSend_commandQueue(self->_metal, v8, v9, v10);
      uint64_t v14 = objc_msgSend_commandBuffer(v20, v21, v22, v23);

      if (!v14) {
        break;
      }
      uint64_t v27 = objc_msgSend_width((void *)v11[v13 + 43], v24, v25, v26);
      uint64_t v31 = objc_msgSend_height((void *)v11[v13 + 43], v28, v29, v30);
      v35 = objc_msgSend_computeCommandEncoder(v14, v32, v33, v34);

      if (!v35)
      {
        FigDebugAssert3();
        int v82 = FigSignalErrorAt();
        goto LABEL_34;
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v95 = 0u;
      if (a4)
      {
        long long v37 = *(_OWORD *)&a4[3].transferFunctionInv.linearScale;
        long long v105 = *(_OWORD *)&a4[3].transferFunctionFwd.linearThreshold;
        long long v106 = v37;
        long long v107 = *(_OWORD *)&a4[3].transferFunctionInv.nonLinearPower;
        long long v38 = *(_OWORD *)&a4[2].transferFunctionFwd.nonLinearScale;
        long long v101 = *(_OWORD *)&a4[1].finalScale;
        long long v102 = v38;
        long long v39 = *(_OWORD *)&a4[2].finalScaleFwd;
        long long v103 = *(_OWORD *)&a4[2].transferFunctionInv.linearThreshold;
        long long v104 = v39;
        long long v40 = *(_OWORD *)&a4->outputToLinearYCbCr;
        long long v97 = *(_OWORD *)&a4->transferFunctionInv.nonLinearBias;
        long long v98 = v40;
        long long v41 = *(_OWORD *)&a4[1].transferFunctionInv.nonLinearScale;
        long long v99 = *(_OWORD *)&a4[1].transferFunctionFwd.nonLinearBias;
        long long v100 = v41;
        long long v42 = *(_OWORD *)&a4->transferFunctionFwd.nonLinearPower;
        long long v95 = *(_OWORD *)&a4->transferFunctionFwd.linearScale;
        long long v96 = v42;
      }
      char v43 = !v86;
      if (v13) {
        char v43 = 1;
      }
      if (v43)
      {
        objc_msgSend_setTexture_atIndex_(v35, v36, v11[v13 + 42], 0);
        objc_msgSend_setTexture_atIndex_(v35, v46, v11[v13 + 62], 1);
      }
      else
      {
        objc_msgSend_setTexture_atIndex_(v35, v36, v11[82], 0);
        objc_msgSend_setTexture_atIndex_(v35, v44, 0, 1);
      }
      objc_msgSend_setTexture_atIndex_(v35, v45, v11[v13 + 43], 2);
      objc_msgSend_setTexture_atIndex_(v35, v47, v11[v13 + 63], 3);
      objc_msgSend_setBytes_length_atIndex_(v35, v48, (uint64_t)&v95, 208, 0);
      shaders = self->_shaders;
      if (!a4 || v13)
      {
        v52 = objc_msgSend_getKernel_(shaders, v49, 0, v50);

        if (!v52)
        {
LABEL_42:
          FigDebugAssert3();
          int v82 = FigSignalErrorAt();
LABEL_33:
          v16 = v35;
LABEL_34:
          v15 = v14;
          goto LABEL_35;
        }
        uint64_t v57 = 16;
        uint64_t v58 = 64;
      }
      else
      {
        v52 = objc_msgSend_getKernel_configFlags_(shaders, v49, 0, v84);

        if (!v52) {
          goto LABEL_42;
        }
        if (objc_msgSend_threadExecutionWidth(v52, v53, v54, v55) != 32)
        {
          FigDebugAssert3();
          int v82 = FigSignalErrorAt();

          goto LABEL_33;
        }
        uint64_t v57 = 18;
        uint64_t v58 = 16;
      }
      v16 = v52;
      objc_msgSend_setImageblockWidth_height_(v35, v56, 16, v58);
      objc_msgSend_setComputePipelineState_(v35, v59, (uint64_t)v52, v60);
      v94[0] = (unint64_t)(v27 + 15) >> 4;
      v94[1] = (unint64_t)(v31 + 15) >> 4;
      v94[2] = 1;
      uint64_t v92 = v57;
      long long v93 = xmmword_263117DB0;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v35, v61, (uint64_t)v94, (uint64_t)&v92);
      objc_msgSend_endEncoding(v35, v62, v63, v64);
      if (*MEMORY[0x263F00E10])
      {
        v68 = objc_msgSend_commandQueue(v14, v65, v66, v67);
        v72 = objc_msgSend_commandBuffer(v68, v69, v70, v71);

        objc_msgSend_setLabel_(v72, v73, @"KTRACE_MTLCMDBUF", v74);
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = sub_262FB57B4;
        v90[3] = &unk_2655C3570;
        int v91 = v13;
        objc_msgSend_addCompletedHandler_(v72, v75, (uint64_t)v90, v76);
        objc_msgSend_commit(v72, v77, v78, v79);
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = sub_262FB57E8;
        v88[3] = &unk_2655C3570;
        int v89 = v13;
        objc_msgSend_addCompletedHandler_(v14, v80, (uint64_t)v88, v81);
      }
      ++v13;
      objc_msgSend_commit(v14, v65, v66, v67);
      v15 = v35;
      if (v85 == v13)
      {

        int v82 = 0;
        goto LABEL_33;
      }
    }
    FigDebugAssert3();
    int v82 = FigSignalErrorAt();
LABEL_35:
  }
  return v82;
}

+ (int)_fillConstants:(SyntheticLongFuseBandsConsts *)a3 slPlist:(id)a4 ev0ExposureParams:(const exposureParameters *)a5
{
  id v7 = (uint64_t *)a4;
  int v8 = v7;
  if (!a3) {
    goto LABEL_7;
  }
  if (!v7) {
    goto LABEL_7;
  }
  if (!a5) {
    goto LABEL_7;
  }
  float gain = a5->gain;
  a3[3].var7.var1 = sub_262FCDA18(v7[7], a5->gain);
  a3[4].var0[0].transferFunctionFwd.nonLinearPower = sub_262FCDA18(v8[2], gain);
  a3[4].var0[0].transferFunctionInv.linearScale = sub_262FCDA18(v8[3], gain);
  a3[4].var0[0].transferFunctionFwd.linearScale = sub_262FCDA18(v8[4], gain);
  a3[4].var0[0].transferFunctionFwd.linearThreshold = sub_262FCDA18(v8[5], gain);
  a3[4].var0[0].transferFunctionFwd.nonLinearScale = sub_262FCDA18(v8[6], gain);
  objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v10, (uint64_t)a5, v8[8]);
  a3[4].var0[0].transferFunctionInv.nonLinearBias = v11;
  if (objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v12, (uint64_t)&a3[3].var0[3], (uint64_t)a5))
  {
    int v13 = 0;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

+ (int)_fillConstantsForBand:(int)a3 consts:(SyntheticLongFuseBandsConsts *)a4 slPlist:(id)a5 ev0ExposureParams:(const exposureParameters *)a6
{
  uint64_t v9 = (void **)a5;
  int v12 = v9;
  if (a4 && v9 && a6)
  {
    float gain = a6->gain;
    uint64_t v14 = a3;
    objc_msgSend_objectAtIndexedSubscript_(v9[1], v10, a3, v11);
    v15 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v38 = sub_262FCDA18(v15[1], gain);

    objc_msgSend_objectAtIndexedSubscript_(v12[1], v16, v14, v17);
    int v18 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v37 = sub_262FCDA18(v18[2], gain);

    objc_msgSend_objectAtIndexedSubscript_(v12[1], v19, v14, v20);
    v21 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v36 = sub_262FCDA18(v21[3], gain);

    objc_msgSend_objectAtIndexedSubscript_(v12[1], v22, v14, v23);
    v24 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v35 = sub_262FCDA18(v24[4], gain);

    objc_msgSend_objectAtIndexedSubscript_(v12[1], v25, v14, v26);
    uint64_t v27 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v28 = sub_262FCDA18(v27[5], gain);

    objc_msgSend_objectAtIndexedSubscript_(v12[1], v29, v14, v30);
    uint64_t v31 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v32 = sub_262FCDA18(v31[6], gain);

    int v33 = 0;
    a4[3].var5.var2 = v37;
    *(void *)&a4[3].var5.var0 = __PAIR64__(LODWORD(v37), LODWORD(v38));
    a4[3].var6 = v35;
    *(void *)&a4[3].var5.var4 = __PAIR64__(LODWORD(v35), LODWORD(v36));
    a4[4].var0[0].transferFunctionInv.linearThreshold = v28;
    a4[4].var0[0].transferFunctionInv.nonLinearScale = v32;
  }
  else
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
  }

  return v33;
}

- (int)_fuseEv0s:(id)a3 slParameters:(const SyntheticLongParameters *)a4 slPlist:(id)a5 lscGainsTex:(id)a6 outputLuma:(id)a7 outputChroma:(id)a8 outputWeightsPyramid:(id)a9 noiseDivisorTex:(id)a10 intermediateMetadata:(id)a11
{
  *(void *)&v425[12] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v400 = a5;
  id v399 = a6;
  id v387 = a7;
  id v386 = a8;
  v406 = (id *)a9;
  id v16 = a10;
  id v20 = a11;
  id v422 = 0;
  id v423 = 0;
  id v421 = 0;
  v21 = (int *)MEMORY[0x263F00E10];
  int v22 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v22 = *v21;
  }
  if (v22)
  {
    uint64_t v23 = objc_msgSend_commandQueue(self->_metal, v17, v18, v19);
    uint64_t v27 = objc_msgSend_commandBuffer(v23, v24, v25, v26);

    objc_msgSend_setLabel_(v27, v28, @"KTRACE_START_MTL", v29);
    objc_msgSend_addCompletedHandler_(v27, v30, (uint64_t)&unk_270E34168, v31);
    objc_msgSend_commit(v27, v32, v33, v34);
  }
  v383 = v20;
  if (!v15) {
    goto LABEL_25;
  }
  float v35 = (SyntheticLongParameters *)a4;
  if (!a4)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    goto LABEL_26;
  }
  if (!v400) {
    goto LABEL_25;
  }
  if (!v399) {
    goto LABEL_25;
  }
  uint64_t var1 = a4->var1;
  if ((var1 & 0x80000000) != 0) {
    goto LABEL_25;
  }
  int v424 = a4->var1;
  int var0 = a4->var0;
  if (a4->var0 < 1) {
    goto LABEL_25;
  }
  int v38 = 0;
  int v39 = 1;
  do
  {
    if (var1 != v38 && v38 != a4->var2)
    {
      if (v39 > 3) {
        goto LABEL_25;
      }
      *(_DWORD *)&v425[4 * v39++ - 4] = v38;
    }
    ++v38;
  }
  while (var0 != v38);
  if ((v39 - 5) <= 0xFFFFFFFC || !v16 && v39 == 4)
  {
LABEL_25:
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    float v35 = 0;
LABEL_26:
    v397 = 0;
    v398 = 0;
LABEL_27:
    v388 = 0;
    v77 = 0;
    uint64_t v78 = 0;
    v410 = 0;
    goto LABEL_106;
  }
  objc_msgSend_objectAtIndexedSubscript_(v15, v17, var1, v19);
  v398 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  long long v40 = (char *)a4 + 224128 * a4->var1;
  long long v41 = v40 + 304;
  int v396 = v40[211];
  bzero(v415, 0x4E0uLL);
  float v417 = (float)v39;
  v395 = v41;
  if (objc_msgSend__fillConstants_slPlist_ev0ExposureParams_(SyntheticLongStage, v42, (uint64_t)v415, (uint64_t)v400, v41))
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    float v35 = 0;
    v397 = 0;
    goto LABEL_27;
  }
  v411 = v15;
  float v47 = v420;
  *(float *)&double v46 = v420;
  v48 = objc_msgSend_numberWithFloat_(NSNumber, v43, v44, v45, v46);
  objc_msgSend_setObject_forKeyedSubscript_(v20, v49, (uint64_t)v48, @"syntheticLongPedestal");

  uint64_t v53 = 0;
  uint64_t v54 = v39;
  uint64_t v55 = 864;
  long long v56 = *MEMORY[0x263EF89A0];
  long long v57 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v58 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  v59 = v415;
  do
  {
    uint64_t v60 = (char *)a4 + 224128 * *(_DWORD *)&v425[v53 - 4];
    long long v61 = *((_OWORD *)v60 + 4);
    v59[2] = *((_OWORD *)v60 + 3);
    v59[3] = v61;
    long long v62 = *((_OWORD *)v60 + 8);
    v59[6] = *((_OWORD *)v60 + 7);
    v59[7] = v62;
    long long v63 = *((_OWORD *)v60 + 6);
    v59[4] = *((_OWORD *)v60 + 5);
    v59[5] = v63;
    long long v64 = *((_OWORD *)v60 + 13);
    long long v65 = *((_OWORD *)v60 + 11);
    v59[11] = *((_OWORD *)v60 + 12);
    v59[12] = v64;
    long long v66 = *((_OWORD *)v60 + 10);
    v59[8] = *((_OWORD *)v60 + 9);
    v59[9] = v66;
    v59[10] = v65;
    long long v67 = *((_OWORD *)v60 + 2);
    _OWORD *v59 = *((_OWORD *)v60 + 1);
    v59[1] = v67;
    v59 += 13;
    *(_DWORD *)&v418[v53] = *((_DWORD *)v60 + 56);
    v68 = &v415[v55];
    _OWORD *v68 = v56;
    v68[1] = v57;
    v53 += 4;
    v55 += 48;
    v68[2] = v58;
  }
  while (4 * v39 != v53);
  float v69 = v419;
  uint64_t v70 = v398[2];
  int v71 = v70 - 1;
  v72 = self;
  int v390 = v39;
  v384 = v16;
  if (v406)
  {
    v388 = 0;
  }
  else
  {
    uint64_t v79 = objc_msgSend_allocator(self->_metal, v50, v51, v52);
    v77 = objc_msgSend_newTextureDescriptor(v79, v80, v81, v82);

    if (!v77)
    {
      FigDebugAssert3();
      int v76 = FigSignalErrorAt();
      v408 = 0;
      id v409 = 0;
      v405 = 0;
      float v35 = 0;
      v397 = 0;
      v388 = 0;
      uint64_t v78 = 0;
      v410 = 0;
      id v15 = v411;
      v21 = (int *)MEMORY[0x263F00E10];
      goto LABEL_106;
    }
    uint64_t v86 = objc_msgSend_width(*(void **)&v398[2 * v71 + 84], v83, v84, v85);
    v90 = objc_msgSend_desc(v77, v87, v88, v89);
    objc_msgSend_setWidth_(v90, v91, v86, v92);

    uint64_t v96 = objc_msgSend_height(*(void **)&v398[2 * v71 + 84], v93, v94, v95);
    long long v100 = objc_msgSend_desc(v77, v97, v98, v99);
    objc_msgSend_setHeight_(v100, v101, v96, v102);

    long long v106 = objc_msgSend_desc(v77, v103, v104, v105);
    objc_msgSend_setUsage_(v106, v107, 3, v108);

    v388 = v77;
    v112 = objc_msgSend_desc(v77, v109, v110, v111);
    objc_msgSend_setPixelFormat_(v112, v113, 25, v114);
  }
  v115 = objc_msgSend_allocator(self->_metal, v50, v51, v52);
  v77 = objc_msgSend_newTextureDescriptor(v115, v116, v117, v118);

  if (!v77)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    float v35 = 0;
    v397 = 0;
LABEL_135:
    uint64_t v78 = 0;
    v410 = 0;
    id v15 = v411;
    v21 = (int *)MEMORY[0x263F00E10];
    id v16 = v384;
    goto LABEL_106;
  }
  uint64_t v122 = objc_msgSend_width(*(void **)&v398[2 * v71 + 84], v119, v120, v121);
  v126 = objc_msgSend_desc(v77, v123, v124, v125);
  objc_msgSend_setWidth_(v126, v127, v122, v128);

  uint64_t v132 = objc_msgSend_height(*(void **)&v398[2 * v71 + 84], v129, v130, v131);
  v136 = objc_msgSend_desc(v77, v133, v134, v135);
  objc_msgSend_setHeight_(v136, v137, v132, v138);

  v142 = objc_msgSend_desc(v77, v139, v140, v141);
  objc_msgSend_setUsage_(v142, v143, 3, v144);

  v397 = v77;
  v148 = objc_msgSend_desc(v77, v145, v146, v147);
  objc_msgSend_setPixelFormat_(v148, v149, 25, v150);

  v154 = objc_msgSend_allocator(self->_metal, v151, v152, v153);
  v158 = (SyntheticLongParameters *)objc_msgSend_newTextureDescriptor(v154, v155, v156, v157);

  if (!v158)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    float v35 = 0;
    v77 = 0;
    goto LABEL_135;
  }
  uint64_t v394 = (v70 - 1);
  uint64_t v162 = objc_msgSend_width(*(void **)&v398[2 * v71 + 124], v159, v160, v161);
  v166 = objc_msgSend_desc(v158, v163, v164, v165);
  objc_msgSend_setWidth_(v166, v167, v162, v168);

  uint64_t v172 = objc_msgSend_height(*(void **)&v398[2 * v71 + 124], v169, v170, v171);
  v176 = objc_msgSend_desc(v158, v173, v174, v175);
  objc_msgSend_setHeight_(v176, v177, v172, v178);

  v182 = objc_msgSend_desc(v158, v179, v180, v181);
  objc_msgSend_setUsage_(v182, v183, 3, v184);

  v402 = v158;
  v188 = objc_msgSend_desc(v158, v185, v186, v187);
  objc_msgSend_setPixelFormat_(v188, v189, 65, v190);

  if ((int)v70 >= 1)
  {
    v410 = 0;
    uint64_t v78 = 0;
    v404 = 0;
    uint64_t v191 = 16;
    if (v390 == 4) {
      uint64_t v191 = 8;
    }
    unint64_t v401 = v191;
    uint64_t v192 = 256;
    if (v390 == 4) {
      uint64_t v192 = 64;
    }
    uint64_t v392 = v54;
    unint64_t v393 = v192;
    char v193 = 1;
    if (v390 == 4) {
      char v193 = 2;
    }
    char v391 = v193;
    uint64_t v385 = v54 - 1;
    while (1)
    {
      uint64_t v194 = v70--;
      if (objc_msgSend__fillConstantsForBand_consts_slPlist_ev0ExposureParams_(SyntheticLongStage, v73, v70, (uint64_t)v415, v400, v395))
      {
LABEL_117:
        FigDebugAssert3();
        int v76 = FigSignalErrorAt();
        v408 = 0;
        v405 = 0;
LABEL_123:
        id v409 = 0;
        goto LABEL_104;
      }
      v198 = objc_msgSend_commandQueue(v72->_metal, v195, v196, v197);
      v202 = objc_msgSend_commandBuffer(v198, v199, v200, v201);

      if (!v202) {
        break;
      }
      uint64_t v206 = objc_msgSend_width(*(void **)&v398[2 * v70 + 84], v203, v204, v205);
      uint64_t v210 = objc_msgSend_height(*(void **)&v398[2 * v70 + 84], v207, v208, v209);
      v410 = v202;
      v214 = objc_msgSend_computeCommandEncoder(v202, v211, v212, v213);

      if (!v214)
      {
        FigDebugAssert3();
        int v76 = FigSignalErrorAt();
        v408 = 0;
        id v409 = 0;
        v405 = 0;
        uint64_t v78 = 0;
        goto LABEL_104;
      }
      uint64_t v78 = v214;
      uint64_t v403 = v206;
      v216.i64[0] = v206;
      v216.i64[1] = v210;
      float32x2_t v416 = vdiv_f32((float32x2_t)0x3F0000003F000000, vcvt_f32_f64(vcvtq_f64_u64(v216)));
      if (v70)
      {
        objc_msgSend_setBytes_length_atIndex_(v214, v215, (uint64_t)v415, 1248, 1);
        v217 = v397;
        objc_msgSend_setLabel_(v397, v218, 0, v219);
        v223 = objc_msgSend_allocator(v72->_metal, v220, v221, v222);
        uint64_t v226 = objc_msgSend_newTextureWithDescriptor_(v223, v224, (uint64_t)v397, v225);

        v405 = (void *)v226;
        uint64_t v229 = v394;
        if (!v226) {
          goto LABEL_117;
        }
        objc_msgSend_setLabel_(v402, v227, 0, v228);
        v233 = objc_msgSend_allocator(v72->_metal, v230, v231, v232);
        uint64_t v236 = objc_msgSend_newTextureWithDescriptor_(v233, v234, (uint64_t)v402, v235);

        v408 = (void *)v236;
        if (!v236)
        {
          FigDebugAssert3();
          int v76 = FigSignalErrorAt();
          v408 = 0;
          goto LABEL_123;
        }
      }
      else
      {
        v240 = &v424;
        uint64_t v241 = v54;
        uint64_t v242 = 864;
        v217 = v397;
        uint64_t v229 = v394;
        do
        {
          v243 = &v415[v242];
          int v244 = *v240++;
          v245 = &a4->var0 + 56032 * v244;
          long long v246 = *((_OWORD *)v245 + 16);
          _OWORD *v243 = *((_OWORD *)v245 + 15);
          v243[1] = v246;
          v243[2] = *((_OWORD *)v245 + 17);
          v242 += 48;
          --v241;
        }
        while (v241);
        objc_msgSend_setBytes_length_atIndex_(v214, v215, (uint64_t)v415, 1248, 1);
        v408 = 0;
        v405 = 0;
      }
      v247 = objc_msgSend_desc(v217, v237, v238, v239);
      uint64_t v251 = objc_msgSend_width(v247, v248, v249, v250);
      objc_msgSend_setWidth_(v247, v252, 2 * v251, v253);

      v257 = objc_msgSend_desc(v217, v254, v255, v256);
      uint64_t v261 = objc_msgSend_height(v257, v258, v259, v260);
      objc_msgSend_setHeight_(v257, v262, 2 * v261, v263);

      v267 = objc_msgSend_desc(v402, v264, v265, v266);
      uint64_t v271 = objc_msgSend_width(v267, v268, v269, v270);
      objc_msgSend_setWidth_(v267, v272, 2 * v271, v273);

      v277 = objc_msgSend_desc(v402, v274, v275, v276);
      uint64_t v281 = objc_msgSend_height(v277, v278, v279, v280);
      objc_msgSend_setHeight_(v277, v282, 2 * v281, v283);

      if (v406)
      {
        id v409 = v406[v70 + 42];
      }
      else
      {
        if (v70)
        {
          v288 = v388;
          objc_msgSend_setLabel_(v388, v284, 0, v285);
          v292 = objc_msgSend_allocator(v72->_metal, v289, v290, v291);
          id v295 = (id)objc_msgSend_newTextureWithDescriptor_(v292, v293, (uint64_t)v388, v294);

          if (!v295) {
            goto LABEL_122;
          }
        }
        else
        {
          id v295 = v384;
          v288 = v388;
          if (!v295)
          {
LABEL_122:
            FigDebugAssert3();
            int v76 = FigSignalErrorAt();
            goto LABEL_123;
          }
        }
        id v409 = v295;
        v299 = objc_msgSend_desc(v288, v296, v297, v298);
        uint64_t v303 = objc_msgSend_width(v299, v300, v301, v302);
        objc_msgSend_setWidth_(v299, v304, 2 * v303, v305);

        v309 = objc_msgSend_desc(v288, v306, v307, v308);
        uint64_t v313 = objc_msgSend_height(v309, v310, v311, v312);
        objc_msgSend_setHeight_(v309, v314, 2 * v313, v315);
      }
      uint64_t v316 = 0;
      if (v396) {
        BOOL v317 = v70 == 0;
      }
      else {
        BOOL v317 = 0;
      }
      char v318 = !v317;
      do
      {
        while (1)
        {
          uint64_t v319 = objc_msgSend_objectAtIndexedSubscript_(v411, v286, *(_DWORD *)&v425[4 * v316 - 4], v287);
          v321 = (void *)v319;
          unsigned int v322 = dword_263117DC0[v316];
          if (v318)
          {
            objc_msgSend_setTexture_atIndex_(v78, v320, *(void *)(v319 + 336 + 8 * v70), dword_263117DC0[v316]);
            objc_msgSend_setTexture_atIndex_(v78, v323, v321[v70 + 62], v322 + 1);
          }
          else
          {
            objc_msgSend_setTexture_atIndex_(v78, v320, *(void *)(v319 + 656), dword_263117DC0[v316]);
            objc_msgSend_setTexture_atIndex_(v78, v325, 0, v322 + 1);
          }
          if (v70 != v229) {
            break;
          }

          if (++v316 == v54) {
            goto LABEL_74;
          }
        }
        objc_msgSend_setTexture_atIndex_(v78, v324, v321[v194 + 42], v322 + 2);
        objc_msgSend_setTexture_atIndex_(v78, v326, v321[v194 + 62], v322 + 3);

        ++v316;
      }
      while (v316 != v54);
      if (!v422 || !v421 || !v423)
      {
LABEL_103:
        FigDebugAssert3();
        int v76 = FigSignalErrorAt();
        goto LABEL_104;
      }
      objc_msgSend_setTexture_atIndex_(v78, v286, (uint64_t)v422, 1);
      objc_msgSend_setTexture_atIndex_(v78, v327, (uint64_t)v421, 2);
      objc_msgSend_setTexture_atIndex_(v78, v328, (uint64_t)v423, 24);
LABEL_74:
      objc_msgSend_setTexture_atIndex_(v78, v286, (uint64_t)v399, 0);
      if (v70)
      {
        v330 = self;
        v331 = v405;
        if (!v405)
        {
          FigDebugAssert3();
          int v76 = FigSignalErrorAt();
          v405 = 0;
          goto LABEL_104;
        }
        uint64_t v332 = (uint64_t)v405;
        uint64_t v333 = (uint64_t)v408;
        if (!v408)
        {
          FigDebugAssert3();
          int v76 = FigSignalErrorAt();
          v408 = 0;
          goto LABEL_104;
        }
      }
      else
      {
        uint64_t v332 = (uint64_t)v387;
        v330 = self;
        v331 = v405;
        if (!v387) {
          goto LABEL_103;
        }
        uint64_t v333 = (uint64_t)v386;
        if (!v386) {
          goto LABEL_103;
        }
      }
      objc_msgSend_setTexture_atIndex_(v78, v329, v332, 3);
      objc_msgSend_setTexture_atIndex_(v78, v334, v333, 4);
      if (!v409) {
        goto LABEL_122;
      }
      objc_msgSend_setTexture_atIndex_(v78, v335, (uint64_t)v409, 5);
      v337 = objc_msgSend_getKernel_configFlags_(v330->_shaders, v336, 1, (4 * (v390 == 3)) | (8 * (v390 == 4)) | ((v396 != 0) << 6) | (32 * (v47 != 0.0)) | (16 * (v69 != 1.0)) | (v70 == v229) | (2 * (v70 == 0)));

      if (!v337)
      {
        FigDebugAssert3();
        int v76 = FigSignalErrorAt();
        v77 = 0;
        id v15 = v411;
        id v16 = v384;
        v21 = (int *)MEMORY[0x263F00E10];
        float v35 = v402;
        goto LABEL_106;
      }
      objc_msgSend_setComputePipelineState_(v78, v338, (uint64_t)v337, v339);
      v404 = v337;
      unint64_t v343 = objc_msgSend_maxTotalThreadsPerThreadgroup(v337, v340, v341, v342);
      unint64_t v345 = v401;
      unint64_t v346 = v401;
      if (v393 > v343)
      {
        unint64_t v345 = v401;
        unint64_t v346 = v401;
        while (v343 < v345 * v346)
        {
          unint64_t v347 = v346 >> (v346 > v345);
          if (v347 > 7)
          {
            v345 >>= v346 <= v345;
            unint64_t v346 = v347;
            if (v345 > 7) {
              continue;
            }
          }
          goto LABEL_103;
        }
      }
      objc_msgSend_setImageblockWidth_height_(v78, v344, v346, v345 << v391);
      v414[0] = (v403 + v346 - 2 - 1) / (v346 - 2);
      v414[1] = (v210 + v345 - 2 - 1) / (v345 - 2);
      v414[2] = 1;
      v413[0] = v346;
      v413[1] = v345;
      v413[2] = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v78, v348, (uint64_t)v414, (uint64_t)v413);
      objc_msgSend_endEncoding(v78, v349, v350, v351);
      objc_msgSend_commit(v410, v352, v353, v354);
      FigMetalDecRef();
      FigMetalDecRef();
      if (!v406) {
        FigMetalDecRef();
      }
      id v355 = v423;
      id v423 = v409;

      id v356 = v422;
      id v422 = v331;

      id v357 = v421;
      id v421 = v408;

      if (v70 != v229 && v390 >= 2)
      {
        uint64_t v358 = v385;
        v359 = (int *)v425;
        do
        {
          uint64_t v360 = *v359++;
          v361 = objc_msgSend_objectAtIndexedSubscript_(v411, v73, v360, v75);
          FigMetalDecRef();

          v364 = objc_msgSend_objectAtIndexedSubscript_(v411, v362, v360, v363);
          FigMetalDecRef();

          --v358;
        }
        while (v358);
      }
      v72 = self;
      uint64_t v54 = v392;
      if (v194 <= 1) {
        goto LABEL_97;
      }
    }
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
    v410 = 0;
LABEL_104:
    id v15 = v411;
    id v16 = v384;
    goto LABEL_105;
  }
  v404 = 0;
  uint64_t v78 = 0;
  v410 = 0;
LABEL_97:
  id v15 = v411;
  if (v390 > 1)
  {
    v365 = (int *)v425;
    uint64_t v366 = v54 - 1;
    do
    {
      uint64_t v367 = *v365++;
      objc_msgSend_objectAtIndexedSubscript_(v411, v73, v367, v75);
      v368 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      v368[2] = 0;

      --v366;
    }
    while (v366);
  }
  id v16 = v384;
  if (v422)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    v408 = 0;
    id v409 = 0;
    v405 = 0;
LABEL_105:
    v21 = (int *)MEMORY[0x263F00E10];
    float v35 = v402;
    v77 = v404;
  }
  else
  {
    v21 = (int *)MEMORY[0x263F00E10];
    float v35 = v402;
    v77 = v404;
    if (v421)
    {
      FigDebugAssert3();
      int v76 = FigSignalErrorAt();
      v408 = 0;
      id v409 = 0;
      v405 = 0;
    }
    else
    {
      v408 = 0;
      id v409 = 0;
      v405 = 0;
      int v76 = 0;
    }
  }
LABEL_106:
  int v369 = *v21;
  if (*v21 == 1)
  {
    kdebug_trace();
    int v369 = *v21;
  }
  if (v369)
  {
    v370 = objc_msgSend_commandQueue(self->_metal, v73, v74, v75);
    v374 = objc_msgSend_commandBuffer(v370, v371, v372, v373);

    objc_msgSend_setLabel_(v374, v375, @"KTRACE_END_MTL", v376);
    v412[0] = MEMORY[0x263EF8330];
    v412[1] = 3221225472;
    v412[2] = sub_262FB7BC8;
    v412[3] = &unk_2655C32E8;
    v412[5] = 0;
    v412[6] = 0;
    v412[4] = 1;
    objc_msgSend_addCompletedHandler_(v374, v377, (uint64_t)v412, v378);
    objc_msgSend_commit(v374, v379, v380, v381);
  }
  return v76;
}

- (int)_fuseInLong:(id)a3 slParameters:(const SyntheticLongParameters *)a4 slPlist:(id)a5 lscGainsTex:(id)a6 fusedEv0sPyramid:(id)a7 weightsPyramid:(id)a8 slOutput:(id)a9 noiseDivisorTex:(id)a10 realLongNoiseDivisorTex:(id)a11
{
  id v353 = a3;
  id v363 = a5;
  id v362 = a6;
  id v17 = a7;
  id v357 = a8;
  v361 = (id *)a9;
  id v356 = a10;
  id v355 = a11;
  id v402 = 0;
  id v403 = 0;
  id v401 = 0;
  v21 = (int *)MEMORY[0x263F00E10];
  int v22 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v22 = *v21;
  }
  if (v22)
  {
    uint64_t v23 = objc_msgSend_commandQueue(self->_metal, v18, v19, v20);
    uint64_t v27 = objc_msgSend_commandBuffer(v23, v24, v25, v26);

    objc_msgSend_setLabel_(v27, v28, @"KTRACE_START_MTL", v29);
    objc_msgSend_addCompletedHandler_(v27, v30, (uint64_t)&unk_270E34188, v31);
    objc_msgSend_commit(v27, v32, v33, v34);
  }
  float v35 = v361;
  uint64_t v367 = self;
  if (!v353 || !a4 || !v363 || !v362 || !v17 || !v357 || !v356 || a4->var1 < 0 || a4->var2 < 0)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    int v369 = 0;
    uint64_t v351 = 0;
    v364 = 0;
    float v36 = 0;
LABEL_80:
    v368 = 0;
    v182 = 0;
    uint64_t v181 = 0;
    goto LABEL_63;
  }
  float v36 = (unsigned int *)v17;
  int var1 = a4->var1;
  objc_msgSend_objectAtIndexedSubscript_(v353, v38, a4->var2, v39);
  v364 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  if ((a4->var0 - 6) <= 0xFFFFFFFC)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    int v369 = 0;
    uint64_t v351 = 0;
    goto LABEL_80;
  }
  id v352 = v17;
  long long v40 = &a4->var4[0].var3.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights + 112064 * var1;
  int var2 = a4->var2;
  long long v42 = (char *)a4->var4 + 224128 * var2;
  int v359 = v42[195];
  int v43 = a4->var0 - 1;
  bzero(v380, 0x4E0uLL);
  float v395 = (float)v43;
  uint64_t v358 = v40;
  if (objc_msgSend__fillConstants_slPlist_ev0ExposureParams_(SyntheticLongStage, v44, (uint64_t)v380, (uint64_t)v363, v40)|| (objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v45, (uint64_t)v400, (uint64_t)(&a4->var4[0].var3.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights + 112064 * var2)) & 1) == 0)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    v368 = 0;
    int v369 = 0;
    uint64_t v351 = 0;
    v182 = 0;
    uint64_t v181 = 0;
    id v17 = v352;
    goto LABEL_63;
  }
  long long v49 = *((_OWORD *)v42 + 11);
  long long v391 = *((_OWORD *)v42 + 10);
  long long v392 = v49;
  long long v393 = *((_OWORD *)v42 + 12);
  long long v50 = *((_OWORD *)v42 + 7);
  long long v387 = *((_OWORD *)v42 + 6);
  long long v388 = v50;
  long long v51 = *((_OWORD *)v42 + 9);
  long long v389 = *((_OWORD *)v42 + 8);
  long long v390 = v51;
  long long v52 = *((_OWORD *)v42 + 3);
  long long v383 = *((_OWORD *)v42 + 2);
  long long v384 = v52;
  long long v53 = *((_OWORD *)v42 + 5);
  long long v385 = *((_OWORD *)v42 + 4);
  long long v386 = v53;
  long long v54 = *((_OWORD *)v42 + 1);
  long long v381 = *(_OWORD *)v42;
  long long v382 = v54;
  int v396 = *((_DWORD *)&a4->var4[0].var3.ROI.size.height + 56032 * var2);
  long long v55 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v397 = *MEMORY[0x263EF89A0];
  long long v398 = v55;
  long long v399 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  float v56 = *(float *)&v400[29];
  float v57 = *(float *)&v400[32];
  long long v58 = v36;
  uint64_t v59 = v36[2];
  uint64_t v60 = objc_msgSend_allocator(self->_metal, v46, v47, v48);
  long long v64 = objc_msgSend_newTextureDescriptor(v60, v61, v62, v63);

  if (!v64)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    v368 = 0;
    int v369 = 0;
    v182 = 0;
    uint64_t v181 = 0;
    id v17 = v352;
    float v36 = v58;
    uint64_t v351 = 0;
LABEL_87:
    v21 = (int *)MEMORY[0x263F00E10];
    goto LABEL_63;
  }
  uint64_t v68 = (v59 - 1);
  uint64_t v69 = objc_msgSend_width(*(void **)&v58[2 * (int)v68 + 84], v65, v66, v67);
  v73 = objc_msgSend_desc(v64, v70, v71, v72);
  objc_msgSend_setWidth_(v73, v74, v69, v75);

  uint64_t v79 = objc_msgSend_height(*(void **)&v58[2 * (int)v68 + 84], v76, v77, v78);
  v83 = objc_msgSend_desc(v64, v80, v81, v82);
  objc_msgSend_setHeight_(v83, v84, v79, v85);

  uint64_t v89 = objc_msgSend_desc(v64, v86, v87, v88);
  objc_msgSend_setUsage_(v89, v90, 3, v91);

  v370 = v64;
  uint64_t v95 = objc_msgSend_desc(v64, v92, v93, v94);
  objc_msgSend_setPixelFormat_(v95, v96, 25, v97);

  long long v101 = objc_msgSend_allocator(self->_metal, v98, v99, v100);
  uint64_t v105 = objc_msgSend_newTextureDescriptor(v101, v102, v103, v104);

  if (!v105)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    v368 = 0;
    int v369 = 0;
    v182 = 0;
    uint64_t v181 = 0;
    id v17 = v352;
LABEL_86:
    float v36 = v58;
    uint64_t v351 = v370;
    goto LABEL_87;
  }
  uint64_t v109 = objc_msgSend_width(*(void **)&v58[2 * (int)v68 + 124], v106, v107, v108);
  v113 = objc_msgSend_desc(v105, v110, v111, v112);
  objc_msgSend_setWidth_(v113, v114, v109, v115);

  uint64_t v119 = objc_msgSend_height(*(void **)&v58[2 * (int)v68 + 124], v116, v117, v118);
  v123 = objc_msgSend_desc(v105, v120, v121, v122);
  objc_msgSend_setHeight_(v123, v124, v119, v125);

  v129 = objc_msgSend_desc(v105, v126, v127, v128);
  objc_msgSend_setUsage_(v129, v130, 3, v131);

  int v369 = v105;
  uint64_t v135 = objc_msgSend_desc(v105, v132, v133, v134);
  objc_msgSend_setPixelFormat_(v135, v136, 65, v137);

  uint64_t v141 = objc_msgSend_allocator(self->_metal, v138, v139, v140);
  v145 = objc_msgSend_newTextureDescriptor(v141, v142, v143, v144);

  if (!v145)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    uint64_t v271 = 0;
    v368 = 0;
    v182 = 0;
    uint64_t v181 = 0;
    id v17 = v352;
    float v35 = v361;
    goto LABEL_86;
  }
  uint64_t v149 = objc_msgSend_width(*(void **)&v58[2 * (int)v68 + 84], v146, v147, v148);
  uint64_t v153 = objc_msgSend_desc(v145, v150, v151, v152);
  objc_msgSend_setWidth_(v153, v154, v149, v155);

  uint64_t v372 = v58;
  uint64_t v159 = objc_msgSend_height(*(void **)&v58[2 * (int)v68 + 84], v156, v157, v158);
  v163 = objc_msgSend_desc(v145, v160, v161, v162);
  objc_msgSend_setHeight_(v163, v164, v159, v165);

  v169 = objc_msgSend_desc(v145, v166, v167, v168);
  objc_msgSend_setUsage_(v169, v170, 3, v171);

  uint64_t v360 = v145;
  uint64_t v175 = objc_msgSend_desc(v145, v172, v173, v174);
  objc_msgSend_setPixelFormat_(v175, v176, 25, v177);

  if ((int)v59 >= 1)
  {
    uint64_t v181 = 0;
    v182 = 0;
    v368 = 0;
    uint64_t v354 = (char *)&a4->var4[0].var3.ltmCurves + 224128 * var2;
    uint64_t v366 = v68 + 1;
    uint64_t v183 = 8 * v59;
    float v35 = v361;
    while (1)
    {
      uint64_t v184 = v59 - 1;
      if (objc_msgSend__fillConstantsForBand_consts_slPlist_ev0ExposureParams_(SyntheticLongStage, v178, v59 - 1, (uint64_t)v380, v363, v358))goto LABEL_71; {
      v188 = objc_msgSend_commandQueue(self->_metal, v185, v186, v187);
      }
      uint64_t v192 = objc_msgSend_commandBuffer(v188, v189, v190, v191);

      if (!v192)
      {
        FigDebugAssert3();
        int v350 = FigSignalErrorAt();
        v371 = 0;
        uint64_t v373 = 0;
        v374 = 0;
        uint64_t v181 = 0;
        goto LABEL_76;
      }
      uint64_t v181 = v192;
      uint64_t v196 = objc_msgSend_computeCommandEncoder(v192, v193, v194, v195);

      if (!v196)
      {
        FigDebugAssert3();
        int v350 = FigSignalErrorAt();
        v371 = 0;
        uint64_t v373 = 0;
        v374 = 0;
        v182 = 0;
        goto LABEL_76;
      }
      v182 = (void *)v196;
      uint64_t v200 = objc_msgSend_width(*(void **)&v372[2 * v59 + 82], v197, v198, v199);
      uint64_t v204 = objc_msgSend_height(*(void **)&v372[2 * v59 + 82], v201, v202, v203);
      v206.i64[0] = v200;
      v206.i64[1] = v204;
      int64x2_t v365 = (int64x2_t)v206;
      float32x2_t v394 = vdiv_f32((float32x2_t)0x3F0000003F000000, vcvt_f32_f64(vcvtq_f64_u64(v206)));
      if (v59 == 1)
      {
        long long v219 = *((_OWORD *)v354 + 1);
        long long v397 = *(_OWORD *)v354;
        long long v398 = v219;
        long long v399 = *((_OWORD *)v354 + 2);
        objc_msgSend_setBytes_length_atIndex_(v182, v205, (uint64_t)v380, 1248, 1);
        objc_msgSend_setLabel_(v370, v220, 0, v221);
        id v215 = v35[2];
      }
      else
      {
        objc_msgSend_setBytes_length_atIndex_(v182, v205, (uint64_t)v380, 1248, 1);
        objc_msgSend_setLabel_(v370, v207, 0, v208);
        uint64_t v212 = objc_msgSend_allocator(self->_metal, v209, v210, v211);
        id v215 = (id)objc_msgSend_newTextureWithDescriptor_(v212, v213, (uint64_t)v370, v214);
      }
      if (!v215)
      {
LABEL_71:
        FigDebugAssert3();
        int v350 = FigSignalErrorAt();
        v371 = 0;
        uint64_t v373 = 0;
        v374 = 0;
        goto LABEL_76;
      }
      uint64_t v222 = objc_msgSend_desc(v370, v216, v217, v218);
      uint64_t v226 = objc_msgSend_width(v222, v223, v224, v225);
      objc_msgSend_setWidth_(v222, v227, 2 * v226, v228);

      uint64_t v232 = objc_msgSend_desc(v370, v229, v230, v231);
      uint64_t v236 = objc_msgSend_height(v232, v233, v234, v235);
      objc_msgSend_setHeight_(v232, v237, 2 * v236, v238);

      objc_msgSend_setLabel_(v369, v239, 0, v240);
      if (v59 == 1)
      {
        id v247 = v35[3];
      }
      else
      {
        int v244 = objc_msgSend_allocator(self->_metal, v241, v242, v243);
        id v247 = (id)objc_msgSend_newTextureWithDescriptor_(v244, v245, (uint64_t)v369, v246);
      }
      v374 = v215;
      if (!v247)
      {
        FigDebugAssert3();
        int v350 = FigSignalErrorAt();
        v371 = 0;
        uint64_t v373 = 0;
        goto LABEL_76;
      }
      uint64_t v373 = v247;
      uint64_t v251 = objc_msgSend_desc(v369, v248, v249, v250);
      uint64_t v255 = objc_msgSend_width(v251, v252, v253, v254);
      objc_msgSend_setWidth_(v251, v256, 2 * v255, v257);

      uint64_t v261 = objc_msgSend_desc(v369, v258, v259, v260);
      uint64_t v265 = objc_msgSend_height(v261, v262, v263, v264);
      objc_msgSend_setHeight_(v261, v266, 2 * v265, v267);

      if (v59 == 1)
      {
        v371 = 0;
        uint64_t v271 = v360;
      }
      else
      {
        uint64_t v271 = v360;
        objc_msgSend_setLabel_(v360, v268, 0, v270);
        uint64_t v275 = objc_msgSend_allocator(self->_metal, v272, v273, v274);
        uint64_t v278 = objc_msgSend_newTextureWithDescriptor_(v275, v276, (uint64_t)v360, v277);

        v371 = (void *)v278;
        if (!v278)
        {
          FigDebugAssert3();
          int v350 = FigSignalErrorAt();
          v371 = 0;
          id v17 = v352;
          v21 = (int *)MEMORY[0x263F00E10];
          float v36 = v372;
          uint64_t v351 = v370;
          goto LABEL_63;
        }
      }
      uint64_t v279 = objc_msgSend_desc(v271, v268, v269, v270);
      uint64_t v283 = objc_msgSend_width(v279, v280, v281, v282);
      objc_msgSend_setWidth_(v279, v284, 2 * v283, v285);

      v289 = objc_msgSend_desc(v271, v286, v287, v288);
      uint64_t v293 = objc_msgSend_height(v289, v290, v291, v292);
      objc_msgSend_setHeight_(v289, v294, 2 * v293, v295);

      objc_msgSend_setTexture_atIndex_(v182, v296, *(void *)&v372[2 * v59 + 82], 8);
      objc_msgSend_setTexture_atIndex_(v182, v297, *(void *)&v372[2 * v59 + 122], 9);
      if (v366 != v59)
      {
        objc_msgSend_setTexture_atIndex_(v182, v298, *(void *)&v372[2 * v59 + 84], 10);
        objc_msgSend_setTexture_atIndex_(v182, v299, *(void *)&v372[2 * v59 + 124], 11);
        objc_msgSend_setTexture_atIndex_(v182, v300, v364[v59 + 42], 14);
        objc_msgSend_setTexture_atIndex_(v182, v301, v364[v59 + 62], 15);
        if (!v403)
        {
          FigDebugAssert3();
          int v350 = FigSignalErrorAt();
          id v17 = v352;
          v21 = (int *)MEMORY[0x263F00E10];
          float v36 = v372;
          uint64_t v271 = v360;
          uint64_t v351 = v370;
          goto LABEL_63;
        }
        if (!v402 || !v401)
        {
          FigDebugAssert3();
          int v350 = FigSignalErrorAt();
LABEL_76:
          id v17 = v352;
LABEL_77:
          v21 = (int *)MEMORY[0x263F00E10];
          float v36 = v372;
          uint64_t v351 = v370;
LABEL_78:
          uint64_t v271 = v360;
          goto LABEL_63;
        }
        objc_msgSend_setTexture_atIndex_(v182, v302, (uint64_t)v403, 1);
        objc_msgSend_setTexture_atIndex_(v182, v303, (uint64_t)v402, 2);
        objc_msgSend_setTexture_atIndex_(v182, v304, (uint64_t)v401, 24);
      }
      if (v359 && v59 == 1)
      {
        objc_msgSend_setTexture_atIndex_(v182, v298, v364[82], 12);
        uint64_t v306 = 0;
        uint64_t v307 = v368;
      }
      else
      {
        objc_msgSend_setTexture_atIndex_(v182, v298, v364[v59 + 41], 12);
        uint64_t v306 = v364[v59 + 61];
        uint64_t v307 = v368;
      }
      objc_msgSend_setTexture_atIndex_(v182, v305, v306, 13);
      objc_msgSend_setTexture_atIndex_(v182, v308, v357[v59 + 41], 5);
      objc_msgSend_setTexture_atIndex_(v182, v309, (uint64_t)v362, 0);
      objc_msgSend_setTexture_atIndex_(v182, v310, (uint64_t)v374, 3);
      objc_msgSend_setTexture_atIndex_(v182, v311, (uint64_t)v247, 4);
      if (v59 == 1)
      {
        objc_msgSend_setTexture_atIndex_(v182, v312, (uint64_t)v356, 6);
        objc_msgSend_setTexture_atIndex_(v182, v315, (uint64_t)v355, 7);
        int v314 = 2;
      }
      else
      {
        objc_msgSend_setTexture_atIndex_(v182, v312, (uint64_t)v371, 25);
        int v314 = 0;
      }
      objc_msgSend_setImageblockWidth_height_(v182, v313, 16, 16);
      uint64_t v317 = objc_msgSend_getKernel_configFlags_(v367->_shaders, v316, 2, ((v359 != 0) << 6) | (16 * (v56 != 1.0)) | (32 * (v57 != 0.0)) | v314 | (v366 == v59));

      if (!v317)
      {
        FigDebugAssert3();
        int v350 = FigSignalErrorAt();
        v368 = 0;
        id v17 = v352;
        float v35 = v361;
        goto LABEL_77;
      }
      v368 = (void *)v317;
      objc_msgSend_setComputePipelineState_(v182, v318, v317, v319);
      int64x2_t v320 = vaddq_s64(v365, vdupq_n_s64(0xDuLL));
      v320.i64[0] /= 0xEuLL;
      v320.i64[1] /= 0xEuLL;
      int64x2_t v378 = v320;
      uint64_t v379 = 1;
      int64x2_t v376 = vdupq_n_s64(0x10uLL);
      uint64_t v377 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v182, v321, (uint64_t)&v378, (uint64_t)&v376);
      objc_msgSend_endEncoding(v182, v322, v323, v324);
      objc_msgSend_commit(v181, v325, v326, v327);
      float v35 = v361;
      if (v59 == 1)
      {
        id v330 = (id)v357[42];
        v328 = v374;
        v329 = v357 - 1;
        if (v330 == v361[2])
        {
          v357[42] = 0;
        }
      }
      else
      {
        v328 = v374;
        v329 = v357 - 1;
      }
      if (v329[v59 + 42]) {
        FigMetalDecRef();
      }
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      id v331 = v403;
      id v403 = v328;

      id v332 = v402;
      id v402 = v373;

      id v333 = v401;
      id v401 = v371;

      v183 -= 8;
      --v59;
      self = v367;
      if ((unint64_t)(v184 + 1) <= 1) {
        goto LABEL_59;
      }
    }
  }
  v368 = 0;
  v182 = 0;
  uint64_t v181 = 0;
  float v35 = v361;
LABEL_59:
  id v17 = v352;
  float v36 = v372;
  uint64_t v351 = v370;
  if (v403 != v35[2])
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    v21 = (int *)MEMORY[0x263F00E10];
    goto LABEL_78;
  }
  v21 = (int *)MEMORY[0x263F00E10];
  if (v402 != v35[3])
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    goto LABEL_78;
  }
  uint64_t v271 = v360;
  if (v401)
  {
    FigDebugAssert3();
    int v350 = FigSignalErrorAt();
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
  }
  else
  {
    v371 = 0;
    uint64_t v373 = 0;
    v374 = 0;
    int v350 = 0;
  }
LABEL_63:
  int v334 = *v21;
  if (*v21 == 1)
  {
    kdebug_trace();
    int v334 = *v21;
  }
  if (v334)
  {
    objc_msgSend_commandQueue(v367->_metal, v178, v179, v180);
    v336 = id v335 = v17;
    objc_msgSend_commandBuffer(v336, v337, v338, v339);
    uint64_t v341 = v340 = v36;

    id v17 = v335;
    objc_msgSend_setLabel_(v341, v342, @"KTRACE_END_MTL", v343);
    v375[0] = MEMORY[0x263EF8330];
    v375[1] = 3221225472;
    v375[2] = sub_262FB9888;
    v375[3] = &unk_2655C32E8;
    v375[5] = 0;
    v375[6] = 0;
    v375[4] = 2;
    objc_msgSend_addCompletedHandler_(v341, v344, (uint64_t)v375, v345);
    objc_msgSend_commit(v341, v346, v347, v348);

    float v36 = v340;
  }

  return v350;
}

- (int)_doEv0sPlusRealLongWithBands:(id)a3 slFuseEv0Plist:(id)a4 slFuseLongPlist:(id)a5 slParameters:(const SyntheticLongParameters *)a6 slOutput:(id)a7 noiseDivisorTex:(id)a8 realLongNoiseDivisorTex:(id)a9 lscGainsTex:(id)a10 intermediateMetadata:(id)a11
{
  id v144 = a3;
  id v139 = a4;
  id v17 = a5;
  id v18 = a7;
  id v143 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v145 = 0;
  uint64_t v146 = 0;
  uint64_t var1 = a6->var1;
  int var2 = a6->var2;
  uint64_t v138 = a6;
  v142 = v21;
  if ((var1 & 0x80000000) != 0)
  {
    FigDebugAssert3();
    int v130 = FigSignalErrorAt();
    uint64_t v131 = 0;
    uint64_t v120 = v139;
    uint64_t v26 = v144;
    goto LABEL_25;
  }
  uint64_t v26 = v144;
  if (!v18 || !*((void *)v18 + 2) || !*((void *)v18 + 3))
  {
    FigDebugAssert3();
    int v130 = FigSignalErrorAt();
    uint64_t v131 = 0;
    uint64_t v120 = v139;
    goto LABEL_25;
  }
  id v27 = v21;
  id v141 = v20;
  id v136 = v17;
  uint64_t v137 = objc_msgSend_objectAtIndexedSubscript_(v144, v22, var1, v23);
  int v140 = *(_DWORD *)(v137 + 8);
  unint64_t v31 = objc_msgSend_width(*((void **)v18 + 2), v28, v29, v30);
  uint64_t v35 = objc_msgSend_height(*((void **)v18 + 2), v32, v33, v34);
  if (var2 < 0)
  {
    uint64_t v120 = v139;
    if (!objc_msgSend__fuseEv0s_slParameters_slPlist_lscGainsTex_outputLuma_outputChroma_outputWeightsPyramid_noiseDivisorTex_intermediateMetadata_(self, v36, (uint64_t)v144, (uint64_t)v138, v139, v20, *((void *)v18 + 2), *((void *)v18 + 3), 0, v143, v27))
    {
      int v130 = 0;
      id v17 = v136;
      uint64_t v131 = (void *)v137;
      goto LABEL_25;
    }
    uint64_t v115 = 0;
    id v17 = v136;
    uint64_t v131 = (void *)v137;
    goto LABEL_37;
  }
  unint64_t v39 = v35;
  long long v40 = objc_msgSend_allocator(self->_metal, v36, v37, v38);
  uint64_t v44 = objc_msgSend_newTextureDescriptor(v40, v41, v42, v43);

  if (!v44) {
    goto LABEL_28;
  }
  uint64_t v48 = objc_msgSend_desc(v44, v45, v46, v47);
  objc_msgSend_setWidth_(v48, v49, v31, v50);

  long long v54 = objc_msgSend_desc(v44, v51, v52, v53);
  objc_msgSend_setHeight_(v54, v55, v39, v56);

  uint64_t v60 = objc_msgSend_desc(v44, v57, v58, v59);
  objc_msgSend_setUsage_(v60, v61, 3, v62);

  uint64_t v66 = objc_msgSend_desc(v44, v63, v64, v65);
  objc_msgSend_setPixelFormat_(v66, v67, 25, v68);

  objc_msgSend_setLabel_(v44, v69, 0, v70);
  uint64_t v74 = objc_msgSend_allocator(self->_metal, v71, v72, v73);
  uint64_t v77 = objc_msgSend_newTextureWithDescriptor_(v74, v75, (uint64_t)v44, v76);
  uint64_t v146 = (void *)v77;

  if (v77)
  {
    id v135 = v19;
    uint64_t v81 = objc_msgSend_desc(v44, v78, v79, v80);
    objc_msgSend_setWidth_(v81, v82, v31 >> 1, v83);

    uint64_t v87 = objc_msgSend_desc(v44, v84, v85, v86);
    objc_msgSend_setHeight_(v87, v88, v39 >> 1, v89);

    uint64_t v93 = objc_msgSend_desc(v44, v90, v91, v92);
    objc_msgSend_setUsage_(v93, v94, 3, v95);

    uint64_t v99 = objc_msgSend_desc(v44, v96, v97, v98);
    objc_msgSend_setPixelFormat_(v99, v100, 65, v101);

    objc_msgSend_setLabel_(v44, v102, 0, v103);
    uint64_t v107 = objc_msgSend_allocator(self->_metal, v104, v105, v106);
    uint64_t v110 = objc_msgSend_newTextureWithDescriptor_(v107, v108, (uint64_t)v44, v109);
    v145 = (void *)v110;

    if (v110 && (uint64_t v111 = objc_opt_new()) != 0)
    {
      uint64_t v115 = v111;
      *(_DWORD *)(v111 + 8) = v140;
      uint64_t v119 = objc_msgSend_pixelFormat(*((void **)v18 + 2), v112, v113, v114);
      if (v119 != 25 || !objc_msgSend_isCompressed(*((void **)v18 + 2), v116, v117, v118))
      {
        *(_WORD *)((char *)&v133 + 1) = v119 == 25;
        LOBYTE(v133) = 0;
        if (!objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_startingLevel_testSize_pyramid_(PyramidStorage_NRF, v116, (uint64_t)self->_metal, @"weightsPyramid", v31, v39, 1, 1, v133, v115))
        {
          if (v119 == 25) {
            objc_storeStrong((id *)(v115 + 336), *((id *)v18 + 2));
          }
          *(unsigned char *)(v115 + 664) = 1;

          uint64_t v26 = v144;
          uint64_t v120 = v139;
          if (!objc_msgSend__fuseEv0s_slParameters_slPlist_lscGainsTex_outputLuma_outputChroma_outputWeightsPyramid_noiseDivisorTex_intermediateMetadata_(self, v121, (uint64_t)v144, (uint64_t)v138, v139, v141, v77, v110, v115, 0, v142))
          {
            uint64_t v122 = objc_opt_new();
            uint64_t v124 = (void *)v122;
            if (!v122
              || (*(_DWORD *)(v122 + 8) = v140,
                  LOBYTE(v134) = 1,
                  objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_pyramid_(PyramidStorage_NRF, v123, (uint64_t)self->_metal, @"fusedEv0sPyramid", v31, v39, 1, 1, v134, v122)))
            {
              FigDebugAssert3();
              int v130 = FigSignalErrorAt();
              id v19 = v135;
              id v17 = v136;
              id v20 = v141;
            }
            else
            {
              objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v124, v125, v77, v110, 0, self->_metal);
              id v17 = v136;
              id v20 = v141;
              if (objc_msgSend_pyramidDownscale_(self, v126, (uint64_t)v124, v127))
              {
                FigDebugAssert3();
                int v130 = FigSignalErrorAt();
                id v19 = v135;
              }
              else
              {
                id v19 = v135;
                if (objc_msgSend__fuseInLong_slParameters_slPlist_lscGainsTex_fusedEv0sPyramid_weightsPyramid_slOutput_noiseDivisorTex_realLongNoiseDivisorTex_(self, v128, (uint64_t)v144, (uint64_t)v138, v136, v141, v124, v115, v18, v143, v135))
                {
                  FigDebugAssert3();
                  int v130 = FigSignalErrorAt();
                }
                else
                {
                  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v129, (uint64_t)v124, (uint64_t)self->_metal);
                  FigMetalDecRef();
                  FigMetalDecRef();
                  int v130 = 0;
                }
              }
            }

            uint64_t v26 = v144;
            goto LABEL_22;
          }
          id v19 = v135;
          id v17 = v136;
          id v20 = v141;
          uint64_t v131 = (void *)v137;
LABEL_37:
          FigDebugAssert3();
          int v130 = FigSignalErrorAt();

          goto LABEL_25;
        }
      }
      FigDebugAssert3();
      int v130 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v130 = FigSignalErrorAt();
    }
    id v19 = v135;
  }
  else
  {
LABEL_28:
    FigDebugAssert3();
    int v130 = FigSignalErrorAt();
  }

  uint64_t v26 = v144;
  uint64_t v120 = v139;
  id v17 = v136;
  id v20 = v141;
LABEL_22:
  uint64_t v131 = (void *)v137;
LABEL_25:

  return v130;
}

- (int)doSyntheticLongWithBands:(id)a3 slFuseEv0Plist:(id)a4 slFuseLongPlist:(id)a5 slParameters:(const SyntheticLongParameters *)a6 slOutput:(id)a7 noiseDivisorTex:(id)a8 realLongNoiseDivisorTex:(id)a9 lscGainsTex:(id)a10 intermediateMetadata:(id)a11
{
  id v17 = a3;
  id v75 = a4;
  id v74 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v25 = a11;
  if (v18
    && *((void *)v18 + 2)
    && *((void *)v18 + 3)
    && v19
    && (int var2 = a6->var2,
        uint64_t v27 = objc_msgSend_width(v19, v22, v23, v24),
        objc_msgSend_width(*((void **)v18 + 2), v28, v29, v30) == 2 * v27)
    && (uint64_t v34 = objc_msgSend_height(v19, v31, v32, v33), objc_msgSend_height(*((void **)v18 + 2), v35, v36, v37) == 2 * v34)
    && (var2 < 0
     || v20
     && (uint64_t v41 = objc_msgSend_width(v20, v38, v39, v40), objc_msgSend_width(*((void **)v18 + 2), v42, v43, v44) == 2 * v41)
     && (uint64_t v48 = objc_msgSend_height(v20, v45, v46, v47),
         objc_msgSend_height(*((void **)v18 + 2), v49, v50, v51) == 2 * v48)))
  {
    int var0 = a6->var0;
    int v53 = objc_msgSend__doEv0sPlusRealLongWithBands_slFuseEv0Plist_slFuseLongPlist_slParameters_slOutput_noiseDivisorTex_realLongNoiseDivisorTex_lscGainsTex_intermediateMetadata_(self, v38, (uint64_t)v17, (uint64_t)v75, v74, a6, v18, v19, v20, v21, v25);
    if (v53)
    {
      int v72 = v53;
      FigDebugAssert3();
    }
    else
    {
      uint64_t v56 = var0 + (~var2 >> 31);
      float v57 = objc_msgSend_numberWithBool_(NSNumber, v54, var2 >= 0, v55);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v58, (uint64_t)v57, @"SyntheticLongUsedRealLong");

      long long v61 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v59, v56, v60);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v62, (uint64_t)v61, @"ev0count");

      uint64_t v63 = NSNumber;
      uint64_t v67 = objc_msgSend_intermediateVersion(DeepFusionCommon, v64, v65, v66);
      uint64_t v70 = objc_msgSend_numberWithInt_(v63, v68, v67, v69);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v71, (uint64_t)v70, @"IntermediateVersion");

      int v72 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v72 = FigSignalErrorAt();
  }

  return v72;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end