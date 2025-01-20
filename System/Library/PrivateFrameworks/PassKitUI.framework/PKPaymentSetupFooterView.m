@interface PKPaymentSetupFooterView
- (BOOL)_useAdjacentLayout;
- (BOOL)forceShowSetupLaterButton;
- (CGSize)_adjacentButtonSizeConstrainedToSize:(CGSize)a3;
- (CGSize)_sizeForLabel:(id)a3 maxText:(id)a4 constrainedToSize:(CGSize)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKLegacyButtonInterface)primaryButton;
- (PKPaymentSetupFooterView)initWithFrame:(CGRect)a3 context:(int64_t)a4;
- (UIButton)manualEntryButton;
- (UIButton)secondaryActionButton;
- (UIButton)setupLaterButton;
- (UIButton)skipCardButton;
- (UIButton)tertiaryActionButton;
- (UILabel)notificationText;
- (id)_alternateActionButtonWithTitle:(id)a3;
- (int64_t)context;
- (void)_createSetupLaterButton;
- (void)_setUIView:(id)a3 forVariable:(id *)a4;
- (void)layoutSubviews;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setContext:(int64_t)a3;
- (void)setForceShowSetupLaterButton:(BOOL)a3;
- (void)setManualEntryButton:(id)a3;
- (void)setNotificationText:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryActionButton:(id)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setSkipCardButton:(id)a3;
- (void)setTertiaryActionButton:(id)a3;
@end

@implementation PKPaymentSetupFooterView

- (PKPaymentSetupFooterView)initWithFrame:(CGRect)a3 context:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFooterView;
  v5 = -[PKPaymentSetupFooterView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a4;
    v7 = PKLocalizedPaymentString(&cfstr_AddADifferentC.isa);
    uint64_t v8 = [(PKPaymentSetupFooterView *)v6 _alternateActionButtonWithTitle:v7];
    manualEntryButton = v6->_manualEntryButton;
    v6->_manualEntryButton = (UIButton *)v8;

    [(PKPaymentSetupFooterView *)v6 addSubview:v6->_manualEntryButton];
    [(PKPaymentSetupFooterView *)v6 _createSetupLaterButton];
    [(PKPaymentSetupFooterView *)v6 setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
  }
  return v6;
}

- (void)setNotificationText:(id)a3
{
}

- (void)setPrimaryButton:(id)a3
{
}

- (void)setSkipCardButton:(id)a3
{
}

- (void)setManualEntryButton:(id)a3
{
}

- (void)setSetupLaterButton:(id)a3
{
}

- (void)setForceShowSetupLaterButton:(BOOL)a3
{
  if (self->_forceShowSetupLaterButton != a3)
  {
    self->_forceShowSetupLaterButton = a3;
    [(PKPaymentSetupFooterView *)self setSetupLaterButton:0];
    [(PKPaymentSetupFooterView *)self _createSetupLaterButton];
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
  }
}

- (void)_setUIView:(id)a3 forVariable:(id *)a4
{
  id v7 = a3;
  if (a4 && *a4 != v7)
  {
    id v8 = v7;
    [*a4 removeFromSuperview];
    objc_storeStrong(a4, a3);
    if (*a4) {
      -[PKPaymentSetupFooterView addSubview:](self, "addSubview:");
    }
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
    id v7 = v8;
  }
}

- (UILabel)notificationText
{
  notificationText = self->_notificationText;
  if (!notificationText)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v5 = self->_notificationText;
    self->_notificationText = v4;

    [(UILabel *)self->_notificationText setText:&stru_1EF1B5B50];
    [(UILabel *)self->_notificationText setNumberOfLines:0];
    [(UILabel *)self->_notificationText setLineBreakMode:0];
    v6 = self->_notificationText;
    id v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2798]);
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)self->_notificationText setTextAlignment:1];
    [(PKPaymentSetupFooterView *)self addSubview:self->_notificationText];
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
    notificationText = self->_notificationText;
  }

  return notificationText;
}

