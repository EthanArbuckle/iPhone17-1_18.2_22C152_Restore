@interface PUFilterToolController
- (BOOL)toolbarGlyphUsesHierarchicalColor;
- (BOOL)wantsScrubberKeyControl;
- (BOOL)wantsSliderKeyControl;
- (BOOL)wantsZoomAndPanEnabled;
- (PUFilterToolController)initWithCoder:(id)a3;
- (PUFilterToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_adjustedFilterIntensity;
- (id)_adjustedFilterName;
- (id)_effectAdjustment;
- (id)_effectForIndex:(int64_t)a3;
- (id)centerToolbarView;
- (id)didFinishLoadingFilterThumbnails;
- (id)localizedName;
- (id)selectedToolbarIconGlyphName;
- (id)toolbarIconGlyphName;
- (id)willLoadFilterThumbnails;
- (int64_t)_adjustedFilterIndex;
- (int64_t)_indexForFilterId:(id)a3;
- (int64_t)toolControllerTag;
- (void)_prepareThumbnailImagesIfNeeded;
- (void)_setShowSlider:(BOOL)a3 animate:(BOOL)a4;
- (void)_setThumbnail:(id)a3 forKey:(id)a4;
- (void)_setupFilters;
- (void)_setupScrubber;
- (void)_setupSlider;
- (void)_sliderDidEndScrolling;
- (void)_updateBadgeAndSliderWithEffect:(id)a3;
- (void)_updateBadgeConstraints;
- (void)_updateCacheWithCIImage:(id)a3;
- (void)_updateCompositionControllerWithEffect:(id)a3;
- (void)_updateFilterIntensityCache;
- (void)_updateScrubberLayout;
- (void)_updateSelectionTextAnimate:(BOOL)a3;
- (void)_updateToolConstraints;
- (void)_updateWithCompositionController:(id)a3;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)decreaseScrubberValue:(BOOL)a3;
- (void)decreaseSliderValue:(BOOL)a3;
- (void)didResignActiveTool;
- (void)increaseScrubberValue:(BOOL)a3;
- (void)increaseSliderValue:(BOOL)a3;
- (void)setDidFinishLoadingFilterThumbnails:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setWillLoadFilterThumbnails:(id)a3;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderDidScroll:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(unint64_t)a5;
- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3;
- (void)wheelScrubberViewDidEndScrolling:(id)a3;
- (void)wheelScrubberViewWillBeginDragging:(id)a3;
- (void)wheelScrubberViewWillBeginScrolling:(id)a3;
- (void)wheelScrubberViewWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)willBecomeActiveTool;
@end

@implementation PUFilterToolController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishLoadingFilterThumbnails, 0);
  objc_storeStrong(&self->_willLoadFilterThumbnails, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filterBadgeHeightConstraint, 0);
  objc_storeStrong((id *)&self->_filterBadgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_filterBadgeViewConstraints, 0);
  objc_storeStrong((id *)&self->_scrubberViewConstraints, 0);
  objc_storeStrong((id *)&self->_toolConstraints, 0);
  objc_storeStrong((id *)&self->_filterIntensityCache, 0);
  objc_storeStrong((id *)&self->_filterThumbnailCache, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_storeStrong((id *)&self->_filterBadgeView, 0);
}

- (void)setDidFinishLoadingFilterThumbnails:(id)a3
{
}

- (id)didFinishLoadingFilterThumbnails
{
  return self->_didFinishLoadingFilterThumbnails;
}

- (void)setWillLoadFilterThumbnails:(id)a3
{
}

- (id)willLoadFilterThumbnails
{
  return self->_willLoadFilterThumbnails;
}

- (void)sliderDidEndScrolling:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
  [(PUFilterToolController *)self _sliderDidEndScrolling];
  PULocalizedString(@"PHOTOEDIT_FILTER_INTENSITY_ACTION_TITLE");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v5];
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0, a5, a4.x, a4.y);
  if (x == 0.0)
  {
    [(PUFilterToolController *)self _sliderDidEndScrolling];
  }
}

- (void)sliderDidScroll:(id)a3
{
  id v7 = [(PUFilterToolController *)self _effectForIndex:[(CEKWheelScrubberView *)self->_scrubberView selectedIndex]];
  if (v7)
  {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    id v4 = [(PUPhotoEditToolController *)self compositionController];
    [(CEKSlider *)self->_slider value];
    +[PUPhotoEditEffectsSupport updateCompositionController:withEffect:intensity:updateVersion:](PUPhotoEditEffectsSupport, "updateCompositionController:withEffect:intensity:updateVersion:", v4, v7, 1);

    id v5 = PULocalizedString(@"PHOTOEDIT_FILTER_INTENSITY_ACTION_TITLE");
    id v6 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v5];
  }
  [(PUFilterToolController *)self _updateSelectionTextAnimate:1];
}

- (void)sliderWillBeginScrolling:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
  self->_isSliderTouchDown = 1;
  [(PUFilterToolController *)self _updateSelectionTextAnimate:1];
  [(PUPhotoEditToolController *)self willModifyAdjustment];
}

- (void)_sliderDidEndScrolling
{
  self->_isSliderTouchDown = 0;
  [(PUFilterToolController *)self _updateFilterIntensityCache];
  [(PUFilterToolController *)self _updateSelectionTextAnimate:1];
}

