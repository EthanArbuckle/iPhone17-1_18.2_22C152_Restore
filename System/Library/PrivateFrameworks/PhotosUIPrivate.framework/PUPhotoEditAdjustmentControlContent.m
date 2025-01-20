@interface PUPhotoEditAdjustmentControlContent
- (UIColor)color;
- (UIImage)image;
- (void)setColor:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation PUPhotoEditAdjustmentControlContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

@end