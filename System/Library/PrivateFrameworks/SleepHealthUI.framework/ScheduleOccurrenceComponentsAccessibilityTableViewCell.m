@interface ScheduleOccurrenceComponentsAccessibilityTableViewCell
- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)datePickerDidChange;
- (void)datePickerDidEndEditing;
@end

@implementation ScheduleOccurrenceComponentsAccessibilityTableViewCell

- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1AD9DF710();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell *)sub_1AD9236E0(v4, v5);
}

- (void)datePickerDidChange
{
  v2 = self;
  sub_1AD920108();
}

- (void)datePickerDidEndEditing
{
  v2 = self;
  sub_1AD9207D4();
}

- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD924234();
}

- (void).cxx_destruct
{
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_delegate);
  sub_1AD898C98((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_model);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell____lazy_storage___alertImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_datePicker);
}

@end