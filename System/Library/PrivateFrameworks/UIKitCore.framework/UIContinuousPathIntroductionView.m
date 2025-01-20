@interface UIContinuousPathIntroductionView
- (AVPlayerLayer)videoLayer;
- (NSArray)landscapeConstraints;
- (NSArray)portraitConstraints;
- (NSLayoutConstraint)videoHeight;
- (NSLayoutConstraint)videoWidth;
- (UIButton)landscapeButton;
- (UIContinuousPathIntroductionView)initWithKeyboardAppearance:(int64_t)a3;
- (UILabel)landscapeTextBody;
- (UIView)keyboardView;
- (UIView)textVideoContainer;
- (double)mediaLayoutWidthAdjustment;
- (id)_introductionMovieAssetURL;
- (id)mediaContents;
- (id)textBodyDescriptions;
- (id)textTitleDescriptions;
- (int64_t)textBodyMaxLines;
- (void)extraButtonTapAction;
- (void)removeFromSuperview;
- (void)setKeyboardView:(id)a3;
- (void)setLandscapeButton:(id)a3;
- (void)setLandscapeConstraints:(id)a3;
- (void)setLandscapeTextBody:(id)a3;
- (void)setPortraitConstraints:(id)a3;
- (void)setTextVideoContainer:(id)a3;
- (void)setVideoHeight:(id)a3;
- (void)setVideoLayer:(id)a3;
- (void)setVideoWidth:(id)a3;
- (void)setupConstraintData;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateVideoLayerWithNewVideo:(BOOL)a3;
@end

@implementation UIContinuousPathIntroductionView

- (UIContinuousPathIntroductionView)initWithKeyboardAppearance:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIContinuousPathIntroductionView;
  v3 = [(UIKBTutorialModalDisplay *)&v11 initWithKeyboardAppearance:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setAccessibilityIdentifier:@"UIContinuousPathIntroductionView"];
    v5 = +[UIColor labelColor];
    v6 = [(UIContinuousPathIntroductionView *)v4 landscapeTextBody];
    [v6 setTextColor:v5];

    v7 = +[UIKeyboard activeKeyboard];
    BOOL v8 = (unint64_t)([v7 interfaceOrientation] - 3) <= 1
      && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1;
    v9 = [(UIKBTutorialModalDisplay *)v4 button];
    [v9 setHidden:v8];
  }
  return v4;
}

- (void)setupConstraintData
{
  id v18 = +[UIKeyboard activeKeyboard];
  v3 = [v18 _rootInputWindowController];
  v4 = [v3 view];
  [v4 frame];
  double v6 = v5;

  [(UIKBTutorialModalDisplay *)self safeAreaInsets];
  if (v7 > 0.0)
  {
    BOOL v10 = 1;
  }
  else
  {
    BOOL v8 = [v3 view];
    [v8 safeAreaInsets];
    BOOL v10 = v9 > 0.0;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && +[UIKeyboardImpl isFloating])
  {
    self->_textMargin = 20.0;
    uint64_t v11 = 504;
    uint64_t v12 = 0x4018000000000000;
LABEL_15:
    *(Class *)((char *)&self->super.super.super.super.isa + v11) = (Class)v12;
LABEL_16:
    double v16 = 149.0;
    goto LABEL_25;
  }
  if ((unint64_t)([v18 interfaceOrientation] - 3) > 1
    || ([(UIView *)self traitCollection],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 verticalSizeClass],
        v13,
        v14 == 2))
  {
    uint64_t v11 = 496;
    self->_textMargin = 50.0;
    if (v10) {
      self->_paddingAdjust = 34.0;
    }
    if (v6 <= 320.0)
    {
      uint64_t v12 = 0x4034000000000000;
      goto LABEL_15;
    }
    if (v6 > 375.0)
    {
      BOOL v15 = !v10;
      double v16 = 164.0;
      double v17 = 207.0;
      goto LABEL_23;
    }
    BOOL v15 = !v10;
    double v16 = 155.0;
  }
  else
  {
    if (v6 <= 568.0) {
      goto LABEL_16;
    }
    if (v6 <= 667.0)
    {
      double v16 = 155.0;
      goto LABEL_25;
    }
    if (v6 > 812.0)
    {
      double v16 = 207.0;
      goto LABEL_25;
    }
    BOOL v15 = !v10;
    double v16 = 164.0;
  }
  double v17 = 202.0;
LABEL_23:
  if (!v15) {
    double v16 = v17;
  }
