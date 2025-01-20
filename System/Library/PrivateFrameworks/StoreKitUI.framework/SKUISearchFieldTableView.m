@interface SKUISearchFieldTableView
- (BOOL)trendingSearchesVisible;
- (SKUITrendingSearchPageViewDelegate)trendingSearchDelegate;
- (SKUITrendingSearchProvider)trendingSearchProvider;
- (void)_reloadData;
- (void)_reloadView;
- (void)_setTrendingResponse:(id)a3 error:(id)a4;
- (void)layoutSubviews;
- (void)setTrendingSearchDelegate:(id)a3;
- (void)setTrendingSearchProvider:(id)a3;
- (void)setTrendingSearchesVisible:(BOOL)a3;
@end

@implementation SKUISearchFieldTableView

- (void)setTrendingSearchProvider:(id)a3
{
  v5 = (SKUITrendingSearchProvider *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUISearchFieldTableView setTrendingSearchProvider:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_trendingSearchProvider != v5)
  {
    objc_storeStrong((id *)&self->_trendingSearchProvider, a3);
    if (self->_trendingSearchesVisible && !self->_page) {
      [(SKUISearchFieldTableView *)self _reloadData];
    }
  }
}

- (void)setTrendingSearchDelegate:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISearchFieldTableView setTrendingSearchDelegate:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = objc_storeWeak((id *)&self->_trendingSearchDelegate, v4);
  [(SKUITrendingSearchPageView *)self->_pageView setDelegate:v4];
}

- (void)setTrendingSearchesVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISearchFieldTableView setTrendingSearchesVisible:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_trendingSearchesVisible != v3)
  {
    self->_trendingSearchesVisible = v3;
    if (v3 && !self->_page) {
      [(SKUISearchFieldTableView *)self _reloadData];
    }
    else {
      [(SKUISearchFieldTableView *)self _reloadView];
    }
  }
}

- (void)layoutSubviews
{
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
      uint64_t v7 = [v6 URLForTrendingSearchPageView:self->_pageView];
    }
    else
    {
      uint64_t v7 = 0;
    }
    objc_initWeak(&location, self);
    uint64_t v8 = [(SKUISearchFieldTableView *)self trendingSearchProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__SKUISearchFieldTableView__reloadData__block_invoke;
    v9[3] = &unk_1E6427EA0;
    objc_copyWeak(&v10, &location);
    [v8 trendingSearchPageWithURL:v7 completionBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __39__SKUISearchFieldTableView__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
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
    [(SKUISearchFieldTableView *)self _reloadView];
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
      id v5 = objc_alloc_init(SKUITrendingSearchPageView);
      id v6 = self->_pageView;
      self->_pageView = v5;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
      [(SKUITrendingSearchPageView *)self->_pageView setDelegate:WeakRetained];

      [(SKUISearchFieldTableView *)self addSubview:self->_pageView];
    }
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(SKUISearchFieldTableView *)self frame];
    -[SKUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", v8, v9);
    [(SKUITrendingSearchPageView *)self->_pageView setPage:self->_page];
    [(SKUITrendingSearchPageView *)self->_pageView setHidden:0];
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SKUISearchFieldTableView *)self setTableFooterView:v11];
  }
  else
  {
    [(SKUITrendingSearchPageView *)pageView setHidden:1];
    [(SKUISearchFieldTableView *)self setTableFooterView:0];
  }
}

- (SKUITrendingSearchProvider)trendingSearchProvider
{
  return self->_trendingSearchProvider;
}

- (SKUITrendingSearchPageViewDelegate)trendingSearchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);

  return (SKUITrendingSearchPageViewDelegate *)WeakRetained;
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

- (void)setTrendingSearchProvider:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTrendingSearchDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTrendingSearchesVisible:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end