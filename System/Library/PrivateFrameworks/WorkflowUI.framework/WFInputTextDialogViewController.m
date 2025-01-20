@interface WFInputTextDialogViewController
- (BOOL)actingAsNumberField;
- (BOOL)allowsDecimalNumbers;
- (BOOL)focusImmediatelyOnAppear;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)useNumberValidation;
- (NSDateFormatter)dateFormatter;
- (NSLayoutConstraint)contentViewHeightAnchor;
- (NSString)localizedIncompleteHintString;
- (NSString)placeholder;
- (UIButton)clearButton;
- (UILabel)hintLabel;
- (UITextField)textField;
- (UITextView)textView;
- (id)resetIdleTimerSuppressionBlock;
- (id)styledFontForTextStyle:(id)a3;
- (int64_t)initialInsertionIndex;
- (void)clearText;
- (void)finishEditing;
- (void)finishWithInputtedText;
- (void)loadView;
- (void)negateText;
- (void)setClearButton:(id)a3;
- (void)setContentViewHeightAnchor:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setFocusImmediatelyOnAppear:(BOOL)a3;
- (void)setHintLabel:(id)a3;
- (void)setInitialInsertionIndex:(int64_t)a3;
- (void)setLocalizedIncompleteHintString:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setResetIdleTimerSuppressionBlock:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextView:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateClearButtonVisibility;
- (void)updateDateFormattingHint;
- (void)updateTextViewPlaceholder;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFInputTextDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_localizedIncompleteHintString, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_hintLabel);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_clearButton);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong(&self->_resetIdleTimerSuppressionBlock, 0);
}

- (void)setContentViewHeightAnchor:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightAnchor
{
  return self->_contentViewHeightAnchor;
}

- (void)setLocalizedIncompleteHintString:(id)a3
{
}

- (NSString)localizedIncompleteHintString
{
  return self->_localizedIncompleteHintString;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setHintLabel:(id)a3
{
}

- (UILabel)hintLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hintLabel);
  return (UILabel *)WeakRetained;
}

- (void)setInitialInsertionIndex:(int64_t)a3
{
  self->_initialInsertionIndex = a3;
}

- (int64_t)initialInsertionIndex
{
  return self->_initialInsertionIndex;
}

- (void)setFocusImmediatelyOnAppear:(BOOL)a3
{
  self->_focusImmediatelyOnAppear = a3;
}

- (BOOL)focusImmediatelyOnAppear
{
  return self->_focusImmediatelyOnAppear;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setClearButton:(id)a3
{
}

- (UIButton)clearButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clearButton);
  return (UIButton *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (UITextField *)WeakRetained;
}

- (void)setResetIdleTimerSuppressionBlock:(id)a3
{
}

- (id)resetIdleTimerSuppressionBlock
{
  return self->_resetIdleTimerSuppressionBlock;
}

