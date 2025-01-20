@interface PTOpticalFlow
- (PTOpticalFlow)initWithDevice:(id)a3 commandQueue:(id)a4 colorSize:(id *)a5 disparitySize:(id *)a6;
- (id)displacementFWD;
- (id)toTextureArray:(id)a3;
- (signed)convertCoordToDisplacementMapFWD:(id)a3 displacementFWD:(id)a4 coordFWD:(id)a5;
- (signed)convertDisplacementToCoordFWD:(id)a3 displacementFWD:(id)a4 coordFWD:(id)a5;
- (signed)generateDisplacementFWDFromSourceRGBA:(id)a3 destRGBA:(id)a4;
- (signed)warp:(id)a3 inTexture:(id)a4 outTextureWarped:(id)a5;
- (signed)warpCoordFWD:(id)a3 inTexture:(id)a4 coordFWD:(id)a5 outTextureWarped:(id)a6;
- (signed)warpValid:(id)a3 inTexture:(id)a4 outTextureWarped:(id)a5;
- (signed)warpValidFill:(id)a3 inTexture:(id)a4 inValidTexture:(id)a5 outTextureWarped:(id)a6;
- (signed)warp_displacementFWD:(id)a3 inTexture:(id)a4 displacementFWD:(id)a5 outTextureWarped:(id)a6;
@end

@implementation PTOpticalFlow

- (PTOpticalFlow)initWithDevice:(id)a3 commandQueue:(id)a4 colorSize:(id *)a5 disparitySize:(id *)a6
{
  v9 = (MTLDevice *)a3;
  v38.receiver = self;
  v38.super_class = (Class)PTOpticalFlow;
  id v10 = a4;
  v11 = [(PTOpticalFlow *)&v38 init];
  device = v11->_device;
  v11->_device = v9;
  v13 = v9;

  *(int32x2_t *)&v11->_uint64_t colorWidth = vmovn_s64(vaddq_s64((int64x2_t)vandq_s8(*(int8x16_t *)&a5->var0, (int8x16_t)vdupq_n_s64(1uLL)), *(int64x2_t *)&a5->var0));
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(), v38.receiver, v38.super_class);
  v15 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v14 andOptionalCommandQueue:v10];

  metalContext = v11->_metalContext;
  v11->_metalContext = v15;

  uint64_t v17 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"warpTexture" constants:0];
  warpTexture = v11->warpTexture;
  v11->warpTexture = (MTLComputePipelineState *)v17;

  uint64_t v19 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"warpCoord" constants:0];
  warpCoord = v11->warpCoord;
  v11->warpCoord = (MTLComputePipelineState *)v19;

  uint64_t v21 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"displacementToCoord" constants:0];
  displacementToCoord = v11->displacementToCoord;
  v11->displacementToCoord = (MTLComputePipelineState *)v21;

  uint64_t v23 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"warpValidTexture" constants:0];
  warpValidTexture = v11->warpValidTexture;
  v11->warpValidTexture = (MTLComputePipelineState *)v23;

  uint64_t v25 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"coordToDisplacement" constants:0];
  coordToDisplacement = v11->coordToDisplacement;
  v11->coordToDisplacement = (MTLComputePipelineState *)v25;

  uint64_t v27 = [(FigMetalContext *)v11->_metalContext computePipelineStateFor:@"warpValidFillTexture" constants:0];
  warpValidFillTexture = v11->warpValidFillTexture;
  v11->warpValidFillTexture = (MTLComputePipelineState *)v27;

  v29 = [[LKTFlowGPU alloc] initWithMetalContext:v11->_metalContext width:v11->_colorWidth height:v11->_colorHeight nscales:0xFFFFFFFFLL];
  lktflowgpuContext = v11->_lktflowgpuContext;
  v11->_lktflowgpuContext = v29;

  uint64_t colorWidth = v11->_colorWidth;
  uint64_t colorHeight = v11->_colorHeight;
  v33 = v11->_device;
  v34 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:65 width:colorWidth height:colorHeight mipmapped:0];
  [v34 setUsage:19];
  [v34 setMipmapLevelCount:1];
  v35 = (MTLTexture *)[(MTLDevice *)v33 newTextureWithDescriptor:v34];

  displacementFWD = v11->_displacementFWD;
  v11->_displacementFWD = v35;

  [(LKTFlowGPU *)v11->_lktflowgpuContext setNeedConversionBGRA2YUVA:0];
  [(LKTFlowGPU *)v11->_lktflowgpuContext setUseNonLocalRegularization:1];
  [(LKTFlowGPU *)v11->_lktflowgpuContext setIsBidirectional:0];
  [(LKTFlowGPU *)v11->_lktflowgpuContext setPreset:1];
  [(LKTFlowGPU *)v11->_lktflowgpuContext setOutputTexUV:v11->_displacementFWD];

  return v11;
}