LABEL_25:
  self->_videoSize.width = v16;
  self->_videoSize.height = v16 * 0.6;
}

- (id)_introductionMovieAssetURL
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  v4 = _UIKitResourceBundlePath(@"Artwork.bundle");
  double v5 = [v3 bundleWithPath:v4];

  if ([(UIKBTutorialModalDisplay *)self appearance] == 1) {
    double v6 = @"UIKeyboardContinuousPathIntroductionDark";
  }
  else {
    double v6 = @"UIKeyboardContinuousPathIntroductionLight";
  }
  double v7 = [v5 URLForResource:v6 withExtension:@"mov"];

  return v7;
}

- (id)mediaContents
{
  v152[11] = *MEMORY[0x1E4F143B8];
  [(UIContinuousPathIntroductionView *)self setupConstraintData];
  if (!self->_textVideoContainer)
  {
    v3 = objc_alloc_init(UIView);
    textVideoContainer = self->_textVideoContainer;
    self->_textVideoContainer = v3;

    [(UIView *)self->_textVideoContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  if (!self->_keyboardView)
  {
    double v5 = [UIView alloc];
    double v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), self->_videoSize.width, self->_videoSize.height);
    keyboardView = self->_keyboardView;
    self->_keyboardView = v6;

    [(UIView *)self->_keyboardView setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v8 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.12];
    [(UIView *)self->_keyboardView setBackgroundColor:v8];

    double v9 = [(UIView *)self->_keyboardView layer];
    [v9 setCornerRadius:10.0];

    BOOL v10 = [(UIView *)self->_keyboardView layer];
    [v10 setMasksToBounds:1];

    uint64_t v11 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    [v11 addSubview:self->_keyboardView];

    uint64_t v12 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v13 = [v12 centerXAnchor];
    uint64_t v14 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    BOOL v15 = [v14 centerXAnchor];
    double v16 = [v13 constraintEqualToAnchor:v15 constant:0.0];
    [v16 setActive:1];

    double v17 = [(UIContinuousPathIntroductionView *)self videoWidth];

    if (!v17)
    {
      id v18 = [(UIContinuousPathIntroductionView *)self keyboardView];
      v19 = [v18 widthAnchor];
      v20 = [v19 constraintEqualToConstant:self->_videoSize.width];
      [(UIContinuousPathIntroductionView *)self setVideoWidth:v20];

      v21 = [(UIContinuousPathIntroductionView *)self videoWidth];
      [v21 setActive:1];
    }
    v22 = [(UIContinuousPathIntroductionView *)self videoHeight];

    if (!v22)
    {
      v23 = [(UIContinuousPathIntroductionView *)self keyboardView];
      v24 = [v23 heightAnchor];
      v25 = [v24 constraintEqualToConstant:self->_videoSize.height];
      [(UIContinuousPathIntroductionView *)self setVideoHeight:v25];

      v26 = [(UIContinuousPathIntroductionView *)self videoHeight];
      [v26 setActive:1];
    }
    v27 = [(UIContinuousPathIntroductionView *)self keyboardView];
    LODWORD(v28) = 1144750080;
    [v27 setContentHuggingPriority:1 forAxis:v28];
  }
  [(UIContinuousPathIntroductionView *)self updateVideoLayerWithNewVideo:1];
  v29 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];

  if (!v29)
  {
    v30 = objc_alloc_init(UILabel);
    landscapeTextBody = self->_landscapeTextBody;
    self->_landscapeTextBody = v30;

    [(UIView *)self->_landscapeTextBody setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = +[UIColor clearColor];
    [(UIView *)self->_landscapeTextBody setBackgroundColor:v32];

    v33 = [(UIKBTutorialModalDisplay *)self textBodyFont];
    [(UILabel *)self->_landscapeTextBody setFont:v33];

    [(UILabel *)self->_landscapeTextBody setNumberOfLines:4];
    [(UILabel *)self->_landscapeTextBody setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_landscapeTextBody setTextAlignment:4];
    v34 = _UILocalizedStringInSystemLanguage(@"Slide your finger across the letters to compose a word", @"Speed up your typing by sliding your finger across the letters to compose a word.");
    [(UILabel *)self->_landscapeTextBody setText:v34];

    v35 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    [v35 addSubview:self->_landscapeTextBody];
  }
  v36 = [(UIContinuousPathIntroductionView *)self landscapeButton];

  if (!v36)
  {
    v37 = +[UIButton buttonWithType:1];
    landscapeButton = self->_landscapeButton;
    self->_landscapeButton = v37;

    [(UIView *)self->_landscapeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v39 = self->_landscapeButton;
    v40 = [(UIKBTutorialModalDisplay *)self buttonTitle];
    [(UIButton *)v39 setTitle:v40 forState:0];

    v41 = self->_landscapeButton;
    v42 = +[UIColor systemBlueColor];
    [(UIButton *)v41 setTitleColor:v42 forState:0];

    v43 = [off_1E52D39B8 boldSystemFontOfSize:18.0];
    v44 = [(UIButton *)self->_landscapeButton titleLabel];
    [v44 setFont:v43];

    [(UIControl *)self->_landscapeButton addTarget:self action:sel_extraButtonTapAction forControlEvents:64];
    v45 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    [v45 addSubview:self->_landscapeButton];

    v46 = [(UIContinuousPathIntroductionView *)self landscapeButton];
    LODWORD(v47) = 1144766464;
    [v46 setContentCompressionResistancePriority:1 forAxis:v47];
  }
  v48 = [(UIContinuousPathIntroductionView *)self landscapeConstraints];

  if (!v48)
  {
    v49 = objc_alloc_init(UILayoutGuide);
    v50 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    [v50 addLayoutGuide:v49];

    v51 = objc_alloc_init(UILayoutGuide);
    v52 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    [v52 addLayoutGuide:v51];

    v146 = [(UILayoutGuide *)v49 topAnchor];
    v148 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v144 = [v148 topAnchor];
    v142 = [v146 constraintEqualToAnchor:v144];
    v152[0] = v142;
    v140 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
    v138 = [v140 topAnchor];
    v115 = v49;
    v136 = [(UILayoutGuide *)v49 bottomAnchor];
    v134 = [v138 constraintEqualToAnchor:v136];
    v152[1] = v134;
    v132 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
    v128 = [v132 leadingAnchor];
    v130 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v126 = [v130 trailingAnchor];
    v124 = [v128 constraintEqualToAnchor:v126 constant:24.0];
    v152[2] = v124;
    v123 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
    v121 = [v123 widthAnchor];
    v122 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v120 = [v122 widthAnchor];
    v119 = [v121 constraintEqualToAnchor:v120 multiplier:1.1];
    v152[3] = v119;
    v118 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v114 = [v118 centerYAnchor];
    v117 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v113 = [v117 centerYAnchor];
    v112 = [v114 constraintEqualToAnchor:v113 constant:0.0];
    v152[4] = v112;
    v111 = [(UIContinuousPathIntroductionView *)self landscapeButton];
    v109 = [v111 topAnchor];
    v110 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
    v108 = [v110 bottomAnchor];
    v107 = [v109 constraintEqualToAnchor:v108 constant:16.0];
    v152[5] = v107;
    v116 = v51;
    v105 = [(UILayoutGuide *)v51 topAnchor];
    v106 = [(UIContinuousPathIntroductionView *)self landscapeButton];
    v104 = [v106 bottomAnchor];
    v103 = [v105 constraintEqualToAnchor:v104];
    v152[6] = v103;
    v102 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v101 = [v102 bottomAnchor];
    v100 = [(UILayoutGuide *)v51 bottomAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v152[7] = v99;
    v98 = [(UILayoutGuide *)v51 heightAnchor];
    v97 = [(UILayoutGuide *)v49 heightAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v152[8] = v96;
    v95 = [(UIContinuousPathIntroductionView *)self landscapeButton];
    v94 = [v95 leadingAnchor];
    v53 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
    v54 = [v53 leadingAnchor];
    v55 = [v94 constraintEqualToAnchor:v54];
    v152[9] = v55;
    v56 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v57 = [v56 widthAnchor];
    v58 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v59 = [v58 widthAnchor];
    v60 = [v57 constraintEqualToAnchor:v59 multiplier:3.0];
    v152[10] = v60;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:11];
    [(UIContinuousPathIntroductionView *)self setLandscapeConstraints:v61];
  }
  v62 = [(UIContinuousPathIntroductionView *)self portraitConstraints];

  if (!v62)
  {
    v63 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v64 = [v63 topAnchor];
    v65 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v66 = [v65 topAnchor];
    v67 = [v64 constraintEqualToAnchor:v66 constant:self->_paddingAdjust];

    LODWORD(v68) = 1132068864;
    v149 = v67;
    [v67 setPriority:v68];
    v151[0] = v67;
    v147 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v143 = [v147 topAnchor];
    v145 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v141 = [v145 topAnchor];
    v139 = [v143 constraintLessThanOrEqualToAnchor:v141 constant:self->_paddingAdjust];
    v151[1] = v139;
    v137 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v133 = [v137 topAnchor];
    v135 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v131 = [v135 topAnchor];
    v129 = [v133 constraintGreaterThanOrEqualToAnchor:v131 constant:6.0];
    v151[2] = v129;
    v127 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v125 = [v127 bottomAnchor];
    v69 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v70 = [v69 bottomAnchor];
    v71 = [v125 constraintEqualToAnchor:v70];
    v151[3] = v71;
    v72 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
    v73 = [v72 widthAnchor];
    v74 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v75 = [v74 widthAnchor];
    v76 = [v73 constraintEqualToAnchor:v75];
    v151[4] = v76;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:5];
    [(UIContinuousPathIntroductionView *)self setPortraitConstraints:v77];
  }
  v78 = +[UIKeyboard activeKeyboard];
  if ((unint64_t)([v78 interfaceOrientation] - 3) > 1)
  {
  }
  else
  {
    unint64_t v79 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

    if (v79 != 1)
    {
      v80 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
      [v80 setHidden:0];

      v81 = [(UIContinuousPathIntroductionView *)self landscapeButton];
      [v81 setHidden:0];

      v82 = (void *)MEMORY[0x1E4F5B268];
      v83 = [(UIContinuousPathIntroductionView *)self portraitConstraints];
      [v82 deactivateConstraints:v83];

      v84 = (void *)MEMORY[0x1E4F5B268];
      uint64_t v85 = [(UIContinuousPathIntroductionView *)self landscapeConstraints];
      goto LABEL_22;
    }
  }
  v86 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
  [v86 setHidden:1];

  v87 = [(UIContinuousPathIntroductionView *)self landscapeButton];
  [v87 setHidden:1];

  v88 = (void *)MEMORY[0x1E4F5B268];
  v89 = [(UIContinuousPathIntroductionView *)self landscapeConstraints];
  [v88 deactivateConstraints:v89];

  v84 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v85 = [(UIContinuousPathIntroductionView *)self portraitConstraints];
LABEL_22:
  v90 = (void *)v85;
  [v84 activateConstraints:v85];

  v91 = [(UIContinuousPathIntroductionView *)self textVideoContainer];
  v150 = v91;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];

  return v92;
}