- (void)textViewDidChange:(id)a3
{
  v4 = [(WFInputTextDialogViewController *)self resetIdleTimerSuppressionBlock];

  if (v4)
  {
    v5 = [(WFInputTextDialogViewController *)self resetIdleTimerSuppressionBlock];
    v5[2]();
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFInputTextDialogViewController *)self initialInsertionIndex];
  if ((v5 & 0x8000000000000000) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__WFInputTextDialogViewController_textViewDidBeginEditing___block_invoke;
    block[3] = &unk_2649CBBF0;
    v8 = self;
    int64_t v9 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__WFInputTextDialogViewController_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", *(void *)(a1 + 48), 0);
  v2 = *(void **)(a1 + 40);
  return [v2 setInitialInsertionIndex:-1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  if ([v4 returnKeyType]) {
    [(WFInputTextDialogViewController *)self finishWithInputtedText];
  }
  [v4 resignFirstResponder];

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([(WFInputTextDialogViewController *)self useNumberValidation])
  {
    v11 = [(WFCompactDialogViewController *)self request];
    v12 = [v11 textFieldConfiguration];
    uint64_t v13 = [v12 allowsNegativeNumbers];

    v14 = [v9 text];
    v15 = v14;
    if (!v14) {
      v14 = &stru_26E1A5FC0;
    }
    v16 = -[__CFString stringByReplacingCharactersInRange:withString:](v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    char v17 = [MEMORY[0x263F865D8] shouldChangeText:v16 allowMinus:v13];
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)updateDateFormattingHint
{
  int64_t v5 = [(WFInputTextDialogViewController *)self dateFormatter];

  if (v5)
  {
    v6 = [(WFInputTextDialogViewController *)self textField];
    id v7 = [v6 text];

    if ([v7 length])
    {
      v8 = [MEMORY[0x263F33840] detectedDatesInString:v7 error:0];
      id v9 = [v8 firstObject];

      int v10 = [v9 timeIsSignificant];
      if (v10)
      {
        v2 = [(WFCompactDialogViewController *)self request];
        v3 = [v2 textFieldConfiguration];
        uint64_t v11 = [v3 timeFormatStyle];
      }
      else
      {
        uint64_t v11 = 0;
      }
      v12 = [(WFInputTextDialogViewController *)self dateFormatter];
      [v12 setTimeStyle:v11];

      if (v10)
      {
      }
      if (v9)
      {
        uint64_t v13 = [(WFInputTextDialogViewController *)self dateFormatter];
        v14 = [v9 date];
        id v18 = [v13 stringFromDate:v14];
      }
      else
      {
        id v18 = [(WFInputTextDialogViewController *)self localizedIncompleteHintString];
      }
    }
    else
    {
      id v18 = 0;
    }
    v15 = [(WFInputTextDialogViewController *)self hintLabel];
    [v15 setText:v18];

    if ([v18 length]) {
      double v16 = 77.0;
    }
    else {
      double v16 = 62.0;
    }
    char v17 = [(WFInputTextDialogViewController *)self contentViewHeightAnchor];
    [v17 setConstant:v16];
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v15 = a3;
  if ([(WFInputTextDialogViewController *)self useNumberValidation])
  {
    BOOL v4 = [(WFInputTextDialogViewController *)self allowsDecimalNumbers];
    int64_t v5 = (void *)MEMORY[0x263F865D8];
    uint64_t v6 = [v15 text];
    id v7 = [v5 stringBySanitizingNumberString:v6 allowDecimalNumbers:v4];

    v8 = [v15 text];
    LOBYTE(v6) = [v8 isEqualToString:v7];

    if ((v6 & 1) == 0)
    {
      id v9 = [(WFInputTextDialogViewController *)self textField];
      int v10 = [v9 beginningOfDocument];
      uint64_t v11 = [v9 endOfDocument];
      v12 = [v9 textRangeFromPosition:v10 toPosition:v11];

      [v9 replaceRange:v12 withText:v7];
    }
    [(WFInputTextDialogViewController *)self updateClearButtonVisibility];
  }
  else
  {
    [(WFInputTextDialogViewController *)self updateDateFormattingHint];
  }
  uint64_t v13 = [(WFInputTextDialogViewController *)self resetIdleTimerSuppressionBlock];

  if (v13)
  {
    v14 = [(WFInputTextDialogViewController *)self resetIdleTimerSuppressionBlock];
    v14[2]();
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  [(WFInputTextDialogViewController *)self updateClearButtonVisibility];
  int64_t v5 = [(WFInputTextDialogViewController *)self initialInsertionIndex];
  if ((v5 & 0x8000000000000000) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__WFInputTextDialogViewController_textFieldDidBeginEditing___block_invoke;
    block[3] = &unk_2649CBBF0;
    v8 = self;
    int64_t v9 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __60__WFInputTextDialogViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 beginningOfDocument];
  id v5 = [v2 positionFromPosition:v3 offset:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 32) textRangeFromPosition:v5 toPosition:v5];
  [*(id *)(a1 + 32) setSelectedTextRange:v4];

  [*(id *)(a1 + 40) setInitialInsertionIndex:-1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFInputTextDialogViewController;
  id v4 = a3;
  [(WFInputTextDialogViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  uint64_t v6 = [(WFInputTextDialogViewController *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(WFInputTextDialogViewController *)self updateTextViewPlaceholder];
  }
}

- (id)styledFontForTextStyle:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFCompactDialogViewController *)self request];
  uint64_t v6 = [v5 attribution];
  id v7 = [v6 appBundleIdentifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F85550]];

  if (v8)
  {
    uint64_t v20 = *MEMORY[0x263F81748];
    uint64_t v9 = *MEMORY[0x263F817B0];
    v17[0] = *MEMORY[0x263F817B8];
    v17[1] = v9;
    v18[0] = &unk_26E1CA438;
    v18[1] = &unk_26E1CA450;
    int v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v19 = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    v21[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    uint64_t v13 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v4];
    v14 = [v13 fontDescriptorByAddingAttributes:v12];

    id v15 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];
  }
  else
  {
    id v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:v4];
  }

  return v15;
}

- (void)updateTextViewPlaceholder
{
  v15[2] = *MEMORY[0x263EF8340];
  int v6 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
  id v7 = (void *)MEMORY[0x263F83628];
  if (!v6) {
    id v7 = (void *)MEMORY[0x263F83570];
  }
  int v8 = [(WFInputTextDialogViewController *)self styledFontForTextStyle:*v7];
  uint64_t v9 = [(WFInputTextDialogViewController *)self placeholder];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v11 = *MEMORY[0x263F81500];
    v14[0] = *MEMORY[0x263F814F0];
    v14[1] = v11;
    v15[0] = v8;
    v2 = [MEMORY[0x263F825C8] labelColor];
    v3 = [v2 colorWithAlphaComponent:0.3];
    v15[1] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v12 = (void *)[v10 initWithString:v9 attributes:v4];
  }
  else
  {
    v12 = 0;
  }
  uint64_t v13 = [(WFInputTextDialogViewController *)self textView];
  [v13 setAttributedPlaceholder:v12];

  if (v9)
  {
  }
}

