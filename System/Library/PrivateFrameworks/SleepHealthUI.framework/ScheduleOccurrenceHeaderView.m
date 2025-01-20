@interface ScheduleOccurrenceHeaderView
- (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation ScheduleOccurrenceHeaderView

- (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView *)ScheduleOccurrenceHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel) = 0;
  id v4 = a3;

  result = (_TtC13SleepHealthUI28ScheduleOccurrenceHeaderView *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel));
}

@end