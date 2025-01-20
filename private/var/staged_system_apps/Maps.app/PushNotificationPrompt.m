@interface PushNotificationPrompt
+ (BOOL)shouldPromptForLaunch;
+ (BOOL)shouldRepeatPromptForLaunch;
+ (void)checkShouldRepeatForUserAction:(id)a3;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CGSize)preferredContentSize;
- (PushNotificationPrompt)initWithReason:(unint64_t)a3 authorizationStatus:(int64_t)a4 completion:(id)a5;
- (id)detailText;
- (id)primaryButtonTitle;
- (id)secondaryButtonTitle;
- (id)titleString;
- (int)_analyticsTarget;
- (void)_contentSizeDidChange;
- (void)_setHorizontalLayoutWide:(BOOL)a3;
- (void)_updateHorizontalLayoutIfNeeded;
- (void)continueSelected;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PushNotificationPrompt

+ (void)checkShouldRepeatForUserAction:(id)a3
{
  id v3 = a3;
  v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PushNotificationPrompt checkShouldRepeatForUserAction", buf, 2u);
  }

  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [v5 objectForKey:@"MapsNotificationAuthLastPromptedDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = +[NSUserDefaults standardUserDefaults];
    id v9 = [v8 integerForKey:@"MapsNotificationAuthRepromptCount"];

    uint64_t Integer = GEOConfigGetInteger();
    v11 = sub_1000A930C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = +[NSNumber numberWithInteger:v9];
      v13 = +[NSNumber numberWithInteger:Integer];
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PushNotificationPrompt: user was prompted previously on %@, has been repeat prompted %@ times, with a maximum repeat prompt count of %@", buf, 0x20u);
    }
    if ((uint64_t)v9 >= Integer)
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    }
    else
    {
      v14 = +[UNUserNotificationCenter currentNotificationCenter];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100C72858;
      v16[3] = &unk_1012F4420;
      id v17 = v3;
      [v14 getNotificationSettingsWithCompletionHandler:v16];
    }
  }
  else
  {
    v15 = sub_1000A930C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "PushNotificationPrompt: user has never been prompted. This may be a user who set their notification preference to NO before Sky E.", buf, 2u);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

+ (BOOL)shouldRepeatPromptForLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"MapsNotificationAuthLastPromptedDate"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = sub_1000A930C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldRepeatPromptForLaunch user has never been prompted. This may be an initial launch, or a user who set their notification preference to NO before Sky E.", (uint8_t *)&v20, 2u);
    }
    goto LABEL_14;
  }
  v4 = v3;
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 integerForKey:@"MapsNotificationAuthRepromptCount"];

  uint64_t Integer = GEOConfigGetInteger();
  v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:v4];
  double v10 = v9;
  GEOConfigGetDouble();
  double v12 = v11;

  v13 = sub_1000A930C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = +[NSNumber numberWithInteger:v6];
    v15 = +[NSNumber numberWithInteger:Integer];
    int v20 = 138412802;
    v21 = v4;
    __int16 v22 = 2112;
    v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldRepeatPromptForLaunch user was prompted previously on %@, has been repeat prompted %@ times, with a maximum repeat prompt count of %@", (uint8_t *)&v20, 0x20u);
  }
  if (v10 <= v12 || (uint64_t)v6 >= Integer)
  {
LABEL_14:

    v4 = sub_1000A930C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PushNotificationPrompt: returning NO for shouldRepeatPromptForLaunch", (uint8_t *)&v20, 2u);
    }
    BOOL v18 = 0;
    goto LABEL_17;
  }
  id v17 = sub_1000A930C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "PushNotificationPrompt: returning YES for shouldRepeatPromptForLaunch", (uint8_t *)&v20, 2u);
  }

  BOOL v18 = 1;
LABEL_17:

  return v18;
}

