@interface ColorConvertStage
+ (int)prewarmShaders:(id)a3;
- (ColorConvertStage)initWithMetalContext:(id)a3;
- (int)_convertColor:(const ColorSpaceConversionParameters *)a3 lumaPedestal:(float)a4 hazeCorrection:(id)a5 inputLuma:(id)a6 inputChroma:(id)a7 outputLuma:(id)a8 outputChroma:;
- (int)convertColor:(const ColorSpaceConversionParameters *)a3 hazeCorrection:(id)a4 inputLuma:(id)a5 inputChroma:(id)a6 outputLuma:(id)a7 outputChroma:;
- (int)convertColor:(const ColorSpaceConversionParameters *)a3 hazeCorrection:(id)a4 inputYCbCr:(id)a5 outputLuma:(id)a6 outputChroma:;
- (uint64_t)extractAndDownsampleLinearWithLumaInput:(CGFloat)a3 chromaInput:(CGFloat)a4 denormalizedZoomRect:(CGFloat)a5 inputIsLinear:(__n128)a6 removeChromaBias:(__n128)a7 hazeCorrection:(__n128)a8 colorCorrectionMatrix:(__n128)a9 output:(uint64_t)a10;
- (uint64_t)extractLinearBufferWithLumaInput:(double)a3 chromaInput:(__n128)a4 lumaAlignmentFactor:(__n128)a5 chromaAlignmentFactor:(__n128)a6 inputIsLinear:(uint64_t)a7 removeChromaBias:(void *)a8 lumaPedestal:(void *)a9 hazeCorrection:(uint64_t)a10 exposureParams:(uint64_t)a11 ccm:(char)a12 output:(int)a13;
@end

@implementation ColorConvertStage

