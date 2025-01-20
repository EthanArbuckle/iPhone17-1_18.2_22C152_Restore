@interface ScheduleOccurrenceSectionTableViewHeaderView
- (UILabel)textLabel;
- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithReuseIdentifier:(id)a3;
@end

@implementation ScheduleOccurrenceSectionTableViewHeaderView

- (UILabel)textLabel
{
  return (UILabel *)0;
}

- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1AD9DF710();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView *)ScheduleOccurrenceSectionTableViewHeaderView.init(reuseIdentifier:)(v3, v4);
}

- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView_headerView));
}

@end