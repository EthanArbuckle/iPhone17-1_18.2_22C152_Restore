@interface _UISmartReplyFeedbackInputDashboardView
+ (id)makeBackgroundView;
- (UILabel)feedbackLabel;
- (_UISmartReplyFeedbackInputDashboardView)init;
- (id)makeButtonWithSystemImageNamed:(id)a3 action:(id)a4;
- (id)makeFeedbackLabelWithText:(id)a3;
- (id)makeImageWithSystemImageNamed:(id)a3;
- (void)setFeedbackLabel:(id)a3;
@end

@implementation _UISmartReplyFeedbackInputDashboardView

- (_UISmartReplyFeedbackInputDashboardView)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISmartReplyFeedbackInputDashboardView;
  return [(UIView *)&v3 init];
}

- (id)makeButtonWithSystemImageNamed:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:-1];
  v8 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:17.0];
  v9 = [v7 configurationByApplyingConfiguration:v8];

  v10 = +[UIImage _systemImageNamed:v6 withConfiguration:v9];

  v11 = +[UIButtonConfiguration plainButtonConfiguration];
  objc_msgSend(v11, "setContentInsets:", 5.0, 20.0, 5.0, 20.0);
  [v11 setImage:v10];
  v12 = +[UIButton buttonWithConfiguration:v11 primaryAction:v5];

  [v12 setConfigurationUpdateHandler:&__block_literal_global_512];
  return v12;
}

- (id)makeFeedbackLabelWithText:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UILabel);
  id v5 = +[UIMorphingLabel preferredFontWithSize:17.0];
  [(UILabel *)v4 setFont:v5];

  [(UILabel *)v4 setText:v3];
  id v6 = +[UIColor labelColor];
  [(UILabel *)v4 setTextColor:v6];

  [(UILabel *)v4 setTextAlignment:1];
  [(UILabel *)v4 setAdjustsFontSizeToFitWidth:1];
  return v4;
}

- (id)makeImageWithSystemImageNamed:(id)a3
{
  id v3 = a3;
  v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:-1];
  id v5 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:17.0];
  id v6 = [v4 configurationByApplyingConfiguration:v5];

  v7 = +[UIImage _systemImageNamed:v3 withConfiguration:v6];

  v8 = [[UIImageView alloc] initWithImage:v7];
  return v8;
}

+ (id)makeBackgroundView
{
  v2 = [UIView alloc];
  id v3 = -[UIView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v3 _setContinuousCornerRadius:10.0];
  return v3;
}

- (UILabel)feedbackLabel
{
  return self->_feedbackLabel;
}

- (void)setFeedbackLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end