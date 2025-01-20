@interface PBFPosterGalleryPreviewViewController
+ (void)configureSheetPresentationController:(id)a3;
- ($93F1CD7DD39D62F1A27D2B4232824D31)metricsForEnvironment:(SEL)a3;
- (BOOL)isPresentingPreview;
- (NSSet)displayedPreviewIdentifiers;
- (NSSet)tappedPreviewIdentifiers;
- (NSString)addedPreviewIdentifier;
- (NSTimer)loadingHeroActivityIndicationTimer;
- (PBFApplicationStateMonitor)applicationStateMonitor;
- (PBFGalleryEditingSceneViewController)loadingHeroEditingSceneViewController;
- (PBFPosterGalleryDataProvider)dataProvider;
- (PBFPosterGalleryPreviewView)loadingHeroPreviewView;
- (PBFPosterGalleryPreviewViewControllerDelegate)delegate;
- (PREditingSceneViewControllerDelegate)editingSceneDelegate;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (id)_layoutSectionForSection:(int64_t)a3 environment:(id)a4 galleryViewSpec:(id)a5;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)galleryCollectionViewController;
- (id)navigationControllerForPresentingSceneViewController:(id)a3;
- (int64_t)layoutOrientation;
- (void)_closeButtonTapped:(id)a3;
- (void)_updatePreferredContentSizeForOrientation:(int64_t)a3;
- (void)dealloc;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3;
- (void)forwardAppearanceNotificationName:(id)a3;
- (void)galleryCollectionViewControllerDidSelectPreview:(id)a3 fromPreviewView:(id)a4;
- (void)galleryCollectionViewControllerWillDisplayPreview:(id)a3;
- (void)presentConfiguratorForPreview:(id)a3 fromView:(id)a4;
- (void)presentPreview:(id)a3 withMode:(int64_t)a4 fromView:(id)a5;
- (void)presentRendererForPreview:(id)a3 fromView:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingSceneDelegate:(id)a3;
- (void)setLoadingHeroActivityIndicationTimer:(id)a3;
- (void)setLoadingHeroEditingSceneViewController:(id)a3;
- (void)setLoadingHeroPreviewView:(id)a3;
- (void)setPresentingPreview:(BOOL)a3;
- (void)updatePreferredContentSizeForSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)viewDidLoad;
@end

@implementation PBFPosterGalleryPreviewViewController

- (void)dealloc
{
  [(PRSceneViewController *)self->_loadingHeroEditingSceneViewController setForcesSceneForeground:0];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryPreviewViewController;
  [(PBFPosterGalleryPreviewViewController *)&v3 dealloc];
}

+ (void)configureSheetPresentationController:(id)a3
{
  id v3 = a3;
  PRSheetCornerRadius();
  objc_msgSend(v3, "setPreferredCornerRadius:");
  [v3 _setShouldDismissWhenTappedOutside:1];
  [v3 setPrefersGrabberVisible:0];
}

- (id)galleryCollectionViewController
{
  return self->_collectionViewController;
}

- (void)setApplicationStateMonitor:(id)a3
{
  p_applicationStateMonitor = &self->_applicationStateMonitor;
  id v6 = a3;
  if ((-[PBFApplicationStateMonitor isEqual:](*p_applicationStateMonitor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
    [(_PBFGalleryCollectionViewController *)self->_collectionViewController setApplicationStateMonitor:*p_applicationStateMonitor];
  }
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)PBFPosterGalleryPreviewViewController;
  [(PBFPosterGalleryPreviewViewController *)&v38 viewDidLoad];
  if (!self->_collectionViewController)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    [v3 setScrollDirection:0];
    v4 = [(PBFPosterGalleryPreviewViewController *)self view];
    v5 = [v4 window];
    id v6 = [v5 screen];
    v7 = +[PBFPosterGalleryViewSpec specForScreen:v6];

    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4FB1580]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke;
    v34[3] = &unk_1E6982010;
    objc_copyWeak(&v36, &location);
    id v9 = v7;
    id v35 = v9;
    v10 = (void *)[v8 initWithSectionProvider:v34 configuration:v3];
    v11 = [[_PBFGalleryCollectionViewController alloc] initWithCollectionViewLayout:v10];
    collectionViewController = self->_collectionViewController;
    self->_collectionViewController = v11;

    v13 = self->_collectionViewController;
    v14 = [(PBFPosterGalleryPreviewViewController *)self dataProvider];
    [(_PBFGalleryCollectionViewController *)v13 setDataProvider:v14];

    [(_PBFGalleryCollectionViewController *)self->_collectionViewController setDelegate:self];
    [(_PBFGalleryCollectionViewController *)self->_collectionViewController setHostingViewController:self];
    [(_PBFGalleryCollectionViewController *)self->_collectionViewController setApplicationStateMonitor:self->_applicationStateMonitor];
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  if (!self->_navigationController)
  {
    v16 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_collectionViewController];
    v17 = [(_PBFGalleryCollectionViewController *)self->_collectionViewController navigationItem];
    v18 = PBFLocalizedString(@"POSTER_GALLERY_PREVIEW_VIEW_TITLE");
    [v17 setTitle:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
    [v17 setRightBarButtonItem:v19];
    v20 = self->_navigationController;
    self->_navigationController = v16;
  }
  v21 = [(PBFPosterGalleryPreviewViewController *)self view];
  v22 = self->_navigationController;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke_2;
  v31[3] = &unk_1E6982038;
  v32 = v22;
  id v33 = v21;
  id v23 = v21;
  v24 = v22;
  [(PBFPosterGalleryPreviewViewController *)self bs_addChildViewController:v24 withSuperview:v23 animated:0 transitionBlock:v31];
  v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  displayedPreviewIdentifiers = self->_displayedPreviewIdentifiers;
  self->_displayedPreviewIdentifiers = v25;

  v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  tappedPreviewIdentifiers = self->_tappedPreviewIdentifiers;
  self->_tappedPreviewIdentifiers = v27;

  currentlyEditingPreviewIdentifier = self->_currentlyEditingPreviewIdentifier;
  self->_currentlyEditingPreviewIdentifier = 0;

  addedPreviewIdentifier = self->_addedPreviewIdentifier;
  self->_addedPreviewIdentifier = 0;

  [(PBFPosterGalleryPreviewViewController *)self _updatePreferredContentSizeForOrientation:[(PBFPosterGalleryPreviewViewController *)self layoutOrientation]];
}

