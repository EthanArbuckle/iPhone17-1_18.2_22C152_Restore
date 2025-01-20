@interface SUUIContentUnavailableDocumentViewController
- (SUUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3;
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

@implementation SUUIContentUnavailableDocumentViewController

- (SUUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  v6 = [(SUUIContentUnavailableDocumentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  [(SUUILayoutCache *)self->_textLayoutCache setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  [(SUUIViewController *)&v3 dealloc];
}

- (void)documentDidUpdate:(id)a3
{
  v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_contentUnavailableView)
  {
    v6 = [(SUUIContentUnavailableTemplateElement *)self->_templateElement style];
    v7 = [v6 ikBackgroundColor];
    id v12 = [v7 color];

    contentUnavailableView = self->_contentUnavailableView;
    if (v12)
    {
      [(SUUIViewReuseView *)self->_contentUnavailableView setBackgroundColor:v12];
    }
    else
    {
      objc_super v9 = [MEMORY[0x263F825C8] systemBackgroundColor];
      [(SUUIViewReuseView *)contentUnavailableView setBackgroundColor:v9];
    }
    v10 = self->_contentUnavailableView;
    [(SUUIContentUnavailableView *)v10 bounds];
    [(SUUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:v10 width:v11];
  }
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  [(SUUIContentUnavailableDocumentViewController *)&v14 viewDidLoad];
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    v4 = [(SUUIContentUnavailableTemplateElement *)self->_templateElement style];
    id v5 = [v4 ikBackgroundColor];
    v6 = [v5 color];

    v7 = [SUUIContentUnavailableView alloc];
    v8 = [(SUUIContentUnavailableDocumentViewController *)self view];
    [v8 bounds];
    objc_super v9 = -[SUUIViewReuseView initWithFrame:](v7, "initWithFrame:");
    v10 = self->_contentUnavailableView;
    self->_contentUnavailableView = v9;

    double v11 = self->_contentUnavailableView;
    if (v6)
    {
      [(SUUIViewReuseView *)self->_contentUnavailableView setBackgroundColor:v6];
    }
    else
    {
      id v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
      [(SUUIViewReuseView *)v11 setBackgroundColor:v12];
    }
    contentUnavailableView = self->_contentUnavailableView;
  }
  [(SUUIContentUnavailableView *)contentUnavailableView setAutoresizingMask:18];
  v13 = [(SUUIContentUnavailableDocumentViewController *)self view];
  [v13 addSubview:self->_contentUnavailableView];
}

- (void)viewWillLayoutSubviews
{
  contentUnavailableView = self->_contentUnavailableView;
  [(SUUIContentUnavailableDocumentViewController *)self _contentInsets];
  -[SUUIContentUnavailableView setContentInset:](contentUnavailableView, "setContentInset:");
  v4 = self->_contentUnavailableView;
  if (v4)
  {
    [(SUUIContentUnavailableView *)self->_contentUnavailableView bounds];
    [(SUUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:v4 width:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  [(SUUIContentUnavailableDocumentViewController *)&v6 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  contentUnavailableView = self->_contentUnavailableView;
  id v8 = a4;
  [(SUUIContentUnavailableDocumentViewController *)self _reloadContentUnavailableView:contentUnavailableView width:width];
  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableDocumentViewController;
  -[SUUIContentUnavailableDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  contentUnavailableView = self->_contentUnavailableView;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SUUIContentUnavailableDocumentViewController *)self _layoutContext];
  [(SUUIContentUnavailableView *)contentUnavailableView setImage:v7 forArtworkRequest:v8 context:v9];
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  contentUnavailableView = self->_contentUnavailableView;
  templateElement = self->_templateElement;
  [(SUUIContentUnavailableView *)contentUnavailableView bounds];
  double v7 = v6;
  id v8 = [(SUUIContentUnavailableDocumentViewController *)self _layoutContext];
  [(SUUIContentUnavailableView *)contentUnavailableView reloadWithViewElement:templateElement width:v8 context:v7];
}

- (UIEdgeInsets)_contentInsets
{
  objc_super v3 = [(SUUIContentUnavailableDocumentViewController *)self topLayoutGuide];
  [v3 length];
  double v5 = v4;
  double v6 = [(SUUIContentUnavailableDocumentViewController *)self bottomLayoutGuide];
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
    double v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    double v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    double v6 = self->_layoutContext;
    double v7 = [(SUUIViewController *)self clientContext];
    [(SUUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SUUIContentUnavailableTemplateElement *)self->_templateElement elementType]];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    double v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    [(SUUILayoutCache *)self->_textLayoutCache setDelegate:self];
    double v10 = [[SUUIViewElementTextLayoutCache alloc] initWithLayoutCache:self->_textLayoutCache];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v10];
    double v11 = [SUUIResourceLoader alloc];
    double v12 = [(SUUIViewController *)self operationQueue];
    v13 = [(SUUIViewController *)self clientContext];
    objc_super v14 = [(SUUIResourceLoader *)v11 initWithOperationQueue:v12 clientContext:v13];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v14];
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_reloadContentUnavailableView:(id)a3 width:(double)a4
{
  if (a4 > 0.00000011920929)
  {
    id v6 = a3;
    id v10 = [(SUUIContentUnavailableDocumentViewController *)self _layoutContext];
    double v7 = [v6 tintColor];
    [v10 setTintColor:v7];

    [(id)objc_opt_class() prefetchResourcesForViewElement:self->_templateElement reason:1 context:v10];
    float v8 = a4 + -30.0;
    double v9 = floorf(v8);
    [(id)objc_opt_class() requestLayoutForViewElement:self->_templateElement width:v10 context:v9];
    [(SUUILayoutCache *)self->_textLayoutCache commitLayoutRequests];
    [v6 reloadWithViewElement:self->_templateElement width:v10 context:v9];
    [(SUUIContentUnavailableDocumentViewController *)self _contentInsets];
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

@end