- (void)_updateSelectionTextAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isSliderTouchDown)
  {
    id v5 = NSNumber;
    [(CEKSlider *)self->_slider value];
    objc_msgSend(v5, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [(NSNumberFormatter *)self->_formatter stringFromNumber:v8];
    [(CEKWheelScrubberView *)self->_scrubberView setSelectionText:v6 animated:v3];
  }
  else
  {
    scrubberView = self->_scrubberView;
    [(CEKWheelScrubberView *)scrubberView setSelectionText:0 animated:a3];
  }
}

- (void)_updateCompositionControllerWithEffect:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    filterIntensityCache = self->_filterIntensityCache;
    id v6 = [v4 filterIdentifier];
    id v7 = [(NSMutableDictionary *)filterIntensityCache objectForKey:v6];

    if (v7)
    {
      [v7 floatValue];
      double v9 = v8;
    }
    else
    {
      double v9 = 1.0;
    }
    if ([(CEKSlider *)self->_slider isEnabled]) {
      [(CEKSlider *)self->_slider setValue:v9];
    }
  }
  else
  {
    double v9 = 1.0;
  }
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  v10 = [(PUPhotoEditToolController *)self compositionController];
  +[PUPhotoEditEffectsSupport updateCompositionController:v10 withEffect:v13 intensity:1 updateVersion:v9];

  v11 = PULocalizedString(@"PHOTOEDIT_FILTER_ACTION_TITLE");
  id v12 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v11];
}

- (void)wheelScrubberViewDidEndScrolling:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
  self->_isScrubbing = 0;
  [(CEKSlider *)self->_slider setEnabled:1 dimmed:0 animated:1];
  id v5 = PULocalizedString(@"PHOTOEDIT_FILTER_ACTION_TITLE");
  id v6 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v5];

  uint64_t v7 = [v4 selectedIndex];
  id v8 = [(PUFilterToolController *)self _effectForIndex:v7];
  [(PUFilterToolController *)self _updateCompositionControllerWithEffect:v8];
}

- (void)wheelScrubberViewWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (void)wheelScrubberViewWillBeginScrolling:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  self->_isScrubbing = 1;
  [(CEKSlider *)self->_slider setEnabled:0 dimmed:1 animated:1];
  [(PUPhotoEditToolController *)self willModifyAdjustment];
}

- (void)wheelScrubberViewWillBeginDragging:(id)a3
{
}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  id v21 = a4;
  uint64_t v7 = [(PUFilterToolController *)self _effectForIndex:a5];
  id v8 = [v7 filterIdentifier];
  if (!v8) {
    id v8 = (id)*MEMORY[0x1E4F8B1E8];
  }
  double v9 = [(NSMutableDictionary *)self->_filterThumbnailCache objectForKey:v8];
  if (v9)
  {
    v10 = [v21 itemView];
    v11 = [v10 layer];

    uint64_t v12 = [(CEKWheelScrubberView *)self->_scrubberView layoutDirection];
    if (a5)
    {
      id v13 = [MEMORY[0x1E4F8AA70] standardSupportedEffects];
      uint64_t v14 = [v13 count] - 1;

      if (v14 != a5)
      {
LABEL_12:
        context = self->_context;
        [v9 extent];
        v20 = -[CIContext createCGImage:fromRect:](context, "createCGImage:fromRect:", v9);
        [v11 setContents:v20];
        CGImageRelease(v20);

        goto LABEL_13;
      }
      [v11 setCornerRadius:5.0];
      BOOL v15 = v12 == 0;
      uint64_t v16 = 12;
      uint64_t v17 = 10;
    }
    else
    {
      [v11 setCornerRadius:5.0];
      BOOL v15 = v12 == 0;
      uint64_t v16 = 3;
      uint64_t v17 = 5;
    }
    if (v15) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = v16;
    }
    [v11 setMaskedCorners:v18];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  self->_isInteractingWithWheelScrubber = 1;
  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", [a3 selectedIndex]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PUFilterToolController *)self _updateCompositionControllerWithEffect:v4];
  [(PUFilterToolController *)self _updateBadgeAndSliderWithEffect:v4];
  self->_isInteractingWithWheelScrubber = 0;
}

- (void)_updateFilterIntensityCache
{
  if (self->_slider)
  {
    id v7 = [(PUFilterToolController *)self _effectForIndex:[(CEKWheelScrubberView *)self->_scrubberView selectedIndex]];
    BOOL v3 = [v7 filterIdentifier];
    if (v3)
    {
      filterIntensityCache = self->_filterIntensityCache;
      id v5 = NSNumber;
      [(CEKSlider *)self->_slider value];
      id v6 = objc_msgSend(v5, "numberWithDouble:");
      [(NSMutableDictionary *)filterIntensityCache setObject:v6 forKey:v3];
    }
  }
}

