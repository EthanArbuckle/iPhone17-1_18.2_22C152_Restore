@interface _TVStackBackdropMaskingView
- (_TVStackBackdropMaskingView)initWithFrame:(CGRect)a3;
- (_TVStackBackdropView)backdropView;
- (double)gradientScale;
- (double)gradientStop;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setGradientScale:(double)a3;
- (void)setGradientStop:(double)a3;
@end

@implementation _TVStackBackdropMaskingView

- (_TVStackBackdropMaskingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVStackBackdropMaskingView;
  v3 = -[_TVStackBackdropMaskingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_gradientStop = 1.0;
    [(_TVStackBackdropMaskingView *)v3 setClipsSubviews:1];
  }
  return v4;
}

- (void)setBackdropView:(id)a3
{
  v5 = (_TVStackBackdropView *)a3;
  p_backdropView = &self->_backdropView;
  backdropView = self->_backdropView;
  if (backdropView != v5)
  {
    v9 = v5;
    v8 = [(_TVStackBackdropView *)backdropView layer];
    [v8 setMask:0];

    [(_TVStackBackdropView *)*p_backdropView removeFromSuperview];
    objc_storeStrong((id *)&self->_backdropView, a3);
    if (*p_backdropView) {
      -[_TVStackBackdropMaskingView addSubview:](self, "addSubview:");
    }
    backdropView = (_TVStackBackdropView *)[(_TVStackBackdropMaskingView *)self setNeedsLayout];
    v5 = v9;
  }
  MEMORY[0x270F9A758](backdropView, v5);
}

- (void)setGradientScale:(double)a3
{
  if (self->_gradientScale != a3)
  {
    self->_gradientScale = a3;
    [(_TVStackBackdropMaskingView *)self setNeedsLayout];
  }
}

- (void)setGradientStop:(double)a3
{
  if (self->_gradientStop != a3)
  {
    self->_gradientStop = a3;
    [(_TVStackBackdropMaskingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v34[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)_TVStackBackdropMaskingView;
  [(_TVStackBackdropMaskingView *)&v32 layoutSubviews];
  [(_TVStackBackdropMaskingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(_TVStackBackdropView *)self->_backdropView bounds];
  double v8 = v7;
  -[_TVStackBackdropView setFrame:](self->_backdropView, "setFrame:", 0.0, v6 - v7, v4);
  [(_TVStackBackdropMaskingView *)self gradientScale];
  if (v9 <= 0.0)
  {
    v31 = [(_TVStackBackdropView *)self->_backdropView layer];
    [v31 setMask:0];

    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = 0;
  }
  else
  {
    v10 = self->_gradientLayer;
    if (!v10)
    {
      v11 = [MEMORY[0x263F157D0] layer];
      v12 = self->_gradientLayer;
      self->_gradientLayer = v11;

      v13 = [(_TVStackBackdropView *)self->_backdropView layer];
      [v13 setMask:self->_gradientLayer];

      v10 = self->_gradientLayer;
    }
    -[CAGradientLayer setFrame:](v10, "setFrame:", 0.0, v8 - v6, v4, v6);
    v14 = self->_gradientLayer;
    id v15 = [MEMORY[0x263F1C550] clearColor];
    v34[0] = [v15 CGColor];
    v16 = (void *)MEMORY[0x263F1C550];
    [(_TVStackBackdropMaskingView *)self gradientStop];
    id v18 = [v16 colorWithRed:1.0 green:1.0 blue:1.0 alpha:v17 * 0.3];
    v34[1] = [v18 CGColor];
    v19 = (void *)MEMORY[0x263F1C550];
    [(_TVStackBackdropMaskingView *)self gradientStop];
    id v21 = [v19 colorWithRed:1.0 green:1.0 blue:1.0 alpha:v20];
    v34[2] = [v21 CGColor];
    id v22 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v34[3] = [v22 CGColor];
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
    [(CAGradientLayer *)v14 setColors:v23];

    v24 = self->_gradientLayer;
    v33[0] = &unk_26E59EC78;
    v25 = NSNumber;
    [(_TVStackBackdropMaskingView *)self gradientScale];
    gradientLayer = [v25 numberWithDouble:v26 * 0.5];
    v33[1] = gradientLayer;
    v28 = NSNumber;
    [(_TVStackBackdropMaskingView *)self gradientScale];
    v29 = objc_msgSend(v28, "numberWithDouble:");
    v33[2] = v29;
    v33[3] = &unk_26E59EC88;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [(CAGradientLayer *)v24 setLocations:v30];
  }
}

- (_TVStackBackdropView)backdropView
{
  return self->_backdropView;
}

- (double)gradientScale
{
  return self->_gradientScale;
}

- (double)gradientStop
{
  return self->_gradientStop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end