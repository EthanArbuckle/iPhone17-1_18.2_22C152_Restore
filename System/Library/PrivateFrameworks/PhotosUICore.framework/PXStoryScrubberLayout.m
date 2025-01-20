@interface PXStoryScrubberLayout
- (BOOL)_shouldEnableFocusGuide;
- (BOOL)allowsRepeatedSublayoutsUpdates;
- (BOOL)disableDebugAssertionForSublayoutUpdates;
- (BOOL)isHidden;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSDate)currentSkipSegmentActionDate;
- (NSDate)lastScrubbedDate;
- (NSNumber)alphaOverride;
- (PXStoryModel)mainModel;
- (PXStoryScrubberContentLayout)contentLayout;
- (PXStoryScrubberLayout)init;
- (PXStoryScrubberLayout)initWithViewModel:(id)a3;
- (PXStoryScrubberScrollLayout)scrollLayout;
- (PXStoryViewModel)viewModel;
- (id)axSpriteIndexes;
- (id)preferredFocusLayouts;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unsigned)focusGuideContentVersion;
- (void)_invalidateFocusGuide;
- (void)_invalidateLastScrubbedDate;
- (void)_invalidateMainModel;
- (void)_invalidateSkipSegmentActionDate;
- (void)_invalidateSublayouts;
- (void)_invalidateSublayoutsAlpha;
- (void)_invalidateVisibilityFraction;
- (void)_invalidateWantsVisible;
- (void)_loadSublayoutsIfNeeded;
- (void)_loadTVSublayoutsIfNeeded;
- (void)_updateFocusGuide;
- (void)_updateLastScrubbedDate;
- (void)_updateMainModel;
- (void)_updateSkipSegmentActionDate;
- (void)_updateSublayouts;
- (void)_updateSublayoutsAlpha;
- (void)_updateVisibilityFraction;
- (void)_updateWantsVisible;
- (void)alphaDidChange;
- (void)didUpdate;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAlphaOverride:(id)a3;
- (void)setContentLayout:(id)a3;
- (void)setCurrentSkipSegmentActionDate:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setFocusGuideContentVersion:(unsigned __int16)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setLastScrubbedDate:(id)a3;
- (void)setMainModel:(id)a3;
- (void)setScrollLayout:(id)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryScrubberLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_contentLayout, 0);
  objc_storeStrong((id *)&self->_lastScrubbedDate, 0);
  objc_storeStrong((id *)&self->_currentSkipSegmentActionDate, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setFocusGuideContentVersion:(unsigned __int16)a3
{
  self->_focusGuideContentVersion = a3;
}

- (unsigned)focusGuideContentVersion
{
  return self->_focusGuideContentVersion;
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (void)setScrollLayout:(id)a3
{
}

- (PXStoryScrubberScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (void)setContentLayout:(id)a3
{
}

- (PXStoryScrubberContentLayout)contentLayout
{
  return self->_contentLayout;
}

- (NSDate)lastScrubbedDate
{
  return self->_lastScrubbedDate;
}

- (NSDate)currentSkipSegmentActionDate
{
  return self->_currentSkipSegmentActionDate;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (id)axSpriteIndexes
{
  if (self->_focusGuideSpriteIndex == -1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)preferredFocusLayouts
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryScrubberLayout *)self contentLayout];
  if (v3)
  {
    v4 = [(PXStoryScrubberLayout *)self contentLayout];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v11 = a3;
  if ((void *)ViewModelObservationContext_155227 == a5)
  {
    if ((a4 & 0x800000) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateLastScrubbedDate];
    }
    if ((a4 & 0x4000000A008) != 0 && !self->_isUpdatingWantsVisible) {
      [(PXStoryScrubberLayout *)self _invalidateWantsVisible];
    }
    if ((a4 & 0x1000000) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateVisibilityFraction];
    }
    if ((a4 & 0x4000000) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateSkipSegmentActionDate];
    }
    if ((a4 & 0x2000048) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateSublayouts];
    }
    if ((a4 & 0x40) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateMainModel];
    }
    uint64_t v9 = 16818184;
  }
  else
  {
    if ((void *)MainModelObservationContext_155228 != a5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberLayout.m" lineNumber:426 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 0x400000000000000) != 0) {
      [(PXStoryScrubberLayout *)self _invalidateWantsVisible];
    }
    uint64_t v9 = 34;
  }
  if ((a4 & v9) != 0) {
    [(PXStoryScrubberLayout *)self _invalidateFocusGuide];
  }
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_focusGuideSpriteIndex != a3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberLayout.m" lineNumber:389 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  uint64_t v9 = objc_alloc_init(PXGFocusGuideViewConfiguration);
  v10 = PXGDeepestPreferredFocusEnvironmentsForLayout(self);
  [(PXGFocusGuideViewConfiguration *)v9 setPreferredFocusEnvironments:v10];

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_focusGuideSpriteIndex != a3)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberLayout.m" lineNumber:379 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  uint64_t v9 = objc_opt_class();

  return (Class)v9;
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  if (a3)
  {
    v5 = NSNumber;
    [a3 scrubberAlpha];
    objc_msgSend(v5, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PXStoryScrubberLayout *)self setAlphaOverride:v6];
  }
  else
  {
    -[PXStoryScrubberLayout setAlphaOverride:](self, "setAlphaOverride:");
  }
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  [(PXGLayout *)self alpha];
  objc_msgSend(v5, "setScrubberAlpha:");
}

