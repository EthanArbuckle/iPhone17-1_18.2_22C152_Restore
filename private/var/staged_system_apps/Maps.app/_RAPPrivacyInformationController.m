@interface _RAPPrivacyInformationController
- (_RAPPrivacyInformationController)initWithCoder:(id)a3;
- (_RAPPrivacyInformationController)initWithCompletion:(id)a3;
- (_RAPPrivacyInformationController)initWithCompletion:(id)a3 emailAddress:(id)a4 isUserEnteredEmailAddress:(BOOL)a5;
- (_RAPPrivacyInformationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_RAPPrivacyInformationController)initWithShortcutType:(int64_t)a3 completion:(id)a4;
- (id)_createDetailsViewInView:(id)a3 constraints:(id)a4;
- (id)_createSendButton;
- (id)_createSkipButton;
- (id)_createSwitchViewInView:(id)a3 constraints:(id)a4;
- (id)_getEvent;
- (id)_obViewController;
- (id)_setupBottomViewInView:(id)a3 commonConstraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6;
- (id)_setupContainerViewInView:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6;
- (id)completion;
- (id)defaultPOIStyleAttributes;
- (id)followUpDetailFont;
- (id)followUpLabelFont;
- (id)sendButtonFont;
- (id)setupContactViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6;
- (id)setupTitleViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6;
- (id)titleFont;
- (void)_sendButtonTapped;
- (void)_skipButtonTapped;
- (void)acceptPrivacyAgreement;
- (void)cancelPrivacyAgreement;
- (void)contentSizeDidChange:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setSkipButtonFont;
- (void)setSubtitleFont;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCenterYConstraintIfNeeded;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation _RAPPrivacyInformationController

- (_RAPPrivacyInformationController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RAPPrivacyInformationController;
  v5 = [(_RAPPrivacyInformationController *)&v11 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = v6;

    v5->_isUserEnteredEmailAddress = 0;
    uint64_t v8 = sub_100521AB8();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;
  }
  return v5;
}

- (_RAPPrivacyInformationController)initWithCompletion:(id)a3 emailAddress:(id)a4 isUserEnteredEmailAddress:(BOOL)a5
{
  id v9 = a4;
  v10 = [(_RAPPrivacyInformationController *)self initWithCompletion:a3];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_isUserEnteredEmailAddress = a5;
    objc_storeStrong((id *)&v10->_emailAddress, a4);
  }

  return v11;
}

- (_RAPPrivacyInformationController)initWithShortcutType:(int64_t)a3 completion:(id)a4
{
  result = [(_RAPPrivacyInformationController *)self initWithCompletion:a4];
  if (result)
  {
    result->_appearance = 3;
    result->_shortcutType = a3;
  }
  return result;
}

- (_RAPPrivacyInformationController)initWithCoder:(id)a3
{
  return [(_RAPPrivacyInformationController *)self initWithCompletion:0];
}