id __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained _layoutSectionForSection:a2 environment:v6 galleryViewSpec:*(void *)(a1 + 32)];

  return v8;
}

void __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  v4 = [v3 view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v4, "setFrame:");

  v5 = [*(id *)(a1 + 32) view];
  [v5 setAccessibilityIdentifier:@"posterboard-gallery-view"];

  v6[2]();
}

- (id)_layoutSectionForSection:(int64_t)a3 environment:(id)a4 galleryViewSpec:(id)a5
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(PBFPosterGalleryPreviewViewController *)self dataProvider];
  uint64_t v11 = [v10 sectionIdentifierForIndex:a3];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  memset(v66, 0, sizeof(v66));
  [(PBFPosterGalleryPreviewViewController *)self metricsForEnvironment:v8];
  uint64_t v12 = [v10 sectionTypeForSectionWithIdentifier:v11];
  v13 = (double *)&v66[v12];
  double v14 = *v13;
  double v15 = v13[1];
  long long v16 = v69;
  v17 = [MEMORY[0x1E4FB1308] estimatedDimension:*v13];
  v18 = [MEMORY[0x1E4FB1308] estimatedDimension:v15];
  v61 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v17 heightDimension:v18];
  v65 = objc_msgSend(MEMORY[0x1E4FB1328], "itemWithLayoutSize:");
  [MEMORY[0x1E4FB1340] fixedSpacing:*(double *)&v16];
  v64 = id v63 = v9;
  v62 = (void *)v11;
  switch(v12)
  {
    case 0:
      v19 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v17 heightDimension:v18];
      v20 = (void *)MEMORY[0x1E4FB1318];
      v73 = v65;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      v22 = [v20 horizontalGroupWithLayoutSize:v19 subitems:v21];

      id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
      [v23 setInterGroupSpacing:*(double *)&v16];
      [v23 setOrthogonalScrollingBehavior:2];
      goto LABEL_10;
    case 1:
      v24 = (void *)MEMORY[0x1E4FB1338];
      v25 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
      v19 = [v24 sizeWithWidthDimension:v25 heightDimension:v18];

      v26 = (void *)MEMORY[0x1E4FB1318];
      v75[0] = v65;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
      v22 = [v26 horizontalGroupWithLayoutSize:v19 subitems:v27];

      [v22 setInterItemSpacing:v64];
      id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
      [v23 setInterGroupSpacing:*((double *)&v16 + 1)];
      goto LABEL_10;
    case 2:
      v28 = (void *)MEMORY[0x1E4FB1338];
      v29 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
      v19 = [v28 sizeWithWidthDimension:v29 heightDimension:v18];

      v30 = (void *)MEMORY[0x1E4FB1318];
      v74 = v65;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      v22 = [v30 horizontalGroupWithLayoutSize:v19 subitems:v31];

      [v22 setInterItemSpacing:v64];
      id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
      goto LABEL_10;
    case 3:
      unint64_t v32 = [v10 numberOfItemsInSectionWithIdentifier:v11];
      double v33 = *((double *)&v67 + 1);
      double v34 = *((double *)&v68 + 1);
      objc_msgSend(v9, "heroSpacingForOrientation:", -[PBFPosterGalleryPreviewViewController layoutOrientation](self, "layoutOrientation"));
      double v36 = v35;
      id v60 = v8;
      v37 = [v8 container];
      [v37 effectiveContentSize];
      double v39 = v38 - v33 - v34;

      v19 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v17 heightDimension:v18];
      v40 = (void *)MEMORY[0x1E4FB1318];
      if (v36 * (double)(v32 - 1) + (double)v32 * v14 <= v39)
      {
        v22 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v19 repeatingSubitem:v65 count:v32];
        v42 = [MEMORY[0x1E4FB1340] fixedSpacing:v36];
        [v22 setInterItemSpacing:v42];

        v59 = [MEMORY[0x1E4FB1340] flexibleSpacing:0.0];
        v58 = [MEMORY[0x1E4FB1310] spacingForLeading:v59 top:0 trailing:v59 bottom:0];
        [v22 setEdgeSpacing:v58];
        v57 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        v43 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v57 heightDimension:v18];
        v44 = (void *)MEMORY[0x1E4FB1318];
        v72 = v22;
        v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        v46 = [v44 horizontalGroupWithLayoutSize:v43 subitems:v45];

        id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v46];
      }
      else
      {
        v71 = v65;
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        v22 = [v40 horizontalGroupWithLayoutSize:v19 subitems:v41];

        id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
        [v23 setInterGroupSpacing:v36];
        [v23 setOrthogonalScrollingBehavior:2];
      }
      id v8 = v60;
