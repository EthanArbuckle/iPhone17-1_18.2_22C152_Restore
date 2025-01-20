@interface CHAchievementDetailViewController
+ (id)resourceProvider;
- (AAUIAchievementFormatter)formatter;
- (AAUIBadgeView)badgeView;
- (ACHAchievement)achievement;
- (ACHAchievementLocalizationProvider)locProvider;
- (AVPlayer)avPlayer;
- (AVPlayerLayer)avPlayerLayer;
- (BOOL)celebrationComplete;
- (BOOL)didAppear;
- (BOOL)didSetupBadgeView;
- (BOOL)earned;
- (BOOL)forDayView;
- (BOOL)forModalPresentation;
- (BOOL)modalBadgeFlipStarted;
- (BOOL)shouldShowCelebration;
- (CGRect)badgeFrame;
- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6;
- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6 forModalPresentation:(BOOL)a7 shouldShowCelebration:(BOOL)a8;
- (NSLayoutConstraint)textBottomBaselineConstraint;
- (NSString)sharingText;
- (UIImage)sharingImage;
- (UILabel)label;
- (UIView)badgeContainer;
- (UIView)celebrationVideoContainer;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)_willEnterForeground;
- (void)animateModalBadgeView;
- (void)animateModalBadgeViewIfNeeded;
- (void)appWillResignActive:(id)a3;
- (void)configureBadgeView;
- (void)configurePlayer;
- (void)doneTapped:(id)a3;
- (void)placeBadgeViewInContainer;
- (void)playerFinished:(id)a3;
- (void)setAchievement:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setAvPlayerLayer:(id)a3;
- (void)setBadgeContainer:(id)a3;
- (void)setCelebrationComplete:(BOOL)a3;
- (void)setCelebrationVideoContainer:(id)a3;
- (void)setDidAppear:(BOOL)a3;
- (void)setDidSetupBadgeView:(BOOL)a3;
- (void)setEarned:(BOOL)a3;
- (void)setForDayView:(BOOL)a3;
- (void)setForModalPresentation:(BOOL)a3;
- (void)setFormatter:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocProvider:(id)a3;
- (void)setModalBadgeFlipStarted:(BOOL)a3;
- (void)setSharingImage:(id)a3;
- (void)setSharingText:(id)a3;
- (void)setShouldShowCelebration:(BOOL)a3;
- (void)setTextBottomBaselineConstraint:(id)a3;
- (void)setupCelebrationVideoIfNeeded;
- (void)shareTapped:(id)a3;
- (void)teardownPlayer;
- (void)textSizeChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHAchievementDetailViewController

+ (id)resourceProvider
{
  if (qword_10096B498 != -1) {
    dispatch_once(&qword_10096B498, &stru_1008ACB90);
  }
  v2 = (void *)qword_10096B490;

  return v2;
}

- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6
{
  return [(CHAchievementDetailViewController *)self initWithAchievement:a3 locProvider:a4 formatsForFriend:a5 forDayView:a6 forModalPresentation:0 shouldShowCelebration:0];
}

- (CHAchievementDetailViewController)initWithAchievement:(id)a3 locProvider:(id)a4 formatsForFriend:(BOOL)a5 forDayView:(BOOL)a6 forModalPresentation:(BOOL)a7 shouldShowCelebration:(BOOL)a8
{
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CHAchievementDetailViewController;
  v17 = [(CHAchievementDetailViewController *)&v30 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_achievement, a3);
    v18->_earned = [v15 unearned] ^ 1;
    objc_storeStrong((id *)&v18->_locProvider, a4);
    v19 = (AAUIAchievementFormatter *)[objc_alloc((Class)AAUIAchievementFormatter) initWithStyle:1 achievement:v15 achLocalizationProvider:v18->_locProvider];
    formatter = v18->_formatter;
    v18->_formatter = v19;

    [(AAUIAchievementFormatter *)v18->_formatter setFormatsForFriend:v11];
    v18->_forDayView = a6;
    v18->_forModalPresentation = a7;
    v18->_shouldShowCelebration = a8;
    v21 = (AAUIBadgeView *)[objc_alloc((Class)AAUIBadgeView) initUsingEarnedShader:v18->_earned];
    badgeView = v18->_badgeView;
    v18->_badgeView = v21;

    [(AAUIBadgeView *)v18->_badgeView setOpaque:0];
    [(AAUIBadgeView *)v18->_badgeView setAutoresizingMask:0];
    [(CHAchievementDetailViewController *)v18 configureBadgeView];
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v18 selector:"textSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    if (!v11)
    {
      id v24 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:v18 action:"shareTapped:"];
      v25 = [(CHAchievementDetailViewController *)v18 navigationItem];
      [v25 setRightBarButtonItem:v24];
    }
    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v18 selector:"appWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v18 selector:"_willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v18 selector:"_didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v18;
}

