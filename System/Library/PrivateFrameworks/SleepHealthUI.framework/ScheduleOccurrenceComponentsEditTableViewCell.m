@interface ScheduleOccurrenceComponentsEditTableViewCell
- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityComponentsEditView;
@end

@implementation ScheduleOccurrenceComponentsEditTableViewCell

- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell *)sub_1AD9330DC(v4, v5);
}

- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)accessibilityComponentsEditView
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell_editView);
  swift_beginAccess();
  return *v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell_editView));
}

@end