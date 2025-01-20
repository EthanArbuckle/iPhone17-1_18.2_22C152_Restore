@interface WFShortcutIconEditorViewController
- (BOOL)showsDoneButton;
- (WFShortcutIconEditorViewController)initWithCoder:(id)a3;
- (WFShortcutIconEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFShortcutIconEditorViewController)initWithWorkflow:(id)a3;
- (WFShortcutIconEditorViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFShortcutIconEditorViewController

- (BOOL)showsDoneButton
{
  return sub_22DAB4884() & 1;
}

- (void)setShowsDoneButton:(BOOL)a3
{
}

- (WFShortcutIconEditorViewControllerDelegate)delegate
{
  v2 = (void *)ShortcutIconEditorViewController.delegate.getter();
  return (WFShortcutIconEditorViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ShortcutIconEditorViewController.delegate.setter();
}

- (WFShortcutIconEditorViewController)initWithWorkflow:(id)a3
{
  return (WFShortcutIconEditorViewController *)sub_22DAB4BA0((uint64_t)a3);
}

- (WFShortcutIconEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAB4C50();
}

- (void)viewDidLoad
{
  v2 = self;
  ShortcutIconEditorViewController.viewDidLoad()();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  ShortcutIconEditorViewController.viewWillDisappear(_:)(a3);
}

- (WFShortcutIconEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  ShortcutIconEditorViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___WFShortcutIconEditorViewController_delegate;
  sub_22D9ADBA0((uint64_t)v3);
}

@end