@interface CarouselCollectionViewCell
- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CarouselCollectionViewCell

- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17PromotedContentUI26CarouselCollectionViewCell *)sub_1B5CF86D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5CF8FC4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1B5CF8964();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B5CEF5DC(0, (unint64_t *)&unk_1EB8465A0);
  sub_1B5CF8F50();
  uint64_t v6 = sub_1B5DBAD18();
  id v7 = a4;
  v8 = self;
  sub_1B5CF8AF8(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___assetImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___captionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___blurImageView));
  id v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_delegate;
  sub_1B5CF6804((uint64_t)v3);
}

@end