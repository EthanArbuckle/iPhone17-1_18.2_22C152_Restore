@interface VTUIProximityEnrollmentLanguageOptionsView
- (NSArray)viewConstraints;
- (UIButton)dismissButton;
- (UIPickerView)languagesPickerView;
- (VTUIButton)continueButton;
- (VTUIProximityEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3 languageOptions:(id)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupContent;
- (void)setDismissButton:(id)a3;
- (void)setViewConstraints:(id)a3;
@end

@implementation VTUIProximityEnrollmentLanguageOptionsView

- (VTUIProximityEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3 languageOptions:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VTUIProximityEnrollmentLanguageOptionsView;
  v11 = -[VTUIProximityEnrollmentLanguageOptionsView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = +[VTUIStyle sharedStyle];
    vtStyle = v11->_vtStyle;
    v11->_vtStyle = (VTUIStyle *)v12;

    objc_storeStrong((id *)&v11->_continueButtonsLanguages, a4);
    [(VTUIProximityEnrollmentLanguageOptionsView *)v11 _setupContent];
    -[VTUIProximityEnrollmentLanguageOptionsView _setupConstraintsToSize:](v11, "_setupConstraintsToSize:", width, height);
  }

  return v11;
}

- (void)_setupContent
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[VTUIProximityEnrollmentLanguageOptionsView _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v38, 0xCu);
  }
  v4 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v4;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityEnrollmentLanguageOptionsView *)self addSubview:self->_containerView];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  [(UILabel *)self->_titleLabel setNumberOfLines:3];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = self->_titleLabel;
  v9 = [(VTUIStyle *)self->_vtStyle proxHeaderFont];
  [(UILabel *)v8 setFont:v9];

  id v10 = self->_titleLabel;
  v11 = [(VTUIStyle *)self->_vtStyle proxInstructionColor];
  [(UILabel *)v10 setTextColor:v11];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  uint64_t v12 = self->_titleLabel;
  v13 = +[VTUIStringsHelper sharedStringsHelper];
  v14 = [v13 uiLocalizedStringForKey:@"TEXT_TITLE_LANGUAGE_OPTIONS"];
  [(UILabel *)v12 setText:v14];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_titleLabel];
  objc_super v15 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v15;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_dismissButton];
  v17 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  footerView = self->_footerView;
  self->_footerView = v17;

  [(UIView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityEnrollmentLanguageOptionsView *)self addSubview:self->_footerView];
  v19 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  languagesView = self->_languagesView;
  self->_languagesView = v19;

  [(UIView *)self->_languagesView setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = self->_languagesView;
  v22 = [MEMORY[0x263F825C8] whiteColor];
  [(UIView *)v21 setBackgroundColor:v22];

  [(VTUIProximityEnrollmentLanguageOptionsView *)self addSubview:self->_languagesView];
  v23 = (UIPickerView *)objc_alloc_init(MEMORY[0x263F82A38]);
  languagesPickerView = self->_languagesPickerView;
  self->_languagesPickerView = v23;

  [(UIPickerView *)self->_languagesPickerView setDelegate:self];
  [(UIPickerView *)self->_languagesPickerView setDataSource:self];
  [(UIPickerView *)self->_languagesPickerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_languagesView addSubview:self->_languagesPickerView];
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  settingsLabel = self->_settingsLabel;
  self->_settingsLabel = v25;

  [(UILabel *)self->_settingsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = self->_settingsLabel;
  v28 = [(VTUIStyle *)self->_vtStyle proxFooterFont];
  [(UILabel *)v27 setFont:v28];

  v29 = self->_settingsLabel;
  v30 = [(VTUIStyle *)self->_vtStyle footerTextColor];
  [(UILabel *)v29 setTextColor:v30];

  [(UILabel *)self->_settingsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_settingsLabel setTextAlignment:1];
  [(UILabel *)self->_settingsLabel setNumberOfLines:0];
  v31 = self->_settingsLabel;
  v32 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:@"TEXT_CHANGE_IN_SETTINGS"];
  [(UILabel *)v31 setText:v32];

  [(UIView *)self->_footerView addSubview:self->_settingsLabel];
  v33 = +[VTUIButton _vtuiProximityButtonWithPrimaryStyle];
  continueButton = self->_continueButton;
  self->_continueButton = v33;

  [(VTUIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = self->_continueButton;
  v36 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:@"BUTTON_CONTINUE_SETUP"];
  [(VTUIButton *)v35 setTitle:v36 forState:0];

  v37 = [(VTUIButton *)self->_continueButton titleLabel];
  [v37 setNumberOfLines:0];

  [(UIView *)self->_footerView addSubview:self->_continueButton];
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v155[3] = *MEMORY[0x263EF8340];
  v6 = [(VTUIProximityEnrollmentLanguageOptionsView *)self safeAreaLayoutGuide];
  v7 = [MEMORY[0x263EFF980] array];
  BOOL v8 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  v9 = +[MGWrapper sharedMGWrapper];
  char v10 = [v9 isDeviceIPad];

  containerView = self->_containerView;
  v144 = v7;
  BOOL v140 = v8;
  v134 = v6;
  if (v10)
  {
    v137 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    uint64_t v12 = [v6 centerYAnchor];
    v13 = [v137 constraintEqualToAnchor:v12];
    v155[0] = v13;
    v14 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    objc_super v15 = [v6 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v155[1] = v16;
    v17 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    v18 = objc_msgSend(v17, "constraintEqualToConstant:");
    v155[2] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:3];
    [v144 addObjectsFromArray:v19];

    v7 = v144;
    BOOL v20 = v140;

    if (!v140) {
      goto LABEL_8;
    }
LABEL_6:
    [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
    goto LABEL_9;
  }
  v21 = [(VTUIProximityContainerView *)containerView bottomAnchor];
  v22 = [(VTUIProximityEnrollmentLanguageOptionsView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v24 = [v21 constraintEqualToAnchor:v22 constant:-v23];
  v154 = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:1];
  [v7 addObjectsFromArray:v25];

  v26 = self->_containerView;
  if (v8)
  {
    v27 = [(VTUIProximityContainerView *)v26 centerXAnchor];
    v28 = [v6 centerXAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v153[0] = v29;
    v30 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
    v31 = objc_msgSend(v30, "constraintEqualToConstant:");
    v153[1] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:2];
    [v7 addObjectsFromArray:v32];

    BOOL v20 = v140;
    goto LABEL_6;
  }
  v138 = [(VTUIProximityContainerView *)v26 leadingAnchor];
  v34 = [v6 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v35 = objc_msgSend(v138, "constraintEqualToAnchor:constant:", v34);
  v152[0] = v35;
  v36 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
  v37 = [v6 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v39 = [v36 constraintEqualToAnchor:v37 constant:-v38];
  v152[1] = v39;
  uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:2];
  [v7 addObjectsFromArray:v40];

  BOOL v20 = v140;
LABEL_8:
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
LABEL_9:
  double v41 = v33;
  v42 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  uint64_t v43 = [v42 constraintEqualToConstant:v41];

  v133 = (void *)v43;
  [v7 addObject:v43];
  v139 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  vtStyle = self->_vtStyle;
  if (v20) {
    [(VTUIStyle *)vtStyle proxTitleTrailingLandscape];
  }
  else {
    [(VTUIStyle *)vtStyle proxTrailing];
  }
  double v46 = v45;
  v135 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v127 = [v139 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTitleFirstBaselineFromTop];
  v47 = objc_msgSend(v135, "constraintEqualToAnchor:constant:", v127);
  v151[0] = v47;
  v48 = [(UILabel *)self->_titleLabel leadingAnchor];
  v49 = [v139 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v50 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);
  v151[1] = v50;
  v51 = [(UILabel *)self->_titleLabel trailingAnchor];
  v52 = [v139 trailingAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:-v46];
  v151[2] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:3];
  [v144 addObjectsFromArray:v54];

  v136 = [(UIButton *)self->_dismissButton centerYAnchor];
  v128 = [v139 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v55 = objc_msgSend(v136, "constraintEqualToAnchor:constant:", v128);
  v150[0] = v55;
  v56 = [(UIButton *)self->_dismissButton centerXAnchor];
  v57 = [v139 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v58 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
  v150[1] = v58;
  v59 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v60 = objc_msgSend(v59, "constraintEqualToConstant:");
  v150[2] = v60;
  v61 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v62 = objc_msgSend(v61, "constraintEqualToConstant:");
  v150[3] = v62;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
  [v144 addObjectsFromArray:v63];

  v64 = self->_vtStyle;
  if (v140) {
    [(VTUIStyle *)v64 proxViewLanguageOptionsHeightPhoneLandscape];
  }
  else {
    [(VTUIStyle *)v64 proxViewLanguageOptionsHeight];
  }
  double v66 = v65;
  v129 = [(UIView *)self->_languagesView leadingAnchor];
  v124 = [(VTUIProximityContainerView *)self->_containerView leadingAnchor];
  v121 = [v129 constraintEqualToAnchor:v124];
  v149[0] = v121;
  v118 = [(UIView *)self->_languagesView trailingAnchor];
  v67 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
  v68 = [v118 constraintEqualToAnchor:v67];
  v149[1] = v68;
  v69 = [(UIPickerView *)self->_languagesPickerView centerYAnchor];
  v70 = [(VTUIProximityContainerView *)self->_containerView centerYAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  v149[2] = v71;
  v72 = [(UIView *)self->_languagesView heightAnchor];
  v73 = [v72 constraintEqualToConstant:v66];
  v149[3] = v73;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:4];
  [v144 addObjectsFromArray:v74];

  v130 = [(UIPickerView *)self->_languagesPickerView centerXAnchor];
  v75 = [(UIView *)self->_languagesView centerXAnchor];
  v76 = [v130 constraintEqualToAnchor:v75];
  v148[0] = v76;
  v77 = [(UIPickerView *)self->_languagesPickerView centerYAnchor];
  v78 = [(UIView *)self->_languagesView centerYAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];
  v148[1] = v79;
  v80 = [(UIPickerView *)self->_languagesPickerView heightAnchor];
  v81 = [(UIView *)self->_languagesView heightAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  v148[2] = v82;
  v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:3];
  [v144 addObjectsFromArray:v83];

  v131 = [(UIView *)self->_footerView topAnchor];
  v125 = [(UIPickerView *)self->_languagesPickerView bottomAnchor];
  v122 = [v131 constraintEqualToAnchor:v125];
  v147[0] = v122;
  v119 = [(UIView *)self->_footerView bottomAnchor];
  v84 = [v139 bottomAnchor];
  v85 = [v119 constraintEqualToAnchor:v84];
  v147[1] = v85;
  v86 = [(UIView *)self->_footerView leadingAnchor];
  v87 = [v139 leadingAnchor];
  v88 = [v86 constraintEqualToAnchor:v87];
  v147[2] = v88;
  v89 = [(UIView *)self->_footerView trailingAnchor];
  v90 = [v139 trailingAnchor];
  v91 = [v89 constraintEqualToAnchor:v90];
  v147[3] = v91;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:4];
  [v144 addObjectsFromArray:v92];

  v93 = self->_vtStyle;
  if (v140)
  {
    [(VTUIStyle *)v93 proxLeadingLandscape];
    double v95 = v94;
    [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  }
  else
  {
    [(VTUIStyle *)v93 proxLeading];
    double v95 = v97;
    [(VTUIStyle *)self->_vtStyle proxTrailing];
  }
  double v98 = v96;
  v141 = [(VTUIButton *)self->_continueButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  v132 = objc_msgSend(v141, "constraintEqualToConstant:");
  v146[0] = v132;
  v126 = [(VTUIButton *)self->_continueButton leadingAnchor];
  v123 = [(UIView *)self->_footerView leadingAnchor];
  v120 = [v126 constraintEqualToAnchor:v123 constant:v95];
  v146[1] = v120;
  v99 = [(VTUIButton *)self->_continueButton trailingAnchor];
  v100 = [(UIView *)self->_footerView trailingAnchor];
  v101 = [v99 constraintEqualToAnchor:v100 constant:-v98];
  v146[2] = v101;
  v102 = [(VTUIButton *)self->_continueButton bottomAnchor];
  v103 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingFromBottom];
  v105 = [v102 constraintEqualToAnchor:v103 constant:-v104];
  v146[3] = v105;
  v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:4];
  [v144 addObjectsFromArray:v106];

  v143 = [(UILabel *)self->_settingsLabel leadingAnchor];
  v142 = [(UIView *)self->_footerView leadingAnchor];
  v107 = [v143 constraintEqualToAnchor:v142];
  v145[0] = v107;
  v108 = [(UILabel *)self->_settingsLabel trailingAnchor];
  v109 = [(UIView *)self->_footerView trailingAnchor];
  v110 = [v108 constraintEqualToAnchor:v109];
  v145[1] = v110;
  v111 = [(UILabel *)self->_settingsLabel bottomAnchor];
  v112 = [(VTUIButton *)self->_continueButton topAnchor];
  [(VTUIStyle *)self->_vtStyle proxSettingsLabelBottomMargin];
  v114 = [v111 constraintEqualToAnchor:v112 constant:-v113];
  v145[2] = v114;
  v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:3];
  [v144 addObjectsFromArray:v115];

  [MEMORY[0x263F08938] activateConstraints:v144];
  v116 = [MEMORY[0x263EFF8C0] arrayWithArray:v144];
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v116;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_continueButtonsLanguages count];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3, a4, a5);
  BOOL v8 = [v7 languageCode];

  if (!v8)
  {
    v9 = [MEMORY[0x263EFF960] currentLocale];
    BOOL v8 = [v9 localeIdentifier];
  }
  char v10 = [(NSArray *)self->_continueButtonsLanguages objectAtIndex:a4];
  v11 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v12 = [v11 localizedCompactNameForSiriLanguage:v10 inDisplayLanguage:v8];
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = v10;
  }
  id v15 = v14;

  v16 = NSString;
  v17 = +[VTUIStringsHelper sharedStringsHelper];
  v18 = [v17 uiLocalizedStringForKey:@"BUTTON_LANG_OPTION"];
  v19 = +[VTUIStringsHelper sharedStringsHelper];
  BOOL v20 = [v19 uiLocalizedStringForKey:v15];

  v21 = objc_msgSend(v16, "stringWithFormat:", v18, v20);

  return v21;
}

- (UIPickerView)languagesPickerView
{
  return self->_languagesPickerView;
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
  objc_storeStrong((id *)&self->_languagesPickerView, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_languagesView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_settingsLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_continueButtonsLanguages, 0);
}

@end