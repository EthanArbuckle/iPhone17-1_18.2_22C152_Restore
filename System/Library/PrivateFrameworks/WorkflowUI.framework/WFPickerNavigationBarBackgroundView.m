@interface WFPickerNavigationBarBackgroundView
- (_TtC10WorkflowUI35WFPickerNavigationBarBackgroundView)initWithCoder:(id)a3;
- (_TtC10WorkflowUI35WFPickerNavigationBarBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFPickerNavigationBarBackgroundView

- (_TtC10WorkflowUI35WFPickerNavigationBarBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI35WFPickerNavigationBarBackgroundView *)sub_22DB62A0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DB62BE4();
}

- (_TtC10WorkflowUI35WFPickerNavigationBarBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB62D14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35WFPickerNavigationBarBackgroundView_separatorView));
}

@end