- (_RAPPrivacyInformationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_RAPPrivacyInformationController initWithCompletion:](self, "initWithCompletion:", 0, a4);
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)_RAPPrivacyInformationController;
  [(_RAPPrivacyInformationController *)&v42 viewDidLoad];
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    v3 = [(_RAPPrivacyInformationController *)self _obViewController];
    [(_RAPPrivacyInformationController *)self addChildViewController:v3];
    id v4 = [(_RAPPrivacyInformationController *)self view];
    v5 = [v3 view];
    [v4 addSubview:v5];

    [v3 didMoveToParentViewController:self];
    id v6 = [v3 view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [v3 view];
    uint64_t v8 = [(_RAPPrivacyInformationController *)self view];
    id v9 = [v7 _maps_constraintsForCenteringInView:v8];
    +[NSLayoutConstraint activateConstraints:v9];
  }
  else
  {
    [(_RAPPrivacyInformationController *)self setEdgesForExtendedLayout:0];
    v10 = +[UIColor systemBackgroundColor];
    objc_super v11 = [(_RAPPrivacyInformationController *)self view];
    [v11 setBackgroundColor:v10];

    v12 = +[UIColor systemBackgroundColor];
    v13 = [(_RAPPrivacyInformationController *)self navigationController];
    v14 = [v13 view];
    [v14 setBackgroundColor:v12];

    if (self->_appearance == 3)
    {
      int64_t shortcutType = self->_shortcutType;
      if (shortcutType == 5)
      {
        uint64_t v16 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      }
      else if (shortcutType == 3)
      {
        uint64_t v16 = +[GEOFeatureStyleAttributes workStyleAttributes];
      }
      else
      {
        if (shortcutType == 2) {
          +[GEOFeatureStyleAttributes homeStyleAttributes];
        }
        else {
        uint64_t v16 = [(_RAPPrivacyInformationController *)self defaultPOIStyleAttributes];
        }
      }
      v25 = (void *)v16;
      v29 = +[MKSystemController sharedInstance];
      [v29 screenScale];
      double v31 = v30;

      v32 = [(_RAPPrivacyInformationController *)self traitCollection];
      BOOL v33 = [v32 userInterfaceStyle] == (id)2;

      LOBYTE(v40) = v33;
      v34 = +[MKIconManager imageForStyle:v25 size:4 forScale:1 format:0 transparent:0 transitMode:0 isCarplay:v31 nightMode:v40];
      portraitIcon = self->_portraitIcon;
      self->_portraitIcon = v34;

      LOBYTE(v41) = v33;
      v36 = +[MKIconManager imageForStyle:v25 size:3 forScale:1 format:0 transparent:0 transitMode:0 isCarplay:v31 nightMode:v41];
      landscapeIcon = self->_landscapeIcon;
      self->_landscapeIcon = v36;

      unsigned __int8 v38 = +[RAPPrivacy hasReceivedPrivacyConsent];
      self->_shouldShowPrivacy = v38 ^ 1;
      if ((v38 & 1) == 0 && [(NSString *)self->_emailAddress length])
      {
        BOOL v39 = (sub_1005221BC() & 1) != 0 || sub_10052213C(self->_emailAddress);
        self->_hasValidEmail = v39;
      }
    }
    else
    {
      v17 = +[UIImage imageNamed:@"RAPMapIcon"];
      v18 = self->_landscapeIcon;
      self->_landscapeIcon = v17;

      objc_storeStrong((id *)&self->_portraitIcon, v17);
      id v19 = objc_alloc((Class)UIBarButtonItem);
      v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"Disagree [Report an Issue]" value:@"localized string not found" table:0];
      id v22 = [v19 initWithTitle:v21 style:0 target:self action:"cancelPrivacyAgreement"];
      v23 = [(_RAPPrivacyInformationController *)self navigationItem];
      [v23 setLeftBarButtonItem:v22];

      id v24 = objc_alloc((Class)UIBarButtonItem);
      v25 = +[NSBundle mainBundle];
      v26 = [v25 localizedStringForKey:@"Agree [Report an Issue]" value:@"localized string not found" table:0];
      id v27 = [v24 initWithTitle:v26 style:0 target:self action:"acceptPrivacyAgreement"];
      v28 = [(_RAPPrivacyInformationController *)self navigationItem];
      [v28 setRightBarButtonItem:v27];
    }
    self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled];
    [(_RAPPrivacyInformationController *)self setupViews];
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"contentSizeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
}

- (id)_obViewController
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Report an Issue [Report an Issue]" value:@"localized string not found" table:0];

  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Help improve Maps by reporting issues to Apple [Report an Issue]" value:@"localized string not found" table:0];

  id v7 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v4 detailText:v6 symbolName:@"exclamationmark.bubble.fill"];
  [v7 setModalPresentationStyle:2];
  uint64_t v8 = [v7 headerView];
  [v8 setAccessibilityIdentifier:@"RAPPrivacyConsentHeader"];

  id v9 = [v7 buttonTray];
  [v9 setAccessibilityIdentifier:@"RAPPrivacyConsentButtonTray"];

  v10 = +[OBBoldTrayButton boldButton];
  objc_super v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Continue [Report an Issue]" value:@"localized string not found" table:0];
  [v10 setTitle:v12 forState:0];

  [v10 addTarget:self action:"acceptPrivacyAgreement" forControlEvents:64];
  [v10 setAccessibilityIdentifier:@"RAPPrivacyConsentAgreeButton"];
  v13 = +[OBLinkTrayButton linkButton];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Not Now [Report an Issue]" value:@"localized string not found" table:0];
  [v13 setTitle:v15 forState:0];

  [v13 addTarget:self action:"cancelPrivacyAgreement" forControlEvents:64];
  [v13 setAccessibilityIdentifier:@"RAPPrivacyConsentDeclineButton"];
  uint64_t v16 = [v7 buttonTray];
  [v16 addButton:v10];

  v17 = [v7 buttonTray];
  [v17 addButton:v13];

  v18 = [v7 buttonTray];
  CFStringRef v21 = @"com.apple.onboarding.mapsrap";
  id v19 = +[NSArray arrayWithObjects:&v21 count:1];
  [v18 setPrivacyLinkForBundles:v19];

  [v7 setAccessibilityIdentifier:@"RAPPrivacyConsentView"];

  return v7;
}

