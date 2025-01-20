@interface VKCCornerLookupButton
- (BOOL)didProcessResult;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)isShowingVisualResultsPane;
- (BOOL)observingInteractionDidFinish;
- (BOOL)shouldShowResultWhenVisible;
- (NSString)currentRVItemID;
- (UIButton)button;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (VKCCornerLookupButton)initWithFrame:(CGRect)a3 resultItem:(id)a4;
- (VKCCornerLookupButtonDelegate)delegate;
- (VKCVisualSearchResult)result;
- (VKCVisualSearchResultItem)resultItem;
- (double)buttonHeight;
- (double)buttonWidth;
- (double)contentSizeScaleFactor;
- (double)cornerButtonSize;
- (id)_backgroundColorBehindText;
- (id)_defaultSymbolName;
- (id)_queryString;
- (id)_symbolNameForItem;
- (id)imageForButton;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)queryForProcessingResult;
- (void)_didDismissVisualResultsPane:(id)a3;
- (void)_setupButton;
- (void)_setupGestures;
- (void)_updateImage;
- (void)dealloc;
- (void)didDismissVisualResultsPane;
- (void)didMoveToWindow;
- (void)didTap;
- (void)setButton:(id)a3;
- (void)setButtonHeight:(double)a3;
- (void)setButtonWidth:(double)a3;
- (void)setCurrentRVItemID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidProcessResult:(BOOL)a3;
- (void)setIsShowingVisualResultsPane:(BOOL)a3;
- (void)setObservingInteractionDidFinish:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setResultItem:(id)a3;
- (void)setShouldShowResultWhenVisible:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)showLookupUIPaneForResultItem;
- (void)showVisualSearchResultView;
- (void)updateIndicatorDotForState;
@end

@implementation VKCCornerLookupButton

- (void)dealloc
{
  if (!self->_observingInteractionDidFinish)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = getkDDRVInteractionDidFinishNotification();
    [v3 removeObserver:self name:v4 object:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)VKCCornerLookupButton;
  [(VKCCornerLookupButton *)&v5 dealloc];
}

- (VKCCornerLookupButton)initWithFrame:(CGRect)a3 resultItem:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VKCCornerLookupButton;
  v10 = -[VKCCornerLookupButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(VKCCornerLookupButton *)v10 setResultItem:v9];
    [(VKCCornerLookupButton *)v11 _setupGestures];
    [(VKCCornerLookupButton *)v11 setAccessibilityIdentifier:@"com.apple.visionkit.visualSearchCornerIndicator"];
    if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad"))
    {
      v12 = [(VKCCornerLookupButton *)v11 traitCollection];
      if (objc_msgSend(v12, "vk_hasCompactWidth")) {
        double v13 = 32.0;
      }
      else {
        double v13 = 40.0;
      }
    }
    else
    {
      double v13 = 32.0;
    }
    v11->_buttonWidth = v13;
    v11->_buttonHeight = v13;
    [(VKCCornerLookupButton *)v11 cornerButtonSize];
    -[VKCCornerLookupButton setFrame:](v11, "setFrame:", 0.0, 0.0, v14, v14);
    [(VKCCornerLookupButton *)v11 _setupButton];
  }

  return v11;
}

- (void)didMoveToWindow
{
  v3 = [(VKCCornerLookupButton *)self window];
  if (v3
    && (v12 = v3,
        BOOL v4 = [(VKCCornerLookupButton *)self shouldShowResultWhenVisible],
        v3 = v12,
        v4))
  {
    BOOL isShowingVisualResultsPane = self->_isShowingVisualResultsPane;

    if (!isShowingVisualResultsPane)
    {
      [(VKCCornerLookupButton *)self bounds];
      -[VKCCornerLookupButton convertPoint:toView:](self, "convertPoint:toView:", 0);
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      v10 = [(VKCCornerLookupButton *)self window];
      [v10 bounds];
      v14.double x = v7;
      v14.double y = v9;
      BOOL v11 = CGRectContainsPoint(v15, v14);

      if (v11)
      {
        [(VKCCornerLookupButton *)self showVisualSearchResultView];
      }
    }
  }
  else
  {
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(VKCCornerLookupButton *)self tapGestureRecognizer];

  return v6 == v5;
}

- (void)_setupGestures
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
  [(VKCCornerLookupButton *)self addInteraction:v3];
}