LABEL_10:

      id v9 = v63;
      break;
    default:
      id v23 = 0;
      break;
  }
  objc_msgSend(v23, "setContentInsets:", *(double *)&v66[2 * v12 + 6], *((double *)&v66[2 * v12 + 6] + 1), *(double *)&v66[2 * v12 + 7], *((double *)&v66[2 * v12 + 7] + 1));
  if (v12 != 3)
  {
    v47 = (void *)MEMORY[0x1E4FB1308];
    v48 = [v9 sectionHeaderTitleFont];
    [v48 lineHeight];
    v49 = objc_msgSend(v47, "estimatedDimension:");

    v50 = (void *)MEMORY[0x1E4FB1338];
    v51 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v52 = [v50 sizeWithWidthDimension:v51 heightDimension:v49];

    v53 = objc_msgSend(MEMORY[0x1E4FB12F8], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v52, @"KGalleryHeaderElementKind", 1, 0.0, 0.0);
    [v53 setZIndex:0];
    v70 = v53;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v55 = id v54 = v8;
    [v23 setBoundarySupplementaryItems:v55];

    id v8 = v54;
    id v9 = v63;
  }
  return v23;
}

- (void)setDataProvider:(id)a3
{
  v5 = (PBFPosterGalleryDataProvider *)a3;
  if (self->_dataProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_dataProvider, a3);
    int v6 = [(PBFPosterGalleryPreviewViewController *)self isViewLoaded];
    v5 = v7;
    if (v6)
    {
      [(_PBFGalleryCollectionViewController *)self->_collectionViewController setDataProvider:self->_dataProvider];
      v5 = v7;
    }
  }
}

- (int64_t)layoutOrientation
{
  v2 = [(PBFPosterGalleryPreviewViewController *)self view];
  id v3 = [v2 window];
  v4 = [v3 windowScene];
  uint64_t v5 = [v4 interfaceOrientation];

  if (!v5)
  {
    int v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v5 = [v6 activeInterfaceOrientation];
  }
  if ((unint64_t)(v5 - 1) < 2) {
    return 1;
  }
  else {
    return 4;
  }
}

