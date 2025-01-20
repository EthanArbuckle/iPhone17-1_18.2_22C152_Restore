@interface WFPassthroughView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC10WorkflowUI17WFPassthroughView)initWithCoder:(id)a3;
- (_TtC10WorkflowUI17WFPassthroughView)initWithFrame:(CGRect)a3;
@end

@implementation WFPassthroughView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_22DABEE44(v4, x, y);

  return v4 & 1;
}

- (_TtC10WorkflowUI17WFPassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI17WFPassthroughView *)sub_22DABF090(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUI17WFPassthroughView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI17WFPassthroughView *)sub_22DABF118(a3);
}

@end