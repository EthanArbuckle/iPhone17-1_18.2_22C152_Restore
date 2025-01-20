@interface PXGMetalViewRenderDestination
- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor;
- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration;
- (BOOL)canSetColorSpace;
- (BOOL)disableDisplayCompositing;
- (BOOL)lowMemoryMode;
- (CGColorSpace)colorspace;
- (CGRect)renderBoundsInPoints;
- (CGSize)renderSize;
- (MTKView)metalView;
- (MTLDevice)device;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (MTLTexture)depthStencilTexture;
- (MTLTexture)renderTexture;
- (OS_dispatch_queue)layoutQueue;
- (PXGMetalRenderDestinationDelegate)delegate;
- (PXGMetalViewRenderDestination)init;
- (PXGMetalViewRenderDestination)initWithDisplayConfiguration:(id *)a3;
- (double)currentDynamicRangeHeadroom;
- (double)maximumDynamicRangeHeadroom;
- (double)scale;
- (float)displayScaleMultiplier;
- (id)test_renderSnapshotHandler;
- (int64_t)sampleCount;
- (unint64_t)colorPixelFormat;
- (unint64_t)depthStencilPixelFormat;
- (unint64_t)destinationColorSpaceName;
- (void)_setupMetalIfNeeded;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)present;
- (void)releaseCachedResources;
- (void)renderImmediately;
- (void)setDelegate:(id)a3;
- (void)setDisableDisplayCompositing:(BOOL)a3;
- (void)setDisplayScaleMultiplier:(float)a3;
- (void)setLayoutQueue:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNeedsRender;
- (void)setTest_renderSnapshotHandler:(id)a3;
- (void)test_configureForRenderSnapshot;
@end

@implementation PXGMetalViewRenderDestination

- (unint64_t)depthStencilPixelFormat
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  unint64_t v3 = [v2 depthStencilPixelFormat];

  return v3;
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (unint64_t)colorPixelFormat
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  unint64_t v3 = [v2 colorPixelFormat];

  return v3;
}

- (double)scale
{
  [(MTKView *)self->_metalView px_screenScale];
  if (v3 == 0.0)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __38__PXGMetalViewRenderDestination_scale__block_invoke;
    v10 = &unk_1E5DD32D0;
    objc_copyWeak(&v11, &location);
    if (scale_onceToken != -1) {
      dispatch_once(&scale_onceToken, &v7);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    double v4 = 1.0;
  }
  else
  {
    double v4 = v3;
  }
  [(PXGMetalViewRenderDestination *)self displayScaleMultiplier];
  return v4 * v5;
}

- (float)displayScaleMultiplier
{
  return self->_displayScaleMultiplier;
}

- (CGSize)renderSize
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 drawableSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)renderBoundsInPoints
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)canSetColorSpace
{
  return 0;
}

- (void)present
{
  id v8 = [(PXGMetalViewRenderDestination *)self metalView];
  BOOL v3 = [(PXGMetalViewRenderDestination *)self disableDisplayCompositing];
  BOOL v4 = v3;
  BOOL v5 = !v3;
  if ([(PXGMetalViewRenderDestination *)self lowMemoryMode] && !v4)
  {
    mach_absolute_time();
    PXTimebaseConversionFactor();
  }
  double v6 = [v8 layer];
  if (v5 != [v6 allowsDisplayCompositing]) {
    [v6 setAllowsDisplayCompositing:v5];
  }
  double v7 = [v8 currentDrawable];
  [v7 present];
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)disableDisplayCompositing
{
  return self->_disableDisplayCompositing;
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  BOOL v3 = [v2 currentRenderPassDescriptor];

  return (MTLRenderPassDescriptor *)v3;
}

- (int64_t)sampleCount
{
  v2 = [(PXGMetalViewRenderDestination *)self metalView];
  int64_t v3 = [v2 sampleCount];

  return v3;
}

- (void)setNeedsRender
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 setNeedsDisplay];
}

- (void)setDisplayScaleMultiplier:(float)a3
{
  self->_displayScaleMultiplier = a3;
}

- (PXGMetalViewRenderDestination)initWithDisplayConfiguration:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PXGMetalViewRenderDestination;
  BOOL v5 = [(PXGMetalViewRenderDestination *)&v22 init];
  double v6 = v5;
  if (!v5) {
    return (PXGMetalViewRenderDestination *)v6;
  }
  long long v7 = *(_OWORD *)&a3->var0;
  *((void *)v5 + 9) = a3->var2;
  *(_OWORD *)(v5 + 56) = v7;
  objc_storeStrong((id *)v5 + 4, MEMORY[0x1E4F14428]);
  *((_DWORD *)v6 + 5) = 1065353216;
  id v8 = [off_1E5DA9658 sharedInstance];
  id v9 = objc_alloc(MEMORY[0x1E4F353C8]);
  double v10 = objc_msgSend(v9, "initWithFrame:device:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v10 setDelegate:v6];
  [v10 setPresentsWithTransaction:1];
  objc_msgSend(v10, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  double v11 = [v10 layer];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, v6, @"PXGMetalViewRenderDestination.m", 59, @"%@ should be an instance inheriting from %@, but it is %@", @"metalView.layer", v19, v21 object file lineNumber description];
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, v6, @"PXGMetalViewRenderDestination.m", 59, @"%@ should be an instance inheriting from %@, but it is nil", @"metalView.layer", v19 object file lineNumber description];
  }

