@interface WFDrawerCategoryPillView
- (CGSize)intrinsicContentSize;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFDrawerCategoryPillView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_22DAD933C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DAD9354();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAD9408();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView_button));
}

@end