@interface UIKBMultilingualKeyboardIntroductionView
+ (BOOL)shouldShowIntroductionForInputMode:(id)a3;
+ (id)displayArtwork:(id)a3;
+ (id)displayDescription:(id)a3;
+ (id)displayTitle:(id)a3;
- (TUIPredictionView)predictionView;
- (UIButton)continueButton;
- (UIKBMultilingualIntroductionArrowView)arrowView;
- (UIKBMultilingualKeyboardIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4;
- (UIKeyboardInputMode)inputMode;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIMultiscriptCandidateView)multiscriptCandidateView;
- (UIView)artworkView;
- (UIView)highlight;
- (_UIBackdropView)backdropView;
- (int64_t)backdropStyleForRenderConfig:(id)a3;
- (void)_updateContainer;
- (void)_updatePath;
- (void)continueButtonTapped;
- (void)layoutSubviews;
- (void)setArrowView:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setMultiscriptCandidateView:(id)a3;
- (void)setPredictionView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation UIKBMultilingualKeyboardIntroductionView

+ (BOOL)shouldShowIntroductionForInputMode:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboard keyboardBundleIdentifier];
  if (([v4 isEqualToString:@"com.apple.purplebuddy"] & 1) != 0
    || +[UIKeyboardImpl isSplit])
  {
    char v5 = 0;
  }
  else
  {
    v6 = +[UIKeyboardImpl activeInstance];
    if (([v6 isMinimized] & 1) != 0
      || (+[UIKeyboardImpl activeInstance],
          v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isPredictionViewControllerVisible],
          v7,
          !v8))
    {
      char v5 = 0;
    }
    else
    {
      v9 = [v6 keyboardStateManager];
      v10 = [v9 textInputTraits];
      if ([v10 isSecureTextEntry])
      {
        char v5 = 0;
      }
      else
      {
        unsigned int v11 = [v10 keyboardType];
        char v5 = 0;
        if ((v11 > 0xB || ((1 << v11) & 0x930) == 0) && v11 != 127)
        {
          if (_os_feature_enabled_impl())
          {
            v12 = [v3 multilingualSet];
            BOOL v13 = (unint64_t)[v12 count] > 1;
          }
          else
          {
            BOOL v13 = 0;
          }
          int v14 = _os_feature_enabled_impl();
          if (v14) {
            LOBYTE(v14) = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);
          }
          char v5 = v13 | v14;
        }
      }
    }
  }

  return v5;
}

+ (id)displayTitle:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);
  char v5 = [v3 identifier];

  if (IsKoreanEnglishBilingual)
  {
    v13[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v6 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
  }
  int v8 = +[UIKeyboardInputMode _displayNameForMultilingualSet:v6 forDisplayInLists:0 usingDeviceLanguage:1 context:5];
  v9 = NSString;
  v10 = _UILocalizedStringInSystemLanguage(@"Type %@", @"Type %@");
  unsigned int v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

  return v11;
}

+ (id)displayDescription:(id)a3
{
  id v3 = a3;
  v4 = [v3 multilingualSet];
  if ([v4 count] == 2)
  {

LABEL_4:
    v6 = NSString;
    v7 = @"Type both languages on the same keyboard. Customize in Settings.";
LABEL_5:
    int v8 = _UILocalizedStringInSystemLanguage(v7, v7);
    v9 = [v6 stringWithFormat:v8];

    goto LABEL_6;
  }
  char IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v3);

  if (IsKoreanEnglishBilingual) {
    goto LABEL_4;
  }
  if ([v3 isMultiscript])
  {
    unsigned int v11 = [v3 multilingualSet];
    uint64_t v12 = [v11 count];

    if (v12 != 5)
    {
      v6 = NSString;
      v7 = @"Type both languages on the same keyboard.\nTap to switch scripts.";
      goto LABEL_5;
    }
    _UILocalizedStringInSystemLanguage(@"All on the same keyboard.\nTap to switch scripts.", @"All on the same keyboard.\nTap to switch scripts.");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      int v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Invalid Multilingual Configuration for Education UI", buf, 2u);
      }
    }
    else
    {
      BOOL v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &displayDescription____s_category) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Invalid Multilingual Configuration for Education UI", v15, 2u);
      }
    }
    v9 = &stru_1ED0E84C0;
  }
LABEL_6:

  return v9;
}

