@interface PXGPPTViewController
- (PXGLayout)initialLayout;
- (PXGPPTViewController)initWithCoder:(id)a3;
- (PXGPPTViewController)initWithLayout:(id)a3;
- (PXGPPTViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXGView)gridView;
- (void)_handleDoubleTap:(id)a3;
- (void)animate:(id)a3 animationRenderingCompletionHandler:(id)a4 proceedHandler:(id)a5;
- (void)viewDidLoad;
@end

@implementation PXGPPTViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLayout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

- (PXGLayout)initialLayout
{
  return self->_initialLayout;
}

- (void)_handleDoubleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PXGPPTViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)animate:(id)a3 animationRenderingCompletionHandler:(id)a4 proceedHandler:(id)a5
{
  v8 = (void (**)(id, void *))a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PXGPPTViewController *)self gridView];
  if (v8) {
    v8[2](v8, v11);
  }
  v12 = [v11 rootLayout];
  [v12 setNeedsUpdate];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PXGPPTViewController_animate_animationRenderingCompletionHandler_proceedHandler___block_invoke;
  v15[3] = &unk_1E5DCC5D0;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  [v11 installAnimationRenderingCompletionHandler:v15];
}

void __83__PXGPPTViewController_animate_animationRenderingCompletionHandler_proceedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = MEMORY[0x1E4F14428];
    dispatch_async(v4, v3);
  }
}

- (PXGView)gridView
{
  [(PXGPPTViewController *)self loadViewIfNeeded];
  gridView = self->_gridView;
  return gridView;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PXGPPTViewController;
  [(PXGPPTViewController *)&v10 viewDidLoad];
  v3 = [(PXGPPTViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];

  v5 = [PXGView alloc];
  [v3 bounds];
  v6 = -[PXGView initWithFrame:](v5, "initWithFrame:");
  gridView = self->_gridView;
  self->_gridView = v6;

  v8 = [(PXGPPTViewController *)self initialLayout];
  [(PXGView *)self->_gridView setRootLayout:v8];

  [(PXGView *)self->_gridView setAutoresizingMask:2];
  [(PXGView *)self->_gridView registerAllTextureProvidersWithMediaProvider:0];
  [v3 addSubview:self->_gridView];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDoubleTap_];
  [v9 setNumberOfTapsRequired:2];
  [v3 addGestureRecognizer:v9];
}

- (PXGPPTViewController)initWithLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTViewController;
  v6 = [(PXGPPTViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initialLayout, a3);
    [(PXGPPTViewController *)v7 setModalPresentationStyle:0];
  }

  return v7;
}

- (PXGPPTViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPPTViewController.m", 27, @"%s is not available as initializer", "-[PXGPPTViewController initWithCoder:]");

  abort();
}

- (PXGPPTViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPPTViewController.m", 23, @"%s is not available as initializer", "-[PXGPPTViewController initWithNibName:bundle:]");

  abort();
}

@end