@interface BKPictureBookCurlContainerView
- (BKPictureBookCurlContainerView)initWithFrame:(CGRect)a3;
- (BOOL)drawsSpine;
- (double)scale;
- (void)dealloc;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)killCurlingSourceViews;
- (void)layoutSubviews;
- (void)reset;
- (void)setDrawsSpine:(BOOL)a3;
- (void)setLeftImage:(id)a3;
- (void)setRightImage:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation BKPictureBookCurlContainerView

- (BKPictureBookCurlContainerView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookCurlContainerView;
  v3 = -[BKPictureBookCurlContainerView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [BKPictureBookCurlPageView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = -[BKPictureBookCurlPageView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    leftView = v3->_leftView;
    v3->_leftView = v8;

    v10 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    rightView = v3->_rightView;
    v3->_rightView = v10;

    [(BKPictureBookCurlPageView *)v3->_rightView setRight:1];
    [(BKPictureBookCurlContainerView *)v3 addSubview:v3->_leftView];
    [(BKPictureBookCurlContainerView *)v3 addSubview:v3->_rightView];
    v3->_scale = 1.0;
    v12 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(BKPictureBookCurlContainerView *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlContainerView;
  [(BKPictureBookCurlContainerView *)&v3 dealloc];
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(BKPictureBookCurlContainerView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)BKPictureBookCurlContainerView;
  [(BKPictureBookCurlContainerView *)&v17 layoutSubviews];
  [(BKPictureBookCurlContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9 * 0.5;
  -[BKPictureBookCurlPageView setFrame:](self->_leftView, "setFrame:");
  [(BKPictureBookCurlContainerView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15 * 0.5;
  v18.origin.x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v10;
  v18.size.double height = v8;
  -[BKPictureBookCurlPageView setFrame:](self->_rightView, "setFrame:", CGRectGetMaxX(v18), v12, v16, v14);
}

- (void)setLeftImage:(id)a3
{
  double scale = self->_scale;
  leftView = self->_leftView;
  id v6 = a3;
  [(BKPictureBookCurlPageView *)leftView setScale:scale];
  [(BKPictureBookCurlPageView *)self->_leftView setHidden:0];
  [(BKPictureBookCurlPageView *)self->_leftView setImage:v6];
}

- (void)setRightImage:(id)a3
{
  double scale = self->_scale;
  rightView = self->_rightView;
  id v6 = a3;
  [(BKPictureBookCurlPageView *)rightView setScale:scale];
  [(BKPictureBookCurlPageView *)self->_rightView setHidden:0];
  [(BKPictureBookCurlPageView *)self->_rightView setImage:v6];

  double v7 = self->_rightView;

  [(BKPictureBookCurlPageView *)v7 addGutter:1];
}

- (void)setDrawsSpine:(BOOL)a3
{
  BOOL v3 = a3;
  self->_drawsSpine = a3;
  -[BKPictureBookCurlPageView setDrawsSpine:](self->_leftView, "setDrawsSpine:");
  rightView = self->_rightView;

  [(BKPictureBookCurlPageView *)rightView setDrawsSpine:v3];
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  if (*(_OWORD *)&self->_leftView == 0) {
    -[BKPictureBookCurlContainerView insertSubview:atIndex:](&v8, "insertSubview:atIndex:", v6, a4, v7.receiver, v7.super_class, self, BKPictureBookCurlContainerView);
  }
  else {
    -[BKPictureBookCurlContainerView insertSubview:atIndex:](&v7, "insertSubview:atIndex:", v6, a4 + 3, self, BKPictureBookCurlContainerView, v8.receiver, v8.super_class);
  }
}

- (void)killCurlingSourceViews
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(BKPictureBookCurlContainerView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(BKPictureBookCurlPageView **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (v8 != self->_leftView && v8 != self->_rightView) {
          [(BKPictureBookCurlPageView *)v8 removeFromSuperview];
        }
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)reset
{
  [(BKPictureBookCurlContainerView *)self killCurlingSourceViews];
  [(BKPictureBookCurlContainerView *)self setHidden:1];
  [(BKPictureBookCurlPageView *)self->_leftView setHidden:1];
  [(BKPictureBookCurlPageView *)self->_rightView setHidden:1];
  [(BKPictureBookCurlPageView *)self->_leftView reset];
  rightView = self->_rightView;

  [(BKPictureBookCurlPageView *)rightView reset];
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);

  objc_storeStrong((id *)&self->_leftView, 0);
}

@end