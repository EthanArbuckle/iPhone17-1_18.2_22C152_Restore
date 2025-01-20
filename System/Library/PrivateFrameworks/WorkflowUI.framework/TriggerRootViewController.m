@interface TriggerRootViewController
- (_TtC10WorkflowUI25TriggerRootViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI25TriggerRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)createAutomationCoordinatorDidCancel:(id)a3;
- (void)createAutomationCoordinatorDidFinish:(id)a3;
- (void)dataSourceDidUpdateTriggers:(id)a3;
- (void)startCreateNewPersonalAutomation;
- (void)viewDidLoad;
@end

@implementation TriggerRootViewController

- (_TtC10WorkflowUI25TriggerRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB13CB0();
}

- (void)viewDidLoad
{
  v2 = self;
  TriggerRootViewController.viewDidLoad()();
}

- (void)startCreateNewPersonalAutomation
{
  v2 = self;
  TriggerRootViewController.startCreateNewPersonalAutomation()();
}

- (void)createAutomationCoordinatorDidCancel:(id)a3
{
  v4 = (WFCreateAutomationCoordinator *)a3;
  v5 = self;
  TriggerRootViewController.createAutomationCoordinatorDidCancel(_:)(v4);
}

- (void)createAutomationCoordinatorDidFinish:(id)a3
{
  v4 = (WFCreateAutomationCoordinator *)a3;
  v5 = self;
  TriggerRootViewController.createAutomationCoordinatorDidFinish(_:)(v4);
}

- (void)dataSourceDidUpdateTriggers:(id)a3
{
  id v4 = a3;
  v5 = self;
  TriggerRootViewController.dataSourceDidUpdateTriggers(_:)((WFAutomationTriggerDataSource *)v5);
}

- (_TtC10WorkflowUI25TriggerRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  TriggerRootViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_database));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_homeManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_createAutomationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___automationListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___emptyStateViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___dataSource);
}

@end