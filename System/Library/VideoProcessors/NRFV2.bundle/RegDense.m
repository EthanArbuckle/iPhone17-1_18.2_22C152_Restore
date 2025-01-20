@interface RegDense
+ (int)prewarmShaders:(id)a3;
- (RegDense)initWithMetalContext:(id)a3;
- (RegDense)initWithMetalContext:(id)a3 bicubicWarping:(BOOL)a4;
- (int)blendingWeightLowLightUsing:(id)a3 and:(id)a4 shadowDenseBlendStrength:(float)a5 nonShadowDenseBlendStrength:(float)a6 relativeBrightness:(float)a7 lensShadingFactor:(float)a8 noiseModel:(const NoiseModel *)a9 homography:(id *)a10;
- (int)blendingWeightUsing:(id)a3 and:(id)a4 homography:(id *)a5 relativeBrightness:(float)a6;
- (int)generateSparseBlendingMapUsing:(id)a3 nonReference:(id)a4 sparseBlendingMap:(id)a5 homography:(id *)a6 relativeBrightness:(float)a7;
- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4;
- (int)prepareWithRegDenseParams:(RegDenseParameters *)a3 subAllocatorID:(unsigned int)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6;
- (int)pyramidConfidence:(id)a3 input:(id)a4;
- (int)runLowLightWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 refWeightsLuma:(id)a6 nonRefWeightsLuma:(id)a7 relativeBrightness:(float)a8 homography:(id *)a9 regDenseParams:(RegDenseParameters *)a10;
- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7;
- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11;
- (int)warpAdditionalImage:(id)a3 warpedImage:(id)a4 homography:(id *)a5 hybridReg:(BOOL)a6 alwaysDense:(BOOL)a7;
- (int)warpFrameWithInputY:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7 hybridReg:(BOOL)a8 alwaysDense:(BOOL)a9;
- (int)warpFrameWithInputYAndConfidence:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7;
- (void)dealloc;
- (void)reset;
- (void)resetIncludingConfidence:(BOOL)a3;
@end

@implementation RegDense

- (RegDense)initWithMetalContext:(id)a3
{
  return (RegDense *)objc_msgSend_initWithMetalContext_bicubicWarping_(self, a2, (uint64_t)a3, 0);
}

- (RegDense)initWithMetalContext:(id)a3 bicubicWarping:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v59.receiver = self;
  v59.super_class = (Class)RegDense;
  v8 = [(RegDense *)&v59 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v8->_metal, a3);
  v10 = objc_opt_new();
  v13 = v10;
  BOOL v14 = !v4;
  uint64_t v15 = v4 ? 2 : 1;
  uint64_t v16 = v14 ? 3 : 0;
  objc_msgSend_setMinFilter_(v10, v11, v15, v12);
  objc_msgSend_setMagFilter_(v13, v17, v15, v18);
  objc_msgSend_setSAddressMode_(v13, v19, v16, v20);
  objc_msgSend_setTAddressMode_(v13, v21, v16, v22);
  v26 = objc_msgSend_device(v9->_metal, v23, v24, v25);
  uint64_t v29 = objc_msgSend_newSamplerStateWithDescriptor_(v26, v27, (uint64_t)v13, v28);
  warpingSampler = v9->_warpingSampler;
  v9->_warpingSampler = (MTLSamplerState *)v29;

  uint64_t v31 = objc_opt_new();
  pyrConfidence = v9->_pyrConfidence;
  v9->_pyrConfidence = (PyramidStorage_NRF *)v31;

  if (v9->_pyrConfidence)
  {
    v33 = [RegPyrFusion alloc];
    uint64_t v36 = objc_msgSend_initWithMetalContext_(v33, v34, (uint64_t)v9->_metal, v35);
    sfRegPyr = v9->_sfRegPyr;
    v9->_sfRegPyr = (RegPyrFusion *)v36;

    if (v9->_sfRegPyr)
    {
      v41 = objc_msgSend_sharedInstance(RegDenseShared, v38, v39, v40);
      uint64_t v44 = objc_msgSend_getShaders_(v41, v42, (uint64_t)v9->_metal, v43);
      shaders = v9->_shaders;
      v9->_shaders = (RegDenseShaders *)v44;

      if (v9->_shaders)
      {
        objc_msgSend_prewarmInternalMetalShadersForFormatsList_(v9->_metal, v46, (uint64_t)&unk_270E50808, v47);
        v51 = objc_msgSend_device(v9->_metal, v48, v49, v50);
        uint64_t v53 = objc_msgSend_newBufferWithLength_options_(v51, v52, 48, 0);
        homographyMatrixBuffer = v9->_homographyMatrixBuffer;
        v9->_homographyMatrixBuffer = (MTLBuffer *)v53;

        if (v9->_homographyMatrixBuffer) {
          goto LABEL_12;
        }
      }
    }
  }
  FigDebugAssert3();
  int v58 = FigSignalErrorAt();
  v55 = 0;
  if (!v58) {
LABEL_12:
  }
    v55 = v9;
  v56 = v55;

  return v56;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  BOOL v4 = [RegDenseShaders alloc];
  id v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

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
  objc_msgSend_reset(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)RegDense;
  [(RegDense *)&v5 dealloc];
}

