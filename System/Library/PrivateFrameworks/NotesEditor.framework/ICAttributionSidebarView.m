@interface ICAttributionSidebarView
- (BOOL)accessibilityElementsHidden;
- (BOOL)didExpandSidebar;
- (ICAttributionLayoutManager)attributionLayoutManager;
- (ICAttributionSidebarView)init;
- (ICAttributionViewConfiguration)focusedAttributionViewConfiguration;
- (ICAuthorHighlightsUpdater)authorHighlightsUpdater;
- (ICSelectorDelayer)reloadAttributionsDelayer;
- (ICTTTextEditFilter)filter;
- (ICTextView)textView;
- (NSMapTable)attributionViewMap;
- (double)fullContentWidth;
- (double)previewContentWidth;
- (double)visibleContentWidth;
- (void)analyticsSessionWillEnd:(id)a3;
- (void)focusAttributionView:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reload;
- (void)reloadAttributions;
- (void)reloadAttributionsWithCompletion:(id)a3;
- (void)removeAllAttributionViews;
- (void)renderAttributionView:(id)a3;
- (void)renderAttributions;
- (void)scrollToRangeIfNeeded:(_NSRange)a3;
- (void)setAttributionLayoutManager:(id)a3;
- (void)setAttributionViewMap:(id)a3;
- (void)setAuthorHighlightsUpdater:(id)a3;
- (void)setDidExpandSidebar:(BOOL)a3;
- (void)setFilter:(id)a3;
- (void)setFilter:(id)a3 animated:(BOOL)a4;
- (void)setFocusedAttributionViewConfiguration:(id)a3;
- (void)setTextView:(id)a3;
- (void)setVisibleContentWidth:(double)a3;
- (void)setVisibleContentWidth:(double)a3 isGestureActive:(BOOL)a4;
- (void)textViewLayoutDidChange:(id)a3;
- (void)unfocusAttributionDetails;
- (void)willEnterForeground:(id)a3;
@end

@implementation ICAttributionSidebarView

- (void)textViewLayoutDidChange:(id)a3
{
  v4 = [(ICAttributionSidebarView *)self textView];
  v5 = [v4 editorController];
  id v12 = [v5 note];

  if (([(ICAttributionSidebarView *)self isHidden] & 1) == 0
    && [v12 isSharedViaICloud])
  {
    v6 = [(ICAttributionSidebarView *)self textView];
    v7 = [v6 TTTextStorage];
    if ([v7 isEditingTemporaryAttributes])
    {
      v8 = [(ICAttributionSidebarView *)self textView];
      v9 = [v8 TTTextStorage];
      uint64_t v10 = [v9 changeInLength];

      if (v10 < 1) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v11 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v11 requestFire];
  }
LABEL_8:
}

- (double)fullContentWidth
{
  v3 = [(ICAttributionSidebarView *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    return 160.0;
  }
  v7 = [(ICAttributionSidebarView *)self textView];
  [v7 bounds];
  double v9 = v8 * 0.38;

  double v10 = floor(fmin(v9, 160.0));
  int v11 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  double v12 = *MEMORY[0x263F5B5A0];
  if (!v11) {
    double v12 = 0.0;
  }
  return v10 - v12;
}

- (ICTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICTextView *)WeakRetained;
}

- (void)setAuthorHighlightsUpdater:(id)a3
{
}

- (double)visibleContentWidth
{
  return self->_visibleContentWidth;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)ICAttributionSidebarView;
  [(ICAttributionSidebarView *)&v12 layoutSubviews];
  [(ICAttributionSidebarView *)self fullContentWidth];
  double v4 = v3;
  v5 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v5 setPanelWidth:v4];

  [(ICAttributionSidebarView *)self previewContentWidth];
  double v7 = v6;
  double v8 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v8 setPreviewPanelWidth:v7];

  [(ICAttributionSidebarView *)self visibleContentWidth];
  double v10 = v9;
  int v11 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v11 setVisiblePanelWidth:v10];
}

- (ICAttributionLayoutManager)attributionLayoutManager
{
  return self->_attributionLayoutManager;
}