- (void)_setShowSlider:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CEKSlider *)self->_slider isHidden] == a3)
  {
    double v7 = 0.0;
    if (v5) {
      double v7 = 1.0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke;
    aBlock[3] = &unk_1E5F2E0A8;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v7;
    id v8 = (void (**)(void))_Block_copy(aBlock);
    double v9 = v8;
    if (v4)
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke_2;
      v13[3] = &unk_1E5F2EBA0;
      uint64_t v14 = v8;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke_3;
      v11[3] = &unk_1E5F2BA20;
      v11[4] = self;
      BOOL v12 = v5;
      [v10 animateWithDuration:v13 animations:v11 completion:0.25];
    }
    else
    {
      v8[2](v8);
      [(CEKSlider *)self->_slider setHidden:!v5];
    }
  }
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_updateBadgeAndSliderWithEffect:(id)a3
{
  id v15 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F8AA70];
  BOOL v5 = [v15 filterIdentifier];
  int v6 = [v4 isEffectNoneForIdentifier:v5];

  if (!v15)
  {
    id v15 = [MEMORY[0x1E4F8AA70] effectWithIdentifier:*MEMORY[0x1E4F8B1E8]];
    int v6 = 1;
  }
  [(PUFilterToolController *)self _setShowSlider:v6 ^ 1u animate:1];
  double v7 = [v15 displayName];
  id v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  double v9 = [v7 componentsSeparatedByCharactersInSet:v8];
  v10 = [v9 componentsJoinedByString:@" "];

  v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v12 = [v10 uppercaseStringWithLocale:v11];

  [(CEKBadgeTextView *)self->_filterBadgeView _setText:v12];
  [(CEKBadgeTextView *)self->_filterBadgeView sizeToFit];
  [(CEKBadgeTextView *)self->_filterBadgeView bounds];
  [(NSLayoutConstraint *)self->_filterBadgeWidthConstraint setConstant:v13];
  [(CEKBadgeTextView *)self->_filterBadgeView bounds];
  [(NSLayoutConstraint *)self->_filterBadgeHeightConstraint setConstant:v14];
}

- (int64_t)_indexForFilterId:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F8AA70];
  id v4 = a3;
  BOOL v5 = [v3 standardSupportedEffects];
  int v6 = [MEMORY[0x1E4F8AA70] effectWithIdentifier:v4];

  int64_t v7 = [v5 indexOfObject:v6];
  return v7;
}

- (id)_effectForIndex:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F8AA70] standardSupportedEffects];
  BOOL v5 = v4;
  if (a3 < 1 || [v4 count] <= (unint64_t)a3)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (double)_adjustedFilterIntensity
{
  v2 = [(PUFilterToolController *)self _effectAdjustment];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 intensity];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (id)_adjustedFilterName
{
  v2 = [(PUFilterToolController *)self _effectAdjustment];
  BOOL v3 = [v2 kind];

  return v3;
}

- (id)_effectAdjustment
{
  v2 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v3 = [v2 compositionKeys];
  double v4 = [MEMORY[0x1E4F8A748] adjustmentConstants];
  double v5 = [v4 PIEffect3DAdjustmentKey];
  int v6 = [v3 containsObject:v5];

  if (v6) {
    [v2 effect3DAdjustmentController];
  }
  else {
  int64_t v7 = [v2 effectAdjustmentController];
  }

  return v7;
}

- (int64_t)_adjustedFilterIndex
{
  BOOL v3 = [(PUPhotoEditToolController *)self compositionController];
  double v4 = [MEMORY[0x1E4F8A748] adjustmentConstants];
  double v5 = [v4 PIPortraitAdjustmentKey];
  int v6 = [v3 adjustmentControllerForKey:v5];

  if ([v6 enabled])
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [(PUFilterToolController *)self _adjustedFilterName];
    int64_t v7 = [(PUFilterToolController *)self _indexForFilterId:v8];
  }
  return v7;
}

- (int64_t)toolControllerTag
{
  return 1003;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (id)centerToolbarView
{
  v2 = +[PUInterfaceManager currentTheme];
  BOOL v3 = PULocalizedString(@"PHOTOEDIT_FILTERS_TOP_LABEL");
  double v4 = [v3 localizedUppercaseString];

  double v5 = [v2 photoEditingTopToolbarToolLabelButtonColor];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setText:v4];
  [v6 setTextColor:v5];
  int64_t v7 = [v2 topToolbarToolLabelFont];
  [v6 setFont:v7];

  return v6;
}

- (BOOL)toolbarGlyphUsesHierarchicalColor
{
  return 1;
}

- (id)selectedToolbarIconGlyphName
{
  return @"camera.filters";
}

- (id)toolbarIconGlyphName
{
  return @"camera.filters";
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_FILTERS_TOOL_BUTTON");
}

- (void)_updateScrubberLayout
{
  BOOL v3 = [(PUPhotoEditToolController *)self photoEditSpec];
  uint64_t v4 = [v3 currentLayoutStyle];

  BOOL v5 = v4 == 4 || [(PUPhotoEditToolController *)self layoutOrientation] != 1;
  [(CEKWheelScrubberView *)self->_scrubberView setLayoutDirection:v5];
  [(CEKWheelScrubberView *)self->_scrubberView setLayoutOrder:0];
  scrubberView = self->_scrubberView;
  [(CEKWheelScrubberView *)scrubberView setDotPlacement:v5];
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PUFilterToolController;
  [(PUPhotoEditToolController *)&v8 setLayoutOrientation:a3 withTransitionCoordinator:a4];
  if (self->_scrubberView)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_filterBadgeViewConstraints];
    filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
    self->_filterBadgeViewConstraints = 0;

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolConstraints];
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = 0;

    int64_t v7 = [(PUFilterToolController *)self view];
    [v7 setNeedsUpdateConstraints];

    [(PUFilterToolController *)self _updateScrubberLayout];
    [(CEKWheelScrubberView *)self->_scrubberView updateItems];
  }
}

