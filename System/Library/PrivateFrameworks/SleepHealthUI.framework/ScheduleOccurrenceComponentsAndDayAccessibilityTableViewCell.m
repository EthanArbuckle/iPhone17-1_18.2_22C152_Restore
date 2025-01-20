@interface ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell
- (_TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell

- (_TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1AD9DF710();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell *)ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel));
}

@end