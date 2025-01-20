@interface WFDrawerHeaderView
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
@end

@implementation WFDrawerHeaderView

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView *)sub_22DAD7FC4(v3, v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD821C();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD8388();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView_label));
}

@end