- (void)updateClearButtonVisibility
{
  v3 = [(WFInputTextDialogViewController *)self clearButton];

  if (v3)
  {
    id v4 = [(WFInputTextDialogViewController *)self textField];
    id v5 = [(WFCompactDialogViewController *)self request];
    int v6 = [v5 textFieldConfiguration];
    id v7 = [v6 clearButtonMode];
    uint64_t v8 = WFClearButtonModeFromString();

    int v9 = [v4 isFirstResponder];
    id v10 = [v4 text];
    uint64_t v11 = [v10 length];

    int v12 = v9 ^ 1;
    if (v11)
    {
      BOOL v13 = v9;
    }
    else
    {
      int v12 = 0;
      BOOL v13 = 0;
    }
    if (v8 != 1) {
      BOOL v13 = v11 != 0;
    }
    if (v8 == 2) {
      int v14 = v12;
    }
    else {
      int v14 = v13;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_clearButton);
    [WeakRetained alpha];
    char v17 = v14 ^ (v16 != 1.0);

    if ((v17 & 1) == 0)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_clearButton);
      if (v14)
      {
        CGAffineTransformMakeScale(&v23, 0.8, 0.8);
        double v19 = 0.25;
      }
      else
      {
        long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v23.a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v23.c = v20;
        *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        double v19 = 0.15;
      }
      [v18 setTransform:&v23];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __62__WFInputTextDialogViewController_updateClearButtonVisibility__block_invoke;
      v21[3] = &unk_2649CBA30;
      v21[4] = self;
      char v22 = v14;
      [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v21 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v19 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    }
  }
}

void __62__WFInputTextDialogViewController_updateClearButtonVisibility__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1136));
  v3 = WeakRetained;
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  [WeakRetained setAlpha:v4];

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1136));
  if (*(unsigned char *)(a1 + 40))
  {
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v7.c = v6;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v7, 0.87, 0.87);
  }
  [v5 setTransform:&v7];
}

- (void)clearText
{
  id v5 = [(WFInputTextDialogViewController *)self textField];
  v2 = [v5 beginningOfDocument];
  v3 = [v5 endOfDocument];
  double v4 = [v5 textRangeFromPosition:v2 toPosition:v3];

  [v5 replaceRange:v4 withText:&stru_26E1A5FC0];
}

- (void)negateText
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  [v3 playInputClick];

  double v4 = (void *)MEMORY[0x263F865D8];
  id v5 = [(WFInputTextDialogViewController *)self textField];
  [v4 negateTextInput:v5];
}

