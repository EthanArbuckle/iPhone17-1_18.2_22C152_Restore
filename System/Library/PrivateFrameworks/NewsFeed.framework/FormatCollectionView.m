@interface FormatCollectionView
- (_TtC8NewsFeed20FormatCollectionView)initWithCoder:(id)a3;
- (_TtC8NewsFeed20FormatCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation FormatCollectionView

- (_TtC8NewsFeed20FormatCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[FormatCollectionView initWithFrame:collectionViewLayout:](&v10, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC8NewsFeed20FormatCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(FormatCollectionView *)&v5 initWithCoder:a3];
}

@end