- (void)_updateBadgeConstraints
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (!self->_filterBadgeWidthConstraint)
  {
    BOOL v3 = [(CEKBadgeTextView *)self->_filterBadgeView widthAnchor];
    [(CEKBadgeTextView *)self->_filterBadgeView bounds];
    BOOL v5 = [v3 constraintEqualToConstant:v4];
    filterBadgeWidthConstraint = self->_filterBadgeWidthConstraint;
    self->_filterBadgeWidthConstraint = v5;

    [(NSLayoutConstraint *)self->_filterBadgeWidthConstraint setActive:1];
  }
  if (!self->_filterBadgeHeightConstraint)
  {
    int64_t v7 = [(CEKBadgeTextView *)self->_filterBadgeView heightAnchor];
    [(CEKBadgeTextView *)self->_filterBadgeView bounds];
    double v9 = [v7 constraintEqualToConstant:v8];
    filterBadgeHeightConstraint = self->_filterBadgeHeightConstraint;
    self->_filterBadgeHeightConstraint = v9;

    [(NSLayoutConstraint *)self->_filterBadgeHeightConstraint setActive:1];
  }
  if (!self->_filterBadgeViewConstraints)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
    self->_filterBadgeViewConstraints = v11;

    double v13 = [(PUPhotoEditToolController *)self delegate];
    double v14 = [v13 toolControllerMainContainerView:self];

    v34 = v14;
    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = [(PUFilterToolController *)self view];
    }
    uint64_t v16 = v15;
    uint64_t v17 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v18 = [v17 currentLayoutStyle];

    if (v18 == 4)
    {
      v32 = self->_filterBadgeViewConstraints;
      v19 = [(CEKBadgeTextView *)self->_filterBadgeView rightAnchor];
      v20 = [(CEKWheelScrubberView *)self->_scrubberView leftAnchor];
      v33 = v19;
      id v21 = [v19 constraintEqualToAnchor:v20 constant:-6.0];
      v35[0] = v21;
      v22 = [(CEKBadgeTextView *)self->_filterBadgeView centerYAnchor];
      v23 = [(PUFilterToolController *)self view];
      v24 = [v23 centerYAnchor];
      [v22 constraintEqualToAnchor:v24];
      v26 = v25 = v16;
      v35[1] = v26;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v35;
    }
    else
    {
      int64_t v29 = [(PUPhotoEditToolController *)self layoutOrientation];
      v32 = self->_filterBadgeViewConstraints;
      v30 = [(CEKBadgeTextView *)self->_filterBadgeView bottomAnchor];
      v33 = v30;
      if (v29 == 1)
      {
        v20 = [(PUPhotoEditToolController *)self toolContainerView];
        id v21 = [v20 topAnchor];
        v22 = [v30 constraintEqualToAnchor:v21 constant:-6.0];
        v37[0] = v22;
        v23 = [(CEKBadgeTextView *)self->_filterBadgeView centerXAnchor];
        v24 = [v16 centerXAnchor];
        [v23 constraintEqualToAnchor:v24];
        v26 = v25 = v16;
        v37[1] = v26;
        v27 = (void *)MEMORY[0x1E4F1C978];
        v28 = v37;
      }
      else
      {
        v20 = [v16 safeAreaLayoutGuide];
        id v21 = [v20 bottomAnchor];
        v22 = [v30 constraintEqualToAnchor:v21 constant:-0.0];
        v36[0] = v22;
        v23 = [(CEKBadgeTextView *)self->_filterBadgeView centerXAnchor];
        v24 = [v16 centerXAnchor];
        [v23 constraintEqualToAnchor:v24];
        v26 = v25 = v16;
        v36[1] = v26;
        v27 = (void *)MEMORY[0x1E4F1C978];
        v28 = v36;
      }
    }
    v31 = [v27 arrayWithObjects:v28 count:2];
    [(NSMutableArray *)v32 addObjectsFromArray:v31];

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_filterBadgeViewConstraints];
  }
}

