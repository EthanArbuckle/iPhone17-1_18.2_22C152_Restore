@interface WFDrawerSwitchCell
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)switchValueChanged;
@end

@implementation WFDrawerSwitchCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell *)sub_22DAD7984((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DAD7700);
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD79E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD7AC4();
}

- (void)switchValueChanged
{
  v2 = self;
  sub_22DAD7DC0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_22DAD7E9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_valueSwitch));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_onChange);
  sub_22D9CC274(v3);
}

@end