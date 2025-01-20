@interface MTWelcomeViewController
- (BOOL)acknowledged;
- (BOOL)isModalInPresentation;
- (MTWelcomeViewController)init;
- (MTWelcomeViewController)initWithMetricsSender:(id)a3;
- (MTWelcomeViewControllerMetricsSender)metricsSender;
- (NSMutableArray)acknowledgementCompletionBlocks;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)addAcknowledgementCompletionBlock:(id)a3;
- (void)didTapStartButton;
- (void)performAcknowledgementCompletionBlocks;
- (void)setAcknowledged:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTWelcomeViewController

- (MTWelcomeViewController)init
{
  v3 = +[NSBundle mainBundle];
  v31 = [v3 localizedStringForKey:@"WELCOME_START_LINK" value:&stru_10056A8A0 table:0];

  v32 = +[OBPrivacyLinkController linkWithBundleIdentifier:kMTPodcastsPrivacyIdentifier];
  [v32 setModalPresentationStyle:2];
  v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  v30 = [v4 objectForKey:@"MTWelcomeVersion"];

  if (!os_feature_enabled_ponderosa() || v30)
  {
    id v11 = objc_alloc((Class)AMSUIOnboardingFeature);
    v29 = +[UIImage _systemImageNamed:@"star.circle.fill"];
    v26 = [v29 imageWithRenderingMode:2];
    v28 = +[NSBundle mainBundle];
    v25 = [v28 localizedStringForKey:@"WELCOME_TITLE_A" value:&stru_10056A8A0 table:0];
    v27 = +[NSBundle mainBundle];
    v24 = [v27 localizedStringForKey:@"WELCOME_DESCRIPTION_A" value:&stru_10056A8A0 table:0];
    id v23 = [v11 initWithImage:v26 titleText:v25 descriptionText:v24];
    v39[0] = v23;
    id v12 = objc_alloc((Class)AMSUIOnboardingFeature);
    v13 = +[UIImage _systemImageNamed:@"square.stack.3d.down.forward"];
    v14 = [v13 imageWithRenderingMode:2];
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"WELCOME_TITLE_B" value:&stru_10056A8A0 table:0];
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"WELCOME_DESCRIPTION_B" value:&stru_10056A8A0 table:0];
    id v19 = [v12 initWithImage:v14 titleText:v16 descriptionText:v18];
    v39[1] = v19;
    v5 = +[NSArray arrayWithObjects:v39 count:2];

    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"WELCOME_HEADER_TITLE" value:&stru_10056A8A0 table:0];
    v37.receiver = self;
    v37.super_class = (Class)MTWelcomeViewController;
    v10 = [(MTWelcomeViewController *)&v37 initWithTitleText:v7 features:v5 primaryButtonText:v31 privacyLinkController:v32];
  }
  else
  {
    v5 = +[UIImage imageNamed:@"welcome_app_icon"];
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"WELCOME_FIRST_TIME_USER_TITLE" value:&stru_10056A8A0 table:0];
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"WELCOME_FIRST_TIME_USER_DESCRIPTION" value:&stru_10056A8A0 table:0];
    v38.receiver = self;
    v38.super_class = (Class)MTWelcomeViewController;
    v10 = [(MTWelcomeViewController *)&v38 initWithHeaderImage:v5 titleText:v7 descriptionText:v9 primaryButtonText:v31 privacyLinkController:v32];
  }
  v36.receiver = v10;
  v36.super_class = (Class)MTWelcomeViewController;
  v20 = [(MTWelcomeViewController *)&v36 welcomeController];
  v21 = [v20 headerView];
  [v21 setTitleHyphenationFactor:0.0];

  if (v10)
  {
    objc_initWeak(&location, v10);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100133CAC;
    v33[3] = &unk_1005529F0;
    objc_copyWeak(&v34, &location);
    [(MTWelcomeViewController *)v10 setPrimaryButtonCallback:v33];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (MTWelcomeViewController)initWithMetricsSender:(id)a3
{
  id v5 = a3;
  v6 = [(MTWelcomeViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metricsSender, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTWelcomeViewController;
  [(MTWelcomeViewController *)&v5 viewWillAppear:a3];
  v3 = _MTLogCategoryPrivacy();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Welcome VC will appear", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTWelcomeViewController;
  [(MTWelcomeViewController *)&v5 viewDidAppear:a3];
  v4 = [(MTWelcomeViewController *)self metricsSender];
  [v4 welcomeControllerDidAppear];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTWelcomeViewController;
  [(MTWelcomeViewController *)&v12 viewWillDisappear:a3];
  unsigned int v4 = [(MTWelcomeViewController *)self acknowledged];
  objc_super v5 = _MTLogCategoryPrivacy();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      v7 = "Welcome screen dismissed after user acknowledgement";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v11, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v11 = 0;
    v7 = "WelcomeVC dismissed but user HAS NOT ACKNOWLEDGED";
    v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_FAULT;
    goto LABEL_6;
  }

  v10 = [(MTWelcomeViewController *)self metricsSender];
  [v10 welcomeControllerWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTWelcomeViewController;
  [(MTWelcomeViewController *)&v5 viewDidDisappear:a3];
  unsigned int v4 = [(MTWelcomeViewController *)self metricsSender];
  [v4 welcomeControllerDidDisappear];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)didTapStartButton
{
  +[MTWelcomeUtil markWelcomeAsShown];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100134004;
  v3[3] = &unk_10054D570;
  v3[4] = self;
  [(MTWelcomeViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)addAcknowledgementCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    acknowledgementCompletionBlocks = self->_acknowledgementCompletionBlocks;
    id v10 = v4;
    if (!acknowledgementCompletionBlocks)
    {
      v6 = +[NSMutableArray array];
      v7 = self->_acknowledgementCompletionBlocks;
      self->_acknowledgementCompletionBlocks = v6;

      acknowledgementCompletionBlocks = self->_acknowledgementCompletionBlocks;
    }
    id v8 = [v10 copy];
    id v9 = objc_retainBlock(v8);
    [(NSMutableArray *)acknowledgementCompletionBlocks addObject:v9];

    id v4 = v10;
  }
}

- (void)performAcknowledgementCompletionBlocks
{
  id v3 = [(NSMutableArray *)self->_acknowledgementCompletionBlocks copy];
  [(NSMutableArray *)self->_acknowledgementCompletionBlocks removeAllObjects];
  [v3 enumerateObjectsUsingBlock:&stru_100552A10];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  v7 = (MTWelcomeViewController *)a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = v10;
  if (v7 == self
    || ([(MTWelcomeViewController *)v10 viewControllers],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        [v12 firstObject],
        v13 = (MTWelcomeViewController *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13 == self))
  {
    id v14 = [objc_alloc((Class)UIPresentationController) initWithPresentedViewController:v7 presentingViewController:v8];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (NSMutableArray)acknowledgementCompletionBlocks
{
  return self->_acknowledgementCompletionBlocks;
}

- (MTWelcomeViewControllerMetricsSender)metricsSender
{
  return self->_metricsSender;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (void)setAcknowledged:(BOOL)a3
{
  self->_acknowledged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSender, 0);

  objc_storeStrong((id *)&self->_acknowledgementCompletionBlocks, 0);
}

@end