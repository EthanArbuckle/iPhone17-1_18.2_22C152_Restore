@interface _PBFImageView
- (BOOL)updateImage:(id)a3 imageSize:(CGSize)a4;
- (CGSize)imageSize;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIImage)image;
- (_PBFImageView)init;
- (void)layoutSubviews;
@end

@implementation _PBFImageView

- (_PBFImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PBFImageView;
  v2 = [(_PBFImageView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_imageSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(_PBFImageView *)v2 setUserInteractionEnabled:0];
  }
  return v3;
}

- (BOOL)updateImage:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
    BSRectWithSize();
    v17 = (UIImageView *)objc_msgSend(v16, "initWithFrame:");
    v18 = self->_imageView;
    self->_imageView = v17;

    [(UIImageView *)self->_imageView setContentMode:1];
    [(_PBFImageView *)self addSubview:self->_imageView];
LABEL_12:
    [(_PBFImageView *)self setNeedsLayout];
    [(_PBFImageView *)self invalidateIntrinsicContentSize];
    BOOL v15 = 1;
    goto LABEL_13;
  }
  v9 = [(UIImageView *)imageView image];
  if (![v9 isEqual:v7])
  {

LABEL_11:
    [(UIImageView *)self->_imageView setImage:v7];
    v19 = self->_imageView;
    [(UIImageView *)v19 frame];
    -[UIImageView setFrame:](v19, "setFrame:");
    self->_imageSize.double width = width;
    self->_imageSize.double height = height;
    goto LABEL_12;
  }
  [(UIImageView *)self->_imageView frame];
  double v11 = v10;
  double v13 = v12;

  if (v11 != width || v13 != height) {
    goto LABEL_11;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_PBFImageView;
  [(_PBFImageView *)&v8 layoutSubviews];
  [(UIImageView *)self->_imageView frame];
  if (v4 != self->_imageSize.width || v3 != self->_imageSize.height)
  {
    imageView = self->_imageView;
    [(UIImageView *)imageView frame];
    -[UIImageView setFrame:](imageView, "setFrame:");
  }
  id v7 = self->_imageView;
  [(_PBFImageView *)self center];
  -[UIImageView setCenter:](v7, "setCenter:");
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end