@interface CHFriendsSetupViewController
- (BOOL)_isManagedAppleId:(id *)a3;
- (CHFriendsSetupViewController)init;
- (CHFriendsSetupViewControllerDelegate)delegate;
- (void)_nextButtonTapped;
- (void)_willEnterForeground;
- (void)configurePlayer;
- (void)setDelegate:(id)a3;
- (void)setPhase:(int64_t)a3 animated:(BOOL)a4;
- (void)teardownPlayer;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CHFriendsSetupViewController

- (CHFriendsSetupViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendsSetupViewController;
  result = [(CHFriendsSetupViewController *)&v3 init];
  if (result) {
    result->_phase = 0;
  }
  return result;
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)CHFriendsSetupViewController;
  [(CHFriendsSetupViewController *)&v39 viewDidLoad];
  objc_super v3 = [(CHFriendsSetupViewController *)self navigationController];
  [v3 setNavigationBarHidden:1];

  v4 = [(CHFriendsSetupViewController *)self view];
  v5 = +[UIColor blackColor];
  [v4 setBackgroundColor:v5];

  v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7;

  v9 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  if (v8 <= 375.0) {
    v9 = (id *)&UIContentSizeCategoryLarge;
  }
  id v10 = *v9;
  [(CHFriendsSetupViewController *)self configurePlayer];
  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"SHARING_SETUP_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(UILabel *)self->_titleLabel setText:v14];

  v15 = +[UIColor whiteColor];
  [(UILabel *)self->_titleLabel setTextColor:v15];

  v16 = +[UIFont defaultFontForTextStyle:UIFontTextStyleTitle0];
  [(UILabel *)self->_titleLabel setFont:v16];

  [(UILabel *)self->_titleLabel setAllowsDefaultTighteningForTruncation:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAccessibilityTraits:UIAccessibilityTraitHeader];
  [v4 addSubview:self->_titleLabel];
  sub_100151FC4();
  v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
  currentDescriptionLabel = self->_currentDescriptionLabel;
  self->_currentDescriptionLabel = v17;

  [v4 addSubview:self->_currentDescriptionLabel];
  sub_100151FC4();
  v19 = (UILabel *)objc_claimAutoreleasedReturnValue();
  nextDescriptionLabel = self->_nextDescriptionLabel;
  self->_nextDescriptionLabel = v19;

  v21 = +[UIButtonConfiguration filledButtonConfiguration];
  [v21 setButtonSize:3];
  v22 = +[UIColor quaternarySystemFillColor];
  [v21 setBaseBackgroundColor:v22];

  objc_initWeak(&location, self);
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_10015209C;
  v36 = &unk_1008ABCC8;
  objc_copyWeak(&v37, &location);
  v23 = +[UIAction actionWithHandler:&v33];
  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v21, v23, v33, v34, v35, v36);
  v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nextButton = self->_nextButton;
  self->_nextButton = v24;

  [(UIButton *)self->_nextButton setMaximumContentSizeCategory:v10];
  [v4 addSubview:self->_nextButton];
  v26 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.activity"];
  privacyLink = self->_privacyLink;
  self->_privacyLink = v26;

  [(OBPrivacyLinkController *)self->_privacyLink setPresentedViewControllerShouldUseDarkMode:1];
  v28 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v28 setMaximumContentSizeCategory:v10];

  [(CHFriendsSetupViewController *)self addChildViewController:self->_privacyLink];
  v29 = [(CHFriendsSetupViewController *)self view];
  v30 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v29 addSubview:v30];

  [(CHFriendsSetupViewController *)self setPhase:self->_phase animated:0];
  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"_willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  v32 = +[NSNotificationCenter defaultCenter];
  [v32 addObserver:self selector:"_didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)_willEnterForeground
{
  [(CHFriendsSetupViewController *)self configurePlayer];
  id v3 = [(AVPlayerLayer *)self->_onboardingPlayerLayer player];
  [v3 play];
}

- (void)viewDidLayoutSubviews
{
  v82.receiver = self;
  v82.super_class = (Class)CHFriendsSetupViewController;
  [(CHFriendsSetupViewController *)&v82 viewDidLayoutSubviews];
  id v3 = [(CHFriendsSetupViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v85.origin.x = v5;
  v85.origin.double y = v7;
  v85.size.width = v9;
  v85.size.height = v11;
  double MidX = CGRectGetMidX(v85);
  v86.origin.x = v5;
  v86.origin.double y = v7;
  v86.size.width = v9;
  v86.size.height = v11;
  CGFloat Width = CGRectGetWidth(v86);
  v87.origin.x = v5;
  v87.origin.double y = v7;
  double v14 = Width;
  v87.size.width = v9;
  double v15 = v9;
  v87.size.height = v11;
  double Height = CGRectGetHeight(v87);
  double v16 = sub_10012475C(MidX, v14 + -32.0);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  double y = CGPointZero.y;
  -[AVPlayerLayer setBounds:](self->_onboardingPlayerLayer, "setBounds:");
  -[AVPlayerLayer setPosition:](self->_onboardingPlayerLayer, "setPosition:", v16, 183.0);
  +[CATransaction commit];
  v17 = [(UILabel *)self->_titleLabel font];
  [v17 _scaledValueForValue:24.0];
  double v19 = v18;

  [(AVPlayerLayer *)self->_onboardingPlayerLayer frame];
  double v20 = v19 + CGRectGetMaxY(v88);
  [(UILabel *)self->_titleLabel sizeToFit];
  double v76 = v20;
  [(UILabel *)self->_titleLabel _setFirstLineBaselineFrameOriginY:v20];
  double v21 = MidX;
  double v22 = sub_10012475C(MidX, v14);
  [(UILabel *)self->_titleLabel frame];
  double MidY = CGRectGetMidY(v89);
  [(UILabel *)self->_titleLabel frame];
  double v24 = CGRectGetHeight(v90);
  double v25 = sub_10012475C(MidY, v24);
  [(UILabel *)self->_titleLabel bounds];
  double v74 = v14;
  -[UILabel setBounds:](self->_titleLabel, "setBounds:", 0.0, 0.0, v14, CGRectGetHeight(v91));
  -[UILabel setPosition:](self->_titleLabel, "setPosition:", v22, v25);
  v26 = [(CHFriendsSetupViewController *)self view];
  [v26 directionalLayoutMargins];
  double v28 = v15 - v27;
  v29 = [(CHFriendsSetupViewController *)self view];
  [v29 directionalLayoutMargins];
  double v31 = v28 - v30;

  -[UIButton systemLayoutSizeFittingSize:](self->_nextButton, "systemLayoutSizeFittingSize:", v15, v11);
  double v33 = v32;
  double v34 = sub_10012475C(Height + -44.0 - v32 * 0.5, v32);
  double v35 = sub_10012475C(MidX, v31);
  -[UIButton setBounds:](self->_nextButton, "setBounds:", 0.0, 0.0, v31, v33);
  -[UIButton setCenter:](self->_nextButton, "setCenter:", v35, v34);
  v36 = [(CHFriendsSetupViewController *)self view];
  [v36 directionalLayoutMargins];
  double v38 = v15 - v37;
  objc_super v39 = [(CHFriendsSetupViewController *)self view];
  [v39 directionalLayoutMargins];
  double v41 = v38 - v40;

  v42 = [(OBPrivacyLinkController *)self->_privacyLink view];
  LODWORD(v43) = 1148846080;
  LODWORD(v44) = 1112014848;
  [v42 systemLayoutSizeFittingSize:v41 withHorizontalFittingPriority:0.0 verticalFittingPriority:v43 v44];
  double v46 = v45;

  v47 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v47 setBounds:0.0, 0.0, v41, v46];

  v48 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v48 setPosition:v21 Height + -44.0 - v33 + -30.0 - v46 * 0.5];

  v49 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v49 frameOrigin];
  double v51 = v50;

  currentDescriptionLabel = self->_currentDescriptionLabel;
  nextDescriptionLabel = self->_nextDescriptionLabel;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v83[0] = currentDescriptionLabel;
  v83[1] = nextDescriptionLabel;
  v54 = +[NSArray arrayWithObjects:v83 count:2];
  id v55 = [v54 countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v79;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v79 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        v60 = [v59 font];
        [v60 _scaledValueForValue:32.0];
        double v62 = v61;

        double v63 = v76 + v62;
        [v59 sizeThatFits:v74 + -54.0, 1.79769313e308];
        double v65 = v64;
        *(float *)&double v64 = v66;
        *(float *)&double v66 = v51 - v63;
        [v59 setBounds:CGPointZero.x, y, v65, fminf(*(float *)&v64, *(float *)&v66)];
        [v59 frame];
        double v68 = v67;
        double v70 = v69;
        sub_100124790();
        double v72 = v71;
        [v59 _firstBaselineOffsetFromTop];
        UIRoundToViewScale();
        [v59 setFrame:v72, v73, v68, v70];
      }
      id v56 = [v54 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v56);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendsSetupViewController;
  [(CHFriendsSetupViewController *)&v5 viewDidAppear:a3];
  [(CHFriendsSetupViewController *)self configurePlayer];
  double v4 = [(AVPlayerLayer *)self->_onboardingPlayerLayer player];
  [v4 play];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHFriendsSetupViewController;
  [(CHFriendsSetupViewController *)&v4 viewDidDisappear:a3];
  [(CHFriendsSetupViewController *)self teardownPlayer];
}

