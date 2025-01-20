@interface VTUIEnrollmentSetupIntroViewControllerOrb
- (BOOL)isLaterButtonAvailable;
- (BOOL)shouldCleanupForEnrollment;
- (NSString)languageCode;
- (VTUIButton)continueButton;
- (VTUIButton)laterButton;
- (VTUIEnrollmentSetupIntroViewControllerOrb)initWithDelegate:(id)a3;
- (void)_fadeInSubViews;
- (void)_setupContent;
- (void)enrollmentWillAppear;
- (void)setContinueButtonEnabled:(BOOL)a3;
- (void)setLaterButtonEnabled:(BOOL)a3;
@end

@implementation VTUIEnrollmentSetupIntroViewControllerOrb

- (BOOL)isLaterButtonAvailable
{
  return self->_laterButton != 0;
}

- (void)setContinueButtonEnabled:(BOOL)a3
{
}

- (void)setLaterButtonEnabled:(BOOL)a3
{
}

- (BOOL)shouldCleanupForEnrollment
{
  return 1;
}

- (void)enrollmentWillAppear
{
  id v2 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self view];
  [v2 removeFromSuperview];
}

- (VTUIEnrollmentSetupIntroViewControllerOrb)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[VTUIStyle sharedStyle];
  int v6 = [v5 shouldSetupForMultipleTriggerPhrases];
  self->_showSiriConversations = [v5 supportsSiriConversationsAndBargeIn];
  self->_isPostUpgradeDisclosure = [v5 shouldPresentDisclosureForCompactVoiceTrigger];
  self->_includeHomePodInDisclosure = [v5 shouldIncludeHomePodInCompactTriggerDisclosure] & (v6 ^ 1);
  if ((v6 ^ 1)) {
    char v7 = 0;
  }
  else {
    char v7 = [v4 allLanguageOptionsSupportCompactTrigger];
  }
  self->_showMultitriggerForSetup = v7;
  uint64_t v8 = [v5 enrollmentMode];
  if (v8 == 3)
  {
    v11 = @"ASSISTANT_DESCRIPTION";
    if (v6) {
      v11 = @"ASSISTANT_DESCRIPTION_SHORT";
    }
  }
  else
  {
    if (v8 == 4)
    {
      if (self->_showMultitriggerForSetup) {
        v9 = @"TEXT_TITLE_SETUP_BOTH";
      }
      else {
        v9 = @"TEXT_TITLE_SETUP_HEYSIRI";
      }
      v10 = v9;
      if (self->_showMultitriggerForSetup) {
        v11 = @"HEY_SIRI_DESCRIPTION_BOTH";
      }
      else {
        v11 = @"HEY_SIRI_DESCRIPTION";
      }
      goto LABEL_15;
    }
    if (self->_isPostUpgradeDisclosure)
    {
      v12 = @"SIRI_CONVERSATIONS_SUBTITLE";
      v10 = @"SIRI_CONVERSATIONS_TITLE";
      goto LABEL_18;
    }
    if (AFDeviceSupportsSAE())
    {
      v10 = @"TEXT_TITLE_CONS";
      v11 = @"ASSISTANT_DESCRIPTION_SAE_ELIGIBLE";
      goto LABEL_15;
    }
    if (self->_showMultitriggerForSetup) {
      v11 = @"ASSISTANT_DESCRIPTION_SHORT";
    }
    else {
      v11 = @"ASSISTANT_DESCRIPTION";
    }
  }
  v10 = @"TEXT_TITLE_CONS";
LABEL_15:
  v12 = v11;