- (BOOL)_shouldEnableFocusGuide
{
  id v2 = [(PXStoryScrubberLayout *)self viewModel];
  if ([v2 viewMode] == 1 && objc_msgSend(v2, "wantsChromeVisible")) {
    int v3 = [v2 wantsRelatedOverlayVisible] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)_updateFocusGuide
{
  if (self->_focusGuideSpriteIndex != -1)
  {
    [(PXGLayout *)self referenceSize];
    PXRectWithOriginAndSize();
  }
}

float32x2_t __42__PXStoryScrubberLayout__updateFocusGuide__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1044));
  long long v10 = *((_OWORD *)off_1E5DAAF90 + 7);
  v9[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v9[7] = v10;
  long long v11 = *((_OWORD *)off_1E5DAAF90 + 9);
  v9[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v9[9] = v11;
  long long v12 = *((_OWORD *)off_1E5DAAF90 + 3);
  v9[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v9[3] = v12;
  long long v13 = *((_OWORD *)off_1E5DAAF90 + 5);
  v9[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v9[5] = v13;
  long long v14 = *((_OWORD *)off_1E5DAAF90 + 1);
  *uint64_t v9 = *(_OWORD *)off_1E5DAAF90;
  v9[1] = v14;
  [*(id *)(a1 + 32) alpha];
  *(float *)&double v15 = v15;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1044)) = LODWORD(v15);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1044) + 32) = [*(id *)(a1 + 32) focusGuideContentVersion];
  if ([*(id *)(a1 + 32) _shouldEnableFocusGuide]) {
    char v16 = 10;
  }
  else {
    char v16 = 0;
  }
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1044) + 1) = v16;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1044)) = 1;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1044) + 34) = 2;
  v17 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1044));
  CGFloat v18 = *(double *)(a1 + 40);
  CGFloat v19 = *(double *)(a1 + 48);
  CGFloat v20 = *(double *)(a1 + 56);
  CGFloat v21 = *(double *)(a1 + 64);
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  CGFloat MidX = CGRectGetMidX(v28);
  v29.origin.x = v18;
  v29.origin.y = v19;
  v29.size.width = v20;
  v29.size.height = v21;
  CGFloat MidY = CGRectGetMidY(v29);
  v30.origin.x = v18;
  v30.origin.y = v19;
  v30.size.width = v20;
  v30.size.height = v21;
  CGFloat Width = CGRectGetWidth(v30);
  v31.origin.x = v18;
  v31.origin.y = v19;
  v31.size.width = v20;
  v31.size.height = v21;
  CGFloat Height = CGRectGetHeight(v31);
  v25.f64[0] = Width;
  v25.f64[1] = Height;
  float32x2_t result = vcvt_f32_f64(v25);
  *(CGFloat *)v17 = MidX;
  *(CGFloat *)&v17[1] = MidY;
  v17[2] = 0;
  v17[3] = result;
  return result;
}

