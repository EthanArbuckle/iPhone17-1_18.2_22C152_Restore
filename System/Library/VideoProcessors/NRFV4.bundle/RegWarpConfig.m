@interface RegWarpConfig
- (RegWarpConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4;
- (int)getDemosaicConfigForInputFrame:(id)a3 demosaicConfig:(id *)a4;
- (int)getValidBufferRect:(CGRect *)a3 forInputFrame:(id)a4 withWidth:(unsigned int)a5 andHeight:(unsigned int)a6;
@end

@implementation RegWarpConfig

- (RegWarpConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)RegWarpConfig;
    v9 = [(SoftISPConfig *)&v12 initWithStaticParameters:v6];
    if (v9)
    {
      -[SoftISPConfig setMaximumOutputDimensions:](v9, "setMaximumOutputDimensions:", [v8 maximumWidth] | ((unint64_t)objc_msgSend(v8, "maximumHeight") << 32));
      [(SoftISPConfig *)v9 setInputPixelFormat:0];
      uint64_t v10 = MEMORY[0x263EFFA68];
      [(SoftISPConfig *)v9 setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
      [(SoftISPConfig *)v9 setOutputPixelFormat:0];
      [(SoftISPConfig *)v9 setOutputMTLPixelFormatForPlane:v10];
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();

    v9 = 0;
  }

  return v9;
}

- (int)getDemosaicConfigForInputFrame:(id)a3 demosaicConfig:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  char v37 = 0;
  if (!v5 || !a4 || (-[SoftISPInputFrame metadata]((uint64_t)v5), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v33 = FigSignalErrorAt();
    goto LABEL_11;
  }
  v8 = (void *)v7;
  int v9 = -[SoftISPInputFrame firstPixel]((uint64_t)v6);
  if (v9 <= 0)
  {
    FigDebugAssert3();
    goto LABEL_14;
  }
  a4->var0 = v9;
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
  if (!v10)
  {
LABEL_14:
    int v33 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_11;
  }
  v11 = (void *)v10;
  int v12 = -[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v6);
  *(void *)&a4->var1 = 1065353216;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F308], &v37, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-1.0)));
  if (!v37) {
    goto LABEL_15;
  }
  float v36 = *(float *)&v13;
  LODWORD(v13) = -1.0;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F300], &v37, v13);
  if (!v37
    || (float v35 = *(float *)&v14,
        LODWORD(v14) = -1.0,
        objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C8], &v37, v14),
        !v37)
    || (v18.f32[0] = v36, *(float *)v16.i32 = fminf(v36, fminf(v35, v15)), *(float *)v16.i32 <= 0.0))
  {
LABEL_15:
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();

    goto LABEL_16;
  }
  v18.f32[1] = v35;
  *(float32x2_t *)&long long v17 = vdiv_f32(v18, (float32x2_t)vdup_lane_s32(v16, 0));
  *((float *)&v17 + 2) = v15 / *(float *)v16.i32;
  *(_OWORD *)&a4[1].var1 = v17;
  id v19 = v11;
  uint64_t v20 = [v19 bytes];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *(void *)(v20 + 12);
  float v23 = *(float *)(v20 + 20);
  uint64_t v24 = *(void *)(v20 + 24);
  int v25 = *(_DWORD *)(v20 + 32);
  a4[3].var1 = *(float *)(v20 + 8);
  *(void *)&a4[2].var2 = v21;
  a4[4].var2 = v23;
  *(void *)&a4[4].var0 = v22;
  *(_DWORD *)&a4[6].var0 = v25;
  v26 = (const float *)&unk_263481E48;
  *(void *)&a4[5].var1 = v24;
  float32x4_t v27 = vld1q_dup_f32(v26);
  v27.f32[0] = (float)v12 / 65535.0;
  __asm { FMOV            V2.4S, #1.0 }
  *(float *)&_Q2 = 1.0 - v27.f32[0];
  *(_OWORD *)&a4[6].var2 = _Q2;
  *(float32x4_t *)&a4[8].var0 = v27;

  int v33 = 0;
LABEL_11:

  return v33;
}

- (int)getValidBufferRect:(CGRect *)a3 forInputFrame:(id)a4 withWidth:(unsigned int)a5 andHeight:(unsigned int)a6
{
  int v9 = -[SoftISPInputFrame metadata]((uint64_t)a4);
  if (v9)
  {
    int v10 = 0;
    if (!FigCFDictionaryGetCGRectIfPresent())
    {
      a3->origin.x = 0.0;
      a3->origin.y = 0.0;
      a3->size.width = (double)a5;
      a3->size.height = (double)a6;
    }
  }
  else
  {
    int v10 = FigSignalErrorAt();
  }

  return v10;
}

@end