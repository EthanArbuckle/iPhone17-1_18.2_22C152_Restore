@interface PUAdjustmentsViewController
- (BOOL)canToggleCell:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)didPerformHapticFeedback;
- (BOOL)isAnimatingScroll;
- (BOOL)shouldDisplayControlValues;
- (BOOL)shouldDisplayMappedValues;
- (BOOL)updatingControls;
- (CEKSlider)slider;
- (CGSize)controlSize;
- (NSIndexPath)selectedIndexPath;
- (PUAdjustmentInfo)selectedAdjustmentInfo;
- (PUAdjustmentViewControllerDelegate)delegate;
- (PUAdjustmentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUAdjustmentsViewDataSource)dataSource;
- (PUAdjustmentsViewFlowLayout)collectionViewLayout;
- (PUSelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)ppt_sliderValueIncrement;
- (double)ppt_sliderVisibleScaleValue;
- (id)_backgroundImageForItemAtIndexPath:(id)a3;
- (id)_circularImageWithSize:(CGSize)a3 color:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)layoutDirection;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_performFeedbackIfNeeded;
- (void)_resetControlsAtIndexPath:(id)a3;
- (void)_setupCellBackgroundImagesIfNeeded;
- (void)_sliderDidEndScrolling;
- (void)_updateCell:(id)a3 withInfo:(id)a4;
- (void)_updateCollectionViewLayoutDirection:(int64_t)a3;
- (void)_updateSelectedInfo;
- (void)_updateSliderForControlAtIndexPath:(id)a3;
- (void)_updateViewLayout;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)decreaseAdjustmentValue:(BOOL)a3;
- (void)didToggleCell:(id)a3;
- (void)hideUnselectedAdjustments:(BOOL)a3;
- (void)increaseAdjustmentValue:(BOOL)a3;
- (void)ppt_selectNextAdjustment;
- (void)resetControls;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectAdjustmentInfoAtIndexPath:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setControlSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPerformHapticFeedback:(BOOL)a3;
- (void)setIsAnimatingScroll:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setShouldDisplayControlValues:(BOOL)a3;
- (void)setShouldDisplayMappedValues:(BOOL)a3;
- (void)setSlider:(id)a3;
- (void)setUpdatingControls:(BOOL)a3;
- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)toggleAutoEnhance;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateControls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUAdjustmentsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_selectedAdjustmentInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_snappingController, 0);
  objc_storeStrong((id *)&self->_autoEnhanceCell, 0);
  objc_storeStrong((id *)&self->_itemBackgroundImage, 0);
  objc_storeStrong((id *)&self->_selectedItemBackgroundImage, 0);
}

- (void)setDidPerformHapticFeedback:(BOOL)a3
{
  self->_didPerformHapticFeedback = a3;
}