- (void)updateVideoLayerWithNewVideo:(BOOL)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v4 = (void *)_MergedGlobals_3;
    uint64_t v51 = _MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVAssetClass_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      __getAVAssetClass_block_invoke((uint64_t)&v43);
      v4 = (void *)v49[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v48, 8);
    double v6 = [(UIContinuousPathIntroductionView *)self _introductionMovieAssetURL];
    double v7 = [v5 assetWithURL:v6];

    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    BOOL v8 = (void *)qword_1EB25CAD0;
    uint64_t v51 = qword_1EB25CAD0;
    if (!qword_1EB25CAD0)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVPlayerItemClass_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      __getAVPlayerItemClass_block_invoke((uint64_t)&v43);
      BOOL v8 = (void *)v49[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v48, 8);
    BOOL v10 = [v9 playerItemWithAsset:v7];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    uint64_t v11 = (void *)qword_1EB25CAD8;
    uint64_t v51 = qword_1EB25CAD8;
    if (!qword_1EB25CAD8)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVQueuePlayerClass_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      __getAVQueuePlayerClass_block_invoke((uint64_t)&v43);
      uint64_t v11 = (void *)v49[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v48, 8);
    v52[0] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    uint64_t v14 = [v12 queuePlayerWithItems:v13];
    player = self->_player;
    self->_player = v14;

    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    double v16 = (void *)qword_1EB25CAE0;
    uint64_t v51 = qword_1EB25CAE0;
    if (!qword_1EB25CAE0)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVPlayerLooperClass_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      __getAVPlayerLooperClass_block_invoke((uint64_t)&v43);
      double v16 = (void *)v49[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v48, 8);
    id v18 = [v17 playerLooperWithPlayer:self->_player templateItem:v10];
    playerLooper = self->_playerLooper;
    self->_playerLooper = v18;

    [(AVQueuePlayer *)self->_player setPreventsDisplaySleepDuringVideoPlayback:0];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v20 = (void *)qword_1EB25CAE8;
    uint64_t v51 = qword_1EB25CAE8;
    if (!qword_1EB25CAE8)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVAudioSessionClass_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      __getAVAudioSessionClass_block_invoke((uint64_t)&v43);
      v20 = (void *)v49[3];
    }
    v21 = v20;
    _Block_object_dispose(&v48, 8);
    v22 = (void *)[[v21 alloc] initAuxiliarySession];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    v23 = (void *)qword_1EB25CAF0;
    uint64_t v51 = qword_1EB25CAF0;
    if (!qword_1EB25CAF0)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAVAudioSessionCategoryAmbientSymbolLoc_block_invoke;
      v46 = &unk_1E52D9900;
      double v47 = &v48;
      v24 = AVFoundationLibrary();
      v25 = dlsym(v24, "AVAudioSessionCategoryAmbient");
      *(void *)(v47[1] + 24) = v25;
      qword_1EB25CAF0 = *(void *)(v47[1] + 24);
      v23 = (void *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v23)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      v42 = [NSString stringWithUTF8String:"NSString *getAVAudioSessionCategoryAmbient(void)"];
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"UIContinuousPathIntroductionView.m", 28, @"%s", dlerror());

      __break(1u);
    }
    [v22 setCategory:*v23 error:0];
    [(AVQueuePlayer *)self->_player setAudioSession:v22];
    v26 = [(UIContinuousPathIntroductionView *)self videoLayer];

    if (v26)
    {
      v27 = [(UIContinuousPathIntroductionView *)self videoLayer];
      [v27 removeFromSuperlayer];
    }
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  double v28 = (void *)qword_1EB25CAF8;
  uint64_t v51 = qword_1EB25CAF8;
  if (!qword_1EB25CAF8)
  {
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __getAVPlayerLayerClass_block_invoke;
    v46 = &unk_1E52D9900;
    double v47 = &v48;
    __getAVPlayerLayerClass_block_invoke((uint64_t)&v43);
    double v28 = (void *)v49[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v48, 8);
  v30 = [v29 playerLayerWithPlayer:self->_player];
  [(UIContinuousPathIntroductionView *)self setVideoLayer:v30];

  v31 = [(UIContinuousPathIntroductionView *)self videoLayer];
  v32 = [v31 superlayer];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    v34 = [(UIContinuousPathIntroductionView *)self keyboardView];
    v35 = [v34 layer];
    v36 = [(UIContinuousPathIntroductionView *)self videoLayer];
    [v35 addSublayer:v36];
  }
  double width = self->_videoSize.width;
  double height = self->_videoSize.height;
  v39 = [(UIContinuousPathIntroductionView *)self videoLayer];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, width, height);

  p_player = &self->_player;
  [(AVQueuePlayer *)*p_player advanceToNextItem];
  [(AVQueuePlayer *)*p_player play];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v30 = a3;
  v4 = [(UIView *)self constraints];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(AVQueuePlayer *)self->_player pause];
    [(UIContinuousPathIntroductionView *)self setupConstraintData];
    double width = self->_videoSize.width;
    double v7 = [(UIContinuousPathIntroductionView *)self videoWidth];
    [v7 setConstant:width];

    double height = self->_videoSize.height;
    id v9 = [(UIContinuousPathIntroductionView *)self videoHeight];
    [v9 setConstant:height];

    BOOL v10 = [(UIContinuousPathIntroductionView *)self keyboardView];
    [v10 layoutIfNeeded];

    uint64_t v11 = [(UIView *)self traitCollection];
    uint64_t v12 = [v11 hasDifferentColorAppearanceComparedToTraitCollection:v30];

    if (v12)
    {
      v13 = [(UIView *)self traitCollection];
      if ([v13 userInterfaceStyle] == 2) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
      [(UIKBTutorialModalDisplay *)self setAppearance:v14];
    }
    else
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        || ([(UIView *)self traitCollection],
            BOOL v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 verticalSizeClass],
            v15,
            v16 != 1))
      {
        v24 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
        [v24 setHidden:1];

        v25 = [(UIContinuousPathIntroductionView *)self landscapeButton];
        [v25 setHidden:1];

        v26 = [(UIKBTutorialModalDisplay *)self button];
        [v26 setHidden:0];

        v27 = (void *)MEMORY[0x1E4F5B268];
        double v28 = [(UIContinuousPathIntroductionView *)self landscapeConstraints];
        [v27 deactivateConstraints:v28];

        v22 = (void *)MEMORY[0x1E4F5B268];
        uint64_t v23 = [(UIContinuousPathIntroductionView *)self portraitConstraints];
      }
      else
      {
        id v17 = [(UIContinuousPathIntroductionView *)self landscapeTextBody];
        [v17 setHidden:0];

        id v18 = [(UIContinuousPathIntroductionView *)self landscapeButton];
        [v18 setHidden:0];

        v19 = [(UIKBTutorialModalDisplay *)self button];
        [v19 setHidden:1];

        v20 = (void *)MEMORY[0x1E4F5B268];
        v21 = [(UIContinuousPathIntroductionView *)self portraitConstraints];
        [v20 deactivateConstraints:v21];

        v22 = (void *)MEMORY[0x1E4F5B268];
        uint64_t v23 = [(UIContinuousPathIntroductionView *)self landscapeConstraints];
      }
      id v29 = (void *)v23;
      [v22 activateConstraints:v23];

      [(UIKBTutorialModalDisplay *)self updateMediaViewTextAndPlacement];
    }
    [(UIContinuousPathIntroductionView *)self updateVideoLayerWithNewVideo:v12];
  }
}

