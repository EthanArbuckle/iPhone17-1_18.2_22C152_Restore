@interface _UIImageViewImageProperties
- (UIImage)image;
- (UIImage)resolvedImage;
- (void)setImage:(id)a3;
- (void)setResolvedImage:(id)a3;
@end

@implementation _UIImageViewImageProperties

- (UIImage)resolvedImage
{
  return self->_resolvedImage;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setResolvedImage:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end