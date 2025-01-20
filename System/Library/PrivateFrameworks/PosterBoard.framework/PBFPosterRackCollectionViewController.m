@interface PBFPosterRackCollectionViewController
+ (id)simplifiedHomeScreenSwitcherFor:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5;
+ (id)simplifiedHomeScreenSwitcherWithFilter:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5;
- (BOOL)allowsEnteringFullscreenLayout;
- (BOOL)allowsLeavingHomeConfiguringLayout;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)managesLiveWidgetHosting;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldDisplayActionsButton;
- (BOOL)shouldDisplayAddButton;
- (BOOL)shouldDisplayCancelButton;
- (BOOL)shouldDisplayConfigurationTopButtons;
- (BOOL)shouldDisplayGalleryAffordance;
- (BOOL)shouldTransitionLayoutToConfiguringHomeForFirstPoster;
- (NSIndexPath)centeredPosterIndexPath;
- (PBFPosterPair)centeredPoster;
- (PBFPosterRackCollectionViewController)init;
- (PBFPosterRackCollectionViewController)initWithCoder:(id)a3;
- (PBFPosterRackCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (PBFPosterRackCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBFPosterRackCollectionViewController)initWithPosterFilter:(id)a3;
- (PBFPosterRackCollectionViewControllerDelegate)posterRackDelegate;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (PROverridableDateProvider)dateProvider;
- (UIPageControl)pageControl;
- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5;
- (id)posterExtensionDataStore;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)layoutMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dateProvider:(id)a3 didUpdateDate:(id)a4;
- (void)dealloc;
- (void)didTapEmptyViewArea:(id)a3;
- (void)dismissPresentedViewControllersAnimated:(BOOL)a3 dismissHandler:(id)a4 completion:(id)a5;
- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewControllerDidFinalize:(id)a3;
- (void)focusSelectionViewController:(id)a3 hasSelected:(BOOL)a4 activity:(id)a5;
- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4;
- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5;
- (void)homeScreenServiceLayoutDidChange:(id)a3;
- (void)pageControlDidChangePage:(id)a3;
- (void)posterSectionRemovalView:(id)a3 didRequestRemovalOfPosterWithID:(id)a4;
- (void)presentPosterGallery:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)reset:(id)a3;
- (void)scrollToFirstPoster:(BOOL)a3 completion:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowsEnteringFullscreenLayout:(BOOL)a3;
- (void)setAllowsLeavingHomeConfiguringLayout:(BOOL)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setManagesLiveWidgetHosting:(BOOL)a3;
- (void)setPageControl:(id)a3;
- (void)setPosterRackDelegate:(id)a3;
- (void)setShouldDisplayActionsButton:(BOOL)a3;
- (void)setShouldDisplayAddButton:(BOOL)a3;
- (void)setShouldDisplayCancelButton:(BOOL)a3;
- (void)setShouldDisplayConfigurationTopButtons:(BOOL)a3;
- (void)setShouldDisplayGalleryAffordance:(BOOL)a3;
- (void)setShouldTransitionLayoutToConfiguringHomeForFirstPoster:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PBFPosterRackCollectionViewController

+ (id)simplifiedHomeScreenSwitcherFor:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5
{
  CGSize size = a5->leadingTopButtonFrame.size;
  v16[0] = a5->leadingTopButtonFrame.origin;
  v16[1] = size;
  CGSize v8 = a5->trailingTopButtonFrame.size;
  v16[2] = a5->trailingTopButtonFrame.origin;
  v16[3] = v8;
  v9 = (objc_class *)type metadata accessor for SinglePosterConfigurationFilter();
  v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR___PBFSinglePosterConfigurationFilter_configuration] = a3;
  v15.receiver = v10;
  v15.super_class = v9;
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = objc_msgSendSuper2(&v15, sel_init);
  v13 = sub_1D32CA9DC(v12, (uint64_t)a4, v16);

  swift_unknownObjectRelease();
  return v13;
}

