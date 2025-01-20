@interface SFAutoFillInternalFeedbackActivityNotificationViewController
- (SFAutoFillInternalFeedbackActivityNotificationViewController)initWithDiagnosticsData:(id)a3;
- (SFAutoFillInternalFeedbackActivityNotificationViewControllerDelegate)delegate;
- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData;
- (void)_handleThumbsDown:(id)a3;
- (void)_handleThumbsUp:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SFAutoFillInternalFeedbackActivityNotificationViewController

- (SFAutoFillInternalFeedbackActivityNotificationViewController)initWithDiagnosticsData:(id)a3
{
  id v5 = a3;
  v6 = _WBSLocalizedString();
  v7 = _WBSLocalizedString();
  v13.receiver = self;
  v13.super_class = (Class)SFAutoFillInternalFeedbackActivityNotificationViewController;
  v8 = [(SFActivityNotificationViewController *)&v13 initWithTitleText:v6 messageText:v7];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_diagnosticsData, a3);
    v9 = createButton(@"hand.thumbsup", v8, (uint64_t)sel__handleThumbsUp_);
    [(SFActivityNotificationViewController *)v8 setLeadingAccessoryView:v9];

    v10 = createButton(@"hand.thumbsdown", v8, (uint64_t)sel__handleThumbsDown_);
    [(SFActivityNotificationViewController *)v8 setTrailingAccessoryView:v10];

    v11 = v8;
  }

  return v8;
}

- (void)_handleThumbsUp:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoFillInternalFeedbackActivityNotice:self shouldPresentFeedbackForm:0];
}

- (void)_handleThumbsDown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoFillInternalFeedbackActivityNotice:self shouldPresentFeedbackForm:1];
}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return self->_diagnosticsData;
}

- (SFAutoFillInternalFeedbackActivityNotificationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAutoFillInternalFeedbackActivityNotificationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_diagnosticsData, 0);
}

@end