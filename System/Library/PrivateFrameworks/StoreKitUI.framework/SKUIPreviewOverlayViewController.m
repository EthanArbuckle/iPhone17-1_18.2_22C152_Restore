@interface SKUIPreviewOverlayViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (SKUIPreviewOverlayViewController)initWithDocument:(id)a3;
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

@implementation SKUIPreviewOverlayViewController

- (SKUIPreviewOverlayViewController)initWithDocument:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewOverlayViewController initWithDocument:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewOverlayViewController;
  v6 = [(SKUIPreviewOverlayViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    v8 = +[SKUIItemStateCenter defaultCenter];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  [(SKUILayoutCache *)self->_layoutCache setDelegate:0];
  [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  v3 = [(UITapGestureRecognizer *)self->_tapGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_tapGestureRecognizer];

  v4 = +[SKUIItemStateCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SKUIPreviewOverlayViewController;
  [(SKUIViewController *)&v5 dealloc];
}

- (void)prepareOverlayView
{
  if (!self->_layoutContext)
  {
    v3 = objc_alloc_init(SKUIViewElementLayoutContext);
    layoutContext = self->_layoutContext;
    self->_layoutContext = v3;

    objc_super v5 = self->_layoutContext;
    v6 = [NSNumber numberWithInteger:self->_backgroundStyle];
    [(SKUIViewElementLayoutContext *)v5 setAggregateValue:v6 forKey:0x1F1C92668];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    v7 = [(SKUIViewController *)self clientContext];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setClientContext:v7];
    v8 = [SKUIResourceLoader alloc];
    v9 = [(SKUIViewController *)self operationQueue];
    objc_super v10 = [(SKUIResourceLoader *)v8 initWithOperationQueue:v9 clientContext:v7];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v10];
    v11 = [SKUIViewElementTextLayoutCache alloc];
    v12 = [(SKUIPreviewOverlayViewController *)self _layoutCache];
    v13 = [(SKUIViewElementTextLayoutCache *)v11 initWithLayoutCache:v12];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v13];
  }
  id v16 = [(IKAppDocument *)self->_document templateElement];
  v14 = [v16 previewLockup];
  [(SKUIPreviewOverlayViewController *)self _overlayWidth];
  +[SKUIHorizontalLockupView requestLayoutForViewElement:width:context:](SKUIHorizontalLockupView, "requestLayoutForViewElement:width:context:", v14, self->_layoutContext);
  +[SKUIHorizontalLockupView prefetchResourcesForViewElement:v14 reason:0 context:self->_layoutContext];
  v15 = [(SKUIPreviewOverlayViewController *)self _layoutCache];
  [v15 commitLayoutRequests];
}

- (void)reloadOverlayView
{
  v3 = [(IKAppDocument *)self->_document templateElement];
  id v5 = [v3 previewLockup];

  lockupView = self->_lockupView;
  [(SKUIPreviewOverlayViewController *)self _overlayWidth];
  -[SKUIHorizontalLockupView reloadWithViewElement:width:context:](lockupView, "reloadWithViewElement:width:context:", v5, self->_layoutContext);
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
  layoutContext = self->_layoutContext;
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SKUIViewElementLayoutContext *)layoutContext setAggregateValue:v4 forKey:0x1F1C92668];
}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_previewStatus, a3);
  id v7 = a3;
  [(SKUIHorizontalLockupView *)self->_lockupView showPreviewProgressWithStatus:v7 animated:v4];
}

- (void)loadView
{
  [(SKUIPreviewOverlayViewController *)self _overlayWidth];
  double v4 = v3;
  id v5 = [(IKAppDocument *)self->_document templateElement];
  id v17 = [v5 previewLockup];

  if (!self->_lockupView)
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    +[SKUIHorizontalLockupView sizeThatFitsWidth:v17 viewElement:self->_layoutContext context:v4];
    if (v9 >= 44.0) {
      double v10 = v9;
    }
    else {
      double v10 = 44.0;
    }
    v11 = -[SKUIHorizontalLockupView initWithFrame:]([SKUIHorizontalLockupView alloc], "initWithFrame:", v6, v7, v8, v10);
    lockupView = self->_lockupView;
    self->_lockupView = v11;

    v13 = self->_lockupView;
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIHorizontalLockupView *)v13 setBackgroundColor:v14];

    -[SKUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    [(SKUIHorizontalLockupView *)self->_lockupView reloadWithViewElement:v17 width:self->_layoutContext context:v4];
    [(SKUIHorizontalLockupView *)self->_lockupView showPreviewProgressWithStatus:self->_previewStatus animated:0];
    [(SKUIHorizontalLockupView *)self->_lockupView setUpdateLayoutOnButtonConfirmation:1];
  }
  if (!self->_tapGestureRecognizer)
  {
    v15 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapAction_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v15;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    [(SKUIHorizontalLockupView *)self->_lockupView addGestureRecognizer:self->_tapGestureRecognizer];
  }
  [(SKUIPreviewOverlayViewController *)self setView:self->_lockupView];
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (self->_lockupView)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__SKUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke;
    v7[3] = &unk_1E6421FF8;
    id v8 = v5;
    double v9 = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __70__SKUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
      uint64_t v6 = [MEMORY[0x1E4FB8890] sessionManager];
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
    uint64_t v4 = objc_alloc_init(SKUILayoutCache);
    uint64_t v5 = self->_layoutCache;
    self->_layoutCache = v4;

    [(SKUILayoutCache *)self->_layoutCache setDelegate:self];
    layoutCache = self->_layoutCache;
  }

  return layoutCache;
}

- (double)_overlayWidth
{
  id v2 = [(SKUIViewController *)self clientContext];
  uint64_t v3 = SKUIUserInterfaceIdiom(v2);

  if (v3 == 1) {
    return 290.0;
  }
  uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
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

- (void)initWithDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPreviewOverlayViewController initWithDocument:]";
}

@end