- (ColorConvertStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ColorConvertStage;
  v6 = [(ColorConvertStage *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[ColorConvertStageShared sharedInstance];
    uint64_t v9 = [v8 getShaders:v7->_metal];
    shaders = v7->_shaders;
    v7->_shaders = (ColorConvertStageShaders *)v9;

    v11 = v7;
    if (!v7->_shaders)
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v11 = 0;
      }
      else {
        v11 = v7;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[ColorConvertStageShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)convertColor:(const ColorSpaceConversionParameters *)a3 hazeCorrection:(id)a4 inputLuma:(id)a5 inputChroma:(id)a6 outputLuma:(id)a7 outputChroma:
{
  return [(ColorConvertStage *)self _convertColor:a3 lumaPedestal:a4 hazeCorrection:a5 inputLuma:a6 inputChroma:a7 outputLuma:0.0 outputChroma:v7];
}

- (int)_convertColor:(const ColorSpaceConversionParameters *)a3 lumaPedestal:(float)a4 hazeCorrection:(id)a5 inputLuma:(id)a6 inputChroma:(id)a7 outputLuma:(id)a8 outputChroma:
{
  float v29 = a4;
  long long v28 = v8;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (a3
    && v14
    && v15
    && v16
    && v17
    && self->_shaders
    && ([(FigMetalContext *)self->_metal commandQueue],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 commandBuffer],
        v20 = objc_claimAutoreleasedReturnValue(),
        v19,
        v20))
  {
    v21 = [v20 computeCommandEncoder];
    if (v21)
    {
      v22 = v21;
      [v21 setBytes:a3 length:208 atIndex:0];
      [v22 setBytes:&v29 length:4 atIndex:1];
      [v22 setBytes:&v28 length:16 atIndex:2];
      [v22 setTexture:v14 atIndex:0];
      [v22 setTexture:v15 atIndex:1];
      [v22 setTexture:v16 atIndex:2];
      [v22 setTexture:v18 atIndex:3];
      [v22 setComputePipelineState:self->_shaders->_convertColor];
      [v22 setImageblockWidth:32 height:32];
      v27[0] = [v15 width];
      v27[1] = [v15 height];
      v27[2] = 1;
      int64x2_t v25 = vdupq_n_s64(0x10uLL);
      uint64_t v26 = 1;
      [v22 dispatchThreads:v27 threadsPerThreadgroup:&v25];
      [v22 endEncoding];
      [v20 commit];

      int v23 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (int)convertColor:(const ColorSpaceConversionParameters *)a3 hazeCorrection:(id)a4 inputYCbCr:(id)a5 outputLuma:(id)a6 outputChroma:
{
  long long v24 = v6;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (a3
    && v11
    && v12
    && v13
    && self->_shaders
    && ([(FigMetalContext *)self->_metal commandQueue],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 commandBuffer],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v15,
        v16))
  {
    id v17 = [v16 computeCommandEncoder];
    if (v17)
    {
      v18 = v17;
      [v17 setBytes:a3 length:208 atIndex:0];
      [v18 setBytes:&v24 length:16 atIndex:1];
      [v18 setTexture:v11 atIndex:0];
      [v18 setTexture:v12 atIndex:1];
      [v18 setTexture:v14 atIndex:2];
      [v18 setComputePipelineState:self->_shaders->_convertColorYCbCr];
      [v18 setImageblockWidth:32 height:32];
      v23[0] = (unint64_t)[v11 width] >> 1;
      v23[1] = (unint64_t)[v11 height] >> 1;
      v23[2] = 1;
      int64x2_t v21 = vdupq_n_s64(0x10uLL);
      uint64_t v22 = 1;
      [v18 dispatchThreads:v23 threadsPerThreadgroup:&v21];
      [v18 endEncoding];
      [v16 commit];

      int v19 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (uint64_t)extractLinearBufferWithLumaInput:(double)a3 chromaInput:(__n128)a4 lumaAlignmentFactor:(__n128)a5 chromaAlignmentFactor:(__n128)a6 inputIsLinear:(uint64_t)a7 removeChromaBias:(void *)a8 lumaPedestal:(void *)a9 hazeCorrection:(uint64_t)a10 exposureParams:(uint64_t)a11 ccm:(char)a12 output:(int)a13
{
  *(__n128 *)&v38[16] = a5;
  *(__n128 *)&v38[32] = a6;
  *(__n128 *)v38 = a4;
  id v22 = a8;
  id v23 = a9;
  long long v24 = [a1[1] bindPixelBufferToMTL2DTexture:a15 pixelFormat:25 usage:7 plane:0 alignmentFactor:a10];
  if (v24
    && ([a1[1] bindPixelBufferToMTL2DTexture:a15 pixelFormat:65 usage:7 plane:1 alignmentFactor:a11], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = 0;
    *((void *)&v50 + 1) = 0x3F80000000000000;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    simd_float4 v44 = 0u;
    simd_float4 v45 = 0u;
    simd_float4 v42 = 0u;
    simd_float4 v43 = 0u;
    simd_float4 v40 = 0u;
    simd_float4 v41 = 0u;
    LODWORD(v49) = 1065353216;
    DWORD2(v49) = 1065353216;
    __asm { FMOV            V1.2S, #1.0 }
    *(void *)&long long v50 = _D1;
    DWORD1(v51) = 1065353216;
    long long v53 = xmmword_263380000;
    long long v54 = xmmword_263380010;
    simd_float4 v56 = 0u;
    simd_float4 v57 = 0u;
    simd_float4 v58 = 0u;
    long long v55 = xmmword_263380020;
    do
    {
      *(float32x4_t *)((char *)&v56 + v27) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v53 + v27))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v53 + v27), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v53 + v27), 2);
      v27 += 16;
    }
    while (v27 != 48);
    v59.columns[0] = v56;
    v59.columns[1] = v57;
    v59.columns[2] = v58;
    simd_float4 v43 = v56;
    simd_float4 v44 = v57;
    simd_float4 v45 = v58;
    v59.columns[3] = (simd_float4)xmmword_263380060;
    simd_float4x4 v60 = __invert_f4(v59);
    simd_float4 v40 = v60.columns[0];
    simd_float4 v41 = v60.columns[1];
    simd_float4 v42 = v60.columns[2];
    *((void *)&v51 + 1) = 0x3F8000007F800000;
    BYTE4(v52) = 0;
    BYTE7(v52) = 0;
    LODWORD(v52) = 1056964608;
    if ((a12 & 1) == 0)
    {
      long long v49 = xmmword_26337FFE0;
      long long v50 = xmmword_2633802D0;
      *(void *)&long long v51 = 0x4000000000000000;
    }
    *(_WORD *)((char *)&v52 + 5) = 256;
    simd_float3x3 v34 = __invert_f3(*(simd_float3x3 *)v38);
    uint64_t v33 = 0;
    *((void *)&v46 + 1) = v34.columns[0].u32[2];
    *((void *)&v47 + 1) = v34.columns[1].u32[2];
    *(void *)&long long v46 = v34.columns[0].i64[0];
    *(void *)&long long v47 = v34.columns[1].i64[0];
    DWORD2(v48) = v34.columns[2].i32[2];
    *(void *)&long long v48 = v34.columns[2].i64[0];
    v34.columns[0].i32[0] = 0;
    if (a13) {
      float v35 = -0.5;
    }
    else {
      float v35 = 0.0;
    }
    v34.columns[1].i32[0] = 0;
    v34.columns[1].i32[1] = 1.0;
    v34.columns[1].i32[2] = 0;
    *(float *)&v34.columns[1].i32[3] = v35;
    v34.columns[0].i32[1] = 0;
    v34.columns[0].i64[1] = __PAIR64__(LODWORD(v35), 1.0);
    HIDWORD(v48) = 0;
    long long v53 = xmmword_263380000;
    long long v54 = xmmword_263380010;
    long long v55 = xmmword_263380020;
    simd_float4 v56 = 0u;
    simd_float4 v57 = 0u;
    simd_float4 v58 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v56 + v33) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2633802E0, COERCE_FLOAT(*(long long *)((char *)&v53 + v33))), (float32x4_t)v34.columns[1], *(float32x2_t *)((char *)&v53 + v33), 1), (float32x4_t)v34.columns[0], *(float32x4_t *)((char *)&v53 + v33), 2);
      v33 += 16;
    }
    while (v33 != 48);
    simd_float4 v43 = v56;
    simd_float4 v44 = v57;
    simd_float4 v45 = v58;
    uint64_t v36 = objc_msgSend(a1, "_convertColor:lumaPedestal:hazeCorrection:inputLuma:inputChroma:outputLuma:outputChroma:", &v40, v22, v23, v24, v26, COERCE_DOUBLE(__PAIR64__(v56.u32[1], LODWORD(a2))), a3);
  }
  else
  {
    FigDebugAssert3();
    uint64_t v36 = FigSignalErrorAt();
  }

  return v36;
}