LABEL_4:
  [v11 setAllowsNextDrawableTimeout:0];
  [v11 setFenceEnabled:1];
  objc_msgSend(v11, "setLowLatency:", objc_msgSend(v8, "lowLatency"));
  double v12 = [MEMORY[0x1E4FB1618] clearColor];
  [v10 setBackgroundColor:v12];

  [v10 setEnableSetNeedsDisplay:1];
  [v10 setPaused:1];
  objc_storeStrong((id *)v6 + 5, v10);
  [v6 _setupMetalIfNeeded];
  [v10 setDepthStencilPixelFormat:260];
  [v11 setWantsExtendedDynamicRangeContent:a3->var0];
  if (a3->var0 || a3->var1) {
    objc_msgSend(v11, "setColorspace:", MEMORY[0x1AD10B240](objc_msgSend(v6, "destinationColorSpaceName")));
  }
  double v13 = [v10 device];
  int v14 = objc_msgSend(v13, "supportsTextureSampleCount:", objc_msgSend(v8, "sampleCount"));

  if (v14)
  {
    objc_msgSend(v10, "setSampleCount:", objc_msgSend(v8, "sampleCount"));
  }
  else
  {
    v15 = [v10 device];

    if (v15) {
      PXGTungstenGetLog();
    }
  }

  return (PXGMetalViewRenderDestination *)v6;
}

- (void)setLayoutQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (MTLDevice)device
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  int64_t v3 = [v2 device];

  return (MTLDevice *)v3;
}

- (void)_setupMetalIfNeeded
{
  int64_t v3 = [off_1E5DA9658 sharedInstance];
  char v4 = [v3 simulateMissingMetalDevice];

  if ((v4 & 1) != 0 || (id v5 = MTLCreateSystemDefaultDevice()) == 0) {
    PXGTungstenGetLog();
  }
  double v6 = [(PXGMetalViewRenderDestination *)self metalView];

  if (!v6) {
    PXAssertGetLog();
  }
  long long v7 = [(PXGMetalViewRenderDestination *)self metalView];
  id v8 = [v7 device];

  if (v8 != v5)
  {
    id v9 = [(PXGMetalViewRenderDestination *)self metalView];
    [v9 setDevice:v5];

    double v10 = [(PXGMetalViewRenderDestination *)self delegate];
    [v10 renderDestinationDeviceDidChange:self];
  }
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
}

- (void)drawInMTKView:(id)a3
{
  kdebug_trace();
  id v4 = [(PXGMetalViewRenderDestination *)self delegate];
  [v4 renderDestinationRequestRender:self];
}

- (PXGMetalRenderDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGMetalRenderDestinationDelegate *)WeakRetained;
}

- (unint64_t)destinationColorSpaceName
{
  [(PXGMetalViewRenderDestination *)self displayConfiguration];
  unint64_t result = v5;
  if (!v5)
  {
    [(PXGMetalViewRenderDestination *)self displayConfiguration];
    if (v4) {
      [(PXGMetalViewRenderDestination *)self maximumDynamicRangeHeadroom];
    }
    PXGDeviceIsKnownToHaveExtendedColorDisplay();
  }
  return result;
}

- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration
{
  *($C51E2077B87F80227BBF36E385921798 *)retstr = *($C51E2077B87F80227BBF36E385921798 *)((char *)self + 56);
  return self;
}

- (void)setDisableDisplayCompositing:(BOOL)a3
{
  self->_disableDisplayCompositing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTest_renderSnapshotHandler:(id)a3
{
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)test_configureForRenderSnapshot
{
  id v2 = self->_metalView;
  [(MTKView *)v2 setFramebufferOnly:0];
  [(MTKView *)v2 setColorPixelFormat:115];
  -[MTKView setClearColor:](v2, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
}

- (void)releaseCachedResources
{
  id v10 = [(PXGMetalViewRenderDestination *)self metalView];
  [v10 releaseDrawables];
  char v4 = [v10 layer];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v8);
    id v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:a2, self, @"PXGMetalViewRenderDestination.m", 285, @"%@ should be an instance inheriting from %@, but it is %@", @"metalView.layer", v7, v9 object file lineNumber description];
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    [v5 handleFailureInMethod:a2, self, @"PXGMetalViewRenderDestination.m", 285, @"%@ should be an instance inheriting from %@, but it is nil", @"metalView.layer", v7 object file lineNumber description];
  }

LABEL_3:
  [v4 discardContents];
  [v4 removeBackBuffers];
}

- (void)renderImmediately
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 draw];
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 clearColor];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (MTLTexture)depthStencilTexture
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  double v3 = [v2 depthStencilTexture];

  return (MTLTexture *)v3;
}

- (MTLTexture)renderTexture
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  double v3 = [v2 currentDrawable];
  double v4 = [v3 texture];

  return (MTLTexture *)v4;
}

- (double)currentDynamicRangeHeadroom
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 currentDynamicRangeHeadroom];
  double v4 = v3;

  return v4;
}

- (double)maximumDynamicRangeHeadroom
{
  id v2 = [(PXGMetalViewRenderDestination *)self metalView];
  [v2 maximumDynamicRangeHeadroom];
  double v4 = v3;

  return v4;
}

- (CGColorSpace)colorspace
{
  return 0;
}

void __38__PXGMetalViewRenderDestination_scale__block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

- (PXGMetalViewRenderDestination)init
{
  long long v3 = *(_OWORD *)off_1E5DAAFB0;
  uint64_t v4 = *((void *)off_1E5DAAFB0 + 2);
  return [(PXGMetalViewRenderDestination *)self initWithDisplayConfiguration:&v3];
}

@end