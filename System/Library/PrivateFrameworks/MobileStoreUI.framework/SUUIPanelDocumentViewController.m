@interface SUUIPanelDocumentViewController
- (SUUIPanelDocumentViewController)initWithTemplateElement:(id)a3;
- (id)_activeBackgroundColor;
- (id)_imageForBackgroundImageElement:(id)a3;
- (id)_layoutContext;
- (id)_templateBackgroundColor;
- (id)contentScrollView;
- (id)impressionableViewElements;
- (void)_keyboardHideNotification:(id)a3;
- (void)_keyboardWillChangeNotification:(id)a3;
- (void)_layoutBackgroundImageView;
- (void)_layoutScrollView;
- (void)_reloadBackgroundImageView;
- (void)_reloadContentSize;
- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3;
- (void)_requestPanelViewLayoutWithContentWidth:(int64_t)a3 forced:(BOOL)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIPanelDocumentViewController

- (SUUIPanelDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPanelDocumentViewController;
  v6 = [(SUUIPanelDocumentViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_lastContentWidth = -1;
    objc_storeStrong((id *)&v6->_templateElement, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__keyboardHideNotification_ name:*MEMORY[0x263F837A0] object:0];
    [v8 addObserver:v7 selector:sel__keyboardHideNotification_ name:*MEMORY[0x263F83800] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillChangeNotification_ name:*MEMORY[0x263F837F8] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillChangeNotification_ name:*MEMORY[0x263F83808] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  [(SUUILayoutCache *)self->_textLayoutCache setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIViewController *)&v4 dealloc];
}

- (id)contentScrollView
{
  return self->_scrollView;
}

- (void)loadView
{
  id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
  v3 = [(SUUIPanelDocumentViewController *)self _templateBackgroundColor];
  [v13 setBackgroundColor:v3];

  [v13 setPreservesSuperviewLayoutMargins:1];
  if (!self->_panelView)
  {
    objc_super v4 = objc_alloc_init(SUUIPanelView);
    panelView = self->_panelView;
    self->_panelView = v4;

    v6 = self->_panelView;
    v7 = [(SUUIPanelDocumentViewController *)self _activeBackgroundColor];
    [(SUUIViewReuseView *)v6 setBackgroundColor:v7];

    [(SUUIPanelView *)self->_panelView setPreservesSuperviewLayoutMargins:1];
  }
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v9 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    objc_super v10 = self->_scrollView;
    self->_scrollView = v9;

    [(UIScrollView *)self->_scrollView setAlwaysBounceHorizontal:0];
    [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:0];
    v11 = self->_scrollView;
    v12 = [(SUUIPanelDocumentViewController *)self _activeBackgroundColor];
    [(UIScrollView *)v11 setBackgroundColor:v12];

    [(UIScrollView *)self->_scrollView setPreservesSuperviewLayoutMargins:1];
    [(UIScrollView *)self->_scrollView addSubview:self->_panelView];
    scrollView = self->_scrollView;
  }
  [v13 addSubview:scrollView];
  [(SUUIPanelDocumentViewController *)self setView:v13];
  [(SUUIPanelDocumentViewController *)self _reloadBackgroundImageView];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(SUUIMetricsImpressionSession);
  metricsImpressionSession = self->_metricsImpressionSession;
  self->_metricsImpressionSession = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = [(SUUIPanelTemplateViewElement *)self->_templateElement children];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SUUIMetricsImpressionSession *)self->_metricsImpressionSession beginActiveImpressionForViewElement:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIPanelDocumentViewController *)&v12 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(SUUIPanelTemplateViewElement *)self->_templateElement children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SUUIMetricsImpressionSession *)self->_metricsImpressionSession endActiveImpressionForViewElement:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  metricsImpressionSession = self->_metricsImpressionSession;
  self->_metricsImpressionSession = 0;

  self->_didAttemptBecomeFirstResponder = 0;
  v11.receiver = self;
  v11.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIPanelDocumentViewController *)&v11 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  if (!self->_didAttemptBecomeFirstResponder)
  {
    if ([(SUUIPanelView *)self->_panelView canBecomeFirstResponder])
    {
      UIKeyboardOrderInAutomatic();
      [(SUUIPanelView *)self->_panelView becomeFirstResponder];
    }
    self->_didAttemptBecomeFirstResponder = 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIPanelDocumentViewController *)&v3 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIPanelDocumentViewController *)self _layoutScrollView];
  if (self->_panelView)
  {
    [(UIScrollView *)self->_scrollView bounds];
    -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIViewController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didAttemptBecomeFirstResponder = 0;
  [(SUUIPanelView *)self->_panelView resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIPanelDocumentViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  [(SUUIPanelDocumentViewController *)self _layoutBackgroundImageView];
  [(SUUIPanelDocumentViewController *)self _layoutScrollView];
  if (self->_panelView) {
    [(SUUIPanelDocumentViewController *)self _reloadContentSize];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIPanelDocumentViewController;
  [(SUUIPanelDocumentViewController *)&v3 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", width, height);
  v8.receiver = self;
  v8.super_class = (Class)SUUIPanelDocumentViewController;
  -[SUUIPanelDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(SUUIPanelTemplateViewElement *)self->_templateElement backgroundImageElement];
  objc_super v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 resourceCacheKey];
    uint64_t v10 = [v14 cacheKey];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      [(UIImageView *)self->_backgroundImageView setImage:v6];
      [(SUUIPanelDocumentViewController *)self _layoutBackgroundImageView];
    }
  }
  panelView = self->_panelView;
  long long v13 = [(SUUIPanelDocumentViewController *)self _layoutContext];
  [(SUUIPanelView *)panelView setImage:v6 forArtworkRequest:v14 context:v13];
}

