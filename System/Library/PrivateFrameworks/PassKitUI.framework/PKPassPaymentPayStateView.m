@interface PKPassPaymentPayStateView
- (BOOL)_canEmphasizeState:(int64_t)a3;
- (BOOL)_canPreserveGlyphForState:(int64_t)a3;
- (BOOL)accessPass;
- (BOOL)biometricsUnavailableHint;
- (BOOL)homeKeyPass;
- (BOOL)labelWillChangeForState:(int64_t)a3 withOverrideText:(id)a4;
- (BOOL)persistentEmulationHint;
- (BOOL)recognizingHint;
- (PKGlyphView)glyph;
- (PKPassPaymentPayStateView)initWithStyle:(int64_t)a3;
- (PKPassPaymentPayStateViewDelegate)delegate;
- (UILabel)debugLabel;
- (UILabel)label;
- (double)labelAlpha;
- (double)labelStateBottomInset;
- (id)_attributedTextWithTitle:(id)a3;
- (id)_attributedTextWithTitle:(id)a3 subtitle:(id)a4;
- (id)_textForState:(int64_t)a3 textOverride:(id)a4;
- (id)_titleForUserIntent;
- (int64_t)_defaultGlyphStateForState:(int64_t)a3;
- (int64_t)layoutState;
- (int64_t)state;
- (int64_t)userIntentStyle;
- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)_configureLayoutMetrics;
- (void)_resolveLayout;
- (void)_showingFailureState;
- (void)dealloc;
- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4;
- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAccessPass:(BOOL)a3;
- (void)setBiometricsUnavailableHint:(BOOL)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setHomeKeyPass:(BOOL)a3;
- (void)setLabelAlpha:(double)a3;
- (void)setLabelStateBottomInset:(double)a3;
- (void)setPersistentEmulationHint:(BOOL)a3;
- (void)setRecognizingHint:(BOOL)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 withOverrideText:(id)a5 preserveGlyphState:(BOOL)a6 completionHandler:(id)a7;
- (void)setUserIntentStyle:(int64_t)a3;
- (void)updateDebugLabel:(id)a3 isErrorState:(BOOL)a4;
@end

@implementation PKPassPaymentPayStateView

- (PKPassPaymentPayStateView)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKPassPaymentPayStateView;
  v4 = -[PKPassPaymentPayStateView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v4->_layoutState = 0;
    [(PKPassPaymentPayStateView *)v4 _configureLayoutMetrics];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F88120]) initWithStyle:0];
    glyph = v5->_glyph;
    v5->_glyph = (PKGlyphView *)v6;

    [(PKGlyphView *)v5->_glyph setShowQRCode:a3 == 3];
    [(PKGlyphView *)v5->_glyph updateRasterizationScale:PKUIScreenScale()];
    [(PKGlyphView *)v5->_glyph setDelegate:v5];
    [(PKPassPaymentPayStateView *)v5 addSubview:v5->_glyph];
    if (PKPayStateDebugUI())
    {
      v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      debugLabel = v5->_debugLabel;
      v5->_debugLabel = v8;

      [(UILabel *)v5->_debugLabel setNumberOfLines:0];
      v10 = v5->_debugLabel;
      v11 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v10 setBackgroundColor:v11];

      [(PKPassPaymentPayStateView *)v5 addSubview:v5->_debugLabel];
    }
    [(PKPassPaymentPayStateView *)v5 _applyStatePreservingGlyphState:0 overridingText:0 animated:0 completionHandler:0];
    [(PKPassPaymentPayStateView *)v5 _resolveLayout];
    [(PKPassPaymentPayStateView *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F857A8]];
  }
  return v5;
}

- (void)dealloc
{
  [(PKGlyphView *)self->_glyph setDelegate:0];
  [(PKGlyphView *)self->_glyph setState:6 animated:0 completionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentPayStateView;
  [(PKPassPaymentPayStateView *)&v3 dealloc];
}

- (void)_resolveLayout
{
  self->_didLayout = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PKPassPaymentPayStateView__resolveLayout__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  if (self->_didLayout)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained payStateViewDidUpdateLayout:self];
      }
    }
  }
}

