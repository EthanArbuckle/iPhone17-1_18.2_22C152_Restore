@interface VTUITurnOnSiriView
- (BOOL)showPrivacyTextView;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)continueButtons;
- (UIButton)continueButton;
- (UIButton)laterButton;
- (VTUITurnOnSiriView)initWithFrame:(CGRect)a3;
- (VTUITurnOnSiriViewDelegate)stateViewDelegate;
- (double)imageOffsetFromTop;
- (id)footerView;
- (id)languageSelectionOfContinueButton:(id)a3;
- (void)_setupContent;
- (void)_setupTurnOnSiriUI;
- (void)layoutSubviews;
- (void)prepareForLastTimeShown;
- (void)setStateViewDelegate:(id)a3;
@end

@implementation VTUITurnOnSiriView

- (VTUITurnOnSiriView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUITurnOnSiriView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VTUITurnOnSiriView *)v3 _setupTurnOnSiriUI];
    [(VTUITurnOnSiriView *)v4 _setupContent];
  }
  return v4;
}

- (void)_setupTurnOnSiriUI
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  [v3 setIsFloatingWithReducedWidth:1];
  char v116 = 0;
  v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v6 = [v5 localeIdentifier];
  v7 = [v4 allSiriLanguageCodesForSystemLanguageCode:v6 isGoodFit:&v116];
  siriLanguages = self->_siriLanguages;
  self->_siriLanguages = v7;

  unint64_t v9 = 0x26897B000uLL;
  if ([(NSArray *)self->_siriLanguages count] < 2)
  {
    v19 = +[VTUIButton _vtuiButtonWithPrimaryStyle];
    continueButton = self->_continueButton;
    self->_continueButton = v19;

    v21 = [(UIButton *)self->_continueButton titleLabel];
    v22 = [v3 turnOnSiriContinueButtonFont];
    [v21 setFont:v22];

    [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = self->_continueButton;
    v24 = [MEMORY[0x263F825C8] whiteColor];
    [(UIButton *)v23 setTitleColor:v24 forState:0];

    v25 = self->_continueButton;
    v26 = [MEMORY[0x263F825C8] lightGrayColor];
    [(UIButton *)v25 setTitleColor:v26 forState:1];

    v27 = [(UIButton *)self->_continueButton layer];
    [v27 setCornerRadius:10.0];

    [(UIButton *)self->_continueButton setClipsToBounds:1];
    continueButtons = [(VTUITurnOnSiriView *)self footerView];
    [continueButtons addSubview:self->_continueButton];
  }
  else
  {
    v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    if ([(NSArray *)self->_siriLanguages count])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = +[VTUIButton _vtuiButtonWithPrimaryStyle];
        [v12 setTag:v11];
        v13 = [v12 titleLabel];
        v14 = [v3 turnOnSiriContinueButtonFont];
        [v13 setFont:v14];

        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        v15 = [MEMORY[0x263F825C8] whiteColor];
        [v12 setTitleColor:v15 forState:0];

        v16 = [v12 layer];
        [v16 setCornerRadius:10.0];

        [v12 setClipsToBounds:1];
        v17 = [(VTUITurnOnSiriView *)self footerView];
        [v17 addSubview:v12];

        [(NSArray *)v10 addObject:v12];
        ++v11;
      }
      while ([(NSArray *)self->_siriLanguages count] > v11);
    }
    continueButtons = self->_continueButtons;
    self->_continueButtons = v10;
    unint64_t v9 = 0x26897B000;
  }

  v28 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  uint64_t v29 = 528;
  laterButton = self->_laterButton;
  self->_laterButton = v28;

  [(UIButton *)self->_laterButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(VTUITurnOnSiriView *)self footerView];
  [v31 addSubview:self->_laterButton];

  uint64_t v32 = *(int *)(v9 + 3844);
  uint64_t v33 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v33)
  {
    v34 = (void *)MEMORY[0x263F08938];
    v35 = [(VTUITurnOnSiriView *)self footerView];
    [v3 continueButtonOffset];
    v37 = [v34 constraintWithItem:v33 attribute:3 relatedBy:0 toItem:v35 attribute:3 multiplier:1.0 constant:v36];
    [(VTUITurnOnSiriView *)self addConstraint:v37];

    v38 = (void *)MEMORY[0x263F08938];
    v39 = [(UIButton *)self->_laterButton titleLabel];
    uint64_t v40 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
    [v3 bottomOfContinueToNotNowFirstBaseline];
    v42 = [v38 constraintWithItem:v39 attribute:12 relatedBy:0 toItem:v40 attribute:4 multiplier:1.0 constant:v41];
    [(VTUITurnOnSiriView *)self addConstraint:v42];
  }
  else
  {
    if ([(NSArray *)self->_continueButtons count] < 2) {
      goto LABEL_15;
    }
    v43 = (void *)MEMORY[0x263F08938];
    v44 = [(NSArray *)self->_continueButtons firstObject];
    v45 = [(VTUITurnOnSiriView *)self footerView];
    [v3 continueButtonOffset];
    v47 = [v43 constraintWithItem:v44 attribute:3 relatedBy:0 toItem:v45 attribute:3 multiplier:1.0 constant:v46];
    [(VTUITurnOnSiriView *)self addConstraint:v47];

    if ([(NSArray *)self->_continueButtons count] >= 2)
    {
      unint64_t v48 = 1;
      do
      {
        v49 = (void *)MEMORY[0x263F08938];
        v50 = [(NSArray *)self->_continueButtons objectAtIndex:v48];
        v51 = [(NSArray *)self->_continueButtons objectAtIndex:v48 - 1];
        [v3 continueButtonPaddingTop];
        v53 = [v49 constraintWithItem:v50 attribute:3 relatedBy:0 toItem:v51 attribute:4 multiplier:1.0 constant:v52];
        [(VTUITurnOnSiriView *)self addConstraint:v53];

        ++v48;
      }
      while ([(NSArray *)self->_continueButtons count] > v48);
    }
    v54 = (void *)MEMORY[0x263F08938];
    v39 = [(UIButton *)self->_laterButton titleLabel];
    v42 = [(NSArray *)self->_continueButtons lastObject];
    [v3 bottomOfContinueToNotNowFirstBaseline];
    v56 = [v54 constraintWithItem:v39 attribute:12 relatedBy:0 toItem:v42 attribute:4 multiplier:1.0 constant:v55];
    [(VTUITurnOnSiriView *)self addConstraint:v56];
  }