+ (id)displayArtwork:(id)a3
{
  id v3 = a3;
  if ([v3 isMultiscript])
  {
    v4 = [v3 multiscriptSet];
    unint64_t v5 = [v4 count];
    if (v5 <= 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    v7 = [v4 objectAtIndexedSubscript:v5 > 2];
    int v8 = [v7 languageWithRegion];

    v9 = [v4 objectAtIndexedSubscript:v6];
    v10 = [v9 languageWithRegion];

    unsigned int v11 = [[UIKBMultilingualKeyboardArtworkView alloc] initWithLanguage1:v8 andLanguage2:v10];
  }
  else
  {
    uint64_t v12 = [v3 multilingualSet];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      int v14 = [v3 multilingualSet];
      uint64_t v15 = [v14 count];

      if (v15 != 2)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v28 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "bilingual keyboard is only supported", buf, 2u);
          }
        }
        else
        {
          v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &displayArtwork____s_category) + 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v29 = 0;
            _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "bilingual keyboard is only supported", v29, 2u);
          }
        }
      }
      v16 = [v3 multilingualSet];
      v17 = [v16 firstObject];
      v18 = [v17 languageWithRegion];

      v19 = [v3 multilingualSet];
      v20 = [v19 lastObject];
      v21 = [v20 languageWithRegion];

      unsigned int v11 = [[UIKBMultilingualKeyboardArtworkView alloc] initWithLanguage1:v18 andLanguage2:v21];
    }
    else
    {
      v22 = [v3 multilingualLanguages];
      v23 = [v22 firstObject];

      v24 = [v3 multilingualLanguages];
      v25 = [v24 lastObject];

      unsigned int v11 = [[UIKBMultilingualKeyboardArtworkView alloc] initWithLanguage1:v23 andLanguage2:v25];
    }
  }

  return v11;
}

