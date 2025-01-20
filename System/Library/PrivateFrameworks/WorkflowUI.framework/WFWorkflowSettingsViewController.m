@interface WFWorkflowSettingsViewController
- (WFWorkflowSettingsViewController)initWithCoder:(id)a3;
- (WFWorkflowSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFWorkflowSettingsViewController)initWithWorkflow:(id)a3 database:(id)a4 hideNavigationBar:(BOOL)a5;
- (WFWorkflowSettingsViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFWorkflowSettingsViewController

- (WFWorkflowSettingsViewControllerDelegate)delegate
{
  v2 = (void *)sub_22DB925BC();
  return (WFWorkflowSettingsViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22DB92668();
}

- (WFWorkflowSettingsViewController)initWithWorkflow:(id)a3 database:(id)a4 hideNavigationBar:(BOOL)a5
{
  return (WFWorkflowSettingsViewController *)WorkflowSettingsViewController.init(workflow:database:hideNavigationBar:)(a3, a4, a5);
}

- (WFWorkflowSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  WorkflowSettingsViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DB92A0C();
}

- (WFWorkflowSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  WorkflowSettingsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR___WFWorkflowSettingsViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFWorkflowSettingsViewController_hostingController);
}

@end