LABEL_15:
  uint64_t v57 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v57)
  {
    v58 = (void *)MEMORY[0x263F08938];
    v59 = [(VTUITurnOnSiriView *)self footerView];
    v60 = [v58 constraintWithItem:v57 attribute:9 relatedBy:0 toItem:v59 attribute:9 multiplier:1.0 constant:0.0];
    [(VTUITurnOnSiriView *)self addConstraint:v60];
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v59 = self->_continueButtons;
    uint64_t v61 = [(NSArray *)v59 countByEnumeratingWithState:&v112 objects:v118 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v106 = 528;
      uint64_t v107 = v32;
      uint64_t v63 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v113 != v63) {
            objc_enumerationMutation(v59);
          }
          uint64_t v65 = *(void *)(*((void *)&v112 + 1) + 8 * i);
          v66 = (void *)MEMORY[0x263F08938];
          v67 = [(VTUITurnOnSiriView *)self footerView];
          v68 = [v66 constraintWithItem:v65 attribute:9 relatedBy:0 toItem:v67 attribute:9 multiplier:1.0 constant:0.0];
          [(VTUITurnOnSiriView *)self addConstraint:v68];
        }
        uint64_t v62 = [(NSArray *)v59 countByEnumeratingWithState:&v112 objects:v118 count:16];
      }
      while (v62);
      uint64_t v29 = v106;
      uint64_t v32 = v107;
    }
  }

  v69 = (void *)MEMORY[0x263F08938];
  uint64_t v70 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
  v71 = [(VTUITurnOnSiriView *)self footerView];
  v72 = [v69 constraintWithItem:v70 attribute:9 relatedBy:0 toItem:v71 attribute:9 multiplier:1.0 constant:0.0];
  [(VTUITurnOnSiriView *)self addConstraint:v72];

  v73 = (void *)MEMORY[0x263F08938];
  uint64_t v74 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
  v75 = [(VTUITurnOnSiriView *)self footerView];
  [v3 skipButtonBaselineBottomMarginPortrait];
  v77 = [v73 constraintWithItem:v74 attribute:4 relatedBy:0 toItem:v75 attribute:4 multiplier:1.0 constant:-v76];
  [(VTUITurnOnSiriView *)self addConstraint:v77];

  uint64_t v78 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v78)
  {
    v79 = [MEMORY[0x263F08938] constraintWithItem:*(Class *)((char *)&self->super.super.super.super.isa + v29) attribute:7 relatedBy:0 toItem:v78 attribute:7 multiplier:1.0 constant:0.0];
    [(VTUITurnOnSiriView *)self addConstraint:v79];
  }
  else
  {
    v80 = [(NSArray *)self->_continueButtons firstObject];

    if (!v80) {
      goto LABEL_30;
    }
    v81 = (void *)MEMORY[0x263F08938];
    uint64_t v82 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
    v79 = [(NSArray *)self->_continueButtons firstObject];
    v83 = [v81 constraintWithItem:v82 attribute:7 relatedBy:0 toItem:v79 attribute:7 multiplier:1.0 constant:0.0];
    [(VTUITurnOnSiriView *)self addConstraint:v83];
  }
