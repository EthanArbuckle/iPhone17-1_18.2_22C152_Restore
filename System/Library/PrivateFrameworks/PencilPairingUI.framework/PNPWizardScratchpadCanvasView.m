@interface PNPWizardScratchpadCanvasView
- (BOOL)showingSnapshot;
- (PKCanvasView)canvasView;
- (PKCanvasViewDelegate)delegate;
- (PKInk)ink;
- (PNPWizardScratchpadCanvasView)initWithFrame:(CGRect)a3;
- (UIGestureRecognizer)drawingGestureRecognizer;
- (void)_playClearAnimationWithImage:(id)a3;
- (void)clearDrawingAnimated;
- (void)layoutSubviews;
- (void)prepareCanvasView;
- (void)setDelegate:(id)a3;
- (void)setInk:(id)a3;
- (void)setShowingSnapshot:(BOOL)a3;
@end

@implementation PNPWizardScratchpadCanvasView

- (void)layoutSubviews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)PNPWizardScratchpadCanvasView;
  [(PNPWizardScratchpadCanvasView *)&v17 layoutSubviews];
  canvasView = self->_canvasView;
  [(PNPWizardScratchpadCanvasView *)self bounds];
  -[PKCanvasView setFrame:](canvasView, "setFrame:");
  v4 = self->_canvasView;
  if ([(PNPWizardScratchpadCanvasView *)self showingSnapshot]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(PKCanvasView *)v4 setAlpha:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_snapshotImageViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        [(PNPWizardScratchpadCanvasView *)self bounds];
        objc_msgSend(v11, "setFrame:");
        if ([(PNPWizardScratchpadCanvasView *)self showingSnapshot]) {
          double v12 = 1.0;
        }
        else {
          double v12 = 0.0;
        }
        [v11 setAlpha:v12];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_playClearAnimationWithImage:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F1C6D0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithImage:v5];

  [(NSMutableArray *)self->_snapshotImageViews addObject:v6];
  [(PNPWizardScratchpadCanvasView *)self addSubview:v6];
  [(PNPWizardScratchpadCanvasView *)self setShowingSnapshot:1];
  canvasView = self->_canvasView;
  uint64_t v8 = objc_opt_new();
  [(PKCanvasView *)canvasView setDrawing:v8];

  [(PNPWizardScratchpadCanvasView *)self layoutIfNeeded];
  uint64_t v9 = (void *)MEMORY[0x263F1CB60];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke;
  v14[3] = &unk_264DA56A0;
  v14[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke_2;
  v11[3] = &unk_264DA5858;
  id v12 = v6;
  long long v13 = self;
  id v10 = v6;
  [v9 _animateUsingDefaultTimingWithOptions:0 animations:v14 completion:v11];
}

uint64_t __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingSnapshot:0];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __62__PNPWizardScratchpadCanvasView__playClearAnimationWithImage___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 40) + 408) removeObject:*(void *)(a1 + 32)];
  v2 = *(void **)(a1 + 40);
  return [v2 setNeedsLayout];
}

- (void)clearDrawingAnimated
{
  [(PNPWizardScratchpadCanvasView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(PNPWizardScratchpadCanvasView *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F14B40]), "initWithSize:scale:", v4, v6, v9);
  v11 = [(PNPWizardScratchpadCanvasView *)self traitCollection];
  objc_msgSend(v10, "setInvertColors:", objc_msgSend(v11, "userInterfaceStyle") == 2);

  id v12 = [(PKCanvasView *)self->_canvasView drawing];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke;
  v13[3] = &unk_264DA5880;
  v13[4] = self;
  [v10 renderDrawing:v12 completion:v13];
}

void __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke_2;
  v5[3] = &unk_264DA5830;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __53__PNPWizardScratchpadCanvasView_clearDrawingAnimated__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playClearAnimationWithImage:*(void *)(a1 + 40)];
}

- (void)setInk:(id)a3
{
  objc_storeStrong((id *)&self->_ink, a3);
  id v5 = a3;
  [(PKCanvasView *)self->_canvasView setInk:v5];
}

- (PKInk)ink
{
  return self->_ink;
}

- (void)setDelegate:(id)a3
{
  p_canvasViewDelegate = &self->_canvasViewDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_canvasViewDelegate, v5);
  [(PKCanvasView *)self->_canvasView setDelegate:v5];
}

- (PKCanvasViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewDelegate);
  return (PKCanvasViewDelegate *)WeakRetained;
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  return [(PKCanvasView *)self->_canvasView drawingGestureRecognizer];
}

- (void)setShowingSnapshot:(BOOL)a3
{
  self->_showingSnapshot = a3;
  [(PNPWizardScratchpadCanvasView *)self setNeedsLayout];
}

- (PNPWizardScratchpadCanvasView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PNPWizardScratchpadCanvasView;
  id v3 = -[PNPWizardScratchpadCanvasView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  snapshotImageViews = v3->_snapshotImageViews;
  v3->_snapshotImageViews = (NSMutableArray *)v4;

  return v3;
}

- (void)prepareCanvasView
{
  if (!self->_canvasView)
  {
    id v3 = (PKCanvasView *)objc_alloc_init(MEMORY[0x263F14AD0]);
    canvasView = self->_canvasView;
    self->_canvasView = v3;

    [(PKCanvasView *)self->_canvasView setOpaque:0];
    [(PNPWizardScratchpadCanvasView *)self addSubview:self->_canvasView];
    [(PKCanvasView *)self->_canvasView setInk:self->_ink];
    id v5 = self->_canvasView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewDelegate);
    [(PKCanvasView *)v5 setDelegate:WeakRetained];
  }
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (BOOL)showingSnapshot
{
  return self->_showingSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_canvasViewDelegate);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_snapshotImageViews, 0);
}

@end