- (BOOL)didPerformHapticFeedback
{
  return self->_didPerformHapticFeedback;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (PUSelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (void)setUpdatingControls:(BOOL)a3
{
  self->_updatingControls = a3;
}

- (BOOL)updatingControls
{
  return self->_updatingControls;
}

- (void)setControlSize:(CGSize)a3
{
  self->_controlSize = a3;
}

- (CGSize)controlSize
{
  double width = self->_controlSize.width;
  double height = self->_controlSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSlider:(id)a3
{
}

- (CEKSlider)slider
{
  return self->_slider;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (PUAdjustmentsViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PUAdjustmentInfo)selectedAdjustmentInfo
{
  return self->_selectedAdjustmentInfo;
}

- (void)setShouldDisplayMappedValues:(BOOL)a3
{
  self->_shouldDisplayMappedValues = a3;
}

- (BOOL)shouldDisplayMappedValues
{
  return self->_shouldDisplayMappedValues;
}

- (void)setShouldDisplayControlValues:(BOOL)a3
{
  self->_shouldDisplayControlValues = a3;
}

- (BOOL)shouldDisplayControlValues
{
  return self->_shouldDisplayControlValues;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setDelegate:(id)a3
{
}

- (PUAdjustmentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAdjustmentViewControllerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PUAdjustmentsViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUAdjustmentsViewDataSource *)WeakRetained;
}

- (double)ppt_sliderValueIncrement
{
  v3 = [(PUAdjustmentsViewController *)self slider];
  [v3 minimumValue];
  double v5 = v4;

  v6 = [(PUAdjustmentsViewController *)self slider];
  [v6 maximumValue];
  double v8 = v7;

  v9 = [(PUAdjustmentsViewController *)self slider];
  uint64_t v10 = [v9 tickMarkCount] - 1;

  v11 = [(PUAdjustmentsViewController *)self slider];
  [v11 maximumValue];
  double v13 = (v8 - v5) / fmax((double)v10, 1.0) * 100.0 / v12;

  return v13;
}

- (double)ppt_sliderVisibleScaleValue
{
  v3 = [(PUAdjustmentsViewController *)self slider];
  [v3 value];
  double v5 = v4 * 100.0;
  v6 = [(PUAdjustmentsViewController *)self slider];
  [v6 maximumValue];
  double v8 = v5 / v7;

  return v8;
}

- (void)ppt_selectNextAdjustment
{
  v3 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  uint64_t v4 = [v3 section];

  double v5 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  uint64_t v6 = [v5 item] + 1;

  double v7 = [(PUAdjustmentsViewController *)self dataSource];
  uint64_t v8 = [v7 numberOfItemsInSection:v4];

  if (v6 < v8)
  {
    v9 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v10 = v6;
LABEL_5:
    uint64_t v13 = v4;
    goto LABEL_7;
  }
  ++v4;
  v11 = [(PUAdjustmentsViewController *)self dataSource];
  uint64_t v12 = [v11 numberOfSections] - 1;

  v9 = (void *)MEMORY[0x1E4F28D58];
  if (v4 < v12)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = 0;
  uint64_t v13 = 0;
LABEL_7:
  id v16 = [v9 indexPathForItem:v10 inSection:v13];
  v14 = [(PUAdjustmentsViewController *)self collectionView];
  [v14 scrollToItemAtIndexPath:v16 atScrollPosition:16 animated:1];

  v15 = [(PUAdjustmentsViewController *)self collectionView];
  [(PUAdjustmentsViewController *)self collectionView:v15 didSelectItemAtIndexPath:v16];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v4];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (([a3 isDragging] & 1) == 0)
  {
    id v4 = [(PUAdjustmentsViewController *)self collectionView];
    double v5 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];

    id v6 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v6];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v10 = a3;
  if (!a4)
  {
    id v6 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v6];
  }
  double v7 = [(PUAdjustmentsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PUAdjustmentsViewController *)self delegate];
    [v9 adjustmentsViewControllerToolDidEndScrubbing:self];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(PUAdjustmentsViewController *)self slider];
  [v4 setEnabled:0 dimmed:1 animated:1];

  double v5 = [(PUAdjustmentsViewController *)self selectionFeedbackGenerator];
  [v5 prepareFeedback];

  id v6 = [(PUAdjustmentsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PUAdjustmentsViewController *)self delegate];
    [v8 adjustmentsViewControllerToolWillBeginScrubbing:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v27 = a3;
  if (![(PUAdjustmentsViewController *)self isAnimatingScroll]
    && (([v27 isTracking] & 1) != 0 || objc_msgSend(v27, "isDecelerating")))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v5 = Current - self->_previousTimeStamp;
    [v27 contentOffset];
    double v7 = fabs((v6 - self->_lastOffset.x) / v5) / 100.0;
    [v27 contentOffset];
    self->_lastOffset.x = v8;
    self->_lastOffset.y = v9;
    self->_previousTimeStamp = Current;
    id v10 = [(PUAdjustmentsViewController *)self collectionViewLayout];
    [v27 bounds];
    PXRectGetCenter();
    v11 = objc_msgSend(v10, "nearestIndexPathForVisibleItemAtPoint:");

    uint64_t v12 = [(PUAdjustmentsViewController *)self selectedIndexPath];

    if (v11 != v12)
    {
      [(PUAdjustmentsViewController *)self setSelectedIndexPath:v11];
      [(PUAdjustmentsViewController *)self setDidPerformHapticFeedback:0];
      if (v7 > 15.0) {
        [(PUAdjustmentsViewController *)self _performFeedbackIfNeeded];
      }
    }
    [v27 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v21 = [(PUAdjustmentsViewController *)self collectionView];
    v22 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    v23 = [v21 layoutAttributesForItemAtIndexPath:v22];

    [v23 frame];
    double MidX = CGRectGetMidX(v29);
    v30.origin.x = v14;
    v30.origin.y = v16;
    v30.size.double width = v18;
    v30.size.double height = v20;
    double v25 = vabdd_f64(MidX, CGRectGetMidX(v30));
    if (v7 < 15.0 && v25 < 6.0) {
      [(PUAdjustmentsViewController *)self _performFeedbackIfNeeded];
    }
  }
}

- (void)_performFeedbackIfNeeded
{
  if (![(PUAdjustmentsViewController *)self didPerformHapticFeedback])
  {
    v3 = [(PUAdjustmentsViewController *)self selectionFeedbackGenerator];
    [v3 performFeedback];

    [(PUAdjustmentsViewController *)self setDidPerformHapticFeedback:1];
  }
}

- (void)sliderDidEndScrolling:(id)a3
{
  [(PUAdjustmentsViewController *)self _sliderDidEndScrolling];
  if (![(PUAdjustmentsViewController *)self updatingControls])
  {
    int64_t v4 = self->_sliderScrubbingLevel - 1;
    self->_sliderScrubbingLevel = v4;
    if (!v4)
    {
      id v5 = [(PUAdjustmentsViewController *)self dataSource];
      [v5 endInteractiveChange];
    }
  }
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  double v7 = [(PUAdjustmentsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    CGFloat v9 = [(PUAdjustmentsViewController *)self delegate];
    [v9 adjustmentsViewControllerSliderWillEndScrubbing:self];
  }
  if (x == 0.0)
  {
    [(PUAdjustmentsViewController *)self _sliderDidEndScrolling];
  }
}

- (void)_sliderDidEndScrolling
{
  v3 = [(PUAdjustmentsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PUAdjustmentsViewController *)self delegate];
    [v5 adjustmentsViewControllerSliderDidEndScrubbing:self];
  }
  snappingController = self->_snappingController;
  [(PXUISnappingController *)snappingController interactionEnded];
}

- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5
{
}

- (void)sliderWillBeginScrolling:(id)a3
{
  if (![(PUAdjustmentsViewController *)self updatingControls])
  {
    int64_t sliderScrubbingLevel = self->_sliderScrubbingLevel;
    if (!sliderScrubbingLevel)
    {
      id v5 = [(PUAdjustmentsViewController *)self dataSource];
      [v5 beginInteractiveChange];

      int64_t sliderScrubbingLevel = self->_sliderScrubbingLevel;
    }
    self->_int64_t sliderScrubbingLevel = sliderScrubbingLevel + 1;
  }
  double v6 = [(PUAdjustmentsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(PUAdjustmentsViewController *)self delegate];
    [v8 adjustmentsViewControllerSliderWillBeginScrubbing:self];
  }
  snappingController = self->_snappingController;
  [(PXUISnappingController *)snappingController interactionBegan];
}

- (void)sliderValueChanged:(id)a3
{
  id v11 = a3;
  if (![(PUAdjustmentsViewController *)self isAnimatingScroll])
  {
    char v4 = [(PUAdjustmentsViewController *)self collectionView];
    id v5 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    double v6 = [v4 cellForItemAtIndexPath:v5];

    if (([v6 isEnabled] & 1) == 0)
    {
      [v6 setEnabled:1];
      [v11 setEnabled:1 dimmed:0 animated:1];
    }
    [v6 setIsUserModifying:1];
    [v11 value];
    objc_msgSend(v6, "setValue:");
    self->_isUserModified = 1;
    char v7 = [(PUAdjustmentsViewController *)self dataSource];
    [v11 value];
    double v9 = v8;
    id v10 = [(PUAdjustmentsViewController *)self selectedIndexPath];
    [v7 modifyValue:v10 atIndexPath:v9];

    self->_isUserModified = 0;
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  double v6 = [(PUAdjustmentsViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(PUAdjustmentsViewController *)self updateControls];
  }
}

- (void)selectAdjustmentInfoAtIndexPath:(id)a3
{
  id v8 = a3;
  char v4 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PUAdjustmentsViewController *)self setSelectedIndexPath:v8];
    if ([(PUAdjustmentsViewController *)self layoutDirection]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 16;
    }
    uint64_t v7 = [(PUAdjustmentsViewController *)self collectionView];
    [v7 scrollToItemAtIndexPath:v8 atScrollPosition:v6 animated:1];
  }
}

