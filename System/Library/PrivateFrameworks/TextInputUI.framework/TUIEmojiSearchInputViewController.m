@interface TUIEmojiSearchInputViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)_canShowWhileLocked;
- (BOOL)hidesExpandableButton;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)usesFloatingStyle;
- (NSArray)displayedCandidates;
- (TUIEmojiSearchInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TUIEmojiSearchInputViewControllerDelegate)delegate;
- (TUIEmojiSearchView)emojiSearchView;
- (UIEdgeInsets)_keyboardInsets;
- (UIPredictiveViewController)childPredictionViewController;
- (double)preferredHeightForTraitCollection:(id)a3;
- (void)_dismissVariantSelector;
- (void)_displayResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5;
- (void)_keyboardInputModeDidChange:(id)a3;
- (void)_selectedEmojiString:(id)a3 query:(id)a4 indexPath:(id)a5 completion:(id)a6;
- (void)autocorrectionListDidBecomeAvailable:(id)a3;
- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4;
- (void)didSelectEmoji:(id)a3 indexPath:(id)a4;
- (void)dragAndDropDidEnd:(id)a3;
- (void)dragAndDropWillBegin:(id)a3;
- (void)emojiSearchResultsController:(id)a3 didRequestVariantSelectorForEmojiToken:(id)a4 fromRect:(CGRect)a5;
- (void)emojiSearchResultsController:(id)a3 didSelectEmoji:(id)a4 indexPath:(id)a5;
- (void)emojiSearchSource:(id)a3 didProduceResults:(id)a4 forExactQuery:(id)a5 autocorrectedQuery:(id)a6;
- (void)emojiSearchTextField:(id)a3 didChangeSearchString:(id)a4;
- (void)emojiSearchTextFieldDidBecomeActive:(id)a3;
- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeActive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillClear:(id)a3;
- (void)loadView;
- (void)setChildPredictionViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUsesFloatingStyle:(BOOL)a3;
- (void)toggleGlow:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfigurationForRemoteSearchController;
- (void)variantSelectorValueChanged:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TUIEmojiSearchInputViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPredictionViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_lastActivationDate, 0);
  objc_storeStrong((id *)&self->_autocorrectedSearchQuery, 0);
  objc_storeStrong((id *)&self->_exactSearchQuery, 0);
  objc_storeStrong((id *)&self->_waitForAutocorrectionDelayTimer, 0);
  objc_storeStrong((id *)&self->_rateLimitedSearchQuery, 0);
  objc_storeStrong((id *)&self->_rateLimitedResults, 0);
  objc_storeStrong((id *)&self->_resultsUpdateRateLimitTimer, 0);
  objc_storeStrong((id *)&self->_variantSelectorDismissOverlayView, 0);
  objc_storeStrong((id *)&self->_variantSelectorDismissGesture, 0);
  objc_storeStrong((id *)&self->_variantSelectorView, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
  objc_storeStrong((id *)&self->_remoteSearchViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchSource, 0);
}

- (void)setUsesFloatingStyle:(BOOL)a3
{
  self->_usesFloatingStyle = a3;
}

- (BOOL)usesFloatingStyle
{
  return self->_usesFloatingStyle;
}

- (UIPredictiveViewController)childPredictionViewController
{
  return self->_childPredictionViewController;
}

- (TUIEmojiSearchView)emojiSearchView
{
  return self->_emojiSearchView;
}

- (void)setDelegate:(id)a3
{
}

- (TUIEmojiSearchInputViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIEmojiSearchInputViewControllerDelegate *)WeakRetained;
}

- (void)dragAndDropDidEnd:(id)a3
{
}

- (void)dragAndDropWillBegin:(id)a3
{
}

- (void)variantSelectorValueChanged:(id)a3
{
  v4 = [a3 selectedVariant];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 string];
    autocorrectedSearchQuery = self->_autocorrectedSearchQuery;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__TUIEmojiSearchInputViewController_variantSelectorValueChanged___block_invoke;
    v8[3] = &unk_1E55941A8;
    v8[4] = self;
    [(TUIEmojiSearchInputViewController *)self _selectedEmojiString:v6 query:autocorrectedSearchQuery indexPath:0 completion:v8];
  }
}

void __65__TUIEmojiSearchInputViewController_variantSelectorValueChanged___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissVariantSelector];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1024) collectionView];
  [v2 reloadData];
}

