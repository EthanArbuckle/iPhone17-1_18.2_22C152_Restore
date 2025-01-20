@interface UIMovieScrubberTrackOverlayView
- (UIMovieScrubberTrackOverlayView)initWithFrame:(CGRect)a3;
- (void)_clampValueAndLayout;
- (void)_updateLeftFill;
- (void)_updateRightFill;
- (void)animateFillFramesAway;
- (void)layoutSubviews;
- (void)setEditing:(BOOL)a3;
- (void)setEditingHandle:(int)a3;
- (void)setEndValue:(double)a3;
- (void)setIsZoomed:(BOOL)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setStartValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation UIMovieScrubberTrackOverlayView

- (UIMovieScrubberTrackOverlayView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIMovieScrubberTrackOverlayView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = _UIImageWithName(@"UIMovieScrubberFill.png");
    v5 = [[UIImageView alloc] initWithImage:v4];
    leftFillView = v3->_leftFillView;
    v3->_leftFillView = v5;

    [(UIImageView *)v3->_leftFillView setContentMode:0];
    [(UIView *)v3->_leftFillView setAlpha:0.0];
    [(UIView *)v3 addSubview:v3->_leftFillView];
    v7 = [[UIImageView alloc] initWithImage:v4];
    rightFillView = v3->_rightFillView;
    v3->_rightFillView = v7;

    [(UIImageView *)v3->_rightFillView setContentMode:0];
    [(UIView *)v3->_rightFillView setAlpha:0.0];
    [(UIView *)v3 addSubview:v3->_rightFillView];
    [(UIView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)_updateLeftFill
{
  if (*((unsigned char *)self + 468))
  {
    [(UIView *)self bounds];
    leftFillView = self->_leftFillView;
    -[UIImageView setFrame:](leftFillView, "setFrame:");
  }
}

- (void)_updateRightFill
{
  if (*((unsigned char *)self + 468))
  {
    [(UIView *)self bounds];
    double maximumValue = self->_maximumValue;
    double minimumValue = self->_minimumValue;
    double v6 = 0.0;
    if (maximumValue != minimumValue)
    {
      double endValue = self->_endValue;
      if (maximumValue < endValue) {
        double endValue = self->_maximumValue;
      }
      float v8 = endValue;
      double v6 = (maximumValue - v8) / (maximumValue - minimumValue);
    }
    float v9 = v3 * v6;
    rightFillView = self->_rightFillView;
    double v11 = v3 - rintf(v9);
    [(UIImageView *)rightFillView setFrame:v11];
  }
}

- (void)animateFillFramesAway
{
  [(UIView *)self->_leftFillView frame];
  -[UIImageView setFrame:](self->_leftFillView, "setFrame:");
  [(UIView *)self->_rightFillView frame];
  [(UIImageView *)self->_rightFillView setFrame:v3 + v4];
  *((unsigned char *)self + 468) &= ~1u;
}

- (void)_clampValueAndLayout
{
  double value = self->_value;
  double minimumValue = self->_minimumValue;
  if (value < minimumValue)
  {
    self->_double value = minimumValue;
    double value = minimumValue;
  }
  double maximumValue = self->_maximumValue;
  if (value > maximumValue) {
    self->_double value = maximumValue;
  }
  [(UIView *)self setNeedsLayout];
}

- (void)setEditing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 468);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 468) = v3 & 0xFE | a3;
    rightFillView = self->_rightFillView;
    if (a3) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    [(UIView *)rightFillView setAlpha:v6];
    if (*((unsigned char *)self + 468)) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    [(UIView *)self->_leftFillView setAlpha:v7];
    [(UIMovieScrubberTrackOverlayView *)self _clampValueAndLayout];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_double value = a3;
    [(UIMovieScrubberTrackOverlayView *)self _clampValueAndLayout];
  }
}

- (void)setStartValue:(double)a3
{
  if (self->_startValue != a3)
  {
    self->_startValue = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setEndValue:(double)a3
{
  if (self->_endValue != a3)
  {
    self->_double endValue = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setMinimumValue:(double)a3
{
  if (self->_minimumValue != a3) {
    self->_double minimumValue = a3;
  }
}

- (void)setMaximumValue:(double)a3
{
  if (self->_maximumValue != a3) {
    self->_double maximumValue = a3;
  }
}

- (void)setIsZoomed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 468) = *((unsigned char *)self + 468) & 0xFD | v3;
}

- (void)setEditingHandle:(int)a3
{
  self->_editingHandle = a3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubberTrackOverlayView;
  [(UIView *)&v3 layoutSubviews];
  [(UIMovieScrubberTrackOverlayView *)self _updateLeftFill];
  [(UIMovieScrubberTrackOverlayView *)self _updateRightFill];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightFillView, 0);
  objc_storeStrong((id *)&self->_leftFillView, 0);
}

@end