@interface VideosExtrasZoomableImageView
- (CGPoint)_maximumContentOffset;
- (CGPoint)_minimumContentOffset;
- (CGPoint)pointToCenterAfterResize;
- (CGSize)imageSize;
- (UIImage)image;
- (UIImageView)zoomView;
- (VideosExtrasZoomableImageView)initWithFrame:(CGRect)a3;
- (double)scaleToRestoreAfterResize;
- (void)_prepareToResize;
- (void)_recoverFromResizing;
- (void)_updateMinimumAndMaximumZoomScalesForCurrentBounds;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)layoutSubviews;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPointToCenterAfterResize:(CGPoint)a3;
- (void)setScaleToRestoreAfterResize:(double)a3;
- (void)setZoomView:(id)a3;
- (void)zoomToPoint:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation VideosExtrasZoomableImageView

- (VideosExtrasZoomableImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasZoomableImageView;
  v3 = -[VideosExtrasZoomableImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VideosExtrasZoomableImageView *)v3 setShowsHorizontalScrollIndicator:0];
    [(VideosExtrasZoomableImageView *)v4 setShowsVerticalScrollIndicator:0];
    [(VideosExtrasZoomableImageView *)v4 setBouncesZoom:1];
    [(VideosExtrasZoomableImageView *)v4 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [(VideosExtrasZoomableImageView *)v4 setDelegate:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(VideosExtrasZoomableImageView *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasZoomableImageView;
  [(VideosExtrasZoomableImageView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VideosExtrasZoomableImageView *)self frame];
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)VideosExtrasZoomableImageView;
    -[VideosExtrasZoomableImageView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(VideosExtrasZoomableImageView *)self _prepareToResize];
    v11.receiver = self;
    v11.super_class = (Class)VideosExtrasZoomableImageView;
    -[VideosExtrasZoomableImageView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(VideosExtrasZoomableImageView *)self _recoverFromResizing];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasZoomableImageView;
  [(VideosExtrasZoomableImageView *)&v12 layoutSubviews];
  objc_super v3 = [(VideosExtrasZoomableImageView *)self zoomView];
  [(VideosExtrasZoomableImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [v3 frame];
  double v10 = (v5 - v9) * 0.5;
  if (v9 >= v5) {
    double v10 = 0.0;
  }
  double v11 = (v7 - v8) * 0.5;
  if (v8 >= v7) {
    double v11 = 0.0;
  }
  objc_msgSend(v3, "setFrame:", v10, v11);
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v6 = a3;
  [(VideosExtrasZoomableImageView *)self setNeedsLayout];
  [(VideosExtrasZoomableImageView *)self layoutIfNeeded];
  double v4 = [(VideosExtrasZoomableImageView *)self zoomView];
  if ([v6 appearState] == 1)
  {
    double v5 = [v6 zoomingImageView];
    [v5 replicateStateFromImageView:v4];
  }
  [v4 setHidden:1];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v6 = a3;
  if (![v6 appearState])
  {
    double v4 = [v6 zoomingImageView];
    double v5 = [(VideosExtrasZoomableImageView *)self zoomView];
    [v4 replicateStateFromImageView:v5];
  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4 = [(VideosExtrasZoomableImageView *)self zoomView];
  [v4 setHidden:0];
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)p_image, a3);
    [(VideosExtrasZoomableImageView *)self setZoomScale:1.0];
    double v7 = [(VideosExtrasZoomableImageView *)self zoomView];
    [v7 removeFromSuperview];

    if (v13)
    {
      [(UIImage *)v13 size];
      double v9 = v8;
      double v11 = v10;
      -[VideosExtrasZoomableImageView setImageSize:](self, "setImageSize:");
      objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
      [(VideosExtrasZoomableImageView *)self addSubview:v12];
      [(VideosExtrasZoomableImageView *)self setZoomView:v12];
      -[VideosExtrasZoomableImageView setContentSize:](self, "setContentSize:", v9, v11);
      [(VideosExtrasZoomableImageView *)self _updateMinimumAndMaximumZoomScalesForCurrentBounds];
      [(VideosExtrasZoomableImageView *)self minimumZoomScale];
      -[VideosExtrasZoomableImageView setZoomScale:](self, "setZoomScale:");
    }
    else
    {
      p_image = (UIImage **)[(VideosExtrasZoomableImageView *)self setZoomView:0];
    }
  }
  MEMORY[0x1F4181820](p_image);
}

- (void)zoomToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(VideosExtrasZoomableImageView *)self zoomView];
  -[VideosExtrasZoomableImageView convertRect:toView:](self, "convertRect:toView:", v7, x, y, 1.0, 1.0);
  -[VideosExtrasZoomableImageView zoomToRect:animated:](self, "zoomToRect:animated:", 1);
}

