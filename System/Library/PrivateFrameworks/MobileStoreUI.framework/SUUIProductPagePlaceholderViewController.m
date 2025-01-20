@interface SUUIProductPagePlaceholderViewController
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUIProductPageChildViewControllerDelegate)delegate;
- (SUUIProductPageHeaderViewController)headerViewController;
- (SUUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3;
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

@implementation SUUIProductPagePlaceholderViewController

- (SUUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPagePlaceholderViewController;
  result = [(SUUIProductPagePlaceholderViewController *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)loadView
{
  v3 = [(SUUIProductPagePlaceholderViewController *)self scrollView];
  [(SUUIProductPagePlaceholderViewController *)self setView:v3];

  [(SUUIProductPagePlaceholderViewController *)self _addHeaderView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPagePlaceholderViewController;
  [(SUUIProductPagePlaceholderViewController *)&v4 viewDidAppear:a3];
  [(UIActivityIndicatorView *)self->_indicator startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPagePlaceholderViewController;
  [(SUUIProductPagePlaceholderViewController *)&v4 viewDidDisappear:a3];
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
      objc_super v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
      indicator = self->_indicator;
      self->_indicator = v4;

      [(UIActivityIndicatorView *)self->_indicator startAnimating];
      v6 = self->_indicator;
      double v7 = 40.0;
    }
    else
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_NO_RELATED_CONTENT" inTable:@"ProductPage"];
      }
      else {
      v9 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_NO_RELATED_CONTENT" inBundles:0 inTable:@"ProductPage"];
      }
      v6 = [[SUUIProductPagePlaceholderView alloc] initWithPlaceholderString:v9 isPad:SUUIUserInterfaceIdiom(self->_clientContext) == 1];
      v10 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
      [(UIActivityIndicatorView *)v6 setTextColor:v10];

      v11 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
      if (v11)
      {
        [(UIActivityIndicatorView *)v6 setBackgroundColor:v11];
      }
      else
      {
        v12 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
        [(UIActivityIndicatorView *)v6 setBackgroundColor:v12];
      }
      double v7 = 0.0;
    }
    v13 = objc_alloc_init(SUUIProductPagePlaceholderScrollView);
    v14 = self->_scrollView;
    self->_scrollView = v13;

    [(SUUIProductPagePlaceholderScrollView *)self->_scrollView setIsPad:SUUIUserInterfaceIdiom(self->_clientContext) == 1];
    [(SUUIProductPagePlaceholderScrollView *)self->_scrollView setAlwaysBounceVertical:1];
    v15 = self->_scrollView;
    v16 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
    if (v16)
    {
      [(SUUIProductPagePlaceholderScrollView *)v15 setBackgroundColor:v16];
    }
    else
    {
      v17 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [(SUUIProductPagePlaceholderScrollView *)v15 setBackgroundColor:v17];
    }
    [(SUUIProductPagePlaceholderScrollView *)self->_scrollView setDelegate:self];
    [(SUUIProductPagePlaceholderScrollView *)self->_scrollView setOffset:v7];
    [(SUUIProductPagePlaceholderScrollView *)self->_scrollView setPlaceholderView:v6];
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

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_super v5 = obj;
    if (self->_scrollView)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 productPageChildViewControllerDidLoadScrollView:self];

      objc_super v5 = obj;
    }
  }
}

- (void)setHeaderViewController:(id)a3
{
  objc_super v5 = (SUUIProductPageHeaderViewController *)a3;
  p_headerViewController = &self->_headerViewController;
  headerViewController = self->_headerViewController;
  v10 = v5;
  if (headerViewController != v5)
  {
    v8 = [(SUUIProductPageHeaderViewController *)headerViewController view];
    [v8 removeFromSuperview];

    v9 = [(SUUIProductPageHeaderViewController *)*p_headerViewController floatingView];
    [v9 removeFromSuperview];

    [(SUUIProductPageHeaderViewController *)*p_headerViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPagePlaceholderViewController addChildViewController:](self, "addChildViewController:");
      if ([(SUUIProductPagePlaceholderViewController *)self isViewLoaded]) {
        [(SUUIProductPagePlaceholderViewController *)self _addHeaderView];
      }
    }
  }
}

- (void)_addHeaderView
{
  id v8 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v8 setAutoresizingMask:2];
  [v8 frame];
  double v4 = v3;
  [(SUUIProductPagePlaceholderScrollView *)self->_scrollView bounds];
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  [(SUUIProductPagePlaceholderScrollView *)self->_scrollView addSubview:v8];
  objc_super v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v5 setAutoresizingMask:2];
  [v5 frame];
  double v7 = v6;
  [(SUUIProductPagePlaceholderScrollView *)self->_scrollView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  [(SUUIProductPagePlaceholderScrollView *)self->_scrollView addSubview:v5];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (SUUIProductPageHeaderViewController)headerViewController
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

@end