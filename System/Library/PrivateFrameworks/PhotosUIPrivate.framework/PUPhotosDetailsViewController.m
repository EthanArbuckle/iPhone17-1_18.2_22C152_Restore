@interface PUPhotosDetailsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (CGRect)contentBoundsInCoordinateSpace:(id)a3;
- (CGSize)minimumContentSize;
- (CGSize)preferredContentSize;
- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate;
- (PUAssetViewModel)assetViewModel;
- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4;
- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4 assetViewModel:(id)a5;
- (PUPhotosDetailsViewController)initWithContext:(id)a3 options:(unint64_t)a4;
- (UIEdgeInsets)px_safeAreaInsets;
- (double)maxVisibleHeightInEdit;
- (unint64_t)occludedContentEdges;
- (void)_configureVisualSearchTopResultItem;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)editingDidChange:(BOOL)a3;
- (void)editorHeightDidChange;
- (void)scrollViewControllerContentBoundsDidChange:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)setAccessoryContentViewControllerDelegate:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4;
- (void)setEmpty:(BOOL)a3;
- (void)setMaxVisibleContentInsetsWhenInEdit:(UIEdgeInsets)a3;
- (void)setMaxVisibleHeightInEdit:(double)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)visualSearchLookupWidgetDidTap;
@end

@implementation PUPhotosDetailsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_accessoryContentViewControllerDelegate);
}

- (void)setMaxVisibleHeightInEdit:(double)a3
{
  self->_maxVisibleHeightInEdit = a3;
}

- (double)maxVisibleHeightInEdit
{
  return self->_maxVisibleHeightInEdit;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)setAccessoryContentViewControllerDelegate:(id)a3
{
}

- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryContentViewControllerDelegate);
  return (PUAccessoryContentViewControllerDelegate *)WeakRetained;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v6 isInEditModeChanged])
  {
    if ([v8 isInEditMode]) {
      goto LABEL_10;
    }
    if ([v8 lastEditStyleChangeReason] != 2)
    {
      uint64_t v7 = 2 * ([v8 lastEditStyleChangeReason] != 1);
LABEL_9:
      [(PXPhotosDetailsUIViewController *)self requestExitEditModeWithChangeSavingMode:v7];
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v7 = 1;
    goto LABEL_9;
  }
  if ([v6 accessoryViewVisibilityChanged]
    && ([v8 isAccessoryViewVisible] & 1) == 0
    && [v8 editStyle] == 2)
  {
    goto LABEL_8;
  }
LABEL_10:
  if ([v6 visualImageAnalysisChanged]) {
    [(PUPhotosDetailsViewController *)self _configureVisualSearchTopResultItem];
  }
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  if (self->_superRespondsTo.scrollViewControllerContentBoundsDidChange)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotosDetailsViewController;
    [(PUPhotosDetailsViewController *)&v5 scrollViewControllerContentBoundsDidChange:a3];
  }
  v4 = [(PUPhotosDetailsViewController *)self accessoryContentViewControllerDelegate];
  [v4 accessoryContentViewControllerContentBoundsDidChange:self];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4 = a3;
  if (self->_superRespondsTo.scrollViewControllerDidScroll)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPhotosDetailsViewController;
    [(PXPhotosDetailsUIViewController *)&v7 scrollViewControllerDidScroll:v4];
  }
  objc_super v5 = [(PUPhotosDetailsViewController *)self assetViewModel];
  if ([v5 isInEditMode]
    && ([v4 isAnimatingScroll] & 1) == 0
    && (([v4 isDecelerating] & 1) != 0
     || ([v4 isDragging] & 1) != 0
     || [v4 isTracking]))
  {
    [(PXPhotosDetailsUIViewController *)self requestExitEditModeWithChangeSavingMode:1];
  }
  id v6 = [(PUPhotosDetailsViewController *)self accessoryContentViewControllerDelegate];
  [v6 accessoryContentViewControllerContentBoundsDidChange:self];
}

- (UIEdgeInsets)px_safeAreaInsets
{
  v21.receiver = self;
  v21.super_class = (Class)PUPhotosDetailsViewController;
  [(PUPhotosDetailsViewController *)&v21 px_safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PUPhotosDetailsViewController *)self parentViewController];
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "px_safeAreaInsets");
    double v4 = v13;
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
  }

  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  [v5 contentBounds];

  double v6 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  [v6 contentInset];

  PXEdgeInsetsInsetRect();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  [v15 presentedContentSize];
  double v17 = v16;

  if (!PXSizeIsEmpty()) {
    double v14 = v17;
  }
  double v18 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  id v19 = [v18 scrollView];

  objc_msgSend(v19, "convertRect:toCoordinateSpace:", v4, v8, v10, v12, v14);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PUPhotosDetailsViewController *)self view];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v23.origin.double x = v10;
  v23.origin.double y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.double x = v18;
  v22.double y = v20;
  LOBYTE(v7) = CGRectContainsPoint(v23, v22);

  return (char)v7;
}

- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PXPhotosDetailsUIViewController *)self contentEdgeInsets];
  if (left != v13 || top != v10 || right != v12 || bottom != v11)
  {
    -[PXPhotosDetailsUIViewController setContentEdgeInsets:](self, "setContentEdgeInsets:", top, left, bottom, right);
    if (a4 == 2)
    {
      double v17 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
      CGFloat v18 = [v17 scrollView];
      if ((objc_msgSend(v18, "px_isScrolledAtEdge:", 1) & 1) == 0
        && ([v17 isDecelerating] & 1) == 0
        && ([v17 isDragging] & 1) == 0
        && ([v17 isTracking] & 1) == 0)
      {
        objc_msgSend(v18, "px_scrollToEdge:animated:", 1, 0);
      }
    }
    id v19 = [(PUPhotosDetailsViewController *)self accessoryContentViewControllerDelegate];
    [v19 accessoryContentViewControllerContentBoundsDidChange:self];
  }
}

- (void)setMaxVisibleContentInsetsWhenInEdit:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = [(PUPhotosDetailsViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = left + v10;
  double v18 = top + v12;
  double v19 = v14 - (left + right);
  double v20 = v16 - (top + bottom);
  v25.origin.double x = v17;
  v25.origin.double y = v18;
  v25.size.width = v19;
  v25.size.height = v20;
  double Height = CGRectGetHeight(v25);
  if (Height <= 10.0)
  {
    double v22 = v18;
  }
  else
  {
    double v20 = v20 + -10.0;
    double v22 = v18 + 10.0;
  }
  if (Height <= 10.0) {
    double v23 = v17;
  }
  else {
    double v23 = v17 + 0.0;
  }
  v26.origin.double x = v23;
  v26.origin.double y = v22;
  v26.size.width = v19;
  v26.size.height = v20;
  [(PUPhotosDetailsViewController *)self setMaxVisibleHeightInEdit:CGRectGetHeight(v26)];
  -[PXPhotosDetailsUIViewController informFirstWidgetAvailableVisibleRectInEditMode:](self, "informFirstWidgetAvailableVisibleRectInEditMode:", v23, v22, v19, v20);
}

- (CGSize)minimumContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  [(PXPhotosDetailsUIViewController *)self captionWidgetPreferredHeight];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)visualSearchLookupWidgetDidTap
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v2 = [(PUPhotosDetailsViewController *)self assetViewModel];
  double v3 = [v2 visualImageAnalysis];
  double v4 = [v3 resultItems];
  double v5 = [v4 firstObject];

  double v6 = [v2 visualSearchImageAnalysisInteraction];
  [v6 showVisualSearchForResultItem:v5];
  id v7 = PLVisualIntelligenceGetLog();
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v9 = [v2 asset];
      double v10 = [v9 uuid];
      int v12 = 138413058;
      double v13 = v10;
      __int16 v14 = 2112;
      double v15 = v3;
      __int16 v16 = 2112;
      double v17 = v5;
      __int16 v18 = 2112;
      double v19 = v6;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_INFO, "Visual Lookup item was tapped in 1Up's info panel (asset: %@, analysis: %@, top item: %@, interaction: %@)", (uint8_t *)&v12, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    double v9 = [v2 asset];
    double v10 = [v9 uuid];
    double v11 = [NSNumber numberWithInt:v2 != 0];
    int v12 = 138413314;
    double v13 = v10;
    __int16 v14 = 2112;
    double v15 = v3;
    __int16 v16 = 2112;
    double v17 = v5;
    __int16 v18 = 2112;
    double v19 = 0;
    __int16 v20 = 2112;
    double v21 = v11;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Visual Lookup item was tapped in 1Up's info panel but failed (asset: %@, analysis: %@, top item: %@, interaction: %@, assetViewModel non-nil? %@)", (uint8_t *)&v12, 0x34u);

    goto LABEL_6;
  }
}

- (void)editorHeightDidChange
{
  [(PXPhotosDetailsUIViewController *)self captionWidgetCurrentContentHeight];
  double v4 = v3;
  [(PXPhotosDetailsUIViewController *)self captionWidgetPreferredHeight];
  if (vabdd_f64(v5, v4) >= 1.0)
  {
    double v6 = v5 - v4;
    id v7 = [(PUPhotosDetailsViewController *)self accessoryContentViewControllerDelegate];
    [v7 accessoryContentViewController:self editorHeightDidChange:v6];
  }
}

