@interface WFCollectionConfigurationViewController
- (UIView)iconPreview;
- (WFPreviewNavigationController)previewNavigationController;
- (_TtC10WorkflowUI39WFCollectionConfigurationViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI39WFCollectionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)previewDimension;
- (double)previewPadding;
- (void)setPreviewDimension:(double)a3;
- (void)setPreviewNavigationController:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation WFCollectionConfigurationViewController

- (WFPreviewNavigationController)previewNavigationController
{
  v2 = (void *)WFCollectionConfigurationViewController.previewNavigationController.getter();
  return (WFPreviewNavigationController *)v2;
}

- (void)setPreviewNavigationController:(id)a3
{
  id v5 = a3;
  v6 = self;
  WFCollectionConfigurationViewController.previewNavigationController.setter(a3);
}

- (UIView)iconPreview
{
  id v2 = WFCollectionConfigurationViewController.iconPreview.getter();
  return (UIView *)v2;
}

- (double)previewPadding
{
  return WFCollectionConfigurationViewController.previewPadding.getter();
}

- (double)previewDimension
{
  id v2 = self;
  double v3 = WFCollectionConfigurationViewController.previewDimension.getter();

  return v3;
}

- (void)setPreviewDimension:(double)a3
{
}

- (void)viewDidLoad
{
  id v2 = self;
  WFCollectionConfigurationViewController.viewDidLoad()();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  WFCollectionConfigurationViewController.viewIsAppearing(_:)(a3);
}

- (_TtC10WorkflowUI39WFCollectionConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  WFCollectionConfigurationViewController.init(coder:)();
}

- (_TtC10WorkflowUI39WFCollectionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  WFCollectionConfigurationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39WFCollectionConfigurationViewController_editMode));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39WFCollectionConfigurationViewController_iconPreview));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39WFCollectionConfigurationViewController_database));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39WFCollectionConfigurationViewController____lazy_storage___dataSource));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI39WFCollectionConfigurationViewController_gridView);
}

@end