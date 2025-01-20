@interface DisparityConfig
- (DisparityConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (int)determineDemosaicParameters:(id *)a3 inputFrame:(id)a4 bounds:(id)a5;
@end

@implementation DisparityConfig

- (DisparityConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)DisparityConfig;
  self = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", ([v10 maximumHeight] << 31) & 0x7FFFFFFF00000000 | (objc_msgSend(v10, "maximumWidth") >> 1));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (int)determineDemosaicParameters:(id *)a3 inputFrame:(id)a4 bounds:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!a3
    || !v7
    || (-[SoftISPInputFrame metadata]((uint64_t)v7), (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v47 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v10 = v9;
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];
  if (!v11) {
    goto LABEL_13;
  }
  v12 = v11;
  [v11 floatValue];
  float v14 = v13;
  v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F608]];

  if (!v15) {
    goto LABEL_13;
  }
  [v15 floatValue];
  unsigned int v50 = v16;
  v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F610]];

  if (!v17) {
    goto LABEL_13;
  }
  *(float *)&double v18 = v14 * 0.0039062;
  double v51 = v18;
  [v17 floatValue];
  unsigned int v49 = v19;
  v52.columns[0] = (simd_float2)0x3F82000040000000;
  v52.columns[1] = (simd_float2)0x3F8008003F820000;
  simd_float2x2 v21 = __invert_f2(v52);
  HIDWORD(v20) = v21.columns[0].i32[1];
  if (*(float *)&v51 < 1.0 || (LODWORD(v20) = 8.0, *(float *)&v51 > 8.0))
  {
    int v47 = FigSignalErrorAt();

    goto LABEL_12;
  }
  v22 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x263F2F700], v20, v51);

  if (!v22) {
    goto LABEL_13;
  }
  [v22 floatValue];
  float v24 = v23;
  v25 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F408]];

  if (v25)
  {
    float32x2_t v26 = vmul_f32((float32x2_t)__PAIR64__(v49, v50), (float32x2_t)vdup_n_s32(0x37800000u));
    int32x2_t v27 = (int32x2_t)vmul_f32(v26, v26);
    float32x2_t v28 = vmla_lane_f32((float32x2_t)vdup_lane_s32(v27, 0), (float32x2_t)0x3C8000003F800000, (float32x2_t)v27, 1);
    float32x2_t v29 = vmla_lane_f32(vmul_n_f32((float32x2_t)v21.columns[0], v28.f32[0]), (float32x2_t)v21.columns[1], v28, 1);
    float32x2_t v30 = vrsqrte_f32(v29);
    float32x2_t v31 = vmul_f32(v30, vrsqrts_f32(v29, vmul_f32(v30, v30)));
    float32x2_t v32 = vmul_f32(v31, vrsqrts_f32(v29, vmul_f32(v31, v31)));
    __asm { FMOV            V1.2S, #1.0 }
    float32x2_t v38 = vdiv_f32(_D1, v32);
    _D1.i32[1] = LODWORD(v51);
    float32x2_t v39 = vdiv_f32(v38, _D1);
    float v40 = sqrtf(vaddv_f32(vmul_f32(v39, v39)));
    [v25 floatValue];
    float v42 = 1.0
        / (float)((float)((float)(*(float *)&v51 * (float)(v24 * 0.0039062)) * 0.00097752) * (float)(v41 * 0.000015259));
    *(float *)&int v43 = (float)(v40 * v40) + 0.375;
    a3[1].var2 = v42;
    a3[1].var3 = v43;
    float v44 = sqrtf(*(float *)&v43 + v42);
    a3[2].var0 = v44 + v44;
    LODWORD(a3[2].var1) = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
    *(void *)&a3->var0 = 0;
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    a3[1].var0 = v45;
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    a3[1].var1 = v46;
    *(void *)&a3->var2 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);

    int v47 = 0;
  }
  else
  {
LABEL_13:
    int v47 = FigSignalErrorAt();
  }
LABEL_12:

  return v47;
}

@end