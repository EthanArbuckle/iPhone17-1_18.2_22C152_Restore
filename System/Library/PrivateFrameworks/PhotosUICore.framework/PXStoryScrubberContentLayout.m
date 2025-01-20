@interface PXStoryScrubberContentLayout
- (BOOL)_handleScrollTimeline:(id)a3 inGroup:(id)a4;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)containsFocus;
- (BOOL)shouldSetContentSizeToReferenceSize;
- (CGRect)_frameForSegmentWithIdentifier:(int64_t)a3;
- (CGRect)axFrame;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXGAXResponder)axNextResponder;
- (PXNumberAnimator)timelineTranslationXAnimator;
- (PXNumberAnimator)timelineTranslationYAnimator;
- (PXStoryModel)mainModel;
- (PXStoryPagedTimelineSpec)pagedTimelineSpec;
- (PXStoryScrubberContentLayout)initWithModel:(id)a3;
- (PXStoryScrubberContentLayout)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (double)_displayedContentWidth;
- (double)focusHintTranslationY;
- (id)_assetFetchResultForTimelineIndex:(int64_t)a3;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSpriteIndexes;
- (id)axVisibleSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)mainLayoutSpec;
- (id)preferredFocusLayouts;
- (id)preferredFocusSpriteIndexes;
- (id)supportedResourceKindsForClipLayouts;
- (id)viewLayoutSpec;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)_axScrubberFractionNumerator;
- (int64_t)_currentFocusMode;
- (int64_t)_segmentIdentifierForHostingSpriteIndex:(unsigned int)a3;
- (unint64_t)_axScrubberFractionDenominator;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unsigned)_hostingSpriteIndexForSegmentIdentifier:(int64_t)a3;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (void)_fadeClipLayoutIfNeeded:(id)a3 layoutFrame:(CGRect)a4;
- (void)_invalidateAXSpriteIndexes;
- (void)_invalidateBackground;
- (void)_invalidateContentSize;
- (void)_invalidateCursors;
- (void)_invalidateHostingSpritesFocus;
- (void)_invalidateHostingSpritesLayout;
- (void)_invalidateMainModel;
- (void)_invalidatePagedTimelineSpec;
- (void)_invalidateScrollViewProperties;
- (void)_invalidateTimelineTranslationXAnimator;
- (void)_invalidateTimelineTranslationYAnimator;
- (void)_updateAXSpriteIndexes;
- (void)_updateBackground;
- (void)_updateContentSize;
- (void)_updateCursors;
- (void)_updateHostingSpritesFocus;
- (void)_updateMainModel;
- (void)_updatePagedTimelineSpec;
- (void)_updateScrollViewProperties;
- (void)_updateTimelineTranslationXAnimator;
- (void)_updateTimelineTranslationYAnimator;
- (void)alphaDidChange;
- (void)axDidUpdateFocusInContext:(id)a3;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)configureClipLayout:(id)a3;
- (void)didUpdate;
- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4;
- (void)didUpdateTimelineContent;
- (void)focusableView:(id)a3 didHintFocusMovement:(id)a4;
- (void)focusableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)focusableViewDidUpdateUserInfo:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAxNextResponder:(id)a3;
- (void)setContainsFocus:(BOOL)a3;
- (void)setFocusHintTranslationY:(double)a3;
- (void)setMainModel:(id)a3;
- (void)setPagedTimelineSpec:(id)a3;
- (void)update;
- (void)updateClipsCornerRadius;
- (void)updateDisplayedTimeRange;
- (void)updateDisplayedTimeline;
- (void)updateDisplayedTimelineRect;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXStoryScrubberContentLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_timelineTranslationYAnimator, 0);
  objc_storeStrong((id *)&self->_timelineTranslationXAnimator, 0);
  objc_storeStrong((id *)&self->_pagedTimelineSpec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_segmentIdentifiersToHostingSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_supportedResourceKindsForClipLayouts, 0);
}

- (double)focusHintTranslationY
{
  return self->_focusHintTranslationY;
}

- (BOOL)containsFocus
{
  return self->_containsFocus;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXNumberAnimator)timelineTranslationYAnimator
{
  return self->_timelineTranslationYAnimator;
}

- (PXNumberAnimator)timelineTranslationXAnimator
{
  return self->_timelineTranslationXAnimator;
}

- (void)setPagedTimelineSpec:(id)a3
{
}

- (PXStoryPagedTimelineSpec)pagedTimelineSpec
{
  return self->_pagedTimelineSpec;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (id)supportedResourceKindsForClipLayouts
{
  return self->_supportedResourceKindsForClipLayouts;
}

- (BOOL)_handleScrollTimeline:(id)a3 inGroup:(id)a4
{
  [a3 axFrame];
  if (v5 >= 0.0) {
    uint64_t v6 = v5 > 0.0;
  }
  else {
    uint64_t v6 = -1;
  }
  v7 = [(PXStoryScrubberContentLayout *)self viewModel];
  v8 = [v7 mainModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PXStoryScrubberContentLayout__handleScrollTimeline_inGroup___block_invoke;
  v10[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v10[4] = v6;
  [v8 performChanges:v10];

  return 1;
}

uint64_t __62__PXStoryScrubberContentLayout__handleScrollTimeline_inGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipToSegmentWithOffset:*(void *)(a1 + 32)];
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = PXGAXGetElementForUserInfo(v10);
  v12 = [(PXStoryScrubberContentLayout *)self viewModel];
  v13 = [v12 mainModel];
  if ([v13 viewMode] != 1)
  {

LABEL_8:
    id v16 = [(PXStoryScrubberContentLayout *)self axNextResponder];
    char v17 = [v16 axGroup:v9 didRequestToPerformAction:a4 userInfo:v10];
    goto LABEL_9;
  }
  v14 = [(PXStoryScrubberContentLayout *)self viewModel];
  int v15 = [v14 wantsChromeVisible];

  if (a4 != 4 || !v15) {
    goto LABEL_8;
  }
  id v16 = v9;
  if (!v16)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXStoryScrubberContentLayout.m", 1290, @"%@ should be an instance inheriting from %@, but it is nil", @"axGroup", v22 object file lineNumber description];
LABEL_12:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXStoryScrubberContentLayout.m", 1290, @"%@ should be an instance inheriting from %@, but it is %@", @"axGroup", v22, v24 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_6:
  char v17 = [(PXStoryScrubberContentLayout *)self _handleScrollTimeline:v11 inGroup:v16];
LABEL_9:
  BOOL v18 = v17;

  return v18;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXStoryScrubberContentLayout *)self axNextResponder];
  [v10 axGroup:v9 didChange:a4 userInfo:v8];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryScrubberContentLayout *)self axNextResponder];
  uint64_t v6 = [v5 axContainingScrollViewForAXGroup:v4];

  return v6;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  if (self->_wholeScrubberFocusSpriteIndex == a3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXStoryScrubberContentLayout;
  return -[PXGLayout axFocusabilityForSpriteAtIndex:](&v4, sel_axFocusabilityForSpriteAtIndex_);
}

- (void)axDidUpdateFocusInContext:(id)a3
{
  objc_super v4 = [a3 nextFocusedItem];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = [v5 axContainingGroup];
  v7 = [v6 axInfoSource];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  -[PXStoryScrubberContentLayout setContainsFocus:](self, "setContainsFocus:", [v8 isDescendantOfLayout:self]);
}

- (unint64_t)_axScrubberFractionDenominator
{
  v3 = [(PXStoryScrubberContentLayout *)self viewModel];
  objc_super v4 = [v3 mainModel];
  id v5 = [v4 timeline];
  uint64_t v6 = [v5 lastSegmentIdentifier];

  v7 = [(PXStoryTimelineLayout *)self displayedTimeline];
  uint64_t v8 = [v7 indexOfSegmentWithIdentifier:v6];

  return v8 + 1;
}

