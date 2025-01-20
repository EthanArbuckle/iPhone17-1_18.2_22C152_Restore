@interface SKUIProductPagePlaceholderScrollView
- (BOOL)isPad;
- (UIView)placeholderView;
- (double)offset;
- (void)layoutSubviews;
- (void)setIsPad:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setPlaceholderView:(id)a3;
@end

@implementation SKUIProductPagePlaceholderScrollView

- (void)setPlaceholderView:(id)a3
{
  v5 = (UIView *)a3;
  placeholderView = self->_placeholderView;
  if (placeholderView != v5)
  {
    v7 = v5;
    [(UIView *)placeholderView removeFromSuperview];
    objc_storeStrong((id *)&self->_placeholderView, a3);
    if (self->_placeholderView) {
      -[SKUIProductPagePlaceholderScrollView addSubview:](self, "addSubview:");
    }
    placeholderView = (UIView *)[(SKUIProductPagePlaceholderScrollView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](placeholderView, v5);
}

- (void)layoutSubviews
{
  [(SKUIProductPagePlaceholderScrollView *)self bounds];
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    double v6 = v3;
    double v7 = v4;
    [(UIView *)placeholderView sizeToFit];
    if (!self->_isPad)
    {
      [(SKUIProductPagePlaceholderScrollView *)self contentInset];
      double v9 = v7 - v8;
      [(SKUIProductPagePlaceholderScrollView *)self contentInset];
      double v7 = v9 - v10;
    }
    [(UIView *)self->_placeholderView frame];
    float v13 = (v7 - v12) * 0.5;
    double offset = roundf(v13);
    if (self->_offset != 0.0) {
      double offset = self->_offset;
    }
    float v15 = (v6 - v11) * 0.5;
    -[UIView setFrame:](self->_placeholderView, "setFrame:", roundf(v15), offset);
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIProductPagePlaceholderScrollView;
  [(SKUIProductPagePlaceholderScrollView *)&v16 layoutSubviews];
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_double offset = a3;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void).cxx_destruct
{
}

@end