- (void)_invalidateFocusGuide
{
  if (self->_focusGuideSpriteIndex != -1)
  {
    [(PXStoryScrubberLayout *)self setFocusGuideContentVersion:(unsigned __int16)([(PXStoryScrubberLayout *)self focusGuideContentVersion] + 1)];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x80) != 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateFocusGuide]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXStoryScrubberLayout.m", 339, @"invalidating %lu after it already has been updated", 128);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 128;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateVisibilityFraction
{
  if ([(PXStoryScrubberLayout *)self isHidden])
  {
    [(PXGLayout *)self setAlpha:0.0];
  }
  else
  {
    id v3 = [(PXStoryScrubberLayout *)self viewModel];
    [v3 scrubberVisibilityFraction];
    -[PXGLayout setAlpha:](self, "setAlpha:");
  }
}

- (void)_invalidateVisibilityFraction
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateVisibilityFraction]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 327, @"invalidating %lu after it already has been updated", 8);

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

- (void)_updateWantsVisible
{
  BOOL isUpdatingWantsVisible = self->_isUpdatingWantsVisible;
  self->_BOOL isUpdatingWantsVisible = 1;
  v4 = [(PXStoryScrubberLayout *)self viewModel];
  id v5 = +[PXStorySettings sharedInstance];
  uint64_t v6 = [v5 scrubberDisplayMode];
  if (v6)
  {
    BOOL v7 = v6 == 1;
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [v4 viewMode];
    char v10 = [v4 wantsChromeVisible];
    char v11 = [v4 wantsRelatedOverlayVisible];
    long long v12 = [v4 mainModel];
    [v12 desiredInfoPanelVisibilityFraction];
    double v14 = v13;

    if (v14 == 1.0) {
      char v8 = 0;
    }
    else {
      char v8 = v10;
    }
    if (v11) {
      char v8 = 0;
    }
    BOOL v7 = v9 == 1;
  }
  if (!v7) {
    char v8 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__PXStoryScrubberLayout__updateWantsVisible__block_invoke;
  v15[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
  char v16 = v8;
  [v4 performChanges:v15];
  self->_BOOL isUpdatingWantsVisible = isUpdatingWantsVisible;
}

uint64_t __44__PXStoryScrubberLayout__updateWantsVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsScrubberVisible:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateWantsVisible
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateWantsVisible]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 292, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateLastScrubbedDate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [(PXStoryScrubberLayout *)self setLastScrubbedDate:v3];
}

- (void)_invalidateLastScrubbedDate
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateLastScrubbedDate]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 284, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateSkipSegmentActionDate
{
  id v4 = [(PXStoryScrubberLayout *)self viewModel];
  id v3 = [v4 lastSkipSegmentActionDate];
  [(PXStoryScrubberLayout *)self setCurrentSkipSegmentActionDate:v3];
}

- (void)_invalidateSkipSegmentActionDate
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateSkipSegmentActionDate]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 276, @"invalidating %lu after it already has been updated", 1);

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

- (void)_updateSublayoutsAlpha
{
  [(PXGLayout *)self alpha];
  double v4 = v3;
  id v5 = [(PXStoryScrubberLayout *)self alphaOverride];
  id v9 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v4 = v6;
  }
  BOOL v7 = [(PXGSplitLayout *)self firstSublayout];
  [v7 setAlpha:v4];

  char v8 = [(PXGSplitLayout *)self secondSublayout];
  [v8 setAlpha:v4];
}

- (void)_invalidateSublayoutsAlpha
{
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateSublayoutsAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 259, @"invalidating %lu after it already has been updated", 32);

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

