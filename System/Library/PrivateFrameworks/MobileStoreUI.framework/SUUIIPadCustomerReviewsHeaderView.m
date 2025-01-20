@interface SUUIIPadCustomerReviewsHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sortTitles;
- (SUUIColorScheme)colorScheme;
- (SUUIIPadCustomerReviewsHeaderView)initWithClientContext:(id)a3;
- (UIControl)appSupportButton;
- (UIControl)writeAReviewButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)selectedSortIndex;
- (void)_destroySortPopoverController;
- (void)_reloadSortButton;
- (void)_sortButtonAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setSelectedSortIndex:(int64_t)a3;
- (void)setSortTitles:(id)a3;
@end

@implementation SUUIIPadCustomerReviewsHeaderView

- (SUUIIPadCustomerReviewsHeaderView)initWithClientContext:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUUIIPadCustomerReviewsHeaderView;
  v6 = [(SUUIIPadCustomerReviewsHeaderView *)&v39 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    uint64_t v8 = [MEMORY[0x263F824E8] buttonWithType:1];
    appSupportButton = v7->_appSupportButton;
    v7->_appSupportButton = (UIButton *)v8;

    v10 = [(UIButton *)v7->_appSupportButton titleLabel];
    v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v10 setFont:v11];

    v12 = v7->_appSupportButton;
    if (v5) {
      [v5 localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inTable:@"ProductPage"];
    }
    else {
    v13 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_APP_SUPPORT" inBundles:0 inTable:@"ProductPage"];
    }
    [(UIButton *)v12 setTitle:v13 forState:0];

    [(UIButton *)v7->_appSupportButton sizeToFit];
    v14 = v7->_appSupportButton;
    v15 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    [(UIButton *)v14 setTintColor:v15];

    [(SUUIIPadCustomerReviewsHeaderView *)v7 addSubview:v7->_appSupportButton];
    uint64_t v16 = [MEMORY[0x263F824E8] buttonWithType:1];
    writeAReviewButton = v7->_writeAReviewButton;
    v7->_writeAReviewButton = (UIButton *)v16;

    v18 = [(UIButton *)v7->_writeAReviewButton titleLabel];
    v19 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v18 setFont:v19];

    v20 = v7->_writeAReviewButton;
    if (v5) {
      [v5 localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPAD" inTable:@"ProductPage"];
    }
    else {
    v21 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPAD" inBundles:0 inTable:@"ProductPage"];
    }
    [(UIButton *)v20 setTitle:v21 forState:0];

    [(UIButton *)v7->_writeAReviewButton sizeToFit];
    v22 = v7->_writeAReviewButton;
    v23 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    [(UIButton *)v22 setTintColor:v23];

    [(SUUIIPadCustomerReviewsHeaderView *)v7 addSubview:v7->_writeAReviewButton];
    v24 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v24;

    v26 = v7->_titleLabel;
    v27 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(UILabel *)v26 setFont:v27];

    v28 = v7->_titleLabel;
    v29 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v29)
    {
      [(UILabel *)v28 setTextColor:v29];
    }
    else
    {
      v30 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)v28 setTextColor:v30];
    }
    v31 = v7->_titleLabel;
    if (v5) {
      [v5 localizedStringForKey:@"REVIEWS_HEADER_TITLE" inTable:@"ProductPage"];
    }
    else {
    v32 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(UILabel *)v31 setText:v32];

    [(UILabel *)v7->_titleLabel sizeToFit];
    [(SUUIIPadCustomerReviewsHeaderView *)v7 addSubview:v7->_titleLabel];
    v33 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v33;

    v35 = v7->_separatorView;
    v36 = [(SUUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v36)
    {
      [(UIView *)v35 setBackgroundColor:v36];
    }
    else
    {
      v37 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v35 setBackgroundColor:v37];
    }
    [(SUUIIPadCustomerReviewsHeaderView *)v7 addSubview:v7->_separatorView];
  }

  return v7;
}

- (void)dealloc
{
  [(UIButton *)self->_sortButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3 = [(UIPopoverController *)self->_sortPopoverController contentViewController];
  [v3 setDelegate:0];
  [(UIPopoverController *)self->_sortPopoverController setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadCustomerReviewsHeaderView;
  [(SUUIIPadCustomerReviewsHeaderView *)&v4 dealloc];
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    uint64_t v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)titleLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v9];
    }
    sortLabel = self->_sortLabel;
    v11 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    v12 = SUUIColorWithAlpha(v11, 0.6);
    if (v12)
    {
      [(UILabel *)sortLabel setTextColor:v12];
    }
    else
    {
      v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)sortLabel setTextColor:v13];
    }
    separatorView = self->_separatorView;
    v15 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v15)
    {
      [(UIView *)separatorView setBackgroundColor:v15];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)separatorView setBackgroundColor:v16];
    }
    appSupportButton = self->_appSupportButton;
    v18 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)appSupportButton setTintColor:v18];

    writeAReviewButton = self->_writeAReviewButton;
    v20 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)writeAReviewButton setTintColor:v20];

    sortButton = self->_sortButton;
    v22 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    [(UIButton *)sortButton setTintColor:v22];

    id v5 = v23;
  }
}