uint64_t __43__PKPassPaymentPayStateView__resolveLayout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PKPassPaymentPayStateView;
  [(PKPassPaymentPayStateView *)&v26 layoutSubviews];
  self->_didLayout = 1;
  [(PKPassPaymentPayStateView *)self bounds];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  CGFloat v7 = CGRectGetWidth(v27) + -20.0;
  [(PKGlyphView *)self->_glyph frame];
  v28.origin.CGFloat y = self->_glyphViewPadding;
  double v8 = CGRectGetMaxY(v28) + self->_labelTopPadding;
  double v23 = v7;
  [(UILabel *)self->_label pkui_sizeThatFits:1 forceWordWrap:v7];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (self->_label)
  {
    v29.origin.CGFloat x = 0.0;
    v29.origin.CGFloat y = v8;
    v29.size.CGFloat width = v10;
    v29.size.CGFloat height = v12;
    double MaxY = CGRectGetMaxY(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGFloat v14 = CGRectGetMaxY(v30) - self->_labelStateBottomInset;
    self->_layoutState = MaxY >= v14;
    if (MaxY >= v14)
    {
      [(PKGlyphView *)self->_glyph setAlpha:0.0];
      memset(&slice, 0, sizeof(slice));
      memset(&remainder, 0, sizeof(remainder));
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      CGRectDivide(v31, &slice, &remainder, self->_labelStateBottomInset, CGRectMaxYEdge);
      label = self->_label;
      double v22 = PKUIScreenScale();
      UIRectCenteredIntegralRectScale();
      goto LABEL_6;
    }
  }
  else
  {
    self->_layoutState = 0;
  }
  [(PKGlyphView *)self->_glyph setAlpha:1.0];
  label = self->_label;
  UIRectCenteredXInRect();
LABEL_6:
  [(UILabel *)label setFrame:*(void *)&v22];
  glyph = self->_glyph;
  UIRectCenteredXInRect();
  -[PKGlyphView setFrame:](glyph, "setFrame:");
  debugLabel = self->_debugLabel;
  if (debugLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](debugLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v23, 1.79769313e308);
    double v19 = v18;
    double v21 = v20;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    -[UILabel setFrame:](self->_debugLabel, "setFrame:", 0.0, CGRectGetMaxY(v32) - v21, v19, v21);
  }
}

- (int64_t)_defaultGlyphStateForState:(int64_t)a3
{
  int64_t result = 8;
  switch(a3)
  {
    case 0:
      BOOL v5 = !self->_biometricsUnavailableHint;
      int64_t v6 = 6;
      goto LABEL_17;
    case 1:
      int IsAvailable = PKPearlIsAvailable();
      int64_t result = self->_recognizingHint;
      if (IsAvailable)
      {
        BOOL v5 = result == 0;
        int64_t v6 = 5;
LABEL_17:
        if (v5) {
          int64_t result = 0;
        }
        else {
          int64_t result = v6;
        }
      }
      break;
    case 2:
      if (self->_userIntentStyle == 1) {
        int64_t result = 6;
      }
      else {
        int64_t result = 0;
      }
      break;
    case 4:
      int64_t style = self->_style;
      int64_t v8 = 8;
      if (style == 4) {
        int64_t v8 = 9;
      }
      if (style == 3) {
        int64_t result = 7;
      }
      else {
        int64_t result = v8;
      }
      break;
    case 5:
      int64_t result = 9;
      break;
    case 7:
    case 12:
      int64_t result = 7;
      break;
    case 8:
      int64_t result = 11;
      break;
    case 9:
    case 10:
      int64_t result = 10;
      break;
    case 11:
      int64_t result = 6;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_canPreserveGlyphForState:(int64_t)a3
{
  return a3 == 1;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withOverrideText:(id)a5 preserveGlyphState:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v14 = a5;
  CGFloat v12 = (void (**)(id, void))a7;
  if (v14 || self->_state != a3)
  {
    self->_state = a3;
    [(PKPassPaymentPayStateView *)self _applyStatePreservingGlyphState:v8 overridingText:v14 animated:v9 completionHandler:v12];
  }
  else
  {
    int64_t v13 = [(PKPassPaymentPayStateView *)self _defaultGlyphStateForState:a3];
    if (v8 && [(PKPassPaymentPayStateView *)self _canPreserveGlyphForState:self->_state]
      || v13 == [(PKGlyphView *)self->_glyph state])
    {
      if (v12) {
        v12[2](v12, 0);
      }
    }
    else
    {
      if (self->_state == 9) {
        [(PKPassPaymentPayStateView *)self _showingFailureState];
      }
      [(PKGlyphView *)self->_glyph setState:v13 animated:v9 completionHandler:v12];
    }
  }
}

- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v29 = a6;
  CGFloat v10 = [(PKPassPaymentPayStateView *)self _textForState:self->_state textOverride:a4];
  label = self->_label;
  if (label)
  {
    CGFloat v12 = [(UILabel *)label attributedText];
    char v13 = PKEqualObjects();

    if (v13) {
      goto LABEL_7;
    }
    id v14 = self->_label;
    if (v14)
    {
      [(UILabel *)v14 removeFromSuperview];
      v15 = self->_label;
      self->_label = 0;
    }
  }
  if (v10)
  {
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v17 = self->_label;
    self->_label = v16;

    double v18 = self->_label;
    double v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v18 setBackgroundColor:v19];

    [(UILabel *)self->_label setAlpha:self->_labelAlpha];
    [(UILabel *)self->_label setNumberOfLines:2];
    [(UILabel *)self->_label setAttributedText:v10];
    [(UILabel *)self->_label setAccessibilityIdentifier:*MEMORY[0x1E4F857A8]];
    [(PKPassPaymentPayStateView *)self addSubview:self->_label];
    [(PKPassPaymentPayStateView *)self setNeedsLayout];
  }
LABEL_7:
  if (v8 && [(PKPassPaymentPayStateView *)self _canPreserveGlyphForState:self->_state]) {
    uint64_t v20 = [(PKGlyphView *)self->_glyph state];
  }
  else {
    uint64_t v20 = [(PKPassPaymentPayStateView *)self _defaultGlyphStateForState:self->_state];
  }
  glyph = self->_glyph;
  if ((unint64_t)(self->_state - 9) >= 2)
  {
    [(PKGlyphView *)glyph setState:v20 animated:v6 completionHandler:v29];
  }
  else
  {
    [(PKGlyphView *)glyph setColorMode:3 animated:v6];
    double v22 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:45.0];
    double v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark" withConfiguration:v22];

    if (self->_state == 9) {
      [(PKPassPaymentPayStateView *)self _showingFailureState];
    }
    [(PKGlyphView *)self->_glyph setState:v20 animated:v6 completionHandler:v29];
    if (v23)
    {
      v24 = [(PKGlyphView *)self->_glyph primaryColor];
      v25 = [v23 _flatImageWithColor:v24];

      goto LABEL_18;
    }
  }
  v25 = 0;
