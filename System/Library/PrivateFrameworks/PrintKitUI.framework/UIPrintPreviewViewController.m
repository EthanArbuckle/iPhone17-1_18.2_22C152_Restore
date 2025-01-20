@interface UIPrintPreviewViewController
- (BOOL)canAddAllPages:(id)a3;
- (BOOL)canAddPage:(id)a3 forPageIndex:(int64_t)a4;
- (BOOL)canModifyPageRange;
- (BOOL)canRemovePage:(id)a3 forPageIndex:(int64_t)a4;
- (BOOL)canSetEndPage:(id)a3 forPageIndex:(int64_t)a4;
- (BOOL)canSetStartPage:(id)a3 forPageIndex:(int64_t)a4;
- (BOOL)canShowMenuBar;
- (BOOL)pageIndexIsInRange:(int64_t)a3;
- (BOOL)presentingDocumentInteractionController;
- (BOOL)showPageRange;
- (BOOL)showWebKitGeneratingPreviewProgress;
- (BOOL)showingPageView;
- (CGPoint)pinchGestureLastPoint;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)maxThumbnailSize;
- (CGSize)previewSize;
- (CGSize)thumbnailSizeForSheetNum:(int64_t)a3;
- (NSCache)cachedThumbnailImages;
- (NSLayoutConstraint)collectionViewTopConstraint;
- (NSLayoutConstraint)layoutPopupButtonTopConstraint;
- (NSOperationQueue)thumbnailOperationsQueue;
- (UIAction)pagesPopupAction;
- (UIAction)sheetsPopupAction;
- (UIAlertController)generatingPDFProgressController;
- (UIButton)layoutPopupButton;
- (UICollectionView)collectionView;
- (UIDocumentInteractionController)documentInteractionController;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIImageView)pinchAnimationView;
- (UIPrintInfo)printInfo;
- (UIPrintInteractionController)printInteractionController;
- (UIPrintMessageAndSpinnerView)webKitGeneratingPreviewProgressView;
- (UIPrintPanelViewController)printPanelViewController;
- (UIPrintPreviewViewController)initWithScrollDirection:(int64_t)a3 printPanelViewController:(id)a4;
- (UIPrintSheetController)printSheetController;
- (UITraitChangeRegistration)traitPreferredContentSizeChangeRegistration;
- (UIView)pinchAnimationProgressView;
- (UIView)pinchGestureBeginningView;
- (UIViewController)longPressImageViewController;
- (double)headerHeight;
- (double)pinchGestureLastScale;
- (double)progressPresentationTime;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)createGeneratingPDFProgressView:(CGRect)a3;
- (id)excludedActivityTypesForDocumentInteractionController:(id)a3;
- (id)printPagePreviewActionItemsWithPageIndex:(int64_t)a3;
- (id)printPagePreviewViewControllerForItemAtPageIndex:(int64_t)a3;
- (id)thumnailImageCompletionHandler;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSheets;
- (int64_t)previewLayoutType;
- (int64_t)previewScrollDirection;
- (void)addAllPages:(id)a3;
- (void)addPage:(id)a3 forPageIndex:(int64_t)a4;
- (void)animateCellAndPresentDocumentInteractionController;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)documentInteractionController:(id)a3 didEndSendingToApplication:(id)a4;
- (void)documentInteractionControllerDidEndPreview:(id)a3;
- (void)fetchThumnailImageInBackground:(int64_t)a3 previewPageCell:(id)a4 completion:(id)a5;
- (void)gotoFirstPage:(id)a3;
- (void)gotoLastPage:(id)a3;
- (void)handlePinch:(id)a3;
- (void)hideGeneratingPDFProgress:(id)a3;
- (void)hideWebkitGeneratingPreviewProgress;
- (void)layoutPopupButtonChanged:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageBadgeTapped:(int64_t)a3;
- (void)performThumbnailDispatchBlock:(id)a3;
- (void)removePage:(id)a3 forPageIndex:(int64_t)a4;
- (void)resetAllPages;
- (void)resetPrintPreview;
- (void)setCachedThumbnailImages:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewTopConstraint:(id)a3;
- (void)setDocumentInteractionController:(id)a3;
- (void)setEndPage:(id)a3 forPageIndex:(int64_t)a4;
- (void)setGeneratingPDFProgressController:(id)a3;
- (void)setLayoutPopupButton:(id)a3;
- (void)setLayoutPopupButtonTopConstraint:(id)a3;
- (void)setLongPressImageViewController:(id)a3;
- (void)setNumberOfSheets:(int64_t)a3;
- (void)setPagesPopupAction:(id)a3;
- (void)setPinchAnimationProgressView:(id)a3;
- (void)setPinchAnimationView:(id)a3;
- (void)setPinchGestureBeginningView:(id)a3;
- (void)setPinchGestureLastPoint:(CGPoint)a3;
- (void)setPinchGestureLastScale:(double)a3;
- (void)setPresentingDocumentInteractionController:(BOOL)a3;
- (void)setPreviewLayoutType:(int64_t)a3;
- (void)setPreviewScrollDirection:(int64_t)a3;
- (void)setPreviewSize:(CGSize)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintInteractionController:(id)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setPrintSheetController:(id)a3;
- (void)setProgressPresentationTime:(double)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setSheetsPopupAction:(id)a3;
- (void)setShowWebKitGeneratingPreviewProgress:(BOOL)a3;
- (void)setStartPage:(id)a3 forPageIndex:(int64_t)a4;
- (void)setThumbnailOperationsQueue:(id)a3;
- (void)setThumnailImageCompletionHandler:(id)a3;
- (void)setTraitPreferredContentSizeChangeRegistration:(id)a3;
- (void)setWebKitGeneratingPreviewProgressView:(id)a3;
- (void)setupCollectionView;
- (void)setupLayoutControl;
- (void)showQuickLookDocumentInteractionController:(id)a3;
- (void)showQuickLookFromPreviewAction;
- (void)showWebkitGeneratingPreviewProgress;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)updateHeaderFooters;
- (void)updateLayoutControl;
- (void)updatePageRange:(id)a3;
- (void)updatePreviewSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIPrintPreviewViewController

- (UIPrintPreviewViewController)initWithScrollDirection:(int64_t)a3 printPanelViewController:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UIPrintPreviewViewController;
  v7 = [(UIPrintPreviewViewController *)&v46 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_printPanelViewController, v6);
    v9 = [v6 printInteractionController];
    objc_storeWeak((id *)&v8->_printInteractionController, v9);

    v8->_previewScrollDirection = a3;
    uint64_t v10 = [v6 printInfo];
    printInfo = v8->_printInfo;
    v8->_printInfo = (UIPrintInfo *)v10;

    [(UIPrintPreviewViewController *)v8 setPreviewLayoutType:0];
    v12 = [UIPrintSheetController alloc];
    v13 = [(UIPrintPreviewViewController *)v8 printInfo];
    v14 = [(UIPrintPreviewViewController *)v8 printInteractionController];
    v15 = [(UIPrintSheetController *)v12 initWithPrintInfo:v13 printPageImageDelegate:v14];
    [(UIPrintPreviewViewController *)v8 setPrintSheetController:v15];

    v16 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v16 addObserver:v8 forKeyPath:0x1F3C9DEB8 options:0 context:0];

    v17 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v17 addObserver:v8 forKeyPath:0x1F3C9DDD8 options:0 context:0];

    v18 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v18 addObserver:v8 forKeyPath:0x1F3C9DED8 options:0 context:0];

    v19 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v19 addObserver:v8 forKeyPath:0x1F3C9DD98 options:0 context:0];

    v20 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v20 addObserver:v8 forKeyPath:0x1F3C9DEF8 options:0 context:0];

    v21 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v21 addObserver:v8 forKeyPath:0x1F3C9DE38 options:0 context:0];

    v22 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v22 addObserver:v8 forKeyPath:0x1F3C9DFF8 options:0 context:0];

    v23 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v23 addObserver:v8 forKeyPath:0x1F3C9E058 options:0 context:0];

    v24 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v24 addObserver:v8 forKeyPath:0x1F3C9E078 options:0 context:0];

    v25 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v25 addObserver:v8 forKeyPath:0x1F3C9E098 options:0 context:0];

    v26 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v26 addObserver:v8 forKeyPath:0x1F3C9E0B8 options:0 context:0];

    v27 = [(UIPrintPreviewViewController *)v8 printInfo];
    [v27 addObserver:v8 forKeyPath:0x1F3C9DD78 options:0 context:0];

    id v28 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(UIPrintPreviewViewController *)v8 setCachedThumbnailImages:v28];

    v29 = [(UIPrintPreviewViewController *)v8 cachedThumbnailImages];
    [v29 setEvictsObjectsWhenApplicationEntersBackground:0];

    objc_initWeak(&location, v8);
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __81__UIPrintPreviewViewController_initWithScrollDirection_printPanelViewController___block_invoke;
    v43 = &unk_1E6DA1C10;
    objc_copyWeak(&v44, &location);
    v30 = (void *)[&v40 copy];
    -[UIPrintPreviewViewController setThumnailImageCompletionHandler:](v8, "setThumnailImageCompletionHandler:", v30, v40, v41, v42, v43);

    id v31 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(UIPrintPreviewViewController *)v8 setThumbnailOperationsQueue:v31];

    v32 = [(UIPrintPreviewViewController *)v8 thumbnailOperationsQueue];
    [v32 setMaxConcurrentOperationCount:1];

    v33 = [(UIPrintPreviewViewController *)v8 thumbnailOperationsQueue];
    [v33 setName:@"com.apple.UIKit.UIPrintPreviewViewController.thumbnailOperationsQueue"];

    v34 = [(UIPrintPreviewViewController *)v8 printInteractionController];
    LODWORD(v15) = [v34 usingWebKitFormatter];

    if (v15)
    {
      v35 = [(UIPrintPreviewViewController *)v8 printSheetController];
      [v35 recalculateWebKitPageCount];
    }
    else
    {
      [(UIPrintPreviewViewController *)v8 resetAllPages];
    }
    v36 = self;
    v47[0] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    v38 = [(UIPrintPreviewViewController *)v8 registerForTraitChanges:v37 withAction:sel_traitCollectionDidChange_previousTraitCollection_];
    [(UIPrintPreviewViewController *)v8 setTraitPreferredContentSizeChangeRegistration:v38];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __81__UIPrintPreviewViewController_initWithScrollDirection_printPanelViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained cachedThumbnailImages];
  objc_sync_enter(v6);
  v7 = [WeakRetained cachedThumbnailImages];
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  if (v9) {
    [v7 setObject:v9 forKey:v8];
  }
  else {
    [v7 removeObjectForKey:v8];
  }

  objc_sync_exit(v6);
}

