@interface PXHorizontalCollectionGadget
- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)isFixedHeight;
- (BOOL)isPerformingChanges;
- (BOOL)isResourceLoaded;
- (BOOL)isRootGadgetViewController;
- (BOOL)prefersPagingEnabled;
- (BOOL)selectionFollowsFocus;
- (BOOL)visibleGadgetsLoaded;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGRect)visibleBounds;
- (CGRect)visibleContentRect;
- (CGSize)_ensureCachedHeightForColumnWidth:(double)a3;
- (CGSize)cachedMaxHeightForColumnWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)columnSpans;
- (NSString)collectionAccessoryButtonTitle;
- (NSString)collectionTitle;
- (PXGadgetDelegate)delegate;
- (PXGadgetOrbContext)previewOrbContext;
- (PXGadgetSpec)gadgetSpec;
- (PXHorizontalCollectionGadget)initWithDataSourceManager:(id)a3;
- (PXHorizontalCollectionGadget)initWithLayout:(id)a3 dataSourceManager:(id)a4;
- (PXHorizontalCollectionGadget)initWithProviders:(id)a3;
- (PXHorizontalCollectionGadget)initWithProviders:(id)a3 layout:(id)a4;
- (PXHorizontalCollectionGadgetDelegate)horizontalGadgetDelegate;
- (double)collectionHeight;
- (id)accessoryButtonAction;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contextMenuWithSuggestedActions:(id)a3;
- (id)presentationEnvironmentForGadget:(id)a3;
- (id)previewParametersForTargetPreviewView:(id)a3;
- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4;
- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (int64_t)_columnSpanForTraitCollection:(id)a3;
- (int64_t)currentColumnSpan;
- (int64_t)defaultColumnSpan;
- (int64_t)priority;
- (unint64_t)collectionAccessoryButtonType;
- (unint64_t)gadgetCapabilities;
- (unint64_t)gadgetType;
- (unint64_t)headerStyle;
- (void)_extendedTraitCollectionDidChange:(unint64_t)a3;
- (void)_updateCollectionViewPaging;
- (void)_updateColumnSettings;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)commitPreviewView:(id)a3;
- (void)commitPreviewViewController:(id)a3;
- (void)contentViewDidDisappear;
- (void)contentViewWillAppear;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)didDismissPreviewWithPreviewView:(id)a3 committing:(BOOL)a4;
- (void)gadget:(id)a3 didChange:(unint64_t)a4;
- (void)gadgetControllerFinishedUpdatingDataSourceWithChange:(id)a3;
- (void)gadgetControllerHasAppeared;
- (void)gadgetControllerHasDisappeared;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)prefetchDuringScrollingForWidth:(double)a3;
- (void)setAccessoryButtonAction:(id)a3;
- (void)setCachedMaxHeightForColumnWidth:(CGSize)a3;
- (void)setCollectionAccessoryButtonTitle:(id)a3;
- (void)setCollectionAccessoryButtonType:(unint64_t)a3;
- (void)setCollectionHeight:(double)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setColumnSpans:(id)a3;
- (void)setCurrentColumnSpan:(int64_t)a3;
- (void)setDefaultColumnSpan:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGadgetSpec:(id)a3;
- (void)setGadgetType:(unint64_t)a3;
- (void)setHeaderStyle:(unint64_t)a3;
- (void)setHorizontalGadgetDelegate:(id)a3;
- (void)setIsFixedHeight:(BOOL)a3;
- (void)setIsPerformingChanges:(BOOL)a3;
- (void)setIsResourceLoaded:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setPrefersPagingEnabled:(BOOL)a3;
- (void)setPreviewOrbContext:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setVisibleContentRect:(CGRect)a3;
- (void)setVisibleGadgetsLoaded:(BOOL)a3;
- (void)updateIfNeeded;
- (void)userDidSelectAccessoryButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXHorizontalCollectionGadget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewOrbContext, 0);
  objc_storeStrong(&self->_accessoryButtonAction, 0);
  objc_storeStrong((id *)&self->_columnSpans, 0);
  objc_storeStrong((id *)&self->_collectionAccessoryButtonTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_destroyWeak((id *)&self->_horizontalGadgetDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

- (void)setCachedMaxHeightForColumnWidth:(CGSize)a3
{
  self->_cachedMaxHeightForColumnWidth = a3;
}

- (CGSize)cachedMaxHeightForColumnWidth
{
  double width = self->_cachedMaxHeightForColumnWidth.width;
  double height = self->_cachedMaxHeightForColumnWidth.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)currentColumnSpan
{
  return self->_currentColumnSpan;
}

- (void)setPreviewOrbContext:(id)a3
{
}

- (PXGadgetOrbContext)previewOrbContext
{
  return self->_previewOrbContext;
}

- (void)setIsResourceLoaded:(BOOL)a3
{
  self->_isResourceLoaded = a3;
}

- (BOOL)isResourceLoaded
{
  return self->_isResourceLoaded;
}

- (void)setIsPerformingChanges:(BOOL)a3
{
  self->_isPerformingChanges = a3;
}

- (BOOL)isPerformingChanges
{
  return self->_isPerformingChanges;
}

- (void)setVisibleGadgetsLoaded:(BOOL)a3
{
  self->_visibleGadgetsLoaded = a3;
}

- (BOOL)visibleGadgetsLoaded
{
  return self->_visibleGadgetsLoaded;
}

- (void)setAccessoryButtonAction:(id)a3
{
}

- (id)accessoryButtonAction
{
  return self->_accessoryButtonAction;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setGadgetType:(unint64_t)a3
{
  self->_gadgetType = a3;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  self->_prefersPagingEnabled = a3;
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (void)setColumnSpans:(id)a3
{
}

- (NSDictionary)columnSpans
{
  return self->_columnSpans;
}

- (int64_t)defaultColumnSpan
{
  return self->_defaultColumnSpan;
}

- (void)setIsFixedHeight:(BOOL)a3
{
  self->_isFixedHeight = a3;
}

- (BOOL)isFixedHeight
{
  return self->_isFixedHeight;
}

- (BOOL)selectionFollowsFocus
{
  return self->_selectionFollowsFocus;
}

- (double)collectionHeight
{
  return self->_collectionHeight;
}

- (NSString)collectionAccessoryButtonTitle
{
  return self->_collectionAccessoryButtonTitle;
}

- (unint64_t)collectionAccessoryButtonType
{
  return self->_collectionAccessoryButtonType;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (void)setHorizontalGadgetDelegate:(id)a3
{
}

- (PXHorizontalCollectionGadgetDelegate)horizontalGadgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_horizontalGadgetDelegate);
  return (PXHorizontalCollectionGadgetDelegate *)WeakRetained;
}

- (CGRect)visibleContentRect
{
  double x = self->_visibleContentRect.origin.x;
  double y = self->_visibleContentRect.origin.y;
  double width = self->_visibleContentRect.size.width;
  double height = self->_visibleContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (PXGadgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetDelegate *)WeakRetained;
}

- (void)setPriority:(int64_t)a3
{
  self->_prioritdouble y = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)updateIfNeeded
{
  v6.receiver = self;
  v6.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v6 updateIfNeeded];
  uint64_t v3 = _horizontalGadgetUpdateFlags;
  if (HIBYTE(_horizontalGadgetUpdateFlags) | _horizontalGadgetUpdateFlags | byte_1E98CDC42)
  {
    if (HIBYTE(_horizontalGadgetUpdateFlags)) {
      uint64_t v3 = _horizontalGadgetUpdateFlags | 2;
    }
    if (byte_1E98CDC42) {
      uint64_t v4 = v3 | 0x40;
    }
    else {
      uint64_t v4 = v3;
    }
    v5 = [(PXHorizontalCollectionGadget *)self delegate];
    [v5 gadget:self didChange:v4];

    _horizontalGadgetUpdateFlags = 0;
    byte_1E98CDC42 = 0;
  }
}

- (void)_updateColumnSettings
{
  if (self->_gadgetSpec)
  {
    uint64_t v3 = [(PXGadgetUIViewController *)self layout];
    int64_t v4 = [(PXHorizontalCollectionGadget *)self currentColumnSpan];
    [(PXGadgetSpec *)self->_gadgetSpec columnWidthForColumnSpan:v4];
    if (v5 > 0.0) {
      objc_msgSend(v3, "setColumnWidth:");
    }
    [(PXGadgetSpec *)self->_gadgetSpec columnSpacingForColumnSpan:v4];
    objc_msgSend(v3, "setInterSectionSpacing:");
    objc_super v6 = +[PXPreloadScheduler sharedScheduler];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PXHorizontalCollectionGadget__updateColumnSettings__block_invoke;
    v7[3] = &unk_1E5DD36F8;
    v7[4] = self;
    [v6 scheduleMainQueueTask:v7];
  }
}

uint64_t __53__PXHorizontalCollectionGadget__updateColumnSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (int64_t)_columnSpanForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int64_t v15 = 0;
  int64_t v15 = [(PXHorizontalCollectionGadget *)self defaultColumnSpan];
  double v5 = [(PXHorizontalCollectionGadget *)self columnSpans];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PXHorizontalCollectionGadget__columnSpanForTraitCollection___block_invoke;
  v9[3] = &unk_1E5DC5398;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__PXHorizontalCollectionGadget__columnSpanForTraitCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) containsTraitsInCollection:a2])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 integerValue];
    *a4 = 1;
  }
}

