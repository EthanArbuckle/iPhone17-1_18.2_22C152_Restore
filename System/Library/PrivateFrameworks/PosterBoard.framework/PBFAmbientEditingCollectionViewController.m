@interface PBFAmbientEditingCollectionViewController
- (FBSDisplayConfiguration)displayConfiguration;
- (PBFAmbientEditingCollectionViewController)init;
- (PBFAmbientEditingCollectionViewController)initWithCoder:(id)a3;
- (PBFAmbientEditingCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (PBFAmbientEditingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBFAmbientEditingCollectionViewControllerDelegate)ambientEditingDelegate;
- (UIView)transitionOverlayView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)init:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dismiss;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewController:(id)a3 wantsRemotePresentationOfViewController:(id)a4 contentScreenRect:(CGRect)a5;
- (void)invalidate;
- (void)pageControlDidChangePage:(id)a3;
- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAmbientEditingDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setTransitionOverlayView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PBFAmbientEditingCollectionViewController

- (FBSDisplayConfiguration)displayConfiguration
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFAmbientEditingCollectionViewController__displayConfiguration);
  if (v3)
  {
    v4 = self;
    id v5 = v3;
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F62970]);
    v7 = self;
    id v8 = objc_msgSend(v6, sel_init);
    id v5 = objc_msgSend(v8, sel_mainConfiguration);

    v3 = 0;
  }
  id v9 = v3;

  return (FBSDisplayConfiguration *)v5;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AmbientEditingCollectionViewController.displayConfiguration.setter(v4);
}

- (PBFAmbientEditingCollectionViewController)init
{
  v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  id v6 = objc_msgSend(v5, sel_dataStore);

  id v7 = objc_allocWithZone((Class)type metadata accessor for AmbientEditingCollectionViewController());
  id v8 = sub_1D32FB810(v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFAmbientEditingCollectionViewController *)v8;
}

- (id)init:(id)a3
{
  id v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = objc_msgSend(v5, sel_sharedInstance);
  id v9 = objc_msgSend(v8, sel_dataStore);

  id v10 = objc_allocWithZone((Class)type metadata accessor for AmbientEditingCollectionViewController());
  v11 = sub_1D32FBEB0(v9, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (PBFAmbientEditingCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D330A688();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AmbientEditingCollectionViewController();
  id v2 = v6.receiver;
  [(PBFAmbientEditingCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1D32FE5F8();
    sub_1D32FE7B8();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientEditingCollectionViewController();
  id v2 = v3.receiver;
  [(PBFAmbientEditingCollectionViewController *)&v3 viewWillLayoutSubviews];
  sub_1D32FF31C();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  AmbientEditingCollectionViewController.viewDidLayoutSubviews()();
}

- (PBFAmbientEditingCollectionViewControllerDelegate)ambientEditingDelegate
{
  id v2 = (char *)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_ambientEditingDelegate;
  swift_beginAccess();
  objc_super v3 = (void *)MEMORY[0x1D9434A30](v2);
  return (PBFAmbientEditingCollectionViewControllerDelegate *)v3;
}

- (void)setAmbientEditingDelegate:(id)a3
{
}

- (UIView)transitionOverlayView
{
  id v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setTransitionOverlayView:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  id v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (void)dismiss
{
  id v2 = self;
  AmbientEditingCollectionViewController.dismiss()();
}

- (void)pageControlDidChangePage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D3303CEC((uint64_t)objc_msgSend(v4, sel_currentPage), 1);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v5 = (unint64_t *)((char *)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_posters);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  id v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = sub_1D3372AA8();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1D3372088();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3372018();
  id v10 = a3;
  v11 = self;
  id v12 = AmbientEditingCollectionViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1D3372088();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D3372288();
  uint64_t v13 = v12;
  sub_1D3372018();
  id v14 = a3;
  v15 = self;
  v16 = (void *)AmbientEditingCollectionViewController.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1D3372088();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3372018();
  id v10 = a3;
  uint64_t v11 = self;
  AmbientEditingCollectionViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1D3372088();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3372018();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_1D330A8D0(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1D3372088();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3372018();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_1D330A9F4(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  AmbientEditingCollectionViewController.editingSceneViewController(_:userDidDismissWith:updatedConfiguration:updatedConfiguredProperties:completion:)(v14, a4, a5, a6, (uint64_t)sub_1D330BAC0, v13);

  swift_release();
}

- (void)editingSceneViewController:(id)a3 wantsRemotePresentationOfViewController:(id)a4 contentScreenRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_1D330285C(v12, x, y, width, height);
}

- (void)scrollViewDidScroll:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.isa
        + OBJC_IVAR___PBFAmbientEditingCollectionViewController_isScrollingOrSettling) & 1) == 0)
  {
    id v4 = a3;
    id v5 = self;
    sub_1D3303A40((char)objc_msgSend(v4, sel_isScrollAnimating));
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR___PBFAmbientEditingCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_1D330B1F8(&a5->x);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D330B43C();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1D330B66C(a4);
}

- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4
{
}

- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4
{
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  *(void *)(v7 + 24) = self;
  v14[4] = sub_1D330BE14;
  v14[5] = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1D32EF568;
  v14[3] = &block_descriptor_158;
  uint64_t v8 = _Block_copy(v14);
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = v9;
  id v12 = v10;
  id v13 = a3;
  swift_release();
  BSDispatchMain();
  _Block_release(v8);
}

- (void)invalidate
{
  objc_super v3 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  id v4 = *v3;
  id v5 = self;
  objc_msgSend(v4, sel_removeFromSuperview);
  id v6 = *v3;
  void *v3 = 0;
}

- (PBFAmbientEditingCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (PBFAmbientEditingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PBFAmbientEditingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PBFAmbientEditingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController__displayConfiguration));
  sub_1D32CE208((uint64_t)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_ambientEditingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_dataStore));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_activePosterConfiguration));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_pageControl));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController____lazy_storage___snapshotController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_editingSceneHiddenWindow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_editingSceneViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_presentedEditingRemoteViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFAmbientEditingCollectionViewController_observers);
}

@end