- (id)defaultPOIStyleAttributes
{
  id v2 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:5, 3, 6, 348, 65572, 1, 0];

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_RAPPrivacyInformationController;
  [(_RAPPrivacyInformationController *)&v12 traitCollectionDidChange:a3];
  id v4 = [(_RAPPrivacyInformationController *)self view];
  v5 = [v4 traitCollection];
  id v6 = [v5 verticalSizeClass];

  iconView = self->_iconView;
  if (iconView)
  {
    uint64_t v8 = 5;
    if (v6 == (id)1) {
      uint64_t v8 = 6;
    }
    [(UIImageView *)iconView setImage:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v8])];
  }
  BOOL v9 = v6 == (id)1;
  uint64_t v10 = 11;
  if (v6 == (id)1) {
    uint64_t v11 = 12;
  }
  else {
    uint64_t v11 = 11;
  }
  if (!v9) {
    uint64_t v10 = 12;
  }
  +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v10])];
  +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____RAPPrivacyInformationController__completion[v11])];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_RAPPrivacyInformationController;
  [(_RAPPrivacyInformationController *)&v9 viewDidLayoutSubviews];
  if (self->_appearance == 3)
  {
    [(UIView *)self->_bottomView frame];
    double v4 = v3;
    [(UIScrollView *)self->_scrollView contentInset];
    double v6 = v5;
    [(UIScrollView *)self->_scrollView contentInset];
    double v8 = v7;
    [(UIScrollView *)self->_scrollView contentInset];
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v6, v8, v4);
  }
}

- (void)contentSizeDidChange:(id)a3
{
  int accessibilityEnabled = self->_accessibilityEnabled;
  unsigned int v5 = +[UIFont accessibilityTextEnabled];
  self->_int accessibilityEnabled = v5;
  if (accessibilityEnabled != v5)
  {
    [(_RAPPrivacyInformationController *)self setSubtitleFont];
    [(_RAPPrivacyInformationController *)self setSkipButtonFont];
    [(_RAPPrivacyInformationController *)self updateCenterYConstraintIfNeeded];
  }
}

- (id)titleFont
{
  return +[UIFont _maps_systemFontWithSize:28.0];
}

- (void)setSubtitleFont
{
  double v3 = 16.0;
  if (!self->_accessibilityEnabled) {
    double v3 = 17.0;
  }
  id v4 = +[UIFont _maps_systemFontWithSize:v3];
  [(UILabel *)self->_subtitleLabel setFont:v4];
}

- (id)followUpLabelFont
{
  return +[UIFont _maps_systemFontWithSize:17.0];
}

- (id)followUpDetailFont
{
  return +[UIFont _maps_systemFontWithSize:12.0];
}

- (id)sendButtonFont
{
  return +[UIFont _maps_boldSystemFontWithSize:16.0];
}

- (void)setSkipButtonFont
{
  double v3 = 15.0;
  if (!self->_accessibilityEnabled) {
    double v3 = 16.0;
  }
  id v5 = +[UIFont _maps_systemFontWithSize:v3];
  id v4 = [(UIButton *)self->_skipButton titleLabel];
  [v4 setFont:v5];
}

- (void)updateCenterYConstraintIfNeeded
{
  [(NSLayoutConstraint *)self->_portraitAccessibilityConstraint setActive:0];
  if (self->_appearance == 3 && !self->_accessibilityEnabled && !self->_shouldShowPrivacy)
  {
    portraitAccessibilityConstraint = self->_portraitAccessibilityConstraint;
    [(NSLayoutConstraint *)portraitAccessibilityConstraint setActive:1];
  }
}

- (void)setupViews
{
  double v3 = +[NSMutableArray array];
  portraitSpecificConstraints = self->_portraitSpecificConstraints;
  self->_portraitSpecificConstraints = v3;

  id v5 = +[NSMutableArray array];
  landscapeSpecificConstraints = self->_landscapeSpecificConstraints;
  self->_landscapeSpecificConstraints = v5;

  id v11 = +[NSMutableArray array];
  double v7 = [(_RAPPrivacyInformationController *)self view];
  id v8 = [(_RAPPrivacyInformationController *)self _setupContainerViewInView:v7 constraints:v11 portraitSpecificConstraints:self->_portraitSpecificConstraints landscapeSpecificConstraints:self->_landscapeSpecificConstraints];

  if (self->_appearance == 3)
  {
    objc_super v9 = [(_RAPPrivacyInformationController *)self view];
    id v10 = [(_RAPPrivacyInformationController *)self _setupBottomViewInView:v9 commonConstraints:v11 portraitSpecificConstraints:self->_portraitSpecificConstraints landscapeSpecificConstraints:self->_landscapeSpecificConstraints];
  }
  +[NSLayoutConstraint activateConstraints:v11];
}