LABEL_18:
  objc_super v26 = self->_glyph;
  id v27 = v25;
  uint64_t v28 = [v27 CGImage];
  [v27 alignmentRectInsets];
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](v26, "setCustomImage:withAlignmentEdgeInsets:", v28);
  [(PKPassPaymentPayStateView *)self _resolveLayout];
}

- (BOOL)labelWillChangeForState:(int64_t)a3 withOverrideText:(id)a4
{
  BOOL v5 = [(PKPassPaymentPayStateView *)self _textForState:a3 textOverride:a4];
  BOOL v6 = [(UILabel *)self->_label attributedText];
  char v7 = PKEqualObjects() ^ 1;

  return v7;
}

- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4
{
  id v6 = a4;
  if (self->_state == a3)
  {
    label = self->_label;
    if (label)
    {
      id v14 = v6;
      BOOL v8 = [(UILabel *)label layer];
      BOOL v9 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_shakeAnimation");
      id v10 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v9);

      uint64_t v11 = [v14 length];
      id v6 = v14;
      if (v11)
      {
        CGFloat v12 = self->_label;
        char v13 = [(PKPassPaymentPayStateView *)self _attributedTextWithTitle:v14];
        [(UILabel *)v12 setAttributedText:v13];

        [(PKPassPaymentPayStateView *)self setNeedsLayout];
        [(PKPassPaymentPayStateView *)self _resolveLayout];
        id v6 = v14;
      }
    }
  }
}

- (void)updateDebugLabel:(id)a3 isErrorState:(BOOL)a4
{
  debugLabel = self->_debugLabel;
  if (debugLabel)
  {
    [(UILabel *)debugLabel setText:a3];
    char v7 = self->_debugLabel;
    if (a4) {
      [MEMORY[0x1E4FB1618] redColor];
    }
    else {
    BOOL v8 = [MEMORY[0x1E4FB1618] greenColor];
    }
    [(UILabel *)v7 setBackgroundColor:v8];

    [(PKPassPaymentPayStateView *)self setNeedsLayout];
  }
}

- (BOOL)_canEmphasizeState:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  if (a3 == 1) {
    return PKPearlIsAvailable() ^ 1;
  }
  return 0;
}

