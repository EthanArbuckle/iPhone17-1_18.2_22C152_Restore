@interface SKUIPopupMenuHeaderView
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)menuItemTitles;
- (NSString)menuLabelTitle;
- (NSString)title;
- (SKUIPopupMenuDelegate)delegate;
- (SKUIPopupMenuHeaderView)initWithFrame:(CGRect)a3;
- (id)_titleLabel;
- (int64_t)selectedMenuItemIndex;
- (void)_menuButtonAction:(id)a3;
- (void)_reloadMenuButton;
- (void)dealloc;
- (void)layoutSubviews;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuItemTitles:(id)a3;
- (void)setMenuLabelTitle:(id)a3;
- (void)setSelectedMenuItemIndex:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIPopupMenuHeaderView

- (SKUIPopupMenuHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPopupMenuHeaderView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIPopupMenuHeaderView;
  v8 = -[SKUIPopupMenuHeaderView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIPopupMenuHeaderView *)v8 setBackgroundColor:v9];
  }
  return v8;
}

- (void)dealloc
{
  [(UIPopoverController *)self->_menuPopoverController setDelegate:0];
  [(SKUIMenuViewController *)self->_menuViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIPopupMenuHeaderView;
  [(SKUIPopupMenuHeaderView *)&v3 dealloc];
}

- (void)setColoringWithColorScheme:(id)a3
{
  menuLabel = self->_menuLabel;
  if (a3)
  {
    id v6 = a3;
    v7 = [v6 secondaryTextColor];
    [(UILabel *)menuLabel setTextColor:v7];

    titleLabel = self->_titleLabel;
    v9 = [v6 primaryTextColor];
    v10 = titleLabel;
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x1E4FB1618];
    id v12 = 0;
    v13 = [v11 colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)menuLabel setTextColor:v13];

    v14 = self->_titleLabel;
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    v10 = v14;
  }
  [(UILabel *)v10 setTextColor:v9];

  id v15 = [a3 backgroundColor];

  [(SKUIPopupMenuHeaderView *)self setBackgroundColor:v15];
}

- (void)setMenuItemTitles:(id)a3
{
  if (self->_menuItemTitles != a3)
  {
    v4 = (NSArray *)[a3 copy];
    menuItemTitles = self->_menuItemTitles;
    self->_menuItemTitles = v4;

    [(SKUIPopupMenuHeaderView *)self _reloadMenuButton];
  }
}

- (void)setMenuLabelTitle:(id)a3
{
  if (self->_menuLabelTitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    menuLabelTitle = self->_menuLabelTitle;
    self->_menuLabelTitle = v4;

    [(SKUIPopupMenuHeaderView *)self _reloadMenuButton];
  }
}

- (void)setSelectedMenuItemIndex:(int64_t)a3
{
  if (self->_selectedMenuItemIndex != a3)
  {
    self->_selectedMenuItemIndedouble x = a3;
    [(SKUIPopupMenuHeaderView *)self _reloadMenuButton];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIPopupMenuHeaderView *)self _titleLabel];
  [v5 setText:v4];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SKUIPopupMenuHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5 + -15.0;
  menuButton = self->_menuButton;
  if (menuButton)
  {
    [(UIButton *)menuButton frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v12 = v6 - v8;
    float v13 = (v4 - v10) * 0.5;
    double v14 = floorf(v13);
    -[UIButton setFrame:](self->_menuButton, "setFrame:", v12, v14);
    menuLabel = self->_menuLabel;
    if (menuLabel)
    {
      [(UILabel *)menuLabel frame];
      CGFloat v9 = v16;
      CGFloat v11 = v17;
      double v12 = v12 - v16 + -5.0;
      float v18 = (v4 - v17) * 0.5;
      double v14 = floorf(v18);
      -[UILabel setFrame:](self->_menuLabel, "setFrame:", v12, v14);
    }
    v27.origin.double x = v12;
    v27.origin.double y = v14;
    v27.size.double width = v9;
    v27.size.double height = v11;
    double v6 = CGRectGetMinX(v27) + -15.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6 + -15.0, 1.79769313e308);
    double v21 = v20;
    double v23 = v22;
    *(float *)&double v20 = (v4 - v22) * 0.5;
    v24 = self->_titleLabel;
    double v25 = floorf(*(float *)&v20);
    -[UILabel setFrame:](v24, "setFrame:", 15.0, v25, v21, v23);
  }
}

- (void)setBackgroundColor:(id)a3
{
  menuButton = self->_menuButton;
  id v5 = a3;
  [(UIButton *)menuButton setBackgroundColor:v5];
  menuLabel = self->_menuLabel;
  if (v5)
  {
    [(UILabel *)self->_menuLabel setBackgroundColor:v5];
    [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  }
  else
  {
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)menuLabel setBackgroundColor:v7];

    titleLabel = self->_titleLabel;
    CGFloat v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)titleLabel setBackgroundColor:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIPopupMenuHeaderView;
  [(SKUIPopupMenuHeaderView *)&v10 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.double height = v3;
  return result;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (self->_selectedMenuItemIndex != a4)
  {
    self->_selectedMenuItemIndedouble x = a4;
    p_delegate = &self->_delegate;
    id v20 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 popupMenuHeader:self didSelectMenuItemAtIndex:a4];
    }
    [(SKUIPopupMenuHeaderView *)self _reloadMenuButton];
    [(SKUIPopupMenuHeaderView *)self layoutIfNeeded];
    menuPopoverController = self->_menuPopoverController;
    [(UIButton *)self->_menuButton frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [(UIButton *)self->_menuButton superview];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](menuPopoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v19, 1, 1, v12, v14, v16, v18);

    [v20 setIndexOfCheckedTitle:self->_selectedMenuItemIndex];
  }
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(SKUIMenuViewController *)self->_menuViewController setDelegate:0];
  menuViewController = self->_menuViewController;
  self->_menuViewController = 0;

  [(UIPopoverController *)self->_menuPopoverController setDelegate:0];
  menuPopoverController = self->_menuPopoverController;
  self->_menuPopoverController = 0;
}

