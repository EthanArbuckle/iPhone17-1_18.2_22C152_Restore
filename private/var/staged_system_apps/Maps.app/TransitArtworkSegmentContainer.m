@interface TransitArtworkSegmentContainer
- (BOOL)showBackground;
- (UIEdgeInsets)alignmentRectInsets;
- (void)layoutSubviews;
- (void)setShowBackground:(BOOL)a3;
@end

@implementation TransitArtworkSegmentContainer

- (void)setShowBackground:(BOOL)a3
{
  if (self->_showBackground != a3)
  {
    self->_showBackground = a3;
    if (a3)
    {
      id v4 = objc_alloc((Class)UIView);
      [(TransitArtworkSegmentContainer *)self bounds];
      v5 = [v4 initWithFrame:];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      [(UIView *)self->_backgroundView setAutoresizingMask:18];
      v7 = +[UIColor tertiarySystemFillColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v7];

      v8 = self->_backgroundView;
      [(TransitArtworkSegmentContainer *)self addSubview:v8];
    }
    else
    {
      [(UIView *)self->_backgroundView removeFromSuperview];
      v9 = self->_backgroundView;
      self->_backgroundView = 0;
    }
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TransitArtworkSegmentContainer;
  [(TransitArtworkSegmentContainer *)&v6 layoutSubviews];
  v3 = [(UIView *)self->_backgroundView superview];

  if (v3 == self)
  {
    [(TransitArtworkSegmentContainer *)self sendSubviewToBack:self->_backgroundView];
    [(TransitArtworkSegmentContainer *)self bounds];
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    [(TransitArtworkSegmentContainer *)self bounds];
    CGFloat v4 = CGRectGetHeight(v7) * 0.5;
    v5 = [(UIView *)self->_backgroundView layer];
    [v5 setCornerRadius:v4];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  if ([(TransitArtworkSegmentContainer *)self showBackground])
  {
    double top = 0.0;
    double left = 8.0;
    double bottom = 0.0;
    double right = 8.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)showBackground
{
  return self->_showBackground;
}

- (void).cxx_destruct
{
}

@end