- (UIKBMultilingualKeyboardIntroductionView)initWithInputMode:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v231[14] = *MEMORY[0x1E4F143B8];
  id v214 = a3;
  v219.receiver = self;
  v219.super_class = (Class)UIKBMultilingualKeyboardIntroductionView;
  v9 = -[UIView initWithFrame:](&v219, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    [(UIKBMultilingualKeyboardIntroductionView *)v9 setInputMode:v214];
    [(UIView *)v10 setAutoresizingMask:18];
    v212 = [(UIView *)v10 _inheritedRenderConfig];
    unsigned int v11 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", [v212 backdropStyle]);
    [(UIKBMultilingualKeyboardIntroductionView *)v10 setBackdropView:v11];

    uint64_t v12 = [(UIKBMultilingualKeyboardIntroductionView *)v10 backdropView];
    [(UIView *)v10 addSubview:v12];

    v141 = [(id)objc_opt_class() displayTitle:v214];
    v140 = [(id)objc_opt_class() displayDescription:v214];
    v139 = _UILocalizedStringInSystemLanguage(@"Continue", @"Continue");
    if ([v212 lightKeyboard]) {
      +[UIColor blackColor];
    }
    else {
    v211 = +[UIColor whiteColor];
    }
    uint64_t v13 = [UILabel alloc];
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v18 = -[UILabel initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
    [(UIKBMultilingualKeyboardIntroductionView *)v10 setTitleLabel:v18];

    v19 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [v20 setTextColor:v211];

    v21 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [v21 setTextAlignment:1];

    v22 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [v22 setText:v141];

    v23 = [off_1E52D39B8 boldSystemFontOfSize:16.0];
    v24 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [v24 setFont:v23];

    v25 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    [(UIView *)v10 addSubview:v25];

    v26 = [(id)objc_opt_class() displayArtwork:v214];
    [(UIKBMultilingualKeyboardIntroductionView *)v10 setArtworkView:v26];

    v27 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    v28 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    [(UIView *)v10 addSubview:v28];

    v29 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v14, v15, v16, v17);
    [(UIKBMultilingualKeyboardIntroductionView *)v10 setDescriptionLabel:v29];

    v30 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    v31 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v31 setTextColor:v211];

    v32 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v32 setTextAlignment:1];

    v33 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v33 setText:v140];

    v34 = [off_1E52D39B8 systemFontOfSize:14.0];
    v35 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v35 setFont:v34];

    v36 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [v36 setNumberOfLines:2];

    v37 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    [(UIView *)v10 addSubview:v37];

    v38 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v14, v15, v16, v17);
    [(UIKBMultilingualKeyboardIntroductionView *)v10 setContinueButton:v38];

    v39 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    [v40 setTitle:v139 forState:0];

    v41 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v42 = +[UIColor linkColor];
    [v41 setTitleColor:v42 forState:0];

    v43 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v44 = +[UIColor linkColor];
    [v43 setTitleColor:v44 forState:0];

    v45 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    [v45 addTarget:v10 action:sel_continueButtonTapped forControlEvents:64];

    v46 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    [(UIView *)v10 addSubview:v46];

    v213 = [MEMORY[0x1E4F1CA48] array];
    v47 = [(UIView *)v10 bottomAnchor];
    v48 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v49 = [v48 bottomAnchor];
    v210 = [v47 constraintGreaterThanOrEqualToAnchor:v49 constant:35.0];

    LODWORD(v50) = 1148846080;
    [v210 setPriority:v50];
    v207 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    v205 = [v207 topAnchor];
    v201 = [(UIView *)v10 topAnchor];
    v197 = [v205 constraintGreaterThanOrEqualToAnchor:v201 constant:15.0];
    v231[0] = v197;
    v193 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    v189 = [v193 centerXAnchor];
    v185 = [(UIView *)v10 centerXAnchor];
    v181 = [v189 constraintEqualToAnchor:v185];
    v231[1] = v181;
    v179 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    v177 = [v179 heightAnchor];
    v176 = [v177 constraintEqualToConstant:150.0];
    v231[2] = v176;
    v175 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    v174 = [v175 widthAnchor];
    v173 = [(UIView *)v10 widthAnchor];
    v172 = [v174 constraintEqualToAnchor:v173 multiplier:0.7];
    v231[3] = v172;
    v171 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    v168 = [v171 topAnchor];
    v170 = [(UIKBMultilingualKeyboardIntroductionView *)v10 artworkView];
    v169 = [v170 bottomAnchor];
    v167 = [v168 constraintEqualToAnchor:v169 constant:6.0];
    v231[4] = v167;
    v166 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    v165 = [v166 centerXAnchor];
    v164 = [(UIView *)v10 centerXAnchor];
    v163 = [v165 constraintEqualToAnchor:v164];
    v231[5] = v163;
    v162 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    v159 = [v162 topAnchor];
    v161 = [(UIKBMultilingualKeyboardIntroductionView *)v10 titleLabel];
    v160 = [v161 bottomAnchor];
    v158 = [v159 constraintEqualToAnchor:v160 constant:6.0];
    v231[6] = v158;
    v157 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    v156 = [v157 centerXAnchor];
    v155 = [(UIView *)v10 centerXAnchor];
    v154 = [v156 constraintEqualToAnchor:v155];
    v231[7] = v154;
    v153 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    v152 = [v153 widthAnchor];
    v151 = [(UIView *)v10 widthAnchor];
    v150 = [v152 constraintEqualToAnchor:v151 multiplier:0.9];
    v231[8] = v150;
    v149 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v147 = [v149 topAnchor];
    v148 = [(UIKBMultilingualKeyboardIntroductionView *)v10 descriptionLabel];
    v146 = [v148 bottomAnchor];
    v145 = [v147 constraintEqualToAnchor:v146 constant:15.0];
    v231[9] = v145;
    v144 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v143 = [v144 centerXAnchor];
    v142 = [(UIView *)v10 centerXAnchor];
    v51 = [v143 constraintEqualToAnchor:v142];
    v231[10] = v51;
    v52 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v53 = [v52 widthAnchor];
    v54 = [(UIView *)v10 widthAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 multiplier:0.7];
    v231[11] = v55;
    v56 = [(UIKBMultilingualKeyboardIntroductionView *)v10 continueButton];
    v57 = [v56 heightAnchor];
    v58 = [v57 constraintEqualToConstant:21.0];
    v231[12] = v58;
    v231[13] = v210;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v231 count:14];
    [v213 addObjectsFromArray:v59];

    if ([v214 showsTransliterationCandidates])
    {
      uint64_t v221 = 0;
      v222 = &v221;
      uint64_t v223 = 0x2050000000;
      v60 = (void *)_MergedGlobals_3_19;
      uint64_t v224 = _MergedGlobals_3_19;
      if (!_MergedGlobals_3_19)
      {
        v220[0] = MEMORY[0x1E4F143A8];
        v220[1] = 3221225472;
        v220[2] = __getTUIPredictionViewClass_block_invoke;
        v220[3] = &unk_1E52D9900;
        v220[4] = &v221;
        __getTUIPredictionViewClass_block_invoke((uint64_t)v220);
        v60 = (void *)v222[3];
      }
      v61 = v60;
      _Block_object_dispose(&v221, 8);
      id v62 = objc_alloc_init(v61);
      [(UIKBMultilingualKeyboardIntroductionView *)v10 setPredictionView:v62];

      v63 = [(UIView *)v10 _inheritedRenderConfig];
      v64 = [(UIKBMultilingualKeyboardIntroductionView *)v10 predictionView];
      [v64 setRenderConfig:v63];

      v65 = (void *)MEMORY[0x1E4FAE278];
      v66 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:&stru_1ED0E84C0];
      v230[0] = v66;
      v67 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:&stru_1ED0E84C0];
      v230[1] = v67;
      v68 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:&stru_1ED0E84C0];
      v230[2] = v68;
      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v230 count:3];
      v70 = [v65 listWithCorrections:0 predictions:v69];
      v71 = [(UIKBMultilingualKeyboardIntroductionView *)v10 predictionView];
      [v71 setAutocorrectionList:v70];

      v72 = objc_alloc_init(UIMultiscriptCandidateView);
      [(UIKBMultilingualKeyboardIntroductionView *)v10 setMultiscriptCandidateView:v72];

      v73 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      [v73 setTranslatesAutoresizingMaskIntoConstraints:0];

      v74 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      [v74 setUserInteractionEnabled:0];

      v75 = +[UIAction actionWithHandler:&__block_literal_global_443];
      v76 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      [v76 setAlternativeCandidateAction:v75];

      v77 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      v78 = [(UIKBMultilingualKeyboardIntroductionView *)v10 predictionView];
      [v77 reloadArrangedSubviews:v78];

      v79 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      [v79 setAlpha:0.5];

      v80 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      [(UIView *)v10 addSubview:v80];

      v81 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v206 = [v81 systemInputAssistantViewController];

      v82 = [(UIView *)v10 traitCollection];
      [v206 preferredHeightForTraitCollection:v82];
      double v84 = v83;

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        && !+[UIKeyboardImpl isFloating])
      {
        v94 = [(UIView *)v10 traitCollection];
        [v206 _centerViewWidthForTraitCollection:v94];
        double v96 = v95;

        v208 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v202 = [v208 topAnchor];
        v198 = [(UIView *)v10 topAnchor];
        v194 = [v202 constraintEqualToAnchor:v198];
        v229[0] = v194;
        v190 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v186 = [v190 centerXAnchor];
        v182 = [(UIView *)v10 centerXAnchor];
        v85 = [v186 constraintEqualToAnchor:v182];
        v229[1] = v85;
        v86 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v87 = [v86 widthAnchor];
        v88 = [v87 constraintEqualToConstant:v96];
        v229[2] = v88;
        v89 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v90 = [v89 heightAnchor];
        v91 = [v90 constraintEqualToConstant:v84];
        v229[3] = v91;
        v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v229 count:4];
        [v213 addObjectsFromArray:v92];
      }
      else
      {
        v208 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v202 = [v208 topAnchor];
        v198 = [(UIView *)v10 topAnchor];
        v194 = [v202 constraintEqualToAnchor:v198];
        v228[0] = v194;
        v190 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v186 = [v190 leadingAnchor];
        v182 = [(UIView *)v10 leadingAnchor];
        v85 = [v186 constraintEqualToAnchor:v182];
        v228[1] = v85;
        v86 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v87 = [v86 trailingAnchor];
        v88 = [(UIView *)v10 trailingAnchor];
        v89 = [v87 constraintEqualToAnchor:v88];
        v228[2] = v89;
        v90 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        v91 = [v90 heightAnchor];
        v92 = [v91 constraintEqualToConstant:v84];
        v228[3] = v92;
        v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v228 count:4];
        [v213 addObjectsFromArray:v93];
      }
      v97 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
      v98 = [v97 arrangedSubviews];
      v209 = [v98 lastObject];

      if (v209)
      {
        v99 = objc_alloc_init(UIView);
        [(UIKBMultilingualKeyboardIntroductionView *)v10 setHighlight:v99];

        char v100 = [v212 lightKeyboard];
        uint64_t v101 = UIKeyboardGetLightCandidateHighlightColor();
        v102 = (void *)v101;
        if (v100)
        {
          v103 = (void *)v101;
        }
        else
        {
          v104 = +[UIDevice currentDevice];
          uint64_t v105 = [v104 userInterfaceIdiom];

          if ((v105 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            +[UIColor colorWithRed:0.337254902 green:0.329411765 blue:0.333333333 alpha:1.0];
          }
          else {
          v103 = +[UIColor colorWithRed:0.450980392 green:0.450980392 blue:0.450980392 alpha:1.0];
          }
        }
        v106 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        [v106 setBackgroundColor:v103];

        v107 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        [v107 setTranslatesAutoresizingMaskIntoConstraints:0];

        v108 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        double v109 = v84 * 0.75;
        [v108 _setCornerRadius:v109 * 0.5];

        v110 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        [v110 setUserInteractionEnabled:0];

        v111 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        v112 = [(UIKBMultilingualKeyboardIntroductionView *)v10 multiscriptCandidateView];
        [(UIView *)v10 insertSubview:v111 belowSubview:v112];

        v203 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        v199 = [v203 centerXAnchor];
        v195 = [v209 centerXAnchor];
        v191 = [v199 constraintEqualToAnchor:v195 constant:-3.0];
        v227[0] = v191;
        v187 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        v183 = [v187 centerYAnchor];
        v113 = [v209 centerYAnchor];
        v114 = [v183 constraintEqualToAnchor:v113 constant:2.0];
        v227[1] = v114;
        v115 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        v116 = [v115 widthAnchor];
        v117 = [v116 constraintEqualToConstant:v109];
        v227[2] = v117;
        v118 = [(UIKBMultilingualKeyboardIntroductionView *)v10 highlight];
        v119 = [v118 heightAnchor];
        v120 = [v119 constraintEqualToConstant:v109];
        v227[3] = v120;
        v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:v227 count:4];
        [v213 addObjectsFromArray:v121];
      }
      v122 = objc_alloc_init(UIKBMultilingualIntroductionArrowView);
      [(UIKBMultilingualKeyboardIntroductionView *)v10 setArrowView:v122];

      v123 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      [v123 setTranslatesAutoresizingMaskIntoConstraints:0];

      v124 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      [(UIView *)v10 addSubview:v124];

      v204 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      v200 = [v204 topAnchor];
      v196 = [(UIView *)v10 topAnchor];
      v192 = [v200 constraintEqualToAnchor:v196];
      v226[0] = v192;
      v188 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      v184 = [v188 leadingAnchor];
      v180 = [(UIView *)v10 leadingAnchor];
      v178 = [v184 constraintEqualToAnchor:v180];
      v226[1] = v178;
      v125 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      v126 = [v125 bottomAnchor];
      v127 = [(UIView *)v10 bottomAnchor];
      v128 = [v126 constraintEqualToAnchor:v127];
      v226[2] = v128;
      v129 = [(UIKBMultilingualKeyboardIntroductionView *)v10 arrowView];
      v130 = [v129 trailingAnchor];
      v131 = [(UIView *)v10 trailingAnchor];
      v132 = [v130 constraintEqualToAnchor:v131];
      v226[3] = v132;
      v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:v226 count:4];
      [v213 addObjectsFromArray:v133];
    }
    [MEMORY[0x1E4F5B268] activateConstraints:v213];
    [(UIView *)v10 setSemanticContentAttribute:3];
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    v134 = [(UIView *)v10 subviews];
    uint64_t v135 = [v134 countByEnumeratingWithState:&v215 objects:v225 count:16];
    if (v135)
    {
      uint64_t v136 = *(void *)v216;
      do
      {
        for (uint64_t i = 0; i != v135; ++i)
        {
          if (*(void *)v216 != v136) {
            objc_enumerationMutation(v134);
          }
          [*(id *)(*((void *)&v215 + 1) + 8 * i) setSemanticContentAttribute:3];
        }
        uint64_t v135 = [v134 countByEnumeratingWithState:&v215 objects:v225 count:16];
      }
      while (v135);
    }
  }
  return v10;
}

