@interface _UISmartReplyFeedbackInputDashboardReportConcernView
- (BOOL)touchInView:(id)a3;
- (UIImageView)feedbackIconView;
- (UIView)feedbackIconAndLabelView;
- (_UISmartReplyFeedbackInputDashboardReportConcernView)init;
- (int64_t)touchState;
- (void)setFeedbackIconAndLabelView:(id)a3;
- (void)setFeedbackIconView:(id)a3;
- (void)setTouchState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UISmartReplyFeedbackInputDashboardReportConcernView

- (_UISmartReplyFeedbackInputDashboardReportConcernView)init
{
  v55[5] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)_UISmartReplyFeedbackInputDashboardReportConcernView;
  v2 = [(_UISmartReplyFeedbackInputDashboardView *)&v53 init];
  if (v2)
  {
    v3 = objc_alloc_init(UIView);
    [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 setFeedbackIconAndLabelView:v3];

    v4 = [(_UISmartReplyFeedbackInputDashboardView *)v2 makeImageWithSystemImageNamed:@"exclamationmark.bubble"];
    [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 setFeedbackIconView:v4];

    v5 = _UILocalizedString(@"_UISmartReplyFeedbackInputDashboardView.reportAConcern", @"Report a Concern button label in the candidate bar for Smart Reply feedback", @"Report a Concern");
    v6 = [(_UISmartReplyFeedbackInputDashboardView *)v2 makeFeedbackLabelWithText:v5];
    [(_UISmartReplyFeedbackInputDashboardView *)v2 setFeedbackLabel:v6];

    v7 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v8 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconView];
    [v7 addSubview:v8];

    v9 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v10 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    [v9 addSubview:v10];

    v11 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = (void *)MEMORY[0x1E4F5B268];
    v51 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconView];
    v49 = [v51 leadingAnchor];
    v50 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v48 = [v50 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v55[0] = v47;
    v46 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconView];
    v44 = [v46 centerYAnchor];
    v45 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v43 = [v45 centerYAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v55[1] = v42;
    v41 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v38 = [v41 leadingAnchor];
    v39 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconView];
    v37 = [v39 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:5.0];
    v55[2] = v36;
    v35 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v34 = [v35 trailingAnchor];
    v13 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v14 = [v13 trailingAnchor];
    v15 = [v34 constraintEqualToAnchor:v14];
    v55[3] = v15;
    v16 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v17 = [v16 centerYAnchor];
    v18 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v55[4] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
    [v40 activateConstraints:v21];

    v22 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    [(UIView *)v2 addSubview:v22];

    v23 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v52 = (void *)MEMORY[0x1E4F5B268];
    v24 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v25 = [v24 centerXAnchor];
    v26 = [(UIView *)v2 centerXAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v54[0] = v27;
    v28 = [(_UISmartReplyFeedbackInputDashboardReportConcernView *)v2 feedbackIconAndLabelView];
    v29 = [v28 centerYAnchor];
    v30 = [(UIView *)v2 centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v54[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    [v52 activateConstraints:v32];
  }
  return v2;
}

- (BOOL)touchInView:(id)a3
{
  v3 = self;
  v4 = [a3 touchesForView:self];
  v5 = [v4 anyObject];

  [v5 locationInView:v3];
  LOBYTE(v3) = -[UIView pointInside:withEvent:](v3, "pointInside:withEvent:", 0);

  return (char)v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[UIView setAlpha:](self, "setAlpha:", a3, a4, 0.5);
  [(_UISmartReplyFeedbackInputDashboardReportConcernView *)self setTouchState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  if ([(_UISmartReplyFeedbackInputDashboardReportConcernView *)self touchState] == 1
    && ![(_UISmartReplyFeedbackInputDashboardReportConcernView *)self touchInView:v5])
  {
    [(UIView *)self setAlpha:1.0];
    [(_UISmartReplyFeedbackInputDashboardReportConcernView *)self setTouchState:4];
    v6 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController touch out of bounds", v7, 2u);
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  [(UIView *)self setAlpha:1.0];
  if ([(_UISmartReplyFeedbackInputDashboardReportConcernView *)self touchState] == 1
    && [(_UISmartReplyFeedbackInputDashboardReportConcernView *)self touchInView:v5])
  {
    v6 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController IDV triggered", buf, 2u);
    }

    v7 = +[UIKeyboardImpl activeInstance];
    v8 = [v7 keyboardStateManager];
    v9 = [v8 smartReplyFeedbackManager];
    [v9 reportSmartRepliesConcern];
  }
  else
  {
    v7 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_UISmartReplyFeedbackInputDashboardViewController IDV NOT triggered", v10, 2u);
    }
  }

  [(_UISmartReplyFeedbackInputDashboardReportConcernView *)self setTouchState:3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIView setAlpha:](self, "setAlpha:", a3, a4, 1.0);
  [(_UISmartReplyFeedbackInputDashboardReportConcernView *)self setTouchState:4];
}

- (UIImageView)feedbackIconView
{
  return self->_feedbackIconView;
}

- (void)setFeedbackIconView:(id)a3
{
}

- (UIView)feedbackIconAndLabelView
{
  return self->_feedbackIconAndLabelView;
}

- (void)setFeedbackIconAndLabelView:(id)a3
{
}

- (int64_t)touchState
{
  return self->_touchState;
}

- (void)setTouchState:(int64_t)a3
{
  self->_touchState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackIconAndLabelView, 0);
  objc_storeStrong((id *)&self->_feedbackIconView, 0);
}

@end