- (int64_t)_axScrubberFractionNumerator
{
  v3 = [(PXStoryScrubberContentLayout *)self viewModel];
  objc_super v4 = [v3 mainModel];
  uint64_t v5 = [v4 currentSegmentIdentifier];

  uint64_t v6 = [(PXStoryTimelineLayout *)self displayedTimeline];
  uint64_t v7 = [v6 indexOfSegmentWithIdentifier:v5];

  return v7 + 1;
}

- (CGRect)axFrame
{
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  if (a4 - 4 < 2)
  {
    uint64_t v5 = [(PXStoryScrubberContentLayout *)self axSpriteIndexes];
    unsigned int v6 = [v5 indexGreaterThanIndex:a3];
  }
  else
  {
    if (a4 != 6 && a4 != 3) {
      return -1;
    }
    uint64_t v5 = [(PXStoryScrubberContentLayout *)self axSpriteIndexes];
    unsigned int v6 = [v5 indexLessThanIndex:a3];
  }
  unsigned int v7 = v6;

  return v7;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  _PXGSpriteIndexRange hostingSpritesIndexRange = self->_hostingSpritesIndexRange;
  BOOL v7 = hostingSpritesIndexRange.location > a3;
  unsigned int v6 = hostingSpritesIndexRange.length + hostingSpritesIndexRange.location;
  BOOL v7 = !v7 && v6 > a3;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PXStoryScrubberContentLayout;
    [(PXGLayout *)&v13 axContentInfoAtSpriteIndex:*(void *)&a3];
  }
  else
  {
    if (self->_wholeScrubberFocusSpriteIndex != a3)
    {
      uint64_t v8 = +[PXGReusableAXInfo sharedPool];
      id v9 = [v8 checkOutReusableObjectWithReuseIdentifier:1];

      [v9 setSpriteIndex:v3];
      [(PXGLayout *)self referenceSize];
      PXRectWithOriginAndSize();
    }
    v12.receiver = self;
    v12.super_class = (Class)PXStoryScrubberContentLayout;
    [(PXGLayout *)&v12 axContentInfoAtSpriteIndex:*(void *)&a3];
  id v10 = };
  return v10;
}

- (id)_assetFetchResultForTimelineIndex:(int64_t)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__109512;
  v26 = __Block_byref_object_dispose__109513;
  id v27 = [(PXStoryTimelineLayout *)self displayedTimeline];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  unsigned int v6 = [(PXStoryTimelineLayout *)self displayedTimeline];
  BOOL v7 = v6;
  if (v6)
  {
    [v6 timeRangeForSegmentWithIdentifier:a3];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }

  [(PXStoryTimelineLayout *)self displayedTimelineRect];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__109512;
  char v17 = __Block_byref_object_dispose__109513;
  id v18 = 0;
  uint64_t v8 = (void *)v23[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PXStoryScrubberContentLayout__assetFetchResultForTimelineIndex___block_invoke;
  v12[3] = &unk_1E5DBA9C8;
  v12[4] = self;
  v12[5] = &v22;
  v12[6] = &v13;
  v12[7] = a2;
  v11[0] = v19;
  v11[1] = v20;
  v11[2] = v21;
  objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", v11, v12);
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __66__PXStoryScrubberContentLayout__assetFetchResultForTimelineIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v27 = v13;
    uint64_t v28 = v12;
    uint64_t v29 = v11;
    uint64_t v30 = v10;
    uint64_t v31 = v9;
    uint64_t v32 = v8;
    uint64_t v33 = v7;
    uint64_t v34 = v6;
    uint64_t v35 = v14;
    uint64_t v36 = v15;
    uint64_t v18 = a2;
    do
    {
      long long v20 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "clipWithIdentifier:", *a5, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
      long long v21 = [v20 resource];
      uint64_t v22 = objc_msgSend(v21, "px_storyResourceKind");

      if (v22 == 1)
      {
        v23 = [v20 resource];
        uint64_t v24 = objc_msgSend(v23, "px_storyResourceDisplayAsset");

        uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        *a6 = 1;
      }
      a5 += 96;

      --v18;
    }
    while (v18);
  }
}

- (id)axVisibleSpriteIndexes
{
  v2 = [(PXStoryScrubberContentLayout *)self axSpriteIndexes];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeIndex:1001];
  [v3 removeIndex:1000];
  [v3 removeIndex:1002];
  return v3;
}

- (id)axSpriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ViewModelObservationContext_109515 != a5)
  {
    if ((void *)MainModelObservationContext_109516 != a5)
    {
      if ((void *)TimelineTranslationXAnimatorObservationContext == a5)
      {
        if ((a4 & 2) != 0) {
          [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
        }
      }
      else if ((void *)TimelineTranslationYAnimatorObservationContext == a5)
      {
        if ((a4 & 2) != 0)
        {
          [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
          [(PXStoryScrubberContentLayout *)self _invalidateBackground];
        }
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)PXStoryScrubberContentLayout;
        [(PXStoryModelTimelineLayout *)&v9 observable:v8 didChange:a4 context:a5];
      }
      goto LABEL_31;
    }
    if ((a4 & 0x2000) != 0)
    {
      [(PXStoryScrubberContentLayout *)self _invalidatePagedTimelineSpec];
      [(PXStoryScrubberContentLayout *)self _invalidateContentSize];
      if ((a4 & 0x10) == 0)
      {
LABEL_20:
        if ((a4 & 0x20) == 0) {
          goto LABEL_21;
        }
        goto LABEL_27;
      }
    }
    else if ((a4 & 0x10) == 0)
    {
      goto LABEL_20;
    }
    [(PXStoryScrubberContentLayout *)self _invalidatePagedTimelineSpec];
    if ((a4 & 0x20) == 0)
    {
LABEL_21:
      if ((a4 & 2) == 0) {
        goto LABEL_31;
      }
      goto LABEL_28;
    }
LABEL_27:
    [(PXStoryScrubberContentLayout *)self _invalidateScrollViewProperties];
    [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesFocus];
    if ((a4 & 2) == 0) {
      goto LABEL_31;
    }
LABEL_28:
    [(PXStoryScrubberContentLayout *)self _invalidateScrollViewProperties];
    [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesFocus];
    goto LABEL_31;
  }
  if ((a4 & 0x44020) != 0)
  {
    [(PXStoryScrubberContentLayout *)self _invalidateTimelineTranslationXAnimator];
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
    [(PXStoryScrubberContentLayout *)self _invalidateBackground];
    [(PXStoryScrubberContentLayout *)self _invalidateContentSize];
  }
  if ((a4 & 0x20) != 0)
  {
    [(PXStoryScrubberContentLayout *)self _invalidatePagedTimelineSpec];
    [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
    [(PXStoryScrubberContentLayout *)self _invalidateContentSize];
  }
  if ((a4 & 0x1000404) != 0)
  {
    [(PXStoryScrubberContentLayout *)self _invalidateCursors];
    [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
  }
  if ((a4 & 0x1004020) != 0)
  {
    [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesLayout];
    [(PXStoryScrubberContentLayout *)self _invalidateScrollViewProperties];
  }
  if ((a4 & 0x2000) != 0) {
    [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
  }
  if ((a4 & 0x40) != 0) {
    [(PXStoryScrubberContentLayout *)self _invalidateMainModel];
  }
LABEL_31:
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberContentLayout.m" lineNumber:1066 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberContentLayout.m" lineNumber:1011 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_currentSegmentCursorSpriteIndex == a3)
  {
    id v8 = [MEMORY[0x1E4FB1618] greenColor];
  }
  else if (self->_currentTimeCursorSpriteIndex == a3)
  {
    id v8 = [MEMORY[0x1E4FB1618] redColor];
  }
  else
  {
    if (self->_scrollPositionCursorSpriteIndex != a3)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberContentLayout.m" lineNumber:994 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v8 = [MEMORY[0x1E4FB1618] blueColor];
  }
  objc_super v9 = v8;
  uint64_t v10 = [v8 colorWithAlphaComponent:0.25];

  return v10;
}

- (void)focusableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = objc_msgSend(a4, "nextFocusedItem", a3);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v6;

    if (v7)
    {
      id v8 = [v7 userData];
      uint64_t v9 = [v8 segmentIdentifier];

      uint64_t v10 = [(PXStoryScrubberContentLayout *)self viewModel];
      uint64_t v11 = [v10 mainModel];
      uint64_t v12 = [v11 currentSegmentIdentifier];

      if (v9)
      {
        if (v9 != v12)
        {
          uint64_t v13 = [(PXStoryModelTimelineLayout *)self model];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __95__PXStoryScrubberContentLayout_focusableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
          v14[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
          v14[4] = v9;
          [v13 performChanges:v14];
        }
      }
    }
  }
  else
  {

    id v7 = 0;
  }
}

uint64_t __95__PXStoryScrubberContentLayout_focusableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipToBeginningOfSegmentWithIdentifier:*(void *)(a1 + 32)];
}

