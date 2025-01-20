@interface DebugFormatInspectorCursorCell
- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation DebugFormatInspectorCursorCell

- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed30DebugFormatInspectorCursorCell *)sub_1C034A958(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C034C28C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C034B2B0();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_frameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_widthSizingConstraintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_heightSizingConstraintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_filledAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_passLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_resizingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_positionView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_directionLayer);
}

@end