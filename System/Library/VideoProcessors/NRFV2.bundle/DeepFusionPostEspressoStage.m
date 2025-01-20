@interface DeepFusionPostEspressoStage
+ (int)prewarmShaders:(id)a3 networkVersion:(int)a4;
- (DeepFusionPostEspressoStage)initWithMetalContext:(id)a3 networkVersion:(int)a4;
- (int)_addPreviousLevel:(id)a3 inoutTex:(id)a4 inTexPrevLevel:(id)a5 writeOffset:(DFApplyEspressoOutputUniforms *)a6 applyUniforms:(unsigned int)a7 useUpsampledImage:;
- (int)_applyEspressoOutputLumaOnlyToLevel:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inRefGaussian:(id)a5 slFusionMap:(id)a6 longFusionMap:(id)a7 prefusionWeightsTexture:(id)a8 inTexArray:(id)a9 inTexArrayUp:(id)a10 skinMaskTexture:(id)a11 skyMaskTexture:(id)a12 deghostedAndDenoisedAndTextureness:(id)a13 outTex:(id)a14 tile:(TileBounds *)a15;
- (int)_applyEspressoOutputToLevel:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inRefGaussian:(id)a5 slFusionMap:(id)a6 longFusionMap:(id)a7 prefusionWeightsTexture:(id)a8 inTexArray:(id)a9 inTexArrayUp:(id)a10 skinMaskTexture:(id)a11 skyMaskTexture:(id)a12 deghostedAndDenoisedAndTextureness:(id)a13 outTex:(id)a14 tile:(TileBounds *)a15;
- (int)_collapseWeightsOnTile:(id)a3 inoutTexNSArray:(id)a4;
- (int)_computeTextureness:(id)a3 applyUniforms:(DFApplyEspressoOutputUniforms *)a4 inputTexture:(id)a5 outputTexture:(id)a6 lscGainsTex:(id)a7;
- (int)_createUpsampledWithGaussianFilter:(id)a3 inTexPrevLevel:(id *)a4;
- (int)_deghostAndDenoise:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inTexEspressoWeights:(id)a5 inTexEspressoWeightsUp:(id)a6 inRefLaplacian:(id)a7 inSynthLongLaplacian:(id)a8 inRefGaussian:(id)a9 inSynthLongGaussian:(id)a10 inRefNoisePyramidLevel3:(id)a11 inSynthLongNoisePyramidLevel3:(id)a12 refNoisePretuning:(id)a13 LSCGains:(id)a14 inTexPrevLevel:(id)a15 outDeghostedDenoised:(id)a16 lowLightMode:(BOOL)a17;
- (int)_validateInputsForTile:(TileBounds *)a3 espressoOutputTextureArray:(id)a4 inRefGaussianArray:(id)a5 inSLGaussianArray:(id)a6 inRefLaplacianArray:(id)a7 inSLLaplacianArray:(id)a8 inRefNoisePyramidLevel3:(id)a9 inSLNoisePyramidLevel3:(id)a10 slFusionMap:(id)a11 longFusionMap:(id)a12 prefusionWeightsTexture:(id)a13 skinMaskTexture:(id)a14 skyMaskTexture:(id)a15 finalOutputTexture:(id)a16 lscGains:(id)a17 refNoisePretuning:(id)a18;
- (int)allocateTextures;
- (int)applyWeightsOnTile:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 espressoOutputTextureArray:(id)a5 inRefGaussianArray:(id)a6 inSLGaussianArray:(id)a7 inRefLaplacianArray:(id)a8 inSLLaplacianArray:(id)a9 inRefNoisePyramidLevel3:(id)a10 inSLNoisePyramidLevel3:(id)a11 slFusionMap:(id)a12 longFusionMap:(id)a13 prefusionWeightsTexture:(id)a14 skinMaskTexture:(id)a15 skyMaskTexture:(id)a16 lscGains:(id)a17 refNoisePretuning:(id)a18 tile:(TileBounds *)a19 finalOutputTexture:(id)a20 lowLightMode:(BOOL)a21;
- (int)computeAMBNRDenoiseBoostMap:(id)a3 boostMap:(id)a4 longFusionMap:(id)a5 ev0FusionMap:(id)a6 ev0Metadata:(frameMetadata *)a7 longMetadata:(frameMetadata *)a8 numEV0:(int)a9 ev0FusionTarget:(float)a10 longFusionTarget:(float)a11;
- (int)convert444to420:(id)a3 input444:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputOffset:(TileBounds *)a7;
- (int)setWidth:(unint64_t)a3 andHeight:(unint64_t)a4 andPixelFormat:(unint64_t)a5;
- (uint64_t)createShaderUniforms:(float)a3 totalGain:(float)a4 EVM_EV0_motionScore:(float)a5 lscGainGreenMax:(int64x2_t)a6 slQuantBounds:(float)a7 espressoModel:(uint64_t)a8 fullSize:(uint64_t)a9 uniforms:(void *)a10 hasLong:(uint64_t)a11 hasSIFR:(uint64_t)a12 isStationary:(int)a13 isSyntheticLongWithRealLong:(int)a14 aeShutterTimeRatio:(uint64_t)a15 colorCorrection:(BOOL)a16 inverseColorCorrection:(uint64_t)a17;
- (void)makeTextureAliasable;
- (void)purgeResources;
@end

@implementation DeepFusionPostEspressoStage

- (DeepFusionPostEspressoStage)initWithMetalContext:(id)a3 networkVersion:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DeepFusionPostEspressoStage;
  v9 = [(DeepFusionPostEspressoStage *)&v36 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metal, a3);
    v10->_networkVersion = v5;
    v14 = objc_msgSend_sharedInstance(PostEspressoShared, v11, v12, v13);
    uint64_t v16 = objc_msgSend_getShaders_networkVersion_(v14, v15, (uint64_t)v10->_metal, v5);
    shaders = v10->_shaders;
    v10->_shaders = (PostEspressoShaders *)v16;

    if (v10->_shaders)
    {
      v18 = [DeepFusionLaplacianPyramid alloc];
      uint64_t v21 = objc_msgSend_initWithMetalContext_(v18, v19, (uint64_t)v8, v20);
      laplacianPyram = v10->_laplacianPyram;
      v10->_laplacianPyram = (DeepFusionLaplacianPyramid *)v21;

      if (!v10->_laplacianPyram)
      {
        uint64_t v35 = v4;
        int v34 = 0;
        FigDebugAssert3();
      }
      v10->_width = 0;
      v10->_height = 0;
      v10->_pixelFormat = 0;
      uint64_t v25 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v23, 3, v24, v34, v35);
      v26 = v10->_yinfTextures[0];
      v10->_yinfTextures[0] = (NSMutableArray *)v25;

      uint64_t v29 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v27, 3, v28);
      v30 = v10->_yinfTextures[1];
      v10->_yinfTextures[1] = (NSMutableArray *)v29;

      v31 = v10;
    }
    else
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v31 = 0;
      }
      else {
        v31 = v10;
      }
    }
  }
  else
  {
    v31 = 0;
  }
  v32 = v31;

  return v32;
}

+ (int)prewarmShaders:(id)a3 networkVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [PostEspressoShaders alloc];
  id v8 = objc_msgSend_initWithMetal_networkVersion_(v6, v7, (uint64_t)v5, v4);

  if (v8) {
    int v9 = 0;
  }
  else {
    int v9 = -12786;
  }

  return v9;
}

- (void)purgeResources
{
  objc_msgSend_removeAllObjects(self->_yinfTextures[0], a2, v2, v3);
  id v8 = self->_yinfTextures[1];

  objc_msgSend_removeAllObjects(v8, v5, v6, v7);
}

- (int)setWidth:(unint64_t)a3 andHeight:(unint64_t)a4 andPixelFormat:(unint64_t)a5
{
  self->_width = a3;
  self->_height = a4;
  self->_pixelFormat = a5;
  return 0;
}

- (int)allocateTextures
{
  id v5 = objc_msgSend_allocator(self->_metal, a2, v2, v3);
  int v9 = objc_msgSend_newTextureDescriptor(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_desc(v9, v10, v11, v12);
    objc_msgSend_setCompressionMode_(v13, v14, 2, v15);

    v19 = objc_msgSend_desc(v9, v16, v17, v18);
    objc_msgSend_setCompressionFootprint_(v19, v20, 0, v21);

    uint64_t v25 = objc_msgSend_desc(v9, v22, v23, v24);
    objc_msgSend_setUsage_(v25, v26, 7, v27);

    v31 = objc_msgSend_desc(v9, v28, v29, v30);
    objc_msgSend_setPixelFormat_(v31, v32, 115, v33);

    uint64_t v37 = 0;
    char v38 = 1;
LABEL_3:
    char v39 = v38;
    uint64_t v40 = 1;
    while (1)
    {
      unint64_t v41 = self->_width >> v40;
      v42 = objc_msgSend_desc(v9, v34, v35, v36);
      objc_msgSend_setWidth_(v42, v43, v41, v44);

      unint64_t v45 = self->_height >> v40;
      v49 = objc_msgSend_desc(v9, v46, v47, v48);
      objc_msgSend_setHeight_(v49, v50, v45, v51);

      objc_msgSend_setLabel_(v9, v52, 0, v53);
      v57 = objc_msgSend_allocator(self->_metal, v54, v55, v56);
      v60 = objc_msgSend_newTextureWithDescriptor_(v57, v58, (uint64_t)v9, v59);

      if (!v60) {
        break;
      }
      objc_msgSend_addObject_(self->_yinfTextures[v37], v61, (uint64_t)v60, v62);

      if (++v40 == 4)
      {
        char v38 = 0;
        uint64_t v37 = 1;
        if (v39) {
          goto LABEL_3;
        }
        int v63 = 0;
        goto LABEL_9;
      }
    }
  }
  FigDebugAssert3();
  int v63 = FigSignalErrorAt();
LABEL_9:

  return v63;
}

