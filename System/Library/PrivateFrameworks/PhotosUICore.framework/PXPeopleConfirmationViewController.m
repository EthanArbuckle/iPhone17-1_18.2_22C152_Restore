@interface PXPeopleConfirmationViewController
- (BOOL)isSummaryViewShowing;
- (BOOL)showTypeDebugColor;
- (BOOL)suggestionsPresented;
- (NSTimer)loadingDelayTimer;
- (PXAnimatedCountView)countView;
- (PXPeopleConfirmationLoadingView)loadingView;
- (PXPeopleConfirmationSummaryViewController)summaryViewController;
- (PXPeopleConfirmationViewController)initWithPerson:(id)a3;
- (PXPeopleSuggestionManager)suggestionManager;
- (PXPeopleSuggestionView)suggestionView;
- (UIActivityIndicatorView)interimLoadingIndicator;
- (UILabel)descriptionLabel;
- (UILabel)interimLoadingLabel;
- (id)personForSummaryViewController:(id)a3;
- (unint64_t)autoConfirmedCountForSummaryViewController:(id)a3;
- (unint64_t)userConfirmedCountForSummaryViewController:(id)a3;
- (unint64_t)viewState;
- (void)_handleSuggestionCompletionWithSuggestion:(id)a3 success:(BOOL)a4;
- (void)cancelOperation:(id)a3;
- (void)confirmTapped:(id)a3;
- (void)confirmationCountUpdatedForSuggestionManager:(id)a3 undoing:(BOOL)a4;
- (void)denyTapped:(id)a3;
- (void)dismissSummary;
- (void)displaySummary;
- (void)doneTapped:(id)a3;
- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3;
- (void)performUndo:(id)a3;
- (void)presentSuggestion:(id)a3 animated:(BOOL)a4;
- (void)setCountView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setInterimLoadingIndicator:(id)a3;
- (void)setInterimLoadingLabel:(id)a3;
- (void)setLoadingDelayTimer:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setShowTypeDebugColor:(BOOL)a3;
- (void)setSuggestionView:(id)a3;
- (void)setSuggestionsPresented:(BOOL)a3;
- (void)setSummaryViewController:(id)a3;
- (void)setViewState:(unint64_t)a3;
- (void)suggestionDidDisplay;
- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4;
- (void)undoConfirm:(id)a3;
- (void)undoDeny:(id)a3;
- (void)updateViewWithViewState:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3;
@end

@implementation PXPeopleConfirmationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, 0);
  objc_storeStrong((id *)&self->_summaryViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_interimLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_interimLoadingLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_countView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
}

- (void)setShowTypeDebugColor:(BOOL)a3
{
  self->_showTypeDebugColor = a3;
}

- (BOOL)showTypeDebugColor
{
  return self->_showTypeDebugColor;
}

- (void)setSuggestionsPresented:(BOOL)a3
{
  self->_suggestionsPresented = a3;
}

- (BOOL)suggestionsPresented
{
  return self->_suggestionsPresented;
}

- (void)setLoadingDelayTimer:(id)a3
{
}

- (NSTimer)loadingDelayTimer
{
  return self->_loadingDelayTimer;
}

- (void)setSummaryViewController:(id)a3
{
}

- (PXPeopleConfirmationSummaryViewController)summaryViewController
{
  return self->_summaryViewController;
}

- (void)setLoadingView:(id)a3
{
}