- (signed)generateDisplacementFWDFromSourceRGBA:(id)a3 destRGBA:(id)a4
{
  if (![(LKTFlowGPU *)self->_lktflowgpuContext estimateFlowFromTexReference:a3 target:a4])return 0; {
  NSLog(@"Err");
  }
  return -1;
}

- (id)toTextureArray:(id)a3
{
  id v3 = a3;
  if ([v3 textureType] == (char *)&dword_0 + 3) {
    id v4 = v3;
  }
  else {
    id v4 = objc_msgSend(v3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v3, "pixelFormat"), 3, 0, 1, 0, 1);
  }
  v5 = v4;

  return v5;
}

- (signed)warp:(id)a3 inTexture:(id)a4 outTextureWarped:(id)a5
{
  return [(PTOpticalFlow *)self warp_displacementFWD:a3 inTexture:a4 displacementFWD:self->_displacementFWD outTextureWarped:a5];
}

- (signed)warp_displacementFWD:(id)a3 inTexture:(id)a4 displacementFWD:(id)a5 outTextureWarped:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->warpTexture];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v10 atIndex:1];
  [v13 setTexture:v11 atIndex:2];

  id v14 = [v10 width];
  id v15 = [v10 height];

  v19[0] = v14;
  v19[1] = v15;
  v19[2] = 1;
  int64x2_t v17 = vdupq_n_s64(8uLL);
  uint64_t v18 = 1;
  [v13 dispatchThreads:v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];

  return 0;
}

- (signed)warpValid:(id)a3 inTexture:(id)a4 outTextureWarped:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->warpValidTexture];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  [v10 setTexture:self->_displacementFWD atIndex:2];
  id v11 = [v8 width];
  id v12 = [v8 height];

  v16[0] = v11;
  v16[1] = v12;
  v16[2] = 1;
  int64x2_t v14 = vdupq_n_s64(8uLL);
  uint64_t v15 = 1;
  [v10 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v10 endEncoding];

  return 0;
}

- (signed)warpCoordFWD:(id)a3 inTexture:(id)a4 coordFWD:(id)a5 outTextureWarped:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->warpCoord];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v10 atIndex:1];
  [v13 setTexture:v11 atIndex:2];
  id v14 = [v11 width];
  id v15 = [v11 height];

  v19[0] = v14;
  v19[1] = v15;
  v19[2] = 1;
  int64x2_t v17 = vdupq_n_s64(8uLL);
  uint64_t v18 = 1;
  [v13 dispatchThreads:v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];

  return 0;
}

- (signed)convertDisplacementToCoordFWD:(id)a3 displacementFWD:(id)a4 coordFWD:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->displacementToCoord];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  id v11 = [v9 width];
  id v12 = [v9 height];

  v16[0] = v11;
  v16[1] = v12;
  v16[2] = 1;
  int64x2_t v14 = vdupq_n_s64(8uLL);
  uint64_t v15 = 1;
  [v10 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v10 endEncoding];

  return 0;
}

- (signed)convertCoordToDisplacementMapFWD:(id)a3 displacementFWD:(id)a4 coordFWD:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->coordToDisplacement];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  id v11 = [v9 width];
  id v12 = [v9 height];

  v16[0] = v11;
  v16[1] = v12;
  v16[2] = 1;
  int64x2_t v14 = vdupq_n_s64(8uLL);
  uint64_t v15 = 1;
  [v10 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v10 endEncoding];

  return 0;
}

- (signed)warpValidFill:(id)a3 inTexture:(id)a4 inValidTexture:(id)a5 outTextureWarped:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->warpValidFillTexture];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v10 atIndex:2];
  [v13 setTexture:self->_displacementFWD atIndex:3];
  id v14 = [v10 width];
  id v15 = [v10 height];

  v19[0] = v14;
  v19[1] = v15;
  v19[2] = 1;
  int64x2_t v17 = vdupq_n_s64(8uLL);
  uint64_t v18 = 1;
  [v13 dispatchThreads:v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];

  return 0;
}

- (id)displacementFWD
{
  return self->_displacementFWD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationCoefficientsTextureArray, 0);
  objc_storeStrong((id *)&self->_srcTextureArray, 0);
  objc_storeStrong((id *)&self->_guidanceTextureArray, 0);
  objc_storeStrong((id *)&self->_destTextureArray, 0);
  objc_storeStrong((id *)&self->_displacementFWD, 0);
  objc_storeStrong((id *)&self->_lktflowgpuContext, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->coordToDisplacement, 0);
  objc_storeStrong((id *)&self->displacementToCoord, 0);
  objc_storeStrong((id *)&self->warpCoord, 0);
  objc_storeStrong((id *)&self->warpValidFillTexture, 0);
  objc_storeStrong((id *)&self->warpValidTexture, 0);
  objc_storeStrong((id *)&self->warpTexture, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end