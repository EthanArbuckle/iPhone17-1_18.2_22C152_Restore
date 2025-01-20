@interface BKZoomingScrollView
- (BKZoomingScrollView)initWithCoder:(id)a3;
- (BKZoomingScrollView)initWithFrame:(CGRect)a3;
- (CGPoint)maximumContentOffset;
- (CGPoint)minimumContentOffset;
- (CGPoint)pointToCenterAfterRotation;
- (double)maxSimulatedZoomScale;
- (double)scaleToRestoreAfterRotation;
- (double)totalZoomScale;
- (void)_commonInit;
- (void)centerContent;
- (void)configureForImageSize:(CGSize)a3;
- (void)configureForNewBoundsAndRestoreCenterPoint:(CGPoint)a3 andScale:(double)a4;
- (void)layoutSubviews;
- (void)setMaxSimulatedZoomScale:(double)a3;
- (void)setTotalZoomScale:(double)a3;
- (void)setZoomScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)simulateZoomScaleByResizingView;
- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation BKZoomingScrollView

- (void)_commonInit
{
  self->_simulatedZoomScale = 1.0;
  self->_maxSimulatedZoomScale = 1.79769313e308;
}

- (BKZoomingScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKZoomingScrollView;
  v3 = -[BKZoomingScrollView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BKZoomingScrollView *)v3 _commonInit];
  }
  return v4;
}

- (BKZoomingScrollView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKZoomingScrollView;
  v3 = [(BKZoomingScrollView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BKZoomingScrollView *)v3 _commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKZoomingScrollView;
  [(BKZoomingScrollView *)&v3 layoutSubviews];
  [(BKZoomingScrollView *)self centerContent];
}

- (void)centerContent
{
  objc_super v3 = [(BKZoomingScrollView *)self delegate];
  id v13 = [v3 viewForZoomingInScrollView:self];

  if (v13)
  {
    [(BKZoomingScrollView *)self bounds];
    double Width = CGRectGetWidth(v15);
    [v13 frame];
    double v5 = Width - CGRectGetWidth(v16);
    [(BKZoomingScrollView *)self bounds];
    double Height = CGRectGetHeight(v17);
    [v13 frame];
    double v7 = Height - CGRectGetHeight(v18);
    float v8 = v5 * 0.5;
    double v9 = fmaxf(truncf(v8), 0.0);
    float v10 = v5 - v9;
    float v11 = v7 * 0.5;
    double v12 = fmaxf(truncf(v11), 0.0);
    *(float *)&double v7 = v7 - v12;
    -[BKZoomingScrollView setContentInset:](self, "setContentInset:", v12, v9, fmaxf(truncf(*(float *)&v7), 0.0), fmaxf(truncf(v10), 0.0));
  }
}

- (void)configureForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(BKZoomingScrollView *)self frame];
  double v8 = v7 / width;
  double v9 = 0.0;
  if (width == 0.0) {
    double v8 = 0.0;
  }
  if (height != 0.0) {
    double v9 = v6 / height;
  }
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  -[BKZoomingScrollView setContentSize:](self, "setContentSize:", width, height);
  [(BKZoomingScrollView *)self setMinimumZoomScale:v10];
  [(BKZoomingScrollView *)self maximumZoomScale];
  if (v11 < v10)
  {
    [(BKZoomingScrollView *)self setMaximumZoomScale:v10];
  }
}

