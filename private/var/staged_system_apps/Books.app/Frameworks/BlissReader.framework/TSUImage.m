@interface TSUImage
+ (TSUImage)imageWithImageData:(id)a3;
- (TSUImage)initWithImageData:(id)a3;
@end

@implementation TSUImage

+ (TSUImage)imageWithImageData:(id)a3
{
  v4 = objc_opt_class();
  id v5 = +[TSDBitmapImageProvider CGImageForImageData:a3];

  return (TSUImage *)[v4 imageWithCGImage:v5];
}

- (TSUImage)initWithImageData:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[TSDBitmapImageProvider CGImageForImageData:a3];

  return (TSUImage *)[v4 initWithCGImage:v5];
}

@end