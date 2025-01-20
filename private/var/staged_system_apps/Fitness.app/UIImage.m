@interface UIImage
- (id)resizedImageWithNewSize:(CGSize)a3;
@end

@implementation UIImage

- (id)resizedImageWithNewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  v6 = (void *)sub_1001C5998(width, height);

  return v6;
}

@end