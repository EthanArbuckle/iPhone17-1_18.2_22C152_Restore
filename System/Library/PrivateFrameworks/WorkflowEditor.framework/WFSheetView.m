@interface WFSheetView
- (BOOL)accessibilityPerformEscape;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC14WorkflowEditor11WFSheetView)init;
- (_TtC14WorkflowEditor11WFSheetView)initWithCoder:(id)a3;
- (_TtC14WorkflowEditor11WFSheetView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handleDimmingLayerTap;
- (void)handlePanGestureWithRecognizer:(id)a3;
- (void)layoutSubviews;
@end

@implementation WFSheetView

- (_TtC14WorkflowEditor11WFSheetView)init
{
}

- (_TtC14WorkflowEditor11WFSheetView)initWithFrame:(CGRect)a3
{
}

- (_TtC14WorkflowEditor11WFSheetView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234A705A0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_234A707C8();
}

- (void)handleDimmingLayerTap
{
  v2 = self;
  sub_234A70CD4();
}

- (void)handlePanGestureWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A70D3C(v4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_234A73C70((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_234941164((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_delegate, &qword_2687D55E0);

  sub_234941164((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_contentProvider, &qword_2687D5618);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_translationView));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_pendingLayoutWork);
  sub_2349159D0(v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = self;
  Swift::Bool v9 = WFSheetView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  WFSheetView.accessibilityPerformEscape()();

  return 1;
}

@end