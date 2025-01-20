@interface WBSAppReviewPromptManager
- (BOOL)_shouldPromptForReview;
- (WBSAppReviewPromptManager)init;
- (WBSAppReviewPromptManager)initWithPresenter:(id)a3 extensionsController:(id)a4;
- (WBSAppReviewPromptPresenting)presenter;
- (void)_presentIfNeeded;
- (void)didDismissReaderWithScrollPercentage:(double)a3 dateReaderOpened:(id)a4;
- (void)setPresenter:(id)a3;
@end

@implementation WBSAppReviewPromptManager

- (WBSAppReviewPromptManager)init
{
  return 0;
}

- (WBSAppReviewPromptManager)initWithPresenter:(id)a3 extensionsController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSAppReviewPromptManager;
  v8 = [(WBSAppReviewPromptManager *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presenter, v6);
    objc_storeStrong((id *)&v9->_webExtensionsController, a4);
    v10 = v9;
  }

  return v9;
}

- (void)didDismissReaderWithScrollPercentage:(double)a3 dateReaderOpened:(id)a4
{
  id v6 = a4;
  if (a3 >= 0.25)
  {
    id v10 = v6;
    objc_msgSend(v6, "safari_timeIntervalUntilNow");
    id v6 = v10;
    if (v7 >= 30.0)
    {
      v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v9 = [v8 BOOLForKey:@"DebugDidStayInReaderMinimumTime"];

      id v6 = v10;
      if ((v9 & 1) == 0)
      {
        [(WBSAppReviewPromptManager *)self _presentIfNeeded];
        id v6 = v10;
      }
    }
  }
}

- (void)_presentIfNeeded
{
  if ([(WBSAppReviewPromptManager *)self _shouldPromptForReview])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained presentPromptForAppReviewPromptManager:self];
  }
}

- (BOOL)_shouldPromptForReview
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v3 BOOLForKey:@"DebugSatisfiedUserPreferenceKey"] & 1) != 0
    || ([(WBSExtensionsController *)self->_webExtensionsController enabledExtensions],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5)
    || [v3 integerForKey:*MEMORY[0x1E4F98690]] > 1
    || ([v3 BOOLForKey:@"DebugDidTapAtLeastTwoReadingListArticles"] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v3 BOOLForKey:*MEMORY[0x1E4F98870]];
  }

  return v6;
}

- (WBSAppReviewPromptPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (WBSAppReviewPromptPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
}

@end