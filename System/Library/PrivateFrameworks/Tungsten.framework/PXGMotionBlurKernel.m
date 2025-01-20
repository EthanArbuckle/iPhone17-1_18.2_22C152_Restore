@interface PXGMotionBlurKernel
- (double)size;
- (int64_t)direction;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6;
- (void)preloadWithDevice:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setSize:(double)a3;
@end

@implementation PXGMotionBlurKernel

- (void).cxx_destruct
{
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)preloadWithDevice:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PXGMotionBlurKernel_preloadWithDevice___block_invoke;
  block[3] = &unk_265556768;
  id v7 = v3;
  uint64_t v4 = preloadWithDevice__onceToken_1166[0];
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(preloadWithDevice__onceToken_1166, block);
  }
}

void __41__PXGMotionBlurKernel_preloadWithDevice___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F13248]) initWithDevice:*(void *)(a1 + 32) kernelWidth:11 kernelHeight:11];
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v20 = a3;
  id v9 = a4;
  id v10 = a5;
  double size = self->_size;
  if (self->_direction == 1)
  {
    unint64_t v12 = 1;
    unint64_t v13 = (2 * vcvtad_u64_f64(fabs(size * (double)(unint64_t)[v9 width]) * 0.5)) | 1;
  }
  else
  {
    unint64_t v13 = 1;
    unint64_t v12 = (2 * vcvtad_u64_f64(fabs(size * (double)(unint64_t)[v9 height]) * 0.5)) | 1;
  }
  if (self->_boxKernel
    || [0 kernelWidth] != v12
    || [(MPSImageBox *)self->_boxKernel kernelHeight] != v13
    || ([(MPSImageBox *)self->_boxKernel device],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v20 device],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v14 != v15))
  {
    id v16 = objc_alloc(MEMORY[0x263F13248]);
    v17 = [v20 device];
    v18 = (MPSImageBox *)[v16 initWithDevice:v17 kernelWidth:v12 kernelHeight:v13];
    boxKernel = self->_boxKernel;
    self->_boxKernel = v18;

    [(MPSImageBox *)self->_boxKernel setEdgeMode:0];
    [(MPSImageBox *)self->_boxKernel setOptions:2];
    [(MPSImageBox *)self->_boxKernel setLabel:@"PXGMotionBlur"];
  }
  [(MPSImageBox *)self->_boxKernel encodeToCommandBuffer:v20 sourceTexture:v9 destinationTexture:v10];
}

@end