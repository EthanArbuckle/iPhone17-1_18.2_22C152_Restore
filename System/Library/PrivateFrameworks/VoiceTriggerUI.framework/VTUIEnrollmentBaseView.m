@interface VTUIEnrollmentBaseView
- (BOOL)showPrivacyTextView;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (VTUIEnrollmentBaseView)initWithFrame:(CGRect)a3;
- (VTUIEnrollmentDelegate)enrollmentDelegate;
- (double)imageOffsetFromTop;
- (id)_createPrivacyTextView;
- (id)backdropView;
- (id)footerView;
- (int64_t)_backdropStyle;
- (void)_setupUI;
- (void)fadeInSubviews;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setContentView:(id)a3;
- (void)setEnrollmentDelegate:(id)a3;
- (void)setInstructionText:(id)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation VTUIEnrollmentBaseView

- (VTUIEnrollmentBaseView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentBaseView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollmentBaseView *)v3 _setupUI];
  }
  return v4;
}

- (void)_setupUI
{
  uint64_t v198 = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  v4 = [MEMORY[0x263F82438] sharedApplication];
  v5 = [v4 windows];
  objc_super v6 = [v5 lastObject];
  v7 = [v6 windowScene];
  unint64_t v8 = [v7 interfaceOrientation] - 3;

  if (v8 > 1) {
    [v3 horizontalPaddingPortrait];
  }
  else {
    [v3 horizontalPaddingLandscape];
  }
  double v10 = v9;
  v11 = [(VTUIEnrollmentBaseView *)self readableContentGuide];
  v12 = [v11 leftAnchor];
  v13 = [(VTUIEnrollmentBaseView *)self leftAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:v10];
  readableLeftAnchorConstraint = self->_readableLeftAnchorConstraint;
  self->_readableLeftAnchorConstraint = v14;

  v182 = v11;
  v16 = [v11 rightAnchor];
  v17 = [(VTUIEnrollmentBaseView *)self rightAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-v10];
  readableRightAnchorConstraint = self->_readableRightAnchorConstraint;
  self->_readableRightAnchorConstraint = v18;

  [(NSLayoutConstraint *)self->_readableLeftAnchorConstraint setActive:1];
  [(NSLayoutConstraint *)self->_readableRightAnchorConstraint setActive:1];
  v20 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
  scrollView = self->_scrollView;
  self->_scrollView = v20;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setAutoresizesSubviews:0];
  [(VTUIEnrollmentBaseView *)self addSubview:self->_scrollView];
  v22 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  scrollContainerView = self->_scrollContainerView;
  self->_scrollContainerView = v22;

  [(UIView *)self->_scrollContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_scrollContainerView setClipsToBounds:1];
  [(UIScrollView *)self->_scrollView addSubview:self->_scrollContainerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v25 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v26 = objc_alloc_init(MEMORY[0x263F32BB0]);
    int v25 = [v26 isOptedIn];
  }
  v27 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v193 = "-[VTUIEnrollmentBaseView _setupUI]";
    __int16 v194 = 1024;
    int v195 = isKindOfClass & 1;
    __int16 v196 = 1024;
    int v197 = v25;
    _os_log_impl(&dword_238878000, v27, OS_LOG_TYPE_DEFAULT, "%s Showing EnrollmentView. useWaveform: %d, useNewSiriIcon: %d", buf, 0x18u);
  }
  if (isKindOfClass)
  {
    uint64_t v28 = [MEMORY[0x263F827E8] systemImageNamed:@"waveform"];
    int v25 = 1;
  }
  else
  {
    uint64_t v28 = [v3 siriIconImage];
  }
  v176 = (void *)v28;
  v29 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v28];
  if (v25)
  {
    v30 = [MEMORY[0x263F825C8] systemBlueColor];
    [v29 setTintColor:v30];
  }
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  v175 = v29;
  objc_storeStrong((id *)&self->_iconImageView, v29);
  [(UIView *)self->_scrollContainerView addSubview:self->_iconImageView];
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v31;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v33 = [v3 instructionLabelFont];
  [(UILabel *)self->_titleLabel setFont:v33];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UIView *)self->_scrollContainerView addSubview:self->_titleLabel];
  v34 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v34;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  v36 = [v3 subtitleFont];
  [(UILabel *)self->_subtitleLabel setFont:v36];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UIView *)self->_scrollContainerView addSubview:self->_subtitleLabel];
  v37 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v37;

  [(UILabel *)self->_instructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_instructionLabel setTextAlignment:1];
  v39 = [v3 subtitleFont];
  [(UILabel *)self->_instructionLabel setFont:v39];

  [(UILabel *)self->_instructionLabel setNumberOfLines:0];
  [(UIView *)self->_scrollContainerView addSubview:self->_instructionLabel];
  v134 = (void *)MEMORY[0x263F08938];
  v160 = [(UIScrollView *)self->_scrollView topAnchor];
  v154 = [(VTUIEnrollmentBaseView *)self topAnchor];
  v150 = [v160 constraintEqualToAnchor:v154];
  v191[0] = v150;
  v147 = [(UIScrollView *)self->_scrollView leftAnchor];
  v144 = [(VTUIEnrollmentBaseView *)self leftAnchor];
  v142 = [v147 constraintEqualToAnchor:v144];
  v191[1] = v142;
  v140 = [(UIScrollView *)self->_scrollView rightAnchor];
  v138 = [(VTUIEnrollmentBaseView *)self rightAnchor];
  v137 = [v140 constraintEqualToAnchor:v138];
  v191[2] = v137;
  v136 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v135 = [(VTUIEnrollmentBaseView *)self bottomAnchor];
  v133 = [v136 constraintEqualToAnchor:v135];
  v191[3] = v133;
  v132 = [(UIView *)self->_scrollContainerView topAnchor];
  v131 = [(UIScrollView *)self->_scrollView topAnchor];
  v130 = [v132 constraintEqualToAnchor:v131];
  v191[4] = v130;
  v129 = [(UIView *)self->_scrollContainerView leftAnchor];
  v128 = [(UIScrollView *)self->_scrollView leftAnchor];
  v127 = [v129 constraintEqualToAnchor:v128];
  v191[5] = v127;
  v126 = [(UIView *)self->_scrollContainerView rightAnchor];
  [(UIScrollView *)self->_scrollView rightAnchor];
  v40 = v181 = v3;
  v41 = [v126 constraintEqualToAnchor:v40];
  v191[6] = v41;
  v42 = [(UIView *)self->_scrollContainerView widthAnchor];
  v43 = [(UIScrollView *)self->_scrollView widthAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v191[7] = v44;
  v45 = [(UIView *)self->_scrollContainerView bottomAnchor];
  v46 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v191[8] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v191 count:9];
  [v134 activateConstraints:v48];

  v148 = (void *)MEMORY[0x263F08938];
  v161 = [(UIImageView *)self->_iconImageView topAnchor];
  v155 = [(UIView *)self->_scrollContainerView topAnchor];
  [(VTUIEnrollmentBaseView *)self imageOffsetFromTop];
  v151 = objc_msgSend(v161, "constraintEqualToAnchor:constant:", v155);
  v190[0] = v151;
  v145 = [(UIImageView *)self->_iconImageView centerXAnchor];
  v49 = [(UIView *)self->_scrollContainerView centerXAnchor];
  v50 = [v145 constraintEqualToAnchor:v49];
  v190[1] = v50;
  v51 = [(UIImageView *)self->_iconImageView widthAnchor];
  [v181 orbImageLength];
  v52 = objc_msgSend(v51, "constraintEqualToConstant:");
  v190[2] = v52;
  v53 = [(UIImageView *)self->_iconImageView heightAnchor];
  [v181 orbImageLength];
  v54 = objc_msgSend(v53, "constraintEqualToConstant:");
  v190[3] = v54;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v190 count:4];
  [v148 activateConstraints:v55];

  v156 = (void *)MEMORY[0x263F08938];
  v162 = [(UILabel *)self->_titleLabel topAnchor];
  v56 = [(UIImageView *)self->_iconImageView bottomAnchor];
  [v181 titleOffsetFromOrbImage];
  v57 = objc_msgSend(v162, "constraintEqualToAnchor:constant:", v56);
  v189[0] = v57;
  v58 = [(UILabel *)self->_titleLabel widthAnchor];
  v59 = [v182 widthAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  v189[1] = v60;
  v61 = [(UILabel *)self->_titleLabel centerXAnchor];
  v62 = [(UIView *)self->_scrollContainerView centerXAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  v189[2] = v63;
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v189 count:3];
  [v156 activateConstraints:v64];

  v163 = (void *)MEMORY[0x263F08938];
  v167 = [(UILabel *)self->_subtitleLabel topAnchor];
  v177 = [(UILabel *)self->_titleLabel bottomAnchor];
  [v181 subtitle1BaselineOffset];
  v65 = objc_msgSend(v167, "constraintEqualToAnchor:constant:", v177);
  v188[0] = v65;
  v66 = [(UILabel *)self->_subtitleLabel widthAnchor];
  v67 = [v182 widthAnchor];
  v68 = [v66 constraintEqualToAnchor:v67];
  v188[1] = v68;
  v69 = [(UILabel *)self->_subtitleLabel centerXAnchor];
  v70 = [(UIView *)self->_scrollContainerView centerXAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  v188[2] = v71;
  v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v188 count:3];
  [v163 activateConstraints:v72];

  v157 = (void *)MEMORY[0x263F08938];
  v178 = [(UILabel *)self->_instructionLabel topAnchor];
  v171 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  [v181 subtitle2BaselineOffset];
  v168 = objc_msgSend(v178, "constraintEqualToAnchor:constant:", v171);
  v187[0] = v168;
  v164 = [(UILabel *)self->_instructionLabel widthAnchor];
  v73 = [v182 widthAnchor];
  v74 = [v164 constraintEqualToAnchor:v73];
  v187[1] = v74;
  v75 = [(UILabel *)self->_instructionLabel centerXAnchor];
  v76 = [(UIView *)self->_scrollContainerView centerXAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  v187[2] = v77;
  v78 = [(UILabel *)self->_instructionLabel bottomAnchor];
  v79 = [(UIView *)self->_scrollContainerView bottomAnchor];
  [v181 subtitle2BaselineOffset];
  v81 = [v78 constraintEqualToAnchor:v79 constant:-v80];
  v187[3] = v81;
  v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:4];
  [v157 activateConstraints:v82];

  v83 = [(VTUIEnrollmentBaseView *)self footerView];
  if ([(VTUIEnrollmentBaseView *)self showPrivacyTextView] || v83)
  {
    v84 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x263F82EB8]), "initWithPrivateStyle:", -[VTUIEnrollmentBaseView _backdropStyle](self, "_backdropStyle"));
    backdropView = self->_backdropView;
    self->_backdropView = v84;

    [(_UIBackdropView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VTUIEnrollmentBaseView *)self addSubview:self->_backdropView];
    if ([(VTUIEnrollmentBaseView *)self showPrivacyTextView])
    {
      v86 = [(VTUIEnrollmentBaseView *)self _createPrivacyTextView];
      privacyTextView = self->_privacyTextView;
      self->_privacyTextView = v86;

      [(VTUIEnrollmentBaseView *)self addSubview:self->_privacyTextView];
    }
    if (v83)
    {
      [(UITextView *)v83 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(VTUIEnrollmentBaseView *)self addSubview:v83];
    }
    v88 = self->_privacyTextView;
    if (!v88) {
      v88 = v83;
    }
    v89 = v88;
    v152 = (void *)MEMORY[0x263F08938];
    v179 = v89;
    v172 = [(UITextView *)v89 topAnchor];
    v169 = [(_UIBackdropView *)self->_backdropView topAnchor];
    v165 = [v172 constraintEqualToSystemSpacingBelowAnchor:v169 multiplier:1.0];
    v186[0] = v165;
    v158 = [(_UIBackdropView *)self->_backdropView leftAnchor];
    v90 = [(VTUIEnrollmentBaseView *)self leftAnchor];
    v91 = [v158 constraintEqualToAnchor:v90];
    v186[1] = v91;
    v92 = [(_UIBackdropView *)self->_backdropView rightAnchor];
    v93 = [(VTUIEnrollmentBaseView *)self rightAnchor];
    [v92 constraintEqualToAnchor:v93];
    v94 = v180 = v83;
    v186[2] = v94;
    v95 = [(_UIBackdropView *)self->_backdropView bottomAnchor];
    v96 = [(VTUIEnrollmentBaseView *)self bottomAnchor];
    v97 = [v95 constraintEqualToAnchor:v96];
    v186[3] = v97;
    v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:4];
    [v152 activateConstraints:v98];

    v83 = v180;
    v99 = self->_privacyTextView;
    v100 = (void *)MEMORY[0x263F08938];
    if (v99 && v180)
    {
      v153 = [(UITextView *)v99 leftAnchor];
      uint64_t v146 = [v182 leftAnchor];
      uint64_t v166 = [v153 constraintEqualToAnchor:v146];
      v185[0] = v166;
      v149 = [(UITextView *)self->_privacyTextView rightAnchor];
      uint64_t v159 = [v182 rightAnchor];
      uint64_t v141 = [v149 constraintEqualToAnchor:v159];
      v185[1] = v141;
      v143 = [(UITextView *)self->_privacyTextView bottomAnchor];
      v174 = [(UITextView *)v180 topAnchor];
      v173 = objc_msgSend(v143, "constraintEqualToAnchor:");
      v185[2] = v173;
      v101 = [(UITextView *)v180 leftAnchor];
      v102 = [v182 leftAnchor];
      v170 = v101;
      v139 = [v101 constraintEqualToAnchor:v102];
      v185[3] = v139;
      v103 = [(UITextView *)v180 rightAnchor];
      v104 = [v182 rightAnchor];
      v105 = [v103 constraintEqualToAnchor:v104];
      v185[4] = v105;
      v106 = [(UITextView *)v180 bottomAnchor];
      v107 = [(VTUIEnrollmentBaseView *)self safeAreaLayoutGuide];
      [v107 bottomAnchor];
      v109 = v108 = v100;
      v110 = [v106 constraintEqualToAnchor:v109];
      v185[5] = v110;
      v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:v185 count:6];
      v112 = v108;
      v113 = (void *)v141;
      [v112 activateConstraints:v111];

      v114 = (void *)v146;
      v115 = v153;

      v116 = v143;
      v83 = v180;

      v117 = v149;
      v118 = (void *)v166;

      v119 = (void *)v159;
    }
    else
    {
      if (v99)
      {
        v115 = [(UITextView *)v99 leftAnchor];
        v114 = [v182 leftAnchor];
        v118 = [v115 constraintEqualToAnchor:v114];
        v184[0] = v118;
        v117 = [(UITextView *)self->_privacyTextView rightAnchor];
        v119 = [v182 rightAnchor];
        v113 = [v117 constraintEqualToAnchor:v119];
        v184[1] = v113;
        uint64_t v120 = [(UITextView *)self->_privacyTextView bottomAnchor];
        v121 = self;
        v116 = (void *)v120;
        v174 = [(VTUIEnrollmentBaseView *)v121 safeAreaLayoutGuide];
        v173 = [v174 bottomAnchor];
        v170 = objc_msgSend(v116, "constraintEqualToAnchor:");
        v184[2] = v170;
        v122 = (void *)MEMORY[0x263EFF8C0];
        v123 = v184;
      }
      else
      {
        v115 = [(UITextView *)v180 leftAnchor];
        v114 = [v182 leftAnchor];
        v118 = [v115 constraintEqualToAnchor:v114];
        v183[0] = v118;
        v117 = [(UITextView *)v180 rightAnchor];
        v119 = [v182 rightAnchor];
        v113 = [v117 constraintEqualToAnchor:v119];
        v183[1] = v113;
        uint64_t v124 = [(UITextView *)v180 bottomAnchor];
        v125 = self;
        v116 = (void *)v124;
        v174 = [(VTUIEnrollmentBaseView *)v125 safeAreaLayoutGuide];
        v173 = [v174 bottomAnchor];
        v170 = objc_msgSend(v116, "constraintEqualToAnchor:");
        v183[2] = v170;
        v122 = (void *)MEMORY[0x263EFF8C0];
        v123 = v183;
      }
      v102 = [v122 arrayWithObjects:v123 count:3];
      [v100 activateConstraints:v102];
    }
  }
}

