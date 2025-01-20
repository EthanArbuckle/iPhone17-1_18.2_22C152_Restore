@interface UniversalSearchResultTableSectionHeaderView
- (NSString)title;
- (NSURL)reportProblemURL;
- (UniversalSearchFeedbackDelegate)feedbackDelegate;
- (void)_handleParsecFeedbackButtonTap:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setReportProblemURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UniversalSearchResultTableSectionHeaderView

- (void)setReportProblemURL:(id)a3
{
  v5 = (NSURL *)a3;
  if (self->_reportProblemURL != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_reportProblemURL, a3);
    feedbackButton = self->_feedbackButton;
    if (self->_reportProblemURL)
    {
      if (!feedbackButton)
      {
        v7 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
        v8 = self->_feedbackButton;
        self->_feedbackButton = v7;

        [(UIButton *)self->_feedbackButton setTranslatesAutoresizingMaskIntoConstraints:0];
        v9 = self->_feedbackButton;
        v10 = [MEMORY[0x1E4FB1818] imageNamed:@"ParsecBugButton"];
        v11 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
        v12 = [v10 _flatImageWithColor:v11];
        [(UIButton *)v9 setImage:v12 forState:0];

        [(UIButton *)self->_feedbackButton addTarget:self action:sel__handleParsecFeedbackButtonTap_ forControlEvents:64];
      }
      v13 = [(UniversalSearchResultTableSectionHeaderView *)self contentView];
      [v13 addSubview:self->_feedbackButton];
      v14 = (void *)MEMORY[0x1E4F28DC8];
      v15 = _NSDictionaryOfVariableBindings((NSString *)@"_feedbackButton", self->_feedbackButton, 0);
      v16 = [v14 constraintsWithVisualFormat:@"H:[_feedbackButton(15)]-3-|" options:0 metrics:0 views:v15];
      [v13 addConstraints:v16];

      v17 = (void *)MEMORY[0x1E4F28DC8];
      v18 = _NSDictionaryOfVariableBindings((NSString *)@"_feedbackButton", self->_feedbackButton, 0);
      v19 = [v17 constraintsWithVisualFormat:@"V:[_feedbackButton(15)]" options:0 metrics:0 views:v18];
      [v13 addConstraints:v19];

      v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_feedbackButton attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
      [v13 addConstraint:v20];
    }
    else
    {
      [(UIButton *)feedbackButton removeFromSuperview];
    }
    v5 = v21;
  }
}

- (void)_handleParsecFeedbackButtonTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  [WeakRetained feedbackButtonWasTappedWithProblemURL:self->_reportProblemURL];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)reportProblemURL
{
  return self->_reportProblemURL;
}

- (UniversalSearchFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (UniversalSearchFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_reportProblemURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
}

@end