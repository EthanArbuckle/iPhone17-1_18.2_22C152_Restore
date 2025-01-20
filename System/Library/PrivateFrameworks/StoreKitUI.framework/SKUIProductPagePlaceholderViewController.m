@interface SKUIProductPagePlaceholderViewController
- (SKUIClientContext)clientContext;
- (SKUIColorScheme)colorScheme;
- (SKUIProductPageChildViewControllerDelegate)delegate;
- (SKUIProductPageHeaderViewController)headerViewController;
- (SKUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3;
- (UIScrollView)scrollView;
- (void)_addHeaderView;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SKUIProductPagePlaceholderViewController

- (SKUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPagePlaceholderViewController initWithStyle:]();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPagePlaceholderViewController;
  result = [(SKUIProductPagePlaceholderViewController *)&v6 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)loadView
{
  v3 = [(SKUIProductPagePlaceholderViewController *)self scrollView];
  [(SKUIProductPagePlaceholderViewController *)self setView:v3];

  [(SKUIProductPagePlaceholderViewController *)self _addHeaderView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPagePlaceholderViewController;
  [(SKUIProductPagePlaceholderViewController *)&v4 viewDidAppear:a3];
  [(UIActivityIndicatorView *)self->_indicator startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPagePlaceholderViewController;
  [(SKUIProductPagePlaceholderViewController *)&v4 viewDidDisappear:a3];
  [(UIActivityIndicatorView *)self->_indicator stopAnimating];
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained productPageChildViewControllerDidScroll:self];
}

- (UIScrollView)scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    if (self->_style)
    {
      objc_super v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
      indicator = self->_indicator;
      self->_indicator = v4;

      [(UIActivityIndicatorView *)self->_indicator startAnimating];
      objc_super v6 = self->_indicator;
      double v7 = 40.0;
    }
    else
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SKUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_NO_RELATED_CONTENT" inTable:@"ProductPage"];
      }
      else {
      v9 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_NO_RELATED_CONTENT" inBundles:0 inTable:@"ProductPage"];
      }
      objc_super v6 = [[SKUIProductPagePlaceholderView alloc] initWithPlaceholderString:v9 isPad:SKUIUserInterfaceIdiom(self->_clientContext) == 1];
      v10 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
      [(UIActivityIndicatorView *)v6 setTextColor:v10];

      v11 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
      if (v11)
      {
        [(UIActivityIndicatorView *)v6 setBackgroundColor:v11];
      }
      else
      {
        v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.97254902 alpha:1.0];
        [(UIActivityIndicatorView *)v6 setBackgroundColor:v12];
      }
      double v7 = 0.0;
    }
    v13 = objc_alloc_init(SKUIProductPagePlaceholderScrollView);
    v14 = self->_scrollView;
    self->_scrollView = v13;

    [(SKUIProductPagePlaceholderScrollView *)self->_scrollView setIsPad:SKUIUserInterfaceIdiom(self->_clientContext) == 1];
    [(SKUIProductPagePlaceholderScrollView *)self->_scrollView setAlwaysBounceVertical:1];
    v15 = self->_scrollView;
    v16 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
    if (v16)
    {
      [(SKUIProductPagePlaceholderScrollView *)v15 setBackgroundColor:v16];
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.97254902 alpha:1.0];
      [(SKUIProductPagePlaceholderScrollView *)v15 setBackgroundColor:v17];
    }
    [(SKUIProductPagePlaceholderScrollView *)self->_scrollView setDelegate:self];
    [(SKUIProductPagePlaceholderScrollView *)self->_scrollView setOffset:v7];
    [(SKUIProductPagePlaceholderScrollView *)self->_scrollView setPlaceholderView:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained productPageChildViewControllerDidLoadScrollView:self];

    scrollView = self->_scrollView;
  }

  return (UIScrollView *)scrollView;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (self->_scrollView)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 productPageChildViewControllerDidLoadScrollView:self];

      v5 = obj;
    }
  }
}

- (void)setHeaderViewController:(id)a3
{
  v5 = (SKUIProductPageHeaderViewController *)a3;
  p_headerViewController = &self->_headerViewController;
  headerViewController = self->_headerViewController;
  v10 = v5;
  if (headerViewController != v5)
  {
    v8 = [(SKUIProductPageHeaderViewController *)headerViewController view];
    [v8 removeFromSuperview];

    v9 = [(SKUIProductPageHeaderViewController *)*p_headerViewController floatingView];
    [v9 removeFromSuperview];

    [(SKUIProductPageHeaderViewController *)*p_headerViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SKUIProductPagePlaceholderViewController addChildViewController:](self, "addChildViewController:");
      if ([(SKUIProductPagePlaceholderViewController *)self isViewLoaded]) {
        [(SKUIProductPagePlaceholderViewController *)self _addHeaderView];
      }
    }
  }
}

- (void)_addHeaderView
{
  id v8 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
  [v8 setAutoresizingMask:2];
  [v8 frame];
  double v4 = v3;
  [(SKUIProductPagePlaceholderScrollView *)self->_scrollView bounds];
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  [(SKUIProductPagePlaceholderScrollView *)self->_scrollView addSubview:v8];
  v5 = [(SKUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v5 setAutoresizingMask:2];
  [v5 frame];
  double v7 = v6;
  [(SKUIProductPagePlaceholderScrollView *)self->_scrollView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  [(SKUIProductPagePlaceholderScrollView *)self->_scrollView addSubview:v5];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPagePlaceholderViewController initWithStyle:]";
}

@end