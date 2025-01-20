@interface ScreenshotGalleryCollectionViewCell
- (_TtC8AppStore35ScreenshotGalleryCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ScreenshotGalleryCollectionViewCell

- (_TtC8AppStore35ScreenshotGalleryCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewCell();
  return -[ScreenshotCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end