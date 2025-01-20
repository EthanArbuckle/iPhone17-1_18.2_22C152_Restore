@interface SearchUINavigationController
- (BOOL)_canShowWhileLocked;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (void)close;
- (void)setFeedbackDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SearchUINavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUINavigationController;
  [(SearchUINavigationController *)&v7 viewDidDisappear:a3];
  v4 = [(SearchUINavigationController *)self feedbackDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SearchUINavigationController *)self feedbackDelegate];
    [v6 willDismissViewController:self];
  }
}

- (void)close
{
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end