- (void)setCurrentColumnSpan:(int64_t)a3
{
  if (self->_currentColumnSpan != a3)
  {
    self->_currentColumnSpan = a3;
    [(PXHorizontalCollectionGadget *)self _updateColumnSettings];
    [(PXHorizontalCollectionGadget *)self _updateCollectionViewPaging];
    id v4 = [(PXHorizontalCollectionGadget *)self delegate];
    [v4 gadget:self didChange:64];
  }
}

- (CGSize)_ensureCachedHeightForColumnWidth:(double)a3
{
}

uint64_t __66__PXHorizontalCollectionGadget__ensureCachedHeightForColumnWidth___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  double v6 = v5;
  if (v5 >= 1.79769313e308)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXHorizontalCollectionGadget.m", 569, @"Invalid parameter not satisfying: %@", @"preferredHeight < CGFLOAT_MAX" object file lineNumber description];
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), v6);
  uint64_t result = [*(id *)(a1 + 32) isFixedHeight];
  if (result) {
    *a3 = 1;
  }
  return result;
}

- (void)_extendedTraitCollectionDidChange:(unint64_t)a3
{
  char v3 = a3;
  id v8 = [(UIViewController *)self px_extendedTraitCollection];
  if ([v8 layoutSizeClass])
  {
    if ([v8 layoutSizeSubclass])
    {
      if ([v8 layoutOrientation])
      {
        uint64_t v5 = [v8 userInterfaceIdiom];
        if ((v3 & 0x1F) != 0)
        {
          if (v5)
          {
            double v6 = [(UIViewController *)self px_extendedTraitCollection];
            id v7 = [v6 traitCollection];

            [(PXHorizontalCollectionGadget *)self setCurrentColumnSpan:[(PXHorizontalCollectionGadget *)self _columnSpanForTraitCollection:v7]];
          }
        }
      }
    }
  }
}