- (void)makeTextureAliasable
{
  uint64_t v4 = 0;
  yinfTextures = self->_yinfTextures;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (objc_msgSend_count(yinfTextures[v4], a2, v2, v3))
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(yinfTextures[v4], v8, v11, v10);
        FigMetalDecRef();

        ++v11;
      }
      while (v11 < objc_msgSend_count(yinfTextures[v4], v12, v13, v14));
    }
    objc_msgSend_removeAllObjects(yinfTextures[v4], v8, v9, v10);
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
}

- (int)_deghostAndDenoise:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inTexEspressoWeights:(id)a5 inTexEspressoWeightsUp:(id)a6 inRefLaplacian:(id)a7 inSynthLongLaplacian:(id)a8 inRefGaussian:(id)a9 inSynthLongGaussian:(id)a10 inRefNoisePyramidLevel3:(id)a11 inSynthLongNoisePyramidLevel3:(id)a12 refNoisePretuning:(id)a13 LSCGains:(id)a14 inTexPrevLevel:(id)a15 outDeghostedDenoised:(id)a16 lowLightMode:(BOOL)a17
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v84 = a3;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v74 = a9;
  id v78 = a10;
  id v82 = a11;
  id v26 = a12;
  id v27 = a13;
  id v76 = a14;
  id v80 = a15;
  id v28 = a16;
  id v29 = v22;
  v98[0] = v29;
  v98[1] = @"inTexEspressoWeights";
  int v99 = 0;
  id v30 = v23;
  id v100 = v30;
  v101 = @"inTexEspressoWeightsUp";
  int v102 = 1;
  id v31 = v24;
  id v103 = v31;
  v104 = @"outDeghostedAndDenoised";
  int v105 = 2;
  id v32 = v25;
  id v106 = v32;
  v107 = @"inSynthLongLaplacian";
  int v108 = 3;
  id v33 = v74;
  id v109 = v33;
  v110 = @"inRefGaussian";
  int v111 = 4;
  id v72 = v78;
  id v112 = v72;
  v113 = @"inSynthLongGaussian";
  int v114 = 5;
  id v115 = v27;
  v116 = @"refNoisePretuning";
  int v117 = 6;
  id v79 = v76;
  id v118 = v79;
  v119 = @"LSCGains";
  int v120 = 7;
  id v81 = v80;
  id v121 = v81;
  v122 = @"inTexPrevLevel";
  int v123 = 8;
  id v124 = v82;
  v125 = @"inRefNoisePyramidLevel3";
  int v126 = 9;
  id v77 = v26;
  id v127 = v77;
  v128 = @"inSynthLongNoisePyramidLevel3";
  int v129 = 10;
  id v83 = v28;
  id v130 = v83;
  v131 = @"outDeghostedDenoised";
  int v132 = 11;
  v73 = v124;
  v75 = v115;
  if (!a4) {
    goto LABEL_13;
  }
  BOOL v37 = 0;
  memset(v93, 0, sizeof(v93));
  uint64_t v90 = *(void *)&a4->var29;
  int var2 = a4[1].var2;
  long long v92 = *(_OWORD *)&a4->var31;
  v93[0] = a4[1].var3.var0;
  *(float *)&v93[4] = a4->var21;
  *(_DWORD *)&v93[8] = a4[1].var3.var1;
  long long v38 = *(_OWORD *)&a4->var12;
  long long v39 = *(_OWORD *)&a4->var16;
  *(void *)&v93[44] = *(void *)&a4->var19;
  *(_OWORD *)&v93[12] = v38;
  *(_OWORD *)&v93[28] = v39;
  v93[52] = LOBYTE(a4->var26);
  float var11 = a4->var11;
  if (LODWORD(var11) == 3 && a17) {
    BOOL v37 = self->_networkVersion == 2;
  }
  v93[53] = v37;
  float v94 = var11;
  long long v95 = *(_OWORD *)&a4[1].var3.var4;
  int var8 = a4[1].var3.var8;
  long long v97 = *(_OWORD *)&a4[1].var31;
  *(void *)&v93[32] = 0;
  unint64_t v41 = objc_msgSend_commandBuffer(v84, v34, v35, v36);
  unint64_t v45 = v41;
  if (!v41)
  {
LABEL_13:
    FigDebugAssert3();
    int v86 = FigSignalErrorAt();
    v69 = v29;
    unint64_t v45 = 0;
LABEL_15:
    v49 = 0;
    goto LABEL_10;
  }
  v46 = objc_msgSend_computeCommandEncoder(v41, v42, v43, v44);
  v49 = v46;
  if (!v46)
  {
    FigDebugAssert3();
    int v86 = FigSignalErrorAt();
    v69 = v29;
    goto LABEL_15;
  }
  float v50 = a4->var11;
  int networkVersion = self->_networkVersion;
  objc_msgSend_setLabel_(v46, v47, @"_shaders->_kernelDeghostAndDenoise[configFlags]", v48);
  objc_msgSend_setComputePipelineState_(v49, v52, *(uint64_t *)((char *)self->_shaders->_kernelDeghostAndDenoise+ ((8 * (LODWORD(v50) == 0)) | (16 * (networkVersion == 2)))), v53);
  objc_msgSend_setBytes_length_atIndex_(v49, v54, (uint64_t)&v90, 124, 0);
  for (uint64_t i = 0; i != 36; i += 3)
    objc_msgSend_setTexture_atIndex_(v49, v55, v98[i], SLODWORD(v98[i + 2]));
  v89[0] = objc_msgSend_width(v31, v55, v57, v58);
  v89[1] = objc_msgSend_height(v31, v59, v60, v61);
  v89[2] = 1;
  int64x2_t v87 = vdupq_n_s64(8uLL);
  uint64_t v88 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v49, v62, (uint64_t)v89, (uint64_t)&v87);
  objc_msgSend_endEncoding(v49, v63, v64, v65);
  objc_msgSend_commit(v45, v66, v67, v68);
  v69 = v29;
  int v86 = 0;
LABEL_10:
  uint64_t v70 = 36;
  do
  {

    v70 -= 3;
  }
  while (v70 * 8);

  return v86;
}

- (int)_applyEspressoOutputToLevel:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inRefGaussian:(id)a5 slFusionMap:(id)a6 longFusionMap:(id)a7 prefusionWeightsTexture:(id)a8 inTexArray:(id)a9 inTexArrayUp:(id)a10 skinMaskTexture:(id)a11 skyMaskTexture:(id)a12 deghostedAndDenoisedAndTextureness:(id)a13 outTex:(id)a14 tile:(TileBounds *)a15
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v74 = a14;
  float var11 = a4->var11;
  id v67 = v20;
  v84[0] = v67;
  v84[1] = @"RefGaussian";
  int v85 = 0;
  id v68 = v21;
  id v86 = v68;
  int64x2_t v87 = @"SLFusionMap";
  int v88 = 1;
  id v69 = v22;
  id v89 = v69;
  uint64_t v90 = @"longFusionMap";
  int v91 = 2;
  id v70 = v23;
  id v92 = v70;
  v93 = @"prefusionWeights";
  int v94 = 3;
  id v71 = v24;
  id v95 = v71;
  v96 = @"inTexArray";
  int v97 = 4;
  id v72 = v25;
  id v98 = v72;
  int v99 = @"inTexArrayUp";
  int v100 = 5;
  id v29 = v26;
  id v101 = v29;
  int v102 = @"skinMaskTexture";
  int v103 = 6;
  id v30 = v27;
  id v104 = v30;
  int v105 = @"skyMaskTexture";
  int v106 = 7;
  id v31 = v28;
  id v107 = v31;
  int v108 = @"deghostedAndDenoisedAndTextureness";
  int v109 = 8;
  id v32 = v74;
  id v110 = v32;
  int v111 = @"outTex";
  int v112 = 9;
  memcpy(__dst, a4, 0x150uLL);
  long long v36 = *(_OWORD *)&a15->var4;
  *(_OWORD *)&__dst[10].u8[4] = *(_OWORD *)&a15->var0;
  *(_OWORD *)&__dst[12].u8[4] = v36;
  *(int32x2_t *)((char *)&__dst[14] + 4) = *(int32x2_t *)&a15->var8;
  if (var11 != 0.0) {
    __dst[13] = 0;
  }
  BOOL v37 = objc_msgSend_commandBuffer(v77, v33, v34, v35);
  unint64_t v41 = v37;
  if (v37
    && (objc_msgSend_computeCommandEncoder(v37, v38, v39, v40),
        v42 = objc_claimAutoreleasedReturnValue(),
        (unint64_t v45 = v42) != 0))
  {
    float v46 = a4->var11;
    int networkVersion = self->_networkVersion;
    objc_msgSend_setLabel_(v42, v43, @"_shaders->_kernelApplyEspressoOutput[configFlags]", v44);
    objc_msgSend_setComputePipelineState_(v45, v48, *(uint64_t *)((char *)self->_shaders->_kernelApplyEspressoOutput+ ((8 * (LODWORD(v46) == 0)) | (16 * (networkVersion == 2)))), v49);
    objc_msgSend_setBytes_length_atIndex_(v45, v50, (uint64_t)__dst, 336, 0);
    for (uint64_t i = 0; i != 30; i += 3)
      objc_msgSend_setTexture_atIndex_(v45, v51, v84[i], SLODWORD(v84[i + 2]));
    if (var11 == 0.0) {
      int32x2_t v53 = vdup_n_s32(LOWORD(a15->var9));
    }
    else {
      int32x2_t v53 = 0;
    }
    v82[1] = v53.i16[2];
    v82[0] = v53.i16[0];
    int32x2_t v54 = vshl_s32(*(int32x2_t *)&a15->var3, vdup_lane_s32(vneg_s32(__dst[10]), 0));
    v55.i64[0] = v54.i32[0];
    v55.i64[1] = v54.i32[1];
    int64x2_t v56 = v55;
    if (var11 == 0.0) {
      int64x2_t v56 = vsubq_s64(v56, vdupq_n_s64(2 * (unint64_t)(unsigned __int16)a15->var9));
    }
    int64x2_t v76 = v56;
    objc_msgSend_setBytes_length_atIndex_(v45, v51, (uint64_t)v82, 4, 1);
    int64x2_t v80 = v76;
    uint64_t v81 = 1;
    int64x2_t v78 = vdupq_n_s64(8uLL);
    uint64_t v79 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v45, v57, (uint64_t)&v80, (uint64_t)&v78);
    objc_msgSend_endEncoding(v45, v58, v59, v60);
    objc_msgSend_commit(v41, v61, v62, v63);
    int v64 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v64 = FigSignalErrorAt();
    unint64_t v45 = 0;
  }
  for (uint64_t j = 0; j != -240; j -= 24)
  {
  }
  return v64;
}