- (void)_updateToolConstraints
{
  v132[3] = *MEMORY[0x1E4F143B8];
  if (!self->_toolConstraints)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = v3;

    int64_t v5 = [(PUPhotoEditToolController *)self layoutOrientation];
    id v6 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v7 = [v6 currentLayoutStyle];

    double v8 = [(PUPhotoEditToolController *)self toolContainerView];
    slider = self->_slider;
    v120 = v8;
    if (slider)
    {
      if (v5 != 1 || v7 == 4)
      {
        uint64_t v116 = v7;
        id v46 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        [v8 addLayoutGuide:v46];
        v87 = self->_toolConstraints;
        v107 = [(CEKWheelScrubberView *)self->_scrubberView widthAnchor];
        v102 = [v107 constraintEqualToConstant:75.0];
        v130[0] = v102;
        v98 = [v8 heightAnchor];
        v94 = [(CEKWheelScrubberView *)self->_scrubberView heightAnchor];
        v90 = [v98 constraintEqualToAnchor:v94];
        v130[1] = v90;
        v89 = [v8 centerYAnchor];
        v88 = [(CEKWheelScrubberView *)self->_scrubberView centerYAnchor];
        v86 = [v89 constraintEqualToAnchor:v88];
        v130[2] = v86;
        v85 = [v8 topAnchor];
        v84 = [(CEKWheelScrubberView *)self->_scrubberView topAnchor];
        v83 = [v85 constraintEqualToAnchor:v84];
        v130[3] = v83;
        v47 = [v46 widthAnchor];
        [v47 constraintEqualToConstant:66.0];
        v49 = v48 = v8;
        v130[4] = v49;
        v50 = [(CEKWheelScrubberView *)self->_scrubberView heightAnchor];
        v51 = [v46 heightAnchor];
        v52 = [v50 constraintEqualToAnchor:v51];
        v130[5] = v52;
        v53 = [v48 centerYAnchor];
        v118 = v46;
        v54 = [v46 centerYAnchor];
        v55 = [v53 constraintEqualToAnchor:v54];
        v130[6] = v55;
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:7];
        [(NSMutableArray *)v87 addObjectsFromArray:v56];

        int64_t v57 = [(PUPhotoEditToolController *)self layoutOrientation];
        v103 = self->_toolConstraints;
        if (v57 == 2 || v116 == 4)
        {
          v69 = [v120 leftAnchor];
          v59 = [(CEKWheelScrubberView *)self->_scrubberView leftAnchor];
          v108 = v69;
          v60 = [v69 constraintEqualToAnchor:v59];
          v129[0] = v60;
          v61 = [v120 rightAnchor];
          v62 = [v118 rightAnchor];
          v63 = [v61 constraintEqualToAnchor:v62 constant:0.0];
          v129[1] = v63;
          v64 = [(CEKWheelScrubberView *)self->_scrubberView rightAnchor];
          v65 = [v118 leftAnchor];
          v66 = [v64 constraintEqualToAnchor:v65 constant:9.0];
          v129[2] = v66;
          v67 = v129;
        }
        else
        {
          v58 = [v120 rightAnchor];
          v59 = [(CEKWheelScrubberView *)self->_scrubberView rightAnchor];
          v108 = v58;
          v60 = [v58 constraintEqualToAnchor:v59];
          v128[0] = v60;
          v61 = [v120 leftAnchor];
          v62 = [v118 leftAnchor];
          v63 = [v61 constraintEqualToAnchor:v62];
          v128[1] = v63;
          v64 = [(CEKWheelScrubberView *)self->_scrubberView leftAnchor];
          v65 = [v118 rightAnchor];
          v66 = [v64 constraintEqualToAnchor:v65];
          v128[2] = v66;
          v67 = v128;
        }
        v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
        [(NSMutableArray *)v103 addObjectsFromArray:v70];

        v91 = self->_toolConstraints;
        v112 = [(CEKSlider *)self->_slider heightAnchor];
        v109 = [v118 widthAnchor];
        v104 = [v112 constraintEqualToAnchor:v109];
        v127[0] = v104;
        v99 = [(CEKSlider *)self->_slider widthAnchor];
        v95 = [v118 heightAnchor];
        v71 = [v99 constraintEqualToAnchor:v95];
        v127[1] = v71;
        v72 = [(CEKSlider *)self->_slider centerXAnchor];
        v73 = [v118 centerXAnchor];
        v74 = [v72 constraintEqualToAnchor:v73];
        v127[2] = v74;
        v75 = [(CEKSlider *)self->_slider centerYAnchor];
        v76 = [v118 centerYAnchor];
        v77 = [v75 constraintEqualToAnchor:v76];
        v127[3] = v77;
        v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:4];
        [(NSMutableArray *)v91 addObjectsFromArray:v78];

        int64_t v79 = [(PUPhotoEditToolController *)self layoutOrientation];
        BOOL v80 = v116 == 4 || v79 == 2;
        double v81 = 1.57079633;
        if (v80) {
          double v81 = -1.57079633;
        }
        CGAffineTransformMakeRotation(&v122, v81);
        v82 = self->_slider;
        CGAffineTransform v121 = v122;
        [(CEKSlider *)v82 setTransform:&v121];
        v28 = v120;
      }
      else
      {
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v123[0] = *MEMORY[0x1E4F1DAB8];
        v123[1] = v10;
        v123[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [(CEKSlider *)slider setTransform:v123];
        v114 = self->_toolConstraints;
        v117 = [(CEKWheelScrubberView *)self->_scrubberView heightAnchor];
        v11 = [v117 constraintEqualToConstant:75.0];
        v132[0] = v11;
        BOOL v12 = [v8 widthAnchor];
        double v13 = [(CEKWheelScrubberView *)self->_scrubberView widthAnchor];
        double v14 = [v12 constraintEqualToAnchor:v13];
        v132[1] = v14;
        id v15 = [v8 centerXAnchor];
        uint64_t v16 = [(CEKWheelScrubberView *)self->_scrubberView centerXAnchor];
        uint64_t v17 = [v15 constraintEqualToAnchor:v16];
        v132[2] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:3];
        [(NSMutableArray *)v114 addObjectsFromArray:v18];

        v96 = self->_toolConstraints;
        v118 = [(CEKSlider *)self->_slider heightAnchor];
        v115 = [v118 constraintEqualToConstant:66.0];
        v131[0] = v115;
        v110 = [(CEKWheelScrubberView *)self->_scrubberView widthAnchor];
        v105 = [(CEKSlider *)self->_slider widthAnchor];
        v100 = [v110 constraintEqualToAnchor:v105];
        v131[1] = v100;
        v92 = [v120 centerXAnchor];
        v19 = [(CEKSlider *)self->_slider centerXAnchor];
        v20 = [v92 constraintEqualToAnchor:v19];
        v131[2] = v20;
        id v21 = [v120 bottomAnchor];
        v22 = [(CEKSlider *)self->_slider bottomAnchor];
        v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
        v131[3] = v23;
        v24 = [(CEKWheelScrubberView *)self->_scrubberView bottomAnchor];
        v25 = [(CEKSlider *)self->_slider topAnchor];
        v26 = [v24 constraintEqualToAnchor:v25 constant:9.0];
        v131[4] = v26;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:5];
        [(NSMutableArray *)v96 addObjectsFromArray:v27];

        v28 = v120;
      }
    }
    else
    {
      v93 = self->_toolConstraints;
      v119 = [v8 leftAnchor];
      v113 = [(CEKWheelScrubberView *)self->_scrubberView leftAnchor];
      v111 = [v119 constraintEqualToAnchor:v113];
      v126[0] = v111;
      v106 = [v8 rightAnchor];
      v97 = [(CEKWheelScrubberView *)self->_scrubberView rightAnchor];
      [v106 constraintEqualToAnchor:v97];
      v30 = int64_t v29 = v8;
      v126[1] = v30;
      v31 = [v8 topAnchor];
      v32 = [(CEKWheelScrubberView *)self->_scrubberView topAnchor];
      [v31 constraintEqualToAnchor:v32];
      v33 = int64_t v101 = v5;
      v126[2] = v33;
      v34 = [v29 bottomAnchor];
      v35 = [(CEKWheelScrubberView *)self->_scrubberView bottomAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];
      v126[3] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:4];
      [(NSMutableArray *)v93 addObjectsFromArray:v37];

      v38 = self->_toolConstraints;
      scrubberView = self->_scrubberView;
      if (v101 != 1 || v7 == 4)
      {
        v118 = [(CEKWheelScrubberView *)scrubberView widthAnchor];
        v40 = [v118 constraintEqualToConstant:75.0];
        v124[0] = v40;
        v28 = v120;
        v41 = [v120 heightAnchor];
        v42 = [(CEKWheelScrubberView *)self->_scrubberView heightAnchor];
        v43 = [v41 constraintEqualToAnchor:v42];
        v124[1] = v43;
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = v124;
      }
      else
      {
        v118 = [(CEKWheelScrubberView *)scrubberView heightAnchor];
        v40 = [v118 constraintEqualToConstant:75.0];
        v125[0] = v40;
        v28 = v120;
        v41 = [v120 widthAnchor];
        v42 = [(CEKWheelScrubberView *)self->_scrubberView widthAnchor];
        v43 = [v41 constraintEqualToAnchor:v42];
        v125[1] = v43;
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = v125;
      }
      v68 = [v44 arrayWithObjects:v45 count:2];
      [(NSMutableArray *)v38 addObjectsFromArray:v68];
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_toolConstraints];
  }
}

