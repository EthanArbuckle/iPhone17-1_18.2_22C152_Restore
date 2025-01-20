@interface STSSuggestionView
- (BOOL)isShowingFooter;
- (CGPoint)footerOffset;
- (CGSize)footerSize;
- (STSSuggestionView)init;
- (STSSuggestionViewDelegate)delegate;
- (UIEdgeInsets)contentInset;
- (UITableView)tableView;
- (UIView)overlayView;
- (void)_handleLogoTap:(id)a3;
- (void)_updateContentInsets;
- (void)_updateFooterOrigin;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterOffset:(CGPoint)a3;
- (void)setOverlayView:(id)a3;
- (void)setOverlayView:(id)a3 animated:(BOOL)a4;
- (void)setShowingFooter:(BOOL)a3;
- (void)updateFooterImage:(id)a3;
@end

@implementation STSSuggestionView

- (STSSuggestionView)init
{
  v28.receiver = self;
  v28.super_class = (Class)STSSuggestionView;
  v2 = [(STSSuggestionView *)&v28 init];
  v3 = v2;
  if (v2)
  {
    [(STSSuggestionView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    v7 = v3->_tableView;
    v8 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultBackgroundColor");
    [(UITableView *)v7 setBackgroundColor:v8];

    [(UITableView *)v3->_tableView setCellLayoutMarginsFollowReadableWidth:1];
    [(UITableView *)v3->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = objc_alloc_init(STSSuggestionFooter);
    footerView = v3->_footerView;
    v3->_footerView = v9;

    [(STSSuggestionFooter *)v3->_footerView sizeToFit];
    v11 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel__handleLogoTap_];
    [(STSSuggestionFooter *)v3->_footerView addGestureRecognizer:v11];
    [(STSSuggestionFooter *)v3->_footerView setUserInteractionEnabled:1];
    id v12 = objc_alloc(MEMORY[0x263F82E00]);
    [(STSSuggestionFooter *)v3->_footerView bounds];
    v13 = objc_msgSend(v12, "initWithFrame:");
    [(UITableView *)v3->_tableView setTableFooterView:v13];
    [(STSSuggestionView *)v3 addSubview:v3->_tableView];
    [(STSSuggestionView *)v3 addSubview:v3->_footerView];
    v14 = [MEMORY[0x263EFF980] array];
    v15 = [(UITableView *)v3->_tableView leadingAnchor];
    v16 = [(STSSuggestionView *)v3 leadingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v14 addObject:v17];

    v18 = [(UITableView *)v3->_tableView trailingAnchor];
    v19 = [(STSSuggestionView *)v3 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v14 addObject:v20];

    v21 = [(UITableView *)v3->_tableView topAnchor];
    v22 = [(STSSuggestionView *)v3 topAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v14 addObject:v23];

    v24 = [(UITableView *)v3->_tableView bottomAnchor];
    v25 = [(STSSuggestionView *)v3 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v14 addObject:v26];

    [MEMORY[0x263F08938] activateConstraints:v14];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(STSSuggestionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UITableView setFrame:](self->_tableView, "setFrame:");
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4 + self->_contentInset.left, v6 + self->_contentInset.top, v8 - (self->_contentInset.left + self->_contentInset.right), v10 - (self->_contentInset.top + self->_contentInset.bottom));

  [(STSSuggestionView *)self _updateFooterOrigin];
}

- (void)setOverlayView:(id)a3
{
}

- (void)setOverlayView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    double v10 = overlayView;
    objc_storeStrong((id *)&self->_overlayView, a3);
    [(STSSuggestionView *)self addSubview:*p_overlayView];
    [(STSSuggestionView *)self setNeedsLayout];
    [(STSSuggestionView *)self layoutIfNeeded];
    [(UIView *)*p_overlayView setAlpha:0.0];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __45__STSSuggestionView_setOverlayView_animated___block_invoke;
    v24 = &unk_264A05958;
    v25 = self;
    v11 = v10;
    v26 = v11;
    id v12 = (void (**)(void))MEMORY[0x230FB7F40](&v21);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __45__STSSuggestionView_setOverlayView_animated___block_invoke_2;
    v18 = &unk_264A05D50;
    v19 = v11;
    v20 = self;
    v13 = v11;
    v14 = (void (**)(void, void))MEMORY[0x230FB7F40](&v15);
    if (v4)
    {
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:animations:completion:", v12, v14, 0.2, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      v12[2](v12);
      v14[2](v14, 1);
    }
  }
}

uint64_t __45__STSSuggestionView_setOverlayView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __45__STSSuggestionView_setOverlayView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 424)];
  if ((result & 1) == 0)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  p_contentInset = &self->_contentInset;
  self->_contentInset = a3;
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", p_contentInset->top, p_contentInset->left, p_contentInset->bottom, p_contentInset->right);

  [(STSSuggestionView *)self setNeedsLayout];
}

- (void)setFooterOffset:(CGPoint)a3
{
  if (self->_footerOffset.x != a3.x || self->_footerOffset.y != a3.y)
  {
    self->_footerOffset = a3;
    [(STSSuggestionView *)self _updateFooterOrigin];
  }
}

- (BOOL)isShowingFooter
{
  return [(STSSuggestionFooter *)self->_footerView isHidden] ^ 1;
}

- (void)setShowingFooter:(BOOL)a3
{
}

- (CGSize)footerSize
{
  -[STSSuggestionFooter sizeThatFits:](self->_footerView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleLogoTap:(id)a3
{
  BOOL v4 = [(STSSuggestionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(STSSuggestionView *)self delegate];
    [v6 suggestionViewDidTapLogo:self];
  }
}

- (void)updateFooterImage:(id)a3
{
}

- (void)_updateFooterOrigin
{
  [(STSSuggestionFooter *)self->_footerView frame];
  footerView = self->_footerView;
  double x = self->_footerOffset.x;
  double y = self->_footerOffset.y;

  -[STSSuggestionFooter setFrame:](footerView, "setFrame:", x, y);
}

- (void)_updateContentInsets
{
  p_contentInset = &self->_contentInset;
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", self->_contentInset.top, 0.0, self->_contentInset.bottom, 0.0);
  [(STSSuggestionFooter *)self->_footerView bounds];
  CGRectGetHeight(v10);
  tableView = self->_tableView;
  double top = p_contentInset->top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;

  -[UITableView setContentInset:](tableView, "setContentInset:", top, left, bottom, right);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)footerOffset
{
  double x = self->_footerOffset.x;
  double y = self->_footerOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (STSSuggestionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSSuggestionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_footerView, 0);
}

@end