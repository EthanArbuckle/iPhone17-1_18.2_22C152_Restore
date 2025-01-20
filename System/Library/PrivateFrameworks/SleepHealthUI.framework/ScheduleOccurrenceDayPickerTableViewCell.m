@interface ScheduleOccurrenceDayPickerTableViewCell
- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityDayPicker;
@end

@implementation ScheduleOccurrenceDayPickerTableViewCell

- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell *)sub_1AD9CD77C(v4, v5);
}

- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD9CD90C();
}

- (id)accessibilityDayPicker
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker));
}

@end