- (int)_applyEspressoOutputLumaOnlyToLevel:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 inRefGaussian:(id)a5 slFusionMap:(id)a6 longFusionMap:(id)a7 prefusionWeightsTexture:(id)a8 inTexArray:(id)a9 inTexArrayUp:(id)a10 skinMaskTexture:(id)a11 skyMaskTexture:(id)a12 deghostedAndDenoisedAndTextureness:(id)a13 outTex:(id)a14 tile:(TileBounds *)a15
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v72 = a14;
  float var11 = a4->var11;
  id v65 = v20;
  v82[0] = v65;
  v82[1] = @"RefGaussian";
  int v83 = 0;
  id v66 = v21;
  id v84 = v66;
  int v85 = @"SLFusionMap";
  int v86 = 1;
  id v67 = v22;
  id v87 = v67;
  int v88 = @"longFusionMap";
  int v89 = 2;
  id v68 = v23;
  id v90 = v68;
  int v91 = @"prefusionWeights";
  int v92 = 3;
  id v69 = v24;
  id v93 = v69;
  int v94 = @"inTexArray";
  int v95 = 4;
  id v70 = v25;
  id v96 = v70;
  int v97 = @"inTexArrayUp";
  int v98 = 5;
  id v29 = v26;
  id v99 = v29;
  int v100 = @"skinMaskTexture";
  int v101 = 6;
  id v30 = v27;
  id v102 = v30;
  int v103 = @"skyMaskTexture";
  int v104 = 7;
  id v31 = v28;
  id v105 = v31;
  int v106 = @"deghostedAndDenoisedAndTextureness";
  int v107 = 8;
  id v32 = v72;
  id v108 = v32;
  int v109 = @"outTex";
  int v110 = 9;
  memcpy(__dst, a4, 0x150uLL);
  long long v36 = *(_OWORD *)&a15->var4;
  *(_OWORD *)&__dst[10].u8[4] = *(_OWORD *)&a15->var0;
  *(_OWORD *)&__dst[12].u8[4] = v36;
  *(int32x2_t *)((char *)&__dst[14] + 4) = *(int32x2_t *)&a15->var8;
  if (var11 != 0.0) {
    __dst[13] = 0;
  }
  if (!self->_shaders->_kernelApplyEspressoOutputLumaOnly
    || (objc_msgSend_commandBuffer(v75, v33, v34, v35),
        BOOL v37 = objc_claimAutoreleasedReturnValue(),
        (unint64_t v41 = v37) == 0))
  {
    FigDebugAssert3();
    int v62 = FigSignalErrorAt();
    unint64_t v41 = 0;
LABEL_19:
    unint64_t v45 = 0;
    goto LABEL_14;
  }
  v42 = objc_msgSend_computeCommandEncoder(v37, v38, v39, v40);
  unint64_t v45 = v42;
  if (!v42)
  {
    FigDebugAssert3();
    int v62 = FigSignalErrorAt();
    goto LABEL_19;
  }
  objc_msgSend_setLabel_(v42, v43, @"_shaders->_kernelApplyEspressoOutputLumaOnly", v44);
  objc_msgSend_setComputePipelineState_(v45, v46, (uint64_t)self->_shaders->_kernelApplyEspressoOutputLumaOnly, v47);
  objc_msgSend_setBytes_length_atIndex_(v45, v48, (uint64_t)__dst, 336, 0);
  for (uint64_t i = 0; i != 30; i += 3)
    objc_msgSend_setTexture_atIndex_(v45, v49, v82[i], SLODWORD(v82[i + 2]));
  if (var11 == 0.0) {
    int32x2_t v51 = vdup_n_s32(LOWORD(a15->var9));
  }
  else {
    int32x2_t v51 = 0;
  }
  v80[1] = v51.i16[2];
  v80[0] = v51.i16[0];
  int32x2_t v52 = vshl_s32(*(int32x2_t *)&a15->var3, vdup_lane_s32(vneg_s32(__dst[10]), 0));
  v53.i64[0] = v52.i32[0];
  v53.i64[1] = v52.i32[1];
  int64x2_t v54 = v53;
  if (var11 == 0.0) {
    int64x2_t v54 = vsubq_s64(v54, vdupq_n_s64(2 * (unint64_t)(unsigned __int16)a15->var9));
  }
  int64x2_t v74 = v54;
  objc_msgSend_setBytes_length_atIndex_(v45, v49, (uint64_t)v80, 4, 1);
  int64x2_t v78 = v74;
  uint64_t v79 = 1;
  int64x2_t v76 = vdupq_n_s64(8uLL);
  uint64_t v77 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v45, v55, (uint64_t)&v78, (uint64_t)&v76);
  objc_msgSend_endEncoding(v45, v56, v57, v58);
  objc_msgSend_commit(v41, v59, v60, v61);
  int v62 = 0;
LABEL_14:
  for (uint64_t j = 0; j != -240; j -= 24)
  {
  }
  return v62;
}

- (int)_collapseWeightsOnTile:(id)a3 inoutTexNSArray:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v10
    && self->_shaders->_kernelCollapseWeightsOnTileStage1
    && (objc_msgSend_commandBuffer(v6, v7, v8, v9), (unint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = v11;
    uint64_t v16 = objc_msgSend_computeCommandEncoder(v11, v12, v13, v14);
    if (v16)
    {
      v19 = v16;
      objc_msgSend_setLabel_(v16, v17, @"_shaders->_kernelCollapseWeightsOnTileStage1", v18);
      objc_msgSend_setComputePipelineState_(v19, v20, (uint64_t)self->_shaders->_kernelCollapseWeightsOnTileStage1, v21);
      objc_msgSend_setImageblockWidth_height_(v19, v22, 32, 32);
      if (self->_networkVersion == 2)
      {
        unint64_t v25 = 1;
        goto LABEL_8;
      }
      unint64_t v25 = 2;
      objc_msgSend_objectAtIndexedSubscript_(v10, v23, 2, v24);
      while (1)
        id v26 = {;
        uint64_t v30 = objc_msgSend_width(v26, v27, v28, v29);

        id v33 = objc_msgSend_objectAtIndexedSubscript_(v10, v31, v25, v32);
        uint64_t v37 = objc_msgSend_height(v33, v34, v35, v36);

        uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v10, v38, v25, v39);
        objc_msgSend_setTexture_atIndex_(v19, v41, (uint64_t)v40, 0);

        uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v10, v42, v25 + 1, v43);
        objc_msgSend_setTexture_atIndex_(v19, v45, (uint64_t)v44, 1);

        v56[0] = v30;
        v56[1] = v37;
        v56[2] = 1;
        int64x2_t v54 = vdupq_n_s64(0x20uLL);
        uint64_t v55 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v19, v46, (uint64_t)v56, (uint64_t)&v54);
        if (v25-- <= 1) {
          break;
        }
LABEL_8:
        objc_msgSend_objectAtIndexedSubscript_(v10, v23, v25, v24);
      }
      objc_msgSend_endEncoding(v19, v23, v47, v24);
      objc_msgSend_commit(v15, v49, v50, v51);

      int v52 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v52 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
  }

  return v52;
}

