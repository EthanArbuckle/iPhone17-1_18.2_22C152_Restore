@interface VKCImageVisualSearchView
- (BOOL)_shouldShowPulsingDot:(id)a3;
- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3;
- (BOOL)didAddVisualSearchCornerView;
- (BOOL)shouldAutomaticallyShowVisualSearchResult;
- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (NSMutableArray)resultViews;
- (NSMutableSet)cachedResultItemsWithFocalDot;
- (VKCImageVisualSearchView)init;
- (VKCImageVisualSearchViewDelegate)delegate;
- (VKCVisualSearchResult)visualSearchResult;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)topResultView;
- (id)visualSearchItemAtPoint:(CGPoint)a3;
- (void)_layoutResultViews;
- (void)addMetadataToVSFeedbackItem:(id)a3;
- (void)animateDotsIn;
- (void)automaticallyShowVisualSearchResults;
- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5;
- (void)hideDots;
- (void)layoutSubviews;
- (void)presentVisualSearchForItem:(id)a3;
- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3;
- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4;
- (void)setCachedResultItemsWithFocalDot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddVisualSearchCornerView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)setResultViews:(id)a3;
- (void)setShouldAutomaticallyShowVisualSearchResult:(BOOL)a3;
- (void)setVisualSearchResult:(id)a3;
- (void)showTopVisualSearchResult;
- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5;
- (void)triggerTapToRadar;
- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4;
- (void)updateVisibleItems;
- (void)visualSearchItemView:(id)a3 didProcessResultsWithDuration:(double)a4;
- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)visualSearchItemViewDidActivateVSItem:(id)a3;
- (void)visualSearchItemViewDidDismissController:(id)a3;
@end

@implementation VKCImageVisualSearchView

- (VKCImageVisualSearchView)init
{
  v5.receiver = self;
  v5.super_class = (Class)VKCImageVisualSearchView;
  v2 = [(VKCImageVisualSearchView *)&v5 init];
  v3 = v2;
  if (v2) {
    -[VKCImageVisualSearchView setNormalizedVisibleRect:](v2, "setNormalizedVisibleRect:", 0.0, 0.0, 1.0, 1.0);
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageVisualSearchView;
  [(VKCImageVisualSearchView *)&v3 layoutSubviews];
  [(VKCImageVisualSearchView *)self _layoutResultViews];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VKCImageVisualSearchView *)self frame];
  if (!VKMNearlyEqualRects(v8, v9, v10, v11, x, y, width, height)) {
    [(VKCImageVisualSearchView *)self _layoutResultViews];
  }
  v12.receiver = self;
  v12.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)_layoutResultViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setNeedsLayout];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (VKCImageVisualSearchView *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    long long v7 = 0;
  }
  else {
    long long v7 = v5;
  }
  long long v8 = v7;

  return v8;
}

- (void)triggerTapToRadar
{
  id v2 = [(VKCImageVisualSearchView *)self delegate];
  [v2 triggerTapToRadar];
}

- (void)setVisualSearchResult:(id)a3
{
  uint64_t v6 = (VKCVisualSearchResult *)a3;
  if (self->_visualSearchResult != v6)
  {
    objc_storeStrong((id *)&self->_visualSearchResult, a3);
    if (([(VKCImageVisualSearchView *)self isHidden] & 1) == 0)
    {
      [(VKPlatformView *)self vk_alpha];
      if (v5 > 0.0)
      {
        [(VKCImageVisualSearchView *)self updateUIForVisualSearchResultsClearExistingResults:1 includeNotVisibleItems:0];
        [(VKCImageVisualSearchView *)self animateDotsIn];
      }
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(VKCImageVisualSearchView *)self isHidden];
  v6.receiver = self;
  v6.super_class = (Class)VKCImageVisualSearchView;
  [(VKCImageVisualSearchView *)&v6 setHidden:v3];
  if (v3)
  {
    [(VKCImageVisualSearchView *)self hideDots];
  }
  else if (v5)
  {
    [(VKCImageVisualSearchView *)self updateUIForVisualSearchResultsClearExistingResults:1 includeNotVisibleItems:0];
    [(VKCImageVisualSearchView *)self animateDotsIn];
  }
}

- (void)animateDotsIn
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = dbl_1DB33EB60[!self->_shouldAutomaticallyShowVisualSearchResult];
  uint64_t v4 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = -1;
    do
    {
      long long v8 = [(VKCImageVisualSearchView *)self resultViews];
      long long v9 = [(VKCImageVisualSearchView *)self resultViews];
      objc_super v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") + v7);

      [v10 beginAnimatingDotAfterDelay:v3 + (double)(int)v6 * 0.4];
      ++v6;
      double v11 = [(VKCImageVisualSearchView *)self resultViews];
      unint64_t v12 = [v11 count];

      --v7;
    }
    while (v12 > v6);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v19 = [(VKCImageVisualSearchView *)self resultViews];
        objc_msgSend(v18, "performSelector:withObject:afterDelay:", sel_didFinishAnimatingDots, 0, v3 + (double)(unint64_t)objc_msgSend(v19, "count") * 0.4);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)hideDots
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) hideDots];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v20, sel_setNormalizedVisibleRect_, x, y, width, height);
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  if (!VKMNearlyEqualRects(v9, v11, v13, v15, v16, v17, v18, v19)) {
    [(VKCImageVisualSearchView *)self updateUIForVisualSearchResultsClearExistingResults:0 includeNotVisibleItems:0];
  }
}

