@interface SleepOnboardingFlowController
- (_TtC13SleepHealthUI29SleepOnboardingFlowController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13SleepHealthUI29SleepOnboardingFlowController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (int64_t)hksp_presentationStyle;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SleepOnboardingFlowController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD86CE44(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AD86D908(a3);
}

- (int64_t)hksp_presentationStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13SleepHealthUI29SleepOnboardingFlowController_presentationStyle);
}

- (_TtC13SleepHealthUI29SleepOnboardingFlowController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13SleepHealthUI29SleepOnboardingFlowController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI29SleepOnboardingFlowController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13SleepHealthUI29SleepOnboardingFlowController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end