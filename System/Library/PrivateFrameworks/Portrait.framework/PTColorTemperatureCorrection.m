@interface PTColorTemperatureCorrection
- (PTColorTemperatureCorrection)initWithMetalContext:(id)a3;
- (float)debugColorTemperature;
- (id)description;
- (void)colorTemperatureCorrectionYUVCube:(id)a3 inYUV:(id)a4 outColorTemperatureCorrectionCube:(id)a5 colorTemperatureRGB:(id)a6 colorCorrectionIntensity:(float)a7;
- (void)estimateColorTemperatureFromBackground:(id)a3 inYUV:(id)a4 inBackgroundLuma:(id)a5 inBackgroundChroma:(id)a6 outColorTemperatureBuffer:(id)a7;
@end

@implementation PTColorTemperatureCorrection

- (PTColorTemperatureCorrection)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTColorTemperatureCorrection;
  v6 = [(PTColorTemperatureCorrection *)&v50 init];
  p_metalContext = (id *)&v6->_metalContext;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(PTMetalContext *)v6->_metalContext computePipelineStateFor:@"colorTemperatureCorrectionYUVCube" withConstants:0];
  colorTemperatureCorrectionYUVCube = v6->_colorTemperatureCorrectionYUVCube;
  v6->_colorTemperatureCorrectionYUVCube = (MTLComputePipelineState *)v8;

  if (!v6->_colorTemperatureCorrectionYUVCube)
  {
    v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTColorTemperatureCorrection initWithMetalContext:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_14;
  }
  uint64_t v10 = [*p_metalContext computePipelineStateFor:@"colorTemperatureHistogram" withConstants:0];
  colorTemperatureHistogram = v6->_colorTemperatureHistogram;
  v6->_colorTemperatureHistogram = (MTLComputePipelineState *)v10;

  if (!v6->_colorTemperatureHistogram)
  {
    v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTColorTemperatureCorrection initWithMetalContext:](v20, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_14;
  }
  uint64_t v12 = [*p_metalContext computePipelineStateFor:@"colorTemperatureClear" withConstants:0];
  colorTemperatureClear = v6->_colorTemperatureClear;
  v6->_colorTemperatureClear = (MTLComputePipelineState *)v12;

  if (!v6->_colorTemperatureClear)
  {
    v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTColorTemperatureCorrection initWithMetalContext:](v20, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_14;
  }
  uint64_t v14 = [*p_metalContext computePipelineStateFor:@"colorTemperatureFromHistogram" withConstants:0];
  colorTemperatureFromHistogram = v6->_colorTemperatureFromHistogram;
  v6->_colorTemperatureFromHistogram = (MTLComputePipelineState *)v14;

  if (!v6->_colorTemperatureFromHistogram)
  {
    v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTColorTemperatureCorrection initWithMetalContext:].cold.4(v20, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  v16 = [*p_metalContext device];
  uint64_t v17 = [v16 newBufferWithLength:44 options:0];
  colorTemperatureHistogramBuffer = v6->_colorTemperatureHistogramBuffer;
  v6->_colorTemperatureHistogramBuffer = (MTLBuffer *)v17;

  v19 = v6;
LABEL_15:

  return v19;
}

- (void)colorTemperatureCorrectionYUVCube:(id)a3 inYUV:(id)a4 outColorTemperatureCorrectionCube:(id)a5 colorTemperatureRGB:(id)a6 colorCorrectionIntensity:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  float v25 = a7;
  v16 = [v13 transferFunction];
  int v17 = +[PTColorConversion getTransferFunction:v16 toLinear:1];

  int v24 = v17;
  memset(v23, 0, sizeof(v23));
  +[PTColorConversion getColorMatrix:v13 toRGB:0];
  memset(v22, 0, sizeof(v22));
  +[PTColorConversion getColorMatrix:v13 toRGB:1];
  v18 = [v12 computeCommandEncoder];
  [v18 setComputePipelineState:self->_colorTemperatureCorrectionYUVCube];
  [v18 setTexture:v14 atIndex:0];
  [v18 setBuffer:v15 offset:0 atIndex:0];
  [v18 setBytes:v22 length:24 atIndex:1];
  [v18 setBytes:&v24 length:4 atIndex:2];
  [v18 setBytes:v23 length:24 atIndex:3];
  [v18 setBytes:&v25 length:4 atIndex:4];
  v21[0] = [v14 width];
  v21[1] = [v14 height];
  v21[2] = [v14 depth];
  int64x2_t v19 = vdupq_n_s64(0x10uLL);
  uint64_t v20 = 1;
  [v18 dispatchThreads:v21 threadsPerThreadgroup:&v19];
  [v18 endEncoding];
}

