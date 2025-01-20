@interface HOOnboardingNewFeaturesViewController
+ (int64_t)newFeaturesOnboardingVersion;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingNewFeaturesViewController)initWithDelegate:(id)a3;
- (NSArray)constraints;
- (OBTrayButton)continueButton;
- (void)_continue:(id)a3;
- (void)nextButtonPressed;
- (void)setConstraints:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
@end

@implementation HOOnboardingNewFeaturesViewController

+ (int64_t)newFeaturesOnboardingVersion
{
  return 5;
}

- (HOOnboardingNewFeaturesViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = sub_10002F380(@"HONewFeaturesView_Title");
  v22.receiver = self;
  v22.super_class = (Class)HOOnboardingNewFeaturesViewController;
  v6 = [(HOOnboardingNewFeaturesViewController *)&v22 initWithTitle:v5 detailText:0 icon:0];

  if (v6)
  {
    v7 = sub_10002F380(@"HONewFeaturesView_Subtitle_ControlCenter");
    v8 = sub_10002F380(@"HONewFeaturesView_Description_ControlCenter");
    v9 = +[UIImage imageNamed:@"NewFeatures_ControlCenter"];
    [(HOOnboardingNewFeaturesViewController *)v6 addBulletedListItemWithTitle:v7 description:v8 image:v9];

    v10 = sub_10002F380(@"HONewFeaturesView_Subtitle_AccessoriesOnWatch");
    v11 = sub_10002F380(@"HONewFeaturesView_Description_AccessoriesOnWatch");
    v12 = +[UIImage imageNamed:@"NewFeatures_Watch"];
    [(HOOnboardingNewFeaturesViewController *)v6 addBulletedListItemWithTitle:v10 description:v11 image:v12];

    v13 = sub_10002F380(@"HONewFeaturesView_Subtitle_RestrictedGuest");
    v14 = sub_10002F380(@"HONewFeaturesView_Description_RestrictedGuest");
    v15 = +[UIImage imageNamed:@"NewFeatures_RestrictedGuest"];
    [(HOOnboardingNewFeaturesViewController *)v6 addBulletedListItemWithTitle:v13 description:v14 image:v15];

    uint64_t v16 = +[OBBoldTrayButton boldButton];
    continueButton = v6->_continueButton;
    v6->_continueButton = (OBTrayButton *)v16;

    [(OBTrayButton *)v6->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = v6->_continueButton;
    v19 = sub_10002F380(@"HONewFeaturesView_Button_Continue");
    [(OBTrayButton *)v18 setTitle:v19 forState:0];

    [(OBTrayButton *)v6->_continueButton addTarget:v6 action:"_continue:" forControlEvents:64];
    v20 = [(HOOnboardingNewFeaturesViewController *)v6 buttonTray];
    [v20 addButton:v6->_continueButton];

    [(HOOnboardingNewFeaturesViewController *)v6 setModalInPresentation:1];
    [(HOOnboardingNewFeaturesViewController *)v6 setDelegate:v4];
  }

  return v6;
}

- (void)nextButtonPressed
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HOOnboardingNewFeaturesViewController.m" lineNumber:89 description:@"We aren't supposed to have a next button..."];
}

- (void)_continue:(id)a3
{
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v10, 0x16u);
  }
  v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v8 = [v7 homeManager];
  [v8 hf_enableEventLogOnboardingFlag];

  v9 = [(HOOnboardingNewFeaturesViewController *)self delegate];
  [v9 childViewControllerDidFinish:self];
}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HOOnboardingChildViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->navigationBarDelegate);

  return (HOOnboardingChildViewControllerNavigationBarDelegate *)WeakRetained;
}

- (void)setNavigationBarDelegate:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->navigationBarDelegate);

  objc_destroyWeak((id *)&self->delegate);
}

@end