- (void)setSelectedSortIndex:(int64_t)a3
{
  if (self->_selectedSortIndex != a3)
  {
    self->_selectedSortIndex = a3;
    [(SUUIIPadCustomerReviewsHeaderView *)self _reloadSortButton];
  }
}

- (void)setSortTitles:(id)a3
{
  if (self->_sortTitles != a3)
  {
    objc_super v4 = (NSArray *)[a3 copy];
    sortTitles = self->_sortTitles;
    self->_sortTitles = v4;

    [(SUUIIPadCustomerReviewsHeaderView *)self _reloadSortButton];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SUUIIPadCustomerReviewsHeaderView;
  -[SUUIIPadCustomerReviewsHeaderView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  if (v7 == (UIButton *)self)
  {
    sortButton = self->_sortButton;
    if (sortButton
      && ([(UIButton *)sortButton frame],
          CGRect v14 = CGRectInset(v13, -20.0, -20.0),
          v12.CGFloat x = x,
          v12.CGFloat y = y,
          CGRectContainsPoint(v14, v12)))
    {
      v7 = self->_sortButton;
    }
    else
    {
      v7 = (UIButton *)self;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  [(SUUIIPadCustomerReviewsHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v9 = v8;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 10.0, v4 + -15.0 + -15.0);
    v29.origin.CGFloat x = 15.0;
    v29.origin.CGFloat y = 10.0;
    v29.size.width = v4 + -15.0 + -15.0;
    v29.size.height = v9;
    double v10 = CGRectGetMaxY(v29) + -5.0 + 19.0 + -11.0;
  }
  else
  {
    double v10 = 4.0;
  }
  writeAReviewButton = self->_writeAReviewButton;
  if (writeAReviewButton)
  {
    [(UIButton *)writeAReviewButton frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    -[UIButton setFrame:](self->_writeAReviewButton, "setFrame:", 15.0, v10);
    v30.origin.CGFloat x = 15.0;
    v30.origin.CGFloat y = v10;
    v30.size.width = v13;
    v30.size.height = v15;
    double v16 = CGRectGetMaxX(v30) + 20.0;
  }
  else
  {
    double v16 = 15.0;
  }
  appSupportButton = self->_appSupportButton;
  if (appSupportButton)
  {
    [(UIButton *)appSupportButton frame];
    -[UIButton setFrame:](self->_appSupportButton, "setFrame:", v16, v10);
  }
  sortButton = self->_sortButton;
  if (sortButton)
  {
    [(UIButton *)sortButton frame];
    double v20 = v4 + -15.0 - v19;
    -[UIButton setFrame:](self->_sortButton, "setFrame:", v20, v10);
    [(UILabel *)self->_sortLabel frame];
    -[UILabel setFrame:](self->_sortLabel, "setFrame:", v20 + -5.0 - v21, v10 + 7.0);
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    id v27 = [MEMORY[0x263F82B60] mainScreen];
    [v27 scale];
    double v24 = v6 - 1.0 / v23;
    v25 = [MEMORY[0x263F82B60] mainScreen];
    [v25 scale];
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v24, v4 + -15.0, 1.0 / v26);
  }
}

- (void)setBackgroundColor:(id)a3
{
  appSupportButton = self->_appSupportButton;
  id v5 = a3;
  [(UIButton *)appSupportButton setBackgroundColor:v5];
  [(UIButton *)self->_sortButton setBackgroundColor:v5];
  [(UILabel *)self->_sortLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  [(UIButton *)self->_writeAReviewButton setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIIPadCustomerReviewsHeaderView;
  [(SUUIIPadCustomerReviewsHeaderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UILabel *)self->_titleLabel frame];
  double v6 = v5 + 30.0 + -5.0 + -5.0 + 19.0;
  [(UIButton *)self->_writeAReviewButton frame];
  double v8 = v7 + v6 + -11.0 + -10.0;
  double v9 = width;
  result.height = v8;
  result.CGFloat width = v9;
  return result;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (self->_selectedSortIndex != a4)
  {
    self->_selectedSortIndeCGFloat x = a4;
    [(SUUIIPadCustomerReviewsHeaderView *)self _reloadSortButton];
    [(SUUIIPadCustomerReviewsHeaderView *)self sendActionsForControlEvents:4096];
  }
  [(UIPopoverController *)self->_sortPopoverController dismissPopoverAnimated:1];
  [(SUUIIPadCustomerReviewsHeaderView *)self _destroySortPopoverController];
}

- (void)_sortButtonAction:(id)a3
{
  if (!self->_sortPopoverController)
  {
    id v4 = a3;
    v17 = [[SUUIMenuViewController alloc] initWithMenuTitles:self->_sortTitles];
    [(SUUIMenuViewController *)v17 setDelegate:self];
    [(SUUIMenuViewController *)v17 setIndexOfCheckedTitle:self->_selectedSortIndex];
    double v5 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F82AA0]) initWithContentViewController:v17];
    sortPopoverController = self->_sortPopoverController;
    self->_sortPopoverController = v5;

    [(UIPopoverController *)self->_sortPopoverController setDelegate:self];
    -[UIPopoverController setPopoverContentSize:](self->_sortPopoverController, "setPopoverContentSize:", 320.0, (double)[(NSArray *)self->_sortTitles count] * 44.0);
    double v7 = self->_sortPopoverController;
    [v4 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [v4 superview];

    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v7, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v16, 15, 1, v9, v11, v13, v15);
  }
}

- (void)_destroySortPopoverController
{
  id v4 = [(UIPopoverController *)self->_sortPopoverController contentViewController];
  [v4 setDelegate:0];
  [(UIPopoverController *)self->_sortPopoverController setDelegate:0];
  sortPopoverController = self->_sortPopoverController;
  self->_sortPopoverController = 0;
}

- (void)_reloadSortButton
{
  if ([(NSArray *)self->_sortTitles count])
  {
    if (!self->_sortButton)
    {
      double v3 = [MEMORY[0x263F824E8] buttonWithType:1];
      sortButton = self->_sortButton;
      self->_sortButton = v3;

      [(UIButton *)self->_sortButton addTarget:self action:sel__sortButtonAction_ forControlEvents:64];
      double v5 = self->_sortButton;
      double v6 = [(SUUIIPadCustomerReviewsHeaderView *)self backgroundColor];
      [(UIButton *)v5 setBackgroundColor:v6];

      double v7 = self->_sortButton;
      double v8 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
      [(UIButton *)v7 setTintColor:v8];

      double v9 = [(UIButton *)self->_sortButton titleLabel];
      double v10 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
      [v9 setFont:v10];

      [(SUUIIPadCustomerReviewsHeaderView *)self addSubview:self->_sortButton];
    }
    if (!self->_sortLabel)
    {
      double v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      sortLabel = self->_sortLabel;
      self->_sortLabel = v11;

      double v13 = self->_sortLabel;
      double v14 = [(SUUIIPadCustomerReviewsHeaderView *)self backgroundColor];
      [(UILabel *)v13 setBackgroundColor:v14];

      double v15 = self->_sortLabel;
      double v16 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
      [(UILabel *)v15 setFont:v16];

      v17 = self->_sortLabel;
      v18 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
      double v19 = SUUIColorWithAlpha(v18, 0.6);
      if (v19)
      {
        [(UILabel *)v17 setTextColor:v19];
      }
      else
      {
        v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
        [(UILabel *)v17 setTextColor:v22];
      }
      double v23 = self->_sortLabel;
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_HEADER_SORT_BY" inTable:@"ProductPage"];
      }
      else {
      v25 = +[SUUIClientContext localizedStringForKey:@"REVIEWS_HEADER_SORT_BY" inBundles:0 inTable:@"ProductPage"];
      }
      [(UILabel *)v23 setText:v25];

      [(UILabel *)self->_sortLabel sizeToFit];
      [(SUUIIPadCustomerReviewsHeaderView *)self addSubview:self->_sortLabel];
    }
    selectedSortIndeCGFloat x = self->_selectedSortIndex;
    if (selectedSortIndex < [(NSArray *)self->_sortTitles count])
    {
      id v27 = self->_sortButton;
      v28 = [(NSArray *)self->_sortTitles objectAtIndex:self->_selectedSortIndex];
      [(UIButton *)v27 setTitle:v28 forState:0];

      [(UIButton *)self->_sortButton sizeToFit];
    }
    [(SUUIIPadCustomerReviewsHeaderView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)self->_sortLabel removeFromSuperview];
    double v20 = self->_sortLabel;
    self->_sortLabel = 0;

    [(UIButton *)self->_sortButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [(UIButton *)self->_sortButton removeFromSuperview];
    double v21 = self->_sortButton;
    self->_sortButton = 0;
  }
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)selectedSortIndex
{
  return self->_selectedSortIndex;
}

- (NSArray)sortTitles
{
  return self->_sortTitles;
}

- (UIControl)appSupportButton
{
  return &self->_appSupportButton->super;
}

- (UIControl)writeAReviewButton
{
  return &self->_writeAReviewButton->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAReviewButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sortTitles, 0);
  objc_storeStrong((id *)&self->_sortLabel, 0);
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_sortPopoverController, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_appSupportButton, 0);
}

@end