- (PXPeopleConfirmationLoadingView)loadingView
{
  return self->_loadingView;
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (void)setInterimLoadingIndicator:(id)a3
{
}

- (UIActivityIndicatorView)interimLoadingIndicator
{
  return self->_interimLoadingIndicator;
}

- (void)setInterimLoadingLabel:(id)a3
{
}

- (UILabel)interimLoadingLabel
{
  return self->_interimLoadingLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setCountView:(id)a3
{
}

- (PXAnimatedCountView)countView
{
  return self->_countView;
}

- (void)setSuggestionView:(id)a3
{
}

- (PXPeopleSuggestionView)suggestionView
{
  return self->_suggestionView;
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return (PXPeopleSuggestionManager *)objc_getProperty(self, a2, 984, 1);
}

- (unint64_t)autoConfirmedCountForSummaryViewController:(id)a3
{
  v3 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  unint64_t v4 = [v3 autoConfirmationsCount];

  return v4;
}

- (unint64_t)userConfirmedCountForSummaryViewController:(id)a3
{
  v3 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  unint64_t v4 = [v3 userConfirmationsCount];

  return v4;
}

- (id)personForSummaryViewController:(id)a3
{
  v3 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  unint64_t v4 = [v3 person];

  return v4;
}

- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPeopleConfirmationViewController *)self loadingDelayTimer];
  v6 = v5;
  if (v5) {
    [v5 invalidate];
  }
  objc_initWeak(&location, self);
  v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[PXPeopleConfirmationViewController willLoadMoreSuggestionsForSuggestionManager:]";
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke;
  v13 = &unk_1E5DCD920;
  objc_copyWeak(&v14, &location);
  v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:&v10 block:0.5];

  -[PXPeopleConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", v9, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke_2;
  v5[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __82__PXPeopleConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained loadingDelayTimer];
  v5 = *(void **)(a1 + 32);

  id v6 = PLUIGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Display loading UI (Timer Valid)", buf, 2u);
    }

    id v8 = objc_loadWeakRetained(v2);
    if ([v8 suggestionsPresented]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }

    id v6 = objc_loadWeakRetained(v2);
    [v6 setViewState:v9];
  }
  else if (v7)
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Do not display loading UI (Timer Invalid)", v10, 2u);
  }
}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PXPeopleConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[PXPeopleConfirmationViewController noMoreSuggestionsAvailableForSuggestionManager:]_block_invoke";
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) loadingDelayTimer];
  [v3 invalidate];

  [*(id *)(a1 + 32) setLoadingDelayTimer:0];
  return [*(id *)(a1 + 32) displaySummary];
}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PXPeopleConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __83__PXPeopleConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "Suggestions UI: Present Suggestion: %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) presentSuggestion:v2 animated:1];
}

- (void)confirmationCountUpdatedForSuggestionManager:(id)a3 undoing:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  uint64_t v6 = [v16 autoConfirmationsCount];
  uint64_t v7 = [v16 userConfirmationsCount] + v6;
  id v8 = [(PXPeopleConfirmationViewController *)self countView];
  if (!v4 || (uint64_t v9 = @" ", [v16 canUndo]) && v7)
  {
    uint64_t v10 = PXLocalizedStringFromTable(@"PXPeopleConfirmAdditionalCountToBeAdded", @"PhotosUICore");
    uint64_t v15 = v7;
    PXStringWithValidatedFormat();
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v4) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = objc_msgSend(v8, "text", v15);
  int v13 = [(__CFString *)v9 isEqualToString:v12];

  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v11;
  }
  [v8 setText:v9 withAnimationStyle:v14];
}

- (void)cancelOperation:(id)a3
{
  BOOL v4 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v4 removeAllActionsWithTarget:self];

  id v6 = [(PXPeopleConfirmationViewController *)self navigationController];
  id v5 = (id)[v6 popViewControllerAnimated:1];
}

- (void)doneTapped:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[PXPeopleConfirmationViewController doneTapped:]";
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  [v5 commitUserResponses];

  id v6 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v6 removeAllActionsWithTarget:self];

  [(PXPeopleConfirmationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)performUndo:(id)a3
{
  id v4 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  if ([v4 canUndo])
  {
    if ([(PXPeopleConfirmationViewController *)self isSummaryViewShowing])
    {
      [(PXPeopleConfirmationViewController *)self dismissSummary];
      [(PXPeopleConfirmationViewController *)self setViewState:1];
    }
    [v4 undo];
  }
}

- (void)undoDeny:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[PXPeopleConfirmationViewController undoDeny:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v6 registerUndoWithTarget:self selector:sel_denyTapped_ object:v4];
  int v7 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v8 = [v7 person];
  uint64_t v9 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, @"PXPeopleUndoRedoDenyTitle");
  [v6 setActionName:v9];

  [(PXPeopleConfirmationViewController *)self performUndo:v4];
}

- (void)undoConfirm:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[PXPeopleConfirmationViewController undoConfirm:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v6 registerUndoWithTarget:self selector:sel_confirmTapped_ object:v4];
  int v7 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v8 = [v7 person];
  uint64_t v9 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, @"PXPeopleUndoRedoConfirmTitle");
  [v6 setActionName:v9];

  [(PXPeopleConfirmationViewController *)self performUndo:v4];
}

