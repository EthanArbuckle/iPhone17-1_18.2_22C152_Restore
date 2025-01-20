@interface PXSharedAlbumActionNavigationController
- (PXSharedAlbumActionNavigationController)initWithAssets:(id)a3 batchComment:(id)a4 perAssetCreationOptions:(id)a5;
- (PXSharedAlbumActionNavigationController)initWithCoder:(id)a3;
- (PXSharedAlbumActionNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (PXSharedAlbumActionNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXSharedAlbumActionNavigationController)initWithRootViewController:(id)a3;
- (PXSharedAlbumActionNavigationControllerDelegate)actionControllerDelegate;
- (void)setActionControllerDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXSharedAlbumActionNavigationController

- (PXSharedAlbumActionNavigationControllerDelegate)actionControllerDelegate
{
  v2 = (char *)self + OBJC_IVAR___PXSharedAlbumActionNavigationController_actionControllerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXSharedAlbumActionNavigationControllerDelegate *)v3;
}

- (void)setActionControllerDelegate:(id)a3
{
}

- (PXSharedAlbumActionNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AB23A76C();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (PXSharedAlbumActionNavigationController *)sub_1AA38A158(v5, v7, a4);
}

- (PXSharedAlbumActionNavigationController)initWithAssets:(id)a3 batchComment:(id)a4 perAssetCreationOptions:(id)a5
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C730);
  uint64_t v6 = sub_1AB23AADC();
  sub_1AB23A76C();
  uint64_t v8 = v7;
  if (a5)
  {
    sub_1A9B21070(0, (unint64_t *)&unk_1E9821638);
    uint64_t v9 = sub_1AB23A4DC();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return (PXSharedAlbumActionNavigationController *)PXSharedAlbumActionNavigationController.init(assets:batchComment:perAssetCreationOptions:)(v6, v7, v8, v9);
}

- (PXSharedAlbumActionNavigationController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PXSharedAlbumActionNavigationController_viewModel) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR___PXSharedAlbumActionNavigationController_didDismissSharedAlbumsActionView) = 0;
  id v5 = a3;

  result = (PXSharedAlbumActionNavigationController *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PXSharedAlbumActionNavigationController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  PXSharedAlbumActionNavigationController.viewWillDisappear(_:)(a3);
}

- (PXSharedAlbumActionNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (PXSharedAlbumActionNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PXSharedAlbumActionNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (PXSharedAlbumActionNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXSharedAlbumActionNavigationController_actionControllerDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PXSharedAlbumActionNavigationController_viewModel);
}

@end