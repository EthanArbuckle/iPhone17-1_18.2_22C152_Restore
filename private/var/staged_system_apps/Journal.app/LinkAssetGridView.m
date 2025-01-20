@interface LinkAssetGridView
- (CGRect)bounds;
- (_TtC7Journal17LinkAssetGridView)initWithCoder:(id)a3;
- (_TtC7Journal17LinkAssetGridView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation LinkAssetGridView

- (_TtC7Journal17LinkAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal17LinkAssetGridView *)sub_1004A2358(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal17LinkAssetGridView)initWithCoder:(id)a3
{
  return (_TtC7Journal17LinkAssetGridView *)sub_1004A2C78(a3);
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
  sub_1004A2FD4(x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_assetImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_blurImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_subtitleLabel));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_footnoteBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_linkFallbackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17LinkAssetGridView_blurredEffectView));
  swift_bridgeObjectRelease();

  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal17LinkAssetGridView_linkURL, (uint64_t *)&unk_100800A60);
}

@end