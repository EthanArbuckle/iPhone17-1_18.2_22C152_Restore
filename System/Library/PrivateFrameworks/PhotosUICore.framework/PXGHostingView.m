@interface PXGHostingView
- (OS_dispatch_queue)hostingControllerObservationQueue;
- (PXGHostingController)hostingController;
- (PXGHostingView)initWithFrame:(CGRect)a3;
- (PXPixelBufferView)pixelBufferView;
- (void)_updatePresenter;
- (void)didMoveToWindow;
- (void)hostingController:(id)a3 didRenderFrame:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setHostingController:(id)a3;
@end

@implementation PXGHostingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferView, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

- (PXPixelBufferView)pixelBufferView
{
  return self->_pixelBufferView;
}

- (PXGHostingController)hostingController
{
  return self->_hostingController;
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PXGHostingView *)self hostingController];

  if (v7 == v6)
  {
    v8 = [(PXGHostingView *)self pixelBufferView];
    objc_msgSend(v8, "enqueuePixelBuffer:", objc_msgSend(v9, "pixelBuffer"));
  }
}

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  v2 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (void)setHostingController:(id)a3
{
  v5 = (PXGHostingController *)a3;
  hostingController = self->_hostingController;
  v10 = v5;
  if (hostingController != v5)
  {
    [(PXGHostingController *)hostingController unregisterFrameObserver:self];
    objc_storeStrong((id *)&self->_hostingController, a3);
    id v7 = [(PXGHostingView *)self pixelBufferView];
    [v7 enqueuePixelBuffer:0];

    [(PXGHostingController *)self->_hostingController registerFrameObserver:self];
    v8 = [(PXGHostingController *)v10 addPresenter];
    presenter = self->_presenter;
    self->_presenter = v8;

    [(PXGHostingView *)self setNeedsLayout];
  }
}

- (void)_updatePresenter
{
  presenter = self->_presenter;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__PXGHostingView__updatePresenter__block_invoke;
  v3[3] = &unk_1E5DC3958;
  v3[4] = self;
  [(PXGMutableHostingControllerPresenter *)presenter performChanges:v3];
}

void __34__PXGHostingView__updatePresenter__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v7, "setSize:", v3, v4);
  v5 = [*(id *)(a1 + 32) window];
  id v6 = [v5 screen];

  if (v6)
  {
    [v6 scale];
    objc_msgSend(v7, "setDisplayScale:");
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXGHostingView;
  [(PXGHostingView *)&v3 didMoveToWindow];
  [(PXGHostingView *)self setNeedsLayout];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGHostingView;
  -[PXGHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXGHostingView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PXGHostingView;
  [(PXGHostingView *)&v12 layoutSubviews];
  [(PXGHostingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXGHostingView *)self pixelBufferView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PXGHostingView *)self _updatePresenter];
}

- (PXGHostingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXGHostingView;
  double v3 = -[PXGHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [PXPixelBufferView alloc];
    [(PXGHostingView *)v3 bounds];
    uint64_t v5 = -[PXPixelBufferView initWithFrame:](v4, "initWithFrame:");
    pixelBufferView = v3->_pixelBufferView;
    v3->_pixelBufferView = (PXPixelBufferView *)v5;

    [(PXGHostingView *)v3 addSubview:v3->_pixelBufferView];
    [(PXGHostingView *)v3 setClipsToBounds:1];
  }
  return v3;
}

@end