- (CGRect)visibleBounds
{
  char v3 = [(PXHorizontalCollectionGadget *)self collectionView];
  [(PXHorizontalCollectionGadget *)self visibleContentRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(PXHorizontalCollectionGadget *)self collectionView];
  v13 = [v12 superview];
  objc_msgSend(v3, "convertRect:fromView:", v13, v5, v7, v9, v11);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v22 = [(PXHorizontalCollectionGadget *)self collectionView];
  [v22 bounds];
  v34.origin.CGFloat x = v15;
  v34.origin.CGFloat y = v17;
  v34.size.CGFloat width = v19;
  v34.size.CGFloat height = v21;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController observable:didChange:context:](&v8, sel_observable_didChange_context_, a3);
  if ((void *)PXExtendedTraitCollectionObservationContext_209034 == a5) {
    [(PXHorizontalCollectionGadget *)self _extendedTraitCollectionDidChange:a4];
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5 = a3;
  double v6 = [(PXGadgetUIViewController *)self layout];
  [v5 contentOffset];
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v6, "targetContentOffsetForProposedContentOffset:", v8, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXHorizontalCollectionGadget;
  double v4 = [(PXGadgetUIViewController *)&v6 collectionView:a3 cellForItemAtIndexPath:a4];
  [v4 setClipsToBounds:0];
  return v4;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "H_Gadget_CV_prefetchItems", "", buf, 2u);
  }
  double v7 = [v5 firstObject];

  if (v7)
  {
    double v8 = [(PXGadgetUIViewController *)self dataSource];
    double v9 = v8;
    if (v8) {
      [v8 firstItemIndexPath];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    double v10 = [v9 gadgetAtIndexPath:v12];
    if (objc_opt_respondsToSelector())
    {
      double v11 = [v10 contentViewController];
      [v11 view];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_12:
        if (objc_opt_respondsToSelector())
        {
          [(PXHorizontalCollectionGadget *)self cachedMaxHeightForColumnWidth];
          objc_msgSend(v10, "prefetchDuringScrollingForWidth:");
        }

        goto LABEL_15;
      }
      double v11 = [v10 contentView];
    }

    goto LABEL_12;
  }
