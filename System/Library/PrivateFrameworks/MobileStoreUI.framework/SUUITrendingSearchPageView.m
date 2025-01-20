@interface SUUITrendingSearchPageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUITrendingSearchPage)page;
- (SUUITrendingSearchPageView)initWithFrame:(CGRect)a3;
- (SUUITrendingSearchPageViewDelegate)delegate;
- (UIEdgeInsets)contentInset;
- (void)_buttonAction:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setPage:(id)a3;
@end

@implementation SUUITrendingSearchPageView

- (SUUITrendingSearchPageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUITrendingSearchPageView;
  v3 = -[SUUITrendingSearchPageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUITrendingSearchView alloc];
    [(SUUITrendingSearchPageView *)v3 bounds];
    uint64_t v5 = -[SUUITrendingSearchView initWithFrame:](v4, "initWithFrame:");
    trendingSearchView = v3->_trendingSearchView;
    v3->_trendingSearchView = (SUUITrendingSearchView *)v5;

    [(SUUITrendingSearchView *)v3->_trendingSearchView setAutoresizingMask:18];
    [(SUUITrendingSearchPageView *)v3 addSubview:v3->_trendingSearchView];
  }
  return v3;
}

- (UIEdgeInsets)contentInset
{
  [(SUUITrendingSearchView *)self->_trendingSearchView layoutMargins];
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
  double v5 = (SUUITrendingSearchPage *)a3;
  if (self->_page != v5)
  {
    objc_storeStrong((id *)&self->_page, a3);
    v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1)
    {
      objc_super v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x263F828E0];
      v10 = [(SUUITrendingSearchPageView *)self page];
      v11 = [v10 title];
      objc_super v8 = objc_msgSend(v9, "SUUITrending_defaultLabelWithText:", v11);
    }
    [(SUUITrendingSearchView *)self->_trendingSearchView setTrendingTitleView:v8];
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    v13 = [(SUUITrendingSearchPage *)self->_page searches];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __38__SUUITrendingSearchPageView_setPage___block_invoke;
    v18 = &unk_2654078E0;
    v19 = self;
    id v20 = v12;
    id v14 = v12;
    [v13 enumerateObjectsUsingBlock:&v15];

    -[SUUITrendingSearchView setTrendingSearchViews:](self->_trendingSearchView, "setTrendingSearchViews:", v14, v15, v16, v17, v18, v19);
  }
}

void __38__SUUITrendingSearchPageView_setPage___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F824E8];
  double v4 = [a2 term];
  objc_msgSend(v3, "SUUITrending_searchButtonWithTitle:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)setBackgroundColor:(id)a3
{
  trendingSearchView = self->_trendingSearchView;
  id v5 = a3;
  [(SUUITrendingSearchView *)trendingSearchView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUITrendingSearchPageView;
  [(SUUITrendingSearchPageView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SUUITrendingSearchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_trendingSearchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_buttonAction:(id)a3
{
  page = self->_page;
  id v5 = a3;
  double v6 = [(SUUITrendingSearchPage *)page searches];
  uint64_t v7 = [(SUUITrendingSearchView *)self->_trendingSearchView trendingSearchViews];
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];

  id v10 = [v6 objectAtIndex:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained trendingSearchPageView:self didSelectSearch:v10];
}

- (SUUITrendingSearchPageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUITrendingSearchPageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUITrendingSearchPage)page
{
  return self->_page;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchView, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end