- (void)_dismissVariantSelector
{
  [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController setCellHighlightFrozen:0];
  [(TouchExclusionView *)self->_variantSelectorDismissOverlayView removeFromSuperview];
  variantSelectorDismissOverlayView = self->_variantSelectorDismissOverlayView;
  self->_variantSelectorDismissOverlayView = 0;

  [(TUIEmojiVariantSelectorView *)self->_variantSelectorView removeFromSuperview];
  variantSelectorView = self->_variantSelectorView;
  self->_variantSelectorView = 0;
}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  id v4 = a3;
  v5 = [(TUIEmojiSearchInputViewController *)self delegate];
  [v5 emojiSearchTextFieldDidBecomeInactive:v4];

  [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession endSession];
  id v6 = +[TUIInputAnalytics getIASignalGenmojiCreationEmojiSearchDismissed];
  +[TUIInputAnalytics sendGenmojiCreationSignal:v6 payload:0];
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v4 = a3;
  [(TUIEmojiSearchInputViewController *)self _dismissVariantSelector];
  id v5 = [(TUIEmojiSearchInputViewController *)self delegate];
  [v5 emojiSearchTextFieldWillBecomeInactive:v4];
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIEmojiSearchInputViewController *)self delegate];
  [v5 emojiSearchTextFieldDidBecomeActive:v4];

  id v6 = [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController collectionView];
  v7 = [v6 collectionViewLayout];
  [v7 invalidateLayout];

  v8 = [(TUIEmojiSearchInputViewController *)self emojiSearchView];
  [MEMORY[0x1E4FB18E0] keyplanePadding];
  objc_msgSend(v8, "updateInsetsIfNeeded:");

  [(TUIEmojiSearchInputViewController *)self updateConfigurationForRemoteSearchController];
  v9 = [(TUIEmojiSearchInputViewController *)self emojiSearchView];
  v10 = [v9 searchTextField];
  id v14 = [v10 text];

  if ([v14 length]) {
    [(TUIEmojiSearchInputViewController *)self beginSearchForExactQuery:v14 autocorrectedQuery:&stru_1EDC653C0];
  }
  v11 = [MEMORY[0x1E4F1C9C8] date];
  lastActivationDate = self->_lastActivationDate;
  self->_lastActivationDate = v11;

  [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession beginSessionWithInitialSearchQuery:v14];
  v13 = +[TUIInputAnalytics getIASignalGenmojiCreationEmojiSearchInvoked];
  +[TUIInputAnalytics sendGenmojiCreationSignal:v13 payload:0];
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIEmojiSearchInputViewController *)self delegate];
  [v5 emojiSearchTextFieldWillBecomeActive:v4];
}

- (void)emojiSearchResultsController:(id)a3 didRequestVariantSelectorForEmojiToken:(id)a4 fromRect:(CGRect)a5
{
  if (!self->_variantSelectorView)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v14 = a4;
    v15 = [(TUIEmojiSearchInputViewController *)self view];
    v16 = [v15 window];
    v17 = [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController collectionView];
    objc_msgSend(v16, "convertRect:fromView:", v17, x, y, width, height);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    v26 = -[TUIEmojiVariantSelectorView initWithFrame:emojiToken:originRect:]([TUIEmojiVariantSelectorView alloc], "initWithFrame:emojiToken:originRect:", v14, v10, v11, v12, v13, v19, v21, v23, v25);
    variantSelectorView = self->_variantSelectorView;
    self->_variantSelectorView = v26;

    [(TUIEmojiVariantSelectorView *)self->_variantSelectorView setDelegate:self];
    v28 = self->_variantSelectorView;
    v29 = [(TUIEmojiSearchInputViewController *)self emojiSearchView];
    [v29 bounds];
    -[TUIEmojiVariantSelectorView sizeThatFits:](v28, "sizeThatFits:", v30, v31);
    double v33 = v32;
    double v35 = v34;

    v76.origin.double x = v19;
    v76.origin.double y = v21;
    v76.size.double width = v23;
    v76.size.double height = v25;
    double v36 = CGRectGetMaxY(v76) - v35;
    UIRectGetCenter();
    double v38 = v37 + v33 * -0.5;
    if (v38 >= 0.0)
    {
      v78.origin.double x = v37 + v33 * -0.5;
      v78.origin.double y = v36;
      v78.size.double width = v33;
      v78.size.double height = v35;
      double v72 = v36;
      double MaxX = CGRectGetMaxX(v78);
      v40 = [(TUIEmojiSearchInputViewController *)self view];
      [v40 bounds];
      double v73 = v35;
      double v42 = v41;

      BOOL v43 = MaxX <= v42;
      double v36 = v72;
      double v35 = v73;
      if (!v43)
      {
        v44 = [(TUIEmojiSearchInputViewController *)self view];
        [v44 bounds];
        double v46 = v45;
        v79.origin.double x = v19;
        v79.origin.double y = v21;
        v79.size.double width = v23;
        v79.size.double height = v25;
        double v47 = v46 - CGRectGetMaxX(v79);
        double v48 = *(double *)&TUIEmojiVariantSelectorBubbleRadius;

        if (v47 >= v48)
        {
          v49 = [(TUIEmojiSearchInputViewController *)self view];
          [v49 bounds];
          double v38 = v50 - v33;
        }
        else
        {
          v80.origin.double x = v19;
          v80.origin.double y = v21;
          v80.size.double width = v23;
          v80.size.double height = v25;
          double v38 = CGRectGetMaxX(v80) - v33;
        }
        double v36 = v72;
        double v35 = v73;
      }
    }
    else
    {
      v77.origin.double x = v19;
      v77.origin.double y = v21;
      v77.size.double width = v23;
      v77.size.double height = v25;
      if (CGRectGetMinX(v77) >= *(double *)&TUIEmojiVariantSelectorBubbleRadius) {
        double v38 = 0.0;
      }
      else {
        double v38 = v19;
      }
    }
    -[TUIEmojiVariantSelectorView setFrame:](self->_variantSelectorView, "setFrame:", v38, v36, v33, v35);
    v51 = [(TUIEmojiSearchInputViewController *)self view];
    v52 = [v51 window];
    [v52 addSubview:self->_variantSelectorView];

    v53 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__didRecognizeVariantDismissGesture_];
    variantSelectorDismissGesture = self->_variantSelectorDismissGesture;
    self->_variantSelectorDismissGesture = v53;

    [(UITapGestureRecognizer *)self->_variantSelectorDismissGesture setCancelsTouchesInView:1];
    v55 = [TouchExclusionView alloc];
    v56 = [(TUIEmojiSearchInputViewController *)self view];
    v57 = [v56 window];
    [v57 bounds];
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    v66 = [(TUIEmojiVariantSelectorView *)self->_variantSelectorView variantCellContainerView];
    v67 = -[TouchExclusionView initWithFrame:excludingView:](v55, "initWithFrame:excludingView:", v66, v59, v61, v63, v65);
    variantSelectorDismissOverlayView = self->_variantSelectorDismissOverlayView;
    self->_variantSelectorDismissOverlayView = v67;

    v69 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v70 = [v69 colorWithAlphaComponent:0.01];
    [(TouchExclusionView *)self->_variantSelectorDismissOverlayView setBackgroundColor:v70];

    [(TouchExclusionView *)self->_variantSelectorDismissOverlayView addGestureRecognizer:self->_variantSelectorDismissGesture];
    id v74 = [(TUIEmojiSearchInputViewController *)self view];
    v71 = [v74 window];
    [v71 addSubview:self->_variantSelectorDismissOverlayView];
  }
}

