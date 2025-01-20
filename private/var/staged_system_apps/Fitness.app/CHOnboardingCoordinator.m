@interface CHOnboardingCoordinator
- (CHOnboardingCoordinator)init;
- (CHOnboardingCoordinator)initWithHealthStore:(id)a3;
- (CHOnboardingCoordinatorDelegate)delegate;
- (int64_t)currentPhase;
- (void)dealloc;
- (void)setCompletedWelcomeViews;
- (void)setCompletedWhatsNewViews;
- (void)setDelegate:(id)a3;
@end

@implementation CHOnboardingCoordinator

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentPhase
{
  uint64_t v2 = 0x1000000000000;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 6)) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = 0x10000000000;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 5)) {
    uint64_t v3 = 0;
  }
  v4 = &_mh_execute_header;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 4)) {
    v4 = 0;
  }
  uint64_t v5 = 0x1000000;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 3)) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0x10000;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 2)) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 256;
  if (!*((unsigned char *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria + 1)) {
    uint64_t v7 = 0;
  }
  return sub_1000664E4(v7 | *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___CHOnboardingCoordinator_criteria) | v6 | v5 | (unint64_t)v4 | v3 | v2);
}

- (CHOnboardingCoordinator)initWithHealthStore:(id)a3
{
  return (CHOnboardingCoordinator *)sub_100048AD0(a3);
}

- (CHOnboardingCoordinatorDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHOnboardingCoordinatorDelegate *)Strong;
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_10066832C();
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHOnboardingCoordinator_delegate);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)setCompletedWelcomeViews
{
  uint64_t v2 = self;
  sub_100668454();
}

- (void)setCompletedWhatsNewViews
{
  uint64_t v2 = self;
  sub_1006688FC();
}

- (CHOnboardingCoordinator)init
{
  result = (CHOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end