- (void)updateViewConstraints
{
  [(PUFilterToolController *)self _updateToolConstraints];
  [(PUFilterToolController *)self _updateBadgeConstraints];
  v3.receiver = self;
  v3.super_class = (Class)PUFilterToolController;
  [(PUFilterToolController *)&v3 updateViewConstraints];
}

- (void)_setThumbnail:(id)a3 forKey:(id)a4
{
}

- (void)_updateCacheWithCIImage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int64_t v5 = [MEMORY[0x1E4F8AA70] standardSupportedEffects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      uint64_t v16 = *MEMORY[0x1E4F1E480];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = [v10 filterIdentifier];
          if (v11)
          {
            id v12 = v4;
            double v13 = (void *)[v10 newEffectFilter];
            double v14 = v13;
            if (v13)
            {
              [v13 setValue:v12 forKey:v16];
              uint64_t v15 = [v14 outputImage];

              id v12 = (id)v15;
            }
            [(NSMutableDictionary *)self->_filterThumbnailCache setObject:v12 forKey:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [(CEKWheelScrubberView *)self->_scrubberView updateItems];
  }
}

- (void)_prepareThumbnailImagesIfNeeded
{
  objc_super v3 = [(PUPhotoEditToolController *)self editSource];
  if (v3)
  {
    id v4 = +[PUPhotoEditProtoSettings sharedInstance];
    int v5 = [v4 enableEnterEditFilterThumbnailGeneration];

    if (v5)
    {
      uint64_t v6 = [(NSMutableDictionary *)self->_filterThumbnailCache count];
      memset(&v41, 0, sizeof(v41));
      uint64_t v7 = [(PUPhotoEditToolController *)self delegate];
      uint64_t v8 = [v7 mediaView];
      double v9 = [v8 player];
      long long v10 = v9;
      if (v9) {
        [v9 currentTime];
      }
      else {
        memset(&v41, 0, sizeof(v41));
      }

      CMTime time2 = v41;
      [(PUPhotoEditToolController *)self originalAssetTimeForDisplayedTime:&time2];
      CMTime v41 = time1;
      if (!v6 || (time1 = (CMTime)self->_thumbnailTime, CMTime time2 = v41, CMTimeCompare(&time1, &time2)))
      {
        self->_thumbnailTime = ($95D729B680665BEAEFA1D6FCA8238556)v41;
        v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v11 scale];
        double v13 = v12;

        double v14 = PLPhotoEditGetLog();
        os_signpost_id_t v15 = os_signpost_id_generate(v14);
        uint64_t v16 = v14;
        long long v17 = v16;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          LOWORD(time1.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FilterThumbnailGeneration", "", (uint8_t *)&time1, 2u);
        }

        uint64_t v18 = [(PUFilterToolController *)self willLoadFilterThumbnails];
        long long v19 = (void *)v18;
        if (v18) {
          (*(void (**)(uint64_t))(v18 + 16))(v18);
        }
        double v20 = v13 * 51.0;
        id v21 = objc_alloc(MEMORY[0x1E4F8AA60]);
        uint64_t v22 = [(PUPhotoEditToolController *)self editSource];
        v23 = (void *)[v21 initWithEditSource:v22];

        v24 = [(PUPhotoEditToolController *)self compositionController];
        v25 = (void *)[v24 copy];

        v26 = [MEMORY[0x1E4F8AA70] effectWithIdentifier:*MEMORY[0x1E4F8B1E8]];
        +[PUPhotoEditEffectsSupport updateCompositionController:v25 withEffect:v26 updateVersion:0];
        v27 = [v25 depthAdjustmentController];
        if ([v27 enabled])
        {
          [v25 adjustmentConstants];
          v28 = v19;
          v30 = os_signpost_id_t v29 = v15;
          [v30 PIDepthAdjustmentKey];
          v35 = v17;
          v31 = v23;
          v33 = v32 = v26;

          os_signpost_id_t v15 = v29;
          long long v19 = v28;
          [v25 removeAdjustmentWithKey:v33];

          v26 = v32;
          v23 = v31;
          long long v17 = v35;
        }
        objc_msgSend(v23, "setCompositionController:", v25, v35);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        void v36[2] = __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke;
        v36[3] = &unk_1E5F2B9F8;
        v36[4] = self;
        v37 = v17;
        os_signpost_id_t v38 = v15;
        CMTime time1 = v41;
        v34 = v17;
        objc_msgSend(v23, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", 1, 0, &time1, @"PUFilterToolController-prepareThumbs", v36, v20, v20);
      }
    }
  }
}

void __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke(void *a1, uint64_t a2)
{
  objc_super v3 = [MEMORY[0x1E4F1E050] imageWithCGImage:a2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke_2;
  v8[3] = &unk_1E5F2DEB0;
  id v4 = (void *)a1[5];
  v8[4] = a1[4];
  id v9 = v3;
  id v5 = v4;
  uint64_t v6 = a1[6];
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCacheWithCIImage:*(void *)(a1 + 40)];
  v2 = *(id *)(a1 + 48);
  objc_super v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FilterThumbnailGeneration", "", v7, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) didFinishLoadingFilterThumbnails];
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

- (void)_updateWithCompositionController:(id)a3
{
  [(PUFilterToolController *)self _prepareThumbnailImagesIfNeeded];
  int64_t v4 = [(PUFilterToolController *)self _adjustedFilterIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = v4;
  }
  [(CEKWheelScrubberView *)self->_scrubberView setSelectedIndex:v5];
  [(CEKWheelScrubberView *)self->_scrubberView setMarkedIndex:-1];
  [(CEKWheelScrubberView *)self->_scrubberView setMarkedIndex:v5];
  [(PUFilterToolController *)self _adjustedFilterIntensity];
  -[CEKSlider setValue:](self->_slider, "setValue:");
  [(PUFilterToolController *)self _updateFilterIntensityCache];
  id v6 = [(PUFilterToolController *)self _effectForIndex:v5];
  [(PUFilterToolController *)self _updateBadgeAndSliderWithEffect:v6];
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v15 = a3;
  if (self->_monitorAdjustmentsForCache) {
    [(NSMutableDictionary *)self->_filterThumbnailCache removeAllObjects];
  }
  int64_t v4 = [(PUPhotoEditToolController *)self compositionController];
  int64_t v5 = [v4 adjustmentConstants];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v5 nonVisualAdjustmentTypes];
  uint64_t v8 = [v6 setWithArray:v7];
  int v9 = [v15 isSubsetOfSet:v8];

  id v10 = [v5 PIEffectAdjustmentKey];
  if ([v15 containsObject:v10])
  {
    int v11 = 1;
  }
  else
  {
    double v12 = [v5 PIEffect3DAdjustmentKey];
    int v11 = [v15 containsObject:v12];
  }
  if ((![(PUPhotoEditToolController *)self isActiveTool] | v9) & 1) != 0 || (v11)
  {
    if (self->_isScrubbing) {
      goto LABEL_15;
    }
    int v14 = self->_isInteractingWithWheelScrubber ? 0 : v11;
    if (v14 != 1) {
      goto LABEL_15;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_filterThumbnailCache removeAllObjects];
  }
  double v13 = [(PUPhotoEditToolController *)self compositionController];
  [(PUFilterToolController *)self _updateWithCompositionController:v13];

LABEL_15:
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUFilterToolController;
  id v7 = a4;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PUFilterToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F2B9D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __77__PUFilterToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1184), "setSelectedIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1184), "selectedIndex"));
  [*(id *)(*(void *)(a1 + 32) + 1192) value];
  v2 = *(void **)(*(void *)(a1 + 32) + 1192);
  return objc_msgSend(v2, "setValue:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  [(PUPhotoEditToolController *)&v5 viewDidDisappear:a3];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_filterBadgeViewConstraints];
  filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
  self->_filterBadgeViewConstraints = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  [(PUPhotoEditToolController *)&v5 viewDidAppear:a3];
  int64_t v4 = [(PUFilterToolController *)self view];
  [v4 setNeedsUpdateConstraints];

  [(CEKSlider *)self->_slider value];
  -[CEKSlider setValue:](self->_slider, "setValue:");
}

- (void)didResignActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PUFilterToolController;
  [(PUPhotoEditToolController *)&v3 didResignActiveTool];
  self->_monitorAdjustmentsForCache = 1;
}