- (UIButton)skipCardButton
{
  skipCardButton = self->_skipCardButton;
  if (!skipCardButton)
  {
    v4 = PKLocalizedPaymentString(&cfstr_AddToWalletLat.isa);
    v5 = [(PKPaymentSetupFooterView *)self _alternateActionButtonWithTitle:v4];
    v6 = self->_skipCardButton;
    self->_skipCardButton = v5;

    [(PKPaymentSetupFooterView *)self addSubview:self->_skipCardButton];
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
    skipCardButton = self->_skipCardButton;
  }
  [(UIButton *)skipCardButton setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
  id v7 = self->_skipCardButton;

  return v7;
}

- (UIButton)secondaryActionButton
{
  secondaryActionButton = self->_secondaryActionButton;
  if (!secondaryActionButton)
  {
    v4 = [(PKPaymentSetupFooterView *)self _alternateActionButtonWithTitle:0];
    v5 = self->_secondaryActionButton;
    self->_secondaryActionButton = v4;

    [(PKPaymentSetupFooterView *)self addSubview:self->_secondaryActionButton];
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
    secondaryActionButton = self->_secondaryActionButton;
  }
  [(UIButton *)secondaryActionButton setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
  v6 = self->_secondaryActionButton;

  return v6;
}

- (void)setSecondaryActionButton:(id)a3
{
}

- (UIButton)tertiaryActionButton
{
  tertiaryActionButton = self->_tertiaryActionButton;
  if (!tertiaryActionButton)
  {
    v4 = [(PKPaymentSetupFooterView *)self _alternateActionButtonWithTitle:0];
    v5 = self->_tertiaryActionButton;
    self->_tertiaryActionButton = v4;

    [(PKPaymentSetupFooterView *)self addSubview:self->_tertiaryActionButton];
    [(PKPaymentSetupFooterView *)self setNeedsLayout];
    tertiaryActionButton = self->_tertiaryActionButton;
  }
  [(UIButton *)tertiaryActionButton setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
  v6 = self->_tertiaryActionButton;

  return v6;
}

- (void)setTertiaryActionButton:(id)a3
{
}

- (CGSize)_sizeForLabel:(id)a3 maxText:(id)a4 constrainedToSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  objc_super v11 = (double *)MEMORY[0x1E4F1DB30];
  if (v8 && !v9)
  {
    v10 = [v8 text];
  }
  double v12 = *v11;
  double v13 = v11[1];
  if (v8 && v10)
  {
    v14 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
    v15 = (void *)[v14 mutableCopy];

    objc_msgSend(v15, "setAlignment:", objc_msgSend(v8, "textAlignment"));
    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    v24[0] = *MEMORY[0x1E4FB06F8];
    v17 = [v8 font];
    v24[1] = *MEMORY[0x1E4FB0738];
    v25[0] = v17;
    v25[1] = v15;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v19 = (void *)[v16 initWithString:v10 attributes:v18];

    objc_msgSend(v19, "pkui_sizeThatFits:", width, height);
    double v12 = v20;
    double v13 = v21;
  }
  double v22 = v12;
  double v23 = v13;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)_adjacentButtonSizeConstrainedToSize:(CGSize)a3
{
  double height = a3.height;
  double v5 = (a3.width + -12.0) * 0.5;
  -[PKLegacyButtonInterface sizeThatFits:](self->_primaryButton, "sizeThatFits:", v5, a3.height);
  double v6 = 50.0;
  if (v7 >= 50.0)
  {
    -[PKLegacyButtonInterface sizeThatFits:](self->_primaryButton, "sizeThatFits:", v5, height);
    double v6 = v8;
  }
  setupLaterButton = self->_setupLaterButton;
  if (setupLaterButton)
  {
    -[UIButton sizeThatFits:](setupLaterButton, "sizeThatFits:", v5, height);
    if (v6 <= v10)
    {
      -[UIButton sizeThatFits:](self->_setupLaterButton, "sizeThatFits:", v5, height);
      double v6 = v11;
    }
  }
  double v12 = v5;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)_useAdjacentLayout
{
  return self->_primaryButton != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  notificationText = self->_notificationText;
  if (notificationText)
  {
    -[PKPaymentSetupFooterView _sizeForLabel:maxText:constrainedToSize:](self, "_sizeForLabel:maxText:constrainedToSize:", notificationText, 0, a3.width + -24.0, 120.0);
    double v8 = v7 + 0.0;
    double v9 = 1.0;
  }
  else
  {
    double v9 = 0.0;
    double v8 = 0.0;
  }
  skipCardButton = self->_skipCardButton;
  if (skipCardButton)
  {
    -[UIButton sizeThatFits:](skipCardButton, "sizeThatFits:", width, height);
    double v8 = v8 + v11;
    double v9 = v9 + 1.0;
  }
  manualEntryButton = self->_manualEntryButton;
  if (manualEntryButton)
  {
    -[UIButton sizeThatFits:](manualEntryButton, "sizeThatFits:", width, height);
    double v8 = v8 + v13;
    double v9 = v9 + 1.0;
  }
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton)
  {
    -[UIButton sizeThatFits:](secondaryActionButton, "sizeThatFits:", width, height);
    double v8 = v8 + v15;
    double v9 = v9 + 1.0;
  }
  tertiaryActionButton = self->_tertiaryActionButton;
  if (tertiaryActionButton)
  {
    -[UIButton sizeThatFits:](tertiaryActionButton, "sizeThatFits:", width, height);
    double v8 = v8 + v17;
    double v9 = v9 + 1.0;
  }
  if ([(PKPaymentSetupFooterView *)self _useAdjacentLayout])
  {
    -[PKPaymentSetupFooterView _adjacentButtonSizeConstrainedToSize:](self, "_adjacentButtonSizeConstrainedToSize:", width, height);
    if (v18 != 0.0) {
      double v9 = v9 + 1.0;
    }
    double v19 = -0.0;
    if (v18 != 0.0) {
      double v19 = v18;
    }
    double v8 = v8 + v19;
  }
  else
  {
    setupLaterButton = self->_setupLaterButton;
    if (setupLaterButton)
    {
      -[UIButton sizeThatFits:](setupLaterButton, "sizeThatFits:", width, height);
      double v8 = v8 + v21;
      double v9 = v9 + 1.0;
    }
  }
  if (v9 == 1.0)
  {
    double v8 = v8 + 0.0;
  }
  else if (v9 > 1.0)
  {
    double v8 = v8 + (v9 + -1.0) * 5.0 + 0.0;
  }
  double v22 = width;
  double v23 = v8;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)layoutSubviews
{
  v78.receiver = self;
  v78.super_class = (Class)PKPaymentSetupFooterView;
  [(PKPaymentSetupFooterView *)&v78 layoutSubviews];
  v3 = [(PKPaymentSetupFooterView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 1 && (PKPaymentSetupContextIsSetupAssistant() & 1) != 0)
  {
    v4 = [(PKPaymentSetupFooterView *)self readableContentGuide];
    [v4 layoutFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    [(PKPaymentSetupFooterView *)self bounds];
    double v6 = v11;
    double v8 = v12;
    double v10 = v13;
  }

  notificationText = self->_notificationText;
  BOOL v15 = notificationText != 0;
  if (notificationText)
  {
    -[PKPaymentSetupFooterView _sizeForLabel:maxText:constrainedToSize:](self, "_sizeForLabel:maxText:constrainedToSize:", self->_notificationText, 0, v8 + -24.0, v10);
    UIRectCenteredXInRect();
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    -[UILabel setFrame:](self->_notificationText, "setFrame:");
    v79.origin.y = 0.0;
    v79.origin.x = v17;
    v79.size.double width = v19;
    v79.size.double height = v21;
    double MaxY = CGRectGetMaxY(v79);
  }
  else
  {
    double MaxY = 0.0;
  }
  skipCardButton = self->_skipCardButton;
  if (skipCardButton)
  {
    -[UIButton sizeThatFits:](skipCardButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    double v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    double v30 = 0.0;
    if (notificationText) {
      double v30 = 5.0;
    }
    CGFloat v31 = v30 + MaxY;
    -[UIButton pkui_setBoundsAndPositionFromFrame:](self->_skipCardButton, "pkui_setBoundsAndPositionFromFrame:", v25, v31);
    v80.origin.x = v25;
    v80.origin.y = v31;
    v80.size.double width = v27;
    v80.size.double height = v29;
    double MaxY = CGRectGetMaxY(v80);
    BOOL v15 = 1;
  }
  manualEntryButton = self->_manualEntryButton;
  if (manualEntryButton)
  {
    -[UIButton sizeThatFits:](manualEntryButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    double v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    double v39 = 0.0;
    if (v15) {
      double v39 = 5.0;
    }
    CGFloat v40 = MaxY + v39;
    -[UIButton pkui_setBoundsAndPositionFromFrame:](self->_manualEntryButton, "pkui_setBoundsAndPositionFromFrame:", v34, v40);
    v81.origin.x = v34;
    v81.origin.y = v40;
    v81.size.double width = v36;
    v81.size.double height = v38;
    double MaxY = CGRectGetMaxY(v81);
    BOOL v15 = 1;
  }
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton)
  {
    -[UIButton sizeThatFits:](secondaryActionButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    double v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    double v48 = 0.0;
    if (v15) {
      double v48 = 5.0;
    }
    CGFloat v49 = MaxY + v48;
    -[UIButton setFrame:](self->_secondaryActionButton, "setFrame:", v43, v49);
    v82.origin.x = v43;
    v82.origin.y = v49;
    v82.size.double width = v45;
    v82.size.double height = v47;
    double MaxY = CGRectGetMaxY(v82);
    BOOL v15 = 1;
  }
  tertiaryActionButton = self->_tertiaryActionButton;
  if (tertiaryActionButton)
  {
    -[UIButton sizeThatFits:](tertiaryActionButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    double v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    double v57 = 0.0;
    if (v15) {
      double v57 = 5.0;
    }
    CGFloat v58 = MaxY + v57;
    -[UIButton setFrame:](self->_tertiaryActionButton, "setFrame:", v52, v58);
    v83.origin.x = v52;
    v83.origin.y = v58;
    v83.size.double width = v54;
    v83.size.double height = v56;
    double MaxY = CGRectGetMaxY(v83);
    BOOL v15 = 1;
  }
  if ([(PKPaymentSetupFooterView *)self _useAdjacentLayout])
  {
    -[PKPaymentSetupFooterView _adjacentButtonSizeConstrainedToSize:](self, "_adjacentButtonSizeConstrainedToSize:", v8, v10);
    double v60 = v59;
    double v62 = v61;
    double v63 = 0.0;
    if (v15) {
      double v63 = 5.0;
    }
    double v64 = MaxY + v63;
    if (self->_setupLaterButton)
    {
      double v65 = v6 + v8 - v60;
      int v66 = [(PKPaymentSetupFooterView *)self _shouldReverseLayoutDirection];
      if (v66) {
        double v67 = v6;
      }
      else {
        double v67 = v6 + v8 - v60;
      }
      if (v66) {
        double v68 = v65;
      }
      else {
        double v68 = v6;
      }
      -[UIButton pkui_setBoundsAndPositionFromFrame:](self->_setupLaterButton, "pkui_setBoundsAndPositionFromFrame:", v68, v64, v60, v62);
    }
    else
    {
      PKRectCenteredXInRect();
      double v67 = v74;
      double v64 = v75;
      double v60 = v76;
      double v62 = v77;
    }
    p_primaryButton = (id *)&self->_primaryButton;
  }
  else
  {
    p_primaryButton = (id *)&self->_setupLaterButton;
    if (!*p_primaryButton) {
      return;
    }
    objc_msgSend(*p_primaryButton, "sizeThatFits:", v8, v10);
    UIRectCenteredXInRect();
    double v67 = v70;
    double v60 = v71;
    double v62 = v72;
    double v73 = 0.0;
    if (v15) {
      double v73 = 5.0;
    }
    double v64 = MaxY + v73;
  }
  objc_msgSend(*p_primaryButton, "pkui_setBoundsAndPositionFromFrame:", v67, v64, v60, v62);
}

- (void)setButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setEnabled:](self->_setupLaterButton, "setEnabled:");
  [(UIButton *)self->_manualEntryButton setEnabled:v3];
  [(UIButton *)self->_secondaryActionButton setEnabled:v3];
  skipCardButton = self->_skipCardButton;

  [(UIButton *)skipCardButton setEnabled:v3];
}

- (void)_createSetupLaterButton
{
  if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0 || self->_forceShowSetupLaterButton)
  {
    PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [(PKPaymentSetupFooterView *)self _alternateActionButtonWithTitle:v4];
    [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
    [(PKPaymentSetupFooterView *)self setSetupLaterButton:v3];
  }
}

- (id)_alternateActionButtonWithTitle:(id)a3
{
  BOOL v3 = (NSString *)*MEMORY[0x1E4FB28C8];
  id v4 = (NSString *)*MEMORY[0x1E4FB2790];
  id v5 = a3;
  double v6 = PKFontForDefaultDesign(v3, v4);
  double v7 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_plainConfigurationWithTitle:font:", v5, v6);

  objc_msgSend(v7, "setContentInsets:", 15.0, 0.0, 15.0, 0.0);
  double v8 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v7 primaryAction:0];
  [v8 setConfiguration:v7];
  double v9 = [v8 titleLabel];
  [v9 setTextAlignment:1];

  double v10 = [v8 titleLabel];
  [v10 setFont:v6];

  [v8 setExclusiveTouch:1];
  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];

  return v8;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)forceShowSetupLaterButton
{
  return self->_forceShowSetupLaterButton;
}

- (UIButton)manualEntryButton
{
  return self->_manualEntryButton;
}

- (UIButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (PKLegacyButtonInterface)primaryButton
{
  return self->_primaryButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_manualEntryButton, 0);
  objc_storeStrong((id *)&self->_tertiaryActionButton, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_notificationText, 0);
  objc_storeStrong((id *)&self->_skipCardButton, 0);

  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end