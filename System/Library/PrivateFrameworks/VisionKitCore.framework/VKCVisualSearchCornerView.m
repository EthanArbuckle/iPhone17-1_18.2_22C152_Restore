@interface VKCVisualSearchCornerView
- (BOOL)_itemObscuredByViewport:(id)a3;
- (CGRect)normalizedVisibleRect;
- (CGSize)intrinsicContentSize;
- (NSArray)cornerResultItems;
- (NSMutableArray)cornerButtons;
- (NSString)_customAnalyticsIdentifier;
- (VKCImageAnalysis)analysis;
- (VKCVisualSearchCornerView)init;
- (VKCVisualSearchCornerViewDelegate)delegate;
- (double)buttonSpacing;
- (double)windowScale;
- (id)_resultItems;
- (void)_showCornerLookupButtonsForResults:(id)a3;
- (void)_updateButtonFramesWithScale:(double)a3;
- (void)addMetadataToVSFeedbackItem:(id)a3;
- (void)automaticallyShowVisualSearchResultsIfApplicable;
- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5;
- (void)invalidateButtonsForResults;
- (void)lookupButton:(id)a3 didProcessResultWithDuration:(double)a4;
- (void)lookupButton:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)lookupButtonDidDismissController:(id)a3;
- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3;
- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4;
- (void)setAnalysis:(id)a3;
- (void)setCornerButtons:(id)a3;
- (void)setCornerResultItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)set_customAnalyticsIdentifier:(id)a3;
- (void)showVisualSearchResultView;
- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5;
@end

@implementation VKCVisualSearchCornerView

- (VKCVisualSearchCornerView)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VKCVisualSearchCornerView;
  v2 = [(VKCVisualSearchCornerView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_normalizedVisibleRect.origin = (CGPoint)VKMRectUnit;
    v2->_normalizedVisibleRect.size = *(CGSize *)&qword_1DB33EB28;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeChanged_ name:*MEMORY[0x1E4F43788] object:0];

    if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad"))
    {
      v9[0] = objc_opt_class();
      v9[1] = objc_opt_class();
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
      id v6 = (id)[(VKCVisualSearchCornerView *)v3 registerForTraitChanges:v5 withAction:sel_invalidateButtonsForResults];
    }
  }
  return v3;
}

- (void)setAnalysis:(id)a3
{
  v5 = (VKCImageAnalysis *)a3;
  if (self->_analysis != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_analysis, a3);
    id v6 = [(VKCVisualSearchCornerView *)self _resultItems];
    [(VKCVisualSearchCornerView *)self _showCornerLookupButtonsForResults:v6];

    v5 = v7;
  }
}

- (double)windowScale
{
  [(VKCVisualSearchCornerView *)self intrinsicContentSize];
  double v4 = v3;
  [(VKCVisualSearchCornerView *)self bounds];
  return v5 / v4;
}

- (id)_resultItems
{
  v2 = [(VKImageAnalysis *)self->_analysis imageAnalysisResult];
  double v3 = [v2 visualSearchResult];
  double v4 = [v3 resultItems];

  return v4;
}

- (void)automaticallyShowVisualSearchResultsIfApplicable
{
  double v3 = [(VKCVisualSearchCornerView *)self _resultItems];
  double v4 = [v3 firstObject];

  cornerButtons = self->_cornerButtons;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__VKCVisualSearchCornerView_automaticallyShowVisualSearchResultsIfApplicable__block_invoke;
  v8[3] = &unk_1E6BF0A68;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSMutableArray *)cornerButtons vk_objectPassingTest:v8];
  [v7 setShouldShowResultWhenVisible:1];
}

BOOL __77__VKCVisualSearchCornerView_automaticallyShowVisualSearchResultsIfApplicable__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 resultItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_showCornerLookupButtonsForResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "shouldPlaceInCorner", (void)v12) & 1) != 0
          || [(VKCVisualSearchCornerView *)self _itemObscuredByViewport:v11])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (![(NSArray *)self->_cornerResultItems isEqualToArray:v5])
  {
    objc_storeStrong((id *)&self->_cornerResultItems, v5);
    [(VKCVisualSearchCornerView *)self invalidateButtonsForResults];
  }
}

