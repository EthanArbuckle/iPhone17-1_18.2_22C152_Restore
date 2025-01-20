@interface WFIconPickerSymbolCell
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10WorkflowUI22WFIconPickerSymbolCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUI22WFIconPickerSymbolCell)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation WFIconPickerSymbolCell

- (_TtC10WorkflowUI22WFIconPickerSymbolCell)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI22WFIconPickerSymbolCell *)sub_22DC0E210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DC0E45C(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DC0E674();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_22DC0E754();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC10WorkflowUI22WFIconPickerSymbolCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DC0EB14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon);
}

@end