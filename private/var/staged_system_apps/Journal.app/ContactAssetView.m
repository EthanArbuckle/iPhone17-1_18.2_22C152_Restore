@interface ContactAssetView
- (_TtC7Journal16ContactAssetView)initWithCoder:(id)a3;
- (_TtC7Journal16ContactAssetView)initWithFrame:(CGRect)a3;
@end

@implementation ContactAssetView

- (_TtC7Journal16ContactAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal16ContactAssetView *)sub_1005225E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal16ContactAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal16ContactAssetView *)sub_10052275C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal16ContactAssetView_contactLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal16ContactAssetView_assetImageView));

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal16ContactAssetView_contactAsset);
}

@end