- (CGPoint)_maximumContentOffset
{
  [(VideosExtrasZoomableImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(VideosExtrasZoomableImageView *)self contentSize];
  double v8 = v7 - v4;
  double v10 = v9 - v6;
  result.double y = v10;
  result.double x = v8;
  return result;
}

- (CGPoint)_minimumContentOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)_prepareToResize
{
  [(VideosExtrasZoomableImageView *)self bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MidX = CGRectGetMidX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v19);
  double v9 = [(VideosExtrasZoomableImageView *)self zoomView];
  -[VideosExtrasZoomableImageView convertPoint:toView:](self, "convertPoint:toView:", v9, MidX, MidY);
  double v11 = v10;
  double v13 = v12;

  [(VideosExtrasZoomableImageView *)self zoomScale];
  double v15 = v14;
  [(VideosExtrasZoomableImageView *)self minimumZoomScale];
  if (v15 <= v16 + 0.00000011920929) {
    double v15 = 0.0;
  }
  -[VideosExtrasZoomableImageView setPointToCenterAfterResize:](self, "setPointToCenterAfterResize:", v11, v13);
  [(VideosExtrasZoomableImageView *)self setScaleToRestoreAfterResize:v15];
}

- (void)_recoverFromResizing
{
  [(VideosExtrasZoomableImageView *)self _updateMinimumAndMaximumZoomScalesForCurrentBounds];
  [(VideosExtrasZoomableImageView *)self scaleToRestoreAfterResize];
  double v4 = v3;
  [(VideosExtrasZoomableImageView *)self minimumZoomScale];
  if (v5 >= v4) {
    double v4 = v5;
  }
  [(VideosExtrasZoomableImageView *)self maximumZoomScale];
  if (v6 >= v4) {
    double v6 = v4;
  }
  [(VideosExtrasZoomableImageView *)self setZoomScale:v6];
  [(VideosExtrasZoomableImageView *)self pointToCenterAfterResize];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(VideosExtrasZoomableImageView *)self zoomView];
  -[VideosExtrasZoomableImageView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v8, v10);
  double v13 = v12;
  double v15 = v14;

  [(VideosExtrasZoomableImageView *)self bounds];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double v20 = v13 - CGRectGetWidth(v31) * 0.5;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v21 = v15 - CGRectGetHeight(v32) * 0.5;
  [(VideosExtrasZoomableImageView *)self _maximumContentOffset];
  double v23 = v22;
  double v25 = v24;
  [(VideosExtrasZoomableImageView *)self _minimumContentOffset];
  if (v23 >= v20) {
    double v28 = v20;
  }
  else {
    double v28 = v23;
  }
  if (v26 < v28) {
    double v26 = v28;
  }
  if (v25 >= v21) {
    double v29 = v21;
  }
  else {
    double v29 = v25;
  }
  if (v27 < v29) {
    double v27 = v29;
  }
  -[VideosExtrasZoomableImageView setContentOffset:](self, "setContentOffset:", v26, v27);
}

- (void)_updateMinimumAndMaximumZoomScalesForCurrentBounds
{
  [(VideosExtrasZoomableImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(VideosExtrasZoomableImageView *)self imageSize];
  double v8 = v7;
  double v10 = v9;
  if (MPUFloatLessThanOrEqualToFloat()) {
    double v8 = 1.0;
  }
  if (MPUFloatLessThanOrEqualToFloat()) {
    double v11 = 1.0;
  }
  else {
    double v11 = v10;
  }
  double v12 = v6 / v11;
  if (v4 / v8 < v12) {
    double v12 = v4 / v8;
  }
  [(VideosExtrasZoomableImageView *)self setMinimumZoomScale:v12];
  [(VideosExtrasZoomableImageView *)self setMaximumZoomScale:2.0];
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGPoint)pointToCenterAfterResize
{
  double x = self->_pointToCenterAfterResize.x;
  double y = self->_pointToCenterAfterResize.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPointToCenterAfterResize:(CGPoint)a3
{
  self->_pointToCenterAfterResize = a3;
}

- (double)scaleToRestoreAfterResize
{
  return self->_scaleToRestoreAfterResize;
}

- (void)setScaleToRestoreAfterResize:(double)a3
{
  self->_scaleToRestoreAfterResize = a3;
}

- (UIImageView)zoomView
{
  return self->_zoomView;
}

- (void)setZoomView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end