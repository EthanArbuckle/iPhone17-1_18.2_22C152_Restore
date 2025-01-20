@interface HighlightView.View
- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithCoder:(id)a3;
- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithFrame:(CGRect)a3;
- (id)contextMenuItemsForAttributionView:(id)a3;
- (void)layoutSubviews;
@end

@implementation HighlightView.View

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEA1F5BC();
}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEA1F680(v4);

  sub_1AEA0826C(0, (unint64_t *)&unk_1E9A99028);
  v6 = (void *)sub_1AEF96F60();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithFrame:(CGRect)a3
{
  return (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *)sub_1AEA1F9D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View)initWithCoder:(id)a3
{
  return (_TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View *)sub_1AEA1FA88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_highlight));
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_menuActionsProvider));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCV15PhotosUIPrivateP33_9F0748E264B4EFA52E58BB578614BD5813HighlightView4View_highlightView);
}

@end