- (id)_createPrivacyTextView
{
  v26[1] = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  id v4 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v4, "setTextContainerInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  v5 = [v4 textContainer];
  [v5 setLineFragmentPadding:0.0];

  [v4 setDelegate:self];
  if ([v3 isGreenTeaCapableDevice]) {
    objc_super v6 = @"TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE";
  }
  else {
    objc_super v6 = @"TEXT_FOOTER_CONS";
  }
  v7 = [v3 VTUIDeviceSpecificString:v6];
  unint64_t v8 = [v3 VTUIDeviceSpecificString:@"BUTTON_CONS_ABOUT_SIRI"];
  double v9 = [MEMORY[0x263F81650] defaultParagraphStyle];
  double v10 = (void *)[v9 mutableCopy];

  [v10 setAlignment:1];
  id v11 = objc_alloc(MEMORY[0x263F089B8]);
  v12 = [NSString stringWithFormat:@"%@ %@", v7, v8];
  uint64_t v25 = *MEMORY[0x263F81540];
  v26[0] = v10;
  v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v14 = (void *)[v11 initWithString:v12 attributes:v13];

  if ([v8 length])
  {
    uint64_t v15 = [v7 length] + 1;
    uint64_t v16 = [v8 length];
    uint64_t v17 = *MEMORY[0x263F81500];
    v18 = [v3 footerTextColor];
    objc_msgSend(v14, "addAttribute:value:range:", v17, v18, 0, v15);

    v19 = [v3 buttonTextColor];
    objc_msgSend(v14, "addAttribute:value:range:", v17, v19, v15, v16);

    uint64_t v20 = *MEMORY[0x263F81520];
    v21 = [NSURL URLWithString:&stru_26EB8DDE0];
    objc_msgSend(v14, "addAttribute:value:range:", v20, v21, v15, v16);

    v22 = [v3 footerLabelFont];
    [v4 setFont:v22];

    v23 = [MEMORY[0x263F825C8] clearColor];
    [v4 setBackgroundColor:v23];

    [v4 setAttributedText:v14];
    [v4 setEditable:0];
    [v4 setScrollEnabled:0];
    [v4 setDataDetectorTypes:2];
    [v4 _setInteractiveTextSelectionDisabled:1];
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollmentBaseView;
  [(VTUIEnrollmentBaseView *)&v4 traitCollectionDidChange:a3];
  [(_UIBackdropView *)self->_backdropView transitionToPrivateStyle:[(VTUIEnrollmentBaseView *)self _backdropStyle]];
}

- (int64_t)_backdropStyle
{
  v2 = [(VTUIEnrollmentBaseView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    return 2030;
  }
  else {
    return 2020;
  }
}

- (void)setTitle:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setInstructionText:(id)a3
{
}

- (void)setContentView:(id)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  objc_super v4 = (UIView *)a3;
  [(UIView *)self->_contentView removeFromSuperview];
  [(UILabel *)self->_instructionLabel removeFromSuperview];
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = 0;

  v22 = [(VTUIEnrollmentBaseView *)self readableContentGuide];
  objc_super v6 = +[VTUIStyle sharedStyle];
  contentView = self->_contentView;
  self->_contentView = v4;
  v21 = v4;

  [(UIView *)self->_scrollContainerView addSubview:self->_contentView];
  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = (void *)MEMORY[0x263F08938];
  v24 = [(UIView *)self->_contentView topAnchor];
  v23 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  [v6 subtitle2BaselineOffset];
  uint64_t v20 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23);
  v25[0] = v20;
  v19 = [(UIView *)self->_contentView widthAnchor];
  unint64_t v8 = [v22 widthAnchor];
  double v9 = [v19 constraintEqualToAnchor:v8];
  v25[1] = v9;
  double v10 = [(UIView *)self->_contentView centerXAnchor];
  id v11 = [(UIView *)self->_scrollContainerView centerXAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v25[2] = v12;
  v13 = [(UIView *)self->_contentView bottomAnchor];
  v14 = [(UIView *)self->_scrollContainerView bottomAnchor];
  [v6 subtitle2BaselineOffset];
  uint64_t v16 = [v13 constraintEqualToAnchor:v14 constant:-v15];
  v25[3] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  [v18 activateConstraints:v17];
}

- (void)updateConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollmentBaseView;
  [(VTUIEnrollmentBaseView *)&v11 updateConstraints];
  uint64_t v3 = +[VTUIStyle sharedStyle];
  objc_super v4 = [MEMORY[0x263F82438] sharedApplication];
  v5 = [v4 windows];
  objc_super v6 = [v5 lastObject];
  v7 = [v6 windowScene];
  unint64_t v8 = [v7 interfaceOrientation] - 3;

  if (v8 > 1) {
    [v3 horizontalPaddingPortrait];
  }
  else {
    [v3 horizontalPaddingLandscape];
  }
  double v10 = v9;
  -[NSLayoutConstraint setConstant:](self->_readableLeftAnchorConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_readableRightAnchorConstraint setConstant:-v10];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentBaseView;
  [(VTUIEnrollmentBaseView *)&v3 safeAreaInsetsDidChange];
  [(VTUIEnrollmentBaseView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollmentBaseView;
  [(VTUIEnrollmentBaseView *)&v4 layoutSubviews];
  backdropView = self->_backdropView;
  if (backdropView)
  {
    [(_UIBackdropView *)backdropView frame];
    [(VTUIEnrollmentBaseView *)self layoutMargins];
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    [(UIScrollView *)self->_scrollView verticalScrollIndicatorInsets];
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
  }
}

- (void)fadeInSubviews
{
  [(UILabel *)self->_titleLabel setAlpha:0.0];
  [(UILabel *)self->_subtitleLabel setAlpha:0.0];
  [(UILabel *)self->_instructionLabel setAlpha:0.0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke;
  v5[3] = &unk_264D4C280;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v5 options:0 animations:0.400000006 completion:0.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_2;
  v4[3] = &unk_264D4C280;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 options:0 animations:0.400000006 completion:0.300000012];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_3;
  v3[3] = &unk_264D4C280;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v3 options:0 animations:0.400000006 completion:0.600000024];
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
}

- (id)backdropView
{
  return self->_backdropView;
}

- (BOOL)showPrivacyTextView
{
  return 0;
}

- (id)footerView
{
  return 0;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
}

- (double)imageOffsetFromTop
{
  v2 = +[VTUIStyle sharedStyle];
  [v2 orbImageOffsetFromTopEnrollment];
  double v4 = v3;

  return v4;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrollmentDelegate);
  objc_storeStrong((id *)&self->_readableRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_readableLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_privacyTextView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollContainerView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end