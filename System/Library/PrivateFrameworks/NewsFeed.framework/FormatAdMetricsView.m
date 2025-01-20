@interface FormatAdMetricsView
- (_TtC8NewsFeed19FormatAdMetricsView)initWithCoder:(id)a3;
- (_TtC8NewsFeed19FormatAdMetricsView)initWithFrame:(CGRect)a3;
- (void)metricsViewCollapsed:(id)a3;
@end

@implementation FormatAdMetricsView

- (_TtC8NewsFeed19FormatAdMetricsView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed19FormatAdMetricsView *)sub_1C0AB35F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed19FormatAdMetricsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0AB39C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed19FormatAdMetricsView_privacyMarker));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed19FormatAdMetricsView_onCollapse);
}

- (void)metricsViewCollapsed:(id)a3
{
  id v4 = a3;
  v5 = self;
  MEMORY[0x1C18C4390]();
}

@end