@interface SUUISlideshowImageScrollView
- (CGRect)visibleRect;
- (SUUISlideshowImageScrollView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (void)_prepareToResize;
- (void)_recoverFromResize;
- (void)_resetMinMaxZoomScales;
- (void)layoutSubviews;
- (void)resetZoomScale;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)zoomIntoPoint:(CGPoint)a3;
@end

@implementation SUUISlideshowImageScrollView

- (SUUISlideshowImageScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUISlideshowImageScrollView;
  v3 = -[SUUISlideshowImageScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUISlideshowImageScrollView *)v3 setShowsHorizontalScrollIndicator:0];
    [(SUUISlideshowImageScrollView *)v4 setShowsVerticalScrollIndicator:0];
    [(SUUISlideshowImageScrollView *)v4 setBouncesZoom:1];
    [(SUUISlideshowImageScrollView *)v4 setDecelerationRate:*MEMORY[0x263F83970]];
    image = v4->_image;
    v4->_image = 0;

    v4->_centerPointBeforeResize = (CGPoint)*MEMORY[0x263F00148];
    v4->_scaleBeforeResize = 0.0;
  }
  return v4;
}

- (void)resetZoomScale
{
  [(SUUISlideshowImageScrollView *)self minimumZoomScale];
  -[SUUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)zoomIntoPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SUUISlideshowImageScrollView *)self zoomScale];
  double v7 = v6;
  [(SUUISlideshowImageScrollView *)self minimumZoomScale];
  if (v7 == v8)
  {
    [(SUUISlideshowImageScrollView *)self maximumZoomScale];
    double v10 = v9;
    [(SUUISlideshowImageScrollView *)self contentSize];
    double v12 = v11;
    [(SUUISlideshowImageScrollView *)self zoomScale];
    double v14 = v12 / v13;
    [(SUUISlideshowImageScrollView *)self contentSize];
    double v16 = v15;
    [(SUUISlideshowImageScrollView *)self zoomScale];
    double v18 = v16 / v17;
    [(SUUISlideshowImageScrollView *)self bounds];
    double v20 = v14 * (x / v19);
    [(SUUISlideshowImageScrollView *)self bounds];
    double v22 = v18 * (y / v21);
    [(SUUISlideshowImageScrollView *)self bounds];
    double v24 = v23 / v10;
    [(SUUISlideshowImageScrollView *)self bounds];
    -[SUUISlideshowImageScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v20 - v24 * 0.5, v22 - v25 / v10 * 0.5, v24);
  }
  else
  {
    [(SUUISlideshowImageScrollView *)self minimumZoomScale];
    -[SUUISlideshowImageScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
}

- (CGRect)visibleRect
{
  [(SUUISlideshowImageScrollView *)self contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(SUUISlideshowImageScrollView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  [(SUUISlideshowImageScrollView *)self zoomScale];
  double v12 = v6 / v11;
  double v13 = v8 / v11;
  double v14 = v10 / v11;
  double v15 = v4 / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v15;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUUISlideshowImageScrollView;
  [(SUUISlideshowImageScrollView *)&v9 layoutSubviews];
  if (self->_imageView)
  {
    [(SUUISlideshowImageScrollView *)self bounds];
    double Width = CGRectGetWidth(v10);
    [(SUUISlideshowImageScrollView *)self bounds];
    double Height = CGRectGetHeight(v11);
    [(UIImageView *)self->_imageView frame];
    double v7 = (Width - v6) * 0.5;
    if (v6 >= Width) {
      double v7 = 0.0;
    }
    double v8 = (Height - v5) * 0.5;
    if (v5 >= Height) {
      double v8 = 0.0;
    }
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v8);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUISlideshowImageScrollView *)self frame];
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUISlideshowImageScrollView;
    -[SUUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(SUUISlideshowImageScrollView *)self _prepareToResize];
    v11.receiver = self;
    v11.super_class = (Class)SUUISlideshowImageScrollView;
    -[SUUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(SUUISlideshowImageScrollView *)self _recoverFromResize];
  }
}