- (void)setLabelStateBottomInset:(double)a3
{
  if (self->_labelStateBottomInset != a3)
  {
    self->_labelStateBottomInset = a3;
    if (a3 > 0.0 || self->_layoutState == 1)
    {
      [(PKPassPaymentPayStateView *)self setNeedsLayout];
      [(PKPassPaymentPayStateView *)self _resolveLayout];
    }
  }
}

- (void)setLabelAlpha:(double)a3
{
  self->_labelAlpha = a3;
  -[UILabel setAlpha:](self->_label, "setAlpha:");
}

- (void)setBiometricsUnavailableHint:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_biometricsUnavailableHint ^ a3) & 1) == 0)
  {
    self->_biometricsUnavailableHint = a3;
    if (!self->_state)
    {
      BOOL v4 = a4;
      glyph = self->_glyph;
      int64_t v6 = [(PKPassPaymentPayStateView *)self _defaultGlyphStateForState:0];
      [(PKGlyphView *)glyph setState:v6 animated:v4 completionHandler:0];
    }
  }
}

- (void)_showingFailureState
{
  if (self->_state == 9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v4 = WeakRetained;
    if (WeakRetained)
    {
      int64_t v6 = WeakRetained;
      char v5 = objc_opt_respondsToSelector();
      BOOL v4 = v6;
      if (v5)
      {
        [v6 payStateViewRevealingFailure:self];
        BOOL v4 = v6;
      }
    }
  }
}

- (id)_textForState:(int64_t)a3 textOverride:(id)a4
{
  id v6 = a4;
  char v7 = v6;
  int64_t style = self->_style;
  if (style == 2)
  {
    BOOL v9 = 0;
    switch(a3)
    {
      case 1:
        if (PKPearlIsAvailable()) {
          goto LABEL_25;
        }
        id v10 = @"NFC_PASS_TOUCH_ID";
        goto LABEL_8;
      case 2:
        goto LABEL_9;
      case 4:
      case 5:
      case 6:
        id v10 = @"NFC_PASS_INSTRUCTION";
        goto LABEL_8;
      case 7:
      case 8:
        id v10 = @"NFC_PASS_SUCCESS";
LABEL_8:
        PKLocalizedString(&v10->isa);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 9:
        goto LABEL_10;
      case 10:
        goto LABEL_11;
      default:
        goto LABEL_19;
    }
  }
  BOOL v9 = 0;
  switch(a3)
  {
    case 1:
      if (!PKPearlIsAvailable())
      {
        if (self->_persistentEmulationHint)
        {
          uint64_t v11 = @"PAYMENT_SERVICE_MODE_TOUCH_ID";
        }
        else if (self->_accessPass)
        {
          uint64_t v11 = @"GENERIC_TOUCH_ID";
        }
        else
        {
          uint64_t v11 = @"PAYMENT_TOUCH_ID";
        }
        goto LABEL_12;
      }
LABEL_25:
      if (v7) {
        goto LABEL_34;
      }
      PKLocalizedPearlString(&cfstr_GenericPearl.isa);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
LABEL_9:
      id v12 = [(PKPassPaymentPayStateView *)self _titleForUserIntent];
      goto LABEL_13;
    case 4:
    case 5:
    case 6:
    case 7:
      if (self->_persistentEmulationHint)
      {
        uint64_t v11 = @"PAYMENT_INSTRUCTION_SERVICE_MODE";
LABEL_12:
        PKLocalizedPaymentString(&v11->isa);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (style == 3)
      {
        if (a3 != 5) {
          goto LABEL_18;
        }
        PKLocalizedAquamanString(&cfstr_BarcodePayment_9.isa);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!self->_homeKeyPass)
        {
          if (v6)
          {
LABEL_34:
            id v13 = v7;
            goto LABEL_14;
          }
          uint64_t v11 = @"GENERIC_INSTRUCTION";
          goto LABEL_12;
        }
        PKLocalizedHomeKeyString(&cfstr_NfcPassInstruc.isa);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_13:
      id v13 = v12;
      if (v12)
      {
LABEL_14:
        BOOL v9 = [(PKPassPaymentPayStateView *)self _attributedTextWithTitle:v13];

        goto LABEL_19;
      }
LABEL_18:
      BOOL v9 = 0;
LABEL_19:

      return v9;
    case 8:
      if (v6) {
        goto LABEL_34;
      }
      uint64_t v11 = @"PAYMENT_SUCCESS";
      goto LABEL_12;
    case 9:
LABEL_10:
      id v12 = v6;
      goto LABEL_13;
    case 10:
LABEL_11:
      uint64_t v11 = @"PAYMENT_ERROR_NO_TOUCH_ID_OR_PASSCODE";
      goto LABEL_12;
    default:
      goto LABEL_19;
  }
}

- (id)_titleForUserIntent
{
  int64_t userIntentStyle = self->_userIntentStyle;
  if (userIntentStyle == 2)
  {
    objc_super v3 = @"ACCESSIBILITY_PUSH_BUTTON_ASSISTIVE_TOUCH";
    goto LABEL_5;
  }
  if (userIntentStyle == 3)
  {
    objc_super v3 = @"ACCESSIBILITY_PUSH_BUTTON_SWITCH_CONTROL";
LABEL_5:
    BOOL v4 = PKLocalizedPearlString(&v3->isa);
    goto LABEL_7;
  }
  BOOL v4 = 0;
LABEL_7:

  return v4;
}

- (id)_attributedTextWithTitle:(id)a3
{
  return [(PKPassPaymentPayStateView *)self _attributedTextWithTitle:a3 subtitle:0];
}

- (id)_attributedTextWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v8 = (void *)*MEMORY[0x1E4FB2788];
  BOOL v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2788], 20.0));
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  uint64_t v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  id v12 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB06C0]];

  id v13 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v13 setLineBreakMode:4];
  [v13 setAlignment:1];
  id v14 = (void *)[v13 copy];
  [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB0738]];

  id v15 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (v5)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];
    [v15 appendAttributedString:v16];
  }
  if (v6)
  {
    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v8, 16.0));
    [v7 setObject:v17 forKeyedSubscript:v10];

    if (v5)
    {
      double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v7];
      [v15 appendAttributedString:v18];
    }
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v7];
    [v15 appendAttributedString:v19];
  }
  uint64_t v20 = (void *)[v15 copy];

  return v20;
}

