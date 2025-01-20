@interface VTUIEnrollmentLanguageOptionsView
- (BOOL)showPrivacyTextView;
- (NSMutableArray)continueButtons;
- (VTUIEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3;
- (id)footerView;
- (id)languageSelectionOfContinueButton:(id)a3;
- (void)_addContinueButtonsToFooter;
- (void)_setupContent;
- (void)setContinueButtonLanguages:(id)a3;
@end

@implementation VTUIEnrollmentLanguageOptionsView

- (VTUIEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentLanguageOptionsView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollmentLanguageOptionsView *)v3 _setupContent];
  }
  return v4;
}

- (void)_setupContent
{
  v3 = +[VTUIStyle sharedStyle];
  uint64_t v4 = [v3 enrollmentMode];

  if (v4 == 4) {
    v5 = 0;
  }
  else {
    v5 = @"TEXT_TITLE_LANGUAGE_OPTIONS";
  }
  if (v4 == 4) {
    objc_super v6 = 0;
  }
  else {
    objc_super v6 = @"ASSISTANT_LANGUAGE_OPTIONS_DESCRIPTION";
  }
  v7 = +[VTUIStringsHelper sharedStringsHelper];
  v8 = [v7 uiLocalizedStringForKey:v5];
  [(VTUIEnrollmentBaseView *)self setTitle:v8];

  id v10 = +[VTUIStyle sharedStyle];
  v9 = [v10 VTUIDeviceSpecificString:v6];
  [(VTUIEnrollmentBaseView *)self setSubtitle:v9];
}

- (id)languageSelectionOfContinueButton:(id)a3
{
  continueButtonsLanguages = self->_continueButtonsLanguages;
  uint64_t v4 = [a3 tag];
  return [(NSArray *)continueButtonsLanguages objectAtIndex:v4];
}

- (void)setContinueButtonLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonsLanguages, a3);
  [(VTUIEnrollmentLanguageOptionsView *)self _addContinueButtonsToFooter];
}

- (void)_addContinueButtonsToFooter
{
  v2 = self;
  v59[3] = *MEMORY[0x263EF8340];
  v3 = [(VTUIEnrollmentLanguageOptionsView *)self footerView];

  if (v3)
  {
    v51 = +[VTUIStyle sharedStyle];
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    continueButtons = v2->_continueButtons;
    v2->_continueButtons = v4;

    if ([(NSArray *)v2->_continueButtonsLanguages count])
    {
      unint64_t v6 = 0;
      do
      {
        v7 = +[VTUIButton _vtuiButtonWithPrimaryStyle];
        [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v7 setTag:v6];
        uint64_t v8 = [(NSArray *)v2->_continueButtonsLanguages objectAtIndexedSubscript:v6];
        v9 = [MEMORY[0x263F285A0] sharedPreferences];
        uint64_t v10 = [v9 languageCode];

        v11 = v2;
        if (!v10)
        {
          v12 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v10 = [v12 localeIdentifier];
        }
        v55 = (void *)v10;
        v13 = [MEMORY[0x263F28530] sharedInstance];
        uint64_t v14 = [v13 localizedCompactNameForSiriLanguage:v8 inDisplayLanguage:v10];
        v15 = (void *)v14;
        if (v14) {
          v16 = (void *)v14;
        }
        else {
          v16 = (void *)v8;
        }
        id v17 = v16;

        v18 = NSString;
        v54 = (void *)v8;
        v19 = +[VTUIStringsHelper sharedStringsHelper];
        v20 = [v19 uiLocalizedStringForKey:@"BUTTON_LANG_OPTION"];
        v21 = +[VTUIStringsHelper sharedStringsHelper];
        v22 = [v21 uiLocalizedStringForKey:v17];

        v23 = objc_msgSend(v18, "stringWithFormat:", v20, v22);
        [v7 setTitle:v23 forState:0];

        [(UIView *)v11->_footerView addSubview:v7];
        v52 = (void *)MEMORY[0x263F08938];
        v53 = [v7 centerXAnchor];
        v24 = [(UIView *)v11->_footerView centerXAnchor];
        v25 = [v53 constraintEqualToAnchor:v24];
        v59[0] = v25;
        v26 = [v7 widthAnchor];
        [v51 footerButtonMaximumWidth];
        v27 = objc_msgSend(v26, "constraintEqualToConstant:");
        v59[1] = v27;
        [v7 heightAnchor];
        v28 = v2 = v11;
        [v51 primaryButtonHeight];
        v29 = objc_msgSend(v28, "constraintEqualToConstant:");
        v59[2] = v29;
        v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
        [v52 activateConstraints:v30];

        [(NSMutableArray *)v2->_continueButtons addObject:v7];
        ++v6;
      }
      while ([(NSArray *)v2->_continueButtonsLanguages count] > v6);
    }
    v31 = (void *)MEMORY[0x263F08938];
    v32 = [(NSMutableArray *)v2->_continueButtons firstObject];
    v33 = [v32 topAnchor];
    v34 = [(UIView *)v2->_footerView topAnchor];
    [v51 continueButtonOffset];
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
    v58 = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    [v31 activateConstraints:v36];

    v37 = [(NSMutableArray *)v2->_continueButtons firstObject];
    if ((unint64_t)[(NSMutableArray *)v2->_continueButtons count] < 2)
    {
      v39 = v37;
    }
    else
    {
      unint64_t v38 = 1;
      do
      {
        v39 = [(NSMutableArray *)v2->_continueButtons objectAtIndexedSubscript:v38];
        v40 = (void *)MEMORY[0x263F08938];
        v41 = [v39 topAnchor];
        v42 = [v37 bottomAnchor];
        v43 = [v41 constraintEqualToSystemSpacingBelowAnchor:v42 multiplier:1.0];
        v57 = v43;
        v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
        [v40 activateConstraints:v44];

        if (v38 == [(NSMutableArray *)v2->_continueButtons count] - 1)
        {
          v45 = (void *)MEMORY[0x263F08938];
          v46 = [v39 bottomAnchor];
          v47 = [(UIView *)v2->_footerView bottomAnchor];
          [v51 continueButtonOffset];
          v49 = [v46 constraintEqualToAnchor:v47 constant:-v48];
          v56 = v49;
          v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
          [v45 activateConstraints:v50];
        }
        ++v38;
        v37 = v39;
      }
      while ([(NSMutableArray *)v2->_continueButtons count] > v38);
    }
  }
}

- (BOOL)showPrivacyTextView
{
  v2 = +[VTUIStyle sharedStyle];
  char v3 = [v2 isBuddyOrFollowUp];

  return v3;
}

- (id)footerView
{
  char v3 = +[VTUIStyle sharedStyle];
  if ([v3 isBuddyOrFollowUp])
  {
    footerView = self->_footerView;

    if (!footerView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      unint64_t v6 = self->_footerView;
      self->_footerView = v5;

      [(UIView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
  }
  else
  {
  }
  v7 = self->_footerView;
  return v7;
}

- (NSMutableArray)continueButtons
{
  return self->_continueButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtons, 0);
  objc_storeStrong((id *)&self->_continueButtonsLanguages, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end