- (id)textTitleDescriptions
{
  return &unk_1ED3EEF90;
}

- (id)textBodyDescriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(UIView *)self traitCollection];
  if ([v2 verticalSizeClass] == 1)
  {
    unint64_t v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

    if (v3 != 1)
    {
      v4 = &unk_1ED3EEFA8;
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v5 = _UILocalizedStringInSystemLanguage(@"Slide your finger across the letters to compose a word", @"Speed up your typing by sliding your finger across the letters to compose a word.");
  v7[0] = v5;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

LABEL_6:
  return v4;
}

- (double)mediaLayoutWidthAdjustment
{
  unint64_t v3 = [(UIView *)self traitCollection];
  if ([v3 verticalSizeClass] == 1)
  {
    unint64_t v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;

    if (v4 != 1) {
      return self->_videoSize.width + self->_videoSize.width;
    }
  }
  else
  {
  }
  if (+[UIKeyboardImpl isFloating]) {
    return -148.0;
  }
  else {
    return -(50.0 - self->_textMargin);
  }
}

- (int64_t)textBodyMaxLines
{
  return 3;
}

- (void)removeFromSuperview
{
  [(AVPlayerLooper *)self->_playerLooper disableLooping];
  [(AVQueuePlayer *)self->_player removeAllItems];
  v3.receiver = self;
  v3.super_class = (Class)UIContinuousPathIntroductionView;
  [(UIView *)&v3 removeFromSuperview];
}

- (void)extraButtonTapAction
{
  [(UIContinuousPathIntroductionView *)self removeFromSuperview];
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  objc_super v3 = [v2 preferencesActions];
  [v3 didTriggerOneTimeAction:*MEMORY[0x1E4FAE5E0]];

  unint64_t v4 = MEMORY[0x1E4F14428];
  dispatch_async(v4, &__block_literal_global);
}

void __56__UIContinuousPathIntroductionView_extraButtonTapAction__block_invoke()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 dismissContinuousPathIntroductionView];
}

