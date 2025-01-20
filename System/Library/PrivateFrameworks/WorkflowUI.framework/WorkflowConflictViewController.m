@interface WorkflowConflictViewController
- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithConflict:(id)a3;
- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation WorkflowConflictViewController

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithConflict:(id)a3
{
  return (_TtC10WorkflowUI30WorkflowConflictViewController *)WorkflowConflictViewController.init(conflict:)((uint64_t)a3);
}

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22D9F1414();
}

- (void)loadView
{
  v2 = self;
  sub_22D9F14AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22D9F1740();
}

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  WorkflowConflictViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI30WorkflowConflictViewController_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI30WorkflowConflictViewController_conflict));
  swift_unknownObjectRelease();
}

@end