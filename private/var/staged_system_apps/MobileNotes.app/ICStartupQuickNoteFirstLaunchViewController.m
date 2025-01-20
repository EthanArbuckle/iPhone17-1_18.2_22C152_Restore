@interface ICStartupQuickNoteFirstLaunchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)startedWithPencil;
- (NSLayoutConstraint)separator1HeightConstraint;
- (NSLayoutConstraint)separator2HeightConstraint;
- (UIImageView)imageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIView)seperator1;
- (UIView)seperator2;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)initStartedWithPencil:(BOOL)a3 launchBlock:(id)a4;
- (id)launchBlock;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)okAction:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLaunchBlock:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setSeparator1HeightConstraint:(id)a3;
- (void)setSeparator2HeightConstraint:(id)a3;
- (void)setSeperator1:(id)a3;
- (void)setSeperator2:(id)a3;
- (void)setStartedWithPencil:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)settingsAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICStartupQuickNoteFirstLaunchViewController

- (id)initStartedWithPencil:(BOOL)a3 launchBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICStartupQuickNoteFirstLaunchViewController;
  v7 = [(ICStartupQuickNoteFirstLaunchViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ICStartupQuickNoteFirstLaunchViewController *)v7 setStartedWithPencil:v4];
    [(ICStartupQuickNoteFirstLaunchViewController *)v8 setLaunchBlock:v6];
    [(ICStartupQuickNoteFirstLaunchViewController *)v8 setTransitioningDelegate:v8];
    [(ICStartupQuickNoteFirstLaunchViewController *)v8 setModalPresentationStyle:4];
  }

  return v8;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)ICStartupQuickNoteFirstLaunchViewController;
  [(ICStartupQuickNoteFirstLaunchViewController *)&v25 viewDidLoad];
  v3 = [(ICStartupQuickNoteFirstLaunchViewController *)self view];
  BOOL v4 = [v3 layer];
  [v4 setCornerRadius:12.0];

  v5 = [(ICStartupQuickNoteFirstLaunchViewController *)self imageView];
  id v6 = [v5 layer];
  [v6 setCornerRadius:12.0];

  v7 = +[UIColor colorWithDynamicProvider:&stru_100629A88];
  v8 = [(ICStartupQuickNoteFirstLaunchViewController *)self view];
  [v8 setBackgroundColor:v7];

  v9 = [(ICStartupQuickNoteFirstLaunchViewController *)self view];
  [v9 ic_backingScaleFactor];
  double v11 = v10;

  if (v11 > 1.0)
  {
    double v12 = 1.0 / v11;
    v13 = [(ICStartupQuickNoteFirstLaunchViewController *)self separator1HeightConstraint];
    [v13 setConstant:v12];

    v14 = [(ICStartupQuickNoteFirstLaunchViewController *)self separator2HeightConstraint];
    [v14 setConstant:v12];
  }
  v15 = +[UIColor labelColor];
  v16 = [(ICStartupQuickNoteFirstLaunchViewController *)self imageView];
  [v16 setTintColor:v15];

  v17 = +[UIColor labelColor];
  v18 = [(ICStartupQuickNoteFirstLaunchViewController *)self titleLabel];
  [v18 setTextColor:v17];

  v19 = +[UIColor labelColor];
  v20 = [(ICStartupQuickNoteFirstLaunchViewController *)self messageLabel];
  [v20 setTextColor:v19];

  v21 = +[UIColor tableSeparatorLightColor];
  v22 = [(ICStartupQuickNoteFirstLaunchViewController *)self seperator1];
  [v22 setBackgroundColor:v21];

  v23 = +[UIColor tableSeparatorLightColor];
  v24 = [(ICStartupQuickNoteFirstLaunchViewController *)self seperator2];
  [v24 setBackgroundColor:v23];
}

- (void)okAction:(id)a3
{
  [(ICStartupQuickNoteFirstLaunchViewController *)self dismissViewControllerAnimated:1 completion:0];
  BOOL v4 = [(ICStartupQuickNoteFirstLaunchViewController *)self launchBlock];
  v4[2](v4, 0);

  [(ICStartupQuickNoteFirstLaunchViewController *)self setLaunchBlock:0];
}

- (void)settingsAction:(id)a3
{
  [(ICStartupQuickNoteFirstLaunchViewController *)self dismissViewControllerAnimated:1 completion:0];
  BOOL v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  v5 = objc_opt_new();
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyUnlockDevice];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyPromptUnlockDevice];
  id v6 = +[NSURL URLWithString:@"prefs:root=NOTES"];
  [v5 setObject:v6 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadURL];

  v7 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EB808;
  v8[3] = &unk_100629AB0;
  v8[4] = self;
  [v4 openApplication:@"com.apple.Preferences" withOptions:v7 completion:v8];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[ICStartupQuickNoteFirstLaunchPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return _[a3 presentationController];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return _[a3 presentationController];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)separator1HeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separator1HeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSeparator1HeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)separator2HeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separator2HeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSeparator2HeightConstraint:(id)a3
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

- (UILabel)messageLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMessageLabel:(id)a3
{
}

- (BOOL)startedWithPencil
{
  return self->_startedWithPencil;
}

- (void)setStartedWithPencil:(BOOL)a3
{
  self->_startedWithPencil = a3;
}

- (id)launchBlock
{
  return self->_launchBlock;
}

- (void)setLaunchBlock:(id)a3
{
}

- (UIView)seperator1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_seperator1);

  return (UIView *)WeakRetained;
}

- (void)setSeperator1:(id)a3
{
}

- (UIView)seperator2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_seperator2);

  return (UIView *)WeakRetained;
}

- (void)setSeperator2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_seperator2);
  objc_destroyWeak((id *)&self->_seperator1);
  objc_storeStrong(&self->_launchBlock, 0);
  objc_destroyWeak((id *)&self->_messageLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_separator2HeightConstraint);
  objc_destroyWeak((id *)&self->_separator1HeightConstraint);

  objc_destroyWeak((id *)&self->_imageView);
}

@end