- (void)focusableView:(id)a3 didHintFocusMovement:(id)a4
{
  objc_msgSend(a4, "movementDirection", a3);
  [(PXStoryScrubberContentLayout *)self setFocusHintTranslationY:v5 * 12.0];
}

- (void)focusableViewDidUpdateUserInfo:(id)a3
{
  if (self->_isWaitingForFocusableViewUserDataUpdate)
  {
    self->_isWaitingForFocusableViewUserDataUpdate = 0;
    [(PXGLayout *)self setNeedsFocusUpdate];
  }
}

- (id)mainLayoutSpec
{
  v2 = [(PXStoryScrubberContentLayout *)self mainModel];
  uint64_t v3 = [v2 layoutSpec];

  return v3;
}

- (id)viewLayoutSpec
{
  v2 = [(PXStoryScrubberContentLayout *)self viewModel];
  uint64_t v3 = [v2 viewLayoutSpec];

  return v3;
}

- (void)_updateScrollViewProperties
{
  id v2 = +[PXStorySettings sharedInstance];
  [v2 scrubberLayoutStretchesSmallNumberOfAssets];
}

- (void)_invalidateScrollViewProperties
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x8000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x8000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateScrollViewProperties]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 844, @"invalidating %lu after it already has been updated", 0x8000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x8000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateHostingSpritesLayout
{
  ++self->_hostingSpritesMediaVersion;
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x2000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 777, @"invalidating %lu after it already has been updated", 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x2000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateHostingSpritesFocus
{
  if (self->_wholeScrubberFocusSpriteIndex != -1)
  {
    uint64_t v3 = [(PXGLayout *)self localNumberOfSprites];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__PXStoryScrubberContentLayout__updateHostingSpritesFocus__block_invoke;
    v4[3] = &unk_1E5DBA978;
    v4[4] = self;
    [(PXGLayout *)self modifySpritesInRange:v3 << 32 state:v4];
  }
}

uint64_t __58__PXStoryScrubberContentLayout__updateHostingSpritesFocus__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(result + 32);
  unint64_t v6 = *(unsigned int *)(v5 + 1376);
  if (v6 < *(_DWORD *)(v5 + 1380) + (int)v6)
  {
    id v7 = (_WORD *)(a5 + 40 * v6 + 32);
    do
    {
      _WORD *v7 = *(_WORD *)(v5 + 1362);
      v7 += 20;
      ++v6;
      uint64_t v5 = *(void *)(result + 32);
    }
    while (v6 < (*(_DWORD *)(v5 + 1380) + *(_DWORD *)(v5 + 1376)));
  }
  *(_WORD *)(a5 + 40 * *(unsigned int *)(v5 + 1328) + 32) = *(_WORD *)(v5 + 1362);
  return result;
}

- (void)_invalidateHostingSpritesFocus
{
  ++self->_hostingSpritesMediaVersion;
  self->_isWaitingForFocusableViewUserDataUpdate = 1;
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x4000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x4000) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateHostingSpritesFocus]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 759, @"invalidating %lu after it already has been updated", 0x4000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x4000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentSize
{
  uint64_t v3 = +[PXStorySettings sharedInstance];
  int v4 = [v3 scrubberLayoutStretchesSmallNumberOfAssets];

  if (v4)
  {
    [(PXStoryScrubberContentLayout *)self _displayedContentWidth];
    double v6 = v5;
    id v7 = [(PXStoryScrubberContentLayout *)self viewLayoutSpec];
    [v7 scrubberHorizontalLayoutMargin];
    double v9 = v8 + v8;

    [(PXGLayout *)self referenceSize];
    if (v10 >= v6 + v9) {
      double v11 = v10;
    }
    else {
      double v11 = v6 + v9;
    }
    [(PXGLayout *)self referenceSize];
    [(PXGAbsoluteCompositeLayout *)self setContentSize:v11];
  }
}

- (void)_invalidateContentSize
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x1000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 745, @"invalidating %lu after it already has been updated", 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 4096;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (BOOL)shouldSetContentSizeToReferenceSize
{
  return 1;
}

- (void)_updateBackground
{
  uint64_t v3 = +[PXStorySettings sharedInstance];
  int v4 = [v3 scrubberLayoutStretchesSmallNumberOfAssets];

  if (v4)
  {
    double v5 = [(PXStoryModelTimelineLayout *)self model];
    double v6 = [v5 timeline];
    [v6 numberOfSegments];

    id v7 = [(PXStoryScrubberContentLayout *)self timelineTranslationYAnimator];
    [v7 presentationValue];

    [(PXGLayout *)self referenceSize];
    PXRectWithOriginAndSize();
  }
}

float32x2_t __49__PXStoryScrubberContentLayout__updateBackground__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(id *)(a1 + 32) scrubberHorizontalLayoutMargin];
  CGRect v26 = CGRectInset(*(CGRect *)(a1 + 48), v9, 0.0);
  CGFloat x = v26.origin.x;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double v13 = *(double *)(a1 + 80) + v26.origin.y;
  uint64_t v14 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 1312));
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E5DAAF90 + 7);
  v14[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v14[7] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E5DAAF90 + 9);
  v14[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v14[9] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E5DAAF90 + 3);
  v14[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v14[3] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E5DAAF90 + 5);
  v14[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  void v14[5] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v14 = *(_OWORD *)off_1E5DAAF90;
  v14[1] = *(_OWORD *)&v26.origin.y;
  [*(id *)(a1 + 40) alpha];
  *(float *)&double v15 = v15;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 1312)) = LODWORD(v15);
  uint64_t v16 = a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 1312);
  [*(id *)(a1 + 32) scrubberAssetCornerRadius];
  *(float *)&double v17 = v17;
  *(int32x4_t *)(v16 + 36) = vdupq_lane_s32(*(int32x2_t *)&v17, 0);
  if (*(unsigned char *)(a1 + 88)) {
    char v18 = 10;
  }
  else {
    char v18 = 0;
  }
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1312) + 1) = v18;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1312) + 32) = *(_WORD *)(*(void *)(a1 + 40)
                                                                                           + 1360);
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1312)) = 1;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1312) + 34) = 2;
  long long v19 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1312));
  v27.origin.CGFloat x = x;
  v27.origin.y = v13;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.y = v13;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v28);
  v29.origin.CGFloat x = x;
  v29.origin.y = v13;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat v25 = CGRectGetWidth(v29);
  v30.origin.CGFloat x = x;
  v30.origin.y = v13;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v22 = CGRectGetHeight(v30);
  v23.f64[0] = v25;
  v23.f64[1] = v22;
  float32x2_t result = vcvt_f32_f64(v23);
  *(CGFloat *)long long v19 = MidX;
  *(CGFloat *)&v19[1] = MidY;
  v19[2] = (float32x2_t)0x3FB99999A0000000;
  v19[3] = result;
  return result;
}

