@interface WFIconPickerHeaderView
- (_TtC10WorkflowUI22WFIconPickerHeaderView)initWithCoder:(id)a3;
- (_TtC10WorkflowUI22WFIconPickerHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFIconPickerHeaderView

- (_TtC10WorkflowUI22WFIconPickerHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI22WFIconPickerHeaderView *)sub_22DB03244(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DB03464();
}

- (_TtC10WorkflowUI22WFIconPickerHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB03578();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerHeaderView_label));
}

@end