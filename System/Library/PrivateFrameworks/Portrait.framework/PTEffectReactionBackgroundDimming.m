@interface PTEffectReactionBackgroundDimming
- (PTEffectReactionBackgroundDimming)initWithMetalContext:(id)a3;
- (int)backgroundDimAndConvertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 outRGBA:(id)a7 dimmingFactor:(float)a8 disparityRemapping:(CGRect)a9 outColorROI:(CGRect)a10;
@end

@implementation PTEffectReactionBackgroundDimming

- (PTEffectReactionBackgroundDimming)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PTEffectReactionBackgroundDimming;
  v6 = [(PTEffectReactionBackgroundDimming *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = objc_opt_new();
    int v16 = 0;
    backgroundDimAndConvertYUVtoRGB = v7->_backgroundDimAndConvertYUVtoRGB;
    while (1)
    {
      [v8 reset];
      [v8 setConstantValue:&v16 type:29 withName:@"kColorTransferFunction"];
      uint64_t v10 = [v5 computePipelineStateFor:@"backgroundDimAndConvertYUVToRGB" withConstants:v8];
      v11 = backgroundDimAndConvertYUVtoRGB[v16];
      backgroundDimAndConvertYUVtoRGB[v16] = (MTLComputePipelineState *)v10;

      int v12 = v16;
      if (!backgroundDimAndConvertYUVtoRGB[v16]) {
        break;
      }
      ++v16;
      if (v12 > 7)
      {
        v13 = v7;
        goto LABEL_10;
      }
    }
    v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTEffectReactionBackgroundDimming initWithMetalContext:](v14);
    }

    v13 = 0;
LABEL_10:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)backgroundDimAndConvertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 outRGBA:(id)a7 dimmingFactor:(float)a8 disparityRemapping:(CGRect)a9 outColorROI:(CGRect)a10
{
  CGFloat height = a9.size.height;
  CGFloat x = a9.origin.x;
  CGFloat y = a9.origin.y;
  CGFloat width = a9.size.width;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v18;
  _D1 = a8 * 0.6;
  __asm { FCVT            H1, D1 }
  v56[0] = LOWORD(_D1);
  _D1 = a8 * 0.85;
  __asm { FCVT            H1, D1 }
  v56[1] = LOWORD(_D1);
  _D0 = a8 * 0.95;
  __asm { FCVT            H0, D0 }
  v56[2] = LOWORD(_D0);
  int v57 = -1207911424;
  if (v18)
  {
    id v27 = v18;
    int v57 = 1006632960;
  }
  else
  {
    id v27 = v17;
  }
  memset(v55, 0, sizeof(v55));
  id v28 = a7;
  id v29 = a3;
  v30 = [v16 transferFunction];
  int v31 = +[PTColorConversion getTransferFunction:v30 toLinear:1];

  v32 = [v29 computeCommandEncoder];

  if (!v32)
  {
    v34 = _PTLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PTEffectReactionBackgroundDimming backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:](v34);
    }
  }
  objc_msgSend(v32, "setComputePipelineState:", self->_backgroundDimAndConvertYUVtoRGB[v31], *(void *)&a10.size.height, v33);
  if ([v16 isRGB])
  {
    v35 = [v16 texRGBA];
    [v32 setTexture:v35 atIndex:0];

    [v32 setTexture:0 atIndex:1];
  }
  else
  {
    +[PTColorConversion getColorMatrix:v16 toRGB:1];
    id v36 = v16;
    v37 = [v36 texLuma];
    [v32 setTexture:v37 atIndex:0];

    v38 = [v36 texChroma];

    [v32 setTexture:v38 atIndex:1];
  }
  [v32 setTexture:v27 atIndex:2];
  [v32 setTexture:v28 atIndex:3];
  [v32 setBytes:v55 length:24 atIndex:0];
  [v32 setBytes:v56 length:10 atIndex:1];
  v39.f64[0] = width;
  v40.f64[0] = x;
  v39.f64[1] = height;
  v40.f64[1] = y;
  float32x4_t v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v40), v39);
  [v32 setBytes:&v54 length:16 atIndex:2];
  v41.f64[0] = a10.size.width;
  v41.f64[1] = v45;
  float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)a10.origin), v41);
  [v32 setBytes:&v53 length:16 atIndex:3];
  uint64_t v42 = [v28 width];
  uint64_t v43 = [v28 height];

  v52[0] = v42;
  v52[1] = v43;
  v52[2] = 1;
  long long v50 = xmmword_1D081F8F0;
  uint64_t v51 = 1;
  [v32 dispatchThreads:v52 threadsPerThreadgroup:&v50];
  [v32 endEncoding];

  return 0;
}

- (void).cxx_destruct
{
  for (uint64_t i = 80; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_backgroundDimAndConvertYUVtoRGB[i]";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)backgroundDimAndConvertRGBLinearFromPTTexture:(os_log_t)log inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "computeEncoder";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end