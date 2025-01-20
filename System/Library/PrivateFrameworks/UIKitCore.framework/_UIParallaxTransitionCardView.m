@interface _UIParallaxTransitionCardView
- (UIView)contentView;
- (_UIParallaxTransitionCardView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UIParallaxTransitionCardView

- (_UIParallaxTransitionCardView)initWithFrame:(CGRect)a3
{
  v39.receiver = self;
  v39.super_class = (Class)_UIParallaxTransitionCardView;
  v3 = -[UIView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    v7 = +[_UIFluidNavigationTransitionsDomain parallaxSettings];
    int v8 = [v7 roundedCorners];

    if (v8)
    {
      v9 = +[UIScreen mainScreen];
      [v9 _displayCornerRadius];
      double v11 = v10;
      v12 = [(UIView *)v3->_contentView layer];
      [v12 setCornerRadius:v11];

      uint64_t v13 = *MEMORY[0x1E4F39EA8];
      v14 = [(UIView *)v3->_contentView layer];
      [v14 setCornerCurve:v13];

      v15 = [(UIView *)v3->_contentView layer];
      [v15 setMasksToBounds:1];

      v16 = [(UIView *)v3->_contentView layer];
      [v16 cornerRadius];
      double v18 = v17;
      v19 = [(UIView *)v3 layer];
      [v19 setCornerRadius:v18];

      v20 = [(UIView *)v3->_contentView layer];
      v21 = [v20 cornerCurve];
      v22 = [(UIView *)v3 layer];
      [v22 setCornerCurve:v21];

      id v23 = +[UIColor blackColor];
      uint64_t v24 = [v23 CGColor];
      v25 = [(UIView *)v3 layer];
      [v25 setShadowColor:v24];

      v26 = [(UIView *)v3 layer];
      LODWORD(v27) = 1039516303;
      [v26 setShadowOpacity:v27];

      v28 = [(UIView *)v3 layer];
      [v28 setShadowRadius:12.0];
    }
    [(UIView *)v3 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(_UIParallaxTransitionCardView *)v3 contentView];
    objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

    [(UIView *)v3 addSubview:v3->_contentView];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIParallaxTransitionCardView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  contentView = self->_contentView;
  [(UIView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIParallaxTransitionCardView;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  contentView = self->_contentView;
  [(UIView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end