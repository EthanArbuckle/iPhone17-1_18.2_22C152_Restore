@interface SUUISearchFieldTableView
- (BOOL)trendingSearchesVisible;
- (SUUITrendingSearchPageViewDelegate)trendingSearchDelegate;
- (SUUITrendingSearchProvider)trendingSearchProvider;
- (void)_reloadData;
- (void)_reloadView;
- (void)_setTrendingResponse:(id)a3 error:(id)a4;
- (void)layoutSubviews;
- (void)setTrendingSearchDelegate:(id)a3;
- (void)setTrendingSearchProvider:(id)a3;
- (void)setTrendingSearchesVisible:(BOOL)a3;
@end

@implementation SUUISearchFieldTableView

- (void)setTrendingSearchProvider:(id)a3
{
  v5 = (SUUITrendingSearchProvider *)a3;
  p_trendingSearchProvider = &self->_trendingSearchProvider;
  if (self->_trendingSearchProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_trendingSearchProvider, a3);
    v5 = v7;
    if (self->_trendingSearchesVisible && !self->_page)
    {
      p_trendingSearchProvider = (SUUITrendingSearchProvider **)[(SUUISearchFieldTableView *)self _reloadData];
      v5 = v7;
    }
  }
  MEMORY[0x270F9A758](p_trendingSearchProvider, v5);
}

- (void)setTrendingSearchDelegate:(id)a3
{
  p_trendingSearchDelegate = &self->_trendingSearchDelegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_trendingSearchDelegate, v6);
  [(SUUITrendingSearchPageView *)self->_pageView setDelegate:v6];
}

- (void)setTrendingSearchesVisible:(BOOL)a3
{
  if (self->_trendingSearchesVisible != a3)
  {
    self->_trendingSearchesVisible = a3;
    if (a3 && !self->_page) {
      [(SUUISearchFieldTableView *)self _reloadData];
    }
    else {
      [(SUUISearchFieldTableView *)self _reloadView];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUISearchFieldTableView;
  [(SUUISearchFieldTableView *)&v3 layoutSubviews];
  [(SUUISearchFieldTableView *)self bounds];
  -[SUUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", 0.0, 0.0);
}

- (void)_reloadData
{
  if (self->_trendingSearchProvider)
  {
    p_trendingSearchDelegate = &self->_trendingSearchDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_trendingSearchDelegate);
      v7 = [v6 URLForTrendingSearchPageView:self->_pageView];
    }
    else
    {
      v7 = 0;
    }
    objc_initWeak(&location, self);
    v8 = [(SUUISearchFieldTableView *)self trendingSearchProvider];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__SUUISearchFieldTableView__reloadData__block_invoke;
    v9[3] = &unk_2654076D0;
    objc_copyWeak(&v10, &location);
    [v8 trendingSearchPageWithURL:v7 completionBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __39__SUUISearchFieldTableView__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setTrendingResponse:v6 error:v5];
}

- (void)_setTrendingResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)&self->_page, a3);
    [(SUUISearchFieldTableView *)self _reloadView];
    id v6 = v7;
  }
}

- (void)_reloadView
{
  BOOL trendingSearchesVisible = self->_trendingSearchesVisible;
  pageView = self->_pageView;
  if (trendingSearchesVisible)
  {
    if (!pageView && self->_page)
    {
      id v5 = objc_alloc_init(SUUITrendingSearchPageView);
      id v6 = self->_pageView;
      self->_pageView = v5;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
      [(SUUITrendingSearchPageView *)self->_pageView setDelegate:WeakRetained];

      [(SUUISearchFieldTableView *)self addSubview:self->_pageView];
    }
    double v8 = *MEMORY[0x263F00148];
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    [(SUUISearchFieldTableView *)self frame];
    -[SUUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", v8, v9);
    [(SUUITrendingSearchPageView *)self->_pageView setPage:self->_page];
    [(SUUITrendingSearchPageView *)self->_pageView setHidden:0];
    id v10 = objc_alloc(MEMORY[0x263F82E00]);
    id v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SUUISearchFieldTableView *)self setTableFooterView:v11];
  }
  else
  {
    [(SUUITrendingSearchPageView *)pageView setHidden:1];
    [(SUUISearchFieldTableView *)self setTableFooterView:0];
  }
}

- (SUUITrendingSearchProvider)trendingSearchProvider
{
  return self->_trendingSearchProvider;
}

- (SUUITrendingSearchPageViewDelegate)trendingSearchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
  return (SUUITrendingSearchPageViewDelegate *)WeakRetained;
}

- (BOOL)trendingSearchesVisible
{
  return self->_trendingSearchesVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trendingSearchDelegate);
  objc_storeStrong((id *)&self->_trendingSearchProvider, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_page, 0);
}

@end