- (void)setImage:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  imageView = self->_imageView;
  if (imageView) {
    [(UIImageView *)imageView removeFromSuperview];
  }
  double v6 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
  double v7 = self->_imageView;
  self->_imageView = v6;

  [(SUUISlideshowImageScrollView *)self addSubview:self->_imageView];
  [v8 size];
  -[SUUISlideshowImageScrollView setContentSize:](self, "setContentSize:");
  [(SUUISlideshowImageScrollView *)self _resetMinMaxZoomScales];
  [(SUUISlideshowImageScrollView *)self minimumZoomScale];
  -[SUUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)_prepareToResize
{
  [(SUUISlideshowImageScrollView *)self bounds];
  double MidX = CGRectGetMidX(v7);
  [(SUUISlideshowImageScrollView *)self bounds];
  -[SUUISlideshowImageScrollView convertPoint:toView:](self, "convertPoint:toView:", self->_imageView, MidX, CGRectGetMidY(v8));
  self->_centerPointBeforeResize.double x = v4;
  self->_centerPointBeforeResize.double y = v5;
  [(SUUISlideshowImageScrollView *)self zoomScale];
  self->_scaleBeforeResize = v6;
}

- (void)_recoverFromResize
{
  [(SUUISlideshowImageScrollView *)self _resetMinMaxZoomScales];
  [(SUUISlideshowImageScrollView *)self minimumZoomScale];
  if (scaleBeforeResize >= self->_scaleBeforeResize) {
    double scaleBeforeResize = self->_scaleBeforeResize;
  }
  [(SUUISlideshowImageScrollView *)self setZoomScale:scaleBeforeResize];
  -[SUUISlideshowImageScrollView convertPoint:fromView:](self, "convertPoint:fromView:", self->_imageView, self->_centerPointBeforeResize.x, self->_centerPointBeforeResize.y);
  double v5 = v4;
  double v7 = v6;
  [(SUUISlideshowImageScrollView *)self bounds];
  double v9 = v5 - v8 * 0.5;
  [(SUUISlideshowImageScrollView *)self bounds];
  double v11 = v7 - v10 * 0.5;
  [(SUUISlideshowImageScrollView *)self contentSize];
  double v13 = v12;
  [(SUUISlideshowImageScrollView *)self bounds];
  double v15 = v13 - v14;
  [(SUUISlideshowImageScrollView *)self contentSize];
  double v17 = v16;
  [(SUUISlideshowImageScrollView *)self bounds];
  double v19 = v17 - v18;
  if (v15 >= v9) {
    double v20 = v9;
  }
  else {
    double v20 = v15;
  }
  if (v19 >= v11) {
    double v21 = v11;
  }
  else {
    double v21 = v19;
  }
  if (*MEMORY[0x263F00148] >= v20) {
    double v22 = *MEMORY[0x263F00148];
  }
  else {
    double v22 = v20;
  }
  if (*(double *)(MEMORY[0x263F00148] + 8) >= v21) {
    double v23 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else {
    double v23 = v21;
  }
  -[SUUISlideshowImageScrollView setContentOffset:](self, "setContentOffset:", v22, v23);
}

- (void)_resetMinMaxZoomScales
{
  [(SUUISlideshowImageScrollView *)self bounds];
  if (self->_image)
  {
    double v7 = v5;
    double v8 = v6;
    if (!CGRectIsEmpty(*(CGRect *)&v3))
    {
      [(UIImage *)self->_image size];
      double v11 = 0.0;
      if (v7 > 0.0 && v8 > 0.0 && v9 > 0.0 && v10 > 0.0)
      {
        double v12 = v7 / v9;
        double v13 = v8 / v10;
        if (v12 >= v13) {
          double v11 = v13;
        }
        else {
          double v11 = v12;
        }
      }
      [(SUUISlideshowImageScrollView *)self setMinimumZoomScale:v11];
      [(SUUISlideshowImageScrollView *)self setMaximumZoomScale:v11 + v11];
    }
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end