- (void)editingDidChange:(BOOL)a3
{
  int v3 = a3;
  double v5 = [(PUPhotosDetailsViewController *)self assetViewModel];
  int v6 = [v5 isInEditMode];

  if (v6 != v3)
  {
    if (v3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 2;
    }
    if (v3) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    double v9 = [(PUPhotosDetailsViewController *)self assetViewModel];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PUPhotosDetailsViewController_editingDidChange___block_invoke;
    v10[3] = &unk_1E5F2A1D0;
    v10[5] = v8;
    v10[6] = v7;
    v10[4] = self;
    [v9 performChanges:v10];
  }
}

void __50__PUPhotosDetailsViewController_editingDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = v1 == 1;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3 == 1;
  }
  id v5 = [*(id *)(a1 + 32) assetViewModel];
  [v5 setEditStyle:v2 changeReason:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)occludedContentEdges
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotosDetailsViewController;
  return [(PXPhotosDetailsUIViewController *)&v3 occludedContentEdges] & 0xFFFFFFFFFFFFFFFELL;
}

- (CGSize)preferredContentSize
{
  double v3 = *MEMORY[0x1E4F1DB30];
  *(double *)&uint64_t v4 = 500.0;
  if ([(PUPhotosDetailsViewController *)self isViewLoaded])
  {
    id v5 = [(PXPhotosDetailsUIViewController *)self scrollViewController];

    if (v5)
    {
      int v6 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
      [v6 presentedContentSize];
      double v3 = v7;
      uint64_t v4 = v8;

      if (PXSizeIsEmpty())
      {
        double v9 = [(PUPhotosDetailsViewController *)self view];
        [(PUPhotosDetailsViewController *)self contentBoundsInCoordinateSpace:v9];
        double v3 = v10;
        uint64_t v4 = v11;
      }
    }
  }
  double v12 = v3;
  double v13 = *(double *)&v4;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v7 = a3;
  if ([(PXPhotosDetailsUIViewController *)self isEmpty])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1658], "px_containerized_defaultConfiguration");
    id v5 = PULocalizedString(@"PUPhotosDetailsViewControllerContentUnavailableTitle");
    [v4 setText:v5];

    int v6 = [v4 updatedConfigurationForState:v7];
    [(PUPhotosDetailsViewController *)self _setContentUnavailableConfiguration:v6];
  }
  else
  {
    [(PUPhotosDetailsViewController *)self _setContentUnavailableConfiguration:0];
  }
}

- (void)setEmpty:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosDetailsViewController;
  [(PXPhotosDetailsUIViewController *)&v4 setEmpty:a3];
  [(PUPhotosDetailsViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_configureVisualSearchTopResultItem
{
  double v3 = [(PUPhotosDetailsViewController *)self assetViewModel];
  objc_super v4 = [v3 visualImageAnalysis];
  id v5 = [v4 resultItems];
  int v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F90550]);
    uint64_t v8 = [v6 glyphName];
    double v9 = [v6 displayLabel];
    double v10 = [v6 displayMessage];
    uint64_t v11 = (void *)[v7 initWithGlyphName:v8 visualDomain:v9 displayMessage:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  double v12 = [(PXPhotosDetailsUIViewController *)self context];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PUPhotosDetailsViewController__configureVisualSearchTopResultItem__block_invoke;
  v14[3] = &unk_1E5F2AA40;
  id v15 = v11;
  id v13 = v11;
  [v12 performChanges:v14];
}

uint64_t __68__PUPhotosDetailsViewController__configureVisualSearchTopResultItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisualLookupData:*(void *)(a1 + 32)];
}

- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4 assetViewModel:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosDetailsViewController;
  double v10 = [(PXPhotosDetailsUIViewController *)&v14 initWithContext:a3 configuration:a4];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetViewModel, a5);
    [(PUAssetViewModel *)v11->_assetViewModel registerChangeObserver:v11];
    [(PUPhotosDetailsViewController *)v11 _configureVisualSearchTopResultItem];
    double v12 = (void *)[(PUPhotosDetailsViewController *)v11 superclass];
    v11->_superRespondsTo.scrollViewControllerDidScroll = [v12 instancesRespondToSelector:sel_scrollViewControllerDidScroll_];
    v11->_superRespondsTo.scrollViewControllerContentBoundsDidChange = [v12 instancesRespondToSelector:sel_scrollViewControllerContentBoundsDidChange_];
  }

  return v11;
}

- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4
{
  return [(PUPhotosDetailsViewController *)self initWithContext:a3 configuration:a4 assetViewModel:0];
}

- (PUPhotosDetailsViewController)initWithContext:(id)a3 options:(unint64_t)a4
{
  int v6 = (objc_class *)MEMORY[0x1E4F90510];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setOptions:a4];
  id v9 = [(PUPhotosDetailsViewController *)self initWithContext:v7 configuration:v8 assetViewModel:0];

  return v9;
}

@end