LABEL_30:
  v84 = (void *)MEMORY[0x263F08938];
  v85 = [*(id *)((char *)&self->super.super.super.super.isa + v29) titleLabel];
  v86 = [v84 constraintWithItem:v85 attribute:7 relatedBy:0 toItem:*(Class *)((char *)&self->super.super.super.super.isa + v29) attribute:7 multiplier:1.0 constant:0.0];
  [(VTUITurnOnSiriView *)self addConstraint:v86];

  v87 = *(Class *)((char *)&self->super.super.super.super.isa + v32);
  if (v87)
  {
    v88 = (void *)MEMORY[0x263F08938];
    [v3 turnOnSiriContinueButtonWidth];
    v90 = [v88 constraintWithItem:v87 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v89];
    [v87 addConstraint:v90];

    v91 = *(Class *)((char *)&self->super.super.super.super.isa + v32);
    v92 = (void *)MEMORY[0x263F08938];
    [v3 turnOnSiriContinueButtonHeight];
    v94 = [v92 constraintWithItem:v91 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v93];
    [v91 addConstraint:v94];
  }
  else
  {
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v94 = self->_continueButtons;
    uint64_t v95 = [(NSArray *)v94 countByEnumeratingWithState:&v108 objects:v117 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v96; ++j)
        {
          if (*(void *)v109 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = *(void **)(*((void *)&v108 + 1) + 8 * j);
          v100 = (void *)MEMORY[0x263F08938];
          [v3 turnOnSiriContinueButtonWidth];
          v102 = [v100 constraintWithItem:v99 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v101];
          [v99 addConstraint:v102];

          v103 = (void *)MEMORY[0x263F08938];
          [v3 turnOnSiriContinueButtonHeight];
          v105 = [v103 constraintWithItem:v99 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v104];
          [v99 addConstraint:v105];
        }
        uint64_t v96 = [(NSArray *)v94 countByEnumeratingWithState:&v108 objects:v117 count:16];
      }
      while (v96);
    }
  }
}

- (id)languageSelectionOfContinueButton:(id)a3
{
  siriLanguages = self->_siriLanguages;
  uint64_t v4 = [a3 tag];
  return [(NSArray *)siriLanguages objectAtIndex:v4];
}

