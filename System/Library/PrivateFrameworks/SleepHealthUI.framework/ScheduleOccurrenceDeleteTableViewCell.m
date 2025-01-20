@interface ScheduleOccurrenceDeleteTableViewCell
- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceDeleteTableViewCell

- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1AD9DF710();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
    v5 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScheduleOccurrenceDeleteTableViewCell();
  v6 = [(ScheduleOccurrenceDeleteTableViewCell *)&v9 initWithStyle:0 reuseIdentifier:v5];

  v7 = v6;
  sub_1AD996DBC();
  sub_1AD996F28();
  sub_1AD99709C();

  return v7;
}

- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
  id v4 = a3;

  result = (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

@end