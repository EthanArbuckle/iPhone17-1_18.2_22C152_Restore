@interface EnableSchedulePromptViewController
- (BOOL)_canShowWhileLocked;
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)enableButtonAction;
@end

@implementation EnableSchedulePromptViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)enableButtonAction
{
  if (MEMORY[0x1B3E6D270]((char *)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate, a2))
  {
    v3 = self;
    sub_1AD9C11D4();

    swift_unknownObjectRelease();
  }
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
}

- (void).cxx_destruct
{
}

@end