- (void)updateVisibleItems
{
}

- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    cachedResultItemsWithFocalDot = self->_cachedResultItemsWithFocalDot;
    self->_cachedResultItemsWithFocalDot = 0;
  }
  long long v7 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v8 = [(VKCVisualSearchResult *)self->_visualSearchResult resultItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        if ([(VKCImageVisualSearchView *)self didAddVisualSearchCornerView]
          && [(VKCImageVisualSearchView *)self _shouldShowPulsingDot:v13]
          || ![(VKCImageVisualSearchView *)self didAddVisualSearchCornerView]
          || v4)
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v10);
  }

  if ([v7 isEqualToSet:self->_cachedResultItemsWithFocalDot])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v14 = [(VKCImageVisualSearchView *)self resultViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * j), "vk_setNeedsLayout");
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v16);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedResultItemsWithFocalDot, v7);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v19 = [(VKCImageVisualSearchView *)self resultViews];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * k) removeFromSuperview];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v21);
    }

    v24 = [MEMORY[0x1E4F1CA48] array];
    [(VKCImageVisualSearchView *)self setResultViews:v24];

    double v14 = [v7 allObjects];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v34 = v7;
    id v25 = v7;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v35 + 1) + 8 * m);
          v31 = [[VKCVisualSearchResultItemView alloc] initWithVisualSearchResultItem:v30];
          [(VKCVisualSearchResultItemView *)v31 setDelegate:self];
          if ([(VKCImageVisualSearchView *)self isHidden]) {
            [(VKCVisualSearchResultItemView *)v31 hideDots];
          }
          v32 = [(VKCImageVisualSearchView *)self delegate];
          -[VKCVisualSearchResultItemView setHidden:](v31, "setHidden:", [v32 visualSearchView:self shouldShowDotForItem:v30 allItems:v14] ^ 1);

          [(VKCImageVisualSearchView *)self addSubview:v31];
          v33 = [(VKCImageVisualSearchView *)self resultViews];
          [v33 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v27);
    }

    long long v7 = v34;
  }
}

- (id)topResultView
{
  uint64_t v3 = [(VKCVisualSearchResult *)self->_visualSearchResult resultItems];
  BOOL v4 = [v3 firstObject];

  uint64_t v5 = [(VKCImageVisualSearchView *)self resultViews];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__VKCImageVisualSearchView_topResultView__block_invoke;
  v9[3] = &unk_1E6BF2958;
  id v10 = v4;
  id v6 = v4;
  long long v7 = objc_msgSend(v5, "vk_objectPassingTest:", v9);

  return v7;
}

BOOL __41__VKCImageVisualSearchView_topResultView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 visualSearchResultItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)automaticallyShowVisualSearchResults
{
  [(VKCImageVisualSearchView *)self updateUIForVisualSearchResultsClearExistingResults:1 includeNotVisibleItems:0];
  id v4 = [(VKCImageVisualSearchView *)self topResultView];
  [v4 setAutomaticallyShowVisualSearchResults:1];
  uint64_t v3 = [v4 visualSearchResultItem];
  [v3 setCurrentInvocationType:4];

  self->_shouldAutomaticallyShowVisualSearchResult = v4 != 0;
  if (([(VKCImageVisualSearchView *)self isHidden] & 1) == 0) {
    [(VKCImageVisualSearchView *)self animateDotsIn];
  }
}

- (void)showTopVisualSearchResult
{
  id v2 = [(VKCImageVisualSearchView *)self topResultView];
  [v2 showVisualResultsPane];
}

- (void)presentVisualSearchForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageVisualSearchView *)self resultViews];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke;
  v14[3] = &unk_1E6BF2958;
  id v6 = v4;
  id v15 = v6;
  long long v7 = objc_msgSend(v5, "vk_objectPassingTest:", v14);

  if (!v7)
  {
    [(VKCImageVisualSearchView *)self updateUIForVisualSearchResultsClearExistingResults:1 includeNotVisibleItems:1];
    double v8 = [(VKCImageVisualSearchView *)self resultViews];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke_2;
    double v12 = &unk_1E6BF2958;
    id v13 = v6;
    long long v7 = objc_msgSend(v8, "vk_objectPassingTest:", &v9);
  }
  objc_msgSend(v7, "showVisualResultsPane", v9, v10, v11, v12);
}

BOOL __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 visualSearchResultItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 visualSearchResultItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageVisualSearchView *)self delegate];
  [v5 addMetadataToVSFeedbackItem:v4];
}