- (BOOL)allowsDecimalNumbers
{
  v2 = [(WFCompactDialogViewController *)self request];
  v3 = [v2 textFieldConfiguration];
  double v4 = [v3 keyboardType];
  uint64_t v5 = WFKeyboardTypeFromString();

  return v5 == 8;
}

- (BOOL)useNumberValidation
{
  v2 = [(WFCompactDialogViewController *)self request];
  v3 = [v2 textFieldConfiguration];
  double v4 = [v3 keyboardType];
  uint64_t v5 = WFKeyboardTypeFromString();

  return v5 == 4 || v5 == 8;
}

- (BOOL)actingAsNumberField
{
  v2 = [(WFCompactDialogViewController *)self request];
  v3 = [v2 textFieldConfiguration];
  double v4 = [v3 keyboardType];
  uint64_t v5 = WFKeyboardTypeFromString();

  long long v6 = [NSNumber numberWithInteger:v5];
  LOBYTE(v3) = [&unk_26E1CA8B8 containsObject:v6];

  return (char)v3;
}

- (void)finishEditing
{
  v3 = [(WFInputTextDialogViewController *)self textField];

  if (v3) {
    [(WFInputTextDialogViewController *)self textField];
  }
  else {
  id v4 = [(WFInputTextDialogViewController *)self textView];
  }
  [v4 resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogViewController;
  [(WFInputTextDialogViewController *)&v6 viewWillAppear:a3];
  if ([(WFInputTextDialogViewController *)self focusImmediatelyOnAppear])
  {
    [(WFInputTextDialogViewController *)self setFocusImmediatelyOnAppear:0];
    dispatch_time_t v4 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__WFInputTextDialogViewController_viewWillAppear___block_invoke;
    block[3] = &unk_2649CBF20;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

void __50__WFInputTextDialogViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textField];

  v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 textField];
  }
  else {
  id v4 = [v3 textView];
  }
  [v4 becomeFirstResponder];
}

- (void)finishWithInputtedText
{
  id v3 = objc_alloc(MEMORY[0x263F85338]);
  id v7 = [(WFInputTextDialogViewController *)self textView];
  if (v7) {
    [(WFInputTextDialogViewController *)self textView];
  }
  else {
  id v4 = [(WFInputTextDialogViewController *)self textField];
  }
  uint64_t v5 = [v4 text];
  objc_super v6 = (void *)[v3 initWithInputtedText:v5 cancelled:0];
  [(WFCompactDialogViewController *)self finishWithResponse:v6];
}

