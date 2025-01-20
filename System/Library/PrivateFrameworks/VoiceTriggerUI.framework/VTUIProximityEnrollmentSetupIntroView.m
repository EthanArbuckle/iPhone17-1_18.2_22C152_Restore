@interface VTUIProximityEnrollmentSetupIntroView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)viewConstraints;
- (UIButton)dismissButton;
- (VTUIButton)notNowButton;
- (VTUIButton)setupButton;
- (VTUIEnrollmentDelegate)enrollmentDelegate;
- (VTUIProximityEnrollmentSetupIntroView)initWithFrame:(CGRect)a3;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupContent;
- (void)_setupPhoneLandscapeConstraints;
- (void)_setupPortraitConstraints;
- (void)_setupTermsAndConditions;
- (void)setDismissButton:(id)a3;
- (void)setEnrollmentDelegate:(id)a3;
- (void)setViewConstraints:(id)a3;
@end

@implementation VTUIProximityEnrollmentSetupIntroView

- (VTUIProximityEnrollmentSetupIntroView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v15.receiver = self;
  v15.super_class = (Class)VTUIProximityEnrollmentSetupIntroView;
  v5 = -[VTUIProximityEnrollmentSetupIntroView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = +[VTUIStyle sharedStyle];
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    uint64_t v8 = [MEMORY[0x263F78BB8] sharedInstance];
    voiceProfileMgr = v5->_voiceProfileMgr;
    v5->_voiceProfileMgr = (SSRVoiceProfileManager *)v8;

    v10 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v11 = [v10 languageCode];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v11;

    BOOL v13 = [(VTUIStyle *)v5->_vtStyle currentLocaleSupportsCompactVoiceTrigger];
    if (v13) {
      LOBYTE(v13) = [(VTUIStyle *)v5->_vtStyle proxAccessorySupportsCompactTrigger];
    }
    v5->_supportsCompactTrigger = v13;
    [(VTUIProximityEnrollmentSetupIntroView *)v5 _setupContent];
    -[VTUIProximityEnrollmentSetupIntroView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupContent
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 136315138;
    v47 = "-[VTUIProximityEnrollmentSetupIntroView _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v46, 0xCu);
  }
  v4 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v4;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityEnrollmentSetupIntroView *)self addSubview:self->_containerView];
  if (self->_supportsCompactTrigger) {
    uint64_t v6 = @"PROX_INTRO_TITLE_JS";
  }
  else {
    uint64_t v6 = @"PROX_INTRO_TITLE";
  }
  v7 = (objc_class *)MEMORY[0x263F828E0];
  uint64_t v8 = v6;
  v9 = (UILabel *)objc_alloc_init(v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = self->_titleLabel;
  v12 = [(VTUIStyle *)self->_vtStyle proxHeaderFont];
  [(UILabel *)v11 setFont:v12];

  BOOL v13 = self->_titleLabel;
  v14 = [(VTUIStyle *)self->_vtStyle proxHeaderColor];
  [(UILabel *)v13 setTextColor:v14];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  objc_super v15 = self->_titleLabel;
  v16 = +[VTUIStringsHelper sharedStringsHelper];
  v17 = [v16 uiLocalizedStringForKey:v8];

  [(UILabel *)v15 setText:v17];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_titleLabel];
  v18 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v18;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_dismissButton];
  id v20 = objc_alloc(MEMORY[0x263F82828]);
  v21 = [(VTUIStyle *)self->_vtStyle siriIconImage];
  v22 = (void *)[v20 initWithImage:v21];

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_orbImage, v22);
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_orbImage];
  v23 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v23;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = self->_subtitleLabel;
  v26 = [(VTUIStyle *)self->_vtStyle proxSubtitleFont];
  [(UILabel *)v25 setFont:v26];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
  [(UILabel *)self->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
  v27 = self->_subtitleLabel;
  v28 = [(VTUIStyle *)self->_vtStyle proxSubtitleColor];
  [(UILabel *)v27 setTextColor:v28];

  if (self->_supportsCompactTrigger) {
    v29 = @"SIRI_AND_HEY_SIRI_DESCRIPTION_PROX";
  }
  else {
    v29 = @"HEY_SIRI_DESCRIPTION_PROX";
  }
  v30 = self->_subtitleLabel;
  v31 = [(VTUIStyle *)self->_vtStyle proxHSDescription:v29];
  [(UILabel *)v30 setText:v31];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_subtitleLabel];
  [(VTUIProximityEnrollmentSetupIntroView *)self _setupTermsAndConditions];
  v32 = +[VTUIButton _vtuiProximityButtonWithPrimaryStyle];
  setupButton = self->_setupButton;
  self->_setupButton = v32;

  [(VTUIButton *)self->_setupButton setTranslatesAutoresizingMaskIntoConstraints:0];
  int v34 = [(SSRVoiceProfileManager *)self->_voiceProfileMgr isSATEnrolledForSiriProfileId:0 forLanguageCode:self->_languageCode];
  v35 = self->_setupButton;
  if (v34) {
    v36 = @"BUTTON_USE_SIRI";
  }
  else {
    v36 = @"BUTTON_SET_UP";
  }
  v37 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:v36];
  [(VTUIButton *)v35 setTitle:v37 forState:0];

  v38 = [(VTUIButton *)self->_setupButton titleLabel];
  [v38 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_setupButton];
  v39 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  notNowButton = self->_notNowButton;
  self->_notNowButton = v39;

  v41 = [(VTUIButton *)self->_notNowButton titleLabel];
  v42 = [(VTUIStyle *)self->_vtStyle proxCancelFont];
  [v41 setFont:v42];

  [(VTUIButton *)self->_notNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v43 = self->_notNowButton;
  v44 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:@"BUTTON_CONS_NOT_NOW"];
  [(VTUIButton *)v43 setTitle:v44 forState:0];

  v45 = [(VTUIButton *)self->_notNowButton titleLabel];
  [v45 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_notNowButton];
}