- (id)imageForButton
{
  id v3 = (void *)MEMORY[0x1E4F42A80];
  BOOL v4 = [(VKCCornerLookupButton *)self _symbolNameForItem];
  id v5 = objc_msgSend(v3, "vk_symbolImageWithName:", v4);

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F42A80];
    CGFloat v7 = [(VKCCornerLookupButton *)self _defaultSymbolName];
    id v5 = objc_msgSend(v6, "vk_symbolImageWithName:", v7);
  }
  double v8 = [v5 imageWithRenderingMode:2];

  return v8;
}

- (id)_symbolNameForItem
{
  v2 = [(VKCCornerLookupButton *)self resultItem];
  id v3 = [v2 glyphName];

  return v3;
}

- (id)_defaultSymbolName
{
  return @"doc.text.magnifyingglass";
}

- (id)_backgroundColorBehindText
{
  return (id)[MEMORY[0x1E4F428B8] systemBackgroundColor];
}

- (void)_setupButton
{
  id v12 = [(VKCCornerLookupButton *)self imageForButton];
  id v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  button = self->_button;
  self->_button = v3;

  [(UIButton *)self->_button addTarget:self action:sel_didTap forControlEvents:64];
  id v5 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  [(UIButton *)self->_button setConfiguration:v5];
  if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPhone"))
  {
    id v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
    CGFloat v7 = [MEMORY[0x1E4F42A98] configurationWithFont:v6];
    [(UIButton *)self->_button setPreferredSymbolConfiguration:v7 forImageInState:0];
  }
  [(UIButton *)self->_button setImage:v12 forState:0];
  [(VKCCornerLookupButton *)self cornerButtonSize];
  double v9 = v8;
  -[UIButton setFrame:](self->_button, "setFrame:", 0.0, 0.0, v9, v9);
  [(VKCCornerLookupButton *)self addSubview:self->_button];
  [(VKCCornerLookupButton *)self updateIndicatorDotForState];
  v10 = [(VKCCornerLookupButton *)self layer];
  [v10 setMasksToBounds:1];

  BOOL v11 = [(VKCCornerLookupButton *)self layer];
  [v11 setCornerRadius:v9 * 0.5];
}

- (double)cornerButtonSize
{
  [(VKCCornerLookupButton *)self contentSizeScaleFactor];
  double v4 = v3;
  [(VKCCornerLookupButton *)self buttonWidth];
  return v4 * v5;
}

- (double)contentSizeScaleFactor
{
  v2 = [(VKCCornerLookupButton *)self traitCollection];
  objc_msgSend(v2, "vk_contentSizeScaleFactor");
  double v4 = v3;

  return fmax(v4, 1.0);
}

- (void)_updateImage
{
  if (self->_isShowingVisualResultsPane) {
    [(VKCCornerLookupButton *)self _backgroundColorBehindText];
  }
  else {
  id v3 = [MEMORY[0x1E4F428B8] labelColor];
  }
  [(UIButton *)self->_button vk_setTintColor:v3];
}

- (void)updateIndicatorDotForState
{
  [(VKCCornerLookupButton *)self _updateImage];
  if (self->_isShowingVisualResultsPane) {
    [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.569 blue:1.0 alpha:1.0];
  }
  else {
  id v3 = [(VKCCornerLookupButton *)self _backgroundColorBehindText];
  }
  [(UIView *)self setVk_backgroundColor:v3];
}

- (void)didTap
{
  if (!self->_isShowingVisualResultsPane)
  {
    id v3 = [(VKCCornerLookupButton *)self resultItem];
    [v3 setCurrentInvocationType:1];

    [(VKCCornerLookupButton *)self showVisualSearchResultView];
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  double v5 = [MEMORY[0x1E4F42CA8] effectWithPreview:v4];
  id v6 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)setShouldShowResultWhenVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldShowResultWhenVisible = a3;
  double v5 = [(VKCCornerLookupButton *)self window];
  if (v5 && v3)
  {
    BOOL isShowingVisualResultsPane = self->_isShowingVisualResultsPane;

    if (!isShowingVisualResultsPane)
    {
      [(VKCCornerLookupButton *)self showVisualSearchResultView];
    }
  }
  else
  {
  }
}