+ (id)simplifiedHomeScreenSwitcherWithFilter:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5
{
  CGSize size = a5->leadingTopButtonFrame.size;
  v11[0] = a5->leadingTopButtonFrame.origin;
  v11[1] = size;
  CGSize v8 = a5->trailingTopButtonFrame.size;
  v11[2] = a5->trailingTopButtonFrame.origin;
  v11[3] = v8;
  swift_getObjCClassMetadata();
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = sub_1D32CAC68((uint64_t)a3, (uint64_t)a4, v11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

- (PBFPosterRackCollectionViewController)init
{
  if (qword_1EBD6F2D0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBD70DA8;
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionViewController());
  v4 = sub_1D334E070(v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFPosterRackCollectionViewController *)v4;
}

- (PBFPosterRackCollectionViewController)initWithPosterFilter:(id)a3
{
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterStore());
  swift_getObjectType();
  uint64_t v4 = swift_unknownObjectRetain_n();
  v5 = sub_1D32DEA60(v4, v3);
  v6 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionViewController());
  v7 = v5;
  CGSize v8 = sub_1D334E070(v7, v6);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFPosterRackCollectionViewController *)v8;
}

- (PBFPosterRackCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D335010C();
}

- (void)dealloc
{
  v2 = self;
  PosterRackCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR___PBFPosterRackCollectionViewController_posterRackDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_dateProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockVibrancyConfiguration));
  sub_1D32E1170((uint64_t)self + OBJC_IVAR___PBFPosterRackCollectionViewController_stashedLockscreenSnapshots, &qword_1EBD6F958);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonTrailingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonTrailingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_centeredPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_addPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_actionsMenuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___duplicateAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenConfigurationView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___feedbackGenerator));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_switcherApplicationStateNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_centeredLockPosterOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockPosterLiveContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockPosterLiveFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenIconContentLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenIconContentViewConnector));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_legacyMigrationHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___widgetHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___lockScreenWidgetMetricsSpecifications));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_galleryDataProvider));
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenService));
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  PosterRackCollectionViewController.viewDidLoad()();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  CGSize v8 = self;
  PosterRackCollectionViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  CGSize v8 = self;
  PosterRackCollectionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(PBFPosterRackCollectionViewController *)v2 traitCollection];
  id v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PosterRackCollectionViewController();
  id v2 = v3.receiver;
  [(PBFPosterRackCollectionViewController *)&v3 viewWillLayoutSubviews];
  sub_1D333F754();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  PosterRackCollectionViewController.viewDidLayoutSubviews()();
}

- (void)dismissPresentedViewControllersAnimated:(BOOL)a3 dismissHandler:(id)a4 completion:(id)a5
{
  CGSize v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    CGSize v8 = sub_1D3354500;
    if (v10)
    {
LABEL_3:
      id v12 = (void *)swift_allocObject();
      v12[2] = v10;
      v10 = sub_1D3355560;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v12 = 0;
LABEL_6:
  v13 = self;
  PosterRackCollectionViewController.dismissPresentedViewControllers(animated:dismissHandler:completion:)(a3, (uint64_t)v8, v11, (uint64_t (*)(void *))v10, v12);
  sub_1D32EA5C0((uint64_t)v10);
  sub_1D32EA5C0((uint64_t)v8);
}

- (PBFPosterRackCollectionViewControllerDelegate)posterRackDelegate
{
  id v2 = (char *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_posterRackDelegate;
  swift_beginAccess();
  objc_super v3 = (void *)MEMORY[0x1D9434A30](v2);
  return (PBFPosterRackCollectionViewControllerDelegate *)v3;
}

- (void)setPosterRackDelegate:(id)a3
{
}

- (PROverridableDateProvider)dateProvider
{
  return (PROverridableDateProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                              + OBJC_IVAR___PBFPosterRackCollectionViewController_dateProvider));
}

- (BOOL)managesLiveWidgetHosting
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_managesLiveWidgetHosting;
  swift_beginAccess();
  return *v2;
}

