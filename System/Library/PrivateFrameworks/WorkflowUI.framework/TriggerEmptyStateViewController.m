@interface TriggerEmptyStateViewController
- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation TriggerEmptyStateViewController

- (void)loadView
{
  v2 = self;
  TriggerEmptyStateViewController.loadView()();
}

- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10WorkflowUI31TriggerEmptyStateViewController *)TriggerEmptyStateViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI31TriggerEmptyStateViewController *)TriggerEmptyStateViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI31TriggerEmptyStateViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI31TriggerEmptyStateViewController_hostingController);
}

@end