@interface SKUITrendingSearchPageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUITrendingSearchPage)page;
- (SKUITrendingSearchPageView)initWithFrame:(CGRect)a3;
- (SKUITrendingSearchPageViewDelegate)delegate;
- (UIEdgeInsets)contentInset;
- (void)_buttonAction:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setPage:(id)a3;
@end

@implementation SKUITrendingSearchPageView

- (SKUITrendingSearchPageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrendingSearchPageView initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUITrendingSearchPageView;
  v8 = -[SKUITrendingSearchPageView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUITrendingSearchView alloc];
    [(SKUITrendingSearchPageView *)v8 bounds];
    uint64_t v10 = -[SKUITrendingSearchView initWithFrame:](v9, "initWithFrame:");
    trendingSearchView = v8->_trendingSearchView;
    v8->_trendingSearchView = (SKUITrendingSearchView *)v10;

    [(SKUITrendingSearchView *)v8->_trendingSearchView setAutoresizingMask:18];
    [(SKUITrendingSearchPageView *)v8 addSubview:v8->_trendingSearchView];
  }
  return v8;
}

- (UIEdgeInsets)contentInset
{
  [(SKUITrendingSearchView *)self->_trendingSearchView layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (void)setPage:(id)a3
{
  double v5 = (SKUITrendingSearchPage *)a3;
  if (self->_page != v5)
  {
    objc_storeStrong((id *)&self->_page, a3);
    v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4FB1930];
      uint64_t v10 = [(SKUITrendingSearchPageView *)self page];
      v11 = [v10 title];
      v8 = objc_msgSend(v9, "SKUITrending_defaultLabelWithText:", v11);
    }
    [(SKUITrendingSearchView *)self->_trendingSearchView setTrendingTitleView:v8];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v13 = [(SKUITrendingSearchPage *)self->_page searches];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __38__SKUITrendingSearchPageView_setPage___block_invoke;
    v18 = &unk_1E6425870;
    v19 = self;
    id v20 = v12;
    id v14 = v12;
    [v13 enumerateObjectsUsingBlock:&v15];

    -[SKUITrendingSearchView setTrendingSearchViews:](self->_trendingSearchView, "setTrendingSearchViews:", v14, v15, v16, v17, v18, v19);
  }
}

void __38__SKUITrendingSearchPageView_setPage___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4FB14D0];
  double v4 = [a2 term];
  objc_msgSend(v3, "SKUITrending_searchButtonWithTitle:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)setBackgroundColor:(id)a3
{
  trendingSearchView = self->_trendingSearchView;
  id v5 = a3;
  [(SKUITrendingSearchView *)trendingSearchView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUITrendingSearchPageView;
  [(SKUITrendingSearchPageView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SKUITrendingSearchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_trendingSearchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)_buttonAction:(id)a3
{
  page = self->_page;
  id v5 = a3;
  double v6 = [(SKUITrendingSearchPage *)page searches];
  uint64_t v7 = [(SKUITrendingSearchView *)self->_trendingSearchView trendingSearchViews];
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];

  id v10 = [v6 objectAtIndex:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained trendingSearchPageView:self didSelectSearch:v10];
}

- (SKUITrendingSearchPageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUITrendingSearchPageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUITrendingSearchPage)page
{
  return self->_page;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchView, 0);
  objc_storeStrong((id *)&self->_page, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITrendingSearchPageView initWithFrame:]";
}

@end