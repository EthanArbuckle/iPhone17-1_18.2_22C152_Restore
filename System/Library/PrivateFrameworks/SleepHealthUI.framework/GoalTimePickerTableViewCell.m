@interface GoalTimePickerTableViewCell
- (_TtC13SleepHealthUI27GoalTimePickerTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI27GoalTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation GoalTimePickerTableViewCell

- (_TtC13SleepHealthUI27GoalTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI27GoalTimePickerTableViewCell *)sub_1AD8BFB48(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI27GoalTimePickerTableViewCell)initWithCoder:(id)a3
{
  return (_TtC13SleepHealthUI27GoalTimePickerTableViewCell *)sub_1AD8BFC7C(a3);
}

@end