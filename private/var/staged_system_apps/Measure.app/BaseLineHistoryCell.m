@interface BaseLineHistoryCell
- (_TtC7Measure19BaseLineHistoryCell)initWithCoder:(id)a3;
- (_TtC7Measure19BaseLineHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation BaseLineHistoryCell

- (_TtC7Measure19BaseLineHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Measure19BaseLineHistoryCell *)sub_100075BE0(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure19BaseLineHistoryCell)initWithCoder:(id)a3
{
  return (_TtC7Measure19BaseLineHistoryCell *)sub_100075D98(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100075EF8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure19BaseLineHistoryCell_measureContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure19BaseLineHistoryCell_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure19BaseLineHistoryCell_accessibleMeasureContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure19BaseLineHistoryCell_bottomContentAnchor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure19BaseLineHistoryCell_sketchBottomAnchor);
}

@end