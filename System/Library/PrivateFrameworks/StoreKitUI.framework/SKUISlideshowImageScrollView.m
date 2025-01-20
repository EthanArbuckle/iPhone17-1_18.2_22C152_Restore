@interface SKUISlideshowImageScrollView
- (CGRect)visibleRect;
- (SKUISlideshowImageScrollView)initWithFrame:(CGRect)a3;
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

@implementation SKUISlideshowImageScrollView

- (SKUISlideshowImageScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowImageScrollView initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISlideshowImageScrollView;
  v8 = -[SKUISlideshowImageScrollView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUISlideshowImageScrollView *)v8 setShowsHorizontalScrollIndicator:0];
    [(SKUISlideshowImageScrollView *)v9 setShowsVerticalScrollIndicator:0];
    [(SKUISlideshowImageScrollView *)v9 setBouncesZoom:1];
    [(SKUISlideshowImageScrollView *)v9 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    image = v9->_image;
    v9->_image = 0;

    v9->_centerPointBeforeResize = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v9->_scaleBeforeResize = 0.0;
  }
  return v9;
}

- (void)resetZoomScale
{
  [(SKUISlideshowImageScrollView *)self minimumZoomScale];

  -[SKUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)zoomIntoPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SKUISlideshowImageScrollView *)self zoomScale];
  double v7 = v6;
  [(SKUISlideshowImageScrollView *)self minimumZoomScale];
  if (v7 == v8)
  {
    [(SKUISlideshowImageScrollView *)self maximumZoomScale];
    double v10 = v9;
    [(SKUISlideshowImageScrollView *)self contentSize];
    double v12 = v11;
    [(SKUISlideshowImageScrollView *)self zoomScale];
    double v14 = v12 / v13;
    [(SKUISlideshowImageScrollView *)self contentSize];
    double v16 = v15;
    [(SKUISlideshowImageScrollView *)self zoomScale];
    double v18 = v16 / v17;
    [(SKUISlideshowImageScrollView *)self bounds];
    double v20 = v14 * (x / v19);
    [(SKUISlideshowImageScrollView *)self bounds];
    double v22 = v18 * (y / v21);
    [(SKUISlideshowImageScrollView *)self bounds];
    double v24 = v23 / v10;
    [(SKUISlideshowImageScrollView *)self bounds];
    -[SKUISlideshowImageScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v20 - v24 * 0.5, v22 - v25 / v10 * 0.5, v24);
  }
  else
  {
    [(SKUISlideshowImageScrollView *)self minimumZoomScale];
    -[SKUISlideshowImageScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
}

- (CGRect)visibleRect
{
  [(SKUISlideshowImageScrollView *)self contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(SKUISlideshowImageScrollView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  [(SKUISlideshowImageScrollView *)self zoomScale];
  double v12 = v6 / v11;
  double v13 = v8 / v11;
  double v14 = v10 / v11;
  double v15 = v4 / v11;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v15;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SKUISlideshowImageScrollView;
  [(SKUISlideshowImageScrollView *)&v9 layoutSubviews];
  if (self->_imageView)
  {
    [(SKUISlideshowImageScrollView *)self bounds];
    double Width = CGRectGetWidth(v10);
    [(SKUISlideshowImageScrollView *)self bounds];
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
  [(SKUISlideshowImageScrollView *)self frame];
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUISlideshowImageScrollView;
    -[SKUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(SKUISlideshowImageScrollView *)self _prepareToResize];
    v11.receiver = self;
    v11.super_class = (Class)SKUISlideshowImageScrollView;
    -[SKUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(SKUISlideshowImageScrollView *)self _recoverFromResize];
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
  double v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
  double v7 = self->_imageView;
  self->_imageView = v6;

  [(SKUISlideshowImageScrollView *)self addSubview:self->_imageView];
  [v8 size];
  -[SKUISlideshowImageScrollView setContentSize:](self, "setContentSize:");
  [(SKUISlideshowImageScrollView *)self _resetMinMaxZoomScales];
  [(SKUISlideshowImageScrollView *)self minimumZoomScale];
  -[SKUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)_prepareToResize
{
  [(SKUISlideshowImageScrollView *)self bounds];
  double MidX = CGRectGetMidX(v7);
  [(SKUISlideshowImageScrollView *)self bounds];
  -[SKUISlideshowImageScrollView convertPoint:toView:](self, "convertPoint:toView:", self->_imageView, MidX, CGRectGetMidY(v8));
  self->_centerPointBeforeResize.double x = v4;
  self->_centerPointBeforeResize.double y = v5;
  [(SKUISlideshowImageScrollView *)self zoomScale];
  self->_scaleBeforeResize = v6;
}

- (void)_recoverFromResize
{
  [(SKUISlideshowImageScrollView *)self _resetMinMaxZoomScales];
  [(SKUISlideshowImageScrollView *)self minimumZoomScale];
  if (scaleBeforeResize >= self->_scaleBeforeResize) {
    double scaleBeforeResize = self->_scaleBeforeResize;
  }
  [(SKUISlideshowImageScrollView *)self setZoomScale:scaleBeforeResize];
  -[SKUISlideshowImageScrollView convertPoint:fromView:](self, "convertPoint:fromView:", self->_imageView, self->_centerPointBeforeResize.x, self->_centerPointBeforeResize.y);
  double v5 = v4;
  double v7 = v6;
  [(SKUISlideshowImageScrollView *)self bounds];
  double v9 = v5 - v8 * 0.5;
  [(SKUISlideshowImageScrollView *)self bounds];
  double v11 = v7 - v10 * 0.5;
  [(SKUISlideshowImageScrollView *)self contentSize];
  double v13 = v12;
  [(SKUISlideshowImageScrollView *)self bounds];
  double v15 = v13 - v14;
  [(SKUISlideshowImageScrollView *)self contentSize];
  double v17 = v16;
  [(SKUISlideshowImageScrollView *)self bounds];
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
  if (*MEMORY[0x1E4F1DAD8] >= v20) {
    double v22 = *MEMORY[0x1E4F1DAD8];
  }
  else {
    double v22 = v20;
  }
  if (*(double *)(MEMORY[0x1E4F1DAD8] + 8) >= v21) {
    double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else {
    double v23 = v21;
  }

  -[SKUISlideshowImageScrollView setContentOffset:](self, "setContentOffset:", v22, v23);
}

- (void)_resetMinMaxZoomScales
{
  [(SKUISlideshowImageScrollView *)self bounds];
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
      [(SKUISlideshowImageScrollView *)self setMinimumZoomScale:v11];
      [(SKUISlideshowImageScrollView *)self setMaximumZoomScale:v11 + v11];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISlideshowImageScrollView initWithFrame:]";
}

@end