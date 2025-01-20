@interface SKUIScrollingTabBarPalette
- (BOOL)isAttached;
- (BOOL)tabBarBackgroundExtendsBehindPalette;
- (SKUIScrollingTabBarBackgroundView)_backgroundView;
- (SKUIScrollingTabBarPalette)initWithFrame:(CGRect)a3;
- (SKUIScrollingTabBarPaletteDelegate)_delegate;
- (UIView)contentView;
- (double)paletteHeight;
- (void)_setAttached:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)layoutSubviews;
- (void)setTabBarBackgroundExtendsBehindPalette:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SKUIScrollingTabBarPalette

- (SKUIScrollingTabBarPalette)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabBarPalette initWithFrame:]();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIScrollingTabBarPalette;
  v8 = -[SKUIScrollingTabBarPalette initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    v8->_paletteHeight = CGRectGetHeight(v23);
    [(SKUIScrollingTabBarPalette *)v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = -[SKUIScrollingTabBarBackgroundView initWithFrame:]([SKUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v9, v11, v13, v15);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v17;

    [(SKUIScrollingTabBarPalette *)v8 addSubview:v8->_backgroundView];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v12, v14, v16);
    contentView = v8->_contentView;
    v8->_contentView = (UIView *)v19;

    [(SKUIScrollingTabBarPalette *)v8 addSubview:v8->_contentView];
    v8->_tabBarBackgroundExtendsBehindPalette = 1;
  }
  return v8;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SKUIScrollingTabBarPalette;
  [(SKUIScrollingTabBarPalette *)&v16 layoutSubviews];
  [(SKUIScrollingTabBarPalette *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SKUIScrollingTabBarPalette *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  if (v13 < 0.00000011920929)
  {
    double v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];
    double v13 = v15;
  }
  -[SKUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10 + -1.0 / v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabBarPalette;
  id v4 = a3;
  [(SKUIScrollingTabBarPalette *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  double v7 = [(SKUIScrollingTabBarPalette *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929) {
    [(SKUIScrollingTabBarPalette *)self setNeedsLayout];
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

- (SKUIScrollingTabBarPaletteDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIScrollingTabBarPaletteDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (SKUIScrollingTabBarBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarPalette initWithFrame:]";
}

@end