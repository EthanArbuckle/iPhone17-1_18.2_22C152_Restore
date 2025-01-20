@interface UIKBMultilingualSettingIntroductionView
+ (BOOL)shouldShowIntroductionForInputMode:(id)a3;
+ (id)displayDescription:(id)a3;
+ (id)displayTitle:(id)a3;
- (UIButton)continueButton;
- (UIButton)settingButton;
- (UIKBMultilingualSettingIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4;
- (UIKeyboardInputMode)inputMode;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)artworkView;
- (_UIBackdropView)backdropView;
- (int64_t)backdropStyleForRenderConfig:(id)a3;
- (void)_updateContainer;
- (void)continueButtonTapped;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setSettingButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)settingButtonTapped;
@end

@implementation UIKBMultilingualSettingIntroductionView

+ (BOOL)shouldShowIntroductionForInputMode:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl() && !+[UIKeyboardImpl isSplit])
  {
    v5 = +[UIKeyboard keyboardBundleIdentifier];
    if ([v5 isEqualToString:@"com.apple.purplebuddy"])
    {
      LOBYTE(v4) = 0;
LABEL_17:

      goto LABEL_18;
    }
    v6 = +[UIKeyboardImpl activeInstance];
    if ([v6 isMinimized])
    {
      LOBYTE(v4) = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [v6 keyboardStateManager];
    if (![v7 canShowPredictionBar])
    {
      LOBYTE(v4) = 0;
LABEL_15:

      goto LABEL_16;
    }
    v8 = [v7 textInputTraits];
    if (([v8 isSecureTextEntry] & 1) == 0)
    {
      unsigned int v9 = [v8 keyboardType];
      LOBYTE(v4) = 0;
      if (v9 <= 0xB && ((1 << v9) & 0x930) != 0 || v9 == 127) {
        goto LABEL_14;
      }
      v11 = [v3 languageWithRegion];
      int v12 = [v11 isEqualToString:@"ko_KR"];

      if (v12)
      {
        if (_os_feature_enabled_impl() && (UIKeyboardInputModeIsKoreanEnglishBilingual(v3) & 1) == 0)
        {
          LOBYTE(v4) = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1;
          goto LABEL_14;
        }
      }
      else
      {
        v13 = [v3 languageWithRegion];
        int v14 = [v13 isEqualToString:@"en_IN"];

        if (v14 && _os_feature_enabled_impl())
        {
          int v4 = [v3 isMultiscript] ^ 1;
          goto LABEL_14;
        }
      }
    }
    LOBYTE(v4) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v4) = 0;
LABEL_18:

  return v4;
}

+ (id)displayTitle:(id)a3
{
  id v3 = [a3 languageWithRegion];
  int v4 = [v3 isEqualToString:@"ko_KR"];

  if (v4) {
    v5 = @"Type Korean and English";
  }
  else {
    v5 = @"Type Multiple Languages";
  }
  v6 = _UILocalizedStringInSystemLanguage(v5, v5);
  return v6;
}

+ (id)displayDescription:(id)a3
{
  id v3 = [a3 languageWithRegion];
  int v4 = [v3 isEqualToString:@"ko_KR"];

  if (v4) {
    v5 = @"Type both Korean and English on the same keyboard";
  }
  else {
    v5 = @"Type English and two other languages on the same keyboard";
  }
  v6 = _UILocalizedStringInSystemLanguage(v5, v5);
  return v6;
}

- (UIKBMultilingualSettingIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v144[17] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v143.receiver = self;
  v143.super_class = (Class)UIKBMultilingualSettingIntroductionView;
  v10 = -[UIView initWithFrame:](&v143, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIKBMultilingualSettingIntroductionView *)v10 setInputMode:v9];
    [(UIView *)v11 setAutoresizingMask:18];
    int v12 = [(UIView *)v11 _inheritedRenderConfig];
    v13 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", [v12 backdropStyle]);
    [(UIKBMultilingualSettingIntroductionView *)v11 setBackdropView:v13];

    int v14 = [(UIKBMultilingualSettingIntroductionView *)v11 backdropView];
    [(UIView *)v11 addSubview:v14];

    uint64_t v15 = [(id)objc_opt_class() displayTitle:v9];
    uint64_t v16 = [(id)objc_opt_class() displayDescription:v9];
    uint64_t v17 = _UILocalizedStringInSystemLanguage(@"Set Up in Settings", @"Set Up in Settings");
    v142 = _UILocalizedStringInSystemLanguage(@"Continue without Setting Up", @"Continue without Setting Up");
    v140 = v12;
    id v141 = v9;
    if ([v12 lightKeyboard]) {
      +[UIColor blackColor];
    }
    else {
    uint64_t v18 = +[UIColor whiteColor];
    }
    v19 = [UILabel alloc];
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v24 = -[UILabel initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
    [(UIKBMultilingualSettingIntroductionView *)v11 setTitleLabel:v24];

    v25 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [v26 setTextColor:v18];

    v27 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [v27 setTextAlignment:1];

    v28 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [v28 setText:v15];

    v138 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:2 options:2];
    v139 = (void *)v15;
    [off_1E52D39B8 fontWithDescriptor:v138 size:0.0];
    v29 = v137 = (void *)v18;
    v30 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [v30 setFont:v29];

    v31 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    [(UIView *)v11 addSubview:v31];

    v32 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v20, v21, v22, v23);
    [(UIKBMultilingualSettingIntroductionView *)v11 setArtworkView:v32];

    v33 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = +[UIColor redColor];
    v35 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    [v35 setBackgroundColor:v34];

    v36 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    [(UIView *)v11 addSubview:v36];

    v37 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v20, v21, v22, v23);
    [(UIKBMultilingualSettingIntroductionView *)v11 setDescriptionLabel:v37];

    v38 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [v39 setTextColor:v18];

    v40 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [v40 setTextAlignment:1];

    v41 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    v96 = (void *)v16;
    [v41 setText:v16];

    v42 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
    v43 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [v43 setFont:v42];

    v44 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [v44 setNumberOfLines:0];

    v45 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    [(UIView *)v11 addSubview:v45];

    v46 = +[UIButtonConfiguration filledButtonConfiguration];
    [v46 setCornerStyle:3];
    v136 = v46;
    v98 = (void *)v17;
    [v46 setTitle:v17];
    v47 = +[UIButton buttonWithType:1];
    [(UIKBMultilingualSettingIntroductionView *)v11 setSettingButton:v47];

    v48 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    [v48 setTranslatesAutoresizingMaskIntoConstraints:0];

    v49 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    [v49 setConfiguration:v46];

    v50 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    [v50 addTarget:v11 action:sel_settingButtonTapped forControlEvents:64];

    v51 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    [(UIView *)v11 addSubview:v51];

    v52 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v20, v21, v22, v23);
    [(UIKBMultilingualSettingIntroductionView *)v11 setContinueButton:v52];

    v53 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

    v54 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    [v54 setTitle:v142 forState:0];

    v55 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v56 = +[UIColor linkColor];
    [v55 setTitleColor:v56 forState:0];

    v57 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v58 = +[UIColor linkColor];
    [v57 setTitleColor:v58 forState:0];

    v59 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    [v59 addTarget:v11 action:sel_continueButtonTapped forControlEvents:64];

    v60 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    [(UIView *)v11 addSubview:v60];

    v106 = (void *)MEMORY[0x1E4F5B268];
    v135 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    v134 = [v135 centerXAnchor];
    v133 = [(UIView *)v11 centerXAnchor];
    v132 = [v134 constraintEqualToAnchor:v133];
    v144[0] = v132;
    v131 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    v130 = [v131 widthAnchor];
    v129 = [(UIView *)v11 widthAnchor];
    v128 = [v130 constraintEqualToAnchor:v129 multiplier:0.7];
    v144[1] = v128;
    v127 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    v125 = [v127 topAnchor];
    v126 = [(UIKBMultilingualSettingIntroductionView *)v11 titleLabel];
    v124 = [v126 bottomAnchor];
    v123 = [v125 constraintEqualToAnchor:v124 constant:6.0];
    v144[2] = v123;
    v122 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    v121 = [v122 centerXAnchor];
    v120 = [(UIView *)v11 centerXAnchor];
    v119 = [v121 constraintEqualToAnchor:v120];
    v144[3] = v119;
    v118 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    v117 = [v118 widthAnchor];
    v116 = [(UIView *)v11 widthAnchor];
    v115 = [v117 constraintEqualToAnchor:v116 multiplier:0.7];
    v144[4] = v115;
    v114 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    v112 = [v114 topAnchor];
    v113 = [(UIKBMultilingualSettingIntroductionView *)v11 artworkView];
    v111 = [v113 bottomAnchor];
    v110 = [v112 constraintEqualToAnchor:v111 constant:6.0];
    v144[5] = v110;
    v109 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    v108 = [v109 centerXAnchor];
    v107 = [(UIView *)v11 centerXAnchor];
    v105 = [v108 constraintEqualToAnchor:v107];
    v144[6] = v105;
    v104 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    v103 = [v104 widthAnchor];
    v102 = [(UIView *)v11 widthAnchor];
    v101 = [v103 constraintEqualToAnchor:v102 multiplier:0.7];
    v144[7] = v101;
    v100 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    v97 = [v100 topAnchor];
    v99 = [(UIKBMultilingualSettingIntroductionView *)v11 descriptionLabel];
    v95 = [v99 bottomAnchor];
    v94 = [v97 constraintEqualToAnchor:v95 constant:36.0];
    v144[8] = v94;
    v93 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    v92 = [v93 centerXAnchor];
    v91 = [(UIView *)v11 centerXAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v144[9] = v90;
    v89 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    v88 = [v89 widthAnchor];
    v87 = [(UIView *)v11 widthAnchor];
    v86 = [v88 constraintEqualToAnchor:v87 multiplier:0.7];
    v144[10] = v86;
    v85 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    v84 = [v85 heightAnchor];
    v83 = [v84 constraintEqualToConstant:42.0];
    v144[11] = v83;
    v82 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v80 = [v82 topAnchor];
    v81 = [(UIKBMultilingualSettingIntroductionView *)v11 settingButton];
    v79 = [v81 bottomAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:36.0];
    v144[12] = v78;
    v77 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v76 = [v77 centerXAnchor];
    v75 = [(UIView *)v11 centerXAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v144[13] = v74;
    v73 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v72 = [v73 widthAnchor];
    v71 = [(UIView *)v11 widthAnchor];
    v61 = [v72 constraintEqualToAnchor:v71 multiplier:0.7];
    v144[14] = v61;
    v62 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v63 = [v62 heightAnchor];
    v64 = [v63 constraintEqualToConstant:21.0];
    v144[15] = v64;
    v65 = [(UIView *)v11 bottomAnchor];
    v66 = [(UIKBMultilingualSettingIntroductionView *)v11 continueButton];
    v67 = [v66 bottomAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:40.0];
    v144[16] = v68;
    v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:17];
    [v106 activateConstraints:v69];

    id v9 = v141;
  }

  return v11;
}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return [a3 backdropStyle];
}

