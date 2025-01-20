@interface LargeCarouselCollectionViewCell
- (_TtC17PromotedContentUI31LargeCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI31LargeCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation LargeCarouselCollectionViewCell

- (_TtC17PromotedContentUI31LargeCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LargeCarouselCollectionViewCell();
  v7 = -[CarouselCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B5D03D74();
  sub_1B5D03E80();

  return v7;
}

- (_TtC17PromotedContentUI31LargeCarouselCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC17PromotedContentUI31LargeCarouselCollectionViewCell *)sub_1B5DBB2C8();
  __break(1u);
  return result;
}

@end