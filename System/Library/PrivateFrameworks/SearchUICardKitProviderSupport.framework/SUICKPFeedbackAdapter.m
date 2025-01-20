@interface SUICKPFeedbackAdapter
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (CRKFeedbackDelegate)feedbackDelegate;
- (id)feedbackListener;
- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4;
- (void)cardViewDidAppear:(id)a3;
- (void)cardViewDidDisappear:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)presentViewController:(id)a3;
- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4;
- (void)setFeedbackDelegate:(id)a3;
- (void)willDismissViewController:(id)a3;
@end

@implementation SUICKPFeedbackAdapter

- (id)feedbackListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return WeakRetained;
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    v9 = (void *)MEMORY[0x263F316B0];
    v10 = [v4 cardSection];
    v11 = [v9 cardSectionWithSFCardSection:v10];
    char v12 = [v8 shouldHandleEngagement:v4 forCardSection:v11];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void)didEngageCardSection:(id)a3
{
  id v17 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    id v8 = (void *)MEMORY[0x263F316B0];
    v9 = [v17 cardSection];
    v10 = [v8 cardSectionWithSFCardSection:v9];
    [v7 cardSectionView:v10 willProcessEngagementFeedback:v17];
  }
  id v11 = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    v14 = (void *)MEMORY[0x263F316B0];
    v15 = [v17 cardSection];
    v16 = [v14 cardSectionWithSFCardSection:v15];
    [v13 userDidEngageCardSection:v16 withEngagementFeedback:v17];
  }
}

- (void)didPerformCommand:(id)a3
{
  id v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    [v7 commandWasPerformed:v8];
  }
}

- (void)cardViewDidAppear:(id)a3
{
  id v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    id v8 = [v9 card];
    [v7 cardViewDidAppearForCard:v8 withAppearanceFeedback:v9];
  }
}

- (void)cardViewDidDisappear:(id)a3
{
  id v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    id v8 = [v9 card];
    [v7 cardViewDidDisappearForCard:v8 withDisappearanceFeedback:v9];
  }
}

- (void)didReportUserResponseFeedback:(id)a3
{
  id v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    id v8 = [v9 cardSection];
    [v7 userDidReportFeedback:v9 fromCardSection:v8];
  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    [v7 cardSectionViewDidInvalidateSizeForCardSection:0];
  }
}

- (void)presentViewController:(id)a3
{
  id v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    [v7 presentViewController:v8];
  }
}

- (void)willDismissViewController:(id)a3
{
  id v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    [v7 willDismissViewController:v8];
  }
}

- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    [v9 presentViewControllerForCard:v10 animate:v4];
  }
}

- (CRKFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (CRKFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end