- (void)configurePlayer
{
  if (!self->_onboardingVideoPlayer && !self->_onboardingPlayerLayer)
  {
    id v3 = +[NSBundle mainBundle];
    id v13 = [v3 pathForResource:@"ActivitySharingOnboarding" ofType:@"mov"];

    objc_super v4 = +[NSURL fileURLWithPath:v13];
    objc_super v5 = +[AVAsset assetWithURL:v4];
    double v6 = +[AVPlayerItem playerItemWithAsset:v5];
    CGFloat v7 = (AVPlayer *)objc_alloc_init((Class)AVPlayer);
    onboardingVideoPlayer = self->_onboardingVideoPlayer;
    self->_onboardingVideoPlayer = v7;

    [(AVPlayer *)self->_onboardingVideoPlayer _setParticipatesInAudioSession:0];
    [(AVPlayer *)self->_onboardingVideoPlayer setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVPlayer *)self->_onboardingVideoPlayer replaceCurrentItemWithPlayerItem:v6];
    CGFloat v9 = +[AVPlayerLayer playerLayerWithPlayer:self->_onboardingVideoPlayer];
    onboardingPlayerLayer = self->_onboardingPlayerLayer;
    self->_onboardingPlayerLayer = v9;

    double v11 = [(CHFriendsSetupViewController *)self view];
    v12 = [v11 layer];
    [v12 addSublayer:self->_onboardingPlayerLayer];
  }
}