- (void)denyTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    int v13 = "-[PXPeopleConfirmationViewController denyTapped:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v6 registerUndoWithTarget:self selector:sel_undoDeny_ object:v4];

  int v7 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v8 = [v7 person];
  uint64_t v9 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, @"PXPeopleUndoRedoDenyTitle");
  [v6 setActionName:v9];

  int v10 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  uint64_t v11 = [v10 currentSuggestions];
  [v10 markSuggestions:v11 confirmed:0 wantsSound:1];

  [v10 requestNextSuggestion];
}

- (void)confirmTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    int v13 = "-[PXPeopleConfirmationViewController confirmTapped:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Suggestions UI: %s", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [(PXPeopleConfirmationViewController *)self undoManager];
  [v6 registerUndoWithTarget:self selector:sel_undoConfirm_ object:v4];

  int v7 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v8 = [v7 person];
  uint64_t v9 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, @"PXPeopleUndoRedoConfirmTitle");
  [v6 setActionName:v9];

  int v10 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  uint64_t v11 = [v10 currentSuggestions];
  [v10 markSuggestions:v11 confirmed:1 wantsSound:1];

  [v10 requestNextSuggestion];
}

- (void)_handleSuggestionCompletionWithSuggestion:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v4)
  {
    int v7 = [(PXPeopleConfirmationViewController *)self suggestionManager];
    v12[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 markSuggestionsAsSkipped:v8];

    [v7 requestNextSuggestion];
    goto LABEL_5;
  }
  [(PXPeopleConfirmationViewController *)self suggestionDidDisplay];
  if ([(PXPeopleConfirmationViewController *)self showTypeDebugColor])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__PXPeopleConfirmationViewController__handleSuggestionCompletionWithSuggestion_success___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    id v10 = v6;
    uint64_t v11 = self;
    dispatch_async(MEMORY[0x1E4F14428], v9);
    int v7 = v10;
LABEL_5:
  }
}

void __88__PXPeopleConfirmationViewController__handleSuggestionCompletionWithSuggestion_success___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPersonModel]) {
    [MEMORY[0x1E4FB1618] greenColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] redColor];
  }
  v2 = [*(id *)(a1 + 40) view];
  [v2 setBackgroundColor:v3];
}

- (void)suggestionDidDisplay
{
  [(PXPeopleConfirmationViewController *)self setSuggestionsPresented:1];
  id v3 = [(PXPeopleConfirmationViewController *)self loadingDelayTimer];
  [v3 invalidate];

  [(PXPeopleConfirmationViewController *)self setLoadingDelayTimer:0];
  [(PXPeopleConfirmationViewController *)self setViewState:1];
}

- (BOOL)isSummaryViewShowing
{
  v2 = [(PXPeopleConfirmationViewController *)self summaryViewController];
  id v3 = [v2 view];
  BOOL v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)updateViewWithViewState:(unint64_t)a3
{
  BOOL v5 = [(PXPeopleConfirmationViewController *)self loadingView];
  id v6 = v5;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke;
    aBlock[3] = &unk_1E5DD36F8;
    id v14 = v5;
    int v7 = (void (**)(void))_Block_copy(aBlock);
    v7[2]();

    id v8 = v14;
  }
  else
  {
    uint64_t v9 = [(PXPeopleConfirmationViewController *)self interimLoadingIndicator];
    [v9 stopAnimating];

    if (a3 != 5)
    {
      [v6 setAlpha:0.0];
      [v6 setLoadingState:0];
      goto LABEL_7;
    }
    [v6 setLoadingState:2];
    id v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_3;
    v11[3] = &unk_1E5DD36F8;
    id v12 = v6;
    [v10 animateWithDuration:v11 animations:0.33];
    id v8 = v12;
  }

LABEL_7:
}

void __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoadingState:1];
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_2;
  v3[3] = &unk_1E5DD36F8;
  id v4 = *(id *)(a1 + 32);
  [v2 animateWithDuration:v3 animations:0.33];
}