LABEL_15:
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "H_Gadget_CV_prefetchItems", "", buf, 2u);
  }
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXHorizontalCollectionGadget.m", 452, @"Invalid parameter not satisfying: %@", @"gadget" object file lineNumber description];
  }
  objc_super v6 = [(PXHorizontalCollectionGadget *)self delegate];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 presentationEnvironmentForGadget:v5];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXHorizontalCollectionGadget;
    uint64_t v8 = [(PXGadgetUIViewController *)&v12 presentationEnvironmentForGadget:v5];
  }
  double v9 = (void *)v8;

  return v9;
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXHorizontalCollectionGadget;
  if ([(PXGadgetUIViewController *)&v16 gadget:a3 transitionToViewController:v10 animated:v7 completion:v11])
  {
    char v12 = 1;
  }
  else
  {
    double v13 = [(PXHorizontalCollectionGadget *)self delegate];
    double v14 = v13;
    if (v13) {
      char v12 = [v13 gadget:self transitionToViewController:v10 animated:v7 completion:v11];
    }
    else {
      char v12 = 0;
    }
  }
  return v12;
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v14 gadget:v6 didChange:a4];
  if ((a4 & 0x40) != 0) {
    -[PXHorizontalCollectionGadget setCachedMaxHeightForColumnWidth:](self, "setCachedMaxHeightForColumnWidth:", *(double *)off_1E5DAB030, *((double *)off_1E5DAB030 + 1));
  }
  if (a4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _OWORD v12[2] = __49__PXHorizontalCollectionGadget_gadget_didChange___block_invoke;
    v12[3] = &unk_1E5DC5348;
    id v13 = v6;
    [(PXHorizontalCollectionGadget *)self performChanges:v12];
  }
  uint64_t v7 = [(PXHorizontalCollectionGadget *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    double v9 = [(PXHorizontalCollectionGadget *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(PXHorizontalCollectionGadget *)self delegate];
      [v11 gadget:v6 didChange:a4];
    }
  }
}

void __49__PXHorizontalCollectionGadget_gadget_didChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 localizedTitle];
  [v3 setCollectionTitle:v4];
}

