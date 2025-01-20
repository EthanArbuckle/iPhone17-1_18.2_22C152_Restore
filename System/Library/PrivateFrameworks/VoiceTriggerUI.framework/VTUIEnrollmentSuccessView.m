@interface VTUIEnrollmentSuccessView
- (BOOL)isSuccessViewReady;
- (BOOL)showPrivacyTextView;
- (VTUIButton)finishButton;
- (VTUIEnrollmentSuccessView)initWithFrame:(CGRect)a3;
- (id)_createFooter;
- (id)footerView;
- (void)_setupContent;
- (void)addFinishButtonTarget:(id)a3 selector:(SEL)a4;
- (void)setHidden:(BOOL)a3;
@end

@implementation VTUIEnrollmentSuccessView

- (VTUIEnrollmentSuccessView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSuccessView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollmentSuccessView *)v3 _setupContent];
  }
  return v4;
}

- (void)_setupContent
{
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(VTUIEnrollmentSuccessView *)self setBackgroundColor:v3];

  v4 = +[VTUIStringsHelper sharedStringsHelper];
  v5 = [v4 uiLocalizedStringForKey:@"TEXT_TITLE_READY"];
  [(VTUIEnrollmentBaseView *)self setTitle:v5];

  objc_super v6 = +[VTUIStyle sharedStyle];
  int v7 = [v6 shouldSetupForMultipleTriggerPhrases];

  v8 = (void *)MEMORY[0x263F089D8];
  v9 = +[VTUIStyle sharedStyle];
  v10 = v9;
  if (v7)
  {
    v11 = [v9 VTUIDeviceSpecificString:@"TEXT_MAIN_READY_MIXED"];
    v12 = [v8 stringWithString:v11];

    v13 = +[VTUIStringsHelper sharedStringsHelper];
    v14 = v13;
    v15 = @"TEXT_MAIN_READY_MIXED_SPEAK_FREELY_SUFFIX";
  }
  else
  {
    v16 = [v9 VTUIDeviceSpecificString:@"TEXT_MAIN_READY"];
    v12 = [v8 stringWithString:v16];

    v13 = +[VTUIStringsHelper sharedStringsHelper];
    v14 = v13;
    v15 = @"TEXT_MAIN_READY_SPEAK_FREELY_SUFFIX";
  }
  id v19 = [v13 uiLocalizedStringForKey:v15];

  v17 = +[VTUIStyle sharedStyle];
  int v18 = [v17 supportsSiriConversationsAndBargeIn];

  if (v18) {
    [v12 appendString:v19];
  }
  [(VTUIEnrollmentBaseView *)self setSubtitle:v12];
}

- (id)_createFooter
{
  v31[5] = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = +[VTUIButton _vtuiButtonWithPrimaryStyle];
  finishButton = self->_finishButton;
  self->_finishButton = v6;

  [(VTUIButton *)self->_finishButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_finishButton];
  v8 = +[VTUIStyle sharedStyle];
  int v9 = [v8 isBuddyOrFollowUp];

  v10 = self->_finishButton;
  if (v9)
  {
    v11 = +[VTUIStyle sharedStyle];
    [v11 VTUIDeviceSpecificString:@"BUTTON_CONTINUE_SETUP"];
  }
  else
  {
    v11 = +[VTUIStringsHelper sharedStringsHelper];
    [v11 uiLocalizedStringForKey:@"BUTTON_DONE"];
  v12 = };
  [(VTUIButton *)v10 setTitle:v12 forState:0];

  v25 = (void *)MEMORY[0x263F08938];
  v30 = [(VTUIButton *)self->_finishButton topAnchor];
  v29 = [v5 topAnchor];
  [v3 continueButtonOffset];
  v28 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29);
  v31[0] = v28;
  v27 = [(VTUIButton *)self->_finishButton centerXAnchor];
  v26 = [v5 centerXAnchor];
  v13 = [v27 constraintEqualToAnchor:v26];
  v31[1] = v13;
  v14 = [(VTUIButton *)self->_finishButton widthAnchor];
  [v3 footerButtonMaximumWidth];
  v15 = objc_msgSend(v14, "constraintEqualToConstant:");
  v31[2] = v15;
  v16 = [(VTUIButton *)self->_finishButton heightAnchor];
  [v3 primaryButtonHeight];
  v17 = objc_msgSend(v16, "constraintEqualToConstant:");
  v31[3] = v17;
  int v18 = [(VTUIButton *)self->_finishButton bottomAnchor];
  id v19 = [v5 bottomAnchor];
  [v3 continueButtonFromBottom];
  [v18 constraintEqualToAnchor:v19 constant:-v20];
  v21 = v24 = v3;
  v31[4] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  [v25 activateConstraints:v22];

  return v5;
}

- (BOOL)showPrivacyTextView
{
  return 0;
}

- (id)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    id v4 = [(VTUIEnrollmentSuccessView *)self _createFooter];
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)setHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentSuccessView;
  [(VTUIEnrollmentSuccessView *)&v3 setHidden:a3];
}

- (BOOL)isSuccessViewReady
{
  return 1;
}

- (void)addFinishButtonTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = [(VTUIEnrollmentSuccessView *)self finishButton];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (VTUIButton)finishButton
{
  return self->_finishButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end