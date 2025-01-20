@interface VTUIVoiceSelectionView
- (UIButton)chooseRandomVoiceButton;
- (UIButton)continueButton;
- (UIButton)dismissButton;
- (VTUIVoiceSelectionView)initWithAllowsRandomVoiceSelection:(BOOL)a3 showContinueButton:(BOOL)a4;
- (id)footerView;
- (void)_setupButtons;
- (void)setChooseRandomVoiceButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)tintColorDidChange;
@end

@implementation VTUIVoiceSelectionView

- (VTUIVoiceSelectionView)initWithAllowsRandomVoiceSelection:(BOOL)a3 showContinueButton:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VTUIVoiceSelectionView;
  v6 = [(VTUIVoiceSelectionView *)&v11 init];
  if (v6)
  {
    v7 = +[VTUIStyle sharedStyle];
    [v7 setIsFloatingWithReducedWidth:1];

    v6->_allowsRandomSelection = a3;
    v6->_shouldShowContinueButton = a4;
    [(VTUIVoiceSelectionView *)v6 _setupButtons];
    [(VTUIEnrollmentBaseView *)v6 setShowsVerticalScrollIndicator:0];
    if (!v6->_shouldShowContinueButton && !v6->_allowsRandomSelection)
    {
      v8 = [(VTUIEnrollmentBaseView *)v6 backdropView];
      [v8 setHidden:1];

      v9 = [(VTUIVoiceSelectionView *)v6 footerView];
      [v9 setUserInteractionEnabled:0];
    }
  }
  return v6;
}

- (void)tintColorDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)VTUIVoiceSelectionView;
  [(VTUIVoiceSelectionView *)&v8 tintColorDidChange];
  continueButton = self->_continueButton;
  v4 = [(VTUIVoiceSelectionView *)self tintColor];
  v5 = +[VTUIButton vtuiBackgroundButtonImageWithColor:v4];
  [(UIButton *)continueButton setBackgroundImage:v5 forState:0];

  chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
  v7 = [(VTUIVoiceSelectionView *)self tintColor];
  [(UIButton *)chooseRandomVoiceButton setTitleColor:v7 forState:0];
}

- (id)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)_setupButtons
{
  v58[4] = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  v4 = [(VTUIVoiceSelectionView *)self footerView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_shouldShowContinueButton)
  {
    v5 = +[VTUIButton _vtuiButtonWithPrimaryStyleForNormalAndDisabledState];
    continueButton = self->_continueButton;
    self->_continueButton = v5;

    [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:self->_continueButton];
    v7 = self->_continueButton;
    objc_super v8 = [v3 VTUIDeviceSpecificString:@"BUTTON_CONTINUE_SETUP"];
    [(UIButton *)v7 setTitle:v8 forState:0];

    [v4 addSubview:self->_continueButton];
    [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = (void *)MEMORY[0x263F08938];
    v52 = [(UIButton *)self->_continueButton topAnchor];
    v50 = [v4 topAnchor];
    [v3 continueButtonOffset];
    v47 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50);
    v58[0] = v47;
    v45 = [(UIButton *)self->_continueButton centerXAnchor];
    v9 = [v4 centerXAnchor];
    [v45 constraintEqualToAnchor:v9];
    v48 = v4;
    objc_super v11 = v10 = v3;
    v58[1] = v11;
    v12 = [(UIButton *)self->_continueButton widthAnchor];
    [v10 footerButtonMaximumWidth];
    v13 = objc_msgSend(v12, "constraintEqualToConstant:");
    v58[2] = v13;
    v14 = [(UIButton *)self->_continueButton heightAnchor];
    [v10 primaryButtonHeight];
    v15 = objc_msgSend(v14, "constraintEqualToConstant:");
    v58[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];
    [v46 activateConstraints:v16];

    LODWORD(v14) = self->_allowsRandomSelection;
    v17 = (void *)MEMORY[0x263F08938];
    v18 = [(UIButton *)self->_continueButton bottomAnchor];
    v19 = [v48 bottomAnchor];
    if (v14)
    {
      [v10 continueButtonFromBottomTwoButtons];
      v21 = [v18 constraintEqualToAnchor:v19 constant:-v20];
      v56 = v21;
      v22 = &v56;
    }
    else
    {
      [v10 continueButtonFromBottom];
      v21 = [v18 constraintEqualToAnchor:v19 constant:-v23];
      v57 = v21;
      v22 = &v57;
    }
    v3 = v10;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [v17 activateConstraints:v24];

    v4 = v48;
  }
  if (self->_allowsRandomSelection)
  {
    v25 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
    chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
    self->_chooseRandomVoiceButton = v25;

    [(UIButton *)self->_chooseRandomVoiceButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = self->_chooseRandomVoiceButton;
    v28 = [v3 VTUIDeviceSpecificString:@"BUTTON_CHOOSE_FOR_ME"];
    [(UIButton *)v27 setTitle:v28 forState:0];

    [v4 addSubview:self->_chooseRandomVoiceButton];
    v29 = [(UIButton *)self->_chooseRandomVoiceButton topAnchor];
    v30 = [v4 topAnchor];
    [v3 continueButtonOffset];
    v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);

    if (self->_shouldShowContinueButton)
    {
      v32 = [(UIButton *)self->_chooseRandomVoiceButton leadingAnchor];
      v33 = [(UIButton *)self->_continueButton leadingAnchor];
      uint64_t v34 = [v32 constraintEqualToAnchor:v33];

      v31 = (void *)v34;
    }
    v49 = (void *)MEMORY[0x263F08938];
    v51 = v31;
    v55[0] = v31;
    v53 = [(UIButton *)self->_chooseRandomVoiceButton widthAnchor];
    [v3 footerButtonMaximumWidth];
    v35 = objc_msgSend(v53, "constraintEqualToConstant:");
    v55[1] = v35;
    v36 = [(UIButton *)self->_chooseRandomVoiceButton bottomAnchor];
    [v4 bottomAnchor];
    v38 = v37 = v4;
    [v3 footerSkipButtonBaselineFromBottom];
    [v36 constraintEqualToAnchor:v38 constant:-v39];
    v40 = v54 = v3;
    v55[2] = v40;
    v41 = [(UIButton *)self->_chooseRandomVoiceButton centerXAnchor];
    v42 = [v37 centerXAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v55[3] = v43;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
    [v49 activateConstraints:v44];

    v3 = v54;
    v4 = v37;
  }
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIButton)chooseRandomVoiceButton
{
  return self->_chooseRandomVoiceButton;
}

- (void)setChooseRandomVoiceButton:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end