+ (BOOL)shouldPromptForLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"MapsNotificationAuthPromptCount"];

  uint64_t Integer = GEOConfigGetInteger();
  v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = +[NSNumber numberWithBool:(uint64_t)v3 < Integer];
    id v7 = +[NSNumber numberWithInteger:v3];
    v8 = +[NSNumber numberWithInteger:Integer];
    int v10 = 138412802;
    double v11 = v6;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldPromptForLaunch %@ with prompt count %@ max prompts %@", (uint8_t *)&v10, 0x20u);
  }
  return (uint64_t)v3 < Integer;
}

- (id)titleString
{
  switch(self->_promptReason)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      if ((SBUIIsSystemApertureEnabled() & 1) != 0
        || (+[GEOCountryConfiguration sharedConfiguration],
            id v3 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v4 = [v3 currentCountrySupportsNavigation],
            v3,
            (v4 & 1) == 0))
      {
        v5 = +[NSBundle mainBundle];
        id v6 = v5;
        CFStringRef v7 = @"Get Notified when Friends Share Their ETAs";
      }
      else
      {
        v5 = +[NSBundle mainBundle];
        id v6 = v5;
        CFStringRef v7 = @"Get Turn-by-Turn Directions";
      }
      goto LABEL_8;
    case 2uLL:
      v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"Get Updates on Your Reports";
      goto LABEL_8;
    case 3uLL:
      v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"Learn When Your Photos Go Live";
LABEL_8:
      v2 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v2;
}

