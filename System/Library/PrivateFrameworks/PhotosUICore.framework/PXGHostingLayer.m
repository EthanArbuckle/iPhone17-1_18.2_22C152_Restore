@interface PXGHostingLayer
- (OS_dispatch_queue)hostingControllerObservationQueue;
- (PXGHostingController)hostingController;
- (PXGHostingLayer)init;
- (PXGHostingLayerVisibilityInfo)visibilityInfo;
- (void)_updatePresenter;
- (void)hostingController:(id)a3 didRenderFrame:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setHostingController:(id)a3;
- (void)setVisibilityInfo:(id)a3;
@end

@implementation PXGHostingLayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityInfo, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

- (PXGHostingLayerVisibilityInfo)visibilityInfo
{
  return self->_visibilityInfo;
}

- (PXGHostingController)hostingController
{
  return self->_hostingController;
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "pixelBuffer", a3);
  [(PXImageQueueLayer *)self setPixelBuffer:v5];
}

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  return [(PXGHostingController *)self->_hostingController layoutQueue];
}

- (void)_updatePresenter
{
  v3 = [(PXGHostingLayer *)self visibilityInfo];
  v4 = v3;
  if (v3 && ![v3 isVisible])
  {
    presenter = self->_presenter;
    if (presenter)
    {
      self->_presenter = 0;
      goto LABEL_7;
    }
  }
  else if (!self->_presenter)
  {
    presenter = [(PXGHostingLayer *)self hostingController];
    v6 = [presenter addPresenter];
    v7 = self->_presenter;
    self->_presenter = v6;

LABEL_7:
  }
  v8 = self->_presenter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PXGHostingLayer__updatePresenter__block_invoke;
  v9[3] = &unk_1E5DC3958;
  v9[4] = self;
  [(PXGMutableHostingControllerPresenter *)v8 performChanges:v9];
}

void __35__PXGHostingLayer__updatePresenter__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 bounds];
  objc_msgSend(v6, "setSize:", v4, v5);
  [*(id *)(a1 + 32) contentsScale];
  objc_msgSend(v6, "setDisplayScale:");
}

- (void)setContentsScale:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGHostingLayer;
  [(PXGHostingLayer *)&v4 setContentsScale:a3];
  [(PXGHostingLayer *)self _updatePresenter];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGHostingLayer;
  -[PXGHostingLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXGHostingLayer *)self _updatePresenter];
}

- (void)setVisibilityInfo:(id)a3
{
  double v5 = (PXGHostingLayerVisibilityInfo *)a3;
  visibilityInfo = self->_visibilityInfo;
  v7 = v5;
  if (visibilityInfo != v5)
  {
    [(PXGHostingLayerVisibilityInfo *)visibilityInfo setDelegate:0];
    objc_storeStrong((id *)&self->_visibilityInfo, a3);
    [(PXGHostingLayerVisibilityInfo *)v7 setDelegate:self];
    [(PXGHostingLayer *)self _updatePresenter];
  }
}

- (void)setHostingController:(id)a3
{
  id v6 = (PXGHostingController *)a3;
  if (self->_hostingController != v6)
  {
    objc_storeStrong((id *)&self->_hostingController, a3);
    double v5 = [(PXGHostingController *)v6 lastFrame];
    -[PXImageQueueLayer setPixelBuffer:](self, "setPixelBuffer:", [v5 pixelBuffer]);

    [(PXGHostingController *)v6 registerFrameObserver:self];
    [(PXGHostingLayer *)self _updatePresenter];
  }
}

- (PXGHostingLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXGHostingLayer;
  v2 = [(PXImageQueueLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PXGHostingLayer *)v2 setMasksToBounds:1];
  }
  return v3;
}

@end