- (void)willBecomeActiveTool
{
  v4.receiver = self;
  v4.super_class = (Class)PUFilterToolController;
  [(PUPhotoEditToolController *)&v4 willBecomeActiveTool];
  self->_monitorAdjustmentsForCache = 0;
  objc_super v3 = [(PUPhotoEditToolController *)self compositionController];
  [(PUFilterToolController *)self _updateWithCompositionController:v3];
}

- (void)decreaseSliderValue:(BOOL)a3
{
  +[PUPhotoEditSupport changeValueOfSlider:self->_slider reverse:0 coarse:a3];
  slider = self->_slider;
  [(PUFilterToolController *)self sliderDidScroll:slider];
}

- (void)increaseSliderValue:(BOOL)a3
{
  +[PUPhotoEditSupport changeValueOfSlider:self->_slider reverse:1 coarse:a3];
  slider = self->_slider;
  [(PUFilterToolController *)self sliderDidScroll:slider];
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  if ([(CEKWheelScrubberView *)self->_scrubberView selectedIndex])
  {
    [(CEKWheelScrubberView *)self->_scrubberView setSelectedIndex:[(CEKWheelScrubberView *)self->_scrubberView selectedIndex] - 1];
    scrubberView = self->_scrubberView;
    [(PUFilterToolController *)self wheelScrubberViewDidChangeSelectedIndex:scrubberView];
  }
}

