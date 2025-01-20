@interface WFUIKitDrawerCoordinator
- (CGRect)collapsedDrawerRect;
- (UIViewController)drawerViewController;
- (UIViewController)inspectorPaneContainerViewController;
- (UIViewController)visibleInspectorPaneContentViewController;
- (WFActionDrawerCoordinatorDelegate)delegate;
- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)init;
- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)initWithWorkflow:(id)a3 home:(id)a4;
- (double)bottomInset;
- (double)topInset;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)presentationMode;
- (unint64_t)visibility;
- (void)collapseDrawer;
- (void)configureAsBottomSheetInParentViewController:(id)a3 belowSubview:(id)a4;
- (void)configureAsNavigationStackInParentViewController:(id)a3;
- (void)expandDrawer;
- (void)performScrollingTest:(id)a3;
- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawerViewController:(id)a3;
- (void)setInspectorPaneContainerViewController:(id)a3;
- (void)setInspectorPaneViewController:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setTopInset:(double)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)setVisibleInspectorPaneContentViewController:(id)a3;
@end

@implementation WFUIKitDrawerCoordinator

- (WFActionDrawerCoordinatorDelegate)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22DA906BC();
}

- (unint64_t)presentationMode
{
  return sub_22DA90728();
}

- (void)setPresentationMode:(unint64_t)a3
{
}

- (UIViewController)drawerViewController
{
  v2 = sub_22DA907B0();
  return (UIViewController *)v2;
}

- (void)setDrawerViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DA9083C((uint64_t)a3);
}

- (UIViewController)inspectorPaneContainerViewController
{
  v2 = sub_22DA9087C();
  return (UIViewController *)v2;
}

- (void)setInspectorPaneContainerViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DA90908((uint64_t)a3);
}

- (UIViewController)visibleInspectorPaneContentViewController
{
  v2 = sub_22DA90948();
  return (UIViewController *)v2;
}

- (void)setVisibleInspectorPaneContentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DA909D4((uint64_t)a3);
}

- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)initWithWorkflow:(id)a3 home:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC10WorkflowUI24WFUIKitDrawerCoordinator *)sub_22DA90A04(v5, a4);
}

- (double)topInset
{
  return sub_22DA90BEC();
}

- (void)setTopInset:(double)a3
{
  v4 = self;
  sub_22DA90C54(a3);
}

- (double)bottomInset
{
  return sub_22DA90D0C();
}

- (unint64_t)visibility
{
  return sub_22DA90DE8();
}

- (void)setVisibility:(unint64_t)a3
{
  v4 = self;
  sub_22DA90E4C(a3);
}

- (CGRect)collapsedDrawerRect
{
  v2 = self;
  sub_22DA911B8();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5
{
  id v6 = a3;
  double v7 = self;
  sub_22DA912A4();
}

- (void)collapseDrawer
{
  v2 = self;
  sub_22DA91E0C();
}

- (void)expandDrawer
{
  v2 = self;
  sub_22DA921E8();
}

- (void)configureAsBottomSheetInParentViewController:(id)a3 belowSubview:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_22DA9297C(v6, a4);
}

- (void)configureAsNavigationStackInParentViewController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_22DA931A8(v4);
}

- (void)setInspectorPaneViewController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_22DA938E4(v4);
}

- (void)performScrollingTest:(id)a3
{
  uint64_t v4 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v6 = v5;
  id v7 = self;
  sub_22DA94120(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)init
{
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_navigationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_drawerViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_inspectorPaneContainerViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_visibleInspectorPaneContentViewController));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_actionDetailsSheetView));
  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22DA945BC();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end