- (void)prefetchDuringScrollingForWidth:(double)a3
{
  if (![(PXHorizontalCollectionGadget *)self isResourceLoaded])
  {
    [(PXHorizontalCollectionGadget *)self setIsResourceLoaded:1];
    [(PXHorizontalCollectionGadget *)self cachedMaxHeightForColumnWidth];
    double v6 = v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = vcvtpd_s64_f64(a3 / v5);
    uint64_t v7 = [(PXGadgetUIViewController *)self dataSource];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PXHorizontalCollectionGadget_prefetchDuringScrollingForWidth___block_invoke;
    v8[3] = &unk_1E5DC5320;
    *(double *)&v8[5] = v6;
    v8[4] = v9;
    [v7 enumerateGadgetsUsingBlock:v8];

    _Block_object_dispose(v9, 8);
  }
}

void __64__PXHorizontalCollectionGadget_prefetchDuringScrollingForWidth___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v6 contentViewController];
    [v5 view];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    double v5 = [v6 contentView];
  }

LABEL_6:
  if (objc_opt_respondsToSelector()) {
    [v6 prefetchDuringScrollingForWidth:*(double *)(a1 + 40)];
  }
  *a3 = --*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 1;
}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  if (objc_opt_respondsToSelector())
  {
    double v9 = objc_msgSend(v8, "targetPreviewViewForLocation:inCoordinateSpace:", v7, x, y);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)commitPreviewView:(id)a3
{
  id v9 = a3;
  double v5 = [(PXHorizontalCollectionGadget *)self previewOrbContext];

  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXHorizontalCollectionGadget.m" lineNumber:376 description:@"previewOrbContext cannot be nil"];
  }
  id v6 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v7 = [v6 gadget];

  if (objc_opt_respondsToSelector()) {
    [v7 commitPreviewView:v9];
  }
}

- (void)didDismissPreviewWithPreviewView:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v7 = [(PXHorizontalCollectionGadget *)self previewOrbContext];

  if (!v7)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXHorizontalCollectionGadget.m" lineNumber:368 description:@"previewOrbContext cannot be nil"];
  }
  uint64_t v8 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v9 = [v8 gadget];

  if (objc_opt_respondsToSelector()) {
    [v9 didDismissPreviewWithPreviewView:v11 committing:v4];
  }
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v7 = [(PXHorizontalCollectionGadget *)self previewOrbContext];

  if (!v7)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXHorizontalCollectionGadget.m" lineNumber:360 description:@"previewOrbContext cannot be nil"];
  }
  uint64_t v8 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v9 = [v8 gadget];

  if (objc_opt_respondsToSelector()) {
    [v9 didDismissPreviewViewController:v11 committing:v4];
  }
}

- (void)commitPreviewViewController:(id)a3
{
  id v9 = a3;
  double v5 = [(PXHorizontalCollectionGadget *)self previewOrbContext];

  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXHorizontalCollectionGadget.m" lineNumber:352 description:@"previewOrbContext cannot be nil"];
  }
  id v6 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v7 = [v6 gadget];

  if (objc_opt_respondsToSelector()) {
    [v7 commitPreviewViewController:v9];
  }
}

- (id)contextMenuWithSuggestedActions:(id)a3
{
  id v4 = a3;
  double v5 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v6 = [v5 gadget];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 contextMenuWithSuggestedActions:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)previewParametersForTargetPreviewView:(id)a3
{
  id v4 = a3;
  double v5 = [(PXHorizontalCollectionGadget *)self previewOrbContext];
  id v6 = [v5 gadget];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 previewParametersForTargetPreviewView:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  if (v8)
  {
    id v9 = objc_alloc_init(PXGadgetOrbContext);
    [(PXGadgetOrbContext *)v9 setGadget:v8];
    if (objc_opt_respondsToSelector())
    {
      char v10 = objc_msgSend(v8, "previewViewControllerAtLocation:fromSourceView:", v7, x, y);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
    id v9 = 0;
  }
  [(PXHorizontalCollectionGadget *)self setPreviewOrbContext:v9];

  return v10;
}

- (void)gadgetControllerFinishedUpdatingDataSourceWithChange:(id)a3
{
  id v4 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
  [v4 horizontalCollectionGadgetDatasourceDidUpdate:self];
}

- (void)gadgetControllerHasDisappeared
{
  id v2 = [(PXGadgetUIViewController *)self dataSource];
  [v2 enumerateGadgetsUsingBlock:&__block_literal_global_22_209062];
}

void __62__PXHorizontalCollectionGadget_gadgetControllerHasDisappeared__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 gadgetControllerHasDisappeared];
  }
}

