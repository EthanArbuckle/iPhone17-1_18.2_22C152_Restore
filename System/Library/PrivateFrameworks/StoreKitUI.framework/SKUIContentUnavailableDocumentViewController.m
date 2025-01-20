@interface SKUIContentUnavailableDocumentViewController
- (SKUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3;
- (UIEdgeInsets)_contentInsets;
- (id)_layoutContext;
- (void)_reloadContentUnavailableView:(id)a3 width:(double)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIContentUnavailableDocumentViewController

- (SKUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentUnavailableDocumentViewController initWithTemplateElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  v6 = [(SKUIContentUnavailableDocumentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  [(SKUILayoutCache *)self->_textLayoutCache setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  [(SKUIViewController *)&v3 dealloc];
}

- (void)documentDidUpdate:(id)a3
{
  v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_contentUnavailableView)
  {
    v6 = [(SKUIContentUnavailableTemplateElement *)self->_templateElement style];
    v7 = [v6 ikBackgroundColor];
    id v12 = [v7 color];

    contentUnavailableView = self->_contentUnavailableView;
    if (v12)
    {
      [(SKUIViewReuseView *)self->_contentUnavailableView setBackgroundColor:v12];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(SKUIViewReuseView *)contentUnavailableView setBackgroundColor:v9];
    }
    v10 = self->_contentUnavailableView;
    [(SKUIContentUnavailableView *)v10 bounds];
    [(SKUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:v10 width:v11];
  }
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  [(SKUIContentUnavailableDocumentViewController *)&v14 viewDidLoad];
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    v4 = [(SKUIContentUnavailableTemplateElement *)self->_templateElement style];
    id v5 = [v4 ikBackgroundColor];
    v6 = [v5 color];

    v7 = [SKUIContentUnavailableView alloc];
    v8 = [(SKUIContentUnavailableDocumentViewController *)self view];
    [v8 bounds];
    objc_super v9 = -[SKUIViewReuseView initWithFrame:](v7, "initWithFrame:");
    v10 = self->_contentUnavailableView;
    self->_contentUnavailableView = v9;

    double v11 = self->_contentUnavailableView;
    if (v6)
    {
      [(SKUIViewReuseView *)self->_contentUnavailableView setBackgroundColor:v6];
    }
    else
    {
      id v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(SKUIViewReuseView *)v11 setBackgroundColor:v12];
    }
    contentUnavailableView = self->_contentUnavailableView;
  }
  [(SKUIContentUnavailableView *)contentUnavailableView setAutoresizingMask:18];
  v13 = [(SKUIContentUnavailableDocumentViewController *)self view];
  [v13 addSubview:self->_contentUnavailableView];
}

- (void)viewWillLayoutSubviews
{
  contentUnavailableView = self->_contentUnavailableView;
  [(SKUIContentUnavailableDocumentViewController *)self _contentInsets];
  -[SKUIContentUnavailableView setContentInset:](contentUnavailableView, "setContentInset:");
  v4 = self->_contentUnavailableView;
  if (v4)
  {
    [(SKUIContentUnavailableView *)self->_contentUnavailableView bounds];
    [(SKUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:v4 width:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  [(SKUIContentUnavailableDocumentViewController *)&v6 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  contentUnavailableView = self->_contentUnavailableView;
  id v8 = a4;
  [(SKUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:contentUnavailableView width:width];
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  -[SKUIContentUnavailableDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  contentUnavailableView = self->_contentUnavailableView;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SKUIContentUnavailableDocumentViewController *)self _layoutContext];
  [(SKUIContentUnavailableView *)contentUnavailableView setImage:v7 forArtworkRequest:v8 context:v9];
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  contentUnavailableView = self->_contentUnavailableView;
  templateElement = self->_templateElement;
  [(SKUIContentUnavailableView *)contentUnavailableView bounds];
  double v7 = v6;
  id v8 = [(SKUIContentUnavailableDocumentViewController *)self _layoutContext];
  [(SKUIContentUnavailableView *)contentUnavailableView reloadWithViewElement:templateElement width:v8 context:v7];
}

- (UIEdgeInsets)_contentInsets
{
  objc_super v3 = [(SKUIContentUnavailableDocumentViewController *)self topLayoutGuide];
  [v3 length];
  double v5 = v4;
  double v6 = [(SKUIContentUnavailableDocumentViewController *)self bottomLayoutGuide];
  [v6 length];
  double v8 = v7;

  double v9 = 15.0;
  double v10 = 15.0;
  double v11 = v5;
  double v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    double v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    double v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    double v6 = self->_layoutContext;
    double v7 = [(SKUIViewController *)self clientContext];
    [(SKUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SKUIContentUnavailableTemplateElement *)self->_templateElement elementType]];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    double v8 = objc_alloc_init(SKUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    [(SKUILayoutCache *)self->_textLayoutCache setDelegate:self];
    double v10 = [[SKUIViewElementTextLayoutCache alloc] initWithLayoutCache:self->_textLayoutCache];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v10];
    double v11 = [SKUIResourceLoader alloc];
    double v12 = [(SKUIViewController *)self operationQueue];
    v13 = [(SKUIViewController *)self clientContext];
    objc_super v14 = [(SKUIResourceLoader *)v11 initWithOperationQueue:v12 clientContext:v13];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v14];
    layoutContext = self->_layoutContext;
  }

  return layoutContext;
}

- (void)_reloadContentUnavailableView:(id)a3 width:(double)a4
{
  if (a4 > 0.00000011920929)
  {
    id v6 = a3;
    id v10 = [(SKUIContentUnavailableDocumentViewController *)self _layoutContext];
    double v7 = [v6 tintColor];
    [v10 setTintColor:v7];

    [(id)objc_opt_class() prefetchResourcesForViewElement:self->_templateElement reason:1 context:v10];
    float v8 = a4 + -30.0;
    double v9 = floorf(v8);
    [(id)objc_opt_class() requestLayoutForViewElement:self->_templateElement width:v10 context:v9];
    [(SKUILayoutCache *)self->_textLayoutCache commitLayoutRequests];
    [v6 reloadWithViewElement:self->_templateElement width:v10 context:v9];
    [(SKUIContentUnavailableDocumentViewController *)self _contentInsets];
    objc_msgSend(v6, "setContentInset:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);

  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContentUnavailableDocumentViewController initWithTemplateElement:]";
}

@end