@interface ScheduleOccurrenceTableViewCell
- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ScheduleOccurrenceTableViewCell

- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell *)sub_1AD929DD8(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell_viewModelProviding;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell____lazy_storage___occurrenceView;
  uint64_t v7 = type metadata accessor for ScheduleOccurrenceView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  id v8 = a3;

  result = (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end