- (id)_setupContainerViewInView:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v89 = a3;
  id v13 = objc_alloc_init((Class)UIScrollView);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(_RAPPrivacyInformationController *)self view];
  [v14 addSubview:v13];

  [v13 setScrollEnabled:1];
  [v13 setShowsVerticalScrollIndicator:1];
  v15 = [v13 topAnchor];
  uint64_t v16 = [(_RAPPrivacyInformationController *)self view];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v17 topAnchor];
  id v19 = [v15 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [v13 leadingAnchor];
  CFStringRef v21 = [(_RAPPrivacyInformationController *)self view];
  id v22 = [v21 safeAreaLayoutGuide];
  v23 = [v22 leadingAnchor];
  id v24 = [v20 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [v13 trailingAnchor];
  v26 = [(_RAPPrivacyInformationController *)self view];
  id v27 = [v26 safeAreaLayoutGuide];
  v28 = [v27 trailingAnchor];
  v29 = [v25 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  double v30 = [v13 bottomAnchor];
  double v31 = [(_RAPPrivacyInformationController *)self view];
  v32 = [v31 safeAreaLayoutGuide];
  BOOL v33 = [v32 bottomAnchor];
  v34 = [v30 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = self;
  objc_storeStrong((id *)&self->_scrollView, v13);
  id v36 = objc_alloc_init((Class)UIView);
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&v35->_containerView, v36);
  [v13 addSubview:v36];
  v91 = v11;
  id v37 = v11;
  id v38 = v12;
  id firstValue = [(_RAPPrivacyInformationController *)v35 setupTitleViewsInContainer:v36 constraints:v10 portraitSpecificConstraints:v37 landscapeSpecificConstraints:v12];
  if (v35->_appearance == 3 && !v35->_shouldShowPrivacy)
  {
    v93 = 0;
    BOOL v39 = v10;
  }
  else
  {
    BOOL v39 = v10;
    v93 = [(_RAPPrivacyInformationController *)v35 setupContactViewsInContainer:v36 constraints:v10 portraitSpecificConstraints:v91 landscapeSpecificConstraints:v38];
  }
  uint64_t v40 = [v36 leadingAnchor];
  uint64_t v41 = [v89 safeAreaLayoutGuide];
  objc_super v42 = [v41 leadingAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [v36 trailingAnchor];
  v45 = [v89 safeAreaLayoutGuide];

  v46 = [v45 trailingAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  v48 = [v36 topAnchor];
  v49 = [v13 topAnchor];
  v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49];
  [v50 setActive:1];

  v51 = [v36 bottomAnchor];
  v52 = [v13 bottomAnchor];
  v53 = [v51 constraintLessThanOrEqualToAnchor:v52];
  [v53 setActive:1];

  v54 = [v36 centerYAnchor];
  v55 = [v13 centerYAnchor];
  uint64_t v56 = [v54 constraintEqualToAnchor:v55];
  portraitAccessibilityConstraint = v35->_portraitAccessibilityConstraint;
  v35->_portraitAccessibilityConstraint = (NSLayoutConstraint *)v56;

  [(_RAPPrivacyInformationController *)v35 updateCenterYConstraintIfNeeded];
  id v90 = v36;
  v86 = v13;
  v87 = v38;
  if (v93)
  {
    v58 = _NSDictionaryOfVariableBindings(@"titleView, contactView", firstValue, v93, 0);
    CFStringRef v59 = @"V:|-40-[titleView]-40-[contactView]-|";
  }
  else
  {
    v58 = _NSDictionaryOfVariableBindings(@"titleView", firstValue, 0);
    CFStringRef v59 = @"V:|-40-[titleView]-40-|";
  }
  v60 = +[NSLayoutConstraint constraintsWithVisualFormat:v59 options:0 metrics:0 views:v58];
  [v39 addObjectsFromArray:v60];

  v83 = [firstValue leadingAnchor];
  v84 = [(_RAPPrivacyInformationController *)v35 view];
  v61 = [v84 safeAreaLayoutGuide];
  v62 = [v61 leadingAnchor];
  v63 = [v83 constraintEqualToSystemSpacingAfterAnchor:v62 multiplier:1.0];
  v95[0] = v63;
  v64 = [(_RAPPrivacyInformationController *)v35 view];
  v65 = [v64 safeAreaLayoutGuide];
  v66 = [v65 trailingAnchor];
  [firstValue trailingAnchor];
  v67 = v82 = v35;
  v68 = [v66 constraintEqualToSystemSpacingAfterAnchor:v67 multiplier:1.0];
  v95[1] = v68;
  v69 = +[NSArray arrayWithObjects:v95 count:2];
  v88 = v39;
  [v39 addObjectsFromArray:v69];

  v70 = v93;
  if (v93)
  {
    v85 = [v93 leadingAnchor];
    v71 = [v90 safeAreaLayoutGuide];
    v72 = [v71 leadingAnchor];
    v73 = [v85 constraintEqualToSystemSpacingAfterAnchor:v72 multiplier:1.0];
    v94[0] = v73;
    v74 = [(_RAPPrivacyInformationController *)v82 view];
    v75 = [v74 safeAreaLayoutGuide];
    v76 = [v75 trailingAnchor];
    v77 = [v90 safeAreaLayoutGuide];
    v78 = [v77 trailingAnchor];
    v79 = [v76 constraintEqualToSystemSpacingAfterAnchor:v78 multiplier:1.0];
    v94[1] = v79;
    v80 = +[NSArray arrayWithObjects:v94 count:2];
    [v88 addObjectsFromArray:v80];

    v70 = v93;
  }

  return v90;
}

- (id)setupTitleViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)UIView);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v10];

  id v11 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_portraitIcon];
  iconView = self->_iconView;
  self->_iconView = v11;

  [(UIImageView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 addSubview:self->_iconView];
  id v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  v15 = [(_RAPPrivacyInformationController *)self titleFont];
  [(UILabel *)self->_titleLabel setFont:v15];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  int64_t appearance = self->_appearance;
  v17 = +[NSBundle mainBundle];
  v18 = v17;
  if (appearance == 3) {
    CFStringRef v19 = @"Report this Issue [Report an Issue] [Home/work Confirmation]";
  }
  else {
    CFStringRef v19 = @"Report an Issue [title]";
  }
  v20 = [v17 localizedStringForKey:v19 value:@"localized string not found" table:0];
  [(UILabel *)self->_titleLabel setText:v20];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringRef v21 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v21;

  [(_RAPPrivacyInformationController *)self setSubtitleFont];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  if (self->_appearance == 3) {
    +[RAPPrivacy callToActionMessageForShortcutType:self->_shortcutType];
  }
  else {
  v23 = +[RAPPrivacy callToActionMessage];
  }
  [(UILabel *)self->_subtitleLabel setText:v23];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 addSubview:self->_titleLabel];
  [v10 addSubview:self->_subtitleLabel];
  id v24 = [(UIImageView *)self->_iconView centerXAnchor];
  v25 = [(_RAPPrivacyInformationController *)self view];
  v26 = [v25 centerXAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];
  [v8 addObject:v27];

  v28 = [(UILabel *)self->_titleLabel centerXAnchor];
  v29 = [(UIImageView *)self->_iconView centerXAnchor];
  double v30 = [v28 constraintEqualToAnchor:v29];
  [v8 addObject:v30];

  double v31 = [(UILabel *)self->_subtitleLabel centerXAnchor];
  v32 = [(UILabel *)self->_titleLabel centerXAnchor];
  BOOL v33 = [v31 constraintEqualToAnchor:v32];
  [v8 addObject:v33];

  v34 = _NSDictionaryOfVariableBindings(@"_titleLabel", self->_titleLabel, 0);
  v35 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_titleLabel]-|", 0, 0, v34);
  [v8 addObjectsFromArray:v35];

  id v36 = _NSDictionaryOfVariableBindings(@"_subtitleLabel", self->_subtitleLabel, 0);
  id v37 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-35-[_subtitleLabel]-35-|", 0, 0, v36);
  [v8 addObjectsFromArray:v37];

  id v38 = [(UIImageView *)self->_iconView topAnchor];
  BOOL v39 = [v10 topAnchor];
  uint64_t v40 = [v38 constraintEqualToSystemSpacingBelowAnchor:v39 multiplier:1.0];
  [v8 addObject:v40];

  uint64_t v41 = [(UILabel *)self->_titleLabel topAnchor];
  objc_super v42 = [(UIImageView *)self->_iconView bottomAnchor];
  v43 = [v41 constraintEqualToAnchor:v42 constant:20.0];
  [v8 addObject:v43];

  v44 = _NSDictionaryOfVariableBindings(@"_titleLabel, _subtitleLabel", self->_titleLabel, self->_subtitleLabel, 0);
  v45 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:[_titleLabel]-(spacing)-[_subtitleLabel]|", 0, &off_1013AF000, v44);
  [v8 addObjectsFromArray:v45];

  return v10;
}