- (void)setTextView:(id)a3
{
  double v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  double v6 = [v4 defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  [v6 removeObserver:self name:@"ICTextViewLayoutDidChangeNotification" object:WeakRetained];

  id v8 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v8, "ic_removeObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral_6);

  id v9 = objc_storeWeak((id *)&self->_textView, v5);
  objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral_6);

  double v10 = [MEMORY[0x263F08A00] defaultCenter];
  id v11 = objc_loadWeakRetained((id *)&self->_textView);
  [v10 addObserver:self selector:sel_textViewLayoutDidChange_ name:@"ICTextViewLayoutDidChangeNotification" object:v11];

  [(ICAttributionSidebarView *)self setHidden:1];
  objc_super v12 = [ICAttributionLayoutManager alloc];
  v13 = [MEMORY[0x263F5ACA0] sharedContext];
  v14 = [v13 workerManagedObjectContext];
  [(ICAttributionSidebarView *)self fullContentWidth];
  double v16 = v15;
  [(ICAttributionSidebarView *)self previewContentWidth];
  v18 = [(ICAttributionLayoutManager *)v12 initWithTextView:v5 managedObjectContext:v14 panelWidth:v16 previewPanelWidth:v17];
  [(ICAttributionSidebarView *)self setAttributionLayoutManager:v18];

  objc_initWeak(&location, self);
  uint64_t v23 = MEMORY[0x263EF8330];
  objc_copyWeak(&v24, &location);
  v19 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v19 setUpdatedConfigurationHandler:&v23];

  v20 = [v5 editorController];
  v21 = [v20 note];
  LODWORD(WeakRetained) = [v21 isSharedViaICloud];

  if (WeakRetained)
  {
    v22 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v22 fireImmediately];
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (double)previewContentWidth
{
  [(ICAttributionSidebarView *)self fullContentWidth];
  return v2 * 0.66;
}

- (void)setAttributionLayoutManager:(id)a3
{
}