LABEL_18:
  v13 = +[VTUIStringsHelper sharedStringsHelper];
  v14 = [v13 uiLocalizedStringForKey:v10];

  v15 = [v5 VTUIDeviceSpecificString:v12];
  if ([v5 isBuddyOrFollowUp]
    && [v5 bluetoothDeviceSupportsHeySiri])
  {
    v16 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v17 = [v16 uiLocalizedStringForKey:@"TEXT_TITLE_SETUP_HEYSIRI"];

    uint64_t v18 = [v5 proxHSDescription:@"HEY_SIRI_DESCRIPTION_PROX"];

    v14 = (void *)v17;
    v15 = (void *)v18;
  }
  v19 = [v5 siriIconImage];
  v22.receiver = self;
  v22.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrb;
  v20 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)&v22 initWithTitle:v14 detailText:v15 icon:v19];

  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v4);
    [(VTUIEnrollmentSetupIntroViewControllerOrb *)v20 _setupContent];
  }

  return v20;
}

- (void)_setupContent
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[VTUIEnrollmentSetupIntroViewControllerOrb _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", buf, 0xCu);
  }
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v5 = [v4 languageCode];
  languageCode = self->_languageCode;
  self->_languageCode = v5;

  char v7 = +[VTUIStyle sharedStyle];
  uint64_t v8 = [v7 enrollmentMode];
  uint64_t v9 = v8;
  if (self->_isPostUpgradeDisclosure)
  {
    v10 = [MEMORY[0x263F827E8] systemImageNamed:@"quote.bubble"];
    v11 = [v7 VTUIDeviceSpecificString:@"SAY_SIRI_OR_HS_BULLET_TITLE"];
    v12 = [v7 VTUIDeviceSpecificString:@"SAY_SIRI_OR_HS_BULLET_DESC"];
    v13 = [MEMORY[0x263F825C8] systemBlueColor];
    [(VTUIEnrollmentSetupIntroViewControllerOrb *)self addBulletedListItemWithTitle:v11 description:v12 image:v10 tintColor:v13];

    if (!self->_showSiriConversations)
    {
LABEL_20:

      goto LABEL_21;
    }
    v14 = [MEMORY[0x263F827E8] systemImageNamed:@"person.wave.2"];
    v15 = [v7 VTUIDeviceSpecificString:@"SPEAK_FREELY_BULLET_TITLE"];
    v16 = [v7 VTUIDeviceSpecificString:@"SPEAK_FREELY_BULLET_DESC"];
    uint64_t v17 = [MEMORY[0x263F825C8] systemBlueColor];
    [(VTUIEnrollmentSetupIntroViewControllerOrb *)self addBulletedListItemWithTitle:v15 description:v16 image:v14 tintColor:v17];
LABEL_19:

    goto LABEL_20;
  }
  if (self->_showMultitriggerForSetup && v8 != 4)
  {
    v10 = [MEMORY[0x263F827E8] systemImageNamed:@"quote.bubble"];
    v15 = [MEMORY[0x263F827E8] _systemImageNamed:@"iphone.side.button.arrow.left"];
    if ([v7 isIpad])
    {
      int v19 = [v7 supportsSideButtonActivation];
      v20 = (void *)MEMORY[0x263F827E8];
      if (v19)
      {
        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v22 = [v20 imageNamed:@"ipad.top.button.arrow.down" inBundle:v21 compatibleWithTraitCollection:0];

        v14 = @"PRESS_AND_HOLD_BULLET_TITLE";
        v15 = (void *)v22;
LABEL_18:
        v26 = [v7 VTUIDeviceSpecificString:@"JUST_SAY_SIRI_BULLET_TITLE"];
        v27 = [v7 VTUIDeviceSpecificString:@"JUST_SAY_SIRI_BULLET_DESC"];
        v28 = [MEMORY[0x263F825C8] systemBlueColor];
        [(VTUIEnrollmentSetupIntroViewControllerOrb *)self addBulletedListItemWithTitle:v26 description:v27 image:v10 tintColor:v28];

        v16 = [v7 VTUIDeviceSpecificString:v14];
        uint64_t v17 = [v7 VTUIDeviceSpecificString:@"PRESS_AND_HOLD_BULLET_DESC"];
        v29 = [MEMORY[0x263F825C8] systemBlueColor];
        [(VTUIEnrollmentSetupIntroViewControllerOrb *)self addBulletedListItemWithTitle:v16 description:v17 image:v15 tintColor:v29];

        goto LABEL_19;
      }
      v23 = @"ipad.gen1";
      v24 = (void *)MEMORY[0x263F827E8];
    }
    else
    {
      if ([v7 supportSideButtonActivation])
      {
        v14 = @"PRESS_AND_HOLD_BULLET_TITLE";
        goto LABEL_18;
      }
      v24 = (void *)MEMORY[0x263F827E8];
      v23 = @"iphone.gen1";
    }
    uint64_t v25 = [v24 _systemImageNamed:v23];

    v14 = [v7 VTUIDeviceSpecificString:@"PRESS_AND_HOLD_BULLET_TITLE_HOME"];
    v15 = (void *)v25;
    goto LABEL_18;
  }
