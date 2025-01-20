@interface MTToolbar
- (BOOL)isSeparatorHidden;
- (MTToolbar)init;
- (UIColor)separatorColor;
- (id)_separatorColor;
- (void)layoutSubviews;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setupView;
@end

@implementation MTToolbar

- (MTToolbar)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTToolbar;
  v2 = [(MTToolbar *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTToolbar *)v2 setupView];
  }
  return v3;
}

- (void)setupView
{
  v3 = objc_opt_new();
  [(MTToolbar *)self setBackgroundImage:v3 forToolbarPosition:0 barMetrics:0];

  v4 = objc_opt_new();
  [(MTToolbar *)self setShadowImage:v4 forToolbarPosition:0];

  objc_super v5 = +[UIColor clearColor];
  [(MTToolbar *)self setBackgroundColor:v5];

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v6;

  v8 = [(MTToolbar *)self _separatorColor];
  [(UIView *)self->_separatorView setBackgroundColor:v8];

  v9 = self->_separatorView;

  [(MTToolbar *)self addSubview:v9];
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTToolbar *)self isSeparatorHidden] != a3)
  {
    separatorView = self->_separatorView;
    [(UIView *)separatorView setHidden:v3];
  }
}

- (BOOL)isSeparatorHidden
{
  return [(UIView *)self->_separatorView isHidden];
}

- (void)setSeparatorColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_separatorColor, a3);
    v7 = [(MTToolbar *)self _separatorColor];
    [(UIView *)self->_separatorView setBackgroundColor:v7];

    objc_super v5 = v8;
  }

  _objc_release_x1(p_separatorColor, v5);
}

- (id)_separatorColor
{
  v2 = [(MTToolbar *)self separatorColor];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIColor cellSeparatorColor];
  }
  objc_super v5 = v4;

  return v5;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MTToolbar;
  [(MTToolbar *)&v9 layoutSubviews];
  if (self->_separatorView)
  {
    BOOL v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    [(MTToolbar *)self bounds];
    double v7 = v6;
    [(MTToolbar *)self bounds];
    -[UIView setFrame:](self->_separatorView, "setFrame:", CGRectZero.origin.x, v8 - 1.0 / v5, v7, 1.0 / v5);
  }
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);

  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end