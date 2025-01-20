@interface COSInternalUserStudyViewController
+ (BOOL)controllerAllowsPresentingSignInFlow;
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hasVideoFile;
+ (BOOL)isBeamBridgeReachable;
+ (BOOL)isDeviceOfParticularInterest:(id)a3;
- (AVPlayerItem)userCaptureSequence;
- (AVPlayerLayer)playerLayer;
- (AVQueuePlayer)player;
- (BOOL)assetsLoaded;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)dismissed;
- (BOOL)holdBeforeDisplaying;
- (BOOL)isZoomed;
- (COSInternalUserStudyAssetManager)assetManager;
- (COSInternalUserStudyViewController)init;
- (UIView)movieView;
- (double)noHWDetailOffset;
- (double)noHWImageOffset;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)learnMoreButtonTitle;
- (id)optinLocalizationBundle;
- (id)optinLocalizationStringsFile;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_disableButtons;
- (void)_playIfLoaded;
- (void)_teardownPlayback;
- (void)_uploadAssetAndComplete;
- (void)abortAndRecaptureMovie;
- (void)addItemWithURL:(id)a3 completion:(id)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)completePane;
- (void)confirmDockUpload;
- (void)learnMoreButtonPressed:(id)a3;
- (void)playerItemDidReachEnd:(id)a3;
- (void)replayMovie:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAssetsLoaded:(BOOL)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setIsZoomed:(BOOL)a3;
- (void)setMovieView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setUserCaptureSequence:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation COSInternalUserStudyViewController

- (BOOL)holdBeforeDisplaying
{
  return 0;
}

+ (BOOL)isBeamBridgeReachable
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 isBeamBridgeReachable];

  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned int v2 = sub_100008380();
  if (v2)
  {
    unsigned __int8 v3 = pbb_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[COSInternalUserStudyViewController hasVideoFile]);
      v5 = +[COSInternalUserStudyAssetManager detailBundle];
      v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[COSMLCaptureDisclosureController disclosureEffectivelyAccepted]);
      int v24 = 136315906;
      v25 = "+[COSInternalUserStudyViewController controllerNeedsToRun]";
      __int16 v26 = 2112;
      *(void *)v27 = v4;
      *(_WORD *)&v27[8] = 2112;
      v28 = v5;
      __int16 v29 = 2112;
      v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - hasVideoFile? %@ detailBundle? %@ disclosureEffectivelyAccepted? %@", (uint8_t *)&v24, 0x2Au);
    }
    v7 = +[UIApplication sharedApplication];
    unsigned int v8 = [v7 isBeamBridgeReachable];

    v9 = +[COSInternalUserStudyDataManager sharedManager];
    id v10 = [v9 detectedWristChoice];

    v11 = +[COSInternalUserStudyDataManager sharedManager];
    id v12 = [v11 wristChoice];

    v13 = pbb_setup_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[NSNumber numberWithInteger:v10];
      int v24 = 138412290;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Detected WristChoice: %@", (uint8_t *)&v24, 0xCu);
    }
    v15 = pbb_setup_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = +[NSNumber numberWithInteger:v12];
      int v24 = 138412290;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WristChoice: %@", (uint8_t *)&v24, 0xCu);
    }
    if (+[COSInternalUserStudyViewController hasVideoFile])
    {
      v17 = +[COSInternalUserStudyAssetManager detailBundle];
      if (v17) {
        unsigned int v18 = +[COSMLCaptureDisclosureController disclosureEffectivelyAccepted];
      }
      else {
        unsigned int v18 = 0;
      }
    }
    else
    {
      unsigned int v18 = 0;
    }
    v19 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    unsigned int v20 = +[COSInternalUserStudyViewController isDeviceOfParticularInterest:v19];

    v21 = pbb_setup_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      v25 = "+[COSInternalUserStudyViewController controllerNeedsToRun]";
      __int16 v26 = 1024;
      *(_DWORD *)v27 = v18;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v20;
      LOWORD(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 2) = (unint64_t)v10 < 5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Base Criteria Met: %d / Interesting Device: %d / Valuable Sample: %d", (uint8_t *)&v24, 0x1Eu);
    }

    if ((unint64_t)v10 < 5) {
      char v22 = 1;
    }
    else {
      char v22 = v20;
    }
    if (v18 ^ 1 | v8) {
      LOBYTE(v2) = v18;
    }
    else {
      LOBYTE(v2) = v22;
    }
  }
  return v2;
}