- (int)_addPreviousLevel:(id)a3 inoutTex:(id)a4 inTexPrevLevel:(id)a5 writeOffset:(DFApplyEspressoOutputUniforms *)a6 applyUniforms:(unsigned int)a7 useUpsampledImage:
{
  int v8 = v7;
  uint64_t v9 = *(void *)&a7;
  int v10 = (int)a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  int v70 = v8;
  v71[0] = v10;
  uint64_t v20 = objc_msgSend_width(v16, v17, v18, v19);
  uint64_t v24 = v20;
  if (v8)
  {
    uint64_t v28 = objc_msgSend_height(v16, v21, v22, v23);
  }
  else
  {
    uint64_t v24 = 2 * v20;
    uint64_t v28 = 2 * objc_msgSend_height(v16, v21, v22, v23);
  }
  if (self->_shaders->_kernelAddPreviousLevel
    && (objc_msgSend_commandBuffer(v14, v25, v26, v27), (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v33 = v29;
    uint64_t v34 = objc_msgSend_computeCommandEncoder(v29, v30, v31, v32);
    if (v34)
    {
      uint64_t v37 = v34;
      int v61 = *(_DWORD *)(v9 + 80);
      uint64_t v62 = *(void *)(v9 + 212);
      int v63 = *(_DWORD *)(v9 + 220);
      long long v38 = *(_OWORD *)(v9 + 240);
      long long v64 = *(_OWORD *)(v9 + 224);
      long long v65 = v38;
      long long v39 = *(_OWORD *)(v9 + 272);
      long long v66 = *(_OWORD *)(v9 + 256);
      long long v67 = v39;
      long long v40 = *(_OWORD *)(v9 + 304);
      long long v68 = *(_OWORD *)(v9 + 288);
      long long v69 = v40;
      objc_msgSend_setLabel_(v34, v35, @"_shaders->_kernelAddPreviousLevel", v36);
      objc_msgSend_setComputePipelineState_(v37, v41, (uint64_t)self->_shaders->_kernelAddPreviousLevel, v42);
      objc_msgSend_setImageblockWidth_height_(v37, v43, 32, 32);
      objc_msgSend_setTexture_atIndex_(v37, v44, (uint64_t)v15, 0);
      objc_msgSend_setTexture_atIndex_(v37, v45, (uint64_t)v16, 1);
      objc_msgSend_setBytes_length_atIndex_(v37, v46, (uint64_t)v71, 4, 0);
      objc_msgSend_setBytes_length_atIndex_(v37, v47, (uint64_t)&v61, 112, 1);
      objc_msgSend_setBytes_length_atIndex_(v37, v48, (uint64_t)&v70, 4, 2);
      v60[0] = v24;
      v60[1] = v28;
      v60[2] = 1;
      int64x2_t v58 = vdupq_n_s64(0x20uLL);
      uint64_t v59 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v37, v49, (uint64_t)v60, (uint64_t)&v58);
      objc_msgSend_endEncoding(v37, v50, v51, v52);
      objc_msgSend_commit(v33, v53, v54, v55);

      int v56 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v56 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v56 = FigSignalErrorAt();
  }

  return v56;
}

- (int)_computeTextureness:(id)a3 applyUniforms:(DFApplyEspressoOutputUniforms *)a4 inputTexture:(id)a5 outputTexture:(id)a6 lscGainsTex:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v54 = a6;
  id v14 = a7;
  uint64_t v18 = objc_msgSend_width(v13, v15, v16, v17);
  uint64_t v22 = objc_msgSend_height(v13, v19, v20, v21);
  if (!self->_shaders->_kernelComputeTextureness
    || (uint64_t v26 = v22,
        objc_msgSend_commandBuffer(v12, v23, v24, v25),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
LABEL_8:
    uint64_t v42 = v54;
    goto LABEL_5;
  }
  uint64_t v31 = v27;
  id v32 = v12;
  id v33 = objc_msgSend_computeCommandEncoder(v27, v28, v29, v30);
  if (!v33)
  {
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();

    goto LABEL_8;
  }
  uint64_t v36 = v33;
  uint64_t v58 = *(void *)&a4->var23;
  float var25 = a4->var25;
  long long v61 = *(_OWORD *)&a4->var16;
  long long v60 = *(_OWORD *)&a4->var12;
  uint64_t v62 = *(void *)&a4->var19;
  float var21 = a4->var21;
  int var1 = a4[1].var3.var1;
  *(void *)((char *)&v61 + 4) = 0;
  objc_msgSend_setLabel_(v33, v34, @"_shaders->_kernelComputeTextureness", v35);
  objc_msgSend_setComputePipelineState_(v36, v37, (uint64_t)self->_shaders->_kernelComputeTextureness, v38);
  objc_msgSend_setImageblockWidth_height_(v36, v39, 32, 32);
  objc_msgSend_setTexture_atIndex_(v36, v40, (uint64_t)v13, 0);
  objc_msgSend_setTexture_atIndex_(v36, v41, (uint64_t)v14, 1);
  uint64_t v42 = v54;
  objc_msgSend_setTexture_atIndex_(v36, v43, (uint64_t)v54, 2);
  objc_msgSend_setBytes_length_atIndex_(v36, v44, (uint64_t)&v58, 60, 0);
  v57[0] = v18;
  v57[1] = v26;
  v57[2] = 1;
  int64x2_t v55 = vdupq_n_s64(0x20uLL);
  uint64_t v56 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v36, v45, (uint64_t)v57, (uint64_t)&v55);
  objc_msgSend_endEncoding(v36, v46, v47, v48);
  objc_msgSend_commit(v31, v49, v50, v51);

  int v52 = 0;
  id v12 = v32;
LABEL_5:

  return v52;
}

- (int)_validateInputsForTile:(TileBounds *)a3 espressoOutputTextureArray:(id)a4 inRefGaussianArray:(id)a5 inSLGaussianArray:(id)a6 inRefLaplacianArray:(id)a7 inSLLaplacianArray:(id)a8 inRefNoisePyramidLevel3:(id)a9 inSLNoisePyramidLevel3:(id)a10 slFusionMap:(id)a11 longFusionMap:(id)a12 prefusionWeightsTexture:(id)a13 skinMaskTexture:(id)a14 skyMaskTexture:(id)a15 finalOutputTexture:(id)a16 lscGains:(id)a17 refNoisePretuning:(id)a18
{
  v161[4] = *MEMORY[0x263EF8340];
  id v22 = a4;
  id v128 = a5;
  id v127 = a6;
  id v126 = a7;
  id v125 = a8;
  id v118 = a9;
  id v119 = a10;
  id v133 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v130 = a16;
  id v129 = a17;
  id v27 = a18;
  v116 = v27;
  int v117 = v22;
  if (!a3 || !v22 || !v133 || !v24 || !v130 || !v128 || !v127 || !v126 || !v125 || !v129 || !v27) {
    goto LABEL_101;
  }
  id v135 = v26;
  uint64_t v31 = objc_msgSend_width(v133, v28, v29, v30);
  uint64_t v35 = objc_msgSend_height(v133, v32, v33, v34);
  if (!self->_width
    || !self->_height
    || !self->_pixelFormat
    || (uint64_t v39 = v35, v31 != objc_msgSend_width(v24, v36, v37, v38))
    || v39 != objc_msgSend_height(v24, v40, v41, v42)
    || sub_262F7C9F4(v24) != 1)
  {
    FigDebugAssert3();
    int v114 = FigSignalErrorAt();
LABEL_82:
    id v72 = 0;
LABEL_83:
    id v26 = v135;
    goto LABEL_84;
  }
  if (v25 && sub_262F7C9F4(v25) != 1
    || v26 && sub_262F7C9F4(v26) != 1
    || sub_262F7C9F4(v133) != 1
    || v23 && sub_262F7C9F4(v23) != 1
    || sub_262F7C9F4(v130) != 4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend_count(v22, v43, v44, v45) != 4
    || sub_262F7C9F4(v129) < 3)
  {
LABEL_101:
    FigDebugAssert3();
    int v114 = FigSignalErrorAt();
    id v72 = 0;
    goto LABEL_84;
  }
  id v131 = v25;
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v22, v46, i, v47);
    if ((objc_msgSend_conformsToProtocol_(v49, v50, (uint64_t)&unk_270E60290, v51) & 1) == 0
      || sub_262F7C9F4(v49) != 1)
    {
      FigDebugAssert3();
      int v114 = FigSignalErrorAt();

      id v72 = 0;
      goto LABEL_83;
    }
    objc_msgSend_pixelFormat(v49, v52, v53, v54);
    uint64_t v58 = objc_msgSend_device(v49, v55, v56, v57);
    uint64_t v156 = 0;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v153 = 0u;
    MTLPixelFormatGetInfoForDevice();
    uint64_t v152 = 0;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v149 = 0u;
    MTLPixelFormatGetInfoForDevice();

    uint64_t v59 = self;
  }
  uint64_t v60 = 1;
  do
  {
    unint64_t width = self->_width;
    unint64_t height = self->_height;
    int v63 = objc_msgSend_objectAtIndexedSubscript_(self->_yinfTextures[0], v46, v60 - 1, v47);
    long long v67 = v63;
    if (!v63
      || (uint64_t v68 = v60, objc_msgSend_width(v63, v64, v65, v66) != width >> v60)
      || objc_msgSend_height(v67, v69, v70, v71) != height >> v60)
    {
      FigDebugAssert3();
      int v114 = FigSignalErrorAt();

      goto LABEL_82;
    }

    ++v60;
  }
  while (v68 != 3);
  v161[0] = v127;
  v161[1] = v128;
  v161[2] = v126;
  v161[3] = v125;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)v161, 4);
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v72 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v135;
  id v124 = v72;
  uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v145, (uint64_t)v160, 16);
  if (v120)
  {
    id v122 = v23;
    uint64_t v123 = *(void *)v146;
    id v121 = v24;
    while (2)
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v146 != v123) {
          objc_enumerationMutation(v72);
        }
        id v75 = *(void **)(*((void *)&v145 + 1) + 8 * v74);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v75, v76, v77, v78) != 4)
        {
          FigDebugAssert3();
          int v114 = FigSignalErrorAt();
LABEL_70:

          goto LABEL_84;
        }
        uint64_t v132 = v74;
        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v79 = v75;
        uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v141, (uint64_t)v159, 16);
        if (v81)
        {
          uint64_t v85 = v81;
          int v86 = 0;
          uint64_t v87 = *(void *)v142;
          while (2)
          {
            uint64_t v88 = 0;
            char v89 = v86;
            v86 += v85;
            do
            {
              if (*(void *)v142 != v87) {
                objc_enumerationMutation(v79);
              }
              id v90 = *(void **)(*((void *)&v141 + 1) + 8 * v88);
              unint64_t v91 = self->_height;
              unint64_t v92 = self->_width >> (v89 + v88);
              if (v92 != objc_msgSend_width(v90, v82, v83, v84)
                || v91 >> (v89 + v88) != objc_msgSend_height(v90, v93, v94, v95))
              {
                FigDebugAssert3();
                int v114 = FigSignalErrorAt();

                id v24 = v121;
                id v23 = v122;
                id v25 = v131;
                id v26 = v135;
                id v72 = v124;
                goto LABEL_70;
              }
              ++v88;
            }
            while (v85 != v88);
            uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v82, (uint64_t)&v141, (uint64_t)v159, 16);
            if (v85) {
              continue;
            }
            break;
          }
        }

        id v25 = v131;
        uint64_t v74 = v132 + 1;
        id v24 = v121;
        id v23 = v122;
        id v26 = v135;
        uint64_t v59 = self;
        id v72 = v124;
      }
      while (v132 + 1 != v120);
      uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v96, (uint64_t)&v145, (uint64_t)v160, 16);
      if (v120) {
        continue;
      }
      break;
    }
  }

  int networkVersion = v59->_networkVersion;
  if (v119 && v118 && networkVersion == 2)
  {
    v158[0] = v118;
    v158[1] = v119;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v97, (uint64_t)v158, 2);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v99 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v137, (uint64_t)v157, 16);
    if (v101)
    {
      uint64_t v105 = v101;
      uint64_t v106 = *(void *)v138;
      while (2)
      {
        for (uint64_t j = 0; j != v105; ++j)
        {
          if (*(void *)v138 != v106) {
            objc_enumerationMutation(v99);
          }
          id v108 = *(void **)(*((void *)&v137 + 1) + 8 * j);
          unint64_t v109 = v59->_width;
          if (objc_msgSend_width(v108, v102, v103, v104) == v109 >> 3)
          {
            unint64_t v113 = v59->_height;
            if (objc_msgSend_height(v108, v110, v111, v112) == v113 >> 3) {
              continue;
            }
          }
          FigDebugAssert3();
          int v114 = FigSignalErrorAt();
          goto LABEL_77;
        }
        uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v137, (uint64_t)v157, 16);
        if (v105) {
          continue;
        }
        break;
      }
      int v114 = 0;