- (int)pyramidConfidence:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v14 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v8, v9, v10);
  if (v14
    && (objc_msgSend_commandBuffer(self->_metal, v11, v12, v13), (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v15;
    uint64_t v20 = objc_msgSend_colorAttachments(v14, v16, v17, v18);
    v23 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0, v22);
    objc_msgSend_setTexture_(v23, v24, (uint64_t)v6, v25);

    uint64_t v28 = objc_msgSend_renderCommandEncoderWithDescriptor_(v19, v26, (uint64_t)v14, v27);
    if (v28)
    {
      v32 = (void *)v28;
      v33 = objc_msgSend_fullRangeVertexBuf(self->_metal, v29, v30, v31);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v32, v34, (uint64_t)v33, 0, 0);

      objc_msgSend_setFragmentTexture_atIndex_(v32, v35, (uint64_t)v7, 0);
      objc_msgSend_setRenderPipelineState_(v32, v36, (uint64_t)self->_shaders->_confPipeline, v37);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v32, v38, 4, 0, 4);
      objc_msgSend_endEncoding(v32, v39, v40, v41);
      objc_msgSend_commit(self->_metal, v42, v43, v44);

      int v45 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v45 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
  }

  return v45;
}

- (int)blendingWeightUsing:(id)a3 and:(id)a4 homography:(id *)a5 relativeBrightness:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  float v57 = a6;
  uint64_t v15 = objc_msgSend_commandBuffer(self->_metal, v12, v13, v14);
  v19 = v15;
  if (v15
    && (objc_msgSend_computeCommandEncoder(v15, v16, v17, v18),
        (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = v20;
    objc_msgSend_setTexture_atIndex_(v20, v21, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v22, v23, (uint64_t)v11, 1);
    objc_msgSend_setTexture_atIndex_(v22, v24, (uint64_t)self->_shiftMap, 2);
    objc_msgSend_setTexture_atIndex_(v22, v25, (uint64_t)self->_confidenceMap, 3);
    objc_msgSend_setTexture_atIndex_(v22, v26, (uint64_t)self->_blendingWeight, 4);
    uint64_t v30 = (_OWORD *)objc_msgSend_contents(self->_homographyMatrixBuffer, v27, v28, v29);
    long long v31 = *((_OWORD *)a5 + 2);
    long long v32 = *(_OWORD *)a5;
    v30[1] = *((_OWORD *)a5 + 1);
    v30[2] = v31;
    *uint64_t v30 = v32;
    objc_msgSend_setBuffer_offset_atIndex_(v22, v33, (uint64_t)self->_homographyMatrixBuffer, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v22, v34, (uint64_t)&v57, 4, 1);
    unint64_t v38 = (((unint64_t)objc_msgSend_width(v10, v35, v36, v37) >> 1) + 7) >> 3;
    unint64_t v42 = (((unint64_t)objc_msgSend_height(v10, v39, v40, v41) >> 1) + 7) >> 3;
    objc_msgSend_setComputePipelineState_(v22, v43, (uint64_t)self->_shaders->_getBlendingWeightPipeline, v44);
    v56[0] = v38;
    v56[1] = v42;
    v56[2] = 1;
    int64x2_t v54 = vdupq_n_s64(8uLL);
    uint64_t v55 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v22, v45, (uint64_t)v56, (uint64_t)&v54);
    objc_msgSend_endEncoding(v22, v46, v47, v48);
    objc_msgSend_commit(self->_metal, v49, v50, v51);

    int v52 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
  }

  return v52;
}