- (void)_invalidateBackground
{
  ++self->_backgroundMediaVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateBackground]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 710, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateAXSpriteIndexes
{
  uint64_t v3 = [(PXStoryScrubberContentLayout *)self viewModel];
  if ([v3 wantsScrubberVisible])
  {
    int v4 = [(PXStoryScrubberContentLayout *)self viewModel];
    BOOL v5 = [v4 viewMode] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  double v6 = [(PXStoryScrubberContentLayout *)self viewModel];
  id v7 = [v6 mainModel];

  double v8 = [v7 timeline];
  uint64_t v9 = [v7 currentSegmentIdentifier];
  uint64_t v10 = [v8 lastSegmentIdentifier];
  uint64_t v11 = [v8 firstSegmentIdentifier];
  BOOL v12 = v9 != v10 && v5;
  BOOL v13 = v9 != v11 && v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXStoryScrubberContentLayout__updateAXSpriteIndexes__block_invoke;
  aBlock[3] = &unk_1E5DCEAD8;
  aBlock[4] = self;
  uint64_t v14 = (void (**)(void *, BOOL, uint64_t))_Block_copy(aBlock);
  v14[2](v14, v5, 1001);
  v14[2](v14, v12, 1002);
  v14[2](v14, v13, 1000);
}

uint64_t __54__PXStoryScrubberContentLayout__updateAXSpriteIndexes__block_invoke(uint64_t a1, int a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1352);
  if (a2) {
    return objc_msgSend(v2, "addIndex:");
  }
  else {
    return objc_msgSend(v2, "removeIndex:");
  }
}

- (void)_invalidateAXSpriteIndexes
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 679, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryScrubberContentLayout *)self viewModel];
  uint64_t v3 = [v4 mainModel];
  [(PXStoryScrubberContentLayout *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateMainModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 671, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateCursors
{
  uint64_t v3 = [(PXGLayout *)self localNumberOfSprites];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PXStoryScrubberContentLayout__updateCursors__block_invoke;
  v4[3] = &unk_1E5DBA978;
  v4[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v3 << 32 state:v4];
}

void __46__PXStoryScrubberContentLayout__updateCursors__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) model];
  [*(id *)(a1 + 32) referenceDepth];
  double v11 = v10;
  BOOL v12 = [*(id *)(a1 + 32) viewModel];
  int v13 = [v12 isHUDVisible];

  float v14 = 0.0;
  if (v13)
  {
    double v15 = [*(id *)(a1 + 32) viewModel];
    [v15 scrubberVisibilityFraction];
    float v14 = v16;
  }
  double v17 = [v9 timeline];
  memset((char *)&v80[2] + 8, 0, 24);
  if (v9) {
    [v9 nominalPlaybackTime];
  }
  uint64_t v18 = [v9 currentSegmentIdentifier];
  memset(v80, 0, 32);
  long long v79 = 0u;
  if (v17) {
    [v17 timeRangeForSegmentWithIdentifier:v18];
  }
  memset(&v78, 0, sizeof(v78));
  CMTime lhs = *(CMTime *)((char *)&v80[2] + 8);
  *(_OWORD *)&rhs.value = v79;
  rhs.epoch = *(void *)&v80[0];
  CMTimeSubtract(&v78, &lhs, &rhs);
  [*(id *)(a1 + 32) _frameForSegmentWithIdentifier:v18];
  CGFloat v20 = v19;
  double y = v83.origin.y;
  CGFloat width = v83.size.width;
  uint64_t v24 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1316);
  double v64 = v11;
  *(float *)&CGFloat v19 = v11;
  float v25 = -*(float *)&v19;
  v83.origin.CGFloat x = v20;
  v83.size.double height = v26 * 0.25;
  double height = v83.size.height;
  CGFloat MidX = CGRectGetMidX(v83);
  v84.origin.CGFloat x = v20;
  v84.origin.double y = y;
  v84.size.CGFloat width = width;
  v84.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v84);
  double v29 = v25;
  v85.origin.CGFloat x = v20;
  v85.origin.double y = y;
  v85.size.CGFloat width = width;
  v85.size.double height = height;
  CGFloat v76 = CGRectGetWidth(v85);
  v86.origin.CGFloat x = v20;
  v86.origin.double y = y;
  v86.size.CGFloat width = width;
  v86.size.double height = height;
  CGFloat v30 = CGRectGetHeight(v86);
  v31.f64[0] = v76;
  v31.f64[1] = v30;
  *(CGFloat *)uint64_t v24 = MidX;
  *(CGFloat *)(v24 + 8) = MidY;
  *(double *)(v24 + 16) = v29;
  *(float32x2_t *)(v24 + 24) = vcvt_f32_f64(v31);
  uint64_t v32 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1316));
  long long v74 = *((_OWORD *)off_1E5DAAF90 + 1);
  long long v75 = *(_OWORD *)off_1E5DAAF90;
  *uint64_t v32 = *(_OWORD *)off_1E5DAAF90;
  v32[1] = v74;
  long long v72 = *((_OWORD *)off_1E5DAAF90 + 4);
  long long v73 = *((_OWORD *)off_1E5DAAF90 + 5);
  v32[4] = v72;
  v32[5] = v73;
  long long v70 = *((_OWORD *)off_1E5DAAF90 + 2);
  long long v71 = *((_OWORD *)off_1E5DAAF90 + 3);
  v32[2] = v70;
  v32[3] = v71;
  long long v68 = *((_OWORD *)off_1E5DAAF90 + 8);
  long long v69 = *((_OWORD *)off_1E5DAAF90 + 9);
  v32[8] = v68;
  v32[9] = v69;
  long long v66 = *((_OWORD *)off_1E5DAAF90 + 6);
  long long v67 = *((_OWORD *)off_1E5DAAF90 + 7);
  v32[6] = v66;
  v32[7] = v67;
  float v77 = v14;
  *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1316)) = v14;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1316) + 1) = 5;
  __asm { FMOV            V15.2S, #1.0 }
  *(void *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1316) + 8) = _D15;
  CMTime lhs = *(CMTime *)((char *)v80 + 8);
  if (CMTimeGetSeconds(&lhs) != 0.0)
  {
    CMTime lhs = v78;
    CMTimeGetSeconds(&lhs);
    PXClamp();
  }
  CGFloat v38 = y + height;
  uint64_t v39 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1320);
  v87.origin.CGFloat x = v20;
  v87.origin.double y = v38;
  v87.size.CGFloat width = width;
  v87.size.double height = height;
  CGFloat v40 = CGRectGetMidX(v87);
  v88.origin.CGFloat x = v20;
  v88.origin.double y = v38;
  v88.size.CGFloat width = width;
  v88.size.double height = height;
  CGFloat v41 = CGRectGetMidY(v88);
  v89.origin.CGFloat x = v20;
  v89.origin.double y = v38;
  v89.size.CGFloat width = width;
  v89.size.double height = height;
  CGFloat v63 = CGRectGetWidth(v89);
  v90.origin.CGFloat x = v20;
  v90.origin.double y = v38;
  v90.size.CGFloat width = width;
  v90.size.double height = height;
  CGFloat v42 = CGRectGetHeight(v90);
  v43.f64[0] = v63;
  v43.f64[1] = v42;
  *(CGFloat *)uint64_t v39 = v40;
  *(CGFloat *)(v39 + 8) = v41;
  *(double *)(v39 + 16) = v29;
  *(float32x2_t *)(v39 + 24) = vcvt_f32_f64(v43);
  v44 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1320));
  v44[6] = v66;
  v44[7] = v67;
  v44[8] = v68;
  v44[9] = v69;
  v44[2] = v70;
  v44[3] = v71;
  v44[4] = v72;
  v44[5] = v73;
  _OWORD *v44 = v75;
  v44[1] = v74;
  *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1320)) = v77;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1320) + 1) = 5;
  *(void *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1320) + 8) = _D15;
  CGFloat v45 = *MEMORY[0x1E4F1DB28];
  double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v47 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  memset(&lhs, 0, sizeof(lhs));
  if (v9)
  {
    [v9 currentScrollPosition];
    double v49 = v64;
    if (lhs.value)
    {
      objc_msgSend(*(id *)(a1 + 32), "_frameForSegmentWithIdentifier:");
      CGFloat v45 = v50;
      double v46 = v51;
      CGFloat v47 = v52;
      double v48 = v53;
      if (lhs.epoch)
      {
        objc_msgSend(*(id *)(a1 + 32), "_frameForSegmentWithIdentifier:");
        PXRectByLinearlyInterpolatingRects();
      }
    }
  }
  else
  {
    double v49 = v64;
  }
  CGFloat v54 = v48 * 0.5;
  CGFloat v55 = v46 + v54;
  uint64_t v56 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1324);
  float v57 = v49 * -0.5;
  v91.origin.CGFloat x = v45;
  v91.origin.double y = v55;
  v91.size.CGFloat width = v47;
  v91.size.double height = v54;
  CGFloat v58 = CGRectGetMidX(v91);
  v92.origin.CGFloat x = v45;
  v92.origin.double y = v55;
  v92.size.CGFloat width = v47;
  v92.size.double height = v54;
  CGFloat v59 = CGRectGetMidY(v92);
  v93.origin.CGFloat x = v45;
  v93.origin.double y = v55;
  v93.size.CGFloat width = v47;
  v93.size.double height = v54;
  CGFloat v65 = CGRectGetWidth(v93);
  v94.origin.CGFloat x = v45;
  v94.origin.double y = v55;
  v94.size.CGFloat width = v47;
  v94.size.double height = v54;
  CGFloat v60 = CGRectGetHeight(v94);
  v61.f64[0] = v65;
  v61.f64[1] = v60;
  *(CGFloat *)uint64_t v56 = v58;
  *(CGFloat *)(v56 + 8) = v59;
  *(double *)(v56 + 16) = v57;
  *(float32x2_t *)(v56 + 24) = vcvt_f32_f64(v61);
  v62 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1324));
  v62[6] = v66;
  v62[7] = v67;
  v62[8] = v68;
  v62[9] = v69;
  v62[2] = v70;
  v62[3] = v71;
  v62[4] = v72;
  v62[5] = v73;
  _OWORD *v62 = v75;
  v62[1] = v74;
  *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1324)) = v77;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1324) + 1) = 5;
  *(void *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1324) + 8) = _D15;
}