- (void)showVisualSearchResultView
{
  self->_BOOL isShowingVisualResultsPane = 1;
  [(VKCCornerLookupButton *)self showLookupUIPaneForResultItem];
  BOOL v3 = [(VKCCornerLookupButton *)self delegate];
  objc_msgSend(v3, "lookupButton:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, 0.0, 0.0, 1.0, 1.0);

  [(VKCCornerLookupButton *)self updateIndicatorDotForState];
}

- (void)didDismissVisualResultsPane
{
  self->_BOOL isShowingVisualResultsPane = 0;
  BOOL v3 = [(VKCCornerLookupButton *)self delegate];
  [v3 lookupButtonDidDismissController:self];

  [(VKCCornerLookupButton *)self updateIndicatorDotForState];
}

- (id)_queryString
{
  v2 = VKBundle();
  BOOL v3 = [v2 localizedStringForKey:@"VK_RESULTS_LOOKUP_PANEL_TITLE" value:@"VK_RESULTS_LOOKUP_PANEL_TITLE" table:@"Localizable"];

  return v3;
}

- (id)queryForProcessingResult
{
  objc_initWeak(&location, self);
  BOOL v3 = +[VKCImageAnalyzerRequest newQueryIDForParsec];
  id v4 = objc_alloc(MEMORY[0x1E4F962F8]);
  double v5 = [(VKCCornerLookupButton *)self _queryString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke;
  v8[3] = &unk_1E6BF0A18;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v3;
  id v6 = (void *)[v4 initWithTitle:v5 clientIdentifier:@"com.apple.mediaanalysisd" userAgent:@"VisualIntelligence/1" queryID:v3 queryProvider:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = (void (**)(void, void, void))v7;
  if (a2 && a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v10 = [MEMORY[0x1E4F1C9C8] now];
      if ([WeakRetained didProcessResult])
      {
        BOOL v11 = [WeakRetained resultItem];
        id v12 = [v11 searchItem];
        double v13 = [v12 searchSections];
        ((void (**)(void, void *, void))v8)[2](v8, v13, 0);

        CGPoint v14 = [WeakRetained delegate];
        [v14 lookupButton:WeakRetained didProcessResultWithDuration:0.0];

        CGRect v15 = +[VKImageAnalyzerMadInterface sharedInterface];
        uint64_t v16 = *(void *)(a1 + 48);
        v17 = [WeakRetained resultItem];
        uint64_t v18 = [v17 queryID];
        v19 = [WeakRetained resultItem];
        [v15 didShowVisualSearchCachedResultsForQueryID:v16 cachedResultQueryID:v18 item:v19];
      }
      else
      {
        v20 = [*(id *)(a1 + 32) delegate];
        v21 = [WeakRetained resultItem];
        v30[0] = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        uint64_t v23 = *(void *)(a1 + 48);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_2;
        v25[3] = &unk_1E6BF09F0;
        id v26 = v10;
        v27 = WeakRetained;
        uint64_t v29 = *(void *)(a1 + 48);
        v28 = v8;
        [v20 generateVisualSearchResultForItems:v22 queryID:v23 completionHandler:v25];
      }
    }
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    WeakRetained = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DB266000, WeakRetained, OS_LOG_TYPE_INFO, "Server access was not permitted", v24, 2u);
    }
  }
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3;
  v14[3] = &unk_1E6BF09C8;
  id v15 = v7;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  id v16 = v8;
  uint64_t v17 = v9;
  uint64_t v11 = *(void *)(a1 + 56);
  id v18 = v6;
  uint64_t v20 = v11;
  id v19 = v10;
  id v12 = v6;
  id v13 = v7;
  vk_performBlockOnMainThread(v14);
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    BOOL v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3_cold_1(v2, v3);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v6 = v5;

    [*(id *)(a1 + 48) setDidProcessResult:1];
    [*(id *)(a1 + 48) setResult:*(void *)(a1 + 56)];
    id v7 = [*(id *)(a1 + 56) resultItems];
    id v8 = [v7 firstObject];
    uint64_t v9 = [v8 searchItem];
    v10 = [*(id *)(a1 + 48) resultItem];
    [v10 setSearchItem:v9];

    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = [*(id *)(a1 + 48) resultItem];
    [v12 setQueryID:v11];

    uint64_t v13 = *(void *)(a1 + 64);
    CGPoint v14 = [*(id *)(a1 + 48) resultItem];
    id v15 = [v14 searchItem];
    id v16 = [v15 searchSections];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v16, 0);

    id v17 = [*(id *)(a1 + 48) delegate];
    [v17 lookupButton:*(void *)(a1 + 48) didProcessResultWithDuration:v6];
  }
}

