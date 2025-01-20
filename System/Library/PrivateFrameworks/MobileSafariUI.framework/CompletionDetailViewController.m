@interface CompletionDetailViewController
- (CompletionDetailViewController)initWithRootViewController:(id)a3;
- (CompletionDetailViewControllerDelegate)completionDetailViewControllerDelegate;
- (void)_didDismissCompletionDetailSheet;
- (void)_dismissCompletionDetailSheet;
- (void)setCompletionDetailViewControllerDelegate:(id)a3;
@end

@implementation CompletionDetailViewController

- (CompletionDetailViewController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CompletionDetailViewController;
  v5 = [(CompletionDetailViewController *)&v12 initWithRootViewController:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(CompletionDetailViewController *)v5 presentationController];
    [v7 setDelegate:v6];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v6 action:sel__dismissCompletionDetailSheet];
    v9 = [v4 navigationItem];
    objc_msgSend(v9, "sf_setPreferredDismissOrDoneButtonItem:", v8);

    v10 = v6;
  }

  return v6;
}

- (void)_dismissCompletionDetailSheet
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CompletionDetailViewController__dismissCompletionDetailSheet__block_invoke;
  v3[3] = &unk_1E6D78630;
  objc_copyWeak(&v4, &location);
  [(CompletionDetailViewController *)self dismissViewControllerAnimated:1 completion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__CompletionDetailViewController__dismissCompletionDetailSheet__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didDismissCompletionDetailSheet];
    id WeakRetained = v2;
  }
}

- (void)_didDismissCompletionDetailSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_completionDetailViewControllerDelegate);
  [WeakRetained completionDetailViewControllerDidDismiss:self];

  id v6 = +[UniversalSearchSession sharedSession];
  id v4 = [v6 feedbackDispatcher];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F99F48]) initWithEvent:4];
  objc_msgSend(v4, "postFeedback:forQueryID:", v5, objc_msgSend(MEMORY[0x1E4F98A50], "currentQueryID"));
}

- (CompletionDetailViewControllerDelegate)completionDetailViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_completionDetailViewControllerDelegate);
  return (CompletionDetailViewControllerDelegate *)WeakRetained;
}

- (void)setCompletionDetailViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_completionDetailViewControllerDelegate);
  objc_storeStrong((id *)&self->_currentStoreSheet, 0);
}

@end