@interface DebugFormatInspectorFrameCell
- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didTapBorderButtonWithSender:(id)a3;
- (void)didTapHiddenButtonWithSender:(id)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatInspectorFrameCell

- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C151E62C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8NewsFeed29DebugFormatInspectorFrameCell *)sub_1C0BD0B0C(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0BD3FD8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0BD1614();
}

- (void)didTapBorderButtonWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C0BD2798((uint64_t)v4);
}

- (void)didTapHiddenButtonWithSender:(id)a3
{
  swift_getObjectType();
  uint64_t v5 = qword_1EA194538;
  id v6 = a3;
  v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_1C0BD3E60(&qword_1EA1A4848);
  sub_1C1516FBC();
  sub_1C0BD3E60(&qword_1EA1A4850);
  sub_1C151723C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_frameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_zIndexLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_hiddenButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_leftBorderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_rightBorderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_topBorderButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_bottomBorderButton);
}

@end