- (void)settingButtonTapped
{
  v2 = +[UIKeyboardImpl activeInstance];
  [v2 dismissMultilingualSettingTip];

  id v3 = (void *)MEMORY[0x1E4FAE270];
  [v3 launchKeyboardSettings];
}

- (void)continueButtonTapped
{
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 dismissMultilingualSettingTip];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBMultilingualSettingIntroductionView;
  [(UIView *)&v3 layoutSubviews];
  [(UIKBMultilingualSettingIntroductionView *)self _updateContainer];
}

- (void)_updateContainer
{
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v3 = [(UIView *)self _rootInputWindowController];
  int v4 = [v3 _inputAccessoryView];

  v5 = [(UIView *)self _rootInputWindowController];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 _inputAccessoryView];
    goto LABEL_11;
  }
  v8 = [v5 _inputAssistantView];
  uint64_t v9 = [v8 superview];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = +[UIKeyboardImpl activeInstance];
    char v12 = [v11 _showsScribbleIconsInAssistantView];

    if ((v12 & 1) == 0)
    {
      v6 = [(UIView *)self _rootInputWindowController];
      v7 = [v6 _inputAssistantView];
      goto LABEL_11;
    }
  }
  else
  {
  }
  v13 = [(UIView *)self _rootInputWindowController];
  int v14 = [v13 _inputView];

  uint64_t v15 = [(UIView *)self _rootInputWindowController];
  v6 = v15;
  if (v14) {
    [v15 _inputView];
  }
  else {
  v7 = [v15 view];
  }
LABEL_11:
  uint64_t v16 = v7;
  id v40 = [v7 topAnchor];

  BOOL v17 = +[UIKeyboardImpl isFloating];
  uint64_t v18 = [(UIView *)self _rootInputWindowController];
  v19 = v18;
  if (v17)
  {
    double v20 = [v18 _inputView];

    +[UIKeyboardPopoverContainer contentInsets];
    double v22 = -fabs(v21);
    +[UIKeyboardPopoverContainer contentInsets];
    double v24 = fabs(v23);
    +[UIKeyboardPopoverContainer contentInsets];
    double v26 = -fabs(v25);
    +[UIKeyboardPopoverContainer contentInsets];
    double v28 = fabs(v27);
  }
  else
  {
    double v20 = [v18 view];

    double v26 = 0.0;
    double v22 = 0.0;
    double v24 = 0.0;
    double v28 = 0.0;
  }
  v29 = [(UIView *)self topAnchor];
  v30 = [v29 constraintEqualToAnchor:v40 constant:v22];
  [v30 setActive:1];

  v31 = [(UIView *)self bottomAnchor];
  v32 = [v20 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:v24];
  [v33 setActive:1];

  v34 = [(UIView *)self leftAnchor];
  v35 = [v20 leftAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:v26];
  [v36 setActive:1];

  v37 = [(UIView *)self rightAnchor];
  v38 = [v20 rightAnchor];
  v39 = [v37 constraintEqualToAnchor:v38 constant:v28];
  [v39 setActive:1];
}

- (UIKeyboardInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)settingButton
{
  return self->_settingButton;
}

- (void)setSettingButton:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_settingButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end