- (void)hideUnselectedAdjustments:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v5 = [(PUAdjustmentsViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForVisibleItems];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    int v10 = !v3;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v13 = [(PUAdjustmentsViewController *)self selectedIndexPath];
        uint64_t v14 = [v13 compare:v12];

        double v15 = [(PUAdjustmentsViewController *)self collectionView];
        CGFloat v16 = [v15 cellForItemAtIndexPath:v12];

        if (v14) {
          unsigned int v17 = v10;
        }
        else {
          unsigned int v17 = 1;
        }
        [v16 setAlpha:(double)v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)toggleAutoEnhance
{
}

- (void)decreaseAdjustmentValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUAdjustmentsViewController *)self slider];
  +[PUPhotoEditSupport changeValueOfSlider:v5 reverse:1 coarse:v3];
  [(PUAdjustmentsViewController *)self sliderValueChanged:v5];
}

- (void)increaseAdjustmentValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUAdjustmentsViewController *)self slider];
  +[PUPhotoEditSupport changeValueOfSlider:v5 reverse:0 coarse:v3];
  [(PUAdjustmentsViewController *)self sliderValueChanged:v5];
}

- (void)resetControls
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = [(PUAdjustmentsViewController *)self collectionView];
  char v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        int v10 = [(PUAdjustmentsViewController *)self dataSource];
        id v11 = [v10 infoForItemAtIndexPath:v9];

        uint64_t v12 = [(PUAdjustmentsViewController *)self collectionView];
        double v13 = [v12 cellForItemAtIndexPath:v9];

        [(PUAdjustmentsViewController *)self _updateCell:v13 withInfo:v11];
        uint64_t v14 = [(PUAdjustmentsViewController *)self selectedIndexPath];
        [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v14];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)updateControls
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PUAdjustmentsViewController *)self setUpdatingControls:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(PUAdjustmentsViewController *)self collectionView];
  char v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [(PUAdjustmentsViewController *)self dataSource];
        id v11 = [v10 infoForItemAtIndexPath:v9];

        uint64_t v12 = [(PUAdjustmentsViewController *)self collectionView];
        double v13 = [v12 cellForItemAtIndexPath:v9];

        [(PUAdjustmentsViewController *)self _updateCell:v13 withInfo:v11];
        if (!self->_isUserModified) {
          [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(PUAdjustmentsViewController *)self setUpdatingControls:0];
}