- (void)_invalidateCursors
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateCursors]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 615, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updatePagedTimelineSpec
{
  id v21 = [(PXStoryScrubberContentLayout *)self viewLayoutSpec];
  uint64_t v3 = objc_alloc_init(PXStoryPagedTimelineSpec);
  [v21 scrubberCurrentAssetPadding];
  -[PXStoryPagedTimelineSpec setKeyInterpageSpacing:](v3, "setKeyInterpageSpacing:");
  id v4 = [(PXStoryScrubberContentLayout *)self mainLayoutSpec];
  [v4 scrubberCurrentAssetSize];
  -[PXStoryPagedTimelineSpec setKeyPageSize:](v3, "setKeyPageSize:");

  [v21 scrubberRegularAssetPadding];
  -[PXStoryPagedTimelineSpec setRegularInterpageSpacing:](v3, "setRegularInterpageSpacing:");
  [v21 scrubberRegularAssetSize];
  -[PXStoryPagedTimelineSpec setRegularPageSize:](v3, "setRegularPageSize:");
  [(PXStoryPagedTimelineSpec *)v3 setDisplayOneAssetPerPage:1];
  BOOL v5 = +[PXStorySettings sharedInstance];
  int v6 = [v5 scrubberLayoutStretchesSmallNumberOfAssets];

  if (v6)
  {
    id v7 = [(PXStoryModelTimelineLayout *)self model];
    double v8 = [v7 timeline];
    uint64_t v9 = [v8 numberOfSegments];

    if ((unint64_t)(v9 - 1) >= 0xB)
    {
      if ((unint64_t)(v9 - 12) >= 9) {
        goto LABEL_7;
      }
      [(PXGLayout *)self referenceSize];
      double v15 = v14;
      double v16 = [(PXStoryScrubberContentLayout *)self viewLayoutSpec];
      [v16 scrubberHorizontalLayoutMargin];
      double v18 = v15 + v17 * -2.0;

      [(PXStoryPagedTimelineSpec *)v3 regularInterpageSpacing];
      double v13 = (v18 - v19 * (double)(v9 - 1)) / (double)v9;
      [(PXStoryPagedTimelineSpec *)v3 regularPageSize];
    }
    else
    {
      uint64_t v10 = [(PXStoryPagedTimelineSpec *)v3 regularPageSize];
      double v13 = MEMORY[0x1AD10BC20](v10, 1.77777778, 1.79769313e308, v11);
    }
    double v20 = v12;
    [(PXStoryPagedTimelineSpec *)v3 setKeyPageSize:v13];
    -[PXStoryPagedTimelineSpec setRegularPageSize:](v3, "setRegularPageSize:", v13, v20);
  }
LABEL_7:
  [(PXStoryScrubberContentLayout *)self setPagedTimelineSpec:v3];
}

- (void)_invalidatePagedTimelineSpec
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 577, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTimelineTranslationYAnimator
{
  [(PXStoryScrubberContentLayout *)self focusHintTranslationY];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryScrubberContentLayout__updateTimelineTranslationYAnimator__block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  aBlock[4] = v3;
  id v4 = _Block_copy(aBlock);
  BOOL v5 = [(PXStoryScrubberContentLayout *)self containsFocus];
  int v6 = [(PXStoryScrubberContentLayout *)self timelineTranslationYAnimator];
  id v7 = v6;
  if (v5) {
    [v6 performChangesWithoutAnimation:v4];
  }
  else {
    [v6 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v4 changes:0.0];
  }
}

uint64_t __67__PXStoryScrubberContentLayout__updateTimelineTranslationYAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_invalidateTimelineTranslationYAnimator
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateTimelineTranslationYAnimator]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 561, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTimelineTranslationXAnimator
{
  long long v29 = 0uLL;
  uint64_t v30 = 0;
  uint64_t v3 = [(PXStoryScrubberContentLayout *)self viewModel];
  id v4 = v3;
  if (v3)
  {
    [v3 scrubberPosition];
  }
  else
  {
    long long v29 = 0uLL;
    uint64_t v30 = 0;
  }

  BOOL v5 = (uint64_t *)&v29;
  if (*((double *)&v29 + 1) > 0.5) {
    BOOL v5 = &v30;
  }
  if (*v5)
  {
    int v6 = [PXStoryPagedTimeline alloc];
    id v7 = [(PXStoryModelTimelineLayout *)self model];
    double v8 = [v7 timeline];
    uint64_t v9 = [(PXStoryScrubberContentLayout *)self pagedTimelineSpec];
    long long v27 = v29;
    uint64_t v28 = v30;
    uint64_t v10 = [(PXStoryPagedTimeline *)v6 initWithOriginalTimeline:v8 keyPage:&v27 spec:v9];

    [(PXStoryPagedTimeline *)v10 frameForSegmentWithIdentifier:(void)v29];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(PXStoryPagedTimeline *)v10 frameForSegmentWithIdentifier:v30];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    [(PXGLayout *)self referenceSize];
    v31.origin.CGFloat x = v12;
    v31.origin.double y = v14;
    v31.size.CGFloat width = v16;
    v31.size.double height = v18;
    CGRectGetMidX(v31);
    v32.origin.CGFloat x = v20;
    v32.origin.double y = v22;
    v32.size.CGFloat width = v24;
    v32.size.double height = v26;
    CGRectGetMidX(v32);
    PXFloatByLinearlyInterpolatingFloats();
  }
}

