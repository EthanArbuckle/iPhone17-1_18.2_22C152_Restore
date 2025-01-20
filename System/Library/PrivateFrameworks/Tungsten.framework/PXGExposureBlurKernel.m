@interface PXGExposureBlurKernel
+ (id)_exposurePipelineStateForDevice:(id)a3;
- (PXGExposureBlurKernel)init;
- (double)exposure;
- (double)multiplier;
- (double)radius;
- (void)_encodeExposure:(float)a3 texture:(id)a4 toCommandBuffer:(id)a5;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6;
- (void)preloadWithDevice:(id)a3;
- (void)setExposure:(double)a3;
- (void)setMultiplier:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation PXGExposureBlurKernel

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setExposure:(double)a3
{
  self->_exposure = a3;
}

- (double)exposure
{
  return self->_exposure;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)preloadWithDevice:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PXGExposureBlurKernel_preloadWithDevice___block_invoke;
  block[3] = &unk_265556768;
  id v7 = v3;
  uint64_t v4 = preloadWithDevice__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&preloadWithDevice__onceToken, block);
  }
}

void __43__PXGExposureBlurKernel_preloadWithDevice___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F13288]);
  LODWORD(v3) = 1.0;
  uint64_t v4 = (void *)[v2 initWithDevice:*(void *)(a1 + 32) sigma:v3];
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  [(PXGExposureBlurKernel *)self multiplier];
  float v13 = v12;
  [(PXGExposureBlurKernel *)self exposure];
  long double v15 = fabs(v14);
  if (v15 > 0.001)
  {
    [(PXGExposureBlurKernel *)self exposure];
    long double v15 = exp2(v16);
    *(float *)&long double v15 = v15;
    float v13 = v13 * *(float *)&v15;
  }
  if (v13 != 1.0)
  {
    *(float *)&long double v15 = v13;
    [(PXGExposureBlurKernel *)self _encodeExposure:v10 texture:v22 toCommandBuffer:(double)v15];
  }
  id v17 = objc_alloc(MEMORY[0x263F13288]);
  v18 = [v22 device];
  [(PXGExposureBlurKernel *)self radius];
  double v20 = v19 * a6;
  *(float *)&double v20 = v20;
  *(float *)&double v20 = fabsf(*(float *)&v20);
  v21 = (void *)[v17 initWithDevice:v18 sigma:v20];

  [v21 setLabel:@"PXGExposureBlur.gaussianBlur"];
  [v21 setEdgeMode:1];
  [v21 setOptions:2];
  [v21 encodeToCommandBuffer:v22 sourceTexture:v10 destinationTexture:v11];
}

- (void)_encodeExposure:(float)a3 texture:(id)a4 toCommandBuffer:(id)a5
{
  float v29 = a3;
  id v6 = a4;
  id v7 = a5;
  v8 = [v7 computeCommandEncoder];
  [v8 pushDebugGroup:@"PXGExposureBlur.exposure"];
  v9 = objc_opt_class();
  id v10 = [v7 device];
  id v11 = [v9 _exposurePipelineStateForDevice:v10];

  [v8 setComputePipelineState:v11];
  [v8 setTexture:v6 atIndex:0];
  [v8 setTexture:v6 atIndex:1];
  [v8 setBytes:&v29 length:4 atIndex:0];
  uint64_t v12 = [v6 width];
  uint64_t v13 = [v6 height];
  id v14 = v11;
  unint64_t v15 = [v14 threadExecutionWidth];
  unint64_t v16 = [v14 maxTotalThreadsPerThreadgroup];
  unint64_t v17 = v16 / v15;
  if (v15 <= v16)
  {
    uint64_t v19 = 0;
    unint64_t v20 = -1;
    unint64_t v18 = v15;
    unint64_t v21 = -1;
    unint64_t v22 = v16 / v15;
    do
    {
      if (v15 + v19 <= v22) {
        unint64_t v23 = v22;
      }
      else {
        unint64_t v23 = v15 + v19;
      }
      if (v15 + v19 >= v22) {
        unint64_t v24 = v22;
      }
      else {
        unint64_t v24 = v15 + v19;
      }
      if ((v22 + v13 - 1) / v22 * v22 * (v12 + v15 + v19 - 1) / (v15 + v19) * (v15 + v19) - v13 * v12 <= v20)
      {
        unint64_t v25 = v23 / v24;
        if (v25 <= v21)
        {
          unint64_t v17 = v22;
          unint64_t v18 = v15 + v19;
          unint64_t v21 = v25;
          unint64_t v20 = (v22 + v13 - 1) / v22 * v22 * (v12 + v15 + v19 - 1) / (v15 + v19) * (v15 + v19) - v13 * v12;
        }
      }
      unint64_t v26 = 2 * v15 + v19;
      v19 += v15;
      unint64_t v22 = v16 / v26;
    }
    while (v15 + v19 <= v16);
  }
  else
  {
    unint64_t v18 = v15;
  }

  v28[0] = (v12 + v18 - 1) / v18;
  v28[1] = (v13 + v17 - 1) / v17;
  v28[2] = 1;
  v27[0] = v18;
  v27[1] = v17;
  v27[2] = 1;
  [v8 dispatchThreadgroups:v28 threadsPerThreadgroup:v27];
  [v8 popDebugGroup];
  [v8 endEncoding];
}

- (PXGExposureBlurKernel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGExposureBlurKernel;
  result = [(PXGExposureBlurKernel *)&v3 init];
  if (result) {
    result->_multiplier = 1.0;
  }
  return result;
}

+ (id)_exposurePipelineStateForDevice:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = objc_getAssociatedObject(v4, sel__exposurePipelineStateForDevice_);
  if (!v6)
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = 0;
    v8 = (void *)[v4 newDefaultLibraryWithBundle:v7 error:&v14];
    id v9 = v14;

    if (v8)
    {
      id v10 = (void *)[v8 newFunctionWithName:@"PXGExposure"];
      if (v10)
      {
        id v13 = v9;
        id v6 = (void *)[v4 newComputePipelineStateWithFunction:v10 error:&v13];
        id v11 = v13;

        if (v6)
        {
          objc_setAssociatedObject(v4, sel__exposurePipelineStateForDevice_, v6, (void *)0x301);
        }
        else
        {
          NSLog(&cfstr_CouldNotLoadMe.isa, v11);
          id v6 = 0;
        }
      }
      else
      {
        NSLog(&cfstr_CouldNotLoadMe_0.isa);
        id v6 = 0;
        id v11 = v9;
      }

      id v9 = v11;
    }
    else
    {
      NSLog(&cfstr_CouldNotLoadMe.isa, v9);
      id v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

@end