@interface SUUIScreenshotsView
- (SUUIScreenshotsView)initWithFrame:(CGRect)a3;
- (UIView)primaryView;
- (void)layoutSubviews;
- (void)setPrimaryView:(id)a3;
@end

@implementation SUUIScreenshotsView

- (SUUIScreenshotsView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIScreenshotsView;
  v3 = -[SUUIScreenshotsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    v6 = v3->_separatorView;
    v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    [(SUUIScreenshotsView *)v3 addSubview:v3->_separatorView];
  }
  return v3;
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
    [(SUUIScreenshotsView *)self addSubview:self->_primaryView];
    primaryView = (UIView *)[(SUUIScreenshotsView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](primaryView, v5);
}

- (void)layoutSubviews
{
  [(SUUIScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  primaryView = self->_primaryView;
  if (primaryView) {
    -[UIView setFrame:](primaryView, "setFrame:");
  }
  if (self->_separatorView)
  {
    -[SUUIScreenshotsView bringSubviewToFront:](self, "bringSubviewToFront:");
    separatorView = self->_separatorView;
    id v13 = [MEMORY[0x263F82B60] mainScreen];
    [v13 scale];
    double v10 = v6 - 1.0 / v9;
    v11 = [MEMORY[0x263F82B60] mainScreen];
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

@end