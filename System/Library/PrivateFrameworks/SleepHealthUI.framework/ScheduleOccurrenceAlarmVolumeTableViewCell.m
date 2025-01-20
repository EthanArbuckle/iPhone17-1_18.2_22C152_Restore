@interface ScheduleOccurrenceAlarmVolumeTableViewCell
- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceAlarmVolumeTableViewCell

- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell *)sub_1AD94A42C(v4, v5);
}

- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD94A5D0();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_configuration);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_configuration));

  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_slider);
}

@end