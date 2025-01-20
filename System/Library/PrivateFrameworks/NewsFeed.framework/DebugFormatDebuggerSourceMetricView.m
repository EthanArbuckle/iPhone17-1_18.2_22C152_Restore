@interface DebugFormatDebuggerSourceMetricView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithCoder:(id)a3;
- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatDebuggerSourceMetricView

- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0376FE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0376BEC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_label);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  sub_1C151F2EC();
  sub_1C151F81C();
  sub_1C151F2FC();
  sub_1C151F82C();
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_label));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_bubbleLayer);
}

@end