- (int)blendingWeightLowLightUsing:(id)a3 and:(id)a4 shadowDenseBlendStrength:(float)a5 nonShadowDenseBlendStrength:(float)a6 relativeBrightness:(float)a7 lensShadingFactor:(float)a8 noiseModel:(const NoiseModel *)a9 homography:(id *)a10
{
  id v18 = a3;
  id v19 = a4;
  v23 = objc_msgSend_commandBuffer(self->_metal, v20, v21, v22);
  uint64_t v27 = v23;
  if (v23
    && (objc_msgSend_computeCommandEncoder(v23, v24, v25, v26),
        (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v30 = v28;
    objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v18, 0);
    objc_msgSend_setTexture_atIndex_(v30, v31, (uint64_t)v19, 1);
    objc_msgSend_setTexture_atIndex_(v30, v32, (uint64_t)self->_blendingWeightLowLight, 2);
    *(float *)float v57 = a5;
    *(float *)&v57[1] = a6;
    *(float *)&v57[2] = a7;
    *(float *)&v57[3] = a8;
    long long v58 = *(_OWORD *)&a9->lumaSigmaIntercept;
    uint64_t v59 = *(void *)&a9[1].lumaSigmaSlope;
    uint64_t v60 = 0;
    long long v33 = *((_OWORD *)a10 + 1);
    long long v61 = *(_OWORD *)a10;
    long long v62 = v33;
    long long v63 = *((_OWORD *)a10 + 2);
    objc_msgSend_setBytes_length_atIndex_(v30, v34, (uint64_t)v57, 96, 0);
    unint64_t v38 = (unint64_t)(objc_msgSend_width(self->_blendingWeightLowLight, v35, v36, v37) + 7) >> 3;
    unint64_t v42 = (unint64_t)(objc_msgSend_height(self->_blendingWeightLowLight, v39, v40, v41) + 7) >> 3;
    objc_msgSend_setComputePipelineState_(v30, v43, (uint64_t)self->_shaders->_getBlendingWeightLowLightPipeline, v44);
    v56[0] = v38;
    v56[1] = v42;
    v56[2] = 1;
    int64x2_t v54 = vdupq_n_s64(8uLL);
    uint64_t v55 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v30, v45, (uint64_t)v56, (uint64_t)&v54);
    objc_msgSend_endEncoding(v30, v46, v47, v48);
    objc_msgSend_commit(self->_metal, v49, v50, v51);

    int v52 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
  }

  return v52;
}

- (int)generateSparseBlendingMapUsing:(id)a3 nonReference:(id)a4 sparseBlendingMap:(id)a5 homography:(id *)a6 relativeBrightness:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v18 = objc_msgSend_commandBuffer(self->_metal, v15, v16, v17);
  uint64_t v22 = v18;
  if (v18
    && (objc_msgSend_computeCommandEncoder(v18, v19, v20, v21),
        (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v25 = v23;
    objc_msgSend_setTexture_atIndex_(v23, v24, (uint64_t)v12, 0);
    objc_msgSend_setTexture_atIndex_(v25, v26, (uint64_t)v13, 1);
    objc_msgSend_setTexture_atIndex_(v25, v27, (uint64_t)self->_shiftMap, 2);
    objc_msgSend_setTexture_atIndex_(v25, v28, (uint64_t)v14, 3);
    memset(v52, 0, 48);
    *((float *)v52 + 2) = a7;
    long long v29 = *((_OWORD *)a6 + 1);
    v52[3] = *(_OWORD *)a6;
    long long v30 = *((_OWORD *)a6 + 2);
    v52[4] = v29;
    v52[5] = v30;
    objc_msgSend_setBytes_length_atIndex_(v25, v31, (uint64_t)v52, 96, 0);
    objc_msgSend_setComputePipelineState_(v25, v32, (uint64_t)self->_shaders->_generateSparseBlendingMapPipeline, v33);
    v51[0] = objc_msgSend_width(v14, v34, v35, v36);
    v51[1] = objc_msgSend_height(v14, v37, v38, v39);
    v51[2] = 1;
    int64x2_t v49 = vdupq_n_s64(8uLL);
    uint64_t v50 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v25, v40, (uint64_t)v51, (uint64_t)&v49);
    objc_msgSend_endEncoding(v25, v41, v42, v43);
    objc_msgSend_commit(self->_metal, v44, v45, v46);

    int v47 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
  }

  return v47;
}