- (void)_setupTermsAndConditions
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82D60]);
  [(VTUIProximityEnrollmentSetupIntroView *)self bounds];
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:");
  termsAndConds = self->_termsAndConds;
  self->_termsAndConds = v4;

  [(UITextView *)self->_termsAndConds setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UITextView setTextContainerInset:](self->_termsAndConds, "setTextContainerInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  uint64_t v6 = [(UITextView *)self->_termsAndConds textContainer];
  [v6 setLineFragmentPadding:0.0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_termsAndConds];
  [(UITextView *)self->_termsAndConds setDelegate:self];
  v7 = @"PROX_FOOTER_CONS_JS";
  if (self->_supportsCompactTrigger) {
    uint64_t v8 = @"TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE_JS";
  }
  else {
    uint64_t v8 = @"TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE";
  }
  if (!self->_supportsCompactTrigger) {
    v7 = @"PROX_FOOTER_CONS";
  }
  v9 = v7;
  v10 = v8;
  uint64_t v11 = +[VTUIStyle sharedStyle];
  v12 = +[VTUIStyle sharedStyle];
  if ([v12 isGreenTeaCapableDevice]) {
    BOOL v13 = v10;
  }
  else {
    BOOL v13 = v9;
  }
  v14 = [v11 VTUIDeviceSpecificString:v13];

  objc_super v15 = +[VTUIStyle sharedStyle];
  v16 = [v15 VTUIDeviceSpecificString:@"BUTTON_CONS_ABOUT_SIRI"];

  v17 = [MEMORY[0x263F81650] defaultParagraphStyle];
  v18 = (void *)[v17 mutableCopy];

  [v18 setAlignment:1];
  id v19 = objc_alloc(MEMORY[0x263F089B8]);
  id v20 = [NSString stringWithFormat:@"%@ %@", v14, v16];
  uint64_t v34 = *MEMORY[0x263F81540];
  v35[0] = v18;
  v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  v22 = (void *)[v19 initWithString:v20 attributes:v21];

  if ([v16 length])
  {
    uint64_t v23 = [v14 length] + 1;
    uint64_t v24 = [v16 length];
    uint64_t v25 = *MEMORY[0x263F81500];
    v26 = [(VTUIStyle *)self->_vtStyle footerTextColor];
    objc_msgSend(v22, "addAttribute:value:range:", v25, v26, 0, v23);

    v27 = [(VTUIStyle *)self->_vtStyle buttonTextColor];
    objc_msgSend(v22, "addAttribute:value:range:", v25, v27, v23, v24);

    uint64_t v28 = *MEMORY[0x263F81520];
    v29 = [NSURL URLWithString:&stru_26EB8DDE0];
    objc_msgSend(v22, "addAttribute:value:range:", v28, v29, v23, v24);

    v30 = self->_termsAndConds;
    v31 = [(VTUIStyle *)self->_vtStyle footerFont];
    [(UITextView *)v30 setFont:v31];

    v32 = self->_termsAndConds;
    v33 = [MEMORY[0x263F825C8] clearColor];
    [(UITextView *)v32 setBackgroundColor:v33];

    [(UITextView *)self->_termsAndConds setAttributedText:v22];
    [(UITextView *)self->_termsAndConds setEditable:0];
    [(UITextView *)self->_termsAndConds setScrollEnabled:0];
    [(UITextView *)self->_termsAndConds setDataDetectorTypes:2];
    [(UITextView *)self->_termsAndConds _setInteractiveTextSelectionDisabled:1];
  }
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  BOOL v4 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", a3.width, a3.height);
  [(UILabel *)self->_subtitleLabel setHidden:v4];
  if (v4)
  {
    [(VTUIProximityEnrollmentSetupIntroView *)self _setupPhoneLandscapeConstraints];
  }
  else
  {
    [(VTUIProximityEnrollmentSetupIntroView *)self _setupPortraitConstraints];
  }
}