- (void)_updatePreferredContentSizeForOrientation:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  uint64_t v5 = [(PBFPosterGalleryPreviewViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    v7 = [(PBFPosterGalleryPreviewViewController *)self view];
    id v8 = [v7 window];
    id v9 = [v8 screen];
    id v10 = +[PBFPosterGalleryViewSpec specForScreen:v9];

    [v10 gallerySizeForPadOrientation:a3];
    -[PBFPosterGalleryPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)updatePreferredContentSizeForSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [(PBFPosterGalleryPreviewViewController *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 1)
  {
    if (width < height) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 4;
    }
    [(PBFPosterGalleryPreviewViewController *)self _updatePreferredContentSizeForOrientation:v10];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__PBFPosterGalleryPreviewViewController_updatePreferredContentSizeForSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E6982060;
    objc_copyWeak(&v12, &location);
    [v7 animateAlongsideTransition:v11 completion:0];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __101__PBFPosterGalleryPreviewViewController_updatePreferredContentSizeForSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 layoutIfNeeded];
}

- ($93F1CD7DD39D62F1A27D2B4232824D31)metricsForEnvironment:(SEL)a3
{
  id v63 = a4;
  uint64_t v6 = [v63 container];
  [v6 contentSize];
  if (v8 != self->_environmentContainerContentSize.width || v7 != self->_environmentContainerContentSize.height) {
    goto LABEL_14;
  }
  uint64_t v10 = [v63 container];
  [v10 contentInsets];
  double v14 = v13;
  if (v15 != self->_environmentContainerContentInsets.leading
    || v11 != self->_environmentContainerContentInsets.top
    || v12 != self->_environmentContainerContentInsets.trailing)
  {

LABEL_14:
    goto LABEL_15;
  }
  double bottom = self->_environmentContainerContentInsets.bottom;

  if (v14 == bottom)
  {
    long long v56 = *(_OWORD *)&self->_metrics.sectionContentInsets[3].bottom;
    *(_OWORD *)&retstr->var2[3].top = *(_OWORD *)&self->_metrics.sectionContentInsets[3].top;
    *(_OWORD *)&retstr->var2[3].double bottom = v56;
    *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->_metrics.standardSpacing;
    long long v57 = *(_OWORD *)&self->_metrics.sectionContentInsets[1].bottom;
    *(_OWORD *)&retstr->var2[1].top = *(_OWORD *)&self->_metrics.sectionContentInsets[1].top;
    *(_OWORD *)&retstr->var2[1].double bottom = v57;
    long long v58 = *(_OWORD *)&self->_metrics.sectionContentInsets[2].bottom;
    *(_OWORD *)&retstr->var2[2].top = *(_OWORD *)&self->_metrics.sectionContentInsets[2].top;
    *(_OWORD *)&retstr->var2[2].double bottom = v58;
    long long v59 = *(_OWORD *)&self->_metrics.maximumNumberOfHorizontalItems[2];
    *(_OWORD *)retstr->var1 = *(_OWORD *)self->_metrics.maximumNumberOfHorizontalItems;
    *(_OWORD *)&retstr->var1[2] = v59;
    long long v60 = *(_OWORD *)&self->_metrics.sectionContentInsets[0].bottom;
    *(_OWORD *)&retstr->var2[0].top = *(_OWORD *)&self->_metrics.sectionContentInsets[0].top;
    *(_OWORD *)&retstr->var2[0].double bottom = v60;
    CGSize v61 = self->_metrics.itemSizeForType[1];
    retstr->var0[0] = self->_metrics.itemSizeForType[0];
    retstr->var0[1] = v61;
    CGSize v62 = self->_metrics.itemSizeForType[3];
    retstr->var0[2] = self->_metrics.itemSizeForType[2];
    retstr->var0[3] = v62;
    goto LABEL_18;
  }
LABEL_15:
  p_metrics = &self->_metrics;
  self->_metrics.itemSizeForType[0] = 0u;
  self->_metrics.itemSizeForType[1] = 0u;
  self->_metrics.itemSizeForType[2] = 0u;
  self->_metrics.itemSizeForType[3] = 0u;
  *(_OWORD *)self->_metrics.maximumNumberOfHorizontalItems = 0u;
  *(_OWORD *)&self->_metrics.maximumNumberOfHorizontalItems[2] = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[0].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[0].double bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[1].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[1].double bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[2].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[2].double bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[3].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[3].double bottom = 0u;
  *(_OWORD *)&self->_metrics.standardSpacing = 0u;
  v19 = [(PBFPosterGalleryPreviewViewController *)self view];
  v20 = [v19 window];
  v21 = [v20 screen];
  v22 = +[PBFPosterGalleryViewSpec specForScreen:v21];

  id v23 = [v63 container];
  [v23 effectiveContentSize];

  int64_t v24 = [(PBFPosterGalleryPreviewViewController *)self layoutOrientation];
  +[PBFPosterGalleryPreviewCell contentSizeForCellWithTitle:0 interfaceOrientation:v24 spec:v22];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  +[PBFPosterGalleryPreviewCell contentSizeForCellWithTitle:1 interfaceOrientation:v24 spec:v22];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  +[PBFPosterGalleryPreviewCell heroContentSizeForCellWithTitle:1 interfaceOrientation:v24 spec:v22];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  [v22 sectionHorizontalMargin];
  UIRoundToScreenScale();
  uint64_t v37 = 0;
  p_metrics->itemSizeForType[1].double width = v30;
  p_metrics->itemSizeForType[1].double height = v32;
  p_metrics->itemSizeForType[0].double width = v26;
  p_metrics->itemSizeForType[0].double height = v28;
  p_metrics->itemSizeForType[3].double width = v34;
  p_metrics->itemSizeForType[3].double height = v36;
  p_metrics->itemSizeForType[2].double width = v38;
  p_metrics->itemSizeForType[2].double height = v28;
  *(int64x2_t *)p_metrics->maximumNumberOfHorizontalItems = vdupq_n_s64(3uLL);
  *(_OWORD *)&p_metrics->maximumNumberOfHorizontalItems[2] = xmmword_1D337E9D0;
  do
  {
    p_trailing = (void *)&p_metrics->sectionContentInsets[v37].trailing;
    [v22 sectionHorizontalMargin];
    uint64_t v41 = v40;
    [v22 sectionVerticalMargin];
    uint64_t v43 = v42;
    [v22 sectionHorizontalMargin];
    *(p_trailing - 3) = 0;
    *(p_trailing - 2) = v41;
    *(p_trailing - 1) = v43;
    void *p_trailing = v44;
    ++v37;
  }
  while (v37 != 4);
  p_metrics->sectionContentInsets[3].top = 4.0;
  [v22 standardSpacing];
  p_metrics->standardSpacing = v45;
  [v22 groupSpacing];
  p_metrics->groupSpacing = v46;
  long long v47 = *(_OWORD *)&p_metrics->sectionContentInsets[3].bottom;
  *(_OWORD *)&retstr->var2[3].top = *(_OWORD *)&p_metrics->sectionContentInsets[3].top;
  *(_OWORD *)&retstr->var2[3].double bottom = v47;
  long long v48 = *(_OWORD *)&p_metrics->sectionContentInsets[1].bottom;
  *(_OWORD *)&retstr->var2[1].top = *(_OWORD *)&p_metrics->sectionContentInsets[1].top;
  *(_OWORD *)&retstr->var2[1].double bottom = v48;
  long long v49 = *(_OWORD *)&p_metrics->sectionContentInsets[2].bottom;
  *(_OWORD *)&retstr->var2[2].top = *(_OWORD *)&p_metrics->sectionContentInsets[2].top;
  *(_OWORD *)&retstr->var2[2].double bottom = v49;
  long long v50 = *(_OWORD *)&p_metrics->maximumNumberOfHorizontalItems[2];
  *(_OWORD *)retstr->var1 = *(_OWORD *)p_metrics->maximumNumberOfHorizontalItems;
  *(_OWORD *)&retstr->var1[2] = v50;
  long long v51 = *(_OWORD *)&p_metrics->sectionContentInsets[0].bottom;
  *(_OWORD *)&retstr->var2[0].top = *(_OWORD *)&p_metrics->sectionContentInsets[0].top;
  *(_OWORD *)&retstr->var2[0].double bottom = v51;
  CGSize v52 = p_metrics->itemSizeForType[1];
  retstr->var0[0] = p_metrics->itemSizeForType[0];
  retstr->var0[1] = v52;
  CGSize v53 = p_metrics->itemSizeForType[3];
  retstr->var0[2] = p_metrics->itemSizeForType[2];
  retstr->var0[3] = v53;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&p_metrics->standardSpacing;

LABEL_18:

  return result;
}

- (void)presentPreview:(id)a3 withMode:(int64_t)a4 fromView:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 posterDescriptorLookupInfo];
  double v11 = [v10 posterDescriptorPath];

  double v12 = [v8 posterDescriptorLookupInfo];
  double v13 = [v12 posterDescriptorExtension];

  double v14 = (void *)MEMORY[0x1E4F924A8];
  double v15 = [v13 identity];
  long long v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v14 extensionInstanceForIdentity:v15 instanceIdentifier:v16];

  if (v11 && v17)
  {
    if (a4 == 2)
    {
      id v63 = v13;
      [(PBFPosterGalleryPreviewViewController *)self setPresentingPreview:1];
      v18 = [v8 previewUniqueIdentifier];
      currentlyEditingPreviewIdentifier = self->_currentlyEditingPreviewIdentifier;
      self->_currentlyEditingPreviewIdentifier = v18;

      v20 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroEditingSceneViewController];
      v21 = v20;
      if (v20)
      {
        [v20 removeObserver:self];
        [v21 setForcesSceneForeground:0];
        v22 = [v21 view];
        [v22 removeFromSuperview];

        [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroEditingSceneViewController:0];
        id v23 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroPreviewView];
        [v23 setShowsLoadingIndicator:0];

        [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroPreviewView:0];
        int64_t v24 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroActivityIndicationTimer];
        [v24 invalidate];

        [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroActivityIndicationTimer:0];
      }
      double v25 = [PBFGalleryEditingSceneViewController alloc];
      CGFloat v26 = objc_msgSend(MEMORY[0x1E4F92630], "pbf_configurableOptionsForPreview:", v8);
      double v27 = objc_msgSend(MEMORY[0x1E4F92640], "pbf_configuredPropertiesForPreview:", v8);
      CGFloat v28 = [(PRSceneViewController *)v25 initWithProvider:v17 contents:v11 configurableOptions:v26 configuredProperties:v27];

      double v29 = [v8 previewUniqueIdentifier];
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryPreviewUniqueIdentifier:v29];

      CGFloat v30 = [v8 galleryOptions];
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryOptions:v30];

      double v31 = [MEMORY[0x1E4F926A8] modelObjectCacheForPath:v11];
      CGFloat v32 = [v31 galleryOptions];
      if (v32)
      {
        [(PBFGalleryEditingSceneViewController *)v28 setDescriptorGalleryOptions:v32];
      }
      else
      {
        double v35 = [MEMORY[0x1E4F926B0] loadPosterDescriptorGalleryOptionsForPath:v11 error:0];
        [(PBFGalleryEditingSceneViewController *)v28 setDescriptorGalleryOptions:v35];
      }
      [v9 posterPreviewFrame];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      uint64_t v44 = [v9 window];
      objc_msgSend(v9, "convertRect:toCoordinateSpace:", v44, v37, v39, v41, v43);
      -[PBFGalleryEditingSceneViewController setGalleryPreviewFrame:](v28, "setGalleryPreviewFrame:");

      double v45 = [v9 window];
      double v46 = [v45 screen];
      long long v47 = +[PBFPosterGalleryViewSpec specForScreen:v46];
      [v47 posterCornerRadius];
      -[PBFGalleryEditingSceneViewController setGalleryPreviewCornerRadius:](v28, "setGalleryPreviewCornerRadius:");

      long long v48 = [v9 contentView];
      CGSize v62 = v21;
      if (v48) {
        uint64_t v49 = [v8 presentationStyle];
      }
      else {
        uint64_t v49 = 1;
      }
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryPreviewView:v48];
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryPresentationStyle:v49];
      long long v50 = [v8 type];
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryPreviewType:v50];

      long long v51 = [v9 makeComplicationsPortalView];
      [(PBFGalleryEditingSceneViewController *)v28 setGalleryPreviewComplicationsView:v51];

      [(PREditingSceneViewController *)v28 setDelegate:self];
      BOOL v34 = v49 != 1;
      if (v49 == 1)
      {
        CGSize v61 = v48;
        CGSize v52 = PBFLogCommon();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          CGSize v53 = [v63 posterExtensionBundleIdentifier];
          *(_DWORD *)buf = 138412290;
          id v67 = v53;
          _os_log_impl(&dword_1D31CE000, v52, OS_LOG_TYPE_DEFAULT, "Delaying the start of presentation for hero poster until it finishes loading: %@", buf, 0xCu);
        }
        [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroEditingSceneViewController:v28];
        [(PREditingSceneViewController *)v28 addObserver:self];
        [(PREditingSceneViewController *)v28 setShowsContentWhenReady:1];
        id v54 = [(PBFGalleryEditingSceneViewController *)v28 view];
        [v54 setHidden:1];
        v55 = [(PBFPosterGalleryPreviewViewController *)self view];
        long long v56 = [v55 window];
        [v56 bounds];
        objc_msgSend(v54, "setFrame:");

        long long v57 = [(PBFPosterGalleryPreviewViewController *)self view];
        [v57 addSubview:v54];

        long long v58 = (void *)MEMORY[0x1E4F1CB00];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __74__PBFPosterGalleryPreviewViewController_presentPreview_withMode_fromView___block_invoke;
        v64[3] = &unk_1E6982088;
        v64[4] = self;
        id v65 = v9;
        long long v59 = [v58 scheduledTimerWithTimeInterval:0 repeats:v64 block:0.5];
        [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroActivityIndicationTimer:v59];
        [(PRSceneViewController *)v28 setForcesSceneForeground:1];

        long long v48 = v61;
      }

      double v13 = v63;
    }
    else
    {
      CGFloat v28 = (PBFGalleryEditingSceneViewController *)[objc_alloc(MEMORY[0x1E4F92708]) initWithProvider:v17 contents:v11 previewing:a4 == 1];
      BOOL v34 = 1;
    }
    [(PBFGalleryEditingSceneViewController *)v28 setModalPresentationStyle:5];
    [(PBFGalleryEditingSceneViewController *)v28 setModalPresentationCapturesStatusBarAppearance:1];
    if (v34)
    {
      long long v60 = [(PBFPosterGalleryPreviewViewController *)self navigationControllerForPresentingSceneViewController:v28];
      [(PBFPosterGalleryPreviewViewController *)self presentViewController:v60 animated:1 completion:0];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    double v33 = [v17 processIdentity];
    *(_DWORD *)buf = 138413058;
    id v67 = v8;
    __int16 v68 = 2048;
    int64_t v69 = a4;
    __int16 v70 = 2112;
    v71 = v11;
    __int16 v72 = 2112;
    v73 = v33;
    _os_log_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "cannot present preview %@ (with mode=%lli) due to invalid lookup info : path=%@ processIdentity=%@", buf, 0x2Au);
  }
}