- (void)dealloc
{
  v3 = [(UIPrintPreviewViewController *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DEB8];

  v4 = [(UIPrintPreviewViewController *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DDD8];

  v5 = [(UIPrintPreviewViewController *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9DED8];

  id v6 = [(UIPrintPreviewViewController *)self printInfo];
  [v6 removeObserver:self forKeyPath:0x1F3C9DD98];

  v7 = [(UIPrintPreviewViewController *)self printInfo];
  [v7 removeObserver:self forKeyPath:0x1F3C9DEF8];

  v8 = [(UIPrintPreviewViewController *)self printInfo];
  [v8 removeObserver:self forKeyPath:0x1F3C9DE38];

  id v9 = [(UIPrintPreviewViewController *)self printInfo];
  [v9 removeObserver:self forKeyPath:0x1F3C9DFF8];

  uint64_t v10 = [(UIPrintPreviewViewController *)self printInfo];
  [v10 removeObserver:self forKeyPath:0x1F3C9E058];

  v11 = [(UIPrintPreviewViewController *)self printInfo];
  [v11 removeObserver:self forKeyPath:0x1F3C9E078];

  v12 = [(UIPrintPreviewViewController *)self printInfo];
  [v12 removeObserver:self forKeyPath:0x1F3C9E098];

  v13 = [(UIPrintPreviewViewController *)self printInfo];
  [v13 removeObserver:self forKeyPath:0x1F3C9E0B8];

  v14 = [(UIPrintPreviewViewController *)self printInfo];
  [v14 removeObserver:self forKeyPath:0x1F3C9DD78];

  v15 = [(UIPrintPreviewViewController *)self thumbnailOperationsQueue];
  [v15 cancelAllOperations];

  v16 = [(UIPrintPreviewViewController *)self traitPreferredContentSizeChangeRegistration];
  [(UIPrintPreviewViewController *)self unregisterForTraitChanges:v16];

  v17.receiver = self;
  v17.super_class = (Class)UIPrintPreviewViewController;
  [(UIPrintPreviewViewController *)&v17 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if ([v7 isEqualToString:0x1F3C9DEB8])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v8[3] = &unk_1E6DA14F0;
    id v9 = v7;
    uint64_t v10 = self;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 printInfo];
  v4 = [v3 pageRanges];
  [v2 updatePageRange:v4];

  v5 = *(void **)(a1 + 32);
  return [v5 updateLayoutControl];
}

uint64_t __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:0x1F3C9DDD8] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DED8] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DD98] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DEF8] & 1) != 0
    || [*(id *)(a1 + 32) isEqualToString:0x1F3C9DE38])
  {
    v2 = *(void **)(a1 + 40);
    return [v2 resetAllPages];
  }
  else
  {
    if ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DFF8])
    {
      v4 = [*(id *)(a1 + 40) printInfo];
      int v5 = [v4 nUpActive];

      if (v5) {
        [*(id *)(a1 + 40) setPreviewLayoutType:1];
      }
      [*(id *)(a1 + 40) updateLayoutControl];
    }
    id v6 = *(void **)(a1 + 40);
    return [v6 resetPrintPreview];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrintPreviewViewController;
  [(UIPrintPreviewViewController *)&v3 viewDidLoad];
  [(UIPrintPreviewViewController *)self setupCollectionView];
  [(UIPrintPreviewViewController *)self setupLayoutControl];
}

- (void)viewDidLayoutSubviews
{
  [(UIPrintPreviewViewController *)self updatePreviewSize];
  [(UIPrintPreviewViewController *)self updateHeaderFooters];
}

- (void)setupCollectionView
{
  v49[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIPrintPreviewViewController *)self collectionView];

  if (!v3)
  {
    v4 = objc_alloc_init(UIPrintPreviewFlowLayout);
    [(UICollectionViewFlowLayout *)v4 setMinimumLineSpacing:8.0];
    [(UICollectionViewFlowLayout *)v4 setMinimumInteritemSpacing:8.0];
    [(UICollectionViewFlowLayout *)v4 setScrollDirection:[(UIPrintPreviewViewController *)self previewScrollDirection]];
    id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
    id v6 = [(UIPrintPreviewViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    id v9 = [(UIPrintPreviewViewController *)self view];
    [v9 bounds];
    v48 = v4;
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, 0.0, 0.0, v8);
    [(UIPrintPreviewViewController *)self setCollectionView:v10];

    v11 = [MEMORY[0x1E4FB1618] clearColor];
    v12 = [(UIPrintPreviewViewController *)self collectionView];
    [v12 setBackgroundColor:v11];

    v13 = [(UIPrintPreviewViewController *)self collectionView];
    [v13 setDataSource:self];

    v14 = [(UIPrintPreviewViewController *)self collectionView];
    [v14 setDelegate:self];

    v15 = [(UIPrintPreviewViewController *)self collectionView];
    [v15 setPrefetchingEnabled:1];

    v16 = [(UIPrintPreviewViewController *)self collectionView];
    [v16 setPrefetchDataSource:self];

    objc_super v17 = [(UIPrintPreviewViewController *)self collectionView];
    [v17 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIPrintPreviewPageCell"];

    v18 = [(UIPrintPreviewViewController *)self collectionView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(UIPrintPreviewViewController *)self view];
    v20 = [(UIPrintPreviewViewController *)self collectionView];
    [v19 addSubview:v20];

    v21 = [(UIPrintPreviewViewController *)self collectionView];
    v22 = [v21 topAnchor];
    v23 = [(UIPrintPreviewViewController *)self view];
    v24 = [v23 topAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:0.0];
    [(UIPrintPreviewViewController *)self setCollectionViewTopConstraint:v25];

    v47 = [(UIPrintPreviewViewController *)self collectionViewTopConstraint];
    v49[0] = v47;
    objc_super v46 = [(UIPrintPreviewViewController *)self collectionView];
    id v44 = [v46 widthAnchor];
    v45 = [(UIPrintPreviewViewController *)self view];
    v43 = [v45 widthAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v49[1] = v42;
    uint64_t v41 = [(UIPrintPreviewViewController *)self collectionView];
    uint64_t v40 = [v41 centerXAnchor];
    v26 = [(UIPrintPreviewViewController *)self view];
    uint64_t v27 = [v26 centerXAnchor];
    id v28 = [v40 constraintEqualToAnchor:v27];
    v49[2] = v28;
    v29 = [(UIPrintPreviewViewController *)self collectionView];
    v30 = [v29 bottomAnchor];
    id v31 = [(UIPrintPreviewViewController *)self view];
    v32 = [v31 bottomAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    v49[3] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];

    v35 = [(UIPrintPreviewViewController *)self view];
    [v35 addConstraints:v34];

    v36 = [(UIPrintPreviewViewController *)self printPanelViewController];
    v37 = [v36 printInteractionController];
    LOBYTE(v27) = [v37 preventPDFCreation];

    if ((v27 & 1) == 0)
    {
      v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel_handlePinch_];
      v39 = [(UIPrintPreviewViewController *)self collectionView];
      [v39 addGestureRecognizer:v38];
    }
  }
}

- (void)setupLayoutControl
{
  v58[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIPrintPreviewViewController *)self layoutPopupButton];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v4 setIndicator:2];
    [v4 setTitleLineBreakMode:4];
    id v5 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v4 primaryAction:0];
    [(UIPrintPreviewViewController *)self setLayoutPopupButton:v5];

    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v8 = [v7 localizedStringForKey:@"Page View" value:@"Page View" table:@"Localizable"];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke;
    v55[3] = &unk_1E6DA1C38;
    objc_copyWeak(&v56, &location);
    id v9 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:v55];
    [(UIPrintPreviewViewController *)self setPagesPopupAction:v9];

    uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"Sheet View" value:@"Sheet View" table:@"Localizable"];
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    v52 = __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke_2;
    v53 = &unk_1E6DA1C38;
    objc_copyWeak(&v54, &location);
    v13 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:&v50];
    -[UIPrintPreviewViewController setSheetsPopupAction:](self, "setSheetsPopupAction:", v13, v50, v51, v52, v53);

    v14 = (void *)MEMORY[0x1E4FB1970];
    v15 = [(UIPrintPreviewViewController *)self pagesPopupAction];
    v58[0] = v15;
    v16 = [(UIPrintPreviewViewController *)self sheetsPopupAction];
    v58[1] = v16;
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    v18 = [v14 menuWithTitle:&stru_1F3C9D3F8 children:v17];
    v19 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v19 setMenu:v18];

    v20 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v20 setShowsMenuAsPrimaryAction:1];

    v21 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v21 setChangesSelectionAsPrimaryAction:1];

    v22 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = [MEMORY[0x1E4FB1618] labelColor];
    v24 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v24 setTintColor:v23];

    v25 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v25 setHidden:1];

    v26 = [(UIPrintPreviewViewController *)self view];
    uint64_t v27 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v26 addSubview:v27];

    id v28 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    v29 = [v28 topAnchor];
    v30 = [(UIPrintPreviewViewController *)self view];
    id v31 = [v30 topAnchor];
    [(UIPrintPreviewViewController *)self headerHeight];
    double v33 = v32;
    v34 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v34 frame];
    v36 = [v29 constraintEqualToAnchor:v31 constant:(v33 - v35) * 0.5];
    [(UIPrintPreviewViewController *)self setLayoutPopupButtonTopConstraint:v36];

    v37 = [(UIPrintPreviewViewController *)self layoutPopupButtonTopConstraint];
    [v37 setActive:1];

    v38 = [(UIPrintPreviewViewController *)self view];
    v39 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    uint64_t v40 = [v39 centerXAnchor];
    uint64_t v41 = [(UIPrintPreviewViewController *)self view];
    v42 = [v41 centerXAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v38 addConstraint:v43];

    id v44 = [(UIPrintPreviewViewController *)self view];
    v45 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    objc_super v46 = [v45 widthAnchor];
    v47 = [(UIPrintPreviewViewController *)self view];
    v48 = [v47 widthAnchor];
    v49 = [v46 constraintLessThanOrEqualToAnchor:v48];
    [v44 addConstraint:v49];

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
}

void __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutPopupButtonChanged:0];
}

void __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutPopupButtonChanged:1];
}

