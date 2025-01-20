@interface ICAllowNotificationsViewController
+ (NSString)imageName;
- (NSArray)buttonMarginConstraints;
- (NSLayoutConstraint)continueButtonWidthConstraint;
- (NSLayoutConstraint)hiddenButtonWidthConstraint;
- (NSLayoutConstraint)leadingLabelMarginConstraint;
- (NSLayoutConstraint)trailingLabelMarginConstraint;
- (UIButton)continueButton;
- (UIButton)invisibleBottomButton;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIStackView)buttonStackView;
- (id)completionHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)continuePressed:(id)a3;
- (void)setButtonMarginConstraints:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonWidthConstraint:(id)a3;
- (void)setHiddenButtonWidthConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInvisibleBottomButton:(id)a3;
- (void)setLeadingLabelMarginConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingLabelMarginConstraint:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation ICAllowNotificationsViewController

+ (NSString)imageName
{
  if (+[UIDevice ic_isVision])
  {
    v2 = @"allow_notifications_banner";
  }
  else
  {
    unsigned int v3 = +[UIDevice ic_is12hrClock];
    CFStringRef v4 = @"24hr";
    if (v3) {
      CFStringRef v4 = @"12hr";
    }
    v2 = +[NSString stringWithFormat:@"ios_allow_notifications_%@", v4];
  }

  return (NSString *)v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  unsigned int v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)ICAllowNotificationsViewController;
  return [(ICAllowNotificationsViewController *)&v6 supportedInterfaceOrientations];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)ICAllowNotificationsViewController;
  [(ICAllowNotificationsViewController *)&v8 viewDidLoad];
  unsigned int v3 = [(id)objc_opt_class() imageName];
  id v4 = +[UIImage imageNamed:v3];
  v5 = [(ICAllowNotificationsViewController *)self imageView];
  [v5 setImage:v4];

  objc_super v6 = +[UIFont ic_preferredFontForStyle:UIFontTextStyleLargeTitle withFontWeight:UIFontWeightBold];
  v7 = [(ICAllowNotificationsViewController *)self titleLabel];
  [v7 setFont:v6];
}

- (void)updateViewConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)ICAllowNotificationsViewController;
  [(ICAllowNotificationsViewController *)&v23 updateViewConstraints];
  if (+[UIDevice ic_isVision])
  {
    unsigned int v3 = [(ICAllowNotificationsViewController *)self continueButtonWidthConstraint];
    [v3 setActive:1];

    id v4 = [(ICAllowNotificationsViewController *)self hiddenButtonWidthConstraint];
    [v4 setActive:1];

    v5 = [(ICAllowNotificationsViewController *)self buttonMarginConstraints];
    +[NSLayoutConstraint deactivateConstraints:v5];

    objc_super v6 = [(ICAllowNotificationsViewController *)self leadingLabelMarginConstraint];
    v7 = v6;
    double v8 = 36.0;
LABEL_6:
    [v6 setConstant:v8];

    v17 = [(ICAllowNotificationsViewController *)self trailingLabelMarginConstraint];
    v18 = v17;
    double v19 = v8;
    goto LABEL_7;
  }
  v9 = [(ICAllowNotificationsViewController *)self ic_windowScene];
  v10 = [v9 traitCollection];
  unsigned int v11 = [v10 ic_hasCompactWidth];

  v12 = [(ICAllowNotificationsViewController *)self continueButtonWidthConstraint];
  v13 = v12;
  if (!v11)
  {
    [v12 setActive:1];

    v20 = [(ICAllowNotificationsViewController *)self hiddenButtonWidthConstraint];
    [v20 setActive:1];

    v21 = [(ICAllowNotificationsViewController *)self buttonMarginConstraints];
    +[NSLayoutConstraint deactivateConstraints:v21];

    objc_super v6 = [(ICAllowNotificationsViewController *)self leadingLabelMarginConstraint];
    v7 = v6;
    double v8 = 74.0;
    goto LABEL_6;
  }
  [v12 setActive:0];

  v14 = [(ICAllowNotificationsViewController *)self hiddenButtonWidthConstraint];
  [v14 setActive:0];

  v15 = [(ICAllowNotificationsViewController *)self buttonMarginConstraints];
  +[NSLayoutConstraint activateConstraints:v15];

  v16 = [(ICAllowNotificationsViewController *)self leadingLabelMarginConstraint];
  [v16 setConstant:24.0];

  v17 = [(ICAllowNotificationsViewController *)self trailingLabelMarginConstraint];
  v18 = v17;
  double v19 = 24.0;
LABEL_7:
  [v17 setConstant:v19];

  v22 = [(ICAllowNotificationsViewController *)self view];
  [v22 setAccessibilityViewIsModal:1];
}

- (void)continuePressed:(id)a3
{
  id v4 = [(ICAllowNotificationsViewController *)self continueButton];
  [v4 setEnabled:0];

  v5 = [(ICAllowNotificationsViewController *)self completionHandler];

  if (v5)
  {
    objc_super v6 = [(ICAllowNotificationsViewController *)self completionHandler];
    v6[2]();
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)leadingLabelMarginConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingLabelMarginConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLeadingLabelMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingLabelMarginConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingLabelMarginConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTrailingLabelMarginConstraint:(id)a3
{
}

- (UIStackView)buttonStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonStackView);

  return (UIStackView *)WeakRetained;
}

- (void)setButtonStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)continueButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButton);

  return (UIButton *)WeakRetained;
}

- (void)setContinueButton:(id)a3
{
}

- (UIButton)invisibleBottomButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invisibleBottomButton);

  return (UIButton *)WeakRetained;
}

- (void)setInvisibleBottomButton:(id)a3
{
}

- (NSArray)buttonMarginConstraints
{
  return self->_buttonMarginConstraints;
}

- (void)setButtonMarginConstraints:(id)a3
{
}

- (NSLayoutConstraint)continueButtonWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButtonWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setContinueButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)hiddenButtonWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hiddenButtonWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setHiddenButtonWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hiddenButtonWidthConstraint);
  objc_destroyWeak((id *)&self->_continueButtonWidthConstraint);
  objc_storeStrong((id *)&self->_buttonMarginConstraints, 0);
  objc_destroyWeak((id *)&self->_invisibleBottomButton);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_buttonStackView);
  objc_destroyWeak((id *)&self->_trailingLabelMarginConstraint);
  objc_destroyWeak((id *)&self->_leadingLabelMarginConstraint);
  objc_destroyWeak((id *)&self->_imageView);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end