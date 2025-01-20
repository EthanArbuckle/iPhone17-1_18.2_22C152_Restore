@interface PTOpticalFlow
- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5;
- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5 allocateDisplacementFWD:(BOOL)a6 needConversionBGRA2YUVA:(BOOL)a7 inverseFlow:(BOOL)a8;
- (id)displacementFWD;
- (id)toTextureArray:(id)a3;
- (signed)estimateDisplacementFWD:(id)a3 sourceRGBA:(id)a4 destRGBA:(id)a5;
- (signed)estimateDisplacementStream:(id)a3 destRGBA:(id)a4 outDisplacement:(id)a5;
- (signed)estimateDisplacementStream:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 destRGBA:(id)a6;
- (signed)setDisplacementFWD:(id)a3;
- (signed)warp:(id)a3 inTexture:(id)a4 inDisplacement:(id)a5 outTextureWarped:(id)a6;
- (void)reset;
@end

@implementation PTOpticalFlow

- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5 allocateDisplacementFWD:(BOOL)a6 needConversionBGRA2YUVA:(BOOL)a7 inverseFlow:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v15 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTOpticalFlow;
  v16 = [(PTOpticalFlow *)&v50 init];
  v17 = (int32x2_t *)v16;
  if (!v16) {
    goto LABEL_15;
  }
  v16->_inverseFlow = a8;
  objc_storeStrong((id *)&v16->_metalContext, a3);
  v17[5] = vmovn_s64(vaddq_s64((int64x2_t)vandq_s8(*(int8x16_t *)&a4->var0, (int8x16_t)vdupq_n_s64(1uLL)), *(int64x2_t *)&a4->var0));
  uint64_t v18 = [v15 computePipelineStateFor:@"warpTexture" withConstants:0];
  v19 = (void *)v17[2];
  v17[2] = (int32x2_t)v18;

  if (!*(void *)&v17[2])
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(PTOpticalFlow *)v27 initWithMetalContext:v29 colorSize:v30 lktPreset:v31 allocateDisplacementFWD:v32 needConversionBGRA2YUVA:v33 inverseFlow:v34];
    }
    goto LABEL_14;
  }
  v20 = [[LKTFlowGPU alloc] initWithMetalContext:v15 width:v17[5].u32[0] height:v17[5].u32[1] nscales:0xFFFFFFFFLL];
  v21 = (void *)v17[3];
  v17[3] = (int32x2_t)v20;

  v22 = (void *)v17[3];
  if (!v22)
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(PTOpticalFlow *)v27 initWithMetalContext:v36 colorSize:v37 lktPreset:v38 allocateDisplacementFWD:v39 needConversionBGRA2YUVA:v40 inverseFlow:v41];
    }
LABEL_14:

LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  [v22 setIsInverse:v17[6].u8[1]];
  [*(id *)&v17[3] setNeedConversionBGRA2YUVA:v9];
  [*(id *)&v17[3] setUseNonLocalRegularization:1];
  [*(id *)&v17[3] setIsBidirectional:0];
  [*(id *)&v17[3] setPreset:a5];
  if (v10)
  {
    v23 = [v15 textureUtil];
    uint64_t v24 = [v23 createWithWidth:v17[5].i32[0] height:v17[5].i32[1] pixelFormat:65];
    v25 = (void *)v17[4];
    v17[4] = (int32x2_t)v24;

    if (v17[4])
    {
      objc_msgSend(*(id *)&v17[3], "setOutputTexUV:");
      goto LABEL_7;
    }
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(PTOpticalFlow *)v27 initWithMetalContext:v43 colorSize:v44 lktPreset:v45 allocateDisplacementFWD:v46 needConversionBGRA2YUVA:v47 inverseFlow:v48];
    }
    goto LABEL_14;
  }
LABEL_7:
  v26 = v17;
LABEL_16:

  return v26;
}

- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a4;
  return [(PTOpticalFlow *)self initWithMetalContext:a3 colorSize:&v6 lktPreset:a5 allocateDisplacementFWD:1 needConversionBGRA2YUVA:0 inverseFlow:0];
}

