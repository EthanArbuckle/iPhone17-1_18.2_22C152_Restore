@interface InterstitialAdMetricsView
- (_TtC7NewsAds25InterstitialAdMetricsView)initWithCoder:(id)a3;
- (_TtC7NewsAds25InterstitialAdMetricsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)metricsViewCollapsed:(id)a3;
@end

@implementation InterstitialAdMetricsView

- (_TtC7NewsAds25InterstitialAdMetricsView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress;
  sub_1BF9EFBC4(0, (unint64_t *)&qword_1EBA77E48, MEMORY[0x1E4FAD760]);
  v7 = v6;
  id v8 = objc_allocWithZone(v6);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v8, sel_init);
  uint64_t v10 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)objc_msgSend(objc_allocWithZone(v7), sel_init);

  result = (_TtC7NewsAds25InterstitialAdMetricsView *)sub_1BFA180C8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(InterstitialAdMetricsView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC7NewsAds25InterstitialAdMetricsView)initWithFrame:(CGRect)a3
{
  result = (_TtC7NewsAds25InterstitialAdMetricsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView);
}

- (void)metricsViewCollapsed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s7NewsAds25InterstitialAdMetricsViewC07metricsF9Collapsedyy17PromotedContentUI0eF0CF_0();
}

@end