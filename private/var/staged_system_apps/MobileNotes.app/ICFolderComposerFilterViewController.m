@interface ICFolderComposerFilterViewController
- (ICFolderComposerFilterViewController)initWithAccount:(id)a3;
- (ICFolderComposerFilterViewController)initWithCoder:(id)a3;
- (ICFolderComposerFilterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneActionWithSender:(id)a3;
- (void)splitViewWillTransitionToSizeWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICFolderComposerFilterViewController

- (ICFolderComposerFilterViewController)initWithAccount:(id)a3
{
  return (ICFolderComposerFilterViewController *)sub_10028BF9C((uint64_t)a3);
}

- (ICFolderComposerFilterViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10028C144();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10028C628(a3);
}

- (void)doneActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10028D9DC();
}

- (void)splitViewWillTransitionToSizeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10028D498(v4);
}

- (ICFolderComposerFilterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICFolderComposerFilterViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ICFolderComposerFilterViewController_completion));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController_filterSelectionObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController____lazy_storage___folderComposerFilterDataSource));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICFolderComposerFilterViewController____lazy_storage___collectionView);
}

@end