uint64_t __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __62__PXPeopleConfirmationViewController_updateViewWithViewState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setViewState:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPeopleConfirmationViewController_setViewState___block_invoke;
  aBlock[3] = &unk_1E5DD08D8;
  void aBlock[4] = self;
  aBlock[5] = a3;
  id v4 = (void (**)(void))_Block_copy(aBlock);
  BOOL v5 = +[PXPeopleUISettings sharedInstance];
  int v6 = [v5 forceReviewMorePhotosInterimLoading];

  if (v6)
  {
    self->_viewState = 3;
    [(PXPeopleConfirmationViewController *)self updateViewWithViewState:3];
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXPeopleConfirmationViewController_setViewState___block_invoke_2;
    block[3] = &unk_1E5DD3128;
    uint64_t v9 = v4;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __51__PXPeopleConfirmationViewController_setViewState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) viewState];
  uint64_t v3 = *(void *)(a1 + 40);
  if (result != v3)
  {
    *(void *)(*(void *)(a1 + 32) + 1032) = v3;
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 updateViewWithViewState:v5];
  }
  return result;
}

uint64_t __51__PXPeopleConfirmationViewController_setViewState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissSummary
{
  v2 = [(PXPeopleConfirmationViewController *)self summaryViewController];
  uint64_t v3 = [v2 view];
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke;
  v10[3] = &unk_1E5DD36F8;
  id v11 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke_2;
  v7[3] = &unk_1E5DD0058;
  id v8 = v2;
  id v9 = v11;
  id v5 = v11;
  id v6 = v2;
  [v4 animateWithDuration:0 delay:v10 options:v7 animations:0.4 completion:0.0];
}

uint64_t __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __52__PXPeopleConfirmationViewController_dismissSummary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 32) removeFromParentViewController];
  v2 = *(void **)(a1 + 32);
  return [v2 didMoveToParentViewController:0];
}

- (void)displaySummary
{
  if ([(PXPeopleConfirmationViewController *)self suggestionsPresented])
  {
    uint64_t v3 = [(PXPeopleConfirmationViewController *)self view];
    id v4 = [(PXPeopleConfirmationViewController *)self summaryViewController];
    if (!v4)
    {
      id v4 = [[PXPeopleConfirmationSummaryViewController alloc] initWithDelegate:self];
      [(PXPeopleConfirmationViewController *)self setSummaryViewController:v4];
    }
    id v5 = [(PXPeopleConfirmationSummaryViewController *)v4 view];
    [v3 bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setAlpha:0.0];
    [(PXPeopleConfirmationViewController *)self addChildViewController:v4];
    [v3 addSubview:v5];
    [(PXPeopleConfirmationSummaryViewController *)v4 didMoveToParentViewController:self];
    id v6 = [(PXPeopleConfirmationViewController *)self countView];
    [v6 setText:@" " withAnimationStyle:1];

    dispatch_time_t v7 = (void *)MEMORY[0x1E4FB1EB0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PXPeopleConfirmationViewController_displaySummary__block_invoke;
    v9[3] = &unk_1E5DD36F8;
    id v10 = v5;
    id v8 = v5;
    [v7 animateWithDuration:0 delay:v9 options:0 animations:0.4 completion:0.0];
  }
  else
  {
    [(PXPeopleConfirmationViewController *)self setViewState:5];
  }
}

uint64_t __52__PXPeopleConfirmationViewController_displaySummary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)presentSuggestion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PXPeopleConfirmationViewController *)self view];

  id v7 = v6;
  id v8 = v7;
  if (v7) {
    goto LABEL_3;
  }
  id v9 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v10 = [v9 currentSuggestions];

  id v8 = [v10 firstObject];

  if (v8)
  {
LABEL_3:
    objc_initWeak(&location, self);
    id v11 = [(PXPeopleConfirmationViewController *)self suggestionView];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PXPeopleConfirmationViewController_presentSuggestion_animated___block_invoke;
    v14[3] = &unk_1E5DD21B0;
    objc_copyWeak(&v16, &location);
    id v12 = v8;
    id v15 = v12;
    [v11 setSuggestion:v12 animated:v4 withCompletion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXPeopleConfirmationViewController *)self displaySummary];
    if ([(PXPeopleConfirmationViewController *)self showTypeDebugColor])
    {
      int v13 = [(PXPeopleConfirmationViewController *)self view];
      [v13 setBackgroundColor:0];
    }
  }
}

