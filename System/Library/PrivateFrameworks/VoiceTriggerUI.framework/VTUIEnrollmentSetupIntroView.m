@interface VTUIEnrollmentSetupIntroView
- (BOOL)showPrivacyTextView;
- (NSString)languageCode;
- (VTUIButton)continueButton;
- (VTUIButton)laterButton;
- (VTUIEnrollmentSetupIntroView)initWithFrame:(CGRect)a3;
- (id)_createFooterWithTextFieldShowlaterButton:(BOOL)a3;
- (id)footerView;
- (void)_setupContent;
@end

@implementation VTUIEnrollmentSetupIntroView

- (VTUIEnrollmentSetupIntroView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollmentSetupIntroView *)v3 _setupContent];
  }
  return v4;
}

- (void)_setupContent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    v24 = "-[VTUIEnrollmentSetupIntroView _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v23, 0xCu);
  }
  v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v5 = [v4 languageCode];
  languageCode = self->_languageCode;
  self->_languageCode = v5;

  v7 = +[VTUIStyle sharedStyle];
  uint64_t v8 = [v7 enrollmentMode];
  v9 = @"ASSISTANT_TRIGGER_INSTRUCTION";
  if (v8 == 3) {
    v9 = @"ASSISTANT_TRIGGER_INSTRUCTION_SIRI_ONLY";
  }
  if (v8 == 4) {
    v10 = @"TEXT_TITLE_SETUP_HEYSIRI";
  }
  else {
    v10 = @"TEXT_TITLE_CONS";
  }
  if (v8 == 4) {
    v11 = @"HEY_SIRI_DESCRIPTION";
  }
  else {
    v11 = @"ASSISTANT_DESCRIPTION";
  }
  if (v8 == 4) {
    v12 = 0;
  }
  else {
    v12 = v9;
  }
  if (v8 == 4) {
    v13 = @"BUTTON_SET_UP_LATER";
  }
  else {
    v13 = @"BUTTON_CONTINUE_LATER";
  }
  v14 = +[VTUIStringsHelper sharedStringsHelper];
  v15 = [v14 uiLocalizedStringForKey:v10];
  [(VTUIEnrollmentBaseView *)self setTitle:v15];

  v16 = [v7 VTUIDeviceSpecificString:v11];
  [(VTUIEnrollmentBaseView *)self setSubtitle:v16];

  v17 = [v7 VTUIDeviceSpecificString:v12];
  [(VTUIEnrollmentBaseView *)self setInstructionText:v17];

  if ([v7 isBuddyOrFollowUp]
    && [v7 bluetoothDeviceSupportsHeySiri])
  {
    v18 = +[VTUIStringsHelper sharedStringsHelper];
    v19 = [v18 uiLocalizedStringForKey:@"TEXT_TITLE_SETUP_HEYSIRI"];
    [(VTUIEnrollmentBaseView *)self setTitle:v19];

    v20 = [v7 proxHSDescription:@"HEY_SIRI_DESCRIPTION_PROX"];
    [(VTUIEnrollmentBaseView *)self setSubtitle:v20];

    [(VTUIEnrollmentBaseView *)self setInstructionText:&stru_26EB8DDE0];
  }
  laterButton = self->_laterButton;
  v22 = [v7 VTUIDeviceSpecificString:v13];
  [(VTUIButton *)laterButton setTitle:v22 forState:0];
}