- (void)showVisualSearchResultView
{
  double v3 = [(VKCVisualSearchCornerView *)self _resultItems];
  id v4 = [v3 firstObject];

  cornerButtons = self->_cornerButtons;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__VKCVisualSearchCornerView_showVisualSearchResultView__block_invoke;
  v8[3] = &unk_1E6BF0A68;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSMutableArray *)cornerButtons vk_objectPassingTest:v8];
  [v7 showVisualSearchResultView];
}

BOOL __55__VKCVisualSearchCornerView_showVisualSearchResultView__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 resultItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (double)buttonSpacing
{
  int v3 = objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad");
  double result = 10.0;
  if (v3)
  {
    double v5 = [(VKCVisualSearchCornerView *)self traitCollection];
    int v6 = objc_msgSend(v5, "vk_hasCompactSize");

    double result = 10.0;
    if (v6) {
      return 14.0;
    }
  }
  return result;
}

- (void)invalidateButtonsForResults
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v3 = self->_cornerButtons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  cornerButtons = self->_cornerButtons;
  self->_cornerButtons = v8;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = self->_cornerResultItems;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
        v20 = [VKCCornerLookupButton alloc];
        v21 = -[VKCCornerLookupButton initWithFrame:resultItem:](v20, "initWithFrame:resultItem:", v19, v14, v15, v16, v17, (void)v22);
        [(VKCCornerLookupButton *)v21 setDelegate:self];
        [(VKCVisualSearchCornerView *)self addSubview:v21];
        [(NSMutableArray *)self->_cornerButtons addObject:v21];

        ++v18;
      }
      while (v12 != v18);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }

  [(VKCVisualSearchCornerView *)self windowScale];
  -[VKCVisualSearchCornerView _updateButtonFramesWithScale:](self, "_updateButtonFramesWithScale:");
  [(VKCVisualSearchCornerView *)self invalidateIntrinsicContentSize];
}

- (BOOL)_itemObscuredByViewport:(id)a3
{
  id v4 = a3;
  [(VKCVisualSearchCornerView *)self normalizedVisibleRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 normalizedIconLocation];
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v18.x = v14;
  v18.y = v16;
  return !CGRectContainsPoint(v19, v18);
}

- (CGSize)intrinsicContentSize
{
  double v3 = 0.0;
  if ((unint64_t)[(NSMutableArray *)self->_cornerButtons count] >= 2)
  {
    double v4 = (double)(unint64_t)([(NSMutableArray *)self->_cornerButtons count] - 1);
    [(VKCVisualSearchCornerView *)self buttonSpacing];
    double v3 = v5 * v4;
  }
  CGFloat v6 = [(NSMutableArray *)self->_cornerButtons firstObject];
  [v6 cornerButtonSize];
  double v8 = v7;

  double v9 = v3 + v8 * (double)(unint64_t)[(NSMutableArray *)self->_cornerButtons count];
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateButtonFramesWithScale:(double)a3
{
  [(VKCVisualSearchCornerView *)self buttonSpacing];
  double v5 = v4;
  if ([(NSMutableArray *)self->_cornerButtons count])
  {
    unint64_t v6 = 0;
    do
    {
      double v7 = [(NSMutableArray *)self->_cornerButtons objectAtIndexedSubscript:v6];
      [v7 cornerButtonSize];
      objc_msgSend(v7, "setFrame:", (v5 + v8) * (double)(int)v6, 0.0, v8, v8);

      ++v6;
    }
    while ([(NSMutableArray *)self->_cornerButtons count] > v6);
  }
  [(VKCVisualSearchCornerView *)self frame];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(VKCVisualSearchCornerView *)self intrinsicContentSize];
  VKMRectWithOriginAndSize(v13, v10, v12, v14, v15);
  -[VKCVisualSearchCornerView setFrame:](self, "setFrame:");
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VKCVisualSearchCornerView *)self delegate];
  [v10 generateVisualSearchResultForItems:v9 queryID:a4 completionHandler:v8];
}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VKCVisualSearchCornerView *)self delegate];
  [v11 submitVisualSearchUserFeedbackForReportIdentifier:v10 userFeedbackPayload:v9 sfReportData:v8];
}

