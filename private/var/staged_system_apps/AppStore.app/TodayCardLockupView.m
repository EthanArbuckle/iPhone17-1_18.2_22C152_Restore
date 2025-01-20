@interface TodayCardLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore19TodayCardLockupView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore25SearchAdTransparencyLabel)accessibilityAdLabel;
- (void)layoutSubviews;
@end

@implementation TodayCardLockupView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(TodayCardLockupView *)v4 traitCollection];
  sub_100063744((uint64_t)v13);
  uint64_t v6 = (uint64_t)v4 + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_axMetrics;
  swift_beginAccess();
  sub_100063D84(v6, (uint64_t)v12);
  [(TodayCardLockupView *)v4 layoutMargins];
  double v7 = sub_100054354((uint64_t)v13, (uint64_t)v12, v5, width);
  double v9 = v8;
  sub_100082D34((uint64_t)v12);
  sub_100082D34((uint64_t)v13);

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TodayCardLockupView();
  id v2 = v5.receiver;
  [(TodayCardLockupView *)&v5 layoutSubviews];
  sub_100063340(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (_TtC8AppStore19TodayCardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19TodayCardLockupView *)sub_100086E38();
}

- (CGSize)intrinsicContentSize
{
  id v2 = self;
  CGFloat v3 = sub_100784EE8();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_100082D34((uint64_t)self + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_metrics);
  sub_100082D34((uint64_t)self + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_axMetrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_crossLinkSubtitleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_searchAdTertiaryLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC8AppStore25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC8AppStore25SearchAdTransparencyLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8AppStore19TodayCardLockupView_searchAdTertiaryLabel));
}

@end