LABEL_21:
  BOOL v30 = self->_isPostUpgradeDisclosure && self->_includeHomePodInDisclosure;
  uint64_t v31 = [v7 enrollmentMode];
  v32 = @"BUTTON_CONTINUE_LATER";
  if (v30) {
    v32 = @"BUTTON_SETUP_LATER";
  }
  v33 = @"BUTTON_CONTINUE_SETUP";
  if (v31 == 3)
  {
    v33 = @"BUTTON_TURN_ON_SIRI";
    v32 = @"BUTTON_CONTINUE_LATER";
  }
  if (v31 == 4) {
    v34 = @"BUTTON_CONTINUE_SETUP";
  }
  else {
    v34 = v33;
  }
  if (v31 == 4) {
    v35 = @"BUTTON_SET_UP_LATER";
  }
  else {
    v35 = v32;
  }
  v36 = [MEMORY[0x263F5B898] boldButton];
  v37 = [v7 VTUIDeviceSpecificString:v34];
  [v36 setTitle:v37 forState:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v36 addTarget:WeakRetained action:sel_siriIntroViewControllerContinuePressed_ forControlEvents:64];

  v39 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self buttonTray];
  [v39 addButton:v36];

  objc_storeStrong((id *)&self->_continueButton, v36);
  if (!v30 && self->_isPostUpgradeDisclosure) {
    goto LABEL_49;
  }
  if ([v7 isBuddyOrFollowUp])
  {
    v40 = [MEMORY[0x263F5B8D0] linkButton];
    v41 = [v7 VTUIDeviceSpecificString:v35];
    [(VTUIButton *)v40 setTitle:v41 forState:0];

    id v42 = objc_loadWeakRetained((id *)&self->_delegate);
    [(VTUIButton *)v40 addTarget:v42 action:sel_siriIntroViewControllerLaterPressed_ forControlEvents:64];

    v43 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self buttonTray];
    [v43 addButton:v40];

    laterButton = self->_laterButton;
    self->_laterButton = v40;
  }
  if (self->_isPostUpgradeDisclosure)
  {
LABEL_49:
    if ([v7 isGreenTeaCapableDevice]) {
      v45 = @"POST_UPGRADE_FOOTER_CHINA";
    }
    else {
      v45 = @"POST_UPGRADE_FOOTER";
    }
    v46 = [v7 VTUIDeviceSpecificString:v45];
    v47 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self buttonTray];
    [v47 setCaptionText:v46];
  }
  else
  {
    if (v9 == 4) {
      goto LABEL_44;
    }
    v46 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self buttonTray];
    [v46 setPrivacyLinkForBundles:&unk_26EB98E30];
  }

LABEL_44:
}

- (void)_fadeInSubViews
{
  v3 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self headerView];
  [v3 setAlpha:0.0];

  id v4 = [(VTUIEnrollmentSetupIntroViewControllerOrb *)self contentView];
  [v4 setAlpha:0.0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke;
  v6[3] = &unk_264D4C280;
  v6[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 options:0 animations:0.400000006 completion:0.0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke_2;
  v5[3] = &unk_264D4C280;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v5 options:0 animations:0.400000006 completion:0.300000012];
}

void __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) headerView];
  [v1 setAlpha:1.0];
}

void __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end