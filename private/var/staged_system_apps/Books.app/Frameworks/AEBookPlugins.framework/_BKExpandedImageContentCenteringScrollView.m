@interface _BKExpandedImageContentCenteringScrollView
- (BOOL)hasCalculatedMinZoomScale;
- (id)_bk_getDelegateZoomView;
- (void)centerContent;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setHasCalculatedMinZoomScale:(BOOL)a3;
@end

@implementation _BKExpandedImageContentCenteringScrollView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_BKExpandedImageContentCenteringScrollView;
  [(_BKExpandedImageContentCenteringScrollView *)&v3 layoutSubviews];
  [(_BKExpandedImageContentCenteringScrollView *)self centerContent];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_BKExpandedImageContentCenteringScrollView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v18.receiver = self;
  v18.super_class = (Class)_BKExpandedImageContentCenteringScrollView;
  -[_BKExpandedImageContentCenteringScrollView setBounds:](&v18, "setBounds:", x, y, width, height);
  BOOL v12 = v9 == width && v11 == height;
  if (!v12
    || ![(_BKExpandedImageContentCenteringScrollView *)self hasCalculatedMinZoomScale])
  {
    v13 = [(_BKExpandedImageContentCenteringScrollView *)self _bk_getDelegateZoomView];
    v14 = v13;
    if (v13)
    {
      [v13 bounds];
      CGSizeScaleThatFitsInCGSize();
      if (v15 <= 2.0) {
        double v16 = v15;
      }
      else {
        double v16 = 2.0;
      }
      [(_BKExpandedImageContentCenteringScrollView *)self setHasCalculatedMinZoomScale:1];
    }
    else
    {
      double v16 = 1.0;
    }
    [(_BKExpandedImageContentCenteringScrollView *)self setMinimumZoomScale:v16];
    [(_BKExpandedImageContentCenteringScrollView *)self maximumZoomScale];
    if (v17 < v16) {
      [(_BKExpandedImageContentCenteringScrollView *)self setMaximumZoomScale:v16];
    }
    [(_BKExpandedImageContentCenteringScrollView *)self setZoomScale:v16];
  }
}

- (void)centerContent
{
  id v9 = [(_BKExpandedImageContentCenteringScrollView *)self _bk_getDelegateZoomView];
  if (v9)
  {
    [(_BKExpandedImageContentCenteringScrollView *)self bounds];
    double Width = CGRectGetWidth(v11);
    [v9 frame];
    double v4 = Width - CGRectGetWidth(v12);
    [(_BKExpandedImageContentCenteringScrollView *)self bounds];
    double Height = CGRectGetHeight(v13);
    [v9 frame];
    double v6 = Height - CGRectGetHeight(v14);
    double v7 = fmax(trunc(v4 * 0.5), 0.0);
    double v8 = fmax(trunc(v6 * 0.5), 0.0);
    -[_BKExpandedImageContentCenteringScrollView setContentInset:](self, "setContentInset:", v8, v7, fmax(trunc(v6 - v8), 0.0), fmax(trunc(v4 - v7), 0.0));
  }
}

- (id)_bk_getDelegateZoomView
{
  objc_super v3 = [(_BKExpandedImageContentCenteringScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 viewForZoomingInScrollView:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (BOOL)hasCalculatedMinZoomScale
{
  return self->_hasCalculatedMinZoomScale;
}

- (void)setHasCalculatedMinZoomScale:(BOOL)a3
{
  self->_hasCalculatedMinZoomScale = a3;
}

@end