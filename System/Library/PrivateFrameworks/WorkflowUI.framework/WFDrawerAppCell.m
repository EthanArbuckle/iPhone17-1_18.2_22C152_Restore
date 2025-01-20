@interface WFDrawerAppCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation WFDrawerAppCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell *)sub_22DAD7984((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DAD6DBC);
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD70E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD7228();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_22DAD75D0((uint64_t)v3);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_22DADA370(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_app), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_app));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_iconView);
}

@end