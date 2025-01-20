@interface HKSHQuickScheduleManagementViewControllerInternal
- (BOOL)_canShowWhileLocked;
- (HKSHQuickScheduleManagementViewControllerDelegateInternal)sleepDelegate;
- (HKSHQuickScheduleManagementViewControllerInternal)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (HKSHQuickScheduleManagementViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4;
- (HKSHQuickScheduleManagementViewControllerInternal)initWithRootViewController:(id)a3;
- (HKSHQuickScheduleManagementViewControllerInternal)initWithSleepStore:(id)a3 provenanceSource:(id)a4;
- (void)cancelWithAnimated:(BOOL)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)setSleepDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HKSHQuickScheduleManagementViewControllerInternal

- (HKSHQuickScheduleManagementViewControllerDelegateInternal)sleepDelegate
{
  v2 = (char *)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1B3E6D270](v2);
  return (HKSHQuickScheduleManagementViewControllerDelegateInternal *)v3;
}

- (void)setSleepDelegate:(id)a3
{
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithSleepStore:(id)a3 provenanceSource:(id)a4
{
  return (HKSHQuickScheduleManagementViewControllerInternal *)QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(a3, a4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD9BBA20(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore));
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider));
  id v3 = (char *)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar;
  uint64_t v4 = sub_1AD9DCE40();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)cancelWithAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1AD9BBFEC(a3);
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  QuickScheduleManagementViewController.featureAvailabilityProvidingDidUpdateOnboardingCompletion(_:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

@end