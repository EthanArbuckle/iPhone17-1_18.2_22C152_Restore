@interface WFIconPickerViewController
- (UIView)iconPreview;
- (WFIconPickerViewController)initWithCoder:(id)a3;
- (WFIconPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFIconPickerViewController)initWithWorkflow:(id)a3;
- (WFPreviewNavigationController)previewNavigationController;
- (double)previewDimension;
- (double)previewPadding;
- (void)setPreviewNavigationController:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation WFIconPickerViewController

- (WFPreviewNavigationController)previewNavigationController
{
}

- (void)setPreviewNavigationController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DB0EEB0(a3);
}

- (UIView)iconPreview
{
  id v2 = sub_22DB0EF2C();
  return (UIView *)v2;
}

- (double)previewPadding
{
  return sub_22DB0EF60();
}

- (double)previewDimension
{
  return 89.5;
}

- (WFIconPickerViewController)initWithWorkflow:(id)a3
{
  return (WFIconPickerViewController *)sub_22DB0F024(a3);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_22DB0F180();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_22DB0F43C(a3);
}

- (WFIconPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB0F6CC();
}

- (WFIconPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  sub_22DB0F7E4();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFIconPickerViewController____lazy_storage___dataSource));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFIconPickerViewController_workflow);
}

@end