- (int)warpFrameWithInputYAndConfidence:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v19 = objc_msgSend_width(v12, v16, v17, v18);
  if (v19 == objc_msgSend_width(v14, v20, v21, v22)
    && (uint64_t v26 = objc_msgSend_height(v12, v23, v24, v25), v26 == objc_msgSend_height(v14, v27, v28, v29))
    && (uint64_t v33 = objc_msgSend_width(v13, v30, v31, v32), v33 == objc_msgSend_width(v15, v34, v35, v36))
    && (uint64_t v40 = objc_msgSend_height(v13, v37, v38, v39), v40 == objc_msgSend_height(v15, v41, v42, v43))
    && (objc_msgSend_commandBuffer(self->_metal, v44, v45, v46),
        (int v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v51 = v47;
    int v52 = objc_msgSend_computeCommandEncoder(v47, v48, v49, v50);
    if (v52)
    {
      uint64_t v55 = v52;
      objc_msgSend_setComputePipelineState_(v52, v53, (uint64_t)self->_shaders->_warpWithBlendingWeightAndConfidencePipeline, v54);
      objc_msgSend_setImageblockWidth_height_(v55, v56, 32, 32);
      objc_msgSend_setTexture_atIndex_(v55, v57, (uint64_t)v12, 0);
      objc_msgSend_setTexture_atIndex_(v55, v58, (uint64_t)v13, 1);
      objc_msgSend_setTexture_atIndex_(v55, v59, (uint64_t)self->_shiftMap, 2);
      objc_msgSend_setTexture_atIndex_(v55, v60, (uint64_t)v14, 3);
      objc_msgSend_setTexture_atIndex_(v55, v61, (uint64_t)v15, 4);
      objc_msgSend_setTexture_atIndex_(v55, v62, (uint64_t)self->_confidenceMap, 6);
      objc_msgSend_setSamplerState_atIndex_(v55, v63, (uint64_t)self->_warpingSampler, 0);
      if (a7)
      {
        v67 = (_OWORD *)objc_msgSend_contents(self->_homographyMatrixBuffer, v64, v65, v66);
        long long v68 = *((_OWORD *)a7 + 2);
        long long v69 = *(_OWORD *)a7;
        v67[1] = *((_OWORD *)a7 + 1);
        v67[2] = v68;
        _OWORD *v67 = v69;
        objc_msgSend_setBuffer_offset_atIndex_(v55, v70, (uint64_t)self->_homographyMatrixBuffer, 0, 0);
        objc_msgSend_setTexture_atIndex_(v55, v71, (uint64_t)self->_blendingWeightLowLight, 5);
      }
      v86[0] = objc_msgSend_width(v15, v64, v65, v66);
      v86[1] = objc_msgSend_height(v15, v72, v73, v74);
      v86[2] = 1;
      int64x2_t v84 = vdupq_n_s64(0x10uLL);
      uint64_t v85 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v55, v75, (uint64_t)v86, (uint64_t)&v84);
      objc_msgSend_endEncoding(v55, v76, v77, v78);
      objc_msgSend_commit(self->_metal, v79, v80, v81);

      int v82 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v82 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v82 = FigSignalErrorAt();
  }

  return v82;
}

- (int)warpFrameWithInputY:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7 hybridReg:(BOOL)a8 alwaysDense:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v22 = objc_msgSend_commandBuffer(self->_metal, v19, v20, v21);
  uint64_t v26 = v22;
  if (v22
    && (objc_msgSend_computeCommandEncoder(v22, v23, v24, v25),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v30 = v27;
    objc_msgSend_setComputePipelineState_(v27, v28, (uint64_t)self->_shaders->_warpWithBlendingWeightPipeline, v29);
    objc_msgSend_setImageblockWidth_height_(v30, v31, 32, 32);
    objc_msgSend_setTexture_atIndex_(v30, v32, (uint64_t)v15, 0);
    objc_msgSend_setTexture_atIndex_(v30, v33, (uint64_t)v16, 1);
    objc_msgSend_setTexture_atIndex_(v30, v34, (uint64_t)self->_shiftMap, 2);
    objc_msgSend_setTexture_atIndex_(v30, v35, (uint64_t)v17, 3);
    objc_msgSend_setTexture_atIndex_(v30, v36, (uint64_t)v18, 4);
    objc_msgSend_setSamplerState_atIndex_(v30, v37, (uint64_t)self->_warpingSampler, 0);
    if (a7)
    {
      uint64_t v41 = (_OWORD *)objc_msgSend_contents(self->_homographyMatrixBuffer, v38, v39, v40);
      long long v42 = *((_OWORD *)a7 + 2);
      long long v43 = *(_OWORD *)a7;
      v41[1] = *((_OWORD *)a7 + 1);
      v41[2] = v42;
      _OWORD *v41 = v43;
      objc_msgSend_setBuffer_offset_atIndex_(v30, v44, (uint64_t)self->_homographyMatrixBuffer, 0, 0);
      uint64_t v46 = 216;
      if (v9) {
        uint64_t v46 = 224;
      }
      uint64_t v47 = *(uint64_t *)((char *)&self->super.isa + v46);
      if (a9) {
        objc_msgSend_setTexture_atIndex_(v30, v45, 0, 5);
      }
      else {
        objc_msgSend_setTexture_atIndex_(v30, v45, v47, 5);
      }
    }
    v62[0] = objc_msgSend_width(v18, v38, v39, v40);
    v62[1] = objc_msgSend_height(v18, v48, v49, v50);
    v62[2] = 1;
    int64x2_t v60 = vdupq_n_s64(0x10uLL);
    uint64_t v61 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v51, (uint64_t)v62, (uint64_t)&v60);
    objc_msgSend_endEncoding(v30, v52, v53, v54);
    objc_msgSend_commit(self->_metal, v55, v56, v57);

    int v58 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v58 = FigSignalErrorAt();
  }

  return v58;
}