- (void)_willEnterForeground
{
  [(CHAchievementDetailViewController *)self setupCelebrationVideoIfNeeded];
  [(CHAchievementDetailViewController *)self setDidAppear:1];
  v3 = [(CHAchievementDetailViewController *)self avPlayer];

  if (v3)
  {
    v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Playing achievement celebration video", v6, 2u);
    }

    v5 = [(CHAchievementDetailViewController *)self avPlayer];
    [v5 play];
  }
  else if ([(CHAchievementDetailViewController *)self forModalPresentation])
  {
    [(CHAchievementDetailViewController *)self animateModalBadgeViewIfNeeded];
  }
}

- (void)configureBadgeView
{
  v3 = [(id)objc_opt_class() resourceProvider];
  v4 = [(CHAchievementDetailViewController *)self achievement];
  v5 = [v3 badgeConfigurationForAchievement:v4];

  v6 = [(CHAchievementDetailViewController *)self formatter];
  v7 = [v6 localizedAttributedBacksideString];

  v8 = [(CHAchievementDetailViewController *)self formatter];
  v9 = [v8 localizedAttributedShortenedBacksideString];

  v10 = [(CHAchievementDetailViewController *)self badgeView];
  [v10 setConfiguration:v5];

  BOOL v11 = [(CHAchievementDetailViewController *)self badgeView];
  v12 = [(CHAchievementDetailViewController *)self achievement];
  v13 = [v3 backSideIconImageForAchievement:v12];
  [v11 setBadgeBacksideIcon:v13];

  if ([v7 length])
  {
    v14 = [(CHAchievementDetailViewController *)self badgeView];
    [v14 setBadgeBacksideAttributedString:v7];

    id v15 = [(CHAchievementDetailViewController *)self badgeView];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100122690;
    v16[3] = &unk_1008ACBB8;
    id v17 = v9;
    [v15 setShortenedBadgeBacksideStringProvider:v16];
  }
}

- (void)placeBadgeViewInContainer
{
  v3 = [(CHAchievementDetailViewController *)self badgeContainer];
  v4 = [(CHAchievementDetailViewController *)self badgeView];
  [v3 addSubview:v4];

  id v9 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v9 bounds];
  double MidX = CGRectGetMidX(v11);
  v6 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v6 bounds];
  double MidY = CGRectGetMidY(v12);
  v8 = [(CHAchievementDetailViewController *)self badgeView];
  [v8 setCenter:MidX, MidY];
}

