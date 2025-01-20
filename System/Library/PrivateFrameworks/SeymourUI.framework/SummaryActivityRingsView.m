@interface SummaryActivityRingsView
- (_TtC9SeymourUI24SummaryActivityRingsView)init;
- (_TtC9SeymourUI24SummaryActivityRingsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24SummaryActivityRingsView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SummaryActivityRingsView

- (_TtC9SeymourUI24SummaryActivityRingsView)init
{
  sub_23A2D0B1C();
  return result;
}

- (_TtC9SeymourUI24SummaryActivityRingsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2D259C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A2D20B0(a3);
}

- (_TtC9SeymourUI24SummaryActivityRingsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI24SummaryActivityRingsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_ringsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_headerLabelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_moveLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_exerciseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_standLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_valueLabelsStack));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SummaryActivityRingsView_ringDiameterConstraint);
}

@end