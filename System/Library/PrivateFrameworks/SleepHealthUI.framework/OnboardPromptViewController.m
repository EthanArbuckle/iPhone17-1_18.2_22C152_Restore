@interface OnboardPromptViewController
- (BOOL)_canShowWhileLocked;
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)beginButtonAction;
- (void)removeButtonAction;
@end

@implementation OnboardPromptViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)beginButtonAction
{
  if (MEMORY[0x1B3E6D270]((char *)self+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate, a2))
  {
    v3 = self;
    sub_1AD9C089C("[%{public}s] Opening Health > Sleep > Onboarding...", MEMORY[0x1E4FA53E0]);

    swift_unknownObjectRelease();
  }
}

- (void)removeButtonAction
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v4 = self;
  sub_1AD9BF3BC((uint64_t)sub_1AD9C0510, v3);

  swift_release();
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
}

- (void).cxx_destruct
{
}

@end