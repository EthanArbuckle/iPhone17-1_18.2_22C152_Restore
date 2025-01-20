@interface PKRightAngleRotatingView
- (BOOL)_dimensionsAreRotated;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKRightAngleRotatingView)initWithRotatedView:(id)a3;
- (UIView)rotatedView;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setOrientation:(int64_t)a3;
- (void)sizeToFit;
- (void)updateTransform;
@end

@implementation PKRightAngleRotatingView

- (PKRightAngleRotatingView)initWithRotatedView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRightAngleRotatingView;
  v6 = [(PKRightAngleRotatingView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rotatedView, a3);
    [(PKRightAngleRotatingView *)v7 addSubview:v5];
    v7->_orientation = 0;
    [(PKRightAngleRotatingView *)v7 updateTransform];
  }

  return v7;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  [(PKRightAngleRotatingView *)self updateTransform];
}

- (void)updateTransform
{
  int64_t orientation = self->_orientation;
  CGFloat v4 = 0.0;
  if ((unint64_t)(orientation - 1) <= 6) {
    CGFloat v4 = dbl_1A0442F78[orientation - 1];
  }
  memset(&v12, 0, sizeof(v12));
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v11.c = v5;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v12, &v11, v4);
  if ((unint64_t)(orientation - 4) < 2)
  {
    [(UIView *)self->_rotatedView bounds];
    CGFloat v7 = v8;
    goto LABEL_7;
  }
  if ((unint64_t)(orientation - 6) < 2)
  {
    [(UIView *)self->_rotatedView bounds];
    CGFloat v7 = v6;
LABEL_7:
    CGAffineTransform v10 = v12;
    CGAffineTransformTranslate(&v11, &v10, v7, 0.0);
    CGAffineTransform v12 = v11;
    CGAffineTransform v10 = v11;
    CGAffineTransformScale(&v11, &v10, -1.0, 1.0);
    CGAffineTransform v12 = v11;
  }
  *(CGAffineTransform *)_transform = v12;
  rotatedView = self->_rotatedView;
  CGAffineTransform v11 = v12;
  [(UIView *)rotatedView setTransform:&v11];
  [(PKRightAngleRotatingView *)self setNeedsLayout];
}

- (BOOL)_dimensionsAreRotated
{
  return ((self->_orientation - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_rotatedView, "sizeThatFits:", a3.height * *(double *)&_transform[16] + *(double *)_transform * a3.width, a3.height * *(double *)&_transform[24] + *(double *)&_transform[8] * a3.width);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)sizeToFit
{
  [(UIView *)self->_rotatedView sizeToFit];
  [(UIView *)self->_rotatedView bounds];
  double v4 = v3;
  double v6 = v5;
  CGAffineTransform v7 = *(CGAffineTransform *)_transform;
  CGAffineTransformInvert(&v8, &v7);
  -[PKRightAngleRotatingView setBounds:](self, "setBounds:", 0.0, 0.0, v6 * v8.c + v8.a * v4, v6 * v8.d + v8.b * v4);
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_rotatedView intrinsicContentSize];
  double v4 = v2 * *(double *)&_transform[16] + *(double *)_transform * v3;
  double v5 = v2 * *(double *)&_transform[24] + *(double *)&_transform[8] * v3;
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKRightAngleRotatingView;
  [(PKRightAngleRotatingView *)&v10 layoutSubviews];
  [(PKRightAngleRotatingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(PKRightAngleRotatingView *)self _dimensionsAreRotated];
  if (v7) {
    double v8 = v6;
  }
  else {
    double v8 = v4;
  }
  if (v7) {
    double v9 = v4;
  }
  else {
    double v9 = v6;
  }
  -[UIView setBounds:](self->_rotatedView, "setBounds:", 0.0, 0.0, v8, v9);
  -[UIView setCenter:](self->_rotatedView, "setCenter:", v4 * 0.5, v6 * 0.5);
}

- (UIView)rotatedView
{
  return self->_rotatedView;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
}

@end