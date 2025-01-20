@interface _UIAlertControllerShadowedScrollView
- (BOOL)shouldPinToBottomOnResize;
- (CGRect)_boundsForPinningToBottomWithNewBounds:(CGRect)a3;
- (void)_updateScrollabilityAndShadow;
- (void)setBounds:(CGRect)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setShouldPinToBottomOnResize:(BOOL)a3;
@end

@implementation _UIAlertControllerShadowedScrollView

- (CGRect)_boundsForPinningToBottomWithNewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self bounds];
  if (v10 != width || v9 != height)
  {
    double v12 = v8;
    double v13 = v9;
    [(UIScrollView *)self contentSize];
    if (v14 - v12 - v13 <= 0.0)
    {
      double y = v14 - height;
      if (v14 - height < 0.0) {
        double y = 0.0;
      }
    }
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_UIAlertControllerShadowedScrollView *)self shouldPinToBottomOnResize])
  {
    -[_UIAlertControllerShadowedScrollView _boundsForPinningToBottomWithNewBounds:](self, "_boundsForPinningToBottomWithNewBounds:", x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerShadowedScrollView;
  -[UIScrollView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  [(_UIAlertControllerShadowedScrollView *)self _updateScrollabilityAndShadow];
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerShadowedScrollView;
  -[UIScrollView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  [(_UIAlertControllerShadowedScrollView *)self _updateScrollabilityAndShadow];
}

- (void)_updateScrollabilityAndShadow
{
  v33[2] = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self contentSize];
  double v12 = v11;
  BOOL v13 = [(UIScrollView *)self isScrollEnabled];
  if (v12 > v10)
  {
    if (!v13) {
      [(UIScrollView *)self setScrollEnabled:1];
    }
    double v14 = v12 - v6 - v10;
    shadowView = self->_shadowView;
    if (v14 > 0.0)
    {
      if (!shadowView)
      {
        double v16 = [_UIAlertControllerGradientView alloc];
        double v17 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [(UIView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        double v18 = +[UIColor blackColor];
        v19 = [v18 colorWithAlphaComponent:0.0];
        v33[0] = v19;
        v20 = +[UIColor blackColor];
        v21 = [v20 colorWithAlphaComponent:0.045];
        v33[1] = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
        [(_UIAlertControllerGradientView *)v17 setGradientColors:v22];

        [(UIView *)self addSubview:v17];
        v23 = self->_shadowView;
        self->_shadowView = v17;

        shadowView = self->_shadowView;
      }
      if (v14 >= 6.0) {
        double v24 = 1.0;
      }
      else {
        double v24 = v14 / 6.0;
      }
      [(UIView *)shadowView alpha];
      if (v25 != v24) {
        [(UIView *)self->_shadowView setAlpha:v24];
      }
      v35.origin.double x = v4;
      v35.origin.double y = v6;
      v35.size.double width = v8;
      v35.size.double height = v10;
      CGFloat MinX = CGRectGetMinX(v35);
      v36.origin.double x = v4;
      v36.origin.double y = v6;
      v36.size.double width = v8;
      v36.size.double height = v10;
      CGFloat v27 = CGRectGetMaxY(v36) + -2.0;
      v37.origin.double x = v4;
      v37.origin.double y = v6;
      v37.size.double width = v8;
      v37.size.double height = v10;
      CGFloat Width = CGRectGetWidth(v37);
      [(UIView *)self->_shadowView frame];
      v42.size.double height = 2.0;
      v42.origin.double x = MinX;
      v42.origin.double y = v27;
      v42.size.double width = Width;
      if (!CGRectEqualToRect(v38, v42))
      {
        v39.origin.double x = v4;
        v39.origin.double y = v6;
        v39.size.double width = v8;
        v39.size.double height = v10;
        double v29 = CGRectGetMinX(v39);
        v40.origin.double x = v4;
        v40.origin.double y = v6;
        v40.size.double width = v8;
        v40.size.double height = v10;
        CGFloat v30 = CGRectGetMaxY(v40) + -2.0;
        v41.origin.double x = v4;
        v41.origin.double y = v6;
        v41.size.double width = v8;
        v41.size.double height = v10;
        -[UIView setFrame:](self->_shadowView, "setFrame:", v29, v30, CGRectGetWidth(v41), 2.0);
      }
      if ([(UIView *)self->_shadowView isHidden]) {
        [(UIView *)self->_shadowView setHidden:0];
      }
      return;
    }
    if ([(UIView *)shadowView isHidden]) {
      return;
    }
    goto LABEL_23;
  }
  if (v13) {
    [(UIScrollView *)self setScrollEnabled:0];
  }
  v31 = self->_shadowView;
  if (v31 && ![(UIView *)v31 isHidden])
  {
LABEL_23:
    -[UIView setFrame:](self->_shadowView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v32 = self->_shadowView;
    [(UIView *)v32 setHidden:1];
  }
}

- (BOOL)shouldPinToBottomOnResize
{
  return self->_shouldPinToBottomOnResize;
}

- (void)setShouldPinToBottomOnResize:(BOOL)a3
{
  self->_shouldPinToBottomOnResize = a3;
}

- (void).cxx_destruct
{
}

@end