- (void)estimateColorTemperatureFromBackground:(id)a3 inYUV:(id)a4 inBackgroundLuma:(id)a5 inBackgroundChroma:(id)a6 outColorTemperatureBuffer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v26 = a7;
  v16 = [v13 transferFunction];
  int v17 = +[PTColorConversion getTransferFunction:v16 toLinear:0];

  v42[0] = v17;
  memset(v41, 0, sizeof(v41));
  +[PTColorConversion getColorMatrix:v13 toRGB:1];
  v18 = [v12 computeCommandEncoder];
  [v18 setComputePipelineState:self->_colorTemperatureClear];
  [v18 setBuffer:self->_colorTemperatureHistogramBuffer offset:0 atIndex:0];
  long long v39 = xmmword_1D0820290;
  uint64_t v40 = 1;
  long long v37 = xmmword_1D08202A0;
  uint64_t v38 = 1;
  [v18 dispatchThreads:&v39 threadsPerThreadgroup:&v37];
  [v18 endEncoding];
  unint64_t v19 = [v14 width];
  unint64_t v20 = [v14 height];
  +[PTColorConversion getChromaOffsetFromLuma:v14 texChroma:v15];
  uint64_t v36 = v21;
  uint64_t v22 = [v12 computeCommandEncoder];

  [v22 setComputePipelineState:self->_colorTemperatureHistogram];
  [v22 setTexture:v14 atIndex:0];
  [v22 setTexture:v15 atIndex:1];
  [v22 setBytes:v41 length:24 atIndex:0];
  [v22 setBytes:v42 length:4 atIndex:1];
  [v22 setBytes:&v36 length:8 atIndex:2];
  [v22 setBuffer:self->_colorTemperatureHistogramBuffer offset:0 atIndex:3];
  float v23 = (float)v19 / (float)v20;
  float v24 = sqrtf(2048.0 / v23);
  v35[0] = (int)((int)(float)(v23 * v24) & 0xFFFFFFF8);
  v35[1] = (int)((int)v24 & 0xFFFFFFFC);
  v35[2] = 1;
  long long v33 = xmmword_1D081FED0;
  uint64_t v34 = 1;
  [v22 dispatchThreads:v35 threadsPerThreadgroup:&v33];
  [v22 endEncoding];
  long long v31 = xmmword_1D08202C0;
  long long v32 = xmmword_1D08202B0;
  float v25 = [v12 computeCommandEncoder];

  [v25 setComputePipelineState:self->_colorTemperatureFromHistogram];
  [v25 setBuffer:self->_colorTemperatureHistogramBuffer offset:0 atIndex:0];
  [v25 setBuffer:v26 offset:0 atIndex:1];
  [v25 setBytes:&v32 length:16 atIndex:2];
  [v25 setBytes:&v31 length:16 atIndex:3];
  int64x2_t v29 = vdupq_n_s64(1uLL);
  uint64_t v30 = 1;
  long long v27 = xmmword_1D08202D0;
  uint64_t v28 = 1;
  [v25 dispatchThreads:&v29 threadsPerThreadgroup:&v27];
  [v25 endEncoding];
}

- (id)description
{
  v2 = (unsigned int *)[(MTLBuffer *)self->_colorTemperatureHistogramBuffer contents];
  v3 = NSString;
  uint64_t v4 = atomic_load(v2);
  id v5 = v2 + 1;
  uint64_t v6 = atomic_load(v2 + 1);
  v7 = v2 + 2;
  uint64_t v8 = atomic_load(v2 + 2);
  v9 = v2 + 3;
  uint64_t v10 = atomic_load(v2 + 3);
  v11 = v2 + 4;
  uint64_t v12 = atomic_load(v2 + 4);
  id v13 = v2 + 5;
  uint64_t v14 = atomic_load(v2 + 5);
  id v15 = v2 + 6;
  uint64_t v16 = atomic_load(v2 + 6);
  int v17 = v2 + 7;
  uint64_t v18 = atomic_load(v2 + 7);
  unint64_t v19 = v2 + 8;
  uint64_t v20 = atomic_load(v2 + 8);
  uint64_t v21 = v2 + 9;
  uint64_t v22 = atomic_load(v2 + 9);
  LODWORD(v2) = atomic_load(v2);
  LODWORD(v5) = atomic_load(v5);
  LODWORD(v2) = v5 + v2;
  LODWORD(v5) = atomic_load(v7);
  LODWORD(v7) = atomic_load(v9);
  LODWORD(v2) = v2 + v5 + v7;
  LODWORD(v5) = atomic_load(v11);
  LODWORD(v7) = atomic_load(v13);
  LODWORD(v5) = v5 + v7;
  LODWORD(v7) = atomic_load(v15);
  LODWORD(v2) = v2 + v5 + v7;
  LODWORD(v5) = atomic_load(v17);
  LODWORD(v7) = atomic_load(v19);
  LODWORD(v5) = v5 + v7;
  LODWORD(v7) = atomic_load(v21);
  return (id)objc_msgSend(v3, "stringWithFormat:", @"Histogram\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t%i\t(sum: %i)", v4, v6, v8, v10, v12, v14, v16, v18, v20, v22, (v2 + v5 + v7));
}

- (float)debugColorTemperature
{
  return *(float *)([(MTLBuffer *)self->_colorTemperatureHistogramBuffer contents] + 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTemperatureHistogramBuffer, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_colorTemperatureFromHistogram, 0);
  objc_storeStrong((id *)&self->_colorTemperatureClear, 0);
  objc_storeStrong((id *)&self->_colorTemperatureHistogram, 0);

  objc_storeStrong((id *)&self->_colorTemperatureCorrectionYUVCube, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end