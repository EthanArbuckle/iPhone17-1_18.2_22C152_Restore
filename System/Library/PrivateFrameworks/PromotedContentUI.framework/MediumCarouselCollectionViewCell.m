@interface MediumCarouselCollectionViewCell
- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation MediumCarouselCollectionViewCell

- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MediumCarouselCollectionViewCell();
  v7 = -[CarouselCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B5D03D74();
  sub_1B5D27D18();

  return v7;
}

- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell *)sub_1B5DBB2C8();
  __break(1u);
  return result;
}

@end