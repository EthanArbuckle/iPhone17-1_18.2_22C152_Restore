@interface BaseRectangleHistoryCell
- (_TtC7Measure24BaseRectangleHistoryCell)initWithCoder:(id)a3;
- (_TtC7Measure24BaseRectangleHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation BaseRectangleHistoryCell

- (_TtC7Measure24BaseRectangleHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC7Measure24BaseRectangleHistoryCell *)sub_1001FADE0(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure24BaseRectangleHistoryCell)initWithCoder:(id)a3
{
  return (_TtC7Measure24BaseRectangleHistoryCell *)sub_1001FB034(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001FB230();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_cellTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_lengthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_widthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleCellTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleLengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleWidthLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_bottomContentAnchor);
}

@end