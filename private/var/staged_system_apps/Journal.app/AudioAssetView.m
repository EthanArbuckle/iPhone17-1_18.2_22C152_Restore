@interface AudioAssetView
- (_TtC7Journal14AudioAssetView)initWithCoder:(id)a3;
- (_TtC7Journal14AudioAssetView)initWithFrame:(CGRect)a3;
- (void)audioDidFinishPlaying:(id)a3;
- (void)layoutSubviews;
@end

@implementation AudioAssetView

- (_TtC7Journal14AudioAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14AudioAssetView *)sub_1002602C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal14AudioAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal14AudioAssetView *)sub_10026052C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100260860();
}

- (void)audioDidFinishPlaying:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100260E64();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal14AudioAssetView_audioManagerDelegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14AudioAssetView_audioAsset);
}

@end