- (void)_loadSublayoutsIfNeeded
{
  id v20 = [(PXStoryScrubberLayout *)self viewModel];
  double v3 = [(PXStoryScrubberLayout *)self contentLayout];
  id v4 = [v3 viewModel];
  if (v4 == v20)
  {
    id v5 = [(PXStoryScrubberLayout *)self contentLayout];
    float v6 = [v5 model];
    BOOL v7 = [v20 mainModel];

    if (v6 == v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  char v8 = [[PXStoryScrubberContentLayout alloc] initWithViewModel:v20];
  [(PXStoryScrubberLayout *)self setContentLayout:v8];

  id v9 = [(PXStoryScrubberLayout *)self contentLayout];
  [(PXGSplitLayout *)self setFirstSublayout:v9];

LABEL_5:
  char v10 = [(PXStoryScrubberLayout *)self scrollLayout];
  id v11 = [v10 viewModel];
  if (v11 == v20)
  {
    long long v12 = [(PXStoryScrubberLayout *)self scrollLayout];
    double v13 = [v12 model];
    double v14 = [v20 mainModel];

    if (v13 == v14) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  double v15 = [PXStoryScrubberScrollLayout alloc];
  char v16 = [v20 mainModel];
  v17 = [(PXStoryScrubberScrollLayout *)v15 initWithViewModel:v20 model:v16];

  CGFloat v18 = [[PXGScrollLayout alloc] initWithContentLayout:v17];
  [(PXGScrollLayout *)v18 setDelegate:v17];
  [(PXGScrollLayout *)v18 setShowsHorizontalScrollIndicator:0];
  [(PXGScrollLayout *)v18 setShowsVerticalScrollIndicator:0];
  [(PXGScrollLayout *)v18 setDraggingPerformsScroll:1];
  [(PXGLayout *)self referenceDepth];
  *(float *)&double v19 = v19;
  [(PXGScrollLayout *)v18 setScrollViewSpriteZPosition:v19];
  [(PXGSplitLayout *)self setSecondSublayout:v18];
  [(PXStoryScrubberLayout *)self setScrollLayout:v17];

LABEL_9:
}

- (void)_loadTVSublayoutsIfNeeded
{
  id v13 = [(PXStoryScrubberLayout *)self viewModel];
  double v3 = [(PXStoryScrubberLayout *)self contentLayout];
  id v4 = [v3 viewModel];
  if (v4 == v13)
  {
    id v5 = [(PXStoryScrubberLayout *)self contentLayout];
    float v6 = [v5 model];
    BOOL v7 = [v13 mainModel];

    if (v6 == v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  char v8 = [[PXStoryScrubberContentLayout alloc] initWithViewModel:v13];
  [(PXStoryScrubberLayout *)self setContentLayout:v8];

  id v9 = [PXGScrollLayout alloc];
  char v10 = [(PXStoryScrubberLayout *)self contentLayout];
  id v11 = [(PXGScrollLayout *)v9 initWithContentLayout:v10];

  [(PXGScrollLayout *)v11 setClipsToBounds:0];
  [(PXGScrollLayout *)v11 setShowsHorizontalScrollIndicator:0];
  [(PXGScrollLayout *)v11 setShowsVerticalScrollIndicator:0];
  [(PXGScrollLayout *)v11 setDraggingPerformsScroll:1];
  [(PXGLayout *)self referenceDepth];
  *(float *)&double v12 = v12;
  [(PXGScrollLayout *)v11 setScrollViewSpriteZPosition:v12];
  [(PXGSplitLayout *)self setFirstSublayout:v11];

LABEL_5:
}

- (void)_updateSublayouts
{
  id v4 = [(PXStoryScrubberLayout *)self viewModel];
  if (([v4 wantsChromeVisible] & 1) != 0
    || ([v4 wantsScrubberVisible] & 1) != 0
    || ([(PXGSplitLayout *)self firstSublayout],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(PXStoryScrubberLayout *)self _loadSublayoutsIfNeeded];
  }
  [(PXStoryScrubberLayout *)self _invalidateSublayoutsAlpha];
}

- (void)_invalidateSublayouts
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 204, @"invalidating %lu after it already has been updated", 16);

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

- (void)_updateMainModel
{
  id v4 = [(PXStoryScrubberLayout *)self viewModel];
  double v3 = [v4 mainModel];
  [(PXStoryScrubberLayout *)self setMainModel:v3];
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout _invalidateMainModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberLayout.m", 196, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberLayout;
  [(PXGSplitLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberLayout.m", 192, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXStoryScrubberLayout.m", 161, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 64;
    if ((needsUpdate & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryScrubberLayout *)self _updateMainModel];
      if (!p_updateFlags->isPerformingUpdate)
      {
        CGRect v28 = [MEMORY[0x1E4F28B00] currentHandler];
        CGRect v29 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
        [v28 handleFailureInFunction:v29, @"PXStoryScrubberLayout.m", 165, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v5)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryScrubberLayout *)self _updateSkipSegmentActionDate];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v14 handleFailureInFunction:v15, @"PXStoryScrubberLayout.m", 168, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryScrubberLayout *)self _updateLastScrubbedDate];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      char v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXStoryScrubberLayout.m", 171, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryScrubberLayout *)self _updateWantsVisible];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v18 = [MEMORY[0x1E4F28B00] currentHandler];
      double v19 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXStoryScrubberLayout.m", 174, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryScrubberLayout *)self _updateVisibilityFraction];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v21 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v20 handleFailureInFunction:v21, @"PXStoryScrubberLayout.m", 177, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryScrubberLayout *)self _updateSublayouts];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v22 handleFailureInFunction:v23, @"PXStoryScrubberLayout.m", 180, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v10 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryScrubberLayout *)self _updateSublayoutsAlpha];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      float64x2_t v25 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      [v24 handleFailureInFunction:v25, @"PXStoryScrubberLayout.m", 183, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v11 & 0x80) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXStoryScrubberLayout *)self _updateFocusGuide];
      unint64_t v11 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v11)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout update]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXStoryScrubberLayout.m", 186, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)PXStoryScrubberLayout;
  [(PXGSplitLayout *)&v30 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberLayout;
  [(PXGSplitLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberLayout.m", 157, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)setMainModel:(id)a3
{
  objc_super v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    unint64_t v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:MainModelObservationContext_155228];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:MainModelObservationContext_155228];
    [(PXStoryScrubberLayout *)self _invalidateWantsVisible];
    objc_super v5 = v7;
  }
}

- (void)setAlphaOverride:(id)a3
{
  unint64_t v7 = (NSNumber *)a3;
  objc_super v5 = self->_alphaOverride;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      [(PXStoryScrubberLayout *)self _invalidateSublayoutsAlpha];
    }
  }
}