LABEL_77:
      id v26 = v135;
      id v72 = v124;
    }
    else
    {
      int v114 = 0;
    }
  }
  else if (v119 || v118 || networkVersion != 1)
  {
    FigDebugAssert3();
    int v114 = FigSignalErrorAt();
  }
  else
  {
    int v114 = 0;
  }
LABEL_84:

  return v114;
}

- (int)_createUpsampledWithGaussianFilter:(id)a3 inTexPrevLevel:(id *)a4
{
  id v6 = a3;
  int v10 = objc_msgSend_allocator(self->_metal, v7, v8, v9);
  id v14 = objc_msgSend_newTextureDescriptor(v10, v11, v12, v13);

  if (v14)
  {
    uint64_t v18 = objc_msgSend_desc(v14, v15, v16, v17);
    objc_msgSend_setCompressionMode_(v18, v19, 2, v20);

    id v24 = objc_msgSend_desc(v14, v21, v22, v23);
    objc_msgSend_setCompressionFootprint_(v24, v25, 0, v26);

    uint64_t v30 = objc_msgSend_pixelFormat(*a4, v27, v28, v29);
    uint64_t v34 = objc_msgSend_desc(v14, v31, v32, v33);
    objc_msgSend_setPixelFormat_(v34, v35, v30, v36);

    uint64_t v40 = 2 * objc_msgSend_width(*a4, v37, v38, v39);
    uint64_t v44 = objc_msgSend_desc(v14, v41, v42, v43);
    objc_msgSend_setWidth_(v44, v45, v40, v46);

    uint64_t v50 = 2 * objc_msgSend_height(*a4, v47, v48, v49);
    uint64_t v54 = objc_msgSend_desc(v14, v51, v52, v53);
    objc_msgSend_setHeight_(v54, v55, v50, v56);

    uint64_t v60 = objc_msgSend_desc(v14, v57, v58, v59);
    objc_msgSend_setUsage_(v60, v61, 3, v62);

    objc_msgSend_setLabel_(v14, v63, 0, v64);
    uint64_t v68 = objc_msgSend_allocator(self->_metal, v65, v66, v67);
    uint64_t v71 = objc_msgSend_newTextureWithDescriptor_(v68, v69, (uint64_t)v14, v70);

    uint64_t v75 = objc_msgSend_commandBuffer(v6, v72, v73, v74);
    if (v75)
    {
      uint64_t v77 = (void *)v75;
      int v81 = objc_msgSend_upsampleUsing_inputTex_outputTexUpsampled_upsamplingFilter_(self->_laplacianPyram, v76, v75, (uint64_t)*a4, v71, 1);
      if (v81)
      {
        FigDebugAssert3();
      }
      else
      {
        objc_msgSend_commit(v77, v78, v79, v80);
        id v82 = v71;
        *a4 = v82;
      }
    }
    else
    {
      FigDebugAssert3();
      int v81 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v81 = FigSignalErrorAt();
  }

  return v81;
}

- (int)applyWeightsOnTile:(id)a3 uniforms:(DFApplyEspressoOutputUniforms *)a4 espressoOutputTextureArray:(id)a5 inRefGaussianArray:(id)a6 inSLGaussianArray:(id)a7 inRefLaplacianArray:(id)a8 inSLLaplacianArray:(id)a9 inRefNoisePyramidLevel3:(id)a10 inSLNoisePyramidLevel3:(id)a11 slFusionMap:(id)a12 longFusionMap:(id)a13 prefusionWeightsTexture:(id)a14 skinMaskTexture:(id)a15 skyMaskTexture:(id)a16 lscGains:(id)a17 refNoisePretuning:(id)a18 tile:(TileBounds *)a19 finalOutputTexture:(id)a20 lowLightMode:(BOOL)a21
{
  id v123 = a3;
  id v25 = a5;
  id v120 = a6;
  id v118 = a7;
  id v26 = a8;
  id v112 = a9;
  id v27 = v26;
  id v111 = a10;
  id v28 = a11;
  id v29 = a12;
  uint64_t v30 = v25;
  id v31 = a13;
  id v32 = a14;
  id v33 = a15;
  id v34 = a16;
  id v35 = a17;
  id v36 = a18;
  id v37 = a20;
  if (a19->var0 >= 0) {
    int v39 = a19->var0 & 1;
  }
  else {
    int v39 = -(a19->var0 & 1);
  }
  int v126 = v39;
  unint64_t v109 = v36;
  id v115 = v35;
  uint64_t v103 = v37;
  uint64_t v104 = v34;
  uint64_t v105 = v33;
  id v100 = v33;
  uint64_t v40 = self;
  uint64_t v106 = v32;
  int v107 = v31;
  int v110 = v28;
  int v41 = objc_msgSend__validateInputsForTile_espressoOutputTextureArray_inRefGaussianArray_inSLGaussianArray_inRefLaplacianArray_inSLLaplacianArray_inRefNoisePyramidLevel3_inSLNoisePyramidLevel3_slFusionMap_longFusionMap_prefusionWeightsTexture_skinMaskTexture_skyMaskTexture_finalOutputTexture_lscGains_refNoisePretuning_(self, v38, (uint64_t)a19, (uint64_t)v30, v120, v118, v27, v112, v111, v28, v29, v31, v32, v100, v34, v37, v35, v36);
  if (v41)
  {
    int Level_outDeghostedDenoised_lowLightMode = v41;
    FigDebugAssert3();
    uint64_t v43 = v123;
  }
  else
  {
    uint64_t v43 = v123;
    int v44 = objc_msgSend__collapseWeightsOnTile_inoutTexNSArray_(self, v42, (uint64_t)v123, (uint64_t)v30);
    if (!v44)
    {
      yinfTextures = self->_yinfTextures;
      uint64_t v116 = v126;
      p_var3 = &a4[6].var3.var3;
      uint64_t v48 = 4;
      id v108 = v30;
      while (1)
      {
        id v127 = objc_msgSend_objectAtIndexedSubscript_(v30, v45, v48 - 1, v46, v98, v99);
        if ((unint64_t)(v48 - 1) > 2)
        {
          id v125 = 0;
        }
        else
        {
          id v125 = objc_msgSend_objectAtIndexedSubscript_(v30, v49, v48, v50);
          if (v48 == 1)
          {
            id v53 = v103;
            int v119 = 1;
            goto LABEL_13;
          }
        }
        objc_msgSend_objectAtIndexedSubscript_(yinfTextures[v116], v49, v48 - 2, v50);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        if (v48 == 4)
        {
          int v119 = 0;
          int v56 = 0;
          id location = 0;
          goto LABEL_18;
        }
        int v119 = 0;
LABEL_13:
        uint64_t v54 = objc_msgSend_objectAtIndexedSubscript_(yinfTextures[v116], v51, v48 - 1, v52);
        id location = v54;
        if (v40->_networkVersion != 2)
        {
          int v56 = 0;
LABEL_18:
          long long v57 = *(_OWORD *)&a19->var0;
          long long v58 = *(_OWORD *)&a19->var4;
          *(void *)(p_var3 + 29) = *(void *)&a19->var8;
          *(_OWORD *)(p_var3 + 25) = v58;
          *(_OWORD *)(p_var3 + 21) = v57;
          BOOL v59 = v48 == 4 && v40->_networkVersion == 2;
          int v60 = !v59;
          uint64_t v121 = (uint64_t)v53;
          unsigned int v114 = v56;
          if (v59)
          {
            id v61 = v53;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v27, v51, v48 - 1, v52);
            id v61 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v64 = v61;
          uint64_t v65 = v27;
          uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v27, v62, v48 - 1, v63);
          long long v69 = objc_msgSend_objectAtIndexedSubscript_(v112, v67, v48 - 1, v68);
          id v72 = objc_msgSend_objectAtIndexedSubscript_(v120, v70, v48 - 1, v71);
          uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(v118, v73, v48 - 1, v74);
          uint64_t v77 = (void *)v75;
          uint64_t v79 = v110;
          id v78 = v111;
          if (v60 | a21)
          {
            id v78 = 0;
            uint64_t v79 = 0;
          }
          LOBYTE(v101) = a21;
          id v124 = v64;
          int Level_outDeghostedDenoised_lowLightMode = objc_msgSend__deghostAndDenoise_uniforms_inTexEspressoWeights_inTexEspressoWeightsUp_inRefLaplacian_inSynthLongLaplacian_inRefGaussian_inSynthLongGaussian_inRefNoisePyramidLevel3_inSynthLongNoisePyramidLevel3_refNoisePretuning_LSCGains_inTexPrevLevel_outDeghostedDenoised_lowLightMode_(self, v76, (uint64_t)v123, (uint64_t)p_var3, v127, v125, v66, v69, v72, v75, v78, v79, v109, v115, location, v64, v101);

          if (Level_outDeghostedDenoised_lowLightMode)
          {
            uint64_t v99 = v102;
            LODWORD(v98) = Level_outDeghostedDenoised_lowLightMode;
            FigDebugAssert3();
            int v90 = 4;
            uint64_t v43 = v123;
            uint64_t v30 = v108;
            id v27 = v65;
          }
          else
          {
            uint64_t v30 = v108;
            id v27 = v65;
            if (v60)
            {
              int v82 = p_var3[32];
              uint64_t v40 = self;
              uint64_t v43 = v123;
              id v53 = (id)v121;
              if (v82)
              {
                if (v82 == 1) {
                  objc_msgSend_objectAtIndexedSubscript_(v120, v80, v48 - 1, v81);
                }
                else {
                uint64_t v83 = objc_msgSend_objectAtIndexedSubscript_(v118, v80, v48 - 1, v81);
                }
                int Level_outDeghostedDenoised_lowLightMode = objc_msgSend__computeTextureness_applyUniforms_inputTexture_outputTexture_lscGainsTex_(self, v84, (uint64_t)v123, (uint64_t)p_var3, v83, v124, v115);

                if (Level_outDeghostedDenoised_lowLightMode)
                {
                  uint64_t v99 = v102;
                  LODWORD(v98) = Level_outDeghostedDenoised_lowLightMode;
                  goto LABEL_64;
                }
              }
              char v85 = v119 ^ 1;
              if (self->_networkVersion != 2) {
                char v85 = 1;
              }
              if (v85)
              {
                unint64_t v91 = objc_msgSend_objectAtIndexedSubscript_(v120, v80, v48 - 1, v81);
                int Level_outDeghostedDenoised_lowLightMode = objc_msgSend__applyEspressoOutputToLevel_uniforms_inRefGaussian_slFusionMap_longFusionMap_prefusionWeightsTexture_inTexArray_inTexArrayUp_skinMaskTexture_skyMaskTexture_deghostedAndDenoisedAndTextureness_outTex_tile_(self, v92, (uint64_t)v123, (uint64_t)p_var3, v91, v29, v107, v106, v127, v125, v105, v104, v124, v121, a19);

                if (Level_outDeghostedDenoised_lowLightMode)
                {
                  uint64_t v99 = v102;
                  LODWORD(v98) = Level_outDeghostedDenoised_lowLightMode;
                  goto LABEL_64;
                }
                if (v48 != 4)
                {
                  id v89 = location;
                  if (v119)
                  {
LABEL_46:
                    uint64_t v93 = v114;
                    uint64_t v94 = *(void *)&a19->var5;
                  }
                  else
                  {
                    uint64_t v94 = 0;
                    uint64_t v93 = v114;
                  }
                  HIWORD(v128) = WORD2(v94);
                  LOWORD(v128) = v94;
                  int v95 = objc_msgSend__addPreviousLevel_inoutTex_inTexPrevLevel_writeOffset_applyUniforms_useUpsampledImage_(self, v88, (uint64_t)v123, v121, v89, v128, p_var3, v93);
                  if (v95)
                  {
                    int Level_outDeghostedDenoised_lowLightMode = v95;
                    uint64_t v99 = v102;
                    LODWORD(v98) = v95;
                    goto LABEL_64;
                  }
                  char v96 = v93 ^ 1;
                  if (v48 == 4) {
                    char v96 = 1;
                  }
                  if ((v96 & 1) == 0) {
                    FigMetalDecRef();
                  }
                }
                int v90 = 0;
                int Level_outDeghostedDenoised_lowLightMode = 0;
              }
              else
              {
                int v86 = objc_msgSend_objectAtIndexedSubscript_(v120, v80, 0, v81);
                int Level_outDeghostedDenoised_lowLightMode = objc_msgSend__applyEspressoOutputLumaOnlyToLevel_uniforms_inRefGaussian_slFusionMap_longFusionMap_prefusionWeightsTexture_inTexArray_inTexArrayUp_skinMaskTexture_skyMaskTexture_deghostedAndDenoisedAndTextureness_outTex_tile_(self, v87, (uint64_t)v123, (uint64_t)p_var3, v86, v29, v107, v106, v127, v125, v105, v104, v124, v121, a19);

                if (!Level_outDeghostedDenoised_lowLightMode)
                {
                  id v89 = location;
                  goto LABEL_46;
                }
                uint64_t v99 = v102;
                LODWORD(v98) = Level_outDeghostedDenoised_lowLightMode;
LABEL_64:
                FigDebugAssert3();
                int v90 = 4;
              }
LABEL_53:

              goto LABEL_54;
            }
            int v90 = 0;
            int Level_outDeghostedDenoised_lowLightMode = 0;
            uint64_t v43 = v123;
          }
          id v53 = (id)v121;
          uint64_t v40 = self;
          goto LABEL_53;
        }
        id v129 = v54;
        int Level_outDeghostedDenoised_lowLightMode = objc_msgSend__createUpsampledWithGaussianFilter_inTexPrevLevel_(v40, v51, (uint64_t)v43, (uint64_t)&v129);
        objc_storeStrong(&location, v129);
        if (!Level_outDeghostedDenoised_lowLightMode)
        {
          int v56 = 1;
          goto LABEL_18;
        }
        uint64_t v99 = v102;
        LODWORD(v98) = Level_outDeghostedDenoised_lowLightMode;
        FigDebugAssert3();
        int v90 = 4;
LABEL_54:

        if (!v90)
        {
          p_var3 -= 84;
          if (--v48) {
            continue;
          }
        }
        goto LABEL_67;
      }
    }
    int Level_outDeghostedDenoised_lowLightMode = v44;
    FigDebugAssert3();
  }
LABEL_67:

  return Level_outDeghostedDenoised_lowLightMode;
}

