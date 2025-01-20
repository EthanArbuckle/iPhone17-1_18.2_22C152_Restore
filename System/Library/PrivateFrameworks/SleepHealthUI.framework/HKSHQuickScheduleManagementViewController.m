@interface HKSHQuickScheduleManagementViewController
- (BOOL)_canShowWhileLocked;
- (HKSHQuickScheduleManagementViewController)initWithSleepStore:(id)a3;
- (HKSHQuickScheduleManagementViewControllerDelegate)sleepDelegate;
- (void)setSleepDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKSHQuickScheduleManagementViewController

- (HKSHQuickScheduleManagementViewController)initWithSleepStore:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSHQuickScheduleManagementViewController;
  v5 = [(HKSHQuickScheduleManagementViewController *)&v10 init];
  if (v5)
  {
    v6 = [HKSHQuickScheduleManagementViewControllerInternal alloc];
    uint64_t v7 = [(HKSHQuickScheduleManagementViewControllerInternal *)v6 initWithSleepStore:v4 provenanceSource:*MEMORY[0x1E4FA5350]];
    internalViewController = v5->_internalViewController;
    v5->_internalViewController = (HKSHQuickScheduleManagementViewControllerInternal *)v7;
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKSHQuickScheduleManagementViewController;
  [(HKSHQuickScheduleManagementViewController *)&v7 viewDidLoad];
  [(HKSHQuickScheduleManagementViewController *)self addChildViewController:self->_internalViewController];
  v3 = [(HKSHQuickScheduleManagementViewControllerInternal *)self->_internalViewController view];
  id v4 = [(HKSHQuickScheduleManagementViewController *)self view];
  [v4 frame];
  objc_msgSend(v3, "setFrame:");

  v5 = [(HKSHQuickScheduleManagementViewController *)self view];
  v6 = [(HKSHQuickScheduleManagementViewControllerInternal *)self->_internalViewController view];
  [v5 addSubview:v6];

  [(HKSHQuickScheduleManagementViewControllerInternal *)self->_internalViewController didMoveToParentViewController:self];
}

- (void)setSleepDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKSHQuickScheduleManagementViewControllerDelegateWrapper);
  delegateWrapper = self->_delegateWrapper;
  self->_delegateWrapper = v5;

  [(HKSHQuickScheduleManagementViewControllerDelegateWrapper *)self->_delegateWrapper setWrappedDelegate:v4];
  [(HKSHQuickScheduleManagementViewControllerDelegateWrapper *)self->_delegateWrapper setViewController:self];
  objc_super v7 = self->_delegateWrapper;
  internalViewController = self->_internalViewController;
  [(HKSHQuickScheduleManagementViewControllerInternal *)internalViewController setSleepDelegate:v7];
}

- (HKSHQuickScheduleManagementViewControllerDelegate)sleepDelegate
{
  return [(HKSHQuickScheduleManagementViewControllerDelegateWrapper *)self->_delegateWrapper wrappedDelegate];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_internalViewController, 0);
}

@end