- (void)layoutSubviews
{
  id v3 = [(UIKBMultilingualKeyboardIntroductionView *)self highlight];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = [(UIKBMultilingualKeyboardIntroductionView *)self titleLabel];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v24.receiver = self;
  v24.super_class = (Class)UIKBMultilingualKeyboardIntroductionView;
  [(UIView *)&v24 layoutSubviews];
  [(UIKBMultilingualKeyboardIntroductionView *)self _updateContainer];
  v21 = [(UIKBMultilingualKeyboardIntroductionView *)self titleLabel];
  [v21 frame];
  v27.origin.double x = v14;
  v27.origin.double y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  if (!CGRectEqualToRect(v25, v27))
  {

    goto LABEL_5;
  }
  v22 = [(UIKBMultilingualKeyboardIntroductionView *)self highlight];
  [v22 frame];
  v28.origin.double x = v5;
  v28.origin.double y = v7;
  v28.size.double width = v9;
  v28.size.double height = v11;
  BOOL v23 = CGRectEqualToRect(v26, v28);

  if (!v23) {
LABEL_5:
  }
    [(UIKBMultilingualKeyboardIntroductionView *)self _updatePath];
}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return [a3 backdropStyle];
}

- (void)continueButtonTapped
{
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 dismissMultilingualKeyboardTip];
}

