@interface DetailedPlatterCellTableViewCell
- (_TtC7Measure32DetailedPlatterCellTableViewCell)initWithCoder:(id)a3;
- (_TtC7Measure32DetailedPlatterCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DetailedPlatterCellTableViewCell

- (_TtC7Measure32DetailedPlatterCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Measure32DetailedPlatterCellTableViewCell *)sub_100017D58(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure32DetailedPlatterCellTableViewCell)initWithCoder:(id)a3
{
  return (_TtC7Measure32DetailedPlatterCellTableViewCell *)sub_100017ED8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure32DetailedPlatterCellTableViewCell_measureContent));
}

@end