uint64_t __74__PBFPosterGalleryPreviewViewController_presentPreview_withMode_fromView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingHeroPreviewView];
  [v2 setShowsLoadingIndicator:0];

  [*(id *)(a1 + 40) setShowsLoadingIndicator:1];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 setLoadingHeroPreviewView:v4];
}

- (id)navigationControllerForPresentingSceneViewController:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithRootViewController:v5];

  [v6 setNavigationBarHidden:1 animated:0];
  [v6 setModalPresentationStyle:5];
  [v6 setModalPresentationCapturesStatusBarAppearance:1];
  if (MEMORY[0x1D94336E0]([v6 setTransitioningDelegate:self]))
  {
    double v7 = [v6 view];
    [v7 setClipsToBounds:0];

    [v6 _setClipsToBounds:0];
  }
  return v6;
}

- (void)presentRendererForPreview:(id)a3 fromView:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 posterDescriptorLookupInfo];
  double v7 = [v6 posterDescriptorPath];

  id v8 = [v5 posterDescriptorLookupInfo];
  id v9 = [v8 posterDescriptorExtension];

  uint64_t v10 = (void *)MEMORY[0x1E4F924A8];
  double v11 = [v9 identity];
  double v12 = [MEMORY[0x1E4F29128] UUID];
  double v13 = [v10 extensionInstanceForIdentity:v11 instanceIdentifier:v12];

  if (v7 && v13)
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F92708]) initWithProvider:v13 contents:v7];
    [v14 setModalPresentationStyle:0];
    [(PBFPosterGalleryPreviewViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [v13 processIdentity];
    int v16 = 138412802;
    id v17 = v5;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "cannot present renderer for preview %@ due to invalid lookup info : path=%@ processIdentity=%@", (uint8_t *)&v16, 0x20u);
  }
}