- (void)documentDidUpdate:(id)a3
{
  objc_super v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  id v11 = [(SUUIPanelDocumentViewController *)self _activeBackgroundColor];
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:");
  panelView = self->_panelView;
  if (panelView)
  {
    [(SUUIViewReuseView *)panelView setBackgroundColor:v11];
    [(UIScrollView *)self->_scrollView bounds];
    -[SUUIPanelDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v7, v8);
  }
  if ([(SUUIPanelDocumentViewController *)self isViewLoaded])
  {
    [(SUUIPanelDocumentViewController *)self _reloadBackgroundImageView];
    uint64_t v9 = [(SUUIPanelDocumentViewController *)self view];
    uint64_t v10 = [(SUUIPanelDocumentViewController *)self _templateBackgroundColor];
    [v9 setBackgroundColor:v10];
  }
}

- (id)impressionableViewElements
{
  return (id)[(SUUIPanelTemplateViewElement *)self->_templateElement children];
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  panelView = self->_panelView;
  templateElement = self->_templateElement;
  [(UIScrollView *)self->_scrollView bounds];
  double v7 = v6;
  id v8 = [(SUUIPanelDocumentViewController *)self _layoutContext];
  [(SUUIPanelView *)panelView reloadWithViewElement:templateElement width:v8 context:v7];
}

- (void)_keyboardHideNotification:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_keyboardFrame.size = v4;
  [(SUUIPanelDocumentViewController *)self _layoutScrollView];
  [(SUUIPanelDocumentViewController *)self _reloadContentSize];
}

- (void)_keyboardWillChangeNotification:(id)a3
{
  CGSize v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  objc_super v5 = v10;
  if (v10)
  {
    [v10 CGRectValue];
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.double width = v8;
    self->_keyboardFrame.size.double height = v9;
    [(SUUIPanelDocumentViewController *)self _layoutScrollView];
    [(SUUIPanelDocumentViewController *)self _reloadContentSize];
    objc_super v5 = v10;
  }
}

- (id)_activeBackgroundColor
{
  objc_super v3 = [(SUUIPanelTemplateViewElement *)self->_templateElement backgroundImageElement];
  if (v3) {
    [MEMORY[0x263F825C8] clearColor];
  }
  else {
  CGSize v4 = [(SUUIPanelDocumentViewController *)self _templateBackgroundColor];
  }

  return v4;
}