- (void)emojiSearchResultsController:(id)a3 didSelectEmoji:(id)a4 indexPath:(id)a5
{
}

- (void)toggleGlow:(BOOL)a3
{
}

- (void)didSelectEmoji:(id)a3 indexPath:(id)a4
{
}

- (void)_selectedEmojiString:(id)a3 query:(id)a4 indexPath:(id)a5 completion:(id)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  id v14 = [v13 lastUsedInputModeForCurrentContext];
  v15 = [v14 primaryLanguage];
  uint64_t v16 = [v15 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  if (v16) {
    v17 = (__CFString *)v16;
  }
  else {
    v17 = @"en_US";
  }
  uint64_t v18 = [MEMORY[0x1E4FB18F0] hasVariantsForEmoji:v29];
  double v19 = [MEMORY[0x1E4FB18E8] emojiWithString:v29 withVariantMask:v18];
  double v20 = [MEMORY[0x1E4FB18F8] sharedInstance];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    if (v11)
    {
      double v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "item"));
    }
    else
    {
      double v22 = &unk_1EDC79A70;
    }
    double v24 = [MEMORY[0x1E4FB18F8] sharedInstance];
    [v24 emojiUsedFromEmojiKeyboardSearch:v19 inputModeIdentifier:v17 resultIndex:v22 query:v10 completionHandler:v12];
  }
  else
  {
    double v23 = [MEMORY[0x1E4FB18F8] sharedInstance];
    [v23 emojiUsed:v19 language:v17];

    if (v12) {
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
  [(_UIKBFeedbackGenerating *)self->_feedbackGenerator actionOccurred:1];
  double v25 = [(TUIEmojiSearchInputViewController *)self delegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    v27 = [(TUIEmojiSearchInputViewController *)self delegate];
    [v27 emojiSearchWillInsertEmoji:v29 forSearchQuery:self->_autocorrectedSearchQuery];
  }
  v28 = [(UIInputViewController *)self textDocumentProxy];
  [v28 insertText:v29];

  [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession emojiInserted:v29];
}

- (void)emojiSearchSource:(id)a3 didProduceResults:(id)a4 forExactQuery:(id)a5 autocorrectedQuery:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__TUIEmojiSearchInputViewController_emojiSearchSource_didProduceResults_forExactQuery_autocorrectedQuery___block_invoke;
  aBlock[3] = &unk_1E5593EF0;
  aBlock[4] = self;
  double v13 = _Block_copy(aBlock);
  if (self->_resultsUpdateRateLimitTimer)
  {
    objc_storeStrong((id *)&self->_rateLimitedResults, a4);
    id v14 = (NSString *)v11;
    rateLimitedSearchQuerdouble y = self->_rateLimitedSearchQuery;
    self->_rateLimitedSearchQuerdouble y = v14;
LABEL_5:

    goto LABEL_6;
  }
  [(TUIEmojiSearchInputViewController *)self _displayResults:v10 forExactQuery:v11 autocorrectedQuery:v12];
  uint64_t v16 = [(TUIEmojiSearchInputViewController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    rateLimitedSearchQuerdouble y = [(TUIEmojiSearchInputViewController *)self delegate];
    [rateLimitedSearchQuery emojiSearchDidReceiveResults:v10 forExactQuery:v11 autocorrectedQuery:v12];
    goto LABEL_5;
  }
LABEL_6:
  [(NSTimer *)self->_resultsUpdateRateLimitTimer invalidate];
  uint64_t v18 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v13 block:0.15];
  resultsUpdateRateLimitTimer = self->_resultsUpdateRateLimitTimer;
  self->_resultsUpdateRateLimitTimer = v18;
}

