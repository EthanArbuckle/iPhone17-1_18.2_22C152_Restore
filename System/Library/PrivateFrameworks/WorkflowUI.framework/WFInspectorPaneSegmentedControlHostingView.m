@interface WFInspectorPaneSegmentedControlHostingView
- (WFInspectorPaneSegmentedControlHostingView)initWithCoder:(id)a3;
- (WFInspectorPaneSegmentedControlHostingView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4;
- (WFInspectorPaneSegmentedControlHostingView)initWithFrame:(CGRect)a3;
@end

@implementation WFInspectorPaneSegmentedControlHostingView

- (WFInspectorPaneSegmentedControlHostingView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4
{
  return (WFInspectorPaneSegmentedControlHostingView *)sub_22DB90378((uint64_t)a3, a4);
}

- (WFInspectorPaneSegmentedControlHostingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB90478();
}

- (WFInspectorPaneSegmentedControlHostingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR___WFInspectorPaneSegmentedControlHostingView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___WFInspectorPaneSegmentedControlHostingView_segmentedControl);
}

@end