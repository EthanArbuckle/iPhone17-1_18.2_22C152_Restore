@interface SplashScreenViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)isModalInPresentation;
- (SplashScreenViewController)init;
- (id)doneBlock;
- (unint64_t)supportedInterfaceOrientations;
- (void)_continueButtonTappedCallback;
- (void)dismissSplashScreen;
- (void)setDoneBlock:(id)a3;
@end

@implementation SplashScreenViewController

- (SplashScreenViewController)init
{
  v3 = +[CUIKSplashScreenStrings title];
  v28.receiver = self;
  v28.super_class = (Class)SplashScreenViewController;
  v4 = [(SplashScreenViewController *)&v28 initWithTitle:v3 detailText:0 icon:0];

  if (v4)
  {
    [(SplashScreenViewController *)v4 setModalPresentationStyle:2];
    v5 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle1 scale:3];
    v6 = +[CUIKSplashScreenStrings reminderIntegrationTitle];
    v7 = +[CUIKSplashScreenStrings reminderIntegrationText];
    v8 = +[CUIKSplashScreenStrings reminderIntegrationIcon];
    v9 = +[UIImage systemImageNamed:v8 withConfiguration:v5];
    [(SplashScreenViewController *)v4 addBulletedListItemWithTitle:v6 description:v7 image:v9];

    v10 = +[UIDevice currentDevice];
    id v11 = [v10 userInterfaceIdiom];

    if (!v11)
    {
      v12 = +[CUIKSplashScreenStrings monthViewScaleTitle];
      v13 = +[CUIKSplashScreenStrings monthViewScaleText];
      v14 = +[CUIKSplashScreenStrings monthViewScaleIcon];
      v15 = +[UIImage systemImageNamed:v14 withConfiguration:v5];
      [(SplashScreenViewController *)v4 addBulletedListItemWithTitle:v12 description:v13 image:v15];
    }
    if ((+[EKFeatureSet eventsFoundInAppsEnabled] & 1) == 0)
    {
      v16 = +[CUIKSplashScreenStrings suggestedEventsTitleText];
      v17 = +[CUIKSplashScreenStrings suggestedEventsFeatureText];
      v18 = +[CUIKSplashScreenStrings suggestedEventsIcon];
      v19 = +[UIImage systemImageNamed:v18 withConfiguration:v5];
      [(SplashScreenViewController *)v4 addBulletedListItemWithTitle:v16 description:v17 image:v19];
    }
    if ((+[EKFeatureSet automaticGeocodingEnabled] & 1) == 0)
    {
      v20 = +[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingTitleText];
      v21 = +[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingFeatureText];
      v22 = +[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingIcon];
      v23 = +[UIImage systemImageNamed:v22 withConfiguration:v5];
      [(SplashScreenViewController *)v4 addBulletedListItemWithTitle:v20 description:v21 image:v23];
    }
    v24 = +[OBBoldTrayButton boldButton];
    v25 = +[CUIKSplashScreenStrings continueButtonText];
    [v24 setTitle:v25 forState:0];

    [v24 addTarget:v4 action:"dismissSplashScreen" forControlEvents:64];
    v26 = [(SplashScreenViewController *)v4 buttonTray];
    [v26 addButton:v24];
  }
  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SplashScreenViewController *)self view];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  double Width = CGRectGetWidth(v20);
  EKUIWidthForWindowSizeParadigm();
  if (Width < v12)
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    double Height = CGRectGetHeight(v21);
    EKUIHeightForWindowSizeParadigm();
    if (Height < v14) {
      return 2;
    }
  }
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double v15 = CGRectGetWidth(v22);
  EKUIWidthForWindowSizeParadigm();
  if (v15 >= v16) {
    return 30;
  }
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double v17 = CGRectGetHeight(v23);
  EKUIHeightForWindowSizeParadigm();
  if (v17 >= v18) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)dismissSplashScreen
{
}

- (void)_continueButtonTappedCallback
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1001D2D78);
  uint64_t v3 = [(SplashScreenViewController *)self doneBlock];
  CGFloat v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    [(SplashScreenViewController *)self setDoneBlock:0];
  }
  else
  {
    double v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      double v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No 'done' blocked given.  Will not notify that [%@] is done.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end