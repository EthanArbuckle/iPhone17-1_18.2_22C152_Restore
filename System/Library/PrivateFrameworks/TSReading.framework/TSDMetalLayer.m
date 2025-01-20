@interface TSDMetalLayer
- (BOOL)shouldSkipNextDisplayLink;
- (MTLCommandQueue)commandQueue;
- (TSDMetalLayer)initWithFrame:(CGRect)a3 isOpaque:(BOOL)a4 isWideGamut:(BOOL)a5 delegate:(id)a6 metalDevice:(id)a7;
- (TSDMetalLayerDelegate)delegate;
- (id)device;
- (void)displayAtCurrentLayerTime;
- (void)p_drawFrameAtLayerTime:(double)a3;
- (void)p_drawFrameFromDisplayLink:(id)a3;
- (void)p_performWorkOnMainThread:(id)a3;
- (void)pauseAnimation;
- (void)resumeAnimation;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setShouldSkipNextDisplayLink:(BOOL)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation TSDMetalLayer

- (TSDMetalLayer)initWithFrame:(CGRect)a3 isOpaque:(BOOL)a4 isWideGamut:(BOOL)a5 delegate:(id)a6 metalDevice:(id)a7
{
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TSDMetalLayer;
  v16 = [(CAMetalLayer *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    -[TSDMetalLayer setFrame:](v17, "setFrame:", x, y, width, height);
    [(TSDMetalLayer *)v17 setMasksToBounds:0];
    [(TSDMetalLayer *)v17 setOpaque:0];
    [(CAMetalLayer *)v17 setFramebufferOnly:1];
    [(CAMetalLayer *)v17 setPixelFormat:80];
    if (v8) {
      [(CAMetalLayer *)v17 setPixelFormat:552];
    }
    [(TSDMetalLayer *)v17 setDevice:v15];
  }

  return v17;
}

- (void)setDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSDMetalLayer;
  [(CAMetalLayer *)&v10 setDevice:v4];
  if (v4)
  {
    v5 = (MTLCommandQueue *)[v4 newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v5;

    if (!self->_commandQueue)
    {
      v7 = [MEMORY[0x263F7C7F0] currentHandler];
      BOOL v8 = [NSString stringWithUTF8String:"-[TSDMetalLayer setDevice:]"];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalLayer.m"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 92, @"invalid nil value for '%s'", "_commandQueue");
    }
  }
}

- (id)device
{
  v4.receiver = self;
  v4.super_class = (Class)TSDMetalLayer;
  v2 = [(CAMetalLayer *)&v4 device];
  return v2;
}

- (void)p_drawFrameAtLayerTime:(double)a3
{
  if (!self->_isAnimationStopping)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v6 = [WeakRetained shouldDrawFrameAtLayerTime:a3];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 drawFrameAtLayerTime:a3];
    }
  }
}

- (void)p_drawFrameFromDisplayLink:(id)a3
{
  [(CADisplayLink *)self->_displayLink targetTimestamp];
  -[TSDMetalLayer p_drawFrameAtLayerTime:](self, "p_drawFrameAtLayerTime:");
}

- (void)startAnimation
{
  if (!self->_displayLink)
  {
    v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_p_drawFrameFromDisplayLink_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    int v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF478]];
  }
  self->_isAnimationStopping = 0;
}

- (void)p_performWorkOnMainThread:(id)a3
{
  v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)stopAnimation
{
  self->_isAnimationStopping = 1;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__TSDMetalLayer_stopAnimation__block_invoke;
  v2[3] = &unk_2646B0660;
  v2[4] = self;
  [(TSDMetalLayer *)self p_performWorkOnMainThread:v2];
}

void __30__TSDMetalLayer_stopAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 56) = 0;
}

- (void)pauseAnimation
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __31__TSDMetalLayer_pauseAnimation__block_invoke;
  v2[3] = &unk_2646B0660;
  v2[4] = self;
  [(TSDMetalLayer *)self p_performWorkOnMainThread:v2];
}

void *__31__TSDMetalLayer_pauseAnimation__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (void *)[result setPaused:1];
  }
  return result;
}

- (void)resumeAnimation
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __32__TSDMetalLayer_resumeAnimation__block_invoke;
  v2[3] = &unk_2646B0660;
  v2[4] = self;
  [(TSDMetalLayer *)self p_performWorkOnMainThread:v2];
}

void *__32__TSDMetalLayer_resumeAnimation__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (void *)[result setPaused:0];
  }
  return result;
}

- (void)displayAtCurrentLayerTime
{
  self->_isAnimationStopping = 0;
  if (!self->_displayLink)
  {
    double v3 = CACurrentMediaTime();
    [(TSDMetalLayer *)self p_drawFrameAtLayerTime:v3];
  }
}

- (TSDMetalLayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSDMetalLayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (BOOL)shouldSkipNextDisplayLink
{
  return self->_shouldSkipNextDisplayLink;
}

- (void)setShouldSkipNextDisplayLink:(BOOL)a3
{
  self->_shouldSkipNextDisplayLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end