- (int)warpAdditionalImage:(id)a3 warpedImage:(id)a4 homography:(id *)a5 hybridReg:(BOOL)a6 alwaysDense:(BOOL)a7
{
  id v8 = a3;
  id v12 = a4;
  if (v8 != v12)
  {
    uint64_t v13 = objc_msgSend_width(v8, v9, v10, v11);
    if (v13 == objc_msgSend_width(v12, v14, v15, v16))
    {
      uint64_t v20 = objc_msgSend_height(v8, v17, v18, v19);
      if (v20 == objc_msgSend_height(v12, v21, v22, v23))
      {
        uint64_t v36 = 0;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        uint64_t v27 = objc_msgSend_device(v8, v24, v25, v26);
        objc_msgSend_pixelFormat(v8, v28, v29, v30);
        MTLPixelFormatGetInfoForDevice();
      }
    }
  }
  FigDebugAssert3();
  int v32 = FigSignalErrorAt();

  return v32;
}

- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7
{
  return objc_msgSend_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a7, 0, 0, 0, 0);
}

- (int)runLowLightWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 refWeightsLuma:(id)a6 nonRefWeightsLuma:(id)a7 relativeBrightness:(float)a8 homography:(id *)a9 regDenseParams:(RegDenseParameters *)a10
{
  return objc_msgSend_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a9, a10, a10->var4 == 3, a6, a7);
}

- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4
{
  return objc_msgSend_prepareWithRegDenseParams_subAllocatorID_imageWidth_imageHeight_(self, a2, 0, 0, a3, a4);
}

- (int)prepareWithRegDenseParams:(RegDenseParameters *)a3 subAllocatorID:(unsigned int)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  if (a3) {
    int var4 = a3->var4;
  }
  else {
    int var4 = 0;
  }
  sfRegPyr = self->_sfRegPyr;
  uint64_t v12 = sfRegPyr->_pyrWidths[1];
  uint64_t v13 = sfRegPyr->_pyrHeights[1];
  id v14 = objc_msgSend_allocator(self->_metal, a2, (uint64_t)a3, *(uint64_t *)&a4);
  uint64_t v18 = objc_msgSend_newTextureDescriptor(v14, v15, v16, v17);

  if (!v18)
  {
    FigDebugAssert3();
    long long v43 = 0;
LABEL_16:
    int v134 = FigSignalErrorAt();
    goto LABEL_13;
  }
  uint64_t v22 = objc_msgSend_desc(v18, v19, v20, v21);
  objc_msgSend_setWidth_(v22, v23, v12, v24);

  uint64_t v28 = objc_msgSend_desc(v18, v25, v26, v27);
  objc_msgSend_setHeight_(v28, v29, v13, v30);

  long long v34 = objc_msgSend_desc(v18, v31, v32, v33);
  objc_msgSend_setUsage_(v34, v35, 7, v36);

  uint64_t v40 = objc_msgSend_allocator(self->_metal, v37, v38, v39);
  long long v43 = objc_msgSend_newTextureDescriptor_(v40, v41, v8, v42);

  if (!v43) {
    goto LABEL_15;
  }
  uint64_t v47 = objc_msgSend_desc(v43, v44, v45, v46);
  objc_msgSend_setWidth_(v47, v48, v12, v49);

  uint64_t v53 = objc_msgSend_desc(v43, v50, v51, v52);
  objc_msgSend_setHeight_(v53, v54, v13, v55);

  uint64_t v59 = objc_msgSend_desc(v43, v56, v57, v58);
  objc_msgSend_setUsage_(v59, v60, 7, v61);

  uint64_t v65 = objc_msgSend_desc(v43, v62, v63, v64);
  objc_msgSend_setPixelFormat_(v65, v66, 65, v67);

  objc_msgSend_setLabel_(v43, v68, 0, v69);
  uint64_t v73 = objc_msgSend_allocator(self->_metal, v70, v71, v72);
  v75 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v73, v74, (uint64_t)v43, v8);
  shiftMap = self->_shiftMap;
  self->_shiftMap = v75;

  if (!self->_shiftMap) {
    goto LABEL_15;
  }
  uint64_t v80 = objc_msgSend_desc(v18, v77, v78, v79);
  objc_msgSend_setPixelFormat_(v80, v81, 25, v82);

  objc_msgSend_setLabel_(v18, v83, 0, v84);
  v88 = objc_msgSend_allocator(self->_metal, v85, v86, v87);
  v91 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v88, v89, (uint64_t)v18, v90);
  confidenceMap = self->_confidenceMap;
  self->_confidenceMap = v91;

  if (!self->_confidenceMap) {
    goto LABEL_15;
  }
  if (!var4)
  {
    v115 = objc_msgSend_desc(v18, v93, v94, v95);
    objc_msgSend_setWidth_(v115, v116, v12, v117);

    v121 = objc_msgSend_desc(v18, v118, v119, v120);
    objc_msgSend_setHeight_(v121, v122, v13, v123);

    objc_msgSend_setLabel_(v18, v124, 0, v125);
    v129 = objc_msgSend_allocator(self->_metal, v126, v127, v128);
    v132 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v129, v130, (uint64_t)v18, v131);
    blendingWeight = self->_blendingWeight;
    self->_blendingWeight = v132;

    if (self->_blendingWeight) {
      goto LABEL_12;
    }
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  v96 = objc_msgSend_desc(v18, v93, v94, v95);
  objc_msgSend_setWidth_(v96, v97, a5 >> 3, v98);

  v102 = objc_msgSend_desc(v18, v99, v100, v101);
  objc_msgSend_setHeight_(v102, v103, a6 >> 3, v104);

  objc_msgSend_setLabel_(v18, v105, 0, v106);
  v110 = objc_msgSend_allocator(self->_metal, v107, v108, v109);
  v113 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v110, v111, (uint64_t)v18, v112);
  blendingWeightLowLight = self->_blendingWeightLowLight;
  self->_blendingWeightLowLight = v113;

  if (!self->_blendingWeightLowLight) {
    goto LABEL_15;
  }
