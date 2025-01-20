@interface VTUIProximityEnrollTrainingView
- (NSArray)viewConstraints;
- (SUICOrbView)orbView;
- (UIButton)dismissButton;
- (UIButton)skipButton;
- (UILabel)instructionPreludeLabel;
- (UILabel)pageLabel;
- (UILabel)statusLabel;
- (UIStackView)instructionStackView;
- (UIView)containerView;
- (VTUICheckMarkView)checkMark;
- (VTUIPagedLabel)instructionPagedLabel;
- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3;
- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3 forEnrollmentStyle:(int64_t)a4;
- (int64_t)enrollmentStyle;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupContent;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setCheckMark:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setEnrollmentStyle:(int64_t)a3;
- (void)setInstructionPagedLabel:(id)a3;
- (void)setInstructionPreludeLabel:(id)a3;
- (void)setInstructionStackView:(id)a3;
- (void)setOrbView:(id)a3;
- (void)setPageLabel:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setViewConstraints:(id)a3;
@end

@implementation VTUIProximityEnrollTrainingView

- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3 forEnrollmentStyle:(int64_t)a4
{
  self->_enrollmentStyle = a4;
  v5 = -[VTUIProximityEnrollTrainingView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (a4 == 1)
  {
    v6 = +[VTUIStyle sharedStyle];
    skipButton = v5->_skipButton;
    v8 = [v6 VTUIDeviceSpecificString:@"BUTTON_DONT_RECOGNIZE_VOICE"];
    [(UIButton *)skipButton setTitle:v8 forState:0];
  }
  return v5;
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)VTUIProximityEnrollTrainingView;
  [(VTUIProximityEnrollTrainingView *)&v7 didMoveToWindow];
  if (self->_enrollmentStyle == 1)
  {
    containerView = self->_containerView;
    v4 = [(VTUIProximityEnrollTrainingView *)self tintColor];
    [(UIView *)containerView setTintColor:v4];

    skipButton = self->_skipButton;
    v6 = [(VTUIProximityEnrollTrainingView *)self tintColor];
    [(UIButton *)skipButton setTitleColor:v6 forState:0];
  }
}

- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityEnrollTrainingView;
  v5 = -[VTUIProximityEnrollTrainingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = +[VTUIStyle sharedStyle];
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    uint64_t v8 = [MEMORY[0x263F85AF0] sharedPreferences];
    vtPrefs = v5->_vtPrefs;
    v5->_vtPrefs = (VTPreferences *)v8;

    [(VTUIProximityEnrollTrainingView *)v5 _setupContent];
    -[VTUIProximityEnrollTrainingView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)dealloc
{
  [(SUICOrbView *)self->_orbView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VTUIProximityEnrollTrainingView;
  [(VTUIProximityEnrollTrainingView *)&v3 dealloc];
}

- (void)_setupContent
{
  id v47 = +[VTUIStyle sharedStyle];
  objc_super v3 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = &v3->super;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityEnrollTrainingView *)self addSubview:self->_containerView];
  id v5 = objc_alloc(MEMORY[0x263F82BF8]);
  uint64_t v6 = (UIStackView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  instructionStackView = self->_instructionStackView;
  self->_instructionStackView = v6;

  [(UIStackView *)self->_instructionStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_instructionStackView setAxis:1];
  [(UIStackView *)self->_instructionStackView setSpacing:28.0];
  [(UIView *)self->_containerView addSubview:self->_instructionStackView];
  uint64_t v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  instructionPreludeLabel = self->_instructionPreludeLabel;
  self->_instructionPreludeLabel = v8;

  [(UILabel *)self->_instructionPreludeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_instructionPreludeLabel setTextAlignment:1];
  v10 = [v47 proxInstructionPreAndPostfixFont];
  [(UILabel *)self->_instructionPreludeLabel setFont:v10];

  [(UILabel *)self->_instructionPreludeLabel setNumberOfLines:4];
  objc_super v11 = +[VTUIStringsHelper sharedStringsHelper];
  v12 = [v11 uiLocalizedStringForKey:@"TEXT_LABEL_SAY"];
  [(UILabel *)self->_instructionPreludeLabel setText:v12];

  [(UIStackView *)self->_instructionStackView addArrangedSubview:self->_instructionPreludeLabel];
  [(UIStackView *)self->_instructionStackView setCustomSpacing:self->_instructionPreludeLabel afterView:10.0];
  int64_t enrollmentStyle = self->_enrollmentStyle;
  v14 = [VTUIPagedLabel alloc];
  [(VTUIProximityEnrollTrainingView *)self frame];
  v15 = -[VTUIPagedLabel initWithFrame:isProximity:forEnrollmentStyle:](v14, "initWithFrame:isProximity:forEnrollmentStyle:", 1, enrollmentStyle == 1);
  instructionPagedLabel = self->_instructionPagedLabel;
  self->_instructionPagedLabel = v15;

  [(VTUIPagedLabel *)self->_instructionPagedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_instructionStackView addArrangedSubview:self->_instructionPagedLabel];
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v17;

  [(UILabel *)self->_statusLabel setNumberOfLines:4];
  [(UILabel *)self->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = self->_statusLabel;
  v20 = [v47 proxInstructionFont];
  [(UILabel *)v19 setFont:v20];

  v21 = self->_statusLabel;
  v22 = [v47 proxInstructionColor];
  [(UILabel *)v21 setTextColor:v22];

  [(UILabel *)self->_statusLabel setTextAlignment:1];
  [(UIView *)self->_containerView addSubview:self->_statusLabel];
  v23 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  pageLabel = self->_pageLabel;
  self->_pageLabel = v23;

  [(UILabel *)self->_pageLabel setNumberOfLines:1];
  [(UILabel *)self->_pageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = self->_pageLabel;
  if (self->_enrollmentStyle == 1) {
    [v47 PRXpageFont];
  }
  else {
  v26 = [v47 proxPageFont];
  }
  [(UILabel *)v25 setFont:v26];

  v27 = self->_pageLabel;
  v28 = [v47 proxPageLabelColor];
  [(UILabel *)v27 setTextColor:v28];

  [(UILabel *)self->_pageLabel setTextAlignment:1];
  [(UIView *)self->_containerView addSubview:self->_pageLabel];
  v29 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  skipButton = self->_skipButton;
  self->_skipButton = v29;

  int64_t v31 = self->_enrollmentStyle;
  v32 = [(UIButton *)self->_skipButton titleLabel];
  vtStyle = self->_vtStyle;
  if (v31 == 1) {
    [(VTUIStyle *)vtStyle PRXcancelFont];
  }
  else {
  v34 = [(VTUIStyle *)vtStyle proxCancelFont];
  }
  [v32 setFont:v34];

  v35 = self->_skipButton;
  v36 = [v47 VTUIDeviceSpecificString:@"BUTTON_SET_UP_LATER"];
  [(UIButton *)v35 setTitle:v36 forState:0];

  [(UIButton *)self->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_skipButton setClipsToBounds:0];
  [(UIView *)self->_containerView addSubview:self->_skipButton];
  v37 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v37;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_dismissButton];
  id v39 = objc_alloc(MEMORY[0x263F75438]);
  [(VTUIStyle *)self->_vtStyle orbLength];
  double v41 = v40;
  [(VTUIStyle *)self->_vtStyle orbLength];
  v43 = (SUICOrbView *)objc_msgSend(v39, "initWithFrame:", 0.0, 0.0, v41, v42);
  orbView = self->_orbView;
  self->_orbView = v43;

  [(SUICOrbView *)self->_orbView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_orbView];
  v45 = objc_alloc_init(VTUICheckMarkView);
  checkMark = self->_checkMark;
  self->_checkMark = v45;

  [(VTUICheckMarkView *)self->_checkMark setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_checkMark];
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v144[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(VTUIProximityEnrollTrainingView *)self safeAreaLayoutGuide];
  v131 = [(UIView *)self->_containerView safeAreaLayoutGuide];
  BOOL v126 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  objc_super v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = +[MGWrapper sharedMGWrapper];
  char v9 = [v8 isDeviceIPad];

  containerView = self->_containerView;
  v132 = v7;
  v125 = v6;
  if (v9)
  {
    objc_super v11 = [(UIView *)containerView centerYAnchor];
    v12 = [v6 centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v144[0] = v13;
    v14 = [(UIView *)self->_containerView centerXAnchor];
    v15 = [v6 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v144[1] = v16;
    v17 = [(UIView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    v18 = objc_msgSend(v17, "constraintEqualToConstant:");
    v144[2] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:3];
    [v132 addObjectsFromArray:v19];

    objc_super v7 = v132;
    if (!v126) {
      goto LABEL_8;
    }
LABEL_6:
    [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
    goto LABEL_9;
  }
  v20 = [(UIView *)containerView bottomAnchor];
  v21 = [(VTUIProximityEnrollTrainingView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v23 = [v20 constraintEqualToAnchor:v21 constant:-v22];
  v143 = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v143 count:1];
  [v7 addObjectsFromArray:v24];

  v25 = self->_containerView;
  if (v126)
  {
    v26 = [(UIView *)v25 centerXAnchor];
    v27 = [v6 centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v142[0] = v28;
    v29 = [(UIView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
    v30 = objc_msgSend(v29, "constraintEqualToConstant:");
    v142[1] = v30;
    int64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:2];
    [v7 addObjectsFromArray:v31];

    goto LABEL_6;
  }
  v33 = [(UIView *)v25 leadingAnchor];
  v34 = [v6 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v141[0] = v35;
  v36 = [(UIView *)self->_containerView trailingAnchor];
  v37 = [v6 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  id v39 = [v36 constraintEqualToAnchor:v37 constant:-v38];
  v141[1] = v39;
  double v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
  [v7 addObjectsFromArray:v40];

LABEL_8:
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
LABEL_9:
  double v41 = v32;
  double v42 = [(UIView *)self->_containerView heightAnchor];
  uint64_t v43 = [v42 constraintEqualToConstant:v41];

  v124 = (void *)v43;
  [v7 addObject:v43];
  v121 = [(SUICOrbView *)self->_orbView widthAnchor];
  [(VTUIStyle *)self->_vtStyle orbLength];
  v120 = objc_msgSend(v121, "constraintEqualToConstant:");
  v140[0] = v120;
  v119 = [(SUICOrbView *)self->_orbView heightAnchor];
  [(VTUIStyle *)self->_vtStyle orbLength];
  v44 = objc_msgSend(v119, "constraintEqualToConstant:");
  v140[1] = v44;
  v45 = [(SUICOrbView *)self->_orbView centerXAnchor];
  v46 = [v131 centerXAnchor];
  id v47 = [v45 constraintEqualToAnchor:v46];
  v140[2] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
  [v7 addObjectsFromArray:v48];

  v49 = [(SUICOrbView *)self->_orbView topAnchor];
  v50 = [v131 topAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v132 addObject:v51];

  vtStyle = self->_vtStyle;
  if (v126)
  {
    [(VTUIStyle *)vtStyle proxPaddingTrainingTitleLandscape];
    double v54 = v53;
    [(VTUIStyle *)self->_vtStyle proxLeadingLandscape];
    double v56 = v55;
    [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
  }
  else
  {
    [(VTUIStyle *)vtStyle proxPaddingTrainingTitle];
    double v54 = v58;
    [(VTUIStyle *)self->_vtStyle proxLeading];
    double v56 = v59;
    [(VTUIStyle *)self->_vtStyle proxTrailing];
  }
  double v60 = v57;
  v61 = [(UIStackView *)self->_instructionStackView topAnchor];
  v62 = [(SUICOrbView *)self->_orbView bottomAnchor];
  v63 = [v61 constraintEqualToAnchor:v62 constant:v54];
  [v132 addObject:v63];

  v127 = [(UIStackView *)self->_instructionStackView heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxStatusLabelMaxHeight];
  v122 = objc_msgSend(v127, "constraintEqualToConstant:");
  v139[0] = v122;
  v64 = [(UIStackView *)self->_instructionStackView leadingAnchor];
  v65 = [v131 leadingAnchor];
  v66 = [v64 constraintEqualToAnchor:v65 constant:v56];
  v139[1] = v66;
  v67 = [(UIStackView *)self->_instructionStackView trailingAnchor];
  v68 = [v131 trailingAnchor];
  v69 = [v67 constraintEqualToAnchor:v68 constant:-v60];
  v139[2] = v69;
  v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:3];
  [v132 addObjectsFromArray:v70];

  v71 = [(UIButton *)self->_skipButton firstBaselineAnchor];
  v72 = [(UIView *)self->_containerView bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingBottom];
  v74 = [v71 constraintEqualToAnchor:v72 constant:-v73];
  v138[0] = v74;
  v75 = [(UIButton *)self->_skipButton centerXAnchor];
  v76 = [v131 centerXAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  v138[1] = v77;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  [v132 addObjectsFromArray:v78];

  v79 = [(UIButton *)self->_dismissButton centerYAnchor];
  v80 = [v131 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v81 = v79;
  v82 = objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80);
  v137[0] = v82;
  v83 = [(UIButton *)self->_dismissButton centerXAnchor];
  v84 = [v131 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v85 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84);
  v137[1] = v85;
  v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:2];
  [v132 addObjectsFromArray:v86];

  v87 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v88 = objc_msgSend(v87, "constraintEqualToConstant:");
  v136[0] = v88;
  v89 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v90 = objc_msgSend(v89, "constraintEqualToConstant:");
  v136[1] = v90;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:2];
  [v132 addObjectsFromArray:v91];

  v129 = [(UILabel *)self->_statusLabel centerYAnchor];
  v123 = [v131 centerYAnchor];
  [(VTUIStyle *)self->_vtStyle statusLabelVerticalOffsetFromCenter];
  v92 = objc_msgSend(v129, "constraintEqualToAnchor:constant:", v123);
  v135[0] = v92;
  v93 = [(UILabel *)self->_statusLabel leadingAnchor];
  v94 = [v131 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v95 = objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94);
  v135[1] = v95;
  v96 = [(UILabel *)self->_statusLabel trailingAnchor];
  v97 = [v131 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v99 = [v96 constraintEqualToAnchor:v97 constant:-v98];
  v135[2] = v99;
  v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:3];
  [v132 addObjectsFromArray:v100];

  v130 = [(UIButton *)self->_skipButton firstBaselineAnchor];
  v128 = [(UILabel *)self->_pageLabel firstBaselineAnchor];
  [(VTUIStyle *)self->_vtStyle proxPaddingSkipButtonPageLabel];
  v101 = objc_msgSend(v130, "constraintEqualToAnchor:constant:", v128);
  v134[0] = v101;
  v102 = [(UILabel *)self->_pageLabel leadingAnchor];
  v103 = [v131 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxLeading];
  v104 = objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103);
  v134[1] = v104;
  v105 = [(UILabel *)self->_pageLabel trailingAnchor];
  v106 = [v131 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrailing];
  v108 = [v105 constraintEqualToAnchor:v106 constant:-v107];
  v134[2] = v108;
  v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:3];
  [v132 addObjectsFromArray:v109];

  v110 = [(VTUICheckMarkView *)self->_checkMark centerYAnchor];
  v111 = [(SUICOrbView *)self->_orbView centerYAnchor];
  v112 = [v110 constraintEqualToAnchor:v111];
  v133[0] = v112;
  v113 = [(VTUICheckMarkView *)self->_checkMark centerXAnchor];
  v114 = [(SUICOrbView *)self->_orbView centerXAnchor];
  v115 = [v113 constraintEqualToAnchor:v114];
  v133[1] = v115;
  v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:2];
  [v132 addObjectsFromArray:v116];

  [MEMORY[0x263F08938] activateConstraints:v132];
  v117 = [MEMORY[0x263EFF8C0] arrayWithArray:v132];
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v117;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (VTUICheckMarkView)checkMark
{
  return self->_checkMark;
}

- (void)setCheckMark:(id)a3
{
}

- (VTUIPagedLabel)instructionPagedLabel
{
  return self->_instructionPagedLabel;
}

- (void)setInstructionPagedLabel:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
}

- (SUICOrbView)orbView
{
  return self->_orbView;
}

- (void)setOrbView:(id)a3
{
}

- (UILabel)instructionPreludeLabel
{
  return self->_instructionPreludeLabel;
}

- (void)setInstructionPreludeLabel:(id)a3
{
}

- (UIStackView)instructionStackView
{
  return self->_instructionStackView;
}

- (void)setInstructionStackView:(id)a3
{
}

- (int64_t)enrollmentStyle
{
  return self->_enrollmentStyle;
}

- (void)setEnrollmentStyle:(int64_t)a3
{
  self->_int64_t enrollmentStyle = a3;
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
  objc_storeStrong((id *)&self->_instructionStackView, 0);
  objc_storeStrong((id *)&self->_instructionPreludeLabel, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_checkMark, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_vtPrefs, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
}

@end