- (void)_menuButtonAction:(id)a3
{
  if (!self->_menuPopoverController)
  {
    id v4 = a3;
    id v5 = [[SKUIMenuViewController alloc] initWithMenuTitles:self->_menuItemTitles];
    menuViewController = self->_menuViewController;
    self->_menuViewController = v5;

    [(SKUIMenuViewController *)self->_menuViewController setDelegate:self];
    [(SKUIMenuViewController *)self->_menuViewController setIndexOfCheckedTitle:self->_selectedMenuItemIndex];
    double v7 = (double)(45 * [(NSArray *)self->_menuItemTitles count]);
    -[SKUIMenuViewController setPreferredContentSize:](self->_menuViewController, "setPreferredContentSize:", 320.0, v7);
    char v8 = (UIPopoverController *)[objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:self->_menuViewController];
    menuPopoverController = self->_menuPopoverController;
    self->_menuPopoverController = v8;

    [(UIPopoverController *)self->_menuPopoverController setDelegate:self];
    -[UIPopoverController setPopoverContentSize:](self->_menuPopoverController, "setPopoverContentSize:", 320.0, v7);
    objc_super v10 = self->_menuPopoverController;
    [v4 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = [v4 superview];

    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v10, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v19, 1, 1, v12, v14, v16, v18);
  }
}

- (void)_reloadMenuButton
{
  selectedMenuItemIndedouble x = self->_selectedMenuItemIndex;
  if (selectedMenuItemIndex < [(NSArray *)self->_menuItemTitles count]
    && ([(NSArray *)self->_menuItemTitles objectAtIndex:self->_selectedMenuItemIndex],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = v4;
    menuButton = self->_menuButton;
    double v25 = (UILabel *)v5;
    if (!menuButton)
    {
      double v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      char v8 = self->_menuButton;
      self->_menuButton = v7;

      [(UIButton *)self->_menuButton addTarget:self action:sel__menuButtonAction_ forControlEvents:0xFFFFFFFFLL];
      id v9 = self->_menuButton;
      objc_super v10 = [(SKUIPopupMenuHeaderView *)self backgroundColor];
      [(UIButton *)v9 setBackgroundColor:v10];

      double v11 = [(UIButton *)self->_menuButton titleLabel];
      double v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
      [v11 setFont:v12];

      [(SKUIPopupMenuHeaderView *)self addSubview:self->_menuButton];
      uint64_t v5 = (uint64_t)v25;
      menuButton = self->_menuButton;
    }
    [(UIButton *)menuButton setTitle:v5 forState:0];
    [(UIButton *)self->_menuButton sizeToFit];
    menuLabelTitle = self->_menuLabelTitle;
    if (menuLabelTitle)
    {
      menuLabel = self->_menuLabel;
      if (!menuLabel)
      {
        double v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v16 = self->_menuLabel;
        self->_menuLabel = v15;

        double v17 = self->_menuLabel;
        double v18 = [(SKUIPopupMenuHeaderView *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        id v19 = self->_menuLabel;
        id v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
        [(UILabel *)v19 setFont:v20];

        double v21 = self->_menuLabel;
        double v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
        [(UILabel *)v21 setTextColor:v22];

        [(SKUIPopupMenuHeaderView *)self addSubview:self->_menuLabel];
        menuLabel = self->_menuLabel;
        menuLabelTitle = self->_menuLabelTitle;
      }
      [(UILabel *)menuLabel setText:menuLabelTitle];
      [(UILabel *)self->_menuLabel sizeToFit];
    }
    [(SKUIPopupMenuHeaderView *)self setNeedsLayout];
    double v23 = v25;
  }
  else
  {
    [(UIButton *)self->_menuButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [(UIButton *)self->_menuButton removeFromSuperview];
    v24 = self->_menuButton;
    self->_menuButton = 0;

    [(UILabel *)self->_menuLabel removeFromSuperview];
    double v23 = self->_menuLabel;
    self->_menuLabel = 0;
  }
}

- (id)_titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    uint64_t v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    uint64_t v5 = self->_titleLabel;
    self->_titleLabel = v4;

    double v6 = self->_titleLabel;
    double v7 = [(SKUIPopupMenuHeaderView *)self backgroundColor];
    [(UILabel *)v6 setBackgroundColor:v7];

    char v8 = self->_titleLabel;
    id v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [(UILabel *)v8 setFont:v9];

    objc_super v10 = self->_titleLabel;
    double v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v10 setTextColor:v11];

    [(SKUIPopupMenuHeaderView *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (SKUIPopupMenuDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIPopupMenuDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)menuItemTitles
{
  return self->_menuItemTitles;
}

- (NSString)menuLabelTitle
{
  return self->_menuLabelTitle;
}

- (int64_t)selectedMenuItemIndex
{
  return self->_selectedMenuItemIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_menuPopoverController, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_menuItemTitles, 0);
  objc_storeStrong((id *)&self->_menuLabelTitle, 0);
  objc_storeStrong((id *)&self->_menuLabel, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPopupMenuHeaderView initWithFrame:]";
}

@end