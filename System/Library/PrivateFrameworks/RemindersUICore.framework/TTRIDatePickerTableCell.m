@interface TTRIDatePickerTableCell
- (UIDatePicker)datePicker;
- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)datePickerDoubleTapped:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)updateConstraints;
@end

@implementation TTRIDatePickerTableCell

- (void)awakeFromNib
{
  v2 = self;
  TTRIDatePickerTableCell.awakeFromNib()();
}

- (void)updateConstraints
{
  v2 = self;
  TTRIDatePickerTableCell.updateConstraints()();
}

- (UIDatePicker)datePicker
{
  v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore23TTRIDatePickerTableCell_datePicker, a2);

  return (UIDatePicker *)v2;
}

- (void)setDatePicker:(id)a3
{
}

- (void)datePickerDoubleTapped:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B954F1D4();

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore23TTRIDatePickerTableCell *)TTRIDatePickerTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore23TTRIDatePickerTableCell *)TTRIDatePickerTableCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRIDatePickerTableCell_tapGestureRecognizer));

  swift_bridgeObjectRelease();
}

@end