+ (BOOL)controllerAllowsPresentingSignInFlow
{
  return 1;
}

+ (BOOL)isDeviceOfParticularInterest:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForProperty:NRDevicePropertyProductType];
  v5 = [v4 componentsSeparatedByString:@","];
  v6 = [v5 firstObject];
  unsigned int v7 = [v6 isEqualToString:@"Watch6"];

  if (v7)
  {
    unsigned int v8 = [v5 lastObject];
    v9 = (char *)[v8 integerValue];

    unsigned int v7 = (unint64_t)(v9 - 10) < 9;
  }
  unint64_t v10 = (unint64_t)+[PBBridgeWatchAttributeController materialFromDevice:v3];
  unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFDLL;
  unsigned int v12 = (v10 < 0x16) & (0x2D0000u >> v10);
  v13 = pbb_setup_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    v17 = "+[COSInternalUserStudyViewController isDeviceOfParticularInterest:]";
    __int16 v18 = 1024;
    unsigned int v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = v11 == 20;
    __int16 v22 = 1024;
    unsigned int v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: isNPIType: %d / isNPIMaterial: %d / isRareMaterial: %d", (uint8_t *)&v16, 0x1Eu);
  }

  if (v11 == 20) {
    char v14 = 1;
  }
  else {
    char v14 = v12;
  }

  return v7 | v14;
}

+ (BOOL)hasVideoFile
{
  unsigned int v2 = +[NSFileManager defaultManager];
  id v3 = +[COSInternalUserStudyAssetManager filePath];
  id v4 = [v2 fileExistsAtPath:v3];

  v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSNumber numberWithBool:v4];
    int v8 = 136315394;
    v9 = "+[COSInternalUserStudyViewController hasVideoFile]";
    __int16 v10 = 2112;
    unint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - Had User Study Video? %@", (uint8_t *)&v8, 0x16u);
  }
  return (char)v4;
}

