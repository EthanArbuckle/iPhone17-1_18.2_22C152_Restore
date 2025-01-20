@interface ReviewSummaryView
- (_TtC8AppStore17ReviewSummaryView)initWithCoder:(id)a3;
- (_TtC8AppStore17ReviewSummaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryView

- (_TtC8AppStore17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17ReviewSummaryView *)sub_1006B55C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006B6A14();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006B5EEC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_10064FF80((uint64_t)self + OBJC_IVAR____TtC8AppStore17ReviewSummaryView_subtitleArtworkAlignment);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17ReviewSummaryView_previewContainer);
}

@end