- (void)_setupContent
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  uint64_t v4 = +[VTUIStringsHelper sharedStringsHelper];
  v5 = [v4 uiLocalizedStringForKey:@"TEXT_TITLE_CONS"];
  [(VTUIEnrollmentBaseView *)self setTitle:v5];

  objc_super v6 = +[VTUIStyle sharedStyle];
  v7 = [v6 VTUIDeviceSpecificString:@"ASSISTANT_DESCRIPTION_SHORT"];
  [(VTUIEnrollmentBaseView *)self setSubtitle:v7];

  v8 = +[VTUIStyle sharedStyle];
  v35 = v3;
  if ([v3 supportsSideButtonActivation]) {
    unint64_t v9 = @"ASSISTANT_TRIGGER_INSTRUCTION_SIDE_BUTTON";
  }
  else {
    unint64_t v9 = @"ASSISTANT_TRIGGER_INSTRUCTION_HOME_BUTTON";
  }
  v10 = [v8 VTUIDeviceSpecificString:v9];
  [(VTUIEnrollmentBaseView *)self setInstructionText:v10];

  continueButton = self->_continueButton;
  v12 = +[VTUIStyle sharedStyle];
  v13 = [v12 VTUIDeviceSpecificString:@"BUTTON_TURN_ON_SIRI"];
  [(UIButton *)continueButton setTitle:v13 forState:0];

  laterButton = self->_laterButton;
  v15 = +[VTUIStyle sharedStyle];
  v16 = [v15 VTUIDeviceSpecificString:@"BUTTON_CONS_NOT_NOW"];
  [(UIButton *)laterButton setTitle:v16 forState:0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v38 = self;
  obuint64_t j = self->_continueButtons;
  uint64_t v39 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v19 = -[NSArray objectAtIndex:](v38->_siriLanguages, "objectAtIndex:", [v18 tag]);
        v20 = [MEMORY[0x263F285A0] sharedPreferences];
        v21 = [v20 languageCode];

        if (!v21)
        {
          v22 = [MEMORY[0x263EFF960] currentLocale];
          v21 = [v22 localeIdentifier];
        }
        v23 = [MEMORY[0x263F28530] sharedInstance];
        uint64_t v24 = [v23 localizedCompactNameForSiriLanguage:v19 inDisplayLanguage:v21];
        v25 = (void *)v24;
        if (v24) {
          v26 = (void *)v24;
        }
        else {
          v26 = v19;
        }
        id v27 = v26;

        v28 = NSString;
        uint64_t v29 = +[VTUIStringsHelper sharedStringsHelper];
        v30 = [v29 uiLocalizedStringForKey:@"BUTTON_LANG_OPTION"];
        v31 = +[VTUIStringsHelper sharedStringsHelper];
        uint64_t v32 = [v31 uiLocalizedStringForKey:v27];

        uint64_t v33 = objc_msgSend(v28, "stringWithFormat:", v30, v32);
        [v18 setTitle:v33 forState:0];
      }
      uint64_t v39 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v39);
  }

  v34 = [MEMORY[0x263F825C8] clearColor];
  [(VTUITurnOnSiriView *)v38 setBackgroundColor:v34];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)VTUITurnOnSiriView;
  [(VTUIEnrollmentBaseView *)&v2 layoutSubviews];
}

- (BOOL)showPrivacyTextView
{
  return 1;
}

- (id)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)prepareForLastTimeShown
{
  laterButton = self->_laterButton;
  id v4 = +[VTUIStyle sharedStyle];
  v3 = [v4 VTUIDeviceSpecificString:@"BUTTON_CONS_LATER"];
  [(UIButton *)laterButton setTitle:v3 forState:0];
}

- (double)imageOffsetFromTop
{
  objc_super v2 = +[VTUIStyle sharedStyle];
  [v2 turnOnSiriImageOffsetFromTop];
  double v4 = v3;

  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateViewDelegate);
  [WeakRetained aboutSelectedInTurnOnSiriView:self];

  return 0;
}

- (VTUITurnOnSiriViewDelegate)stateViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateViewDelegate);
  return (VTUITurnOnSiriViewDelegate *)WeakRetained;
}

- (void)setStateViewDelegate:(id)a3
{
}

- (UIButton)laterButton
{
  return self->_laterButton;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (NSArray)continueButtons
{
  return self->_continueButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtons, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_destroyWeak((id *)&self->_stateViewDelegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_siriLanguages, 0);
}

@end