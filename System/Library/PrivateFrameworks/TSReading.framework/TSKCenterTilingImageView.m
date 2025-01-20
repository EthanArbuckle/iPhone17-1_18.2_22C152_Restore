@interface TSKCenterTilingImageView
- (UIImage)centerTileImage;
- (UIImage)leftCapImage;
- (UIImage)rightCapImage;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setCenterTileImage:(id)a3;
- (void)setLeftCapImage:(id)a3;
- (void)setRightCapImage:(id)a3;
@end

@implementation TSKCenterTilingImageView

- (void)setLeftCapImage:(id)a3
{
  if (self->mLeftCapImage != a3)
  {
    id v5 = a3;

    self->mLeftCapImage = (UIImage *)a3;
    [(TSKCenterTilingImageView *)self setNeedsDisplay];
  }
}

- (void)setCenterTileImage:(id)a3
{
  if (self->mCenterTileImage != a3)
  {
    id v5 = a3;

    self->mCenterTileImage = (UIImage *)a3;
    [(TSKCenterTilingImageView *)self setNeedsDisplay];
  }
}

- (void)setRightCapImage:(id)a3
{
  if (self->mRightCapImage != a3)
  {
    id v5 = a3;

    self->mRightCapImage = (UIImage *)a3;
    [(TSKCenterTilingImageView *)self setNeedsDisplay];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKCenterTilingImageView;
  [(TSKCenterTilingImageView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  [(TSKCenterTilingImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(TSKCenterTilingImageView *)self bounds];
  double MaxX = CGRectGetMaxX(v18);
  [(UIImage *)self->mRightCapImage size];
  double v10 = MaxX - v9;
  [(UIImage *)self->mLeftCapImage size];
  double v12 = v5 + v11;
  double v13 = v10 - (v5 + v11);
  [(TSKCenterTilingImageView *)self bounds];
  double v15 = v14;
  -[UIImage drawAtPoint:](self->mLeftCapImage, "drawAtPoint:", v5, v7);
  -[UIImage drawAsPatternInRect:](self->mCenterTileImage, "drawAsPatternInRect:", v12, v7, v13, v15);
  mRightCapImage = self->mRightCapImage;

  -[UIImage drawAtPoint:](mRightCapImage, "drawAtPoint:", v10, v7);
}

- (UIImage)leftCapImage
{
  return self->mLeftCapImage;
}

- (UIImage)centerTileImage
{
  return self->mCenterTileImage;
}

- (UIImage)rightCapImage
{
  return self->mRightCapImage;
}

@end