@interface ColorConvertStage
+ (int)prewarmShaders:(id)a3;
- (ColorConvertStage)initWithMetalContext:(id)a3;
- (int)_convertColor:(const ColorSpaceConversionParameters *)a3 lumaPedestal:(float)a4 inputLuma:(id)a5 inputChroma:(id)a6 outputLuma:(id)a7 outputChroma:(id)a8;
- (int)convertColor:(const ColorSpaceConversionParameters *)a3 inputLuma:(id)a4 inputChroma:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7;
- (int)convertColor:(const ColorSpaceConversionParameters *)a3 inputYCbCr:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6;
- (uint64_t)extractLinearBufferWithLumaInput:(__n128)a3 chromaInput:(__n128)a4 inputIsLinear:(__n128)a5 removeChromaBias:(uint64_t)a6 lumaPedestal:(void *)a7 exposureParams:(void *)a8 ccm:(char)a9 output:(int)a10;
@end

@implementation ColorConvertStage

- (ColorConvertStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ColorConvertStage;
  v6 = [(ColorConvertStage *)&v19 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(ColorConvertStageShared, v8, v9, v10);
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
  v4 = [ColorConvertStageShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)convertColor:(const ColorSpaceConversionParameters *)a3 inputLuma:(id)a4 inputChroma:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7
{
  return objc_msgSend__convertColor_lumaPedestal_inputLuma_inputChroma_outputLuma_outputChroma_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, 0.0);
}

- (int)_convertColor:(const ColorSpaceConversionParameters *)a3 lumaPedestal:(float)a4 inputLuma:(id)a5 inputChroma:(id)a6 outputLuma:(id)a7 outputChroma:(id)a8
{
  float v57 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v20 = v16;
  if (a3
    && v13
    && v14
    && v15
    && v16
    && self->_shaders
    && (objc_msgSend_commandQueue(self->_metal, v17, v18, v19),
        v21 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v21, v22, v23, v24),
        v25 = objc_claimAutoreleasedReturnValue(),
        v21,
        v25))
  {
    v29 = objc_msgSend_computeCommandEncoder(v25, v26, v27, v28);
    if (v29)
    {
      v31 = v29;
      objc_msgSend_setBytes_length_atIndex_(v29, v30, (uint64_t)a3, 208, 0);
      objc_msgSend_setBytes_length_atIndex_(v31, v32, (uint64_t)&v57, 4, 1);
      objc_msgSend_setTexture_atIndex_(v31, v33, (uint64_t)v13, 0);
      objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v14, 1);
      objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v15, 2);
      objc_msgSend_setTexture_atIndex_(v31, v36, (uint64_t)v20, 3);
      objc_msgSend_setComputePipelineState_(v31, v37, (uint64_t)self->_shaders->_convertColor, v38);
      v56[0] = objc_msgSend_width(v14, v39, v40, v41);
      v56[1] = objc_msgSend_height(v14, v42, v43, v44);
      v56[2] = 1;
      long long v54 = xmmword_263117D20;
      uint64_t v55 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v31, v45, (uint64_t)v56, (uint64_t)&v54);
      objc_msgSend_endEncoding(v31, v46, v47, v48);
      objc_msgSend_commit(v25, v49, v50, v51);

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

- (int)convertColor:(const ColorSpaceConversionParameters *)a3 inputYCbCr:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v16 = v12;
  if (a3
    && v10
    && v11
    && v12
    && self->_shaders
    && (objc_msgSend_commandQueue(self->_metal, v13, v14, v15),
        v17 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v17, v18, v19, v20),
        v21 = objc_claimAutoreleasedReturnValue(),
        v17,
        v21))
  {
    v25 = objc_msgSend_computeCommandEncoder(v21, v22, v23, v24);
    if (v25)
    {
      uint64_t v27 = v25;
      objc_msgSend_setBytes_length_atIndex_(v25, v26, (uint64_t)a3, 208, 0);
      objc_msgSend_setTexture_atIndex_(v27, v28, (uint64_t)v10, 0);
      objc_msgSend_setTexture_atIndex_(v27, v29, (uint64_t)v11, 1);
      objc_msgSend_setTexture_atIndex_(v27, v30, (uint64_t)v16, 2);
      objc_msgSend_setComputePipelineState_(v27, v31, (uint64_t)self->_shaders->_convertColorYCbCr, v32);
      v50[0] = (unint64_t)objc_msgSend_width(v10, v33, v34, v35) >> 1;
      v50[1] = (unint64_t)objc_msgSend_height(v10, v36, v37, v38) >> 1;
      v50[2] = 1;
      long long v48 = xmmword_263117D20;
      uint64_t v49 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v39, (uint64_t)v50, (uint64_t)&v48);
      objc_msgSend_endEncoding(v27, v40, v41, v42);
      objc_msgSend_commit(v21, v43, v44, v45);

      int v46 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v46 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
  }

  return v46;
}

