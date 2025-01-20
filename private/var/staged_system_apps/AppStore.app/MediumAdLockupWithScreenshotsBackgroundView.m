@interface MediumAdLockupWithScreenshotsBackgroundView
- (NSArray)accessibilityElements;
- (_TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation MediumAdLockupWithScreenshotsBackgroundView

- (_TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView *)sub_100220840(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100223A94();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundView();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundView *)&v4 layoutSubviews];
  sub_100221760();
  sub_100221438();
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView];
  [v2 bounds];
  [v3 setFrame:];
}

- (NSArray)accessibilityElements
{
  sub_100082C28(&qword_100981AD0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1007BEDF0;
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    objc_super v4 = self;
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    NSArray v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundView();
  [(MediumAdLockupWithScreenshotsBackgroundView *)&v7 setAccessibilityElements:v5.super.isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlaySolidView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView____lazy_storage___topOverlayGradientView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
}

@end