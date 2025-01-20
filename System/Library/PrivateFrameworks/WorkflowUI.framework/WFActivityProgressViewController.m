@interface WFActivityProgressViewController
- (WFActivityProgressViewController)initWithCoder:(id)a3;
- (WFActivityProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)state;
- (void)setState:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation WFActivityProgressViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_22DAE76E4();
}

- (unint64_t)state
{
  return sub_22DAE7874();
}

- (void)setState:(unint64_t)a3
{
  v4 = self;
  sub_22DAE78D8(a3);
}

- (WFActivityProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (WFActivityProgressViewController *)sub_22DAE8274(v5, v7, a4);
}

- (WFActivityProgressViewController)initWithCoder:(id)a3
{
  return (WFActivityProgressViewController *)sub_22DAE8420(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFActivityProgressViewController__contentView);
}

@end