- (BOOL)_shouldShowPulsingDot:(id)a3
{
  id v4 = a3;
  if ([v4 shouldPlaceInCorner])
  {
    BOOL v5 = 0;
  }
  else
  {
    [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v4 normalizedIconLocation];
    v17.double x = v14;
    v17.double y = v15;
    v18.origin.double x = v7;
    v18.origin.double y = v9;
    v18.size.double width = v11;
    v18.size.double height = v13;
    BOOL v5 = CGRectContainsPoint(v18, v17);
  }

  return v5;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[VKCImageVisualSearchView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        if (objc_msgSend(v11, "containsVisualSearchItemAtPoint:"))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)visualSearchItemAtPoint:(CGPoint)a3
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__9;
  CGRect v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FF0000000000000;
  uint64_t v8 = [(VKCImageVisualSearchView *)self visualSearchResult];
  uint64_t v9 = [v8 resultItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__VKCImageVisualSearchView_visualSearchItemAtPoint___block_invoke;
  v12[3] = &unk_1E6BF2980;
  v12[6] = v5;
  v12[7] = v7;
  v12[4] = v13;
  v12[5] = &v14;
  [v9 enumerateObjectsUsingBlock:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __52__VKCImageVisualSearchView_visualSearchItemAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 normalizedIconLocation];
  double v5 = v4;
  double v7 = v6;
  if (([v9 shouldPlaceInCorner] & 1) == 0)
  {
    [v9 normalizedBoundingBox];
    if (CGRectContainsPoint(v11, *(CGPoint *)(a1 + 48)))
    {
      double v8 = VKMDistance(v5, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
      if (v8 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
      }
    }
  }
}

- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  -[VKCImageVisualSearchView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [(VKCImageVisualSearchView *)self delegate];
  char v13 = objc_msgSend(v12, "visualSearchItemView:shouldBeginAtPoint:", v7, v9, v11);

  return v13;
}

- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = [(VKCImageVisualSearchView *)self delegate];
  objc_msgSend(v10, "visualSearchItemView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", v9, x, y, width, height);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v11 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v17 + 1) + 8 * v15);
        if (v16 != v9) {
          [v16 setPulsing:0];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)visualSearchItemViewDidActivateVSItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageVisualSearchView *)self delegate];
  [v5 visualSearchItemViewDidActivateVSItem:v4];
}

- (void)visualSearchItemViewDidDismissController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VKCImageVisualSearchView *)self delegate];
  [v5 visualSearchItemViewDidDismissController:v4];

  double v6 = [v4 visualSearchResultItem];
  [(VKCImageVisualSearchView *)self sendDismissedAnalyticsEventEventWithItem:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(VKCImageVisualSearchView *)self resultViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setPulsing:1];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VKCImageVisualSearchView *)self delegate];
  [v10 generateVisualSearchResultForItems:v9 queryID:a4 completionHandler:v8];
}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VKCImageVisualSearchView *)self delegate];
  [v11 submitVisualSearchUserFeedbackForReportIdentifier:v10 userFeedbackPayload:v9 sfReportData:v8];
}

- (void)visualSearchItemView:(id)a3 didProcessResultsWithDuration:(double)a4
{
  id v6 = [a3 visualSearchResultItem];
  [(VKCImageVisualSearchView *)self sendProcessingAnalyticsEventEventWithItem:v6 duration:a4];
}

- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4
{
  id v6 = a3;
  id v7 = [(VKCImageVisualSearchView *)self visualSearchResult];
  id v12 = [v7 resultItems];

  id v8 = [VKAnalyticsVisualSearchEvent alloc];
  id v9 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  id v10 = [(VKAnalyticsVisualSearchEvent *)v8 initWithType:2 items:v12 interactedItem:v6 serverProcessingTime:v9 customIdentifier:a4];

  id v11 = [(VKCImageVisualSearchView *)self delegate];
  [v11 visualSearchView:self analyticsEventOccured:v10];
}

- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageVisualSearchView *)self visualSearchResult];
  id v10 = [v5 resultItems];

  id v6 = [VKAnalyticsVisualSearchEvent alloc];
  id v7 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  id v8 = [(VKAnalyticsVisualSearchEvent *)v6 initWithType:3 items:v10 interactedItem:v4 serverProcessingTime:v7 customIdentifier:0.0];

  id v9 = [(VKCImageVisualSearchView *)self delegate];
  [v9 visualSearchView:self analyticsEventOccured:v8];
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (VKCImageVisualSearchViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCImageVisualSearchViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (void)setDidAddVisualSearchCornerView:(BOOL)a3
{
  self->_didAddVisualSearchCornerView = a3;
}

- (NSMutableArray)resultViews
{
  return self->_resultViews;
}

- (void)setResultViews:(id)a3
{
}

- (BOOL)shouldAutomaticallyShowVisualSearchResult
{
  return self->_shouldAutomaticallyShowVisualSearchResult;
}

- (void)setShouldAutomaticallyShowVisualSearchResult:(BOOL)a3
{
  self->_shouldAutomaticallyShowVisualSearchResult = a3;
}

- (NSMutableSet)cachedResultItemsWithFocalDot
{
  return self->_cachedResultItemsWithFocalDot;
}

- (void)setCachedResultItemsWithFocalDot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResultItemsWithFocalDot, 0);
  objc_storeStrong((id *)&self->_resultViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
}

@end