void __106__TUIEmojiSearchInputViewController_emojiSearchSource_didProduceResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[135];
  if (v4)
  {
    [v3 _displayResults:v4 forExactQuery:v3[136] autocorrectedQuery:v3[140]];
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    v3 = *(void **)(a1 + 32);
    if (v6)
    {
      v7 = [v3 delegate];
      [v7 emojiSearchDidReceiveResults:*(void *)(*(void *)(a1 + 32) + 1080) forExactQuery:*(void *)(*(void *)(a1 + 32) + 1088) autocorrectedQuery:*(void *)(*(void *)(a1 + 32) + 1120)];

      v3 = *(void **)(a1 + 32);
    }
  }
  v8 = (void *)v3[135];
  v3[135] = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1088);
  *(void *)(v9 + 1088) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 1072);
  *(void *)(v11 + 1072) = 0;
}

- (void)emojiSearchTextFieldWillClear:(id)a3
{
  id v7 = a3;
  [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession clearButtonPressed];
  uint64_t v4 = [(TUIEmojiSearchInputViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(TUIEmojiSearchInputViewController *)self delegate];
    [v6 emojiSearchTextFieldDidReset:v7];
  }
}

- (void)emojiSearchTextField:(id)a3 didChangeSearchString:(id)a4
{
  id v6 = a3;
  id v7 = NSString;
  __int16 v20 = -4;
  id v8 = a4;
  uint64_t v9 = [v7 stringWithCharacters:&v20 length:1];
  id v10 = [v8 stringByReplacingOccurrencesOfString:v9 withString:&stru_1EDC653C0];

  autocorrectedSearchQuerdouble y = self->_autocorrectedSearchQuery;
  self->_autocorrectedSearchQuerdouble y = 0;

  id v12 = (NSString *)[v10 copy];
  exactSearchQuerdouble y = self->_exactSearchQuery;
  self->_exactSearchQuerdouble y = v12;

  if ((unint64_t)[v10 length] >= 2 && self->_canAutocorrectWithCurrentInputMode)
  {
    [(NSTimer *)self->_waitForAutocorrectionDelayTimer invalidate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__TUIEmojiSearchInputViewController_emojiSearchTextField_didChangeSearchString___block_invoke;
    v19[3] = &unk_1E5593EF0;
    v19[4] = self;
    id v14 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v19 block:0.15];
    waitForAutocorrectionDelayTimer = self->_waitForAutocorrectionDelayTimer;
    self->_waitForAutocorrectionDelayTimer = v14;
  }
  else
  {
    [(TUIEmojiSearchInputViewController *)self beginSearchForExactQuery:v10 autocorrectedQuery:&stru_1EDC653C0];
  }
  if (![v10 length])
  {
    uint64_t v16 = [(TUIEmojiSearchInputViewController *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(TUIEmojiSearchInputViewController *)self delegate];
      [v18 emojiSearchTextFieldDidReset:v6];
    }
  }
  [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession searchQueryWasChangedTo:v10];
}