- (void)loadView
{
  v188[4] = *MEMORY[0x263EF8340];
  v181.receiver = self;
  v181.super_class = (Class)WFInputTextDialogViewController;
  [(WFCompactDialogViewController *)&v181 loadView];
  v168 = [(WFCompactPlatterViewController *)self platterView];
  v171 = [(WFCompactDialogViewController *)self request];
  v2 = [v171 message];
  [v168 setSecondaryText:v2];

  [v168 setHidesContentViewTopSeparator:1];
  v175 = [v171 textFieldConfiguration];
  v150 = [v175 prefix];
  v158 = [v175 text];
  id v3 = [v175 placeholder];
  unsigned int v132 = [v175 isSecureTextEntry];
  int v131 = [v175 allowsNegativeNumbers];
  unsigned int v142 = [v175 smartQuotesDisabled];
  unsigned int v139 = [v175 smartDashesDisabled];
  id v4 = [v175 keyboardType];
  uint64_t v151 = WFKeyboardTypeFromString();

  uint64_t v5 = [v175 clearButtonMode];
  uint64_t v133 = WFClearButtonModeFromString();

  objc_super v6 = [v175 autocapitalizationType];
  uint64_t v137 = WFAutocapitalizationTypeFromString();

  id v7 = [v175 autocorrectionType];
  uint64_t v136 = WFAutocorrectionTypeFromString();

  uint64_t v8 = [v175 returnKeyType];
  uint64_t v135 = WFReturnKeyTypeFromString();

  int v9 = [v175 textContentType];
  v157 = WFTextContentTypeFromString();

  id v10 = [v175 textAlignment];
  uint64_t v146 = WFTextAlignmentFromString();

  if ([(__CFString *)v3 length])
  {
    uint64_t v11 = v3;
    goto LABEL_10;
  }
  if (v151 == 3)
  {
    int v12 = @"URL";
LABEL_8:
    WFLocalizedString(v12);
    BOOL v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (![(WFInputTextDialogViewController *)self actingAsNumberField])
  {
    int v12 = @"Text";
    goto LABEL_8;
  }
  BOOL v13 = @"0";
LABEL_9:

  uint64_t v11 = v13;
LABEL_10:
  v156 = v11;
  int v14 = (NSString *)[(__CFString *)v11 copy];
  placeholder = self->_placeholder;
  self->_placeholder = v14;

  self->_focusImmediatelyOnAppear = [v175 focusImmediatelyWhenPresented];
  self->_initialInsertionIndex = [v175 initialInsertionIndex];
  double v16 = [v175 localizedIncompleteHintString];
  char v17 = (NSString *)[v16 copy];
  localizedIncompleteHintString = self->_localizedIncompleteHintString;
  self->_localizedIncompleteHintString = v17;

  v167 = objc_opt_new();
  v173 = [v167 view];
  [v173 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v19 = [v173 layer];
  [v19 setAllowsGroupBlending:0];

  double v20 = 26.0;
  if (([v175 isMultiline] & 1) == 0)
  {
    if ([(WFInputTextDialogViewController *)self actingAsNumberField]) {
      double v20 = 26.0;
    }
    else {
      double v20 = 24.0;
    }
  }
  id v172 = objc_alloc_init(MEMORY[0x263F82E00]);
  v21 = [MEMORY[0x263F825C8] whiteColor];
  id v22 = [v21 colorWithAlphaComponent:0.07];
  uint64_t v23 = [v22 CGColor];
  v24 = [v172 layer];
  [v24 setBackgroundColor:v23];

  v25 = [v172 layer];
  [v25 setCornerRadius:v20];

  v26 = [v172 layer];
  [v26 setCornerCurve:*MEMORY[0x263F15A20]];

  v27 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
  v28 = [v172 layer];
  [v28 setCompositingFilter:v27];

  [v173 addSubview:v172];
  [v172 setTranslatesAutoresizingMaskIntoConstraints:0];
  v134 = (void *)MEMORY[0x263F08938];
  v169 = [v172 topAnchor];
  v165 = [v173 topAnchor];
  v159 = [v169 constraintEqualToAnchor:v165];
  v188[0] = v159;
  v29 = [v172 bottomAnchor];
  v30 = [v173 bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:-3.0];
  v188[1] = v31;
  v32 = [v172 leadingAnchor];
  v33 = [v173 leadingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:15.0];
  v188[2] = v34;
  v35 = [v172 trailingAnchor];
  v36 = [v173 trailingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36 constant:-15.0];
  v188[3] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v188 count:4];
  [v134 activateConstraints:v38];

  if ([v175 isMultiline])
  {
    id v39 = objc_alloc(MEMORY[0x263F82D60]);
    v40 = objc_msgSend(v39, "initWithFrame:textContainer:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v40 setText:v158];
    [v40 setDelegate:self];
    [v40 setSmartQuotesType:v142];
    [v40 setSmartDashesType:v139];
    [v40 setKeyboardType:v151];
    [v40 setKeyboardAppearance:1];
    [v40 setAutocapitalizationType:v137];
    [v40 setAutocorrectionType:v136];
    [v40 setReturnKeyType:v135];
    [v40 setTextContentType:v157];
    [v40 setTextAlignment:v146];
    int v41 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
    v42 = (void *)MEMORY[0x263F83628];
    if (!v41) {
      v42 = (void *)MEMORY[0x263F83570];
    }
    v43 = [(WFInputTextDialogViewController *)self styledFontForTextStyle:*v42];
    [v40 setFont:v43];

    [v40 setAdjustsFontForContentSizeCategory:1];
    v44 = [MEMORY[0x263F825C8] clearColor];
    [v40 setBackgroundColor:v44];

    v45 = [v40 textContainer];
    [v45 setLineFragmentPadding:0.0];

    objc_msgSend(v40, "setTextContainerInset:", 15.0, 18.0, 15.0, 18.0);
    objc_msgSend(v40, "setScrollIndicatorInsets:", 16.0, 0.0, 16.0, 0.0);
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v173 addSubview:v40];
    objc_storeWeak((id *)&self->_textView, v40);
    [(WFInputTextDialogViewController *)self updateTextViewPlaceholder];
    v140 = (void *)MEMORY[0x263F08938];
    id v170 = [v40 leadingAnchor];
    v166 = [v173 leadingAnchor];
    v160 = [v170 constraintEqualToAnchor:v166 constant:15.0];
    v187[0] = v160;
    v152 = [v40 trailingAnchor];
    v147 = [v173 trailingAnchor];
    v143 = [v152 constraintEqualToAnchor:v147 constant:-15.0];
    v187[1] = v143;
    v46 = [v40 heightAnchor];
    v47 = [v46 constraintGreaterThanOrEqualToConstant:114.0];
    v187[2] = v47;
    v48 = [v40 topAnchor];
    v49 = [v173 topAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v187[3] = v50;
    v51 = [v40 bottomAnchor];
    v52 = [v173 bottomAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:-3.0];
    v187[4] = v53;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:5];
    [v140 activateConstraints:v54];
  }
  else
  {
    v40 = objc_opt_new();
    [v40 setDelegate:self];
    [v40 setText:v158];
    [v40 setPlaceholder:v156];
    [v40 setSecureTextEntry:v132];
    [v40 setSmartQuotesType:v142];
    [v40 setSmartDashesType:v139];
    [v40 setKeyboardType:v151];
    [v40 setKeyboardAppearance:1];
    [v40 setClearButtonMode:v133];
    [v40 setAutocapitalizationType:v137];
    [v40 setAutocorrectionType:v136];
    [v40 setReturnKeyType:v135];
    [v40 setTextContentType:v157];
    [v40 setTextAlignment:v146];
    v55 = (void *)MEMORY[0x263F81708];
    int v56 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
    uint64_t v57 = *MEMORY[0x263F83628];
    if (v56) {
      uint64_t v58 = *MEMORY[0x263F83628];
    }
    else {
      uint64_t v58 = *MEMORY[0x263F83570];
    }
    v59 = [v55 preferredFontForTextStyle:v58];
    [v40 setFont:v59];

    [v40 setAdjustsFontForContentSizeCategory:1];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v40 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];
    [v173 addSubview:v40];
    objc_storeWeak((id *)&self->_textField, v40);
    if ([(WFInputTextDialogViewController *)self actingAsNumberField])
    {
      uint64_t v60 = *MEMORY[0x263F835E0];
      v61 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835E0]];
      v62 = [v61 fontDescriptorWithSymbolicTraits:2];

      id v170 = [v62 fontDescriptorWithDesign:*MEMORY[0x263F81788]];

      v63 = [MEMORY[0x263F81708] fontWithDescriptor:v170 size:0.0];
      [v40 setFont:v63];

      [v40 setAdjustsFontSizeToFitWidth:1];
      [v40 setTextAlignment:1];
      [v40 setClearButtonMode:0];
      v64 = (void *)MEMORY[0x263F81720];
      v65 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83458]];
      v166 = [v64 preferredFontDescriptorWithTextStyle:v60 compatibleWithTraitCollection:v65];

      [v166 pointSize];
      objc_msgSend(v40, "setMinimumFontSize:");
      if (v131)
      {
        if ([(WFInputTextDialogViewController *)self useNumberValidation])
        {
          v66 = [MEMORY[0x263F82670] currentDevice];
          BOOL v67 = [v66 userInterfaceIdiom] == 0;

          if (v67)
          {
            v68 = [MEMORY[0x263F82818] configurationWithWeight:7];
            v69 = [MEMORY[0x263F82818] configurationWithScale:3];
            v70 = [v68 configurationByApplyingConfiguration:v69];

            v71 = [MEMORY[0x263F824E8] buttonWithType:1];
            v72 = [MEMORY[0x263F825C8] labelColor];
            [v71 setTintColor:v72];

            objc_msgSend(v71, "setContentEdgeInsets:", 0.0, 50.0, 0.0, 50.0);
            [v71 setAdjustsImageWhenHighlighted:0];
            v73 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.forwardslash.minus" withConfiguration:v70];
            [v71 setImage:v73 forState:0];

            [v71 addTarget:self action:sel_negateText forControlEvents:64];
            v74 = objc_alloc_init(WFKeyboardToolbarAccessoryView);
            [v40 setInputAccessoryView:v74];
            v75 = [(WFKeyboardToolbarAccessoryView *)v74 flexibleSpaceItem];
            [(WFKeyboardToolbarAccessoryView *)v74 appendBarItem:v75];

            v76 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v71];
            [(WFKeyboardToolbarAccessoryView *)v74 appendBarItem:v76];

            v77 = [(WFKeyboardToolbarAccessoryView *)v74 flexibleSpaceItem];
            [(WFKeyboardToolbarAccessoryView *)v74 appendBarItem:v77];
          }
        }
      }
      if (v133)
      {
        v78 = (void *)MEMORY[0x263F827E8];
        v79 = (void *)MEMORY[0x263F82818];
        v80 = [MEMORY[0x263F81708] preferredFontForTextStyle:v57];
        v81 = [v79 configurationWithFont:v80 scale:2];
        v161 = [v78 systemImageNamed:@"xmark.circle.fill" withConfiguration:v81];

        v82 = [MEMORY[0x263F824E8] systemButtonWithImage:v161 target:self action:sel_clearText];
        v83 = [MEMORY[0x263F825C8] tertiaryLabelColor];
        [v82 setTintColor:v83];

        [v82 setTranslatesAutoresizingMaskIntoConstraints:0];
        objc_msgSend(v82, "setContentEdgeInsets:", 30.0, 0.0, 30.0, 0.0);
        [v173 addSubview:v82];
        objc_storeWeak((id *)&self->_clearButton, v82);
        [(WFInputTextDialogViewController *)self updateClearButtonVisibility];
        [v161 size];
        double v85 = v84;
        v86 = (void *)MEMORY[0x263F08938];
        v87 = [v82 centerYAnchor];
        v88 = [v173 centerYAnchor];
        v89 = [v87 constraintEqualToAnchor:v88];
        v186[0] = v89;
        v90 = [v82 trailingAnchor];
        v91 = [v173 trailingAnchor];
        v92 = [v90 constraintEqualToAnchor:v91 constant:-28.0];
        v186[1] = v92;
        v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:2];
        [v86 activateConstraints:v93];

        double v94 = v85 + 22.0 + 15.0;
      }
      else
      {
        double v94 = 15.0;
      }
      v138 = (void *)MEMORY[0x263F08938];
      v164 = [v40 leadingAnchor];
      v155 = [v173 leadingAnchor];
      v149 = [v164 constraintGreaterThanOrEqualToAnchor:v155 constant:15.0];
      v185[0] = v149;
      v145 = [v40 leadingAnchor];
      v141 = [v173 leadingAnchor];
      v117 = [v145 constraintLessThanOrEqualToAnchor:v141 constant:v94];
      v185[1] = v117;
      v118 = [v40 trailingAnchor];
      v119 = [v173 trailingAnchor];
      v120 = [v118 constraintEqualToAnchor:v119 constant:-v94];
      v185[2] = v120;
      v121 = [v40 heightAnchor];
      v122 = [v121 constraintEqualToConstant:87.0];
      v185[3] = v122;
      v123 = [v173 heightAnchor];
      v124 = [v123 constraintEqualToConstant:90.0];
      v185[4] = v124;
      v125 = [MEMORY[0x263EFF8C0] arrayWithObjects:v185 count:5];
      [v138 activateConstraints:v125];
    }
    else
    {
      [v40 _setPrefix:v150];
      if ([v175 showsDateFormattingHint])
      {
        [(WFCompactPlatterViewController *)self setPlatterHeightAnimationsDisabled:1];
        v95 = objc_opt_new();
        objc_msgSend(v95, "setDateStyle:", objc_msgSend(v175, "dateFormatStyle"));
        objc_msgSend(v95, "setTimeStyle:", objc_msgSend(v175, "timeFormatStyle"));
        objc_msgSend(v95, "setDoesRelativeDateFormatting:", objc_msgSend(v175, "doesRelativeDateFormatting"));
        [(WFInputTextDialogViewController *)self setDateFormatter:v95];
        id v170 = objc_alloc_init(MEMORY[0x263F828E0]);
        v96 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
        [v170 setFont:v96];

        [v170 setAdjustsFontForContentSizeCategory:1];
        [v170 setMaximumContentSizeCategory:*MEMORY[0x263F83440]];
        v97 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [v170 setTextColor:v97];

        [v170 setNumberOfLines:1];
        [v170 setTextAlignment:v146];
        [v170 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v170 sizeToFit];
        [v173 addSubview:v170];
        [v173 sendSubviewToBack:v170];
        [(WFInputTextDialogViewController *)self setHintLabel:v170];
      }
      else
      {
        id v170 = 0;
      }
      v98 = [v173 heightAnchor];
      v166 = [v98 constraintEqualToConstant:62.0];

      v144 = (void *)MEMORY[0x263F08938];
      v162 = [v40 leadingAnchor];
      v153 = [v173 leadingAnchor];
      v148 = [v162 constraintEqualToAnchor:v153 constant:33.0];
      v184[0] = v148;
      v99 = [v40 trailingAnchor];
      v100 = [v173 trailingAnchor];
      v101 = [v99 constraintEqualToAnchor:v100 constant:-33.0];
      v184[1] = v101;
      v102 = [v40 topAnchor];
      v103 = [v173 topAnchor];
      v104 = [v102 constraintEqualToAnchor:v103];
      v184[2] = v104;
      v105 = [v40 heightAnchor];
      v106 = [v105 constraintEqualToConstant:59.0];
      v184[3] = v106;
      v184[4] = v166;
      v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:v184 count:5];
      [v144 activateConstraints:v107];

      if (v170)
      {
        [(WFInputTextDialogViewController *)self setContentViewHeightAnchor:v166];
        v154 = (void *)MEMORY[0x263F08938];
        v163 = [v170 topAnchor];
        v108 = [v40 bottomAnchor];
        v109 = [v163 constraintEqualToAnchor:v108 constant:-10.0];
        v183[0] = v109;
        v110 = [v170 leadingAnchor];
        v111 = [v40 leadingAnchor];
        v112 = [v110 constraintEqualToAnchor:v111];
        v183[1] = v112;
        v113 = [v170 trailingAnchor];
        v114 = [v40 trailingAnchor];
        v115 = [v113 constraintEqualToAnchor:v114];
        v183[2] = v115;
        v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:v183 count:3];
        [v154 activateConstraints:v116];

        [(WFInputTextDialogViewController *)self updateDateFormattingHint];
      }
      else
      {
        id v170 = 0;
      }
    }
  }

  [(WFCompactPlatterViewController *)self setContentViewController:v167];
  objc_initWeak(&location, self);
  v126 = [v171 cancelButton];
  v178[0] = MEMORY[0x263EF8330];
  v178[1] = 3221225472;
  v178[2] = __43__WFInputTextDialogViewController_loadView__block_invoke;
  v178[3] = &unk_2649CBEF8;
  objc_copyWeak(&v179, &location);
  v127 = +[WFCompactDialogAction actionForButton:v126 handler:v178];

  v128 = [v171 doneButton];
  v176[0] = MEMORY[0x263EF8330];
  v176[1] = 3221225472;
  v176[2] = __43__WFInputTextDialogViewController_loadView__block_invoke_2;
  v176[3] = &unk_2649CBEF8;
  objc_copyWeak(&v177, &location);
  v129 = +[WFCompactDialogAction actionForButton:v128 handler:v176];

  v182[0] = v127;
  v182[1] = v129;
  v130 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:2];
  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v130];

  objc_destroyWeak(&v177);
  objc_destroyWeak(&v179);
  objc_destroyWeak(&location);
}

void __43__WFInputTextDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishEditing];
  v1 = (void *)[objc_alloc(MEMORY[0x263F85338]) initWithInputtedText:0 cancelled:1];
  [WeakRetained finishWithResponse:v1];
}

void __43__WFInputTextDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishEditing];
  [WeakRetained finishWithInputtedText];
}

@end