- (void)presentConfiguratorForPreview:(id)a3 fromView:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 posterDescriptorLookupInfo];
  double v7 = [v6 posterDescriptorPath];

  id v8 = [v5 posterDescriptorLookupInfo];
  id v9 = [v8 posterDescriptorExtension];

  uint64_t v10 = (void *)MEMORY[0x1E4F924A8];
  double v11 = [v9 identity];
  double v12 = [MEMORY[0x1E4F29128] UUID];
  double v13 = [v10 extensionInstanceForIdentity:v11 instanceIdentifier:v12];

  if (v7 && v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F925A8]);
    double v15 = objc_msgSend(MEMORY[0x1E4F92630], "pbf_configurableOptionsForPreview:", v5);
    int v16 = (void *)[v14 initWithProvider:v13 contents:v7 configurableOptions:v15];

    id v17 = [(PBFPosterGalleryPreviewViewController *)self editingSceneDelegate];
    [v16 setDelegate:v17];

    [v16 setModalPresentationStyle:0];
    [(PBFPosterGalleryPreviewViewController *)self presentViewController:v16 animated:1 completion:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [v13 processIdentity];
    int v19 = 138412802;
    id v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    __int16 v23 = 2112;
    int64_t v24 = v18;
    _os_log_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "cannot present configurator for preview %@ due to invalid lookup info : path=%@ processIdentity=%@", (uint8_t *)&v19, 0x20u);
  }
}

- (NSSet)displayedPreviewIdentifiers
{
  v2 = (void *)[(NSMutableSet *)self->_displayedPreviewIdentifiers copy];
  return (NSSet *)v2;
}

- (NSSet)tappedPreviewIdentifiers
{
  v2 = (void *)[(NSMutableSet *)self->_tappedPreviewIdentifiers copy];
  return (NSSet *)v2;
}

- (NSString)addedPreviewIdentifier
{
  v2 = (void *)[(NSString *)self->_addedPreviewIdentifier copy];
  return (NSString *)v2;
}

- (void)_closeButtonTapped:(id)a3
{
  uint64_t v4 = [(PBFPosterGalleryPreviewViewController *)self activePresentationController];
  id v5 = [v4 delegate];
  uint64_t v6 = [(PBFPosterGalleryPreviewViewController *)self presentingViewController];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __60__PBFPosterGalleryPreviewViewController__closeButtonTapped___block_invoke;
  double v12 = &unk_1E69808E8;
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  [v6 dismissViewControllerAnimated:1 completion:&v9];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "presentationControllerWillDismiss:", v8, v9, v10, v11, v12, v13);
  }
}

uint64_t __60__PBFPosterGalleryPreviewViewController__closeButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 presentationControllerDidDismiss:v4];
  }
  return result;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v10 = a4;
  uint64_t v6 = [(PBFPosterGalleryPreviewViewController *)self editingSceneDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (v6)
    {
      [v6 topButtonLayoutForEditingSceneViewController:v10];
    }
    else
    {
      retstr->trailingTopButtonFrame.origin = 0u;
      retstr->trailingTopButtonFrame.size = 0u;
      retstr->leadingTopButtonFrame.origin = 0u;
      retstr->leadingTopButtonFrame.size = 0u;
    }
  }
  else
  {
    CGPoint v7 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    retstr->leadingTopButtonFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    retstr->leadingTopButtonFrame.size = v8;
    retstr->trailingTopButtonFrame.origin = v7;
    retstr->trailingTopButtonFrame.size = v8;
  }

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v12;
  NSClassFromString(&cfstr_Pbfgalleryedit.isa);
  if (!v16)
  {
    double v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:](a2);
    }