uint64_t __80__TUIEmojiSearchInputViewController_emojiSearchTextField_didChangeSearchString___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[140])
  {
    [v2 beginSearchForExactQuery:v2[139] autocorrectedQuery:&stru_1EDC653C0];
    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v3 = v2[138];
  v2[138] = 0;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    uint64_t v19 = 0;
    __int16 v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v8 = (void *)getSTKStickerSearchQueryClass_softClass;
    uint64_t v22 = getSTKStickerSearchQueryClass_softClass;
    if (!getSTKStickerSearchQueryClass_softClass)
    {
      StickerKitLibraryCore();
      v20[3] = (uint64_t)objc_getClass("STKStickerSearchQuery");
      getSTKStickerSearchQueryClass_softClass = v20[3];
      id v8 = (void *)v20[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v19, 8);
    id v10 = objc_alloc_init(v9);
    [v10 setExactQuery:v6];
    [v10 setAutocorrectedQuery:v7];
    uint64_t v11 = [(TUIEmojiSearchSource *)self->_emojiSearchSource locale];
    id v12 = [v11 localeIdentifier];
    [v10 setLocale:v12];

    id v13 = [(TUIEmojiSearchSource *)self->_emojiSearchSource multilingualSearchLocales];
    [v10 setMultilingualSearchLocales:v13];

    objc_msgSend(v10, "setSupportsImages:", +[TUIEmojiSearchView shouldShowImages](TUIEmojiSearchView, "shouldShowImages"));
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v10, "setSupportsGenmoji:", +[TUIEmojiSearchView shouldShowGenmoji](TUIEmojiSearchView, "shouldShowGenmoji"));
    }
    id v14 = [(TUIEmojiSearchInputViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0
      || ([(TUIEmojiSearchInputViewController *)self delegate],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [(TUIEmojiSearchView *)self->_emojiSearchView searchTextField],
          char v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v16 emojiSearchTextField:v17 shouldSendQuery:v10],
          v17,
          v16,
          v18))
    {
      [(STKStickerRemoteSearchViewController *)self->_remoteSearchViewController searchWithQuery:v10];
    }
  }
  else
  {
    [(TUIEmojiSearchSource *)self->_emojiSearchSource beginSearchForExactQuery:v6 autocorrectedQuery:v7];
  }
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  +[TUIEmojiSearchTextField preferredHeight];
  double v6 = v5;
  uint64_t v7 = [v4 userInterfaceIdiom];
  uint64_t v8 = [v4 horizontalSizeClass];
  uint64_t v9 = [(TUIEmojiSearchInputViewController *)self emojiSearchView];
  int v10 = [v9 isCollapsed];

  if (v7 == 1 && v8 != 1)
  {
    if (v10)
    {
      if (!TUIRemoteEmojiSearchViewControllerEnabled()) {
        double v6 = 0.0;
      }
      goto LABEL_17;
    }
    double v18 = 6.0;
LABEL_16:
    double v6 = v6 + v18;
    goto LABEL_17;
  }
  if (v10) {
    goto LABEL_17;
  }
  if (!self->_childPredictionViewController)
  {
    +[TUIEmojiSearchTextField preferredHeight];
    goto LABEL_16;
  }
  uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 nativeBounds];
  long double v13 = v12;

  [(UIPredictiveViewController *)self->_childPredictionViewController preferredHeightForTraitCollection:v4];
  double v15 = v14;
  if (v8 == 1 || (double v16 = fmod(v13, 2.0), v17 = fmod(v15, 2.0), v16 != 0.0) && v17 != 0.0) {
    double v15 = v15 + -1.0;
  }
  double v6 = v6 + v15;
LABEL_17:

  return v6;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (BOOL)hidesExpandableButton
{
  return 1;
}

- (NSArray)displayedCandidates
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)updateConfigurationForRemoteSearchController
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v3 = (void *)getSTKStickerSearchConfigurationClass_softClass;
  uint64_t v13 = getSTKStickerSearchConfigurationClass_softClass;
  if (!getSTKStickerSearchConfigurationClass_softClass)
  {
    StickerKitLibraryCore();
    v11[3] = (uint64_t)objc_getClass("STKStickerSearchConfiguration");
    getSTKStickerSearchConfigurationClass_softClass = v11[3];
    uint64_t v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = objc_alloc_init(v4);
  +[TUIEmojiSearchResultsCollectionViewController emojiFontSize];
  objc_msgSend(v5, "setFontSize:");
  double v6 = [(STKStickerRemoteSearchViewController *)self->_remoteSearchViewController view];
  [v6 layoutMargins];
  [v5 setMargin:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v8 minimumLineSpacing];
  objc_msgSend(v5, "setSpacing:");

  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(STKStickerRemoteSearchViewController *)self->_remoteSearchViewController view];
    objc_msgSend(v5, "setVisible:", objc_msgSend(v9, "isHiddenOrHasHiddenAncestor") ^ 1);
  }
  [(STKStickerRemoteSearchViewController *)self->_remoteSearchViewController configureWithConfiguration:v5];
}

- (void)autocorrectionListDidBecomeAvailable:(id)a3
{
  id v4 = [a3 autocorrection];
  if (v4)
  {
    exactSearchQuerdouble y = self->_exactSearchQuery;
    id v11 = v4;
    double v6 = [v4 input];
    double v7 = [v11 candidate];
    -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](exactSearchQuery, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, v7, 12, 0, [(NSString *)self->_exactSearchQuery length]);
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    autocorrectedSearchQuerdouble y = self->_autocorrectedSearchQuery;
    self->_autocorrectedSearchQuerdouble y = v8;
    uint64_t v10 = v8;

    [(TUIEmojiSearchInputViewController *)self beginSearchForExactQuery:self->_exactSearchQuery autocorrectedQuery:v10];
    id v4 = v11;
  }
}