- (id)_imageForBackgroundImageElement:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUUIPanelDocumentViewController *)self _layoutContext];
  CGFloat v6 = [v5 resourceLoader];

  CGFloat v7 = [v4 resourceName];
  if ([v7 length])
  {
    SUUIImageWithResourceName(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGFloat v9 = [v4 resourceCacheKey];
    id v10 = [v6 requestIdentifierForCacheKey:v9];
    id v11 = v10;
    if (v10)
    {
      objc_msgSend(v6, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v11, "unsignedIntegerValue")))
      {

        long long v12 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      id v8 = 0;
    }
    long long v13 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIResourceRequest *)v13 setCacheKey:v9];
    id v14 = +[SSVURLDataConsumer consumer];
    [(SUUIArtworkRequest *)v13 setDataConsumer:v14];

    [(SUUIArtworkRequest *)v13 setDelegate:self];
    long long v15 = [v4 URL];
    [(SUUIArtworkRequest *)v13 setURL:v15];

    [v6 loadResourceWithRequest:v13 reason:1];
  }
  id v8 = v8;
  long long v12 = v8;
LABEL_9:

  return v12;
}

- (void)_layoutBackgroundImageView
{
  if (!self->_backgroundImageView) {
    return;
  }
  objc_super v3 = [(SUUIPanelDocumentViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v19 = [(UIImageView *)self->_backgroundImageView image];
  if ([(UIImageView *)self->_backgroundImageView contentMode] != 2 && v19)
  {
    [v19 size];
    *(float *)&double v12 = v13 * (v9 / v12);
    double v14 = floorf(*(float *)&v12);
    long long v15 = [(SUUIPanelTemplateViewElement *)self->_templateElement backgroundImageElement];
    long long v16 = [v15 style];
    unint64_t v17 = [v16 elementPosition];

    double v18 = 0.0;
    if (v17 <= 9)
    {
      if (((1 << v17) & 0x33) != 0)
      {
        double v7 = floor((v11 - v14) * 0.5);
LABEL_12:
        double v11 = v14;
        goto LABEL_13;
      }
      if (((1 << v17) & 0x308) != 0)
      {
        v21.origin.x = v5;
        v21.origin.y = v7;
        v21.size.double width = v9;
        v21.size.double height = v11;
        double v7 = CGRectGetMaxY(v21) - v14;
        goto LABEL_12;
      }
    }
    double v7 = 0.0;
    goto LABEL_12;
  }
  double v18 = v5;
LABEL_13:
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v18, v7, v9, v11);
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    double v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    CGFloat v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    double v6 = self->_layoutContext;
    double v7 = [(SUUIViewController *)self clientContext];
    [(SUUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SUUIPanelTemplateViewElement *)self->_templateElement elementType]];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    double v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    [(SUUILayoutCache *)self->_textLayoutCache setDelegate:self];
    double v10 = [[SUUIViewElementTextLayoutCache alloc] initWithLayoutCache:self->_textLayoutCache];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v10];
    double v11 = [SUUIResourceLoader alloc];
    double v12 = [(SUUIViewController *)self clientContext];
    double v13 = [(SUUIResourceLoader *)v11 initWithClientContext:v12];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v13];
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_layoutScrollView
{
  objc_super v3 = [(SUUIPanelDocumentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  scrollView = self->_scrollView;
  double v13 = v11 - self->_keyboardFrame.size.height;
  -[UIScrollView setFrame:](scrollView, "setFrame:", v5, v7, v9, v13);
}

- (void)_reloadBackgroundImageView
{
  objc_super v3 = [(SUUIPanelTemplateViewElement *)self->_templateElement backgroundImageElement];
  backgroundImageView = self->_backgroundImageView;
  id v16 = v3;
  if (v3)
  {
    if (!backgroundImageView)
    {
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      double v6 = self->_backgroundImageView;
      self->_backgroundImageView = v5;

      [(UIImageView *)self->_backgroundImageView setClipsToBounds:1];
      double v7 = [(SUUIPanelDocumentViewController *)self view];
      [v7 insertSubview:self->_backgroundImageView atIndex:0];

      objc_super v3 = v16;
    }
    double v8 = [v3 style];
    uint64_t v9 = [v8 fillImage];

    if (v9 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [(UIImageView *)self->_backgroundImageView setContentMode:v10];
    double v11 = self->_backgroundImageView;
    double v12 = [(SUUIPanelDocumentViewController *)self _templateBackgroundColor];
    [(UIImageView *)v11 setBackgroundColor:v12];

    double v13 = self->_backgroundImageView;
    double v14 = [(SUUIPanelDocumentViewController *)self _imageForBackgroundImageElement:v16];
    [(UIImageView *)v13 setImage:v14];

    [(SUUIPanelDocumentViewController *)self _layoutBackgroundImageView];
  }
  else
  {
    [(UIImageView *)backgroundImageView removeFromSuperview];
    long long v15 = self->_backgroundImageView;
    self->_backgroundImageView = 0;
  }
}

- (void)_reloadContentSize
{
  [(UIScrollView *)self->_scrollView contentInset];
  double v4 = v3;
  double v6 = v5;
  [(SUUIPanelView *)self->_panelView layoutMargins];
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView bounds];
  double v13 = v11;
  double v14 = 0.0;
  if (self->_keyboardFrame.size.height < 0.00000011920929) {
    double v14 = v6;
  }
  double v15 = v12 - v4 - v14;
  float v16 = v11 - v8 - v10;
  uint64_t v17 = vcvtms_s32_f32(v16);
  [(SUUIPanelDocumentViewController *)self _requestPanelViewLayoutWithContentWidth:v17 forced:0];
  double v18 = *MEMORY[0x263F001A8];
  double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
  v20 = objc_opt_class();
  double v21 = (double)v17;
  templateElement = self->_templateElement;
  v23 = [(SUUIPanelDocumentViewController *)self _layoutContext];
  [v20 sizeThatFitsWidth:templateElement viewElement:v23 context:v21];
  double v25 = v24;
  double v27 = v26;

  if (v27 < v15) {
    double v27 = v15;
  }
  if (v25 < v13) {
    double v25 = v13;
  }
  -[SUUIPanelView setFrame:](self->_panelView, "setFrame:", v18, v19, v25, v27);
  scrollView = self->_scrollView;
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v25, v27);
}

- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3
{
  double width = a3.width;
  if (self->_panelView) {
    BOOL v4 = a3.width <= 0.00000011920929;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v12 = [(SUUIPanelDocumentViewController *)self _layoutContext];
    double v6 = [(SUUIPanelView *)self->_panelView tintColor];
    [v12 setTintColor:v6];

    [(id)objc_opt_class() prefetchResourcesForViewElement:self->_templateElement reason:1 context:v12];
    [(SUUIPanelView *)self->_panelView layoutMargins];
    double v8 = v7;
    double v10 = v9;
    [(SUUIPanelView *)self->_panelView setLayoutMargins:0.0];
    float v11 = width - v8 - v10;
    [(SUUIPanelDocumentViewController *)self _requestPanelViewLayoutWithContentWidth:vcvtms_s32_f32(v11) forced:1];
    [(SUUIPanelDocumentViewController *)self _reloadContentSize];
  }
}

- (void)_requestPanelViewLayoutWithContentWidth:(int64_t)a3 forced:(BOOL)a4
{
  if (a4 || self->_lastContentWidth != a3)
  {
    id v6 = [(SUUIPanelDocumentViewController *)self _layoutContext];
    [(id)objc_opt_class() requestLayoutForViewElement:self->_templateElement width:v6 context:(double)a3];
    [(SUUILayoutCache *)self->_textLayoutCache commitLayoutRequests];
    [(SUUIPanelView *)self->_panelView reloadWithViewElement:self->_templateElement width:v6 context:(double)a3];
    self->_lastContentWidth = a3;
  }
}

- (id)_templateBackgroundColor
{
  v2 = [(SUUIPanelTemplateViewElement *)self->_templateElement style];
  double v3 = [v2 ikBackgroundColor];
  BOOL v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_panelView, 0);
  objc_storeStrong((id *)&self->_metricsImpressionSession, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end