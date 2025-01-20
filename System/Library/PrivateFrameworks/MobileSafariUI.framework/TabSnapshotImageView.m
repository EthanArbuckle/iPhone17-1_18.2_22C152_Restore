@interface TabSnapshotImageView
+ (CGRect)contentsRectWithSnapshotSize:(CGSize)a3 imageViewSize:(CGSize)a4 imagePosition:(CGPoint)a5 cropInsets:(UIEdgeInsets)a6;
+ (CGSize)imageSizeOnScreen:(id)a3;
+ (double)imageScaleRatioWithOnScreenImageSize:(CGSize)a3 imageViewSize:(CGSize)a4 cropInsets:(UIEdgeInsets)a5;
- (BOOL)keepImageAligned;
- (CGPoint)imagePosition;
- (TabSnapshotImageView)initWithFrame:(CGRect)a3;
- (TabSnapshotImageView)initWithImage:(id)a3;
- (UIEdgeInsets)cropInsets;
- (double)imageScaleRatio;
- (void)_setUpImageView;
- (void)layoutSubviews;
- (void)setCropInsets:(UIEdgeInsets)a3;
- (void)setImage:(id)a3;
- (void)setImagePosition:(CGPoint)a3;
- (void)setKeepImageAligned:(BOOL)a3;
- (void)updateImageAlignment;
@end

@implementation TabSnapshotImageView

- (TabSnapshotImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotImageView;
  v3 = -[TabSnapshotImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TabSnapshotImageView *)v3 _setUpImageView];
    v5 = v4;
  }

  return v4;
}

- (void)_setUpImageView
{
  self->_keepImageAligned = 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TabSnapshotImageView;
  [(TabSnapshotImageView *)&v3 layoutSubviews];
  if (self->_keepImageAligned) {
    [(TabSnapshotImageView *)self updateImageAlignment];
  }
}

- (void)updateImageAlignment
{
  objc_super v3 = objc_opt_class();
  id v16 = [(TabSnapshotImageView *)self image];
  double v4 = imageSizeOnScreen(v16);
  double v6 = v5;
  [(TabSnapshotImageView *)self bounds];
  objc_msgSend(v3, "contentsRectWithSnapshotSize:imageViewSize:imagePosition:cropInsets:", v4, v6, *(void *)&self->_cropInsets.top, *(void *)&self->_cropInsets.left, *(void *)&self->_cropInsets.bottom, *(void *)&self->_cropInsets.right);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(TabSnapshotImageView *)self layer];
  objc_msgSend(v15, "setContentsRect:", v8, v10, v12, v14);
}

+ (CGRect)contentsRectWithSnapshotSize:(CGSize)a3 imageViewSize:(CGSize)a4 imagePosition:(CGPoint)a5 cropInsets:(UIEdgeInsets)a6
{
  double height = a4.height;
  double v7 = 1.0;
  double v8 = 1.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (a3.width != 0.0)
  {
    double v11 = a3.height;
    if (a3.height != 0.0 && a4.width != 0.0 && height != 0.0)
    {
      double width = a3.width;
      objc_msgSend((id)objc_opt_class(), "imageScaleRatioWithOnScreenImageSize:imageViewSize:cropInsets:", a3.width, a3.height, a4.width, height, a6.top, a6.left, a6.bottom, a6.right);
      double v13 = width - a6.left - a6.right;
      double v15 = (v11 - a6.top - a6.bottom) * v14;
      double v10 = a5.x / (v13 * v14);
      double v9 = (a5.y + (v15 - height) * -0.5) / v15;
      double v8 = v13 / width;
      _SFRoundFloatToPixels();
      double v7 = 1.0 - fmax(v16 / v15, 0.0);
    }
  }
  double v17 = v10;
  double v18 = v9;
  double v19 = v8;
  result.size.double height = v7;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (TabSnapshotImageView)initWithImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotImageView;
  objc_super v3 = [(TabSnapshotImageView *)&v7 initWithImage:a3];
  double v4 = v3;
  if (v3)
  {
    [(TabSnapshotImageView *)v3 _setUpImageView];
    double v5 = v4;
  }

  return v4;
}

- (void)setCropInsets:(UIEdgeInsets)a3
{
  if (self->_cropInsets.left != a3.left
    || self->_cropInsets.top != a3.top
    || self->_cropInsets.right != a3.right
    || self->_cropInsets.bottom != a3.bottom)
  {
    self->_cropInsets = a3;
    if (self->_keepImageAligned) {
      [(TabSnapshotImageView *)self updateImageAlignment];
    }
  }
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(TabSnapshotImageView *)self image];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)TabSnapshotImageView;
    [(TabSnapshotImageView *)&v6 setImage:v4];
    if (self->_keepImageAligned) {
      [(TabSnapshotImageView *)self updateImageAlignment];
    }
  }
}

- (void)setImagePosition:(CGPoint)a3
{
  if (a3.x != self->_imagePosition.x || a3.y != self->_imagePosition.y)
  {
    self->_imagePosition = a3;
    if (self->_keepImageAligned) {
      [(TabSnapshotImageView *)self updateImageAlignment];
    }
  }
}

- (double)imageScaleRatio
{
  objc_super v3 = [(TabSnapshotImageView *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [(TabSnapshotImageView *)self bounds];
  double v12 = 1.0;
  if (v3)
  {
    if (v5 != 0.0 && v7 != 0.0)
    {
      CGFloat v13 = v8;
      CGFloat v14 = v9;
      CGFloat v15 = v10;
      CGFloat v16 = v11;
      if (CGRectGetWidth(*(CGRect *)&v8) != 0.0)
      {
        v20.origin.x = v13;
        v20.origin.y = v14;
        v20.size.double width = v15;
        v20.size.double height = v16;
        if (CGRectGetHeight(v20) != 0.0)
        {
          double v17 = objc_opt_class();
          objc_msgSend(v17, "imageScaleRatioWithOnScreenImageSize:imageViewSize:cropInsets:", imageSizeOnScreen(v3));
          double v12 = v18;
        }
      }
    }
  }

  return v12;
}

+ (CGSize)imageSizeOnScreen:(id)a3
{
  double v3 = imageSizeOnScreen(a3);
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (double)imageScaleRatioWithOnScreenImageSize:(CGSize)a3 imageViewSize:(CGSize)a4 cropInsets:(UIEdgeInsets)a5
{
  double v5 = a4.height / (a3.height - a5.top - a5.bottom);
  double result = a4.width / (a3.width - a5.left - a5.right);
  if (v5 > result) {
    return v5;
  }
  return result;
}

- (CGPoint)imagePosition
{
  double x = self->_imagePosition.x;
  double y = self->_imagePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)cropInsets
{
  double top = self->_cropInsets.top;
  double left = self->_cropInsets.left;
  double bottom = self->_cropInsets.bottom;
  double right = self->_cropInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)keepImageAligned
{
  return self->_keepImageAligned;
}

- (void)setKeepImageAligned:(BOOL)a3
{
  self->_keepImageAligned = a3;
}

@end