@interface BCCardStackTransitionCoverView
- (BCCardStackTransitionCoverView)initWithFrame:(CGRect)a3;
- (CGRect)_frameForImage:(id)a3 forDisplayingInContainerBounds:(CGRect)a4;
- (UIImage)image;
- (UIImageView)imageView;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animatedWithAnimator:(id)a4;
- (void)setImageView:(id)a3;
- (void)updateContentFrame;
@end

@implementation BCCardStackTransitionCoverView

- (BCCardStackTransitionCoverView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCCardStackTransitionCoverView;
  v3 = -[BCCardStackTransitionCoverView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:0];
    [(BCCardStackTransitionCoverView *)v3 addSubview:v4];
    imageView = v3->_imageView;
    v3->_imageView = v4;
  }
  return v3;
}

- (CGRect)_frameForImage:(id)a3 forDisplayingInContainerBounds:(CGRect)a4
{
  id v4 = a3;
  [v4 size];
  CGRectMakeWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 alignmentRectInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  BCNormalizedInsetsForRects(v6, v8, v10, v12, v6 + v16, v8 + v14, v10 - (v16 + v20), v12 - (v14 + v18));

  double v33 = BCRectByUnapplyingNormalizedInsets(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v29, v30, v31, v32, v21, v22, v23, v24, v25, v26, v27, v28);
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)updateContentFrame
{
  v3 = [(BCCardStackTransitionCoverView *)self imageView];
  id v17 = [v3 image];

  [(BCCardStackTransitionCoverView *)self bounds];
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v17)
  {
    -[BCCardStackTransitionCoverView _frameForImage:forDisplayingInContainerBounds:](self, "_frameForImage:forDisplayingInContainerBounds:", v17, v4, v5, v6, v7);
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
  }
  double v16 = [(BCCardStackTransitionCoverView *)self imageView];
  [v16 setFrame:v8, v9, v10, v11];
}

- (UIImage)image
{
  v2 = [(BCCardStackTransitionCoverView *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v20 = a3;
  id v4 = [(BCCardStackTransitionCoverView *)self image];

  double v5 = v20;
  if (v4 != v20)
  {
    double v6 = [(BCCardStackTransitionCoverView *)self imageView];
    [v6 setImage:v20];

    [(BCCardStackTransitionCoverView *)self bounds];
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    if (v20)
    {
      -[BCCardStackTransitionCoverView _frameForImage:forDisplayingInContainerBounds:](self, "_frameForImage:forDisplayingInContainerBounds:", v7, v8, v9, v10);
      double v11 = v15;
      double v12 = v16;
      double v13 = v17;
      double v14 = v18;
    }
    double v19 = [(BCCardStackTransitionCoverView *)self imageView];
    [v19 setFrame:v11, v12, v13, v14];

    double v5 = v20;
  }
}

- (void)setImage:(id)a3 animatedWithAnimator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCardStackTransitionCoverView *)self image];

  if (v8 != v6)
  {
    double v9 = [(BCCardStackTransitionCoverView *)self image];

    if (v6 && v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1556E8;
      v10[3] = &unk_2C3AF8;
      v10[4] = self;
      id v11 = v6;
      [v7 addAnimations:v10];
    }
    else
    {
      [(BCCardStackTransitionCoverView *)self setImage:v6];
    }
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end