- (void)gadgetControllerHasAppeared
{
  id v2 = [(PXGadgetUIViewController *)self dataSource];
  [v2 enumerateGadgetsUsingBlock:&__block_literal_global_209065];
}

void __59__PXHorizontalCollectionGadget_gadgetControllerHasAppeared__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 gadgetControllerHasAppeared];
  }
}

- (void)_updateCollectionViewPaging
{
  id v15 = [(PXHorizontalCollectionGadget *)self gadgetSpec];
  id v3 = [(PXGadgetUIViewController *)self layout];
  uint64_t v4 = [v15 layoutSizeClass];
  uint64_t v5 = [v15 layoutOrientation];
  uint64_t v6 = 0;
  if (v4 == 1 && v5 != 2) {
    uint64_t v6 = [v3 prefersPagingEnabled];
  }
  id v7 = [(PXHorizontalCollectionGadget *)self collectionView];
  objc_msgSend(v15, "columnSpacingForColumnSpan:", -[PXHorizontalCollectionGadget currentColumnSpan](self, "currentColumnSpan"));
  double v9 = v8;
  [v15 contentInsets];
  objc_msgSend(v7, "_setPagingOrigin:", -v10, 0.0);
  [v3 columnWidth];
  double v12 = v11;
  [v15 layoutReferenceWidth];
  objc_msgSend(v7, "_setInterpageSpacing:", v9 + v12 - v13, 0.0);
  [v7 setPagingEnabled:v6];
  objc_super v14 = (double *)MEMORY[0x1E4FB2EE8];
  if (!v6) {
    objc_super v14 = (double *)MEMORY[0x1E4FB2EF0];
  }
  [v7 setDecelerationRate:*v14];
}

- (void)setGadgetSpec:(id)a3
{
  uint64_t v5 = (PXGadgetSpec *)a3;
  uint64_t v6 = self->_gadgetSpec;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    BOOL v8 = [(PXGadgetSpec *)v5 isEqual:v6];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      if (self->_gadgetSpec)
      {
        double v9 = (void *)MEMORY[0x1E4FB1EB0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46__PXHorizontalCollectionGadget_setGadgetSpec___block_invoke;
        v10[3] = &unk_1E5DD32A8;
        double v11 = v5;
        double v12 = self;
        [v9 performWithoutAnimation:v10];
      }
    }
  }
}

uint64_t __46__PXHorizontalCollectionGadget_setGadgetSpec___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) contentInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(a1 + 40) collectionView];
  objc_msgSend(v10, "setContentInset:", v3, v5, v7, v9);

  [*(id *)(a1 + 40) _updateColumnSettings];
  double v11 = *(void **)(a1 + 40);
  return [v11 _updateCollectionViewPaging];
}

- (void)contentViewDidDisappear
{
}

- (void)contentViewWillAppear
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PXHorizontalCollectionGadget *)self collectionHeight];
  if (v5 == 0.0)
  {
    double v6 = [(PXHorizontalCollectionGadget *)self collectionView];
    [v6 contentInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [(PXGadgetUIViewController *)self layout];
    [v15 columnWidth];
    if (v16 == 0.0) {
      double v16 = width - v10 - v14;
    }
    [(PXHorizontalCollectionGadget *)self _ensureCachedHeightForColumnWidth:v16];
    [(PXHorizontalCollectionGadget *)self cachedMaxHeightForColumnWidth];
    double v18 = v12 + v8 + v17;
  }
  else
  {
    double v18 = v5;
  }
  double v19 = width;
  double v20 = v18;
  result.CGFloat height = v20;
  result.double width = v19;
  return result;
}