- (UIView)textVideoContainer
{
  return self->_textVideoContainer;
}

- (void)setTextVideoContainer:(id)a3
{
}

- (UILabel)landscapeTextBody
{
  return self->_landscapeTextBody;
}

- (void)setLandscapeTextBody:(id)a3
{
}

- (UIView)keyboardView
{
  return self->_keyboardView;
}

- (void)setKeyboardView:(id)a3
{
}

- (UIButton)landscapeButton
{
  return self->_landscapeButton;
}

- (void)setLandscapeButton:(id)a3
{
}

- (NSArray)portraitConstraints
{
  return self->_portraitConstraints;
}

- (void)setPortraitConstraints:(id)a3
{
}

- (NSArray)landscapeConstraints
{
  return self->_landscapeConstraints;
}

- (void)setLandscapeConstraints:(id)a3
{
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setVideoLayer:(id)a3
{
}

- (NSLayoutConstraint)videoWidth
{
  return self->_videoWidth;
}

- (void)setVideoWidth:(id)a3
{
}

- (NSLayoutConstraint)videoHeight
{
  return self->_videoHeight;
}

- (void)setVideoHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoHeight, 0);
  objc_storeStrong((id *)&self->_videoWidth, 0);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_landscapeConstraints, 0);
  objc_storeStrong((id *)&self->_portraitConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeButton, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_landscapeTextBody, 0);
  objc_storeStrong((id *)&self->_textVideoContainer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
}

@end