- (void)_updateCell:(id)a3 withInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 && v6)
  {
    uint64_t v7 = [v6 iconName];
    [v14 setImageTransformBlock:0];
    uint64_t v8 = [(PUAdjustmentsViewController *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v9 == 1)
    {
      int v10 = [v6 altIconName];

      if (v10)
      {
        uint64_t v11 = [v6 altIconName];

        uint64_t v7 = (void *)v11;
      }
      uint64_t v12 = [v6 altImageTransformBlock];

      if (v12)
      {
        double v13 = [v6 altImageTransformBlock];
        [v14 setImageTransformBlock:v13];
      }
    }
    [v14 setImageName:v7];
    objc_msgSend(v14, "setImageIsColor:", objc_msgSend(v6, "iconIsColor"));
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v6, "enabled"));
    [v6 minimumLevel];
    objc_msgSend(v14, "setMinValue:");
    [v6 maximumLevel];
    objc_msgSend(v14, "setMaxValue:");
    [v6 defaultLevel];
    objc_msgSend(v14, "setDefaultValue:");
    [v6 identityLevel];
    objc_msgSend(v14, "setIdentityValue:");
    [v6 currentLevel];
    objc_msgSend(v14, "setValue:");
  }
}

- (id)_backgroundImageForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(PUAdjustmentsViewController *)self _setupCellBackgroundImagesIfNeeded];
  id v5 = [(PUAdjustmentsViewController *)self selectedIndexPath];

  id v6 = &OBJC_IVAR___PUAdjustmentsViewController__itemBackgroundImage;
  if (v5 == v4) {
    id v6 = &OBJC_IVAR___PUAdjustmentsViewController__selectedItemBackgroundImage;
  }
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  return v7;
}

- (void)_setupCellBackgroundImagesIfNeeded
{
  if (!self->_itemBackgroundImage)
  {
    BOOL v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v4 = [v3 colorWithAlphaComponent:0.3];

    -[PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v4, 51.0, 51.0);
    id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    itemBackgroundImage = self->_itemBackgroundImage;
    self->_itemBackgroundImage = v5;
  }
  if (!self->_selectedItemBackgroundImage)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v10 = [v7 colorWithAlphaComponent:0.9];

    -[PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v10, 53.0, 53.0);
    uint64_t v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    selectedItemBackgroundImage = self->_selectedItemBackgroundImage;
    self->_selectedItemBackgroundImage = v8;
  }
}

- (id)_circularImageWithSize:(CGSize)a3 color:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PUAdjustmentsViewController__circularImageWithSize_color___block_invoke;
  v11[3] = &unk_1E5F22F20;
  id v12 = v6;
  double v13 = width;
  double v14 = height;
  id v8 = v6;
  uint64_t v9 = [v7 imageWithActions:v11];

  return v9;
}