uint64_t __67__PXStoryScrubberContentLayout__updateTimelineTranslationXAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_invalidateTimelineTranslationXAnimator
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout _invalidateTimelineTranslationXAnimator]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberContentLayout.m", 535, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryModelTimelineLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberContentLayout.m", 530, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    int v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryScrubberContentLayout.m", 531, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      CGFloat v16 = [MEMORY[0x1E4F28B00] currentHandler];
      double v17 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXStoryScrubberContentLayout.m", 488, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryScrubberContentLayout *)self _updateTimelineTranslationXAnimator];
      if (!p_updateFlags->isPerformingUpdate)
      {
        CGFloat v38 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v39 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
        [v38 handleFailureInFunction:v39, @"PXStoryScrubberContentLayout.m", 492, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryScrubberContentLayout *)self _updateTimelineTranslationYAnimator];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v18 = [MEMORY[0x1E4F28B00] currentHandler];
      double v19 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXStoryScrubberContentLayout.m", 495, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v6 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryScrubberContentLayout *)self _updateMainModel];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v20 = [MEMORY[0x1E4F28B00] currentHandler];
      double v21 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v20 handleFailureInFunction:v21, @"PXStoryScrubberContentLayout.m", 498, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryScrubberContentLayout *)self _updatePagedTimelineSpec];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v22 = [MEMORY[0x1E4F28B00] currentHandler];
      double v23 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v22 handleFailureInFunction:v23, @"PXStoryScrubberContentLayout.m", 501, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryScrubberContentLayout *)self _updateBackground];
      unint64_t v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      CGFloat v24 = [MEMORY[0x1E4F28B00] currentHandler];
      double v25 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"PXStoryScrubberContentLayout.m", 504, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryModelTimelineLayout *)&v42 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v10 = self->_postUpdateFlags.needsUpdate;
  if (v10)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      CGFloat v26 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v27 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v26 handleFailureInFunction:v27, @"PXStoryScrubberContentLayout.m", 506, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v10 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v10 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryScrubberContentLayout *)self _updateAXSpriteIndexes];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        CGFloat v40 = [MEMORY[0x1E4F28B00] currentHandler];
        CGFloat v41 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
        [v40 handleFailureInFunction:v41, @"PXStoryScrubberContentLayout.m", 510, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v11 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXStoryScrubberContentLayout *)self _updateCursors];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v29 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v28 handleFailureInFunction:v29, @"PXStoryScrubberContentLayout.m", 513, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v12 & 0x1000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXStoryScrubberContentLayout *)self _updateContentSize];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v31 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v30 handleFailureInFunction:v31, @"PXStoryScrubberContentLayout.m", 516, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v13 & 0x2000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFDFFFLL;
      [(PXStoryScrubberContentLayout *)self _updateHostingSpritesLayout];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      CGRect v32 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v33 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v32 handleFailureInFunction:v33, @"PXStoryScrubberContentLayout.m", 519, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x4000uLL;
    if ((v14 & 0x4000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFFFBFFFLL;
      [(PXStoryScrubberContentLayout *)self _updateHostingSpritesFocus];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      [v34 handleFailureInFunction:v35, @"PXStoryScrubberContentLayout.m", 522, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x8000uLL;
    if ((v15 & 0x8000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFF7FFFLL;
      [(PXStoryScrubberContentLayout *)self _updateScrollViewProperties];
      unint64_t v15 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v15)
    {
      uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout update]"];
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"PXStoryScrubberContentLayout.m", 525, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryModelTimelineLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberContentLayout.m", 483, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberContentLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryScrubberContentLayout.m", 484, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (id)preferredFocusSpriteIndexes
{
  if (![(PXStoryScrubberContentLayout *)self _currentFocusMode]
    && self->_wholeScrubberFocusSpriteIndex != -1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28D60]);
    wholeScrubberFocusSpriteIndeCGFloat x = self->_wholeScrubberFocusSpriteIndex;
    goto LABEL_8;
  }
  uint64_t v3 = [(PXStoryScrubberContentLayout *)self viewModel];
  id v4 = [v3 mainModel];
  uint64_t v5 = [v4 currentSegmentIdentifier];

  unsigned int v6 = [(PXStoryScrubberContentLayout *)self _hostingSpriteIndexForSegmentIdentifier:v5];
  if (v6 != -1)
  {
    unsigned int v7 = v6;
    id v8 = objc_alloc(MEMORY[0x1E4F28D60]);
    wholeScrubberFocusSpriteIndeCGFloat x = v7;
LABEL_8:
    id v13 = (id)[v8 initWithIndex:wholeScrubberFocusSpriteIndex];
    goto LABEL_9;
  }
  unint64_t v10 = [(PXStoryModelTimelineLayout *)self model];
  unint64_t v11 = [v10 timeline];
  unsigned int v12 = -[PXStoryScrubberContentLayout _hostingSpriteIndexForSegmentIdentifier:](self, "_hostingSpriteIndexForSegmentIdentifier:", [v11 firstSegmentIdentifier]);

  if (v12 != -1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28D60]);
    wholeScrubberFocusSpriteIndeCGFloat x = v12;
    goto LABEL_8;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F28D60]);
LABEL_9:
  return v13;
}

- (int64_t)_segmentIdentifierForHostingSpriteIndex:(unsigned int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  segmentIdentifiersToHostingSpriteIndexes = self->_segmentIdentifiersToHostingSpriteIndexes;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PXStoryScrubberContentLayout__segmentIdentifierForHostingSpriteIndex___block_invoke;
  v6[3] = &unk_1E5DBA950;
  unsigned int v7 = a3;
  v6[4] = &v8;
  [(NSMutableDictionary *)segmentIdentifiersToHostingSpriteIndexes enumerateKeysAndObjectsUsingBlock:v6];
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __72__PXStoryScrubberContentLayout__segmentIdentifierForHostingSpriteIndex___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if ([a3 unsignedIntValue] == *(_DWORD *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntValue];
    *a4 = 1;
  }
}

- (unsigned)_hostingSpriteIndexForSegmentIdentifier:(int64_t)a3
{
  segmentIdentifiersToHostingSpriteIndexes = self->_segmentIdentifiersToHostingSpriteIndexes;
  int64_t v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)segmentIdentifiersToHostingSpriteIndexes objectForKeyedSubscript:v4];

  if (v5) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = -1;
  }

  return v6;
}