- (id)detailText
{
  int64_t authorizationStatus = self->_authorizationStatus;
  char v4 = SBUIIsSystemApertureEnabled();
  if (authorizationStatus)
  {
    if ((v4 & 1) != 0
      || (+[GEOCountryConfiguration sharedConfiguration],
          v5 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v6 = [v5 currentCountrySupportsNavigation],
          v5,
          (v6 & 1) == 0))
    {
      v8 = +[NSBundle mainBundle];
      double v9 = v8;
      CFStringRef v10 = @"Notifications include shared ETAs and updates about your photos and reports. You can turn notifications for Maps on and off in Settings.";
    }
    else
    {
      uint64_t v7 = sub_1000BBB44(self);
      v8 = +[NSBundle mainBundle];
      double v9 = v8;
      if (v7 == 5) {
        CFStringRef v10 = @"Notifications include shared ETAs and updates about your photos and reports. You can turn notifications for Maps on and off in System Settings.";
      }
      else {
        CFStringRef v10 = @"Notifications include turn-by-turn directions, shared ETAs, and updates about your photos and reports. You can turn notifications for Maps on and off in Settings.";
      }
    }
  }
  else if ((v4 & 1) != 0 {
         || (+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"), double v11 = objc_claimAutoreleasedReturnValue(), v12 = [v11 currentCountrySupportsNavigation], v11, (v12 & 1) == 0))
  }
  {
    v8 = +[NSBundle mainBundle];
    double v9 = v8;
    CFStringRef v10 = @"Notifications include shared ETAs and updates about your photos and reports.";
  }
  else
  {
    v8 = +[NSBundle mainBundle];
    double v9 = v8;
    CFStringRef v10 = @"Notifications include turn-by-turn directions, shared ETAs, and updates about your photos and reports.";
  }
  v13 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

  return v13;
}

- (id)primaryButtonTitle
{
  if (self->_authorizationStatus)
  {
    uint64_t v2 = sub_1000BBB44(self);
    id v3 = +[NSBundle mainBundle];
    char v4 = v3;
    if (v2 == 5) {
      CFStringRef v5 = @"[Notification Prewarm] Open System Settings";
    }
    else {
      CFStringRef v5 = @"[Notification Prewarm] Go to Settings";
    }
  }
  else
  {
    id v3 = +[NSBundle mainBundle];
    char v4 = v3;
    CFStringRef v5 = @"[Notification Prewarm] Enable Notifications";
  }
  unsigned __int8 v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

- (id)secondaryButtonTitle
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 integerForKey:@"MapsNotificationAuthRepromptCount"];

  uint64_t Integer = GEOConfigGetInteger();
  unint64_t promptReason = self->_promptReason;
  uint64_t v7 = +[NSBundle mainBundle];
  v8 = v7;
  if ((uint64_t)v4 + 1 < Integer || promptReason == 0) {
    CFStringRef v10 = @"[Notification Prewarm] Not Now";
  }
  else {
    CFStringRef v10 = @"[Notification Prewarm] Dismiss";
  }
  double v11 = [v7 localizedStringForKey:v10 value:@"localized string not found" table:0];

  return v11;
}

- (PushNotificationPrompt)initWithReason:(unint64_t)a3 authorizationStatus:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PushNotificationPrompt;
  double v9 = [(PushNotificationPrompt *)&v15 initWithNibName:0 bundle:0];
  if (v9)
  {
    id v10 = objc_retainBlock(v8);
    id completion = v9->_completion;
    v9->_id completion = v10;

    v9->_int64_t authorizationStatus = a4;
    v9->_unint64_t promptReason = a3;
    [(PushNotificationPrompt *)v9 setModalPresentationStyle:2];
    unsigned __int8 v12 = [(PushNotificationPrompt *)v9 presentationController];
    [v12 setDelegate:v9];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v9 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v9;
}

- (void)viewDidLoad
{
  v128.receiver = self;
  v128.super_class = (Class)PushNotificationPrompt;
  [(PushNotificationPrompt *)&v128 viewDidLoad];
  id v3 = [(PushNotificationPrompt *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = +[UIColor systemBackgroundColor];
  CFStringRef v5 = [(PushNotificationPrompt *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = objc_alloc_init((Class)UIScrollView);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [(PushNotificationPrompt *)self view];
  [v7 addSubview:v6];

  id v8 = +[UIButtonConfiguration filledButtonConfiguration];
  [v8 setButtonSize:3];
  double v9 = [v8 background];
  [v9 setCornerRadius:14.0];

  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_100C74038;
  v127[3] = &unk_1012EBC40;
  v127[4] = self;
  id v10 = +[UIAction actionWithHandler:v127];
  v121 = v8;
  double v11 = +[UIButton buttonWithConfiguration:v8 primaryAction:v10];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned __int8 v12 = [(PushNotificationPrompt *)self view];
  [v12 addSubview:v11];

  v123 = v11;
  objc_storeStrong((id *)&self->_continueButton, v11);
  v13 = +[UIButtonConfiguration plainButtonConfiguration];
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_100C74040;
  v126[3] = &unk_1012EBC40;
  v126[4] = self;
  __int16 v14 = +[UIAction actionWithHandler:v126];
  objc_super v15 = +[UIButton buttonWithConfiguration:v13 primaryAction:v14];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [v15 configuration];
  [v16 setButtonSize:3];

  id v17 = [(PushNotificationPrompt *)self view];
  [v17 addSubview:v15];

  objc_storeStrong((id *)&self->_notNowButton, v15);
  id v18 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v22 = [v18 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = +[UIColor labelColor];
  [v22 setTextColor:v23];

  __int16 v24 = [(PushNotificationPrompt *)self titleString];
  [v22 setText:v24];

  [v22 setNumberOfLines:0];
  [v22 setTextAlignment:1];
  [v6 addSubview:v22];
  objc_storeStrong((id *)&self->_titleLabel, v22);
  id v25 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = +[UIColor labelColor];
  [v25 setTextColor:v26];

  v27 = [(PushNotificationPrompt *)self detailText];
  [v25 setText:v27];

  [v25 setNumberOfLines:0];
  [v25 setTextAlignment:1];
  v124 = v6;
  [v6 addSubview:v25];
  v122 = v25;
  objc_storeStrong((id *)&self->_detailLabel, v25);
  v28 = +[NSLocale currentLocale];
  v29 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v28];

  v118 = v29;
  unsigned __int8 v30 = [v29 containsString:@"a"];
  v120 = v15;
  if (sub_1000BBB44(self) == 5)
  {
    uint64_t v31 = +[UIImage imageNamed:@"MacNotificationWarmingHeader"];
    v32 = v123;
  }
  else
  {
    v33 = +[NSLocale currentLocale];
    v34 = [v33 localeIdentifier];

    v35 = _CFLocaleCopyNumberingSystemForLocaleIdentifier();
    if ([v35 isEqualToString:@"arab"])
    {
      v32 = v123;
      if (v30) {
        CFStringRef v36 = @"Arabic12hrNotificationWarmingHeader";
      }
      else {
        CFStringRef v36 = @"Arabic24hrNotificationWarmingHeader";
      }
    }
    else
    {
      v32 = v123;
      if ([v35 isEqualToString:@"deva"])
      {
        if (v30) {
          CFStringRef v36 = @"Devanagar12hrNotificationWarmingHeader";
        }
        else {
          CFStringRef v36 = @"Devanagar24hrNotificationWarmingHeader";
        }
      }
      else if (v30)
      {
        CFStringRef v36 = @"12hrNotificationWarmingHeader";
      }
      else
      {
        CFStringRef v36 = @"24hrNotificationWarmingHeader";
      }
    }
    uint64_t v31 = +[UIImage imageNamed:v36];
  }
  v117 = (void *)v31;
  id v37 = [objc_alloc((Class)UIImageView) initWithImage:v31];
  [v37 setContentMode:2];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 setClipsToBounds:1];
  [v6 addSubview:v37];
  v38 = [v122 firstBaselineAnchor];
  v39 = [v22 lastBaselineAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  titleToDetailConstraint = self->_titleToDetailConstraint;
  self->_titleToDetailConstraint = v40;

  v111 = [v6 topAnchor];
  v113 = [(PushNotificationPrompt *)self view];
  v109 = [v113 topAnchor];
  v107 = [v111 constraintEqualToAnchor:v109];
  v131[0] = v107;
  v103 = [v6 widthAnchor];
  v105 = [(PushNotificationPrompt *)self view];
  v101 = [v105 widthAnchor];
  v99 = [v103 constraintEqualToAnchor:v101];
  v131[1] = v99;
  v96 = [v6 leadingAnchor];
  v97 = [(PushNotificationPrompt *)self view];
  v95 = [v97 leadingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v131[2] = v94;
  v93 = [v6 bottomAnchor];
  v92 = [v32 topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92 constant:-16.0];
  v131[3] = v91;
  v90 = [v37 widthAnchor];
  v89 = [v6 widthAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v131[4] = v88;
  v87 = [v37 topAnchor];
  v86 = [v6 topAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v131[5] = v85;
  v83 = [v37 heightAnchor];
  v84 = [(PushNotificationPrompt *)self view];
  v82 = [v84 heightAnchor];
  v81 = [v83 constraintLessThanOrEqualToAnchor:v82 multiplier:0.48];
  v131[6] = v81;
  v80 = [v37 centerXAnchor];
  v79 = [v6 centerXAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v131[7] = v78;
  v77 = [v22 firstBaselineAnchor];
  v116 = v37;
  v76 = [v37 bottomAnchor];
  [v77 constraintEqualToAnchor:v76 constant:54.0];
  v42 = v125 = self;
  v131[8] = v42;
  v119 = v22;
  v43 = [v22 centerXAnchor];
  v44 = [v124 centerXAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v46 = self->_titleToDetailConstraint;
  v131[9] = v45;
  v131[10] = v46;
  v47 = [v122 centerXAnchor];
  v48 = [v124 centerXAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v131[11] = v49;
  v50 = [v122 bottomAnchor];
  v51 = [v124 bottomAnchor];
  v52 = [v50 constraintLessThanOrEqualToAnchor:v51 constant:-8.0];
  v131[12] = v52;
  v115 = +[NSArray arrayWithObjects:v131 count:13];

  v53 = v125;
  if (sub_1000BBB44(v125) == 5)
  {
    v100 = [v123 bottomAnchor];
    v114 = [(PushNotificationPrompt *)v125 view];
    v112 = [v114 bottomAnchor];
    v110 = [v100 constraintEqualToAnchor:v112 constant:-20.0];
    v130[0] = v110;
    v106 = [v123 trailingAnchor];
    v108 = [(PushNotificationPrompt *)v125 view];
    v104 = [v108 trailingAnchor];
    v102 = [v106 constraintEqualToAnchor:v104 constant:-20.0];
    v130[1] = v102;
    v98 = [v120 centerYAnchor];
    v54 = [v123 centerYAnchor];
    v55 = [v98 constraintEqualToAnchor:v54];
    v130[2] = v55;
    v56 = [v120 trailingAnchor];
    v57 = [v123 leadingAnchor];
    v58 = [v56 constraintEqualToAnchor:v57 constant:-20.0];
    v130[3] = v58;
    v59 = +[NSArray arrayWithObjects:v130 count:4];
    v60 = [v115 arrayByAddingObjectsFromArray:v59];

    v61 = v100;
    v62 = v120;

    v53 = v125;
    v63 = v114;
    v64 = v123;
  }
  else
  {
    v62 = v120;
    v65 = [v120 firstBaselineAnchor];
    v64 = v123;
    v66 = [v123 bottomAnchor];
    uint64_t v67 = [v65 constraintEqualToAnchor:v66];
    notNowToContinueConstraint = v125->_notNowToContinueConstraint;
    v125->_notNowToContinueConstraint = (NSLayoutConstraint *)v67;

    v69 = [v123 bottomAnchor];
    v70 = [(PushNotificationPrompt *)v125 view];
    v71 = [v70 safeAreaLayoutGuide];
    v72 = [v71 bottomAnchor];
    uint64_t v73 = [v69 constraintEqualToAnchor:v72];
    continueToBottomConstraint = v125->_continueToBottomConstraint;
    v125->_continueToBottomConstraint = (NSLayoutConstraint *)v73;

    v75 = v125->_continueToBottomConstraint;
    v129[0] = v125->_notNowToContinueConstraint;
    v129[1] = v75;
    v61 = +[NSArray arrayWithObjects:v129 count:2];
    v63 = v115;
    v60 = [v115 arrayByAddingObjectsFromArray:v61];
  }

  [(PushNotificationPrompt *)v53 _contentSizeDidChange];
  +[NSLayoutConstraint activateConstraints:v60];
}

- (void)_contentSizeDidChange
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v4 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleLargeTitle weight:UIFontWeightBold];
  [(UILabel *)self->_titleLabel setFont:v4];

  [(UILabel *)self->_detailLabel setFont:v3];
  CFStringRef v5 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody weight:UIFontWeightSemibold];
  id v6 = objc_alloc((Class)NSAttributedString);
  uint64_t v7 = [(PushNotificationPrompt *)self primaryButtonTitle];
  NSAttributedStringKey v17 = NSFontAttributeName;
  id v18 = v5;
  id v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v9 = [v6 initWithString:v7 attributes:v8];

  [(UIButton *)self->_continueButton setAttributedTitle:v9 forState:0];
  id v10 = objc_alloc((Class)NSAttributedString);
  double v11 = [(PushNotificationPrompt *)self secondaryButtonTitle];
  NSAttributedStringKey v15 = NSFontAttributeName;
  v16 = v5;
  unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v13 = [v10 initWithString:v11 attributes:v12];

  [(UIButton *)self->_notNowButton setAttributedTitle:v13 forState:0];
  [v3 _scaledValueForValue:30.0];
  -[NSLayoutConstraint setConstant:](self->_notNowToContinueConstraint, "setConstant:");
  [v3 _scaledValueForValue:44.0];
  -[NSLayoutConstraint setConstant:](self->_titleToDetailConstraint, "setConstant:");
  [v3 _scaledValueForValue:54.0];
  [(NSLayoutConstraint *)self->_continueToBottomConstraint setConstant:-v14];
}

- (void)_setHorizontalLayoutWide:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_horizontalConstraints || self->_horizontalLayoutIsWide != a3)
  {
    self->_horizontalLayoutIsWide = a3;
    +[NSLayoutConstraint deactivateConstraints:self->_horizontalConstraints];
    CFStringRef v5 = [(UILabel *)self->_titleLabel widthAnchor];
    id v6 = [(PushNotificationPrompt *)self view];
    uint64_t v7 = [v6 widthAnchor];
    if (v3) {
      double v8 = -74.0;
    }
    else {
      double v8 = -48.0;
    }
    id v9 = [v5 constraintEqualToAnchor:v7 constant:v8];
    v42[0] = v9;
    id v10 = [(UILabel *)self->_detailLabel widthAnchor];
    double v11 = [(PushNotificationPrompt *)self view];
    unsigned __int8 v12 = [v11 widthAnchor];
    id v13 = [v10 constraintEqualToAnchor:v12 constant:v8];
    v42[1] = v13;
    v39 = +[NSArray arrayWithObjects:v42 count:2];

    if (v3)
    {
      double v14 = v39;
      if (sub_1000BBB44(self) == 5)
      {
LABEL_11:
        +[NSLayoutConstraint activateConstraints:v14];
        horizontalConstraints = self->_horizontalConstraints;
        self->_horizontalConstraints = v14;

        return;
      }
      NSAttributedStringKey v15 = [(UIButton *)self->_notNowButton centerXAnchor];
      v16 = [(PushNotificationPrompt *)self view];
      v38 = [v16 centerXAnchor];
      id v37 = [v15 constraintEqualToAnchor:];
      v40[0] = v37;
      CFStringRef v36 = [(UIButton *)self->_notNowButton widthAnchor];
      v35 = [v36 constraintEqualToConstant:360.0];
      v40[1] = v35;
      NSAttributedStringKey v17 = [(UIButton *)self->_continueButton centerXAnchor];
      v33 = [(PushNotificationPrompt *)self view];
      [v33 centerXAnchor];
      v32 = v34 = v17;
      id v18 = [v17 constraintEqualToAnchor:];
      v40[2] = v18;
      id v19 = [(UIButton *)self->_continueButton widthAnchor];
      int v20 = [v19 constraintEqualToConstant:360.0];
      v40[3] = v20;
      v21 = +[NSArray arrayWithObjects:v40 count:4];
      id v22 = v39;
      double v14 = [(NSArray *)v39 arrayByAddingObjectsFromArray:v21];
    }
    else
    {
      unsigned __int8 v30 = [(UIButton *)self->_notNowButton leadingAnchor];
      uint64_t v31 = [(PushNotificationPrompt *)self view];
      v38 = [v31 leadingAnchor];
      id v37 = [v30 constraintEqualToAnchor:24.0];
      v41[0] = v37;
      v23 = [(UIButton *)self->_notNowButton trailingAnchor];
      v35 = [(PushNotificationPrompt *)self view];
      [v35 trailingAnchor];
      v34 = CFStringRef v36 = v23;
      v33 = [v23 constraintEqualToAnchor:-24.0];
      v41[1] = v33;
      v32 = [(UIButton *)self->_continueButton leadingAnchor];
      v29 = [(PushNotificationPrompt *)self view];
      id v19 = [v29 leadingAnchor];
      int v20 = [v32 constraintEqualToAnchor:v19 constant:24.0];
      v41[2] = v20;
      v21 = [(UIButton *)self->_continueButton trailingAnchor];
      id v22 = [(PushNotificationPrompt *)self view];
      __int16 v24 = [v22 trailingAnchor];
      id v25 = [v21 constraintEqualToAnchor:v24 constant:-24.0];
      v41[3] = v25;
      v26 = +[NSArray arrayWithObjects:v41 count:4];
      uint64_t v27 = [(NSArray *)v39 arrayByAddingObjectsFromArray:v26];

      id v18 = v29;
      double v14 = (NSArray *)v27;

      v16 = v31;
      NSAttributedStringKey v15 = v30;
    }

    goto LABEL_11;
  }
}

- (void)_updateHorizontalLayoutIfNeeded
{
  if (sub_1000BBB44(self))
  {
    BOOL v3 = [(PushNotificationPrompt *)self view];
    id v4 = [v3 window];
    CFStringRef v5 = [v4 traitCollection];
    BOOL v6 = [v5 horizontalSizeClass] != (id)1;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (sub_1000BBB44(self))
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = [(PushNotificationPrompt *)self view];
    [v8 bounds];
    double Width = CGRectGetWidth(v12);
    id v10 = [(PushNotificationPrompt *)self view];
    [v10 bounds];
    BOOL v7 = Width > CGRectGetHeight(v13);
  }

  [(PushNotificationPrompt *)self _setHorizontalLayoutWide:v6 | v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PushNotificationPrompt;
  [(PushNotificationPrompt *)&v4 viewWillAppear:a3];
  [(PushNotificationPrompt *)self _updateHorizontalLayoutIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PushNotificationPrompt;
  id v7 = a4;
  -[PushNotificationPrompt viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C74A18;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PushNotificationPrompt;
  [(PushNotificationPrompt *)&v12 viewDidAppear:a3];
  unint64_t promptReason = self->_promptReason;
  CFStringRef v5 = +[NSUserDefaults standardUserDefaults];
  BOOL v6 = v5;
  if (promptReason) {
    CFStringRef v7 = @"MapsNotificationAuthRepromptCount";
  }
  else {
    CFStringRef v7 = @"MapsNotificationAuthPromptCount";
  }
  double v8 = (char *)[v5 integerForKey:v7];

  objc_super v9 = +[NSUserDefaults standardUserDefaults];
  [v9 setInteger:v8 + 1 forKey:v7];

  id v10 = +[NSUserDefaults standardUserDefaults];
  double v11 = +[NSDate date];
  [v10 setObject:v11 forKey:@"MapsNotificationAuthLastPromptedDate"];

  +[GEOAPPortal captureUserAction:45 target:[(PushNotificationPrompt *)self _analyticsTarget] value:0];
}

- (CGSize)preferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    double v3 = 600.0;
    double v4 = 480.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PushNotificationPrompt;
    [(PushNotificationPrompt *)&v5 preferredContentSize];
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (void)continueSelected
{
  uint64_t v3 = sub_1000BBB44(self);
  if (self->_authorizationStatus)
  {
    +[GEOAPPortal captureUserAction:271 target:[(PushNotificationPrompt *)self _analyticsTarget] value:0];
    double v4 = +[NSURL URLWithString:UIApplicationOpenNotificationSettingsURLString];
    objc_super v5 = +[UIApplication sharedApplication];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C74E80;
    v10[3] = &unk_1012E7D28;
    v10[4] = self;
    [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:v10];
  }
  else
  {
    uint64_t v6 = v3;
    BOOL v7 = v3 == 5;
    +[GEOAPPortal captureUserAction:2119 target:[(PushNotificationPrompt *)self _analyticsTarget] value:0];
    double v8 = +[UNUserNotificationCenter currentNotificationCenter];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C74D74;
    v11[3] = &unk_10131D528;
    BOOL v12 = v7;
    v11[4] = self;
    [v8 requestAuthorizationWithOptions:14 completionHandler:v11];

    if (v6 == 5)
    {
      id completion = (void (**)(void))self->_completion;
      if (completion) {
        completion[2]();
      }
    }
  }
}

- (int)_analyticsTarget
{
  unint64_t promptReason = self->_promptReason;
  if (promptReason > 4) {
    return 0;
  }
  else {
    return dword_100F73CD0[promptReason];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_notNowToContinueConstraint, 0);
  objc_storeStrong((id *)&self->_titleToDetailConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end