- (id)setupContactViewsInContainer:(id)a3 constraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)UIView);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v10];

  id v11 = [(_RAPPrivacyInformationController *)self _createDetailsViewInView:v10 constraints:v8];
  id v12 = _NSDictionaryOfVariableBindings(@"detailsView", v11, 0);
  id v13 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[detailsView]|" options:0 metrics:0 views:v12];
  [v8 addObjectsFromArray:v13];

  if (self->_isUserEnteredEmailAddress
    || !sub_10052213C(self->_emailAddress)
    || (MapsFeature_IsEnabled_RAPCommunityID() & 1) != 0)
  {
    v14 = _NSDictionaryOfVariableBindings(@"detailsView", v11, 0);
    v15 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[detailsView]-|", 0, 0, v14);
    [v8 addObjectsFromArray:v15];
  }
  else
  {
    v14 = [(_RAPPrivacyInformationController *)self _createSwitchViewInView:v10 constraints:v8];
    CFStringRef v19 = _NSDictionaryOfVariableBindings(@"switchView", v14, 0);
    v20 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[switchView]|" options:0 metrics:0 views:v19];
    [v8 addObjectsFromArray:v20];

    v15 = _NSDictionaryOfVariableBindings(@"switchView, detailsView", v14, v11, 0);
    CFStringRef v21 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[switchView]-(spacing)-[detailsView]-|", 0, &off_1013AF028, v15);
    [v8 addObjectsFromArray:v21];
  }
  uint64_t v16 = _NSDictionaryOfVariableBindings(@"contactView", v10, 0);
  v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[contactView]-|", 0, 0, v16);
  [v8 addObjectsFromArray:v17];

  return v10;
}

