@interface LinkAssetGridView
- (CGRect)bounds;
- (_TtC21JournalShareExtension17LinkAssetGridView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension17LinkAssetGridView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation LinkAssetGridView

- (_TtC21JournalShareExtension17LinkAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC21JournalShareExtension17LinkAssetGridView *)sub_100017E48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21JournalShareExtension17LinkAssetGridView)initWithCoder:(id)a3
{
  return (_TtC21JournalShareExtension17LinkAssetGridView *)sub_100018768(a3);
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LinkAssetGridView();
  [(LinkAssetGridView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100018AC4(x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_assetImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_blurImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_linkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_footnoteBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_linkFallbackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_blurredEffectView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_linkAsset));
  double v3 = (char *)self + OBJC_IVAR____TtC21JournalShareExtension17LinkAssetGridView_linkURL;

  sub_1000192F8((uint64_t)v3);
}

@end