@interface VTUIVoiceTriggerConfirmationViewController
- (VTUIButton)continueButton;
- (VTUIButton)laterButton;
- (VTUIVoiceTriggerConfirmationViewController)initWithDelegate:(id)a3;
- (void)_setupContent;
@end

@implementation VTUIVoiceTriggerConfirmationViewController

- (VTUIVoiceTriggerConfirmationViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[VTUIStyle sharedStyle];
  int v6 = [v5 shouldSetupForMultipleTriggerPhrases];
  if (v6) {
    v7 = @"TEXT_TITLE_JUST_SAY_BOTH";
  }
  else {
    v7 = @"TEXT_TITLE_JUST_SAY_HEYSIRI";
  }
  v8 = @"TEXT_MAIN_READY_MIXED";
  if (!v6) {
    v8 = @"TEXT_MAIN_READY";
  }
  v9 = v8;
  v10 = v7;
  v11 = +[VTUIStringsHelper sharedStringsHelper];
  v12 = [v11 uiLocalizedStringForKey:v10];

  v13 = [v5 VTUIDeviceSpecificString:v9];

  v14 = [v5 siriIconImage];
  v17.receiver = self;
  v17.super_class = (Class)VTUIVoiceTriggerConfirmationViewController;
  v15 = [(VTUIVoiceTriggerConfirmationViewController *)&v17 initWithTitle:v12 detailText:v13 icon:v14];

  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v4);
    [(VTUIVoiceTriggerConfirmationViewController *)v15 _setupContent];
  }

  return v15;
}

- (void)_setupContent
{
  id v19 = +[VTUIStyle sharedStyle];
  int v3 = [v19 shouldSetupForMultipleTriggerPhrases];
  id v4 = @"BUTTON_LISTEN_FOR_HEYSIRI";
  if (v3) {
    id v4 = @"BUTTON_LISTEN_FOR_BOTH";
  }
  v5 = (void *)MEMORY[0x263F5B898];
  int v6 = v4;
  v7 = [v5 boldButton];
  v8 = [v19 VTUIDeviceSpecificString:v6];

  [(VTUIButton *)v7 setTitle:v8 forState:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(VTUIButton *)v7 addTarget:WeakRetained action:sel_siriVTConfirmationViewContinuePressed_ forControlEvents:64];

  v10 = [(VTUIVoiceTriggerConfirmationViewController *)self buttonTray];
  [v10 addButton:v7];

  continueButton = self->_continueButton;
  self->_continueButton = v7;
  v12 = v7;

  v13 = [MEMORY[0x263F5B8D0] linkButton];
  v14 = [v19 VTUIDeviceSpecificString:@"BUTTON_CONS_NOT_NOW"];
  [(VTUIButton *)v13 setTitle:v14 forState:0];

  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [(VTUIButton *)v13 addTarget:v15 action:sel_siriVTConfirmationViewLaterPressed_ forControlEvents:64];

  v16 = [(VTUIVoiceTriggerConfirmationViewController *)self buttonTray];
  [v16 addButton:v13];

  laterButton = self->_laterButton;
  self->_laterButton = v13;

  v18 = [(VTUIVoiceTriggerConfirmationViewController *)self buttonTray];
  [v18 setPrivacyLinkForBundles:&unk_26EB98E18];
}

- (VTUIButton)laterButton
{
  return self->_laterButton;
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end