- (id)_createSwitchViewInView:(id)a3 constraints:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v8];

  id v9 = objc_alloc_init((Class)UIView);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = +[UIColor separatorColor];
  [v9 setBackgroundColor:v10];

  [v8 addSubview:v9];
  id v11 = objc_alloc_init((Class)UILabel);
  id v12 = [(_RAPPrivacyInformationController *)self followUpLabelFont];
  [v11 setFont:v12];

  [v11 setNumberOfLines:0];
  id v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Follow up by email" value:@"localized string not found" table:0];
  [v11 setText:v14];

  [v11 setTextAlignment:4];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = +[UIColor labelColor];
  [v11 setTextColor:v15];

  [v8 addSubview:v11];
  uint64_t v16 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  followUpSwitch = self->_followUpSwitch;
  self->_followUpSwitch = v16;

  [(UISwitch *)self->_followUpSwitch setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISwitch *)self->_followUpSwitch setOn:1];
  id v42 = v8;
  [v8 addSubview:self->_followUpSwitch];
  id v18 = objc_alloc_init((Class)UIView);
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringRef v19 = +[UIColor separatorColor];
  [v18 setBackgroundColor:v19];

  [v8 addSubview:v18];
  v20 = [v9 leadingAnchor];
  CFStringRef v21 = [(_RAPPrivacyInformationController *)self view];
  id v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v6 addObject:v23];

  id v24 = [v9 trailingAnchor];
  v25 = [(_RAPPrivacyInformationController *)self view];
  v26 = [v25 trailingAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];
  [v6 addObject:v27];

  v28 = _NSDictionaryOfVariableBindings(@"followUpLabel, _followUpSwitch", v11, self->_followUpSwitch, 0);
  v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[followUpLabel]-(>=0)-[_followUpSwitch]-|", 0, 0, v28);
  [v6 addObjectsFromArray:v29];

  double v30 = [v18 leadingAnchor];
  double v31 = [v9 leadingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v6 addObject:v32];

  BOOL v33 = [v18 trailingAnchor];
  v34 = [v9 trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v6 addObject:v35];

  id v36 = _NSDictionaryOfVariableBindings(@"topLineView, followUpLabel, bottomLineView", v9, v11, v18, 0);
  id v37 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[topLineView(1)]-(spacing)-[followUpLabel]-(spacing)-[bottomLineView(==topLineView)]|", 0, &off_1013AF050, v36);
  [v6 addObjectsFromArray:v37];

  id v38 = [(UISwitch *)self->_followUpSwitch centerYAnchor];
  BOOL v39 = [v11 centerYAnchor];
  uint64_t v40 = [v38 constraintEqualToAnchor:v39];
  [v6 addObject:v40];

  return v42;
}

- (id)_createDetailsViewInView:(id)a3 constraints:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v8];

  id v9 = _NSDictionaryOfVariableBindings(@"detailsView", v8, 0);
  id v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[detailsView]|" options:0 metrics:0 views:v9];
  [v6 addObjectsFromArray:v10];

  id v11 = objc_alloc_init((Class)UILabel);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = +[UIColor clearColor];
  [v11 setBackgroundColor:v12];

  id v13 = [(_RAPPrivacyInformationController *)self followUpDetailFont];
  [v11 setFont:v13];

  [v11 setNumberOfLines:0];
  if (self->_hasValidEmail) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 1;
  }
  [v11 setTextAlignment:v14];
  v15 = +[UIColor secondaryLabelColor];
  [v11 setTextColor:v15];

  uint64_t v16 = +[RAPPrivacy informationalMessageWithEmailAddress:self->_emailAddress isUserEnteredEmailAddress:self->_isUserEnteredEmailAddress isMac:sub_1000BBB44(self) == 5];
  [v11 setText:v16];

  [v8 addSubview:v11];
  v17 = _NSDictionaryOfVariableBindings(@"followUpDescription", v11, 0);
  id v18 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[followUpDescription]-|", 0, 0, v17);
  [v6 addObjectsFromArray:v18];

  CFStringRef v19 = objc_opt_new();
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v19];
  v20 = _NSDictionaryOfVariableBindings(@"privacyView", v19, 0);
  CFStringRef v21 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[privacyView]|" options:0 metrics:0 views:v20];
  [v6 addObjectsFromArray:v21];

  id v22 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.mapsrap"];
  [(_RAPPrivacyInformationController *)self addChildViewController:v22];
  v23 = [v22 view];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addSubview:v23];
  [v22 didMoveToParentViewController:self];
  id v24 = _NSDictionaryOfVariableBindings(@"privacyLinkView", v23, 0);
  v25 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[privacyLinkView]|" options:0 metrics:0 views:v24];
  [v6 addObjectsFromArray:v25];

  v26 = _NSDictionaryOfVariableBindings(@"privacyLinkView", v23, 0);
  id v27 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[privacyLinkView]|" options:0 metrics:0 views:v26];
  [v6 addObjectsFromArray:v27];

  v28 = _NSDictionaryOfVariableBindings(@"followUpDescription, privacyView", v11, v19, 0);
  v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[followUpDescription]-40-[privacyView]|", 0, 0, v28);
  [v6 addObjectsFromArray:v29];

  return v8;
}