- (id)preferredFocusLayouts
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (int64_t)_currentFocusMode
{
  int64_t v4 = [(PXStoryModelTimelineLayout *)self model];
  uint64_t v5 = [v4 desiredPlayState];

  if (!v5) {
    return 1;
  }
  if (v5 != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberContentLayout.m" lineNumber:428 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (double)_displayedContentWidth
{
  id v2 = [(PXStoryTimelineLayout *)self displayedTimeline];
  objc_msgSend(v2, "frameForSegmentWithIdentifier:", objc_msgSend(v2, "firstSegmentIdentifier"));
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(v2, "frameForSegmentWithIdentifier:", objc_msgSend(v2, "lastSegmentIdentifier"));
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v29.origin.CGFloat x = v4;
  v29.origin.double y = v6;
  v29.size.CGFloat width = v8;
  v29.size.double height = v10;
  double MidX = CGRectGetMidX(v29);
  v30.origin.CGFloat x = v12;
  v30.origin.double y = v14;
  v30.size.CGFloat width = v16;
  v30.size.double height = v18;
  CGFloat v19 = CGRectGetMidX(v30);
  BOOL v20 = MidX <= v19;
  if (MidX <= v19) {
    CGFloat v21 = v12;
  }
  else {
    CGFloat v21 = v4;
  }
  if (v20) {
    double v22 = v14;
  }
  else {
    double v22 = v6;
  }
  if (v20) {
    double v23 = v16;
  }
  else {
    double v23 = v8;
  }
  if (v20) {
    double v24 = v18;
  }
  else {
    double v24 = v10;
  }
  if (!v20)
  {
    CGFloat v4 = v12;
    CGFloat v6 = v14;
    CGFloat v8 = v16;
    CGFloat v10 = v18;
  }
  double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
  v31.origin.CGFloat x = v4;
  v31.origin.double y = v6;
  v31.size.CGFloat width = v8;
  v31.size.double height = v10;
  double v26 = MaxX - CGRectGetMinX(v31);

  return v26;
}

- (void)setFocusHintTranslationY:(double)a3
{
}

- (void)setContainsFocus:(BOOL)a3
{
  if (self->_containsFocus != a3)
  {
    self->_containsFocus = a3;
    [(PXStoryScrubberContentLayout *)self _invalidateTimelineTranslationYAnimator];
  }
}

- (void)setMainModel:(id)a3
{
  CGFloat v8 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  CGFloat v6 = self->_mainModel;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryModel *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryModel *)*p_mainModel unregisterChangeObserver:self context:MainModelObservationContext_109516];
      objc_storeStrong((id *)&self->_mainModel, a3);
      [(PXStoryModel *)*p_mainModel registerChangeObserver:self context:MainModelObservationContext_109516];
      [(PXStoryScrubberContentLayout *)self _invalidatePagedTimelineSpec];
      [(PXStoryScrubberContentLayout *)self _invalidateContentSize];
      [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesLayout];
    }
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryScrubberContentLayout;
  CGFloat v6 = -[PXGLayout hitTestResultForSpriteIndex:](&v21, sel_hitTestResultForSpriteIndex_);
  char v7 = [v6 layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v9 = [v6 layout];
    CGFloat v10 = v9;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    if (v9) {
      [v9 clipTimeRange];
    }
    double v11 = [(PXFeedHitTestResult *)[PXStoryHitTestResult alloc] initWithSpriteIndex:v3 layout:self];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke;
    v14[3] = &unk_1E5DBA928;
    long long v15 = v18;
    long long v16 = v19;
    long long v17 = v20;
    v14[4] = self;
    void v14[5] = a2;
    uint64_t v12 = [(PXFeedHitTestResult *)v11 primaryAction:v14];

    CGFloat v6 = (void *)v12;
  }
  return v6;
}

uint64_t __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  id v2 = [*(id *)(a1 + 32) displayedTimeline];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  v11[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_2;
  _OWORD v11[3] = &unk_1E5DBA8D8;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v11[5] = v15;
  v11[6] = v5;
  v11[4] = v6;
  v10[0] = v4;
  v10[1] = v3;
  v10[2] = *(_OWORD *)(a1 + 80);
  [v2 enumerateSegmentsInTimeRange:v10 usingBlock:v11];

  char v7 = [*(id *)(a1 + 32) model];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_222;
  v9[3] = &unk_1E5DBA900;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v15;
  [v7 performChanges:v9];

  _Block_object_dispose(v15, 8);
  return 1;
}

uint64_t __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  if (a2 != 1) {
    PXAssertGetLog();
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *a4;
  *a5 = 1;
  return result;
}

void __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_222(uint64_t a1, void *a2)
{
  id v8 = a2;
  long long v3 = [*(id *)(a1 + 32) viewModel];
  long long v4 = [v3 mainModel];
  uint64_t v5 = [v4 currentSegmentIdentifier];

  if (v5 != *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    objc_msgSend(v8, "skipToBeginningOfSegmentWithIdentifier:");
  }
  uint64_t v6 = +[PXStorySettings sharedInstance];
  int v7 = [v6 scrubberSelectionStartsPlayback];

  if (v7) {
    [v8 setDesiredPlayState:1];
  }
}

- (void)_fadeClipLayoutIfNeeded:(id)a3 layoutFrame:(CGRect)a4
{
  id v10 = a3;
  uint64_t v5 = +[PXStorySettings sharedInstance];
  uint64_t v6 = [v5 scrubberEdgeFadeMode];
  int v7 = [(PXStoryScrubberContentLayout *)self viewModel];
  id v8 = [v7 viewLayoutSpec];
  [v8 scrubberFadeAreaInsets];

  if (v6 != 1)
  {
    [(PXGLayout *)self alpha];
    if (v9 != 0.0) {
      PXEdgeInsetsIsZero();
    }
  }
}

- (CGRect)_frameForSegmentWithIdentifier:(int64_t)a3
{
  long long v4 = [(PXStoryTimelineLayout *)self displayedTimeline];
  [v4 frameForSegmentWithIdentifier:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)didUpdateTimelineContent
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryTimelineLayout *)&v3 didUpdateTimelineContent];
  [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesLayout];
}

- (void)handleModelChange:(unint64_t)a3
{
  if ((a3 & 0x10) != 0) {
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
  }
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryTimelineLayout *)&v3 alphaDidChange];
  [(PXStoryScrubberContentLayout *)self _invalidateCursors];
  [(PXStoryScrubberContentLayout *)self _invalidateBackground];
  [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesLayout];
}

- (void)updateDisplayedTimelineRect
{
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXGCompositeLayout *)&v3 visibleRectDidChange];
  [(PXStoryModelTimelineLayout *)self invalidateDisplayedRect];
}