void __65__PXPeopleConfirmationViewController_presentSuggestion_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSuggestionCompletionWithSuggestion:*(void *)(a1 + 32) success:a2];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidLoad
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)PXPeopleConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v43 viewDidLoad];
  objc_super v3 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  [v3 preloadSounds];

  BOOL v4 = [(PXPeopleConfirmationViewController *)self view];
  id v5 = objc_alloc_init(PXPeopleSuggestionView);
  suggestionView = self->_suggestionView;
  self->_suggestionView = v5;

  [(PXPeopleSuggestionView *)self->_suggestionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:self->_suggestionView];
  id v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v7;

  id v9 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  id v10 = [v9 person];

  id v11 = objc_msgSend(v10, "px_longStyleLocalizedName");
  v40 = v11;
  if ([v11 length])
  {
    id v12 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleConfirmMessage");
    v33 = v11;
    int v13 = PXStringWithValidatedFormat();
    -[UILabel setText:](self->_descriptionLabel, "setText:", v13, v33);
  }
  else
  {
    id v12 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleConfirmUnnamedReplacementMessage");
    [(UILabel *)self->_descriptionLabel setText:v12];
  }

  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  id v14 = [PXPeopleConfirmationLoadingView alloc];
  [v4 bounds];
  v41 = v10;
  id v15 = -[PXPeopleConfirmationLoadingView initWithFrame:person:](v14, "initWithFrame:person:", v10);
  loadingView = self->_loadingView;
  self->_loadingView = v15;

  [(PXPeopleConfirmationLoadingView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXPeopleConfirmationLoadingView *)self->_loadingView setAlpha:0.0];
  [v4 addSubview:self->_loadingView];
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  interimLoadingLabel = self->_interimLoadingLabel;
  self->_interimLoadingLabel = v17;

  v19 = PXLocalizedStringFromTable(@"PXPeopleConfirmationLoadingMessageiOS", @"PhotosUICore");
  [(UILabel *)self->_interimLoadingLabel setText:v19];

  [(UILabel *)self->_interimLoadingLabel setTextAlignment:1];
  [(UILabel *)self->_interimLoadingLabel setLineBreakMode:4];
  v20 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E4FB1400]);
  interimLoadingIndicator = self->_interimLoadingIndicator;
  self->_interimLoadingIndicator = v20;

  uint64_t v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UIActivityIndicatorView *)self->_interimLoadingIndicator setActivityIndicatorViewStyle:100];
  v39 = (void *)v22;
  [(UILabel *)self->_interimLoadingLabel setTextColor:v22];
  v34 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(PXPeopleConfirmationLoadingView *)self->_loadingView leadingAnchor];
  v37 = [v4 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v44[0] = v36;
  v35 = [(PXPeopleConfirmationLoadingView *)self->_loadingView trailingAnchor];
  v23 = [v4 trailingAnchor];
  v24 = [v35 constraintEqualToAnchor:v23];
  v44[1] = v24;
  v25 = [(PXPeopleConfirmationLoadingView *)self->_loadingView topAnchor];
  v26 = [v4 topAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v44[2] = v27;
  v28 = [(PXPeopleConfirmationLoadingView *)self->_loadingView bottomAnchor];
  v42 = v4;
  v29 = [v4 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v44[3] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [v34 activateConstraints:v31];

  unint64_t v32 = [(PXPeopleConfirmationViewController *)self viewState];
  if (v32) {
    [(PXPeopleConfirmationViewController *)self updateViewWithViewState:v32];
  }
}

- (PXPeopleConfirmationViewController)initWithPerson:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleConfirmationViewController;
  id v5 = [(PXPeopleConfirmationViewController *)&v13 init];
  if (v5)
  {
    id v6 = [[PXPeopleSuggestionManager alloc] initWithPerson:v4];
    suggestionManager = v5->_suggestionManager;
    v5->_suggestionManager = v6;

    [(PXPeopleSuggestionManager *)v5->_suggestionManager setDelegate:v5];
    id v8 = PXLocalizedStringFromTable(@"PXPeopleConfirmScreenTitle", @"PhotosUICore");
    id v9 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:0];
    [(PXPeopleSuggestionManager *)v5->_suggestionManager setDataSource:v9];
    id v10 = [(PXPeopleConfirmationViewController *)v5 navigationItem];
    [v10 setTitle:v8];

    id v11 = +[PXPeopleUISettings sharedInstance];
    v5->_showTypeDebugColor = [v11 displayReviewMorePhotosSuggestionType];
  }
  return v5;
}

@end