@interface VTUIProximityEnrollmentSuccessView
- (NSArray)viewConstraints;
- (UIButton)dismissButton;
- (VTUIButton)continueButton;
- (VTUIProximityEnrollmentSuccessView)initWithFrame:(CGRect)a3;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupContent;
- (void)_setupPhoneLandscapeConstraints;
- (void)_setupPortraitConstraints;
- (void)setDismissButton:(id)a3;
- (void)setViewConstraints:(id)a3;
@end

@implementation VTUIProximityEnrollmentSuccessView

- (VTUIProximityEnrollmentSuccessView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)VTUIProximityEnrollmentSuccessView;
  v5 = -[VTUIProximityEnrollmentSuccessView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = +[VTUIStyle sharedStyle];
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    [(VTUIProximityEnrollmentSuccessView *)v5 _setupContent];
    -[VTUIProximityEnrollmentSuccessView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupContent
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[VTUIProximityEnrollmentSuccessView _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", buf, 0xCu);
  }
  v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v5 = [v4 languageCode];
  languageCode = self->_languageCode;
  self->_languageCode = v5;

  v7 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v7;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityEnrollmentSuccessView *)self addSubview:self->_containerView];
  objc_super v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = self->_titleLabel;
  v12 = [(VTUIStyle *)self->_vtStyle proxHeaderFont];
  [(UILabel *)v11 setFont:v12];

  v13 = self->_titleLabel;
  v14 = [(VTUIStyle *)self->_vtStyle proxHeaderColor];
  [(UILabel *)v13 setTextColor:v14];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  v15 = self->_titleLabel;
  v16 = +[VTUIStringsHelper sharedStringsHelper];
  v17 = [v16 uiLocalizedStringForKey:@"TEXT_TITLE_READY"];
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
  if (![(VTUIStyle *)self->_vtStyle currentLocaleSupportsCompactVoiceTrigger])
  {
    v23 = (void *)MEMORY[0x263F089D8];
    vtStyle = self->_vtStyle;
    v25 = @"PROX_TEXT_MAIN_READY";
    goto LABEL_7;
  }
  if ([(VTUIStyle *)self->_vtStyle proxAccessorySupportsCompactTrigger])
  {
    v23 = (void *)MEMORY[0x263F089D8];
    vtStyle = self->_vtStyle;
    v25 = @"PROX_TEXT_MAIN_READY_MIXED";
LABEL_7:
    uint64_t v26 = [(VTUIStyle *)vtStyle VTUIDeviceSpecificString:v25];
LABEL_8:
    v27 = (void *)v26;
    v28 = [v23 stringWithString:v26];
    goto LABEL_9;
  }
  v40 = [(VTUIStyle *)self->_vtStyle audioAccessoryName];

  v23 = (void *)MEMORY[0x263F089D8];
  v41 = self->_vtStyle;
  if (!v40)
  {
    uint64_t v26 = [(VTUIStyle *)v41 proxHSDescription:@"PROX_TEXT_MAIN_READY_MIXED_UNSUPPORTED_ACCESSORY"];
    goto LABEL_8;
  }
  v27 = [(VTUIStyle *)v41 VTUIDeviceSpecificString:@"PROX_TEXT_MAIN_READY_MIXED_UNSUPPORTED_ACCESSORY"];
  v42 = [(VTUIStyle *)self->_vtStyle audioAccessoryName];
  v28 = objc_msgSend(v23, "stringWithFormat:", v27, v42);

LABEL_9:
  if ([(VTUIStyle *)self->_vtStyle supportsSiriConversationsAndBargeIn])
  {
    v29 = +[VTUIStringsHelper sharedStringsHelper];
    v30 = [v29 uiLocalizedStringForKey:@"PROX_READY_SPEAK_FREELY_SUFFIX"];
    [v28 appendString:v30];
  }
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v31;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = self->_subtitleLabel;
  v34 = [(VTUIStyle *)self->_vtStyle proxSubtitleFont];
  [(UILabel *)v33 setFont:v34];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setText:v28];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_subtitleLabel];
  v35 = +[VTUIButton _vtuiProximityButtonWithPrimaryStyle];
  continueButton = self->_continueButton;
  self->_continueButton = v35;

  [(VTUIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = self->_continueButton;
  v38 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:@"BUTTON_CONTINUE_SETUP"];
  [(VTUIButton *)v37 setTitle:v38 forState:0];

  v39 = [(VTUIButton *)self->_continueButton titleLabel];
  [v39 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_continueButton];
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  BOOL v4 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", a3.width, a3.height);
  [(UILabel *)self->_subtitleLabel setHidden:v4];
  if (v4)
  {
    [(VTUIProximityEnrollmentSuccessView *)self _setupPhoneLandscapeConstraints];
  }
  else
  {
    [(VTUIProximityEnrollmentSuccessView *)self _setupPortraitConstraints];
  }
}