- (signed)estimateDisplacementStream:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 destRGBA:(id)a6
{
  signed __int16 v6 = [(LKTFlowGPU *)self->_lktflowgpuContext estimateFlowStreamTex:a6 index:*(void *)&a4 doOpticalFlow:a5 commandBuffer:a3];
  if (v6)
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTOpticalFlow estimateDisplacementStream:index:doOpticalFlow:destRGBA:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v6;
}

- (signed)estimateDisplacementStream:(id)a3 destRGBA:(id)a4 outDisplacement:(id)a5
{
  uint64_t v9 = self->_displacementFWD;
  id v10 = a4;
  id v11 = a3;
  [(PTOpticalFlow *)self setDisplacementFWD:a5];
  LOWORD(a5) = [(LKTFlowGPU *)self->_lktflowgpuContext estimateFlowStreamTex:v10 commandBuffer:v11];

  if ((_WORD)a5)
  {
    uint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTOpticalFlow estimateDisplacementStream:destRGBA:outDisplacement:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    signed __int16 v20 = -1;
  }
  else
  {
    signed __int16 v20 = [(PTOpticalFlow *)self setDisplacementFWD:v9];
  }

  return v20;
}

- (signed)estimateDisplacementFWD:(id)a3 sourceRGBA:(id)a4 destRGBA:(id)a5
{
  int v5 = [(LKTFlowGPU *)self->_lktflowgpuContext estimateFlowFromTexReference:a4 target:a5 commandBuffer:a3];
  int v6 = (__int16)v5;
  if (v5 << 16)
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTOpticalFlow estimateDisplacementFWD:sourceRGBA:destRGBA:](v6, v7);
    }
  }
  return v6;
}

- (id)toTextureArray:(id)a3
{
  id v3 = a3;
  if ([v3 textureType] == 3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_msgSend(v3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v3, "pixelFormat"), 3, 0, 1, 0, 1);
  }
  int v5 = v4;

  return v5;
}

- (signed)warp:(id)a3 inTexture:(id)a4 inDisplacement:(id)a5 outTextureWarped:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->_warpTexture];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v10 atIndex:1];
  [v13 setTexture:v11 atIndex:2];

  LODWORD(v15) = 1.0;
  if (!self->_inverseFlow) {
    *(float *)&uint64_t v15 = -1.0;
  }
  uint64_t v16 = objc_msgSend(v10, "width", v15, v14);
  uint64_t v17 = [v10 height];
  v18.i64[0] = v16;
  v18.i64[1] = v17;
  float32x2_t v26 = vdiv_f32((float32x2_t)vdup_lane_s32(v22, 0), vcvt_f32_f64(vcvtq_f64_u64(v18)));
  [v13 setBytes:&v26 length:8 atIndex:0];
  uint64_t v19 = [v10 width];
  uint64_t v20 = [v10 height];

  v25[0] = v19;
  v25[1] = v20;
  v25[2] = 1;
  int64x2_t v23 = vdupq_n_s64(8uLL);
  uint64_t v24 = 1;
  [v13 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v13 endEncoding];

  return 0;
}

- (id)displacementFWD
{
  return self->_displacementFWD;
}

- (signed)setDisplacementFWD:(id)a3
{
  int v5 = (MTLTexture *)a3;
  int v6 = v5;
  if (!self->_allocateDisplacementFWD || self->_displacementFWD == v5)
  {
    objc_storeStrong((id *)&self->_displacementFWD, a3);
    [(LKTFlowGPU *)self->_lktflowgpuContext setOutputTexUV:self->_displacementFWD];
    signed __int16 v15 = 0;
  }
  else
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTOpticalFlow setDisplacementFWD:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    signed __int16 v15 = -1;
  }

  return v15;
}

- (void)reset
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displacementFWD, 0);
  objc_storeStrong((id *)&self->_lktflowgpuContext, 0);
  objc_storeStrong((id *)&self->_warpTexture, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)estimateDisplacementStream:(uint64_t)a3 index:(uint64_t)a4 doOpticalFlow:(uint64_t)a5 destRGBA:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)estimateDisplacementStream:(uint64_t)a3 destRGBA:(uint64_t)a4 outDisplacement:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)estimateDisplacementFWD:(int)a1 sourceRGBA:(NSObject *)a2 destRGBA:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "lktflowgpuContext estimateFlowFromTexReference returned %i", (uint8_t *)v2, 8u);
}

- (void)setDisplacementFWD:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end