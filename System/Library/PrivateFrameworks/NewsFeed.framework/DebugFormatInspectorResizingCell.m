@interface DebugFormatInspectorResizingCell
- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation DebugFormatInspectorResizingCell

- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed32DebugFormatInspectorResizingCell *)sub_1C02126CC(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0214218();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0212CAC();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_widthLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_heightLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_leftMarginLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_rightMarginLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_topMarginLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_bottomMarginLayer);
}

@end