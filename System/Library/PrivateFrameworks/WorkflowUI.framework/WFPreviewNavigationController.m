@interface WFPreviewNavigationController
- (WFPreviewNavigationController)initWithCoder:(id)a3;
- (WFPreviewNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFPreviewNavigationController)initWithRootViewController:(id)a3 isInSheetView:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFPreviewNavigationController

- (WFPreviewNavigationController)initWithRootViewController:(id)a3 isInSheetView:(BOOL)a4
{
  return (WFPreviewNavigationController *)WFPreviewNavigationController.init(rootViewController:isInSheetView:)(a3, a4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DA86FB4();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_22DA87888(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_22DA87AD8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_22DA87E64(a3);
}

- (WFPreviewNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DA87FCC();
}

- (WFPreviewNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  WFPreviewNavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFPreviewNavigationController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFPreviewNavigationController_navigationBarBackgroundView));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFPreviewNavigationController_grabberView);
}

@end