- (void)_configureLayoutMetrics
{
  switch(self->_style)
  {
    case 0:
    case 4:
      uint64_t v3 = PKUIGetMinScreenWidthType();
      double v4 = 34.0;
      if (!v3) {
        double v4 = 22.0;
      }
      double v5 = 15.0;
      goto LABEL_10;
    case 1:
    case 3:
      unint64_t v6 = PKUIGetMinScreenType();
      if (v6 >= 0xD) {
        return;
      }
      id v7 = (double *)&unk_1A0444C20;
      break;
    case 2:
      unint64_t v6 = PKUIGetMinScreenType();
      if (v6 >= 0xD) {
        return;
      }
      id v7 = (double *)&unk_1A0444C88;
      break;
    default:
      return;
  }
  double v4 = v7[v6];
  double v5 = dbl_1A0444CF0[v6];
LABEL_10:
  self->_glyphViewPadding = v4;
  self->_labelTopPadding = v5;
}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v9 = WeakRetained;
    char v8 = objc_opt_respondsToSelector();
    id v7 = v9;
    if (v8)
    {
      [v9 payStateView:self revealingCheckmark:v4];
      id v7 = v9;
    }
  }
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)layoutState
{
  return self->_layoutState;
}

- (PKGlyphView)glyph
{
  return self->_glyph;
}

- (UILabel)label
{
  return self->_label;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (double)labelStateBottomInset
{
  return self->_labelStateBottomInset;
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (BOOL)biometricsUnavailableHint
{
  return self->_biometricsUnavailableHint;
}

- (BOOL)recognizingHint
{
  return self->_recognizingHint;
}

- (void)setRecognizingHint:(BOOL)a3
{
  self->_recognizingHint = a3;
}

- (int64_t)userIntentStyle
{
  return self->_userIntentStyle;
}

- (void)setUserIntentStyle:(int64_t)a3
{
  self->_int64_t userIntentStyle = a3;
}

- (BOOL)persistentEmulationHint
{
  return self->_persistentEmulationHint;
}

- (void)setPersistentEmulationHint:(BOOL)a3
{
  self->_persistentEmulationHint = a3;
}

- (BOOL)accessPass
{
  return self->_accessPass;
}

- (void)setAccessPass:(BOOL)a3
{
  self->_accessPass = a3;
}

- (BOOL)homeKeyPass
{
  return self->_homeKeyPass;
}

- (void)setHomeKeyPass:(BOOL)a3
{
  self->_homeKeyPass = a3;
}

- (PKPassPaymentPayStateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassPaymentPayStateViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_glyph, 0);
}

@end