- (CGPoint)maximumContentOffset
{
  [(BKZoomingScrollView *)self contentSize];
  double v4 = v3;
  double v6 = v5;
  [(BKZoomingScrollView *)self bounds];
  double v8 = v4 - v7;
  double v10 = v6 - v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (CGPoint)minimumContentOffset
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pointToCenterAfterRotation
{
  [(BKZoomingScrollView *)self bounds];
  double MidX = CGRectGetMidX(v14);
  [(BKZoomingScrollView *)self bounds];
  double MidY = CGRectGetMidY(v15);
  double v5 = [(BKZoomingScrollView *)self delegate];
  double v6 = [v5 viewForZoomingInScrollView:self];

  -[BKZoomingScrollView convertPoint:toView:](self, "convertPoint:toView:", v6, MidX, MidY);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)scaleToRestoreAfterRotation
{
  [(BKZoomingScrollView *)self zoomScale];
  double v4 = v3;
  [(BKZoomingScrollView *)self minimumZoomScale];
  BOOL v6 = v4 > v5 + 0.00000011920929;
  double result = 0.0;
  if (v6) {
    return v4;
  }
  return result;
}

- (void)configureForNewBoundsAndRestoreCenterPoint:(CGPoint)a3 andScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(BKZoomingScrollView *)self delegate];
  id v30 = [v8 viewForZoomingInScrollView:self];

  [v30 bounds];
  -[BKZoomingScrollView configureForImageSize:](self, "configureForImageSize:", v9, v10);
  [(BKZoomingScrollView *)self maximumZoomScale];
  double v12 = v11;
  [(BKZoomingScrollView *)self minimumZoomScale];
  if (v13 < a4) {
    double v13 = a4;
  }
  if (v12 < v13) {
    double v13 = v12;
  }
  [(BKZoomingScrollView *)self setZoomScale:v13];
  -[BKZoomingScrollView convertPoint:fromView:](self, "convertPoint:fromView:", v30, x, y);
  double v15 = v14;
  double v17 = v16;
  [(BKZoomingScrollView *)self bounds];
  double v19 = v15 - v18 * 0.5;
  [(BKZoomingScrollView *)self bounds];
  double v21 = v17 - v20 * 0.5;
  [(BKZoomingScrollView *)self maximumContentOffset];
  double v23 = v22;
  double v25 = v24;
  [(BKZoomingScrollView *)self minimumContentOffset];
  if (v23 >= v26) {
    double v28 = v26;
  }
  else {
    double v28 = v23;
  }
  if (v23 >= v26) {
    double v26 = v23;
  }
  if (v25 >= v27) {
    double v29 = v27;
  }
  else {
    double v29 = v25;
  }
  if (v25 >= v27) {
    double v27 = v25;
  }
  if (v26 >= v19) {
    double v26 = v19;
  }
  if (v28 >= v26) {
    double v26 = v28;
  }
  if (v27 >= v21) {
    double v27 = v21;
  }
  if (v29 >= v27) {
    double v27 = v29;
  }
  -[BKZoomingScrollView setContentOffset:](self, "setContentOffset:", v26, v27);
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  double v9 = v8;
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_BC13C;
    v12[3] = &unk_1DC500;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_BC180;
    v10[3] = &unk_1DBF58;
    double v11 = v8;
    +[UIView animateWithDuration:4 delay:v12 options:v10 animations:0.2 completion:0.0];
  }
  else
  {
    [(BKZoomingScrollView *)self setZoomScale:0 animated:a3];
    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = (void (**)(void))a5;
  double v12 = v11;
  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_BC2F4;
    v15[3] = &unk_1DC7A0;
    v15[4] = self;
    *(double *)&v15[5] = x;
    *(double *)&v15[6] = y;
    *(double *)&v15[7] = width;
    *(double *)&v15[8] = height;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_BC33C;
    v13[3] = &unk_1DBF58;
    double v14 = v11;
    +[UIView animateWithDuration:4 delay:v15 options:v13 animations:0.2 completion:0.0];
  }
  else
  {
    -[BKZoomingScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 0, x, y, width, height);
    if (v12) {
      v12[2](v12);
    }
  }
}

- (void)simulateZoomScaleByResizingView
{
  [(BKZoomingScrollView *)self zoomScale];
  double v4 = fmin(v3, self->_maxSimulatedZoomScale / self->_simulatedZoomScale);
  if (v4 != 1.0)
  {
    BOOL v5 = [(BKZoomingScrollView *)self delegate];
    BOOL v6 = [v5 viewForZoomingInScrollView:self];

    self->_simulatedZoomScale = v4 * self->_simulatedZoomScale;
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, v4, v4);
    if (v6) {
      [v6 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform v13 = v17;
    CGAffineTransformInvert(&t2, &v13);
    CGAffineTransformConcat(&v16, &t1, &t2);
    CGAffineTransform v12 = v16;
    [v6 setTransform:&v12];
    [v6 bounds];
    CGAffineTransform v13 = v17;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v13);
    [v6 setBounds:v19.origin.x, v19.origin.y, v19.size.width, v19.size.height];
    [(BKZoomingScrollView *)self minimumZoomScale];
    [(BKZoomingScrollView *)self setMinimumZoomScale:v7 / v4];
    [(BKZoomingScrollView *)self maximumZoomScale];
    [(BKZoomingScrollView *)self setMaximumZoomScale:v8 / v4];
    double v9 = [(BKZoomingScrollView *)self delegate];
    unsigned int v10 = [v9 conformsToProtocol:&OBJC_PROTOCOL___BKZoomingScrollViewDelegate];

    if (v10)
    {
      double v11 = [(BKZoomingScrollView *)self delegate];
      [v11 zoomingScrollView:self didSimulateZoomScale:v6 onView:self->_simulatedZoomScale];
    }
  }
}

- (double)totalZoomScale
{
  [(BKZoomingScrollView *)self zoomScale];
  return v3 * self->_simulatedZoomScale;
}

- (void)setTotalZoomScale:(double)a3
{
}

- (double)maxSimulatedZoomScale
{
  return self->_maxSimulatedZoomScale;
}

- (void)setMaxSimulatedZoomScale:(double)a3
{
  self->_maxSimulatedZoomScale = a3;
}

@end