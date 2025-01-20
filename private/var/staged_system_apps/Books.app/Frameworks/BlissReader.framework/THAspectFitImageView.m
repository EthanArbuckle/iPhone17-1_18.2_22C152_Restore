@interface THAspectFitImageView
- (CGSize)intrinsicContentSize;
- (THAspectFitImageView)initWithFrame:(CGRect)a3;
- (double)preferredMaxLayoutHeight;
- (void)setPreferredMaxLayoutHeight:(double)a3;
@end

@implementation THAspectFitImageView

- (THAspectFitImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THAspectFitImageView;
  v3 = -[THAspectFitImageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(THAspectFitImageView *)v3 setContentMode:1];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)THAspectFitImageView;
  [(THAspectFitImageView *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(THAspectFitImageView *)self image];
  if (v7)
  {
    [v7 size];
    double v9 = v8;
    double v11 = v10;
    [(THAspectFitImageView *)self preferredMaxLayoutHeight];
    double v13 = v12 / v11;
    double v4 = ceil(v9 * v13);
    double v6 = ceil(v11 * v13);
  }
  double v14 = v4;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)preferredMaxLayoutHeight
{
  return self->_preferredMaxLayoutHeight;
}

- (void)setPreferredMaxLayoutHeight:(double)a3
{
  self->_preferredMaxLayoutHeight = a3;
}

@end