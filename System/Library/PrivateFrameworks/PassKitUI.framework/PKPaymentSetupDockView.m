@interface PKPaymentSetupDockView
- (ASCLockupView)lockUpView;
- (BOOL)requiresAdditionalPrimaryButtonPadding;
- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4;
- (CGSize)_sizeThatFits:(CGSize)a3 includePrivacyLink:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsWithoutPrivacyLink:(CGSize)a3;
- (NSString)buttonExplanationText;
- (OBPrivacyLinkController)privacyLink;
- (PKLegacyButtonInterface)primaryButton;
- (PKPaymentSetupDockView)initWithFrame:(CGRect)a3 context:(int64_t)a4;
- (PKPaymentSetupFooterView)footerView;
- (UIColor)primaryButtonTintColor;
- (UITextView)buttonExplanationTextView;
- (UIView)additionalLinkView;
- (double)additionalLinkBottomPadding;
- (int64_t)context;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)setAdditionalLinkBottomPadding:(double)a3;
- (void)setAdditionalLinkView:(id)a3;
- (void)setButtonExplanationText:(id)a3;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setLockUpView:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setPrimaryButtonTintColor:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)setRequiresAdditionalPrimaryButtonPadding:(BOOL)a3;
@end

@implementation PKPaymentSetupDockView

- (PKPaymentSetupDockView)initWithFrame:(CGRect)a3 context:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupDockView;
  v5 = -[PKPaymentSetupDockView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a4;
    v7 = [(PKPaymentSetupDockView *)v5 traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      char IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else {
      char IsSetupAssistant = 0;
    }
    v6->_isBuddyiPad = IsSetupAssistant;
    v6->_useAdjacentLayout = 0;
    v6->_additionalLinkBottomPadding = 30.0;
    [(PKPaymentSetupDockView *)v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85490]];
  }
  return v6;
}

- (void)setPrivacyLink:(id)a3
{
  id v10 = a3;
  p_privacyLink = &self->_privacyLink;
  char v6 = PKEqualObjects();
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [(OBPrivacyLinkController *)*p_privacyLink view];
    [v8 removeFromSuperview];

    objc_storeStrong((id *)&self->_privacyLink, a3);
    if (*p_privacyLink)
    {
      v9 = [(OBPrivacyLinkController *)*p_privacyLink view];
      [(PKPaymentSetupDockView *)self addSubview:v9];
    }
    [(PKPaymentSetupDockView *)self setNeedsLayout];
    v7 = v10;
  }
}

- (void)setAdditionalLinkView:(id)a3
{
  v5 = (UIView *)a3;
  additionalLinkView = self->_additionalLinkView;
  if (additionalLinkView != v5)
  {
    v7 = v5;
    [(UIView *)additionalLinkView removeFromSuperview];
    objc_storeStrong((id *)&self->_additionalLinkView, a3);
    if (self->_additionalLinkView) {
      -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    }
    [(PKPaymentSetupDockView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setButtonExplanationText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [(PKPaymentSetupDockView *)self buttonExplanationTextView];
    [v5 setText:v8];
    [(PKPaymentSetupDockView *)self setNeedsLayout];
  }
  else
  {
    buttonExplanationTextView = self->_buttonExplanationTextView;
    if (!buttonExplanationTextView) {
      goto LABEL_6;
    }
    id v8 = 0;
    [(UITextView *)buttonExplanationTextView removeFromSuperview];
    v7 = self->_buttonExplanationTextView;
    self->_buttonExplanationTextView = 0;

    [(PKPaymentSetupDockView *)self setNeedsLayout];
  }
  id v4 = v8;
LABEL_6:
}

- (UITextView)buttonExplanationTextView
{
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (!buttonExplanationTextView)
  {
    objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_buttonExplanationTextView;
    self->_buttonExplanationTextView = v4;

    [(UITextView *)self->_buttonExplanationTextView setTextAlignment:1];
    char v6 = self->_buttonExplanationTextView;
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UITextView *)v6 setTextColor:v7];

    id v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UITextView *)self->_buttonExplanationTextView setFont:v8];
    -[UITextView setTextContainerInset:](self->_buttonExplanationTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)self->_buttonExplanationTextView setEditable:0];
    [(UITextView *)self->_buttonExplanationTextView setSelectable:1];
    [(UITextView *)self->_buttonExplanationTextView setScrollingEnabled:0];
    [(UITextView *)self->_buttonExplanationTextView _setInteractiveTextSelectionDisabled:1];
    [(PKPaymentSetupDockView *)self addSubview:self->_buttonExplanationTextView];
    [(PKPaymentSetupDockView *)self setNeedsLayout];

    buttonExplanationTextView = self->_buttonExplanationTextView;
  }

  return buttonExplanationTextView;
}