- (void)updateLayoutControl
{
  v40[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIPrintPreviewViewController *)self printInfo];
  v4 = [v3 pageRanges];
  uint64_t v5 = [v4 count];

  id v6 = [(UIPrintPreviewViewController *)self printInfo];
  double v7 = [v6 pageRanges];
  double v8 = v7;
  if (v5 == 1)
  {
    id v9 = [v7 objectAtIndex:0];
    [v9 rangeValue];
    uint64_t v11 = v10;

    id v6 = [(UIPrintPreviewViewController *)self printInfo];
    BOOL v12 = v11 != [v6 pageCount];
  }
  else
  {
    BOOL v12 = (unint64_t)[v7 count] > 1;
  }
  v13 = [(UIPrintPreviewViewController *)self printInfo];
  char v14 = [v13 nUpActive];

  if (v14) {
    int v15 = 1;
  }
  else {
    int v15 = [(UIPrintPreviewViewController *)self showPageRange] && v12;
  }
  v16 = [(UIPrintPreviewViewController *)self layoutPopupButton];
  [v16 setHidden:v15 ^ 1u];

  if (v15)
  {
    uint64_t v17 = [(UIPrintPreviewViewController *)self showingPageView];
    v18 = [(UIPrintPreviewViewController *)self pagesPopupAction];
    [v18 setState:v17];

    uint64_t v19 = [(UIPrintPreviewViewController *)self showingPageView] ^ 1;
    v20 = [(UIPrintPreviewViewController *)self sheetsPopupAction];
    [v20 setState:v19];

    v21 = (void *)MEMORY[0x1E4FB1970];
    v22 = [(UIPrintPreviewViewController *)self pagesPopupAction];
    v40[0] = v22;
    v23 = [(UIPrintPreviewViewController *)self sheetsPopupAction];
    v40[1] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v25 = [v21 menuWithTitle:&stru_1F3C9D3F8 children:v24];
    v26 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v26 setMenu:v25];
  }
  else
  {
    [(UIPrintPreviewViewController *)self setPreviewLayoutType:0];
  }
  if ([(UIPrintPreviewViewController *)self previewScrollDirection] == 1)
  {
    uint64_t v27 = [(UIPrintPreviewViewController *)self layoutPopupButtonTopConstraint];
    [v27 setConstant:8.0];
  }
  else
  {
    id v28 = [(UIPrintPreviewViewController *)self collectionView];
    uint64_t v27 = [v28 collectionViewLayout];

    double v29 = 0.0;
    if ((v15 & 1) == 0)
    {
      [(UIPrintPreviewViewController *)self headerHeight];
      double v29 = v30;
    }
    objc_msgSend(v27, "setHeaderReferenceSize:", 16.0, v29);
    [(UIPrintPreviewViewController *)self headerHeight];
    double v32 = v31;
    double v33 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    [v33 frame];
    double v35 = (v32 - v34) * 0.5;
    v36 = [(UIPrintPreviewViewController *)self layoutPopupButtonTopConstraint];
    [v36 setConstant:v35];
  }
  double v37 = 0.0;
  if (v15)
  {
    [(UIPrintPreviewViewController *)self headerHeight];
    double v37 = v38;
  }
  v39 = [(UIPrintPreviewViewController *)self collectionViewTopConstraint];
  [v39 setConstant:v37];
}

- (void)layoutPopupButtonChanged:(int64_t)a3
{
  if ([(UIPrintPreviewViewController *)self previewLayoutType] != a3)
  {
    [(UIPrintPreviewViewController *)self setPreviewLayoutType:a3];
    [(UIPrintPreviewViewController *)self resetPrintPreview];
  }
}

- (void)resetAllPages
{
  objc_super v3 = [(UIPrintPreviewViewController *)self thumbnailOperationsQueue];
  [v3 cancelAllOperations];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__UIPrintPreviewViewController_resetAllPages__block_invoke;
  v15[3] = &unk_1E6DA1788;
  objc_copyWeak(&v16, &location);
  v4 = (void *)MEMORY[0x1E4E4C3C0](v15);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __45__UIPrintPreviewViewController_resetAllPages__block_invoke_2;
  BOOL v12 = &unk_1E6DA17B0;
  objc_copyWeak(&v14, &location);
  v13 = self;
  uint64_t v5 = (void *)MEMORY[0x1E4E4C3C0](&v9);
  id v6 = [(UIPrintPreviewViewController *)self printInteractionController];
  int v7 = [v6 usingWebKitFormatter];

  if (v7)
  {
    [(UIPrintPreviewViewController *)self setShowWebKitGeneratingPreviewProgress:1];
    [(UIPrintPreviewViewController *)self performSelector:sel_showWebkitGeneratingPreviewProgress withObject:0];
    double v8 = [(UIPrintPreviewViewController *)self printSheetController];
    [v8 generateWebKitThumbnailsWithCompletionBlock:v5];
  }
  else
  {
    [(UIPrintPreviewViewController *)self performThumbnailDispatchBlock:v4];
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained printPanelViewController];
  v2 = [v1 printInteractionController];
  [v2 _updatePageCount];

  objc_super v3 = [WeakRetained printSheetController];
  [v3 clearPagesCache];

  [WeakRetained resetPrintPreview];
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [*(id *)(a1 + 32) setShowWebKitGeneratingPreviewProgress:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__UIPrintPreviewViewController_resetAllPages__block_invoke_3;
    block[3] = &unk_1E6DA1408;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    [WeakRetained resetPrintPreview];
  }
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) webKitGeneratingPreviewProgressView];
  char v3 = [v2 isHidden];

  if ((v3 & 1) == 0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    [*(id *)(a1 + 32) progressPresentationTime];
    double v7 = v5 - v6;
    double v8 = *(void **)(a1 + 32);
    if (v7 >= 1.0)
    {
      [v8 hideWebkitGeneratingPreviewProgress];
    }
    else
    {
      double v9 = 1.0 - v7;
      [v8 performSelector:sel_hideWebkitGeneratingPreviewProgress withObject:0 afterDelay:v9];
    }
  }
}

- (void)resetPrintPreview
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__UIPrintPreviewViewController_resetPrintPreview__block_invoke;
  v2[3] = &unk_1E6DA1788;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__UIPrintPreviewViewController_resetPrintPreview__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained cachedThumbnailImages];
  objc_sync_enter(v1);
  v2 = [WeakRetained cachedThumbnailImages];
  [v2 removeAllObjects];

  objc_sync_exit(v1);
  id v3 = [WeakRetained printSheetController];
  objc_msgSend(WeakRetained, "setNumberOfSheets:", objc_msgSend(v3, "numberOfSheets:", objc_msgSend(WeakRetained, "showingPageView")));

  [WeakRetained updatePreviewSize];
  [WeakRetained updateHeaderFooters];
  double v4 = [WeakRetained view];
  [v4 setNeedsLayout];

  double v5 = [WeakRetained collectionView];
  [v5 reloadData];
}

- (void)setScrollDirection:(int64_t)a3
{
  -[UIPrintPreviewViewController setPreviewScrollDirection:](self, "setPreviewScrollDirection:");
  double v5 = [(UIPrintPreviewViewController *)self collectionView];
  id v13 = [v5 collectionViewLayout];

  BOOL v6 = [v13 scrollDirection] == a3;
  double v7 = v13;
  if (!v6)
  {
    [v13 setScrollDirection:a3];
    double v8 = [(UIPrintPreviewViewController *)self collectionView];
    double v9 = v8;
    if (a3 == 1)
    {
      [v8 setShowsHorizontalScrollIndicator:1];

      uint64_t v10 = [(UIPrintPreviewViewController *)self collectionView];
      uint64_t v11 = v10;
      uint64_t v12 = 0;
    }
    else
    {
      [v8 setShowsHorizontalScrollIndicator:0];

      uint64_t v10 = [(UIPrintPreviewViewController *)self collectionView];
      uint64_t v11 = v10;
      uint64_t v12 = 1;
    }
    [v10 setShowsVerticalScrollIndicator:v12];

    double v7 = v13;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UIPrintPreviewViewController;
  -[UIPrintPreviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(UIPrintPreviewViewController *)self resetPrintPreview];
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "preferredContentSizeCategory", a3);
  BOOL v6 = [(UIPrintPreviewViewController *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    [(UIPrintPreviewViewController *)self resetPrintPreview];
  }
}

- (CGSize)maxThumbnailSize
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  int64_t v5 = [(UIPrintPreviewViewController *)self previewScrollDirection];
  [(UIPrintPreviewViewController *)self previewSize];
  if (v5) {
    double v6 = v3;
  }
  else {
    double v7 = v4;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)thumbnailSizeForSheetNum:(int64_t)a3
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v7 = [(UIPrintPreviewViewController *)self printSheetController];
  objc_msgSend(v7, "sizeForSheetNum:showingPageView:", a3, -[UIPrintPreviewViewController showingPageView](self, "showingPageView"));
  double v9 = v8;
  double v11 = v10;

  [(UIPrintPreviewViewController *)self maxThumbnailSize];
  if (v11 > 0.0 && v9 > 0.0)
  {
    double v14 = v9 / v11;
    if (v12 == 0.0)
    {
      double v5 = v14 * v13;
      double v6 = v13;
    }
    else
    {
      double v5 = v12;
      double v6 = v12 / v14;
    }
  }
  double v15 = v5;
  double v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)headerHeight
{
  if ([(UIPrintPreviewViewController *)self previewScrollDirection] == 1)
  {
    double v3 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    double v4 = 0.0;
    if (([v3 isHidden] & 1) == 0)
    {
      double v5 = [(UIPrintPreviewViewController *)self layoutPopupButton];
      [v5 frame];
      double v4 = v6;
    }
  }
  else
  {
    double v7 = [(UIPrintPreviewViewController *)self printPanelViewController];
    uint64_t v8 = [v7 printOptionsNavController];
    double v9 = [(id)v8 navigationBar];
    [v9 frame];
    double v4 = v10;

    double v11 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    LOBYTE(v8) = [v11 isHidden];

    if ((v8 & 1) == 0)
    {
      double v12 = [(UIPrintPreviewViewController *)self layoutPopupButton];
      [v12 frame];
      double v14 = v13;

      if (v4 < v14) {
        return v14;
      }
    }
  }
  return v4;
}