void __60__PUAdjustmentsViewController__circularImageWithSize_color___block_invoke(void *a1, void *a2)
{
  BOOL v3 = (void *)a1[4];
  id v4 = a2;
  [v3 setFill];
  id v5 = (CGContext *)[v4 CGContext];

  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  CGContextFillEllipseInRect(v5, *(CGRect *)&v8);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  uint64_t v8 = [(PUAdjustmentsViewController *)self dataSource];
  uint64_t v9 = [v8 infoForItemAtIndexPath:v7];

  [(PUAdjustmentsViewController *)self _updateCell:v10 withInfo:v9];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUAdjustmentsViewController *)self dataSource];
  uint64_t v9 = [v8 infoForItemAtIndexPath:v6];

  id v10 = [v9 identifier];
  uint64_t v11 = (void *)*MEMORY[0x1E4F8A3F0];

  if (v10 == v11)
  {
    double v13 = [v7 dequeueReusableCellWithReuseIdentifier:@"PUEditAutoEnhanceCellReuseIdentifier" forIndexPath:v6];

    autoEnhanceCell = self->_autoEnhanceCell;
    self->_autoEnhanceCell = v13;

    [(PUPhotoEditAutoAdjustmentCell *)self->_autoEnhanceCell setDelegate:self];
    id v12 = self->_autoEnhanceCell;
  }
  else
  {
    id v12 = [v7 dequeueReusableCellWithReuseIdentifier:@"PUEditAdjustmentsCellReuseIdentifier" forIndexPath:v6];

    [(PUPhotoEditAutoAdjustmentCell *)v12 setDelegate:self];
    [(PUPhotoEditAutoAdjustmentCell *)v12 setShouldDisplayValueLabel:[(PUAdjustmentsViewController *)self shouldDisplayControlValues]];
    [(PUPhotoEditAutoAdjustmentCell *)v12 setDisplayMappedValue:[(PUAdjustmentsViewController *)self shouldDisplayMappedValues]];
  }
  [(PUAdjustmentsViewController *)self _updateCell:v12 withInfo:v9];

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = [(PUAdjustmentsViewController *)self dataSource];

  if (!v4) {
    return 0;
  }
  id v5 = [(PUAdjustmentsViewController *)self dataSource];
  int64_t v6 = [v5 numberOfSections];

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v6 = [(PUAdjustmentsViewController *)self dataSource];

  if (!v6) {
    return 0;
  }
  id v7 = [(PUAdjustmentsViewController *)self dataSource];
  int64_t v8 = [v7 numberOfItemsInSection:a4];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUAdjustmentsViewController *)self selectedIndexPath];

  if (v6 != v5)
  {
    [(PUAdjustmentsViewController *)self setSelectedIndexPath:v5];
    id v7 = [(PUAdjustmentsViewController *)self slider];
    [v7 setEnabled:0 dimmed:1 animated:1];

    [(PUAdjustmentsViewController *)self setIsAnimatingScroll:1];
    if ([(PUAdjustmentsViewController *)self layoutDirection]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 16;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v12[3] = &unk_1E5F2D2C8;
    v12[4] = self;
    id v13 = v5;
    uint64_t v14 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v10[3] = &unk_1E5F2E1C0;
    v10[4] = self;
    id v11 = v13;
    [v9 animateWithDuration:v12 animations:v10 completion:0.25];
  }
}

void __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:*(void *)(a1 + 48) animated:0];
}

uint64_t __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSliderForControlAtIndexPath:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 setIsAnimatingScroll:0];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    if (a5 < 1)
    {
      double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      double v14 = *MEMORY[0x1E4FB2848];
      double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    }
    else
    {
      int64_t v10 = [(PUAdjustmentsViewController *)self layoutDirection];
      if (v10) {
        double v11 = 0.0;
      }
      else {
        double v11 = 10.0;
      }
      if (v10) {
        double v12 = 10.0;
      }
      else {
        double v12 = 0.0;
      }
      if (v10) {
        double v13 = 0.0;
      }
      else {
        double v13 = 10.0;
      }
      if (v10) {
        double v14 = 10.0;
      }
      else {
        double v14 = 0.0;
      }
    }
  }
  else
  {
    int64_t v15 = [(PUAdjustmentsViewController *)self layoutDirection];
    double v13 = 0.0;
    if (v15) {
      double v11 = 0.0;
    }
    else {
      double v11 = 10.0;
    }
    if (v15) {
      double v12 = 10.0;
    }
    else {
      double v12 = 0.0;
    }
    double v14 = 0.0;
  }

  double v16 = v14;
  double v17 = v13;
  double v18 = v12;
  double v19 = v11;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)didToggleCell:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAdjustmentsViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  self->_isUserModified = 1;
  id v7 = [(PUAdjustmentsViewController *)self dataSource];
  uint64_t v8 = [v4 isEnabled];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PUAdjustmentsViewController_didToggleCell___block_invoke;
  v11[3] = &unk_1E5F25270;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v7 setAdjustmentEnabled:v8 atIndexPath:v10 completionHandler:v11];

  self->_isUserModified = 0;
}

void __45__PUAdjustmentsViewController_didToggleCell___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _updateSliderForControlAtIndexPath:*(void *)(a1 + 40)];
    BOOL v3 = [*(id *)(a1 + 32) dataSource];
    id v4 = [v3 infoForItemAtIndexPath:*(void *)(a1 + 40)];

    [v4 currentLevel];
    objc_msgSend(*(id *)(a1 + 48), "setValue:");
    objc_msgSend(*(id *)(a1 + 48), "setIsUserModifying:", objc_msgSend(v4, "enabled"));
  }
}

- (BOOL)canToggleCell:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAdjustmentsViewController *)self dataSource];
  id v6 = [(PUAdjustmentsViewController *)self collectionView];
  id v7 = [v6 indexPathForCell:v4];

  LOBYTE(v4) = [v5 canModifyAdjustmentAtIndexPath:v7];
  return (char)v4;
}

- (void)_resetControlsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAdjustmentsViewController *)self collectionView];
  id v7 = [v5 cellForItemAtIndexPath:v4];

  [v7 resetToDefault];
  id v6 = [(PUAdjustmentsViewController *)self slider];
  [v6 resetToDefault];
}