- (void)_updatePath
{
  id v3 = [(UIKBMultilingualKeyboardIntroductionView *)self arrowView];

  if (v3)
  {
    BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
    CGFloat v5 = [(UIKBMultilingualKeyboardIntroductionView *)self titleLabel];
    [v5 frame];
    if (v4)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v6);
      double v11 = -15.0;
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v6);
      double v11 = 15.0;
    }
    double v12 = MinX + v11;

    double v13 = [(UIKBMultilingualKeyboardIntroductionView *)self titleLabel];
    [v13 frame];
    double MidY = CGRectGetMidY(v21);

    double v15 = [(UIKBMultilingualKeyboardIntroductionView *)self highlight];
    [v15 frame];
    double MidX = CGRectGetMidX(v22);
    double v17 = [(UIKBMultilingualKeyboardIntroductionView *)self highlight];
    [v17 frame];
    CGFloat v18 = CGRectGetMaxY(v23) + 5.0;

    id v19 = [(UIKBMultilingualKeyboardIntroductionView *)self arrowView];
    objc_msgSend(v19, "setStartPoint:endPoint:", v12, MidY, MidX, v18);
  }
}

- (void)_updateContainer
{
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UIView *)self _rootInputWindowController];
  BOOL v4 = [v3 _inputAccessoryView];

  CGFloat v5 = [(UIView *)self _rootInputWindowController];
  uint64_t v6 = v5;
  if (v4)
  {
    CGFloat v7 = [v5 _inputAccessoryView];
    goto LABEL_11;
  }
  double v8 = [v5 _inputAssistantView];
  uint64_t v9 = [v8 superview];
  if (v9)
  {
    double v10 = (void *)v9;
    double v11 = +[UIKeyboardImpl activeInstance];
    char v12 = [v11 _showsScribbleIconsInAssistantView];

    if ((v12 & 1) == 0)
    {
      uint64_t v6 = [(UIView *)self _rootInputWindowController];
      CGFloat v7 = [v6 _inputAssistantView];
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v13 = [(UIView *)self _rootInputWindowController];
  CGFloat v14 = [v13 _inputView];

  double v15 = [(UIView *)self _rootInputWindowController];
  uint64_t v6 = v15;
  if (v14) {
    [v15 _inputView];
  }
  else {
  CGFloat v7 = [v15 view];
  }
LABEL_11:
  CGFloat v16 = v7;
  id v40 = [v7 topAnchor];

  BOOL v17 = +[UIKeyboardImpl isFloating];
  CGFloat v18 = [(UIView *)self _rootInputWindowController];
  id v19 = v18;
  if (v17)
  {
    CGFloat v20 = [v18 _inputView];

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
    CGFloat v20 = [v18 view];

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

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIKBMultilingualIntroductionArrowView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
}

- (UIView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (UIMultiscriptCandidateView)multiscriptCandidateView
{
  return self->_multiscriptCandidateView;
}

- (void)setMultiscriptCandidateView:(id)a3
{
}

- (UIView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (TUIPredictionView)predictionView
{
  return self->_predictionView;
}

- (void)setPredictionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_multiscriptCandidateView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end