- (void)updateHeaderFooters
{
  [(UIPrintPreviewViewController *)self updateLayoutControl];
  double v3 = (double *)MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(UIPrintPreviewViewController *)self previewScrollDirection])
  {
    [(UIPrintPreviewViewController *)self previewSize];
    double v6 = v5;
    [(UIPrintPreviewViewController *)self thumbnailSizeForSheetNum:1];
    double v8 = (v6 - v7) * 0.5;
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    [(UIPrintPreviewViewController *)self thumbnailSizeForSheetNum:[(UIPrintPreviewViewController *)self numberOfSheets]];
    double v11 = (v6 - v10) * 0.5;
    if (v11 >= 0.0) {
      double v12 = v11;
    }
    else {
      double v12 = 0.0;
    }
    double v13 = v4;
  }
  else
  {
    double v14 = [(UIPrintPreviewViewController *)self layoutPopupButton];
    double v13 = 0.0;
    if ([v14 isHidden])
    {
      [(UIPrintPreviewViewController *)self headerHeight];
      double v13 = v15;
    }
    double v12 = *v3;

    double v9 = v12;
  }
  double v16 = [(UIPrintPreviewViewController *)self collectionView];
  id v17 = [v16 collectionViewLayout];

  objc_msgSend(v17, "setHeaderReferenceSize:", v9, v13);
  objc_msgSend(v17, "setFooterReferenceSize:", v12, v4);
}

- (void)updatePreviewSize
{
  int64_t v3 = [(UIPrintPreviewViewController *)self previewScrollDirection];
  double v4 = [(UIPrintPreviewViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  if (v3 == 1)
  {
    double v6 = v5 + -16.0;
    double v7 = [(UIPrintPreviewViewController *)self collectionView];
    [v7 bounds];
    double v9 = v8 + -32.0;
  }
  else
  {
    double v7 = [(UIPrintPreviewViewController *)self collectionView];
    [v7 bounds];
    double v9 = v10 + -16.0 + -48.0;
  }

  double v11 = v6 + -32.0;
  [(UIPrintPreviewViewController *)self previewSize];
  if (vabdd_f64(v12, v11) > 3.0
    || ([(UIPrintPreviewViewController *)self previewSize], vabdd_f64(v13, v9) > 3.0))
  {
    -[UIPrintPreviewViewController setPreviewSize:](self, "setPreviewSize:", v11, v9);
    [(UIPrintPreviewViewController *)self resetPrintPreview];
  }
}

- (void)updatePageRange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = [(UIPrintPreviewViewController *)self printSheetController];
  [v4 updateSelectionPageMap];

  double v5 = [(UIPrintPreviewViewController *)self view];
  [v5 setNeedsUpdateConstraints];

  if ([(UIPrintPreviewViewController *)self showingPageView])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = [(UIPrintPreviewViewController *)self collectionView];
    double v7 = [v6 preparedCells];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setInRange:animated:", -[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "pageIndex")), 1);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(UIPrintPreviewViewController *)self resetPrintPreview];
  }
}

- (BOOL)showingPageView
{
  return [(UIPrintPreviewViewController *)self previewLayoutType] == 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 item];
  uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"UIPrintPreviewPageCell" forIndexPath:v7];
  [v9 setPrintPreviewDelegate:self];
  uint64_t v10 = [(UIPrintPreviewViewController *)self cachedThumbnailImages];
  objc_sync_enter(v10);
  double v11 = [(UIPrintPreviewViewController *)self cachedThumbnailImages];
  long long v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v7, "item"));
  long long v13 = [v11 objectForKey:v12];

  objc_sync_exit(v10);
  int64_t v14 = [(UIPrintPreviewViewController *)self numberOfSheets];
  LODWORD(v11) = [(UIPrintPreviewViewController *)self showPageRange];
  uint64_t v15 = [(UIPrintPreviewViewController *)self showingPageView] & v11;
  [v9 addPageLabelAndImageView:v15];
  BOOL v16 = (v15 & 1) == 0
     || -[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", [v7 row]);
  [v9 setInRange:v16 animated:0];
  [(UIPrintPreviewViewController *)self thumbnailSizeForSheetNum:v8 + 1];
  objc_msgSend(v9, "setThumbnailSize:");
  [v9 setThumbnailImage:v13];
  [v9 setPageCount:v14];
  [v9 setPageIndex:v8];
  if (!v13)
  {
    uint64_t v17 = [(UIPrintPreviewViewController *)self thumnailImageCompletionHandler];
    [(UIPrintPreviewViewController *)self fetchThumnailImageInBackground:v8 previewPageCell:v9 completion:v17];
  }
  return v9;
}

- (void)fetchThumnailImageInBackground:(int64_t)a3 previewPageCell:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke;
  v13[3] = &unk_1E6DA1C60;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  id v10 = v9;
  id v15 = v10;
  id v11 = v8;
  id v14 = v11;
  long long v12 = (void *)MEMORY[0x1E4E4C3C0](v13);
  [(UIPrintPreviewViewController *)self performThumbnailDispatchBlock:v12];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int64_t v3 = [WeakRetained printSheetController];
  double v4 = objc_msgSend(v3, "imageForSheetNum:showingPageView:", *(void *)(a1 + 56) + 1, objc_msgSend(WeakRetained, "showingPageView"));

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, void, BOOL))(v5 + 16))(v5, v4, *(void *)(a1 + 56), *(void *)(a1 + 32) == 0);
  }
  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke_2;
    v6[3] = &unk_1E6DA14F0;
    id v7 = *(id *)(a1 + 32);
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setThumbnailImage:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        id v11 = [(UIPrintPreviewViewController *)self cachedThumbnailImages];
        long long v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v10, "item"));
        long long v13 = [v11 objectForKey:v12];

        if (!v13)
        {
          uint64_t v14 = [v10 item];
          id v15 = [(UIPrintPreviewViewController *)self thumnailImageCompletionHandler];
          [(UIPrintPreviewViewController *)self fetchThumnailImageInBackground:v14 previewPageCell:0 completion:v15];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = objc_msgSend(a5, "item", a3, a4) + 1;
  [(UIPrintPreviewViewController *)self thumbnailSizeForSheetNum:v6];
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 16.0;
  double v6 = 16.0;
  double v7 = 16.0;
  double v8 = 16.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)showPageRange
{
  v2 = [(UIPrintPreviewViewController *)self printPanelViewController];
  char v3 = [v2 shouldShowPageRange];

  return v3;
}

- (BOOL)canModifyPageRange
{
  return 1;
}

- (void)pageBadgeTapped:(int64_t)a3
{
  if ([(UIPrintPreviewViewController *)self canRemovePage:self forPageIndex:a3])
  {
    [(UIPrintPreviewViewController *)self removePage:self forPageIndex:a3];
  }
  else if ([(UIPrintPreviewViewController *)self canAddPage:self forPageIndex:a3])
  {
    [(UIPrintPreviewViewController *)self addPage:self forPageIndex:a3];
  }
}

- (BOOL)pageIndexIsInRange:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [(UIPrintPreviewViewController *)self printInfo];
  double v5 = [v4 pageRanges];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) rangeValue];
        if (a3 >= v10 && a3 - v10 < v11)
        {
          BOOL v13 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)canSetStartPage:(id)a3 forPageIndex:(int64_t)a4
{
  BOOL v6 = [(UIPrintPreviewViewController *)self showPageRange];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v8 = [v7 pageRanges];
  if (!v8)
  {

    goto LABEL_12;
  }
  uint64_t v9 = (void *)v8;
  unint64_t v10 = [(UIPrintPreviewViewController *)self printInfo];
  unint64_t v11 = [v10 pageRanges];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
LABEL_12:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v13 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v14 = [v13 pageRanges];
  long long v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 rangeValue];
  uint64_t v18 = v17;

  long long v19 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v20 = [v19 pageRanges];
  uint64_t v21 = [v20 count];

  LOBYTE(v6) = v21 == 1 && v16 != a4 && v16 + v18 > (unint64_t)a4;
  return v6;
}

- (void)setStartPage:(id)a3 forPageIndex:(int64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v7 = [v6 pageRanges];

  if (!v7 || ![v7 count])
  {
    long long v15 = (void *)MEMORY[0x1E4F29238];
    BOOL v13 = [(UIPrintPreviewViewController *)self printInfo];
    uint64_t v14 = objc_msgSend(v15, "valueWithRange:", a4, objc_msgSend(v13, "pageCount"));
    v19[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v17 = [(UIPrintPreviewViewController *)self printInfo];
    [v17 setPageRanges:v16];

    goto LABEL_6;
  }
  if ([v7 count] == 1)
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 rangeValue];
    uint64_t v11 = v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, v11 - a4 + v9);
    uint64_t v18 = v12;
    BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

    [(UIPrintPreviewViewController *)self updatePageRange:v13];
    uint64_t v14 = [(UIPrintPreviewViewController *)self printInfo];
    [v14 setPageRanges:v13];
LABEL_6:
  }
}

- (BOOL)canSetEndPage:(id)a3 forPageIndex:(int64_t)a4
{
  if ([(UIPrintPreviewViewController *)self showPageRange])
  {
    BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
    uint64_t v7 = [v6 pageRanges];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(UIPrintPreviewViewController *)self printInfo];
      uint64_t v10 = [v9 pageRanges];
      uint64_t v11 = [v10 count];

      if (!v11) {
        return 1;
      }
      uint64_t v12 = [(UIPrintPreviewViewController *)self printInfo];
      BOOL v13 = [v12 pageRanges];
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      unint64_t v15 = [v14 rangeValue];
      uint64_t v17 = v16;

      uint64_t v18 = [(UIPrintPreviewViewController *)self printInfo];
      long long v19 = [v18 pageRanges];
      uint64_t v20 = [v19 count];

      if (v20 != 1 || v15 > a4 || v17 + v15 - 1 == a4) {
        return 0;
      }
      BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
      BOOL v21 = [v6 pageCount] - 1 > a4;
    }
    else
    {
      BOOL v21 = 1;
    }

    return v21;
  }
  return 0;
}

- (void)setEndPage:(id)a3 forPageIndex:(int64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v7 = [v6 pageRanges];

  if (!v7 || ![v7 count])
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, a4);
    v15[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    BOOL v13 = [(UIPrintPreviewViewController *)self printInfo];
    [v13 setPageRanges:v12];

    goto LABEL_6;
  }
  if ([v7 count] == 1)
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 rangeValue];

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, a4 - v9 + 1);
    uint64_t v14 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];

    [(UIPrintPreviewViewController *)self updatePageRange:v11];
    uint64_t v12 = [(UIPrintPreviewViewController *)self printInfo];
    [v12 setPageRanges:v11];
LABEL_6:
  }
}