- (void)setSelectedIndexPath:(id)a3
{
  id v5 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v5)
  {
    uint64_t v8 = v5;
    id v6 = [(PUAdjustmentsViewController *)self collectionView];
    id v7 = [v6 cellForItemAtIndexPath:self->_selectedIndexPath];

    [v7 setIsUserModifying:0];
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    [(PUAdjustmentsViewController *)self _updateSelectedInfo];

    id v5 = v8;
  }
}

- (void)_updateSelectedInfo
{
  BOOL v3 = [(PUAdjustmentsViewController *)self dataSource];
  id v4 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  id obj = [v3 infoForItemAtIndexPath:v4];

  id v5 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_selectedAdjustmentInfo, obj);
    id v6 = [(PUAdjustmentsViewController *)self delegate];

    id v5 = obj;
    if (v6)
    {
      id v7 = [(PUAdjustmentsViewController *)self delegate];
      [v7 adjustmentsViewControllerDidUpdateSelectedControl:self];

      id v5 = obj;
    }
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  if (self->_layoutDirection != a3)
  {
    self->_layoutDirection = a3;
    [(PUAdjustmentsViewController *)self _updateCollectionViewLayoutDirection:"_updateCollectionViewLayoutDirection:"];
  }
}

- (void)_updateCollectionViewLayoutDirection:(int64_t)a3
{
  BOOL v4 = a3 == 0;
  id v5 = [(PUAdjustmentsViewController *)self collectionViewLayout];
  [v5 setScrollDirection:v4];

  id v6 = [(PUAdjustmentsViewController *)self collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)_updateSliderForControlAtIndexPath:(id)a3
{
  id v33 = a3;
  id v4 = [(PUAdjustmentsViewController *)self selectedIndexPath];

  id v5 = v33;
  if (v4 == v33)
  {
    id v6 = [(PUAdjustmentsViewController *)self dataSource];
    id v7 = [v6 infoForItemAtIndexPath:v33];

    if (v7)
    {
      LODWORD(v8) = [v7 enabled];
      uint64_t v9 = v8 ^ 1;
      id v10 = [v7 identifier];
      double v11 = (void *)*MEMORY[0x1E4F8A3F0];

      if (v10 == v11) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 1;
      }
      id v12 = [(PUAdjustmentsViewController *)self slider];
      [v12 setEnabled:v8 dimmed:v9 animated:1];

      [v7 minimumLevel];
      double v14 = v13;
      int64_t v15 = [(PUAdjustmentsViewController *)self slider];
      [v15 setMinimumValue:v14];

      [v7 maximumLevel];
      double v17 = v16;
      double v18 = [(PUAdjustmentsViewController *)self slider];
      [v18 setMaximumValue:v17];

      [v7 defaultLevel];
      double v20 = v19;
      long long v21 = [(PUAdjustmentsViewController *)self slider];
      [v21 setDefaultValue:v20];

      v22 = [(PUAdjustmentsViewController *)self slider];
      [v22 defaultValue];
      double v24 = v23;
      double v25 = [(PUAdjustmentsViewController *)self slider];
      [v25 setMarkedValue:v24];

      if (!self->_snappingController)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F90888]);
        id v27 = [(PUAdjustmentsViewController *)self slider];
        [v7 defaultLevel];
        objc_msgSend(v27, "xOffsetForValue:");
        v28 = (PXUISnappingController *)objc_msgSend(v26, "initWithSnappingTarget:");
        snappingController = self->_snappingController;
        self->_snappingController = v28;

        [(PXUISnappingController *)self->_snappingController setRetentionOffsetThreshold:5.0];
        [(PXUISnappingController *)self->_snappingController setAttractionOffsetThreshold:5.0];
        [(PXUISnappingController *)self->_snappingController setAttractionVelocityThreshold:30.0];
        [(PXUISnappingController *)self->_snappingController setAccumulateOffsetWhileSnapped:1];
      }
      [v7 currentLevel];
      double v31 = v30;
      v32 = [(PUAdjustmentsViewController *)self slider];
      [v32 setValue:v31];
    }
    id v5 = v33;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)PUAdjustmentsViewController;
  id v7 = a4;
  -[PUAdjustmentsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [(PUAdjustmentsViewController *)self collectionView];
  uint64_t v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PUAdjustmentsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E5F2B9D0;
  v10[4] = self;
  [v7 animateAlongsideTransition:v10 completion:0];
}