- (int)convert444to420:(id)a3 input444:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputOffset:(TileBounds *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v19 = v15;
  if (!v13
    || !v14
    || !v15
    || (uint64_t v20 = objc_msgSend_width(v14, v16, v17, v18), v20 != 2 * objc_msgSend_width(v19, v21, v22, v23))
    || (uint64_t v27 = objc_msgSend_height(v14, v24, v25, v26), v27 != 2 * objc_msgSend_height(v19, v28, v29, v30))
    || !self->_shaders->_kernelConvert444to420)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v65 = (uint64_t)v19;
  uint64_t v34 = (uint64_t)v14;
  uint64_t v35 = (uint64_t)v13;
  unint64_t var7 = a7->var7;
  unint64_t var8 = a7->var8;
  uint64_t v38 = objc_msgSend_commandBuffer(v12, v31, v32, v33);
  if (!v38)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
LABEL_14:
    id v13 = (id)v35;
    id v14 = (id)v34;
    uint64_t v19 = (void *)v65;
    goto LABEL_10;
  }
  uint64_t v42 = v38;
  id v43 = v12;
  int v44 = objc_msgSend_computeCommandEncoder(v38, v39, v40, v41);
  if (!v44)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();

    goto LABEL_14;
  }
  uint64_t v47 = v44;
  unint64_t v48 = var7 >> 1;
  objc_msgSend_setLabel_(v44, v45, @"_shaders->_kernelConvert444to420", v46);
  objc_msgSend_setComputePipelineState_(v47, v49, (uint64_t)self->_shaders->_kernelConvert444to420, v50);
  objc_msgSend_setImageblockWidth_height_(v47, v51, 32, 32);
  id v13 = (id)v35;
  objc_msgSend_setTexture_atIndex_(v47, v52, v35, 0);
  id v14 = (id)v34;
  objc_msgSend_setTexture_atIndex_(v47, v53, v34, 1);
  uint64_t v19 = (void *)v65;
  objc_msgSend_setTexture_atIndex_(v47, v54, v65, 2);
  objc_msgSend_setBytes_length_atIndex_(v47, v55, (uint64_t)a7, 40, 0);
  v68[0] = v48;
  v68[1] = var8 >> 1;
  v68[2] = 1;
  int64x2_t v66 = vdupq_n_s64(0x10uLL);
  uint64_t v67 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v47, v56, (uint64_t)v68, (uint64_t)&v66);
  objc_msgSend_endEncoding(v47, v57, v58, v59);
  objc_msgSend_commit(v42, v60, v61, v62);

  int v63 = 0;
  id v12 = v43;