- (uint64_t)extractAndDownsampleLinearWithLumaInput:(CGFloat)a3 chromaInput:(CGFloat)a4 denormalizedZoomRect:(CGFloat)a5 inputIsLinear:(__n128)a6 removeChromaBias:(__n128)a7 hazeCorrection:(__n128)a8 colorCorrectionMatrix:(__n128)a9 output:(uint64_t)a10
{
  *(__n128 *)&v77[16] = a8;
  *(__n128 *)&v77[32] = a9;
  *(__n128 *)v77 = a7;
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v24 = a11;
  id v25 = a12;
  uint64_t v26 = v25;
  __n128 v100 = a6;
  id v98 = 0;
  id v99 = 0;
  if (!a15)
  {
    id v71 = v25;
    int v97 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    goto LABEL_37;
  }
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a15, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a15, 0);
  if (WidthOfPlane != [v24 width] || HeightOfPlane != objc_msgSend(v24, "height"))
  {
    if (*(void *)(a1 + 16))
    {
      uint64_t v30 = [*(id *)(a1 + 8) bindPixelBufferToMTL2DTexture:a15 pixelFormat:25 usage:7 plane:0 alignmentFactor:1];
      if (v30)
      {
        v31 = (void *)v30;
        uint64_t v32 = [*(id *)(a1 + 8) bindPixelBufferToMTL2DTexture:a15 pixelFormat:65 usage:7 plane:1 alignmentFactor:1];
        if (!v32)
        {
          int v97 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v74 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
          uint64_t v29 = 4294893869;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_25;
        }
        uint64_t v33 = (void *)v32;
        uint64_t v34 = 0;
        *((void *)&v93 + 1) = 0x3F80000000000000;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        simd_float4 v85 = 0u;
        long long v86 = 0u;
        simd_float4 v83 = 0u;
        simd_float4 v84 = 0u;
        LODWORD(v92) = 1065353216;
        DWORD2(v92) = 1065353216;
        __asm { FMOV            V1.2S, #1.0 }
        *(void *)&long long v93 = _D1;
        DWORD1(v94) = 1065353216;
        CGAffineTransform v106 = *(CGAffineTransform *)byte_263380000;
        memset(v101, 0, 48);
        do
        {
          *(float32x4_t *)&v101[v34] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(_OWORD *)((char *)&v106.a + v34))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v106.a + v34), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v106.a + v34), 2);
          v34 += 16;
        }
        while (v34 != 48);
        v109.columns[0] = *(simd_float4 *)v101;
        v109.columns[1] = *(simd_float4 *)&v101[16];
        v109.columns[2] = *(simd_float4 *)&v101[32];
        long long v86 = *(_OWORD *)v101;
        long long v87 = *(_OWORD *)&v101[16];
        long long v88 = *(_OWORD *)&v101[32];
        v109.columns[3] = (simd_float4)xmmword_263380060;
        simd_float4x4 v110 = __invert_f4(v109);
        simd_float4 v83 = v110.columns[0];
        simd_float4 v84 = v110.columns[1];
        simd_float4 v85 = v110.columns[2];
        *((void *)&v94 + 1) = 0x3F8000007F800000;
        BYTE4(v95) = 0;
        BYTE7(v95) = 0;
        LODWORD(v95) = 1056964608;
        if ((a13 & 1) == 0)
        {
          long long v92 = xmmword_26337FFE0;
          long long v93 = xmmword_2633802D0;
          *(void *)&long long v94 = 0x4000000000000000;
        }
        uint64_t v40 = 0;
        long long v89 = *(_OWORD *)v77;
        long long v90 = *(_OWORD *)&v77[16];
        v41.i32[0] = 0;
        if (a14) {
          float v42 = -0.5;
        }
        else {
          float v42 = 0.0;
        }
        v43.i32[0] = 0;
        v43.i32[1] = 1.0;
        v41.i32[1] = 0;
        v41.i64[1] = __PAIR64__(LODWORD(v42), 1.0);
        *(_WORD *)((char *)&v95 + 5) = 256;
        v43.i32[2] = 0;
        v43.f32[3] = v42;
        long long v91 = *(_OWORD *)&v77[32];
        CGAffineTransform v106 = *(CGAffineTransform *)byte_263380000;
        memset(v101, 0, 48);
        do
        {
          *(float32x4_t *)&v101[v40] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2633802E0, COERCE_FLOAT(*(_OWORD *)((char *)&v106.a + v40))), v43, *(float32x2_t *)((char *)&v106.a + v40), 1), v41, *(float32x4_t *)((char *)&v106.a + v40), 2);
          v40 += 16;
        }
        while (v40 != 48);
        long long v86 = *(_OWORD *)v101;
        long long v87 = *(_OWORD *)&v101[16];
        long long v88 = *(_OWORD *)&v101[32];
        simd_float4 v44 = [*(id *)(a1 + 8) allocator];
        simd_float4 v45 = (void *)[v44 newTextureDescriptor];

        if (!v45) {
          goto LABEL_31;
        }
        unint64_t v46 = (unint64_t)[v24 width] >> 1;
        long long v47 = [v45 desc];
        [v47 setWidth:v46];

        unint64_t v48 = (unint64_t)[v24 height] >> 1;
        long long v49 = [v45 desc];
        [v49 setHeight:v48];

        long long v50 = [v45 desc];
        [v50 setPixelFormat:25];

        long long v51 = [v45 desc];
        [v51 setUsage:7];

        [v45 setLabel:0];
        long long v52 = [*(id *)(a1 + 8) allocator];
        long long v53 = (void *)[v52 newTextureWithDescriptor:v45];
        id v99 = v53;

        if (v53)
        {
          v79 = v31;
          unint64_t v54 = (unint64_t)[v26 width] >> 1;
          long long v55 = [v45 desc];
          [v55 setWidth:v54];

          unint64_t v56 = (unint64_t)[v26 height] >> 1;
          simd_float4 v57 = [v45 desc];
          [v57 setHeight:v56];

          simd_float4 v58 = [v45 desc];
          [v58 setPixelFormat:65];

          simd_float4x4 v59 = [v45 desc];
          [v59 setUsage:7];

          [v45 setLabel:0];
          simd_float4x4 v60 = [*(id *)(a1 + 8) allocator];
          v61 = (void *)[v60 newTextureWithDescriptor:v45];
          id v98 = v61;

          if (v61)
          {

            v62 = [*(id *)(a1 + 8) commandQueue];
            v63 = [v62 commandBuffer];

            if (v63)
            {
              v64 = [v63 computeCommandEncoder];
              if (v64)
              {
                v65 = v64;
                [v64 setBytes:&v83 length:208 atIndex:0];
                [v65 setBytes:&v100 length:16 atIndex:1];
                [v65 setTexture:v24 atIndex:0];
                [v65 setTexture:v26 atIndex:1];
                [v65 setImageblockWidth:32 height:32];
                [v65 setTexture:v53 atIndex:2];
                [v65 setTexture:v61 atIndex:3];
                [v65 setComputePipelineState:*(void *)(*(void *)(a1 + 16) + 24)];
                v82[0] = [v61 width];
                v82[1] = [v61 height];
                v82[2] = 1;
                int64x2_t v80 = vdupq_n_s64(0x10uLL);
                uint64_t v81 = 1;
                [v65 dispatchThreads:v82 threadsPerThreadgroup:&v80];
                [v65 setComputePipelineState:*(void *)(*(void *)(a1 + 16) + 32)];
                memset(v101, 0, 48);
                CGAffineTransformMakeScale((CGAffineTransform *)v101, 0.5, 0.5);
                v111.origin.CGFloat x = a2;
                v111.origin.CGFloat y = a3;
                v111.size.CGFloat width = a4;
                v111.size.CGFloat height = a5;
                if (CGRectIsNull(v111))
                {
                  a4 = (double)(unint64_t)[v24 width];
                  a5 = (double)(unint64_t)[v24 height];
                  a2 = 0.0;
                  a3 = 0.0;
                }
                CGAffineTransform v106 = *(CGAffineTransform *)v101;
                v112.origin.CGFloat x = a2;
                v112.origin.CGFloat y = a3;
                v112.size.CGFloat width = a4;
                v112.size.CGFloat height = a5;
                CGRect v113 = CGRectApplyAffineTransform(v112, &v106);
                CGFloat x = v113.origin.x;
                CGFloat y = v113.origin.y;
                CGFloat width = v113.size.width;
                CGFloat height = v113.size.height;
                CGAffineTransform v106 = *(CGAffineTransform *)v101;
                v113.origin.CGFloat x = a2;
                v113.origin.CGFloat y = a3;
                v113.size.CGFloat width = a4;
                v113.size.CGFloat height = a5;
                CGRect v114 = CGRectApplyAffineTransform(v113, &v106);
                encodeDownsample(v65, v53, v79, v114.origin.x, v114.origin.y, v114.size.width, v114.size.height);
                CGAffineTransform v106 = *(CGAffineTransform *)v101;
                v115.origin.CGFloat x = x;
                v115.origin.CGFloat y = y;
                v115.size.CGFloat width = width;
                v115.size.CGFloat height = height;
                CGRect v116 = CGRectApplyAffineTransform(v115, &v106);
                encodeDownsample(v65, v61, v33, v116.origin.x, v116.origin.y, v116.size.width, v116.size.height);
                [v65 endEncoding];
                [v63 commit];

                uint64_t v29 = 0;
                goto LABEL_25;
              }
              FigDebugAssert3();
              uint64_t v29 = FigSignalErrorAt();
            }
            else
            {
              FigDebugAssert3();
              uint64_t v29 = FigSignalErrorAt();
            }

LABEL_25:
            FigMetalDecRef();
            FigMetalDecRef();
            goto LABEL_26;
          }
          v75 = v26;
          int v97 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v76 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
          v31 = v79;
        }
        else
        {
LABEL_31:
          v75 = v26;
          int v97 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v76 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        uint64_t v29 = 4294893869;
        uint64_t v26 = v75;
        goto LABEL_25;
      }
      int v97 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v73 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT);
      uint64_t v29 = 4294893869;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_25;
    }
    id v71 = v26;
    int v97 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
LABEL_37:
    uint64_t v29 = 4294893869;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v26 = v71;
    goto LABEL_25;
  }
  memset(v105, 0, sizeof(v105));
  long long v104 = 0u;
  long long v103 = 0u;
  long long v102 = 0u;
  memset(&v101[4], 0, 48);
  *(_DWORD *)v101 = 1065353216;
  *(_DWORD *)&v101[32] = 1065353216;
  simd_float3x3 v108 = __invert_f3(*(simd_float3x3 *)v77);
  uint64_t v29 = objc_msgSend((id)a1, "extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:", v24, v26, 1, 1, a13, a14, 0.0, a6.n128_f64[0], *(double *)v108.columns[0].i64, *(double *)v108.columns[1].i64, *(double *)v108.columns[2].i64, v101, a15);
LABEL_26:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end