- (void)viewDidLoad
{
  v110.receiver = self;
  v110.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v110 viewDidLoad];
  v3 = [(CHAchievementDetailViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = +[UIColor systemBackgroundColor];
  v5 = [(CHAchievementDetailViewController *)self view];
  [v5 setBackgroundColor:v4];

  if ([(CHAchievementDetailViewController *)self forModalPresentation])
  {
    id v6 = objc_alloc_init((Class)UIView);
    [(CHAchievementDetailViewController *)self setCelebrationVideoContainer:v6];

    v7 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(CHAchievementDetailViewController *)self view];
    id v9 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    [v8 addSubview:v9];
  }
  id v10 = objc_alloc_init((Class)UIView);
  [(CHAchievementDetailViewController *)self setBadgeContainer:v10];

  CGRect v11 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  CGRect v12 = [(CHAchievementDetailViewController *)self view];
  v13 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v12 addSubview:v13];

  id v14 = objc_alloc_init((Class)UILabel);
  [(CHAchievementDetailViewController *)self setLabel:v14];

  id v15 = [(CHAchievementDetailViewController *)self label];
  [v15 setNumberOfLines:0];

  id v16 = [(CHAchievementDetailViewController *)self label];
  LODWORD(v17) = 1148846080;
  [v16 setContentCompressionResistancePriority:1 forAxis:v17];

  v18 = [(CHAchievementDetailViewController *)self label];
  LODWORD(v19) = 1148846080;
  [v18 setContentHuggingPriority:1 forAxis:v19];

  v20 = [(CHAchievementDetailViewController *)self label];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(CHAchievementDetailViewController *)self view];
  v22 = [(CHAchievementDetailViewController *)self label];
  [v21 addSubview:v22];

  LODWORD(v22) = [(CHAchievementDetailViewController *)self forDayView];
  v23 = [(CHAchievementDetailViewController *)self formatter];
  id v24 = v23;
  if (v22) {
    [v23 localizedAttributedCombinedStringWithoutProgress];
  }
  else {
  v25 = [v23 localizedAttributedCombinedString];
  }
  v26 = [(CHAchievementDetailViewController *)self label];
  [v26 setAttributedText:v25];

  v27 = [(CHAchievementDetailViewController *)self label];
  v28 = [v27 leadingAnchor];
  v29 = [(CHAchievementDetailViewController *)self view];
  objc_super v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
  [v31 setActive:1];

  v32 = [(CHAchievementDetailViewController *)self label];
  v33 = [v32 trailingAnchor];
  v34 = [(CHAchievementDetailViewController *)self view];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:-16.0];
  [v36 setActive:1];

  v37 = [(CHAchievementDetailViewController *)self label];
  v38 = [v37 lastBaselineAnchor];
  v39 = [(CHAchievementDetailViewController *)self view];
  v40 = [v39 safeAreaLayoutGuide];
  v41 = [v40 bottomAnchor];
  v42 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v42 _scaledValueForValue:-12.0];
  v43 = [v38 constraintEqualToAnchor:v41];
  [(CHAchievementDetailViewController *)self setTextBottomBaselineConstraint:v43];

  v44 = [(CHAchievementDetailViewController *)self textBottomBaselineConstraint];
  [v44 setActive:1];

  id v45 = objc_alloc_init((Class)UILayoutGuide);
  v46 = [(CHAchievementDetailViewController *)self view];
  [v46 addLayoutGuide:v45];

  v47 = [v45 leadingAnchor];
  v48 = [(CHAchievementDetailViewController *)self view];
  v49 = [v48 leadingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49 constant:16.0];
  [v50 setActive:1];

  v51 = [v45 trailingAnchor];
  v52 = [(CHAchievementDetailViewController *)self view];
  v53 = [v52 trailingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53 constant:-16.0];
  [v54 setActive:1];

  v55 = [v45 topAnchor];
  v56 = [(CHAchievementDetailViewController *)self view];
  v57 = [v56 safeAreaLayoutGuide];
  v58 = [v57 topAnchor];
  v59 = [v55 constraintEqualToAnchor:v58 constant:24.0];
  [v59 setActive:1];

  v60 = [v45 bottomAnchor];
  v61 = [(CHAchievementDetailViewController *)self label];
  v62 = [v61 topAnchor];
  v63 = [v60 constraintEqualToAnchor:v62 constant:-24.0];
  [v63 setActive:1];

  v64 = [(CHAchievementDetailViewController *)self badgeContainer];
  v65 = [v64 centerXAnchor];
  v66 = [v45 centerXAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v67 setActive:1];

  v68 = [(CHAchievementDetailViewController *)self badgeContainer];
  v69 = [v68 centerYAnchor];
  v70 = [v45 centerYAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  [v71 setActive:1];

  v72 = [(CHAchievementDetailViewController *)self badgeContainer];
  v73 = [v72 widthAnchor];
  v74 = [v45 widthAnchor];
  v75 = [v73 constraintEqualToAnchor:v74];

  LODWORD(v76) = 1144750080;
  [v75 setPriority:v76];
  [v75 setActive:1];
  v77 = [(CHAchievementDetailViewController *)self badgeContainer];
  v78 = [v77 heightAnchor];
  v79 = [(CHAchievementDetailViewController *)self badgeContainer];
  v80 = [v79 widthAnchor];
  +[AAUIBadgeView badgeAspectRatio];
  v82 = [v78 constraintEqualToAnchor:v80 multiplier:1.0 / v81];
  [v82 setActive:1];

  v83 = [(CHAchievementDetailViewController *)self badgeContainer];
  v84 = [v83 heightAnchor];
  v85 = [v45 heightAnchor];
  v86 = [v84 constraintLessThanOrEqualToAnchor:v85 multiplier:1.0];
  [v86 setActive:1];

  if ([(CHAchievementDetailViewController *)self forModalPresentation])
  {
    v87 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    v88 = [v87 topAnchor];
    v89 = [(CHAchievementDetailViewController *)self view];
    v90 = [v89 topAnchor];
    v91 = [v88 constraintEqualToAnchor:v90];
    [v91 setActive:1];

    v92 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    v93 = [v92 leadingAnchor];
    v94 = [(CHAchievementDetailViewController *)self view];
    v95 = [v94 leadingAnchor];
    v96 = [v93 constraintEqualToAnchor:v95];
    [v96 setActive:1];

    v97 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    v98 = [v97 trailingAnchor];
    v99 = [(CHAchievementDetailViewController *)self view];
    v100 = [v99 trailingAnchor];
    v101 = [v98 constraintEqualToAnchor:v100];
    [v101 setActive:1];

    v102 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
    v103 = [v102 bottomAnchor];
    v104 = [(CHAchievementDetailViewController *)self view];
    v105 = [v104 safeAreaLayoutGuide];
    v106 = [v105 bottomAnchor];
    v107 = [v103 constraintEqualToAnchor:v106];
    [v107 setActive:1];

    v108 = +[UIColor systemBlackColor];
    v109 = [(CHAchievementDetailViewController *)self view];
    [v109 setBackgroundColor:v108];

    [(CHAchievementDetailViewController *)self placeBadgeViewInContainer];
    [(CHAchievementDetailViewController *)self setupCelebrationVideoIfNeeded];
  }
}