- (id)_createFooterWithTextFieldShowlaterButton:(BOOL)a3
{
  BOOL v56 = a3;
  v62[4] = *MEMORY[0x263EF8340];
  v4 = +[VTUIStyle sharedStyle];
  v5 = [MEMORY[0x263F78BB8] sharedInstance];
  id v6 = objc_alloc(MEMORY[0x263F82E00]);
  v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = +[VTUIButton _vtuiButtonWithPrimaryStyle];
  continueButton = self->_continueButton;
  self->_continueButton = v8;

  [(VTUIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:self->_continueButton];
  v10 = [MEMORY[0x263F285A0] sharedPreferences];
  v11 = [v10 languageCode];
  languageCode = self->_languageCode;
  self->_languageCode = v11;

  v13 = [(VTUIEnrollmentSetupIntroView *)self languageCode];
  v59 = v5;
  if ([v5 isSATEnrolledForSiriProfileId:0 forLanguageCode:v13])
  {

LABEL_5:
    v16 = @"BUTTON_USE_SIRI";
    goto LABEL_8;
  }
  if (PSIsRunningInAssistant())
  {
    v14 = [(VTUIEnrollmentSetupIntroView *)self languageCode];
    int v15 = [v5 hasVoiceProfileIniCloudForLanguageCode:v14];

    if (v15) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  v16 = @"BUTTON_CONTINUE_SETUP";
LABEL_8:
  v55 = v7;
  v17 = self->_continueButton;
  v18 = [v4 VTUIDeviceSpecificString:v16];
  [(VTUIButton *)v17 setTitle:v18 forState:0];

  v19 = [MEMORY[0x263EFF980] array];
  v52 = [(VTUIButton *)self->_continueButton topAnchor];
  v50 = [v7 topAnchor];
  [v4 continueButtonOffset];
  v48 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50);
  v62[0] = v48;
  v46 = [(VTUIButton *)self->_continueButton centerXAnchor];
  v20 = [v7 centerXAnchor];
  v21 = [v46 constraintEqualToAnchor:v20];
  v62[1] = v21;
  v22 = [(VTUIButton *)self->_continueButton widthAnchor];
  [v4 footerButtonMaximumWidth];
  objc_msgSend(v22, "constraintEqualToConstant:");
  v24 = int v23 = v4;
  v62[2] = v24;
  uint64_t v25 = [(VTUIButton *)self->_continueButton heightAnchor];
  v54 = v23;
  [v23 primaryButtonHeight];
  v26 = objc_msgSend(v25, "constraintEqualToConstant:");
  v62[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:4];
  v58 = v19;
  [v19 addObjectsFromArray:v27];

  if (v56)
  {
    v28 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
    laterButton = self->_laterButton;
    self->_laterButton = v28;

    [(VTUIButton *)self->_laterButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = v55;
    [v55 addSubview:self->_laterButton];
    v51 = [(VTUIButton *)self->_laterButton leadingAnchor];
    uint64_t v57 = [v55 leadingAnchor];
    v31 = [v51 constraintEqualToAnchor:v57];
    v61[0] = v31;
    v32 = [(VTUIButton *)self->_laterButton trailingAnchor];
    v53 = [v55 trailingAnchor];
    v49 = [v32 constraintEqualToAnchor:v53];
    v61[1] = v49;
    v47 = [(VTUIButton *)self->_laterButton firstBaselineAnchor];
    v45 = [(VTUIButton *)self->_continueButton bottomAnchor];
    [v54 laterButtonBaselinePadding];
    v33 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45);
    v61[2] = v33;
    v34 = [(VTUIButton *)self->_laterButton bottomAnchor];
    v35 = [v55 bottomAnchor];
    [v54 footerSkipButtonBaselineFromBottom];
    v37 = [v34 constraintEqualToAnchor:v35 constant:-v36];
    v61[3] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
    v39 = v58;
    [v58 addObjectsFromArray:v38];

    v40 = v51;
    v41 = v54;
    v42 = (void *)v57;
  }
  else
  {
    v40 = [(VTUIButton *)self->_continueButton bottomAnchor];
    v30 = v55;
    v42 = [v55 bottomAnchor];
    v41 = v54;
    [v54 continueButtonFromBottom];
    v31 = [v40 constraintEqualToAnchor:v42 constant:-v43];
    v60 = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    v39 = v19;
    [v19 addObjectsFromArray:v32];
  }

  [v30 addConstraints:v39];
  return v30;
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
      uint64_t v5 = 1;
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (self->_footerView) {
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_7:
  id v6 = [(VTUIEnrollmentSetupIntroView *)self _createFooterWithTextFieldShowlaterButton:v5];
  v7 = self->_footerView;
  self->_footerView = v6;

LABEL_8:
  uint64_t v8 = self->_footerView;
  return v8;
}

- (VTUIButton)laterButton
{
  return self->_laterButton;
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end