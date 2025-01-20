@interface _UITableViewCellSeparatorView
- (BOOL)drawsWithVibrantLightMode;
- (UIVisualEffect)separatorEffect;
- (_UITableViewCellSeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDrawsWithVibrantLightMode:(BOOL)a3;
- (void)setSeparatorEffect:(id)a3;
@end

@implementation _UITableViewCellSeparatorView

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_UITableViewCellSeparatorView;
  [(UIView *)&v11 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_effectView, "setFrame:", v4, v6, v8, v10);
}

- (void)setSeparatorEffect:(id)a3
{
  double v5 = (UIVisualEffect *)a3;
  p_separatorEffect = &self->_separatorEffect;
  if (self->_separatorEffect != v5)
  {
    objc_storeStrong((id *)&self->_separatorEffect, a3);
    [(UIView *)self->_effectView removeFromSuperview];
    effectView = self->_effectView;
    self->_effectView = 0;

    if (*p_separatorEffect)
    {
      double v8 = [[UIVisualEffectView alloc] initWithEffect:*p_separatorEffect];
      double v9 = self->_effectView;
      self->_effectView = v8;

      double v10 = [(UIView *)self->_effectView layer];
      [v10 setAllowsEdgeAntialiasing:1];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52___UITableViewCellSeparatorView_setSeparatorEffect___block_invoke;
      v17[3] = &unk_1E52D9F70;
      v17[4] = self;
      +[UIView performWithoutAnimation:v17];
      [(UIView *)self addSubview:self->_effectView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v11 = [(UIVisualEffectView *)self->_effectView contentView];
        v12 = [v11 tintColor];
        v13 = [(UIVisualEffectView *)self->_effectView contentView];
        [v13 setBackgroundColor:v12];

        v14 = [(UIVisualEffectView *)self->_effectView contentView];
        v15 = [v14 layer];
        [v15 setAllowsEdgeAntialiasing:1];

        v16 = [(UIVisualEffectView *)self->_effectView contentView];
        [v16 setClipsToBounds:0];
      }
    }
  }
}

- (_UITableViewCellSeparatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITableViewCellSeparatorView;
  double v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];
  }
  return v4;
}

- (void)setDrawsWithVibrantLightMode:(BOOL)a3
{
  self->_drawsWithVibrantLightMode = a3;
  backgroundView = self->_backgroundView;
  if (a3)
  {
    if (!backgroundView)
    {
      double v5 = [UIView alloc];
      [(UIView *)self bounds];
      double v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      objc_super v7 = self->_backgroundView;
      self->_backgroundView = v6;

      double v8 = +[UIColor colorWithWhite:0.250980392 alpha:0.3];
      [(UIView *)self->_backgroundView setBackgroundColor:v8];

      uint64_t v9 = *MEMORY[0x1E4F3A008];
      double v10 = [(UIView *)self->_backgroundView layer];
      [v10 setCompositingFilter:v9];

      objc_super v11 = [(UIView *)self->_backgroundView layer];
      [v11 setAllowsEdgeAntialiasing:1];
    }
    if (!self->_overlayView)
    {
      v12 = [UIView alloc];
      [(UIView *)self bounds];
      v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
      overlayView = self->_overlayView;
      self->_overlayView = v13;

      v15 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.31372549 alpha:0.1];
      [(UIView *)self->_overlayView setBackgroundColor:v15];

      uint64_t v16 = *MEMORY[0x1E4F3A2E0];
      v17 = [(UIView *)self->_overlayView layer];
      [v17 setCompositingFilter:v16];

      v18 = [(UIView *)self->_overlayView layer];
      [v18 setAllowsEdgeAntialiasing:1];
    }
    [(UIView *)self addSubview:self->_backgroundView];
    [(UIView *)self addSubview:self->_overlayView];
    id v20 = [(UIView *)self layer];
    [v20 setAllowsGroupBlending:0];
  }
  else
  {
    [(UIView *)backgroundView removeFromSuperview];
    v19 = self->_overlayView;
    [(UIView *)v19 removeFromSuperview];
  }
}

- (BOOL)drawsWithVibrantLightMode
{
  return self->_drawsWithVibrantLightMode;
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end