- (void)_displayResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 length];
  uint64_t v10 = [v8 length];

  if (!(v9 + v10))
  {
    uint64_t v11 = [(TUIEmojiSearchSource *)self->_emojiSearchSource suggestedEmojis];

    id v14 = (id)v11;
  }
  uint64_t v12 = [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController displayedEmojis];
  char v13 = [v14 isEqualToArray:v12];

  if ((v13 & 1) == 0) {
    [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController resetScrollPositionAnimated:0];
  }
  [(TUIEmojiSearchResultsCollectionViewController *)self->_resultsViewController setDisplayedEmojis:v14 verbatimSkinTones:[(TUIEmojiSearchSource *)self->_emojiSearchSource shouldSupplyVerbatimResultsFor:v14] animated:1];
}

- (void)setChildPredictionViewController:(id)a3
{
  id v4 = (UIPredictiveViewController *)a3;
  [(UIPredictiveViewController *)self->_childPredictionViewController removeFromParentViewController];
  id v5 = [(UIPredictiveViewController *)self->_childPredictionViewController view];
  [v5 removeFromSuperview];

  childPredictionViewController = self->_childPredictionViewController;
  self->_childPredictionViewController = v4;
  id v8 = v4;

  double v7 = [(UIPredictiveViewController *)v8 view];
  [(TUIEmojiSearchView *)self->_emojiSearchView setPredictionView:v7];

  [(TUIEmojiSearchInputViewController *)self addChildViewController:v8];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)TUIEmojiSearchInputViewController;
  id v7 = a4;
  -[TUIEmojiSearchInputViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__TUIEmojiSearchInputViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5593EC8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __88__TUIEmojiSearchInputViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1184);
  [MEMORY[0x1E4FB18E0] keyplanePadding];
  return objc_msgSend(v1, "updateInsetsIfNeeded:");
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [a3 horizontalSizeClass];
  id v5 = [(TUIEmojiSearchInputViewController *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v4 != v6)
  {
    id v7 = [(TUIEmojiSearchInputViewController *)self traitCollection];
    if ([v7 userInterfaceIdiom] == 1)
    {
      id v8 = [(TUIEmojiSearchInputViewController *)self traitCollection];
      -[TUIEmojiSearchInputViewController setUsesFloatingStyle:](self, "setUsesFloatingStyle:", [v8 horizontalSizeClass] == 1);
    }
    else
    {
      [(TUIEmojiSearchInputViewController *)self setUsesFloatingStyle:0];
    }

    emojiSearchView = self->_emojiSearchView;
    id v10 = [(TUIEmojiSearchInputViewController *)self traitCollection];
    -[TUIEmojiSearchView transitionToCompactLayout:](emojiSearchView, "transitionToCompactLayout:", [v10 horizontalSizeClass] == 1);
  }
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchInputViewController;
  [(TUIEmojiSearchInputViewController *)&v7 viewDidLayoutSubviews];
  [(TUIEmojiSearchInputViewController *)self _keyboardInsets];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_leadingConstraint setConstant:v3];
  [(NSLayoutConstraint *)self->_trailingConstraint setConstant:-v4];
  emojiSearchView = self->_emojiSearchView;
  uint64_t v6 = [(TUIEmojiSearchInputViewController *)self traitCollection];
  -[TUIEmojiSearchView transitionToCompactLayout:](emojiSearchView, "transitionToCompactLayout:", [v6 horizontalSizeClass] == 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUIEmojiSearchInputViewController;
  [(TUIEmojiSearchInputViewController *)&v15 viewWillAppear:a3];
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    dispatch_time_t v4 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__TUIEmojiSearchInputViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E55941A8;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v5 = [(TUIEmojiSearchView *)self->_emojiSearchView searchTextField];
    if (!v5) {
      goto LABEL_5;
    }
    uint64_t v6 = (void *)v5;
    objc_super v7 = [(TUIEmojiSearchView *)self->_emojiSearchView searchTextField];
    id v8 = [v7 text];
    uint64_t v9 = [v8 length];

    if (!v9) {
LABEL_5:
    }
      [(TUIEmojiSearchInputViewController *)self _displayResults:MEMORY[0x1E4F1CBF0] forExactQuery:&stru_1EDC653C0 autocorrectedQuery:&stru_1EDC653C0];
  }
  if (([(_UIKBFeedbackGenerating *)self->_feedbackGenerator isActive] & 1) == 0) {
    [(_UIKBFeedbackGenerating *)self->_feedbackGenerator activateWithCompletionBlock:0];
  }
  lastActivationDate = self->_lastActivationDate;
  if (lastActivationDate)
  {
    [(NSDate *)lastActivationDate timeIntervalSinceNow];
    if (v11 < -480.0)
    {
      uint64_t v12 = [(TUIEmojiSearchView *)self->_emojiSearchView searchTextField];
      [v12 setText:&stru_1EDC653C0];
    }
  }
  char v13 = +[TUIInputAnalytics getIASignalGenmojiCreationEmojiKeyPlaneSwitched];
  +[TUIInputAnalytics sendGenmojiCreationSignal:v13 payload:0];
}

void __52__TUIEmojiSearchInputViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v3 = [v1[148] searchTextField];
  id v2 = [v3 text];
  [v1 beginSearchForExactQuery:v2 autocorrectedQuery:&stru_1EDC653C0];
}

- (void)_keyboardInputModeDidChange:(id)a3
{
  dispatch_time_t v4 = objc_msgSend(MEMORY[0x1E4FB1910], "sharedInputModeController", a3);
  id v19 = [v4 currentInputMode];

  uint64_t v5 = [v19 primaryLanguage];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v19 dictationLanguage];

    uint64_t v5 = (void *)v6;
  }
  objc_super v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  id v8 = [[TUIEmojiSearchSource alloc] initWithLocale:v7];
  emojiSearchSource = self->_emojiSearchSource;
  self->_emojiSearchSource = v8;

  [(TUIEmojiSearchSource *)self->_emojiSearchSource setDelegate:self];
  id v10 = [v19 multilingualLanguages];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [v19 multilingualLanguages];
    [(TUIEmojiSearchSource *)self->_emojiSearchSource setMultilingualSearchLocales:v12];
  }
  char v13 = [[TUIEmojiSearchAnalyticsSession alloc] initWithLocale:v7];
  analyticsSession = self->_analyticsSession;
  self->_analyticsSession = v13;

  objc_super v15 = [(TUIEmojiSearchInputViewController *)self emojiSearchView];
  double v16 = [v15 searchTextField];
  int v17 = [v16 isActive];

  if (v17) {
    [(TUIEmojiSearchAnalyticsSession *)self->_analyticsSession beginSessionWithInitialSearchQuery:self->_exactSearchQuery];
  }
  double v18 = [MEMORY[0x1E4FB1900] activeInstance];
  self->_canAutocorrectWithCurrentInputMode = [v18 usesCandidateSelection] ^ 1;
}

- (UIEdgeInsets)_keyboardInsets
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  objc_super v7 = [(TUIEmojiSearchInputViewController *)self traitCollection];
  if ([v7 userInterfaceIdiom] == 1
    || [(TUIEmojiSearchInputViewController *)self usesFloatingStyle])
  {
  }
  else
  {
    char v13 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    unint64_t v14 = [v13 interfaceOrientation] - 3;

    if (v14 <= 1)
    {
      [MEMORY[0x1E4FB18E0] keyplanePadding];
      double v3 = v15;
      double v4 = v16;
      double v5 = v17;
      double v6 = v18;
    }
  }
  BOOL v8 = [(TUIEmojiSearchInputViewController *)self usesFloatingStyle];
  if (v8) {
    double v9 = -6.0;
  }
  else {
    double v9 = v6;
  }
  if (v8) {
    double v10 = -6.0;
  }
  else {
    double v10 = v4;
  }
  double v11 = v3;
  double v12 = v5;
  result.right = v9;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIEmojiSearchInputViewController;
  [(TUIEmojiSearchInputViewController *)&v5 viewWillDisappear:a3];
  [(NSTimer *)self->_resultsUpdateRateLimitTimer invalidate];
  resultsUpdateRateLimitTimer = self->_resultsUpdateRateLimitTimer;
  self->_resultsUpdateRateLimitTimer = 0;

  if ([(_UIKBFeedbackGenerating *)self->_feedbackGenerator isActive]) {
    [(_UIKBFeedbackGenerating *)self->_feedbackGenerator deactivate];
  }
}

- (void)viewDidLoad
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)TUIEmojiSearchInputViewController;
  [(UIInputViewController *)&v25 viewDidLoad];
  double v3 = [(TUIEmojiSearchInputViewController *)self view];
  [v3 addSubview:self->_emojiSearchView];

  double v4 = [(TUIEmojiSearchView *)self->_emojiSearchView leadingAnchor];
  objc_super v5 = [(TUIEmojiSearchInputViewController *)self view];
  double v6 = [v5 leadingAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = v7;

  double v9 = [(TUIEmojiSearchView *)self->_emojiSearchView trailingAnchor];
  double v10 = [(TUIEmojiSearchInputViewController *)self view];
  double v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  trailingConstraint = self->_trailingConstraint;
  self->_trailingConstraint = v12;

  unint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  double v15 = self->_trailingConstraint;
  v26[0] = self->_leadingConstraint;
  v26[1] = v15;
  double v16 = [(TUIEmojiSearchView *)self->_emojiSearchView topAnchor];
  double v17 = [(TUIEmojiSearchInputViewController *)self view];
  double v18 = [v17 topAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  v26[2] = v19;
  __int16 v20 = [(TUIEmojiSearchView *)self->_emojiSearchView bottomAnchor];
  uint64_t v21 = [(TUIEmojiSearchInputViewController *)self view];
  uint64_t v22 = [v21 bottomAnchor];
  double v23 = [v20 constraintEqualToAnchor:v22];
  v26[3] = v23;
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v14 activateConstraints:v24];
}