- (void)userDidSelectAccessoryButton:(id)a3
{
  id v6 = a3;
  double v4 = [(PXHorizontalCollectionGadget *)self accessoryButtonAction];

  if (v4)
  {
    double v5 = [(PXHorizontalCollectionGadget *)self accessoryButtonAction];
    ((void (**)(void, PXHorizontalCollectionGadget *, id))v5)[2](v5, self, v6);
  }
}

- (void)setVisibleContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleContentRect = &self->_visibleContentRect;
  if (!CGRectEqualToRect(a3, self->_visibleContentRect))
  {
    p_visibleContentRect->origin.CGFloat x = x;
    p_visibleContentRect->origin.CGFloat y = y;
    p_visibleContentRect->size.CGFloat width = width;
    p_visibleContentRect->size.CGFloat height = height;
    [(PXGadgetUIViewController *)self visibleBoundsDidChange];
  }
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (void)setCollectionHeight:(double)a3
{
  if (![(PXHorizontalCollectionGadget *)self isPerformingChanges])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    double v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PXHorizontalCollectionGadget.m", 189, @"[%@] %@ must be called from a performChanges block.", self, v7 object file lineNumber description];
  }
  if (self->_collectionHeight != a3)
  {
    self->_collectionHeight = a3;
    byte_1E98CDC42 = 1;
  }
}

- (void)setCollectionAccessoryButtonTitle:(id)a3
{
  double v11 = (NSString *)a3;
  if (![(PXHorizontalCollectionGadget *)self isPerformingChanges])
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"PXHorizontalCollectionGadget.m", 179, @"[%@] %@ must be called from a performChanges block.", self, v10 object file lineNumber description];
  }
  double v5 = self->_collectionAccessoryButtonTitle;
  if (v5 == v11)
  {
  }
  else
  {
    char v6 = [(NSString *)v11 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      double v7 = (NSString *)[(NSString *)v11 copy];
      collectionAccessoryButtonTitle = self->_collectionAccessoryButtonTitle;
      self->_collectionAccessoryButtonTitle = v7;

      HIBYTE(_horizontalGadgetUpdateFlags) = 1;
    }
  }
}

- (void)setCollectionAccessoryButtonType:(unint64_t)a3
{
  if (![(PXHorizontalCollectionGadget *)self isPerformingChanges])
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    double v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PXHorizontalCollectionGadget.m", 169, @"[%@] %@ must be called from a performChanges block.", self, v7 object file lineNumber description];
  }
  if (self->_collectionAccessoryButtonType != a3)
  {
    self->_collectionAccessoryButtonType = a3;
    HIBYTE(_horizontalGadgetUpdateFlags) = 1;
  }
}

- (void)setCollectionTitle:(id)a3
{
  id v9 = a3;
  if (![(PXHorizontalCollectionGadget *)self isPerformingChanges])
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    double v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"PXHorizontalCollectionGadget.m", 159, @"[%@] %@ must be called from a performChanges block.", self, v8 object file lineNumber description];
  }
  p_collectionTitle = &self->_collectionTitle;
  if (![(NSString *)*p_collectionTitle isEqualToString:v9])
  {
    objc_storeStrong((id *)p_collectionTitle, a3);
    LOBYTE(_horizontalGadgetUpdateFlags) = 1;
  }
}

- (void)performChanges:(id)a3
{
  double v5 = (void (**)(id, PXHorizontalCollectionGadget *))a3;
  BOOL v4 = [(PXHorizontalCollectionGadget *)self isPerformingChanges];
  [(PXHorizontalCollectionGadget *)self setIsPerformingChanges:1];
  if (v5) {
    v5[2](v5, self);
  }
  [(PXHorizontalCollectionGadget *)self setIsPerformingChanges:v4];
  if (![(PXHorizontalCollectionGadget *)self isPerformingChanges]) {
    [(PXHorizontalCollectionGadget *)self updateIfNeeded];
  }
}