LABEL_12:
  int v134 = 0;
LABEL_13:

  return v134;
}

- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11
{
  uint64_t v16 = (int *)a3;
  v238 = a4;
  uint64_t v17 = a5;
  id v18 = a10;
  id v22 = a11;
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v23 = objc_msgSend_commandQueue(self->_metal, v19, v20, v21);
    uint64_t v27 = objc_msgSend_commandBuffer(v23, v24, v25, v26);

    objc_msgSend_setLabel_(v27, v28, @"KTRACE_START_MTL", v29);
    objc_msgSend_addCompletedHandler_(v27, v30, (uint64_t)&unk_270E33FE8, v31);
    objc_msgSend_commit(v27, v32, v33, v34);
  }
  id v241 = 0;
  id v242 = 0;
  id v240 = 0;
  sfRegPyr = self->_sfRegPyr;
  uint64_t v36 = sfRegPyr->_pyrWidths[1];
  uint64_t v37 = sfRegPyr->_pyrHeights[1];
  uint64_t v38 = objc_msgSend_allocator(self->_metal, v19, v20, v21);
  uint64_t v42 = objc_msgSend_newTextureDescriptor(v38, v39, v40, v41);

  if (!v42) {
    goto LABEL_40;
  }
  uint64_t v46 = objc_msgSend_desc(v42, v43, v44, v45);
  objc_msgSend_setWidth_(v46, v47, v36, v48);

  uint64_t v52 = objc_msgSend_desc(v42, v49, v50, v51);
  objc_msgSend_setHeight_(v52, v53, v37, v54);

  uint64_t v58 = objc_msgSend_desc(v42, v55, v56, v57);
  objc_msgSend_setPixelFormat_(v58, v59, 25, v60);

  uint64_t v64 = objc_msgSend_desc(v42, v61, v62, v63);
  objc_msgSend_setUsage_(v64, v65, 7, v66);

  objc_msgSend_setLabel_(v42, v67, 0, v68);
  uint64_t v72 = objc_msgSend_allocator(self->_metal, v69, v70, v71);
  v75 = objc_msgSend_newTextureWithDescriptor_(v72, v73, (uint64_t)v42, v74);
  id v242 = v75;

  if (!v75
    || (objc_msgSend_setLabel_(v42, v76, 0, v77),
        objc_msgSend_allocator(self->_metal, v78, v79, v80),
        uint64_t v81 = objc_claimAutoreleasedReturnValue(),
        uint64_t v84 = objc_msgSend_newTextureWithDescriptor_(v81, v82, (uint64_t)v42, v83),
        id v241 = v84,
        v81,
        !v84))
  {
LABEL_40:
    FigDebugAssert3();
    int v98 = FigSignalErrorAt();
LABEL_17:
    v99 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_37;
  }
  uint64_t v235 = (uint64_t)v18;
  if (a8)
  {
    char v86 = 0;
    int var4 = a8->var4;
    if (!LOBYTE(a8[1].var2) && var4 == 2)
    {
      char v86 = 1;
      int var4 = 3;
      a9 = 1;
    }
  }
  else
  {
    int var4 = 0;
    char v86 = 0;
  }
  if (objc_msgSend_registerImagesWithReferenceImg_nonRefImage_refTexlvl1_nonRefTexlvl1_shiftMap_confidenceMap_(self->_sfRegPyr, v85, (uint64_t)v16, (uint64_t)v238, v75, v84, self->_shiftMap, self->_confidenceMap))
  {
    FigDebugAssert3();
    int v98 = FigSignalErrorAt();
LABEL_16:
    id v18 = (id)v235;
    goto LABEL_17;
  }
  v237 = v16;
  uint64_t v16 = &OBJC_IVAR___LumaChromaImage_lumaTex;
  switch(var4)
  {
    case 0:
      *(float *)&double v91 = a6;
      if (objc_msgSend_blendingWeightUsing_and_homography_relativeBrightness_(self, v88, (uint64_t)v75, (uint64_t)v84, a7, v91))goto LABEL_19; {
      goto LABEL_23;
      }
    case 1:
      *(float *)&double v91 = a8->var0;
      *(float *)&double v92 = a8->var1;
      *(float *)&double v94 = a8->var2;
      *(float *)&double v93 = a6;
      if (!objc_msgSend_blendingWeightLowLightUsing_and_shadowDenseBlendStrength_nonShadowDenseBlendStrength_relativeBrightness_lensShadingFactor_noiseModel_homography_(self, v88, v235, (uint64_t)v22, a8->var3, a7, v91, v92, v93, v94))goto LABEL_23; {
LABEL_19:
      }
      FigDebugAssert3();
      int v98 = FigSignalErrorAt();
      uint64_t v16 = v237;
      goto LABEL_16;
    case 2:
      unint64_t v100 = (unint64_t)objc_msgSend_width(*((void **)v237 + 2), v88, v89, v90) >> 3;
      uint64_t v104 = objc_msgSend_desc(v42, v101, v102, v103);
      objc_msgSend_setWidth_(v104, v105, v100, v106);

      unint64_t v110 = (unint64_t)objc_msgSend_height(*((void **)v237 + 2), v107, v108, v109) >> 3;
      v114 = objc_msgSend_desc(v42, v111, v112, v113);
      objc_msgSend_setHeight_(v114, v115, v110, v116);

      uint64_t v120 = objc_msgSend_desc(v42, v117, v118, v119);
      objc_msgSend_setPixelFormat_(v120, v121, 25, v122);

      objc_msgSend_setLabel_(v42, v123, 0, v124);
      uint64_t v128 = objc_msgSend_allocator(self->_metal, v125, v126, v127);
      uint64_t v131 = objc_msgSend_newTextureWithDescriptor_(v128, v129, (uint64_t)v42, v130);
      id v240 = v131;

      if (!v131) {
        goto LABEL_46;
      }
      id v18 = (id)v235;
      *(float *)&double v133 = a6;
      if (objc_msgSend_generateSparseBlendingMapUsing_nonReference_sparseBlendingMap_homography_relativeBrightness_(self, v132, v235, (uint64_t)v22, v131, a7, v133))
      {
        FigDebugAssert3();
        int v98 = FigSignalErrorAt();
        uint64_t v16 = v237;
        goto LABEL_17;
      }
      objc_msgSend_solverfilterWithGuide_target_confidence_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(a8->var6, v134, v235, (uint64_t)v131, 0, *(void *)(*((void *)a8->var7 + 16) + 8), *(void *)(*((void *)a8->var7 + 16) + 16), *(void *)(*((void *)a8->var7 + 16) + 24), *(double *)&a8->var8, self->_blendingWeightLowLight);
      FigMetalDecRef();
      char v86 = 1;
LABEL_23:
      FigMetalDecRef();
      FigMetalDecRef();
      if ((FigMetalIsValid() & 1) == 0)
      {
        v138 = objc_msgSend_allocator(self->_metal, v135, v136, v137);
        v141 = objc_msgSend_newTextureDescriptor_(v138, v139, 0, v140);

        if (!v141) {
          goto LABEL_42;
        }
        uint64_t v145 = objc_msgSend_width(*((void **)v237 + 3), v142, v143, v144);
        v149 = objc_msgSend_desc(v141, v146, v147, v148);
        objc_msgSend_setWidth_(v149, v150, v145, v151);

        uint64_t v155 = objc_msgSend_height(*((void **)v237 + 3), v152, v153, v154);
        v159 = objc_msgSend_desc(v141, v156, v157, v158);
        objc_msgSend_setHeight_(v159, v160, v155, v161);

        v165 = objc_msgSend_desc(v141, v162, v163, v164);
        objc_msgSend_setPixelFormat_(v165, v166, 65, v167);

        objc_msgSend_setLabel_(v141, v168, 0, v169);
        v173 = objc_msgSend_allocator(self->_metal, v170, v171, v172);
        uint64_t v175 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v173, v174, (uint64_t)v141, 0);
        v176 = (void *)v17[3];
        v17[3] = v175;

        if (!v17[3])
        {
LABEL_42:
          FigDebugAssert3();
          int v98 = FigSignalErrorAt();

LABEL_47:
          uint64_t v16 = v237;
          id v18 = (id)v235;
          goto LABEL_17;
        }
      }
      if ((FigMetalIsValid() & 1) == 0)
      {
        uint64_t v180 = objc_msgSend_width(*((void **)v237 + 2), v177, v178, v179);
        v184 = objc_msgSend_desc(v42, v181, v182, v183);
        objc_msgSend_setWidth_(v184, v185, v180, v186);

        uint64_t v190 = objc_msgSend_height(*((void **)v237 + 2), v187, v188, v189);
        v194 = objc_msgSend_desc(v42, v191, v192, v193);
        objc_msgSend_setHeight_(v194, v195, v190, v196);

        v200 = objc_msgSend_desc(v42, v197, v198, v199);
        objc_msgSend_setPixelFormat_(v200, v201, 25, v202);

        objc_msgSend_setLabel_(v42, v203, 0, v204);
        v208 = objc_msgSend_allocator(self->_metal, v205, v206, v207);
        uint64_t v211 = objc_msgSend_newTextureWithDescriptor_(v208, v209, (uint64_t)v42, v210);
        v212 = (void *)v17[2];
        v17[2] = v211;

        if (!v17[2])
        {
LABEL_46:
          FigDebugAssert3();
          int v98 = FigSignalErrorAt();
          goto LABEL_47;
        }
      }
      uint64_t v213 = v238[2];
      uint64_t v214 = v238[3];
      uint64_t v215 = v17[2];
      uint64_t v216 = v17[3];
      if (var4 == 2)
      {
        int v217 = objc_msgSend_warpFrameWithInputYAndConfidence_inputUV_outputY_outputUV_homography_(self, v177, v213, v214, v215, v216, a7);
        uint64_t v16 = v237;
        v99 = (_DWORD *)MEMORY[0x263F00E10];
        if (v217)
        {
          int v98 = v217;
LABEL_45:
          FigDebugAssert3();
          id v18 = (id)v235;
          goto LABEL_37;
        }
      }
      else
      {
        LOBYTE(v233) = a9;
        int v218 = objc_msgSend_warpFrameWithInputY_inputUV_outputY_outputUV_homography_hybridReg_alwaysDense_(self, v177, v213, v214, v215, v216, a7, var4 != 0, v233);
        uint64_t v16 = v237;
        v99 = (_DWORD *)MEMORY[0x263F00E10];
        if (v218)
        {
          int v98 = v218;
          goto LABEL_45;
        }
      }
      if (v86) {
        confidenceMap = 0;
      }
      else {
        confidenceMap = self->_confidenceMap;
      }
      id v18 = (id)v235;
      objc_storeStrong((id *)self->_pyrConfidence->textureY, confidenceMap);
      int v98 = 0;
