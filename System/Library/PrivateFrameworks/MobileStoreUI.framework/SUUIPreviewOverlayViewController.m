@interface SUUIPreviewOverlayViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (SUUIPreviewOverlayViewController)initWithDocument:(id)a3;
- (double)_overlayWidth;
- (id)_layoutCache;
- (int64_t)backgroundStyle;
- (void)_tapAction:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)loadView;
- (void)prepareOverlayView;
- (void)reloadOverlayView;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4;
@end

@implementation SUUIPreviewOverlayViewController

- (SUUIPreviewOverlayViewController)initWithDocument:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPreviewOverlayViewController;
  v6 = [(SUUIPreviewOverlayViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    v8 = +[SUUIItemStateCenter defaultCenter];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  [(SUUILayoutCache *)self->_layoutCache setDelegate:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  v3 = [(UITapGestureRecognizer *)self->_tapGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_tapGestureRecognizer];

  v4 = +[SUUIItemStateCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SUUIPreviewOverlayViewController;
  [(SUUIViewController *)&v5 dealloc];
}

- (void)prepareOverlayView
{
  if (!self->_layoutContext)
  {
    v3 = objc_alloc_init(SUUIViewElementLayoutContext);
    layoutContext = self->_layoutContext;
    self->_layoutContext = v3;

    objc_super v5 = self->_layoutContext;
    v6 = [NSNumber numberWithInteger:self->_backgroundStyle];
    [(SUUIViewElementLayoutContext *)v5 setAggregateValue:v6 forKey:0x270502710];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    v7 = [(SUUIViewController *)self clientContext];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setClientContext:v7];
    v8 = [SUUIResourceLoader alloc];
    v9 = [(SUUIViewController *)self operationQueue];
    objc_super v10 = [(SUUIResourceLoader *)v8 initWithOperationQueue:v9 clientContext:v7];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v10];
    v11 = [SUUIViewElementTextLayoutCache alloc];
    v12 = [(SUUIPreviewOverlayViewController *)self _layoutCache];
    v13 = [(SUUIViewElementTextLayoutCache *)v11 initWithLayoutCache:v12];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v13];
  }
  id v16 = [(IKAppDocument *)self->_document templateElement];
  v14 = [v16 previewLockup];
  [(SUUIPreviewOverlayViewController *)self _overlayWidth];
  +[SUUIHorizontalLockupView requestLayoutForViewElement:width:context:](SUUIHorizontalLockupView, "requestLayoutForViewElement:width:context:", v14, self->_layoutContext);
  +[SUUIHorizontalLockupView prefetchResourcesForViewElement:v14 reason:0 context:self->_layoutContext];
  v15 = [(SUUIPreviewOverlayViewController *)self _layoutCache];
  [v15 commitLayoutRequests];
}

- (void)reloadOverlayView
{
  v3 = [(IKAppDocument *)self->_document templateElement];
  id v5 = [v3 previewLockup];

  lockupView = self->_lockupView;
  [(SUUIPreviewOverlayViewController *)self _overlayWidth];
  -[SUUIHorizontalLockupView reloadWithViewElement:width:context:](lockupView, "reloadWithViewElement:width:context:", v5, self->_layoutContext);
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
  layoutContext = self->_layoutContext;
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SUUIViewElementLayoutContext *)layoutContext setAggregateValue:v4 forKey:0x270502710];
}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_previewStatus, a3);
  id v7 = a3;
  [(SUUIHorizontalLockupView *)self->_lockupView showPreviewProgressWithStatus:v7 animated:v4];
}

- (void)loadView
{
  [(SUUIPreviewOverlayViewController *)self _overlayWidth];
  double v4 = v3;
  id v5 = [(IKAppDocument *)self->_document templateElement];
  id v17 = [v5 previewLockup];

  if (!self->_lockupView)
  {
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    +[SUUIHorizontalLockupView sizeThatFitsWidth:v17 viewElement:self->_layoutContext context:v4];
    if (v9 >= 44.0) {
      double v10 = v9;
    }
    else {
      double v10 = 44.0;
    }
    v11 = -[SUUIHorizontalLockupView initWithFrame:]([SUUIHorizontalLockupView alloc], "initWithFrame:", v6, v7, v8, v10);
    lockupView = self->_lockupView;
    self->_lockupView = v11;

    v13 = self->_lockupView;
    v14 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIHorizontalLockupView *)v13 setBackgroundColor:v14];

    -[SUUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    [(SUUIHorizontalLockupView *)self->_lockupView reloadWithViewElement:v17 width:self->_layoutContext context:v4];
    [(SUUIHorizontalLockupView *)self->_lockupView showPreviewProgressWithStatus:self->_previewStatus animated:0];
    [(SUUIHorizontalLockupView *)self->_lockupView setUpdateLayoutOnButtonConfirmation:1];
  }
  if (!self->_tapGestureRecognizer)
  {
    v15 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tapAction_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v15;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    [(SUUIHorizontalLockupView *)self->_lockupView addGestureRecognizer:self->_tapGestureRecognizer];
  }
  [(SUUIPreviewOverlayViewController *)self setView:self->_lockupView];
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (self->_lockupView)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__SUUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke;
    v7[3] = &unk_265400890;
    id v8 = v5;
    double v9 = self;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __70__SUUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1080), "updateWithItemState:context:animated:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void *)(*(void *)(a1 + 40) + 1072), 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_tapAction:(id)a3
{
  if ([a3 state] == 3)
  {
    id v8 = [(IKAppDocument *)self->_document templateElement];
    uint64_t v4 = [v8 previewURLString];
    if (v4)
    {
      uint64_t v5 = (void *)[objc_alloc(NSURL) initWithString:v4];
      uint64_t v6 = [MEMORY[0x263F895C8] sessionManager];
      long long v7 = [v6 endSessionForURL:v5];

      [v7 stop];
    }
  }
}

- (id)_layoutCache
{
  layoutCache = self->_layoutCache;
  if (!layoutCache)
  {
    uint64_t v4 = objc_alloc_init(SUUILayoutCache);
    uint64_t v5 = self->_layoutCache;
    self->_layoutCache = v4;

    [(SUUILayoutCache *)self->_layoutCache setDelegate:self];
    layoutCache = self->_layoutCache;
  }
  return layoutCache;
}

- (double)_overlayWidth
{
  id v2 = [(SUUIViewController *)self clientContext];
  uint64_t v3 = SUUIUserInterfaceIdiom(v2);

  if (v3 == 1) {
    return 290.0;
  }
  uint64_t v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  double v7 = v6;

  return v7 + -30.0;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewStatus, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end