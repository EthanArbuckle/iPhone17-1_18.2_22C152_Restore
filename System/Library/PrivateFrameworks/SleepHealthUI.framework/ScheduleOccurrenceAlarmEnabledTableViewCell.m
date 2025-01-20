@interface ScheduleOccurrenceAlarmEnabledTableViewCell
- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceAlarmEnabledTableViewCell

- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
  v6 = [(HKSwitchTableViewCell *)&v9 initWithStyle:1 reuseIdentifier:v5];

  v7 = v6;
  sub_1AD9B6684();

  return v7;
}

- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

@end