- (BOOL)disableDebugAssertionForSublayoutUpdates
{
  return 1;
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return 1;
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryScrubberLayout *)self _invalidateSublayoutsAlpha];
  [(PXStoryScrubberLayout *)self _invalidateFocusGuide];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  [(PXGSplitLayout *)&v3 referenceDepthDidChange];
  [(PXStoryScrubberLayout *)self _invalidateFocusGuide];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  [(PXGSplitLayout *)&v3 referenceSizeDidChange];
  [(PXStoryScrubberLayout *)self _invalidateFocusGuide];
}

- (void)setLastScrubbedDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastScrubbedDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastScrubbedDate, a3);
    [(PXStoryScrubberLayout *)self _invalidateWantsVisible];
  }
}

- (void)setCurrentSkipSegmentActionDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_currentSkipSegmentActionDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_currentSkipSegmentActionDate, a3);
    [(PXStoryScrubberLayout *)self _invalidateWantsVisible];
  }
}

- (void)setIsHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    self->_isHidden = a3;
    [(PXStoryScrubberLayout *)self _invalidateVisibilityFraction];
  }
}

- (PXStoryScrubberLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryScrubberLayout;
  char v6 = [(PXGLayout *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [v5 registerChangeObserver:v7 context:ViewModelObservationContext_155227];
    [(PXGSplitLayout *)v7 setMode:5];
    [(PXGLayout *)v7 setContentSource:v7];
    v7->_focusGuideSpriteIndex = -1;
    [(PXStoryScrubberLayout *)v7 _invalidateMainModel];
    [(PXStoryScrubberLayout *)v7 _invalidateSublayouts];
    [(PXStoryScrubberLayout *)v7 _invalidateVisibilityFraction];
    [(PXStoryScrubberLayout *)v7 _invalidateWantsVisible];
    [(PXStoryScrubberLayout *)v7 _invalidateFocusGuide];
  }

  return v7;
}

- (PXStoryScrubberLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryScrubberLayout.m", 58, @"%s is not available as initializer", "-[PXStoryScrubberLayout init]");

  abort();
}

@end