@interface LockupMediaView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore15LockupMediaView)init;
- (_TtC8AppStore15LockupMediaView)initWithCoder:(id)a3;
- (_TtC8AppStore15LockupMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupMediaView

- (_TtC8AppStore15LockupMediaView)init
{
  return (_TtC8AppStore15LockupMediaView *)sub_100224A08();
}

- (_TtC8AppStore15LockupMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100227A64();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100224F40();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_10022530C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8AppStore15LockupMediaView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_imageViewReusePool;
  uint64_t v4 = sub_100082C28(&qword_10098A698);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  double v5 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_metrics;
  uint64_t v6 = type metadata accessor for LockupMediaLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC8AppStore15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release();
  double v7 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_screenshotsDisplayStyle;
  uint64_t v8 = type metadata accessor for ScreenshotsDisplayStyle();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end