- (BOOL)canAddPage:(id)a3 forPageIndex:(int64_t)a4
{
  BOOL v6 = [(UIPrintPreviewViewController *)self showPageRange];
  if (v6) {
    LOBYTE(v6) = ![(UIPrintPreviewViewController *)self pageIndexIsInRange:a4];
  }
  return v6;
}

- (void)addPage:(id)a3 forPageIndex:(int64_t)a4
{
  double v5 = self;
  v34[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v7 = [v6 pageRanges];

  if (!v7 || ![v7 count])
  {
    id v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, 1);
    v34[0] = v28;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    double v30 = [(UIPrintPreviewViewController *)v5 printInfo];
    [v30 setPageRanges:v29];

    goto LABEL_21;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if (![v7 count]) {
    goto LABEL_18;
  }
  double v31 = v5;
  int64_t range2 = a4;
  char v9 = 0;
  unint64_t v10 = 0;
  range2_8 = v8;
  do
  {
    uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
    NSUInteger v12 = [v11 rangeValue];
    NSUInteger v14 = v13;

    v35.id location = v12;
    v35.length = v14;
    v38.id location = a4;
    v38.length = 1;
    NSRange v15 = NSUnionRange(v35, v38);
    if (v15.length == v14 + 1 && (v9 & 1) == 0)
    {
      if ([v7 count] <= v10 + 1) {
        goto LABEL_12;
      }
      uint64_t v16 = [v7 objectAtIndexedSubscript:v10 + 1];
      NSUInteger v17 = [v16 rangeValue];
      NSUInteger v19 = v18;

      v36.id location = v17;
      v36.length = v19;
      v39.id location = range2;
      v39.length = 1;
      if (NSUnionRange(v36, v39).length == v19 + 1)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F29238];
        v37.id location = v12;
        v37.length = v14;
        v40.id location = v17;
        v40.length = v19;
        NSRange v21 = NSUnionRange(v37, v40);
        v22 = objc_msgSend(v20, "valueWithRange:", v21.location, v21.length);
        char v9 = 1;
        ++v10;
      }
      else
      {
LABEL_12:
        v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v15.location, v15.length);
        char v9 = 1;
      }
      a4 = range2;
      goto LABEL_14;
    }
    v23 = [v7 objectAtIndexedSubscript:v10];
    char v24 = ([v23 rangeValue] <= (unint64_t)a4) | v9;

    if (v24)
    {
      v22 = [v7 objectAtIndexedSubscript:v10];
LABEL_14:
      uint64_t v8 = range2_8;
      goto LABEL_16;
    }
    v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, 1);
    uint64_t v8 = range2_8;
    [range2_8 addObject:v25];

    v22 = [v7 objectAtIndexedSubscript:v10];
    char v9 = 1;
LABEL_16:
    [v8 addObject:v22];

    ++v10;
  }
  while (v10 < [v7 count]);
  double v5 = v31;
  if ((v9 & 1) == 0)
  {
LABEL_18:
    v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, 1);
    [v8 addObject:v26];
  }
  [(UIPrintPreviewViewController *)v5 updatePageRange:v8];
  uint64_t v27 = [(UIPrintPreviewViewController *)v5 printInfo];
  [v27 setPageRanges:v8];

LABEL_21:
}

- (BOOL)canRemovePage:(id)a3 forPageIndex:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIPrintPreviewViewController *)self showPageRange];
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(UIPrintPreviewViewController *)self printInfo];
    uint64_t v8 = [v7 pageRanges];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) rangeValue];
          v10 += v13;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
      uint64_t v9 = v10 > 1;
    }

    LOBYTE(v6) = [(UIPrintPreviewViewController *)self pageIndexIsInRange:a4] & v9;
  }
  return v6;
}

- (void)removePage:(id)a3 forPageIndex:(int64_t)a4
{
  double v5 = self;
  BOOL v6 = [(UIPrintPreviewViewController *)self printInfo];
  NSRange v35 = [v6 pageRanges];

  if (v35 && [v35 count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    unint64_t v8 = 0;
    if ([v35 count])
    {
      uint64_t v9 = v35;
      while (1)
      {
        unint64_t v10 = [v9 objectAtIndexedSubscript:v8];
        NSUInteger v11 = [v10 rangeValue];
        NSUInteger v13 = v12;

        if (a4 >= v11 && a4 - v11 < v13) {
          break;
        }
        ++v8;
        unint64_t v14 = [v35 count];
        uint64_t v9 = v35;
        if (v8 >= v14) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      NSUInteger v13 = 0;
      NSUInteger v11 = 0;
    }
    uint64_t v9 = v35;
LABEL_11:
    if ([v9 count])
    {
      unint64_t v15 = 0;
      NSUInteger v16 = v13 - 1;
      NSUInteger v17 = v13 - 1 + v11;
      NSUInteger v34 = v13 - 1;
      int64_t v33 = ~a4;
      do
      {
        if (v8 == v15 && v13 == 1) {
          goto LABEL_25;
        }
        if (v8 == v15 && v11 == a4)
        {
          long long v18 = (void *)MEMORY[0x1E4F29238];
          NSUInteger location = a4 + 1;
        }
        else
        {
          if (v8 != v15)
          {
            uint64_t v21 = [v35 objectAtIndexedSubscript:v15];
            goto LABEL_24;
          }
          if (v17 != a4)
          {
            v23 = [(UIPrintPreviewViewController *)v5 printInfo];
            NSUInteger v24 = v17;
            v25 = v5;
            uint64_t v26 = [v23 pageCount];

            uint64_t v27 = (void *)MEMORY[0x1E4F29238];
            v37.NSUInteger location = v11;
            v37.NSUInteger length = v13;
            v39.NSUInteger location = 0;
            v39.NSUInteger length = a4;
            NSRange v28 = NSIntersectionRange(v37, v39);
            double v29 = objc_msgSend(v27, "valueWithRange:", v28.location, v28.length);
            [v7 addObject:v29];

            double v30 = (void *)MEMORY[0x1E4F29238];
            v40.NSUInteger length = v26 + v33;
            double v5 = v25;
            NSUInteger v17 = v24;
            NSUInteger v16 = v34;
            v40.NSUInteger location = a4 + 1;
            v38.NSUInteger location = v11;
            v38.NSUInteger length = v13;
            NSRange v31 = NSIntersectionRange(v38, v40);
            NSUInteger location = v31.location;
            long long v18 = v30;
            NSUInteger length = v31.length;
            goto LABEL_19;
          }
          long long v18 = (void *)MEMORY[0x1E4F29238];
          NSUInteger location = v11;
        }
        NSUInteger length = v16;
LABEL_19:
        uint64_t v21 = objc_msgSend(v18, "valueWithRange:", location, length, v33, v34);
LABEL_24:
        v22 = (void *)v21;
        objc_msgSend(v7, "addObject:", v21, v33, v34);

LABEL_25:
        ++v15;
      }
      while (v15 < objc_msgSend(v35, "count", v33, v34));
    }
    [(UIPrintPreviewViewController *)v5 updatePageRange:v7];
    double v32 = [(UIPrintPreviewViewController *)v5 printInfo];
    [v32 setPageRanges:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)canAddAllPages:(id)a3
{
  BOOL v4 = [(UIPrintPreviewViewController *)self showPageRange];
  if (v4)
  {
    double v5 = [(UIPrintPreviewViewController *)self printInfo];
    uint64_t v6 = [v5 pageCount];

    if (v6 < 1)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      uint64_t v7 = 0;
      char v8 = 0;
      do
      {
        if (![(UIPrintPreviewViewController *)self pageIndexIsInRange:v7]) {
          char v8 = 1;
        }
        ++v7;
        uint64_t v9 = [(UIPrintPreviewViewController *)self printInfo];
        uint64_t v10 = [v9 pageCount];
      }
      while (v10 > v7);
      LOBYTE(v4) = v8;
    }
  }
  return v4;
}

- (void)addAllPages:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F29238];
  double v5 = [(UIPrintPreviewViewController *)self printInfo];
  uint64_t v6 = objc_msgSend(v4, "valueWithRange:", 0, objc_msgSend(v5, "pageCount"));
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [(UIPrintPreviewViewController *)self updatePageRange:v7];
  char v8 = [(UIPrintPreviewViewController *)self printInfo];
  [v8 setPageRanges:v7];
}

- (void)gotoFirstPage:(id)a3
{
  id v6 = [(UIPrintPreviewViewController *)self collectionView];
  BOOL v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  if ([(UIPrintPreviewViewController *)self previewScrollDirection]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 scrollToItemAtIndexPath:v4 atScrollPosition:v5 animated:1];
}

- (void)gotoLastPage:(id)a3
{
  id v6 = [(UIPrintPreviewViewController *)self collectionView];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[UIPrintPreviewViewController numberOfSheets](self, "numberOfSheets") - 1, 0);
  if ([(UIPrintPreviewViewController *)self previewScrollDirection]) {
    uint64_t v5 = 32;
  }
  else {
    uint64_t v5 = 4;
  }
  [v6 scrollToItemAtIndexPath:v4 atScrollPosition:v5 animated:1];
}

- (BOOL)canShowMenuBar
{
  char v3 = [(UIPrintPreviewViewController *)self navigationController];

  if (!v3) {
    return 1;
  }
  BOOL v4 = [(UIPrintPreviewViewController *)self view];
  uint64_t v5 = [(UIPrintPreviewViewController *)self navigationController];
  id v6 = [v5 topViewController];
  uint64_t v7 = [v6 view];
  char v8 = [v4 isDescendantOfView:v7];

  return v8;
}

- (id)printPagePreviewViewControllerForItemAtPageIndex:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4FB1978] sharedMenuController];
  [v5 hideMenu];

  id v6 = [(UIPrintPreviewViewController *)self longPressImageViewController];

  if (!v6)
  {
    uint64_t v7 = [(UIPrintPreviewViewController *)self cachedThumbnailImages];
    char v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    uint64_t v9 = [v7 objectForKey:v8];

    id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
    [v9 size];
    double v12 = v11;
    [v9 size];
    unint64_t v14 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v12, v13);
    [v14 setContentMode:2];
    [v14 setImage:v9];
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    [(UIPrintPreviewViewController *)self setLongPressImageViewController:v15];

    NSUInteger v16 = [(UIPrintPreviewViewController *)self longPressImageViewController];
    [v16 setView:v14];

    [v9 size];
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = [(UIPrintPreviewViewController *)self longPressImageViewController];
    objc_msgSend(v21, "setPreferredContentSize:", v18, v20);
  }
  return [(UIPrintPreviewViewController *)self longPressImageViewController];
}