LABEL_37:
      if (*v99)
      {
        v220 = objc_msgSend_commandQueue(self->_metal, v95, v96, v97);
        v224 = objc_msgSend_commandBuffer(v220, v221, v222, v223);

        objc_msgSend_setLabel_(v224, v225, @"KTRACE_END_MTL", v226);
        v239[0] = MEMORY[0x263EF8330];
        v239[1] = 3221225472;
        v239[2] = sub_262F8E550;
        v239[3] = &unk_2655C32E8;
        memset(&v239[4], 0, 24);
        objc_msgSend_addCompletedHandler_(v224, v227, (uint64_t)v239, v228);
        objc_msgSend_commit(v224, v229, v230, v231);
      }
      return v98;
    case 3:
      goto LABEL_23;
    default:
      FigSignalErrorAt();
      int v98 = 0;
      goto LABEL_16;
  }
}

- (void)reset
{
  objc_msgSend_resetIncludingConfidence_(self, a2, 1, v2);
}

- (void)resetIncludingConfidence:(BOOL)a3
{
  if (a3 && self->_confidenceMap) {
    FigMetalDecRef();
  }
  if (self->_shiftMap) {
    FigMetalDecRef();
  }
  if (self->_blendingWeight) {
    FigMetalDecRef();
  }
  if (self->_blendingWeightLowLight)
  {
    FigMetalDecRef();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpingSampler, 0);
  objc_storeStrong((id *)&self->_homographyMatrixBuffer, 0);
  objc_storeStrong((id *)&self->_blendingWeightLowLight, 0);
  objc_storeStrong((id *)&self->_blendingWeight, 0);
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_shiftMap, 0);
  objc_storeStrong((id *)&self->_sfRegPyr, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_pyrConfidence, 0);
}

@end