- (void)lookupButton:(id)a3 didProcessResultWithDuration:(double)a4
{
  id v6 = [a3 resultItem];
  [(VKCVisualSearchCornerView *)self sendProcessingAnalyticsEventEventWithItem:v6 duration:a4];
}

- (void)lookupButtonDidDismissController:(id)a3
{
  double v4 = [a3 resultItem];
  [(VKCVisualSearchCornerView *)self sendDismissedAnalyticsEventEventWithItem:v4];

  id v5 = [(VKCVisualSearchCornerView *)self delegate];
  [v5 visualSearchCornerViewDidDismissVisualSearchController:self];
}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCVisualSearchCornerView *)self delegate];
  [v5 addMetadataToVSFeedbackItem:v4];
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if (!CGRectEqualToRect(self->_normalizedVisibleRect, a3))
  {
    p_normalizedVisibleRect->origin.CGFloat x = x;
    p_normalizedVisibleRect->origin.CGFloat y = y;
    p_normalizedVisibleRect->size.CGFloat width = width;
    p_normalizedVisibleRect->size.CGFloat height = height;
    id v9 = [(VKCVisualSearchCornerView *)self _resultItems];
    [(VKCVisualSearchCornerView *)self _showCornerLookupButtonsForResults:v9];
  }
}

- (void)lookupButton:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(VKCVisualSearchCornerView *)self delegate];
  objc_msgSend(v9, "visualSearchCornerView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);
}

- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4
{
  id v6 = a3;
  id v11 = [(VKCVisualSearchCornerView *)self _resultItems];
  double v7 = [VKAnalyticsVisualSearchEvent alloc];
  id v8 = [(VKCVisualSearchCornerView *)self _customAnalyticsIdentifier];
  id v9 = [(VKAnalyticsVisualSearchEvent *)v7 initWithType:2 items:v11 interactedItem:v6 serverProcessingTime:v8 customIdentifier:a4];

  id v10 = [(VKCVisualSearchCornerView *)self delegate];
  [v10 visualSearchCornerView:self analyticsEventDidOccur:v9];
}

- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3
{
  id v4 = a3;
  id v9 = [(VKCVisualSearchCornerView *)self _resultItems];
  id v5 = [VKAnalyticsVisualSearchEvent alloc];
  id v6 = [(VKCVisualSearchCornerView *)self _customAnalyticsIdentifier];
  double v7 = [(VKAnalyticsVisualSearchEvent *)v5 initWithType:3 items:v9 interactedItem:v4 serverProcessingTime:v6 customIdentifier:0.0];

  id v8 = [(VKCVisualSearchCornerView *)self delegate];
  [v8 visualSearchCornerView:self analyticsEventDidOccur:v7];
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (CGRect)normalizedVisibleRect
{
  double x = self->_normalizedVisibleRect.origin.x;
  double y = self->_normalizedVisibleRect.origin.y;
  double width = self->_normalizedVisibleRect.size.width;
  double height = self->_normalizedVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (VKCVisualSearchCornerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCVisualSearchCornerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)cornerResultItems
{
  return self->_cornerResultItems;
}

- (void)setCornerResultItems:(id)a3
{
}

- (NSMutableArray)cornerButtons
{
  return self->_cornerButtons;
}

- (void)setCornerButtons:(id)a3
{
}

- (NSString)_customAnalyticsIdentifier
{
  return self->__customAnalyticsIdentifier;
}

- (void)set_customAnalyticsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_cornerButtons, 0);
  objc_storeStrong((id *)&self->_cornerResultItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end