void __40__ICAttributionSidebarView_setTextView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained(v7);
        id v11 = [WeakRetained attributionViewMap];
        objc_super v12 = [v11 objectForKey:v9];

        [v12 updatePositionAndVisibility];
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(ICAttributionSidebarView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/Attributions/ICAttributionSidebarView.m"])
  {
    char v13 = [(ICAttributionSidebarView *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];

    if (a6 == &compoundliteral_6 && (v13 & 1) == 0)
    {
      id v14 = [(ICAttributionSidebarView *)self textView];
      if (v14 == v11)
      {
        int v15 = [v10 isEqualToString:@"contentOffset"];

        if (v15)
        {
          long long v16 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
          if ([v16 isScheduledToFire])
          {
            [(ICAttributionSidebarView *)self visibleContentWidth];
            double v18 = v17;

            if (v18 == 0.0)
            {
              v19 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
              [v19 cancelPreviousFireRequests];

              v20 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
              [v20 requestFire];
            }
          }
          else
          {
          }
        }
      }
      else
      {
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICAttributionSidebarView;
    [(ICAttributionSidebarView *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (ICSelectorDelayer)reloadAttributionsDelayer
{
  return self->_reloadAttributionsDelayer;
}

- (ICAttributionSidebarView)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICAttributionSidebarView;
  double v2 = [(ICAttributionSidebarView *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
    attributionViewMap = v2->_attributionViewMap;
    v2->_attributionViewMap = (NSMapTable *)v3;

    id v5 = objc_alloc(MEMORY[0x263F5AEA8]);
    +[ICAttributionsUpdater sidebarClosedRenderDelay];
    uint64_t v6 = objc_msgSend(v5, "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v2, sel_reloadAttributions, 1, 1);
    reloadAttributionsDelayer = v2->_reloadAttributionsDelayer;
    v2->_reloadAttributionsDelayer = (ICSelectorDelayer *)v6;

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel_willEnterForeground_ name:*MEMORY[0x263F833B8] object:0];

    uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_analyticsSessionWillEnd_ name:*MEMORY[0x263F5A758] object:0];
  }
  return v2;
}

- (void)handleTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];

  if (v5)
  {
    [(ICAttributionSidebarView *)self unfocusAttributionDetails];
LABEL_3:
    uint64_t v6 = [(ICAttributionSidebarView *)self textView];
    double v7 = [v6 editorController];
    uint64_t v8 = [v7 eventReporter];

    uint64_t v9 = [(ICAttributionSidebarView *)self textView];
    id v10 = [v9 editorController];
    objc_super v11 = [v10 note];

    if (v11)
    {
      [v8 submitAttributionSideBarViewEventForNote:v11 contextPath:0 startState:3 endState:3];
      [v8 startAttributionSideBarViewEventForNote:v11];
    }

    goto LABEL_6;
  }
  [v4 locationInView:self];
  if (v12 < 0.0 || (double v13 = v12, [(ICAttributionSidebarView *)self bounds], v13 > v14))
  {
    int v15 = [(ICAttributionSidebarView *)self textView];
    long long v16 = [v15 editorController];
    double v17 = [v16 attributionSidebarController];
    [v17 hideSidebarAnimated:1 contextPath:3];

    goto LABEL_10;
  }
  double v18 = [(ICAttributionSidebarView *)self attributionViewMap];
  v19 = [v18 objectEnumerator];
  uint64_t v8 = [v19 allObjects];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__ICAttributionSidebarView_handleTapGesture___block_invoke;
  v22[3] = &unk_2640BB970;
  id v23 = v4;
  uint64_t v20 = objc_msgSend(v8, "ic_objectPassingTest:", v22);
  if (v20)
  {
    objc_super v21 = (void *)v20;
    [(ICAttributionSidebarView *)self focusAttributionView:v20];

    goto LABEL_3;
  }

LABEL_6:
LABEL_10:
}

BOOL __45__ICAttributionSidebarView_handleTapGesture___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [*(id *)(a1 + 32) locationInView:v3];
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  uint64_t v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v9;
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  uint64_t v21 = v15;

  return CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v20);
}

- (void)setVisibleContentWidth:(double)a3 isGestureActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  [(ICAttributionSidebarView *)self setHidden:a3 == 0.0];
  [(ICAttributionSidebarView *)self visibleContentWidth];
  double v8 = v7;
  uint64_t v9 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v9 previewPanelWidth];
  double v11 = v10;

  uint64_t v12 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v12 previewPanelWidth];
  double v14 = v13;

  [(ICAttributionSidebarView *)self visibleContentWidth];
  if (a3 > 0.0 && v15 <= 0.0)
  {
    uint64_t v16 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v16 cancelPreviousFireRequests];

    uint64_t v17 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v17 fireImmediately];
  }
  [(ICAttributionSidebarView *)self setVisibleContentWidth:a3];
  uint64_t v18 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  [v18 setVisiblePanelWidth:a3];

  if (v8 <= v11 && v14 <= a3)
  {
    [(ICAttributionSidebarView *)self setDidExpandSidebar:1];
    +[ICAttributionsUpdater sidebarOpenedRenderDelay];
    double v20 = v19;
    uint64_t v21 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v21 setDelay:v20];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v22 = [(ICAttributionSidebarView *)self attributionViewMap];
    id v23 = [v22 objectEnumerator];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v29 = [v28 configuration];
          [v29 setPreview:0];

          [v28 updateContentAnimated:1];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v25);
    }
  }
  if (a3 == 0.0 && !v4)
  {
    +[ICAttributionsUpdater sidebarClosedRenderDelay];
    double v31 = v30;
    v32 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
    [v32 setDelay:v31];

    [(ICAttributionSidebarView *)self setDidExpandSidebar:0];
    [(ICAttributionSidebarView *)self renderAttributions];
  }
  if (!v4
    || ([(ICAttributionSidebarView *)self authorHighlightsUpdater],
        v33 = objc_claimAutoreleasedReturnValue(),
        [v33 highlightedValue],
        double v35 = v34,
        v33,
        v35 < 1.0))
  {
    v36 = [(ICAttributionSidebarView *)self attributionLayoutManager];
    [v36 preferredHighlightValue];
    double v38 = v37;
    v39 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
    [v39 setHighlightedValue:v38];

    v40 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
    [v40 scheduleUpdateAnimated:!v4];
  }
  dispatchMainAfterDelay();
}

void __67__ICAttributionSidebarView_setVisibleContentWidth_isGestureActive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) authorHighlightsUpdater];
  [v2 setUpdatesVisibleRangesOnly:v1];
}

- (void)reload
{
  id v2 = [(ICAttributionSidebarView *)self reloadAttributionsDelayer];
  [v2 requestFire];
}

