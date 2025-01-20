@interface VTUIVoiceSelectionProximityView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (NSArray)constraints;
- (UIButton)chooseRandomVoiceButton;
- (UIButton)continueButton;
- (UIButton)dismissButton;
- (VTUIVoiceSelectionProximityView)initWithTitle:(id)a3 allowsRandomVoiceSelection:(BOOL)a4 forSelectionStyle:(int64_t)a5;
- (id)viewConstraints;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupContentWithTitle:(id)a3;
- (void)setChooseRandomVoiceButton:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3;
@end

@implementation VTUIVoiceSelectionProximityView

- (VTUIVoiceSelectionProximityView)initWithTitle:(id)a3 allowsRandomVoiceSelection:(BOOL)a4 forSelectionStyle:(int64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VTUIVoiceSelectionProximityView;
  v9 = -[VTUIVoiceSelectionProximityView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v9)
  {
    uint64_t v10 = +[VTUIStyle sharedStyle];
    vtStyle = v9->_vtStyle;
    v9->_vtStyle = (VTUIStyle *)v10;

    v9->_allowsRandomVoiceSelection = a4;
    v9->_selectionStyle = a5;
    v9->_isHidingCompactBackgroundCardView = 0;
    [(VTUIVoiceSelectionProximityView *)v9 _setupContentWithTitle:v8];
    -[VTUIVoiceSelectionProximityView _setupConstraintsToSize:](v9, "_setupConstraintsToSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    v12 = [MEMORY[0x263F825C8] clearColor];
    [(VTUIVoiceSelectionProximityView *)v9 setBackgroundColor:v12];
  }
  return v9;
}

- (void)_setupContentWithTitle:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[VTUIVoiceSelectionProximityView _setupContentWithTitle:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v38, 0xCu);
  }
  v6 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v6;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIVoiceSelectionProximityView *)self addSubview:self->_containerView];
  id v8 = objc_alloc(MEMORY[0x263F82828]);
  v9 = [(VTUIStyle *)self->_vtStyle siriIconImage];
  uint64_t v10 = (void *)[v8 initWithImage:v9];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_orbImage, v10);
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_orbImage];
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  [(UILabel *)self->_titleLabel setNumberOfLines:3];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_titleLabel;
  vtStyle = self->_vtStyle;
  if (self->_selectionStyle == 1)
  {
    v15 = [(VTUIStyle *)vtStyle PRXheaderFont];
    [(UILabel *)v13 setFont:v15];

    v16 = self->_titleLabel;
    [(VTUIStyle *)self->_vtStyle PRXheaderColor];
  }
  else
  {
    v17 = [(VTUIStyle *)vtStyle proxHeaderFont];
    [(UILabel *)v13 setFont:v17];

    v16 = self->_titleLabel;
    [(VTUIStyle *)self->_vtStyle proxHeaderColor];
  v18 = };
  [(UILabel *)v16 setTextColor:v18];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setText:v4];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_titleLabel];
  v19 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v19;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_dismissButton];
  v21 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  footerView = self->_footerView;
  self->_footerView = v21;

  [(UIView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIVoiceSelectionProximityView *)self addSubview:self->_footerView];
  if (self->_selectionStyle == 1) {
    +[VTUIButton _vtuiProximityButtonWithPRXStyle];
  }
  else {
  v23 = +[VTUIButton _vtuiProximityButtonWithPrimaryStyle];
  }
  continueButton = self->_continueButton;
  self->_continueButton = v23;

  [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = self->_continueButton;
  v26 = [(VTUIStyle *)self->_vtStyle VTUIDeviceSpecificString:@"BUTTON_CONTINUE_SETUP"];
  [(UIButton *)v25 setTitle:v26 forState:0];

  v27 = [(UIButton *)self->_continueButton titleLabel];
  [v27 setNumberOfLines:0];

  [(UIView *)self->_footerView addSubview:self->_continueButton];
  if (self->_allowsRandomVoiceSelection)
  {
    v28 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
    chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
    self->_chooseRandomVoiceButton = v28;

    v30 = [(UIButton *)self->_chooseRandomVoiceButton titleLabel];
    v31 = [(VTUIStyle *)self->_vtStyle proxCancelFont];
    [v30 setFont:v31];

    [(UIButton *)self->_chooseRandomVoiceButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = self->_chooseRandomVoiceButton;
    v33 = self->_vtStyle;
    if (self->_selectionStyle == 1)
    {
      v34 = [(VTUIStyle *)v33 homeAppTintColor];
      [(UIButton *)v32 setTintColor:v34];

      v32 = self->_chooseRandomVoiceButton;
      v33 = self->_vtStyle;
      v35 = @"BUTTON_CHOOSE_FOR_ME_CAPITALIZED";
    }
    else
    {
      v35 = @"BUTTON_CHOOSE_FOR_ME";
    }
    v36 = [(VTUIStyle *)v33 VTUIDeviceSpecificString:v35];
    [(UIButton *)v32 setTitle:v36 forState:0];

    v37 = [(UIButton *)self->_chooseRandomVoiceButton titleLabel];
    [v37 setNumberOfLines:0];

    [(UIView *)self->_footerView addSubview:self->_chooseRandomVoiceButton];
  }
}

- (void)setContentView:(id)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, a3);
  id v26 = a3;
  [(VTUIProximityContainerView *)self->_containerView addSubview:*p_contentView];
  [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(UIView *)self->_footerView topAnchor];
  v7 = [(UIView *)*p_contentView bottomAnchor];
  id v8 = +[VTUIStyle sharedStyle];
  [v8 proxBottomPaddingVoiceSelectionOptions];
  v20 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);

  LODWORD(v9) = 1132068864;
  [v20 setPriority:v9];
  v21 = (void *)MEMORY[0x263F08938];
  v25 = [(UIView *)*p_contentView topAnchor];
  v23 = [(UILabel *)self->_titleLabel bottomAnchor];
  v24 = +[VTUIStyle sharedStyle];
  [v24 proxTopPaddingVoiceSelectionOptions];
  v22 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v23);
  v27[0] = v22;
  uint64_t v10 = [(UIView *)*p_contentView leadingAnchor];
  v11 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v12 = [v11 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
  v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v27[1] = v13;
  objc_super v14 = [(UIView *)*p_contentView trailingAnchor];
  v15 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  v16 = [v15 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  v18 = [v14 constraintEqualToAnchor:v16 constant:-v17];
  v27[2] = v18;
  v27[3] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  [v21 activateConstraints:v19];
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v159[3] = *MEMORY[0x263EF8340];
  v6 = [(VTUIVoiceSelectionProximityView *)self safeAreaLayoutGuide];
  v7 = [MEMORY[0x263EFF980] array];
  BOOL v140 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  id v8 = +[MGWrapper sharedMGWrapper];
  char v9 = [v8 isDeviceIPad];

  containerView = self->_containerView;
  v146 = v7;
  v138 = v6;
  if (v9)
  {
    v143 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    v11 = [v6 centerYAnchor];
    v12 = [v143 constraintEqualToAnchor:v11];
    v159[0] = v12;
    v13 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    objc_super v14 = [v6 centerXAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v159[1] = v15;
    v16 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    double v17 = objc_msgSend(v16, "constraintEqualToConstant:");
    v159[2] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:3];
    [v146 addObjectsFromArray:v18];

    v7 = v146;
    BOOL v19 = v140;
    if (!v140) {
      goto LABEL_8;
    }
LABEL_6:
    [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
    goto LABEL_9;
  }
  v20 = [(VTUIProximityContainerView *)containerView bottomAnchor];
  v21 = [(VTUIVoiceSelectionProximityView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v23 = [v20 constraintEqualToAnchor:v21 constant:-v22];
  v158 = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v158 count:1];
  [v7 addObjectsFromArray:v24];

  v25 = self->_containerView;
  if (v140)
  {
    id v26 = [(VTUIProximityContainerView *)v25 centerXAnchor];
    v27 = [v6 centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v157[0] = v28;
    v29 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
    v30 = objc_msgSend(v29, "constraintEqualToConstant:");
    v157[1] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:2];
    [v7 addObjectsFromArray:v31];

    BOOL v19 = v140;
    goto LABEL_6;
  }
  v144 = [(VTUIProximityContainerView *)v25 leadingAnchor];
  v33 = [v6 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v34 = objc_msgSend(v144, "constraintEqualToAnchor:constant:", v33);
  v156[0] = v34;
  v35 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
  v36 = [v6 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  int v38 = [v35 constraintEqualToAnchor:v36 constant:-v37];
  v156[1] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:2];
  [v7 addObjectsFromArray:v39];

  BOOL v19 = 0;
LABEL_8:
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
LABEL_9:
  double v40 = v32;
  v41 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  uint64_t v42 = [v41 constraintGreaterThanOrEqualToConstant:v40];

  v137 = (void *)v42;
  [v7 addObject:v42];
  v43 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  vtStyle = self->_vtStyle;
  if (v19) {
    [(VTUIStyle *)vtStyle proxTitleTrailingLandscape];
  }
  else {
    [(VTUIStyle *)vtStyle proxTrailing];
  }
  double v46 = v45;
  v134 = [(UIImageView *)self->_orbImage firstBaselineAnchor];
  v132 = [v43 topAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageOffsetFromTopEnrollment];
  v129 = objc_msgSend(v134, "constraintEqualToAnchor:constant:", v132);
  v155[0] = v129;
  v47 = [(UIImageView *)self->_orbImage centerXAnchor];
  v48 = [(VTUIVoiceSelectionProximityView *)self centerXAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v155[1] = v49;
  v50 = [(UIImageView *)self->_orbImage widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v51 = objc_msgSend(v50, "constraintEqualToConstant:");
  v155[2] = v51;
  [(UIImageView *)self->_orbImage heightAnchor];
  v52 = v145 = v43;
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  v53 = objc_msgSend(v52, "constraintEqualToConstant:");
  v155[3] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:4];
  [v146 addObjectsFromArray:v54];

  v135 = [(UILabel *)self->_titleLabel topAnchor];
  v55 = [(UIImageView *)self->_orbImage bottomAnchor];
  [(VTUIStyle *)self->_vtStyle titleOffsetFromOrbImage];
  v56 = objc_msgSend(v135, "constraintEqualToAnchor:constant:", v55);
  v154[0] = v56;
  v57 = [(UILabel *)self->_titleLabel leadingAnchor];
  v58 = [v145 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v59 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58);
  v154[1] = v59;
  v60 = [(UILabel *)self->_titleLabel trailingAnchor];
  v61 = [v145 trailingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61 constant:-v46];
  v154[2] = v62;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:3];
  [v146 addObjectsFromArray:v63];

  int64_t selectionStyle = self->_selectionStyle;
  v65 = [(UIButton *)self->_dismissButton centerYAnchor];
  v66 = [v145 topAnchor];
  v67 = self->_vtStyle;
  v136 = v65;
  if (selectionStyle == 1)
  {
    [(VTUIStyle *)v67 PRXdismissButtonMargin];
    v68 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    v153[0] = v68;
    v69 = [(UIButton *)self->_dismissButton centerXAnchor];
    v70 = [v145 trailingAnchor];
    [(VTUIStyle *)self->_vtStyle PRXdismissButtonMargin];
    v72 = [v69 constraintEqualToAnchor:v70 constant:-v71];
    v153[1] = v72;
    v73 = v153;
  }
  else
  {
    [(VTUIStyle *)v67 proxTrainingDismissButtonVerticalPaddingTop];
    v68 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    v152[0] = v68;
    v69 = [(UIButton *)self->_dismissButton centerXAnchor];
    v70 = [v145 trailingAnchor];
    [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
    v72 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70);
    v152[1] = v72;
    v73 = v152;
  }
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
  [v146 addObjectsFromArray:v74];

  v75 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v76 = objc_msgSend(v75, "constraintEqualToConstant:");
  v151[0] = v76;
  v77 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v78 = objc_msgSend(v77, "constraintEqualToConstant:");
  v151[1] = v78;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:2];
  [v146 addObjectsFromArray:v79];

  v130 = [(UIView *)self->_footerView topAnchor];
  v127 = [(UIButton *)self->_continueButton topAnchor];
  v125 = [v130 constraintEqualToAnchor:v127];
  v150[0] = v125;
  v123 = [(UIView *)self->_footerView bottomAnchor];
  v80 = [v145 bottomAnchor];
  v81 = [v123 constraintEqualToAnchor:v80];
  v150[1] = v81;
  v82 = [(UIView *)self->_footerView leadingAnchor];
  v83 = [v145 leadingAnchor];
  v84 = [v82 constraintEqualToAnchor:v83];
  v150[2] = v84;
  v85 = [(UIView *)self->_footerView trailingAnchor];
  v86 = [v145 trailingAnchor];
  v87 = [v85 constraintEqualToAnchor:v86];
  v150[3] = v87;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
  [v146 addObjectsFromArray:v88];

  v89 = self->_vtStyle;
  if (v140)
  {
    [(VTUIStyle *)v89 proxLeadingLandscape];
    double v91 = v90;
    [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  }
  else
  {
    [(VTUIStyle *)v89 proxLeading];
    double v91 = v93;
    [(VTUIStyle *)self->_vtStyle proxTrailing];
  }
  double v94 = v92;
  v141 = [(UIButton *)self->_continueButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  v95 = objc_msgSend(v141, "constraintEqualToConstant:");
  v149[0] = v95;
  v96 = [(UIButton *)self->_continueButton leadingAnchor];
  v97 = [(UIView *)self->_footerView leadingAnchor];
  v98 = [v96 constraintEqualToAnchor:v97 constant:v91];
  v149[1] = v98;
  v99 = [(UIButton *)self->_continueButton trailingAnchor];
  v100 = [(UIView *)self->_footerView trailingAnchor];
  v101 = [v99 constraintEqualToAnchor:v100 constant:-v94];
  v149[2] = v101;
  v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:3];
  [v146 addObjectsFromArray:v102];

  if (self->_allowsRandomVoiceSelection)
  {
    v128 = [(UIButton *)self->_chooseRandomVoiceButton firstBaselineAnchor];
    uint64_t v142 = [(UIButton *)self->_continueButton bottomAnchor];
    [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
    uint64_t v133 = objc_msgSend(v128, "constraintEqualToAnchor:constant:", v142);
    v148[0] = v133;
    v126 = [(UIButton *)self->_chooseRandomVoiceButton firstBaselineAnchor];
    v139 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
    [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingBottom];
    v131 = [v126 constraintEqualToAnchor:v139 constant:-v103];
    v148[1] = v131;
    v124 = [(UIButton *)self->_chooseRandomVoiceButton leadingAnchor];
    v122 = [(UIButton *)self->_continueButton leadingAnchor];
    v104 = [v124 constraintEqualToAnchor:v122];
    v148[2] = v104;
    v105 = [(UIButton *)self->_chooseRandomVoiceButton trailingAnchor];
    v106 = [(UIButton *)self->_continueButton trailingAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    v148[3] = v107;
    v108 = [(UIButton *)self->_continueButton bottomAnchor];
    v109 = [(UIButton *)self->_chooseRandomVoiceButton topAnchor];
    [(VTUIStyle *)self->_vtStyle proxChooseForMeTopPaddingFromContinueButton];
    v111 = [v108 constraintEqualToAnchor:v109 constant:-v110];
    v148[4] = v111;
    v112 = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:5];
    v113 = v146;
    [v146 addObjectsFromArray:v112];

    v114 = v128;
    v115 = v126;

    v116 = (void *)v133;
    v117 = (void *)v142;

    unint64_t v118 = 0x263EFF000;
  }
  else
  {
    v114 = [(UIButton *)self->_continueButton bottomAnchor];
    v117 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
    [(VTUIStyle *)self->_vtStyle proxPaddingFromBottom];
    v116 = [v114 constraintEqualToAnchor:v117 constant:-v119];
    v147 = v116;
    unint64_t v118 = 0x263EFF000uLL;
    v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v147 count:1];
    v113 = v146;
    [v146 addObjectsFromArray:v115];
  }

  [MEMORY[0x263F08938] activateConstraints:v113];
  v120 = [*(id *)(v118 + 2240) arrayWithArray:v113];
  constraints = self->_constraints;
  self->_constraints = v120;
}

- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3
{
  BOOL v3 = a3;
  containerView = self->_containerView;
  if (a3)
  {
    v6 = [MEMORY[0x263F825C8] clearColor];
    BOOL v7 = 1;
  }
  else
  {
    v6 = [MEMORY[0x263F825C8] whiteColor];
    BOOL v7 = 0;
  }
  [(VTUIProximityContainerView *)containerView setBackgroundColor:v6];

  [(UIButton *)self->_dismissButton setHidden:v3];
  self->_isHidingCompactBackgroundCardView = v7;
}

- (id)viewConstraints
{
  return self->_constraints;
}

- (CGSize)intrinsicContentSize
{
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v4 = v3;
  double v6 = v5;
  [(VTUIStyle *)self->_vtStyle proxTopPaddingVoiceSelectionOptions];
  double v8 = v6 + v7;
  [(VTUIStyle *)self->_vtStyle proxBottomPaddingVoiceSelectionOptions];
  double v10 = v8 + v9;
  [(VTUIStyle *)self->_vtStyle orbImageLength];
  double v12 = v10 + v11;
  [(VTUIStyle *)self->_vtStyle orbImageOffsetFromTopEnrollment];
  double v14 = v12 + v13;
  [(VTUIStyle *)self->_vtStyle titleOffsetFromOrb];
  double v16 = v14 + v15;
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  double v18 = v16 + v17;
  [(VTUIStyle *)self->_vtStyle proxPrimaryButtonHeight];
  double v20 = v18 + v19;
  vtStyle = self->_vtStyle;
  if (self->_allowsRandomVoiceSelection)
  {
    [(VTUIStyle *)vtStyle proxTrainingDismissButtonVerticalPaddingBottom];
    double v23 = v20 + v22;
    [(VTUIStyle *)self->_vtStyle proxChooseForMeTopPaddingFromContinueButton];
    double v25 = v23 + v24;
    [(UIButton *)self->_chooseRandomVoiceButton intrinsicContentSize];
    double v27 = v25 + v26;
  }
  else
  {
    [(VTUIStyle *)vtStyle proxPaddingFromBottom];
    double v27 = v20 + v28;
  }
  double v29 = v4;
  result.double height = v27;
  result.double width = v29;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_isHidingCompactBackgroundCardView)
  {
    v13.receiver = self;
    v13.super_class = (Class)VTUIVoiceSelectionProximityView;
    unsigned __int8 v10 = -[VTUIVoiceSelectionProximityView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
LABEL_6:
    BOOL v9 = v10;
    goto LABEL_7;
  }
  footerView = self->_footerView;
  -[VTUIVoiceSelectionProximityView convertPoint:toView:](self, "convertPoint:toView:", footerView, x, y);
  if (!-[UIView pointInside:withEvent:](footerView, "pointInside:withEvent:", v7))
  {
    contentView = self->_contentView;
    -[VTUIVoiceSelectionProximityView convertPoint:toView:](self, "convertPoint:toView:", contentView, x, y);
    unsigned __int8 v10 = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v7);
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIButton)chooseRandomVoiceButton
{
  return self->_chooseRandomVoiceButton;
}

- (void)setChooseRandomVoiceButton:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
}

@end