- (void)updateDisplayedTimeRange
{
  objc_super v3 = [(PXStoryTimelineLayout *)self displayedTimeline];
  long long v4 = v3;
  if (v3)
  {
    [v3 timeRange];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [(PXStoryTimelineLayout *)self setDisplayedTimeRange:v5];
}

- (void)updateDisplayedTimeline
{
  objc_super v3 = [(PXStoryModelTimelineLayout *)self model];
  long long v4 = [v3 timeline];

  long long v40 = 0uLL;
  CGFloat v41 = 0.0;
  double v5 = [(PXStoryScrubberContentLayout *)self viewModel];
  long long v6 = v5;
  if (v5)
  {
    [v5 scrubberPosition];
  }
  else
  {
    long long v40 = 0uLL;
    CGFloat v41 = 0.0;
  }

  long long v7 = [PXStoryPagedTimeline alloc];
  long long v8 = [(PXStoryScrubberContentLayout *)self pagedTimelineSpec];
  *(_OWORD *)&v39.a = v40;
  v39.c = v41;
  double v9 = [(PXStoryPagedTimeline *)v7 initWithOriginalTimeline:v4 keyPage:&v39 spec:v8];

  double v10 = [(PXStoryScrubberContentLayout *)self timelineTranslationXAnimator];
  [v10 presentationValue];
  double v12 = v11;

  double v13 = [(PXStoryScrubberContentLayout *)self timelineTranslationYAnimator];
  [v13 presentationValue];
  CGFloat v15 = v14;

  [(PXStoryPagedTimeline *)v9 frameForSegmentWithIdentifier:[(PXStoryBaseTimeline *)v9 firstSegmentIdentifier]];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(PXStoryPagedTimeline *)v9 frameForSegmentWithIdentifier:[(PXStoryBaseTimeline *)v9 lastSegmentIdentifier]];
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.CGFloat x = v17;
  v43.origin.double y = v19;
  v43.size.CGFloat width = v21;
  v43.size.double height = v23;
  double MinX = CGRectGetMinX(v43);
  double v26 = +[PXStorySettings sharedInstance];
  LODWORD(v8) = [v26 scrubberLayoutStretchesSmallNumberOfAssets];

  if (v8)
  {
    double v27 = MaxX - MinX;
    uint64_t v28 = [(PXStoryScrubberContentLayout *)self viewLayoutSpec];
    [v28 scrubberHorizontalLayoutMargin];
    double v30 = v29;

    [(PXGLayout *)self referenceSize];
    double v32 = v31 + v30 * -2.0;
    double v33 = (v32 - v27) * 0.5;
    BOOL v34 = v27 > v32;
    double v35 = -0.0;
    if (!v34) {
      double v35 = v33;
    }
    double v12 = v30 + v35;
  }
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeTranslation(&v39, v12, v15);
  uint64_t v36 = [PXStoryTransformedTimeline alloc];
  CGAffineTransform v38 = v39;
  v37 = [(PXStoryTransformedTimeline *)v36 initWithOriginalTimeline:v9 transform:&v38];
  [(PXStoryTimelineLayout *)self setDisplayedTimeline:v37];

  [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeRange];
  [(PXStoryScrubberContentLayout *)self _invalidateCursors];
  [(PXStoryScrubberContentLayout *)self _invalidateContentSize];
  [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
  [(PXStoryScrubberContentLayout *)self _invalidateHostingSpritesLayout];
  [(PXStoryScrubberContentLayout *)self _invalidateScrollViewProperties];
}

- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryScrubberContentLayout;
  id v9 = a3;
  -[PXStoryTimelineLayout didUpdateClipLayout:frame:](&v10, sel_didUpdateClipLayout_frame_, v9, x, y, width, height);
  -[PXStoryScrubberContentLayout _fadeClipLayoutIfNeeded:layoutFrame:](self, "_fadeClipLayoutIfNeeded:layoutFrame:", v9, x, y, width, height, v10.receiver, v10.super_class);
}

- (void)updateClipsCornerRadius
{
  id v7 = [(PXStoryScrubberContentLayout *)self viewLayoutSpec];
  [v7 scrubberAssetCornerRadius];
  *(float *)&double v3 = v3;
  LODWORD(v4) = LODWORD(v3);
  LODWORD(v5) = LODWORD(v3);
  LODWORD(v6) = LODWORD(v3);
  -[PXStoryTimelineLayout setClipsCornerRadius:](self, "setClipsCornerRadius:", v3, v4, v5, v6);
}

- (void)configureClipLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryModelTimelineLayout *)&v8 configureClipLayout:v4];
  [v4 setCanShowDynamicContent:0];
  [v4 setCanShowTextLegibilityEffect:0];
  [v4 setContentPrefersPresentationTypeView:0];
  double v5 = +[PXStorySettings sharedInstance];
  int v6 = [v5 enableScrubberColorNormalization];
  BOOL v7 = 0;
  if (v6) {
    BOOL v7 = objc_msgSend(v5, "colorNormalizationMode", 0) != 0;
  }
  [v4 setCanShowColorNormalizedContent:v7];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryTimelineLayout *)&v3 referenceDepthDidChange];
  [(PXStoryScrubberContentLayout *)self _invalidateCursors];
  [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  [(PXStoryTimelineLayout *)&v3 referenceSizeDidChange];
  [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
  [(PXStoryModelTimelineLayout *)self invalidateDisplayedRect];
  [(PXStoryScrubberContentLayout *)self _invalidateAXSpriteIndexes];
}

- (PXStoryScrubberContentLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  int v6 = [v5 mainModel];
  v22.receiver = self;
  v22.super_class = (Class)PXStoryScrubberContentLayout;
  BOOL v7 = [(PXStoryModelTimelineLayout *)&v22 initWithModel:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    [(PXStoryViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_109515];
    objc_super v8 = +[PXStorySettings sharedInstance];
    int v9 = [v8 scrubberLayoutStretchesSmallNumberOfAssets];

    int v10 = -1;
    if (v9) {
      int v10 = [(PXGLayout *)v7 addSpriteWithInitialState:0];
    }
    v7->_backgroundSpriteIndedouble x = v10;
    v7->_currentSegmentCursorSpriteIndedouble x = [(PXGLayout *)v7 addSpriteWithInitialState:0];
    v7->_currentTimeCursorSpriteIndedouble x = [(PXGLayout *)v7 addSpriteWithInitialState:0];
    v7->_scrollPositionCursorSpriteIndedouble x = [(PXGLayout *)v7 addSpriteWithInitialState:0];
    v7->_wholeScrubberFocusSpriteIndedouble x = -1;
    [(PXGLayout *)v7 setContentSource:v7];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:1];
    supportedResourceKindsForClipLayouts = v7->_supportedResourceKindsForClipLayouts;
    v7->_supportedResourceKindsForClipLayouts = (NSIndexSet *)v11;

    uint64_t v13 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    timelineTranslationXAnimator = v7->_timelineTranslationXAnimator;
    v7->_timelineTranslationXAnimator = (PXNumberAnimator *)v13;

    [(PXNumberAnimator *)v7->_timelineTranslationXAnimator registerChangeObserver:v7 context:TimelineTranslationXAnimatorObservationContext];
    [(PXStoryScrubberContentLayout *)v7 _invalidateTimelineTranslationXAnimator];
    uint64_t v15 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    timelineTranslationYAnimator = v7->_timelineTranslationYAnimator;
    v7->_timelineTranslationYAnimator = (PXNumberAnimator *)v15;

    [(PXNumberAnimator *)v7->_timelineTranslationYAnimator registerChangeObserver:v7 context:TimelineTranslationYAnimatorObservationContext];
    [(PXStoryScrubberContentLayout *)v7 _invalidateTimelineTranslationYAnimator];
    [(PXStoryScrubberContentLayout *)v7 _invalidatePagedTimelineSpec];
    [(PXStoryScrubberContentLayout *)v7 _invalidateMainModel];
    [(PXStoryScrubberContentLayout *)v7 _invalidateBackground];
    [(PXStoryScrubberContentLayout *)v7 _invalidateContentSize];
    CGFloat v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    axSpriteIndexes = v7->_axSpriteIndexes;
    v7->_axSpriteIndexes = v17;

    [(PXStoryScrubberContentLayout *)v7 _invalidateAXSpriteIndexes];
    CGFloat v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    segmentIdentifiersToHostingSpriteIndexes = v7->_segmentIdentifiersToHostingSpriteIndexes;
    v7->_segmentIdentifiersToHostingSpriteIndexes = v19;

    v7->__PXGSpriteIndexRange hostingSpritesIndexRange = (_PXGSpriteIndexRange)[(PXGLayout *)v7 localNumberOfSprites];
    [(PXStoryScrubberContentLayout *)v7 _invalidateHostingSpritesLayout];
    [(PXStoryScrubberContentLayout *)v7 _invalidateScrollViewProperties];
  }

  return v7;
}

- (PXStoryScrubberContentLayout)initWithModel:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryScrubberContentLayout.m", 127, @"%s is not available as initializer", "-[PXStoryScrubberContentLayout initWithModel:]");

  abort();
}

@end