- (void)unfocusAttributionDetails
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];

  if (v3)
  {
    [(ICAttributionSidebarView *)self setFocusedAttributionViewConfiguration:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v4 = [(ICAttributionSidebarView *)self attributionViewMap];
    uint64_t v5 = [v4 objectEnumerator];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v11 = [v10 configuration];
          [v11 setBlurred:0];

          uint64_t v12 = [v10 configuration];
          [v12 setFocused:0];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v13 = [(ICAttributionSidebarView *)self attributionViewMap];
    double v14 = [v13 objectEnumerator];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * j) updateContentAnimated:1];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    double v19 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
    [v19 setFocusedRangeValue:0];

    double v20 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
    [v20 scheduleUpdateAnimated:1];
  }
}

- (void)setFilter:(id)a3
{
}

- (void)setFilter:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  filter = self->_filter;
  uint64_t v9 = (ICTTTextEditFilter *)*MEMORY[0x263EFFD08];
  if ((id)*MEMORY[0x263EFFD08] == v6) {
    double v10 = 0;
  }
  else {
    double v10 = v6;
  }
  unint64_t v11 = v10;
  if (v9 == filter) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = filter;
  }
  unint64_t v13 = v12;
  if (v11 | v13)
  {
    double v14 = (void *)v13;
    if (v11) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {

LABEL_15:
      objc_storeStrong((id *)&self->_filter, a3);
      uint64_t v17 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
      [v17 setFilter:v7];

      uint64_t v18 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
      [v18 scheduleUpdateAnimated:1];

      double v19 = [(ICAttributionSidebarView *)self attributionLayoutManager];
      [v19 setFilter:v7];

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __47__ICAttributionSidebarView_setFilter_animated___block_invoke;
      v20[3] = &unk_2640B82D8;
      v20[4] = self;
      id v21 = v7;
      [(ICAttributionSidebarView *)self reloadAttributionsWithCompletion:v20];

      goto LABEL_16;
    }
    char v16 = [(id)v11 isEqual:v13];

    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

void __47__ICAttributionSidebarView_setFilter_animated___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__ICAttributionSidebarView_setFilter_animated___block_invoke_2;
  v2[3] = &unk_2640B82D8;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __47__ICAttributionSidebarView_setFilter_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authorHighlightsUpdater];
  id v8 = [v2 highlightedRangeValue];

  id v3 = v8;
  if (*(void *)(a1 + 40)) {
    BOOL v4 = v8 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v8 rangeValue];
    objc_msgSend(v5, "scrollToRangeIfNeeded:", v6, v7);
    id v3 = v8;
  }
}

- (void)willEnterForeground:(id)a3
{
  [(ICAttributionSidebarView *)self visibleContentWidth];
  double v5 = v4;
  [(ICAttributionSidebarView *)self fullContentWidth];
  if (v5 == v6)
  {
    uint64_t v7 = [(ICAttributionSidebarView *)self textView];
    id v8 = [v7 editorController];
    id v12 = [v8 eventReporter];

    uint64_t v9 = [(ICAttributionSidebarView *)self textView];
    double v10 = [v9 editorController];
    unint64_t v11 = [v10 note];

    if (v11) {
      [v12 startAttributionSideBarViewEventForNote:v11];
    }
  }
}

- (void)analyticsSessionWillEnd:(id)a3
{
  double v4 = [(ICAttributionSidebarView *)self textView];
  double v5 = [v4 editorController];
  id v9 = [v5 eventReporter];

  double v6 = [(ICAttributionSidebarView *)self textView];
  uint64_t v7 = [v6 editorController];
  id v8 = [v7 note];

  if (v8) {
    [v9 submitAttributionSideBarViewEventForNote:v8 contextPath:0 startState:3 endState:3];
  }
}

- (BOOL)accessibilityElementsHidden
{
  [(ICAttributionSidebarView *)self visibleContentWidth];
  double v4 = v3;
  [(ICAttributionSidebarView *)self fullContentWidth];
  return v4 < v5;
}

- (void)reloadAttributionsWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(ICAttributionSidebarView *)self attributionLayoutManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke;
  v7[3] = &unk_2640BB9C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 reloadConfigurationsWithCompletion:v7];
}

void __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  performBlockOnMainThread();
}

uint64_t __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) renderAttributions];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)reloadAttributions
{
}

