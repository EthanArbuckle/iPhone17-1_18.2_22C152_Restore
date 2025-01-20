@interface ScheduleOccurrenceAlarmSoundTableViewCell
- (_TtC13SleepHealthUI41ScheduleOccurrenceAlarmSoundTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI41ScheduleOccurrenceAlarmSoundTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceAlarmSoundTableViewCell

- (_TtC13SleepHealthUI41ScheduleOccurrenceAlarmSoundTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1AD9DF710();
    v5 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmSoundTableViewCell();
  v6 = [(ScheduleOccurrenceAlarmSoundTableViewCell *)&v9 initWithStyle:1 reuseIdentifier:v5];

  v7 = v6;
  sub_1AD9B5A58();
  sub_1AD9B5C30();

  return v7;
}

- (_TtC13SleepHealthUI41ScheduleOccurrenceAlarmSoundTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI41ScheduleOccurrenceAlarmSoundTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

@end