LABEL_19:
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32106D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFGalleryEditingSceneViewControllerClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:](a2);
    }
    goto LABEL_19;
  }

  unint64_t v17 = 0x1EA6A5000uLL;
  if (a4 == 1)
  {
    objc_storeStrong((id *)&self->_addedPreviewIdentifier, self->_currentlyEditingPreviewIdentifier);
    id v18 = v16;
    [v18 setGalleryDismissalAction:1];
    int v19 = [v18 galleryOptions];
    id v20 = [v19 modeSemanticTypeToCreate];

    if (v20)
    {
      uint64_t v58 = 0;
      long long v59 = &v58;
      uint64_t v60 = 0x2050000000;
      __int16 v21 = (void *)getDNDModeConfigurationServiceClass_softClass;
      uint64_t v61 = getDNDModeConfigurationServiceClass_softClass;
      if (!getDNDModeConfigurationServiceClass_softClass)
      {
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __getDNDModeConfigurationServiceClass_block_invoke;
        v57[3] = &unk_1E6980C98;
        v57[4] = &v58;
        __getDNDModeConfigurationServiceClass_block_invoke((uint64_t)v57);
        __int16 v21 = (void *)v59[3];
      }
      id v52 = v15;
      id v22 = v21;
      _Block_object_dispose(&v58, 8);
      __int16 v23 = [v22 serviceForClientIdentifier:@"com.apple.PosterBoard.gallery.MadeForFocus"];
      id v56 = 0;
      int64_t v24 = objc_msgSend(v23, "createModeConfigurationUsingTemplateForModeSemanticType:error:", objc_msgSend(v20, "integerValue"), &v56);
      id v53 = v56;
      id v54 = v24;
      if (v24)
      {
        uint64_t v44 = v23;
        id v25 = objc_alloc(MEMORY[0x1E4F92668]);
        CGFloat v26 = [v24 mode];
        [v26 modeIdentifier];
        double v27 = v47 = v13;
        [v24 mode];
        CGFloat v28 = v45 = v20;
        [v28 identifier];
        double v29 = v46 = v18;
        uint64_t v50 = [v25 initWithActivityIdentifier:v27 activityUUID:v29];

        id v42 = objc_alloc(MEMORY[0x1E4F92640]);
        uint64_t v49 = [v14 titleStyleConfiguration];
        long long v48 = [v14 complicationLayout];
        double v41 = [v14 renderingConfiguration];
        double v40 = [v14 homeScreenConfiguration];
        CGFloat v30 = [v14 colorVariationsConfiguration];
        double v39 = [v14 quickActionsConfiguration];
        double v31 = [v14 suggestionMetadata];
        CGFloat v32 = [v14 otherMetadata];
        double v33 = [v14 userInfo];
        BOOL v34 = (void *)v50;
        uint64_t v43 = [v42 initWithTitleStyleConfiguration:v49 focusConfiguration:v50 complicationLayout:v48 renderingConfiguration:v41 homeScreenConfiguration:v40 colorVariationsConfiguration:v30 quickActionsConfiguration:v39 suggestionMetadata:v31 otherMetadata:v32 userInfo:v33];

        unint64_t v17 = 0x1EA6A5000;
        id v13 = v47;

        id v18 = v46;
        id v20 = v45;

        __int16 v23 = v44;
        id v14 = (id)v43;
      }
      else
      {
        long long v51 = PBFLogCommon();
        BOOL v34 = v51;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:]((uint64_t)v53, v51);
        }
      }

      id v15 = v52;
    }
  }
  double v35 = [(PBFPosterGalleryPreviewViewController *)self editingSceneDelegate];
  [v35 editingSceneViewController:v16 userDidDismissWithAction:a4 updatedConfiguration:v13 updatedConfiguredProperties:v14 completion:v15];

  [(PBFPosterGalleryPreviewViewController *)self setPresentingPreview:0];
  uint64_t v36 = *(int *)(v17 + 1916);
  double v37 = *(Class *)((char *)&self->super.super.super.isa + v36);
  *(Class *)((char *)&self->super.super.super.isa + v36) = 0;
}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroEditingSceneViewController];

  if (v5 == v4)
  {
    uint64_t v6 = PBFLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CGPoint v7 = [v4 contentsIdentity];
      CGSize v8 = [v7 provider];
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v8;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "Restarting of presentation for hero poster: %@", buf, 0xCu);
    }
    uint64_t v9 = [v4 view];
    [v9 removeFromSuperview];
    [v9 setHidden:0];
    id v10 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroPreviewView];
    double v11 = [(PBFPosterGalleryPreviewViewController *)self navigationControllerForPresentingSceneViewController:v4];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __91__PBFPosterGalleryPreviewViewController_editingSceneViewControllerDidFinishShowingContent___block_invoke;
    unint64_t v17 = &unk_1E69808E8;
    id v18 = v4;
    id v19 = v10;
    id v12 = v10;
    [(PBFPosterGalleryPreviewViewController *)self presentViewController:v11 animated:1 completion:&v14];
    -[PBFPosterGalleryPreviewViewController setLoadingHeroEditingSceneViewController:](self, "setLoadingHeroEditingSceneViewController:", 0, v14, v15, v16, v17);
    [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroPreviewView:0];
    id v13 = [(PBFPosterGalleryPreviewViewController *)self loadingHeroActivityIndicationTimer];
    [v13 invalidate];

    [(PBFPosterGalleryPreviewViewController *)self setLoadingHeroActivityIndicationTimer:0];
  }
}

uint64_t __91__PBFPosterGalleryPreviewViewController_editingSceneViewControllerDidFinishShowingContent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setForcesSceneForeground:0];
  v2 = *(void **)(a1 + 40);
  return [v2 setShowsLoadingIndicator:0];
}