- (void)renderAttributions
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [(ICAttributionSidebarView *)self removeAllAttributionViews];
  double v3 = [(ICAttributionSidebarView *)self textView];
  id v4 = [v3 editorController];
  double v5 = [v4 note];
  int v6 = [v5 isSharedViaICloud];

  if (v6)
  {
    uint64_t v7 = [(ICAttributionSidebarView *)self attributionLayoutManager];
    id v8 = [v7 viewConfigurations];

    uint64_t v9 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
    if (v9)
    {
      double v10 = (void *)v9;
      unint64_t v11 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
      char v12 = [v8 containsObject:v11];

      if ((v12 & 1) == 0)
      {
        [(ICAttributionSidebarView *)self setFocusedAttributionViewConfiguration:0];
        unint64_t v13 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
        [v13 setFocusedRangeValue:0];

        double v14 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
        [v14 scheduleUpdateAnimated:0];
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v21 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
          uint64_t v22 = [v21 isEqualToAttributionViewConfiguration:v20];

          [v20 setFocused:v22];
          long long v23 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
          if (v23) {
            uint64_t v24 = v22 ^ 1;
          }
          else {
            uint64_t v24 = 0;
          }
          [v20 setBlurred:v24];

          [(ICAttributionSidebarView *)self visibleContentWidth];
          double v26 = v25;
          long long v27 = [(ICAttributionSidebarView *)self attributionLayoutManager];
          [v27 previewPanelWidth];
          [v20 setPreview:v26 < v28];

          v29 = [[ICAttributionView alloc] initWithConfiguration:v20];
          [(ICAttributionSidebarView *)self renderAttributionView:v29];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }
  }
}

- (void)removeAllAttributionViews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(ICAttributionSidebarView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(ICAttributionSidebarView *)self attributionViewMap];
  [v8 removeAllObjects];
}

- (void)focusAttributionView:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 configuration];
  [(ICAttributionSidebarView *)self setFocusedAttributionViewConfiguration:v5];

  uint64_t v6 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
  [v6 setFocused:1];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [(ICAttributionSidebarView *)self attributionViewMap];
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v22 + 1) + 8 * v12);
        if (v13 != v4)
        {
          uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) configuration];
          [v14 setBlurred:1];
        }
        [v13 updateContentAnimated:1];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  id v15 = (void *)MEMORY[0x263F08D40];
  uint64_t v16 = [(ICAttributionSidebarView *)self focusedAttributionViewConfiguration];
  uint64_t v17 = [v16 range];
  double v19 = objc_msgSend(v15, "valueWithRange:", v17, v18);
  double v20 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
  [v20 setFocusedRangeValue:v19];

  id v21 = [(ICAttributionSidebarView *)self authorHighlightsUpdater];
  [v21 scheduleUpdateAnimated:1];
}

- (void)renderAttributionView:(id)a3
{
  id v8 = a3;
  id v4 = [v8 superview];

  if (v4 != self) {
    [(ICAttributionSidebarView *)self addSubview:v8];
  }
  uint64_t v5 = [(ICAttributionSidebarView *)self attributionViewMap];
  uint64_t v6 = [v8 configuration];
  [v5 setObject:v8 forKey:v6];

  [v8 updateContentAnimated:0];
  uint64_t v7 = [v8 configuration];
  [v7 adjustedFrame];
  objc_msgSend(v8, "setFrame:");
}