- (void)setManagesLiveWidgetHosting:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_managesLiveWidgetHosting;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDisplayCancelButton
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayCancelButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayCancelButton:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayCancelButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDisplayGalleryAffordance
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayGalleryAffordance;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayGalleryAffordance:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayGalleryAffordance;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDisplayAddButton
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayAddButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayAddButton:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayAddButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDisplayActionsButton
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayActionsButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayActionsButton:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayActionsButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldDisplayConfigurationTopButtons
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayConfigurationTopButtons;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayConfigurationTopButtons:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayConfigurationTopButtons;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsLeavingHomeConfiguringLayout
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsLeavingHomeConfiguringLayout;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsLeavingHomeConfiguringLayout:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsLeavingHomeConfiguringLayout;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsEnteringFullscreenLayout
{
  id v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsEnteringFullscreenLayout;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEnteringFullscreenLayout:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsEnteringFullscreenLayout;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldTransitionLayoutToConfiguringHomeForFirstPoster
{
  id v2 = (BOOL *)self
     + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldTransitionLayoutToConfiguringHomeForFirstPoster;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldTransitionLayoutToConfiguringHomeForFirstPoster:(BOOL)a3
{
  id v4 = (BOOL *)self
     + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldTransitionLayoutToConfiguringHomeForFirstPoster;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl));
}

- (void)setPageControl:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl) = (Class)a3;
  id v3 = a3;
}

- (void)pageControlDidChangePage:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D3343240((uint64_t)objc_msgSend(v4, sel_currentPage), 1, 0);
}

- (void)didTapEmptyViewArea:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D335069C();
}

- (unint64_t)layoutMode
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___PBFPosterRackCollectionViewController_layoutMode);
}

- (void)setLayoutMode:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_layoutMode) = (Class)a3;
  id v3 = self;
  sub_1D332EDA0();
}

- (void)reset:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_1D3355560;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  PosterRackCollectionViewController.transitionLayout(to:animated:options:completion:)(0, 0, 0, 0, 0);
  type metadata accessor for PosterStore();
  swift_dynamicCastClassUnconditional();
  sub_1D334F578();
  if (v4)
  {
    v5();
    sub_1D32EA5C0((uint64_t)v5);
  }
}

- (void)scrollToFirstPoster:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = self;
    sub_1D3343240(0, a3, 0);
    sub_1D3354518();
    sub_1D32EA5C0((uint64_t)sub_1D3354518);
  }
  else
  {
    id v7 = self;
    sub_1D3343240(0, a3, 0);
  }
}

- (id)posterExtensionDataStore
{
  id v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  id v6 = objc_msgSend(v5, sel_dataStore);

  return v6;
}

- (void)presentPosterGallery:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1D3354500;
  v6[4] = v5;
  id v7 = self;
  swift_retain();
  sub_1D332D4C8((uint64_t (*)())sub_1D33557D8, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  int64_t v6 = _s11PosterBoard0A28RackCollectionViewControllerC16numberOfSections2inSiSo012UICollectionE0C_tF_0();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  int64_t v8 = sub_1D3350884(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1D3372088();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1D3372018();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = (void *)PosterRackCollectionViewController.collectionView(_:cellForItemAt:)(v10, v9);

  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
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
  objc_super v15 = self;
  v16 = (void *)PosterRackCollectionViewController.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

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
  PosterRackCollectionViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v9 = self;
    id v10 = objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionView());
    id v11 = v9;
    id v12 = a4;
    uint64_t v13 = (char *)objc_msgSend(v10, sel_initWithFrame_collectionViewLayout_, v12, x, y, width, height);
    *(void *)&v13[OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate + 8] = &off_1F2A70BE0;
    swift_unknownObjectWeakAssign();

    return v13;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD6F930);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  id v9 = self;
  PosterRackCollectionViewController._indexPathOfReferenceItemForLayoutTransition(in:)(a3, (uint64_t)v7);

  uint64_t v10 = sub_1D3372088();
  uint64_t v11 = *(void *)(v10 - 8);
  id v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    id v12 = (void *)sub_1D3371FF8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v12;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  PosterRackCollectionViewController.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v8 = self;
  sub_1D3350F68(&a5->x);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1D33511AC();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1D3351224(a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = sub_1D33512A4(v7);

  return v9 & 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_presentedViewController);
  sub_1D3332480(v6);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v7 = a3;
  id v4 = self;
  id v5 = objc_msgSend(v7, sel_presentedViewController);
  self;
  id v6 = (void *)swift_dynamicCastObjCClass();
  if (v6) {
    sub_1D3348584(v6);
  }
}

- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  id v5 = a3;
  id v6 = self;
  _s11PosterBoard0A28RackCollectionViewControllerC018fontAndColorPickereF0_22didUpdateDesiredDetentySo013PREditingFonthijeF0C_12CoreGraphics7CGFloatVtF_0();
}

- (void)posterSectionRemovalView:(id)a3 didRequestRemovalOfPosterWithID:(id)a4
{
  uint64_t v6 = sub_1D3372288();
  uint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_1D333A82C((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (NSIndexPath)centeredPosterIndexPath
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD6F930);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_1D333F264(v5);

  uint64_t v7 = sub_1D3372088();
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    id v9 = (void *)sub_1D3371FF8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSIndexPath *)v9;
}

- (PBFPosterPair)centeredPoster
{
  id v2 = self;
  uint64_t v3 = (void *)sub_1D333F548();

  return (PBFPosterPair *)v3;
}

- (void)dateProvider:(id)a3 didUpdateDate:(id)a4
{
  uint64_t v5 = sub_1D3371ED8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3371EA8();
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1D33404E8((uint64_t)v8);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = self;
  objc_msgSend(v6, sel_addObserver_, v7);
  uint64_t v8 = (CGPoint *)((char *)v7 + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonFrame);
  swift_beginAccess();
  CGPoint v15 = *v8;
  CGFloat x = v8[1].x;
  CGFloat y = v8[1].y;
  uint64_t v11 = (char *)v7 + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonFrame;
  swift_beginAccess();
  CGSize v13 = (CGSize)*((_OWORD *)v11 + 1);
  CGPoint v14 = *(CGPoint *)v11;

  retstr->leadingTopButtonFrame.origin = v15;
  retstr->leadingTopButtonFrame.size.double width = x;
  retstr->leadingTopButtonFrame.size.double height = y;
  retstr->trailingTopButtonFrame.origin = v14;
  retstr->trailingTopButtonFrame.CGSize size = v13;
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v16 = self;
  sub_1D3351818(v13, a4, a5, a6, (char *)v16, v12);
  _Block_release(v12);
  _Block_release(v12);
}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  uint64_t v4 = (PREditingSceneViewController *)a3;
  uint64_t v5 = self;
  PosterRackCollectionViewController.editingSceneViewControllerDidFinalize(_:)(v4);
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  uint64_t v10 = self;
  PosterRackCollectionViewController.galleryViewController(_:didSelect:from:)(v8, a4, (uint64_t)v9);

  swift_unknownObjectRelease();
}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  uint64_t v8 = OBJC_IVAR___PBFPosterRackCollectionViewController_editingSessionInProgressAssertion;
  id v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFPosterRackCollectionViewController_editingSessionInProgressAssertion);
  id v10 = a3;
  swift_unknownObjectRetain();
  uint64_t v11 = self;
  if (v9) {
    objc_msgSend(v9, sel_invalidate);
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;

  swift_unknownObjectRelease();
  return a4;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1D33538D4((uint64_t)v8, a5);
}

- (void)focusSelectionViewController:(id)a3 hasSelected:(BOOL)a4 activity:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = self;
  PosterRackCollectionViewController.focusSelectionViewController(_:hasSelected:activity:)(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)homeScreenServiceLayoutDidChange:(id)a3
{
  id v4 = a3;
  id v9 = self;
  id v5 = [(PBFPosterRackCollectionViewController *)v9 collectionView];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v8 = v6;
    sub_1D33319C8(1, (uint64_t)sub_1D3355764, v7);

    swift_release();
  }
  else
  {
  }
}

- (PBFPosterRackCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (PBFPosterRackCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PBFPosterRackCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PBFPosterRackCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end