@interface WFIconPickerColorCell
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10WorkflowUI21WFIconPickerColorCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUI21WFIconPickerColorCell)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation WFIconPickerColorCell

- (_TtC10WorkflowUI21WFIconPickerColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI21WFIconPickerColorCell *)sub_22DA31F04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DA32728(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DA32DF8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_22DA32F40();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC10WorkflowUI21WFIconPickerColorCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DA33054();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI21WFIconPickerColorCell_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI21WFIconPickerColorCell_baseColorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI21WFIconPickerColorCell_borderLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI21WFIconPickerColorCell_gestureRecognizer);
}

@end