LABEL_10:

  return v63;
}

- (uint64_t)createShaderUniforms:(float)a3 totalGain:(float)a4 EVM_EV0_motionScore:(float)a5 lscGainGreenMax:(int64x2_t)a6 slQuantBounds:(float)a7 espressoModel:(uint64_t)a8 fullSize:(uint64_t)a9 uniforms:(void *)a10 hasLong:(uint64_t)a11 hasSIFR:(uint64_t)a12 isStationary:(int)a13 isSyntheticLongWithRealLong:(int)a14 aeShutterTimeRatio:(uint64_t)a15 colorCorrection:(BOOL)a16 inverseColorCorrection:(uint64_t)a17
{
  id v28 = a10;
  id v31 = v28;
  if (!v28 || !a12)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();
    goto LABEL_45;
  }
  uint64_t v32 = objc_msgSend_addBackModulationBandsForModel_(v28, v29, a11, v30);
  objc_msgSend_fusionDataForModel_(v31, v33, a11, v34);
  uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
  long long v154 = objc_msgSend_chromaBoostBandsForModel_isSyntheticLongWithRealLong_(v31, v36, a11, a16);
  objc_msgSend_desaturationDataForModel_(v31, v37, a11, v38);
  int v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  long long v153 = objc_msgSend_haloSuppressionBandsForModel_(v31, v40, a11, v41);
  objc_msgSend_darkEdgeSuppressionBandsForModel_(v31, v42, a11, v43);
  v152 = long long v151 = v32;
  if (!v32)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

    goto LABEL_45;
  }
  if (!v35)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

LABEL_59:
    goto LABEL_45;
  }
  if (!v154)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

LABEL_58:
    goto LABEL_59;
  }
  if (!v39)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

LABEL_56:
    unsigned int v128 = (float *)v154;
LABEL_57:

    goto LABEL_58;
  }
  if (!v153)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();
    id v127 = v152;
LABEL_55:

    goto LABEL_56;
  }
  if (!v152)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();
LABEL_54:
    id v127 = v153;
    goto LABEL_55;
  }
  if ((unint64_t)objc_msgSend_count(v32, v44, v45, v46) <= 3
    || (unint64_t)objc_msgSend_count(v154, v47, v48, v49) <= 3
    || (unint64_t)objc_msgSend_count(v153, v50, v51, v52) <= 3
    || (unint64_t)objc_msgSend_count(v152, v53, v54, v55) <= 3)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

    goto LABEL_54;
  }
  int v56 = &OBJC_IVAR___DeepFusionFusion_slEv0;
  if (a13) {
    int v56 = &OBJC_IVAR___DeepFusionFusion_slEv0Long;
  }
  long long v57 = (float *)*(id *)&v35[*v56];
  uint64_t v58 = &OBJC_IVAR___DeepFusionFusionData_noSifrBands;
  if (a14) {
    uint64_t v58 = &OBJC_IVAR___DeepFusionFusionData_sifrBands;
  }
  long long v150 = v57;
  id v59 = *(id *)((char *)v57 + *v58);
  if (!v59)
  {
    FigDebugAssert3();
    uint64_t v125 = FigSignalErrorAt();

    unsigned int v128 = v150;
    goto LABEL_57;
  }
  int v60 = v59;
  uint64_t v142 = a12;
  id v133 = v35;
  float v141 = sub_262FCDA18(v39[1], a1);
  float v61 = sub_262FCDA18(v39[2], a1);
  uint64_t v132 = v39;
  float v144 = sub_262FCDA18(v39[3], a1);
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  unsigned int v134 = 0;
  int8x16_t v139 = *(int8x16_t *)(MEMORY[0x263EF89A0] + 16);
  int8x16_t v140 = *(int8x16_t *)MEMORY[0x263EF89A0];
  if (a14) {
    int v66 = 1;
  }
  else {
    int v66 = 2;
  }
  int v135 = v66;
  int32x2_t v138 = vmovn_s64(a6);
  int8x16_t v137 = *(int8x16_t *)(MEMORY[0x263EF89A0] + 32);
  float v136 = 1.0 / (float)(v61 * v61);
  char v143 = a14;
  do
  {
    objc_msgSend_objectAtIndexedSubscript_(v151, v62, v65, v63, v129, v130);
    uint64_t v67 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v154, v68, v65, v69);
    uint64_t v70 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v153, v71, v65, v72);
    uint64_t v73 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v152, v74, v65, v75);
    int64x2_t v76 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v77 = sub_262FCDA18(v70[1], a1);
    float v78 = sub_262FCDA18(v70[2], a1);
    float v79 = sub_262FCDA18(v70[3], a1);
    float v80 = sub_262FCDA18(v70[4], a1);
    if (v77 >= v78)
    {
      uint64_t v130 = v131;
      LODWORD(v129) = 0;
LABEL_42:
      FigDebugAssert3();
      unsigned int v134 = FigSignalErrorAt();
      char v122 = 1;
      goto LABEL_36;
    }
    float v81 = v80;
    if (v79 >= v80)
    {
      uint64_t v130 = v131;
      LODWORD(v129) = 0;
      goto LABEL_42;
    }
    float v82 = 0.0;
    if (v64) {
      float v83 = 0.0;
    }
    else {
      float v83 = v144;
    }
    float v84 = sub_262FCDA18(v67[7], a1);
    *(float *)&unint64_t v85 = sub_262FCDA18(v67[2], a1);
    a6.i64[0] = v85;
    float v177 = sub_262FCDA18(v67[3], a1);
    float v175 = sub_262FCDA18(v67[3], a1);
    *(float *)&uint64_t v86 = sub_262FCDA18(v67[8], a1);
    *(void *)&long long v181 = v86;
    float v173 = sub_262FCDA18(v67[9], a1);
    float v171 = sub_262FCDA18(v67[9], a1);
    *(float *)&uint64_t v87 = sub_262FCDA18(v67[4], a1);
    *(void *)&long long v180 = v87;
    float v169 = sub_262FCDA18(v67[5], a1);
    float v167 = sub_262FCDA18(v67[5], a1);
    float v179 = sub_262FCDA18(v67[6], a1);
    if (v64 || sub_262FCDA18(v67[1], a1) <= 0.1)
    {
      int v162 = 0;
      v90.i32[0] = 0;
      float v161 = 0.0;
      goto LABEL_32;
    }
    float v82 = sub_262FCDA18(v67[10], a1);
    float v92 = sub_262FCDA18(v67[11], a1);
    if (v82 >= v92)
    {
      uint64_t v130 = v131;
      LODWORD(v129) = 0;
      goto LABEL_42;
    }
    float v161 = v92;
    int v162 = v135;
    *(float *)v90.i32 = 1.0 / sub_262FCDA18(v67[12], a1);
