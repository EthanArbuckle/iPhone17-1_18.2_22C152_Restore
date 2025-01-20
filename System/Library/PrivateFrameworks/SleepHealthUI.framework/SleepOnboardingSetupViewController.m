@interface SleepOnboardingSetupViewController
- (void)hksp_cancelButtonTapped;
- (void)hksp_nextButtonTapped;
- (void)hksp_skipButtonTapped;
- (void)viewDidLoad;
@end

@implementation SleepOnboardingSetupViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD95C00C();
}

- (void)hksp_nextButtonTapped
{
  v2 = self;
  sub_1AD95EA50();
  sub_1AD95ED4C();
}

- (void)hksp_skipButtonTapped
{
  v2 = self;
  sub_1AD95AB4C(1, 5, &OBJC_IVAR____TtC13SleepHealthUI29SleepOnboardingFlowController_userInfo);
  v3 = (Class *)((char *)&v2->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC13SleepHealthUI29SleepOnboardingFlowController_delegate);
  swift_beginAccess();
  if (*v3)
  {
    uint64_t v4 = v3[1];
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_unknownObjectRetain();
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)hksp_cancelButtonTapped
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_1AD960684;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1AD8D34D8;
  v6[3] = &block_descriptor_25_0;
  uint64_t v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  [(OBWelcomeController *)v5 hksp_presentCancelConfirmationAlertWithCancelHandler:v4];
  _Block_release(v4);
}

@end