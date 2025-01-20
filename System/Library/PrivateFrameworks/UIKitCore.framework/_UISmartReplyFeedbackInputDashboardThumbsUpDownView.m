@interface _UISmartReplyFeedbackInputDashboardThumbsUpDownView
- (UIButton)thumbsDownButton;
- (UIButton)thumbsUpButton;
- (_UISmartReplyFeedbackInputDashboardThumbsUpDownView)init;
- (void)setThumbsDownButton:(id)a3;
- (void)setThumbsUpButton:(id)a3;
@end

@implementation _UISmartReplyFeedbackInputDashboardThumbsUpDownView

- (_UISmartReplyFeedbackInputDashboardThumbsUpDownView)init
{
  v58[8] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)_UISmartReplyFeedbackInputDashboardThumbsUpDownView;
  v2 = [(_UISmartReplyFeedbackInputDashboardView *)&v57 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[UIAction actionWithHandler:&__block_literal_global_29_3];
    v4 = [(_UISmartReplyFeedbackInputDashboardView *)v2 makeButtonWithSystemImageNamed:@"hand.thumbsdown" action:v3];
    [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 setThumbsDownButton:v4];

    v5 = +[UIAction actionWithHandler:&__block_literal_global_35_3];
    v6 = [(_UISmartReplyFeedbackInputDashboardView *)v2 makeButtonWithSystemImageNamed:@"hand.thumbsup" action:v5];
    [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 setThumbsUpButton:v6];

    v7 = _UILocalizedString(@"_UISmartReplyFeedbackInputDashboardView.shareFeedback", @"Share Feedback button label in the candidate bar for Smart Reply feedback", @"Share Feedback");
    v8 = [(_UISmartReplyFeedbackInputDashboardView *)v2 makeFeedbackLabelWithText:v7];
    [(_UISmartReplyFeedbackInputDashboardView *)v2 setFeedbackLabel:v8];

    v9 = +[UIColor secondaryLabelColor];
    v10 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    [v10 setTextColor:v9];

    v11 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsDownButton];
    [(UIView *)v2 addSubview:v11];

    v12 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    [(UIView *)v2 addSubview:v12];

    v13 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsUpButton];
    [(UIView *)v2 addSubview:v13];

    v14 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsDownButton];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsUpButton];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = (void *)MEMORY[0x1E4F5B268];
    v55 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v54 = [v55 centerYAnchor];
    v53 = [(UIView *)v2 centerYAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v58[0] = v52;
    v51 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v50 = [v51 centerXAnchor];
    v49 = [(UIView *)v2 centerXAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v58[1] = v48;
    v47 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsUpButton];
    v45 = [v47 trailingAnchor];
    v46 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v44 = [v46 leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-0.0];
    v58[2] = v43;
    v42 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsUpButton];
    v40 = [v42 centerYAnchor];
    v41 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v39 = [v41 centerYAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v58[3] = v38;
    v37 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsUpButton];
    v36 = [v37 heightAnchor];
    v35 = [(UIView *)v2 heightAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v58[4] = v34;
    v33 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsDownButton];
    v31 = [v33 leadingAnchor];
    v32 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v30 = [v32 trailingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:0.0];
    v58[5] = v29;
    v28 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsDownButton];
    v17 = [v28 centerYAnchor];
    v18 = [(_UISmartReplyFeedbackInputDashboardView *)v2 feedbackLabel];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v58[6] = v20;
    v21 = [(_UISmartReplyFeedbackInputDashboardThumbsUpDownView *)v2 thumbsDownButton];
    v22 = [v21 heightAnchor];
    v23 = [(UIView *)v2 heightAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v58[7] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:8];
    [v27 activateConstraints:v25];

    objc_destroyWeak(&location);
  }
  return v2;
}

- (UIButton)thumbsDownButton
{
  return self->_thumbsDownButton;
}

- (void)setThumbsDownButton:(id)a3
{
}

- (UIButton)thumbsUpButton
{
  return self->_thumbsUpButton;
}

- (void)setThumbsUpButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbsUpButton, 0);
  objc_storeStrong((id *)&self->_thumbsDownButton, 0);
}

@end