- (void)setupCelebrationVideoIfNeeded
{
  if ([(CHAchievementDetailViewController *)self forModalPresentation])
  {
    if ([(CHAchievementDetailViewController *)self shouldShowCelebration])
    {
      v3 = [(CHAchievementDetailViewController *)self achievement];
      unsigned __int8 v4 = [v3 unearned];

      if ((v4 & 1) == 0)
      {
        [(CHAchievementDetailViewController *)self configurePlayer];
      }
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(CHAchievementDetailViewController *)self badgeView];
  unsigned __int8 v4 = [v3 superview];
  v5 = [(CHAchievementDetailViewController *)self badgeContainer];

  if (v4 == v5)
  {
    id v6 = [(CHAchievementDetailViewController *)self badgeContainer];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [(CHAchievementDetailViewController *)self badgeView];
    [v15 setFrame:v8, v10, v12, v14];

    if ([(CHAchievementDetailViewController *)self forModalPresentation])
    {
      if (!self->_celebrationComplete)
      {
        self->_celebrationComplete = 1;
        id v16 = [(CHAchievementDetailViewController *)self badgeView];
        [v16 setAlpha:0.0];
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v7 viewWillAppear:a3];
  unsigned __int8 v4 = [(CHAchievementDetailViewController *)self navigationController];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController];

  if (v5)
  {
    id v6 = [(CHAchievementDetailViewController *)self navigationController];
    [v6 detachPalette];
  }
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v34 viewDidLayoutSubviews];
  v3 = [(CHAchievementDetailViewController *)self badgeView];
  unsigned __int8 v4 = [v3 superview];
  unsigned int v5 = [(CHAchievementDetailViewController *)self badgeContainer];

  if (v4 == v5)
  {
    id v6 = [(CHAchievementDetailViewController *)self badgeContainer];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [(CHAchievementDetailViewController *)self badgeView];
    [v15 setFrame:v8, v10, v12, v14];

    id v16 = [(CHAchievementDetailViewController *)self badgeContainer];
    [v16 bounds];
    double MidX = CGRectGetMidX(v35);
    v18 = [(CHAchievementDetailViewController *)self badgeContainer];
    [v18 bounds];
    double MidY = CGRectGetMidY(v36);
    v20 = [(CHAchievementDetailViewController *)self badgeView];
    [v20 setCenter:MidX, MidY];

    v21 = [(CHAchievementDetailViewController *)self badgeView];
    [v21 resizeBadgeForCurrentViewSize];

    v22 = [(CHAchievementDetailViewController *)self badgeView];
    [v22 setFixedBadgeAngle:0.0];

    [(CHAchievementDetailViewController *)self setDidSetupBadgeView:1];
    v23 = [(CHAchievementDetailViewController *)self avPlayerLayer];

    if (v23)
    {
      id v24 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
      [v24 bounds];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      v33 = [(CHAchievementDetailViewController *)self avPlayerLayer];
      [v33 setFrame:v26, v28, v30, v32];
    }
    else if ([(CHAchievementDetailViewController *)self forModalPresentation])
    {
      [(CHAchievementDetailViewController *)self animateModalBadgeViewIfNeeded];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v8 viewDidAppear:a3];
  [(CHAchievementDetailViewController *)self setupCelebrationVideoIfNeeded];
  [(CHAchievementDetailViewController *)self setDidAppear:1];
  unsigned __int8 v4 = [(CHAchievementDetailViewController *)self avPlayer];

  if (v4)
  {
    unsigned int v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Playing achievement celebration video", v7, 2u);
    }

    id v6 = [(CHAchievementDetailViewController *)self avPlayer];
    [v6 play];
  }
  else if ([(CHAchievementDetailViewController *)self forModalPresentation])
  {
    [(CHAchievementDetailViewController *)self animateModalBadgeViewIfNeeded];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHAchievementDetailViewController;
  [(CHAchievementDetailViewController *)&v4 viewDidDisappear:a3];
  [(CHAchievementDetailViewController *)self teardownPlayer];
}

- (void)textSizeChanged:(id)a3
{
  objc_super v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v4 _scaledValueForValue:-12.0];
  double v6 = v5;
  double v7 = [(CHAchievementDetailViewController *)self textBottomBaselineConstraint];
  [v7 setConstant:v6];

  LODWORD(v7) = [(CHAchievementDetailViewController *)self forDayView];
  objc_super v8 = [(CHAchievementDetailViewController *)self formatter];
  double v9 = v8;
  if (v7) {
    [v8 localizedAttributedCombinedStringWithoutProgress];
  }
  else {
  double v10 = [v8 localizedAttributedCombinedString];
  }
  double v11 = [(CHAchievementDetailViewController *)self label];
  [v11 setAttributedText:v10];

  double v12 = [(CHAchievementDetailViewController *)self view];
  [v12 setNeedsLayout];

  double v13 = [(CHAchievementDetailViewController *)self view];
  [v13 layoutIfNeeded];

  double v14 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(CHAchievementDetailViewController *)self badgeView];
  [v23 setFrame:v16, v18, v20, v22];

  id v24 = [(CHAchievementDetailViewController *)self badgeView];
  [v24 resizeBadgeForCurrentViewSize];
}