- (PKLegacyButtonInterface)primaryButton
{
  primaryButton = self->_primaryButton;
  if (!primaryButton)
  {
    if (self->_useAdjacentLayout) {
      PKCreateLargeSolidPillButton();
    }
    else {
    id v4 = PKCreateLargeSolidButton();
    }
    [v4 setExclusiveTouch:1];
    [v4 setTintColor:self->_primaryButtonTintColor];
    [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    objc_msgSend(v4, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
    v5 = [v4 titleLabel];
    [v5 setNumberOfLines:0];
    [v5 setTextAlignment:1];
    char v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2908], (NSString *)*MEMORY[0x1E4FB2790]);
    [v5 setFont:v6];

    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKPaymentSetupDockView *)self setPrimaryButton:v4];

    primaryButton = self->_primaryButton;
  }

  return primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  v5 = (PKLegacyButtonInterface *)a3;
  p_primaryButton = &self->_primaryButton;
  primaryButton = self->_primaryButton;
  if (primaryButton != v5)
  {
    v9 = v5;
    [(PKLegacyButtonInterface *)primaryButton removeFromSuperview];
    objc_storeStrong((id *)&self->_primaryButton, a3);
    if (*p_primaryButton)
    {
      if (self->_useAdjacentLayout)
      {
        id v8 = [(PKPaymentSetupDockView *)self footerView];
        [v8 setPrimaryButton:*p_primaryButton];
      }
      else
      {
        -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
      }
    }
    [(PKPaymentSetupDockView *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setPrimaryButtonTintColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_primaryButtonTintColor, a3);
  primaryButton = self->_primaryButton;
  if (primaryButton) {
    [(PKLegacyButtonInterface *)primaryButton setTintColor:v6];
  }
}

- (UIColor)primaryButtonTintColor
{
  return self->_primaryButtonTintColor;
}

- (void)setAdditionalLinkBottomPadding:(double)a3
{
  self->_additionalLinkBottomPadding = a3;
  [(PKPaymentSetupDockView *)self setNeedsLayout];
}

- (void)setLockUpView:(id)a3
{
  v5 = (ASCLockupView *)a3;
  lockUpView = self->_lockUpView;
  if (lockUpView != v5)
  {
    v7 = v5;
    [(ASCLockupView *)lockUpView removeFromSuperview];
    objc_storeStrong((id *)&self->_lockUpView, a3);
    if (self->_lockUpView) {
      -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    }
    [(PKPaymentSetupDockView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (PKPaymentSetupFooterView)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    id v4 = [PKPaymentSetupFooterView alloc];
    v5 = -[PKPaymentSetupFooterView initWithFrame:context:](v4, "initWithFrame:context:", self->_context, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PKPaymentSetupDockView *)self setFooterView:v5];

    footerView = self->_footerView;
  }

  return footerView;
}

- (void)setFooterView:(id)a3
{
  v5 = (PKPaymentSetupFooterView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    id v8 = v5;
    [(PKPaymentSetupFooterView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (*p_footerView)
    {
      if (self->_useAdjacentLayout) {
        [(PKPaymentSetupFooterView *)*p_footerView setPrimaryButton:self->_primaryButton];
      }
    }
    else if (!self->_primaryButton)
    {
LABEL_7:
      [(PKPaymentSetupDockView *)self setNeedsLayout];
      v5 = v8;
      goto LABEL_8;
    }
    -[PKPaymentSetupDockView addSubview:](self, "addSubview:");
    goto LABEL_7;
  }
LABEL_8:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentSetupDockView _sizeThatFits:includePrivacyLink:](self, "_sizeThatFits:includePrivacyLink:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsWithoutPrivacyLink:(CGSize)a3
{
  -[PKPaymentSetupDockView _sizeThatFits:includePrivacyLink:](self, "_sizeThatFits:includePrivacyLink:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 includePrivacyLink:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  BOOL v8 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  double v9 = 24.0;
  if (v8)
  {
    double v9 = 44.0;
    if (self->_useAdjacentLayout) {
      double v9 = 24.0;
    }
  }
  double v10 = width + v9 * -2.0;
  -[PKPaymentSetupFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v10, height);
  double v12 = v11;
  additionalLinkView = self->_additionalLinkView;
  if (additionalLinkView)
  {
    -[UIView sizeThatFits:](additionalLinkView, "sizeThatFits:", v10, height);
    double v15 = v14 + self->_additionalLinkBottomPadding + 11.0;
  }
  else
  {
    double v15 = 0.0;
  }
  privacyLink = self->_privacyLink;
  if (privacyLink) {
    BOOL v17 = !v4;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if (v15 == 0.0) {
      double v18 = 11.0;
    }
    else {
      double v18 = 0.0;
    }
    v19 = [(OBPrivacyLinkController *)privacyLink view];
    objc_msgSend(v19, "setFrame:", 0.0, v15, v10, 0.0);
    [v19 setNeedsLayout];
    [v19 layoutIfNeeded];
    LODWORD(v20) = 1148846080;
    LODWORD(v21) = 1112014848;
    objc_msgSend(v19, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, height, v20, v21);
    double v15 = v15 + v18 + v22 + 30.0;
  }
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (buttonExplanationTextView)
  {
    if (v15 == 0.0) {
      double v24 = 24.0;
    }
    else {
      double v24 = 0.0;
    }
    -[UITextView sizeThatFits:](buttonExplanationTextView, "sizeThatFits:", v10, height);
    double v15 = v15 + v24 + v25 + 25.0;
  }
  lockUpView = self->_lockUpView;
  if (lockUpView)
  {
    if (v15 == 0.0) {
      double v27 = 5.0;
    }
    else {
      double v27 = 0.0;
    }
    -[ASCLockupView sizeThatFits:](lockUpView, "sizeThatFits:", v10, height);
    double v15 = v15 + v27 + v28 + 5.0;
  }
  primaryButton = self->_primaryButton;
  if (v15 == 0.0 && primaryButton != 0) {
    double v15 = v15 + 24.0;
  }
  if (!primaryButton)
  {
    if (!self->_footerView) {
      goto LABEL_51;
    }
    goto LABEL_40;
  }
  if (self->_useAdjacentLayout && self->_footerView) {
    goto LABEL_40;
  }
  [(PKPaymentSetupDockView *)self _sizeForButton:v10 constrainedToSize:height];
  if (v31 >= 50.0)
  {
    -[PKPaymentSetupDockView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_primaryButton, v10, height);
    double v32 = v33 + 5.0;
  }
  else
  {
    double v32 = 55.0;
  }
  double v15 = v15 + v32;
  footerView = self->_footerView;
  if (self->_useAdjacentLayout)
  {
    if (!footerView) {
      goto LABEL_51;
    }
    goto LABEL_40;
  }
  if (footerView && v12 != 0.0) {
    goto LABEL_40;
  }
  double v35 = 43.5;
  if (!self->_requiresAdditionalPrimaryButtonPadding) {
    double v35 = 28.0;
  }
  double v15 = v15 + v35;
  if (footerView)
  {
LABEL_40:
    double v15 = v12 + v15;
    if (!self->_primaryButton && !self->_privacyLink && !self->_lockUpView && !self->_additionalLinkView) {
      double v15 = v15 + 28.0;
    }
  }
LABEL_51:
  double v36 = width;
  double v37 = v15;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)PKPaymentSetupDockView;
  [(PKPaymentSetupDockView *)&v67 layoutSubviews];
  if (self->_isBuddyiPad)
  {
    double v3 = [(PKPaymentSetupDockView *)self readableContentGuide];
    [v3 layoutFrame];
    double v66 = v4;
    CGFloat v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    [(PKPaymentSetupDockView *)self bounds];
    double v66 = v11;
    CGFloat v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  double v15 = 0.0;
  double v16 = 0.0;
  if (!self->_isBuddyiPad)
  {
    double v16 = 24.0;
    if ([(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      if (self->_useAdjacentLayout) {
        double v16 = 24.0;
      }
      else {
        double v16 = 44.0;
      }
    }
  }
  v68.origin.x = v66;
  v68.origin.y = v6;
  v68.size.double width = v8;
  v68.size.double height = v10;
  double v17 = CGRectGetWidth(v68) + v16 * -2.0;
  v69.origin.x = v66;
  v69.origin.y = v6;
  v69.size.double width = v8;
  v69.size.double height = v10;
  double Height = CGRectGetHeight(v69);
  double v19 = v66 + v16;
  additionalLinkView = self->_additionalLinkView;
  double v65 = Height;
  if (additionalLinkView)
  {
    -[UIView sizeThatFits:](additionalLinkView, "sizeThatFits:", v17, Height);
    CGFloat v22 = v21;
    -[UIView setFrame:](self->_additionalLinkView, "setFrame:", v19, 11.0, v17, v21);
    v70.origin.y = 11.0;
    v70.origin.x = v66 + v16;
    v70.size.double width = v17;
    v70.size.double height = v22;
    double Height = v65;
    double v15 = CGRectGetMaxY(v70) + self->_additionalLinkBottomPadding;
  }
  privacyLink = self->_privacyLink;
  double v64 = v66 + v16;
  if (privacyLink)
  {
    double v24 = v6;
    double v25 = v10;
    double v26 = v8;
    if (v15 == 0.0) {
      double v27 = 11.0;
    }
    else {
      double v27 = 0.0;
    }
    double v28 = [(OBPrivacyLinkController *)privacyLink view];
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, v17, 0.0);
    [v28 setNeedsLayout];
    [v28 layoutIfNeeded];
    LODWORD(v29) = 1148846080;
    LODWORD(v30) = 1112014848;
    objc_msgSend(v28, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v17, Height, v29, v30);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v35 = v15 + v27;
    double v8 = v26;
    double v10 = v25;
    CGFloat v6 = v24;
    double v19 = v64;
    double v36 = [(OBPrivacyLinkController *)self->_privacyLink view];
    PKRectCenteredXInRect();
    objc_msgSend(v36, "setFrame:");

    v71.origin.x = v64;
    v71.origin.y = v35;
    v71.size.double width = v32;
    v71.size.double height = v34;
    double v15 = CGRectGetMaxY(v71) + 30.0;
  }
  buttonExplanationTextView = self->_buttonExplanationTextView;
  if (buttonExplanationTextView)
  {
    if (v15 == 0.0) {
      double v38 = 24.0;
    }
    else {
      double v38 = v15;
    }
    double v39 = v65;
    -[UITextView sizeThatFits:](buttonExplanationTextView, "sizeThatFits:", v17, v65);
    CGFloat v41 = v40;
    -[UITextView setFrame:](self->_buttonExplanationTextView, "setFrame:", v19, v38, v17, v40);
    v72.origin.x = v19;
    v72.origin.y = v38;
    v72.size.double width = v17;
    v72.size.double height = v41;
    double v15 = CGRectGetMaxY(v72) + 25.0;
  }
  else
  {
    double v39 = v65;
  }
  lockUpView = self->_lockUpView;
  CGFloat v63 = v6;
  if (lockUpView)
  {
    if (v15 == 0.0) {
      double v43 = 5.0;
    }
    else {
      double v43 = v15;
    }
    -[ASCLockupView sizeThatFits:](lockUpView, "sizeThatFits:", v17, v39, *(void *)&v6);
    CGFloat v45 = v44;
    -[ASCLockupView setFrame:](self->_lockUpView, "setFrame:", v19, v43, v17, v44);
    v73.origin.x = v19;
    v73.origin.y = v43;
    v73.size.double width = v17;
    v73.size.double height = v45;
    double v15 = CGRectGetMaxY(v73) + 5.0;
  }
  primaryButton = self->_primaryButton;
  if (v15 != 0.0 || primaryButton == 0) {
    double v48 = v15;
  }
  else {
    double v48 = v15 + 24.0;
  }
  if (primaryButton && (!self->_useAdjacentLayout || !self->_footerView))
  {
    -[PKPaymentSetupDockView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", v17, v65, *(void *)&v63);
    double v51 = v50;
    double v52 = v10;
    double v53 = v8;
    if (self->_useAdjacentLayout) {
      double v54 = (v17 + -12.0) * 0.5;
    }
    else {
      double v54 = 327.0;
    }
    CGFloat v55 = *MEMORY[0x1E4F1DB28];
    if (v49 >= 50.0) {
      double v56 = v49;
    }
    else {
      double v56 = 50.0;
    }
    BOOL v57 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
    if (v54 <= v51) {
      double v58 = v51;
    }
    else {
      double v58 = v54;
    }
    double v8 = v53;
    double v10 = v52;
    double v19 = v64;
    if (v57) {
      CGFloat v59 = v58;
    }
    else {
      CGFloat v59 = v17;
    }
    v60 = self->_primaryButton;
    PKRectCenteredXInRect();
    -[PKLegacyButtonInterface pkui_setBoundsAndPositionFromFrame:](v60, "pkui_setBoundsAndPositionFromFrame:");
    v74.origin.x = v55;
    v74.origin.y = v48;
    v74.size.double width = v59;
    v74.size.double height = v56;
    double v48 = CGRectGetMaxY(v74) + 5.0;
  }
  footerView = self->_footerView;
  if (footerView)
  {
    if (!self->_primaryButton && !self->_privacyLink && !self->_lockUpView) {
      double v48 = v48 + 28.0;
    }
    -[PKPaymentSetupFooterView sizeThatFits:](footerView, "sizeThatFits:", v8, v10, *(void *)&v63);
    -[PKPaymentSetupFooterView setFrame:](self->_footerView, "setFrame:", v19, v48, v17, v62);
  }
}

- (void)setButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PKLegacyButtonInterface setEnabled:](self->_primaryButton, "setEnabled:");
  [(PKPaymentSetupFooterView *)self->_footerView setButtonsEnabled:v3];
  lockUpView = self->_lockUpView;

  [(ASCLockupView *)lockUpView setUserInteractionEnabled:v3];
}

- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v9 = [v6 currentTitle];
  double v10 = (void *)v9;
  if (v6 && v9)
  {
    double v11 = [v6 titleLabel];
    double v12 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
    double v13 = (void *)[v12 mutableCopy];

    objc_msgSend(v13, "setAlignment:", objc_msgSend(v11, "textAlignment"));
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    v22[0] = *MEMORY[0x1E4FB06F8];
    double v15 = [v11 font];
    v22[1] = *MEMORY[0x1E4FB0738];
    v23[0] = v15;
    v23[1] = v13;
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    double v17 = (void *)[v14 initWithString:v10 attributes:v16];

    objc_msgSend(v17, "pkui_sizeThatFits:", width, height);
    double v7 = v18;
    double v8 = v19;
  }
  double v20 = v7;
  double v21 = v8;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (BOOL)requiresAdditionalPrimaryButtonPadding
{
  return self->_requiresAdditionalPrimaryButtonPadding;
}

- (void)setRequiresAdditionalPrimaryButtonPadding:(BOOL)a3
{
  self->_requiresAdditionalPrimaryButtonPadding = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (double)additionalLinkBottomPadding
{
  return self->_additionalLinkBottomPadding;
}

- (UIView)additionalLinkView
{
  return self->_additionalLinkView;
}

- (NSString)buttonExplanationText
{
  return self->_buttonExplanationText;
}

- (ASCLockupView)lockUpView
{
  return self->_lockUpView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockUpView, 0);
  objc_storeStrong((id *)&self->_buttonExplanationText, 0);
  objc_storeStrong((id *)&self->_additionalLinkView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_buttonExplanationTextView, 0);
  objc_storeStrong((id *)&self->_primaryButtonTintColor, 0);

  objc_storeStrong((id *)&self->_primaryButton, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupDockView;
  id v4 = a3;
  [(UIView *)&v6 pk_applyAppearance:v4];
  double v5 = objc_msgSend(v4, "continueButtonTintColor", v6.receiver, v6.super_class);

  [(PKPaymentSetupDockView *)self setPrimaryButtonTintColor:v5];
}

@end