- (void)setLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v4 setLayout:a3];
  [(PXHorizontalCollectionGadget *)self _updateColumnSettings];
  [(PXHorizontalCollectionGadget *)self _updateCollectionViewPaging];
}

- (BOOL)isRootGadgetViewController
{
  return 0;
}

- (void)setDefaultColumnSpan:(int64_t)a3
{
  if (self->_defaultColumnSpan != a3)
  {
    self->_defaultColumnSpan = a3;
    id v4 = [(PXHorizontalCollectionGadget *)self traitCollection];
    [(PXHorizontalCollectionGadget *)self setCurrentColumnSpan:[(PXHorizontalCollectionGadget *)self _columnSpanForTraitCollection:v4]];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v4 viewDidAppear:a3];
  [(PXHorizontalCollectionGadget *)self setIsResourceLoaded:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v4 viewWillAppear:a3];
  [(PXHorizontalCollectionGadget *)self contentViewWillAppear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v4 viewDidDisappear:a3];
  [(PXHorizontalCollectionGadget *)self contentViewDidDisappear];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PXHorizontalCollectionGadget;
  [(PXGadgetUIViewController *)&v8 viewDidLoad];
  double v3 = [(PXHorizontalCollectionGadget *)self collectionView];
  [v3 setClipsToBounds:0];
  objc_super v4 = [(PXHorizontalCollectionGadget *)self gadgetSpec];
  [v4 contentInsets];
  objc_msgSend(v3, "setContentInset:");

  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setContentInsetAdjustmentBehavior:2];
  [v3 _setAutomaticContentOffsetAdjustmentEnabled:1];
  [v3 setAlwaysBounceVertical:0];
  [v3 setAlwaysBounceHorizontal:1];
  [v3 setDirectionalLockEnabled:1];
  [v3 setFocusGroupIdentifier:0];
  objc_msgSend(v3, "setSelectionFollowsFocus:", -[PXHorizontalCollectionGadget selectionFollowsFocus](self, "selectionFollowsFocus"));
  BOOL prefersPagingEnabled = self->_prefersPagingEnabled;
  char v6 = [(PXGadgetUIViewController *)self layout];
  [v6 setPrefersPagingEnabled:prefersPagingEnabled];

  double v7 = [(UIViewController *)self px_extendedTraitCollection];
  [v7 registerChangeObserver:self context:PXExtendedTraitCollectionObservationContext_209034];
  [(PXHorizontalCollectionGadget *)self _updateColumnSettings];
}

- (PXHorizontalCollectionGadget)initWithDataSourceManager:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(PXGadgetCollectionViewLayout);
  [(PXGadgetCollectionViewLayout *)v5 setScrollDirection:1];
  char v6 = [(PXHorizontalCollectionGadget *)self initWithLayout:v5 dataSourceManager:v4];

  return v6;
}

- (PXHorizontalCollectionGadget)initWithProviders:(id)a3 layout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [[PXBasicGadgetDataSourceManager alloc] initWithProviders:v7];

  id v9 = [(PXHorizontalCollectionGadget *)self initWithLayout:v6 dataSourceManager:v8];
  return v9;
}

- (PXHorizontalCollectionGadget)initWithProviders:(id)a3
{
  id v4 = a3;
  double v5 = [[PXBasicGadgetDataSourceManager alloc] initWithProviders:v4];

  id v6 = [(PXHorizontalCollectionGadget *)self initWithDataSourceManager:v5];
  return v6;
}

- (PXHorizontalCollectionGadget)initWithLayout:(id)a3 dataSourceManager:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXHorizontalCollectionGadget;
  id v4 = [(PXGadgetUIViewController *)&v7 initWithLayout:a3 dataSourceManager:a4];
  double v5 = (PXHorizontalCollectionGadget *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 1288) = *(_OWORD *)off_1E5DAB030;
    *((void *)v4 + 154) = 0;
    *((void *)v4 + 160) = 0;
    v4[1162] = 1;
    [v4 setContentVisible:0];
  }
  return v5;
}

@end