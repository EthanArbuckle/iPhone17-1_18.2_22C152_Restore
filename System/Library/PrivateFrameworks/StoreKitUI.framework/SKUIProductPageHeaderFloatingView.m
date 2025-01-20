@interface SKUIProductPageHeaderFloatingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIColorScheme)colorScheme;
- (SKUIProductPageHeaderFloatingView)initWithSectionTitles:(id)a3 isPad:(BOOL)a4;
- (UIControl)sectionControl;
- (double)backdropAlpha;
- (int64_t)selectedSectionIndex;
- (void)_reloadBackdropView;
- (void)layoutSubviews;
- (void)setBackdropAlpha:(double)a3;
- (void)setColorScheme:(id)a3;
- (void)setSelectedSectionIndex:(int64_t)a3;
@end

@implementation SKUIProductPageHeaderFloatingView

- (SKUIProductPageHeaderFloatingView)initWithSectionTitles:(id)a3 isPad:(BOOL)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageHeaderFloatingView initWithSectionTitles:isPad:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIProductPageHeaderFloatingView;
  v7 = -[SKUIProductPageHeaderFloatingView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v7)
  {
    v8 = [[SKUIProductPageSegmentedControl alloc] initWithItems:v6];
    sectionControl = v7->_sectionControl;
    v7->_sectionControl = &v8->super;

    [(UISegmentedControl *)v7->_sectionControl setSelectedSegmentIndex:0];
    v10 = v7->_sectionControl;
    v11 = [(SKUIColorScheme *)v7->_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UISegmentedControl *)v10 setTintColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)v10 setTintColor:v12];
    }
    [(SKUIProductPageHeaderFloatingView *)v7 addSubview:v7->_sectionControl];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v13;

    v15 = v7->_separatorView;
    v16 = [(SKUIColorScheme *)v7->_colorScheme primaryTextColor];
    if (v16)
    {
      [(UIView *)v15 setBackgroundColor:v16];
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.70588237 alpha:1.0];
      [(UIView *)v15 setBackgroundColor:v17];
    }
    [(SKUIProductPageHeaderFloatingView *)v7 addSubview:v7->_separatorView];
    v7->_isPad = a4;
    [(SKUIProductPageHeaderFloatingView *)v7 _reloadBackdropView];
  }

  return v7;
}

- (void)setBackdropAlpha:(double)a3
{
  [(SKUIProductPageHeaderFloatingView *)self backdropAlpha];
  if (v5 != a3)
  {
    backdropAlphaView = self->_backdropAlphaView;
    [(UIView *)backdropAlphaView setAlpha:a3];
  }
}

- (double)backdropAlpha
{
  [(UIView *)self->_backdropAlphaView alpha];
  return result;
}

- (void)setColorScheme:(id)a3
{
  double v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    sectionControl = self->_sectionControl;
    v8 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UISegmentedControl *)sectionControl setTintColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
      [(UISegmentedControl *)sectionControl setTintColor:v9];
    }
    separatorView = self->_separatorView;
    v11 = [(SKUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v11)
    {
      [(UIView *)separatorView setBackgroundColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.70588237 alpha:1.0];
      [(UIView *)separatorView setBackgroundColor:v12];
    }
    [(SKUIProductPageHeaderFloatingView *)self _reloadBackdropView];
    double v5 = v13;
  }
}

- (int64_t)selectedSectionIndex
{
  return [(UISegmentedControl *)self->_sectionControl selectedSegmentIndex];
}

- (void)setSelectedSectionIndex:(int64_t)a3
{
}

- (void)layoutSubviews
{
  [(SKUIProductPageHeaderFloatingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  sectionControl = self->_sectionControl;
  if (sectionControl)
  {
    [(UISegmentedControl *)sectionControl sizeToFit];
    [(UISegmentedControl *)self->_sectionControl frame];
    if (self->_isPad) {
      double v12 = 290.0;
    }
    else {
      double v12 = v8 + -30.0;
    }
    float v13 = (v8 - v12) * 0.5;
    -[UISegmentedControl setFrame:](self->_sectionControl, "setFrame:", roundf(v13), 10.0);
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(UIView *)separatorView frame];
    v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    double v17 = 1.0 / v16;

    -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v10 - v17, v8, v17);
  }
  backdropView = self->_backdropView;
  if (backdropView) {
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  }
  backdropAlphaView = self->_backdropAlphaView;
  if (backdropAlphaView)
  {
    -[UIView setFrame:](backdropAlphaView, "setFrame:", v4, v6, v8, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UISegmentedControl sizeThatFits:](self->_sectionControl, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 20.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)_reloadBackdropView
{
  if (self->_colorScheme || self->_isPad)
  {
    [(_UIBackdropView *)self->_backdropView removeFromSuperview];
    backdropView = self->_backdropView;
    self->_backdropView = 0;

    [(UIView *)self->_backdropAlphaView removeFromSuperview];
    backdropAlphaView = self->_backdropAlphaView;
    self->_backdropAlphaView = 0;

    double v5 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
    if (!v5)
    {
      double v6 = [MEMORY[0x1E4FB1618] whiteColor];
      [(SKUIProductPageHeaderFloatingView *)self setBackgroundColor:v6];

      goto LABEL_14;
    }
  }
  else
  {
    if (!self->_backdropView)
    {
      double v7 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:10060];
      double v8 = self->_backdropView;
      self->_backdropView = v7;

      [(SKUIProductPageHeaderFloatingView *)self insertSubview:self->_backdropView atIndex:0];
    }
    if (!self->_backdropAlphaView)
    {
      double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v10 = self->_backdropAlphaView;
      self->_backdropAlphaView = v9;

      v11 = self->_backdropAlphaView;
      double v12 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
      if (v12)
      {
        [(UIView *)v11 setBackgroundColor:v12];
      }
      else
      {
        float v13 = [MEMORY[0x1E4FB1618] whiteColor];
        [(UIView *)v11 setBackgroundColor:v13];
      }
      [(SKUIProductPageHeaderFloatingView *)self insertSubview:self->_backdropAlphaView atIndex:1];
    }
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [(SKUIProductPageHeaderFloatingView *)self setBackgroundColor:v5];
LABEL_14:

  [(SKUIProductPageHeaderFloatingView *)self setNeedsLayout];
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (UIControl)sectionControl
{
  return &self->_sectionControl->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backdropAlphaView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_sectionControl, 0);
}

- (void)initWithSectionTitles:isPad:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageHeaderFloatingView initWithSectionTitles:isPad:]";
}

@end