- (void)_setupPortraitConstraints
{
  v92[3] = *MEMORY[0x263EF8340];
  v3 = [(VTUIProximityEnrollmentSuccessView *)self safeAreaLayoutGuide];
  v83 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v84 = [MEMORY[0x263EFF980] array];
  BOOL v4 = +[MGWrapper sharedMGWrapper];
  int v5 = [v4 isDeviceIPad];

  containerView = self->_containerView;
  v82 = v3;
  if (v5)
  {
    v7 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    v8 = [v3 centerYAnchor];
    objc_super v9 = [v7 constraintEqualToAnchor:v8];
    v92[0] = v9;
    v10 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    v11 = [v3 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v92[1] = v12;
    v13 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    v14 = objc_msgSend(v13, "constraintEqualToConstant:");
    v92[2] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:3];
    [v84 addObjectsFromArray:v15];
  }
  else
  {
    v16 = [(VTUIProximityContainerView *)containerView bottomAnchor];
    v17 = [(VTUIProximityEnrollmentSuccessView *)self bottomAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    v19 = [v16 constraintEqualToAnchor:v17 constant:-v18];
    v91 = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
    [v84 addObjectsFromArray:v20];

    v7 = [(VTUIProximityContainerView *)self->_containerView leadingAnchor];
    v8 = [v3 leadingAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    objc_super v9 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v90[0] = v9;
    v10 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
    v11 = [v3 trailingAnchor];
    [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
    v12 = [v10 constraintEqualToAnchor:v11 constant:-v21];
    v90[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:2];
    [v84 addObjectsFromArray:v13];
  }

  v22 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
  v81 = objc_msgSend(v22, "constraintEqualToConstant:");

  [v84 addObject:v81];
  v73 = [(UIImageView *)self->_orbImage widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v69 = objc_msgSend(v73, "constraintEqualToConstant:");
  v89[0] = v69;
  v66 = [(UIImageView *)self->_orbImage heightAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v23 = objc_msgSend(v66, "constraintEqualToConstant:");
  v89[1] = v23;
  v24 = [(UIImageView *)self->_orbImage centerXAnchor];
  v25 = [v83 centerXAnchor];
  uint64_t v26 = [v24 constraintEqualToAnchor:v25];
  v89[2] = v26;
  v27 = [(UIImageView *)self->_orbImage topAnchor];
  v28 = [v83 topAnchor];
  [(VTUIStyle *)self->_vtStyle orbImagePadding];
  v29 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28);
  v89[3] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:4];
  [v84 addObjectsFromArray:v30];

  v74 = [(UIButton *)self->_dismissButton centerYAnchor];
  v70 = [v83 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v67 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v70);
  v88[0] = v67;
  v31 = [(UIButton *)self->_dismissButton centerXAnchor];
  v32 = [v83 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v33 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v88[1] = v33;
  v34 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v35 = objc_msgSend(v34, "constraintEqualToConstant:");
  v88[2] = v35;
  v36 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v37 = objc_msgSend(v36, "constraintEqualToConstant:");
  v88[3] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:4];
  [v84 addObjectsFromArray:v38];

  v75 = [(UILabel *)self->_titleLabel topAnchor];
  v78 = [(UIImageView *)self->_orbImage bottomAnchor];
  [(VTUIStyle *)self->_vtStyle orbImagePadding];
  v71 = objc_msgSend(v75, "constraintEqualToAnchor:constant:", v78);
  v87[0] = v71;
  v39 = [(UILabel *)self->_titleLabel leadingAnchor];
  v40 = [v83 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v41 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40);
  v87[1] = v41;
  v42 = [(UILabel *)self->_titleLabel trailingAnchor];
  v43 = [v83 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  uint64_t v45 = [v42 constraintEqualToAnchor:v43 constant:-v44];
  v87[2] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:3];
  [v84 addObjectsFromArray:v46];

  v79 = [(UILabel *)self->_subtitleLabel topAnchor];
  v76 = [(UILabel *)self->_titleLabel bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingSuccessSubtitle];
  v47 = objc_msgSend(v79, "constraintEqualToAnchor:constant:", v76);
  v86[0] = v47;
  v48 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v49 = [v83 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v50 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);
  v86[1] = v50;
  v51 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v52 = [v83 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v54 = [v51 constraintEqualToAnchor:v52 constant:-v53];
  v86[2] = v54;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:3];
  [v84 addObjectsFromArray:v55];

  v80 = [(VTUIButton *)self->_continueButton leadingAnchor];
  v77 = [v83 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v72 = objc_msgSend(v80, "constraintEqualToAnchor:constant:", v77);
  v85[0] = v72;
  v68 = [(VTUIButton *)self->_continueButton trailingAnchor];
  v56 = [v83 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v58 = [v68 constraintEqualToAnchor:v56 constant:-v57];
  v85[1] = v58;
  v59 = [(VTUIButton *)self->_continueButton bottomAnchor];
  v60 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingSuccessFromBottom];
  v62 = [v59 constraintEqualToAnchor:v60 constant:-v61];
  v85[2] = v62;
  v63 = [(VTUIButton *)self->_continueButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  v64 = objc_msgSend(v63, "constraintEqualToConstant:");
  v85[3] = v64;
  v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:4];
  [v84 addObjectsFromArray:v65];

  [MEMORY[0x263F08938] activateConstraints:v84];
  [(VTUIProximityEnrollmentSuccessView *)self setViewConstraints:v84];
}

- (void)_setupPhoneLandscapeConstraints
{
  v69[4] = *MEMORY[0x263EF8340];
  v62 = [(VTUIProximityEnrollmentSuccessView *)self safeAreaLayoutGuide];
  v64 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v63 = [MEMORY[0x263EFF980] array];
  double v57 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
  v52 = [v62 centerXAnchor];
  v48 = [v57 constraintEqualToAnchor:v52];
  v69[0] = v48;
  v47 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
  v3 = objc_msgSend(v47, "constraintEqualToConstant:");
  v69[1] = v3;
  BOOL v4 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
  int v5 = objc_msgSend(v4, "constraintEqualToConstant:");
  v69[2] = v5;
  uint64_t v6 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  v7 = [(VTUIProximityEnrollmentSuccessView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  objc_super v9 = [v6 constraintEqualToAnchor:v7 constant:-v8];
  v69[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];
  [v63 addObjectsFromArray:v10];

  v58 = [(UIImageView *)self->_orbImage widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  double v53 = objc_msgSend(v58, "constraintEqualToConstant:");
  v68[0] = v53;
  v49 = [(UIImageView *)self->_orbImage heightAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v11 = objc_msgSend(v49, "constraintEqualToConstant:");
  v68[1] = v11;
  v12 = [(UIImageView *)self->_orbImage centerXAnchor];
  v13 = [v64 centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v68[2] = v14;
  v15 = [(UIImageView *)self->_orbImage topAnchor];
  v16 = [v64 topAnchor];
  [(VTUIStyle *)self->_vtStyle orbImagePadding];
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  v68[3] = v17;
  double v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
  [v63 addObjectsFromArray:v18];

  v59 = [(UILabel *)self->_titleLabel topAnchor];
  v54 = [v64 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingSuccessTitleLandscape];
  v19 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v54);
  v67[0] = v19;
  id v20 = [(UILabel *)self->_titleLabel leadingAnchor];
  double v21 = [v64 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
  v22 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  v67[1] = v22;
  v23 = [(UILabel *)self->_titleLabel trailingAnchor];
  v24 = [v64 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  uint64_t v26 = [v23 constraintEqualToAnchor:v24 constant:-v25];
  v67[2] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
  [v63 addObjectsFromArray:v27];

  v60 = [(UIButton *)self->_dismissButton centerYAnchor];
  v55 = [v64 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v50 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", v55);
  v66[0] = v50;
  v28 = [(UIButton *)self->_dismissButton centerXAnchor];
  v29 = [v64 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v30 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v66[1] = v30;
  v31 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v32 = objc_msgSend(v31, "constraintEqualToConstant:");
  v66[2] = v32;
  v33 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v34 = objc_msgSend(v33, "constraintEqualToConstant:");
  v66[3] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
  [v63 addObjectsFromArray:v35];

  double v61 = [(VTUIButton *)self->_continueButton leadingAnchor];
  v56 = [v64 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
  v51 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", v56);
  v65[0] = v51;
  v36 = [(VTUIButton *)self->_continueButton trailingAnchor];
  v37 = [v64 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  v39 = [v36 constraintEqualToAnchor:v37 constant:-v38];
  v65[1] = v39;
  v40 = [(VTUIButton *)self->_continueButton bottomAnchor];
  v41 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingSuccessFromBottomLandscape];
  v43 = [v40 constraintEqualToAnchor:v41 constant:-v42];
  v65[2] = v43;
  double v44 = [(VTUIButton *)self->_continueButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  uint64_t v45 = objc_msgSend(v44, "constraintEqualToConstant:");
  v65[3] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:4];
  [v63 addObjectsFromArray:v46];

  [MEMORY[0x263F08938] activateConstraints:v63];
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
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
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end