- (void)forwardAppearanceNotificationName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PBFPosterGalleryPreviewViewController *)self presentedViewController];
  uint64_t v6 = [v5 childViewControllers];

  uint64_t v14 = v6;
  CGPoint v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = PBFLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v20 = v4;
          __int16 v21 = 2114;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "Forwarding %{public}@ appearance notification to child view controller: %{public}@", buf, 0x16u);
        }

        [v12 forwardAppearanceNotificationName:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v9);
  }
}

uint64_t __75__PBFPosterGalleryPreviewViewController_forwardAppearanceNotificationName___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v5 = [(_PBFGalleryCollectionViewController *)self->_collectionViewController collectionView];
  id v3 = [v5 indexPathsForSelectedItems];
  id v4 = [v3 firstObject];
  [v5 deselectItemAtIndexPath:v4 animated:1];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  if (a5 == self
    && (self,
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v10 = [v7 bottomViewController];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
    id v16 = v13;

    if ([v16 galleryPresentationStyle])
    {
      uint64_t v14 = 0;
    }
    else
    {
      [v16 galleryPreviewFrame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      [v16 galleryPreviewCornerRadius];
      double v26 = v25;
      double v27 = [v16 galleryPreviewView];
      CGFloat v28 = [v16 galleryPreviewComplicationsView];
      uint64_t v14 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomUpAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v27, v28, v18, v20, v22, v24, v26);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v8 = [v5 bottomViewController];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  [v12 galleryPreviewFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [v12 galleryPreviewCornerRadius];
  double v22 = v21;
  double v23 = [v12 galleryPreviewView];
  double v24 = [v12 galleryPreviewComplicationsView];
  uint64_t v25 = [v12 galleryPresentationStyle];
  if (!v25)
  {
    double v40 = v22;
    double v26 = [v12 galleryPreviewUniqueIdentifier];
    [(_PBFGalleryCollectionViewController *)self->_collectionViewController previewFrameForScrollingPreviewWithIdentifierToVisible:v26];
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    if (!CGRectIsNull(v42))
    {
      double v31 = [(_PBFGalleryCollectionViewController *)self->_collectionViewController collectionView];
      CGFloat v32 = [v31 window];
      objc_msgSend(v31, "convertRect:toCoordinateSpace:", v32, x, y, width, height);
      double v14 = v33;
      double v16 = v34;
      double v18 = v35;
      double v20 = v36;
    }
    id v3 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomDownAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v23, v24, v14, v16, v18, v20, v40);
    double v37 = [(PBFPosterGalleryPreviewViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v38 = objc_msgSend(v37, "galleryViewController:willUseAnimationController:forDismissingEditingViewControllerWithAction:", self, v3, objc_msgSend(v12, "galleryDismissalAction"));

      id v3 = (PBFEditingZoomDownAnimationController *)v38;
    }
  }
  if (v25) {
LABEL_14:
  }
    id v3 = 0;

  return v3;
}

- (void)galleryCollectionViewControllerWillDisplayPreview:(id)a3
{
  displayedPreviewIdentifiers = self->_displayedPreviewIdentifiers;
  id v4 = [a3 previewUniqueIdentifier];
  [(NSMutableSet *)displayedPreviewIdentifiers addObject:v4];
}

- (void)galleryCollectionViewControllerDidSelectPreview:(id)a3 fromPreviewView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PBFPosterGalleryPreviewViewController *)self delegate];
  [v8 galleryViewController:self didSelectPreview:v7 fromPreviewView:v6];

  tappedPreviewIdentifiers = self->_tappedPreviewIdentifiers;
  id v10 = [v7 previewUniqueIdentifier];

  [(NSMutableSet *)tappedPreviewIdentifiers addObject:v10];
}

- (PBFPosterGalleryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (PBFPosterGalleryPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFPosterGalleryPreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditingSceneViewControllerDelegate)editingSceneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingSceneDelegate);
  return (PREditingSceneViewControllerDelegate *)WeakRetained;
}

- (void)setEditingSceneDelegate:(id)a3
{
}

- (BOOL)isPresentingPreview
{
  return self->_presentingPreview;
}

- (void)setPresentingPreview:(BOOL)a3
{
  self->_presentingPreview = a3;
}

- (PBFGalleryEditingSceneViewController)loadingHeroEditingSceneViewController
{
  return self->_loadingHeroEditingSceneViewController;
}

- (void)setLoadingHeroEditingSceneViewController:(id)a3
{
}

- (NSTimer)loadingHeroActivityIndicationTimer
{
  return self->_loadingHeroActivityIndicationTimer;
}

- (void)setLoadingHeroActivityIndicationTimer:(id)a3
{
}

- (PBFPosterGalleryPreviewView)loadingHeroPreviewView
{
  return self->_loadingHeroPreviewView;
}

- (void)setLoadingHeroPreviewView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingHeroPreviewView, 0);
  objc_storeStrong((id *)&self->_loadingHeroActivityIndicationTimer, 0);
  objc_storeStrong((id *)&self->_loadingHeroEditingSceneViewController, 0);
  objc_destroyWeak((id *)&self->_editingSceneDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_addedPreviewIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyEditingPreviewIdentifier, 0);
  objc_storeStrong((id *)&self->_tappedPreviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayedPreviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

- (void)editingSceneViewController:(const char *)a1 userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

- (void)editingSceneViewController:(uint64_t)a1 userDidDismissWithAction:(NSObject *)a2 updatedConfiguration:updatedConfiguredProperties:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Could not create mode configuration on demand: %@", (uint8_t *)&v2, 0xCu);
}

- (void)editingSceneViewController:(const char *)a1 userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.3(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end