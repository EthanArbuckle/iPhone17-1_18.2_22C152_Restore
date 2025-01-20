@interface ObjectHistoryCell
- (_TtC7Measure17ObjectHistoryCell)initWithCoder:(id)a3;
- (_TtC7Measure17ObjectHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ObjectHistoryCell

- (_TtC7Measure17ObjectHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Measure17ObjectHistoryCell *)sub_1001EE318(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure17ObjectHistoryCell)initWithCoder:(id)a3
{
  return (_TtC7Measure17ObjectHistoryCell *)sub_1001EE5CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_sketchView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_lengthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_widthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_heightLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_accessibleCellTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_accessibleLengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_accessibleWidthLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure17ObjectHistoryCell_accessibleHeightLabel);
}

@end