- (COSInternalUserStudyViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)COSInternalUserStudyViewController;
  unsigned int v2 = [(COSOptinViewController *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    [(COSInternalUserStudyViewController *)v2 setStyle:26];
    uint64_t v4 = +[AVQueuePlayer queuePlayerWithItems:&__NSArray0__struct];
    player = v3->_player;
    v3->_player = (AVQueuePlayer *)v4;

    [(AVQueuePlayer *)v3->_player setAllowsExternalPlayback:0];
    [(AVQueuePlayer *)v3->_player setMuted:1];
    v6 = v3->_player;
    long long v9 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [(AVQueuePlayer *)v6 seekToTime:&v9];
    [(AVQueuePlayer *)v3->_player setActionAtItemEnd:2];
    unsigned int v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"playerItemDidReachEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)COSInternalUserStudyViewController;
  [(COSInternalUserStudyViewController *)&v41 viewDidLoad];
  id v3 = +[COSInternalUserStudyAssetManager fileURLPath];
  uint64_t v4 = +[NSURL URLWithString:v3];
  objc_initWeak(&location, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000525F8;
  v38[3] = &unk_100244808;
  objc_copyWeak(&v39, &location);
  [(COSInternalUserStudyViewController *)self addItemWithURL:v4 completion:v38];
  v5 = (UIView *)objc_alloc_init((Class)UIView);
  movieView = self->_movieView;
  self->_movieView = v5;

  unsigned int v7 = self->_movieView;
  int v8 = +[UIColor clearColor];
  [(UIView *)v7 setBackgroundColor:v8];

  [(UIView *)self->_movieView setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v9 = [(COSInternalUserStudyViewController *)self contentView];
  [v9 addSubview:self->_movieView];

  __int16 v10 = [(COSInternalUserStudyViewController *)self contentView];
  objc_super v11 = [v10 topAnchor];
  unsigned int v12 = [(UIView *)self->_movieView topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  char v14 = [(COSInternalUserStudyViewController *)self contentView];
  v15 = [v14 bottomAnchor];
  int v16 = [(UIView *)self->_movieView bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  int64x2_t v34 = vdupq_n_s64(0x4064000000000000uLL);
  int64x2_t v35 = vdupq_n_s64(0x406F400000000000uLL);
  int64x2_t v36 = v35;
  int64x2_t v37 = v35;
  BPSScreenValueGetRelevantValue();
  double v19 = v18;
  __int16 v20 = [(UIView *)self->_movieView heightAnchor];
  BOOL v21 = [v20 constraintEqualToConstant:v19];
  [v21 setActive:1];

  __int16 v22 = [(UIView *)self->_movieView widthAnchor];
  unsigned int v23 = [(UIView *)self->_movieView heightAnchor];
  int v24 = [v22 constraintEqualToAnchor:v23 multiplier:0.5625];
  [v24 setActive:1];

  v25 = [(UIView *)self->_movieView centerXAnchor];
  __int16 v26 = [(COSInternalUserStudyViewController *)self contentView];
  v27 = [v26 centerXAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  __int16 v29 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
  playerLayer = self->_playerLayer;
  self->_playerLayer = v29;

  v31 = self->_playerLayer;
  CATransform3DMakeRotation(&v33, 1.57079633, 0.0, 0.0, 1.0);
  [(AVPlayerLayer *)v31 setTransform:&v33];
  v32 = [(UIView *)self->_movieView layer];
  [v32 addSublayer:self->_playerLayer];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSInternalUserStudyViewController;
  [(COSInternalUserStudyViewController *)&v4 viewDidDisappear:a3];
  [(COSInternalUserStudyViewController *)self _teardownPlayback];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)COSInternalUserStudyViewController;
  [(COSInternalUserStudyViewController *)&v4 viewDidLayoutSubviews];
  playerLayer = self->_playerLayer;
  [(UIView *)self->_movieView bounds];
  -[AVPlayerLayer setFrame:](playerLayer, "setFrame:");
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (void)addItemWithURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  +[AVURLAsset assetWithURL:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100052808;
  v9[3] = &unk_100244830;
  objc_super v11 = self;
  id v12 = v6;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  id v8 = v10;
  [v8 loadValuesAsynchronouslyForKeys:&off_10025BC98 completionHandler:v9];
}

- (void)abortAndRecaptureMovie
{
}

- (void)replayMovie:(id)a3
{
  player = self->_player;
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [(AVQueuePlayer *)player seekToTime:&v5];
  [(AVQueuePlayer *)self->_player play];
}

- (void)_teardownPlayback
{
  [(AVQueuePlayer *)self->_player pause];
  [(AVQueuePlayer *)self->_player removeAllItems];
  [(AVPlayerLayer *)self->_playerLayer removeFromSuperlayer];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSInternalUserStudyViewController _teardownPlayback]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s finished tearing down internal user study video playback", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_playIfLoaded
{
  if (self->_assetsLoaded)
  {
    playerLayer = self->_playerLayer;
    [(UIView *)self->_movieView bounds];
    -[AVPlayerLayer setFrame:](playerLayer, "setFrame:");
    [(AVQueuePlayer *)self->_player insertItem:self->_userCaptureSequence afterItem:0];
    player = self->_player;
    [(AVQueuePlayer *)player play];
  }
}

- (void)setAssetsLoaded:(BOOL)a3
{
  self->_assetsLoaded = a3;
  [(COSInternalUserStudyViewController *)self _playIfLoaded];
}

- (void)playerItemDidReachEnd:(id)a3
{
}

- (id)titleString
{
  unsigned int v2 = +[COSInternalUserStudyAssetManager detailBundle];
  id v3 = [v2 localizedStringForKey:@"USER_STUDY_TITLE" value:&stru_100249230 table:@"User_Study"];

  return v3;
}

- (id)detailString
{
  unsigned int v2 = +[COSInternalUserStudyAssetManager detailBundle];
  id v3 = [v2 localizedStringForKey:@"USER_STUDY_DETAIL" value:&stru_100249230 table:@"User_Study"];

  objc_super v4 = [UIApp setupController];
  int v5 = [v4 visualDetector];

  id v6 = [v5 confidenceSummary];
  [v6 confidence];
  uint64_t v8 = (uint64_t)(v7 * 100.0);
  long long v9 = (char *)[v6 attribute];
  unint64_t v10 = (unint64_t)(v9 - 5);
  if ((unint64_t)v9 < 5)
  {
    if ((unint64_t)(v9 - 1) > 2) {
      CFStringRef v13 = @"no Watch visible";
    }
    else {
      CFStringRef v13 = *(&off_100244948 + (void)(v9 - 1));
    }
    [v3 stringByAppendingFormat:@"\n\n[ML Classifier says: \"%ld%% Confident this is %@\"]", v8, v13, v16];
  }
  else
  {
    if (v10 > 3)
    {
      objc_super v11 = &stru_100249230;
      id v12 = &stru_100249230;
    }
    else
    {
      objc_super v11 = *(&off_100244908 + v10);
      id v12 = *(&off_100244928 + v10);
    }
    if (![(__CFString *)v11 length] || ![(__CFString *)v12 length]) {
      goto LABEL_13;
    }
    [v3 stringByAppendingFormat:@"\n\n[ML Classifier says: \"%ld%% Confident this is %@ Wrist + %@ Crown\"]", v8, v11, v12];
  uint64_t v14 = };

  id v3 = (void *)v14;
LABEL_13:

  return v3;
}

- (void)_disableButtons
{
  id v3 = [(COSInternalUserStudyViewController *)self suggestedChoiceButton];
  [v3 setEnabled:0];

  id v4 = [(COSInternalUserStudyViewController *)self alternateChoiceButton];
  [v4 setEnabled:0];
}

- (void)confirmDockUpload
{
  id v3 = +[COSInternalUserStudyAssetManager detailBundle];
  id v4 = [v3 localizedStringForKey:@"DOCK_TITLE" value:&stru_100249230 table:@"User_Study"];
  int v5 = +[COSInternalUserStudyAssetManager detailBundle];
  id v6 = [v5 localizedStringForKey:@"DOCK_MESSAGE" value:&stru_100249230 table:@"User_Study"];
  double v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  uint64_t v8 = +[COSInternalUserStudyAssetManager detailBundle];
  long long v9 = [v8 localizedStringForKey:@"USER_STUDY_ENABLE_ALERT_OK" value:&stru_100249230 table:@"User_Study"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005321C;
  v20[3] = &unk_100243AE0;
  v20[4] = self;
  unint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v20];

  objc_super v11 = +[COSInternalUserStudyAssetManager detailBundle];
  id v12 = [v11 localizedStringForKey:@"USER_STUDY_DECLINE" value:&stru_100249230 table:@"User_Study"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100053224;
  v19[3] = &unk_100243AE0;
  v19[4] = self;
  CFStringRef v13 = +[UIAlertAction actionWithTitle:v12 style:2 handler:v19];

  [v10 setEnabled:0];
  [v13 setEnabled:0];
  [v7 addAction:v10];
  [v7 addAction:v13];
  [v7 setPreferredAction:v13];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053264;
  v16[3] = &unk_100243908;
  id v17 = v10;
  id v18 = v13;
  id v14 = v13;
  id v15 = v10;
  [(COSInternalUserStudyViewController *)self presentViewController:v7 animated:1 completion:v16];
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSInternalUserStudyViewController suggestedButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if ((int)sub_10003245C() < 1)
  {
    [(COSInternalUserStudyViewController *)self showOptinConfirmationAlert:@"USER_STUDY" optinChoice:1];
  }
  else
  {
    [(COSInternalUserStudyViewController *)self _disableButtons];
    [(COSInternalUserStudyViewController *)self _uploadAssetAndComplete];
  }
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSInternalUserStudyViewController alternateButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(COSInternalUserStudyViewController *)self _disableButtons];
  [(COSInternalUserStudyViewController *)self applyConfirmedOptin:0];
}

- (void)learnMoreButtonPressed:(id)a3
{
  uint64_t v8 = objc_alloc_init(COSAboutTextViewController);
  id v4 = +[COSInternalUserStudyAssetManager detailBundle];
  int v5 = [v4 localizedStringForKey:@"ABOUT_USER_STUDY" value:&stru_100249230 table:@"User_Study"];
  [(COSAboutTextViewController *)v8 setTitleString:v5];

  id v6 = +[COSInternalUserStudyAssetManager detailBundle];
  double v7 = [v6 localizedStringForKey:@"WHAT_IS_USER_STUDY_DESCRIPTION" value:&stru_100249230 table:@"User_Study"];
  [(COSAboutTextViewController *)v8 setHeaderString:v7];

  [(COSAboutTextViewController *)v8 presentWithController:self];
}

- (void)_uploadAssetAndComplete
{
  id v3 = objc_alloc_init(COSInternalUserStudyAssetManager);
  assetManager = self->_assetManager;
  self->_assetManager = v3;

  int v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request User Study Data", buf, 2u);
  }

  unsigned int v6 = [(id)objc_opt_class() isBeamBridgeReachable];
  double v7 = self->_assetManager;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100053754;
    v9[3] = &unk_1002448A0;
    void v9[4] = self;
    [(COSInternalUserStudyAssetManager *)v7 requestDataForVideoAssetWithCompletion:v9];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100053DC8;
    v8[3] = &unk_100243878;
    v8[4] = self;
    [(COSInternalUserStudyAssetManager *)v7 createRadarForData:v8];
  }
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  BOOL v3 = a3;
  [(COSInternalUserStudyViewController *)self _disableButtons];
  if (v3)
  {
    int v5 = +[COSInternalUserStudyDataManager sharedManager];
    id v6 = [v5 detectedWristChoice];

    if (v6 == (id)5)
    {
      dispatch_time_t v7 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000540A8;
      block[3] = &unk_1002438A0;
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [(COSInternalUserStudyViewController *)self _uploadAssetAndComplete];
    }
  }
  else
  {
    +[COSInternalUserStudyAssetManager clearVideoFile];
    [(COSInternalUserStudyViewController *)self completePane];
  }
}

- (id)suggestedButtonTitle
{
  unsigned int v2 = [(id)objc_opt_class() isBeamBridgeReachable];
  BOOL v3 = +[COSInternalUserStudyAssetManager detailBundle];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"USER_STUDY_ACCEPT";
  }
  else {
    CFStringRef v5 = @"USER_STUDY_ACCEPT_WITH_RADAR";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"User_Study"];

  return v6;
}

- (id)alternateButtonTitle
{
  unsigned int v2 = +[COSInternalUserStudyAssetManager detailBundle];
  BOOL v3 = [v2 localizedStringForKey:@"USER_STUDY_DECLINE" value:&stru_100249230 table:@"User_Study"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  unsigned int v2 = +[COSInternalUserStudyAssetManager detailBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ABOUT_USER_STUDY" value:&stru_100249230 table:@"User_Study"];

  return v3;
}

- (double)noHWImageOffset
{
  BPSScreenValueGetRelevantValue();
  return result;
}

- (double)noHWDetailOffset
{
  __asm { FMOV            V0.2D, #15.0 }
  BPSScreenValueGetRelevantValue();
  return result;
}

- (id)optinLocalizationStringsFile
{
  return @"User_Study";
}

- (id)optinLocalizationBundle
{
  return +[COSInternalUserStudyAssetManager detailBundle];
}

- (void)completePane
{
  BOOL v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[COSInternalUserStudyViewController completePane]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005439C;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)assetsLoaded
{
  return self->_assetsLoaded;
}

- (UIView)movieView
{
  return self->_movieView;
}

- (void)setMovieView:(id)a3
{
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (AVPlayerItem)userCaptureSequence
{
  return self->_userCaptureSequence;
}

- (void)setUserCaptureSequence:(id)a3
{
}

- (BOOL)isZoomed
{
  return self->_isZoomed;
}

- (void)setIsZoomed:(BOOL)a3
{
  self->_isZoomed = a3;
}

- (COSInternalUserStudyAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_userCaptureSequence, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_movieView, 0);
}

@end