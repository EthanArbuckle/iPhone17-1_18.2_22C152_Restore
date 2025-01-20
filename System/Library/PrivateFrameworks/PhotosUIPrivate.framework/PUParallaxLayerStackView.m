@interface PUParallaxLayerStackView
- (CGPoint)motionVector;
- (PUParallaxLayerStackViewModel)viewModel;
- (void)_updateContainerFrame;
- (void)setFrame:(CGRect)a3;
- (void)setMotionVector:(CGPoint)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PUParallaxLayerStackView

- (void).cxx_destruct
{
}

- (void)setMotionVector:(CGPoint)a3
{
  self->_motionVector = a3;
}

- (CGPoint)motionVector
{
  double x = self->_motionVector.x;
  double y = self->_motionVector.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_updateContainerFrame
{
  v3 = [(PUParallaxLayerStackView *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PUParallaxLayerStackView__updateContainerFrame__block_invoke;
  v4[3] = &unk_1E5F2E420;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __49__PUParallaxLayerStackView__updateContainerFrame__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 bounds];
  PXRectWithOriginAndSize();
  objc_msgSend(v3, "setContainerFrame:");
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackView;
  -[PUParallaxLayerStackView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUParallaxLayerStackView *)self _updateContainerFrame];
}

- (void)setViewModel:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = (PUParallaxLayerStackViewModel *)a3;
  if (self->_viewModel != v5)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PUParallaxLayerStackView *)self _updateContainerFrame];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v6 = [(PUParallaxLayerStackView *)self subviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    v11 = [(PUParallaxLayerStackViewModel *)v5 viewManager];
    v12 = [(PUParallaxLayerStackViewModel *)v5 currentLayerStack];
    int v13 = [v12 hasMainLayers];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v25 = v12;
    v14 = [v12 layers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          v20 = [v11 viewForLayer:v19];
          if (v13 && ([v19 isBackfill] & 1) != 0) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = [v19 isDebug];
          }
          [v20 setHidden:v21];
          [(PUParallaxLayerStackView *)self addSubview:v20];
          [v19 zPosition];
          double v23 = v22;
          v24 = [v20 layer];
          [v24 setZPosition:v23];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }
  }
}

@end