- (void)scrollToRangeIfNeeded:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __50__ICAttributionSidebarView_scrollToRangeIfNeeded___block_invoke;
    v73[3] = &unk_2640B9640;
    v73[4] = self;
    v73[5] = location;
    v73[6] = length;
    [MEMORY[0x263F82E00] performWithoutAnimation:v73];
    return;
  }
  uint64_t v6 = [(ICAttributionSidebarView *)self textView];
  uint64_t v7 = [v6 textStorage];
  NSUInteger v8 = objc_msgSend(v7, "ic_range");
  NSUInteger v10 = v9;

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v75.NSUInteger location = v8;
    v75.NSUInteger length = v10;
    v76.NSUInteger location = location;
    v76.NSUInteger length = length;
    NSRange v11 = NSUnionRange(v75, v76);
    if (v11.location == v8 && v11.length == v10)
    {
      uint64_t v12 = [(ICAttributionSidebarView *)self textView];
      id v13 = [v12 layoutManager];
      objc_msgSend(v13, "ensureLayoutForCharacterRange:", location, length);

      uint64_t v14 = [(ICAttributionSidebarView *)self textView];
      id v15 = [v14 layoutManager];
      objc_msgSend(v15, "ensureGlyphsForCharacterRange:", location, length);

      uint64_t v16 = [(ICAttributionSidebarView *)self textView];
      objc_msgSend(v16, "ic_rectForRange:", location, length);
      uint64_t v69 = v17;

      uint64_t v18 = [(ICAttributionSidebarView *)self textView];
      [v18 bounds];
      double v20 = v19;
      double v22 = v21;
      double v71 = v23;
      double v25 = v24;
      double v26 = [(ICAttributionSidebarView *)self textView];
      [v26 contentInset];
      double v28 = v27;
      double v30 = v29;
      double v32 = v29 + v31;
      double v34 = v27 + v33;

      uint64_t v35 = [(ICAttributionSidebarView *)self textView];
      v36 = [v35 editorController];
      id v72 = [v36 presentedViewController];

      double v37 = [(ICAttributionSidebarView *)self textView];
      double v38 = 0.0;
      if (objc_msgSend(v37, "ic_hasCompactWidth"))
      {
        v39 = [v72 view];
        v40 = [v39 window];

        if (!v40)
        {
LABEL_10:
          double v42 = v20 + v30;
          double v43 = v25 - v34;
          long long v44 = [(ICAttributionSidebarView *)self textView];
          v45 = [v44 editorController];
          uint64_t v46 = [v45 activityStreamToolbar];

          if (v46)
          {
            v47 = [(ICAttributionSidebarView *)self textView];
            v48 = [v47 editorController];
            v49 = [v48 activityStreamToolbar];
            [v49 frame];
            double v38 = v38 + v50;
          }
          double v51 = v70;
          double v52 = v43 - v38;
          v78.origin.x = 0.0;
          v78.size.width = 0.0;
          v78.size.height = 0.0;
          v77.origin.x = v42;
          v77.origin.y = v22 + v28;
          v77.size.width = v71 - v32;
          v77.size.height = v52;
          v78.origin.y = v70;
          if (!CGRectContainsRect(v77, v78))
          {
            if (v70 <= v22 + v28 + v52)
            {
              double v63 = -44.0;
            }
            else
            {
              v53 = [(ICAttributionSidebarView *)self attributionLayoutManager];
              v54 = [v53 viewConfigurations];
              v55 = [v54 lastObject];
              [v55 associatedTextFrame];
              double v57 = v56;
              double v59 = v58;

              double v60 = v57 + v59 - v70;
              double v61 = v52 + v60;
              BOOL v62 = v60 < v52;
              double v63 = 44.0;
              if (!v62)
              {
                double v63 = -44.0;
                double v61 = 0.0;
              }
              double v51 = v70 - v61;
            }
            double v64 = v63 + v51;
            v65 = [(ICAttributionSidebarView *)self textView];
            [v65 safeAreaInsets];
            double v67 = v64 - v66;

            v68 = [(ICAttributionSidebarView *)self textView];
            objc_msgSend(v68, "setContentOffset:", 0.0, v67);
          }

          return;
        }
        double v37 = [v72 view];
        [v37 frame];
        double v38 = v41 + 0.0;
      }

      goto LABEL_10;
    }
  }
}

void __50__ICAttributionSidebarView_scrollToRangeIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v2, "scrollRangeToVisible:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (ICAuthorHighlightsUpdater)authorHighlightsUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorHighlightsUpdater);

  return (ICAuthorHighlightsUpdater *)WeakRetained;
}

- (void)setVisibleContentWidth:(double)a3
{
  self->_visibleContentWidth = a3;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (NSMapTable)attributionViewMap
{
  return self->_attributionViewMap;
}

- (void)setAttributionViewMap:(id)a3
{
}

- (ICAttributionViewConfiguration)focusedAttributionViewConfiguration
{
  return self->_focusedAttributionViewConfiguration;
}

- (void)setFocusedAttributionViewConfiguration:(id)a3
{
}

- (BOOL)didExpandSidebar
{
  return self->_didExpandSidebar;
}

- (void)setDidExpandSidebar:(BOOL)a3
{
  self->_didExpandSidebar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLayoutManager, 0);
  objc_storeStrong((id *)&self->_focusedAttributionViewConfiguration, 0);
  objc_storeStrong((id *)&self->_reloadAttributionsDelayer, 0);
  objc_storeStrong((id *)&self->_attributionViewMap, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_authorHighlightsUpdater);

  objc_destroyWeak((id *)&self->_textView);
}

@end