@interface SleepOnboardingScheduleViewController
- (void)hksp_cancelButtonTapped;
- (void)hksp_nextButtonTapped;
- (void)viewDidLoad;
@end

@implementation SleepOnboardingScheduleViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD9B704C();
}

- (void)hksp_nextButtonTapped
{
  v2 = self;
  sub_1AD9B7C30();
  sub_1AD9B7ED8();
}

- (void)hksp_cancelButtonTapped
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_1AD9B9EDC;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1AD8D34D8;
  v6[3] = &block_descriptor_40;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  [(OBWelcomeController *)v5 hksp_presentCancelConfirmationAlertWithCancelHandler:v4];
  _Block_release(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton));
  swift_release();
}

@end