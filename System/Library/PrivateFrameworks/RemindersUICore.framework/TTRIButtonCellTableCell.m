@interface TTRIButtonCellTableCell
- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIButtonCellTableCell

- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1B996E9F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  TTRIButtonCellTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
  return result;
}

- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore23TTRIButtonCellTableCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRIButtonCellTableCell_button));
}

@end