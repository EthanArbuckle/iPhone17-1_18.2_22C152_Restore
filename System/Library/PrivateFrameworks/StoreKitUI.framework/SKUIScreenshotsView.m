@interface SKUIScreenshotsView
- (SKUIScreenshotsView)initWithFrame:(CGRect)a3;
- (UIView)primaryView;
- (void)layoutSubviews;
- (void)setPrimaryView:(id)a3;
@end

@implementation SKUIScreenshotsView

- (SKUIScreenshotsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScreenshotsView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIScreenshotsView;
  v8 = -[SKUIScreenshotsView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v9;

    v11 = v8->_separatorView;
    v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v11 setBackgroundColor:v12];

    [(SKUIScreenshotsView *)v8 addSubview:v8->_separatorView];
  }
  return v8;
}

- (void)setPrimaryView:(id)a3
{
  v5 = (UIView *)a3;
  primaryView = self->_primaryView;
  if (primaryView != v5)
  {
    v7 = v5;
    [(UIView *)primaryView removeFromSuperview];
    objc_storeStrong((id *)&self->_primaryView, a3);
    [(SKUIScreenshotsView *)self addSubview:self->_primaryView];
    primaryView = (UIView *)[(SKUIScreenshotsView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](primaryView, v5);
}

- (void)layoutSubviews
{
  [(SKUIScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  primaryView = self->_primaryView;
  if (primaryView) {
    -[UIView setFrame:](primaryView, "setFrame:");
  }
  if (self->_separatorView)
  {
    -[SKUIScreenshotsView bringSubviewToFront:](self, "bringSubviewToFront:");
    separatorView = self->_separatorView;
    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    double v10 = v6 - 1.0 / v9;
    v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v10, v4 + -15.0, 1.0 / v12);
  }
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_primaryView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScreenshotsView initWithFrame:]";
}

@end