void __82__PUAdjustmentsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectedIndexPath];

  if (v2)
  {
    if ([*(id *)(a1 + 32) layoutDirection]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 16;
    }
    id v4 = [*(id *)(a1 + 32) collectionView];
    id v5 = [*(id *)(a1 + 32) selectedIndexPath];
    [v4 scrollToItemAtIndexPath:v5 atScrollPosition:v3 animated:0];

    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 selectedIndexPath];
    [v6 _updateSliderForControlAtIndexPath:v7];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUAdjustmentsViewController;
  [(PUAdjustmentsViewController *)&v16 viewDidAppear:a3];
  id v4 = [(PUAdjustmentsViewController *)self selectedIndexPath];

  if (!v4)
  {
    id v5 = [(PUAdjustmentsViewController *)self collectionViewLayout];
    id v6 = [(PUAdjustmentsViewController *)self collectionView];
    [v6 bounds];
    UIRectGetCenter();
    id v7 = objc_msgSend(v5, "nearestIndexPathForVisibleItemAtPoint:");
    [(PUAdjustmentsViewController *)self setSelectedIndexPath:v7];
  }
  if ([(PUAdjustmentsViewController *)self layoutDirection]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 16;
  }
  uint64_t v9 = [(PUAdjustmentsViewController *)self collectionView];
  id v10 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  [v9 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];

  uint64_t v11 = [(PUAdjustmentsViewController *)self collectionView];
  id v12 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  [(id)v11 scrollToItemAtIndexPath:v12 atScrollPosition:v8 animated:0];

  double v13 = [(PUAdjustmentsViewController *)self selectedIndexPath];
  [(PUAdjustmentsViewController *)self _updateSliderForControlAtIndexPath:v13];

  double v14 = [(PUAdjustmentsViewController *)self delegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    int64_t v15 = [(PUAdjustmentsViewController *)self delegate];
    [v15 adjustmentsViewControllerDidAppear:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsViewController;
  [(PUAdjustmentsViewController *)&v3 viewDidLayoutSubviews];
  [(PUAdjustmentsViewController *)self _updateViewLayout];
}

- (void)_updateViewLayout
{
  objc_super v3 = [(PUAdjustmentsViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(PUAdjustmentsViewController *)self slider];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v43[0] = *MEMORY[0x1E4F1DAB8];
  v43[1] = v13;
  v43[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v12 setTransform:v43];

  if ([(PUAdjustmentsViewController *)self layoutDirection])
  {
    double v14 = [(PUAdjustmentsViewController *)self slider];
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v11, 66.0);

    CGAffineTransformMakeRotation(&v42, -1.57079633);
    int64_t v15 = [(PUAdjustmentsViewController *)self slider];
    CGAffineTransform v41 = v42;
    [v15 setTransform:&v41];

    v44.origin.double x = v5;
    v44.origin.y = v7;
    v44.size.double width = v9;
    v44.size.double height = v11;
    CGFloat v16 = CGRectGetMaxX(v44) + -33.0;
    v45.origin.double x = v5;
    v45.origin.y = v7;
    v45.size.double width = v9;
    v45.size.double height = v11;
    double MidY = CGRectGetMidY(v45);
    double v18 = [(PUAdjustmentsViewController *)self slider];
    objc_msgSend(v18, "setCenter:", v16, MidY);

    v46.origin.double x = v5;
    v46.origin.y = v7;
    v46.size.double width = v9;
    v46.size.double height = v11;
    CGFloat v19 = CGRectGetMaxX(v46) + -51.0 + -66.0;
    double v20 = [(PUAdjustmentsViewController *)self collectionView];
    objc_msgSend(v20, "setFrame:", v19, 0.0, 51.0, v11);

    double v21 = v11 * 0.5;
    [(PUAdjustmentsViewController *)self controlSize];
    double v23 = v11 * 0.5 - v22 * 0.5;
    [(PUAdjustmentsViewController *)self controlSize];
    double v25 = v21 - v24 * 0.5;
    id v26 = [(PUAdjustmentsViewController *)self collectionView];
    id v27 = v26;
    double v28 = 0.0;
    double v29 = 0.0;
    double v30 = v23;
    double v31 = v25;
  }
  else
  {
    v47.origin.double x = v5;
    v47.origin.y = v7;
    v47.size.double width = v9;
    v47.size.double height = v11;
    CGFloat v32 = CGRectGetMaxY(v47) + -66.0;
    id v33 = [(PUAdjustmentsViewController *)self slider];
    objc_msgSend(v33, "setFrame:", 0.0, v32, v9, 66.0);

    v48.origin.double x = v5;
    v48.origin.y = v7;
    v48.size.double width = v9;
    v48.size.double height = v11;
    CGFloat v34 = CGRectGetMaxY(v48) + -51.0 + -66.0;
    v35 = [(PUAdjustmentsViewController *)self collectionView];
    objc_msgSend(v35, "setFrame:", 0.0, v34, v9, 51.0);

    double v36 = v9 * 0.5;
    [(PUAdjustmentsViewController *)self controlSize];
    double v38 = v36 - v37 * 0.5;
    [(PUAdjustmentsViewController *)self controlSize];
    double v40 = v36 - v39 * 0.5;
    id v26 = [(PUAdjustmentsViewController *)self collectionView];
    id v27 = v26;
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = v38;
    double v29 = v40;
  }
  objc_msgSend(v26, "setContentInset:", v30, v28, v31, v29);
}

- (void)viewDidLoad
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)PUAdjustmentsViewController;
  [(PUAdjustmentsViewController *)&v37 viewDidLoad];
  [(PUAdjustmentsViewController *)self setLayoutDirection:0];
  objc_super v3 = [MEMORY[0x1E4FB1618] clearColor];
  double v4 = [(PUAdjustmentsViewController *)self view];
  [v4 setBackgroundColor:v3];

  -[PUAdjustmentsViewController setControlSize:](self, "setControlSize:", 51.0, 51.0);
  CGFloat v5 = objc_alloc_init(PUAdjustmentsViewFlowLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  [(PUAdjustmentsViewController *)self controlSize];
  -[UICollectionViewFlowLayout setItemSize:](self->_collectionViewLayout, "setItemSize:");
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumInteritemSpacing:20.0];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:20.0];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setScrollDirection:1];
  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v8 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUAdjustmentsViewController *)self setCollectionView:v8];

  double v9 = [(PUAdjustmentsViewController *)self view];
  double v10 = [(PUAdjustmentsViewController *)self collectionView];
  [v9 addSubview:v10];

  double v11 = [MEMORY[0x1E4FB1618] clearColor];
  id v12 = [(PUAdjustmentsViewController *)self collectionView];
  [v12 setBackgroundColor:v11];

  long long v13 = [(PUAdjustmentsViewController *)self collectionView];
  [v13 setShowsHorizontalScrollIndicator:0];

  double v14 = [(PUAdjustmentsViewController *)self collectionView];
  [v14 setAllowsKeyboardScrolling:0];

  int64_t v15 = [(PUAdjustmentsViewController *)self collectionView];
  [v15 setShowsVerticalScrollIndicator:0];

  CGFloat v16 = [(PUAdjustmentsViewController *)self collectionView];
  [v16 setSemanticContentAttribute:3];

  double v17 = [(PUAdjustmentsViewController *)self collectionView];
  [v17 setContentInsetAdjustmentBehavior:2];

  double v18 = [(PUAdjustmentsViewController *)self collectionView];
  [v18 setSelectionFollowsFocus:1];

  CGFloat v19 = [(PUAdjustmentsViewController *)self collectionView];
  [v19 _setSupportsPointerDragScrolling:1];

  double v20 = [(PUAdjustmentsViewController *)self collectionView];
  [v20 setDelegate:self];

  double v21 = [(PUAdjustmentsViewController *)self collectionView];
  [v21 setDataSource:self];

  double v22 = [(PUAdjustmentsViewController *)self collectionView];
  [v22 setClipsToBounds:0];

  double v23 = [(PUAdjustmentsViewController *)self collectionView];
  [v23 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUEditAdjustmentsCellReuseIdentifier"];

  double v24 = [(PUAdjustmentsViewController *)self collectionView];
  [v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUEditAutoEnhanceCellReuseIdentifier"];

  double v25 = *MEMORY[0x1E4FB2EE8];
  id v26 = [(PUAdjustmentsViewController *)self collectionView];
  [v26 setDecelerationRate:v25];

  id v27 = +[PUPhotoEditSupport createEditSlider];
  [(PUAdjustmentsViewController *)self setSlider:v27];

  double v28 = [(PUAdjustmentsViewController *)self slider];
  [v28 setDelegate:self];

  double v29 = [(PUAdjustmentsViewController *)self slider];
  [v29 addTarget:self action:sel_sliderValueChanged_ forControlEvents:4096];

  double v30 = [(PUAdjustmentsViewController *)self slider];
  [v30 setEnabled:0 dimmed:1 animated:0];

  double v31 = [(PUAdjustmentsViewController *)self view];
  CGFloat v32 = [(PUAdjustmentsViewController *)self slider];
  [v31 addSubview:v32];

  if (PUHapticsAllowed_onceToken != -1) {
    dispatch_once(&PUHapticsAllowed_onceToken, &__block_literal_global_83146);
  }
  if (PUHapticsAllowed_allowHaptics)
  {
    id v33 = objc_alloc_init(PUSelectionFeedbackGenerator);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v33;
  }
  [(PUAdjustmentsViewController *)self setDidPerformHapticFeedback:1];
  v38[0] = objc_opt_class();
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  id v36 = (id)[(PUAdjustmentsViewController *)self registerForTraitChanges:v35 withAction:sel_traitEnvironment_didChangeTraitCollection_];
}

- (PUAdjustmentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsViewController;
  UIEdgeInsets result = [(PUAdjustmentsViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->_shouldDisplayControlValues = 1;
    result->_shouldDisplayMappedValues = 1;
  }
  return result;
}

@end