- (void)showLookupUIPaneForResultItem
{
  BOOL v3 = [(VKCCornerLookupButton *)self queryForProcessingResult];
  id v4 = objc_alloc(MEMORY[0x1E4F962F0]);
  double v5 = [(VKCCornerLookupButton *)self _queryString];
  double v6 = objc_msgSend(v4, "initWithSearchQuery:rangeInContext:", v3, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v5, "length"));

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__VKCCornerLookupButton_showLookupUIPaneForResultItem__block_invoke;
  v14[3] = &unk_1E6BF0A40;
  void v14[4] = self;
  [v6 setReportAnIssueExtendedBlock:v14];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];

  [(VKCCornerLookupButton *)self setCurrentRVItemID:v8];
  [v6 setClientHints:v8];
  uint64_t v9 = [(VKCCornerLookupButton *)self delegate];
  [v9 addMetadataToVSFeedbackItem:v6];

  if (![(VKCCornerLookupButton *)self observingInteractionDidFinish])
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = getkDDRVInteractionDidFinishNotification();
    [v10 addObserver:self selector:sel__didDismissVisualResultsPane_ name:v11 object:0];

    [(VKCCornerLookupButton *)self setObservingInteractionDidFinish:1];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v12 = (void *)getDDRevealBridgeClass_softClass;
  uint64_t v19 = getDDRevealBridgeClass_softClass;
  if (!getDDRevealBridgeClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getDDRevealBridgeClass_block_invoke;
    v15[3] = &unk_1E6BF0A90;
    v15[4] = &v16;
    __getDDRevealBridgeClass_block_invoke((uint64_t)v15);
    id v12 = (void *)v17[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v13, "performDefaultActionForRVItem:view:location:fallbackMenuInteraction:context:", v6, self, 0, MEMORY[0x1E4F1CC08], *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

void __54__VKCCornerLookupButton_showLookupUIPaneForResultItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 delegate];
  id v8 = [*(id *)(a1 + 32) result];
  uint64_t v9 = [v8 userFeedbackPayload];
  [v10 submitVisualSearchUserFeedbackForReportIdentifier:v7 userFeedbackPayload:v9 sfReportData:v6];
}

- (void)_didDismissVisualResultsPane:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 object];

  VKDynamicCast(v5, (uint64_t)v6);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = objc_opt_class();
  id v8 = [v15 clientHints];
  uint64_t v9 = VKDynamicCast(v7, (uint64_t)v8);

  if (v9)
  {
    id v10 = [(VKCCornerLookupButton *)self currentRVItemID];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v13 = getkDDRVInteractionDidFinishNotification();
      [v12 removeObserver:self name:v13 object:0];

      [(VKCCornerLookupButton *)self setObservingInteractionDidFinish:0];
      [(VKCCornerLookupButton *)self setCurrentRVItemID:0];
      self->_BOOL isShowingVisualResultsPane = 0;
      CGPoint v14 = [(VKCCornerLookupButton *)self delegate];
      [v14 lookupButtonDidDismissController:self];

      [(VKCCornerLookupButton *)self updateIndicatorDotForState];
    }
  }
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (VKCVisualSearchResultItem)resultItem
{
  return self->_resultItem;
}

- (void)setResultItem:(id)a3
{
}

- (VKCVisualSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (VKCCornerLookupButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCCornerLookupButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShowingVisualResultsPane
{
  return self->_isShowingVisualResultsPane;
}

- (void)setIsShowingVisualResultsPane:(BOOL)a3
{
  self->_BOOL isShowingVisualResultsPane = a3;
}

- (NSString)currentRVItemID
{
  return self->_currentRVItemID;
}

- (void)setCurrentRVItemID:(id)a3
{
}

- (BOOL)observingInteractionDidFinish
{
  return self->_observingInteractionDidFinish;
}

- (void)setObservingInteractionDidFinish:(BOOL)a3
{
  self->_observingInteractionDidFinish = a3;
}

- (BOOL)didProcessResult
{
  return self->_didProcessResult;
}

- (void)setDidProcessResult:(BOOL)a3
{
  self->_didProcessResult = a3;
}

- (BOOL)shouldShowResultWhenVisible
{
  return self->_shouldShowResultWhenVisible;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (void)setButtonWidth:(double)a3
{
  self->_buttonWidth = a3;
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRVItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultItem, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Could not process analysis result with error: %@", (uint8_t *)&v3, 0xCu);
}

@end