- (void)loadView
{
  double v3 = [TUIEmojiSearchInputView alloc];
  double v4 = -[UIInputView initWithFrame:inputViewStyle:](v3, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIInputViewController *)self setView:v4];
}

- (TUIEmojiSearchInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)TUIEmojiSearchInputViewController;
  double v4 = [(UIInputViewController *)&v31 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    objc_super v5 = [TUIEmojiSearchView alloc];
    uint64_t v6 = -[TUIEmojiSearchView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    emojiSearchView = v4->_emojiSearchView;
    v4->_emojiSearchView = (TUIEmojiSearchView *)v6;

    [(TUIEmojiSearchView *)v4->_emojiSearchView setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v8 = [(TUIEmojiSearchView *)v4->_emojiSearchView searchTextField];
    [v8 setSearchDelegate:v4];

    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      objc_initWeak(&location, v4);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke;
      v28[3] = &unk_1E5593EA0;
      objc_copyWeak(&v29, &location);
      [(TUIEmojiSearchView *)v4->_emojiSearchView setLayoutInvalidationCallback:v28];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_2;
      v26[3] = &unk_1E5593EA0;
      objc_copyWeak(&v27, &location);
      [(TUIEmojiSearchView *)v4->_emojiSearchView setCreateButtonCallback:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_3;
      v24[3] = &unk_1E5593EA0;
      objc_copyWeak(&v25, &location);
      [(TUIEmojiSearchView *)v4->_emojiSearchView setCreateStickerFromPhotosButtonCallback:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_4;
      v22[3] = &unk_1E5593EA0;
      objc_copyWeak(&v23, &location);
      [(TUIEmojiSearchView *)v4->_emojiSearchView setPresentAvatarEditorButtonCallback:v22];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    double v9 = [(TUIEmojiSearchView *)v4->_emojiSearchView searchTextField];
    [v9 setAutocorrectionType:1];

    double v10 = [(TUIEmojiSearchView *)v4->_emojiSearchView searchTextField];
    [v10 setAutocapitalizationType:0];

    if (TUIRemoteEmojiSearchViewControllerEnabled() && getSTKStickerRemoteSearchViewControllerClass())
    {
      double v11 = (STKStickerRemoteSearchViewController *)objc_alloc_init((Class)getSTKStickerRemoteSearchViewControllerClass());
      p_remoteSearchViewController = &v4->_remoteSearchViewController;
      remoteSearchViewController = v4->_remoteSearchViewController;
      v4->_remoteSearchViewController = v11;

      [(STKStickerRemoteSearchViewController *)v4->_remoteSearchViewController setDelegate:v4];
      uint64_t v14 = [(STKStickerRemoteSearchViewController *)v4->_remoteSearchViewController view];
    }
    else
    {
      double v15 = objc_alloc_init(TUIEmojiSearchResultsCollectionViewController);
      p_remoteSearchViewController = &v4->_resultsViewController;
      resultsViewController = v4->_resultsViewController;
      v4->_resultsViewController = v15;

      [(TUIEmojiSearchResultsCollectionViewController *)v4->_resultsViewController setDelegate:v4];
      uint64_t v14 = [(TUIEmojiSearchResultsCollectionViewController *)v4->_resultsViewController collectionView];
    }
    double v17 = (void *)v14;
    [(TUIEmojiSearchView *)v4->_emojiSearchView setResultsCollectionView:v14];

    [(TUIEmojiSearchInputViewController *)v4 addChildViewController:*p_remoteSearchViewController];
    double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v4 selector:sel__keyboardInputModeDidChange_ name:*MEMORY[0x1E4FB3028] object:0];

    [(TUIEmojiSearchInputViewController *)v4 _keyboardInputModeDidChange:0];
    uint64_t v19 = [MEMORY[0x1E4FB21C0] feedbackGeneratorWithView:v4->_emojiSearchView];
    feedbackGenerator = v4->_feedbackGenerator;
    v4->_feedbackGenerator = (_UIKBFeedbackGenerating *)v19;
  }
  return v4;
}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateConfigurationForRemoteSearchController];
}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    v1 = +[TUIInputAnalytics getIASignalGenmojiCreationGenmojiButtonPressed];
    +[TUIInputAnalytics sendGenmojiCreationSignal:v1 payload:0];

    id v2 = (void *)*((void *)WeakRetained + 129);
    double v3 = [*((id *)WeakRetained + 148) searchTextField];
    double v4 = [v3 text];
    [v2 presentEmojiGenerationControllerWithInputString:v4];
  }
}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained[129] presentCreateStickerPhotoPickerController];
  }
}

void __60__TUIEmojiSearchInputViewController_initWithNibName_bundle___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained[129] presentAvatarEditor];
  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end