- (uint64_t)extractLinearBufferWithLumaInput:(__n128)a3 chromaInput:(__n128)a4 inputIsLinear:(__n128)a5 removeChromaBias:(uint64_t)a6 lumaPedestal:(void *)a7 exposureParams:(void *)a8 ccm:(char)a9 output:(int)a10
{
  *(__n128 *)&v37[16] = a4;
  *(__n128 *)&v37[32] = a5;
  *(__n128 *)uint64_t v37 = a3;
  id v18 = a7;
  id v19 = a8;
  v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(a1[1], v20, a12, 25, 7, 0, 16);
  if (v22
    && (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(a1[1], v21, a12, 65, 7, 1, 8), (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = 0;
    *((void *)&v48 + 1) = 0x3F80000000000000;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    simd_float4 v42 = 0u;
    simd_float4 v43 = 0u;
    simd_float4 v40 = 0u;
    simd_float4 v41 = 0u;
    simd_float4 v38 = 0u;
    simd_float4 v39 = 0u;
    LODWORD(v47) = 1065353216;
    DWORD2(v47) = 1065353216;
    __asm { FMOV            V1.2S, #1.0 }
    *(void *)&long long v48 = _D1;
    DWORD1(v49) = 1065353216;
    long long v51 = xmmword_263017850;
    long long v52 = xmmword_263017860;
    simd_float4 v54 = 0u;
    simd_float4 v55 = 0u;
    simd_float4 v56 = 0u;
    long long v53 = xmmword_263017870;
    do
    {
      *(float32x4_t *)((char *)&v54 + v25) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263017880, COERCE_FLOAT(*(long long *)((char *)&v51 + v25))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v51 + v25), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v51 + v25), 2);
      v25 += 16;
    }
    while (v25 != 48);
    v57.columns[0] = v54;
    v57.columns[1] = v55;
    v57.columns[2] = v56;
    simd_float4 v41 = v54;
    simd_float4 v42 = v55;
    simd_float4 v43 = v56;
    v57.columns[3] = (simd_float4)xmmword_2630178B0;
    simd_float4x4 v58 = __invert_f4(v57);
    simd_float4 v38 = v58.columns[0];
    simd_float4 v39 = v58.columns[1];
    simd_float4 v40 = v58.columns[2];
    *((void *)&v49 + 1) = 0x3F8000007F800000;
    LOBYTE(v50) = 0;
    BYTE3(v50) = 0;
    if ((a9 & 1) == 0)
    {
      long long v47 = xmmword_263017830;
      long long v48 = xmmword_263117D30;
      *(void *)&long long v49 = 0x4000000000000000;
    }
    *(_WORD *)((char *)&v50 + 1) = 256;
    simd_float3x3 v33 = __invert_f3(*(simd_float3x3 *)v37);
    uint64_t v32 = 0;
    *((void *)&v44 + 1) = v33.columns[0].u32[2];
    *((void *)&v45 + 1) = v33.columns[1].u32[2];
    *(void *)&long long v44 = v33.columns[0].i64[0];
    *(void *)&long long v45 = v33.columns[1].i64[0];
    DWORD2(v46) = v33.columns[2].i32[2];
    *(void *)&long long v46 = v33.columns[2].i64[0];
    v33.columns[0].i32[0] = 0;
    if (a10) {
      float v34 = -0.5;
    }
    else {
      float v34 = 0.0;
    }
    v33.columns[1].i32[0] = 0;
    v33.columns[1].i32[1] = 1.0;
    v33.columns[1].i32[2] = 0;
    *(float *)&v33.columns[1].i32[3] = v34;
    v33.columns[0].i32[1] = 0;
    v33.columns[0].i64[1] = __PAIR64__(LODWORD(v34), 1.0);
    HIDWORD(v46) = 0;
    long long v51 = xmmword_263017850;
    long long v52 = xmmword_263017860;
    long long v53 = xmmword_263017870;
    simd_float4 v54 = 0u;
    simd_float4 v55 = 0u;
    simd_float4 v56 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v54 + v32) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263117D40, COERCE_FLOAT(*(long long *)((char *)&v51 + v32))), (float32x4_t)v33.columns[1], *(float32x2_t *)((char *)&v51 + v32), 1), (float32x4_t)v33.columns[0], *(float32x4_t *)((char *)&v51 + v32), 2);
      v32 += 16;
    }
    while (v32 != 48);
    simd_float4 v41 = v54;
    simd_float4 v42 = v55;
    simd_float4 v43 = v56;
    uint64_t v35 = objc_msgSend__convertColor_lumaPedestal_inputLuma_inputChroma_outputLuma_outputChroma_(a1, v31, (uint64_t)&v38, (uint64_t)v18, v19, v22, v24, COERCE_DOUBLE(__PAIR64__(v54.u32[1], LODWORD(a2))));
  }
  else
  {
    FigDebugAssert3();
    uint64_t v35 = FigSignalErrorAt();
  }

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end