- (void)_setupPhoneLandscapeConstraints
{
  v95[4] = *MEMORY[0x263EF8340];
  v86 = [(VTUIProximityEnrollmentSetupIntroView *)self safeAreaLayoutGuide];
  v87 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v88 = [MEMORY[0x263EFF980] array];
  v79 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
  v73 = [v86 centerXAnchor];
  v68 = [v79 constraintEqualToAnchor:v73];
  v95[0] = v68;
  v65 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
  id v3 = objc_msgSend(v65, "constraintEqualToConstant:");
  v95[1] = v3;
  BOOL v4 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
  v5 = objc_msgSend(v4, "constraintEqualToConstant:");
  v95[2] = v5;
  uint64_t v6 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  v7 = [(VTUIProximityEnrollmentSetupIntroView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v9 = [v6 constraintEqualToAnchor:v7 constant:-v8];
  v95[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:4];
  [v88 addObjectsFromArray:v10];

  v80 = [(UIImageView *)self->_orbImage widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v74 = objc_msgSend(v80, "constraintEqualToConstant:");
  v94[0] = v74;
  v69 = [(UIImageView *)self->_orbImage heightAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  uint64_t v11 = objc_msgSend(v69, "constraintEqualToConstant:");
  v94[1] = v11;
  v12 = [(UIImageView *)self->_orbImage centerXAnchor];
  BOOL v13 = [v87 centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v94[2] = v14;
  objc_super v15 = [(UIImageView *)self->_orbImage topAnchor];
  v16 = [(UILabel *)self->_titleLabel bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxIntroOrbImageFromTopLandscape];
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  v94[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:4];
  [v88 addObjectsFromArray:v18];

  v81 = [(UILabel *)self->_titleLabel topAnchor];
  v75 = [v87 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxIntroTitleFromTopLandscape];
  id v19 = objc_msgSend(v81, "constraintEqualToAnchor:constant:", v75);
  v93[0] = v19;
  id v20 = [(UILabel *)self->_titleLabel leadingAnchor];
  v21 = [v87 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
  v22 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  v93[1] = v22;
  uint64_t v23 = [(UILabel *)self->_titleLabel trailingAnchor];
  uint64_t v24 = [v87 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  v26 = [v23 constraintEqualToAnchor:v24 constant:-v25];
  v93[2] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:3];
  [v88 addObjectsFromArray:v27];

  v82 = [(UIButton *)self->_dismissButton centerYAnchor];
  v76 = [v87 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v70 = objc_msgSend(v82, "constraintEqualToAnchor:constant:", v76);
  v92[0] = v70;
  uint64_t v28 = [(UIButton *)self->_dismissButton centerXAnchor];
  v29 = [v87 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v30 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v92[1] = v30;
  v31 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v32 = objc_msgSend(v31, "constraintEqualToConstant:");
  v92[2] = v32;
  v33 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  uint64_t v34 = objc_msgSend(v33, "constraintEqualToConstant:");
  v92[3] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:4];
  [v88 addObjectsFromArray:v35];

  v36 = [(UITextView *)self->_termsAndConds leadingAnchor];
  v37 = [(VTUIButton *)self->_setupButton leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v39 = [v36 constraintEqualToAnchor:v37 constant:v38 * 0.5];
  v91[0] = v39;
  v40 = [(UITextView *)self->_termsAndConds trailingAnchor];
  v41 = [(VTUIButton *)self->_setupButton trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v43 = [v40 constraintEqualToAnchor:v41 constant:v42 * -0.5];
  v91[1] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:2];
  [v88 addObjectsFromArray:v44];

  v83 = [(VTUIButton *)self->_setupButton topAnchor];
  v77 = [(UITextView *)self->_termsAndConds bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v71 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", v77);
  v90[0] = v71;
  v66 = [(VTUIButton *)self->_setupButton leadingAnchor];
  v64 = [v87 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
  v45 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64);
  v90[1] = v45;
  int v46 = [(VTUIButton *)self->_setupButton trailingAnchor];
  v47 = [v87 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  v49 = [v46 constraintEqualToAnchor:v47 constant:-v48];
  v90[2] = v49;
  v50 = [(VTUIButton *)self->_setupButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  v51 = objc_msgSend(v50, "constraintEqualToConstant:");
  v90[3] = v51;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:4];
  [v88 addObjectsFromArray:v52];

  v84 = [(VTUIButton *)self->_notNowButton firstBaselineAnchor];
  v78 = [(VTUIButton *)self->_setupButton bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v72 = objc_msgSend(v84, "constraintEqualToAnchor:constant:", v78);
  v89[0] = v72;
  v67 = [(VTUIButton *)self->_notNowButton firstBaselineAnchor];
  v85 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingBottom];
  v54 = [v67 constraintEqualToAnchor:v85 constant:-v53];
  v89[1] = v54;
  v55 = [(VTUIButton *)self->_notNowButton leadingAnchor];
  v56 = [(VTUIButton *)self->_setupButton leadingAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v89[2] = v57;
  v58 = [(VTUIButton *)self->_notNowButton trailingAnchor];
  v59 = [(VTUIButton *)self->_setupButton trailingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  v89[3] = v60;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:4];
  [v88 addObjectsFromArray:v61];

  [MEMORY[0x263F08938] activateConstraints:v88];
  v62 = [MEMORY[0x263EFF8C0] arrayWithArray:v88];
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v62;
}

- (void)_setupPortraitConstraints
{
  v121[3] = *MEMORY[0x263EF8340];
  id v3 = [(VTUIProximityEnrollmentSetupIntroView *)self safeAreaLayoutGuide];
  v111 = [MEMORY[0x263EFF980] array];
  BOOL v4 = +[MGWrapper sharedMGWrapper];
  int v5 = [v4 isDeviceIPad];

  containerView = self->_containerView;
  v108 = v3;
  if (v5)
  {
    v7 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    double v8 = [v3 centerYAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v121[0] = v9;
    v10 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    uint64_t v11 = [v3 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v121[1] = v12;
    BOOL v13 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    v14 = objc_msgSend(v13, "constraintEqualToConstant:");
    v121[2] = v14;
    objc_super v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:3];
    [v111 addObjectsFromArray:v15];
  }
  else
  {
    v16 = [(VTUIProximityContainerView *)containerView bottomAnchor];
    v17 = [(VTUIProximityEnrollmentSetupIntroView *)self bottomAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    id v19 = [v16 constraintEqualToAnchor:v17 constant:-v18];
    v120 = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
    [v111 addObjectsFromArray:v20];

    v7 = [(VTUIProximityContainerView *)self->_containerView leadingAnchor];
    double v8 = [v3 leadingAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    v9 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v119[0] = v9;
    v10 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
    uint64_t v11 = [v3 trailingAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    v12 = [v10 constraintEqualToAnchor:v11 constant:-v21];
    v119[1] = v12;
    BOOL v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
    [v111 addObjectsFromArray:v13];
  }

  v22 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
  uint64_t v23 = objc_msgSend(v22, "constraintEqualToConstant:");
  [v111 addObject:v23];

  v110 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v95 = [(UIImageView *)self->_orbImage heightAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v89 = objc_msgSend(v95, "constraintEqualToConstant:");
  v118[0] = v89;
  uint64_t v24 = [(UIImageView *)self->_orbImage widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  double v25 = objc_msgSend(v24, "constraintEqualToConstant:");
  v118[1] = v25;
  v26 = [(UIImageView *)self->_orbImage centerXAnchor];
  v27 = [v110 centerXAnchor];
  uint64_t v28 = [v26 constraintEqualToAnchor:v27];
  v118[2] = v28;
  v29 = [(UIImageView *)self->_orbImage topAnchor];
  v30 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  [(VTUIStyle *)self->_vtStyle orbImagePadding];
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
  v118[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:4];
  [v111 addObjectsFromArray:v32];

  v96 = [(UIButton *)self->_dismissButton centerYAnchor];
  v90 = [v110 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v86 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", v90);
  v117[0] = v86;
  v33 = [(UIButton *)self->_dismissButton centerXAnchor];
  uint64_t v34 = [v110 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v117[1] = v35;
  v36 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v37 = objc_msgSend(v36, "constraintEqualToConstant:");
  v117[2] = v37;
  double v38 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v39 = objc_msgSend(v38, "constraintEqualToConstant:");
  v117[3] = v39;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:4];
  [v111 addObjectsFromArray:v40];

  v97 = [(UILabel *)self->_titleLabel topAnchor];
  v91 = [v110 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxIntroTitleFromTop];
  v87 = objc_msgSend(v97, "constraintEqualToAnchor:constant:", v91);
  v116[0] = v87;
  v41 = [(UILabel *)self->_titleLabel leadingAnchor];
  double v42 = [v110 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v43 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);
  v116[1] = v43;
  v44 = [(UILabel *)self->_titleLabel trailingAnchor];
  v45 = [v110 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v47 = [v44 constraintEqualToAnchor:v45 constant:-v46];
  v116[2] = v47;
  double v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:3];
  [v111 addObjectsFromArray:v48];

  v98 = [(UILabel *)self->_subtitleLabel topAnchor];
  v92 = [(UILabel *)self->_titleLabel bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingIntroSubtitle];
  v49 = objc_msgSend(v98, "constraintEqualToAnchor:constant:", v92);
  v115[0] = v49;
  v50 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v51 = [v110 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v52 = objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
  v115[1] = v52;
  double v53 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v54 = [v110 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v56 = [v53 constraintEqualToAnchor:v54 constant:-v55];
  v115[2] = v56;
  v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:3];
  [v111 addObjectsFromArray:v57];

  v102 = [(UITextView *)self->_termsAndConds topAnchor];
  v105 = [(UIImageView *)self->_orbImage bottomAnchor];
  [(VTUIStyle *)self->_vtStyle orbImagePadding];
  v99 = objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", v105);
  v114[0] = v99;
  v58 = [(UITextView *)self->_termsAndConds leadingAnchor];
  v59 = [(VTUIButton *)self->_setupButton leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v61 = [v58 constraintEqualToAnchor:v59 constant:v60 * 0.5];
  v114[1] = v61;
  v62 = [(UITextView *)self->_termsAndConds trailingAnchor];
  v63 = [(VTUIButton *)self->_setupButton trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v65 = [v62 constraintEqualToAnchor:v63 constant:v64 * -0.5];
  v114[2] = v65;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:3];
  [v111 addObjectsFromArray:v66];

  v106 = [(VTUIButton *)self->_setupButton topAnchor];
  v103 = [(UITextView *)self->_termsAndConds lastBaselineAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFootnoteButton];
  v100 = objc_msgSend(v106, "constraintEqualToAnchor:constant:", v103);
  v113[0] = v100;
  v93 = [(VTUIButton *)self->_setupButton leadingAnchor];
  v88 = [v110 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v67 = objc_msgSend(v93, "constraintEqualToAnchor:constant:", v88);
  v113[1] = v67;
  v68 = [(VTUIButton *)self->_setupButton trailingAnchor];
  v69 = [v110 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v71 = [v68 constraintEqualToAnchor:v69 constant:-v70];
  v113[2] = v71;
  v72 = [(VTUIButton *)self->_setupButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  v73 = objc_msgSend(v72, "constraintEqualToConstant:");
  v113[3] = v73;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:4];
  [v111 addObjectsFromArray:v74];

  v107 = [(VTUIButton *)self->_notNowButton firstBaselineAnchor];
  v104 = [(VTUIButton *)self->_setupButton bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v101 = objc_msgSend(v107, "constraintEqualToAnchor:constant:", v104);
  v112[0] = v101;
  v94 = [(VTUIButton *)self->_notNowButton firstBaselineAnchor];
  v109 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingBottom];
  v76 = [v94 constraintEqualToAnchor:v109 constant:-v75];
  v112[1] = v76;
  v77 = [(VTUIButton *)self->_notNowButton leadingAnchor];
  v78 = [(VTUIButton *)self->_setupButton leadingAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];
  v112[2] = v79;
  v80 = [(VTUIButton *)self->_notNowButton trailingAnchor];
  v81 = [(VTUIButton *)self->_setupButton trailingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  v112[3] = v82;
  v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:4];
  [v111 addObjectsFromArray:v83];

  [MEMORY[0x263F08938] activateConstraints:v111];
  v84 = [MEMORY[0x263EFF8C0] arrayWithArray:v111];
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v84;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
  [WeakRetained aboutTapped:self];

  return 0;
}

- (VTUIEnrollmentDelegate)enrollmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
  return (VTUIEnrollmentDelegate *)WeakRetained;
}

- (void)setEnrollmentDelegate:(id)a3
{
}

- (VTUIButton)setupButton
{
  return self->_setupButton;
}

- (VTUIButton)notNowButton
{
  return self->_notNowButton;
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (NSArray)viewConstraints
{
  return self->_viewConstraints;
}

- (void)setViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_destroyWeak((id *)&self->_enrollmentDelegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_voiceProfileMgr, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_termsAndConds, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
}

@end