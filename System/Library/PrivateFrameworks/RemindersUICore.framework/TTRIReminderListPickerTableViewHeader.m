@interface TTRIReminderListPickerTableViewHeader
- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithCoder:(id)a3;
- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithReuseIdentifier:(id)a3;
@end

@implementation TTRIReminderListPickerTableViewHeader

- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    v3 = (void *)sub_1B996E9F0();
  }
  else
  {
    v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader *)sub_1B9112240(v3, v4);
}

- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader_prominentView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader_standardView);
}

@end