- (id)printPagePreviewActionItemsWithPageIndex:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(location, self);
  if (![(UIPrintPreviewViewController *)self showingPageView])
  {
    NSRange v35 = (void *)MEMORY[0x1E4FB13F0];
    NSRange v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    NSRange v37 = [v36 localizedStringForKey:@"Go to First Page" value:@"Go to First Page" table:@"Localizable"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_6;
    v46[3] = &unk_1E6DA1CB0;
    int64_t v33 = &v47;
    objc_copyWeak(&v47, location);
    v46[4] = self;
    NSRange v38 = [v35 actionWithTitle:v37 image:0 identifier:0 handler:v46];
    [v5 addObject:v38];

    NSRange v39 = (void *)MEMORY[0x1E4FB13F0];
    NSRange v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v41 = [v40 localizedStringForKey:@"Go to Last Page" value:@"Go to Last Page" table:@"Localizable"];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_7;
    v44[3] = &unk_1E6DA1CB0;
    objc_copyWeak(&v45, location);
    v44[4] = self;
    v42 = [v39 actionWithTitle:v41 image:0 identifier:0 handler:v44];
    [v5 addObject:v42];

    objc_destroyWeak(&v45);
    goto LABEL_13;
  }
  if ([(UIPrintPreviewViewController *)self canSetStartPage:self forPageIndex:a3])
  {
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v7 = NSString;
    char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"Start at Page %ld" value:@"Start at Page %ld" table:@"Localizable"];
    id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, a3 + 1);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke;
    v56[3] = &unk_1E6DA1C88;
    objc_copyWeak(v57, location);
    v57[1] = (id)a3;
    double v11 = [v6 actionWithTitle:v10 image:0 identifier:0 handler:v56];
    [v5 addObject:v11];

    objc_destroyWeak(v57);
  }
  if ([(UIPrintPreviewViewController *)self canSetEndPage:self forPageIndex:a3])
  {
    double v12 = (void *)MEMORY[0x1E4FB13F0];
    double v13 = NSString;
    unint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"Stop after Page %ld" value:@"Stop after Page %ld" table:@"Localizable"];
    NSUInteger v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, a3 + 1);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_2;
    v54[3] = &unk_1E6DA1C88;
    objc_copyWeak(v55, location);
    v55[1] = (id)a3;
    double v17 = [v12 actionWithTitle:v16 image:0 identifier:0 handler:v54];
    [v5 addObject:v17];

    objc_destroyWeak(v55);
  }
  if ([(UIPrintPreviewViewController *)self canAddPage:self forPageIndex:a3])
  {
    double v18 = (void *)MEMORY[0x1E4FB13F0];
    double v19 = NSString;
    double v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"Add Page %ld" value:@"Add Page %ld" table:@"Localizable"];
    v22 = objc_msgSend(v19, "localizedStringWithFormat:", v21, a3 + 1);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_3;
    v52[3] = &unk_1E6DA1C88;
    objc_copyWeak(v53, location);
    v53[1] = (id)a3;
    v23 = [v18 actionWithTitle:v22 image:0 identifier:0 handler:v52];
    [v5 addObject:v23];

    objc_destroyWeak(v53);
  }
  if ([(UIPrintPreviewViewController *)self canRemovePage:self forPageIndex:a3])
  {
    NSUInteger v24 = (void *)MEMORY[0x1E4FB13F0];
    v25 = NSString;
    uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"Skip Page %ld" value:@"Skip Page %ld" table:@"Localizable"];
    NSRange v28 = objc_msgSend(v25, "localizedStringWithFormat:", v27, a3 + 1);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_4;
    v50[3] = &unk_1E6DA1C88;
    objc_copyWeak(v51, location);
    v51[1] = (id)a3;
    double v29 = [v24 actionWithTitle:v28 image:0 identifier:0 handler:v50];
    [v5 addObject:v29];

    objc_destroyWeak(v51);
  }
  if ([(UIPrintPreviewViewController *)self canAddAllPages:self])
  {
    double v30 = (void *)MEMORY[0x1E4FB13F0];
    NSRange v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v32 = [v31 localizedStringForKey:@"Print All Pages" value:@"Print All Pages" table:@"Localizable"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_5;
    v48[3] = &unk_1E6DA1CB0;
    int64_t v33 = &v49;
    objc_copyWeak(&v49, location);
    v48[4] = self;
    NSUInteger v34 = [v30 actionWithTitle:v32 image:0 identifier:0 handler:v48];
    [v5 addObject:v34];

LABEL_13:
    objc_destroyWeak(v33);
  }
  objc_destroyWeak(location);
  return v5;
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStartPage:WeakRetained forPageIndex:*(void *)(a1 + 40)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEndPage:WeakRetained forPageIndex:*(void *)(a1 + 40)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained addPage:WeakRetained forPageIndex:*(void *)(a1 + 40)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removePage:WeakRetained forPageIndex:*(void *)(a1 + 40)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addAllPages:*(void *)(a1 + 32)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained gotoFirstPage:*(void *)(a1 + 32)];
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained gotoLastPage:*(void *)(a1 + 32)];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  [(UIPrintPreviewViewController *)self setLongPressImageViewController:0];
  uint64_t v9 = (void *)MEMORY[0x1E4FB1678];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
  v17[3] = &unk_1E6DA1CD8;
  objc_copyWeak(&v19, &location);
  id v10 = v8;
  id v18 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
  v14[3] = &unk_1E6DA1D00;
  objc_copyWeak(&v16, &location);
  id v11 = v10;
  id v15 = v11;
  double v12 = [v9 configurationWithIdentifier:v11 previewProvider:v17 actionProvider:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

id __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = objc_msgSend(WeakRetained, "printPagePreviewViewControllerForItemAtPageIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = (void *)MEMORY[0x1E4FB1970];
    BOOL v4 = objc_msgSend(WeakRetained, "printPagePreviewActionItemsWithPageIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
    uint64_t v5 = [v3 menuWithTitle:&stru_1F3C9D3F8 children:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = [(UIPrintPreviewViewController *)self collectionView];
  id v7 = [v5 identifier];

  id v8 = [v6 cellForItemAtIndexPath:v7];
  uint64_t v9 = [v8 thumbnailView];

  if (v9) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = [(UIPrintPreviewViewController *)self collectionView];
  id v7 = [v5 identifier];

  id v8 = [v6 cellForItemAtIndexPath:v7];
  uint64_t v9 = [v8 thumbnailView];

  if (v9) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UIPrintPreviewViewController *)self printPanelViewController];
  double v12 = [v11 printInteractionController];
  char v13 = [v12 preventPDFCreation];

  if ((v13 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__UIPrintPreviewViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v14[3] = &unk_1E6DA1788;
    objc_copyWeak(&v15, &location);
    [v10 addCompletion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __105__UIPrintPreviewViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showQuickLookFromPreviewAction];
    id WeakRetained = v2;
  }
}

- (void)showQuickLookFromPreviewAction
{
  char v3 = [(UIPrintPreviewViewController *)self printPanelViewController];
  [v3 dismissKeyboard];

  BOOL v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"Generating PDF" value:@"Generating PDF" table:@"Localizable"];
  id v7 = [v4 alertControllerWithTitle:v6 message:@"\n" preferredStyle:1];
  [(UIPrintPreviewViewController *)self setGeneratingPDFProgressController:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 startAnimating];
  id v9 = [(UIPrintPreviewViewController *)self generatingPDFProgressController];
  id v10 = [v9 view];

  [v10 addSubview:v8];
  id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:9 relatedBy:0 toItem:v10 attribute:9 multiplier:1.0 constant:0.0];
  [v10 addConstraint:v11];

  double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:-10.0];
  [v10 addConstraint:v12];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[UIPrintPreviewViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
  char v13 = [(UIPrintPreviewViewController *)self printPanelViewController];
  unint64_t v14 = [(UIPrintPreviewViewController *)self generatingPDFProgressController];
  [v13 presentViewController:v14 animated:1 completion:0];

  objc_initWeak(&location, self);
  id v15 = [(UIPrintPreviewViewController *)self printPanelViewController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke;
  v16[3] = &unk_1E6DA1D50;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  [v15 generateQuickLookPDFWithCompletionHandler:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {

    id v6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke_2;
  v10[3] = &unk_1E6DA1D28;
  uint64_t v8 = *(void *)(a1 + 32);
  v10[4] = WeakRetained;
  v10[5] = v8;
  id v11 = v6;
  char v12 = a3;
  id v9 = v6;
  dispatch_sync(MEMORY[0x1E4F14428], v10);
}

void __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) generatingPDFProgressController];

  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    [*(id *)(a1 + 40) progressPresentationTime];
    double v6 = v4 - v5;
    id v7 = *(void **)(a1 + 40);
    if (v6 >= 1.0)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      [v7 hideGeneratingPDFProgress:v10];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      double v9 = 1.0 - v6;
      [v7 performSelector:sel_hideGeneratingPDFProgress_ withObject:v8 afterDelay:v9];
    }
  }
  else if (*(void *)(a1 + 48) && !*(unsigned char *)(a1 + 56))
  {
    id v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "showQuickLookDocumentInteractionController:");
  }
}

- (void)hideGeneratingPDFProgress:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPrintPreviewViewController *)self generatingPDFProgressController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIPrintPreviewViewController_hideGeneratingPDFProgress___block_invoke;
  v7[3] = &unk_1E6DA14F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __58__UIPrintPreviewViewController_hideGeneratingPDFProgress___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setGeneratingPDFProgressController:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 showQuickLookDocumentInteractionController:v3];
}