- (CGRect)badgeFrame
{
  v2 = [(CHAchievementDetailViewController *)self badgeContainer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)doneTapped:(id)a3
{
}

- (void)shareTapped:(id)a3
{
  double v4 = [(CHAchievementDetailViewController *)self achievement];
  double v5 = sub_100133B74(v4);

  double v6 = [(CHAchievementDetailViewController *)self locProvider];
  double v7 = [(CHAchievementDetailViewController *)self achievement];
  double v8 = [v6 shareDescriptionForAchievement:v7];

  if (v5 && v8)
  {
    [(CHAchievementDetailViewController *)self setSharingImage:v5];
    [(CHAchievementDetailViewController *)self setSharingText:v8];
    id v9 = objc_alloc((Class)UIActivityViewController);
    v18[0] = v8;
    v18[1] = v5;
    v18[2] = self;
    double v10 = +[NSArray arrayWithObjects:v18 count:3];
    id v11 = [v9 initWithActivityItems:v10 applicationActivities:0];

    double v12 = sub_1000FCD04();
    [v11 setExcludedActivityTypes:v12];

    double v13 = [(CHAchievementDetailViewController *)self navigationController];

    if (v13)
    {
      [(CHAchievementDetailViewController *)self presentViewController:v11 animated:1 completion:0];
    }
    else
    {
      double v14 = +[UIApplication sharedApplication];
      double v15 = [v14 windows];
      double v16 = [v15 firstObject];
      double v17 = [v16 rootViewController];

      [v17 presentViewController:v11 animated:1 completion:0];
    }
  }
}

- (void)appWillResignActive:(id)a3
{
  double v4 = [(CHAchievementDetailViewController *)self avPlayer];
  [v4 pause];

  double v5 = [(CHAchievementDetailViewController *)self avPlayerLayer];
  [v5 removeFromSuperlayer];

  [(CHAchievementDetailViewController *)self setAvPlayer:0];
  double v6 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
  [v6 removeFromSuperview];

  id v7 = [(CHAchievementDetailViewController *)self badgeView];
  [v7 setAlpha:1.0];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1008D8AB8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = [(CHAchievementDetailViewController *)self sharingImage];
  if (v4)
  {
    double v5 = [(CHAchievementDetailViewController *)self sharingText];

    if (v5)
    {
      id v4 = objc_alloc_init((Class)LPLinkMetadata);
      double v6 = [(CHAchievementDetailViewController *)self sharingText];
      [v4 setSummary:v6];

      id v7 = objc_alloc((Class)LPImage);
      double v8 = [(CHAchievementDetailViewController *)self sharingImage];
      id v9 = UIImagePNGRepresentation(v8);
      id v10 = [v7 initWithData:v9 MIMEType:@"image/png"];
      [v4 setImage:v10];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)playerFinished:(id)a3
{
  id v4 = [(CHAchievementDetailViewController *)self avPlayerLayer];
  [v4 removeFromSuperlayer];

  double v5 = [(CHAchievementDetailViewController *)self celebrationVideoContainer];
  [v5 setAlpha:0.0];

  [(CHAchievementDetailViewController *)self animateModalBadgeViewIfNeeded];
}

- (void)animateModalBadgeViewIfNeeded
{
  if (![(CHAchievementDetailViewController *)self modalBadgeFlipStarted]
    && [(CHAchievementDetailViewController *)self forModalPresentation]
    && [(CHAchievementDetailViewController *)self didSetupBadgeView]
    && [(CHAchievementDetailViewController *)self didAppear])
  {
    [(CHAchievementDetailViewController *)self animateModalBadgeView];
    [(CHAchievementDetailViewController *)self setModalBadgeFlipStarted:1];
  }
}

- (void)animateModalBadgeView
{
  double v3 = ACHLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.a) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Animating modal badge view", (uint8_t *)&buf, 2u);
  }

  id v4 = [(CHAchievementDetailViewController *)self achievement];
  unsigned __int8 v5 = [v4 unearned];

  if (v5)
  {
    double v6 = 0.5;
    CGFloat v7 = 0.75;
  }
  else
  {
    double v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Flipping in badge animation", (uint8_t *)&buf, 2u);
    }

    id v9 = [(CHAchievementDetailViewController *)self badgeView];
    [v9 setPaused:0];

    id v10 = [(CHAchievementDetailViewController *)self badgeView];
    [v10 playFlipInAnimation];

    double v6 = 1.0;
    CGFloat v7 = 0.5;
  }
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v7, v7);
  CGAffineTransform v15 = buf;
  id v11 = [(CHAchievementDetailViewController *)self badgeView];
  CGAffineTransform v14 = v15;
  [v11 setTransform:&v14];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100123F80;
  v13[3] = &unk_1008ABA78;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100123FF8;
  v12[3] = &unk_1008ACA80;
  v12[4] = self;
  +[UIView animateWithDuration:v13 animations:v12 completion:v6];
}