- (id)_setupBottomViewInView:(id)a3 commonConstraints:(id)a4 portraitSpecificConstraints:(id)a5 landscapeSpecificConstraints:(id)a6
{
  id v58 = a6;
  id v57 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v13 = [(_RAPPrivacyInformationController *)self view];
  uint64_t v14 = [v13 backgroundColor];
  [(UIView *)v12 setBackgroundColor:v14];

  [(UIView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addSubview:v12];
  v15 = [(_RAPPrivacyInformationController *)self _createSendButton];
  [(UIView *)v12 addSubview:v15];
  uint64_t v56 = [(_RAPPrivacyInformationController *)self _createSkipButton];
  [(UIView *)v12 addSubview:self->_skipButton];
  uint64_t v16 = [(UIView *)v12 leadingAnchor];
  v17 = [v11 safeAreaLayoutGuide];
  id v18 = [v17 leadingAnchor];
  CFStringRef v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(UIView *)v12 trailingAnchor];
  CFStringRef v21 = [v11 safeAreaLayoutGuide];
  id v22 = [v21 trailingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  id v24 = [(UIView *)v12 bottomAnchor];
  v25 = [v11 safeAreaLayoutGuide];
  v26 = [v25 bottomAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = _NSDictionaryOfVariableBindings(@"sendButton", v15, 0);
  v29 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[sendButton(288)]" options:0 metrics:0 views:v28];
  [v57 addObjectsFromArray:v29];

  double v30 = _NSDictionaryOfVariableBindings(@"sendButton", v15, 0);
  double v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-44-[sendButton]-44-|", 0, 0, v30);
  [v58 addObjectsFromArray:v31];

  v32 = [v15 centerXAnchor];
  BOOL v33 = [v11 centerXAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v10 addObject:v34];

  v35 = [v56 centerXAnchor];
  id v36 = [v11 centerXAnchor];

  id v37 = [v35 constraintEqualToAnchor:v36];
  [v10 addObject:v37];

  id v38 = _NSDictionaryOfVariableBindings(@"sendButton", v15, 0);
  BOOL v39 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[sendButton(50)]" options:0 metrics:0 views:v38];
  [v10 addObjectsFromArray:v39];

  uint64_t v40 = [(UIView *)v12 topAnchor];
  uint64_t v41 = [v15 topAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41 constant:-25.0];
  [v10 addObject:v42];

  v43 = [v15 bottomAnchor];
  v44 = [v56 topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:-20.0];
  [v10 addObject:v45];

  v46 = [v56 lastBaselineAnchor];
  v47 = [(UIView *)v12 bottomAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:-27.0];
  [v10 addObject:v48];

  v49 = [v15 widthAnchor];
  v50 = [v56 widthAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v10 addObject:v51];

  bottomView = self->_bottomView;
  self->_bottomView = v12;
  v53 = v12;

  v54 = self->_bottomView;
  return v54;
}

- (id)_createSendButton
{
  double v3 = +[UIButton buttonWithType:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v3 layer];
  [v4 setCornerRadius:10.0];

  id v5 = +[UIColor systemBlueColor];
  [v3 setBackgroundColor:v5];

  id v6 = objc_opt_new();
  [v3 setBackgroundImage:v6 forState:0];

  id v7 = +[UIColor whiteColor];
  [v3 setTitleColor:v7 forState:0];

  id v8 = [(_RAPPrivacyInformationController *)self sendButtonFont];
  id v9 = [v3 titleLabel];
  [v9 setFont:v8];

  [v3 setTitleEdgeInsets:0.0, 10.0, 0.0, 10.0];
  id v10 = [v3 titleLabel];
  [v10 setAdjustsFontSizeToFitWidth:1];

  int64_t appearance = self->_appearance;
  id v12 = +[NSBundle mainBundle];
  id v13 = v12;
  if (appearance == 3) {
    CFStringRef v14 = @"Report this issue to Apple [RAP Home/Work]";
  }
  else {
    CFStringRef v14 = @"Send [Report an Issue] [Confirmation]";
  }
  v15 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:0];
  [v3 setTitle:v15 forState:0];

  [v3 addTarget:self action:"_sendButtonTapped" forControlEvents:64];

  return v3;
}

- (id)_createSkipButton
{
  double v3 = +[UIButton buttonWithType:0];
  skipButton = self->_skipButton;
  self->_skipButton = v3;

  [(UIButton *)self->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_skipButton;
  id v6 = +[UIColor systemBlueColor];
  [(UIButton *)v5 setTitleColor:v6 forState:0];

  [(_RAPPrivacyInformationController *)self setSkipButtonFont];
  id v7 = [(UIButton *)self->_skipButton titleLabel];
  [v7 setTextAlignment:1];

  id v8 = [(UIButton *)self->_skipButton titleLabel];
  [v8 setAdjustsFontSizeToFitWidth:1];

  id v9 = [(UIButton *)self->_skipButton titleLabel];
  [v9 setNumberOfLines:0];

  int64_t appearance = self->_appearance;
  id v11 = self->_skipButton;
  id v12 = +[NSBundle mainBundle];
  id v13 = v12;
  if (appearance == 3) {
    CFStringRef v14 = @"Skip [Report an Issue Home/Work] [Confirmation]";
  }
  else {
    CFStringRef v14 = @"Skip [Report an Issue] [Confirmation]";
  }
  v15 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:0];
  [(UIButton *)v11 setTitle:v15 forState:0];

  -[UIButton setContentEdgeInsets:](self->_skipButton, "setContentEdgeInsets:", 15.0, 14.0, 15.0, 14.0);
  [(UIButton *)self->_skipButton addTarget:self action:"_skipButtonTapped" forControlEvents:64];
  uint64_t v16 = self->_skipButton;

  return v16;
}

- (void)cancelPrivacyAgreement
{
  double v3 = +[RAPPrivacy emailAnalyticsEventForEmailAddress:self->_emailAddress isValidEmail:self->_hasValidEmail optedIn:[(UISwitch *)self->_followUpSwitch isOn]];
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:10109 onTarget:1136 eventValue:v3];

  id v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [(_RAPPrivacyInformationController *)self _maps_uiScene];
  [v5 postNotificationName:@"RAPUserDidCancelPrivacyAgreementNotification" object:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100CFA744;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v3;
  id v7 = v3;
  [(_RAPPrivacyInformationController *)self dismissViewControllerAnimated:1 completion:v8];
}

- (id)_getEvent
{
  emailAddress = self->_emailAddress;
  BOOL hasValidEmail = self->_hasValidEmail;
  BOOL v4 = [(UISwitch *)self->_followUpSwitch isOn];

  return +[RAPPrivacy emailAnalyticsEventForEmailAddress:emailAddress isValidEmail:hasValidEmail optedIn:v4];
}

- (void)acceptPrivacyAgreement
{
  double v3 = [(_RAPPrivacyInformationController *)self _getEvent];
  BOOL v4 = +[MKMapService sharedService];
  [v4 captureUserAction:10110 onTarget:1136 eventValue:v3];

  +[RAPPrivacy setPrivacyConsent:1 allowEmail:[(UISwitch *)self->_followUpSwitch isOn]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CFA8DC;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(_RAPPrivacyInformationController *)self dismissViewControllerAnimated:1 completion:v6];
}

- (void)_sendButtonTapped
{
  if (self->_shouldShowPrivacy) {
    +[RAPPrivacy setPrivacyConsent:1 allowEmail:[(UISwitch *)self->_followUpSwitch isOn]];
  }
  id completion = (void (**)(id, uint64_t, BOOL, id))self->_completion;
  if (completion)
  {
    BOOL shouldShowPrivacy = self->_shouldShowPrivacy;
    id v5 = [(_RAPPrivacyInformationController *)self _getEvent];
    completion[2](completion, 1, shouldShowPrivacy, v5);
  }
}

- (void)_skipButtonTapped
{
  id completion = (void (**)(id, void, BOOL, id))self->_completion;
  if (completion)
  {
    BOOL shouldShowPrivacy = self->_shouldShowPrivacy;
    id v4 = [(_RAPPrivacyInformationController *)self _getEvent];
    completion[2](completion, 0, shouldShowPrivacy, v4);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_portraitAccessibilityConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeSpecificConstraints, 0);
  objc_storeStrong((id *)&self->_portraitSpecificConstraints, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_landscapeIcon, 0);
  objc_storeStrong((id *)&self->_portraitIcon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_followUpSwitch, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end