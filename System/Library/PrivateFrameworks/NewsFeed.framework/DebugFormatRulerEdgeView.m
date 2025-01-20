@interface DebugFormatRulerEdgeView
- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithCoder:(id)a3;
- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithFrame:(CGRect)a3;
- (void)didUpdatePan:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DebugFormatRulerEdgeView

- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC8NewsFeed24DebugFormatRulerEdgeView *)sub_1C04C86D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C04C720C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(DebugFormatRulerEdgeView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_markerLayer];
  id v7 = objc_msgSend(self, sel_labelColor, v9.receiver, v9.super_class);
  id v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void)didUpdatePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C04C7FCC(v4);
}

- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed24DebugFormatRulerEdgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_markerLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_selectionView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_metricSelectionView);
}

@end