- (void)showQuickLookDocumentInteractionController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UIPrintPreviewViewController *)self printPanelViewController];
    id v6 = [v5 createShareablePDFFileURL:v4];

    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = v4;
    }
    id v8 = [MEMORY[0x1E4F9F2F8] interactionControllerWithURL:v7];
    [(UIPrintPreviewViewController *)self setDocumentInteractionController:v8];

    double v9 = [(UIPrintPreviewViewController *)self printInfo];
    uint64_t v10 = [v9 jobName];
    uint64_t v11 = [(UIPrintPreviewViewController *)self documentInteractionController];
    [(id)v11 setName:v10];

    char v12 = [(UIPrintPreviewViewController *)self printPanelViewController];
    objc_initWeak(&location, v12);

    char v13 = [(UIPrintPreviewViewController *)self documentInteractionController];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __75__UIPrintPreviewViewController_showQuickLookDocumentInteractionController___block_invoke;
    id v19 = &unk_1E6DA1D78;
    objc_copyWeak(&v20, &location);
    [v13 _setCompletionWithItemsHandler:&v16];

    unint64_t v14 = [(UIPrintPreviewViewController *)self documentInteractionController];
    [v14 setDelegate:self];

    [(UIPrintPreviewViewController *)self setPresentingDocumentInteractionController:1];
    id v15 = [(UIPrintPreviewViewController *)self documentInteractionController];
    LOBYTE(v11) = [v15 presentPreviewAnimated:0];

    if ((v11 & 1) == 0)
    {
      NSLog(&cfstr_Uiprintpreview_0.isa);
      [(UIPrintPreviewViewController *)self setPresentingDocumentInteractionController:0];
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __75__UIPrintPreviewViewController_showQuickLookDocumentInteractionController___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v6 = _UIActivityOpenInApplicationTypeForActivityType();

  id v7 = WeakRetained;
  if (a3 && WeakRetained && !v6)
  {
    [WeakRetained cancelPrinting];
    id v7 = WeakRetained;
  }
}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
}

- (void)documentInteractionController:(id)a3 didEndSendingToApplication:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  [WeakRetained cancelPrinting];
}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  return &unk_1F3CB1BC8;
}

- (void)animateCellAndPresentDocumentInteractionController
{
  uint64_t v3 = [(UIPrintPreviewViewController *)self printPanelViewController];
  [v3 dismissKeyboard];

  id v4 = [(UIPrintPreviewViewController *)self pinchAnimationView];
  id v5 = [(UIPrintPreviewViewController *)self pinchAnimationProgressView];
  uint64_t v6 = [(UIPrintPreviewViewController *)self pinchGestureBeginningView];
  [(UIPrintPreviewViewController *)self setPinchAnimationView:0];
  [(UIPrintPreviewViewController *)self setPinchGestureBeginningView:0];
  [(UIPrintPreviewViewController *)self setPinchAnimationProgressView:0];
  objc_initWeak(&location, self);
  id v7 = [(UIPrintPreviewViewController *)self printPanelViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke;
  v15[3] = &unk_1E6DA1DC8;
  objc_copyWeak(&v19, &location);
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v17 = v9;
  id v10 = v5;
  id v18 = v10;
  [v7 generateQuickLookPDFWithCompletionHandler:v15];

  if (v10 && v9)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_3;
    v12[3] = &unk_1E6DA14F0;
    id v13 = v10;
    id v14 = v9;
    [v11 animateWithDuration:0x10000 delay:v12 options:0 animations:0.3 completion:0.0];
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke(id *a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {

    uint64_t v6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_2;
  block[3] = &unk_1E6DA1DA0;
  block[4] = WeakRetained;
  id v10 = v6;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[6];
  id v8 = v6;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

uint64_t __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) showQuickLookDocumentInteractionController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAlpha:1.0];
  [*(id *)(a1 + 56) removeFromSuperview];
  id v2 = *(void **)(a1 + 64);
  return [v2 performSelector:sel_removeFromSuperview withObject:0 afterDelay:0.200000003];
}

uint64_t __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  CGAffineTransformMakeScale(&v5, 2.0, 2.0);
  id v2 = *(void **)(a1 + 40);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 40) setAlpha:0.0];
}

- (id)createGeneratingPDFProgressView:(CGRect)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransform v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];

  [v3 setAlpha:0.0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"Generating PDF" value:@"Generating PDF" table:@"Localizable"];
  [v6 setText:v8];

  [v6 sizeToFit];
  id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v6 setTextColor:v9];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v6];
  id v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v10];

  id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v11];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v12];
  id v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v13];

  id v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:3 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:12.0];
  [v3 addConstraint:v14];

  [v12 startAnimating];
  return v3;
}

- (void)handlePinch:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1 || self->_pinchGestureBeginningView)
  {
    if ([v4 state] == 1)
    {
      id v5 = [(UIPrintPreviewViewController *)self collectionView];
      uint64_t v6 = [(UIPrintPreviewViewController *)self collectionView];
      [v4 locationInView:v6];
      id v7 = objc_msgSend(v5, "indexPathForItemAtPoint:");

      if (-[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", [v7 row]))
      {
        id v8 = [(UIPrintPreviewViewController *)self collectionView];
        id v9 = [v8 cellForItemAtIndexPath:v7];
        id v10 = [v9 thumbnailView];

        id v11 = [v10 window];
        [v11 bounds];
        id v12 = -[UIPrintPreviewViewController createGeneratingPDFProgressView:](self, "createGeneratingPDFProgressView:");
        [(UIPrintPreviewViewController *)self setPinchAnimationProgressView:v12];

        id v13 = [(UIPrintPreviewViewController *)self pinchAnimationProgressView];
        [v11 addSubview:v13];

        id v14 = [(UIPrintPreviewViewController *)self pinchAnimationProgressView];
        [v11 bringSubviewToFront:v14];

        [(UIPrintPreviewViewController *)self setPinchGestureBeginningView:v10];
        id v15 = [(UIPrintPreviewViewController *)self pinchGestureBeginningView];
        [v15 setAlpha:0.0];

        id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
        id v17 = [v10 image];
        id v18 = (void *)[v16 initWithImage:v17];
        [(UIPrintPreviewViewController *)self setPinchAnimationView:v18];

        [v10 frame];
        double v20 = v19;
        double v22 = v21;
        v23 = [v10 superview];
        [v10 frame];
        objc_msgSend(v23, "convertPoint:toView:", v11);
        double v25 = v24;
        double v27 = v26;

        NSRange v28 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        objc_msgSend(v28, "setFrame:", v25, v27, v20, v22);

        double v29 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        [v11 addSubview:v29];

        double v30 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        [v11 bringSubviewToFront:v30];

        [(UIPrintPreviewViewController *)self setPinchGestureLastScale:1.0];
        NSRange v31 = [(UIPrintPreviewViewController *)self pinchGestureBeginningView];
        [v4 locationInView:v31];
        -[UIPrintPreviewViewController setPinchGestureLastPoint:](self, "setPinchGestureLastPoint:");
      }
LABEL_6:

      goto LABEL_15;
    }
    if ([v4 state] == 3)
    {
      [v4 scale];
      if (v32 > 1.2)
      {
        [(UIPrintPreviewViewController *)self animateCellAndPresentDocumentInteractionController];
        goto LABEL_15;
      }
      int64_t v33 = (void *)MEMORY[0x1E4FB1EB0];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke;
      v75[3] = &unk_1E6DA1408;
      v75[4] = self;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_2;
      v74[3] = &unk_1E6DA1978;
      v74[4] = self;
      NSUInteger v34 = v75;
      NSRange v35 = v74;
    }
    else
    {
      if ([v4 state] != 4 && objc_msgSend(v4, "state") != 5)
      {
        [v4 velocity];
        if (v36 > 2.0 || ([v4 scale], v37 > 1.5))
        {
          [(UIPrintPreviewViewController *)self animateCellAndPresentDocumentInteractionController];
          [v4 setEnabled:0];
          [v4 setEnabled:1];
          goto LABEL_15;
        }
        [(UIPrintPreviewViewController *)self pinchGestureLastScale];
        double v39 = v38;
        [v4 scale];
        double v41 = v40;
        [v4 scale];
        -[UIPrintPreviewViewController setPinchGestureLastScale:](self, "setPinchGestureLastScale:");
        v42 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        [v4 locationInView:v42];
        double v44 = v43;
        double v46 = v45;

        [v4 scale];
        if (v47 > 1.0)
        {
          double v48 = v41 - v39 + 1.0;
          id v49 = [(UIPrintPreviewViewController *)self pinchAnimationView];
          uint64_t v50 = v49;
          if (v49) {
            [v49 transform];
          }
          else {
            memset(&v70, 0, sizeof(v70));
          }
          CGAffineTransformScale(&v71, &v70, v48, v48);
          uint64_t v51 = [(UIPrintPreviewViewController *)self pinchAnimationView];
          CGAffineTransform v69 = v71;
          [v51 setTransform:&v69];

          [v4 scale];
          double v53 = 1.0 / v52;
          id v54 = [(UIPrintPreviewViewController *)self pinchAnimationView];
          [v54 setAlpha:v53];

          [v4 scale];
          double v56 = v55;
          [v4 scale];
          double v58 = 1.0 - 1.0 / (v56 * v57);
          v59 = [(UIPrintPreviewViewController *)self pinchAnimationProgressView];
          [v59 setAlpha:v58];
        }
        v60 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        v61 = v60;
        if (v60) {
          [v60 transform];
        }
        else {
          memset(&v67, 0, sizeof(v67));
        }
        [(UIPrintPreviewViewController *)self pinchGestureLastPoint];
        CGFloat v63 = v44 - v62;
        [(UIPrintPreviewViewController *)self pinchGestureLastPoint];
        CGAffineTransformTranslate(&v68, &v67, v63, v46 - v64);
        v65 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        CGAffineTransform v66 = v68;
        [v65 setTransform:&v66];

        id v7 = [(UIPrintPreviewViewController *)self pinchAnimationView];
        [v4 locationInView:v7];
        -[UIPrintPreviewViewController setPinchGestureLastPoint:](self, "setPinchGestureLastPoint:");
        goto LABEL_6;
      }
      int64_t v33 = (void *)MEMORY[0x1E4FB1EB0];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_3;
      v73[3] = &unk_1E6DA1408;
      v73[4] = self;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_4;
      v72[3] = &unk_1E6DA1978;
      v72[4] = self;
      NSUInteger v34 = v73;
      NSRange v35 = v72;
    }
    [v33 animateWithDuration:0x20000 delay:v34 options:v35 animations:0.2 completion:0.0];
  }
LABEL_15:
}

void __44__UIPrintPreviewViewController_handlePinch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pinchAnimationView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  id v7 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  id v8 = [v7 superview];
  id v9 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  id v14 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  id v15 = [v14 window];
  objc_msgSend(v8, "convertPoint:toView:", v15, v11, v13);
  double v17 = v16;
  double v19 = v18;

  double v20 = [*(id *)(a1 + 32) pinchAnimationView];
  objc_msgSend(v20, "setFrame:", v17, v19, v4, v6);

  double v21 = [*(id *)(a1 + 32) pinchAnimationView];
  [v21 setAlpha:1.0];

  id v22 = [*(id *)(a1 + 32) pinchAnimationProgressView];
  [v22 setAlpha:0.0];
}