LABEL_32:
    __int32 v155 = v90.i32[0];
    v90.i64[0] = 0;
    v91.i64[0] = v64;
    int8x16_t v93 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v91, v90).i64[0], 0);
    int8x16_t v160 = vbslq_s8(v93, a18, v140);
    int8x16_t v159 = vbslq_s8(v93, a19, v139);
    int8x16_t v158 = vbslq_s8(v93, a20, v137);
    int8x16_t v157 = vbslq_s8(v93, a21, v140);
    int8x16_t v156 = vbslq_s8(v93, a22, v139);
    int64x2_t v94 = a6;
    *(float *)&v94.i32[1] = v177;
    *(float *)&v94.i32[2] = v175;
    a6 = v94;
    long long v95 = v181;
    *((float *)&v95 + 1) = v173;
    *((float *)&v95 + 2) = v171;
    long long v181 = v95;
    long long v96 = v180;
    *((float *)&v96 + 1) = v169;
    *((float *)&v96 + 2) = v167;
    long long v180 = v96;
    int8x16_t v178 = vbslq_s8(v93, a23, v137);
    BOOL v97 = v150[2] >= a2;
    objc_msgSend_objectAtIndexedSubscript_(v60, v88, v65, v89);
    uint64_t v98 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v176 = sub_262FCDA18(v98[2], a1);

    objc_msgSend_objectAtIndexedSubscript_(v60, v99, v65, v100);
    uint64_t v101 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v174 = sub_262FCDA18(v101[3], a1);

    objc_msgSend_objectAtIndexedSubscript_(v60, v102, v65, v103);
    uint64_t v104 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v172 = sub_262FCDA18(v104[5], a1);

    objc_msgSend_objectAtIndexedSubscript_(v60, v105, v65, v106);
    int v107 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v170 = sub_262FCDA18(v107[4], a1);

    objc_msgSend_objectAtIndexedSubscript_(v60, v108, v65, v109);
    int v110 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    float v168 = sub_262FCDA18(v110[1], a1);

    unint64_t v113 = objc_msgSend_objectAtIndexedSubscript_(v60, v111, v65, v112);
    LODWORD(v110) = *(_DWORD *)(v113[6] + 8);

    float v166 = v79;
    float v165 = v81;
    float v164 = v83;
    float v163 = v77;
    if ((int)v110 < 1)
    {
      float v117 = 1.0;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v60, v114, v65, v115);
      uint64_t v116 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      float v117 = sub_262FCDA18(v116[6], a1);
    }
    float v118 = sub_262FCDA18(v73[1], a1);
    float v119 = sub_262FCDA18(v76[2], a1);
    float v120 = sub_262FCDA18(v76[1], a1);
    float v121 = sub_262FCDA18(v76[3], a1);
    char v122 = 0;
    uint64_t v123 = v142 + v64;
    *(_DWORD *)(v142 + v64 + 8) = a6.i32[2];
    *(void *)uint64_t v123 = a6.i64[0];
    *(float *)(v123 + 16) = v84;
    *(_DWORD *)(v123 + 40) = DWORD2(v180);
    *(void *)(v123 + 32) = v180;
    *(_OWORD *)(v123 + 84) = 0u;
    *(float *)(v123 + 48) = v179;
    *(_DWORD *)(v123 + 72) = DWORD2(v181);
    *(void *)(v123 + 64) = v181;
    *(_OWORD *)(v123 + 84) = 0u;
    *(_OWORD *)(v123 + 100) = 0u;
    *(_OWORD *)(v123 + 100) = 0u;
    *(float *)(v123 + 124) = (float)(1 << v65);
    *(float *)(v123 + 132) = v82;
    *(float *)(v123 + 136) = v161;
    *(_DWORD *)(v123 + 140) = v155;
    *(float *)(v123 + 148) = v176;
    *(float *)(v123 + 152) = v174;
    *(float *)(v123 + 156) = v172;
    *(float *)(v123 + 160) = v170;
    *(float *)(v123 + 164) = v168;
    *(float *)(v123 + 168) = v117;
    *(float *)(v123 + 192) = v163;
    *(float *)(v123 + 196) = v78;
    *(float *)(v123 + 200) = v166;
    *(float *)(v123 + 204) = v165;
    *(int8x16_t *)(v123 + 224) = v160;
    *(int8x16_t *)(v123 + 240) = v159;
    *(int8x16_t *)(v123 + 256) = v158;
    *(int8x16_t *)(v123 + 272) = v157;
    *(int8x16_t *)(v123 + 288) = v156;
    *(int8x16_t *)(v123 + 304) = v178;
    *(float *)(v123 + 320) = v118;
    *(float *)(v123 + 324) = v120;
    *(float *)(v123 + 328) = v119;
    *(float *)(v123 + 332) = v121;
    *(float *)(v123 + 216) = v136;
    *(float *)(v123 + 220) = v164;
    *(void *)(v123 + 116) = 0;
    *(void *)(v123 + 20) = 0;
    *(_DWORD *)(v123 + 28) = 0;
    *(void *)(v123 + 52) = 0;
    *(_DWORD *)(v123 + 60) = 0;
    *(void *)(v123 + 116) = 0;
    *(_DWORD *)(v123 + 12) = 0;
    *(_DWORD *)(v123 + 44) = 0;
    *(_DWORD *)(v123 + 76) = 0;
    *(_DWORD *)(v123 + 80) = v65;
    *(_DWORD *)(v123 + 128) = v162;
    *(unsigned char *)(v123 + 144) = v97;
    *(_WORD *)(v123 + 145) = 0;
    *(unsigned char *)(v123 + 147) = 0;
    *(float *)(v123 + 172) = a3;
    *(unsigned char *)(v123 + 176) = v143;
    *(_WORD *)(v123 + 177) = 0;
    *(unsigned char *)(v123 + 179) = 0;
    *(_WORD *)(v123 + 182) = v138.i16[2];
    *(_WORD *)(v123 + 180) = v138.i16[0];
    *(float *)(v123 + 184) = a4;
    *(float *)(v123 + 188) = a5;
    *(float *)(v123 + 208) = a7;
    *(float *)(v123 + 212) = v141;
LABEL_36:

    if (v122) {
      break;
    }
    ++v65;
    BOOL v124 = v64 == 1008;
    v64 += 336;
  }
  while (!v124);

  uint64_t v125 = v134;
LABEL_45:

  return v125;
}

- (int)computeAMBNRDenoiseBoostMap:(id)a3 boostMap:(id)a4 longFusionMap:(id)a5 ev0FusionMap:(id)a6 ev0Metadata:(frameMetadata *)a7 longMetadata:(frameMetadata *)a8 numEV0:(int)a9 ev0FusionTarget:(float)a10 longFusionTarget:(float)a11
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  float v75 = a11;
  float v76 = a10;
  float v74 = a8->exposureParams.exposure_time / a7->exposureParams.exposure_time;
  uint64_t v22 = self->_shaders->_kernelComputeDenoiseBoostMap;
  id v23 = a3;
  uint64_t v27 = objc_msgSend_threadExecutionWidth(v22, v24, v25, v26);
  unint64_t v31 = objc_msgSend_maxTotalThreadsPerThreadgroup(v22, v28, v29, v30);
  unint64_t v35 = objc_msgSend_threadExecutionWidth(v22, v32, v33, v34);

  int v39 = objc_msgSend_commandBuffer(v23, v36, v37, v38);

  if (v39
    && (objc_msgSend_computeCommandEncoder(v39, v40, v41, v42),
        (uint64_t v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v46 = v43;
    objc_msgSend_setLabel_(v43, v44, @"_shaders->_kernelComputeDenoiseBoostMap", v45);
    objc_msgSend_setComputePipelineState_(v46, v47, (uint64_t)self->_shaders->_kernelComputeDenoiseBoostMap, v48);
    objc_msgSend_setTexture_atIndex_(v46, v49, (uint64_t)v20, 0);
    objc_msgSend_setTexture_atIndex_(v46, v50, (uint64_t)v21, 1);
    objc_msgSend_setTexture_atIndex_(v46, v51, (uint64_t)v19, 2);
    objc_msgSend_setBytes_length_atIndex_(v46, v52, (uint64_t)&v74, 4, 0);
    objc_msgSend_setBytes_length_atIndex_(v46, v53, (uint64_t)&a9, 4, 1);
    objc_msgSend_setBytes_length_atIndex_(v46, v54, (uint64_t)&v76, 4, 2);
    objc_msgSend_setBytes_length_atIndex_(v46, v55, (uint64_t)&v75, 4, 3);
    objc_msgSend_setBytes_length_atIndex_(v46, v56, (uint64_t)&self->_networkVersion, 4, 4);
    v73[0] = objc_msgSend_width(v19, v57, v58, v59);
    v73[1] = objc_msgSend_height(v19, v60, v61, v62);
    v73[2] = 1;
    v72[0] = v27;
    v72[1] = v31 / v35;
    v72[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v46, v63, (uint64_t)v73, (uint64_t)v72);
    objc_msgSend_endEncoding(v46, v64, v65, v66);
    objc_msgSend_commit(v39, v67, v68, v69);

    int v70 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v70 = FigSignalErrorAt();
  }

  return v70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laplacianPyram, 0);
  for (uint64_t i = 32; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end