- (void)configurePlayer
{
  if (!self->_avPlayer && !self->_avPlayerLayer)
  {
    double v3 = [(CHAchievementDetailViewController *)self achievement];
    id v4 = [v3 template];
    unsigned __int8 v5 = [v4 uniqueName];
    double v6 = +[FICelebrationAssetURLProvider celebrationMovieURLForAchievementIdentifer:v5];

    if (v6)
    {
      CGFloat v7 = +[AVAsset assetWithURL:v6];
      double v8 = +[AVPlayerItem playerItemWithAsset:v7];
      id v9 = (AVPlayer *)objc_alloc_init((Class)AVPlayer);
      avPlayer = self->_avPlayer;
      self->_avPlayer = v9;

      [(AVPlayer *)self->_avPlayer _setParticipatesInAudioSession:0];
      [(AVPlayer *)self->_avPlayer setActionAtItemEnd:1];
      [(AVPlayer *)self->_avPlayer replaceCurrentItemWithPlayerItem:v8];
      id v11 = +[AVPlayerLayer playerLayerWithPlayer:self->_avPlayer];
      avPlayerLayer = self->_avPlayerLayer;
      self->_avPlayerLayer = v11;

      [(AVPlayerLayer *)self->_avPlayerLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
      double v13 = [(UIView *)self->_celebrationVideoContainer layer];
      [v13 addSublayer:self->_avPlayerLayer];

      CGAffineTransform v14 = +[NSNotificationCenter defaultCenter];
      CGAffineTransform v15 = [(CHAchievementDetailViewController *)self avPlayer];
      double v16 = [v15 currentItem];
      [v14 addObserver:self selector:"playerFinished:" name:AVPlayerItemDidPlayToEndTimeNotification object:v16];
    }
    else
    {
      CGFloat v7 = ACHLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = [(CHAchievementDetailViewController *)self achievement];
        double v18 = [v17 template];
        double v19 = [v18 uniqueName];
        int v20 = 138412290;
        double v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No celebration asset for achievement: %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)teardownPlayer
{
  [(AVPlayer *)self->_avPlayer replaceCurrentItemWithPlayerItem:0];
  [(AVPlayerLayer *)self->_avPlayerLayer setPlayer:0];
  [(AVPlayerLayer *)self->_avPlayerLayer removeFromSuperlayer];
  avPlayer = self->_avPlayer;
  self->_avPlayer = 0;

  avPlayerLayer = self->_avPlayerLayer;
  self->_avPlayerLayer = 0;
}

- (AAUIBadgeView)badgeView
{
  return self->_badgeView;
}

- (UIView)badgeContainer
{
  return self->_badgeContainer;
}

- (void)setBadgeContainer:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIView)celebrationVideoContainer
{
  return self->_celebrationVideoContainer;
}

- (void)setCelebrationVideoContainer:(id)a3
{
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (BOOL)earned
{
  return self->_earned;
}

- (void)setEarned:(BOOL)a3
{
  self->_earned = a3;
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
}

- (AAUIAchievementFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (NSLayoutConstraint)textBottomBaselineConstraint
{
  return self->_textBottomBaselineConstraint;
}

- (void)setTextBottomBaselineConstraint:(id)a3
{
}

- (UIImage)sharingImage
{
  return self->_sharingImage;
}

- (void)setSharingImage:(id)a3
{
}

- (NSString)sharingText
{
  return self->_sharingText;
}

- (void)setSharingText:(id)a3
{
}

- (BOOL)forDayView
{
  return self->_forDayView;
}

- (void)setForDayView:(BOOL)a3
{
  self->_forDayView = a3;
}

- (BOOL)forModalPresentation
{
  return self->_forModalPresentation;
}

- (void)setForModalPresentation:(BOOL)a3
{
  self->_forModalPresentation = a3;
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
}

- (BOOL)celebrationComplete
{
  return self->_celebrationComplete;
}

- (void)setCelebrationComplete:(BOOL)a3
{
  self->_celebrationComplete = a3;
}

- (BOOL)shouldShowCelebration
{
  return self->_shouldShowCelebration;
}

- (void)setShouldShowCelebration:(BOOL)a3
{
  self->_shouldShowCelebration = a3;
}

- (BOOL)modalBadgeFlipStarted
{
  return self->_modalBadgeFlipStarted;
}

- (void)setModalBadgeFlipStarted:(BOOL)a3
{
  self->_modalBadgeFlipStarted = a3;
}

- (BOOL)didSetupBadgeView
{
  return self->_didSetupBadgeView;
}

- (void)setDidSetupBadgeView:(BOOL)a3
{
  self->_didSetupBadgeView = a3;
}

- (BOOL)didAppear
{
  return self->_didAppear;
}

- (void)setDidAppear:(BOOL)a3
{
  self->_didAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_textBottomBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
  objc_storeStrong((id *)&self->_celebrationVideoContainer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeContainer, 0);

  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end