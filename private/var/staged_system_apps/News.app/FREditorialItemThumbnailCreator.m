@interface FREditorialItemThumbnailCreator
- (id)editorialThumbnailImageWith:(id)a3;
@end

@implementation FREditorialItemThumbnailCreator

- (id)editorialThumbnailImageWith:(id)a3
{
  v3 = +[UIImage imageWithData:a3];
  id v4 = objc_alloc((Class)UIImage);
  id v5 = v3;
  id v6 = [v5 CGImage];
  v7 = +[UIScreen mainScreen];
  [v7 scale];
  id v8 = [v4 initWithCGImage:v6 scale:0 orientation:0];

  v9 = [v8 _imageThatSuppressesAccessibilityHairlineThickening];

  v10 = [v9 fr_scaledImageWithMaximumSize:40.0, 40.0];

  return v10;
}

@end