uint64_t __44__UIPrintPreviewViewController_handlePinch___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  [v2 setAlpha:1.0];

  double v3 = [*(id *)(a1 + 32) pinchAnimationProgressView];
  [v3 removeFromSuperview];

  double v4 = [*(id *)(a1 + 32) pinchAnimationView];
  [v4 removeFromSuperview];

  [*(id *)(a1 + 32) setPinchAnimationProgressView:0];
  [*(id *)(a1 + 32) setPinchAnimationView:0];
  double v5 = *(void **)(a1 + 32);
  return [v5 setPinchGestureBeginningView:0];
}

void __44__UIPrintPreviewViewController_handlePinch___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pinchAnimationView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  id v7 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  id v8 = [v7 superview];
  id v9 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  id v14 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  id v15 = [v14 window];
  objc_msgSend(v8, "convertPoint:toView:", v15, v11, v13);
  double v17 = v16;
  double v19 = v18;

  double v20 = [*(id *)(a1 + 32) pinchAnimationView];
  objc_msgSend(v20, "setFrame:", v17, v19, v4, v6);

  double v21 = [*(id *)(a1 + 32) pinchAnimationView];
  [v21 setAlpha:1.0];

  id v22 = [*(id *)(a1 + 32) pinchAnimationProgressView];
  [v22 setAlpha:0.0];
}

uint64_t __44__UIPrintPreviewViewController_handlePinch___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pinchGestureBeginningView];
  [v2 setAlpha:1.0];

  double v3 = [*(id *)(a1 + 32) pinchAnimationProgressView];
  [v3 removeFromSuperview];

  double v4 = [*(id *)(a1 + 32) pinchAnimationView];
  [v4 removeFromSuperview];

  [*(id *)(a1 + 32) setPinchAnimationProgressView:0];
  [*(id *)(a1 + 32) setPinchAnimationView:0];
  double v5 = *(void **)(a1 + 32);
  return [v5 setPinchGestureBeginningView:0];
}

- (void)performThumbnailDispatchBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPrintPreviewViewController *)self thumbnailOperationsQueue];
  [v5 addOperationWithBlock:v4];
}

- (void)showWebkitGeneratingPreviewProgress
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if ([(UIPrintPreviewViewController *)self showWebKitGeneratingPreviewProgress])
  {
    double v3 = [(UIPrintPreviewViewController *)self collectionView];
    char v4 = [v3 isHidden];

    if ((v4 & 1) == 0)
    {
      id v5 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];

      if (!v5)
      {
        double v6 = [UIPrintMessageAndSpinnerView alloc];
        id v7 = [(UIPrintPreviewViewController *)self view];
        [v7 bounds];
        id v8 = -[UIPrintMessageAndSpinnerView initWithFrame:](v6, "initWithFrame:");

        id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        double v10 = [v9 localizedStringForKey:@"Loading Preview…" value:@"Loading Preview…" table:@"Localizable"];
        [(UIPrintMessageAndSpinnerView *)v8 setMessageText:v10];

        [(UIPrintMessageAndSpinnerView *)v8 setSpinnerHidden:0];
        [(UIPrintMessageAndSpinnerView *)v8 setSpinSpinner:1];
        double v11 = [(UIPrintPreviewViewController *)self view];
        [v11 addSubview:v8];

        double v12 = [(UIPrintPreviewViewController *)self view];
        double v13 = (void *)MEMORY[0x1E4F28DC8];
        id v14 = [(UIPrintPreviewViewController *)self view];
        id v15 = [v13 constraintWithItem:v8 attribute:9 relatedBy:0 toItem:v14 attribute:9 multiplier:1.0 constant:0.0];
        double v16 = (void *)MEMORY[0x1E4F28DC8];
        double v17 = [(UIPrintPreviewViewController *)self view];
        double v18 = [v16 constraintWithItem:v8 attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
        v26[1] = v18;
        double v19 = (void *)MEMORY[0x1E4F28DC8];
        double v20 = [(UIPrintPreviewViewController *)self view];
        double v21 = [v19 constraintWithItem:v8 attribute:7 relatedBy:-1 toItem:v20 attribute:7 multiplier:1.0 constant:0.0];
        v26[2] = v21;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
        [v12 addConstraints:v22];

        [(UIPrintPreviewViewController *)self setWebKitGeneratingPreviewProgressView:v8];
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[UIPrintPreviewViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
      v23 = [(UIPrintPreviewViewController *)self collectionView];
      [v23 setHidden:1];

      double v24 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];
      [v24 setHidden:0];

      double v25 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];
      [v25 setSpinSpinner:1];
    }
  }
}

- (void)hideWebkitGeneratingPreviewProgress
{
  double v3 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    id v5 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];
    [v5 setHidden:1];

    double v6 = [(UIPrintPreviewViewController *)self webKitGeneratingPreviewProgressView];
    [v6 setSpinSpinner:0];

    id v7 = [(UIPrintPreviewViewController *)self collectionView];
    [v7 setHidden:0];
  }
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)presentingDocumentInteractionController
{
  return self->_presentingDocumentInteractionController;
}

- (void)setPresentingDocumentInteractionController:(BOOL)a3
{
  self->_presentingDocumentInteractionController = a3;
}

- (UIPrintSheetController)printSheetController
{
  return (UIPrintSheetController *)objc_getProperty(self, a2, 992, 1);
}

- (void)setPrintSheetController:(id)a3
{
}

- (int64_t)previewLayoutType
{
  return self->_previewLayoutType;
}

- (void)setPreviewLayoutType:(int64_t)a3
{
  self->_previewLayoutType = a3;
}

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setPrintInfo:(id)a3
{
}

- (int64_t)numberOfSheets
{
  return self->_numberOfSheets;
}

- (void)setNumberOfSheets:(int64_t)a3
{
  self->_numberOfSheets = a3;
}

- (NSCache)cachedThumbnailImages
{
  return (NSCache *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setCachedThumbnailImages:(id)a3
{
}

- (id)thumnailImageCompletionHandler
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setThumnailImageCompletionHandler:(id)a3
{
}

- (NSOperationQueue)thumbnailOperationsQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setThumbnailOperationsQueue:(id)a3
{
}

- (UIButton)layoutPopupButton
{
  return (UIButton *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setLayoutPopupButton:(id)a3
{
}

- (NSLayoutConstraint)layoutPopupButtonTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setLayoutPopupButtonTopConstraint:(id)a3
{
}

- (UIAction)pagesPopupAction
{
  return (UIAction *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setPagesPopupAction:(id)a3
{
}

- (UIAction)sheetsPopupAction
{
  return (UIAction *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setSheetsPopupAction:(id)a3
{
}

- (CGSize)previewSize
{
  objc_copyStruct(v4, &self->_previewSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_previewSize, &v3, 16, 1, 0);
}

- (NSLayoutConstraint)collectionViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setCollectionViewTopConstraint:(id)a3
{
}

- (int64_t)previewScrollDirection
{
  return self->_previewScrollDirection;
}

- (void)setPreviewScrollDirection:(int64_t)a3
{
  self->_previewScrollDirection = a3;
}

- (UIDocumentInteractionController)documentInteractionController
{
  return (UIDocumentInteractionController *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setDocumentInteractionController:(id)a3
{
}

- (UIViewController)longPressImageViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setLongPressImageViewController:(id)a3
{
}

- (UIView)pinchGestureBeginningView
{
  return (UIView *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPinchGestureBeginningView:(id)a3
{
}

- (UIImageView)pinchAnimationView
{
  return (UIImageView *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setPinchAnimationView:(id)a3
{
}

- (UIView)pinchAnimationProgressView
{
  return (UIView *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setPinchAnimationProgressView:(id)a3
{
}

- (CGPoint)pinchGestureLastPoint
{
  objc_copyStruct(v4, &self->_pinchGestureLastPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPinchGestureLastPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_pinchGestureLastPoint, &v3, 16, 1, 0);
}

- (double)pinchGestureLastScale
{
  return self->_pinchGestureLastScale;
}

- (void)setPinchGestureLastScale:(double)a3
{
  self->_pinchGestureLastScale = a3;
}

- (UIAlertController)generatingPDFProgressController
{
  return (UIAlertController *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setGeneratingPDFProgressController:(id)a3
{
}

- (UIPrintMessageAndSpinnerView)webKitGeneratingPreviewProgressView
{
  return (UIPrintMessageAndSpinnerView *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setWebKitGeneratingPreviewProgressView:(id)a3
{
}

- (BOOL)showWebKitGeneratingPreviewProgress
{
  return self->_showWebKitGeneratingPreviewProgress;
}

- (void)setShowWebKitGeneratingPreviewProgress:(BOOL)a3
{
  self->_showWebKitGeneratingPreviewProgress = a3;
}

- (double)progressPresentationTime
{
  return self->_progressPresentationTime;
}

- (void)setProgressPresentationTime:(double)a3
{
  self->_progressPresentationTime = a3;
}

- (UITraitChangeRegistration)traitPreferredContentSizeChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setTraitPreferredContentSizeChangeRegistration:(id)a3
{
}

- (UIPrintPanelViewController)printPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  return (UIPrintPanelViewController *)WeakRetained;
}

- (void)setPrintPanelViewController:(id)a3
{
}

- (UIPrintInteractionController)printInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printInteractionController);
  return (UIPrintInteractionController *)WeakRetained;
}

- (void)setPrintInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printInteractionController);
  objc_destroyWeak((id *)&self->_printPanelViewController);
  objc_storeStrong((id *)&self->_traitPreferredContentSizeChangeRegistration, 0);
  objc_storeStrong((id *)&self->_webKitGeneratingPreviewProgressView, 0);
  objc_storeStrong((id *)&self->_generatingPDFProgressController, 0);
  objc_storeStrong((id *)&self->_pinchAnimationProgressView, 0);
  objc_storeStrong((id *)&self->_pinchAnimationView, 0);
  objc_storeStrong((id *)&self->_pinchGestureBeginningView, 0);
  objc_storeStrong((id *)&self->_longPressImageViewController, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_sheetsPopupAction, 0);
  objc_storeStrong((id *)&self->_pagesPopupAction, 0);
  objc_storeStrong((id *)&self->_layoutPopupButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutPopupButton, 0);
  objc_storeStrong((id *)&self->_thumbnailOperationsQueue, 0);
  objc_storeStrong(&self->_thumnailImageCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedThumbnailImages, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_printSheetController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end