- (void)increaseScrubberValue:(BOOL)a3
{
  unint64_t v4 = [(CEKWheelScrubberView *)self->_scrubberView itemCount] - 1;
  uint64_t v5 = [(CEKWheelScrubberView *)self->_scrubberView selectedIndex];
  if (v4 >= v5 + 1) {
    unint64_t v4 = v5 + 1;
  }
  if ([(CEKWheelScrubberView *)self->_scrubberView selectedIndex] != v4)
  {
    [(CEKWheelScrubberView *)self->_scrubberView setSelectedIndex:v4];
    scrubberView = self->_scrubberView;
    [(PUFilterToolController *)self wheelScrubberViewDidChangeSelectedIndex:scrubberView];
  }
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  [(PUFilterToolController *)&v5 viewDidLoad];
  objc_super v3 = [(PUFilterToolController *)self view];
  [v3 addSubview:self->_filterBadgeView];
  unint64_t v4 = [(PUPhotoEditToolController *)self toolContainerView];
  [v4 addSubview:self->_slider];
  [v4 addSubview:self->_scrubberView];
}

- (void)_setupSlider
{
  objc_super v3 = +[PUPhotoEditSupport createEditSlider];
  slider = self->_slider;
  self->_slider = v3;

  [(CEKSlider *)self->_slider setDelegate:self];
  [(CEKSlider *)self->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CEKSlider *)self->_slider setMinimumValue:0.0];
  [(CEKSlider *)self->_slider setMaximumValue:1.0];
  [(CEKSlider *)self->_slider setDefaultValue:1.0];
  self->_isSliderTouchDown = 0;
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = self->_slider;
    [(CEKSlider *)v5 setMarkedValue:0.5];
  }
}

- (void)_setupFilters
{
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[PUInterfaceManager currentTheme];
  self->_monitorAdjustmentsForCache = 1;
  unint64_t v4 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v21 = *MEMORY[0x1E4F1E208];
  v22[0] = @"PUFilterToolController";
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v6 = [v4 contextWithOptions:v5];
  context = self->_context;
  self->_context = v6;

  uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  filterThumbnailCache = self->_filterThumbnailCache;
  self->_filterThumbnailCache = v8;

  id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  filterIntensityCache = self->_filterIntensityCache;
  self->_filterIntensityCache = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F57D38]);
  double v13 = (CEKBadgeTextView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  filterBadgeView = self->_filterBadgeView;
  self->_filterBadgeView = v13;

  id v15 = [v3 photoEditingBadgeViewFillColor];
  [(CEKBadgeTextView *)self->_filterBadgeView _setFillColor:v15];

  uint64_t v16 = [v3 photoEditingBadgeViewContentColor];
  [(CEKBadgeTextView *)self->_filterBadgeView _setContentColor:v16];

  [(CEKBadgeTextView *)self->_filterBadgeView _setFillCornerRadius:4.0];
  [MEMORY[0x1E4F57D38] _defaultTextInsets];
  -[CEKBadgeTextView _setTextInsets:](self->_filterBadgeView, "_setTextInsets:", v20 + 1.0, v17 + 3.0, v19 + 1.0, v18 + 3.0);
  [(CEKBadgeTextView *)self->_filterBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_setupScrubber
{
  objc_super v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  formatter = self->_formatter;
  self->_formatter = v3;

  [(NSNumberFormatter *)self->_formatter setMultiplier:&unk_1F078CD58];
  [(NSNumberFormatter *)self->_formatter setRoundingMode:4];
  id v5 = objc_alloc(MEMORY[0x1E4F57D78]);
  id v6 = (CEKWheelScrubberView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  scrubberView = self->_scrubberView;
  self->_scrubberView = v6;

  [(CEKWheelScrubberView *)self->_scrubberView setTransparentGradients];
  [(CEKWheelScrubberView *)self->_scrubberView setDelegate:self];
  [(CEKWheelScrubberView *)self->_scrubberView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [MEMORY[0x1E4F8AA70] standardSupportedEffects];
  -[CEKWheelScrubberView setItemCount:](self->_scrubberView, "setItemCount:", [v8 count]);

  [(CEKWheelScrubberView *)self->_scrubberView setDefaultIndex:0];
  [(CEKWheelScrubberView *)self->_scrubberView setSelectionDotCenterTopSpacing:9.0];
  [(CEKWheelScrubberView *)self->_scrubberView setCornerStyle:1];
  if (objc_opt_respondsToSelector()) {
    [(CEKWheelScrubberView *)self->_scrubberView setUseSelectionLoupeShadow:1];
  }
  [(PUFilterToolController *)self _updateScrubberLayout];
}

- (PUFilterToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUFilterToolController;
  unint64_t v4 = [(PUPhotoEditToolController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4) {
    commonInit_80984(v4);
  }
  return v5;
}

- (PUFilterToolController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUFilterToolController;
  objc_super v3 = [(PUFilterToolController *)&v6 initWithCoder:a3];
  unint64_t v4 = v3;
  if (v3) {
    commonInit_80984(v3);
  }
  return v4;
}

@end