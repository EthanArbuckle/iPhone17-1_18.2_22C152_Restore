@interface TTRIReminderDetailRecurrenceEndTableViewController
- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithStyle:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIReminderDetailRecurrenceEndTableViewController

- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController *)sub_1B91DCB78(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B91DCDE0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B91DDB6C(a3);
}

- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController_tableDataController));
  sub_1B91DEBB8((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICore50TTRIReminderDetailRecurrenceEndTableViewController_recurrenceEndModel);
  swift_release();
  swift_release();

  swift_release();
}

@end