- (void)teardownPlayer
{
  [(AVPlayer *)self->_onboardingVideoPlayer replaceCurrentItemWithPlayerItem:0];
  [(AVPlayerLayer *)self->_onboardingPlayerLayer setPlayer:0];
  [(AVPlayerLayer *)self->_onboardingPlayerLayer removeFromSuperlayer];
  onboardingVideoPlayer = self->_onboardingVideoPlayer;
  self->_onboardingVideoPlayer = 0;

  onboardingPlayerLayer = self->_onboardingPlayerLayer;
  self->_onboardingPlayerLayer = 0;
}

- (void)setPhase:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_phase = a3;
  if (![(CHFriendsSetupViewController *)self isViewLoaded]) {
    return;
  }
  switch(a3)
  {
    case 0:
      double v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"SHARING_SETUP_PRIMARY_DESCRIPTION" value:&stru_1008D8AB8 table:@"Localizable"];
      [(UILabel *)self->_nextDescriptionLabel setText:v12];

      id v13 = +[NSBundle mainBundle];
      double v10 = [v13 localizedStringForKey:@"SHARING_SETUP_PRIMARY_BUTTON_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
LABEL_15:

      break;
    case 1:
      id v27 = 0;
      unsigned int v14 = [(CHFriendsSetupViewController *)self _isManagedAppleId:&v27];
      id v15 = v27;
      id v13 = v15;
      if (v14)
      {
        if (v15)
        {
          double v16 = +[NSBundle mainBundle];
          v17 = [v16 localizedStringForKey:@"SHARING_SETUP_CLOUDKIT_DESCRIPTION_RESTRICTED" value:&stru_1008D8AB8 table:@"Localizable"];
          double v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v13);
          [(UILabel *)self->_nextDescriptionLabel setText:v18];

LABEL_14:
          double v21 = +[NSBundle mainBundle];
          double v10 = [v21 localizedStringForKey:@"SHARING_SETUP_CLOUDKIT_BUTTON_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

          goto LABEL_15;
        }
        double v19 = +[NSBundle mainBundle];
        double v16 = v19;
        CFStringRef v20 = @"SHARING_SETUP_CLOUDKIT_DESCRIPTION_RESTRICTED_NO_USERNAME";
      }
      else
      {
        double v19 = +[NSBundle mainBundle];
        double v16 = v19;
        CFStringRef v20 = @"SHARING_SETUP_CLOUDKIT_DESCRIPTION";
      }
      v17 = [v19 localizedStringForKey:v20 value:&stru_1008D8AB8 table:@"Localizable"];
      [(UILabel *)self->_nextDescriptionLabel setText:v17];
      goto LABEL_14;
    case 2:
      CGFloat v7 = +[NSBundle mainBundle];
      double v8 = [v7 localizedStringForKey:@"SHARING_SETUP_UPGRADE_WATCH_DESCRIPTION" value:&stru_1008D8AB8 table:@"Localizable"];
      [(UILabel *)self->_nextDescriptionLabel setText:v8];

      CGFloat v9 = +[NSBundle mainBundle];
      double v10 = [v9 localizedStringForKey:@"SHARING_SETUP_UPGRADE_WATCH_BUTTON_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

      break;
    default:
      double v10 = 0;
      break;
  }
  [(UILabel *)self->_nextDescriptionLabel setAlpha:0.0];
  double v22 = [(CHFriendsSetupViewController *)self view];
  [v22 insertSubview:self->_nextDescriptionLabel below:self->_currentDescriptionLabel];

  [(UIButton *)self->_nextButton setTitle:v10 forState:0];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100152DCC;
  v26[3] = &unk_1008ABA78;
  v26[4] = self;
  v23 = objc_retainBlock(v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100152E28;
  v25[3] = &unk_1008ACA80;
  v25[4] = self;
  double v24 = objc_retainBlock(v25);
  if (v4)
  {
    +[UIView animateWithDuration:v23 animations:v24 completion:0.35];
  }
  else
  {
    ((void (*)(void *))v23[2])(v23);
    ((void (*)(void *, uint64_t))v24[2])(v24, 1);
  }
}

- (BOOL)_isManagedAppleId:(id *)a3
{
  id v4 = objc_alloc_init((Class)ACAccountStore);
  objc_super v5 = [v4 aa_primaryAppleAccount];
  double v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_isManagedAppleID"))
  {
    ASLoggingInitialize();
    CGFloat v7 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Apple ID is a managed account, reverting to unsigned-in behavior", v10, 2u);
    }
    if (a3)
    {
      *a3 = [v6 username];
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_nextButtonTapped
{
  id v3 = [(CHFriendsSetupViewController *)self delegate];
  [v3 friendsSetupViewController:self didCompletePhase:self->_phase];

  if (!self->_phase)
  {
    id v4 = [(CHFriendsSetupViewController *)self delegate];
    unsigned int v5 = [v4 friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:self];

    if (v5)
    {
      [(CHFriendsSetupViewController *)self setPhase:1 animated:1];
    }
    else
    {
      id v6 = [(CHFriendsSetupViewController *)self delegate];
      [v6 friendsSetupViewControllerDidCompleteSetup:self];
    }
  }
}

- (CHFriendsSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHFriendsSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_onboardingPlayerLayer, 0);
  objc_storeStrong((id *)&self->_onboardingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_nextDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_currentDescriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end