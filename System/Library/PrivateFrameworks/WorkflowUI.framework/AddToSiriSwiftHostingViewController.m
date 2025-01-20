@interface AddToSiriSwiftHostingViewController
- (WFDatabase)database;
- (WFWorkflow)workflow;
- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP10WorkflowUI43AddToSiriSwiftHostingViewControllerDelegate_)delegate;
- (void)setDatabase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AddToSiriSwiftHostingViewController

- (_TtP10WorkflowUI43AddToSiriSwiftHostingViewControllerDelegate_)delegate
{
  v2 = (void *)sub_22DBDBCD0();
  return (_TtP10WorkflowUI43AddToSiriSwiftHostingViewControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_22DBDBD40((uint64_t)a3);
}

- (WFWorkflow)workflow
{
  v2 = sub_22DBDBD8C();
  return (WFWorkflow *)v2;
}

- (void)setWorkflow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DBDBE18((uint64_t)a3);
}

- (WFDatabase)database
{
  v2 = sub_22DBDBE58();
  return (WFDatabase *)v2;
}

- (void)setDatabase:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DBDBEE4((uint64_t)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DBDBF18();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_22DBDC850(a3);
}

- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController *)sub_22DBDCA28(v5, v7, a4);
}

- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController *)sub_22DBDCB50(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_hostingController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_workflow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_database));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_currentStatus);
  char v4 = *((unsigned char *)&self->super.super._responderFlags
       + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_currentStatus);
  sub_22DBE7E5C(v3, v4);
}

@end