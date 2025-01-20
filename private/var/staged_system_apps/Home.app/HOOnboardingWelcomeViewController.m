@interface HOOnboardingWelcomeViewController
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingWelcomeViewController)initWithDelegate:(id)a3;
- (NSArray)constraints;
- (OBTrayButton)continueButton;
- (UILabel)addAccessoryFromiOSLabel;
- (void)_continue:(id)a3;
- (void)setAddAccessoryFromiOSLabel:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
@end

@implementation HOOnboardingWelcomeViewController

- (HOOnboardingWelcomeViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = sub_100053238(@"HOWelcomeView_Title");
  v30.receiver = self;
  v30.super_class = (Class)HOOnboardingWelcomeViewController;
  v6 = [(HOOnboardingWelcomeViewController *)&v30 initWithTitle:v5 detailText:0 icon:0];

  if (v6)
  {
    v7 = +[UIImage imageNamed:@"HomeWelcomeIcon_Control"];
    v8 = [v7 imageWithRenderingMode:2];

    v9 = +[UIColor systemOrangeColor];
    v10 = [v8 imageWithTintColor:v9];

    v11 = sub_100053238(@"HOWelcomeView_Subtitle_Control");
    v12 = sub_100053238(@"HOWelcomeView_Description_Control");
    [(HOOnboardingWelcomeViewController *)v6 addBulletedListItemWithTitle:v11 description:v12 image:v10];

    v13 = sub_100053238(@"HOWelcomeView_Subtitle_Automate");
    v14 = sub_100053238(@"HOWelcomeView_Description_Automate");
    v15 = +[UIImage imageNamed:@"HomeWelcomeIcon_Automation"];
    [(HOOnboardingWelcomeViewController *)v6 addBulletedListItemWithTitle:v13 description:v14 image:v15];

    v16 = sub_100053238(@"HOWelcomeView_Subtitle_Share");
    v17 = sub_100053238(@"HOWelcomeView_Description_Share");
    v18 = +[UIImage imageNamed:@"HomeWelcomeIcon_Share"];
    [(HOOnboardingWelcomeViewController *)v6 addBulletedListItemWithTitle:v16 description:v17 image:v18];

    v19 = sub_100053238(@"HOWelcomeView_Subtitle_ActivityHistory");
    v20 = sub_100053238(@"HOWelcomeView_Description_ActivityHistory");
    v21 = +[UIImage imageNamed:@"HomeWelcomIcon_ActivityHistory"];
    [(HOOnboardingWelcomeViewController *)v6 addBulletedListItemWithTitle:v19 description:v20 image:v21];

    if ((+[HFUtilities isAMac] & 1) != 0
      || +[HFUtilities isAVisionPro])
    {
      v22 = [(HOOnboardingWelcomeViewController *)v6 buttonTray];
      v23 = sub_100053238(@"HOWelcomeView_FinePrint_AddAccessories");
      [v22 addCaptionText:v23];
    }
    uint64_t v24 = +[OBBoldTrayButton boldButton];
    continueButton = v6->_continueButton;
    v6->_continueButton = (OBTrayButton *)v24;

    [(OBTrayButton *)v6->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = v6->_continueButton;
    v27 = sub_100053238(@"HOWelcomeView_Button_Continue");
    [(OBTrayButton *)v26 setTitle:v27 forState:0];

    [(OBTrayButton *)v6->_continueButton addTarget:v6 action:"_continue:" forControlEvents:64];
    v28 = [(HOOnboardingWelcomeViewController *)v6 buttonTray];
    [v28 addButton:v6->_continueButton];

    [(HOOnboardingWelcomeViewController *)v6 setModalInPresentation:1];
    [(HOOnboardingWelcomeViewController *)v6 setDelegate:v4];
  }
  return v6;
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

  v9 = [(HOOnboardingWelcomeViewController *)self delegate];
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

- (UILabel)addAccessoryFromiOSLabel
{
  return self->_addAccessoryFromiOSLabel;
}

- (void)setAddAccessoryFromiOSLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccessoryFromiOSLabel, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->navigationBarDelegate);

  objc_destroyWeak((id *)&self->delegate);
}

@end