@interface SKUIRedeemResultsView
- (NSArray)sections;
- (SKUIRedeemResultsView)init;
- (SKUIRedeemResultsViewDelegate)resultsDelegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)init;
- (void)layoutSubviews;
- (void)setResultsDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SKUIRedeemResultsView

- (SKUIRedeemResultsView)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemResultsView init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIRedeemResultsView;
  v3 = -[SKUIRedeemResultsView initWithFrame:style:](&v7, sel_initWithFrame_style_, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    [(SKUIRedeemResultsView *)v3 setDelegate:v3];
    [(SKUIRedeemResultsView *)v4 setDataSource:v4];
    [(SKUIRedeemResultsView *)v4 setAlwaysBounceVertical:0];
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIRedeemResultsView *)v4 setBackgroundColor:v5];

    [(SKUIRedeemResultsView *)v4 setSeparatorStyle:0];
  }
  return v4;
}

- (void)setSections:(id)a3
{
  v5 = (NSArray *)a3;
  p_sections = &self->_sections;
  if (self->_sections != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_sections, a3);
    p_sections = (NSArray **)[(SKUIRedeemResultsView *)self reloadData];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_sections, v5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  v8 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  v9 = [v8 tableViewCellForTableView:v7 indexPath:v6];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfRowsInSection];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_resultsDelegate);
    [v7 redeemResultsView:self didSelectRowAtIndexPath:v8];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  [v8 heightForCellInTableView:v7 indexPath:v6];
  double v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v8 section]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 tableView:v10 willDisplayCell:v9 forIndexPath:v8];
}

- (void)layoutSubviews
{
  uint64_t v23 = 0;
  v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  sections = self->_sections;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __39__SKUIRedeemResultsView_layoutSubviews__block_invoke;
  v22[3] = &unk_1E6428EA0;
  v22[4] = self;
  v22[5] = &v23;
  [(NSArray *)sections enumerateObjectsUsingBlock:v22];
  [(SKUIRedeemResultsView *)self contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(SKUIRedeemResultsView *)self bounds];
  double v13 = v12;
  double top = self->_contentInsetAdjustments.top;
  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  float v17 = 15.0;
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    float v17 = 28.0;
  }
  float v18 = (v13 - (v5 - top) - v24[3]) * 0.5;
  float v19 = floorf(v18);
  if (v17 >= v19) {
    float v19 = v17;
  }
  CGFloat v20 = v19;
  self->_contentInsetAdjustments.double top = v20;
  -[SKUIRedeemResultsView setContentInset:](self, "setContentInset:", v5 + v20 - top, v7, v9, v11);
  v21.receiver = self;
  v21.super_class = (Class)SKUIRedeemResultsView;
  [(SKUIRedeemResultsView *)&v21 layoutSubviews];
  _Block_object_dispose(&v23, 8);
}

void __39__SKUIRedeemResultsView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  uint64_t v5 = [v11 numberOfRowsInSection];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:a3];
      [v11 heightForCellInTableView:v8 indexPath:v9];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
  }
}

- (NSArray)sections
{
  return self->_sections;
}

- (SKUIRedeemResultsViewDelegate)resultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);

  return (SKUIRedeemResultsViewDelegate *)WeakRetained;
}

- (void)setResultsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsDelegate);

  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemResultsView init]";
}

@end