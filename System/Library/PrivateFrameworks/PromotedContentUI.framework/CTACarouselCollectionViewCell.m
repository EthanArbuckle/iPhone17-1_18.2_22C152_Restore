@interface CTACarouselCollectionViewCell
- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapCTAButtonWithSender:(id)a3;
- (void)prepareForReuse;
@end

@implementation CTACarouselCollectionViewCell

- (void)prepareForReuse
{
  v2 = self;
  sub_1B5CF9E94();
}

- (void)didTapCTAButtonWithSender:(id)a3
{
  if (MEMORY[0x1BA9AC660]((char *)self + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_delegate, a2))
  {
    double v5 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_touchPoint);
    double v6 = *(double *)((char *)&self->super.super.super.super.super._responderFlags
                   + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_touchPoint);
    id v7 = a3;
    v8 = self;
    sub_1B5D29AE4((uint64_t)v8, v5, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CTACarouselCollectionViewCell();
  return -[CarouselCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CTACarouselCollectionViewCell();
  return [(CarouselCollectionViewCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button));
}

@end