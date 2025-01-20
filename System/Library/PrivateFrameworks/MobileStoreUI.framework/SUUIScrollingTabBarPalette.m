@interface SUUIScrollingTabBarPalette
- (BOOL)isAttached;
- (BOOL)tabBarBackgroundExtendsBehindPalette;
- (SUUIScrollingTabBarBackgroundView)_backgroundView;
- (SUUIScrollingTabBarPalette)initWithFrame:(CGRect)a3;
- (SUUIScrollingTabBarPaletteDelegate)_delegate;
- (UIView)contentView;
- (double)paletteHeight;
- (void)_setAttached:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)layoutSubviews;
- (void)setTabBarBackgroundExtendsBehindPalette:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUUIScrollingTabBarPalette

- (SUUIScrollingTabBarPalette)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)SUUIScrollingTabBarPalette;
  v7 = -[SUUIScrollingTabBarPalette initWithFrame:](&v21, sel_initWithFrame_);
  if (v7)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    v7->_paletteHeight = CGRectGetHeight(v22);
    [(SUUIScrollingTabBarPalette *)v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = -[SUUIScrollingTabBarBackgroundView initWithFrame:]([SUUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v8, v10, v12, v14);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v16;

    [(SUUIScrollingTabBarPalette *)v7 addSubview:v7->_backgroundView];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v9, v11, v13, v15);
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v18;

    [(SUUIScrollingTabBarPalette *)v7 addSubview:v7->_contentView];
    v7->_tabBarBackgroundExtendsBehindPalette = 1;
  }
  return v7;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIScrollingTabBarPalette;
  [(SUUIScrollingTabBarPalette *)&v16 layoutSubviews];
  [(SUUIScrollingTabBarPalette *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SUUIScrollingTabBarPalette *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  if (v13 < 0.00000011920929)
  {
    double v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    double v13 = v15;
  }
  -[SUUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10 + -1.0 / v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIScrollingTabBarPalette;
  id v4 = a3;
  [(SUUIScrollingTabBarPalette *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  double v7 = [(SUUIScrollingTabBarPalette *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929) {
    [(SUUIScrollingTabBarPalette *)self setNeedsLayout];
  }
}

- (void)setTabBarBackgroundExtendsBehindPalette:(BOOL)a3
{
  if (self->_tabBarBackgroundExtendsBehindPalette != a3)
  {
    self->_tabBarBackgroundExtendsBehindPalette = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:self];
    }
  }
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)_setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)paletteHeight
{
  return self->_paletteHeight;
}

- (BOOL)tabBarBackgroundExtendsBehindPalette
{
  return self->_tabBarBackgroundExtendsBehindPalette;
}

- (SUUIScrollingTabBarPaletteDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIScrollingTabBarPaletteDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (SUUIScrollingTabBarBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end