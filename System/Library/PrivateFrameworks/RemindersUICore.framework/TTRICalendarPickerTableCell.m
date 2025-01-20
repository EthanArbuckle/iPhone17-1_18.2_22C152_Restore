@interface TTRICalendarPickerTableCell
- (NSArray)accessibilityElements;
- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRICalendarPickerTableCell

- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore27TTRICalendarPickerTableCell *)TTRICalendarPickerTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore27TTRICalendarPickerTableCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B1990);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B997AB90;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore27TTRICalendarPickerTableCell_datePicker);
  *(void *)(v3 + 56) = sub_1B90BFD68(0, &qword_1E9F028E8);
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  uint64_t v6 = (void *)sub_1B996EE40();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore27TTRICalendarPickerTableCell_datePicker));
}

@end